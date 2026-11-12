---
id: abdeac8f-12c5-46bd-8df6-5677cb5541e8
topic: thoi-tiet-va-thien-tai
slug: lu-lut-va-han-han
order: 4
stage: apply
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Floods and droughts
vi: Lũ lụt và hạn hán
> Giữ đúng tên ở `syllabus-lessons.md` và `content/syllabus.json` (`new-weather`, bài số bốn).

## Mục tiêu
en: I can say how floods and droughts are different.
vi: Em nói được lũ lụt và hạn hán khác nhau thế nào.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-038, ngày 11/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids` sau bài một và bài ba (câu w1 trỏ bài ba, câu w3 trỏ bài một).
> Bài vận dụng (`apply`, bài áp chót): bé dùng điều đã học (mưa từ mây, mùa mưa bão) để phân biệt lũ lụt với hạn hán, dự đoán chỗ ngập trước (câu q4) và lập luận "lũ có thể đến khi trời nắng" (câu q6).
> Bài sửa `flood_only_where_it_rains` (misconception chính của chủ đề) ở ý chính ba, ô "Mưa ở nơi xa", câu q4 và câu q6 (gắn key, Na nói đúng). `drought_is_one_hot_day` sửa ở ý chính hai, ô "Hạn hán" và câu q2, không gắn key.

## Ý chính
1.en: In a flood, water covers land that is usually dry.
1.vi: Khi có lũ lụt, nước tràn ngập những nơi thường ngày khô ráo.
2.en: A drought is a long time with too little rain.
2.vi: Hạn hán là khi trời mưa quá ít trong một thời gian dài.
3.en: Rain far away can make a river flood here.
3.vi: Mưa ở nơi xa cũng có thể làm sông ở đây dâng lũ.
> [CẦN KIỂM] như `flood_only_where_it_rains` và `drought_is_one_hot_day` ở `_topic.md`.
> Ba ý đi từ hai hiện tượng nhìn thấy được (nước ngập, đất khô nứt), tới điều phải lập luận (nước mưa ở nơi xa theo sông chảy về).

## Khởi động

> Ba câu, đúng bảng Khởi động ở `_topic.md`.
> - w1 ôn bài ba (khoảng một ngày trước): bão đến từ biển. Dạng điền từ.
> - w2 ôn bài một *Bề mặt Trái Đất* (khoảng một tháng trước): dòng sông, nơi lũ bắt đầu ở bài này. Gợi ý đủ để bé chưa học chủ đề đó vẫn làm được.
> - w3 ôn bài một (ba, bốn ngày trước): mưa là nước rơi từ mây; giải thích khi đúng bắc cầu sang "mưa nhiều thì sông đầy nước".

### w1
id: 3bb982df-bb8e-48a5-befa-b966639e547d
format: fill_blank_bank
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-thien-tai/mua-mua-bao
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `explore_forecast` ở bài `thoi-tiet-va-thien-tai/mua-mua-bao`.
image.alt.en: A weather forecast on TV
image.alt.vi: Bản tin dự báo thời tiết trên ti vi
sentence.en: Many storms come from the {1}.
sentence.vi: Nhiều cơn bão kéo tới từ {1}.
answers: w1_sea
hint.en: Remember the Storm season card.
hint.vi: Em nhớ lại ô Mùa mưa bão nhé.
explanation_correct.en: Yes! Storms start over the warm sea.
explanation_correct.vi: Đúng rồi! Bão hình thành trên vùng biển ấm.
explanation_wrong.en: The answer is the sea. Storms start there.
explanation_wrong.vi: Đáp án là biển. Bão hình thành trên biển.
> Hình câu hỏi là ti vi dự báo, không dùng ảnh cơn bão trên biển (ảnh đó cho thấy biển, lộ đáp án). Ba thẻ là ba ảnh nơi chốn của phần Chơi bài *Đất và nước trên Trái Đất*, cùng số ít, cùng ảnh chụp. Thẻ đúng ở chỗ thứ nhất.
> Rà chữ tester 11/11 (N8): bỏ thẻ "city" · "thành phố" (ảnh thành phố mù bụi của *Hô hấp*, `alt` "Thành phố mù bụi" đưa ý khói bụi vào bài; `_topic.md` đã hẹn không nhắc). Thẻ "mountains" đổi thành "mountain" cho cùng số ít với hai thẻ kia. Lệch đề xuất một chỗ: tester đề xuất thẻ "lake" (hồ nước); ảnh hồ đã là lựa chọn sai ở câu w2 ("Which one is a river?"), dùng thêm ở đây thành hai câu trong một bài chung một hình cùng vai (`_topic.md`, Quy ước hình mục bảy). Nên thẻ thứ ba là "forest" · "rừng" (ảnh khu rừng cùng phần Chơi đó).

#### bank w1_sea
label.en: sea
label.vi: biển
image.brief: Dùng lại hình `tray_sea` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): sea horizon fishing boat
image.alt.en: The wide blue sea
image.alt.vi: Biển xanh rộng

#### bank w1_mountain
label.en: mountain
label.vi: núi
image.brief: Dùng lại hình `tray_mountain` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): mountain green clouds peak
image.alt.en: A green mountain
image.alt.vi: Ngọn núi xanh

#### bank w1_forest
label.en: forest
label.vi: rừng
image.brief: Dùng lại hình `tray_forest` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): forest green canopy aerial
image.alt.en: A green forest
image.alt.vi: Khu rừng xanh

### w2
id: f620a0b3-0350-4070-a814-a34ee871bf09
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/dat-va-nuoc-tren-trai-dat
prompt.en: Which one is a river?
prompt.vi: Hình nào là dòng sông?
image.brief: Dùng lại hình `explore_cloudy` ở bài `thoi-tiet-va-thien-tai/nang-mua-gio-may`. Từ khoá tìm ảnh (EN): cloudy sky grey white clouds countryside
image.alt.en: White and grey clouds over the fields
image.alt.vi: Mây trắng và mây xám trên cánh đồng
hint.en: Remember the Water card in the Earth lessons.
hint.vi: Em nhớ lại ô Phần nước ở bài Đất và nước trên Trái Đất nhé.
explanation_correct.en: Yes! A river flows a long way across the land.
explanation_correct.vi: Đúng rồi! Dòng sông chảy dài qua đồng ruộng, làng mạc.
explanation_wrong.en: The answer is the river. Its water flows.
explanation_wrong.vi: Đáp án là dòng sông. Nước sông chảy thành dòng.
> Ba ảnh là ba món của phần Chơi bài một *Bề mặt Trái Đất* (nhóm "Sông và suối", "Hồ và ao"). Hồ và ao có sức hút vì cũng là nơi có nước. Đáp án ở chỗ thứ ba.

#### option w2_lake
correct: false
label.en: lake
label.vi: hồ nước
image.brief: Dùng lại hình `tray_lake` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): lake calm trees shore
image.alt.en: A calm lake with trees
image.alt.vi: Hồ nước có hàng cây

#### option w2_pond
correct: false
label.en: pond
label.vi: cái ao
image.brief: Dùng lại hình `tray_pond` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): pond village lotus leaves
image.alt.en: A small pond with lotus leaves
image.alt.vi: Cái ao nhỏ có lá sen

#### option w2_river
correct: true
label.en: river
label.vi: dòng sông
image.brief: Dùng lại hình `tray_river` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): river boat countryside Vietnam
image.alt.en: A river with a small boat
image.alt.vi: Dòng sông có con đò nhỏ

### w3
id: 33e203aa-c1fe-47ab-957b-a17f87a676fe
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-thien-tai/nang-mua-gio-may
prompt.en: Rain is water that falls from clouds.
prompt.vi: Mưa là nước rơi xuống từ những đám mây.
image.brief: Dùng lại hình `q1_rain` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi
answer: true
hint.en: Remember the Rainy card in the first lesson.
hint.vi: Em nhớ lại ô Trời mưa ở bài đầu tiên nhé.
explanation_correct.en: Yes! And lots of rain fills the rivers.
explanation_correct.vi: Đúng rồi! Mưa nhiều thì sông đầy nước.
explanation_wrong.en: This is true. Rain falls from the clouds.
explanation_wrong.vi: Câu này đúng. Mưa rơi xuống từ những đám mây.
> Câu giữ đúng chữ câu của ô "Trời mưa" bài một. Hình câu hỏi là mưa đang rơi, không thấy mây. Giải thích khi đúng bắc cầu sang ô "Lũ lụt".

## Học

> Bốn ô:
> - Lũ lụt (ý chính một) và Hạn hán (ý chính hai): hai ảnh thật, một cảnh quá nhiều nước, một cảnh quá ít nước;
> - Mưa ở nơi xa (ý chính ba): mưa trên núi chảy xuống suối, ra sông, đi rất xa; ô không nói "nơi lũ về có khi trời vẫn nắng" (để câu q6 là việc vận dụng), không nói "chỗ trũng ngập trước" (để câu q4 là việc vận dụng);
> - Hai mùa: mùa mưa có thể gây lũ, mùa khô có thể gây hạn; nhiều nhà trữ nước cho ngày hạn (chuẩn bị phần Chơi).
>
> Ảnh lũ lụt không có người, nhà cửa nguyên vẹn (`_topic.md`, Quy ước hình mục bốn). Tranh "Mưa ở nơi xa" là phong cảnh, không phải bản đồ.

### explore
id: 7fa362f3-d01d-410d-82de-456ba0f8589d
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_flood
label.en: Flood
label.vi: Lũ lụt
color: cham
sentence.en: In a flood, water covers land that is usually dry.
sentence.vi: Khi có lũ lụt, nước tràn ngập những nơi thường ngày khô ráo.
image.brief: [hình vẽ] Một cánh đồng và con đường làng bị ngập nước đục màu nâu sau mưa lớn, nhìn từ xa; hàng cây và cọc rào đứng trong nước, mấy ngôi nhà ở xa vẫn nguyên vẹn; trời xám; không có người, không có xe bị cuốn, không có nhà đổ, không có con vật, không có chữ. Câu q1, phần trái của ô "Hai mùa" và từ flood dùng lại hình này. Từ khoá tìm ảnh (EN): flooded field road village brown water
> Theo hình designer 11/11: không có ảnh lũ hợp lệ (ảnh lũ Việt Nam trên Commons có biển chữ, hoặc là ảnh một trận bão có người gặp nạn), nên vẽ; vì vậy cả ba lựa chọn câu q1 cũng là hình vẽ.
image.alt.en: A field and a road under brown water
image.alt.vi: Cánh đồng và con đường ngập nước đục
examples.1.en: after days of heavy rain
examples.1.vi: sau nhiều ngày mưa to
examples.2.en: a river gets too full
examples.2.vi: sông đầy nước, tràn qua bờ
examples.3.en: roads and fields under water
examples.3.vi: đường sá, ruộng đồng ngập nước
examples.4.en: the water is brown and muddy
examples.4.vi: nước lũ đục ngầu
> Ví dụ bốn chuẩn bị ô "Nước lũ" của bài năm (nước lũ bẩn).

#### group explore_drought
label.en: Drought
label.vi: Hạn hán
color: vang_hoe
sentence.en: A drought is a long time with too little rain.
sentence.vi: Hạn hán là khi trời mưa quá ít trong một thời gian dài.
image.brief: Dùng lại hình `q2` ở bài `be-mat-trai-dat/dong-dat-va-song-than`. Từ khoá tìm ảnh (EN): mud cracked dry ground
image.alt.en: Dry ground cracked into pieces
image.alt.vi: Mặt đất khô nứt thành nhiều mảng
examples.1.en: weeks or months with little rain
examples.1.vi: nhiều tuần, nhiều tháng ít mưa
examples.2.en: ponds and rivers get low
examples.2.vi: ao hồ, sông suối cạn nước
examples.3.en: the ground dries and cracks
examples.3.vi: đất khô, nứt nẻ
examples.4.en: plants and crops dry up
examples.4.vi: cây trồng khô héo
> Ví dụ một sửa `drought_is_one_hot_day` (một thời gian dài, không phải một ngày). Ảnh đất nứt nẻ là hình câu q2 của bài *Động đất và sóng thần* (ở đó dùng để gợi "vỡ thành nhiều mảng"); ở đây đúng nghĩa đất khô hạn.
> [CẦN KIỂM] Hạn hán làm sông, hồ cạn, cây trồng thiếu nước; ở đồng bằng sông Cửu Long mùa khô còn có nước mặn lấn vào sông (chưa đưa vào chữ cho trẻ).

#### group explore_far_rain
label.en: Rain far away
label.vi: Mưa ở nơi xa
color: gi_dong
sentence.en: Rain in the mountains runs down rivers to other places.
sentence.vi: Mưa trên núi chảy theo sông về những nơi khác.
image.brief: [hình vẽ] Tranh phong cảnh nhìn xa: bên trái là dãy núi có mây đen và mưa xám, nước từ núi chảy thành mấy dòng suối, nhập vào một con sông lớn uốn khúc chảy ra xa về phía đồng bằng ở mép phải; không phải bản đồ, không có tên nơi chốn, không có đường biên giới, không có mũi tên, không có chữ; không có người, không có nhà gần sông. Câu q4 vẽ cùng nét.
image.alt.en: Rain on the mountains runs into a river
image.alt.vi: Mưa trên núi chảy xuống sông
examples.1.en: rain falls on hills and mountains
examples.1.vi: mưa rơi trên đồi núi
examples.2.en: water runs into streams and rivers
examples.2.vi: nước chảy xuống suối, ra sông
examples.3.en: the river carries it a long way
examples.3.vi: sông mang nước đi rất xa
examples.4.en: the river rises and spreads out
examples.4.vi: nước sông dâng lên, tràn ra hai bên
> [CẦN KIỂM] như `flood_only_where_it_rains` ở `_topic.md`.
> Tranh chỉ vẽ phía núi đang mưa và dòng sông chảy đi, không vẽ làng nắng ở cuối sông: câu q6 để bé tự suy ra "ở đây trời nắng mà sông vẫn có thể dâng lũ" (rút kinh nghiệm SK-036 N2).

#### group explore_seasons
label.en: Two seasons
label.vi: Hai mùa
color: do_son
sentence.en: Rainy seasons can bring floods. Dry seasons can bring droughts.
sentence.vi: Mùa mưa có thể gây lũ lụt. Mùa khô có thể gây hạn hán.
image.brief: [sơ đồ ghép ảnh] Hai nửa ghép cạnh nhau theo một đường thẳng đứng: bên trái là hình vẽ cánh đồng ngập nước `explore_flood`, bên phải là hình vẽ ruộng khô nứt nẻ `tray_cracked`; cắt hai hình cho cùng chiều cao; không có chữ, không có mũi tên, không có nhãn mùa.
> Theo hình designer 11/11: nửa phải đổi từ ảnh đất nứt của *Động đất và sóng thần* sang hình vẽ ruộng nứt nẻ của kệ Chơi, để hai nửa cùng là hình vẽ (ô Lũ lụt nay là hình vẽ). Alt giữ.
image.alt.en: A flooded field next to a dry field
image.alt.vi: Ruộng ngập nước bên cạnh đất khô nứt nẻ
examples.1.en: too much water in the rainy season
examples.1.vi: mùa mưa, có khi quá nhiều nước
examples.2.en: too little water in the dry season
examples.2.vi: mùa khô, có khi quá ít nước
examples.3.en: one place can have both in a year
examples.3.vi: một nơi có thể gặp cả hai trong một năm
examples.4.en: families store water for dry days
examples.4.vi: nhiều nhà trữ nước cho những ngày hạn
> [CẦN KIỂM] Ví dụ ba: nhiều vùng ở Việt Nam (miền Trung, đồng bằng sông Cửu Long) có thể gặp lũ vào mùa mưa và hạn vào mùa khô.
> Ví dụ bốn chuẩn bị nhóm "Trữ nước" ở phần Chơi (chum hứng nước mưa, bồn chứa nước).

### new_words
id: c22a37d2-2536-4865-8f82-37da10b6d6eb
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: flood, drought, rise

## Chơi

> Bé tìm một cảnh lũ lụt, một cảnh hạn hán và một cách trữ nước. Đạt khi đủ ba nhóm và không chọn việc làm phí nước. Chạm hình đã chọn để bỏ ra.
> Ba món bẫy đều là việc với nước, gần nhóm "Trữ nước" nhưng làm phí nước: vòi nước để chảy mãi, ống nước bị rò, xịt nước ra đường. Lời nhắn `has_limited` nói đúng lý do cho cả ba và nối với hạn hán.
> Cả kệ là hình vẽ (`_topic.md`, Quy ước hình mục hai): bồn chứa nước và ống nước thật hay có nhãn hiệu, cảnh lũ có người. Vì vậy ruộng ngập nước và ruộng khô nứt nẻ trên kệ là hình vẽ riêng, khác ảnh ở ô Học.

### tray
id: d7e5c03a-88d1-4b68-949c-84cc4a422957
type: build_tray
version: 1
prompt.en: Too much or too little water?
prompt.vi: Quá nhiều hay quá ít nước?
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a flood and a drought. Then find a way to save water.
messages.start.vi: Em tìm một cảnh lũ lụt và một cảnh hạn hán. Rồi tìm một cách trữ nước nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You can spot too much and too little water.
messages.balanced.vi: Tuyệt! Em đã nhận ra khi nào quá nhiều, khi nào quá ít nước.
messages.has_limited.en: That wastes water. Keep it for dry days.
messages.has_limited.vi: Làm vậy phí nước. Mình giữ nước cho những ngày hạn nhé.
messages.missing.tray_flood.en: You still need a flood.
messages.missing.tray_flood.vi: Em còn thiếu một cảnh lũ lụt.
messages.missing.tray_drought.en: You still need a drought.
messages.missing.tray_drought.vi: Em còn thiếu một cảnh hạn hán.
messages.missing.tray_store.en: You still need a way to save water.
messages.missing.tray_store.vi: Em còn thiếu một cách trữ nước.

#### group tray_flood
label.en: Flood
label.vi: Lũ lụt
color: cham
role: required

#### group tray_drought
label.en: Drought
label.vi: Hạn hán
color: vang_hoe
role: required

#### group tray_store
label.en: Saving water
label.vi: Trữ nước
color: gi_dong
role: required

#### group tray_waste
label.en: Not saving water
label.vi: Không giữ nước
color: do_son
role: limit
> Nhãn `limit` dạng "Not …" · "Không …", gọi tên loại, không gọi tên món bẫy. Dòng điều kiện sẽ là "Cần đủ Lũ lụt, Hạn hán, Trữ nước · Không giữ nước".

#### item tray_fields
label.en: Fields under water
label.vi: Ruộng ngập nước
group: tray_flood
image.brief: [hình vẽ] Những thửa ruộng ngập nước đục màu nâu, chỉ còn thấy ngọn lúa và bờ ruộng lấp ló, hàng cây ở xa, trời xám; không có người, không có nhà đổ, không có chữ.
image.alt.en: Rice fields under brown water
image.alt.vi: Ruộng lúa ngập nước đục

#### item tray_tap
label.en: A tap left running
label.vi: Vòi nước để chảy mãi
group: tray_waste
image.brief: [hình vẽ] Một vòi nước ngoài sân đang mở, nước chảy tràn qua chậu đầy xuống nền gạch, không có ai ở gần; không có người, không có tay, không có chữ, không có nhãn hiệu.
image.alt.en: A tap running over a full bowl
image.alt.vi: Vòi nước chảy tràn qua chậu đầy

#### item tray_cracked
label.en: A cracked field
label.vi: Ruộng khô nứt nẻ
group: tray_drought
image.brief: [hình vẽ] Một thửa ruộng khô nứt nẻ dưới nắng, vài gốc rạ khô, bờ ruộng trơ đất; không có người, không có con vật, không có chữ. Lựa chọn q1_cracked và nửa phải ô "Hai mùa" dùng lại hình này.
image.alt.en: A dry, cracked rice field
image.alt.vi: Thửa ruộng khô nứt nẻ

#### item tray_jar
label.en: A jar to catch rain
label.vi: Chum hứng nước mưa
group: tray_store
image.brief: [hình vẽ] Một cái chum sành to đặt dưới máng nước của mái ngói, nước mưa từ máng chảy vào chum; không có người, không có chữ. Từ store dùng lại hình này.
image.alt.en: A clay jar catching rain from a roof
image.alt.vi: Chum sành hứng nước mưa từ mái nhà

#### item tray_river_over
label.en: A river over its banks
label.vi: Sông tràn bờ
group: tray_flood
image.brief: [hình vẽ] Một con sông nước nâu dâng cao tràn qua bờ, ngập bãi cỏ và hàng cây ven sông; không có nhà gần bờ, không có người, không có thuyền, không có chữ. Từ rise dùng lại hình này.
image.alt.en: A brown river spilling over its banks
image.alt.vi: Dòng sông nước nâu tràn qua bờ

#### item tray_leak
label.en: A leaking pipe
label.vi: Ống nước bị rò
group: tray_waste
image.brief: [hình vẽ] Một đoạn ống nước dưới bồn rửa bị rò, nước nhỏ giọt thành vũng trên nền nhà; không có người, không có chữ, không có nhãn hiệu.
image.alt.en: A pipe dripping water on the floor
image.alt.vi: Ống nước nhỏ giọt xuống nền nhà

#### item tray_dry_pond
label.en: A dried-up pond
label.vi: Ao cạn khô
group: tray_drought
image.brief: [hình vẽ] Một cái ao làng cạn trơ đáy bùn khô, chỉ còn một vũng nước nhỏ ở giữa, bờ ao cỏ úa; không có cá chết, không có người, không có chữ. Câu q2 dùng lại hình này làm hình câu hỏi.
image.alt.en: A pond with almost no water
image.alt.vi: Cái ao gần cạn hết nước

#### item tray_hose
label.en: Hosing the road
label.vi: Xịt nước ra đường
group: tray_waste
image.brief: [hình vẽ] Một ống tưới nước nằm trên mặt đường trước cổng nhà, nước phun thành tia chảy ra đường; không có người, không có tay, không có chữ.
image.alt.en: A hose spraying water on a road
image.alt.vi: Ống tưới xịt nước ra đường

#### item tray_tank
label.en: A water tank
label.vi: Bồn chứa nước
group: tray_store
image.brief: [hình vẽ] Một bồn chứa nước bằng inox đặt trên mái một ngôi nhà, vẽ từ dưới nhìn lên, trời xanh; không có nhãn hiệu, không có chữ, không có người.
image.alt.en: A water tank on a roof
image.alt.vi: Bồn chứa nước trên mái nhà

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q4), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q5, q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình.
> Vai của hình: ảnh lũ lụt ở ô Học chỉ đúng (câu q1); ảnh đất khô nứt nẻ ở ô Học chỉ sai (câu q1, vì câu hỏi tìm cảnh lũ), không là lựa chọn đúng ở câu nào; các câu về hạn hán (q3) dùng hình vẽ mới. Không hai câu nào dùng chung một hình lựa chọn.

### q1
id: 64f39b3b-22b2-4214-9c49-9f198275e837
format: single_choice
version: 1
dok: 1
prompt.en: Which picture shows a flood?
prompt.vi: Hình nào cho thấy có lũ lụt?
image.brief: Dùng lại hình `tray_river` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): river boat countryside Vietnam
image.alt.en: A river with a small boat
image.alt.vi: Dòng sông có con đò nhỏ
hint.en: Look for water on land that is usually dry.
hint.vi: Em tìm chỗ nước tràn lên nơi thường ngày khô ráo nhé.
explanation_correct.en: Yes! Water covers the field and the road.
explanation_correct.vi: Đúng rồi! Nước tràn ngập cánh đồng và con đường.
explanation_wrong.en: The answer is the flooded field. Water covers dry land.
explanation_wrong.vi: Đáp án là ruộng ngập nước. Nước tràn lên chỗ thường ngày khô ráo.
> Câu nhớ lại ý chính một. Ba hình vẽ cùng một kiểu: một cánh đồng ở ba trạng thái (ngập nước, khô nứt, lúa xanh bình thường). Hình ngập nước là hình ô Học, hình ruộng nứt là món của kệ Chơi, hình lúa xanh là hình vẽ của *Hô hấp*, nên đáp án không là hình duy nhất bé đã thấy. Đáp án ở chỗ thứ hai.
> Theo hình designer 11/11: ô Lũ lụt là hình vẽ, nên hai lựa chọn sai đổi sang hình vẽ cho cùng loại (trước: ảnh đất nứt của *Động đất và sóng thần*, ảnh ruộng lúa của *Khủng long*).
> Hình câu hỏi là dòng sông lúc bình thường (vật liên quan, không phải đáp án).

#### option q1_cracked
correct: false
label.en: a cracked field
label.vi: ruộng khô nứt nẻ
image.brief: Dùng lại hình `tray_cracked`.
image.alt.en: A dry, cracked rice field
image.alt.vi: Thửa ruộng khô nứt nẻ

#### option q1_flooded
correct: true
label.en: a flooded field
label.vi: ruộng ngập nước
image.brief: Dùng lại hình `explore_flood`. Từ khoá tìm ảnh (EN): flooded field road village brown water
image.alt.en: A field and a road under brown water
image.alt.vi: Cánh đồng và con đường ngập nước đục

#### option q1_green
correct: false
label.en: a green field
label.vi: ruộng lúa xanh
image.brief: Dùng lại hình `tray_rice` ở bài `ho-hap/giu-phoi-khoe`.
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh
> Ruộng lúa xanh lúc bình thường: lúa đang xanh, không thấy nước ngập.

### q2
id: a60492ec-94bc-4a70-843e-7339aa2bd573
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `tray_dry_pond`.
image.alt.en: A pond with almost no water
image.alt.vi: Cái ao gần cạn hết nước
sentence.en: A drought is a long time with too little {1}.
sentence.vi: Hạn hán là khi có quá ít {1} trong một thời gian dài.
answers: q2_rain
hint.en: Remember the Drought card.
hint.vi: Em nhớ lại ô Hạn hán nhé.
explanation_correct.en: Yes! Little rain for a long time makes a drought.
explanation_correct.vi: Đúng rồi! Ít mưa trong một thời gian dài thì có hạn hán.
explanation_wrong.en: The answer is rain. Too little rain makes a drought.
explanation_wrong.vi: Đáp án là mưa. Quá ít mưa thì có hạn hán.
> Câu nhớ lại ý chính hai. Thẻ "nắng" nối với `drought_is_one_hot_day` (bé nghĩ hạn hán là do nắng). Ba thẻ là ba ảnh thời tiết của bài một (gió, nắng, mưa). Thẻ đúng ở chỗ thứ ba.

#### bank q2_wind
label.en: wind
label.vi: gió
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa

#### bank q2_sun
label.en: sunshine
label.vi: nắng
image.brief: Dùng lại hình `q3_sun` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời

#### bank q2_rain
label.en: rain
label.vi: mưa
image.brief: Dùng lại hình `q1_rain` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi
> Câu w3 dùng ảnh này làm hình câu hỏi (không phải lựa chọn), nên ảnh không mang vai nào khác trong bài.

### q3
id: 477ba184-1af7-4634-b385-6673bf228d70
format: multi_choice
version: 1
dok: 2
prompt.en: There is a drought. What can happen?
prompt.vi: Đang có hạn hán. Điều gì có thể xảy ra?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `q3_sun` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời
hint.en: Think what too little rain does.
hint.vi: Em nghĩ xem mưa quá ít thì sẽ ra sao nhé.
explanation_correct.en: Yes! Wells run dry and fields turn brown.
explanation_correct.vi: Đúng rồi! Giếng cạn nước và đồng cỏ úa vàng.
explanation_wrong.en: The answers are the dry well and the brown fields.
explanation_wrong.vi: Đáp án là giếng cạn nước và đồng cỏ úa vàng.
> DOK 2: phân loại bốn cảnh mới (không có ở Học hay Chơi) thành cảnh hạn hán và cảnh lũ. Hai lựa chọn sai là cảnh quá nhiều nước, có sức hút với bé chưa tách được hai hiện tượng. Bốn nhãn cùng dạng "danh từ số nhiều + động từ". Đáp án ở chỗ thứ ba và thứ tư.
> Rà chữ tester 11/11 (n8): hai đáp án cũ "rivers get low", "crops dry up" gần như chép ví dụ ô Hạn hán, gợi ý cũ còn trỏ thẳng các ví dụ đó, nên câu chỉ là nhớ lại. Nay hai đáp án là hai cảnh hạn hán ô Học chưa nói (giếng cạn, đồng cỏ úa), gợi ý chỉ cách nghĩ; câu giữ `dok: 2` và thứ tự câu.
> [CẦN KIỂM] Hạn hán làm giếng cạn nước, cỏ úa vàng.

#### option q3_streets
correct: false
label.en: streets fill with water
label.vi: đường phố ngập nước
image.brief: [hình vẽ] Một đoạn phố ngập nước đục tới bậc thềm các ngôi nhà, nhà cửa nguyên vẹn, cửa đóng; không có người, không có xe, không có biển hiệu, không có chữ.
image.alt.en: A street under water
image.alt.vi: Đường phố ngập nước

#### option q3_ponds
correct: false
label.en: ponds overflow
label.vi: ao tràn nước
image.brief: [hình vẽ] Một cái ao làng đầy nước tràn qua bờ, ngập lối đi quanh ao, trời xám vừa tạnh mưa; không có người, không có chữ.
image.alt.en: A pond spilling over
image.alt.vi: Cái ao tràn nước qua bờ

#### option q3_wells
correct: true
label.en: wells run dry
label.vi: giếng cạn nước
image.brief: [hình vẽ] Một cái giếng làng xây gạch tròn, nhìn chéo từ trên xuống thấy lòng giếng gần cạn, chỉ còn chút nước ở đáy, gầu và dây để bên thành giếng, trời nắng; không có người, không có chữ.
image.alt.en: A well with almost no water
image.alt.vi: Cái giếng gần cạn nước

#### option q3_fields
correct: true
label.en: fields turn brown
label.vi: đồng cỏ úa vàng
image.brief: [hình vẽ] Một đồng cỏ rộng khô úa vàng nâu dưới nắng, cây bụi lơ thơ, không có vết nứt trên đất (khác hình ruộng khô nứt nẻ của phần Chơi); không có người, không có con vật, không có chữ.
image.alt.en: Brown, dry grassy fields
image.alt.vi: Đồng cỏ khô úa vàng
> Bốn hình vẽ cùng nét, cùng cỡ cảnh vừa.

### q4
id: 81e57e47-987a-42d0-b36b-3e66d5fc24cf
format: single_choice
version: 1
dok: 2
prompt.en: Heavy rain falls in the hills. Which place floods first?
prompt.vi: Mưa to trên đồi núi. Chỗ nào bị ngập trước?
image.brief: [hình vẽ] Phong cảnh vẽ nghiêng, cùng nét tranh ô "Mưa ở nơi xa": đồi núi bên trái có mây đen và mưa, một con sông chảy từ núi xuống đồng bằng; bên sông có một thửa ruộng trũng, một con đường đắp cao chạy song song, và một ngọn đồi nhỏ; chưa có nước ngập; không có người, không có nhà, không có chữ, không có mũi tên. Ba lựa chọn là ba bản của hình này.
image.alt.en: Hills, a river, a low field and a high road
image.alt.vi: Đồi núi, dòng sông, ruộng trũng và đường đắp cao
hint.en: Look where the river water will go first.
hint.vi: Em nhìn xem nước sông sẽ tràn tới đâu trước nhé.
explanation_correct.en: Yes! Water runs down and fills low places first.
explanation_correct.vi: Đúng rồi! Nước chảy xuống và làm ngập chỗ trũng trước.
explanation_wrong.en: The answer is the low field by the river.
explanation_wrong.vi: Đáp án là ruộng trũng ven sông.
> DOK 2: dự đoán từ ý chính ba (nước mưa chảy từ núi xuống theo sông) và hiểu biết đời sống (nước chảy chỗ trũng). Ô Học không nói "chỗ trũng ngập trước".
> Rà chữ tester 11/11 (N1): gợi ý cũ "Water always runs down to lower places." · "Nước luôn chảy xuống chỗ thấp hơn." vừa nói nguyên tắc vừa dùng chữ "low/lower" của nhãn đáp án. Gợi ý mới (đề xuất của tester) đưa bé nhìn vào hình, không nói "thấp". Nhãn gọi tên chỗ, không gọi vị trí trong hình; ba bản hình đánh dấu một chỗ bằng vầng sáng vàng nhạt. Đáp án ở chỗ thứ nhất.
> [CẦN KIỂM] Chỗ trũng ven sông thường ngập trước khi sông dâng.

#### option q4_low
correct: true
label.en: the low field
label.vi: ruộng trũng ven sông
image.brief: [hình vẽ] Cùng hình câu q4; thửa ruộng trũng ven sông được đánh dấu bằng một vầng sáng vàng nhạt, hai chỗ kia giữ màu thường; không có chữ, không có mũi tên.
image.alt.en: The landscape, with the low field marked
image.alt.vi: Phong cảnh, đánh dấu ruộng trũng ven sông

#### option q4_road
correct: false
label.en: the high road
label.vi: con đường đắp cao
image.brief: [hình vẽ] Cùng hình câu q4; con đường đắp cao được đánh dấu bằng một vầng sáng vàng nhạt, hai chỗ kia giữ màu thường; không có chữ, không có mũi tên.
image.alt.en: The landscape, with the high road marked
image.alt.vi: Phong cảnh, đánh dấu con đường đắp cao

#### option q4_hill
correct: false
label.en: the hilltop
label.vi: đỉnh đồi
image.brief: [hình vẽ] Cùng hình câu q4; đỉnh ngọn đồi nhỏ được đánh dấu bằng một vầng sáng vàng nhạt, hai chỗ kia giữ màu thường; không có chữ, không có mũi tên.
image.alt.en: The landscape, with the hilltop marked
image.alt.vi: Phong cảnh, đánh dấu đỉnh đồi

### q5
id: efc0a824-0fb3-49bd-9853-e218af0e9462
format: true_false
version: 1
dok: 2
prompt.en: A lake full of water is a flood.
prompt.vi: Hồ đầy nước là đang có lũ lụt.
image.brief: Dùng lại hình `tray_lake` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): lake calm trees shore
image.alt.en: A calm lake with trees
image.alt.vi: Hồ nước có hàng cây
answer: false
hint.en: Is the land under a lake usually dry?
hint.vi: Chỗ hồ nước thường ngày có khô ráo không?
explanation_correct.en: A lake always has water. A flood covers dry land.
explanation_correct.vi: Hồ lúc nào cũng có nước. Lũ lụt là khi nước tràn lên chỗ khô ráo.
explanation_wrong.en: This is false. A full lake is just a lake.
explanation_wrong.vi: Câu này sai. Hồ đầy nước vẫn chỉ là cái hồ.
> DOK 2: áp dụng định nghĩa ở ý chính một ("nơi thường ngày khô ráo") vào một trường hợp dễ nhầm. Câu khẳng định, đáp án Sai. Câu w2 dùng ảnh hồ này làm lựa chọn sai ("không phải dòng sông"), một ý khác, không trái nhau.
> Giải thích khi đúng không mở đầu bằng "Yes!" (đáp án Sai).

### q6
id: f3bd63c4-4c52-416b-b487-48c75cd2a048
format: true_false
version: 1
dok: 3
misconception: flood_only_where_it_rains
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
image.brief: [hình vẽ] Một con sông chảy qua làng dưới trời nắng xanh, nước sông màu nâu đục, dâng gần tới mép bờ; bến sông có mấy bậc đá; không thấy núi, không thấy mây đen hay mưa; nhà cửa nguyên vẹn, không có người, không có chữ. Câu w2 bài năm dùng lại hình này.
image.alt.en: A brown river on a sunny day
image.alt.vi: Dòng sông nước nâu ngày nắng
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: It is sunny here. But the river can still flood.
statement.vi: Ở đây trời nắng. Nhưng sông vẫn có thể dâng lũ.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
hint.en: Remember the Rain far away card.
hint.vi: Em nhớ lại ô Mưa ở nơi xa nhé.
explanation_correct.en: Yes! Rain in the mountains can flow down here.
explanation_correct.vi: Đúng rồi! Mưa trên núi có thể theo sông chảy về đây.
explanation_wrong.en: Na is right. Rain far away can flood this river.
explanation_wrong.vi: Na nói đúng. Mưa ở nơi xa có thể làm sông này dâng lũ.
> Lời Na, hình và đáp án Đúng đúng như `_topic.md` (mục "Câu sáu, lời Na" và bảng Đáp án Đúng/Sai). Đây cũng là câu "Em nghĩ sao?" của bài một.
> DOK 3: bé hoà giải hai điều nghe như ngược nhau (trời nắng, sông vẫn có thể dâng lũ). Bé còn nghĩ "lũ chỉ đến khi mưa tại chỗ" sẽ chọn "Na chưa đúng". Ô "Mưa ở nơi xa" chỉ cho thấy mưa trên núi chảy theo sông đi xa; bé phải tự nối tới một nơi đang nắng.
> Hình câu hỏi không vẽ núi hay mây đen (bằng chứng của gợi ý), chỉ vẽ dòng sông nước nâu ở nơi trời nắng.
> [CẦN KIỂM] như `flood_only_where_it_rains` ở `_topic.md`.

## Từ vựng

### flood
id: f13b9be2-41a2-47db-88ab-c708fb058adb
tier: core
term.en: flood
term.vi: lũ lụt
example.en: After days of rain, the river flooded the fields.
example.vi: Sau nhiều ngày mưa, nước sông tràn ngập ruộng đồng.
image.brief: Dùng lại hình `explore_flood`. Từ khoá tìm ảnh (EN): flooded field road village brown water
image.alt.en: A field and a road under brown water
image.alt.vi: Cánh đồng và con đường ngập nước đục

### drought
id: 874df7a2-c9d1-46f5-83a7-1118b9d5df57
tier: core
term.en: drought
term.vi: hạn hán
example.en: In a drought, ponds and rivers get low.
example.vi: Khi có hạn hán, ao hồ và sông suối cạn nước.
image.brief: Dùng lại hình `q2` ở bài `be-mat-trai-dat/dong-dat-va-song-than`. Từ khoá tìm ảnh (EN): mud cracked dry ground
image.alt.en: Dry ground cracked into pieces
image.alt.vi: Mặt đất khô nứt thành nhiều mảng
> Nghe thử giọng EN đọc "drought".

### rise
id: e2320486-31c4-4a94-b32a-dfad82f62f15
tier: core
term.en: rise
term.vi: dâng lên
example.en: The river rises after heavy rain.
example.vi: Sau mưa to, nước sông dâng lên.
image.brief: Dùng lại hình `tray_river_over`.
image.alt.en: A brown river spilling over its banks
image.alt.vi: Dòng sông nước nâu tràn qua bờ

### crop
id: c36e1aa9-8cf4-4f4d-8e29-cd720df1c15c
tier: extra
term.en: crop
term.vi: cây trồng
example.en: Farmers need rain for their crops.
example.vi: Nhà nông cần mưa cho cây trồng.
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

### store
id: 0ca0ac54-430c-4648-a559-734218a3d8d5
tier: extra
term.en: store
term.vi: trữ, cất giữ
example.en: We store rainwater in a big jar.
example.vi: Nhà em trữ nước mưa trong chum to.
image.brief: Dùng lại hình `tray_jar`.
image.alt.en: A clay jar catching rain from a roof
image.alt.vi: Chum sành hứng nước mưa từ mái nhà
> `term.vi` có dấu phẩy: nhờ nghe thử giọng VI. "Store" ở đây là động từ (trữ), không phải cửa hàng; câu ví dụ và hình làm rõ nghĩa.

## Thưởng

### floating_season
id: 8d9ba54c-a35e-4a3a-971b-250123b887bb
set: weather
rarity: common
name.en: Floating season
name.vi: Mùa nước nổi
tag.en: Floods
tag.vi: Lũ lụt
fact.en: Each year, Mekong floods bring fish and rich mud. Farmers wait for them.
fact.vi: Mỗi năm, mùa nước nổi ở đồng bằng sông Cửu Long mang về cá tôm và phù sa. Nhà nông mong mùa nước về.
> [CẦN KIỂM] Mùa nước nổi (khoảng tháng tám tới tháng mười một) ở đồng bằng sông Cửu Long là lũ hằng năm, mang phù sa bồi đắp ruộng đồng và nhiều cá, tôm; lũ quá lớn vẫn gây hại. Chuyên môn xác nhận cách nói "nhà nông mong mùa nước về". Thẻ cho bé thấy lũ không chỉ có hại; "phù sa" để dành *Đá và đất* bài mười hai, ở đây chỉ nhắc một lần.
image.brief: [hình vẽ] Cánh đồng ngập nước mênh mông mùa nước nổi ở đồng bằng sông Cửu Long, hai hàng cây xanh nhô lên khỏi mặt nước, một chiếc xuồng nhỏ ở rất xa; không có người, trời trong; không có nhà ngập, không có chữ. Từ khoá tìm ảnh (EN): Mekong Delta flooded fields boat
> Theo hình designer 11/11: ảnh mùa nước nổi hợp giấy phép chỉ có ảnh vệ tinh thấy đất liền (gần như bản đồ) hoặc ảnh có người, nên vẽ.
image.alt.en: Flooded fields in the Mekong Delta
image.alt.vi: Cánh đồng mùa nước nổi ở đồng bằng sông Cửu Long

## Ghi chú cho hoạ sĩ

- **Loại hình (theo hình designer làm 11/11):** câu w1, w2, q2, q5 và ô Hạn hán là ảnh chụp (dùng lại của chủ đề khác); ô Lũ lụt, ô Mưa ở nơi xa, kệ Chơi, câu q1, q3, q4, q6 và thẻ thưởng là hình tự vẽ (`_topic.md`, Quy ước hình mục hai). Ô "Hai mùa" là hình ghép từ hai hình vẽ. Từ `crop` và `drought` giữ ảnh chụp (không nằm trong câu nào phải toàn hình vẽ).
- **Ảnh nguồn mới:** không có. Hai ảnh brief cần tìm (lũ không người, mùa nước nổi) đều không có ảnh hợp lệ, nên vẽ.
- **Hình tự vẽ (hai mươi mốt):**
  - Học (hai): cánh đồng và đường làng ngập nước đục (`explore_flood`); tranh phong cảnh mưa trên núi chảy xuống sông (`explore_far_rain`).
  - Thưởng (một): cánh đồng mùa nước nổi, hai hàng cây nhô lên, xuồng nhỏ ở xa.
  - Chơi (chín): ruộng ngập nước; vòi nước chảy tràn chậu; ruộng khô nứt nẻ; chum hứng nước mưa dưới máng mái ngói; sông tràn bờ; ống nước rò dưới bồn rửa; ao cạn; ống tưới xịt nước ra đường; bồn nước inox trên mái.
  - Quiz (chín): phố ngập nước, ao tràn nước, giếng gần cạn, đồng cỏ úa vàng (q3; hai hình sau thay sông cạn và luống ngô theo rà chữ tester 11/11, n8); phong cảnh đồi núi, sông, ruộng trũng, đường đắp cao, đồi nhỏ, và ba bản đánh dấu một chỗ (q4, bốn hình); dòng sông nước nâu ngày nắng (q6).
- **Hình ghép (một):** `explore_seasons`, ghép `explore_flood` (trái) với `tray_cracked` (phải), hai nửa đều là hình vẽ.
- **Dùng lại:** từ *Bề mặt Trái Đất* `dong-dat-va-song-than/q2` (ô Hạn hán, từ `drought`), `dat-va-nuoc-tren-trai-dat/tray_sea`, `tray_mountain`, `tray_forest`, `tray_lake`, `tray_pond`, `tray_river` (w1, w2, hình câu q1, q5), `nui-lua/q1_rain`, `q3_sun` (w3, q2, q3); từ *Hô hấp* `vi-sao-ta-phai-tho/w1` (q2), `giu-phoi-khoe/tray_rice` (q1_green, hình vẽ); từ *Khủng long* `trai-dat-rat-lau-ve-truoc/q2_rice` (từ `crop`); từ bài một `explore_cloudy` (w2); từ bài ba `explore_forecast` (w1). Trong bài: `explore_flood` (q1, từ `flood`, ô Hai mùa), `tray_cracked` (q1_cracked, ô Hai mùa), `tray_dry_pond` (q2), `tray_river_over` (từ `rise`), `tray_jar` (từ `store`).
- **Bài khác dùng lại hình của bài này:** bài năm câu w2 (`q6`). Câu w1 bài năm nay ôn bài hai (rà chữ tester 11/11, n10), không còn dùng `tray_tap`, `tray_jar`, `tray_leak`.
- **Không gây sợ** (`_topic.md`, Quy ước hình mục bốn): cảnh lũ không có người lội nước, không có nhà đổ, xe trôi, con vật chết; cảnh hạn không có cá chết, con vật gầy; nhà cửa nguyên vẹn.
- **Tranh không phải bản đồ:** `explore_far_rain` và câu q4 là phong cảnh vẽ nghiêng, không có tên nơi chốn, không có đường biên giới.
- **Các lựa chọn trong một câu cùng khung, cùng kiểu:** w1 ba ảnh nơi chốn của cùng phần Chơi *Đất và nước trên Trái Đất* (biển, núi, rừng); w2 ba ảnh nơi có nước; q1 ba hình vẽ một cánh đồng ở ba trạng thái; q2 ba ảnh thời tiết; q3 bốn hình vẽ cảnh cùng cỡ; q4 ba bản của cùng một hình.
- **Màu:** Học: lũ lụt `cham`, hạn hán `vang_hoe`, mưa ở nơi xa `gi_dong`, hai mùa `do_son`. Chơi: lũ lụt `cham`, hạn hán `vang_hoe`, trữ nước `gi_dong`, nhóm "Không giữ nước" `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: flood, drought, rise).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, chín món.
  - Khởi động: `fill_blank_bank` (w1, `recall_from.lesson: thoi-tiet-va-thien-tai/mua-mua-bao`), `single_choice` (w2, `recall_from.lesson: be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`, đã có id), `true_false` (w3 Đúng, `recall_from.lesson: thoi-tiet-va-thien-tai/nang-mua-gio-may`). DOK một.
  - Quiz: `single_choice` (q1; q4 ba bản của một hình vẽ), `fill_blank_bank` (q2, ba thẻ có hình), `multi_choice` (q3, bốn lựa chọn, hai đúng), `true_false` (q5 Sai; q6 Đúng, `speaker: na`).
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3.
  - Câu có `misconception`: q6, key `flood_only_where_it_rains`.
