---
id: e234909f-12d0-4785-bb60-079668484160
topic: da-va-dat
slug: thang-do-cung-mohs
order: 4
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Mohs' scale of hardness
vi: Thang độ cứng Mohs
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số bốn). Chuỗi VI có "Mohs": cần dòng `READINGS` (đề xuất cho dev ở `_topic.md`, đọc "mốt" [CẦN KIỂM]).

## Mục tiêu
en: I can use Mohs' scale to compare hardness.
vi: Em dùng được thang Mohs để so sánh độ cứng.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn A), chưa duyệt.** Ticket SK-039 bước 2, ngày 11/11/2026. Chưa chạy `ids`, `validate`; mọi dòng `id:` để trống.
> Theo Oak lesson 4 `mohs-scale-of-hardness-non-statutory`: nhà địa chất nghiên cứu Trái Đất làm từ gì; các nhà khoa học xưa giúp ta hiểu tính chất của đá; đối chiếu kết quả thử của mình với nghiên cứu trước. Sửa `heavy_means_hard` ở ô "Heavy or hard?" và câu q6 (gắn key, Na nói đúng); chạm `breaks_means_soft` ở ô đó và câu q5 (không gắn key).
> Lệch Oak: thang mười bậc rút còn ba mức (mềm, cứng, rất cứng) với sáu khoáng vật; hình thang không có chữ số. Ví dụ bát sứ cho ý "dễ vỡ khác cứng"; chữ "brittle" không thành từ vựng. Quiz của Oak (đá phấn để vẽ, đá phiến lợp mái, kim cương cắt kính) không dùng. Hoạt động tự thử nhiều loại đá thành thí nghiệm ở nhà. Không đưa tên "Friedrich" vào chữ cho trẻ; không nói giá tiền đá quý.

## Ý chính
1.en: Rocks are made of minerals.
1.vi: Đá được tạo nên từ các khoáng vật.
2.en: A geologist named Mohs put minerals in order of hardness.
2.vi: Một nhà địa chất tên là Mohs đã xếp các khoáng vật theo độ cứng.
3.en: You can check your own tests with Mohs' scale.
3.vi: Em có thể đối chiếu kết quả thử của mình với thang Mohs.
> Giữ nguyên chữ của `_topic.md`. Đi từ cụ thể (đá gồm những hạt khoáng vật) tới trừu tượng (thang so sánh, đối chiếu kết quả).
> [CẦN KIỂM] "Đá được tạo nên từ các khoáng vật" đúng với phần lớn các loại đá (biên tập nhớ). Mohs là nhà địa chất, nhà khoáng vật học, lập thang năm một nghìn tám trăm mười hai, nên chữ cho trẻ nói "hơn hai trăm năm trước".

## Khởi động

> Hai câu ôn bài ba (một ngày trước), đúng bảng Khởi động ở `_topic.md`:
> - w1: móng tay cào xước được hòn đá nào (đá hoa cương · đá ba-dan · đá phấn), đáp án thứ ba. Bài ba dạy ở ô "Soft rocks" (đá phấn) và ô "Hard rocks" (móng tay không cào xước được đá hoa cương).
> - w2: "All rocks are very hard." (Sai). Bài ba dạy ở ý chính hai, ô "Soft rocks" và trò chơi.
> Hai câu dẫn vào ô "Check your test": em đã thử cào, nay đối chiếu với thang của nhà khoa học.

### w1
id: 0036efff-5210-4c8a-b53e-7a4eb4c18ec1
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/da-nao-cung-hon
prompt.en: Which rock can your fingernail scratch?
prompt.vi: Móng tay em cào xước được hòn đá nào?
image.brief: Dùng lại hình `q1` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): rock collection table top view
image.alt.en: Many different rocks on a table
image.alt.vi: Nhiều hòn đá khác nhau trên bàn
hint.en: Remember the Soft rocks picture in lesson three.
hint.vi: Em nhớ lại ô Đá mềm ở bài ba nhé.
explanation_correct.en: Chalk is soft and leaves white powder on your nail.
explanation_correct.vi: Đá phấn mềm, cào xong móng tay dính bột trắng.
explanation_wrong.en: Chalk is soft enough for a fingernail to scratch.
explanation_wrong.vi: Đá phấn đủ mềm để móng tay cào xước.
> Ba mẫu đá cùng nền kem của Bộ mẫu đá; `alt` chỉ tả màu (đá ba-dan giữ `alt` gốc vì câu không hỏi lỗ). Đá hoa cương và đá ba-dan là hai đá cứng của bài ba, nên bé phải nhớ đá phấn mềm.

#### option w1_granite
correct: false
feedback.en: Granite is much harder than your fingernail.
feedback.vi: Đá hoa cương cứng hơn móng tay nhiều.
label.en: granite
label.vi: đá hoa cương
image.brief: Dùng lại hình `granite` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám

#### option w1_basalt
correct: false
feedback.en: Basalt is a hard rock from cooled lava.
feedback.vi: Đá ba-dan là đá cứng, từ dung nham nguội.
label.en: basalt
label.vi: đá ba-dan
image.brief: Dùng lại hình `tray_dark_rock` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): basalt vesicular rock sample
image.alt.en: A dark rock with tiny holes
image.alt.vi: Hòn đá sẫm màu có lỗ nhỏ

#### option w1_chalk
correct: true
label.en: chalk
label.vi: đá phấn
image.brief: Dùng lại hình `chalk` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): chalk rock sample
image.alt.en: A white rock
image.alt.vi: Hòn đá màu trắng

### w2
id: c8ec9bf2-5610-4baf-8134-45a1e86f9704
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/da-nao-cung-hon
prompt.en: All rocks are very hard.
prompt.vi: Đá nào cũng rất cứng.
image.brief: Dùng lại hình `explore_properties` ở bài `da-va-dat/da-nao-cung-hon`.
image.alt.en: Three rocks in a row
image.alt.vi: Ba hòn đá xếp thành hàng
answer: false
hint.en: Remember the game in lesson three.
hint.vi: Em nhớ lại trò chơi ở bài ba nhé.
explanation_correct.en: Most rocks are hard, but chalk and soapstone are soft.
explanation_correct.vi: Phần lớn đá cứng, nhưng đá phấn, đá xà phòng mềm.
explanation_wrong.en: Some rocks, like chalk, are soft.
explanation_wrong.vi: Có loại đá mềm, như đá phấn.
feedback_true.en: A fingernail can scratch some kinds of rock.
feedback_true.vi: Móng tay cào xước được vài loại đá.
> Chữ EN đúng bảng Khởi động và bảng Đáp án Đúng/Sai (đáp án Sai). Giải thích khi đúng không mở đầu bằng "Yes!". Hình câu hỏi là ba mẫu đá xếp hàng, không cho thấy hòn nào mềm.
> Rà chữ tester 11/11 (N6): giải thích khi đúng đổi "chalk and gypsum" thành "chalk and soapstone", theo hai đá mềm bài ba nay dạy.

