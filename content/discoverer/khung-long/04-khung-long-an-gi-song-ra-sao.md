---
id: db1ae2e8-cfcf-442e-a7bc-b433141c43d0
topic: khung-long
slug: khung-long-an-gi-song-ra-sao
order: 4
stage: apply
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: How dinosaurs lived
vi: Khủng long ăn gì, sống ra sao?
> Nháp do AI soạn (content-editor), chưa duyệt. Ticket SK-032, ngày 9/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids`. Đã sửa theo rà chữ tester 9/11 (ticket SK-032, mục "Sửa theo rà chữ").

## Mục tiêu
en: I can use fossil clues to say how dinosaurs lived.
vi: Em dựa vào manh mối từ hoá thạch để kể khủng long sống ra sao.
> Bài vận dụng (`stage: apply`, Duy 9/11 đổi chỗ bài ba và bài bốn). Bài ba đã dạy hoá thạch là gì; bài này đọc hoá thạch như manh mối: răng cho biết thức ăn, dấu chân cho biết đi theo đàn, tổ trứng cho biết khủng long con nở ra sao. Mục tiêu, ba ý chính và từ vựng giữ đúng hàng bài bốn trong bảng kế hoạch ở `_topic.md`.

## Ý chính
1.en: Baby dinosaurs hatched from eggs in nests.
1.vi: Khủng long con nở ra từ trứng trong tổ.
> [CẦN KIỂM] Mọi loài khủng long đã biết đều đẻ trứng; trứng đặt trong tổ trên mặt đất (có loài vùi trứng trong đất cát hoặc đống lá). Biên tập nhớ, chưa tra nguồn.
2.en: Many dinosaurs ate plants, and some ate meat.
2.vi: Nhiều loài khủng long ăn thực vật, một số loài ăn thịt.
> [CẦN KIỂM] Số loài ăn thực vật nhiều hơn số loài ăn thịt (`all_dinosaurs_ate_meat` ở `_topic.md`). Chữ cho trẻ chỉ nói "nhiều loài", "một số loài".
3.en: Teeth and footprints are clues to how they lived.
3.vi: Răng và dấu chân là manh mối cho biết chúng sống ra sao.

## Khởi động

> Ba câu theo bảng Khởi động ở `_topic.md`, giãn cách theo syllabus-progression mục 7.
> - w1, w2 ôn bài ba *Hoá thạch kể chuyện khủng long* (bài trước, cách khoảng một ngày). w1 ôn ý "hoá thạch là thứ từ rất lâu về trước, đã hoá thành đá"; w2 ôn ý "dấu chân và trứng cũng thành hoá thạch", chuẩn bị cho ô Trứng và tổ, ô Cách tự vệ của bài này.
> - w3 ôn bài hai *Khủng long là gì?* (cách hai bài): thằn lằn bay sống cùng thời khủng long. Câu này không gắn key misconception; Quiz dành câu đó cho `all_dinosaurs_ate_meat` (q6).
> - Rà chéo 9/11 đã đối chiếu với bài ba thật: w1 dùng đúng ba món của phần Chơi bài ba (dấu chân in trên đá, dấu chân trên cát ướt, khủng long đồ chơi bằng nhựa), cùng chữ và cùng hình; w2 ôn ý một bài ba ("Fossils are bones, teeth, eggs and footprints from long ago"); w3 ôn ý ba và câu q6 bài hai.
> - Đáp án Đúng/Sai theo bảng ở `_topic.md`: w2 Sai, w3 Đúng.

### w1
id: a5d9bd1b-3f94-42c5-8b12-2871616300b7
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: khung-long/hoa-thach-ke-chuyen-khung-long
prompt.en: Which one is a fossil?
prompt.vi: Cái nào là hoá thạch?
image.brief: Dùng lại hình `hoa-thach-ke-chuyen-khung-long/q4`
image.alt.en: Tools for finding fossils
image.alt.vi: Dụng cụ tìm hoá thạch
hint.en: Fossils are from long, long ago. Which one is that old?
hint.vi: Hoá thạch có từ rất lâu về trước. Cái nào cũ như vậy?
explanation_correct.en: This footprint is millions of years old.
explanation_correct.vi: Dấu chân này có từ hàng triệu năm trước.
explanation_wrong.en: Only the footprint in rock is millions of years old.
explanation_wrong.vi: Chỉ dấu chân in trên đá có từ hàng triệu năm trước.
> Hình câu hỏi là cảnh chung, không có hoá thạch, để không lộ đáp án (Quy ước hình, mục bốn): dùng lại ảnh dụng cụ tìm hoá thạch của câu q4 bài ba (rà chéo 9/11, thay cho ảnh bàn làm việc riêng; ảnh Duy duyệt ở SK-033 là bộ dụng cụ trên nền trắng, không có vách đá bãi đào). Câu q2 cũng dùng hình này.
> Câu phân loại (luật rà chéo 9/11): nhãn và `alt` của ba lựa chọn không có chữ "fossil" · "hoá thạch".

#### option w1_toy
correct: false
feedback.en: A toy is new, made of plastic.
feedback.vi: Đồ chơi là đồ mới, làm bằng nhựa.
label.en: toy dinosaur
label.vi: khủng long đồ chơi
image.brief: Dùng lại hình `q6` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): plastic toy dinosaur on table
image.alt.en: A plastic toy dinosaur
image.alt.vi: Khủng long đồ chơi bằng nhựa
> SK-033 (10/11): món `tray_toy` bài ba dùng nguyên ảnh câu q6 bài một, nên lựa chọn này trỏ thẳng về ảnh gốc đó (Quy ước hình mục ba: không trỏ qua một hình dùng lại khác), đúng như file chọn ảnh. Vẫn cùng hình với món ở phần Chơi bài ba mà câu này ôn lại.

#### option w1_rock
correct: true
label.en: footprint in rock
label.vi: dấu chân in trên đá
image.brief: Dùng lại hình `hoa-thach-ke-chuyen-khung-long/tray_rock_print`
image.alt.en: A dinosaur footprint in rock
image.alt.vi: Dấu chân khủng long in trên đá
> Nhãn tiếng Việt đổi "dấu chân trong đá" thành "dấu chân in trên đá" cho khớp đúng tên món ở phần Chơi bài ba (bảng Tên gọi).
> Rà chữ tester 9/11 (n1): đáp án chuyển lên thứ hai (trước đây thứ ba).

#### option w1_sand
correct: false
feedback.en: Prints in wet sand soon wash away.
feedback.vi: Dấu chân trên cát ướt sớm bị nước xoá.
label.en: footprint in wet sand
label.vi: dấu chân trên cát ướt
image.brief: Dùng lại hình `hoa-thach-ke-chuyen-khung-long/tray_sand_prints`
image.alt.en: Dog footprints in wet sand
image.alt.vi: Dấu chân chó trên cát ướt
> Rà chữ tester 9/11 (N4): hình gốc ở bài ba đổi từ dấu chân chim sang dấu chân chó, để không gợi chuyện chim và khủng long (Duy 9/11). Chỗ khác nhau với lựa chọn w1_rock vẫn nhìn thấy được: cát ướt hôm nay và đá rất cũ, đúng ý bé cần nhớ.

### w2
id: d61b001a-e783-41a0-a926-3f09ba13f458
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: khung-long/hoa-thach-ke-chuyen-khung-long
prompt.en: Only bones can become fossils.
prompt.vi: Chỉ có xương mới thành hoá thạch.
image.brief: Dùng lại hình `hoa-thach-ke-chuyen-khung-long/tray_rock_bone`
image.alt.en: A fossil bone in a museum
image.alt.vi: Khúc xương hoá thạch trong bảo tàng
answer: false
hint.en: Remember the fossil game in the last lesson.
hint.vi: Em nhớ lại trò tìm hoá thạch ở bài trước nhé.
explanation_correct.en: Teeth, footprints and eggs can be fossils, too.
explanation_correct.vi: Răng, dấu chân và trứng cũng có thể thành hoá thạch.
explanation_wrong.en: Footprints and eggs can turn to rock, too.
explanation_wrong.vi: Dấu chân và trứng cũng có thể hoá đá.
feedback_true.en: In the fossil game, you found eggs in rock.
feedback_true.vi: Ở trò chơi, em đã tìm thấy trứng trong đá.
> Câu trong bảng Khởi động ở `_topic.md`, đáp án Sai. Giải thích khi đúng không mở đầu bằng "Yes!", vì bé vừa chọn Sai. Hình chỉ có một khúc xương, không có trứng hay dấu chân, để không lộ đáp án.
> Rà chữ tester 9/11 (N2): gợi ý cũ "Tất cả đều là xương sao?" đã nói ý trả lời. Gợi ý mới chỉ chỗ cần nhớ (phần Chơi "Tìm ba loại hoá thạch" của bài ba), không nêu đáp án.

### w3
id: 516b3c14-2fae-498e-a6cd-d06f750645b9
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: khung-long/khung-long-la-gi
prompt.en: Flying reptiles lived at the same time as dinosaurs.
prompt.vi: Thằn lằn bay sống cùng thời với khủng long.
image.brief: Dùng lại hình `khung-long-la-gi/tray_pterosaur` (tranh thằn lằn bay đang bay trên nền trắng, không có khủng long, như câu q6 bài hai; không cắt nửa trên của hình ghép explore_not_dinosaurs bài hai như brief đầu)
image.alt.en: A painting of a flying reptile
image.alt.vi: Tranh vẽ thằn lằn bay
answer: true
hint.en: Think of the flying reptile you met. When did it live?
hint.vi: Em nhớ lại con thằn lằn bay. Nó sống vào thời nào?
explanation_correct.en: They lived then, but they were not dinosaurs.
explanation_correct.vi: Chúng sống cùng thời, nhưng không phải khủng long.
explanation_wrong.en: Flying reptiles and dinosaurs lived at the same time.
explanation_wrong.vi: Thằn lằn bay và khủng long sống cùng thời.
feedback_false.en: Flying reptiles soared above dinosaurs long ago.
feedback_false.vi: Thằn lằn bay từng bay trên đầu khủng long.
> Câu trong bảng Khởi động ở `_topic.md`, đáp án Đúng. Giải thích khi đúng nhắc lại cả ý sửa `big_old_animal_is_dinosaur` của bài hai (sống cùng thời nhưng không phải khủng long), không gắn key.
> Hình không có khủng long trong cảnh: có khủng long thì hình lộ đáp án "cùng thời". `alt` ghi "Tranh vẽ", theo Quy ước hình mục năm.
> [CẦN KIỂM] Thằn lằn bay sống cùng thời khủng long, từ kỷ Tam Điệp tới cuối kỷ Phấn Trắng (biên tập nhớ, chưa tra nguồn).

## Học

> Bốn ô theo bảng kế hoạch, xếp từ thấy được tới suy ra:
> - ô Trứng và tổ (ý một): tổ trứng hoá thạch, nhìn là thấy;
> - ô Khủng long ăn thực vật và ô Khủng long ăn thịt (ý hai): đặt hai loại răng cạnh nhau để bé so;
> - ô Cách tự vệ (ý ba): dấu chân cả đàn là manh mối cho điều không ai nhìn thấy được (đi theo đàn), thêm sừng, giáp, đuôi chuỳ.
>
> Ô thứ tư đổi nhãn từ "Sống theo đàn" thành "Staying safe" · "Cách tự vệ", để trùng tên nhóm bắt buộc thứ ba ở phần Chơi. Câu của ô vẫn nói về đàn (dấu chân là manh mối), sừng và giáp nằm ở món ví dụ. `_topic.md` đã sửa theo (rà chéo 9/11).
> Không dùng `sentence_card`: app 0.1.0 chỉ hiện `explore_groups` đầu tiên và `word_list` đầu tiên ở màn Học.

### explore
id: 1b682532-48a5-4eae-9798-1c65e5d1f28c
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_eggs
label.en: Eggs and nests
label.vi: Trứng và tổ
color: vang_hoe
sentence.en: Baby dinosaurs hatched from eggs in nests.
sentence.vi: Khủng long con nở ra từ trứng trong tổ.
image.brief: Dùng lại hình `hoa-thach-ke-chuyen-khung-long/tray_rock_nest`, không thêm nhãn chữ (Duy 10/11: hình không có chữ)
image.alt.en: A fossil dinosaur nest with eggs
image.alt.vi: Tổ trứng khủng long hoá thạch
examples.1.en: many eggs in one nest
examples.1.vi: nhiều quả trứng trong một tổ
examples.2.en: tiny bones inside an egg
examples.2.vi: xương khủng long con nằm trong trứng
examples.3.en: some parents cared for babies
examples.3.vi: một số loài chăm sóc con
> [CẦN KIỂM] Các nhà khoa học đã tìm thấy trứng hoá thạch còn xương khủng long con bên trong, nhờ vậy biết trứng của loài nào (biên tập nhớ, chưa tra nguồn).
> [CẦN KIỂM] Tổ có nhiều trứng, vỏ trứng vỡ và khủng long con ở gần tổ cho thấy một số loài chăm sóc con (biên tập nhớ ví dụ Maiasaura). Chữ nói "một số loài", không nói "mọi loài" (`_topic.md`, Ghi chú "Bài bốn, ô Sống theo đàn").
> Hình là ổ trứng hoá thạch trong đá của phần Chơi bài ba (rà chéo 9/11, cùng nội dung nên không tìm ảnh riêng). Lựa chọn q1_nest và từ `nest` dùng lại cùng ảnh này (hình không có nhãn chữ, Duy 10/11).

#### group explore_plants
label.en: Plant-eaters
label.vi: Khủng long ăn thực vật
color: gi_dong
sentence.en: Many dinosaurs ate plants, like ferns and cycads.
sentence.vi: Nhiều khủng long ăn thực vật, như dương xỉ, vạn tuế.
> SK-044 (14/11, A2): câu VI cũ mười bốn tiếng, nay mười một; câu EN giữ nguyên.
image.brief: [ảnh] Hộp sọ khủng long cổ dài (Diplodocus, bảo tàng Field ở Chicago) nhìn ngang, thấy rõ hàng răng mảnh, thẳng như bút chì ở đầu mõm; hộp sọ là bản đúc có phần trám màu xám; không có người, không thấy biển tên, không thêm nhãn chữ (Duy 10/11). Chỉ một ảnh, không ghép thêm dương xỉ và vạn tuế như brief đầu (một hình chỉ nhận một ảnh). Từ khoá tìm ảnh (EN): Diplodocus skull teeth museum
image.alt.en: A long-necked dinosaur skull with pencil-like teeth
image.alt.vi: Hộp sọ khủng long cổ dài có răng như bút chì
examples.1.en: flat teeth to grind leaves
examples.1.vi: răng dẹt để nghiền lá
examples.2.en: pencil-like teeth to strip leaves
examples.2.vi: răng như bút chì để tuốt lá
examples.3.en: pine needles
examples.3.vi: lá thông
> Ô này là chỗ sửa chính của `all_dinosaurs_ate_meat` (câu sửa ở `_topic.md`: "Many dinosaurs ate plants, like ferns and cycads. Their teeth show what they ate."). Hai món ví dụ đầu là hai loại răng bé sẽ gặp lại ở phần Chơi.
> Lệch bảng kế hoạch: "răng như chiếc chốt" đổi thành "răng như bút chì" (pencil-like teeth). Bút chì là vật bé cầm hằng ngày; biên tập nhớ các nhà khoa học cũng tả răng khủng long cổ dài Diplodocus là "pencil-like". Đã thêm vào bảng Tên gọi (rà chéo 9/11).
> [CẦN KIỂM] Răng dẹt xếp sát nhau để nghiền lá (khủng long mỏ vịt), răng như bút chì để tuốt lá khỏi cành (khủng long cổ dài Diplodocus). Khủng long ăn thực vật ăn dương xỉ, cây vạn tuế, cây lá kim như thông và bách tán; họ hàng của thông đã có từ thời khủng long (bảng Tên gọi, dòng "cây thời khủng long"). Không dùng "ăn cỏ".

#### group explore_meat
label.en: Meat-eaters
label.vi: Khủng long ăn thịt
color: do_son
sentence.en: Some dinosaurs ate meat and had sharp, curved teeth.
sentence.vi: Một số loài khủng long ăn thịt, có răng nhọn và cong.
image.brief: [ảnh] Hộp sọ hoá thạch khủng long bạo chúa trong bảo tàng, chụp ngang, miệng khép hờ, thấy rõ hàng răng to, nhọn và cong; không chụp thẳng vào miệng há, không có người, cắt biển tên, không thêm nhãn chữ (Duy 10/11). Từ khoá tìm ảnh (EN): Tyrannosaurus rex skull side view museum teeth
image.alt.en: A T. rex skull in a museum
image.alt.vi: Hộp sọ khủng long bạo chúa trong bảo tàng
examples.1.en: T. rex
examples.1.vi: khủng long bạo chúa
examples.2.en: tiny saw edges on teeth
examples.2.vi: mép răng có răng cưa nhỏ
examples.3.en: ate fish and other animals
examples.3.vi: ăn cá và những con vật khác
> Món ví dụ ba dạy trước rằng cá và con vật khác là thức ăn của khủng long ăn thịt, để phần Chơi bé tự xếp con cá, con thằn lằn nhỏ vào đúng chỗ.
> [CẦN KIỂM] Răng khủng long ăn thịt nhọn, cong vào trong, mép có răng cưa nhỏ. Một số loài ăn cá (biên tập nhớ ví dụ Baryonyx, Spinosaurus). Không nói khủng long bạo chúa ăn cá.
> Câu q6 và từ `carnivore` dùng lại hình này (không có nhãn chữ, Duy 10/11).

#### group explore_safe
label.en: Staying safe
label.vi: Cách tự vệ
color: nau_dat
sentence.en: Footprints show some plant-eaters walked together in herds.
sentence.vi: Dấu chân cho thấy vài loài ăn thực vật đi theo đàn.
> SK-044 (14/11, A2): câu VI cũ mười bảy tiếng, nay mười hai; vẫn nói "vài loài", không nói "mọi loài". Câu EN giữ nguyên.
image.brief: [ảnh] Mặt đá phẳng rộng có nhiều đường dấu chân khủng long tròn, to, chạy song song cùng một hướng (ít nhất bốn đường), chụp từ trên cao hoặc chụp chéo từ mặt đất, nắng xiên để vết lõm rõ; không có người, cắt biển tên; không có chữ, không thêm nhãn chữ (Duy 10/11). Mũi tên chỉ hướng đi chỉ thêm được nếu designer làm ô này thành hình ghép; ảnh đang chọn để nguyên, chưa có mũi tên. Từ khoá tìm ảnh (EN): parallel sauropod trackways dinosaur footprints aerial view
image.alt.en: Many dinosaur footprints going one way
image.alt.vi: Nhiều dấu chân khủng long đi cùng một hướng
examples.1.en: safer together in a herd
examples.1.vi: đi theo đàn thì an toàn hơn
examples.2.en: three horns
examples.2.vi: ba chiếc sừng
examples.3.en: armour and a tail club
examples.3.vi: giáp và đuôi chuỳ
> [CẦN KIỂM] Nhiều đường dấu chân song song, cùng hướng cho thấy một số loài khủng long ăn thực vật đi theo đàn (`_topic.md`, Ghi chú "Bài bốn, ô Sống theo đàn"); đi theo đàn giúp chúng an toàn hơn. Sừng của khủng long ba sừng, giáp và đuôi chuỳ của khủng long bọc giáp dùng để tự vệ (sừng có thể còn dùng để khoe, để nhận ra nhau).
> Câu nói "một số loài", không nói "mọi loài". Ý "an toàn hơn" ở món ví dụ, không ở câu chính, vì dấu chân chỉ cho thấy đi theo đàn; "an toàn hơn" là điều các nhà khoa học suy ra.

### new_words
id: 823d8a8e-8551-4e44-b08a-a688bdd9a9de
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: herbivore, carnivore, nest, hatch

## Chơi

> Trò "Manh mối của khủng long ăn thực vật". Bé chọn hình từ kệ vào ba chỗ. Đạt khi có đủ ba manh mối của khủng long ăn thực vật (một loại răng, một món thức ăn, một cách tự vệ) và không có manh mối nào của khủng long ăn thịt. Chạm hình đã chọn để bỏ ra.
> Trò chơi dùng ngay bốn ô Học, nhưng bé phải tự xếp từng hình vào đúng nhóm. Đây là bước sửa thứ hai của `all_dinosaurs_ate_meat`: bé tự gom bằng chứng cho thấy có khủng long ăn thực vật, rồi câu q5 và q6 hỏi lại.
> Bẫy có chủ ý, mỗi bẫy ứng với một nhóm bắt buộc:
> - răng nhọn và cong của khủng long bạo chúa cũng là một chiếc răng, bé chọn vì thấy "răng" mà không xem răng kiểu gì;
> - con cá và con thằn lằn nhỏ cũng là thức ăn, nhưng là thức ăn của khủng long ăn thịt.
>
> Lệch bảng kế hoạch: món bẫy "miếng thịt" đổi thành "con thằn lằn nhỏ". Lý do:
> - mọi món thức ăn trên kệ là vật có từ thời khủng long (dương xỉ, vạn tuế, cá, thằn lằn); miếng thịt ở chợ thì không;
> - ảnh miếng thịt sống dễ thành hình có máu (Quy ước hình, mục sáu);
> - bé phải tự suy "ăn con vật là ăn thịt", hợp bài vận dụng hơn;
> - khớp bộ lựa chọn của câu w1 bài năm ("dương xỉ, con cá, con thằn lằn nhỏ"), nên bài năm dùng lại được ba hình của câu q3 bài này.
>
> Vì sao là `build_tray`: ở phần Chơi, schema v1 và app 0.1.0 chỉ có block này. Lời nhắn không gọi tên vật chứa. Khi thiếu nhiều nhóm, lời nhắc theo thứ tự các `#### group`: răng, thức ăn, cách tự vệ.

