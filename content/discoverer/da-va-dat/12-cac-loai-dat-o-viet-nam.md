---
id: 2b319744-2a0f-41e8-9c00-97af95098a9e
topic: da-va-dat
slug: cac-loai-dat-o-viet-nam
order: 12
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Different types of soils
vi: Các loại đất ở Việt Nam
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số mười hai).

## Mục tiêu
en: I can compare kinds of soil in Vietnam.
vi: Em so sánh được một số loại đất ở Việt Nam.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn C), chưa duyệt.** Ticket SK-039, ngày 11/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids` sau bài 11 (câu w1, w2 trỏ bài 11).
> Oak lesson 12 (`different-types-of-soils-non-statutory`), bản địa hoá đã duyệt: bốn loại đất của Oak (đất cát, đất bùn, đất sét, đất thịt) thành ba loại đất Việt Nam (đất phù sa, đất đỏ ba-dan, đất cát); đất thịt là từ đọc thêm; kính hiển vi kỹ thuật số thành kính lúp.
> Bài sửa `all_soil_is_same` ở ý chính một, bốn ô Học, phần Chơi và câu q6 (gắn key, Na nói đúng). Nối *Bề mặt Trái Đất* bài 4 (đất đỏ từ đá núi lửa) ở câu w3 và ô "Red soil", không dạy lại núi lửa.

## Ý chính
1.en: Soils have different colours and grains.
1.vi: Mỗi loại đất có màu và cỡ hạt khác nhau.
2.en: Rivers bring silt that makes alluvial soil for rice.
2.vi: Sông mang bùn mịn về, bồi thành đất phù sa để trồng lúa.
3.en: Red soil from old volcano rock is good for coffee.
3.vi: Đất đỏ ba-dan từ đá núi lửa xưa hợp để trồng cà phê.
> [CẦN KIỂM] Đất phù sa ở đồng bằng sông Hồng và đồng bằng sông Cửu Long; đất đỏ ba-dan ở Tây Nguyên hình thành từ đá ba-dan (dung nham nguội rồi phong hoá), hợp cà phê, hồ tiêu, cao su; đất cát ven biển miền Trung. "Ba-dan" hay "bazan" (bảng Tên gọi).
> Ba ý đi từ điều nhìn và sờ được (màu, cỡ hạt), tới hai loại đất có nguồn gốc rõ (sông bồi, đá núi lửa).

## Khởi động

> Ba câu, đúng bảng Khởi động ở `_topic.md`. Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.
> - w1 ôn bài 11 (một ngày trước): thứ gì chìm xuống đáy lọ.
> - w2 ôn bài 11: đất không chỉ có mảnh đá (Sai).
> - w3 ôn *Bề mặt Trái Đất* bài 4 *Núi lửa* (hơn một tháng trước): đất đỏ có từ đá núi lửa xưa. Gợi ý đủ để bé chưa học chủ đề đó vẫn làm được.

### w1
id: cf305d70-71bb-4653-93b5-bd99316744f8
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/dat-gom-nhung-gi
prompt.en: In a jar of water, what sinks to the bottom?
prompt.vi: Trong lọ nước, thứ gì chìm xuống đáy?
image.brief: Dùng lại hình `prediction` ở bài `da-va-dat/dat-gom-nhung-gi`.
image.alt.en: A jar of muddy water, just shaken
image.alt.vi: Lọ nước đục vừa lắc xong
hint.en: Remember the Jar test picture in the last lesson.
hint.vi: Em nhớ lại ô Lọ đất lắng ở bài trước nhé.
explanation_correct.en: Yes! Small stones are heavy, so they sink first.
explanation_correct.vi: Đúng rồi! Sỏi nặng nên chìm xuống trước.
explanation_wrong.en: The answer is small stones. Heavy bits sink first.
explanation_wrong.vi: Đáp án là sỏi nhỏ. Hạt nặng chìm xuống trước.
> Ý, thứ tự lựa chọn và vị trí đáp án (chỗ thứ hai) đúng bảng Khởi động. Bài 11 dạy ý này ở ô Lọ đất lắng (ví dụ "hạt nặng chìm xuống trước", hình lọ đã lắng) và câu q4.
> Lệch `_topic.md` (bảng Hình dùng chung ghi `explore_jar` là hình câu w1 bài 12): hình `explore_jar` vẽ sỏi nằm dưới đáy lọ, tức là cho thấy đáp án. Câu này dùng hình `prediction` (lọ vừa lắc, chưa thấy lớp) của bài 11.

#### option w1_clay
correct: false
label.en: clay
label.vi: đất sét
image.brief: Dùng lại hình `clay` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): lump of wet clay soil
image.alt.en: A lump of soft clay
image.alt.vi: Một khối đất sét dẻo

#### option w1_stones
correct: true
label.en: small stones
label.vi: sỏi nhỏ
image.brief: Dùng lại hình `tray_stones` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): small gravel stones pile close up
image.alt.en: A small pile of little stones
image.alt.vi: Một đống sỏi nhỏ

#### option w1_leaves
correct: false
label.en: rotting leaves
label.vi: lá mục
image.brief: Dùng lại hình `tray_rotting_leaves` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): rotting leaves on soil close up
image.alt.en: A pile of rotting leaves
image.alt.vi: Một nắm lá mục

### w2
id: f794b043-3c5c-4c8b-a141-d04218987563
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/dat-gom-nhung-gi
prompt.en: Soil is made only of tiny bits of rock.
prompt.vi: Đất chỉ gồm những mảnh đá rất nhỏ.
image.brief: Dùng lại hình `soil` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): hand holding garden soil
image.alt.en: Garden soil in a hand
image.alt.vi: Nắm đất vườn trong lòng bàn tay
answer: false
hint.en: Remember everything that was in the jar.
hint.vi: Em nhớ lại mọi thứ có trong lọ đất lắng nhé.
explanation_correct.en: Soil also has organic matter, air and water.
explanation_correct.vi: Đất còn có chất hữu cơ, không khí và nước.
explanation_wrong.en: This is false. Soil also has organic matter.
explanation_wrong.vi: Câu này sai. Đất còn có cả chất hữu cơ.
> Câu `true_false` dùng đúng chữ EN ở bảng Khởi động và bảng Đúng/Sai (bài 12 w2, Sai). Giải thích khi đúng không mở đầu bằng "Yes!".
> Gợi ý không gọi tên ô Chất hữu cơ (đó là phản ví dụ); chỉ nhắc cả lọ đất, nơi bé đã thấy vụn lá nổi lên.

### w3
id: caf32cf8-3aa4-4cd3-a837-36b9a29eb06b
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/nui-lua
prompt.en: Which soil comes from old volcano rock?
prompt.vi: Loại đất nào có từ đá núi lửa xưa?
image.brief: Dùng lại hình `q1` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): volcano cone quiet landscape
image.alt.en: A quiet volcano
image.alt.vi: Núi lửa đang yên lặng
hint.en: Remember the volcano lesson about Earth.
hint.vi: Em nhớ lại bài Núi lửa nhé.
explanation_correct.en: Yes! Old lava rock slowly broke down into red soil.
explanation_correct.vi: Đúng rồi! Đá dung nham xưa vỡ vụn dần thành đất đỏ.
explanation_wrong.en: The answer is red soil. It formed from old lava rock.
explanation_wrong.vi: Đáp án là đất đỏ. Đất đỏ có từ đá dung nham xưa.
> Ý, thứ tự lựa chọn và vị trí đáp án (chỗ thứ ba) đúng bảng Khởi động. Ôn món ví dụ "red soil from lava rock" · "đất đỏ ba-dan từ đá dung nham" của ô "Ở Việt Nam" bài *Núi lửa*.
> Hình câu hỏi là núi lửa đang yên lặng, không thấy đất đỏ.
> Lệch `_topic.md` (bảng Hình dùng chung ghi `q2_rice` cho lựa chọn "đất ruộng lúa"): ảnh `q2_rice` là cánh đồng lúa xanh chụp rộng, lệch khung với hai ảnh mặt đất chụp gần. Lựa chọn này dùng ảnh đất phù sa chụp gần `alluvial_soil` (từ vựng bài này); nhãn giữ "rice field soil" · "đất ruộng lúa" như bảng Khởi động. Ảnh `q2_rice` vẫn dùng ở kệ Chơi và câu q3.
> [CẦN KIỂM] Đất đỏ ba-dan do đá dung nham núi lửa thời xưa nguội lại rồi phong hoá mà thành (như *Núi lửa*).

#### option w3_sandy
correct: false
label.en: sandy soil
label.vi: đất cát
image.brief: Dùng lại hình `sandy_soil`. Từ khoá tìm ảnh (EN): sandy soil close up coast grains
image.alt.en: Pale soil with big grains
image.alt.vi: Đất nhạt màu, hạt to
> `alt` ở câu này tả màu và hạt, không gọi tên loại đất (giống hai lựa chọn kia), để phụ đề và VoiceOver không đọc trùng nhãn.

#### option w3_rice
correct: false
label.en: rice field soil
label.vi: đất ruộng lúa
image.brief: Dùng lại hình `alluvial_soil`. Từ khoá tìm ảnh (EN): alluvial soil field close up Mekong Delta
image.alt.en: Soft grey-brown soil in a field
image.alt.vi: Đất nâu xám mềm trên ruộng

#### option w3_red
correct: true
label.en: red soil
label.vi: đất đỏ
image.brief: Dùng lại hình `tray_red_soil` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): red soil field Vietnam basalt
image.alt.en: A deep red field
image.alt.vi: Mặt ruộng màu đỏ sẫm
> Rà chữ tester 11/11 (câu nhỏ khác): `alt` sửa so với gốc ("Red soil in a field" · "Đất đỏ trên ruộng") để ba lựa chọn cùng một cách tả (màu, hạt), không gọi tên loại đất như hai lựa chọn kia.

## Học

> Bốn ô: ba loại đất Việt Nam rồi cách so sánh đất:
> - Đất phù sa (ý chính hai): sông bồi bùn mịn ở hai đồng bằng lớn; lúa, cây ăn trái;
> - Đất đỏ ba-dan (ý chính ba): từ đá núi lửa xưa, ở Tây Nguyên; cà phê, hồ tiêu, cao su;
> - Đất cát (ý chính một): hạt to, nhiều khe hở, ven biển miền Trung; phi lao giữ cát;
> - Sờ và nhìn (ý chính một): nhìn màu, sờ hạt, soi kính lúp; đeo găng, rửa tay.
> Ô Đất cát không nói "mau khô": câu q6 để bé tự suy ra từ "nhiều khe hở" (bài 11, nước đi qua khe hở) và ô Sờ và nhìn ("đất cát sờ thấy ráp"). Ô Đất cát cũng không nói "nước chảy qua nhanh", để dành bài 14 tự tìm ra.
> Không dùng bản đồ đất Việt Nam (`_topic.md`, Quy ước hình mục bảy): vùng đất nói bằng ảnh cảnh và tên vùng.

### explore
id: 16f70e62-dc55-46a7-94c3-b6032533a2bc
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_alluvial
label.en: Alluvial soil
label.vi: Đất phù sa
color: cham
sentence.en: Silt left by rivers makes soft alluvial soil.
sentence.vi: Bùn mịn do sông bồi lại tạo nên đất phù sa mềm.
image.brief: Dùng lại hình `explore_erosion` ở bài `da-va-dat/da-bi-bao-mon-theo-thoi-gian`. Từ khoá tìm ảnh (EN): muddy river eroded riverbank
image.alt.en: A river with a worn bank
image.alt.vi: Dòng sông có bờ bị lở
examples.1.en: Red River Delta
examples.1.vi: đồng bằng sông Hồng
examples.2.en: Mekong Delta
examples.2.vi: đồng bằng sông Cửu Long
examples.3.en: grey-brown, with fine grains
examples.3.vi: màu nâu xám, hạt mịn
examples.4.en: rice and fruit trees
examples.4.vi: lúa và cây ăn trái
> Hình gốc ở bài bảy (dòng sông có bờ lở, chụp xa; ảnh designer chọn nước xanh đục, không phải màu nâu phù sa), đúng bảng Hình dùng chung; từ khoá và `alt` chép của bài bảy (`alt` mới, B sửa 11/11).
> [CẦN KIỂM] Màu đất phù sa (nâu xám) ở ví dụ ba.

#### group explore_red
label.en: Red soil
label.vi: Đất đỏ ba-dan
color: do_son
sentence.en: Old volcano rock slowly broke down into red soil.
sentence.vi: Đá núi lửa xưa vỡ vụn dần thành đất đỏ ba-dan.
image.brief: Dùng lại hình `tray_red_soil` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): red soil field Vietnam basalt
image.alt.en: Red soil in a field
image.alt.vi: Đất đỏ trên ruộng
examples.1.en: Central Highlands
examples.1.vi: Tây Nguyên
examples.2.en: red and crumbly
examples.2.vi: màu đỏ, tơi xốp
examples.3.en: coffee, pepper and rubber trees
examples.3.vi: cà phê, hồ tiêu và cao su
> Nối *Núi lửa* (đất đỏ ba-dan từ đá dung nham) mà không dạy lại núi lửa phun ra sao. Ảnh chụp ở Brasil (ghi chú SK-033 ở bài *Núi lửa*); chữ của ô nói Tây Nguyên ở ví dụ, không nói ảnh chụp ở Tây Nguyên.
> [CẦN KIỂM] Đất đỏ ba-dan tơi xốp; cây hợp đất này.

#### group explore_sandy
label.en: Sandy soil
label.vi: Đất cát
color: vang_hoe
sentence.en: Sandy soil has big grains with lots of space.
sentence.vi: Đất cát có hạt to, giữa các hạt có nhiều khe hở.
image.brief: Dùng lại hình `sandy_soil`. Từ khoá tìm ảnh (EN): sandy soil close up coast grains
image.alt.en: Sandy soil with big grains
image.alt.vi: Đất cát hạt to
examples.1.en: coast of central Vietnam
examples.1.vi: ven biển miền Trung
examples.2.en: pale, with big grains
examples.2.vi: màu nhạt, hạt to
examples.3.en: casuarina trees hold the sand
examples.3.vi: cây phi lao giữ cát
examples.4.en: watermelons grow well on it
examples.4.vi: dưa hấu mọc tốt trên đất này
> [CẦN KIỂM] Phi lao trồng ven biển miền Trung để giữ cát; dưa hấu trồng trên đất cát ven biển.

#### group explore_feel
label.en: Feel and look
label.vi: Sờ và nhìn
color: gi_dong
sentence.en: Look and feel closely to compare soils.
sentence.vi: Em nhìn kỹ và sờ thử để so sánh các loại đất.
image.brief: Dùng lại hình `magnifying_glass` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): magnifying glass plain background
image.alt.en: A magnifying glass
image.alt.vi: Chiếc kính lúp
examples.1.en: sandy soil feels rough
examples.1.vi: đất cát sờ thấy ráp
examples.2.en: wet clay feels sticky
examples.2.vi: đất sét ướt sờ thấy dính
examples.3.en: look at the colour
examples.3.vi: nhìn màu của đất
examples.4.en: wear gloves, then wash your hands
examples.4.vi: đeo găng tay, xong rửa tay thật sạch
> Hình gốc ở bài hai (kính lúp trên nền trơn), đúng bảng Hình dùng chung. Ví dụ bốn theo mục An toàn của `_topic.md` (cầm đất thì đeo găng, rửa tay bằng xà phòng). [CẦN KIỂM] khuyến cáo vệ sinh khi trẻ cầm đất.

### new_words
id: f6b0dd34-8e7e-4a94-8546-d6c068037d4e
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: alluvial_soil, red_soil, sandy_soil

## Chơi

> Bé tìm cho mỗi loại đất một nơi có đất đó: một cảnh đất phù sa, một cảnh đất đỏ, một cảnh đất cát. Đạt khi đủ ba nhóm và không chọn mặt nền do người làm. Chạm hình đã chọn để bỏ ra.
> Nhãn món tả nơi chốn, không chứa tên loại đất của nhóm (luật "câu phân loại" ở Quy ước hình mục năm): "Freshly ploughed field", không phải "Red soil field".
> Ba món bẫy là mặt nền do con người làm ra (sân xi măng, mặt đường nhựa, nền gạch lát), nối `bricks_are_rocks` của bài 1. Mỗi món giống một nhóm ở một điểm: sân xi măng xám như đất phù sa, nền gạch đỏ như đất đỏ, mặt đường nhựa có hạt đá dăm như đất cát.

### tray
id: 83caad49-fd2d-40f7-8021-164fc226d6c2
type: build_tray
version: 1
prompt.en: Find a place for each soil
prompt.vi: Tìm nơi có từng loại đất
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a place for each kind of soil.
messages.start.vi: Em tìm một nơi cho mỗi loại đất nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Each soil suits different plants.
messages.balanced.vi: Tuyệt! Mỗi loại đất hợp với những loại cây khác nhau.
messages.has_limited.en: People made that. It is not soil.
messages.has_limited.vi: Thứ này do con người làm ra, không phải đất.
messages.missing.tray_alluvial_group.en: You still need a place with alluvial soil.
messages.missing.tray_alluvial_group.vi: Em còn thiếu một nơi có đất phù sa.
messages.missing.tray_red_group.en: You still need a place with red soil.
messages.missing.tray_red_group.vi: Em còn thiếu một nơi có đất đỏ.
messages.missing.tray_sandy_group.en: You still need a place with sandy soil.
messages.missing.tray_sandy_group.vi: Em còn thiếu một nơi có đất cát.

#### group tray_alluvial_group
label.en: Alluvial soil
label.vi: Đất phù sa
color: cham
role: required

#### group tray_red_group
label.en: Red soil
label.vi: Đất đỏ ba-dan
color: do_son
role: required

#### group tray_sandy_group
label.en: Sandy soil
label.vi: Đất cát
color: vang_hoe
role: required

#### group tray_not_soil
label.en: Not soil
label.vi: Không phải đất
color: nau_dat
role: limit
> Nhãn `limit` dạng "Not …" · "Không …", gọi tên loại, không gọi tên món bẫy. Dòng điều kiện sẽ là "Cần đủ Đất phù sa, Đất đỏ ba-dan, Đất cát · Không phải đất".

#### item tray_rice
label.en: Delta rice fields
label.vi: Ruộng lúa đồng bằng
group: tray_alluvial_group
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

#### item tray_coffee
label.en: Coffee hill
label.vi: Đồi cà phê
group: tray_red_group
image.brief: [ảnh] Một đồi cà phê xanh, các hàng cây cà phê thẳng lối, thấy rõ đất đỏ giữa các hàng, chụp rộng; ưu tiên Tây Nguyên; không có ảnh Việt Nam hợp giấy phép thì lấy vườn cà phê trên đất đỏ ở nước khác (như ảnh `tray_red_soil`), ghi rõ ở file chọn ảnh; không có người, không có nhà, không có chữ. Câu q1 và thẻ `coffee_card` dùng lại; bài 13 (câu w1) dùng lại. Từ khoá tìm ảnh (EN): coffee plantation red soil rows
image.alt.en: Rows of coffee plants on a hill
image.alt.vi: Những hàng cà phê trên đồi
> Hình gốc bắt buộc (`_topic.md`: 12 · `tray_coffee`). `alt` không gọi tên màu đất, để câu q4 (cà phê mọc trên đất nào) còn là việc bé tự nối.

#### item tray_casuarina
label.en: Casuarina forest
label.vi: Rừng phi lao
group: tray_sandy_group
image.brief: [ảnh] Một rừng phi lao xanh mọc trên bãi cát trắng ven biển, thấy rõ nền cát dưới gốc cây, chụp rộng; ưu tiên ven biển miền Trung; không có người, không có nhà, không có biển chữ. Câu q1 dùng lại; bài 13 (câu w1) dùng lại. Từ khoá tìm ảnh (EN): casuarina trees sand coast Vietnam
image.alt.en: Casuarina trees growing on sand
image.alt.vi: Rừng phi lao mọc trên cát
> Hình gốc bắt buộc (`_topic.md`: 12 · `tray_casuarina`).

#### item tray_cement
label.en: Cement yard
label.vi: Sân xi măng
group: tray_not_soil
image.brief: [ảnh] Mặt sân xi măng xám, hơi sứt và bẩn, chụp gần từ trên xuống; không có người, không có vạch kẻ, không có chữ. Từ khoá tìm ảnh (EN): grey concrete floor texture
image.alt.en: A grey cement yard
image.alt.vi: Sân xi măng xám
> Nhãn cùng chữ với bài 6 (đề xuất của người B). Theo hình designer làm 11/11: không dùng lại `tray_cement_yard` của bài 6 vì hình đó là hình vẽ, còn kệ bài 12 toàn ảnh chụp; ảnh riêng là ảnh mẫu bề mặt sân xi măng (CC0).

#### item tray_orchard
label.en: Fruit orchard
label.vi: Vườn cây ăn trái
group: tray_alluvial_group
image.brief: [ảnh] Một vườn cây ăn trái xanh tốt trồng thành hàng thẳng, chụp rộng; không có người, không có xe, không có biển chữ. Câu q3 dùng lại. Từ khoá tìm ảnh (EN): Mekong Delta fruit orchard canal
image.alt.en: Rows of fruit trees
image.alt.vi: Vườn cây ăn trái
> Theo ảnh designer chọn 11/11 (vườn sầu riêng trồng thành hàng, CC0; không có ảnh vườn bên mương ở đồng bằng sông Cửu Long hợp lệ): brief, `alt` sửa theo ảnh; nhãn đổi từ "Riverside orchard" · "Vườn cây ăn trái ven sông" thành "Fruit orchard" · "Vườn cây ăn trái", vì ảnh không thấy sông.

#### item tray_red_soil
label.en: Freshly ploughed field
label.vi: Ruộng vừa cày xới
group: tray_red_group
image.brief: Dùng lại hình `tray_red_soil` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): red soil field Vietnam basalt
image.alt.en: A freshly ploughed field
image.alt.vi: Ruộng vừa cày xới
> `alt` sửa so với gốc ("Red soil in a field" · "Đất đỏ trên ruộng") để không chứa tên nhóm "Red soil" · "Đất đỏ"; bé nhận ra nhóm qua màu đất trong ảnh.

#### item tray_watermelon
label.en: Watermelon field
label.vi: Ruộng dưa hấu
group: tray_sandy_group
image.brief: [ảnh] Một quả dưa hấu xanh nằm trên đất cát nâu nhạt giữa dây lá, chụp vừa; không có người, không có chữ, không có nhãn dán trên quả. Câu q1 dùng lại. Từ khoá tìm ảnh (EN): watermelon field sandy soil coast
image.alt.en: A watermelon growing in a field
image.alt.vi: Quả dưa hấu mọc trên ruộng
> [CẦN KIỂM] Dưa hấu trồng trên đất cát ven biển miền Trung.
> Theo ảnh designer chọn 11/11 (một quả dưa trên đất cát, đã cắt bỏ ruộng ngô phía sau): brief, `alt` sửa theo ảnh.

#### item tray_road
label.en: Tarmac road
label.vi: Mặt đường nhựa
group: tray_not_soil
image.brief: Dùng lại hình `tray_road` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): asphalt road surface close up
image.alt.en: A tarmac road up close
image.alt.vi: Mặt đường nhựa chụp gần
> Hình gốc ở bài 1, đúng bảng Hình dùng chung.

#### item tray_tiles
label.en: Tiled floor
label.vi: Nền gạch lát
group: tray_not_soil
image.brief: [ảnh] Một khoảng nền lát gạch đỏ cam, chụp từ trên xuống; không có người, không có đồ vật, không có chữ, không có hoa văn thành chữ. Từ khoá tìm ảnh (EN): red terracotta floor tiles
image.alt.en: A floor of red bricks
image.alt.vi: Nền gạch đỏ
> Theo ảnh designer chọn 11/11 (ảnh mẫu bề mặt nền gạch đỏ lát, CC0): brief, `alt` sửa theo ảnh.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình.
> Vị trí đáp án đúng bảng `_topic.md`: q1 chỗ thứ ba; q2 thẻ thứ ba; q3 chỗ thứ nhất, ba, bốn; q4 chỗ thứ nhất (bốn lựa chọn); q5 chỗ thứ hai.
> Không hình lựa chọn nào xuất hiện ở hai câu (kể cả câu Khởi động): ba ảnh đất chụp gần của câu w3 (`sandy_soil`, `alluvial_soil`, `tray_red_soil`) không làm lựa chọn ở Quiz; câu q4, q5 dùng hai bộ hình vẽ riêng.

### q1
id: 28dc2391-1210-4b13-a5bd-02376035d331
format: single_choice
version: 1
dok: 1
prompt.en: Which plant holds sandy soil by the sea?
prompt.vi: Cây nào giữ đất cát ven biển?
image.brief: Dùng lại hình `sandy_soil`. Từ khoá tìm ảnh (EN): sandy soil close up coast grains
image.alt.en: Sandy soil with big grains
image.alt.vi: Đất cát hạt to
hint.en: Remember the Sandy soil picture.
hint.vi: Em nhớ lại ô Đất cát nhé.
explanation_correct.en: Yes! Casuarina roots hold the sand in place.
explanation_correct.vi: Đúng rồi! Rễ phi lao giữ cát lại.
explanation_wrong.en: The answer is casuarina trees. They hold the sand.
explanation_wrong.vi: Đáp án là cây phi lao. Phi lao giữ cát lại.
> Câu nhớ lại ví dụ ba ô Đất cát. Dưa hấu có sức hút (cũng mọc trên đất cát, ví dụ bốn) nhưng không giữ cát; cà phê là cây của loại đất khác.
> [CẦN KIỂM] Rễ phi lao giữ cát, chắn gió cát ven biển.

#### option q1_coffee
correct: false
label.en: coffee plants
label.vi: cây cà phê
image.brief: Dùng lại hình `tray_coffee`. Từ khoá tìm ảnh (EN): coffee plantation red soil rows
image.alt.en: Rows of coffee plants on a hill
image.alt.vi: Những hàng cà phê trên đồi

#### option q1_watermelon
correct: false
label.en: watermelon plants
label.vi: cây dưa hấu
image.brief: Dùng lại hình `tray_watermelon`. Từ khoá tìm ảnh (EN): watermelon field sandy soil coast
image.alt.en: A watermelon growing in a field
image.alt.vi: Quả dưa hấu mọc trên ruộng

#### option q1_casuarina
correct: true
label.en: casuarina trees
label.vi: cây phi lao
image.brief: Dùng lại hình `tray_casuarina`. Từ khoá tìm ảnh (EN): casuarina trees sand coast Vietnam
image.alt.en: Casuarina trees growing on sand
image.alt.vi: Rừng phi lao mọc trên cát

### q2
id: 41549f7d-16e1-4956-acc9-8f692859ff15
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `alluvial_soil`. Từ khoá tìm ảnh (EN): alluvial soil field close up Mekong Delta
image.alt.en: Soft grey-brown soil in a field
image.alt.vi: Đất nâu xám mềm trên ruộng
sentence.en: Rivers bring {1} that makes alluvial soil.
sentence.vi: Sông mang {1} về, bồi thành đất phù sa.
answers: q2_silt
hint.en: Remember the Alluvial soil picture.
hint.vi: Em nhớ lại ô Đất phù sa nhé.
explanation_correct.en: Yes! Rivers leave silt, and it becomes alluvial soil.
explanation_correct.vi: Đúng rồi! Sông để lại bùn mịn, bồi thành đất phù sa.
explanation_wrong.en: The answer is silt. Rivers carry it to the deltas.
explanation_wrong.vi: Đáp án là bùn mịn. Sông mang bùn mịn về các đồng bằng.
> Câu nhớ lại ý chính hai, ôn từ `silt` của bài 11. Hai thẻ sai đều là đá núi lửa (đá dung nham có lỗ, đá bọt): sức hút với bé còn lẫn nguồn gốc đất phù sa với đất đỏ (`all_soil_is_same`). Không dùng thẻ "cát" hay "đất sét", vì sông cũng mang cát và sét về, câu sẽ có hai đáp án.
> Ba thẻ cùng là ảnh mẫu chụp gần.

#### bank q2_pumice
label.en: pumice
label.vi: đá bọt
image.brief: Dùng lại hình `pumice` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): pumice rock sample
image.alt.en: A pale grey rock
image.alt.vi: Hòn đá màu xám nhạt

#### bank q2_lava_rock
label.en: lava rock
label.vi: đá dung nham
image.brief: Dùng lại hình `tray_dark_rock` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): basalt vesicular rock sample
image.alt.en: A dark rock with tiny holes
image.alt.vi: Hòn đá sẫm màu có lỗ nhỏ

#### bank q2_silt
label.en: silt
label.vi: bùn mịn
image.brief: Dùng lại hình `silt` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): silt deposit riverbank close up
image.alt.en: Smooth grey silt
image.alt.vi: Lớp bùn mịn màu xám

### q3
id: cef06d4d-3b10-44de-aec1-ce2add498e1e
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones grow well on alluvial soil?
prompt.vi: Những cây nào hợp với đất phù sa?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `explore_erosion` ở bài `da-va-dat/da-bi-bao-mon-theo-thoi-gian`. Từ khoá tìm ảnh (EN): muddy river eroded riverbank
image.alt.en: A river with a worn bank
image.alt.vi: Dòng sông có bờ bị lở
hint.en: Remember the Alluvial soil picture.
hint.vi: Em nhớ lại ô Đất phù sa nhé.
explanation_correct.en: Yes! Rice, fruit trees and vegetables like alluvial soil.
explanation_correct.vi: Đúng rồi! Lúa, cây ăn trái và rau xanh đều hợp đất phù sa.
explanation_wrong.en: The answers are rice, fruit trees and vegetables.
explanation_wrong.vi: Đáp án là lúa, cây ăn trái và rau xanh.
> DOK 2: phân loại cây theo loại đất, có một cây mới (rau xanh ở bãi bồi) chưa có ở ô Học. Hồ tiêu là lựa chọn sai có sức hút (cây trồng quen, ở ô Đất đỏ ba-dan). Ba đáp án đúng, một sai (bài 12 là một trong bốn bài có câu ba đáp án).
> [CẦN KIỂM] Rau màu trồng trên bãi bồi ven sông (đất phù sa); hồ tiêu trồng nhiều trên đất đỏ ba-dan.

#### option q3_rice
correct: true
label.en: rice
label.vi: lúa
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

#### option q3_pepper
correct: false
label.en: pepper
label.vi: hồ tiêu
image.brief: [ảnh] Một vườn hồ tiêu xanh, dây tiêu leo quanh những cột trụ, chụp rộng vừa; không có người, không có chữ, không có biển. Từ khoá tìm ảnh (EN): black pepper vines plantation poles
image.alt.en: Pepper vines climbing tall poles
image.alt.vi: Dây hồ tiêu leo trên cột

#### option q3_fruit
correct: true
label.en: fruit trees
label.vi: cây ăn trái
image.brief: Dùng lại hình `tray_orchard`. Từ khoá tìm ảnh (EN): Mekong Delta fruit orchard canal
image.alt.en: Rows of fruit trees
image.alt.vi: Vườn cây ăn trái

#### option q3_vegetables
correct: true
label.en: vegetables
label.vi: rau xanh
image.brief: [ảnh] Những luống rau xanh trên bãi bồi ven sông, mặt đất nâu xám mịn, dòng sông ở phía sau, chụp rộng vừa; không có người, không có chữ. Từ khoá tìm ảnh (EN): vegetable fields riverbank floodplain
image.alt.en: Green vegetable beds by a river
image.alt.vi: Luống rau xanh bên bờ sông
> Bốn ảnh cùng kiểu: một khu trồng cây chụp rộng vừa, không người.

### q4
id: 8d901b51-bc69-4e5e-82b6-cc12eba03e5d
format: single_choice
version: 1
dok: 2
prompt.en: Lan visits a coffee farm in the hills. Which soil will she most likely see?
prompt.vi: Lan đến thăm một vườn cà phê trên đồi. Bạn ấy dễ thấy loại đất nào nhất?
image.brief: [hình vẽ] Một cành cà phê có những chùm quả còn xanh và lá xanh bóng, vẽ gần; nền kem trơn; không thấy đất, không có quả chín đỏ (để màu đỏ không gợi đáp án), không có người, không có chữ. Theo hình designer làm 11/11: không có ảnh cành cà phê chỉ có quả xanh hợp lệ.
image.alt.en: A coffee branch with green berries
image.alt.vi: Cành cà phê có quả còn xanh
hint.en: Think about where coffee grows in Vietnam.
hint.vi: Em nghĩ xem cà phê được trồng nhiều ở đâu nhé.
explanation_correct.en: Yes! Coffee grows on red, crumbly soil.
explanation_correct.vi: Đúng rồi! Cà phê mọc trên đất đỏ tơi xốp.
explanation_wrong.en: The answer is the red crumbly soil.
explanation_wrong.vi: Đáp án là đất đỏ tơi xốp.
> DOK 2: hai bước, từ cây (cà phê) tới vùng (Tây Nguyên) tới vẻ ngoài của đất (ví dụ hai ô Đất đỏ ba-dan). Ba lựa chọn sai là vẻ ngoài của ba loại đất khác: đất phù sa (xám, mịn), đất cát (nhạt, ráp), đất vườn (nâu sẫm, tơi).
> Gợi ý không gọi tên ô Đất đỏ ba-dan, vì chữ "đỏ" có trong nhãn đáp án.
> Bốn lựa chọn là bốn hình vẽ cùng một khung (bàn tay đeo găng cầm một nắm đất), chỉ khác màu và hạt. Bài 13 (câu q5) dùng lại `q4_dark`.

#### option q4_red
correct: true
label.en: red crumbly soil
label.vi: đất đỏ tơi xốp
image.brief: [hình vẽ] Một bàn tay đeo găng làm vườn màu xanh lá, lòng bàn tay ngửa, cầm một nắm đất màu đỏ gạch, tơi thành những cục nhỏ, hạt mịn; vẽ gần, cùng góc, cùng cỡ với ba lựa chọn kia; nền kem trơn; không thấy mặt, không có chữ, không có nhãn trên găng.
image.alt.en: A handful of red crumbly soil
image.alt.vi: Nắm đất đỏ tơi xốp

#### option q4_grey
correct: false
label.en: grey smooth soil
label.vi: đất xám mịn
image.brief: [hình vẽ] Cùng khung với `q4_red`: bàn tay đeo găng xanh lá cầm một nắm đất màu nâu xám, mịn, hơi ẩm, dính thành khối mềm; nền kem trơn; không có chữ.
image.alt.en: A handful of grey smooth soil
image.alt.vi: Nắm đất xám mịn

#### option q4_pale
correct: false
label.en: pale rough soil
label.vi: đất vàng nhạt sờ ráp
image.brief: [hình vẽ] Cùng khung với `q4_red`: bàn tay đeo găng xanh lá cầm một nắm đất màu vàng nhạt, hạt to nhìn rõ từng hạt, rời nhau; nền kem trơn; không có chữ.
image.alt.en: A handful of pale soil with big grains
image.alt.vi: Nắm đất nhạt màu, hạt to

#### option q4_dark
correct: false
label.en: dark crumbly soil
label.vi: đất nâu sẫm tơi xốp
image.brief: [hình vẽ] Cùng khung với `q4_red`: bàn tay đeo găng xanh lá cầm một nắm đất màu nâu sẫm gần đen, tơi thành cục nhỏ, có vài vụn lá mục; nền kem trơn; không có chữ. Bài 13 (câu q5) dùng lại hình này.
image.alt.en: A handful of dark crumbly soil
image.alt.vi: Nắm đất nâu sẫm tơi xốp
> Bốn nhãn cùng dạng "đất + màu + tính chất", không nhãn nào có dấu phẩy.

### q5
id: 2891503e-da64-4585-b266-9733ee366e7f
format: single_choice
version: 1
dok: 2
prompt.en: Mai looks closely at sandy soil and red soil. What are the sandy soil's grains like?
prompt.vi: Mai nhìn kỹ đất cát và đất đỏ. Đất cát có hạt thế nào?
image.brief: Dùng lại hình `magnifying_glass` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): magnifying glass plain background
image.alt.en: A magnifying glass
image.alt.vi: Chiếc kính lúp
hint.en: Remember the Sandy soil picture.
hint.vi: Em nhớ lại ô Đất cát nhé.
explanation_correct.en: Yes! Sandy soil has bigger grains than red soil.
explanation_correct.vi: Đúng rồi! Đất cát có hạt to hơn đất đỏ.
explanation_wrong.en: The answer is bigger grains. Sandy soil feels rough.
explanation_wrong.vi: Đáp án là hạt to hơn. Đất cát sờ thấy ráp.
> DOK 2: so sánh hai loại đất theo một đặc điểm (cỡ hạt), sửa đúng `all_soil_is_same` (ý chính một). "Hạt nhỏ hơn" có sức hút với bé chỉ nhớ "cát là hạt nhỏ"; "hạt bằng nhau" là chính misconception.
> Ba lựa chọn là ba hình vẽ cùng khung: hai đống đất nhỏ cạnh nhau, đống trái đỏ hạt mịn (giống nhau ở cả ba), đống phải nhạt màu, chỉ khác cỡ hạt.
> [CẦN KIỂM] Đất đỏ ba-dan nhiều sét, hạt mịn hơn đất cát.

#### option q5_smaller
correct: false
label.en: smaller grains
label.vi: hạt nhỏ hơn
image.brief: [hình vẽ] Hai đống đất nhỏ cạnh nhau trên nền kem trơn, vẽ gần như soi kính lúp: đống trái màu đỏ gạch, hạt mịn; đống phải màu vàng nhạt, hạt còn mịn hơn đống trái; cùng khung với hai lựa chọn kia; không có chữ, không có kính lúp trong hình.
image.alt.en: Pale soil with grains smaller than the red soil
image.alt.vi: Đất nhạt màu có hạt nhỏ hơn đất đỏ

#### option q5_bigger
correct: true
label.en: bigger grains
label.vi: hạt to hơn
image.brief: [hình vẽ] Cùng khung với `q5_smaller`: đống trái đỏ gạch, hạt mịn; đống phải vàng nhạt, hạt to, rời, nhìn rõ từng hạt; không có chữ.
image.alt.en: Pale soil with grains bigger than the red soil
image.alt.vi: Đất nhạt màu có hạt to hơn đất đỏ

#### option q5_same
correct: false
label.en: same-size grains
label.vi: hạt bằng nhau
image.brief: [hình vẽ] Cùng khung với `q5_smaller`: đống trái đỏ gạch, hạt mịn; đống phải vàng nhạt, hạt mịn đúng bằng đống trái; không có chữ.
image.alt.en: Pale soil with grains the same as the red soil
image.alt.vi: Đất nhạt màu có hạt bằng đất đỏ

### q6
id: cf954b05-91f8-45cd-947b-31029f43c41c
format: true_false
version: 1
dok: 3
misconception: all_soil_is_same
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: This soil feels rough and dries fast. It is sandy soil.
statement.vi: Đất này sờ thấy ráp và mau khô. Đó là đất cát.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
image.brief: [ảnh] Một nắm đất màu nâu nhạt trong lòng bàn tay, chụp gần; chỉ thấy bàn tay, không thấy mặt; không có chữ; không lấy ảnh bãi cát hay cát biển. Từ khoá tìm ảnh (EN): gloved hand holding light brown soil
image.alt.en: A handful of soil in a hand
image.alt.vi: Nắm đất trong lòng bàn tay
hint.en: Remember the Sandy soil and Feel and look pictures.
hint.vi: Em nhớ lại ô Đất cát và ô Sờ và nhìn nhé.
explanation_correct.en: Yes! Big grains feel rough. Water runs out fast.
explanation_correct.vi: Đúng rồi! Hạt to sờ thấy ráp. Nước chảy đi nhanh nên đất mau khô.
explanation_wrong.en: Na is right. Rough soil that dries fast is sandy soil.
explanation_wrong.vi: Na nói đúng. Đất sờ ráp, mau khô là đất cát.
> Lời Na, hình và đáp án Đúng như `_topic.md` (mục "Câu sáu, lời Na" và bảng Đúng/Sai). `alt` không tả "cát". Cả màn mười chín từ EN.
> DOK 3: bé dùng hai bằng chứng (sờ ráp, mau khô) để nhận ra một loại đất. "Sờ ráp" có ở ô Sờ và nhìn; "mau khô" không có ở ô nào, bé phải suy ra từ "hạt to, nhiều khe hở" (ô Đất cát) và bài 11 (nước đi vào khe hở). Bé còn nghĩ đất nào cũng như nhau sẽ chọn "Na chưa đúng".
> Ảnh nắm đất khác ảnh `soil` của bài 11 (đất vườn nâu sẫm) và khác bốn hình vẽ câu q4. Theo ảnh designer chọn 11/11 (USDA NRCS, public domain): tay không đeo găng (không có ảnh hợp lệ tay đeo găng); brief, `alt` sửa theo.

## Từ vựng

### alluvial_soil
id: 730f2bcc-fc9c-4493-940d-30925391f494
tier: core
term.en: alluvial soil
term.vi: đất phù sa
example.en: Rice grows well in alluvial soil.
example.vi: Lúa mọc tốt trên đất phù sa.
image.brief: [ảnh] Mặt ruộng đất phù sa ở đồng bằng vừa được cày, đất nâu xám mịn, ẩm, chụp gần sát mặt ruộng; không có nước đọng, không có vết nứt, không có cây, không có người, không có chữ; cùng kiểu khung với ảnh `tray_red_soil` và `sandy_soil` (ba ảnh mặt đất chụp gần của câu w3). Câu w3 và hình câu q2 dùng lại. Từ khoá tìm ảnh (EN): alluvial soil field close up Mekong Delta
image.alt.en: Soft grey-brown soil in a field
image.alt.vi: Đất nâu xám mềm trên ruộng
> `alt` không gọi tên loại đất, vì ảnh này là lựa chọn câu w3 (luật "câu về tính chất: `alt` chỉ tả màu và hình dáng").

### red_soil
id: fdc5fae2-089c-4f92-a4bf-4150b4ea2d9a
tier: core
term.en: red soil
term.vi: đất đỏ ba-dan
example.en: Coffee grows on red soil in the Central Highlands.
example.vi: Cà phê mọc trên đất đỏ ba-dan ở Tây Nguyên.
image.brief: Dùng lại hình `tray_red_soil` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): red soil field Vietnam basalt
image.alt.en: Red soil in a field
image.alt.vi: Đất đỏ trên ruộng

### sandy_soil
id: f1da9973-3cb2-4874-a614-614e929b42c7
tier: core
term.en: sandy soil
term.vi: đất cát
example.en: Sandy soil has big grains you can see.
example.vi: Đất cát có hạt to, em nhìn thấy được.
image.brief: [ảnh] Mặt đất cát pha ven biển màu vàng nhạt, hạt to nhìn rõ, vài cọng cỏ thưa, chụp gần sát mặt đất; không phải bãi cát biển có sóng, không có vỏ ốc, không có người, không có chữ; cùng kiểu khung với `alluvial_soil` và `tray_red_soil`. Ô `explore_sandy`, câu w3, hình câu q1 dùng lại; bài 14 (từ permeable) và bài 15 (câu w1) dùng lại. Từ khoá tìm ảnh (EN): sandy soil close up coast grains
image.alt.en: Sandy soil with big grains
image.alt.vi: Đất cát hạt to
> Hình gốc bắt buộc (`_topic.md`: 12 · `sandy_soil`). Câu w3 dùng `alt` riêng (không gọi tên loại đất).

### texture
id: 89388d64-3e4a-4ee2-b5d4-32c66e4ab8c9
tier: extra
term.en: texture
term.vi: độ thô mịn khi sờ
example.en: Rub soil in your fingers to feel its texture.
example.vi: Em xoa đất giữa các ngón tay để biết đất thô hay mịn.
image.brief: [hình vẽ] Bàn tay đeo găng làm vườn xoa một nhúm đất giữa ngón cái và ngón trỏ, vài hạt đất rơi xuống, vẽ gần; nền kem trơn; không thấy mặt, không có chữ.
image.alt.en: Gloved fingers rubbing a pinch of soil
image.alt.vi: Ngón tay đeo găng xoa một nhúm đất
> Nghe thử giọng VI đọc `term.vi` (cụm bốn chữ, không có dấu phẩy).

### loam
id: 4ac2b0e0-55e9-4d22-8509-2dee6304e177
tier: extra
term.en: loam
term.vi: đất thịt
example.en: Loam mixes sand, silt, clay and organic matter.
example.vi: Đất thịt trộn lẫn cát, bùn mịn, đất sét và chất hữu cơ.
image.brief: Dùng lại hình `soil` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): hand holding garden soil
image.alt.en: Garden soil in a hand
image.alt.vi: Nắm đất vườn trong lòng bàn tay
> Đất thịt là từ đọc thêm thay cho loại đất thứ tư của Oak (`_topic.md`, Lệch Oak bài 12). [CẦN KIỂM] Đất thịt là hỗn hợp cát, bùn mịn, đất sét và chất hữu cơ.

## Thưởng

### coffee_card
id: 662ea437-993e-4343-b3bc-f3045fe81f8d
set: rocks
rarity: common
name.en: Coffee on red soil
name.vi: Cà phê trên đất đỏ
tag.en: Red soil farms
tag.vi: Vườn trên đất đỏ
fact.en: Red soil in the Central Highlands suits coffee very well. Many coffee farms grow there.
fact.vi: Đất đỏ ba-dan ở Tây Nguyên rất hợp với cây cà phê. Ở đó có rất nhiều vườn cà phê.
> [CẦN KIỂM] Đất đỏ ba-dan ở Tây Nguyên hợp với cây cà phê; Tây Nguyên là vùng trồng cà phê lớn nhất Việt Nam (biên tập nhớ). Thẻ cà phê giữ theo main session 11/11.
> Rà chữ tester 11/11 (N6): `tag` cũ "Central Highlands" · "Tây Nguyên" gắn tên vùng vào ảnh thẻ, trong khi ảnh `tray_coffee` được phép chụp ở nước khác (ảnh Tây Nguyên hợp giấy phép rất hiếm, như ảnh `tray_red_soil` của *Núi lửa* chụp ở Brasil). Biên tập chọn đổi `tag`, không bắt buộc ảnh chụp ở Việt Nam, để người chọn ảnh không bị kẹt. `fact` giữ: câu nói chung về đất đỏ ở Tây Nguyên, không nói ảnh chụp ở đâu. Ảnh designer chọn 11/11 là vườn cà phê ở Việt Nam (CC BY 4.0) nhưng nguồn không ghi vùng, nên vẫn không gắn tên Tây Nguyên vào `tag`.
image.brief: Dùng lại hình `tray_coffee`. Từ khoá tìm ảnh (EN): coffee plantation red soil rows
image.alt.en: Rows of coffee plants on a hill
image.alt.vi: Những hàng cà phê trên đồi

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp cho cảnh nơi chốn, cây trồng, mặt đất; hình vẽ cho hai bộ so sánh đất (câu q4, câu q5) và từ `texture`. Hình không có chữ.
- **Ảnh cần tìm (mười một):**
  - Chơi (sáu): vườn cà phê ở Việt Nam (`tray_coffee`); rừng phi lao trên cát (`tray_casuarina`, Hawaii); mặt sân xi măng (`tray_cement`, ảnh mẫu bề mặt); vườn cây ăn trái trồng thành hàng (`tray_orchard`); quả dưa hấu trên đất cát; nền gạch đỏ lát. Không dùng lại hình vẽ `tray_cement_yard` của bài 6 (kệ toàn ảnh chụp).
  - Quiz (ba): vườn hồ tiêu, luống rau bãi bồi (q3); nắm đất nâu nhạt trong lòng bàn tay, không găng (q6).
  - Từ vựng (hai): mặt ruộng đất phù sa chụp gần (`alluvial_soil`); mặt đất cát pha chụp gần (`sandy_soil`).
- **Hình tự vẽ (chín):** cành cà phê quả xanh (hình câu hỏi q4, không có ảnh hợp lệ), bốn nắm đất câu q4 (`q4_red`, `q4_grey`, `q4_pale`, `q4_dark`; cùng găng xanh lá, cùng góc, cùng cỡ), ba cặp đống đất câu q5, ngón tay xoa đất (`texture`).
- **Dùng lại từ bài khác:** `prediction`, `clay`, `tray_stones`, `tray_rotting_leaves`, `soil`, `silt` của bài 11; `magnifying_glass`, `pumice` của bài 2; `tray_road` của bài 1; `explore_erosion` của bài 7; `q1`, `tray_red_soil`, `tray_dark_rock` của *Bề mặt Trái Đất* bài 4; `q2_rice` của *Khủng long* bài 1. Từ khoá và `alt` của hình bài 1, 2, 7 đã chép theo file của người A, B (11/11).
- **Hình gốc cho bài sau:** `sandy_soil`, `tray_coffee`, `tray_casuarina` (bắt buộc); `q4_dark` (bài 13 câu q5).
- **Khó tìm, phương án thay:**
  - Ảnh Tây Nguyên (đồi cà phê) hợp giấy phép hiếm; dùng vườn cà phê trên đất đỏ ở nước khác, như ảnh `tray_red_soil` (Brasil). Chữ của bài không nói ảnh chụp ở đâu.
  - Rừng phi lao ven biển miền Trung: nhiều ảnh Việt Nam trên Commons là CC BY-SA (bị loại); dùng rừng phi lao trên cát ở nơi khác được.
  - Ba ảnh mặt đất chụp gần của câu w3 (`sandy_soil`, `alluvial_soil`, `tray_red_soil`) phải cùng kiểu khung; ảnh `tray_red_soil` đã có, hai ảnh mới chọn theo khung đó.
- **Cùng kiểu trong một câu:** w1 ba ảnh vật liệu chụp gần (bài 11); w3 ba ảnh mặt đất chụp gần; q1 ba ảnh cây trồng chụp rộng; q2 ba ảnh mẫu chụp gần; q3 bốn ảnh khu trồng cây chụp rộng vừa; q4 bốn hình vẽ cùng khung; q5 ba hình vẽ cùng khung.
- **Kệ Chơi:** chín ảnh chụp cảnh nơi chốn hay mặt nền. Nếu một món phải vẽ thì cả kệ vẽ.
- **Màu:** Học: Đất phù sa `cham`, Đất đỏ ba-dan `do_son`, Đất cát `vang_hoe`, Sờ và nhìn `gi_dong`. Chơi: ba nhóm cùng màu với ô Học tương ứng, nhóm bẫy `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: alluvial_soil, red_soil, sandy_soil).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (mỗi nhóm hai món), một nhóm `limit` (ba món), chín món.
  - Khởi động: `single_choice` (w1, w3; ba lựa chọn), `true_false` (w2, Sai). DOK một. `recall_from.lesson`: `da-va-dat/dat-gom-nhung-gi` (w1, w2), `be-mat-trai-dat/nui-lua` (w3, đã có id).
  - Quiz: `single_choice` (q1 ba lựa chọn, q4 bốn lựa chọn, q5 ba lựa chọn), `fill_blank_bank` (q2, ba thẻ), `multi_choice` (q3, bốn lựa chọn, ba đúng), `true_false` (q6 Đúng, `speaker: na`, `misconception: all_soil_is_same`).
