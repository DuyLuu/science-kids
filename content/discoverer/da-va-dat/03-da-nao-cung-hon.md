---
id: cc0fb575-ea1a-42d3-98a8-e53f184415c4
topic: da-va-dat
slug: da-nao-cung-hon
order: 3
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Physical properties of rocks: hardness
vi: Đá nào cứng hơn?
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số ba). Tiêu đề EN giữ theo Oak (main session chốt 11/11). [Nghe thử] EN có dấu hai chấm.

## Mục tiêu
en: I can test which rocks are hard or soft.
vi: Em thử được đá nào cứng, đá nào mềm.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn A), chưa duyệt.** Ticket SK-039 bước 2, ngày 11/11/2026. Chưa chạy `ids`, `validate`; mọi dòng `id:` để trống.
> Theo Oak lesson 3 `physical-properties-of-rocks-hardness`: tính chất là đặc điểm nhìn, sờ hay đo được; độ cứng là một tính chất của đá; so sánh, xếp nhóm đá theo độ cứng. Sửa `all_rocks_are_hard` ở ý chính hai, ô "Soft rocks", nhóm "Fingernail scratches it" của phần Chơi và câu q6 (gắn key, Na chưa đúng). Vế "đá nặng thì cứng" để bài bốn.
> Lệch Oak: Oak thử cào bằng đinh; bài này dùng móng tay và cán thìa inox, có người lớn ở bên (mục An toàn ở `_topic.md`); không đập đá, không dùng dao, đinh, búa. Ví dụ trong quiz của Oak (giá tiền, đồ trang trí bằng đá xà phòng, mặt bàn bếp) không dùng; mặt bàn bếp đá hoa cương để bài sáu. Không nhắc thang Mohs, "mineral", "geologist" (bài bốn).
> Rà chữ tester 11/11 (N6, main session chốt: bài ba nói về đá, bài bốn nói về khoáng vật): bỏ thạch cao khỏi bài này. Đá mềm thứ hai nay là đá xà phòng (một loại đá thật, rất mềm, gồm chủ yếu là hoạt thạch; bài bốn nối lại). Oak chỉ nhắc đá xà phòng như vật liệu làm đồ trang trí trong quiz; bài này dùng mẫu đá, không dùng đồ trang trí, không chép câu hỏi của Oak. Ảnh tinh thể thạch cao chuyển sang bài bốn (gốc `tray_gypsum` ở bài `da-va-dat/thang-do-cung-mohs`). Món bẫy bánh xà phòng đổi thành cục đất nặn, để trong một kệ không có cả "đá xà phòng" lẫn "bánh xà phòng".

