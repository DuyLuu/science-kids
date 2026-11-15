---
id: 09e29d9b-d674-4bd6-bdf5-931a49fd24f2
topic: da-va-dat
slug: the-nao-la-dat-tot
order: 13
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Healthy soil
vi: Thế nào là đất tốt?
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số mười ba).

## Mục tiêu
en: I can say what keeps soil healthy for plants.
vi: Em kể được điều gì giúp đất tốt cho cây.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn C), chưa duyệt.** Ticket SK-039, ngày 11/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids` sau bài 12 (câu w1, w2 trỏ bài 12) và sau bài hai của *Thời tiết* (câu w3).
> Oak lesson 13 (`healthy-soil-non-statutory-climate-change-and-sustainability`, nhãn biến đổi khí hậu và phát triển bền vững). Bài sửa `weather_is_climate` ở ô "One day or many years" và câu q6 (gắn key, Na nói đúng).
> Nói nhẹ phần khí hậu: không doạ, không con số nhiệt độ, không nói nguyên nhân (để dành *Năng lượng và biến đổi khí hậu*). Lũ, hạn chỉ nhắc ở một ô, không dạy lại (*Thời tiết* bài bốn). Con vật Oak nêu (con bét, bọ đuôi bật) quá nhỏ, thay bằng giun đất và kiến.

## Ý chính
1.en: Healthy soil holds water, air and nutrients for plants.
1.vi: Đất tốt giữ nước, không khí và chất dinh dưỡng cho cây.
2.en: Earthworms mix the soil and help dead leaves rot.
2.vi: Giun đất xới trộn đất và giúp lá rụng mau mục.
3.en: Climate change can make soil too wet or too dry.
3.vi: Khí hậu thay đổi có thể làm đất quá ướt hoặc quá khô.
> [CẦN KIỂM] Giun đất trộn đất, đào đường cho không khí và nước, giúp lá mục nhanh; khí hậu đang thay đổi làm có nơi mưa nhiều hơn, có nơi khô hơn.
> Ba ý đi từ điều nhìn thấy ở luống rau (đất tốt), tới con vật nhỏ trong đất, tới điều bé phải nghĩ qua nhiều năm (khí hậu).

## Khởi động

> Ba câu, đúng bảng Khởi động ở `_topic.md`. Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.
> - w1 ôn bài 12 (một ngày trước), bốn lựa chọn: nơi nào có đất phù sa.
> - w2 ôn bài 12: đất nào cũng giống nhau (Sai).
> - w3 (tuỳ chọn) ôn *Thời tiết và thiên tai* bài hai (khoảng hai tuần trước): ống đo mưa. Câu bắc cầu sang ô "One day or many years" (đo thời tiết nhiều năm thì biết khí hậu).

### w1
id: 15f59f2c-830a-4782-9375-c06fcdffcbf5
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/cac-loai-dat-o-viet-nam
prompt.en: Where do you find alluvial soil?
prompt.vi: Ở đâu có đất phù sa?
image.brief: Dùng lại hình `alluvial_soil` ở bài `da-va-dat/cac-loai-dat-o-viet-nam`. Từ khoá tìm ảnh (EN): alluvial soil field close up Mekong Delta
image.alt.en: Soft grey-brown soil in a field
image.alt.vi: Đất nâu xám mềm trên ruộng
hint.en: Remember the Alluvial soil picture in the last lesson.
hint.vi: Em nhớ lại ô Đất phù sa ở bài trước nhé.
explanation_correct.en: Vietnam grows much of its rice on alluvial soil.
explanation_correct.vi: Việt Nam trồng nhiều lúa trên đất phù sa.
explanation_wrong.en: Rivers bring silt to delta rice fields.
explanation_wrong.vi: Sông mang bùn mịn về bồi cho ruộng lúa đồng bằng.
> Ý, thứ tự lựa chọn và vị trí đáp án (chỗ thứ tư, bốn lựa chọn) đúng bảng Khởi động. Hình câu hỏi là đất phù sa chụp gần (thứ được hỏi), không phải nơi chốn của đáp án.
> Bốn lựa chọn đều là ảnh cảnh chụp rộng bé đã gặp (ba ảnh ở bài 12, mỏ đá ở bài 1), nên đáp án không là ảnh duy nhất bé đã thấy. Mỏ đá có sức hút (nơi người ta đào đất đá); đồi cà phê, rừng phi lao là nơi của hai loại đất kia.

#### option w1_coffee
correct: false
feedback.en: Coffee hills have red soil from old volcanoes.
feedback.vi: Đồi cà phê có đất đỏ từ núi lửa xưa.
label.en: a coffee hill
label.vi: đồi cà phê
image.brief: Dùng lại hình `tray_coffee` ở bài `da-va-dat/cac-loai-dat-o-viet-nam`. Từ khoá tìm ảnh (EN): coffee plantation red soil rows
image.alt.en: Rows of coffee plants on a hill
image.alt.vi: Những hàng cà phê trên đồi

#### option w1_casuarina
correct: false
feedback.en: Casuarina forests grow on sandy soil by the sea.
feedback.vi: Rừng phi lao mọc trên đất cát ven biển.
label.en: a casuarina forest
label.vi: rừng phi lao trên cát
image.brief: Dùng lại hình `tray_casuarina` ở bài `da-va-dat/cac-loai-dat-o-viet-nam`. Từ khoá tìm ảnh (EN): casuarina trees sand coast Vietnam
image.alt.en: Casuarina trees growing on sand
image.alt.vi: Rừng phi lao mọc trên cát

#### option w1_quarry
correct: false
feedback.en: A quarry is where people dig out rock.
feedback.vi: Mỏ đá là nơi người ta đào lấy đá.
label.en: a quarry
label.vi: mỏ đá
image.brief: Dùng lại hình `quarry` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): open pit stone quarry terraces
image.alt.en: An open quarry
image.alt.vi: Mỏ đá lộ thiên

#### option w1_rice
correct: true
label.en: a delta rice field
label.vi: ruộng lúa đồng bằng
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

### w2
id: 29c97b8b-def6-49ef-a984-25166a54b726
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/cac-loai-dat-o-viet-nam
prompt.en: All soils are the same.
prompt.vi: Đất nào cũng giống nhau.
image.brief: Dùng lại hình `soil` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): hand holding garden soil
image.alt.en: Garden soil in a hand
image.alt.vi: Nắm đất vườn trong lòng bàn tay
answer: false
hint.en: Remember the last lesson about soils in Vietnam.
hint.vi: Em nhớ lại bài Các loại đất ở Việt Nam nhé.
explanation_correct.en: Each kind of soil suits different plants.
explanation_correct.vi: Mỗi loại đất hợp với những loại cây khác nhau.
explanation_wrong.en: Red, sandy and alluvial soils are different.
explanation_wrong.vi: Đất đỏ, đất cát và đất phù sa khác nhau.
feedback_true.en: Red soil and sandy soil look very different.
feedback_true.vi: Đất đỏ và đất cát trông rất khác nhau.
> Câu `true_false` dùng đúng chữ EN ở bảng Khởi động và bảng Đúng/Sai (bài 13 w2, Sai). Giải thích khi đúng không mở đầu bằng "Yes!". Hình câu hỏi là một nắm đất (không đặt hai loại đất cạnh nhau, để hình không là bằng chứng).
> Gợi ý gọi tên bài, không gọi "ba loại đất" (nói vậy là nói luôn đáp án).

### w3
id: 3a1b9b85-0603-41f3-b7af-28268ddf28f0
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-thien-tai/do-thoi-tiet
prompt.en: Which tool measures how much rain falls?
prompt.vi: Dụng cụ nào đo xem mưa rơi nhiều hay ít?
image.brief: Dùng lại hình `q1_rain` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi
hint.en: Remember the lesson Measuring the weather.
hint.vi: Em nhớ lại bài Đo thời tiết nhé.
explanation_correct.en: Read the water level in the gauge each day.
explanation_correct.vi: Mỗi ngày em đọc mực nước trong ống đo mưa.
explanation_wrong.en: A rain gauge catches rain to show how much fell.
explanation_wrong.vi: Ống đo mưa hứng nước để biết mưa nhiều hay ít.
> **Câu tuỳ chọn** (bảng Khởi động ở `_topic.md`): điều kiện đã đủ, bài `thoi-tiet-va-thien-tai/do-thoi-tiet` đã có id (kiểm 11/11, sau khi soạn xong). Nếu sau này bài đó bị bỏ hay đổi slug thì xoá cả khối w3 (bảng vị trí giữ nguyên các ô khác).
> Ôn ý chính hai của *Thời tiết* bài hai ("A rain gauge measures how much rain falls."). Ba lựa chọn là ba hình vẽ ô Học của bài đó, cùng nét; đáp án ở chỗ thứ hai như bảng. Không dùng ảnh đất nứt nẻ hay ruộng ngập (món bẫy kệ Chơi bài này).
> Hình câu hỏi là ảnh mưa to (tình huống), khác loại với ba hình lựa chọn; luật "cùng loại hình" áp cho các lựa chọn với nhau.

#### option w3_thermometer
correct: false
feedback.en: A thermometer measures how hot or cold it is.
feedback.vi: Nhiệt kế đo trời nóng hay lạnh.
label.en: a thermometer
label.vi: nhiệt kế
image.brief: Dùng lại hình `explore_thermometer` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`.
image.alt.en: A thermometer in the shade
image.alt.vi: Nhiệt kế treo trong bóng râm