### tray
id: 124f354c-5a8a-4c88-8ece-f3480bf65a0f
type: build_tray
version: 1
prompt.en: Find the plant-eater clues
prompt.vi: Tìm manh mối của khủng long ăn thực vật
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find three plant-eater clues: teeth, food, staying safe.
messages.start.vi: Em tìm ba manh mối: răng, thức ăn, cách tự vệ nhé.
> SK-044 (14/11, A2): câu VI cũ mười chín tiếng, nay mười hai; "của khủng long ăn thực vật" đã có ở lệnh của trò chơi.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! These clues show how plant-eaters lived.
messages.balanced.vi: Tuyệt! Những manh mối này cho biết khủng long ăn thực vật sống ra sao.
messages.has_limited.en: That is a meat-eater clue. Tap it to take it off.
messages.has_limited.vi: Đó là manh mối của khủng long ăn thịt. Em chạm vào để bỏ ra nhé.
messages.missing.tray_teeth.en: You still need plant-eater teeth.
messages.missing.tray_teeth.vi: Em còn thiếu răng của khủng long ăn thực vật.
messages.missing.tray_food.en: You still need a plant to eat.
messages.missing.tray_food.vi: Em còn thiếu một loại cây làm thức ăn.
messages.missing.tray_safe.en: You still need a way to stay safe.
messages.missing.tray_safe.vi: Em còn thiếu một cách tự vệ.
> Lời nhắn thiếu nhóm nói theo đặc điểm ("plant-eater teeth", "a plant to eat"), không dùng "Add" hay "Thêm", vì ba chỗ có thể đã đầy khi còn thiếu nhóm.