- **Tham chiếu:** chạy `ids` cho bài một, bài ba trước bài này.
- **Vị trí đáp án đúng:** w1 thẻ thứ nhất; w2 thứ ba; q1 thứ hai; q2 thẻ thứ ba; q3 thứ ba và thứ tư; q4 thứ nhất.
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Ruộng ngập nước, Ruộng khô nứt nẻ, Chum hứng nước mưa → `balanced`;
  - Vòi nước để chảy mãi → `has_limited`;
  - Ruộng ngập nước, Sông tràn bờ, Bồn chứa nước (thiếu hạn hán) → `missing.tray_drought`;
  - rồi chạm Ao cạn khô → `full`; bỏ Sông tràn bờ, đặt Ao cạn khô → `balanced`.
- **Nhãn dài:** "A river over its banks", "Vòi nước để chảy mãi" (món Chơi), "đường phố ngập nước", "streets fill with water" (q3), "con đường đắp cao" (q4). Nhờ tester xem trên iPhone bề rộng nhỏ nhất.
- **Câu q4:** như câu q4 bài hai, ba bản của một hình, đánh dấu bằng vầng sáng; nhãn gọi tên chỗ. Nhờ tester xem ba bản đủ khác nhau trên iPhone.
- **Số từ EN trên một màn:** Học khoảng ba mươi tư (mục tiêu 9, hướng dẫn 3, bốn nhãn 7, câu dài nhất 10, ô Từ mới 5), như các chủ đề trước. Nhiều chữ nhất ở Quiz là q3 (khoảng ba mươi: câu hỏi 7, hướng dẫn 5, bốn nhãn 12, giải thích 8 đến 10) và q4 (khoảng hai mươi lăm).
- **Từ EN có thể ngoài Starters/Movers:** từ mới flood, drought, rise, crop, store; covers, usually, mountains, streams, spreads, seasons, tap, leaking, pipe, hosing, tank, banks, overflow, wells, Mekong, farmers, mud.
- **Giọng đọc:** EN "drought", "Mekong"; VI `term.vi` có dấu phẩy ở `store`. Chuỗi VI không có chữ số, ký hiệu, dấu "—".
- **Asset:** không có audio, `asset` trong markdown.