#### option w3_rain_gauge
correct: true
label.en: a rain gauge
label.vi: ống đo mưa
image.brief: Dùng lại hình `explore_rain_gauge` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`.
image.alt.en: A rain gauge in an open garden
image.alt.vi: Ống đo mưa giữa khoảng vườn trống

#### option w3_windsock
correct: false
feedback.en: A windsock shows which way the wind blows.
feedback.vi: Ống gió cho biết gió thổi về hướng nào.
label.en: a windsock
label.vi: ống gió
image.brief: Dùng lại hình `explore_windsock` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`.
image.alt.en: A windsock full of wind
image.alt.vi: Ống gió căng phồng

## Học

> Bốn ô, từ đất nhìn thấy được tới điều phải nghĩ qua nhiều năm:
> - Đất tốt (ý chính một): ẩm vừa phải, nhiều khe hở chứa không khí, giàu chất dinh dưỡng;
> - Bạn của đất (ý chính hai): giun đất đào đường hầm, lá mục, phân ủ từ vỏ rau;
> - Một ngày hay nhiều năm (định nghĩa khí hậu): thời tiết là từng ngày, khí hậu là kiểu thời tiết qua nhiều năm;
> - Quá ướt hay quá khô (ý chính ba): khí hậu thay đổi làm đất quá ướt, quá khô; chỉ nhắc lũ, hạn.
> Tên ô thứ ba đổi từ "Weather and climate" · "Thời tiết và khí hậu" (`_topic.md`) thành "One day or many years" · "Một ngày hay nhiều năm", giữ ý: câu q2 có đáp án "khí hậu" và gợi ý trỏ về ô này, nên tên ô không được chứa chữ của nhãn đáp án.
> Ví dụ khí hậu ở ô thứ ba là mùa đông lạnh ở miền Bắc, không phải Đà Lạt như `_topic.md` gợi ý: Đà Lạt để dành cho câu q6, để lời Na là tình huống mới chứ không là ví dụ của ô Học (rút kinh nghiệm SK-036 N2).

### explore
id: 401b4ce0-0597-4327-b67c-316d9c357ffc
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_healthy
label.en: Healthy soil
label.vi: Đất tốt
color: gi_dong
sentence.en: Healthy soil holds water, air and nutrients for plants.
sentence.vi: Đất tốt giữ nước, không khí và chất dinh dưỡng cho cây.
image.brief: [ảnh] Một luống rau xanh tốt trên đất nâu sẫm tơi xốp, chụp ngang luống, gần; không có người, không có dụng cụ có nhãn hiệu, không có chữ. Câu q1 dùng lại làm hình câu hỏi; bài 14 (câu w1) dùng lại. Từ khoá tìm ảnh (EN): healthy vegetable bed dark soil
image.alt.en: Green vegetables in dark soil
image.alt.vi: Luống rau xanh trên đất nâu sẫm
examples.1.en: damp, not soaking wet
examples.1.vi: ẩm, không sũng nước
examples.2.en: lots of tiny spaces for air
examples.2.vi: nhiều khe nhỏ chứa không khí
examples.3.en: rich in nutrients
examples.3.vi: giàu chất dinh dưỡng
examples.4.en: full of tiny living things
examples.4.vi: đầy những sinh vật nhỏ
> Ô không nói "đất tốt sẫm màu, tơi xốp": câu q5 để bé tự suy ra từ ví dụ một, hai. [CẦN KIỂM] Ví dụ bốn (đất tốt có nhiều sinh vật nhỏ), như thẻ bài 11.
> Ô chỉ nói đất giữ chất dinh dưỡng; việc cây lấy chất dinh dưỡng qua rễ để dành *Cây làm gì và cần gì* (`_topic.md`, Để dành).

