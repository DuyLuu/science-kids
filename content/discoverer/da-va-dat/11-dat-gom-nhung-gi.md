---
id: 0130d86c-0c2f-4219-b3f8-d8de4fb7a044
topic: da-va-dat
slug: dat-gom-nhung-gi
order: 11
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: What soils are made from
vi: Đất gồm những gì?
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số mười một).

## Mục tiêu
en: I can say what soil is made of.
vi: Em kể được đất gồm những gì.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn C), chưa duyệt.** Ticket SK-039, ngày 11/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids` sau bài một tới bài mười (câu w1 trỏ bài mười, câu w2 trỏ bài bảy).
> Oak lesson 11 (`what-soils-are-made-from`). Bài mở mạch đất (bài 11 tới 14). Sửa `soil_was_always_there` ở ô "Bits of rock", ô "Organic matter" và câu q6 (gắn key, Na chưa đúng). Hai vế còn lại của misconception Oak ("đất là thứ bẩn bất kỳ dưới chân", "cây làm ra đất") sửa ở nhóm bẫy phần Chơi (rác không phải đất) và ví dụ bốn của ô "Organic matter".

## Ý chính
1.en: In water, soil settles into layers you can see.
1.vi: Cho đất vào nước, đất lắng thành từng lớp em nhìn thấy được.
2.en: Soil has tiny bits of rock, air and water.
2.vi: Đất có những mảnh đá rất nhỏ, không khí và nước.
3.en: Soil also has organic matter from dead plants and animals.
3.vi: Đất còn có chất hữu cơ từ xác cây cối và con vật.
> [CẦN KIỂM] Thứ tự lắng trong lọ (sỏi dưới đáy, rồi cát, bùn mịn, đất sét; vụn lá nổi), tên "bùn mịn" cho silt, "chất hữu cơ" hay "chất mùn" theo sách Khoa học lớp năm (`_topic.md`, bảng Tên gọi).
> Ba ý đi từ thứ em nhìn thấy trong lọ, tới những thành phần của đất, tới phần đến từ sinh vật.

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md` (bài 11 không có w3). Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.
> - w1 ôn bài mười (một ngày trước): Mary Anning tìm thấy gì.
> - w2 ôn bài bảy (khoảng bốn bài trước): phong hoá làm đá vỡ thành mảnh nhỏ, cầu nối sang ô "Bits of rock".

### w1
id: 3b1ffd3e-b042-441e-bf57-18e12f214e5e
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/mary-anning-nguoi-san-hoa-thach
prompt.en: What did Mary Anning find in the cliffs?
prompt.vi: Mary Anning tìm thấy gì ở vách đá?
image.brief: Dùng lại hình `q1_cliffs` ở bài `da-va-dat/mary-anning-nguoi-san-hoa-thach`. Từ khoá tìm ảnh (EN): Lyme Regis cliffs Jurassic Coast
image.alt.en: Layered cliffs by the sea
image.alt.vi: Vách đá nhiều lớp ven biển
hint.en: Remember the story of Mary Anning.
hint.vi: Em nhớ lại câu chuyện về Mary Anning nhé.
explanation_correct.en: Yes! She found sea reptile skeletons in the rock.
explanation_correct.vi: Đúng rồi! Bà tìm thấy bộ xương bò sát biển trong đá.
explanation_wrong.en: The answer is a sea reptile skeleton.
explanation_wrong.vi: Đáp án là bộ xương bò sát biển.
> Ý, thứ tự lựa chọn và vị trí đáp án (chỗ thứ ba) đúng bảng Khởi động. Khủng long đồ chơi có sức hút (bé gắn hoá thạch với khủng long); đồng xu cổ có sức hút (vật cổ đào được, món bẫy bài chín).
> Hình câu hỏi là vách đá ven biển của bài mười (`q1_cliffs`, hình gốc mà câu q6 bài đó dùng lại), không phải đáp án. Từ khoá và `alt` chép từ bài chín, bài mười.
> "Mary Anning" trong chuỗi VI cần dòng `READINGS` như bài mười.
> Rà chữ tester 11/11 (trả lời "Còn chưa chắc" 2): ba ảnh lựa chọn khác nền và cỡ. Theo hình designer làm 11/11 (SK-039, "designer 11/11 · hình bài 8–15"): hai lựa chọn khủng long đồ chơi và đồng xu là hình ghép tách nền, đặt nền kem (`b11-w1_toy.jpg`, `b11-w1_coin.jpg`); brief đổi sang `[sơ đồ ghép ảnh]`, `alt` giữ.