## Học

> Bốn ô, theo kế hoạch bài bốn ở `_topic.md`: khoáng vật (ý chính một), thang Mohs (ý chính hai), đối chiếu (ý chính ba), nặng hay cứng (`heavy_means_hard`, `breaks_means_soft`).
> Ô "Mohs' scale" là hình tự vẽ gốc của bộ "Thang Mohs"; ô "Check your test" dùng lại hình bàn tay cào đá của bài ba; ô "Heavy or hard?" là hình tự vẽ mới cùng nét.

### explore
id: 70565317-4aea-438b-96d9-6a18a5479d22
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_minerals
label.en: Minerals
label.vi: Khoáng vật
color: vang_hoe
sentence.en: Rocks are made of minerals, like the grains in granite.
sentence.vi: Đá tạo nên từ khoáng vật, như hạt trong đá hoa cương.
image.brief: Dùng lại hình `granite` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám
examples.1.en: the grains in granite
examples.1.vi: những hạt trong đá hoa cương
examples.2.en: quartz
examples.2.vi: thạch anh
examples.3.en: gypsum
examples.3.vi: thạch cao
examples.4.en: soapstone is made mostly of talc
examples.4.vi: đá xà phòng gồm chủ yếu là hoạt thạch
> Nối bài hai (hạt lấp lánh nhiều màu trong đá hoa cương). Ô dạy đúng ý mà bài chín câu w2 ôn lại ("Rocks are made of minerals.").
> Rà chữ tester 11/11 (N6): ví dụ bốn cũ "each mineral has its own name" đổi thành câu nối đá với khoáng vật: đá xà phòng (đá mềm của bài ba) gồm chủ yếu là hoạt thạch (khoáng vật của bài này). Bé thấy đá và khoáng vật là hai bậc khác nhau, và có đường suy ra hoạt thạch mềm ở câu q3. [CẦN KIỂM] Đá xà phòng gồm chủ yếu là hoạt thạch (biên tập nhớ).
> [CẦN KIỂM] Các hạt trong đá hoa cương là những khoáng vật khác nhau (thạch anh và vài khoáng vật khác; biên tập nhớ). "Khoáng vật" và "chất khoáng" cho cùng chữ EN "mineral": bài này chỉ dùng "khoáng vật" (bảng Tên gọi).

#### group explore_scale
label.en: Mohs' scale
label.vi: Thang Mohs
color: do_son
sentence.en: A geologist named Mohs put minerals in order of hardness.
sentence.vi: Nhà địa chất Mohs xếp các khoáng vật theo độ cứng.
image.brief: [hình vẽ] Gốc bộ hình "Thang Mohs": một chiếc cầu thang mười bậc nhìn nghiêng, từ thấp bên trái lên cao bên phải; trên sáu bậc đặt hình vẽ nhỏ của sáu khoáng vật, vẽ theo sáu ảnh khoáng vật của bài này: hoạt thạch ở bậc một, thạch cao ở bậc hai, thạch anh và thạch anh tím cạnh nhau ở bậc bảy, hồng ngọc ở bậc chín, kim cương ở bậc mười; các bậc khác để trống; không có chữ số, không có chữ, không có mũi tên, không có người; màu chuyển nhẹ, bóng mềm, không viền đen, nền kem trơn. Từ `scale` dùng lại hình này.
image.alt.en: A staircase with minerals on some steps
image.alt.vi: Cầu thang có khoáng vật đặt trên vài bậc
examples.1.en: ten steps, from soft to hard
examples.1.vi: mười bậc, từ mềm tới cứng
examples.2.en: talc is the softest
examples.2.vi: hoạt thạch mềm nhất
examples.3.en: diamond is the hardest
examples.3.vi: kim cương cứng nhất
examples.4.en: made over two hundred years ago
examples.4.vi: lập ra từ hơn hai trăm năm trước
> Ô dạy đúng ý mà bài năm câu w1 ôn lại (kim cương cứng nhất). Chuỗi VI có "Mohs" (cần `READINGS`).
> [CẦN KIỂM] Bậc của sáu khoáng vật: hoạt thạch một, thạch cao hai, thạch anh bảy (thạch anh tím là một loại thạch anh), hồng ngọc chín, kim cương mười; thang lập năm một nghìn tám trăm mười hai (biên tập nhớ).

#### group explore_check
label.en: Check your test
label.vi: Đối chiếu
color: cham
sentence.en: You can check your own tests with Mohs' scale.
sentence.vi: Em đối chiếu kết quả thử của mình với thang Mohs.
image.brief: Dùng lại hình `explore_scratch` ở bài `da-va-dat/da-nao-cung-hon`.
image.alt.en: A fingernail scratching a white rock
image.alt.vi: Móng tay cào lên hòn đá trắng
examples.1.en: a fingernail scratches gypsum
examples.1.vi: móng tay cào xước được thạch cao
examples.2.en: a fingernail cannot scratch quartz
examples.2.vi: móng tay không cào xước được thạch anh
examples.3.en: Mohs' scale says the same
examples.3.vi: thang Mohs cũng cho kết quả như vậy
> [CẦN KIỂM] Móng tay khoảng bậc hai phẩy năm: cào xước được thạch cao (bậc hai), không cào xước được thạch anh (bậc bảy). Chữ cho trẻ không đưa số.

#### group explore_heavy
label.en: Heavy or hard?
label.vi: Nặng hay cứng?
color: gi_dong
sentence.en: Weight does not tell you hardness, but scratching does.
sentence.vi: Cân nặng không cho biết độ cứng, thử cào mới biết.
image.brief: [hình vẽ] Cùng nét bộ "Bàn tay thử đá": một cái cân đĩa cũ, đĩa bên trái có một tảng đá to màu trắng ngà, đĩa bên phải có một hòn đá nhỏ màu xám sẫm, cân lệch hẳn về phía tảng đá to; nền kem trơn; không có số, không có chữ, không có quả cân, không có tay người.
image.alt.en: A balance with a big rock and a small rock
image.alt.vi: Cái cân với một tảng đá to và một hòn đá nhỏ
examples.1.en: lift it to feel if it is heavy
examples.1.vi: nhấc lên để biết nặng hay nhẹ
examples.2.en: scratch it to find out if it is hard
examples.2.vi: cào thử để biết cứng hay mềm
examples.3.en: a china bowl is hard, but it can break
examples.3.vi: bát sứ cứng nhưng rơi vẫn vỡ
> Câu của ô là câu sửa của `heavy_means_hard`; ví dụ ba chạm `breaks_means_soft`. Ô không nói "tảng đá to và nặng vẫn có thể mềm" bằng chữ, để câu q6 (tảng đá nặng mà móng tay cào xước được) còn là việc áp dụng vào tình huống mới.
> [CẦN KIỂM] Sứ cứng nhưng giòn nên rơi vẫn vỡ; dễ vỡ khác với mềm (ghi chú `breaks_means_soft` ở `_topic.md`).