#### group explore_helpers
label.en: Soil helpers
label.vi: Bạn của đất
color: vang_hoe
sentence.en: Earthworms mix the soil and help dead leaves rot.
sentence.vi: Giun đất xới trộn đất và giúp lá rụng mau mục.
image.brief: Dùng lại hình `earthworm`. Từ khoá tìm ảnh (EN): earthworm on moist soil close up
image.alt.en: An earthworm on damp soil
image.alt.vi: Con giun đất trên đất ẩm
examples.1.en: earthworms dig tunnels
examples.1.vi: giun đất đào đường hầm
examples.2.en: air and water get in
examples.2.vi: không khí và nước len vào đất
examples.3.en: rotting leaves add nutrients
examples.3.vi: lá mục thêm chất dinh dưỡng
examples.4.en: compost from vegetable peels
examples.4.vi: phân ủ từ vỏ rau
> [CẦN KIỂM] Giun đất đào đường hầm giúp không khí và nước xuống đất; phân ủ từ vỏ rau thêm chất dinh dưỡng. Không nói nấm, vi khuẩn (để dành *Nấm*).

#### group explore_climate
label.en: One day or many years
label.vi: Một ngày hay nhiều năm
color: cham
sentence.en: Climate is the usual weather over many years.
sentence.vi: Khí hậu là kiểu thời tiết thường gặp qua nhiều năm.
image.brief: [ảnh] Một vùng quê buổi sáng mùa đông: cánh đồng có sương mù, hàng cây, trời xám nhạt, chụp rộng; không có người, không có nhà gần, không có chữ; không có tuyết, không có băng; không bắt buộc ảnh Việt Nam (chữ của ô không nói ảnh chụp ở đâu; ảnh designer chọn 11/11 chụp ở Bangladesh). Câu q2 (thẻ q2_climate) và từ climate dùng lại. Từ khoá tìm ảnh (EN): northern Vietnam winter misty fields
image.alt.en: Misty fields on a winter morning
image.alt.vi: Cánh đồng sương mù buổi sáng mùa đông
examples.1.en: a rainy day is weather
examples.1.vi: hôm nay trời mưa là thời tiết
examples.2.en: cold winters in the north are climate
examples.2.vi: miền Bắc năm nào cũng có mùa đông lạnh, đó là khí hậu
examples.3.en: measure the weather for many years
examples.3.vi: đo thời tiết trong nhiều năm
examples.4.en: climate is slowly changing
examples.4.vi: khí hậu đang thay đổi dần
> [CẦN KIỂM] Miền Bắc có mùa đông lạnh hằng năm; khí hậu đang thay đổi dần. Đối chiếu tên gọi "thời tiết", "khí hậu" với *Thời tiết và thiên tai* (SK-038): chủ đề đó dạy từ `weather`, chưa dạy "khí hậu" (đã đọc `_topic.md` và năm bài của chủ đề đó, 11/11), nên bài này định nghĩa khí hậu lần đầu.
> Ảnh Việt Nam hợp giấy phép không có; designer chọn cánh đồng sương mù buổi sáng mùa đông ở Bangladesh, không tuyết. Chữ của ô không nói ảnh chụp ở đâu.

#### group explore_wet_dry
label.en: Too wet or too dry
label.vi: Quá ướt hay quá khô
color: do_son
sentence.en: A changing climate can make soil too wet or dry.
sentence.vi: Khí hậu thay đổi dễ làm đất quá ướt hoặc quá khô.
image.brief: Dùng lại hình `explore_seasons` ở bài `thoi-tiet-va-thien-tai/lu-lut-va-han-han`.
image.alt.en: A flooded field next to a dry field
image.alt.vi: Ruộng ngập nước bên cạnh đất khô nứt nẻ
examples.1.en: too wet, roots get no air
examples.1.vi: quá ướt, rễ cây thiếu không khí
examples.2.en: too dry, soil cracks
examples.2.vi: quá khô, đất nứt nẻ
examples.3.en: earthworms find it hard to live
examples.3.vi: giun đất khó sống
examples.4.en: floods and droughts
examples.4.vi: lũ lụt và hạn hán
> Hình gốc ở *Thời tiết* bài bốn (hình ghép ruộng ngập và đất nứt nẻ), theo main session 11/11 (*Thời tiết* giữ hình gốc, *Đá và đất* dùng lại). Ví dụ bốn chỉ nhắc tên hai thiên tai, không dạy nguyên nhân (*Thời tiết* bài bốn đã dạy).
> [CẦN KIỂM] Đất ngập lâu ngày thì rễ cây thiếu không khí; đất quá ướt, quá khô thì giun đất khó sống. Nói nhẹ: không cảnh tàn phá, không con số.

### new_words
id: 1b4f40fe-ae9d-4f60-aae4-5075cd68341d
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: climate, nutrient, earthworm

## Chơi

> Bé chọn ba thứ giữ cho đất tốt: một con vật trong đất, một thứ làm thức ăn cho đất, một cách giữ nước vừa đủ. Đạt khi đủ ba nhóm và không chọn thứ làm hại đất. Chạm hình đã chọn để bỏ ra.
> Ba món bẫy: đất khô nứt nẻ, vườn rau ngập nước, pin cũ. Mỗi món giống một nhóm ở một điểm: hai cảnh đất đều về nước (giống nhóm "Nước vừa đủ" nhưng quá ít hay quá nhiều), pin cũ là thứ bỏ vào đất (giống nhóm "Thức ăn cho đất").
> Món "Vườn rau ngập nước" là vườn rau, không phải ruộng lúa: ruộng lúa vốn giữ nước có chủ ý (thẻ bài 14), nên ảnh ruộng ngập dễ làm bé hiểu sai.

### tray
id: e0687e2f-1c36-4e33-a850-19c670454cc1
type: build_tray
version: 1
prompt.en: Find three ways to keep soil healthy
prompt.vi: Tìm ba cách giữ cho đất tốt
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find soil animals, food for soil and just enough water.
messages.start.vi: Em tìm con vật trong đất, thức ăn cho đất và nước vừa đủ nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! This soil will stay healthy.
messages.balanced.vi: Tuyệt! Đất này sẽ luôn tốt.
messages.has_limited.en: That harms the soil and the life in it.
messages.has_limited.vi: Thứ đó làm hại đất và sinh vật trong đất.
messages.missing.tray_animals_group.en: You still need an animal that helps the soil.
messages.missing.tray_animals_group.vi: Em còn thiếu một con vật giúp đất.
messages.missing.tray_food_group.en: You still need food for the soil.
messages.missing.tray_food_group.vi: Em còn thiếu thức ăn cho đất.
messages.missing.tray_water_group.en: You still need just enough water.
messages.missing.tray_water_group.vi: Em còn thiếu nước vừa đủ.

#### group tray_animals_group
label.en: Soil animals
label.vi: Con vật trong đất
color: vang_hoe
role: required

#### group tray_food_group
label.en: Food for soil
label.vi: Thức ăn cho đất
color: gi_dong
role: required

#### group tray_water_group
label.en: Just enough water
label.vi: Nước vừa đủ
color: cham
role: required