#### group tray_teeth
label.en: Teeth
label.vi: Răng
color: cham
role: required

#### group tray_food
label.en: Food
label.vi: Thức ăn
color: gi_dong
role: required

#### group tray_safe
label.en: Staying safe
label.vi: Cách tự vệ
color: nau_dat
role: required

#### group tray_meat
label.en: Not plant-eater clues
label.vi: Không phải của khủng long ăn thực vật
color: do_son
role: limit
> Rà chéo 9/11: đổi từ "Meat-eater clues" · "Manh mối của khủng long ăn thịt" theo luật nhãn `limit` của cả chủ đề (`_topic.md`, mục "Khi soạn năm bài"). Nhãn có "Not" · "Không", nên dòng điều kiện "Cần đủ Răng, Thức ăn, Cách tự vệ · Không phải của khủng long ăn thực vật" không bị đọc thành một điều kiện cần có. Nhãn vẫn gọi tên loại, không gọi tên món bẫy. `messages.has_limited` ("That is a meat-eater clue." · "Đó là manh mối của khủng long ăn thịt.") giữ nguyên: nói lý do món đó không phải của khủng long ăn thực vật, cùng ý với nhãn.

#### item tray_flat_teeth
label.en: Flat teeth
label.vi: Răng dẹt
group: tray_teeth
image.brief: [ảnh] Hàng răng hoá thạch của khủng long mỏ vịt (Edmontosaurus) xếp sát nhau thành một mặt nghiền dẹt, ảnh màu chụp gần, cắt từ một ô hình trong bài báo khoa học; có thể còn chữ cái nhỏ hoặc vạch tỉ lệ ở mép, không đọc được ở cỡ ô; không có người. Câu q2 (lựa chọn q2_flat) cắt riêng từ ảnh này. Từ khoá tìm ảnh (EN): hadrosaur dental battery fossil teeth close up
image.alt.en: A fossil jaw with many flat teeth
image.alt.vi: Hàm hoá thạch có nhiều răng dẹt
> "Khủng long mỏ vịt" chỉ có trong gợi ý hình, không vào chữ cho trẻ (không có trong bảng Tên gọi).

#### item tray_fern
label.en: Fern
label.vi: Dương xỉ
group: tray_food
image.brief: Dùng lại hình `trai-dat-rat-lau-ve-truoc/tray_fern`
image.alt.en: A green fern
image.alt.vi: Cây dương xỉ xanh

#### item tray_sharp_tooth
label.en: Sharp, curved tooth
label.vi: Răng nhọn và cong
group: tray_meat
image.brief: [ảnh] Một chiếc răng hoá thạch của khủng long bạo chúa trên nền trắng trơn, chụp ngang: răng to, cong như quả chuối, đầu nhọn, thấy cả phần chân răng; mép răng cưa khó thấy ở cỡ nhỏ; đã cắt bỏ thước tỉ lệ và chiếc răng nhỏ bên dưới; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): Tyrannosaurus rex tooth fossil isolated
image.alt.en: A sharp, curved T. rex tooth
image.alt.vi: Răng nhọn và cong của khủng long bạo chúa

#### item tray_horns
label.en: Three horns
label.vi: Ba chiếc sừng
group: tray_safe
image.brief: [ảnh] Bản đúc hộp sọ khủng long ba sừng (bảo tàng Smithsonian) trên nền trắng, nhìn chéo phía trước, thấy rõ hai sừng dài trên mắt, một sừng ngắn trên mũi và diềm cổ; không có người, không có chữ. Từ khoá tìm ảnh (EN): Triceratops skull cast horns three quarter view
image.alt.en: A Triceratops skull with three horns
image.alt.vi: Hộp sọ khủng long ba sừng

#### item tray_fish
label.en: Fish
label.vi: Con cá
group: tray_meat
image.brief: Dùng lại hình `khung-long-la-gi/q1_fish`
image.alt.en: A fish
image.alt.vi: Một con cá
> Rà chéo 9/11: dùng lại ảnh cá chép của câu q1 bài hai, thay cho ảnh cá rô đồng nằm trên nền trơn (ảnh Duy duyệt ở SK-033 là cá chép trên nền trắng, không chụp trong nước; xem ghi chú ở q1_fish bài hai). Cá nằm trên nền trơn là cá đã chết (Quy ước hình mục sáu: không xác con vật), và dùng chung thì đỡ tìm một ảnh. Hình chỉ đại diện cho "cá", không nói loài cá này có từ thời khủng long.

#### item tray_pencil_teeth
label.en: Pencil-like teeth
label.vi: Răng như bút chì
group: tray_teeth
image.brief: [ảnh] Một hàng răng hoá thạch của khủng long cổ dài (Diplodocus) còn gắn trong đá, mỗi chiếc thẳng, mảnh như bút chì; đã cắt bỏ dải nhãn chữ phía trên; không có người. Ảnh riêng, rõ hình bút chì hơn bản cắt từ hộp sọ ở ô explore_plants như brief đầu; lựa chọn q2_pencil cắt riêng từ ảnh này. Từ khoá tìm ảnh (EN): Diplodocus teeth fossil in rock
image.alt.en: Fossil teeth shaped like pencils
image.alt.vi: Răng hoá thạch hình như bút chì