### new_words
id: ee15096f-ed1f-4c31-ba8b-2f1999dc718d
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: mineral, scale, geologist

## Chơi

> Bé chọn ba khoáng vật: một mềm (hoạt thạch, thạch cao), một cứng (thạch anh, thạch anh tím), một rất cứng (hồng ngọc, kim cương). Không được chọn thứ do con người làm ra mà trông giống khoáng vật.
> - Ba mức theo thang Mohs rút gọn (`_topic.md`): mềm (móng tay cào được), cứng (thìa không cào được), rất cứng (gần đỉnh thang).
> - Ba món bẫy, mỗi món giống một nhóm: cục đường phèn trong như thạch anh, viên bi thuỷ tinh bóng như kim cương, cây nến trắng mềm như sáp giống hoạt thạch. Hạt cườm nhựa của `_topic.md` đổi thành cây nến (không có ảnh hạt cườm hợp lệ; main session cho đổi 11/11).
> - Nhãn món là tên khoáng vật; nhãn ba món bẫy là tên đồ vật, cùng một dạng. `alt` khoáng vật chỉ tả màu và hình dáng, không tả độ cứng.
> - Cả kệ là ảnh chụp, cùng nền kem của Bộ mẫu đá.

### tray
id: f41cf3d2-75c6-4d23-a689-285034c49e13
type: build_tray
version: 1
prompt.en: Find three minerals: soft, hard and very hard
prompt.vi: Tìm ba khoáng vật: mềm, cứng và rất cứng
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick one soft, one hard and one very hard mineral.
messages.start.vi: Em chọn một khoáng vật mềm, một khoáng vật cứng và một khoáng vật rất cứng nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You put minerals in order, just like Mohs.
messages.balanced.vi: Tuyệt! Em xếp khoáng vật theo thứ tự, như ông Mohs.
messages.has_limited.en: People make that. It is not a mineral.
messages.has_limited.vi: Thứ đó do con người làm ra, không phải khoáng vật.
messages.missing.tray_soft.en: You still need a soft mineral.
messages.missing.tray_soft.vi: Em còn thiếu một khoáng vật mềm.
messages.missing.tray_hard.en: You still need a hard mineral.
messages.missing.tray_hard.vi: Em còn thiếu một khoáng vật cứng.
messages.missing.tray_very_hard.en: You still need a very hard mineral.
messages.missing.tray_very_hard.vi: Em còn thiếu một khoáng vật rất cứng.
> `messages.balanced` có "Mohs" trong chuỗi VI (cần `READINGS`). [CẦN KIỂM] Đường phèn do con người kết tinh từ nước đường; bi thuỷ tinh và nến do con người làm ra.

#### group tray_soft
label.en: Soft
label.vi: Mềm
color: vang_hoe
role: required

#### group tray_hard
label.en: Hard
label.vi: Cứng
color: cham
role: required

#### group tray_very_hard
label.en: Very hard
label.vi: Rất cứng
color: do_son
role: required

#### group tray_not_minerals
label.en: Not minerals
label.vi: Không phải khoáng vật
color: nau_dat
role: limit

#### item tray_ruby
label.en: Ruby
label.vi: Hồng ngọc
group: tray_very_hard
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: tinh thể hồng ngọc thô màu đỏ, chưa mài (ảnh CC BY 4.0) tách khỏi nền ảnh gốc, đặt giữa nền trắng ngà chung, có bóng mềm; không có nhãn số, thước, tay người, chữ; không phải nhẫn hay đá đã mài. Câu q1, thẻ ruby_card và hình ghép từ mineral dùng lại hình này. Từ khoá tìm ảnh (EN): rough ruby crystal
image.alt.en: A red piece
image.alt.vi: Mẩu màu đỏ

#### item tray_glass_marble
label.en: Glass marble
label.vi: Viên bi thuỷ tinh
group: tray_not_minerals
image.brief: [ảnh] Một viên bi thuỷ tinh sẫm màu có vân vàng bên trong (ảnh CC0), đặt trên nền trơn hay nền trắng ngà như các mẫu của kệ, chụp gần; không có tay người, không có chữ. Câu q2 (thẻ "glass") dùng lại ảnh này. Từ khoá tìm ảnh (EN): glass marble toy plain background
image.alt.en: A glass marble
image.alt.vi: Viên bi thuỷ tinh
> Theo hình designer 11/11: viên bi của bài một nay là hình vẽ, kệ này là ảnh, nên dùng ảnh riêng, không trỏ bài một.

#### item tray_talc
label.en: Talc
label.vi: Hoạt thạch
group: tray_soft
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: mẫu hoạt thạch trắng ngà, mặt bóng như sáp (ảnh CC0) tách khỏi nền ảnh gốc, đặt giữa nền trắng ngà chung, có bóng mềm; không có nhãn số, thước, tay người, chữ; không phải bột hoạt thạch. Hình vẽ explore_scale, câu q3, hình ghép câu q4, bài sáu câu q4 và bài mười lăm dùng lại hình này. Từ khoá tìm ảnh (EN): talc mineral sample
image.alt.en: A pale cream piece
image.alt.vi: Mẩu màu trắng ngà
> Rà chữ tester 11/11 (N5): sáu món khoáng vật dùng một khuôn `alt` chung "A <màu> piece" · "Mẩu <màu>", không gọi "rock", "crystal" hay "mineral", để `alt` không chia đôi theo nhóm Mềm với hai nhóm kia. Bài sáu câu q4 (B) dùng lại ảnh này cần chép `alt` mới. [CẦN KIỂM] tên "hoạt thạch" theo sách; không viết "tan" một mình (bảng Tên gọi).

#### item tray_amethyst
label.en: Amethyst
label.vi: Thạch anh tím
group: tray_hard
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: cụm tinh thể thạch anh tím đầu nhọn (ảnh CC BY 2.5) tách khỏi nền ảnh gốc, đặt giữa nền trắng ngà chung, có bóng mềm; không có nhãn số, thước, tay người, chữ; không phải đồ trang sức. Câu q3 và hình ghép từ mineral dùng lại hình này. Từ khoá tìm ảnh (EN): amethyst crystal cluster
image.alt.en: A purple piece
image.alt.vi: Mẩu màu tím