#### group tray_not_good
label.en: Not good for soil
label.vi: Không tốt cho đất
color: nau_dat
role: limit
> Nhãn `limit` dạng "Not …" · "Không …", gọi tên loại, không gọi tên món bẫy. Dòng điều kiện sẽ là "Cần đủ Con vật trong đất, Thức ăn cho đất, Nước vừa đủ · Không tốt cho đất".

#### item tray_earthworm
label.en: Earthworms
label.vi: Giun đất
group: tray_animals_group
image.brief: [hình vẽ] Một con giun đất hồng nâu bò trên mặt đất ẩm, vẽ gần, cùng nét với tám món kia của kệ; nền đất nâu; không có tay người, không có chữ.
image.alt.en: An earthworm on damp soil
image.alt.vi: Con giun đất trên đất ẩm
> Theo hình designer làm 11/11: cả kệ Chơi là hình vẽ (không có ảnh hợp lệ cho pin cũ, rãnh thoát nước, vườn rau ngập), nên giun đất trên kệ là hình vẽ riêng; ảnh `earthworm` giữ cho từ vựng, ô Học và thẻ.

#### item tray_compost
label.en: Compost
label.vi: Phân ủ
group: tray_food_group
image.brief: [hình vẽ] Một đống phân ủ trong góc vườn: vỏ rau, lá cây đang mục thành đất nâu sẫm, vẽ gần vừa; không có túi phân bón có nhãn hiệu, không có người, không có chữ. Câu q1 và từ compost dùng lại. Từ khoá tìm ảnh (EN): compost heap vegetable scraps garden
image.alt.en: A compost heap in a garden
image.alt.vi: Đống phân ủ trong góc vườn

#### item tray_watering
label.en: Water at the roots
label.vi: Nước tưới gốc
group: tray_water_group
image.brief: Dùng lại hình `tray_watering` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): watering can pouring water soil plant
image.alt.en: Water pouring from a watering can
image.alt.vi: Nước chảy từ bình tưới

#### item tray_cracked
label.en: Cracked dry soil
label.vi: Đất khô nứt nẻ
group: tray_not_good
image.brief: [hình vẽ] Một khoảnh đất khô nứt thành nhiều mảng dưới nắng, vẽ gần từ trên xuống, cùng nét với tám món kia của kệ; không có người, không có con vật, không có chữ.
image.alt.en: Dry ground cracked into pieces
image.alt.vi: Mặt đất khô nứt thành nhiều mảng
> Key bắt buộc `tray_cracked` (`_topic.md`, bảng Hình dùng chung). Theo hình designer làm 11/11: kệ toàn hình vẽ, nên không dùng ảnh đất nứt `q2` của *Bề mặt Trái Đất* bài năm (hình gốc mà *Thời tiết* dùng lại) mà vẽ riêng cùng nét kệ. `alt` giữ như ảnh gốc đó.

#### item tray_ants
label.en: Ants
label.vi: Kiến
group: tray_animals_group
image.brief: [hình vẽ] Một đàn kiến nhỏ bò quanh miệng tổ trên mặt đất, quanh miệng tổ có đất vụn đùn lên, vẽ gần; không có người, không có chữ. Từ khoá tìm ảnh (EN): ants nest entrance soil close up
image.alt.en: Ants by their nest in the soil
image.alt.vi: Đàn kiến bên tổ trong đất
> [CẦN KIỂM] Kiến đào tổ làm đất tơi, giúp không khí và nước đi xuống (biên tập chọn kiến làm con vật thứ hai của nhóm theo `_topic.md`; dế, bọ hung là phương án thay).

#### item tray_flooded
label.en: Flooded garden
label.vi: Vườn rau ngập nước
group: tray_not_good
image.brief: [hình vẽ] Một vườn rau ngập nước đục màu nâu, chỉ còn ngọn rau nhô lên khỏi mặt nước, vẽ gần vừa; không phải ruộng lúa, không có nhà ngập, không có người, không có chữ. Từ khoá tìm ảnh (EN): waterlogged vegetable garden flooded beds
image.alt.en: A vegetable garden under water
image.alt.vi: Vườn rau ngập nước
> Key bắt buộc `tray_flooded`. *Thời tiết* bài bốn có ảnh `explore_flood` (cánh đồng và con đường làng ngập nước) và hình vẽ `tray_fields` (ruộng lúa ngập); hai hình đó là ruộng, không phải vườn rau, nên bài này tả hình riêng. Phiên chính chốt: giữ ảnh riêng, hay đổi món này thành "Flooded field" · "Ruộng ngập nước" và dùng lại `explore_flood` ở bài `thoi-tiet-va-thien-tai/lu-lut-va-han-han`.

#### item tray_rotting_leaves
label.en: Rotting leaves
label.vi: Lá mục
group: tray_food_group
image.brief: Dùng lại hình `tray_rotting_leaves` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): rotting leaves on soil close up
image.alt.en: A pile of rotting leaves
image.alt.vi: Một nắm lá mục

#### item tray_ditch
label.en: A small drain
label.vi: Rãnh thoát nước nhỏ
group: tray_water_group
image.brief: [hình vẽ] Một rãnh nhỏ giữa các luống rau trong vườn, dẫn nước mưa chảy ra ngoài, trong rãnh còn ít nước, vẽ dọc theo rãnh; không có người, không có chữ. Từ khoá tìm ảnh (EN): drainage ditch between vegetable beds
image.alt.en: A small ditch between garden beds
image.alt.vi: Rãnh nhỏ giữa các luống rau
> [CẦN KIỂM] Rãnh thoát nước giúp đất vườn không bị úng sau mưa.

#### item tray_batteries
label.en: Old batteries
label.vi: Pin cũ
group: tray_not_good
image.brief: [hình vẽ] Mấy viên pin cũ đã gỉ nằm trên mặt đất, vẽ gần; vỏ pin trơn, không có nhãn hiệu, không có chữ. Câu q1 dùng lại. Từ khoá tìm ảnh (EN): old rusty batteries on ground
image.alt.en: Old batteries on the ground
image.alt.vi: Mấy viên pin cũ trên mặt đất
> [CẦN KIỂM] Pin cũ vứt xuống đất làm hại đất.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình.
> Vị trí đáp án đúng bảng `_topic.md`: q1 chỗ thứ nhất; q2 thẻ thứ hai; q3 chỗ thứ nhất và thứ tư; q4 chỗ thứ ba; q5 chỗ thứ hai.
> Không hình lựa chọn nào xuất hiện ở hai câu (kể cả câu Khởi động). Không câu nào hỏi nguyên nhân lũ, hạn hay cây khô héo khi hạn (*Thời tiết* bài bốn đã dạy).