#### option w1_toy
correct: false
label.en: a toy dinosaur
label.vi: khủng long đồ chơi
image.brief: [sơ đồ ghép ảnh] Ảnh khủng long đồ chơi `q6` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`, tách nền, đặt lên nền kem trơn cho cùng khung với hai lựa chọn kia; không có chữ.
image.alt.en: A toy dinosaur on a table
image.alt.vi: Khủng long đồ chơi trên bàn

#### option w1_coin
correct: false
label.en: an old coin
label.vi: đồng xu cổ
image.brief: [sơ đồ ghép ảnh] Ảnh đồng xu cổ `tray_old_coin` ở bài `da-va-dat/nhieu-cach-tao-thanh-hoa-thach`, tách nền trắng, đặt lên nền kem trơn cho cùng khung với hai lựa chọn kia; không có chữ.
image.alt.en: An old coin
image.alt.vi: Đồng xu cổ

#### option w1_skeleton
correct: true
label.en: a sea reptile skeleton
label.vi: bộ xương bò sát biển
image.brief: Dùng lại hình `explore_finds` ở bài `da-va-dat/mary-anning-nguoi-san-hoa-thach`. Từ khoá tìm ảnh (EN): Mary Anning ichthyosaur skeleton Natural History Museum
image.alt.en: A sea reptile skeleton in rock
image.alt.vi: Bộ xương bò sát biển trong đá

### w2
id: 26370c57-c418-4994-9ad0-503c889c2e83
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/da-bi-bao-mon-theo-thoi-gian
prompt.en: Weathering breaks rock into small pieces.
prompt.vi: Phong hoá làm đá vỡ thành những mảnh nhỏ.
image.brief: Dùng lại hình `ha_long` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): Ha Long Bay aerial islands
image.alt.en: Islands in Ha Long Bay
image.alt.vi: Các hòn đảo ở vịnh Hạ Long
answer: true
hint.en: Remember the lesson about weathering.
hint.vi: Em nhớ lại bài học về phong hoá nhé.
explanation_correct.en: Yes! Rock breaks into smaller and smaller pieces.
explanation_correct.vi: Đúng rồi! Đá vỡ thành những mảnh ngày càng nhỏ.
explanation_wrong.en: This is true. Weathering breaks rock into smaller pieces.
explanation_wrong.vi: Câu này đúng. Phong hoá làm đá vỡ thành những mảnh nhỏ hơn.
> Câu `true_false` dùng đúng chữ EN ở bảng Khởi động và bảng Đúng/Sai (bài 11 w2, Đúng).
> Hình câu hỏi là núi đá vôi trên biển (đá còn nguyên khối), không dùng `explore_weathering` (hình đá nứt là bằng chứng của câu, `_topic.md` bảng Hình dùng chung). Giải thích khi đúng không nói "thành đất", để câu q6 còn là việc bé tự nối.

## Học

> Bốn ô, từ thứ em thấy trong lọ tới phần đến từ sinh vật:
> - Lọ đất lắng (ý chính một): lắc đất trong lọ nước, chờ, đất lắng thành lớp; dự đoán trước khi xem;
> - Mảnh đá (ý chính hai): đá vỡ vụn rất chậm thành sỏi, cát, bùn mịn, đất sét, từ to tới rất nhỏ; nối bài bảy;
> - Chất hữu cơ (ý chính ba): lá rụng, rễ cây, xác con vật nhỏ mục dần vào đất; đất còn cần mảnh đá (sửa ý "cây làm ra đất");
> - Khe hở nhỏ (ý chính hai): giữa các hạt đất có khe hở chứa không khí và nước.
> Tên ô thứ tư đổi từ "Air and water" · "Không khí và nước" (`_topic.md`) thành "Tiny spaces" · "Khe hở nhỏ", giữ ý: câu q5 có đáp án "không khí" và gợi ý trỏ về ô này, nên tên ô không được chứa chữ của nhãn đáp án.
> Không ô nào nói "đất hình thành rất chậm" hay "đất không có sẵn từ đầu": câu q6 để bé tự nối ô Mảnh đá với ô Chất hữu cơ (rút kinh nghiệm SK-036 N2).

### explore
id: 8de47f17-7ba9-4b23-8b4f-c1aed0c58852
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_jar
label.en: Jar test
label.vi: Lọ đất lắng
color: cham
sentence.en: Soil in a jar of water settles into layers.
sentence.vi: Đất trong lọ nước lắng dần thành từng lớp.
image.brief: [hình vẽ] Hình gốc bộ "Lọ đất": một lọ nhựa trong có nắp, đầy nước, đất đã lắng thành từng lớp rõ: dưới đáy là sỏi nhỏ, trên đó là lớp cát, rồi lớp bùn mịn, trên cùng là lớp đất sét mỏng; nước phía trên hơi đục, vài vụn lá nổi trên mặt nước; vẽ ngang tầm mắt, nền kem trơn; không có tay, không có người, không có vạch số, không nhãn, không chữ, không mũi tên. Bài 15 (câu q3) dùng lại hình này.
image.alt.en: A jar of water with layers of soil
image.alt.vi: Lọ nước có đất lắng thành từng lớp
examples.1.en: predict first, then watch
examples.1.vi: dự đoán trước, rồi quan sát
examples.2.en: shake it, then wait a long time
examples.2.vi: lắc đều, rồi chờ thật lâu
examples.3.en: heavy bits sink first
examples.3.vi: hạt nặng chìm xuống trước
examples.4.en: bits of leaf float on top
examples.4.vi: vụn lá nổi lên trên mặt nước
> [CẦN KIỂM] Thứ tự lắng trong lọ và việc vụn lá nổi; thời gian chờ (biên tập nhớ khoảng một giờ cho sỏi, cát, bùn mịn; đất sét có khi cả ngày). Ô không nói "sỏi ở dưới đáy" thành chữ: câu q4 để bé tự ghép ví dụ ba với ô Mảnh đá; hình thì thấy thứ tự.
> Ví dụ một dạy từ `prediction` (từ đọc thêm).

#### group explore_rock_bits
label.en: Bits of rock
label.vi: Mảnh đá
color: nau_dat
sentence.en: Over a very long time, rock breaks into tiny bits.
sentence.vi: Qua thời gian rất dài, đá vỡ vụn thành những mảnh rất nhỏ.
image.brief: [sơ đồ ghép ảnh] Bốn hình vẽ xếp thành lưới hai hàng, hai cột trên cùng nền kem trơn, hạt nhỏ dần theo thứ tự đọc: hàng trên `tray_stones`, `tray_sand`; hàng dưới `q2_silt`, `clay`; không có chữ, không có mũi tên, không có thước đo.
image.alt.en: Small stones, sand, silt and clay
image.alt.vi: Sỏi nhỏ, cát, bùn mịn và đất sét
> Theo hình designer làm 11/11: ghép bốn hình vẽ của bài (bùn mịn là hình vẽ `q2_silt`, không phải ảnh `silt`), lưới hai hàng hai cột vì ô Học hiện ô vuông.
examples.1.en: small stones
examples.1.vi: sỏi nhỏ
examples.2.en: sand
examples.2.vi: cát
examples.3.en: silt, smaller than sand
examples.3.vi: bùn mịn, hạt nhỏ hơn cát
examples.4.en: clay, the tiniest bits
examples.4.vi: đất sét, hạt nhỏ nhất
> Nối bài bảy (phong hoá làm đá vỡ thành mảnh nhỏ) mà không dạy lại. [CẦN KIỂM] Cỡ hạt từ to tới nhỏ: sỏi, cát, bùn mịn, đất sét.

#### group explore_organic
label.en: Organic matter
label.vi: Chất hữu cơ
color: gi_dong
sentence.en: Dead leaves and roots slowly rot into the soil.
sentence.vi: Lá rụng và rễ cây chết mục dần vào trong đất.
image.brief: [ảnh] Mặt cắt lớp đất mặt ở vườn: phần trên sẫm màu, lẫn nhiều rễ cây nhỏ và vụn lá đang mục, phần dưới nhạt hơn; chụp ngang mặt cắt, gần; không có người, không có dụng cụ, không có thước, không có chữ. Từ organic_matter và bài 15 (câu q5) dùng lại. Từ khoá tìm ảnh (EN): topsoil roots organic matter soil profile
image.alt.en: Dark topsoil with roots and bits of leaf
image.alt.vi: Lớp đất mặt sẫm màu có rễ cây và vụn lá
examples.1.en: rotting leaves
examples.1.vi: lá mục
examples.2.en: tiny dead animals
examples.2.vi: xác những con vật nhỏ
examples.3.en: it makes soil darker
examples.3.vi: làm đất sẫm màu hơn
examples.4.en: soil needs rock bits, too
examples.4.vi: đất còn cần cả mảnh đá
> [CẦN KIỂM] Chất hữu cơ làm đất sẫm màu hơn (ví dụ ba). Ví dụ bốn sửa vế "cây làm ra đất" của misconception Oak bằng câu khẳng định.
> Ảnh ô này là mặt cắt lớp đất có rễ, khác ảnh `tray_rotting_leaves` (nắm lá mục), để mỗi vật một ảnh và hai ảnh không trùng vai trong Quiz.

#### group explore_spaces
label.en: Tiny spaces
label.vi: Khe hở nhỏ
color: vang_hoe
sentence.en: Soil has tiny spaces with air and water in them.
sentence.vi: Trong đất có những khe hở nhỏ chứa không khí và nước.
image.brief: [hình vẽ] Mặt cắt phóng to một nhúm đất: những hạt đất nâu to nhỏ khác nhau xếp lỏng, giữa các hạt có khe hở; vài khe có nước màu xanh nhạt bám quanh hạt, các khe khác để trống màu kem nhạt; nền kem trơn; không có bọt khí, không có kính lúp, không có mũi tên, không có chữ.
image.alt.en: Bits of soil with tiny spaces between them
image.alt.vi: Những hạt đất với khe hở nhỏ ở giữa
examples.1.en: spaces between the bits
examples.1.vi: khe hở giữa các hạt đất
examples.2.en: rain soaks into the spaces
examples.2.vi: nước mưa thấm vào khe hở
examples.3.en: air fills the dry spaces
examples.3.vi: không khí nằm trong những khe hở khô
examples.4.en: roots need air and water
examples.4.vi: rễ cây cần cả không khí và nước
> Hình không vẽ bọt khí và ô không nói "bọt khí nổi lên": câu q5 để bé tự suy ra bong bóng là không khí thoát ra. [CẦN KIỂM] Ví dụ bốn (rễ cây cần không khí và nước), chuẩn bị bài 13.

### new_words
id: 659c3cdd-121d-43eb-b998-40c46dc47255
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: soil, silt, organic_matter

## Chơi

> Bé tìm ba thứ tạo nên đất: một mảnh đá, một thứ hữu cơ, một thứ là nước. Đạt khi đủ ba nhóm và không chọn rác. Chạm hình đã chọn để bỏ ra.
> Không khí khó chụp nên nhóm thứ ba chỉ là "Nước" (`_topic.md`); không khí nằm ở ô "Tiny spaces" và câu q5.
> Ba món bẫy là rác hay gặp trong đất vườn (túi nhựa, chai nhựa, vỏ lon): sửa vế "đất là bất cứ thứ gì dưới chân" của Oak. Mỗi món giống một nhóm ở một điểm: túi nhựa nằm lẫn với lá, chai nhựa từng đựng nước, vỏ lon cứng như sỏi.

### tray
id: ff004606-3079-4fef-961b-cb52237ce02d
type: build_tray
version: 1
prompt.en: Find three things that make soil
prompt.vi: Tìm ba thứ tạo nên đất
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find bits of rock, organic matter and water.
messages.start.vi: Em tìm mảnh đá, chất hữu cơ và nước nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! These all mix together in soil.
messages.balanced.vi: Tuyệt! Những thứ này trộn lẫn với nhau trong đất.
messages.has_limited.en: That is rubbish. It is not part of soil.
messages.has_limited.vi: Đó là rác, không phải thành phần của đất.
messages.missing.tray_rock_group.en: You still need tiny bits of rock.
messages.missing.tray_rock_group.vi: Em còn thiếu những mảnh đá nhỏ.
messages.missing.tray_organic_group.en: You still need something rotting from plants.
messages.missing.tray_organic_group.vi: Em còn thiếu thứ đang mục từ cây cối.
messages.missing.tray_water_group.en: You still need water.
messages.missing.tray_water_group.vi: Em còn thiếu nước.

#### group tray_rock_group
label.en: Bits of rock
label.vi: Mảnh đá
color: do_son
role: required

#### group tray_organic_group
label.en: Organic matter
label.vi: Chất hữu cơ
color: gi_dong
role: required

#### group tray_water_group
label.en: Water
label.vi: Nước
color: cham
role: required

#### group tray_not_soil
label.en: Not part of soil
label.vi: Không phải thành phần của đất
color: nau_dat
role: limit
> Nhãn `limit` dạng "Not …" · "Không …", gọi tên loại, không gọi tên món bẫy. Dòng điều kiện sẽ là "Cần đủ Mảnh đá, Chất hữu cơ, Nước · Không phải thành phần của đất".

#### item tray_sand
label.en: Sand
label.vi: Cát
group: tray_rock_group
image.brief: [hình vẽ] Một nắm cát vàng nâu đổ thành đống nhỏ, vẽ gần từ trên xuống, thấy rõ từng hạt cát, nền kem trơn; không có vỏ ốc, không có tay, không có chữ. Ô `explore_rock_bits`, câu q1 và bài 14 (câu q5) dùng lại. Từ khoá tìm ảnh (EN): pile of sand close up grains
image.alt.en: A small pile of sand
image.alt.vi: Một đống cát nhỏ

#### item tray_rotting_leaves
label.en: Rotting leaves
label.vi: Lá mục
group: tray_organic_group
image.brief: [hình vẽ] Một nắm lá mục nâu đen đã nát vụn một phần, nằm trên mặt đất ẩm, vẽ gần từ trên xuống; không có rác, không có tay, không có chữ. Câu q1 dùng lại; bài 12 (câu w1) và bài 13 (kệ Chơi, từ nutrient) dùng lại. Từ khoá tìm ảnh (EN): rotting leaves on soil close up
image.alt.en: A pile of rotting leaves
image.alt.vi: Một nắm lá mục

#### item tray_rain
label.en: Rain
label.vi: Nước mưa
group: tray_water_group
image.brief: [hình vẽ] Những giọt mưa rơi xuống mặt đất vườn, nước bắn lên thành tia nhỏ, vẽ gần, ngang mặt đất; không có người, không có chữ. Từ khoá tìm ảnh (EN): raindrops falling on soil close up
image.alt.en: Raindrops falling on soil
image.alt.vi: Giọt mưa rơi xuống đất

#### item tray_plastic_bag
label.en: Plastic bag
label.vi: Túi nhựa
group: tray_not_soil
image.brief: [hình vẽ] Một túi nhựa nhàu nằm trên mặt đất, vẽ gần; không có chữ, không có nhãn hiệu, không có hình in trên túi. Câu q3 dùng lại. Từ khoá tìm ảnh (EN): plastic bag litter on ground
image.alt.en: A plastic bag on the ground
image.alt.vi: Túi nhựa nằm trên đất

#### item tray_stones
label.en: Small stones
label.vi: Sỏi nhỏ
group: tray_rock_group
image.brief: [hình vẽ] Một đống sỏi nhỏ màu xám nâu, mỗi viên cỡ hạt ngô, vẽ gần từ trên xuống, nền kem trơn; không có tay, không có chữ, không có thước. Ô `explore_rock_bits`, câu q1 và bài 12 (câu w1) dùng lại. Từ khoá tìm ảnh (EN): small gravel stones pile close up
image.alt.en: A small pile of little stones
image.alt.vi: Một đống sỏi nhỏ

#### item tray_rotting_twig
label.en: Rotting twig
label.vi: Cành cây mục
group: tray_organic_group
image.brief: [hình vẽ] Một cành cây khô đã mục, vỏ bong, có rêu, nằm trên mặt đất ẩm, vẽ gần; không có tay, không có chữ. Từ khoá tìm ảnh (EN): rotting twig on ground moss
image.alt.en: A rotting twig on the ground
image.alt.vi: Cành cây mục trên mặt đất

#### item tray_watering
label.en: Water for plants
label.vi: Nước tưới cây
group: tray_water_group
image.brief: [hình vẽ] Một bình tưới rót nước xuống gốc cây rau trên luống đất, chỉ thấy vòi bình và dòng nước, không thấy tay; bình không có nhãn hiệu, không có chữ. Bài 13 (kệ Chơi, câu q5) dùng lại. Từ khoá tìm ảnh (EN): watering can pouring water soil plant
image.alt.en: Water pouring from a watering can
image.alt.vi: Nước chảy từ bình tưới

#### item tray_bottle
label.en: Plastic bottle
label.vi: Chai nhựa
group: tray_not_soil
image.brief: [hình vẽ] Một chai nhựa rỗng không có nhãn nằm trên mặt đất, vẽ gần; không có chữ, không có nhãn hiệu, không có nắp có chữ. Từ khoá tìm ảnh (EN): empty plastic bottle on ground litter
image.alt.en: A plastic bottle on the ground
image.alt.vi: Chai nhựa nằm trên đất

#### item tray_can
label.en: Drink can
label.vi: Vỏ lon
group: tray_not_soil
image.brief: [hình vẽ] Một vỏ lon nhôm trơn bị bẹp nằm trên mặt đất, không có chữ, không có logo; vẽ gần. Từ khoá tìm ảnh (EN): crushed can on ground litter
image.alt.en: A crushed can on the ground
image.alt.vi: Vỏ lon bẹp nằm trên đất

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình.
> Vị trí đáp án đúng bảng `_topic.md`: q1 chỗ thứ hai; q2 thẻ thứ ba; q3 chỗ thứ nhất, hai, ba; q4 chỗ thứ ba; q5 chỗ thứ nhất.
> Không hình lựa chọn nào xuất hiện ở hai câu (kể cả câu Khởi động). Ba hình câu q1 đều là món kệ Chơi (bé đã thấy cả ba), nên đáp án không là hình duy nhất bé đã gặp.

### q1
id: bd0bb595-e733-4ac4-8c9c-b4de5d99aad8
format: single_choice
version: 1
dok: 1
prompt.en: Soil settles in a jar of water. What floats on top?
prompt.vi: Đất lắng trong lọ nước. Thứ gì nổi lên trên cùng?
image.brief: Dùng lại hình `prediction`.
image.alt.en: A jar of muddy water, just shaken
image.alt.vi: Lọ nước đục vừa lắc xong
hint.en: Remember the Jar test picture.
hint.vi: Em nhớ lại ô Lọ đất lắng nhé.
explanation_correct.en: Yes! Bits of leaf are light, so they float.
explanation_correct.vi: Đúng rồi! Vụn lá nhẹ nên nổi lên.
explanation_wrong.en: The answer is rotting leaves. They are light.
explanation_wrong.vi: Đáp án là lá mục. Lá mục nhẹ nên nổi lên.
> Câu nhớ lại ví dụ bốn ô Lọ đất lắng. Hình câu hỏi là lọ vừa lắc (chưa thấy lớp, chưa thấy lá nổi), không lộ đáp án. Câu w1 bài 12 hỏi vế còn lại (thứ gì chìm xuống đáy).

#### option q1_stones
correct: false
label.en: small stones
label.vi: sỏi nhỏ
image.brief: Dùng lại hình `tray_stones`. Từ khoá tìm ảnh (EN): small gravel stones pile close up
image.alt.en: A small pile of little stones
image.alt.vi: Một đống sỏi nhỏ

#### option q1_leaves
correct: true
label.en: rotting leaves
label.vi: lá mục
image.brief: Dùng lại hình `tray_rotting_leaves`. Từ khoá tìm ảnh (EN): rotting leaves on soil close up
image.alt.en: A pile of rotting leaves
image.alt.vi: Một nắm lá mục

#### option q1_sand
correct: false
label.en: sand
label.vi: cát
image.brief: Dùng lại hình `tray_sand`. Từ khoá tìm ảnh (EN): pile of sand close up grains
image.alt.en: A small pile of sand
image.alt.vi: Một đống cát nhỏ

### q2
id: 88eaf089-5744-4f64-a9c4-0f2501cb7a7f
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `soil`. Từ khoá tìm ảnh (EN): hand holding garden soil
image.alt.en: Garden soil in a hand
image.alt.vi: Nắm đất vườn trong lòng bàn tay
sentence.en: The tiniest bits of rock in soil are {1}.
sentence.vi: Những mảnh đá nhỏ nhất trong đất là {1}.
answers: q2_clay
hint.en: Remember the Bits of rock picture.
hint.vi: Em nhớ lại ô Mảnh đá nhé.
explanation_correct.en: Yes! Clay bits are tinier than silt and sand.
explanation_correct.vi: Đúng rồi! Hạt đất sét còn nhỏ hơn bùn mịn và cát.
explanation_wrong.en: The answer is clay. Its bits are the tiniest.
explanation_wrong.vi: Đáp án là đất sét. Hạt đất sét nhỏ nhất.
> Câu nhớ lại ví dụ bốn ô Mảnh đá. Bùn mịn là thẻ sai có sức hút mạnh (cũng rất nhỏ); chất hữu cơ có sức hút (cũng là những mảnh nhỏ trong đất, nhưng không phải đá). Câu không chứa chữ "clay".

#### bank q2_silt
label.en: silt
label.vi: bùn mịn
image.brief: [hình vẽ] Một khoảng bùn mịn màu xám, mặt láng và mịn, hơi ẩm, vẽ gần từ trên xuống, cùng nét và cùng khung với hai thẻ kia; nền kem trơn; không có vết nứt, không có chữ. Ô `explore_rock_bits` và bài 14 (câu q5) dùng lại.
image.alt.en: Smooth silt
image.alt.vi: Lớp bùn mịn
> Theo hình designer làm 11/11: ba thẻ câu q2 cùng là hình vẽ (đất sét chỉ vẽ được), nên bùn mịn và chất hữu cơ là hình vẽ riêng; ảnh `silt`, `explore_organic` giữ cho từ vựng và ô Học.

#### bank q2_organic
label.en: organic matter
label.vi: chất hữu cơ
image.brief: [hình vẽ] Mặt cắt một khoảnh đất mặt sẫm màu, lẫn rễ cây nhỏ và vụn lá đang mục, vẽ gần, cùng nét và cùng khung với hai thẻ kia; nền kem trơn; không có chữ.
image.alt.en: Dark topsoil with roots and bits of leaf
image.alt.vi: Lớp đất mặt sẫm màu có rễ cây và vụn lá

#### bank q2_clay
label.en: clay
label.vi: đất sét
image.brief: Dùng lại hình `clay`. Từ khoá tìm ảnh (EN): lump of wet clay soil
image.alt.en: A lump of soft clay
image.alt.vi: Một khối đất sét dẻo

### q3
id: f86b55d9-8a78-4268-8260-de868ab7b541
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones will rot into organic matter?
prompt.vi: Những thứ nào sẽ mục dần thành chất hữu cơ?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `tray_rotting_twig`. Từ khoá tìm ảnh (EN): rotting twig on ground moss
image.alt.en: A rotting twig on the ground
image.alt.vi: Cành cây mục trên mặt đất
hint.en: Remember the Organic matter picture.
hint.vi: Em nhớ lại ô Chất hữu cơ nhé.
explanation_correct.en: Yes! Things from plants rot and become soil.
explanation_correct.vi: Đúng rồi! Những thứ từ cây cối mục dần thành một phần của đất.
explanation_wrong.en: The answers are the leaf, the peel and the root.
explanation_wrong.vi: Đáp án là chiếc lá, vỏ chuối và đoạn rễ cây.
> DOK 2: phân loại những vật mới (vỏ chuối chưa có ở bài) theo ý "từ sinh vật thì mục thành chất hữu cơ". Ba đáp án đúng, một sai (bài 11 là một trong bốn bài có câu ba đáp án, bảng vị trí ở `_topic.md`).
> Túi nhựa là món bẫy kệ Chơi, ở đây vẫn là lựa chọn sai (cùng vai). Có sức hút vì nằm trong đất lâu ngày như lá.
> Bốn hình cùng kiểu: một vật nằm trên mặt đất, chụp gần.
> Rà chữ tester 11/11 (n9): hình câu hỏi đổi từ `soil` sang `tray_rotting_twig` (món kệ Chơi, không làm lựa chọn ở câu nào), để năm câu Quiz không chỉ dùng hai hình câu hỏi.

#### option q3_leaf
correct: true
label.en: a fallen leaf
label.vi: chiếc lá rụng
image.brief: [hình vẽ] Một chiếc lá khô màu nâu vàng vừa rụng nằm trên mặt đất, vẽ gần từ trên xuống, cùng nét với ba lựa chọn kia; không có chữ.
image.alt.en: A dry fallen leaf
image.alt.vi: Chiếc lá khô vừa rụng
> Theo hình designer làm 11/11: câu q3 vẽ cả bốn lựa chọn (túi nhựa là hình vẽ của kệ Chơi), nên chiếc lá là hình vẽ riêng, không dùng lại ảnh `tray_dry_leaf` của bài 8.

#### option q3_peel
correct: true
label.en: a banana peel
label.vi: vỏ chuối
image.brief: [hình vẽ] Một vỏ chuối đã thâm nâu nằm trên mặt đất, vẽ gần; không có nhãn dán, không có chữ, không có tay. Từ khoá tìm ảnh (EN): banana peel on soil
image.alt.en: A banana peel on the ground
image.alt.vi: Vỏ chuối nằm trên đất

#### option q3_root
correct: true
label.en: an old root
label.vi: đoạn rễ cây khô
image.brief: [hình vẽ] Một đoạn rễ cây khô màu nâu nằm trên mặt đất, vẽ gần; không có tay, không có dụng cụ, không có chữ. Từ khoá tìm ảnh (EN): dead tree root on ground close up
image.alt.en: An old root on the ground
image.alt.vi: Đoạn rễ cây khô nằm trên đất

#### option q3_bag
correct: false
label.en: a plastic bag
label.vi: túi nhựa
image.brief: Dùng lại hình `tray_plastic_bag`. Từ khoá tìm ảnh (EN): plastic bag litter on ground
image.alt.en: A plastic bag on the ground
image.alt.vi: Túi nhựa nằm trên đất

### q4
id: 4ac2fe2e-b72f-4231-b324-897a9e053376
format: single_choice
version: 1
dok: 2
prompt.en: Mai's soil has small stones, sand and clay. Which jar shows it after waiting?
prompt.vi: Đất của Mai có sỏi nhỏ, cát và đất sét. Lọ nào cho thấy đất đó sau khi chờ?
image.brief: Dùng lại hình `prediction`.
image.alt.en: A jar of muddy water, just shaken
image.alt.vi: Lọ nước đục vừa lắc xong
hint.en: Remember the sizes in the Bits of rock picture.
hint.vi: Em nhớ lại cỡ hạt ở ô Mảnh đá nhé.
explanation_correct.en: Yes! Heavy stones sink first. Clay settles last, on top.
explanation_correct.vi: Đúng rồi! Sỏi nặng chìm xuống trước. Đất sét lắng sau cùng, nằm trên.
explanation_wrong.en: The answer is the jar with stones at the bottom.
explanation_wrong.vi: Đáp án là lọ có sỏi ở dưới đáy.
> DOK 2: dự đoán cho một mẫu đất mới (không có lá), ghép ví dụ ba ô Lọ đất lắng ("hạt nặng chìm trước") với ô Mảnh đá (sỏi to nhất, đất sét nhỏ nhất). Ô Học không viết thành chữ "sỏi ở dưới đáy".
> Ba lựa chọn là ba bản của cùng một lọ (bộ "Lọ đất"), chỉ khác lớp nào ở dưới đáy; nhãn gọi tên lớp đáy, không gọi vị trí thẻ.
> Rà chữ tester 11/11 (n10): gợi ý cũ "Remember: heavy bits sink first." chép nguyên ví dụ ba ô Lọ đất lắng, gần như trả lời hộ. Gợi ý mới trỏ ô Mảnh đá (cỡ hạt); bé tự ghép với "hạt nặng chìm trước".

#### option q4_clay_bottom
correct: false
label.en: clay at the bottom
label.vi: đất sét ở dưới đáy
image.brief: [hình vẽ] Cùng nét bộ "Lọ đất", cùng lọ, cùng góc với hai lựa chọn kia: nước trong ở trên, ba lớp đã lắng: dưới đáy là đất sét nâu xám mịn, giữa là cát, trên cùng là sỏi nhỏ; không có vụn lá; nền kem trơn; không có tay, không có vạch số, không có chữ.
image.alt.en: A jar with clay at the bottom
image.alt.vi: Lọ có đất sét ở dưới đáy

#### option q4_sand_bottom
correct: false
label.en: sand at the bottom
label.vi: cát ở dưới đáy
image.brief: [hình vẽ] Cùng nét bộ "Lọ đất", cùng lọ, cùng góc: nước trong ở trên, ba lớp: dưới đáy là cát vàng nâu, giữa là sỏi nhỏ, trên cùng là đất sét; không có vụn lá; nền kem trơn; không có tay, không có vạch số, không có chữ.
image.alt.en: A jar with sand at the bottom
image.alt.vi: Lọ có cát ở dưới đáy

#### option q4_stones_bottom
correct: true
label.en: stones at the bottom
label.vi: sỏi ở dưới đáy
image.brief: [hình vẽ] Cùng nét bộ "Lọ đất", cùng lọ, cùng góc: nước hơi đục ở trên, ba lớp: dưới đáy là sỏi nhỏ, giữa là cát, trên cùng là lớp đất sét mỏng; không có vụn lá (khác hình `explore_jar`); nền kem trơn; không có tay, không có vạch số, không có chữ.
image.alt.en: A jar with stones at the bottom
image.alt.vi: Lọ có sỏi ở dưới đáy
> [CẦN KIỂM] Thứ tự lắng sỏi, cát, đất sét (như ô Lọ đất lắng).

### q5
id: 1af61df3-a3ae-48af-8185-c2432046d186
format: single_choice
version: 1
dok: 2
prompt.en: Lan pours water on dry soil. Bubbles come up. What was in the soil before?
prompt.vi: Lan đổ nước vào đất khô. Những bong bóng nhỏ nổi lên. Trước đó trong đất có gì?
image.brief: [hình vẽ] Cùng nét bộ "Lọ đất": một cốc nhựa trong đựng đất khô, một ca nhựa đang rót nước vào, mấy bong bóng nhỏ nổi lên mặt nước trong cốc; chỉ thấy ca nước, không thấy tay; nền kem trơn; không có vạch số, không có chữ.
image.alt.en: Water poured on dry soil, with bubbles
image.alt.vi: Nước rót vào đất khô, có bong bóng nổi lên
hint.en: Remember the Tiny spaces picture.
hint.vi: Em nhớ lại ô Khe hở nhỏ nhé.
explanation_correct.en: Yes! Water pushed the air out of the spaces.
explanation_correct.vi: Đúng rồi! Nước đẩy không khí ra khỏi các khe hở.
explanation_wrong.en: The answer is air. It was in the tiny spaces.
explanation_wrong.vi: Đáp án là không khí. Không khí nằm sẵn trong các khe hở nhỏ.
> DOK 2: suy ra từ bằng chứng (bong bóng) điều ô Khe hở nhỏ nói (khe hở khô chứa không khí). Nước là lựa chọn sai có sức hút (Lan vừa đổ nước vào), nhưng đề bài nói đất khô; xà phòng có sức hút vì bé gắn bong bóng với xà phòng.
> Chữ VI dùng "bong bóng nhỏ", không dùng "bọt khí" (bảng Tên gọi): chữ "khí" trong "bọt khí" lộ đáp án "không khí" khi bé nghe tiếng Việt. Chữ EN "bubbles" giữ (đã học ở bài năm).
> [CẦN KIỂM] Bong bóng khi đổ nước vào đất khô là không khí trong khe hở bị nước đẩy ra (biên tập nhớ, Oak ghi cùng ý ở quiz lesson 11).

#### option q5_air
correct: true
label.en: air
label.vi: không khí
image.brief: [hình vẽ] Một quả bóng bay màu đỏ căng tròn, có dây buộc thả xuống, vẽ trên nền kem trơn, cùng nét và cùng cỡ với cốc nước và bánh xà phòng; bóng không in chữ, không in hình; không có tay.
image.alt.en: A red balloon
image.alt.vi: Quả bóng bay màu đỏ
> Theo hình designer làm 11/11: cốc nước `q1_water` của bài 3 là hình vẽ, nên ba lựa chọn câu q5 cùng vẽ; bóng bay vẽ riêng, không dùng lại ảnh `w1_balloon` của *Hô hấp*.

#### option q5_water
correct: false
label.en: water
label.vi: nước
image.brief: Dùng lại hình `q1_water` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): clear plastic cup of water plain background
image.alt.en: A plastic cup of water
image.alt.vi: Cốc nhựa đựng nước
> Rà chữ (theo đề xuất của người A ở SK-039, tester n10 bài 1–8): đổi từ cốc thuỷ tinh `w1_water` của *Hô hấp* sang cốc nhựa `q1_water` của bài 3, để cả chủ đề dùng một ảnh cốc nước và khớp mục An toàn (thử nước bằng cốc nhựa).

#### option q5_soap
correct: false
label.en: soap
label.vi: xà phòng
image.brief: [hình vẽ] Một bánh xà phòng trơn màu trắng đặt trên nền kem trơn, vẽ chéo, cùng nét và cùng cỡ trong khung như quả bóng bay và cốc nước; không có chữ hay hình in trên bánh, không có bao bì, không có bọt.
image.alt.en: A bar of soap
image.alt.vi: Bánh xà phòng
> Bóng bay gợi lại câu w1 *Hô hấp* bài một (câu "vật nào chứa đầy không khí"), nên bé đã quen bóng bay đứng cho không khí.

### q6
id: 353632ff-1364-4aa7-a1e6-60dcbb200cca
format: true_false
version: 1
dok: 3
misconception: soil_was_always_there
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: The soil in Grandma's garden is as old as Earth.
statement.vi: Đất trong vườn nhà bà cũng lâu đời như Trái Đất.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
image.brief: [ảnh] Một góc vườn rau: mấy luống cải xanh trên đất nâu, chụp ngang; không có người, không có chữ, không có biển; không bắt buộc ảnh Việt Nam (chữ câu hỏi chỉ nói "vườn nhà bà"). Từ khoá tìm ảnh (EN): vegetable garden beds village Vietnam
image.alt.en: A vegetable garden
image.alt.vi: Góc vườn rau
hint.en: Think about what soil is made from.
hint.vi: Em nghĩ xem đất được tạo nên từ những gì nhé.
explanation_correct.en: Soil forms slowly from rock bits and rotting plants.
explanation_correct.vi: Đất hình thành rất chậm, từ mảnh đá vụn và cây cối mục.
explanation_wrong.en: Na is not right. Soil is made slowly, over time.
explanation_wrong.vi: Na chưa đúng. Đất được tạo nên rất chậm, qua thời gian dài.
> Lời Na, hình và đáp án Sai đúng như `_topic.md` (mục "Câu sáu, lời Na" và bảng Đúng/Sai). Cả màn mười tám từ EN.
> DOK 3: bé đánh giá một kết luận. Ô Học không nói "đất hình thành chậm"; bé phải nối ô Mảnh đá (đá vỡ vụn qua thời gian rất dài) với ô Chất hữu cơ (cây cối, con vật mục dần) để thấy đất được tạo nên dần, không có sẵn từ đầu.
> Giải thích khi đúng không mở đầu bằng "Yes!" (đáp án Sai). Không đưa con số năm (`_topic.md`, ghi chú của `soil_was_always_there`).

## Từ vựng

### soil
id: 00b24c80-6218-4dcb-b358-ea065af4d004
tier: core
term.en: soil
term.vi: đất
example.en: Our vegetables grow in soil.
example.vi: Rau nhà em mọc trên đất vườn.
image.brief: [ảnh] Một nắm đất vườn nâu sẫm, tơi, trong lòng bàn tay, chụp gần; chỉ thấy bàn tay, không thấy mặt; không có chữ. Câu q2 dùng lại; bài 12 (câu w2, từ loam), bài 13 (câu w2, q3) và bài 15 (câu q5) dùng lại. Từ khoá tìm ảnh (EN): hand holding garden soil
image.alt.en: Garden soil in a hand
image.alt.vi: Nắm đất vườn trong lòng bàn tay
> Hình gốc bắt buộc (`_topic.md`, bảng Hình dùng chung: 11 · `soil`). Theo ảnh designer chọn 11/11 (USDA NRCS, public domain): tay không đeo găng, vì không có ảnh hợp lệ tay đeo găng; brief và `alt` sửa theo. Mục An toàn của `_topic.md` dặn cầm đất thì đeo găng: chữ của bài 12, 14 vẫn dặn đeo găng; ảnh này chỉ minh hoạ đất. Duy xem có chấp nhận không.

### silt
id: 31bff785-f750-4476-bb7d-5227a4c553dc
tier: core
term.en: silt
term.vi: bùn mịn
example.en: Silt bits are smaller than sand.
example.vi: Hạt bùn mịn nhỏ hơn hạt cát.
image.brief: [ảnh] Lớp bùn mịn màu xám nơi lòng hồ chứa cũ đã rút nước, mặt bùn láng và mịn, chụp gần; không có vết nứt lớn (để không lẫn với đất khô hạn), không có dấu chân, không có người, không có chữ. Bài 12 (câu q2) dùng lại. Từ khoá tìm ảnh (EN): silt deposit riverbank close up
image.alt.en: Smooth grey silt
image.alt.vi: Lớp bùn mịn màu xám
> Theo ảnh designer chọn 11/11 (bùn mịn ở hồ chứa cũ, CC BY 2.0): brief và `alt` sửa theo ảnh (trước: "on a riverbank" · "trên bãi sông"). Ô `explore_rock_bits` và thẻ câu q2 dùng hình vẽ `q2_silt`, không dùng ảnh này.
> [CẦN KIỂM] Tên "bùn mịn" cho silt (bảng Tên gọi).

### organic_matter
id: b5c17a2d-f1e9-4c54-8d87-e3753787f2ae
tier: core
term.en: organic matter
term.vi: chất hữu cơ
example.en: Rotting leaves add organic matter to soil.
example.vi: Lá mục làm đất có thêm chất hữu cơ.
image.brief: Dùng lại hình `explore_organic`. Từ khoá tìm ảnh (EN): topsoil roots organic matter soil profile
image.alt.en: Dark topsoil with roots and bits of leaf
image.alt.vi: Lớp đất mặt sẫm màu có rễ cây và vụn lá
> [CẦN KIỂM] "Chất hữu cơ" hay "chất mùn" theo sách Khoa học lớp năm.

### clay
id: de4d5c61-b882-4ea3-a8c3-744f24d2e0ba
tier: extra
term.en: clay
term.vi: đất sét
example.en: Wet clay feels sticky.
example.vi: Đất sét ướt sờ vào thấy dính.
image.brief: [hình vẽ] Một khối đất sét dẻo màu xám nâu, mặt còn vết nặn, đặt trên nền kem trơn, vẽ gần; không có tay, không có dụng cụ, không có chữ. Ô `explore_rock_bits`, câu q2 dùng lại; bài 12 (câu w1), bài 14 (câu q5) và bài 15 (câu w1) dùng lại. Từ khoá tìm ảnh (EN): lump of wet clay soil
image.alt.en: A lump of soft clay
image.alt.vi: Một khối đất sét dẻo
> Hình gốc bắt buộc (`_topic.md`: 11 · `clay`). Theo hình designer làm 11/11: không có ảnh khối đất sét hợp lệ, nên là hình vẽ; mọi chỗ dùng lại (bài 12 w1, bài 14 q5) cùng là câu hình vẽ.

### prediction
id: f9821301-0dbc-4199-8716-5a574a6e88db
tier: extra
term.en: prediction
term.vi: dự đoán
example.en: Make a prediction before you look.
example.vi: Em đưa ra dự đoán trước khi quan sát.
image.brief: [hình vẽ] Cùng nét bộ "Lọ đất": lọ nhựa trong có nắp vừa lắc xong, nước nâu đục đều, chưa thấy lớp nào, vài vụn lá xoay trong nước; nền kem trơn; không có tay, không có người, không có vạch số, không có chữ. Câu q1, câu q4 và bài 12 (câu w1) dùng lại làm hình câu hỏi.
image.alt.en: A jar of muddy water, just shaken
image.alt.vi: Lọ nước đục vừa lắc xong

## Thưởng

### spoon_soil_card
id: 9d2b50b7-6e1f-47b7-a91c-b1dd2f3d5cf1
set: rocks
rarity: common
name.en: A spoon of soil
name.vi: Một thìa đất
tag.en: Living soil
tag.vi: Đất đầy sự sống
fact.en: Good soil is full of tiny life. One spoon has more living things than Earth has people.
fact.vi: Đất tốt chứa đầy sự sống nhỏ bé. Một thìa đất có nhiều sinh vật hơn cả số người trên Trái Đất.
> [CẦN KIỂM] Một thìa đất tốt có nhiều vi sinh vật hơn số người trên Trái Đất (khoảng tám tỉ người); biên tập nhớ, hay gặp trong tài liệu phổ biến khoa học về đất, chưa tra nguồn gốc.
image.brief: [hình vẽ] Một thìa đất vườn nâu sẫm tơi xốp đặt trên mặt bàn gỗ, vẽ gần; thìa trơn không có chữ, không có tay. Từ khoá tìm ảnh (EN): spoonful of soil close up
image.alt.en: A spoon full of soil
image.alt.vi: Một thìa đầy đất

## Ghi chú cho hoạ sĩ

- **Theo hình designer làm 11/11** (SK-039, "designer 11/11 · hình bài 8–15"; file chọn ảnh `content/images/discoverer/da-va-dat/dat-gom-nhung-gi.json`): Commons không có ảnh hợp lệ cho cành mục, vỏ lon, chai không nhãn, khối đất sét, thìa đất, nên kệ Chơi, câu q1, q3, thẻ q2, câu q5, từ `clay` và thẻ thưởng đều là hình vẽ. Brief đã đổi `[ảnh]` sang `[hình vẽ]` ở các chỗ này.
- **Loại hình:** bốn ảnh chụp (ô `explore_organic`, câu q6 góc vườn, từ `soil`, từ `silt`); hai mươi lăm hình tự vẽ; ba hình ghép. Hình không có chữ.
- **Ảnh (bốn):** mặt cắt đất mặt có rễ (`explore_organic`, USDA); luống cải trên đất nâu (q6, không phải Việt Nam); nắm đất vườn trong lòng bàn tay, không găng (`soil`, USDA); bùn mịn ở lòng hồ cũ (`silt`).
- **Hình tự vẽ (hai mươi lăm):**
  - bộ "Lọ đất": `explore_jar`, `prediction`, ba lọ câu q4, cốc đất khô có bong bóng (câu q5);
  - `explore_spaces`;
  - kệ Chơi chín món;
  - thẻ q2 `q2_silt`, `q2_organic`; câu q3 `q3_leaf`, `q3_peel`, `q3_root`; câu q5 `q5_air`, `q5_soap`;
  - từ `clay`; thẻ `spoon_soil_card`.
- **Hình ghép (ba):** `explore_rock_bits` (lưới hai hàng hai cột từ `tray_stones`, `tray_sand`, `q2_silt`, `clay`); `w1_toy`, `w1_coin` (tách nền, đặt nền kem).
- **Dùng lại từ bài khác:** `q6` của *Khủng long* bài một (thành phần hình ghép w1_toy); `tray_old_coin` bài chín (thành phần hình ghép w1_coin); `explore_finds` và `q1_cliffs` bài mười (w1); `ha_long` của *Bề mặt Trái Đất* bài một (w2); `q1_water` bài ba (q5).
- **Hình gốc cho bài sau:** `explore_jar`, `soil`, `clay`, `tray_stones`, `tray_rotting_leaves` (bắt buộc theo `_topic.md`); thêm `prediction` (bài 12 w1), `silt` (bài 12 q2), `q2_silt` (bài 14 q5), `tray_sand` (bài 14 q5), `tray_watering` (bài 13), `q6` (bài 13 q4, bài 15), `explore_organic` (bài 15 q5).
- **Cùng kiểu trong một câu:** w1 ba ảnh trên nền kem (hai hình ghép tách nền, ảnh bộ xương); q1, q2, q3, q5 toàn hình vẽ; q4 ba bản cùng một lọ.
- **Kệ Chơi:** chín hình vẽ cùng nét. Rác (túi, chai, lon) không có chữ, không có logo.
- **An toàn:** không có người; rác không có vật sắc (không mảnh chai vỡ). Ảnh `soil` là tay không đeo găng (không có ảnh hợp lệ); chữ của chủ đề vẫn dặn đeo găng khi cầm đất (bài 12, 14).
- **Màu:** Học: Lọ đất lắng `cham`, Mảnh đá `nau_dat`, Chất hữu cơ `gi_dong`, Khe hở nhỏ `vang_hoe`. Chơi: Mảnh đá `do_son`, Chất hữu cơ `gi_dong`, Nước `cham`, nhóm bẫy `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: soil, silt, organic_matter).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (mỗi nhóm hai món), một nhóm `limit` (ba món), chín món.
  - Khởi động: `single_choice` (w1, ba lựa chọn), `true_false` (w2, Đúng). DOK một. `recall_from.lesson`: `da-va-dat/mary-anning-nguoi-san-hoa-thach`, `da-va-dat/da-bi-bao-mon-theo-thoi-gian`.
  - Quiz: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2, ba thẻ), `multi_choice` (q3, bốn lựa chọn, ba đúng), `true_false` (q6 Sai, `speaker: na`, `misconception: soil_was_always_there`).