#### item tray_tail_club
label.en: Tail club
label.vi: Đuôi chuỳ
group: tray_safe
image.brief: [ảnh] Đuôi chuỳ hoá thạch của khủng long bọc giáp (Euoplocephalus): khối xương tròn to ở cuối đoạn đuôi, đặt trên giá trong tủ bảo tàng; đã cắt bỏ tấm nhãn xanh bên trái; không có người, không có chữ. Từ khoá tìm ảnh (EN): Euoplocephalus tail club fossil museum
image.alt.en: A fossil tail club
image.alt.vi: Đuôi chuỳ hoá thạch
> [CẦN KIỂM] Tên gọi "đuôi chuỳ" cho tail club của khủng long bọc giáp. Bảng Tên gọi chọn "đuôi chuỳ", không dùng "chuỳ đuôi" (rà chéo 9/11).

#### item tray_lizard
label.en: Small lizard
label.vi: Con thằn lằn nhỏ
group: tray_meat
image.brief: Dùng lại hình `khung-long-la-gi/w3_lizard`
image.alt.en: A small lizard on a rock
image.alt.vi: Con thằn lằn nhỏ trên tảng đá
> [CẦN KIỂM] Một số loài khủng long ăn thịt nhỏ ăn thằn lằn; biên tập nhớ có hoá thạch khủng long nhỏ cỡ con gà (Compsognathus) còn xương thằn lằn trong bụng. Thằn lằn đã có từ thời khủng long.

#### item tray_cycad
label.en: Cycad
label.vi: Cây vạn tuế
group: tray_food
image.brief: Dùng lại hình `trai-dat-rat-lau-ve-truoc/tray_cycad`
image.alt.en: A cycad plant
image.alt.vi: Cây vạn tuế

#### item tray_herd_tracks
label.en: Footprints of a herd
label.vi: Dấu chân cả đàn
group: tray_safe
image.brief: Dùng lại hình `khung-long-an-gi-song-ra-sao/explore_safe`, cắt khung vuông vẫn thấy ít nhất bốn đường dấu chân song song, không có mũi tên, không có chữ
image.alt.en: Many dinosaur footprints going one way
image.alt.vi: Nhiều dấu chân khủng long đi cùng một hướng

## Quiz

> Sáu câu, DOK 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Ba format: `single_choice` (q1 đến q4), `multi_choice` (q5), `true_false` (q6). Không dùng `fill_blank_bank` (Duy 9/11). Không thêm câu `true_false` ở q2 đến q5, để giữ cân bằng Đúng/Sai ở `_topic.md`.
> Ba câu vận dụng (q3, q4, q5) đưa manh mối vào trường hợp mới: hộp sọ một loài chưa gặp, một bãi dấu chân khác, bốn mô hình khủng long. Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.

### q1
id: ab44cd94-7f2a-4543-b32c-572a65d06bd7
format: single_choice
version: 1
dok: 1
prompt.en: Where did dinosaurs lay their eggs?
prompt.vi: Khủng long đẻ trứng ở đâu?
image.brief: Dùng lại hình `khung-long-an-gi-song-ra-sao/hatch`, cắt sát khủng long con và vỏ trứng, không thấy tổ, đất cát hay khung tủ kính xung quanh
image.alt.en: A model of a baby dinosaur hatching
image.alt.vi: Mô hình khủng long con đang nở
hint.en: Remember the fossil eggs. Where were they lying?
hint.vi: Em nhớ lại những quả trứng hoá thạch. Chúng nằm ở đâu?
explanation_correct.en: Fossil nests show dinosaurs laid eggs on land.
explanation_correct.vi: Tổ hoá thạch cho thấy khủng long đẻ trứng trên cạn.
explanation_wrong.en: Dinosaurs laid eggs in nests, on land.
explanation_wrong.vi: Khủng long đẻ trứng trong tổ, trên mặt đất.
> Hình câu hỏi là khủng long con đang nở (vật được hỏi là trứng của khủng long), cắt không thấy tổ, để không lộ đáp án. Hai lựa chọn sai là chỗ đẻ trứng của hai con vật quen: ếch đồng đẻ trứng dưới nước, bướm đẻ trứng trên lá.
> Rà chữ tester 9/11 (n10): bản trước dùng ảnh quả trứng hoá thạch (`tray_rock_egg` bài ba) cho hình câu hỏi, mà lựa chọn đúng cũng là ảnh hoá thạch trong đá, còn hai lựa chọn sai là ảnh trứng ếch, trứng bướm ngày nay; bé chọn hình "giống hình trên" mà không cần nhớ. Hình mới là mô hình trong tủ kính, không phải đá, nên không giống riêng lựa chọn nào. Dùng lại hình từ vựng `hatch` của bài này, không phải tìm ảnh mới.
> [CẦN KIỂM] Xem ghi chú ở ý chính một: tổ khủng long ở trên mặt đất.
> Rà chữ tester 9/11 (n1): đáp án chuyển xuống thứ ba (trước đây thứ nhất).

#### option q1_pond
correct: false
feedback.en: Frogs lay their eggs in pond water.
feedback.vi: Ếch đẻ trứng dưới nước, trong ao.
label.en: in a pond
label.vi: dưới ao
image.brief: [ảnh] Một đám trứng ếch trong suốt, mỗi trứng có chấm đen ở giữa, nổi dưới mặt nước ao, có hai con ếch ở giữa đám trứng (giúp bé nhận ra trứng ếch); chụp gần; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): frog and frog spawn in pond
image.alt.en: Frog eggs in a pond
image.alt.vi: Trứng ếch dưới ao

#### option q1_leaf
correct: false
feedback.en: Butterflies lay tiny eggs on leaves.
feedback.vi: Bướm đẻ trứng nhỏ xíu trên lá.
label.en: on a leaf
label.vi: trên lá cây
image.brief: [ảnh] Một quả trứng bướm nhỏ bám trên mặt một chiếc lá xanh, chụp cận; quả trứng nhỏ trong khung, cần xem trên máy có nhận ra không; không có sâu, không có tay người, không có chữ. Từ khoá tìm ảnh (EN): butterfly egg on leaf macro
image.alt.en: A butterfly egg on a leaf
image.alt.vi: Trứng bướm trên lá cây

#### option q1_nest
correct: true
label.en: in a nest
label.vi: trong tổ
image.brief: Dùng lại hình `hoa-thach-ke-chuyen-khung-long/tray_rock_nest`
image.alt.en: A fossil dinosaur nest with eggs
image.alt.vi: Tổ trứng khủng long hoá thạch

### q2
id: b9611e52-d2a5-4046-9836-57c7c4ecbe07
format: single_choice
version: 1
dok: 1
prompt.en: Which teeth belonged to a meat-eater?
prompt.vi: Răng nào là của khủng long ăn thịt?
image.brief: Dùng lại hình `hoa-thach-ke-chuyen-khung-long/q4`
image.alt.en: Tools for finding fossils
image.alt.vi: Dụng cụ tìm hoá thạch
hint.en: Remember the T. rex skull. What were its teeth like?
hint.vi: Em nhớ lại hộp sọ khủng long bạo chúa. Răng của nó trông thế nào?
explanation_correct.en: Sharp, curved teeth helped meat-eaters grip and tear.
explanation_correct.vi: Răng nhọn và cong giúp giữ chặt và xé thịt.
explanation_wrong.en: Sharp, curved teeth are meat-eater teeth.
explanation_wrong.vi: Răng nhọn và cong là răng của loài ăn thịt.
> DOK 1: nhớ lại ô Khủng long ăn thịt. Gợi ý chỉ vào hình ô Học, không nói thẳng đáp án.
> Rà chữ tester 9/11 (N3): bản trước lựa chọn đúng là một chiếc răng rời, nhãn số ít ("sharp, curved tooth"), còn hai lựa chọn sai là hàm nhiều răng, nhãn số nhiều; bé chọn "cái khác hẳn" mà không cần nhìn răng. Nay ba lựa chọn cùng một kiểu: ảnh hoá thạch cắt cận một đoạn hàm có nhiều răng, khung vuông, không nhãn chữ; ba nhãn EN cùng số nhiều ("teeth"). Món Chơi `tray_sharp_tooth` (một chiếc răng) giữ nguyên, vì ở kệ Chơi nó là món bẫy, không phải một trong ba đáp án, và từ `clue` dùng ảnh đó.
> Rà chữ tester 9/11 (n1): đáp án chuyển lên thứ nhất (trước đây thứ hai).

#### option q2_sharp
correct: true
label.en: sharp, curved teeth
label.vi: răng nhọn và cong
image.brief: Dùng lại hình `khung-long-an-gi-song-ra-sao/explore_meat`, cắt vuông đoạn hàm trên và hàm dưới có răng nhọn và cong, không thấy cả hộp sọ, không có chữ
image.alt.en: A fossil jaw with sharp, curved teeth
image.alt.vi: Hàm hoá thạch có răng nhọn và cong
> Câu phân loại (luật rà chéo 9/11): `alt` ở đây không ghi "T. rex" · "khủng long bạo chúa", vì bé biết khủng long bạo chúa ăn thịt, tên này sẽ nói luôn đáp án. Bản cắt chỉ thấy một đoạn hàm có răng, để bé xét hình răng, không nhận ra cả hộp sọ của ô Học.