### q1
id: a14b1215-fac2-47a1-b7ba-b1d776471829
format: single_choice
version: 1
dok: 1
prompt.en: Which one is food for the soil?
prompt.vi: Thứ nào là thức ăn cho đất?
image.brief: Dùng lại hình `explore_healthy`. Từ khoá tìm ảnh (EN): healthy vegetable bed dark soil
image.alt.en: Green vegetables in dark soil
image.alt.vi: Luống rau xanh trên đất nâu sẫm
hint.en: Remember the Soil helpers picture.
hint.vi: Em nhớ lại ô Bạn của đất nhé.
explanation_correct.en: You can make compost from fruit peels and leaves.
explanation_correct.vi: Em có thể ủ phân từ vỏ trái cây và lá.
explanation_wrong.en: Compost rots and adds nutrients to soil.
explanation_wrong.vi: Phân ủ mục dần, thêm chất dinh dưỡng cho đất.
> Câu nhớ lại ví dụ ba, bốn ô Bạn của đất. Sỏi nhỏ có sức hút (cũng là một phần của đất, bài 11); pin cũ có sức hút (cũng là thứ người ta bỏ xuống đất).
> Ba hình vẽ cùng nét: vật vẽ gần. Phân ủ và pin là món kệ Chơi, sỏi là hình kệ bài 11, nên đáp án không là hình duy nhất bé đã thấy.

#### option q1_compost
correct: true
label.en: compost
label.vi: phân ủ
image.brief: Dùng lại hình `tray_compost`. Từ khoá tìm ảnh (EN): compost heap vegetable scraps garden
image.alt.en: A compost heap in a garden
image.alt.vi: Đống phân ủ trong góc vườn

#### option q1_batteries
correct: false
feedback.en: Old batteries leak harmful things into soil.
feedback.vi: Pin cũ rỉ chất độc vào đất.
label.en: old batteries
label.vi: pin cũ
image.brief: Dùng lại hình `tray_batteries`. Từ khoá tìm ảnh (EN): old rusty batteries on ground
image.alt.en: Old batteries on the ground
image.alt.vi: Mấy viên pin cũ trên mặt đất

#### option q1_stones
correct: false
feedback.en: Stones do not rot, so they add no food.
feedback.vi: Sỏi không mục, nên không nuôi được đất.
label.en: small stones
label.vi: sỏi nhỏ
image.brief: Dùng lại hình `tray_stones` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): small gravel stones pile close up
image.alt.en: A small pile of little stones
image.alt.vi: Một đống sỏi nhỏ