#### item tray_gypsum
label.en: Gypsum
label.vi: Thạch cao
group: tray_soft
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: một phiến thạch cao tinh thể trong, hơi đục (selenite, ảnh CC0) tách khỏi nền ảnh gốc, đặt giữa nền trắng ngà chung, có bóng mềm; không có nhãn số, thước, tay người, chữ; không phải tượng hay tấm trần thạch cao. Hình vẽ explore_scale, câu q3, bài năm câu w1 và bài sáu câu q4 dùng lại hình này. Từ khoá tìm ảnh (EN): selenite gypsum crystal sample
image.alt.en: A clear piece
image.alt.vi: Mẩu trong suốt
> Rà chữ tester 11/11 (N6, main session chốt: bài ba nói về đá, bài bốn nói về khoáng vật): gốc ảnh tinh thể thạch cao chuyển từ bài ba về đây; bài ba không còn ảnh này. Cùng ảnh, cùng key, cùng từ khoá như trước. Bài sáu câu q4 (người soạn B) cần trỏ lại về bài này.

#### item tray_rock_sugar
label.en: Sugar crystal
label.vi: Cục đường phèn
group: tray_not_minerals
image.brief: Dùng lại hình `tray_rock_sugar` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): rock sugar crystal lump
image.alt.en: Clear lumps
image.alt.vi: Mấy cục trong suốt

#### item tray_diamond
label.en: Diamond
label.vi: Kim cương
group: tray_very_hard
image.brief: Dùng lại hình `diamond`. Từ khoá tìm ảnh (EN): rough diamond crystal
image.alt.en: A small clear piece
image.alt.vi: Mẩu nhỏ trong suốt

#### item tray_candle
label.en: Candle
label.vi: Cây nến
group: tray_not_minerals
image.brief: Dùng lại hình `tray_candle` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): white candle unlit plain background
image.alt.en: A white candle
image.alt.vi: Cây nến trắng
> Main session 11/11 cho đổi món hạt cườm nhựa (không có ảnh hợp lệ). Không lấy "hạt cườm thuỷ tinh" designer gợi ý, vì kệ đã có viên bi thuỷ tinh (hai món bẫy cùng là thuỷ tinh, trùng ý). Dùng lại ảnh cây nến của bài ba (ảnh tách nền trên nền trắng ngà, cùng kiểu kệ): nến trắng, mềm, bóng như sáp, giống hoạt thạch của nhóm Mềm, nên mỗi món bẫy giống một nhóm (đường phèn giống thạch anh, bi thuỷ tinh giống kim cương, nến giống hoạt thạch); nến do con người làm ra, đúng lời nhắn `has_limited`.

#### item tray_quartz
label.en: Quartz
label.vi: Thạch anh
group: tray_hard
image.brief: Dùng lại hình `quartz`. Từ khoá tìm ảnh (EN): white quartz crystal
image.alt.en: A white piece
image.alt.vi: Mẩu màu trắng

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Bốn format: `single_choice` (q1, q4, q5 bốn lựa chọn), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, thẻ từ có hình; trong một câu các lựa chọn cùng là ảnh chụp (q4 là ba hình ghép từ ảnh chụp).
> Vị trí đáp án đúng: hết hiệu lực 15/11 (SK-047, app xáo lựa chọn).
> Mỗi ảnh khoáng vật chỉ làm lựa chọn ở một câu (kể cả câu w1).

### q1
id: 20a5632f-42ce-4c16-bc0c-b572c04b344e
format: single_choice
version: 1
dok: 1
prompt.en: Which mineral is the hardest?
prompt.vi: Khoáng vật nào cứng nhất?
image.brief: Dùng lại hình `tray_pink_granite` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): pink granite rock sample
image.alt.en: A pink rock
image.alt.vi: Hòn đá màu hồng
hint.en: Remember the Mohs' scale picture.
hint.vi: Em nhớ lại ô Thang Mohs nhé.
explanation_correct.en: Only another diamond can scratch a diamond.
explanation_correct.vi: Chỉ kim cương mới cào xước được kim cương.
explanation_wrong.en: Diamond is at the top of Mohs' scale.
explanation_wrong.vi: Kim cương ở bậc cao nhất của thang Mohs.
> Hồng ngọc (rất cứng, đỏ đẹp) và thạch anh (cứng, trong) đều trông cứng, nên có sức hút. Ba ảnh là ảnh khoáng vật của phần Chơi, cùng nền kem; `alt` chỉ tả màu. Bài năm câu w1 hỏi lại ý này với lựa chọn khác.

#### option q1_diamond
correct: true
label.en: diamond
label.vi: kim cương
image.brief: Dùng lại hình `diamond`. Từ khoá tìm ảnh (EN): rough diamond crystal
image.alt.en: A small clear piece
image.alt.vi: Mẩu nhỏ trong suốt

#### option q1_ruby
correct: false
feedback.en: A ruby is very hard, but not the hardest.
feedback.vi: Hồng ngọc rất cứng, nhưng chưa cứng nhất.
label.en: ruby
label.vi: hồng ngọc
image.brief: Dùng lại hình `tray_ruby`. Từ khoá tìm ảnh (EN): rough ruby crystal
image.alt.en: A red piece
image.alt.vi: Mẩu màu đỏ

#### option q1_quartz
correct: false
feedback.en: Quartz is hard, but harder minerals can scratch it.
feedback.vi: Thạch anh cứng, nhưng có thứ cào xước được nó.
label.en: quartz
label.vi: thạch anh
image.brief: Dùng lại hình `quartz`. Từ khoá tìm ảnh (EN): white quartz crystal
image.alt.en: A white piece
image.alt.vi: Mẩu màu trắng

### q2
id: f72313b2-75d2-441e-be8a-11862d15b822
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): smooth pebble stone sand
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội
sentence.en: Rocks are made of {1}.
sentence.vi: Đá được tạo nên từ {1}.
answers: q2_minerals
hint.en: Remember the grains in granite.
hint.vi: Em nhớ lại những hạt trong đá hoa cương nhé.
explanation_correct.en: Each grain in granite is a mineral.
explanation_correct.vi: Mỗi hạt trong đá hoa cương là một khoáng vật.
explanation_wrong.en: Rocks are made of minerals, like granite's grains.
explanation_wrong.vi: Đá tạo nên từ khoáng vật, như hạt trong đá hoa cương.
> Gợi ý không gọi tên ô "Minerals" (trùng nhãn đáp án), chỉ nhắc ví dụ của ô đó. Hình câu hỏi là một hòn cuội bất kỳ, không phải ảnh khoáng vật.
> Thẻ sai có sức hút: đường (đường phèn lấp lánh như tinh thể), thuỷ tinh (viên bi bóng như đá quý); cả hai là món bẫy bé vừa gặp ở phần Chơi. Thẻ đúng là hình ghép từ `mineral` (ba mẫu khoáng vật của kệ). Ba thẻ đều là hình bé đã thấy, cùng là ảnh.