#### option q2_flat
correct: false
feedback.en: Flat teeth grind up plants.
feedback.vi: Răng dẹt dùng để nghiền thực vật.
label.en: flat teeth
label.vi: răng dẹt
image.brief: Dùng lại hình `khung-long-an-gi-song-ra-sao/tray_flat_teeth`, cắt cận đoạn có nhiều răng dẹt xếp sát nhau, bỏ chữ chú thích bên dưới; không cắt vuông, vì ô lựa chọn trong app rộng khoảng gấp đôi bề cao
image.alt.en: A fossil jaw with many flat teeth
image.alt.vi: Hàm hoá thạch có nhiều răng dẹt

#### option q2_pencil
correct: false
feedback.en: Pencil-like teeth strip leaves off branches.
feedback.vi: Răng như bút chì tuốt lá khỏi cành.
label.en: pencil-like teeth
label.vi: răng như bút chì
image.brief: Dùng lại hình `khung-long-an-gi-song-ra-sao/tray_pencil_teeth`, cắt vuông đoạn có nhiều răng như bút chì, cùng khung với lựa chọn q2_sharp
image.alt.en: A fossil jaw with pencil-like teeth
image.alt.vi: Hàm hoá thạch có răng như bút chì

### q3
id: 69c86409-24f3-4a60-ac8e-b5ac305d821c
format: single_choice
version: 1
dok: 2
prompt.en: Look at its teeth: what did it eat?
prompt.vi: Nhìn răng, con khủng long này ăn gì?
> SK-044 (14/11, A2): gộp hai câu thành một (tám từ, tám tiếng); không nói "flat" trong câu hỏi, để bé tự nhìn.
image.brief: [ảnh] Hộp sọ hoá thạch khủng long mỏ vịt (Edmontosaurus) trong bảo tàng, chụp ngang: phía trước là mỏ dẹt không có răng, phía sau là hàm dài; hàng răng dẹt nằm phía trong hàm, ở cỡ ô khó thấy rõ; không có chiếc răng nhọn nào; đã cắt bỏ góc có hình nhỏ và nhãn; không có người, không có chữ. Từ khoá tìm ảnh (EN): Edmontosaurus skull side view museum
image.alt.en: A dinosaur skull with flat teeth
image.alt.vi: Hộp sọ khủng long có răng dẹt
hint.en: Are the teeth sharp, or flat?
hint.vi: Răng của nó nhọn hay dẹt?
explanation_correct.en: Flat teeth grind plants, like a buffalo's teeth do.
explanation_correct.vi: Răng dẹt nghiền lá cây, như răng con trâu.
explanation_wrong.en: Flat teeth are for eating plants like ferns.
explanation_wrong.vi: Răng dẹt là răng ăn thực vật, như dương xỉ.
> DOK 2: đọc manh mối (răng) trên hộp sọ một loài bé chưa gặp, rồi suy ra thức ăn. Đây đúng là việc của mục tiêu bài. Câu không gọi tên loài: "khủng long mỏ vịt" chỉ có trong gợi ý hình.
> Ba lựa chọn dùng lại ba hình ở kệ Chơi, cũng là bộ lựa chọn của câu w1 bài năm (khủng long cổ dài ăn gì). Bài năm dùng lại được ba hình này.
> [CẦN KIỂM] Khủng long mỏ vịt (ví dụ Edmontosaurus) có răng dẹt xếp sát nhau để nghiền thực vật, và dương xỉ là một trong những thứ chúng ăn được. Chọn ảnh hộp sọ thấy rõ hàng răng; nếu ảnh không thấy răng thì đổi sang ảnh hàm dưới.
> SK-033: ảnh Duy duyệt có hàng răng dẹt nằm trong hàm, ở cỡ ô khó thấy; chữ của câu chưa đổi, vì ảnh không làm câu sai (con khủng long này có răng dẹt, và nhìn là thấy không có răng nhọn). Nếu xem trên máy thấy bé không nhìn ra răng, đề xuất đổi câu hỏi thành "Look at this skull. What did this dinosaur eat?" · "Em nhìn hộp sọ này nhé. Con khủng long này ăn gì?" và gợi ý thành "Can you see any sharp, curved teeth?" · "Em có thấy chiếc răng nhọn và cong nào không?".
> Rà chữ tester 9/11 (n1): đáp án chuyển lên thứ nhất (trước đây thứ ba).

#### option q3_fern
correct: true
label.en: fern
label.vi: cây dương xỉ
image.brief: Dùng lại hình `trai-dat-rat-lau-ve-truoc/tray_fern`
image.alt.en: A green fern
image.alt.vi: Cây dương xỉ xanh

#### option q3_fish
correct: false
feedback.en: Fish was food for sharp-toothed meat-eaters.
feedback.vi: Cá là mồi của khủng long ăn thịt răng nhọn.
label.en: fish
label.vi: con cá
image.brief: Dùng lại hình `khung-long-la-gi/q1_fish`
image.alt.en: A fish
image.alt.vi: Một con cá

#### option q3_lizard
correct: false
feedback.en: A lizard is meat, food for meat-eaters.
feedback.vi: Thằn lằn là thịt, mồi của loài ăn thịt.
label.en: small lizard
label.vi: con thằn lằn nhỏ
image.brief: Dùng lại hình `khung-long-la-gi/w3_lizard`
image.alt.en: A small lizard on a rock
image.alt.vi: Con thằn lằn nhỏ trên tảng đá

### q4
id: 9fed1018-c94c-4d18-98f9-ef4cbbcd09a4
format: single_choice
version: 1
dok: 2
prompt.en: What do these dinosaur footprints show?
prompt.vi: Những dấu chân này cho biết điều gì?
> SK-044 (14/11, A2): câu VI cũ hai câu, mười sáu tiếng; nay một câu tám tiếng, EN sáu từ. Bỏ câu kể "Các nhà khoa học tìm thấy".
image.brief: [ảnh] Một bãi dấu chân khủng long khác với hình explore_safe: mặt đá rộng có năm sáu đường dấu chân tròn, to, chạy song song cùng một hướng, chụp từ trên cao; không có người, không có thước, không có mũi tên, không có chữ. Nếu không tìm được ảnh thứ hai đủ rõ thì dùng lại hình `khung-long-an-gi-song-ra-sao/explore_safe`, không có mũi tên, không có chữ. Từ khoá tìm ảnh (EN): dinosaur trackway site parallel tracks sauropod herd
image.alt.en: Many footprints going one way
image.alt.vi: Nhiều đường dấu chân đi cùng một hướng
hint.en: Count the lines of footprints. Do they go the same way?
hint.vi: Em đếm xem có mấy đường dấu chân. Chúng có đi cùng một hướng không?
explanation_correct.en: Walking in a herd helped keep them safe.
explanation_correct.vi: Đi theo đàn giúp chúng an toàn hơn.
explanation_wrong.en: Many lines going one way show a herd.
explanation_wrong.vi: Nhiều đường dấu chân cùng hướng là dấu hiệu của đàn.
> DOK 2: từ một bằng chứng (nhiều đường dấu chân song song) chọn cảnh đúng. Ba lựa chọn là ba tranh cùng một loài, cùng bối cảnh, cùng góc nhìn; chỉ khác số con và việc chúng làm. Một con đi một mình chỉ để lại một đường dấu chân; con đứng bên tổ không để lại đường dấu chân dài.
> [CẦN KIỂM] Cách suy "nhiều đường dấu chân song song, cùng hướng là một đàn" (xem ô explore_safe). Tranh khủng long cổ dài bên tổ trứng: biên tập nhớ có bãi làm tổ của khủng long cổ dài (titanosaur) ở Nam Mỹ.
> Rà chữ tester 9/11 (n9): bản trước nói chắc "show a herd" · "cho thấy cả một đàn" và "Nhiều con khủng long đã đi cùng một lúc", chắc hơn ghi chú `[CẦN KIỂM]`. Câu mới dùng chữ "clues" · "manh mối" (từ vựng của bài, ý chính ba): dấu chân là manh mối, các nhà khoa học suy ra có một đàn. Giải thích khi sai chỉ nêu đáp án.
> Rà chữ tester 9/11 (n1): đáp án chuyển xuống thứ hai (trước đây thứ nhất).

#### option q4_alone
correct: false
feedback.en: One dinosaur leaves just one line of footprints.
feedback.vi: Một con chỉ để lại một đường dấu chân.
label.en: one dinosaur alone
label.vi: một con đi một mình
image.brief: [sơ đồ ghép ảnh] Tranh phục dựng một con khủng long cổ dài (Brontosaurus) tách khỏi nền trắng, đặt lên nền bãi bùn ven hồ do designer vẽ (trời, hồ, bãi bùn, bóng đổ); con vật đi một mình, nhìn ngang; không có loài khác, không có người, không có chữ. Ba lựa chọn của câu này dùng cùng tranh, cùng nền (designer ghép 10/11). Từ khoá tìm ảnh (EN): Brontosaurus life restoration side view
image.alt.en: A painting of one long-necked dinosaur
image.alt.vi: Tranh vẽ một con khủng long cổ dài

#### option q4_herd
correct: true
label.en: a herd walking together
label.vi: cả đàn đi cùng nhau
image.brief: [sơ đồ ghép ảnh] Cùng tranh khủng long cổ dài và cùng nền bãi bùn ven hồ của lựa chọn `khung-long-an-gi-song-ra-sao/q4_alone`: đàn năm con đi cùng một hướng, xa gần khác nhau, nhìn ngang từ xa; không có loài khác, không có người, không có chữ.
image.alt.en: A painting of a long-necked dinosaur herd
image.alt.vi: Tranh vẽ đàn khủng long cổ dài