### q2
id: e4233dac-d37f-4089-b006-931433249a09
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `explore_rain_gauge` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`.
image.alt.en: A rain gauge in an open garden
image.alt.vi: Ống đo mưa giữa khoảng vườn trống
sentence.en: The usual weather over many years is called {1}.
sentence.vi: Thời tiết thường gặp qua nhiều năm gọi là {1}.
answers: q2_climate
hint.en: Remember the One day or many years picture.
hint.vi: Em nhớ lại ô Một ngày hay nhiều năm nhé.
explanation_correct.en: Climate tells us what weather to expect each season.
explanation_correct.vi: Khí hậu cho biết mỗi mùa thường có thời tiết ra sao.
explanation_wrong.en: Climate is the usual weather over many years.
explanation_wrong.vi: Khí hậu là thời tiết thường gặp qua nhiều năm.
> Câu nhớ lại câu của ô Một ngày hay nhiều năm. Thẻ "weather" là chính misconception `weather_is_climate` (bé còn nghĩ hai chữ là một sẽ chọn); thẻ "rain" có sức hút (một kiểu thời tiết hay gặp). Câu không chứa chữ "climate" · "khí hậu".
> Hình câu hỏi là ống đo mưa của *Thời tiết* bài hai (đo nhiều năm thì biết khí hậu), không phải hình của thẻ nào. Ba thẻ cùng là ảnh chụp.

#### bank q2_weather
label.en: weather
label.vi: thời tiết
feedback.en: Weather is what the sky is like on one day.
feedback.vi: Thời tiết là chuyện của từng ngày.
image.brief: Dùng lại hình `q3_sun` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời

#### bank q2_climate
label.en: climate
label.vi: khí hậu
image.brief: Dùng lại hình `explore_climate`. Từ khoá tìm ảnh (EN): northern Vietnam winter misty fields
image.alt.en: Misty fields on a winter morning
image.alt.vi: Cánh đồng sương mù buổi sáng mùa đông

#### bank q2_rain
label.en: rain
label.vi: mưa
feedback.en: Rain is one kind of weather, on some days.
feedback.vi: Mưa chỉ là một kiểu thời tiết.
image.brief: Dùng lại hình `q1_rain` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi
> Ảnh này cũng là hình câu hỏi của câu w3 (không phải lựa chọn ở đó), nên không trùng vai.

### q3
id: f2d2c276-e54d-4d78-9ab6-7bf6478da524
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones help to keep soil healthy?
prompt.vi: Những việc nào giúp giữ cho đất tốt?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `soil` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): hand holding garden soil
image.alt.en: Garden soil in a hand
image.alt.vi: Nắm đất vườn trong lòng bàn tay
hint.en: Which ones give the soil cover and food?
hint.vi: Việc nào vừa che chở vừa nuôi đất nhé?
> Rà chữ tester 11/11 (n11): gợi ý cũ gọi tên hai nhóm Chơi ("thức ăn cho đất", "nước vừa đủ"), mà "nước vừa đủ" chỉ ứng với một lựa chọn sai (tưới cả ngày). Gợi ý mới nói đúng điều hai đáp án cùng làm (che và nuôi đất), không gọi tên lựa chọn.
explanation_correct.en: Straw keeps soil moist, and tree roots hold it.
explanation_correct.vi: Rơm giữ ẩm cho đất, rễ cây giữ đất lại.
explanation_wrong.en: Straw and trees feed and protect the soil.
explanation_wrong.vi: Rơm phủ và cây xanh nuôi đất, che chở cho đất.
> DOK 2: áp ba nhóm của phần Chơi vào bốn việc mới. Hai lựa chọn sai có sức hút: quét sạch lá trông gọn gàng nhưng lấy mất thức ăn của đất; tưới nước cả ngày nghe như chăm cây nhưng làm đất quá ướt.
> [CẦN KIỂM] Phủ rơm giữ ẩm cho đất và mục dần thành chất hữu cơ; trồng cây giữ đất (nối ô "Slowing it down" bài bảy).
> Bốn hình vẽ cùng nét: một khoảnh vườn vẽ gần vừa, không người.

#### option q3_straw
correct: true
label.en: covering soil with straw
label.vi: phủ rơm lên mặt đất
image.brief: [hình vẽ] Một luống rau non được phủ một lớp rơm vàng quanh gốc, vẽ gần vừa; không có người, không có chữ. Từ khoá tìm ảnh (EN): straw mulch vegetable bed
image.alt.en: Straw spread around young plants
image.alt.vi: Lớp rơm phủ quanh gốc rau non

#### option q3_sweep
correct: false
feedback.en: Fallen leaves feed the soil as they rot.
feedback.vi: Lá rụng mục ra sẽ nuôi đất.
label.en: sweeping up every leaf
label.vi: quét sạch mọi chiếc lá
image.brief: [hình vẽ] Một khoảng đất dưới gốc cây bị quét sạch trơ đất, cây chổi tre dựng bên cạnh một đống lá vừa gom, vẽ gần vừa; không có người, không có chữ. Từ khoá tìm ảnh (EN): swept bare ground broom pile of leaves
image.alt.en: Bare swept ground and a pile of leaves
image.alt.vi: Mặt đất quét trơ và một đống lá

#### option q3_hose
correct: false
feedback.en: Too much water makes soil soggy and drowns roots.
feedback.vi: Tưới quá nhiều làm đất sũng, rễ bị úng.
label.en: watering all day long
label.vi: tưới nước suốt cả ngày
image.brief: [hình vẽ] Một ống nước để chảy mãi trên luống rau, nước đọng thành vũng giữa các cây, vẽ gần vừa; không có người, không có tay, không có chữ, không có nhãn hiệu trên vòi. Từ khoá tìm ảnh (EN): garden hose running puddle vegetable bed
image.alt.en: A hose left running on a garden bed
image.alt.vi: Ống nước chảy mãi trên luống rau

#### option q3_trees
correct: true
label.en: planting trees
label.vi: trồng thêm cây
image.brief: [hình vẽ] Một cây non vừa trồng xuống đất, gốc vun đất mới, vẽ gần vừa; không có người, không có tay, không có chữ, không có thẻ nhãn trên cây. Từ khoá tìm ảnh (EN): young tree sapling newly planted soil
image.alt.en: A young tree just planted
image.alt.vi: Cây non vừa trồng

### q4
id: 61dcbb89-5ae4-43cc-b497-132b18fdb39d
format: single_choice
version: 1
dok: 2
prompt.en: Without earthworms, what is garden soil likely like?
prompt.vi: Vườn không có giun, đất dễ thành ra sao?
image.brief: Dùng lại hình `q6` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): vegetable garden beds village Vietnam
image.alt.en: A vegetable garden
image.alt.vi: Góc vườn rau
hint.en: What do earthworm tunnels do for soil?
hint.vi: Đường hầm của giun đất giúp gì cho đất?
explanation_correct.en: No tunnels means less air and water get in.
explanation_correct.vi: Không có đường hầm, ít không khí và nước vào đất.
explanation_wrong.en: No worms means no tunnels, so soil packs hard.
explanation_wrong.vi: Không giun, không đường hầm, nên đất nén chặt.
> A2 (SK-043, 14/11): câu hỏi cũ mười chín chữ (hai câu), nay chín chữ.
> DOK 2: suy ngược từ ô Bạn của đất (giun đào đường hầm, không khí và nước len vào) sang trường hợp không có giun. "Tơi và thoáng khí" là điều giun làm ra (sức hút với bé chỉ nhớ "đất và giun"); "sẫm màu và màu mỡ" có sức hút (không có giun ăn lá thì lá còn nhiều).
> Gợi ý là một câu hỏi về việc giun làm, câu trả lời của nó ("cho không khí và nước vào") không phải nhãn đáp án.
> [CẦN KIỂM] Đất vườn thiếu giun dễ bị nén chặt, kém thoáng khí.

#### option q4_airy
correct: false
feedback.en: Airy soil needs tunnels to let air in.
feedback.vi: Đất thoáng khí cần đường hầm cho không khí vào.
label.en: soft and airy
label.vi: tơi và thoáng khí
image.brief: [hình vẽ] Mặt cắt một khoảnh đất vườn, mặt đất ở trên có vài cây rau nhỏ: đất nâu tơi, nhiều khe hở nhỏ màu kem giữa các hạt; vẽ ngang, nền kem trơn; không có giun, không có mũi tên, không có chữ; cùng khung với hai lựa chọn kia.
image.alt.en: A soil cut with many tiny spaces
image.alt.vi: Mặt cắt đất có nhiều khe hở nhỏ

#### option q4_rich
correct: false
feedback.en: Rich soil needs helpers to mix in rotting leaves.
feedback.vi: Đất màu mỡ cần giun trộn lá mục vào.
label.en: dark and rich
label.vi: sẫm màu và màu mỡ
image.brief: [hình vẽ] Cùng khung với `q4_airy`: đất nâu sẫm, lẫn nhiều vụn lá mục, khe hở vừa phải; không có giun, không có chữ.
image.alt.en: A dark soil cut with bits of leaf
image.alt.vi: Mặt cắt đất sẫm màu lẫn vụn lá

#### option q4_hard
correct: true
label.en: hard and packed
label.vi: cứng và chặt
image.brief: [hình vẽ] Cùng khung với `q4_airy`: đất nâu nhạt nén chặt thành khối, gần như không có khe hở, rễ rau ở trên ngắn; không có giun, không có vết nứt khô (để không lẫn với đất khô hạn), không có chữ.
image.alt.en: A soil cut packed tight with few spaces
image.alt.vi: Mặt cắt đất nén chặt, ít khe hở

### q5
id: 4032c56c-f0fd-4eed-84d7-7834d17ca27c
format: single_choice
version: 1
dok: 2
prompt.en: Which soil is most likely healthy?
prompt.vi: Nắm đất nào dễ là đất tốt nhất?
image.brief: Dùng lại hình `tray_watering` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): watering can pouring water soil plant
image.alt.en: Water pouring from a watering can
image.alt.vi: Nước chảy từ bình tưới
hint.en: Remember the Healthy soil picture.
hint.vi: Em nhớ lại ô Đất tốt nhé.
explanation_correct.en: Its dark colour comes from rotting leaves, food for plants.
explanation_correct.vi: Màu sẫm là nhờ lá mục, thức ăn cho cây.
explanation_wrong.en: Dark, crumbly soil has room for air and water.
explanation_wrong.vi: Đất sẫm màu, tơi xốp có chỗ cho không khí và nước.
> DOK 2: ô Đất tốt nói "ẩm, không sũng nước" và "nhiều khe nhỏ chứa không khí", không tả đất tốt trông thế nào; bé áp hai ý đó vào ba nắm đất. Nắm sũng nước có sức hút (đất nhiều nước nghe như tốt cho cây).
> Ba lựa chọn là ba hình vẽ cùng khung bàn tay đeo găng của bài 12 câu q4; nắm đất sẫm màu dùng lại `q4_dark` của bài 12 (ở đó là lựa chọn sai của một câu khác, bài khác).

#### option q5_hard
correct: false
feedback.en: Hard, lumpy soil has few spaces for air.
feedback.vi: Đất cứng, vón cục có ít khe cho không khí.
label.en: hard and lumpy
label.vi: cứng và vón cục
image.brief: [hình vẽ] Cùng khung với `q4_dark` ở bài `da-va-dat/cac-loai-dat-o-viet-nam`: bàn tay đeo găng xanh lá cầm một cục đất nâu nhạt cứng, vón thành khối, không tơi; nền kem trơn; không thấy mặt, không có chữ.
image.alt.en: A hard lump of pale soil
image.alt.vi: Cục đất nhạt màu cứng

#### option q5_dark
correct: true
label.en: dark and crumbly
label.vi: sẫm màu và tơi xốp
image.brief: Dùng lại hình `q4_dark` ở bài `da-va-dat/cac-loai-dat-o-viet-nam`.
image.alt.en: A handful of dark crumbly soil
image.alt.vi: Nắm đất nâu sẫm tơi xốp

#### option q5_wet
correct: false
feedback.en: Soggy soil has water but too little air.
feedback.vi: Đất sũng nước thì thiếu không khí cho rễ.
label.en: grey and very wet
label.vi: xám và sũng nước
image.brief: [hình vẽ] Cùng khung với `q4_dark` ở bài `da-va-dat/cac-loai-dat-o-viet-nam`: bàn tay đeo găng xanh lá cầm một nắm đất xám nhão, nước nhỏ giọt qua kẽ ngón tay; nền kem trơn; không thấy mặt, không có chữ.
image.alt.en: A handful of grey soil dripping water
image.alt.vi: Nắm đất xám nhỏ giọt nước

### q6
id: b6f2e251-354d-4502-93b3-76b50c5e75f5
format: true_false
version: 1
dok: 3
misconception: weather_is_climate
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: Da Lat is hot today, but its climate stays cool.
statement.vi: Hôm nay Đà Lạt nóng, nhưng khí hậu vẫn mát mẻ.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
image.brief: [hình vẽ] Đồi thông một ngày nắng, trời xanh, vẽ rộng; không có người, không có biển chữ, không có nhà có bảng hiệu. Theo hình designer làm 11/11: không có ảnh đồi thông ngày nắng hợp lệ (ảnh Đà Lạt trên Commons là CC BY-SA); chữ của câu vẫn nói Đà Lạt. Từ khoá tìm ảnh (EN): Da Lat pine hills sunny
image.alt.en: Pine hills on a sunny day
image.alt.vi: Đồi thông ngày nắng
hint.en: Remember the One day or many years picture.
hint.vi: Em nhớ lại ô Một ngày hay nhiều năm nhé.
explanation_correct.en: Da Lat is high up, so most days stay cool.
explanation_correct.vi: Đà Lạt nằm trên cao nên phần lớn ngày đều mát.
explanation_wrong.en: One hot day does not change the climate.
explanation_wrong.vi: Một ngày nóng không làm thay đổi khí hậu.
feedback_false.en: One hot day is just weather.
feedback_false.vi: Một ngày nóng chỉ là thời tiết.
> Lời Na, hình và đáp án Đúng như `_topic.md` (mục "Câu sáu, lời Na" và bảng Đúng/Sai). Cả màn mười tám từ EN.
> DOK 3: bé tách hai thang thời gian (một ngày, nhiều năm) trong một tình huống mới: Đà Lạt không có ở ô Học. Bé còn nghĩ thời tiết và khí hậu là một sẽ cho là Na tự mâu thuẫn và chọn "Na chưa đúng".
> [CẦN KIỂM] Đà Lạt có khí hậu mát gần như quanh năm. "Da Lat" trong chuỗi EN viết không dấu (bảng Tên gọi); nghe thử giọng EN.

## Từ vựng

### climate
id: 41cc0808-2fb2-47cf-8a1e-dee9dc099d2b
tier: core
term.en: climate
term.vi: khí hậu
example.en: Our climate gives us a rainy season every year.
example.vi: Khí hậu nước mình năm nào cũng có mùa mưa.
image.brief: Dùng lại hình `explore_climate`. Từ khoá tìm ảnh (EN): northern Vietnam winter misty fields
image.alt.en: Misty fields on a winter morning
image.alt.vi: Cánh đồng sương mù buổi sáng mùa đông
> [CẦN KIỂM] Việt Nam có mùa mưa hằng năm (các vùng khác nhau có mùa mưa vào những tháng khác nhau).

### nutrient
id: deb17c51-1283-4b8c-835f-5d184e417f9c
tier: core
term.en: nutrient
term.vi: chất dinh dưỡng
example.en: Rotting leaves put nutrients back into the soil.
example.vi: Lá mục trả lại chất dinh dưỡng cho đất.
image.brief: Dùng lại hình `tray_rotting_leaves` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): rotting leaves on soil close up
image.alt.en: A pile of rotting leaves
image.alt.vi: Một nắm lá mục
> `nutrient` cũng là từ core ở *Ăn uống lành mạnh* bài một (chất dinh dưỡng cho người); câu ví dụ ở đây nói về đất (`_topic.md`, bảng Từ vựng).

### earthworm
id: 52fa5ea5-c2ec-4b41-8fd0-052e378c6cff
tier: core
term.en: earthworm
term.vi: giun đất
example.en: Earthworms dig tunnels in damp soil.
example.vi: Giun đất đào đường hầm trong đất ẩm.
image.brief: [ảnh] Một con giun đất hồng nâu bò trên mặt đất ẩm, chụp gần; không có tay người, không có chữ. Ô `explore_helpers` và thẻ `earthworm_card` dùng lại; bài 14 (câu w1) dùng lại. Món `tray_earthworm` là hình vẽ riêng (kệ toàn hình vẽ). Từ khoá tìm ảnh (EN): earthworm on moist soil close up
image.alt.en: An earthworm on damp soil
image.alt.vi: Con giun đất trên đất ẩm
> Hình gốc bắt buộc (`_topic.md`: 13 · `earthworm`).

### weather
id: 70605bf9-273c-46ba-8558-249bf765b81c
tier: extra
term.en: weather
term.vi: thời tiết
example.en: The weather can change from day to day.
example.vi: Thời tiết có thể thay đổi từng ngày.
image.brief: Dùng lại hình `q3_sun` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời
> Ôn từ `weather` của *Thời tiết* bài một; hình trỏ thẳng hình gốc ở *Bề mặt Trái Đất* bài bốn, như *Thời tiết* đã dùng.

### compost
id: 0e02d79c-c775-42be-abf5-6e276b788dd2
tier: extra
term.en: compost
term.vi: phân ủ
example.en: We make compost from vegetable peels.
example.vi: Nhà em ủ phân từ vỏ rau.
image.brief: Dùng lại hình `tray_compost`. Từ khoá tìm ảnh (EN): compost heap vegetable scraps garden
image.alt.en: A compost heap in a garden
image.alt.vi: Đống phân ủ trong góc vườn

## Thưởng

### earthworm_card
id: b358125e-b633-4f46-9155-23e312dac2a6
set: rocks
rarity: common
name.en: Earthworm
name.vi: Giun đất
tag.en: Soil helper
tag.vi: Bạn của đất
fact.en: Earthworm tunnels help air and water reach plant roots.
fact.vi: Đường hầm của giun đất giúp không khí và nước xuống tới rễ cây.
> [CẦN KIỂM] như `_topic.md`, bảng Bộ thẻ thưởng.
image.brief: Dùng lại hình `earthworm`. Từ khoá tìm ảnh (EN): earthworm on moist soil close up
image.alt.en: An earthworm on damp soil
image.alt.vi: Con giun đất trên đất ẩm

## Ghi chú cho hoạ sĩ

- **Theo hình designer làm 11/11** (SK-039, "designer 11/11 · hình bài 8–15"; file chọn ảnh `content/images/discoverer/da-va-dat/the-nao-la-dat-tot.json`): không có ảnh hợp lệ cho pin cũ, rãnh thoát nước, vườn rau ngập, mặt đất quét trơ, đồi thông ngày nắng, nên cả kệ Chơi, câu q1, q3, q4, q5, q6 là hình vẽ. Brief đã đổi `[ảnh]` sang `[hình vẽ]` ở các chỗ này.
- **Loại hình:** ba ảnh chụp (ô `explore_healthy`, ô `explore_climate`, từ `earthworm`); mười bảy hình tự vẽ. Hình không có chữ.
- **Ảnh (ba):** luống rau lá xanh trên đất sẫm (`explore_healthy`, Alabama Extension); cánh đồng sương mù buổi sáng mùa đông (`explore_climate`, Bangladesh); giun đất trên đất ẩm (`earthworm`).
- **Hình tự vẽ (mười bảy):** kệ Chơi bảy món riêng (giun đất, phân ủ, đất nứt nẻ, kiến, vườn rau ngập, rãnh thoát nước, pin cũ; lá mục và bình tưới dùng lại hình vẽ bài 11); bốn lựa chọn câu q3; ba mặt cắt câu q4; hai nắm đất câu q5 (cùng khung với bài 12 câu q4); đồi thông câu q6.
- **Dùng lại từ bài khác:** `alluvial_soil`, `tray_coffee`, `tray_casuarina`, `q4_dark` của bài 12; `soil`, `tray_stones`, `tray_rotting_leaves`, `tray_watering`, `q6` của bài 11; `quarry` của bài 1; `q2_rice` của *Khủng long* bài một; `q1_rain`, `q3_sun` của *Bề mặt Trái Đất* bài bốn; `explore_thermometer`, `explore_rain_gauge`, `explore_windsock` của *Thời tiết* bài hai; `explore_seasons` của *Thời tiết* bài bốn.
- **Hình gốc cho bài sau:** `earthworm` (bắt buộc, bài 14 câu w1); `explore_healthy` (bài 14 câu w1, hình câu hỏi).
- **Nối với *Thời tiết*:**
  - ô Quá ướt hay quá khô: dùng lại hình ghép `explore_seasons` của *Thời tiết* bài bốn;
  - đất khô nứt nẻ (`tray_cracked`) và vườn rau ngập (`tray_flooded`): hình vẽ riêng cùng nét kệ (kệ toàn hình vẽ), không dùng ảnh của *Thời tiết* hay *Bề mặt Trái Đất*.
- **Cùng kiểu trong một câu:** w1 bốn ảnh cảnh chụp rộng; w3 ba hình vẽ của *Thời tiết*; q1 ba hình vẽ (phân ủ, pin cũ, sỏi bài 11); q2 ba ảnh bầu trời hay cánh đồng; q3 bốn hình vẽ; q4 ba mặt cắt vẽ cùng khung; q5 ba nắm đất vẽ cùng khung.
- **Kệ Chơi:** chín hình vẽ cùng nét; không có người, không có tay.
- **Màu:** Học: Đất tốt `gi_dong`, Bạn của đất `vang_hoe`, Một ngày hay nhiều năm `cham`, Quá ướt hay quá khô `do_son`. Chơi: Con vật trong đất `vang_hoe`, Thức ăn cho đất `gi_dong`, Nước vừa đủ `cham`, nhóm bẫy `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: climate, nutrient, earthworm).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (mỗi nhóm hai món), một nhóm `limit` (ba món), chín món.
  - Khởi động: `single_choice` (w1 bốn lựa chọn, w3 ba lựa chọn), `true_false` (w2, Sai). DOK một. `recall_from.lesson`: `da-va-dat/cac-loai-dat-o-viet-nam` (w1, w2), `thoi-tiet-va-thien-tai/do-thoi-tiet` (w3, tuỳ chọn).
  - Quiz: `single_choice` (q1, q4, q5; ba lựa chọn), `fill_blank_bank` (q2, ba thẻ), `multi_choice` (q3, bốn lựa chọn, hai đúng), `true_false` (q6 Đúng, `speaker: na`, `misconception: weather_is_climate`).