- **Tham chiếu:** chạy `ids` cho bài bảy và bài mười trước bài này.
- **Vị trí đáp án đúng:** w1 thứ ba; q1 thứ hai; q2 thẻ thứ ba; q3 thứ nhất, hai, ba; q4 thứ ba; q5 thứ nhất.
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Cát, Lá mục, Nước mưa → `balanced`;
  - Túi nhựa → `has_limited`;
  - Sỏi nhỏ, Cành cây mục, Cát (thiếu nước) → `missing.tray_water_group`;
  - rồi chạm Nước tưới cây → `full`; bỏ Cát, đặt Nước tưới cây → `balanced`.
- **Số từ EN trên một màn:** Học khoảng ba mươi (mục tiêu 8, hướng dẫn 3, bốn nhãn 8, câu dài nhất 10, ô Từ mới 4). Quiz nhiều chữ nhất: q4 (câu hỏi 14, ba nhãn 11), q6 (mười tám), q5 (câu hỏi 15, ba nhãn 3).
- **Từ EN có thể ngoài Starters/Movers:** từ mới soil, silt, organic matter, clay, prediction; settle, layer, jar, rot, twig, peel, tiniest, Grandma, skeleton, reptile, weathering (bài bảy).
- **Giọng đọc:** "Mary Anning" trong chuỗi VI câu w1 cần dòng `READINGS` (như bài mười). Chuỗi VI không có chữ số, không ký hiệu, không dấu "—".
- **Thí nghiệm ở nhà** (chờ schema GĐ 3): cho đất vườn vào lọ nhựa trong có nước, lắc, chờ, xem các lớp; đeo găng tay, rửa tay sau đó (`_topic.md`, mục An toàn).