#### option q4_nest
correct: false
feedback.en: There is no nest here, only footprints.
feedback.vi: Ở đây không có tổ, chỉ có dấu chân.
label.en: a dinosaur at its nest
label.vi: một con bên tổ trứng
image.brief: [sơ đồ ghép ảnh] Cùng tranh khủng long cổ dài và cùng nền bãi bùn ven hồ của lựa chọn `khung-long-an-gi-song-ra-sao/q4_alone`: một con đứng yên, trước mặt là một ổ trứng tròn vùi nửa trong cát (designer vẽ thêm ổ trứng); tranh gốc không cúi cổ được như brief cũ; không có loài khác, không có người, không có chữ.
image.alt.en: A painting of a long-necked dinosaur by its nest
image.alt.vi: Tranh vẽ khủng long cổ dài bên tổ trứng

### q5
id: d19a5866-990c-4ae5-a8e4-fca67d28305a
format: multi_choice
version: 1
dok: 2
prompt.en: Which dinosaurs ate plants?
prompt.vi: Những loài khủng long nào ăn thực vật?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `trai-dat-rat-lau-ve-truoc/tray_fern` (ô explore_plants chỉ có ảnh hộp sọ, không có nửa dương xỉ và vạn tuế để cắt như brief đầu)
image.alt.en: Green ferns
image.alt.vi: Những bụi dương xỉ xanh
hint.en: Look for clues: teeth, horns and armour.
hint.vi: Em tìm manh mối: răng, sừng và giáp.
explanation_correct.en: Horns and armour helped plant-eaters stay safe.
explanation_correct.vi: Sừng và giáp giúp loài ăn thực vật tự vệ.
explanation_wrong.en: Only T. rex here was a meat-eater.
explanation_wrong.vi: Ở đây chỉ khủng long bạo chúa ăn thịt.
> DOK 2: phân loại bốn loài bằng manh mối nhìn thấy trên mô hình (răng nhọn; sừng; giáp và đuôi chuỳ; cổ dài như ô Học). Ba trên bốn loài ăn thực vật: câu này chuẩn bị bằng chứng cho câu q6 ngay sau.
> Hình câu hỏi là thức ăn (dương xỉ; SK-033 bỏ vạn tuế vì ô explore_plants chỉ còn ảnh hộp sọ), không có con khủng long nào, để không lộ đáp án.
> Bốn lựa chọn đều là ảnh mô hình, cùng kiểu chụp ngang cả con, để khác nhau rõ bằng mắt mà vẫn công bằng. Bốn thẻ riêng nên không vướng luật "một cảnh chỉ có loài cùng thời".

#### option q5_triceratops
correct: true
label.en: Triceratops
label.vi: khủng long ba sừng
image.brief: Dùng lại hình `trai-dat-rat-lau-ve-truoc/w1_triceratops`
image.alt.en: A model of a Triceratops
image.alt.vi: Mô hình khủng long ba sừng

#### option q5_trex
correct: false
feedback.en: T. rex had sharp teeth for eating meat.
feedback.vi: Khủng long bạo chúa có răng nhọn để ăn thịt.
label.en: T. rex
label.vi: khủng long bạo chúa
image.brief: [ảnh mô hình] Mô hình khủng long bạo chúa cỡ lớn ở một thị trấn (Milk River, Canada), chụp ngang cả con: lưng nằm ngang, đuôi nhấc khỏi đất, miệng mở khá rộng nhưng quay sang bên, không nhìn thẳng người xem; nền sân đá và cây trụi lá, khác nền cây xanh của ba mô hình kia; không có người, không thấy biển tên hay chữ. Từ khoá tìm ảnh (EN): Tyrannosaurus rex model side view horizontal posture
image.alt.en: A model of a T. rex
image.alt.vi: Mô hình khủng long bạo chúa

#### option q5_long_neck
correct: true
label.en: long-necked dinosaur
label.vi: khủng long cổ dài
image.brief: Dùng lại hình `trai-dat-rat-lau-ve-truoc/tray_longneck`
image.alt.en: A model of a long-necked dinosaur
image.alt.vi: Mô hình khủng long cổ dài

#### option q5_armoured
correct: true
label.en: armoured dinosaur
label.vi: khủng long bọc giáp
image.brief: [ảnh mô hình] Mô hình khủng long bọc giáp trong khung cảnh trưng bày của bảo tàng (Royal Alberta Museum, Canada), lưng phủ giáp có gai rõ; đuôi chuỳ khuất ở mép ảnh; đã cắt sát để bỏ mô hình khủng long ba sừng phía sau; không phải ở công viên ngoài trời như ba mô hình kia; không có người, không có chữ. Từ khoá tìm ảnh (EN): Ankylosaurus model museum diorama
image.alt.en: A model of an armoured dinosaur
image.alt.vi: Mô hình khủng long bọc giáp

### q6
id: e5becd6c-4230-428a-893f-9a47c94b4209
format: true_false
version: 1
dok: 3
misconception: all_dinosaurs_ate_meat
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
image.brief: Dùng lại hình `khung-long-an-gi-song-ra-sao/explore_meat`
image.alt.en: A T. rex skull in a museum
image.alt.vi: Hộp sọ khủng long bạo chúa trong bảo tàng
statement.en: T. rex ate meat, so all dinosaurs ate meat.
statement.vi: Khủng long bạo chúa ăn thịt, vậy loài nào cũng thế.
> SK-044 (14/11, A2): lời Na gộp thành một câu (chín từ, mười một tiếng).
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
hint.en: Think of the long-necked dinosaur. What did it eat?
hint.vi: Em nghĩ tới khủng long cổ dài. Nó ăn gì?
explanation_correct.en: T. rex is only one kind out of many.
explanation_correct.vi: Khủng long bạo chúa chỉ là một trong nhiều loài.
explanation_wrong.en: The long-necked dinosaur and Triceratops ate plants.
explanation_wrong.vi: Khủng long cổ dài và ba sừng đều ăn thực vật.
feedback_true.en: Many dinosaurs had flat teeth for plants.
feedback_true.vi: Nhiều khủng long có răng dẹt để ăn thực vật.
> Lời Na và hình theo `_topic.md`, mục "Câu sáu, lời Na". Đáp án Sai (bảng Đúng/Sai).
> DOK 3: bắt lỗi một lập luận, suy từ một loài ra mọi loài. Giải thích khi đúng chỉ ra chỗ sai của lập luận ("chỉ là một loài"), không mở đầu bằng "Yes!", vì đáp án là "No". Gợi ý chỉ tới một phản ví dụ bé vừa gặp ở ô Học, câu q5 và phần Chơi, không nói thẳng đáp án.
> Bắt lỗi bằng bằng chứng trong bài (răng, mô hình các loài), không chê phim hay đồ chơi.

## Từ vựng

### herbivore
id: 222c2e32-4d71-40d0-98a8-5b17f204d8e5
tier: core
term.en: herbivore
term.vi: động vật ăn thực vật
example.en: Triceratops was a herbivore. Buffaloes are herbivores, too.
example.vi: Khủng long ba sừng là động vật ăn thực vật. Con trâu cũng vậy.
image.brief: Dùng lại hình `trai-dat-rat-lau-ve-truoc/w1_triceratops`
image.alt.en: A model of a Triceratops
image.alt.vi: Mô hình khủng long ba sừng
> Câu ví dụ nối từ mới với con trâu, con vật ăn thực vật quen với trẻ Việt Nam. Hai câu chỉ nói chung một cách ăn, không nói hai con giống nhau hay là họ hàng. [Nghe thử] giọng EN đọc "herbivore", "Triceratops".

### carnivore
id: d61d51d8-58a3-4e4b-8e93-4bb4e8b85fea
tier: core
term.en: carnivore
term.vi: động vật ăn thịt
example.en: T. rex was a carnivore. Tigers are carnivores, too.
example.vi: Khủng long bạo chúa là động vật ăn thịt. Con hổ cũng vậy.
image.brief: Dùng lại hình `khung-long-an-gi-song-ra-sao/explore_meat`
image.alt.en: A T. rex skull in a museum
image.alt.vi: Hộp sọ khủng long bạo chúa trong bảo tàng
> [Nghe thử] giọng EN đọc "carnivore", "T. rex" liền một hơi.

### nest
id: d915d627-134b-4d4c-b068-0b598c953af3
tier: core
term.en: nest
term.vi: tổ
example.en: Dinosaurs laid their eggs in nests.
example.vi: Khủng long đẻ trứng trong tổ.
image.brief: Dùng lại hình `hoa-thach-ke-chuyen-khung-long/tray_rock_nest`
image.alt.en: A fossil dinosaur nest with eggs
image.alt.vi: Tổ trứng khủng long hoá thạch

### hatch
id: f08eea8e-15e9-496d-b558-767cfa94fbf8
tier: core
term.en: hatch
term.vi: nở
example.en: The baby dinosaur hatched from its egg.
example.vi: Khủng long con nở ra từ quả trứng.
image.brief: [ảnh mô hình] Mô hình tổ khủng long trong bảo tàng trứng khủng long Tây Hạp (Trung Quốc): nhiều quả trứng, một khủng long con đang chui ra khỏi trứng; khủng long con nhỏ trong khung (câu q1 cắt sát); không có người, không có chữ. Từ khoá tìm ảnh (EN): dinosaur eggs hatchlings model museum
image.alt.en: A model of a baby dinosaur hatching
image.alt.vi: Mô hình khủng long con đang nở
> Hình gốc; hình câu q1 dùng lại, cắt sát khủng long con và vỏ trứng, không thấy tổ (rà chữ tester 9/11 n10). Chọn ảnh mà phần quanh quả trứng cắt bỏ được.