- **Tham chiếu:** chạy `ids` cho bài 11 trước bài này.
- **Vị trí đáp án đúng:** w1 thứ hai; w3 thứ ba; q1 thứ ba; q2 thẻ thứ ba; q3 thứ nhất, ba, bốn; q4 thứ nhất; q5 thứ hai.
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Ruộng lúa đồng bằng, Đồi cà phê, Rừng phi lao → `balanced`;
  - Sân xi măng → `has_limited`;
  - Vườn cây ăn trái, Ruộng lúa đồng bằng, Ruộng dưa hấu (thiếu đất đỏ) → `missing.tray_red_group`;
  - rồi chạm Ruộng vừa cày xới → `full`; bỏ Ruộng lúa đồng bằng, đặt Ruộng vừa cày xới → `balanced`.
- **Số từ EN trên một màn:** Học khoảng ba mươi (mục tiêu 8, hướng dẫn 3, bốn nhãn 8, câu dài nhất 9, ô Từ mới 6). Quiz nhiều chữ nhất: q4 (câu hỏi 15, bốn nhãn 12), q5 (câu hỏi 15, ba nhãn 6), q6 (mười chín).
- **Từ EN có thể ngoài Starters/Movers:** từ mới alluvial soil, red soil, sandy soil, texture, loam; delta, Central Highlands, Mekong, casuarina, crumbly, pepper, rubber, orchard, tarmac, concrete, pumice, lava.
- **Nhãn dài:** "Ruộng lúa đồng bằng" (món Chơi), "Freshly ploughed field". Nhờ tester xem trên iPhone bề rộng nhỏ nhất.
- **Giọng đọc:** "ba-dan" trong chuỗi VI (như *Núi lửa*); EN "Mekong Delta", "Central Highlands", "casuarina". Chuỗi VI không có chữ số, không ký hiệu, không dấu "—".