#### bank q2_sugar
label.en: sugar
label.vi: đường
feedback.en: Sugar is a food made from sugar cane.
feedback.vi: Đường là thức ăn làm từ cây mía.
image.brief: Dùng lại hình `tray_rock_sugar` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): rock sugar crystal lump
image.alt.en: Lumps of sugar
image.alt.vi: Mấy cục đường phèn
> `alt` đổi so với chỗ gốc ("Clear lumps" · "Mấy cục trong suốt") để khớp nghĩa thẻ từ "sugar".

#### bank q2_minerals
label.en: minerals
label.vi: khoáng vật
image.brief: Dùng lại hình `mineral`. Từ khoá tìm ảnh (EN): mineral specimens group
image.alt.en: A few different minerals
image.alt.vi: Vài khoáng vật khác nhau

#### bank q2_glass
label.en: glass
label.vi: thuỷ tinh
feedback.en: People make glass by melting sand.
feedback.vi: Thuỷ tinh do người nấu chảy cát mà thành.
image.brief: Dùng lại hình `tray_glass_marble`. Từ khoá tìm ảnh (EN): glass marble toy plain background
image.alt.en: A glass marble
image.alt.vi: Viên bi thuỷ tinh
> Main session 11/11: thẻ "plastic" (ảnh hạt cườm nhựa, không có ảnh hợp lệ) đổi thành "glass" · "thuỷ tinh", dùng ảnh viên bi thuỷ tinh của kệ. Thuỷ tinh bóng, trong như khoáng vật nên vẫn có sức hút.

### q3
id: fb7053d9-42be-482f-ba1d-8c9c1ba96cae
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones can your fingernail scratch?
prompt.vi: Móng tay em cào xước được những thứ nào?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `q2` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): child hand fingernails table top view
image.alt.en: A child's hand on a table
image.alt.vi: Bàn tay bạn nhỏ trên bàn
hint.en: Remember the Check your test picture.
hint.vi: Em nhớ lại ô Đối chiếu nhé.
explanation_correct.en: Talc and gypsum sit lowest on Mohs' scale.
explanation_correct.vi: Hoạt thạch và thạch cao ở hai bậc thấp nhất thang Mohs.
explanation_wrong.en: Talc and gypsum are soft enough to scratch.
explanation_wrong.vi: Hoạt thạch và thạch cao đủ mềm để móng tay cào.
> DOK 2: dùng thang để dự đoán kết quả cào. Ô "Check your test" chỉ nói thạch cao; bé phải suy ra hoạt thạch (mềm hơn thạch cao) cũng bị cào xước. Đá vôi là bẫy: bài ba đã thử, chỉ thìa mới cào xước được; thạch anh tím trông đẹp, trong như thạch cao.
> Hỏi "Which ones" · "những thứ nào", không hỏi "Which minerals", vì đá vôi là đá. Ba ảnh của bài này và bài ba, cùng nền kem; `alt` chỉ tả màu.

#### option q3_amethyst
correct: false
feedback.en: Amethyst is a kind of quartz, so it is hard.
feedback.vi: Thạch anh tím là thạch anh, nên rất cứng.
label.en: amethyst
label.vi: thạch anh tím
image.brief: Dùng lại hình `tray_amethyst`. Từ khoá tìm ảnh (EN): amethyst crystal cluster
image.alt.en: A purple piece
image.alt.vi: Mẩu màu tím

#### option q3_talc
correct: true
label.en: talc
label.vi: hoạt thạch
image.brief: Dùng lại hình `tray_talc`. Từ khoá tìm ảnh (EN): talc mineral sample
image.alt.en: A pale cream piece
image.alt.vi: Mẩu màu trắng ngà

#### option q3_limestone
correct: false
feedback.en: Limestone is a bit harder than your fingernail.
feedback.vi: Đá vôi cứng hơn móng tay em một chút.
label.en: limestone
label.vi: đá vôi
image.brief: Dùng lại hình `tray_limestone` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): limestone rock sample
image.alt.en: A pale grey rock
image.alt.vi: Hòn đá màu xám nhạt

#### option q3_gypsum
correct: true
label.en: gypsum
label.vi: thạch cao
image.brief: Dùng lại hình `tray_gypsum`. Từ khoá tìm ảnh (EN): selenite gypsum crystal sample
image.alt.en: A clear piece
image.alt.vi: Mẩu trong suốt

### q4
id: 3cc741d5-0f99-4f66-9c21-3a040971a0a7
format: single_choice
version: 1
dok: 2
prompt.en: Which row goes from softest to hardest?
prompt.vi: Hàng nào xếp từ mềm nhất tới cứng nhất?
image.brief: Dùng lại hình `geologist`. Từ khoá tìm ảnh (EN): geologist field work back view rock outcrop
image.alt.en: A geologist looking at rocks
image.alt.vi: Nhà địa chất đang xem đá
hint.en: Find the softest one first.
hint.vi: Em tìm khoáng vật mềm nhất trước nhé.
explanation_correct.en: Diamond can scratch both quartz and talc.
explanation_correct.vi: Kim cương cào xước được cả thạch anh và hoạt thạch.
explanation_wrong.en: Soft to hard: talc, then quartz, then diamond.
explanation_wrong.vi: Từ mềm tới cứng: hoạt thạch, thạch anh, kim cương.
> DOK 2: xếp thứ tự theo thang (thay câu `order_sequence`, app 0.1.0 chưa hiện). Hàng ngược (kim cương tới hoạt thạch) bẫy bé đọc nhầm chiều; hàng trộn bẫy bé chỉ nhìn khoáng vật cuối. Gợi ý là cách làm, không gọi tên lựa chọn.
> Ba lựa chọn là ba hình ghép cùng ba ảnh, chỉ khác thứ tự; nhãn cùng một dạng (ba tên, hai dấu phẩy). [Nghe thử] ba nhãn VI có dấu phẩy.
> [CẦN KIỂM] Thứ tự: hoạt thạch bậc một, thạch anh bậc bảy, kim cương bậc mười.

#### option q4_soft_first
correct: true
label.en: talc, quartz, diamond
label.vi: hoạt thạch, thạch anh, kim cương
image.brief: [sơ đồ ghép ảnh] Ghép ba ảnh thành một hàng ngang từ trái sang phải trên nền kem, cùng cỡ, theo thứ tự `tray_talc`, `quartz`, `diamond`; không có chữ, không có số, không có mũi tên.
image.alt.en: Talc, quartz and diamond in a row
image.alt.vi: Hoạt thạch, thạch anh và kim cương xếp thành hàng

#### option q4_mixed
correct: false
feedback.en: This row puts quartz before the softer talc.
feedback.vi: Hàng này để thạch anh trước hoạt thạch mềm hơn.
label.en: quartz, talc, diamond
label.vi: thạch anh, hoạt thạch, kim cương
image.brief: [sơ đồ ghép ảnh] Ghép ba ảnh thành một hàng ngang từ trái sang phải trên nền kem, cùng cỡ, theo thứ tự `quartz`, `tray_talc`, `diamond`; không có chữ, không có số, không có mũi tên.
image.alt.en: Quartz, talc and diamond in a row
image.alt.vi: Thạch anh, hoạt thạch và kim cương xếp thành hàng