### herd
id: 81b7c1e6-7bde-4266-83f7-6db1f4fda5ed
tier: extra
term.en: herd
term.vi: đàn
example.en: A herd of buffaloes walks home together.
example.vi: Đàn trâu cùng nhau đi về nhà.
image.brief: [ảnh] Đàn trâu rừng nhiều con đi thành hàng trên đồng cỏ ven rừng (Sri Lanka), chụp ngang từ xa; đã cắt bớt trời; không phải bờ đê ruộng lúa Việt Nam như brief đầu (không có ảnh hợp giấy phép); không có người, không có chữ. Từ khoá tìm ảnh (EN): wild water buffalo herd grassland
image.alt.en: A herd of buffaloes
image.alt.vi: Đàn trâu
> Câu ví dụ dùng đàn trâu quen thuộc. Chữ "herd" với khủng long đã có ở ô Cách tự vệ và câu q4.

### clue
id: 41fb29ee-75b9-42c7-8e13-bb0690c81f03
tier: extra
term.en: clue
term.vi: manh mối
example.en: This sharp tooth is a clue to what it ate.
example.vi: Chiếc răng nhọn này là manh mối cho biết con khủng long đã ăn gì.
image.brief: Dùng lại hình `khung-long-an-gi-song-ra-sao/tray_sharp_tooth`
image.alt.en: A sharp, curved T. rex tooth
image.alt.vi: Răng nhọn và cong của khủng long bạo chúa

## Thưởng

### long_neck_egg
id: 303c110d-e31b-45c4-a543-316ada5b240b
set: dinosaurs
rarity: common
name.en: Dinosaur egg
name.vi: Trứng khủng long
tag.en: Fossil egg
tag.vi: Trứng hoá thạch
fact.en: Many dinosaurs laid eggs with hard shells, like chicken eggs. Scientists find these eggs in rock.
fact.vi: Nhiều loài khủng long đẻ trứng có vỏ cứng, như trứng gà. Các nhà khoa học tìm thấy những quả trứng ấy trong đá.
image.brief: Dùng lại hình `hoa-thach-ke-chuyen-khung-long/tray_rock_egg`
image.alt.en: A fossil dinosaur egg in rock
image.alt.vi: Trứng khủng long hoá thạch nằm trong đá
> SK-033 (Duy chốt 10/11): thẻ đổi từ "Long-necked dinosaur egg" · "Trứng khủng long cổ dài" thành "Dinosaur egg" · "Trứng khủng long", dùng lại nguyên ảnh `tray_rock_egg` của bài ba (trứng Dendroolithus, chưa rõ loài khủng long nào đẻ), không ghép ảnh quả dừa. Bỏ ý "trứng khủng long cổ dài chỉ cỡ quả dừa", vì ảnh không phải trứng khủng long cổ dài và không có vật để so. Key `long_neck_egg` giữ nguyên để không phải sửa tham chiếu; key không hiện cho bé.
> [CẦN KIỂM] Nhiều loài khủng long đẻ trứng vỏ cứng như trứng chim, và trứng vỏ cứng giữ được lâu nên hay được tìm thấy thành hoá thạch trong đá. Biên tập nhớ có nghiên cứu cho rằng một số loài khủng long đẻ trứng vỏ mềm, nên câu nói "nhiều loài", không nói "mọi loài". Biên tập nhớ, chưa tra nguồn.
> `alt` theo ảnh Duy duyệt: trứng hoá thạch nằm trong đá. Brief ở bài ba chỉ tả quả trứng chụp gần; nếu ảnh cuối cùng không thấy đá quanh quả trứng thì bỏ "in rock" · "nằm trong đá".
> Hai câu EN 10 và 6 từ.
> Bộ thẻ mới `set: dinosaurs`: khoá `collectible.set.dinosaurs` đã có trong app (SK-033, 9/11).

## Ghi chú cho hoạ sĩ

- **Loại hình** (Quy ước hình ở `_topic.md`, Duy 9/11, chốt thêm 10/11): ảnh chụp thật, ảnh mô hình, tranh phục dựng khoa học, hoặc sơ đồ ghép từ ảnh có sẵn (`[sơ đồ ghép ảnh]`). Đồ vật không có ảnh miễn phí hợp lệ thì designer vẽ minh hoạ gần thực tế (hình tự vẽ, `[hình vẽ]`, credit "Science Kids"). Không hoạt hình, không giấy cắt cho hình nội dung; không lấy hình AI từ nguồn ngoài. Khủng long chỉ có ba loại hình: ảnh bộ xương hay hoá thạch trong bảo tàng, ảnh mô hình phục dựng, tranh phục dựng khoa học. Na và giao diện vẫn theo phong cách E. Bài này có ba hình ghép (ba lựa chọn câu q4, designer ghép 10/11), chưa có hình tự vẽ.
- **Không lộ đáp án:**
  - mọi hình không có chữ: cắt hoặc che biển tên bảo tàng, chữ trên mô hình, logo;
  - Duy chốt 10/11: bốn hình phần Học cũng không có nhãn chữ song ngữ; tên gọi nằm ở câu và món ví dụ. Chỗ dùng lại ở Chơi, Quiz, Từ vựng dùng cùng ảnh;
  - hình câu hỏi q1 là mô hình khủng long con đang nở (dùng lại hình từ `hatch`), cắt không thấy tổ; w1 và q2 là bộ dụng cụ tìm hoá thạch (hình câu q4 bài ba); q5 là bụi dương xỉ của bài một, không có khủng long (SK-033);
  - ba lựa chọn q2 cùng một kiểu: ảnh hoá thạch cắt cận một đoạn hàm có nhiều răng, khung vuông, không nhãn chữ (rà chữ tester 9/11 N3).
- **Đúng khoa học** [CẦN KIỂM, người có chuyên môn xem từng hình]:
  - khủng long bạo chúa (mô hình q5_trex) lưng nằm ngang, đuôi không chạm đất;
  - không ghép loài khác thời, khác nơi vào một cảnh. Ba tranh câu q4 chỉ có khủng long cổ dài;
  - `alt` của mô hình và tranh nói rõ "A model of…" · "Mô hình…", "A painting of…" · "Tranh vẽ…".
- **An toàn:**
  - không có người và khủng long còn sống trong cùng một hình. Ảnh mô hình ở công viên phải không có khách;
  - không máu, không cảnh săn mồi, không xác con vật. Con cá là cá còn sống đang bơi (hình q1_fish bài hai), không bày như món ăn;
  - hộp sọ và mô hình khủng long bạo chúa chụp ngang, không há miệng gầm về phía người xem.
- **Kệ Chơi, mười hình cùng khung vuông, mỗi hình một vật:**
  - hai loại răng (dẹt, như bút chì) và chiếc răng nhọn cong phải khác nhau rõ bằng mắt: một mặt nhiều răng nhỏ sát nhau; một hàng răng thẳng, mảnh; một chiếc răng to, cong như quả chuối;
  - dương xỉ, vạn tuế là ảnh cây ngày nay; cá, thằn lằn cũng là ảnh con vật ngày nay. Bốn món này cùng kiểu chụp để bé không xếp theo kiểu "cây hay con";
  - ba món tự vệ là hoá thạch hoặc ảnh trên đá: hộp sọ ba sừng, đuôi chuỳ, bãi dấu chân.
- **Ba tranh câu q4** cùng bối cảnh bãi bùn ven hồ, cùng góc nhìn ngang, chỉ khác số con và việc chúng làm. 10/11: designer ghép cả ba từ một tranh CC0 khủng long cổ dài (Brontosaurus) đặt lên nền bãi bùn ven hồ tự vẽ; ổ trứng ở q4_nest do designer vẽ thêm.
- **Bốn mô hình câu q5** cùng kiểu chụp ngang cả con, ở công viên, nền cây cối tương tự. Hai mô hình dùng lại bài một (khủng long ba sừng `w1_triceratops`, khủng long cổ dài `tray_longneck`); hai mô hình tìm mới (khủng long bạo chúa, khủng long bọc giáp) phải hợp kiểu với hai ảnh đó.
- **Ảnh cần tìm (mười tám; rà chéo 9/11 ghi mười chín, 10/11 bỏ ảnh quả dừa):**
  - Học, ba: hộp sọ khủng long cổ dài thấy răng (nửa trái `explore_plants`), `explore_meat`, `explore_safe`. `explore_eggs` dùng lại ổ trứng của bài ba; nửa phải `explore_plants` dùng lại dương xỉ, vạn tuế của bài một;
  - Chơi, bốn: tray_flat_teeth, tray_sharp_tooth, tray_horns, tray_tail_club;
  - Khởi động, không: cả ba câu và ba lựa chọn w1 dùng lại hình bài hai, bài ba;
  - Quiz, chín: q1_pond, q1_leaf, hộp sọ khủng long mỏ vịt (q3), bãi dấu chân thứ hai (q4), ba tranh q4, mô hình khủng long bạo chúa, mô hình khủng long bọc giáp (q5);
  - Từ vựng, hai: hatch, herd;
  - Thưởng, không: thẻ dùng lại nguyên ảnh `tray_rock_egg` của bài ba, không ghép quả dừa (Duy chốt 10/11).