- **Tham chiếu:** chạy `ids` cho bài 12 trước bài này; câu w3 trỏ bài hai của *Thời tiết* (đã có id).
- **Vị trí đáp án đúng:** w1 thứ tư; w3 thứ hai; q1 thứ nhất; q2 thẻ thứ hai; q3 thứ nhất và thứ tư; q4 thứ ba; q5 thứ hai.
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Giun đất, Phân ủ, Nước tưới gốc → `balanced`;
  - Pin cũ → `has_limited`;
  - Kiến, Lá mục, Giun đất (thiếu nước vừa đủ) → `missing.tray_water_group`;
  - rồi chạm Rãnh thoát nước nhỏ → `full`; bỏ Giun đất, đặt Rãnh thoát nước nhỏ → `balanced`.
- **Số từ EN trên một màn:** Học khoảng ba mươi (mục tiêu 9, hướng dẫn 3, bốn nhãn 13, câu dài nhất 10, ô Từ mới 3). Nhãn ô "One day or many years" dài năm từ; nhờ tester xem chip trên iPhone hẹp. Quiz nhiều chữ nhất: q3 (câu hỏi 7, hướng dẫn 5, bốn nhãn 14), q4 (câu hỏi 13, ba nhãn 9), q6 (mười tám).
- **Từ EN có thể ngoài Starters/Movers:** từ mới climate, nutrient, earthworm, compost; weather (*Thời tiết*), tunnel, damp, rot, straw, sweep, hose, packed, lumpy, crumbly, ants, drain, batteries, Da Lat, rain gauge, thermometer, windsock.
- **Nhãn dài:** "Rãnh thoát nước nhỏ", "Vườn rau ngập nước" (món Chơi), "covering soil with straw", "tưới nước suốt cả ngày" (q3).
- **Giọng đọc:** EN "Da Lat"; VI "Đà Lạt". Chuỗi VI không có chữ số, không ký hiệu, không dấu "—".