#### option q4_hard_first
correct: false
feedback.en: This row starts with the hardest one.
feedback.vi: Hàng này bắt đầu bằng thứ cứng nhất.
label.en: diamond, quartz, talc
label.vi: kim cương, thạch anh, hoạt thạch
image.brief: [sơ đồ ghép ảnh] Ghép ba ảnh thành một hàng ngang từ trái sang phải trên nền kem, cùng cỡ, theo thứ tự `diamond`, `quartz`, `tray_talc`; không có chữ, không có số, không có mũi tên.
image.alt.en: Diamond, quartz and talc in a row
image.alt.vi: Kim cương, thạch anh và hoạt thạch xếp thành hàng

### q5
id: 851faf50-400d-4dff-95ce-0eb97ef98b6d
format: single_choice
version: 1
dok: 2
prompt.en: Which one is hard, but breaks if it falls?
prompt.vi: Thứ nào cứng, nhưng rơi xuống thì vỡ?
image.brief: Dùng lại hình `w1` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): Vietnamese village kitchen interior
image.alt.en: A village kitchen
image.alt.vi: Gian bếp ở làng quê
hint.en: Remember the Heavy or hard picture.
hint.vi: Em nhớ lại ô Nặng hay cứng nhé.
explanation_correct.en: China is hard to scratch, but it can break.
explanation_correct.vi: Bát sứ khó cào xước, nhưng rơi thì vỡ.
explanation_wrong.en: Hard things, like a china bowl, can still break.
explanation_wrong.vi: Đồ cứng như bát sứ vẫn có thể vỡ.
> DOK 2, bốn lựa chọn (bảng vị trí: đáp án thứ tư). Câu chạm `breaks_means_soft` (không gắn key; bài này gắn key ở câu q6). Bé còn nghĩ "vỡ là mềm" sẽ thấy câu hỏi vô lý và dễ chọn cái gối (mềm). Cốc nhựa cứng mà không vỡ, quả bóng cao su nảy lên.
> Bốn ảnh đều mới, cùng là đồ dùng trong nhà trên nền trơn. Hình câu hỏi là gian bếp của bài một, không thấy rõ bát.
> [CẦN KIỂM] Sứ cứng nhưng giòn; cốc nhựa thường không vỡ khi rơi (kinh nghiệm phổ thông).

#### option q5_pillow
correct: false
feedback.en: A pillow is soft, not hard.
feedback.vi: Cái gối mềm, không cứng.
label.en: pillow
label.vi: cái gối
image.brief: [hình vẽ] Một cái gối trắng trơn đặt trên nền trơn, vẽ chéo; cùng cỡ trong khung như ba đồ kia; không có hoa văn chữ, không có nhãn. Từ khoá tìm ảnh (EN): white pillow plain background
image.alt.en: A white pillow
image.alt.vi: Cái gối trắng

#### option q5_ball
correct: false
feedback.en: A rubber ball bounces when it falls.
feedback.vi: Quả bóng cao su rơi xuống thì nảy lên.
label.en: rubber ball
label.vi: quả bóng cao su
image.brief: [hình vẽ] Một quả bóng cao su nhỏ một màu, không in hình, đặt trên nền trơn, vẽ ngang; cùng cỡ trong khung như ba đồ kia; không có logo, không có chữ. Từ khoá tìm ảnh (EN): small rubber ball plain background
image.alt.en: A rubber ball
image.alt.vi: Quả bóng cao su

#### option q5_cup
correct: false
feedback.en: A plastic cup bends a little and rarely breaks.
feedback.vi: Cốc nhựa hơi dẻo, rơi thường không vỡ.
label.en: plastic cup
label.vi: cái cốc nhựa
image.brief: [hình vẽ] Một cái cốc nhựa cứng một màu (kiểu cốc uống nước của trẻ), đặt trên nền trơn, vẽ ngang; cùng cỡ trong khung như ba đồ kia; không có hình in, không có chữ. Từ khoá tìm ảnh (EN): plastic cup plain background
image.alt.en: A plastic cup
image.alt.vi: Cái cốc nhựa

#### option q5_bowl
correct: true
label.en: china bowl
label.vi: cái bát sứ
image.brief: [hình vẽ] Một cái bát sứ trắng ăn cơm kiểu Việt Nam, còn nguyên, đặt trên nền trơn, vẽ chéo; cùng cỡ trong khung như ba đồ kia; không có hoa văn chữ, không có dấu hiệu. Từ khoá tìm ảnh (EN): white porcelain rice bowl plain background
image.alt.en: A white china bowl
image.alt.vi: Cái bát sứ trắng

### q6
id: 56ec4a5b-8ab6-4cb0-8eb8-b3f2bcfd415a
format: true_false
version: 1
dok: 3
misconception: heavy_means_hard
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: My nail scratches this heavy rock, so it is soft.
statement.vi: Móng tay cào xước hòn đá nặng này, nên nó mềm.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": một tảng đá xà phòng to màu xám xanh, mặt mịn như sáp (vẽ theo ảnh `tray_soapstone` của bài ba), cỡ gần bằng quả bưởi, đặt trên bàn; bên cạnh là bàn tay một bạn nhỏ, cho thấy tảng đá to và nặng so với bàn tay; mặt đá chưa có vết xước; nền kem trơn; chỉ thấy bàn tay, không vẽ nét mặt, không có chữ.
image.alt.en: A big rock next to a child's hand
image.alt.vi: Tảng đá to bên bàn tay bạn nhỏ
hint.en: Think about which test Na used.
hint.vi: Em nghĩ xem Na đã thử bằng cách nào nhé.
explanation_correct.en: A heavy rock can still be soft, as scratching shows.
explanation_correct.vi: Đá nặng vẫn có thể mềm, thử cào là biết.
explanation_wrong.en: Weight does not tell you hardness, but scratching does.
explanation_wrong.vi: Cân nặng không cho biết độ cứng, thử cào mới biết.
feedback_false.en: Na used a scratch test, not the weight.
feedback_false.vi: Na đã thử cào, không dựa vào cân nặng.
> DOK 3: Na dựa vào phép thử cào, không dựa vào cân nặng. Bé còn tin "nặng thì cứng" sẽ chọn "Na chưa đúng". Lời Na đúng chữ bảng "Câu sáu, lời Na" ở `_topic.md`. Đáp án Đúng.
> Hình là tình huống (tảng đá to bên tay), không cho thấy vết xước; `alt` không nói "mềm". Cả màn mười tám từ EN (prompt ba, instruction bốn, lời Na mười một).
> Rà chữ tester 11/11 (N6): tảng đá trong hình đổi từ thạch cao sang đá xà phòng (Na nói "This rock", và bài này giữ thạch cao ở vai khoáng vật). Chữ trẻ đọc không đổi.