## Ý chính
1.en: You can test a rock by scratching it.
1.vi: Em có thể thử một hòn đá bằng cách cào lên nó.
2.en: A soft rock scratches easily. A hard rock does not.
2.vi: Đá mềm dễ bị cào xước. Đá cứng thì không.
3.en: Hardness is a property we can use to group rocks.
3.vi: Độ cứng là một tính chất giúp ta xếp nhóm các loại đá.
> Giữ nguyên chữ của `_topic.md`. Đi từ cụ thể (cách thử) tới trừu tượng (độ cứng là một tính chất để xếp nhóm).
> [CẦN KIỂM] Độ cứng từng loại đá so với móng tay và thìa inox (ghi chú của `all_rocks_are_hard` ở `_topic.md`): móng tay cào xước được đá phấn, đá xà phòng; thìa inox cào xước được thêm đá vôi, đá cẩm thạch; thìa không cào xước được đá hoa cương, đá ba-dan, đá phiến. Đá là hỗn hợp nên chỉ gần đúng; chữ cho trẻ không đưa số.

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md`:
> - w1 ôn bài hai (một ngày trước): thứ gì giúp nhìn rõ hạt nhỏ trong đá (kính lúp · ống nhòm · kính râm), đáp án thứ nhất. Bài hai dạy ở ô "Look closely" và từ `magnifying_glass`.
> - w2 ôn bài một (hai ngày trước): "Rock is a natural material." (Đúng). Bài một dạy ở ý chính hai và ô "From the ground".

### w1
id: e0bb44ca-5079-49dc-a0a8-06664cfc148e
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/nhin-ky-cac-loai-da
prompt.en: What helps you see the tiny grains in a rock?
prompt.vi: Thứ gì giúp em nhìn rõ hạt nhỏ trên đá?
image.brief: Dùng lại hình `tray_pink_granite` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): pink granite rock sample
image.alt.en: A pink rock
image.alt.vi: Hòn đá màu hồng
hint.en: Remember the Look closely picture in lesson two.
hint.vi: Em nhớ lại ô Nhìn kỹ ở bài hai nhé.
explanation_correct.en: A magnifying glass makes each grain look bigger and clearer.
explanation_correct.vi: Kính lúp làm từng hạt trông to hơn, rõ hơn.
explanation_wrong.en: A magnifying glass makes tiny grains look bigger.
explanation_wrong.vi: Kính lúp làm những hạt nhỏ trông to hơn.
> Ống nhòm (cũng làm vật trông to hơn, nhưng là vật ở xa) và kính râm (cũng là một loại kính) có sức hút. Ba ảnh cùng một dụng cụ trên nền trơn. Hình câu hỏi là đá hoa cương hồng (có hạt để soi), không có kính lúp.

#### option w1_magnifier
correct: true
label.en: magnifying glass
label.vi: kính lúp
image.brief: Dùng lại hình `magnifying_glass` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): magnifying glass plain background
image.alt.en: A magnifying glass
image.alt.vi: Chiếc kính lúp

#### option w1_binoculars
correct: false
feedback.en: Binoculars help you see things far away.
feedback.vi: Ống nhòm giúp em nhìn vật ở thật xa.
label.en: binoculars
label.vi: ống nhòm
image.brief: [hình vẽ] Một chiếc ống nhòm đặt trên nền trơn, vẽ chéo từ trên xuống; cùng cỡ trong khung như kính lúp và kính râm; không có logo, không có chữ. Từ khoá tìm ảnh (EN): binoculars plain background
image.alt.en: A pair of binoculars
image.alt.vi: Chiếc ống nhòm

#### option w1_sunglasses
correct: false
feedback.en: Sunglasses keep bright light out of your eyes.
feedback.vi: Kính râm che bớt nắng chói cho mắt.
label.en: sunglasses
label.vi: kính râm
image.brief: [hình vẽ] Một chiếc kính râm gọng đen đặt trên nền trơn, vẽ nhìn từ trên xuống; cùng cỡ trong khung như kính lúp và ống nhòm; không có logo, không có chữ. Từ khoá tìm ảnh (EN): sunglasses plain background
image.alt.en: A pair of sunglasses
image.alt.vi: Chiếc kính râm

### w2
id: c8111cb3-144d-4f4e-88e0-7e7f90a899d8
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/lam-quen-voi-da
prompt.en: Rock is a natural material.
prompt.vi: Đá là vật liệu có sẵn trong tự nhiên.
image.brief: Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): smooth pebble stone sand
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội
answer: true
hint.en: Remember the From the ground picture in lesson one.
hint.vi: Em nhớ lại ô Từ lòng đất ở bài một nhé.
explanation_correct.en: Rock comes from inside Earth, and nobody makes it.
explanation_correct.vi: Đá có từ trong lòng Trái Đất, không ai làm ra.
explanation_wrong.en: Rock is a natural material from inside Earth.
explanation_wrong.vi: Đá là vật liệu có sẵn trong lòng Trái Đất.
feedback_false.en: Rock forms in nature, not in a factory.
feedback_false.vi: Đá hình thành trong tự nhiên, không do nhà máy.
> Chữ EN đúng bảng Khởi động và bảng Đáp án Đúng/Sai (đáp án Đúng). Ảnh dùng lại theo bảng Hình dùng chung (`w1_stone`, bài ba w2).

## Học

> Bốn ô, theo kế hoạch bài ba ở `_topic.md`: thử cào (ý chính một), đá mềm và đá cứng (ý chính hai), tính chất (ý chính ba).
> Ô "Scratch test" là hình tự vẽ, gốc của bộ "Bàn tay thử đá" (Quy ước hình mục bốn). Ba ô kia là ảnh mẫu đá theo Bộ mẫu đá hay hình ghép từ các ảnh đó.

### explore
id: dd66b6fd-7718-4a8e-a333-5de2eb06f2be
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_scratch
label.en: Scratch test
label.vi: Thử cào
color: gi_dong
sentence.en: You can test a rock by scratching it.
sentence.vi: Em có thể thử một hòn đá bằng cách cào lên nó.
image.brief: [hình vẽ] Gốc bộ hình "Bàn tay thử đá": hai bàn tay một bạn nhỏ, một tay cầm hòn đá phấn trắng, ngón trỏ tay kia cào móng lên mặt đá, để lại một vết xước trắng mảnh; vẽ cận, nhìn chéo từ trên xuống; màu chuyển nhẹ, bóng mềm, không viền đen, nền kem trơn; chỉ thấy hai bàn tay, không vẽ nét mặt; không có chữ. Từ `scratch` và bài bốn (ô `explore_check`) dùng lại hình này. Các hình sau của bộ (câu q5 bài này, câu q6 bài bốn, các hình bài năm) vẽ cùng nét, cùng cỡ tay.
image.alt.en: A fingernail scratching a white rock
image.alt.vi: Móng tay cào lên hòn đá trắng
examples.1.en: first, try your fingernail
examples.1.vi: trước hết, cào bằng móng tay
examples.2.en: next, try the handle of a metal spoon
examples.2.vi: sau đó, cào bằng cán thìa inox
examples.3.en: look for a scratch
examples.3.vi: tìm vết xước
examples.4.en: do it with a grown-up
examples.4.vi: làm cùng người lớn
> An toàn (mục An toàn ở `_topic.md`): chỉ móng tay và cán thìa inox; không đinh, dao, búa; không đập đá; không cào lên kính, gương, bậc thềm hay mặt bàn trong nhà. [Nghe thử] ví dụ một, hai có dấu phẩy.

#### group explore_soft
label.en: Soft rocks
label.vi: Đá mềm
color: vang_hoe
sentence.en: A soft rock scratches easily, even with a fingernail.
sentence.vi: Đá mềm dễ bị cào xước, cả khi cào bằng móng tay.
image.brief: Dùng lại hình `chalk`. Từ khoá tìm ảnh (EN): chalk rock sample
image.alt.en: A white rock
image.alt.vi: Hòn đá màu trắng
examples.1.en: chalk
examples.1.vi: đá phấn
examples.2.en: soapstone
examples.2.vi: đá xà phòng
examples.3.en: most rocks are hard, but some are soft
examples.3.vi: phần lớn đá cứng, nhưng có loại đá mềm
> Rà chữ tester 11/11 (N6, n2): ví dụ hai đổi thạch cao thành đá xà phòng; hình ô đổi từ ảnh thạch cao sang ảnh đá phấn, để đáp án câu q4 (đá xà phòng) không phải đúng tấm ảnh của ô này.
> Ô dạy đúng ý mà bài bốn câu w1 (móng tay cào xước được đá phấn) và bài sáu câu w2 ("Chalk is a soft rock.") ôn lại. Ví dụ ba là câu sửa của `all_rocks_are_hard`.

#### group explore_hard
label.en: Hard rocks
label.vi: Đá cứng
color: do_son
sentence.en: A hard rock does not scratch, even with a spoon.
sentence.vi: Đá cứng không bị xước, kể cả khi cào bằng cán thìa.
image.brief: Dùng lại hình `granite` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám
examples.1.en: granite
examples.1.vi: đá hoa cương
examples.2.en: basalt
examples.2.vi: đá ba-dan
examples.3.en: a fingernail cannot scratch granite
examples.3.vi: móng tay không cào xước được đá hoa cương
examples.4.en: a spoon scratches marble, but not granite
examples.4.vi: thìa cào xước được đá cẩm thạch, nhưng không xước đá hoa cương
> Ví dụ bốn cho thấy có mức "vừa" (thìa cào được, móng tay không), để bé hiểu nhóm thứ hai của phần Chơi. [Nghe thử] ví dụ bốn dài và có dấu phẩy.

#### group explore_properties
label.en: Properties
label.vi: Tính chất
color: cham
sentence.en: Hardness is a property we can use to group rocks.
sentence.vi: Độ cứng là tính chất giúp ta xếp nhóm các loại đá.
image.brief: [sơ đồ ghép ảnh] Ghép ba mẫu đá thành một hàng ngang trên nền kem, cùng cỡ, từ trái sang phải: `chalk`, `marble`, `granite` ở bài `da-va-dat/nhin-ky-cac-loai-da`; không có chữ, không có số, không có mũi tên.
image.alt.en: Three rocks in a row
image.alt.vi: Ba hòn đá xếp thành hàng
examples.1.en: hard or soft
examples.1.vi: cứng hay mềm
examples.2.en: colour
examples.2.vi: màu sắc
examples.3.en: heavy or light
examples.3.vi: nặng hay nhẹ
examples.4.en: things you can see, feel or test
examples.4.vi: điều em nhìn, sờ hay thử được
> Ô dạy chữ "property" (Oak: tính chất là đặc điểm nhìn, sờ hay đo được). Ví dụ ba chỉ nêu cân nặng là một tính chất khác; ý "nặng không phải là cứng" để bài bốn.

### new_words
id: 52926938-7979-471d-af79-fde0736c01a3
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: hardness, scratch, property

## Chơi

> Bé chọn ba hòn đá: một hòn móng tay cào xước được (mềm), một hòn chỉ thìa mới cào xước được (vừa), một hòn cào không xước (cứng). Không được chọn thứ mềm mà không phải đá.
> - Ba món bẫy: miếng đậu phụ, cây nến, cục tẩy. Cả ba đều mềm, móng tay cào được, nên giống nhóm "Fingernail scratches it"; bé phải nhớ đó không phải đá. Rà chữ tester 11/11 (N6): bánh xà phòng của `_topic.md` đổi thành cục đất nặn, vì kệ nay có "đá xà phòng"; main session 11/11 đổi tiếp đất nặn thành đậu phụ (không có ảnh đất nặn hợp lệ).
> - Nhóm mềm: đá phấn và đá xà phòng (trước là thạch cao; thạch cao chuyển hẳn sang bài bốn làm khoáng vật).
> - Nhãn nhóm thứ hai sửa chữ thành "Only a spoon scratches it" · "Chỉ thìa mới cào xước được" (giữ ý), vì thìa cũng cào xước được đá mềm; chữ "only" giúp bé hiểu đây là mức vừa.
> - Nhãn món là tên đá; nhãn ba món bẫy là tên đồ vật, cùng một dạng. `alt` mẫu đá chỉ tả màu, không tả độ cứng.
> - Cả kệ là ảnh chụp; sáu mẫu đá cùng nền kem của Bộ mẫu đá.

### tray
id: cf8ab27a-40e8-4ded-a9aa-45050628d9dc
type: build_tray
version: 1
prompt.en: Find three rocks: soft, medium and hard
prompt.vi: Tìm ba hòn đá: mềm, vừa và cứng
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick one soft, one medium and one hard rock.
messages.start.vi: Em chọn một hòn đá mềm, một hòn vừa và một hòn cứng nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Some rocks are soft, and some are hard.
messages.balanced.vi: Tuyệt! Có loại đá mềm, có loại đá cứng.
messages.has_limited.en: That is soft, but it is not a rock.
messages.has_limited.vi: Thứ đó mềm, nhưng không phải là đá.
messages.missing.tray_nail.en: You still need a rock a fingernail can scratch.
messages.missing.tray_nail.vi: Em còn thiếu một hòn đá móng tay cào xước được.
messages.missing.tray_spoon.en: You still need a rock only a spoon can scratch.
messages.missing.tray_spoon.vi: Em còn thiếu một hòn đá chỉ thìa mới cào xước được.
messages.missing.tray_no_scratch.en: You still need a rock too hard to scratch.
messages.missing.tray_no_scratch.vi: Em còn thiếu một hòn đá cào không xước.

#### group tray_nail
label.en: Fingernail scratches it
label.vi: Móng tay cào xước được
color: vang_hoe
role: required

#### group tray_spoon
label.en: Only a spoon scratches it
label.vi: Chỉ thìa mới cào xước được
color: cham
role: required

#### group tray_no_scratch
label.en: Too hard to scratch
label.vi: Cào không xước
color: do_son
role: required

#### group tray_not_rocks
label.en: Not rocks
label.vi: Không phải đá
color: nau_dat
role: limit

#### item tray_marble
label.en: Marble
label.vi: Đá cẩm thạch
group: tray_spoon
image.brief: Dùng lại hình `marble`. Từ khoá tìm ảnh (EN): white marble rock sample
image.alt.en: A white sparkly rock
image.alt.vi: Hòn đá trắng lấp lánh

#### item tray_tofu
label.en: Tofu
label.vi: Miếng đậu phụ
group: tray_not_rocks
image.brief: [ảnh] Một miếng đậu phụ trắng hình khối vuông, còn nguyên, đặt trên nền trơn hay thớt sáng màu, chụp chéo; designer tách nền, đặt trên nền trắng ngà như các mẫu đá của kệ; không có bao bì, không có nhãn hiệu, không có tay người, không có chữ. Từ khoá tìm ảnh (EN): tofu block plain background
image.alt.en: A white block of tofu
image.alt.vi: Miếng đậu phụ trắng
> Main session chốt 11/11: món bẫy cục đất nặn (không có ảnh hợp lệ) đổi thành miếng đậu phụ. Đậu phụ mềm, móng tay cào được, trắng như đá phấn nên có sức hút, nhưng không phải đá. Cùng dạng nhãn với hai món bẫy kia (tên một vật).

#### item tray_dark_rock
label.en: Basalt
label.vi: Đá ba-dan
group: tray_no_scratch
image.brief: Dùng lại hình `tray_dark_rock` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): basalt vesicular rock sample
image.alt.en: A dark rock with tiny holes
image.alt.vi: Hòn đá sẫm màu có lỗ nhỏ
> `alt` giữ như chỗ gốc: bài này hỏi độ cứng, không hỏi lỗ.

#### item tray_soapstone
label.en: Soapstone
label.vi: Đá xà phòng
group: tray_nail
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: ảnh cận cảnh mặt đá xà phòng xám xanh, mịn, bóng như sáp (ảnh James St. John, CC BY 2.0), cắt theo hình một hòn đá, thêm sáng tối nhẹ và bóng, đặt giữa nền trắng ngà chung (không có ảnh mẫu cầm tay hợp lệ); không có nhãn số, thước, tay người, chữ; không phải đồ chạm khắc. Câu q4 dùng lại hình này; bài bốn vẽ tảng đá câu q6 theo hình này. Từ khoá tìm ảnh (EN): soapstone rock sample
image.alt.en: A grey-green rock
image.alt.vi: Hòn đá màu xám xanh
> Rà chữ tester 11/11 (N6): món mới thay `tray_gypsum`. [CẦN KIỂM] Đá xà phòng (steatit) là đá, gồm chủ yếu là khoáng vật hoạt thạch, rất mềm (khoảng bậc một tới hai), móng tay cào xước được; tên tiếng Việt "đá xà phòng" (có sách gọi "steatit"; không dùng "đá tan" vì "tan" dễ nghe thành "tan chảy").

#### item tray_candle
label.en: Candle
label.vi: Cây nến
group: tray_not_rocks
image.brief: [sơ đồ ghép ảnh] Ảnh một cây nến trắng (CC BY 2.0) cắt bỏ ngọn lửa, tách nền, đặt đứng trên nền trắng ngà như các mẫu đá của kệ; không có chân nến có hoa văn, không có chữ, không có lửa. Bài bốn (món bẫy "Not minerals") dùng lại hình này. Từ khoá tìm ảnh (EN): white candle unlit plain background
image.alt.en: A white candle
image.alt.vi: Cây nến trắng

#### item tray_chalk
label.en: Chalk
label.vi: Đá phấn
group: tray_nail
image.brief: Dùng lại hình `chalk`. Từ khoá tìm ảnh (EN): chalk rock sample
image.alt.en: A white rock
image.alt.vi: Hòn đá màu trắng

#### item tray_granite
label.en: Granite
label.vi: Đá hoa cương
group: tray_no_scratch
image.brief: Dùng lại hình `granite` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám

#### item tray_eraser
label.en: Eraser
label.vi: Cục tẩy
group: tray_not_rocks
image.brief: [ảnh] Một cục tẩy hồng hình chữ nhật, không in chữ, không có vỏ giấy, đặt trên nền trơn, chụp chéo; không có nhãn hiệu. Từ khoá tìm ảnh (EN): white eraser plain background
image.alt.en: An eraser
image.alt.vi: Cục tẩy

#### item tray_limestone
label.en: Limestone
label.vi: Đá vôi
group: tray_spoon
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: một hòn đá vôi xám nhạt cắt từ ảnh nhiều hòn đá vôi (ảnh James St. John, CC BY 2.0), tạo hình hòn đá, đặt giữa nền trắng ngà chung, có bóng mềm; mặt đá mịn hơi sần; không có nhãn số, thước, tay người, chữ. Câu q3, bài bốn câu q3, bài sáu (từ limestone), bài bảy câu w1 dùng lại hình này. Từ khoá tìm ảnh (EN): limestone rock sample
image.alt.en: A pale grey rock
image.alt.vi: Hòn đá màu xám nhạt

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Bốn format: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, thẻ từ có hình; trong một câu các lựa chọn cùng một loại hình (q5 toàn hình tự vẽ, các câu khác toàn ảnh chụp).
> Vị trí đáp án đúng theo bảng ở `_topic.md`: q1 thứ hai, thẻ đúng q2 thứ hai, q3 thứ nhất, thứ hai và thứ tư, q4 thứ nhất, q5 thứ ba.
> Mỗi ảnh mẫu đá chỉ làm lựa chọn ở một câu. Không hỏi thang Mohs, không hỏi "nặng hay cứng" (bài bốn).

### q1
id: 1d58728c-bf34-4aea-bc54-b1fd00a457eb
format: single_choice
version: 1
dok: 1
prompt.en: Which tool can you use to test hardness?
prompt.vi: Em dùng dụng cụ nào để thử độ cứng?
image.brief: Dùng lại hình `explore_properties`.
image.alt.en: Three rocks in a row
image.alt.vi: Ba hòn đá xếp thành hàng
hint.en: Remember the Scratch test picture.
hint.vi: Em nhớ lại ô Thử cào nhé.
explanation_correct.en: Scratch with the spoon handle, then look for a mark.
explanation_correct.vi: Em cào bằng cán thìa rồi tìm vết xước.
explanation_wrong.en: You test hardness by scratching with a metal spoon.
explanation_wrong.vi: Em thử độ cứng bằng cách cào với thìa inox.
> Kính lúp (dụng cụ của bài hai) và cốc nước (dụng cụ của bài năm sắp học) đều là dụng cụ thử đá thật, nên có sức hút. Ba ảnh cùng một dụng cụ trên nền trơn; không ảnh nào bé đã thấy ở phần Học của bài này.

#### option q1_magnifier
correct: false
feedback.en: A magnifying glass helps you look, not scratch.
feedback.vi: Kính lúp giúp em nhìn, không dùng để cào.
label.en: magnifying glass
label.vi: kính lúp
image.brief: Dùng lại hình `q1_magnifier` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): magnifying glass black handle plain background
image.alt.en: A magnifying glass
image.alt.vi: Chiếc kính lúp

#### option q1_spoon
correct: true
label.en: metal spoon
label.vi: thìa inox
image.brief: [hình vẽ] Một chiếc thìa inox (thìa ăn cơm) đặt trên nền trơn, vẽ chéo; cùng cỡ trong khung như kính lúp và cốc nước; không có chữ hay logo khắc trên cán. Câu q3 dùng lại ảnh này (hình câu hỏi). Từ khoá tìm ảnh (EN): stainless steel spoon plain background
image.alt.en: A metal spoon
image.alt.vi: Chiếc thìa inox

#### option q1_water
correct: false
feedback.en: A cup of water cannot scratch a rock.
feedback.vi: Cốc nước không cào xước được hòn đá.
label.en: cup of water
label.vi: cốc nước
image.brief: [hình vẽ] Một cốc nhựa trong (không phải cốc thuỷ tinh) đựng nước sạch, đặt trên nền trơn, vẽ ngang; cùng cỡ trong khung như kính lúp và thìa; không có vạch số, không có nhãn hiệu, không có chữ. Bài năm câu q1 dùng lại ảnh này (hình câu hỏi). Từ khoá tìm ảnh (EN): clear plastic cup of water plain background
image.alt.en: A plastic cup of water
image.alt.vi: Cốc nhựa đựng nước
> Rà chữ tester 11/11 (n7): bỏ ảnh cốc thuỷ tinh của *Hô hấp*, vì mục An toàn của chủ đề dặn thử nước bằng cốc nhựa. Nhãn đổi "glass of water" thành "cup of water".

### q2
id: dcb2cef7-5d1c-4288-a11b-470523ae787b
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: [hình vẽ] Bàn tay một bạn nhỏ đặt trên mặt bàn gỗ, các ngón xoè ra, móng tay cắt ngắn sạch sẽ, vẽ nhìn từ trên xuống; chỉ thấy bàn tay, không thấy mặt, không có nhẫn, không có chữ. Bài bốn câu q3 dùng lại ảnh này (hình câu hỏi). Từ khoá tìm ảnh (EN): child hand fingernails table top view
image.alt.en: A child's hand on a table
image.alt.vi: Bàn tay bạn nhỏ trên bàn
sentence.en: Your fingernail leaves a {1} on a soft rock.
sentence.vi: Móng tay em để lại một {1} trên hòn đá mềm.
answers: q2_scratch
hint.en: Think of chalk after you try your fingernail.
hint.vi: Em nghĩ tới đá phấn sau khi cào móng tay nhé.
explanation_correct.en: A scratch shows the rock is softer than your nail.
explanation_correct.vi: Vết xước cho thấy đá mềm hơn móng tay.
explanation_wrong.en: A fingernail easily scratches a soft rock.
explanation_wrong.vi: Đá mềm dễ bị móng tay cào xước.
> Gợi ý không gọi tên ô "Scratch test" (trùng nhãn đáp án). Câu không có gốc từ "scratch" · "xước".
> Ba thẻ là ba mẫu đá cùng nền kem: lỗ (dùng lại ảnh đá bọt của bài hai), vết xước (ảnh mới), lớp (dùng lại ảnh sa thạch của bài hai). Hai thẻ sai nối bài hai (hạt, lỗ, lớp), nên có sức hút. Không thẻ nào là ảnh bé vừa thấy ở phần Học của bài này. Thẻ đúng ở chỗ thứ hai.

#### bank q2_hole
label.en: hole
label.vi: cái lỗ
feedback.en: A fingernail cannot dig a hole in rock.
feedback.vi: Móng tay không khoét được lỗ trên đá.
image.brief: Dùng lại hình `pumice` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): pumice rock sample
image.alt.en: Tiny holes in a rock
image.alt.vi: Những lỗ nhỏ trên đá
> `alt` đổi so với chỗ gốc ("A pale grey rock") để khớp nghĩa thẻ từ "hole".

#### bank q2_scratch
label.en: scratch
label.vi: vết xước
image.brief: [sơ đồ ghép ảnh] Một hòn đá vôi xám nhạt khác (cắt từ cùng ảnh nhiều hòn đá vôi của James St. John, CC BY 2.0, không phải hòn của món đá vôi), tách nền, đặt trên nền trắng ngà như Bộ mẫu đá, vẽ thêm một vết xước trắng rõ chạy ngang mặt đá; không có tay người, không có dụng cụ, không có chữ. Từ khoá tìm ảnh (EN): scratch test rock sample scratch mark
image.alt.en: A scratch on a rock
image.alt.vi: Vết xước trên hòn đá

#### bank q2_layer
label.en: layer
label.vi: lớp
feedback.en: A fingernail cannot make a layer in rock.
feedback.vi: Móng tay không tạo ra lớp trong đá.
image.brief: Dùng lại hình `tray_sandstone` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): sandstone rock sample layers
image.alt.en: Layers in a rock
image.alt.vi: Các lớp trong đá
> `alt` đổi so với chỗ gốc ("A yellow-brown rock") để khớp nghĩa thẻ từ "layer".

### q3
id: 9dad0ed4-cde6-4be8-8315-211d6c583fee
format: multi_choice
version: 1
dok: 2
prompt.en: Which rocks can a metal spoon scratch?
prompt.vi: Cán thìa inox cào xước được những hòn đá nào?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `q1_spoon`. Từ khoá tìm ảnh (EN): stainless steel spoon plain background
image.alt.en: A metal spoon
image.alt.vi: Chiếc thìa inox
hint.en: Think: a spoon is harder than a fingernail.
hint.vi: Em nghĩ nhé: cán thìa cứng hơn móng tay.
explanation_correct.en: A spoon scratches soft and medium rocks, not hard ones.
explanation_correct.vi: Thìa cào xước đá mềm và vừa, không xước đá cứng.
explanation_wrong.en: A spoon scratches limestone, chalk and marble.
explanation_wrong.vi: Thìa cào xước được đá vôi, đá phấn và đá cẩm thạch.
> DOK 2: suy ra từ kết quả trò chơi. Bé dễ chỉ chọn nhóm "Only a spoon scratches it" (đá vôi, đá cẩm thạch) mà quên rằng thìa cũng cào xước được đá mềm (đá phấn). Ba đáp án đúng, theo bảng vị trí (bài ba là một trong bốn câu ba đáp án). Gợi ý là cách nghĩ, không gọi tên lựa chọn.
> Bốn ảnh đều là mẫu đá bé đã gặp ở phần Chơi, cùng nền kem; `alt` chỉ tả màu.
> [CẦN KIỂM] Thìa inox cào xước được đá vôi, đá cẩm thạch, đá phấn; không cào xước được đá ba-dan.

#### option q3_limestone
correct: true
label.en: limestone
label.vi: đá vôi
image.brief: Dùng lại hình `tray_limestone`. Từ khoá tìm ảnh (EN): limestone rock sample
image.alt.en: A pale grey rock
image.alt.vi: Hòn đá màu xám nhạt

#### option q3_chalk
correct: true
label.en: chalk
label.vi: đá phấn
image.brief: Dùng lại hình `chalk`. Từ khoá tìm ảnh (EN): chalk rock sample
image.alt.en: A white rock
image.alt.vi: Hòn đá màu trắng

#### option q3_basalt
correct: false
feedback.en: Basalt is too hard for a spoon to scratch.
feedback.vi: Đá ba-dan quá cứng, thìa cào không xước.
label.en: basalt
label.vi: đá ba-dan
image.brief: Dùng lại hình `tray_dark_rock` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): basalt vesicular rock sample
image.alt.en: A dark rock with tiny holes
image.alt.vi: Hòn đá sẫm màu có lỗ nhỏ

#### option q3_marble
correct: true
label.en: marble
label.vi: đá cẩm thạch
image.brief: Dùng lại hình `marble`. Từ khoá tìm ảnh (EN): white marble rock sample
image.alt.en: A white sparkly rock
image.alt.vi: Hòn đá trắng lấp lánh

### q4
id: 2f905c8e-ea42-4b82-81dc-fff0780e40da
format: single_choice
version: 1
dok: 2
prompt.en: Which rock can a fingernail scratch?
prompt.vi: Móng tay cào xước được hòn đá nào?
image.brief: Dùng lại hình `q1` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): rock collection table top view
image.alt.en: Many different rocks on a table
image.alt.vi: Nhiều hòn đá khác nhau trên bàn
hint.en: Think which rock scratched most easily in the game.
hint.vi: Em nhớ lại hòn đá nào dễ xước nhất trong trò chơi nhé.
explanation_correct.en: Soapstone is so soft it feels like soap.
explanation_correct.vi: Đá xà phòng mềm, sờ trơn như xà phòng.
explanation_wrong.en: Soapstone is soft, so a fingernail scratches it.
explanation_wrong.vi: Đá xà phòng mềm, móng tay cào xước được.
> A2 (SK-043, 14/11): câu hỏi cũ mười hai chữ ("Mai cào móng tay lên ba hòn đá…"), nay tám chữ, bỏ nhân vật Mai.
> DOK 2: dự đoán kết quả thử cào. Đá xà phòng bóng như sáp, đá phiến mỏng, dẹt, trông dễ xước; bé phải nhớ kết quả trò chơi. Đá xà phòng và đá hoa cương là ảnh bé đã thấy ở phần Chơi (đá hoa cương cũng ở ô Học); đá phiến là ảnh của bài hai. Ba ảnh cùng nền kem.
> Rà chữ tester 11/11 (N6, n2): đáp án đổi từ thạch cao sang đá xà phòng (bài ba chỉ nói về đá); gợi ý đổi từ tên ô "Đá mềm" sang cách nghĩ, theo đề xuất của tester. Tên "đá xà phòng" gợi chữ "xà phòng" (mềm), giống "đá bọt" ở bài hai: tên tiếng Việt vốn vậy, bé vẫn phải nhìn ảnh và nhớ trò chơi.
> [CẦN KIỂM] Móng tay không cào xước được đá phiến (đá phiến khoảng bậc ba tới bốn, móng tay khoảng hai phẩy năm; biên tập nhớ).

#### option q4_soapstone
correct: true
label.en: soapstone
label.vi: đá xà phòng
image.brief: Dùng lại hình `tray_soapstone`. Từ khoá tìm ảnh (EN): soapstone rock sample
image.alt.en: A grey-green rock
image.alt.vi: Hòn đá màu xám xanh

#### option q4_granite
correct: false
feedback.en: Granite is too hard for a fingernail.
feedback.vi: Đá hoa cương quá cứng với móng tay.
label.en: granite
label.vi: đá hoa cương
image.brief: Dùng lại hình `granite` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám

#### option q4_slate
correct: false
feedback.en: Slate is harder than a fingernail.
feedback.vi: Đá phiến cứng hơn móng tay.
label.en: slate
label.vi: đá phiến
image.brief: Dùng lại hình `tray_slate` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): slate rock sample
image.alt.en: A dark grey rock
image.alt.vi: Hòn đá màu xám sẫm

### q5
id: 34359ab0-4443-4637-bcde-74b22f4c707a
format: single_choice
version: 1
dok: 2
prompt.en: After the scratch test, which rock is hardest?
prompt.vi: Sau khi thử cào, hòn đá nào cứng nhất?
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": bàn tay một bạn nhỏ cầm cán thìa inox, bên cạnh là ba hòn đá xám nhạt giống hệt nhau về hình dáng, chưa có vết xước nào; nền kem trơn; chỉ thấy bàn tay, không vẽ nét mặt; không có chữ, không có số.
image.alt.en: A spoon and three grey rocks
image.alt.vi: Cán thìa và ba hòn đá xám
hint.en: Remember the Hard rocks picture.
hint.vi: Em nhớ lại ô Đá cứng nhé.
explanation_correct.en: It is harder than both the nail and the spoon.
explanation_correct.vi: Hòn đá này cứng hơn cả móng tay và cán thìa.
explanation_wrong.en: The hardest rock has no scratches at all.
explanation_wrong.vi: Hòn đá cứng nhất không có vết xước nào.
> A2 (SK-043, 14/11): câu hỏi cũ mười tám chữ (hai câu, có nhân vật Mai), nay chín chữ; hình câu hỏi (cán thìa và ba hòn đá) giữ ngữ cảnh.
> DOK 2: đọc kết quả thử cào (kế hoạch bài ba ở `_topic.md`). Ba hòn đá trông giống hệt nhau, chỉ khác số vết xước, nên bé không đoán theo màu hay tên đá. Hai vết xước: cả móng tay và thìa đều cào được (mềm). Một vết: chỉ thìa cào được (vừa). Không vết nào: cứng nhất.
> Ba nhãn cùng một dạng (số vết xước). Bốn hình (câu hỏi và ba lựa chọn) là hình tự vẽ cùng bộ.

#### option q5_two
correct: false
feedback.en: Two scratches show that this rock is soft.
feedback.vi: Có hai vết xước, nên hòn đá này mềm.
label.en: two scratches
label.vi: hai vết xước
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": một hòn đá xám nhạt, cùng hình dáng và cỡ với hai hòn ở hai lựa chọn kia, trên mặt có hai vết xước trắng: một vết mảnh (móng tay) và một vết đậm hơn (cán thìa); nền kem trơn; không có tay, không có chữ, không có số.
image.alt.en: A rock with two scratches
image.alt.vi: Hòn đá có hai vết xước

#### option q5_one
correct: false
feedback.en: One scratch shows the spoon could still scratch it.
feedback.vi: Có một vết xước, nên thìa vẫn cào được nó.
label.en: one scratch
label.vi: một vết xước
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": cùng hòn đá xám nhạt như lựa chọn `q5_two`, trên mặt chỉ có một vết xước trắng đậm (cán thìa); nền kem trơn; không có tay, không có chữ, không có số.
image.alt.en: A rock with one scratch
image.alt.vi: Hòn đá có một vết xước

#### option q5_none
correct: true
label.en: no scratches
label.vi: không có vết xước
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": cùng hòn đá xám nhạt như lựa chọn `q5_two`, mặt đá không có vết xước nào; nền kem trơn; không có tay, không có chữ, không có số. Bài năm (thẻ câu q2) dùng lại hình này.
image.alt.en: A rock with no scratches
image.alt.vi: Hòn đá không có vết xước

### q6
id: 15a304c8-28d8-42b9-9f5a-69b16fc2c28d
format: true_false
version: 1
dok: 3
misconception: all_rocks_are_hard
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: Chalk is a rock, so it must be very hard.
statement.vi: Đá phấn là đá, vậy chắc chắn nó rất cứng.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
image.brief: Dùng lại hình `chalk`. Từ khoá tìm ảnh (EN): chalk rock sample
image.alt.en: A white rock
image.alt.vi: Hòn đá màu trắng
hint.en: Remember the Fingernail group in the game.
hint.vi: Em nhớ lại nhóm Móng tay cào xước được ở trò chơi nhé.
explanation_correct.en: Chalk is a rock, but soft enough to draw with.
explanation_correct.vi: Đá phấn là đá, nhưng mềm tới mức vẽ được.
explanation_wrong.en: Most rocks are hard, but some, like chalk, are soft.
explanation_wrong.vi: Phần lớn đá cứng, nhưng có loại mềm như đá phấn.
feedback_true.en: A fingernail can scratch chalk easily.
feedback_true.vi: Móng tay cào xước đá phấn rất dễ.
> DOK 3: Na dùng một suy luận nghe có lý (đá thì cứng, đá phấn là đá, vậy đá phấn cứng); vế đầu đúng, kết luận sai. Bé phải bác bỏ một khái quát bằng một ví dụ đã thử. Lời Na đúng chữ bảng "Câu sáu, lời Na" ở `_topic.md`. Đáp án Sai; giải thích khi đúng không mở đầu bằng "Yes!".
> Gợi ý trỏ tới chỗ cần nhớ (nhóm của trò chơi), không hỏi "đá nào cũng cứng không". Hình là mẫu đá phấn (dùng lại `chalk`), `alt` không nói "mềm". Cả màn mười bảy từ EN.

## Từ vựng

### hardness
id: 5a960380-69ec-4bdd-8078-2b115078e0e7
tier: core
term.en: hardness
term.vi: độ cứng
example.en: We test hardness by scratching a rock.
example.vi: Ta thử độ cứng bằng cách cào lên hòn đá.
image.brief: Dùng lại hình `explore_properties`.
image.alt.en: Three rocks in a row
image.alt.vi: Ba hòn đá xếp thành hàng

### scratch
id: 3e0bfb28-ea1b-40e4-8afa-c2b9862dad2e
tier: core
term.en: scratch
term.vi: vết xước, cào xước
example.en: Look closely. Can you see a scratch?
example.vi: Em nhìn kỹ nhé. Em có thấy vết xước không?
image.brief: Dùng lại hình `explore_scratch`.
image.alt.en: A fingernail scratching a white rock
image.alt.vi: Móng tay cào lên hòn đá trắng
> `term.vi` có hai nghĩa vì "scratch" vừa là danh từ vừa là động từ. [Nghe thử] `term.vi` có dấu phẩy. Câu ví dụ khác câu điền từ q2.

### property
id: 7b0c792e-e46a-45a1-81d5-e7e0cca6c39e
tier: core
term.en: property
term.vi: tính chất
example.en: Colour and hardness are properties of a rock.
example.vi: Màu sắc và độ cứng là những tính chất của đá.
image.brief: Dùng lại hình `q1` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): rock collection table top view
image.alt.en: Many different rocks on a table
image.alt.vi: Nhiều hòn đá khác nhau trên bàn
> Không dịch "tài sản" (bảng Tên gọi).

### chalk
id: 8fc78d29-0043-481d-85f6-dbcb05aa233e
tier: extra
term.en: chalk
term.vi: đá phấn
example.en: Chalk is a soft, white rock.
example.vi: Đá phấn là loại đá trắng và mềm.
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: mẫu đá phấn trắng, mặt mịn, hơi bở (ảnh James St. John, CC BY 2.0) tách khỏi nền ảnh gốc, đặt giữa nền trắng ngà chung, có bóng mềm; không có nhãn số, thước, tay người, chữ; không phải viên phấn viết bảng. Ô explore_soft, ô explore_properties (ghép), món tray_chalk, câu q3, câu q6, bài hai câu q4, bài bốn câu w1, bài năm câu q3, bài sáu dùng lại hình này. Từ khoá tìm ảnh (EN): chalk rock sample
image.alt.en: A white rock
image.alt.vi: Hòn đá màu trắng
> Không nói phấn viết bảng làm từ đá phấn (bảng Tên gọi).

### marble
id: 0f7dc75a-a1de-453b-9e07-809b8c622d4e
tier: extra
term.en: marble
term.vi: đá cẩm thạch
example.en: This marble is white and sparkly.
example.vi: Hòn đá cẩm thạch này trắng và lấp lánh.
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: mẫu đá cẩm thạch trắng, hạt lấp lánh (ảnh James St. John, CC BY 2.0; mặt vỡ tự nhiên, không phải tấm ốp mài bóng) tách khỏi nền ảnh gốc, đặt giữa nền trắng ngà chung, có bóng mềm; không có nhãn số, thước, tay người, chữ. Ô explore_properties (ghép), món tray_marble, câu q3, bài năm câu q3, bài sáu câu w1 dùng lại hình này. Từ khoá tìm ảnh (EN): white marble rock sample
> Theo hình designer 11/11: mẫu cẩm thạch đã chọn trắng, hạt lấp lánh, không có vân xám rõ; câu ví dụ và `alt` đổi theo ảnh. Hình vẽ đá cẩm thạch ở bài năm vẫn có vân xám (hình vẽ, không phải ảnh này).
image.alt.en: A white sparkly rock
image.alt.vi: Hòn đá trắng lấp lánh
> Câu ví dụ không nói độ cứng của đá cẩm thạch (câu q3 hỏi). Không dùng "đá hoa" cho marble (dễ lẫn với đá hoa cương).

## Thưởng

### chalk_card
id: 8aa670ff-0505-427f-81d9-3a8e68e80d93
set: rocks
rarity: common
name.en: Chalk cliffs
name.vi: Vách đá phấn
tag.en: Tiny sea shells
tag.vi: Vỏ sinh vật biển tí hon
fact.en: Chalk is made from tiny shells of sea life. They are too small to see.
fact.vi: Đá phấn được tạo nên từ vỏ rất nhỏ của sinh vật biển. Những vỏ ấy nhỏ tới mức mắt không nhìn thấy.
> [CẦN KIỂM] Đá phấn được tạo từ những mảnh vỏ đá vôi rất nhỏ của sinh vật biển tí hon, lắng xuống đáy biển từ rất lâu (biên tập nhớ); cách nói "vỏ sinh vật biển" cần chuyên môn xem.
image.brief: [ảnh] Vách đá phấn trắng cao bên bờ biển, chụp từ xa, trời xanh, sóng nhẹ; không có người, không có nhà, không có thuyền có chữ, không có chữ. Từ khoá tìm ảnh (EN): white chalk cliffs sea
image.alt.en: White chalk cliffs by the sea
image.alt.vi: Vách đá phấn trắng bên bờ biển

## Ghi chú cho hoạ sĩ

- **Loại hình (theo hình designer 11/11):** kệ Chơi, câu q3, q4, q6 và thẻ q2 là ảnh (mẫu đá, cây nến, thẻ vết xước là hình ghép một phần trên nền trắng ngà); câu w1, q1, hình câu q2, câu q5, ô `explore_scratch` là hình tự vẽ; `explore_properties` là hình ghép. Mỗi câu một loại hình. Hình không có chữ, không có số. Danh sách dưới đây là danh sách lúc soạn; số thật: hai ảnh nguồn mới, mười hình vẽ, bảy hình ghép, cộng ảnh đậu phụ cần tìm.
- **Bộ mẫu đá (gốc ở bài này):** `chalk`, `marble`, `tray_soapstone`, `tray_limestone`. Cùng nền kem, cùng góc chụp với năm mẫu của bài hai. Rà chữ tester 11/11 (N6): `tray_gypsum` (tinh thể thạch cao) không còn ở bài này; gốc chuyển sang bài bốn.
- **Ảnh cần tìm (mười bốn):**
  - Khởi động: ống nhòm, kính râm (w1).
  - Chơi: mẫu đá xà phòng xám xanh, mẫu đá vôi xám nhạt; miếng đậu phụ trắng (còn thiếu, cần tìm), cây nến trắng, cục tẩy hồng (không chữ).
  - Quiz: thìa inox, cốc nhựa trong đựng nước (q1); bàn tay bạn nhỏ trên bàn (q2); mẫu đá có vết xước (thẻ q2).
  - Từ vựng: mẫu đá phấn (`chalk`), mẫu đá cẩm thạch (`marble`).
  - Thưởng: vách đá phấn bên biển.
- **Hình tự vẽ (năm):** `explore_scratch`; câu q5 (hình câu hỏi và ba hòn đá `q5_two`, `q5_one`, `q5_none`, cùng hình dáng, chỉ khác số vết xước).
- **Hình ghép (một):** `explore_properties` (đá phấn, đá cẩm thạch, đá hoa cương thành một hàng).
- **Dùng lại trong bài:** `tray_soapstone` (q4); `chalk` (ô `explore_soft`, hình ghép, món, q3, q6); `marble` (hình ghép, món, q3); `tray_limestone` (q3); `q1_spoon` (q3); `explore_properties` (q1, từ `hardness`); `explore_scratch` (từ `scratch`).
- **Dùng lại từ bài khác:** bài hai `tray_pink_granite` (w1), `magnifying_glass` (w1), `q1_magnifier` (q1), `pumice`, `tray_sandstone` (thẻ q2), `granite` (ô `explore_hard`, hình ghép, món, q4), `tray_slate` (q4), `q1` (q4, từ `property`); *Hô hấp* `vi-sao-ta-phai-tho/w1_stone` (w2); *Bề mặt Trái Đất* `nui-lua/tray_dark_rock` (món, q3).
- **Gốc cho bài sau thêm:** `q1_water` (cốc nhựa đựng nước, bài năm câu q1).
- **Khó tìm và phương án thay:**
  - Mẫu đá có vết xước (thẻ q2): ít ảnh hợp lệ; phương án thay ghi trong brief (hình ghép, thêm vết xước lên một ảnh mẫu đá vôi khác).
  - Cục tẩy, đậu phụ (hay có bao bì in chữ): chọn ảnh không chữ, hoặc cắt góc.
  - Đá xà phòng: chỉ lấy mẫu đá thô, không lấy đồ chạm khắc (tượng, bát).
- **Cùng kiểu trong một câu:** w1 ba dụng cụ trên nền trơn; q1 ba dụng cụ trên nền trơn; q2 ba mẫu đá cùng nền kem; q3, q4 mẫu đá cùng nền kem; q5 bốn hình vẽ cùng bộ.
- **Màu:** Học: thử cào `gi_dong`, đá mềm `vang_hoe`, đá cứng `do_son`, tính chất `cham`. Chơi: móng tay cào xước được `vang_hoe`, chỉ thìa mới cào xước được `cham`, cào không xước `do_son`, nhóm `limit` `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` mỗi nhóm hai món, một nhóm `limit` ba món, chín món.
  - Khởi động: `single_choice` (w1, ôn bài hai), `true_false` (w2, ôn bài một, đáp án Đúng).
  - Quiz: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3, ba đáp án đúng), `true_false` (q6, `speaker: na`, đáp án Sai). Bốn format.
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `all_rocks_are_hard`.
- **Vị trí đáp án đúng:** w1 thứ nhất; q1 thứ hai; thẻ đúng q2 thứ hai; q3 thứ nhất, thứ hai và thứ tư; q4 thứ nhất; q5 thứ ba. Đúng bảng ở `_topic.md`.
- **Tham chiếu:** `recall_from.lesson` trỏ `da-va-dat/nhin-ky-cac-loai-da` (w1), `da-va-dat/lam-quen-voi-da` (w2); hai bài đó phải có id trước.
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Đá phấn, Đá vôi, Đá hoa cương → đạt;
  - chạm Miếng đậu phụ → `has_limited`;
  - chạm Đá phấn, Đá xà phòng, Đá ba-dan (thiếu mức vừa) → `missing.tray_spoon`; chạm Đá cẩm thạch → `full`; bỏ Đá xà phòng, đặt Đá cẩm thạch → đạt.
- **Dòng điều kiện màn Chơi:** "Cần đủ Móng tay cào xước được, Chỉ thìa mới cào xước được, Cào không xước · Không phải đá". Nhãn nhóm thứ hai dài (năm từ EN); nên xem trên iPhone hẹp nhất.
- **Số từ EN trên một màn:**
  - Học khoảng ba mươi mốt từ: mục tiêu 9, hướng dẫn 3, bốn nhãn 7, câu dài nhất 10, ô Từ mới 2.
  - Khởi động và Quiz: nhiều nhất là q5 (khoảng hai mươi mốt: câu hỏi 15, ba nhãn 6) và q6 (mười bảy).
- **Thí nghiệm ở nhà (chỉ ghi cho người duyệt):** cùng người lớn, cào móng tay rồi cán thìa inox lên vài hòn đá nhặt ở vườn hay bãi cuội, xếp từ mềm tới cứng. Không đập đá, không dùng đinh, dao; không cào lên kính, gương, bậc thềm, mặt bàn trong nhà.
- **Từ EN có thể ngoài Starters/Movers:** hardness, scratch, property, fingernail, metal spoon, handle, medium, chalk, soapstone, marble, limestone, granite, basalt, slate, tofu, candle, eraser, binoculars, sunglasses, magnifying glass, grown-up.
- **Giọng đọc:** chuỗi VI không có chữ số, ký hiệu, dấu "—". Nghe thử tiêu đề EN có dấu hai chấm.