- **Dùng lại trong bài** (`brief` ghi "Dùng lại hình `khung-long-an-gi-song-ra-sao/<key>`"): SK-033 đổi: explore_plants chỉ còn ảnh hộp sọ, tray_pencil_teeth là ảnh riêng (q2_pencil cắt từ đó), hình câu q5 dùng lại dương xỉ `tray_fern` của bài một; explore_meat (q2_sharp cắt cận đoạn hàm, q6, từ carnivore); explore_safe (tray_herd_tracks, dự phòng cho q4); tray_flat_teeth (q2_flat); tray_sharp_tooth (từ clue); từ `hatch` (hình câu q1).
- **Dùng lại từ bài khác** (bảng hình dùng chung ở `_topic.md`, Quy ước hình mục mười):
  - bài một: dương xỉ `tray_fern` (tray_fern, q3_fern), vạn tuế `tray_cycad` (tray_cycad), mô hình khủng long ba sừng `w1_triceratops` (q5_triceratops, từ herbivore), mô hình khủng long cổ dài `tray_longneck` (q5_long_neck), khủng long đồ chơi `q6` (w1_toy; cùng ảnh với món `tray_toy` bài ba);
  - bài hai: thằn lằn `w3_lizard` (tray_lizard, q3_lizard), cá chép `q1_fish` (tray_fish, q3_fish), tranh thằn lằn bay `tray_pterosaur` (câu w3; SK-033 thay bản cắt nửa trên của `explore_not_dinosaurs`);
  - bài ba: dụng cụ ở bãi đào `q4` (câu w1, q2), `tray_sand_prints` (nay là dấu chân chó), `tray_rock_print` (ba lựa chọn w1), xương đùi `tray_rock_bone` (câu w2), quả trứng `tray_rock_egg` (thẻ thưởng), ổ trứng `tray_rock_nest` (`explore_eggs`, q1_nest, từ nest).
- **Cho bài năm:** câu w1 bài năm (khủng long cổ dài ăn gì: con cá, dương xỉ, con thằn lằn nhỏ) dùng cùng ba hình gốc với câu q3 bài này.
- **Màu:**
  - Học: trứng và tổ `vang_hoe`, ăn thực vật `gi_dong`, ăn thịt `do_son`, cách tự vệ `nau_dat`;
  - Chơi: răng `cham`, thức ăn `gi_dong`, cách tự vệ `nau_dat`, nhóm "Không phải của khủng long ăn thực vật" `do_son` (cùng màu ô Khủng long ăn thịt).
- **Ý chính** chưa có trường hình trong schema v1. Gợi ý nếu sau này có màn tóm tắt: tổ trứng hoá thạch; răng dẹt cạnh răng nhọn; bãi dấu chân song song.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, bốn từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, mười món (bảy món đúng, ba món bẫy).
  - Khởi động: `single_choice` (w1), `true_false` (w2 đáp án Sai, w3 đáp án Đúng); cả ba có hình ở câu, ba lựa chọn của w1 có hình.
  - Quiz: `single_choice` ×4 (q1 đến q4), `multi_choice` (q5), `true_false` (q6, `speaker: na`). Ba format, đều hiện được ở app 0.1.0. Không có `fill_blank_bank` (Duy 9/11).
  - DOK q1 đến q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Câu có `misconception`: q6, key `all_dinosaurs_ate_meat`, đáp án Sai.
  - Luật "chỗ nào cũng có hình" máy chưa kiểm (`image_required: []`); biên tập đã tự kiểm: chín câu (ba Khởi động, sáu Quiz) đều có `image` ở câu hỏi, mười chín lựa chọn đều có `image`, mười món kệ đều có `image`, bốn nhóm Học, sáu từ vựng và thẻ thưởng đều có `image`.
- **Tham chiếu:**
  - `topic: khung-long` → `topic_id`.
  - w1, w2: `recall_from.lesson: khung-long/hoa-thach-ke-chuyen-khung-long` → `lesson_id` của bài ba. w3: `recall_from.lesson: khung-long/khung-long-la-gi` → `lesson_id` của bài hai. Hai bài đã có id; slug đúng (rà chéo 9/11).
  - `misconception: all_dinosaurs_ate_meat` → `misconception_id` (đã có id trong `_topic.md`).
  - `group:` trỏ nhóm của `tray`; `term_keys` trỏ Từ vựng. Mọi key duy nhất trong bài.
- **App không xáo lựa chọn**, nên vị trí đáp án đúng đặt tay:
  - w1: thứ hai;
  - q1: thứ ba; q2: thứ nhất; q3: thứ nhất; q4: thứ hai; q5: thứ nhất, thứ ba, thứ tư.
  - Rà chữ tester 9/11 (n1) đã xáo lại tay w1, q1 tới q4: bản trước theo chu kỳ 3-1-2-3-1, đoán được. Thứ tự `#### option` trong file đổi, key không đổi.
  - Kệ Chơi app tự xáo mỗi lượt học; thứ tự `#### item` trong file đã xếp xen cho chắc.
- **Màn Chơi, ví dụ để kiểm** (ưu tiên lời nhắn theo SK-012: balanced, full, has_limited, start, missing):
  - mở màn, chưa chạm gì → `start`;
  - chạm Răng dẹt, Dương xỉ, Ba chiếc sừng → đạt (`balanced`);
  - chạm Răng nhọn và cong → `has_limited`;
  - chạm Răng dẹt, Răng như bút chì, Cây vạn tuế (đủ ba chỗ, thiếu cách tự vệ) → `missing.tray_safe`;
  - rồi chạm Đuôi chuỳ → `full`;
  - bỏ Răng như bút chì ra, đặt Đuôi chuỳ vào → đạt.
- **Dòng điều kiện màn Chơi** sẽ là "Cần đủ Răng, Thức ăn, Cách tự vệ · Không phải của khủng long ăn thực vật" (rà chéo 9/11 đổi nhãn `limit` sang dạng "Không …"). Nhãn `limit` dài khoảng ba mươi bảy ký tự và giữ liền một khối; nhờ tester xem trên iPhone bề rộng nhỏ nhất, nếu tràn thì báo biên tập rút gọn.
- **Bộ thẻ `set: dinosaurs`:** ios-dev đã thêm khoá `collectible.set.dinosaurs` "Dinosaur cards" · "Thẻ khủng long" (SK-033, 9/11).
- **Số từ EN mỗi câu:** mọi câu tối đa mười từ. Dài nhất: mục tiêu (10), giải thích khi đúng của w3 (10), giải thích khi đúng của q4 (10, không tính "Yes!"), câu ví dụ của `clue` (10).
- **Số từ EN trên một màn** (đếm như bài mẫu: trạng thái nhiều chữ nhất, món ví dụ ở Học không tính):
  - Học khoảng ba mươi lăm từ: mục tiêu 10, hướng dẫn 3, bốn nhãn 7, câu dài nhất 9 (ô Khủng long ăn thịt), ô Từ mới 6. Vượt ba mươi vì có ô thứ tư, như các bài của *Bề mặt Trái Đất*; nếu PM muốn đúng ba mươi, cách nhẹ nhất là bỏ `title` của `word_list` và đổi nhãn "Eggs and nests" thành "Eggs".
  - Khởi động: từ mười bảy (w2) tới khoảng hai mươi sáu từ (w1: câu hỏi 4, ba nhãn 9, giải thích sai 13).
  - Quiz: từ hai mươi ba tới khoảng ba mươi mốt từ. Nhiều nhất là q4 (câu hỏi 8, ba nhãn 12, gợi ý 11) và q6 (câu hỏi 3, hướng dẫn 4, lời Na 9, hai nhãn 2, giải thích đúng 10).
  - Chơi khoảng năm mươi lăm từ: mười tên món 20, bốn chip 6, dòng điều kiện khoảng 10, lời nhắn dài nhất 11 (`has_limited`), lệnh 4. Vẫn chờ PM chốt cách đếm màn Chơi.
- **Từ EN có thể ngoài Starters/Movers** (theo trí nhớ của biên tập, cần đối chiếu danh sách Cambridge):
  - từ mới của bài: herbivore, carnivore, nest, hatch, herd, clue;
  - từ đã học ở bài trước: fossil, footprint, dinosaur, flying reptile, T. rex, Triceratops, long-necked, armoured;
  - từ khác: plant-eater, meat-eater, fern, cycad, pine needles, grind, strip, pencil-like, curved, saw, edges, skull, horns, armour, tail club, lizard, pond, scientists, million, buffaloes, tigers, challenge, check, idea. ("coconut" đã bỏ 10/11: thẻ thưởng không còn so với quả dừa.)
  - Phần lớn có hình đi kèm, hoặc nằm trong lời nhắn và giải thích có phụ đề tiếng Việt.
- **Đọc bằng máy:**
  - chữ VI không chèn tên tiếng Anh hay tên loài La-tinh; "T. rex", "Triceratops" chỉ ở chuỗi EN;
  - nghe thử giọng EN: T. rex (đọc liền một hơi), Triceratops, herbivore, carnivore, cycad, armoured;
  - nghe thử giọng VI: "đuôi chuỳ", "vạn tuế", "bút chì".
- **Chính tả Anh:** armour, armoured.
- **Không dùng dấu "—"** và không có ký hiệu trong chuỗi tiếng Việt. Dấu ":" ở `messages.start.vi` và câu q5 gợi ý được giữ (VieNeu tự ngắt).
- **Asset:** không có audio và `asset` trong markdown; máy điền khi chạy `tts` và `assets`. Na là asset chung của app.