## Từ vựng

### mineral
id: 0cddca48-8a74-45e8-91e1-166a3beed6f8
tier: core
term.en: mineral
term.vi: khoáng vật
example.en: Quartz, amethyst and ruby are minerals.
example.vi: Thạch anh, thạch anh tím và hồng ngọc là khoáng vật.
image.brief: [sơ đồ ghép ảnh] Ba mẫu khoáng vật của bài đặt sát nhau trên nền trắng ngà, cả cụm cỡ trong khung như một vật: `quartz`, `tray_amethyst`, `tray_ruby`; không có nhãn số, không có chữ, không có tay người. Câu q2 (thẻ đúng) dùng lại hình này.
> Theo hình designer 11/11: không có ảnh nhóm khoáng vật không nhãn, nên ghép ba mẫu của bài. Câu ví dụ đổi theo ba mẫu trong hình.
image.alt.en: A few different minerals
image.alt.vi: Vài khoáng vật khác nhau
> Câu ví dụ khác câu điền từ q2.

### scale
id: 79264bf8-3d87-4e93-b1f3-ca21c6d96bd1
tier: core
term.en: scale
term.vi: thang đo
example.en: Mohs' scale goes from soft to hard.
example.vi: Thang Mohs đi từ mềm tới cứng.
image.brief: Dùng lại hình `explore_scale`.
image.alt.en: A staircase with minerals on some steps
image.alt.vi: Cầu thang có khoáng vật đặt trên vài bậc
> `scale` ở đây là thang đo; *Khủng long* bài hai có `scales` (vảy), nên câu ví dụ có "Mohs' scale" (`_topic.md`). Chuỗi VI có "Mohs" (cần `READINGS`).

### geologist
id: 5c855d90-f83a-46f3-8498-0a30a7d99f98
tier: core
term.en: geologist
term.vi: nhà địa chất
example.en: A geologist studies rocks and minerals.
example.vi: Nhà địa chất nghiên cứu đá và khoáng vật.
image.brief: [hình vẽ] Một nhà địa chất người lớn đứng trước một vách đá nhiều lớp ngoài trời, vẽ từ phía sau, đội mũ bảo hộ vàng, đeo ba lô, giơ kính lúp soi mặt đá; không vẽ nét mặt, không có logo hay chữ trên áo, mũ; không có búa địa chất (bài mười lăm dùng hình này làm hình câu hỏi q1, mà đáp án câu đó là búa địa chất). Câu q4 (hình câu hỏi), bài năm câu w1 và bài mười lăm (món Chơi, hình câu q1, từ `geologist`) dùng lại ảnh này. Từ khoá tìm ảnh (EN): geologist field work back view rock outcrop
image.alt.en: A geologist looking at rocks
image.alt.vi: Nhà địa chất đang xem đá

### diamond
id: 62e18f65-4c2a-4833-bd15-eaf4fcafba73
tier: extra
term.en: diamond
term.vi: kim cương
example.en: Diamond is at the top of Mohs' scale.
example.vi: Kim cương ở bậc cao nhất của thang Mohs.
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: viên kim cương thô hình tám mặt, hơi đục (ảnh James St. John, CC BY 2.0) tách khỏi nền ảnh gốc, đặt giữa nền trắng ngà chung, có bóng mềm; không có nhãn số, thước, tay người, chữ; không phải nhẫn hay kim cương đã mài. Món tray_diamond, câu q1, hình ghép câu q4, hình vẽ explore_scale, bài năm câu w1 và bài mười lăm dùng lại hình này. Từ khoá tìm ảnh (EN): rough diamond crystal
image.alt.en: A small clear piece
image.alt.vi: Mẩu nhỏ trong suốt
> Không nói giá tiền, không nói trang sức (mục An toàn ở `_topic.md`). Chuỗi VI có "Mohs".

### quartz
id: 217cd3fe-254c-4855-b718-ff22a9ebf2d7
tier: extra
term.en: quartz
term.vi: thạch anh
example.en: A fingernail cannot scratch quartz.
example.vi: Móng tay không cào xước được thạch anh.
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: cụm tinh thể thạch anh trắng trong, đầu nhọn sáu cạnh (ảnh James St. John, CC BY 2.0) tách khỏi nền ảnh gốc, đặt giữa nền trắng ngà chung, có bóng mềm; không có nhãn số, thước, tay người, chữ. Món tray_quartz, câu q1, hình ghép câu q4, hình ghép từ mineral, hình vẽ explore_scale, bài năm câu w1 và bài mười lăm dùng lại hình này. Từ khoá tìm ảnh (EN): white quartz crystal
image.alt.en: A white piece
image.alt.vi: Mẩu màu trắng

## Thưởng

### ruby_card
id: 53f9f99f-15ea-4943-83f2-7ef3e1bb644f
set: rocks
rarity: common
name.en: Ruby
name.vi: Hồng ngọc
tag.en: Very hard
tag.vi: Rất cứng
fact.en: Ruby is very hard. Only diamond is harder on Mohs' scale.
fact.vi: Hồng ngọc rất cứng. Trên thang Mohs, chỉ kim cương cứng hơn hồng ngọc.
> [CẦN KIỂM] Hồng ngọc ở bậc chín, kim cương bậc mười; trong mười khoáng vật mẫu của thang Mohs, chỉ kim cương cứng hơn (biên tập nhớ). Không nói giá tiền, không nói trang sức (main session chốt 11/11 giữ thẻ hồng ngọc). Chuỗi VI có "Mohs".
image.brief: Dùng lại hình `tray_ruby`. Từ khoá tìm ảnh (EN): rough ruby crystal
image.alt.en: A red piece
image.alt.vi: Mẩu màu đỏ

## Ghi chú cho hoạ sĩ

- **Loại hình (theo hình designer 11/11):** kệ Chơi, câu w1, q1, q2, q3 là ảnh (mẫu khoáng vật là hình ghép một phần: mẫu tách nền đặt trên nền trắng ngà; từ `mineral` ghép ba mẫu); câu q4 là ba hình ghép; câu q5, hình câu q6, ô `explore_scale`, `explore_heavy`, từ `geologist` là hình tự vẽ. Mỗi câu một loại hình. Hình không có chữ, không có số. Danh sách dưới đây là danh sách lúc soạn; số thật: một ảnh nguồn mới (bi thuỷ tinh), tám hình vẽ, mười hình ghép.
- **Bộ mẫu đá (gốc ở bài này):** `tray_talc`, `tray_gypsum`, `tray_amethyst`, `tray_ruby`, `diamond`, `quartz`. Cùng nền kem, cùng góc chụp với mẫu của bài hai, bài ba. Kim cương, hồng ngọc dạng thô, không phải đồ trang sức. Rà chữ tester 11/11 (N6): `tray_gypsum` (tinh thể thạch cao trong) nay là gốc ở bài này, chuyển từ bài ba; ảnh, key, từ khoá giữ nguyên.
- **`alt` sáu khoáng vật** (rà chữ tester 11/11, N5): một khuôn "A <màu> piece" · "Mẩu <màu>"; không gọi "rock", "crystal", "mineral".
- **Ảnh cần tìm (mười bốn):**
  - Chơi: hoạt thạch, thạch cao tinh thể trong, thạch anh tím, hồng ngọc thô, viên bi thuỷ tinh (ảnh riêng); cây nến dùng lại của bài ba.
  - Quiz: cái gối, quả bóng cao su, cốc nhựa, bát sứ trắng (q5).
  - Từ vựng: cụm khoáng vật (`mineral`), nhà địa chất từ phía sau (`geologist`), kim cương thô (`diamond`), thạch anh trắng (`quartz`).
- **Hình tự vẽ (ba):** `explore_scale` (cầu thang mười bậc, sáu khoáng vật); `explore_heavy` (cân đĩa, tảng đá to và hòn đá nhỏ); hình câu q6 (tảng đá xà phòng to bên bàn tay trẻ, vẽ theo ảnh `tray_soapstone` của bài ba).
- **Hình ghép (ba):** câu q4, ba hàng hoạt thạch, thạch anh, kim cương theo ba thứ tự khác nhau, cùng cỡ.
- **Dùng lại trong bài:** `diamond` (món, q1, hình ghép q4); `quartz` (món, q1, hình ghép q4); `tray_ruby` (q1, thẻ `ruby_card`); `tray_talc` (q3, hình ghép q4); `tray_gypsum` (q3); `tray_amethyst` (q3); `tray_glass_marble` (thẻ q2); `mineral` (thẻ q2); `geologist` (q4); `explore_scale` (từ `scale`).
- **Dùng lại từ bài khác:** bài một `w1` (q5); bài ba `tray_candle` (món bẫy); bài hai `q1` (w1), `granite` (w1, ô `explore_minerals`), `tray_pink_granite` (q1), `tray_rock_sugar` (món bẫy, thẻ q2); bài ba `chalk` (w1), `explore_properties` (w2), `explore_scratch` (ô `explore_check`), `tray_limestone` (q3), `q2` (q3); *Bề mặt Trái Đất* `nui-lua/tray_dark_rock` (w1); *Hô hấp* `vi-sao-ta-phai-tho/w1_stone` (q2).
- **Gốc cho bài sau:** `diamond`, `quartz`, `geologist`, `tray_gypsum` (bài năm w1); `tray_talc`, `tray_gypsum` (bài sáu câu q4; B cần trỏ `tray_gypsum` về bài này và chép `alt` mới).
- **Khó tìm và phương án thay:**
  - Kim cương thô, hồng ngọc thô có giấy phép hợp lệ: ưu tiên Smithsonian (CC0), USGS. Không có thì để designer báo; không dùng ảnh nhẫn, đá đã mài.
  - Hoạt thạch: ảnh mẫu hay bị lẫn với bột phấn rôm; chỉ lấy mẫu khối.
  - Thang Mohs: các khoáng vật trên bậc vẽ theo ảnh đã chọn ở Bộ mẫu đá, để bé nhận ra.
- **Cùng kiểu trong một câu:** w1, q1, q3 mẫu đá, khoáng vật cùng nền trắng ngà; q2 ba ảnh (đường phèn, ba khoáng vật ghép, bi thuỷ tinh); q4 ba hình ghép cùng cỡ; q5 bốn hình vẽ đồ dùng.
- **Màu:** Học: khoáng vật `vang_hoe`, thang Mohs `do_son`, đối chiếu `cham`, nặng hay cứng `gi_dong`. Chơi: mềm `vang_hoe`, cứng `cham`, rất cứng `do_son`, nhóm `limit` `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` mỗi nhóm hai món, một nhóm `limit` ba món, chín món.
  - Khởi động: `single_choice` (w1), `true_false` (w2, đáp án Sai); cả hai ôn bài ba.
  - Quiz: `single_choice` (q1, q4, q5 bốn lựa chọn), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6, `speaker: na`, đáp án Đúng). Bốn format.
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `heavy_means_hard`. `breaks_means_soft` chỉ ở ô Học và câu q5, không gắn key.
- **Vị trí đáp án đúng:** hết hiệu lực 15/11 (SK-047, app xáo lựa chọn và kho thẻ từ).
- **Tham chiếu:** `recall_from.lesson` trỏ `da-va-dat/da-nao-cung-hon` (w1, w2); bài ba phải có id trước.
- **`READINGS`:** "Mohs" có trong chuỗi VI ở tiêu đề, mục tiêu, ý chính hai và ba, ô `explore_scale`, `explore_check`, `messages.balanced`, câu q1 (giải thích khi sai), từ `scale`, từ `diamond`, thẻ `ruby_card`. Đề xuất đọc "mốt", nghe thử rồi chốt (`_topic.md` mục Đề xuất).
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Hoạt thạch, Thạch anh, Kim cương → đạt;
  - chạm Cây nến → `has_limited`;
  - chạm Thạch cao, Thạch anh tím, Thạch anh (thiếu rất cứng) → `missing.tray_very_hard`; chạm Hồng ngọc → `full`; bỏ Thạch anh, đặt Hồng ngọc → đạt.
- **Dòng điều kiện màn Chơi:** "Cần đủ Mềm, Cứng, Rất cứng · Không phải khoáng vật".
- **Số từ EN trên một màn:**
  - Học khoảng ba mươi hai từ: mục tiêu 8, hướng dẫn 3, bốn nhãn 9, câu dài nhất 10, ô Từ mới 2.
  - Khởi động và Quiz: nhiều nhất là q4 (khoảng mười sáu: câu hỏi 7, ba nhãn 9) và q6 (mười tám).
- **Thí nghiệm ở nhà (chỉ ghi cho người duyệt):** cùng người lớn, cào móng tay rồi cán thìa inox lên vài hòn đá, xếp từ mềm tới cứng, rồi so với thang Mohs trong sách. Không đập đá, không dùng đinh, dao.
- **Từ EN có thể ngoài Starters/Movers:** mineral, scale, geologist, hardness, talc, gypsum, quartz, amethyst, ruby, diamond, crystal, candle, glass, marble, china, rubber, pillow, weight, staircase.
- **Giọng đọc:** chuỗi VI không có chữ số, ký hiệu, dấu "—". Nghe thử EN "Mohs' scale", "amethyst", "quartz" và ba nhãn có dấu phẩy ở q4.
