---
id: 9d0fd724-1478-4ca1-9b5a-7186f12434b8
topic: thoi-tiet-va-cac-mua
slug: muoi-hai-thang
order: 5
stage: apply
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Twelve months
vi: Mười hai tháng
> Giữ đúng tên ở `content/syllabus.json` (key `new-weather-and-seasons`, bài số năm).

## Mục tiêu
en: I know a year has twelve months.
vi: Em biết một năm có mười hai tháng.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 17/11/2026. Ticket SK-050. Mọi dòng `id:` để trống; chạy `ids` sau bài 4 (Khởi động trỏ bài 4 và bài 2 của chủ đề này).
> Chủ đề mới, không bám sườn lesson nào (`_topic.md` mục Nguồn). Mục tiêu bảy từ EN (lệch đề xuất PM, đã ghi ở `_topic.md` mục Lệch).
> Bài áp dụng (`apply`): bé dùng các mùa đã học ở bài 2 tới 4 để đặt ba mốc quen (Tết, nghỉ hè, khai giảng) vào một năm quay vòng. Không dạy cách đếm tháng, không hỏi tên tháng hay tháng thứ mấy. Chỉ dùng dương lịch; không nói về tháng sinh của bé; không lễ tôn giáo.
> Sửa `months_stop_after_december` ở ý chính hai, hình vòng mười hai hạt (ô Twelve months), câu ví dụ của từ `year` và câu q6 (gắn key).

## Ý chính
1.en: A year has twelve months.
1.vi: Một năm có mười hai tháng.
2.en: After December, January comes again.
2.vi: Hết tháng Mười Hai lại đến tháng Một.
3.en: Every year has Tet and a summer holiday.
3.vi: Năm nào cũng có Tết, có nghỉ hè.
> Chữ chốt ở `_topic.md`. Từ cụ thể tới trừu tượng: con số mười hai (nhìn thấy mười hai hạt), rồi ý quay vòng, rồi các mốc lặp lại mỗi năm.
> Ý chính hai, câu q6 và giải thích khi đúng của q6 (câu `correction` chốt) có tên tháng, đúng như `_topic.md` mục Bài 5 cho phép: đó là câu nói, không phải câu hỏi tên tháng. Ngoài các chỗ này, tên tháng chỉ có ở ví dụ ô Học (ba câu vè ô Twelve months, ví dụ bắt buộc "in September" ở ô Back to school).

## Khởi động

> Hai câu, DOK 1: w1 ôn bài 4 (bài ngay trước, ô Dry season), w2 ôn bài 2 (cách hai bài, ô Spring). Câu và lựa chọn chốt ở `_topic.md` mục Khởi động.

### w1
id: c2852fe0-58ef-4998-ba94-65ce53193832
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-cac-mua/mua-mua-va-mua-kho
prompt.en: What helps plants in the dry season?
prompt.vi: Mùa khô, cái gì giúp cây?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about what plants need to grow.
hint.vi: Em nghĩ xem cây cần gì để lớn nhé.
explanation_correct.en: Yes! Water keeps the plants green.
explanation_correct.vi: Đúng rồi! Nước giúp cây xanh tốt.
explanation_wrong.en: The answer is the watering can. It gives water.
explanation_wrong.vi: Đáp án là bình tưới cây. Bình tưới đưa nước tới cho cây.
> Ôn ví dụ "we water the plants" ở ô Dry season bài 4. Gợi ý là cách nghĩ (cây cần nước), không trỏ thẳng vào ví dụ có đáp án.
> `alt.vi` của bình tưới chép đúng bảng `_topic.md` ("Bình tưới cây"), có chữ "cây" của câu hỏi; giữ vì là tên gọi duy nhất của đồ vật, và áo mưa (lựa chọn sai) khác hẳn bằng mắt.

#### option w1_can
correct: true
label.en: watering can
label.vi: bình tưới cây
image.brief: Dùng lại hình `tray_watering_can` ở bài `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho`. Từ khoá tìm ảnh (EN): watering can
image.alt.en: A watering can
image.alt.vi: Bình tưới cây

#### option w1_raincoat
correct: false
feedback.en: A raincoat keeps the rain off you.
feedback.vi: Áo mưa che mưa cho em.
label.en: raincoat
label.vi: áo mưa
image.brief: Dùng lại hình `tray_raincoat` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): yellow raincoat with hood
image.alt.en: A yellow raincoat with a hood
image.alt.vi: Chiếc áo mưa vàng có mũ

### w2
id: cbd000d2-62f6-40be-ad54-b91d36fe3687
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-cac-mua/mua-xuan-va-mua-he
prompt.en: Peach trees bloom in summer.
prompt.vi: Hoa đào nở vào mùa hè.
image.brief: Dùng lại hình `explore_spring` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Prunus persica blossom
image.alt.en: Pink blossoms on a branch
image.alt.vi: Cành hoa màu hồng
answer: false
hint.en: Think of the days around Tet.
hint.vi: Em nghĩ tới những ngày quanh Tết nhé.
explanation_correct.en: Peach trees bloom in spring, at Tet.
explanation_correct.vi: Hoa đào nở vào mùa xuân, dịp Tết.
explanation_wrong.en: This is false. Peach trees bloom in spring.
explanation_wrong.vi: Câu này sai. Hoa đào nở vào mùa xuân.
feedback_true.en: Summer brings red flame tree flowers.
feedback_true.vi: Mùa hè là mùa hoa phượng đỏ.
> Ôn câu chính ô Spring bài 2. Hình là cành hoa đào (đúng vật được nói tới). Gợi ý trỏ tới một cảnh quen (dịp Tết), không gọi tên mùa. Phản hồi nói về mùa hè (điều bé vừa chọn), không lặp gợi ý.
> `explanation_correct` đứng một mình được (không "Yes!"), dù câu này ở Khởi động.

## Học

> Bốn ô, theo `_topic.md` mục Bài 5: vòng mười hai tháng, rồi ba mốc trong năm theo đúng thứ tự Tết, nghỉ hè, khai giảng (thứ tự ô cũng là thứ tự đúng của câu q4).
> Chữ dạy trước cho Quiz: ví dụ một ô Summer holiday và ảnh xô xẻng ở kệ Chơi (q1); câu chính ô Twelve months (q2); ví dụ hai ô Tet (q3); câu chính ba ô Tet, Summer holiday, Back to school (q4); ví dụ hai ô Summer holiday (q5); ý chính hai, hình vòng hạt và câu ví dụ từ `year` (q6).
> Không tờ lịch, không chữ số, không đồng hồ trong hình. Không bảng tháng theo mùa.

### explore
id: 038bd5aa-8954-48a7-9993-4e0814fba9ac
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_months
label.en: Twelve months
label.vi: Mười hai tháng
color: gi_dong
sentence.en: A year has twelve months.
sentence.vi: Một năm có mười hai tháng.
image.brief: [hình vẽ] Mười hai hạt tròn cùng cỡ, cùng một màu, xâu trên một sợi dây mảnh thành một vòng tròn khép kín, khoảng cách giữa các hạt đều nhau, nhìn thẳng từ trên xuống, nền trơn sáng; vẽ gần thực tế như chuỗi hạt gỗ thật; không chữ số, không chữ, không mũi tên, không hạt nào khác màu hay to hơn, không nét viền, không tờ lịch, không đồng hồ. Từ khoá tìm ảnh (EN): wooden beads circle
image.alt.en: Twelve beads in a ring
image.alt.vi: Mười hai hạt tròn xếp thành vòng
examples.1.en: January, February, March, April
examples.1.vi: tháng Một, tháng Hai, tháng Ba, tháng Tư
examples.2.en: May, June, July, August
examples.2.vi: tháng Năm, tháng Sáu, tháng Bảy, tháng Tám
examples.3.en: September, October, November, December
examples.3.vi: tháng Chín, tháng Mười, tháng Mười Một, tháng Mười Hai
> Hình tự vẽ duy nhất của chủ đề (PM đồng ý 17/11, `_topic.md` Quy ước hình số một). Không có ảnh thật cho ý "năm quay vòng"; tờ lịch có chữ số nên không dùng. Dòng từ khoá chỉ để hoạ sĩ tham khảo dáng chuỗi hạt; nhãn `[hình vẽ]` báo máy không tìm ảnh.
> Ba ví dụ bắt buộc (vè tên tháng, chỉ để nghe, đọc liền ba câu như một bài vè). Tên tháng không vào từ vựng, không có câu hỏi nào hỏi tên tháng hay tháng thứ mấy.
> Vòng khép kín là chỗ dạy bằng hình cho ý chính hai: tháng cuối nối liền tháng đầu. Hoạ sĩ không đánh dấu hạt "đầu", hạt "cuối".
> Nghe thử giọng VI "tháng Tư", "tháng Mười Một", "tháng Mười Hai"; giọng EN đọc ba câu vè.
> [CẦN KIỂM] Viết hoa tên tháng VI ("tháng Một" hay "tháng một"); dùng "tháng Một" cho dương lịch.

#### group explore_tet
label.en: Tet
label.vi: Tết
color: vang_hoe
sentence.en: Tet comes near the start of the year.
sentence.vi: Tết đến vào khoảng đầu năm.
image.brief: [ảnh] Một cành hoa mai vàng đang nở (loài Ochna integerrima, hoa năm cánh vàng, nhuỵ dài), chụp gần, nền trời hoặc tường mờ; không lẫn hoa đào, không mai chiếu thuỷ, không có người, không câu đối, không bao lì xì, không chữ. Từ khoá tìm ảnh (EN): Ochna integerrima; yellow mai flower branch
image.alt.en: Yellow blossoms on a branch
image.alt.vi: Cành hoa vàng
examples.1.en: peach blossoms in the north
examples.1.vi: miền Bắc có hoa đào
examples.2.en: yellow apricot blossoms in the south
examples.2.vi: miền Nam có hoa mai vàng
examples.3.en: families wrap banh chung or banh tet
examples.3.vi: nhà nhà gói bánh chưng, bánh tét
> Hai ví dụ đầu là bắt buộc (`_topic.md`): chỗ duy nhất của bài nhắc cả hai miền. Hoa đào và hoa mai nằm ở hai ví dụ khác nhau, không chung một câu; hình chỉ có hoa mai.
> Ví dụ ba thêm "bánh tét" (sửa 17/11 theo rà chữ g6): ô này đã ghép hai miền, bé miền Nam gói bánh tét. Chỉ lời, không thêm ảnh; món kệ, thẻ q4, thẻ thưởng vẫn là bánh chưng. Nghe thử giọng EN đọc "banh tet".
> [CẦN KIỂM] Miền Nam ngày Tết gói bánh tét (bánh hình trụ, gói lá chuối); miền Bắc gói bánh chưng.
> `alt` không có chữ "Tet" (ảnh này là đáp án đúng của câu q3).
> Không nói Tết rơi vào tháng nào, không nói cách tính ngày Tết.
> [CẦN KIỂM] Tết rơi vào tháng Một hoặc tháng Hai dương lịch ("khoảng đầu năm"); hoa mai vàng (*Ochna integerrima*) nở dịp Tết ở miền Nam; tên EN "yellow apricot blossom" (tên khác: "yellow ochna", "Vietnamese mickey mouse plant").

#### group explore_holiday
label.en: Summer holiday
label.vi: Nghỉ hè
color: cham
sentence.en: School stops for the summer holiday.
sentence.vi: Nghỉ hè, em được nghỉ học.
image.brief: Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): empty beach blue sea
image.alt.en: A beach by the sea
image.alt.vi: Bãi biển vắng
examples.1.en: trips to the beach
examples.1.vi: đi chơi biển
examples.2.en: flame trees are red
examples.2.vi: hoa phượng nở đỏ
examples.3.en: hot, sunny days
examples.3.vi: những ngày nắng nóng
> Ví dụ một dạy trước câu q1 (đồ đi biển); ví dụ hai dạy trước câu q5 (hoa phượng gắn với nghỉ hè). Câu chính VI viết theo cách bé nói ("em được nghỉ học"), cùng ý với EN.
> [CẦN KIỂM] Nghỉ hè khoảng tháng Sáu tới tháng Tám, trùng mùa hoa phượng nở.

#### group explore_school
label.en: Back to school
label.vi: Khai giảng
color: nau_dat
sentence.en: After summer, a new school year starts.
sentence.vi: Hết hè, năm học mới bắt đầu.
image.brief: [ảnh] Một chiếc cặp sách đeo lưng màu đen, trơn màu, treo bên bàn trong lớp học, cạnh một chiếc cặp đỏ; cắt bỏ đồng hồ và bảng chữ; không người, không nhãn hiệu, không chữ, không hình in nhân vật hoạt hình. Từ khoá tìm ảnh (EN): school backpack
image.alt.en: A school bag
image.alt.vi: Chiếc cặp sách
examples.1.en: in September
examples.1.vi: vào tháng Chín
examples.2.en: a new school bag
examples.2.vi: cặp sách mới
examples.3.en: the school drum beats
examples.3.vi: trống trường vang lên
> Ví dụ một là bắt buộc (`_topic.md`). Trống trường chỉ nói ở ví dụ, không làm ảnh (hiếm ảnh có giấy phép mở).
> [CẦN KIỂM] Khai giảng năm học mới vào ngày năm tháng Chín; trống trường đánh trong lễ khai giảng.

### new_words
id: 1229d90f-2e69-4bb0-b047-1737365f689b
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: month, year

## Chơi

> Bé chọn ba món, mỗi món cho một dịp trong năm: Tết (bánh chưng, hoa mai), nghỉ hè (xô và xẻng, phao bơi), khai giảng (cặp sách). Đạt khi đủ ba nhóm và không chọn đồ dùng hằng ngày.
> Món bẫy là đồ ngày nào cũng dùng (bàn chải đánh răng, bát cơm). Bát cơm là món ăn như bánh chưng, nên bé phải nghĩ "món của một dịp" hay "món của mọi ngày".
> Lời nhắn `has_limited` đúng với cả hai món bẫy. Cặp sách cũng dùng nhiều ngày trong năm học; nhóm của nó là "Back to school" (cặp sách mới, ví dụ hai ô Back to school), không trùng nhãn bẫy "Every day".
> Không thêm cành đào vào nhóm Tết (luật không đặt hoa đào cạnh hoa mai).

### tray
id: 522b5191-81f8-4827-a7af-fa763ec3cca4
type: build_tray
version: 1
prompt.en: Pick things for three times of year
prompt.vi: Chọn đồ cho ba dịp trong năm
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find one thing for each time of year.
messages.start.vi: Em tìm cho mỗi dịp một món nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! One thing for each time of year.
messages.balanced.vi: Tuyệt! Mỗi dịp trong năm có một món.
messages.has_limited.en: We use that one every day.
messages.has_limited.vi: Món này ngày nào mình cũng dùng.
messages.missing.tray_tet.en: Now find one thing for Tet.
messages.missing.tray_tet.vi: Em tìm thêm một món cho Tết nhé.
messages.missing.tray_holiday.en: Now find one for the summer holiday.
messages.missing.tray_holiday.vi: Em tìm thêm một món cho kỳ nghỉ hè nhé.
messages.missing.tray_school.en: Now find one for back to school.
messages.missing.tray_school.vi: Em tìm thêm một món cho ngày khai giảng nhé.

#### group tray_tet
label.en: Tet
label.vi: Tết
color: vang_hoe
role: required

#### group tray_holiday
label.en: Summer holiday
label.vi: Nghỉ hè
color: cham
role: required

#### group tray_school
label.en: Back to school
label.vi: Khai giảng
color: nau_dat
role: required

#### group tray_every_day
label.en: Every day
label.vi: Ngày nào cũng dùng
color: do_son
role: limit
> Nhãn `limit` viết khẳng định (`_topic.md` mục Phần Chơi). Ba nhãn bắt buộc trùng chữ nhãn ba ô Học (một ý một nhãn), cùng màu với ô Học.

#### item tray_banh_chung
label.en: Banh chung
label.vi: Bánh chưng
group: tray_tet
image.brief: Dùng lại hình `tray_banh_chung` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): banh chung
image.alt.en: Two square cakes wrapped in leaves
image.alt.vi: Hai chiếc bánh vuông gói lá

#### item tray_toothbrush
label.en: Toothbrush
label.vi: Bàn chải đánh răng
group: tray_every_day
image.brief: [ảnh] Một chiếc bàn chải đánh răng trơn màu, chụp gần đầu bàn chải, thấy lông bàn chải và nửa cán; không kem đánh răng, không bao bì, không nhãn hiệu, không chữ, không người. Từ khoá tìm ảnh (EN): toothbrush plain background
image.alt.en: A toothbrush
image.alt.vi: Chiếc bàn chải đánh răng

#### item tray_bucket
label.en: Bucket and spade
label.vi: Xô và xẻng
group: tray_holiday
image.brief: [ảnh] Một chiếc xô nhựa và một chiếc xẻng nhựa xúc cát đặt trên bãi cát, chụp gần, màu tươi; không người, không nhãn hiệu, không chữ. Từ khoá tìm ảnh (EN): sand bucket spade
image.alt.en: A bucket and spade
image.alt.vi: Xô và xẻng xúc cát
> Hình gốc `tray_bucket` của chủ đề (bảng Hình dùng chung); câu q1 dùng lại.

#### item tray_bag
label.en: School bag
label.vi: Cặp sách
group: tray_school
image.brief: Dùng lại hình `explore_school`. Từ khoá tìm ảnh (EN): school backpack
image.alt.en: A school bag
image.alt.vi: Chiếc cặp sách

#### item tray_mai
label.en: Yellow apricot blossom
label.vi: Hoa mai
group: tray_tet
image.brief: Dùng lại hình `explore_tet`. Từ khoá tìm ảnh (EN): Ochna integerrima; yellow mai flower branch
image.alt.en: Yellow blossoms on a branch
image.alt.vi: Cành hoa vàng

#### item tray_rice_bowl
label.en: Bowl of rice
label.vi: Bát cơm
group: tray_every_day
image.brief: [ảnh] Một bát cơm trắng đầy đặt trên bàn hoặc trên mâm, chụp gần từ trên chéo xuống; không thức ăn khác nổi bật, không đũa có chữ, không người, không chữ. Từ khoá tìm ảnh (EN): bowl of white rice
image.alt.en: A bowl of white rice
image.alt.vi: Bát cơm trắng

#### item tray_swim_ring
label.en: Swim ring
label.vi: Phao bơi
group: tray_holiday
image.brief: [ảnh] Một chiếc phao bơi tròn bơm hơi màu xanh lá trong suốt, nổi trên mặt nước; không người, không trẻ em, không hình in, không nhãn hiệu, không chữ. Từ khoá tìm ảnh (EN): inflatable swim ring; swim ring beach
image.alt.en: A round swim ring
image.alt.vi: Chiếc phao bơi tròn
> Không ảnh trẻ đang dùng phao dưới nước (an toàn khi bơi không thuộc bài này).

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ, một thứ tự đúng). Chữ câu hỏi, đáp án, lựa chọn chốt ở `_topic.md` mục Khung Quiz.
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Không câu nào hỏi tên tháng hay tháng thứ mấy. `hint`, `feedback`, giải thích không có tên tháng; chỉ câu q6 (câu nói) và giải thích khi đúng của nó (câu `correction` chốt) có tên tháng.

### q1
id: 67b1d6bc-1fdc-4c9e-94c9-0394662f8a76
format: single_choice
version: 1
dok: 1
prompt.en: Which one is for the summer holiday?
prompt.vi: Cái nào dành cho kỳ nghỉ hè?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of trips to the beach.
hint.vi: Em nghĩ tới những chuyến đi chơi biển nhé.
explanation_correct.en: Yes! We dig in the sand at the beach.
explanation_correct.vi: Đúng rồi! Ra biển, mình xúc cát chơi.
explanation_wrong.en: The answer is the bucket and spade. They are for the beach.
explanation_wrong.vi: Đáp án là xô và xẻng. Xô và xẻng để chơi cát ở biển.
> DOK 1: nhớ lại ô Summer holiday (ví dụ một) và kệ Chơi. Ba vật của ba dịp khác nhau, khác hẳn bằng mắt; cả ba bé đã gặp (bánh chưng bài 2, áo khoác bài 1, xô xẻng ở kệ Chơi hôm nay), nên đáp án không là ảnh lạ duy nhất.
> Gợi ý trỏ tới một cảnh quen (ví dụ ô Học), không gọi tên đồ vật.

#### option q1_coat
correct: false
feedback.en: A warm coat is for cold days.
feedback.vi: Áo khoác ấm dùng cho ngày lạnh.
label.en: coat
label.vi: áo khoác
image.brief: Dùng lại hình `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc

#### option q1_bucket
correct: true
label.en: bucket and spade
label.vi: xô và xẻng
image.brief: Dùng lại hình `tray_bucket`. Từ khoá tìm ảnh (EN): sand bucket spade
image.alt.en: A bucket and spade
image.alt.vi: Xô và xẻng xúc cát

#### option q1_banh_chung
correct: false
feedback.en: Banh chung is made for Tet.
feedback.vi: Bánh chưng được gói dịp Tết.
label.en: banh chung
label.vi: bánh chưng
image.brief: Dùng lại hình `tray_banh_chung` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): banh chung
image.alt.en: Two square cakes wrapped in leaves
image.alt.vi: Hai chiếc bánh vuông gói lá

### q2
id: 6449d2ba-a1e6-4c37-a7e6-9b0c29e89140
format: true_false
version: 1
dok: 1
prompt.en: A year has twelve months.
prompt.vi: Một năm có mười hai tháng.
image.brief: Dùng lại hình `explore_months`. Từ khoá tìm ảnh (EN): wooden beads circle
image.alt.en: Twelve beads in a ring
image.alt.vi: Mười hai hạt tròn xếp thành vòng
answer: true
hint.en: Look at the beads in the ring.
hint.vi: Em nhìn các hạt trong vòng tròn nhé.
explanation_correct.en: Yes! Each bead in the ring is a month.
explanation_correct.vi: Đúng rồi! Mỗi hạt trong vòng là một tháng.
explanation_wrong.en: This is true. A year has twelve months.
explanation_wrong.vi: Câu này đúng. Một năm có mười hai tháng.
feedback_false.en: The ring shows every month of the year.
feedback_false.vi: Vòng tròn có đủ các tháng trong năm.
> DOK 1: nhớ lại câu chính ô Twelve months. Hình là vòng mười hai hạt (đúng vật được nói tới). Gợi ý trỏ tới bằng chứng nhìn thấy, không bảo bé đếm (không dạy Toán).

### q3
id: 701d9e65-8218-407e-a031-650f168c085d
format: single_choice
version: 1
dok: 1
prompt.en: Which flower do we see at Tet?
prompt.vi: Dịp Tết, mình thấy hoa nào?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of families getting ready for Tet.
hint.vi: Em nghĩ tới lúc nhà nhà chuẩn bị đón Tết nhé.
explanation_correct.en: Yes! Many families buy them for Tet.
explanation_correct.vi: Đúng rồi! Nhiều nhà mua hoa mai về đón Tết.
explanation_wrong.en: The answer is the yellow apricot blossom. It blooms at Tet.
explanation_wrong.vi: Đáp án là hoa mai. Hoa mai nở dịp Tết.
> DOK 1: nhớ lại ví dụ hai ô Tet. Hoa sen và hoa phượng là hai lựa chọn sai; không có hoa đào (hoa đào cũng đúng dịp Tết, và luật không đặt hoa đào cạnh hoa mai). Ba hoa khác hẳn màu và dáng (vàng nhỏ trên cành, hồng to trên mặt ao, đỏ trên cây to).
> `alt` hoa mai không có chữ "Tet". Giải thích khi đúng không nhắc miền Nam (bài chỉ nhắc hai miền ở ô Tet).
> [CẦN KIỂM] Nhiều gia đình mua cành mai hay chậu mai chưng Tết (nhất là ở miền Nam).

#### option q3_lotus
correct: false
feedback.en: Lotus flowers bloom in hot summer.
feedback.vi: Hoa sen nở vào mùa hè nóng.
label.en: lotus
label.vi: hoa sen
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao
> [CẦN KIỂM] Hoa sen nở vào mùa hè (như bài 2).

#### option q3_mai
correct: true
label.en: yellow apricot blossom
label.vi: hoa mai
image.brief: Dùng lại hình `explore_tet`. Từ khoá tìm ảnh (EN): Ochna integerrima; yellow mai flower branch
image.alt.en: Yellow blossoms on a branch
image.alt.vi: Cành hoa vàng

#### option q3_flame
correct: false
feedback.en: Flame trees bloom red in summer.
feedback.vi: Hoa phượng nở đỏ vào mùa hè.
label.en: flame tree
label.vi: hoa phượng
image.brief: Dùng lại hình `explore_summer` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to

### q4
id: 0b038a28-3f83-4bbf-b72d-625b6e7fb2f9
format: order_sequence
version: 1
dok: 2
prompt.en: Start at Tet. Put them in order.
prompt.vi: Bắt đầu từ Tết. Em xếp theo thứ tự nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_tet, q4_holiday, q4_school
hint.en: Think of when school stops and starts.
hint.vi: Em nghĩ xem khi nào được nghỉ học, khi nào đi học lại nhé.
explanation_correct.en: Yes! Next year, they all come again.
explanation_correct.vi: Đúng rồi! Sang năm, các dịp ấy lại đến.
explanation_wrong.en: The order is Tet, summer holiday, then school.
explanation_wrong.vi: Thứ tự là Tết, nghỉ hè, rồi khai giảng.
> DOK 2: xếp ba mốc quen theo thứ tự trong năm. `prompt` nêu thẻ đầu (năm là vòng, nên phải có điểm bắt đầu để chỉ một thứ tự đúng). Thứ tự ba ô Học là thứ tự đúng.
> Gợi ý chỉ nhắc một cách nghĩ (năm học của bé), không gọi tên thẻ nào. Giải thích khi đúng nối sang ý chính ba (năm nào cũng có các mốc ấy).
> Mỗi thẻ là ảnh một dấu hiệu, `label` gọi tên dịp (như quy ước câu lựa chọn là dịp ở `_topic.md`): app đọc "Tết", "nghỉ hè", "khai giảng" sau khi bé đặt thẻ. Thẻ trong file không theo thứ tự đúng.
> [CẦN KIỂM] Tết (tháng Một hoặc tháng Hai dương lịch) đến trước nghỉ hè (khoảng tháng Sáu tới tháng Tám), nghỉ hè đến trước khai giảng (tháng Chín).

#### item q4_school
label.en: back to school
label.vi: khai giảng
image.brief: Dùng lại hình `explore_school`. Từ khoá tìm ảnh (EN): school backpack
image.alt.en: A school bag
image.alt.vi: Chiếc cặp sách

#### item q4_tet
label.en: Tet
label.vi: Tết
image.brief: Dùng lại hình `tray_banh_chung` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): banh chung
image.alt.en: Two square cakes wrapped in leaves
image.alt.vi: Hai chiếc bánh vuông gói lá

#### item q4_holiday
label.en: summer holiday
label.vi: nghỉ hè
image.brief: Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): empty beach blue sea
image.alt.en: A beach by the sea
image.alt.vi: Bãi biển vắng

### q5
id: da5a3170-7742-4467-836b-a92b09f5353a
format: single_choice
version: 1
dok: 2
prompt.en: Flame trees bloom. What time of year?
prompt.vi: Hoa phượng nở. Đó là dịp nào trong năm?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of hot, sunny days.
hint.vi: Em nghĩ tới những ngày nắng nóng nhé.
explanation_correct.en: Yes! Flame trees bloom in the summer holiday.
explanation_correct.vi: Đúng rồi! Hoa phượng nở đúng dịp nghỉ hè.
explanation_wrong.en: The answer is the summer holiday. Flame trees bloom in summer.
explanation_wrong.vi: Đáp án là nghỉ hè. Hoa phượng nở vào mùa hè.
> DOK 2: nối một dấu hiệu mùa (hoa phượng, bài 2) với một mốc trong năm. "Flame trees are red" dạy ở ví dụ hai ô Summer holiday.
> Lựa chọn là dịp: ảnh là dấu hiệu cụ thể, `label` gọi tên dịp. Không ảnh hoa phượng nào trong ba lựa chọn (chữ "Flame trees" đã ở `prompt`). Phản hồi nói về dấu hiệu trên ảnh bé chọn, không nói tên đáp án.

#### option q5_tet
correct: false
feedback.en: Families wrap banh chung for Tet.
feedback.vi: Nhà nhà gói bánh chưng đón Tết.
label.en: Tet
label.vi: Tết
image.brief: Dùng lại hình `tray_banh_chung` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): banh chung
image.alt.en: Two square cakes wrapped in leaves
image.alt.vi: Hai chiếc bánh vuông gói lá

#### option q5_holiday
correct: true
label.en: summer holiday
label.vi: nghỉ hè
image.brief: Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): empty beach blue sea
image.alt.en: A beach by the sea
image.alt.vi: Bãi biển vắng

#### option q5_school
correct: false
feedback.en: A school bag is for the school year.
feedback.vi: Cặp sách dùng cho năm học mới.
label.en: back to school
label.vi: khai giảng
image.brief: Dùng lại hình `explore_school`. Từ khoá tìm ảnh (EN): school backpack
image.alt.en: A school bag
image.alt.vi: Chiếc cặp sách

### q6
id: 7cab3f2c-aa93-4660-8791-3a33fde93191
format: true_false
version: 1
dok: 2
misconception: months_stop_after_december
prompt.en: After December, the months stop.
prompt.vi: Hết tháng Mười Hai là hết tháng.
image.brief: Dùng lại hình `explore_months`. Từ khoá tìm ảnh (EN): wooden beads circle
image.alt.en: Twelve beads in a ring
image.alt.vi: Mười hai hạt tròn xếp thành vòng
answer: false
hint.en: Follow the beads all the way round.
hint.vi: Em lần theo các hạt đi hết một vòng nhé.
explanation_correct.en: After December, January comes again.
explanation_correct.vi: Hết tháng Mười Hai lại đến tháng Một.
explanation_wrong.en: This is false. A new year starts again.
explanation_wrong.vi: Câu này sai. Một năm mới lại bắt đầu.
feedback_true.en: The ring of beads goes round and round.
feedback_true.vi: Vòng hạt nối liền, đi hết vòng lại về chỗ cũ.
> Câu misconception (`months_stop_after_december`), bằng hình, DOK 2: bé còn nghĩ "hết tháng cuối là hết" sẽ chạm Đúng. Câu chỉ kiểm một việc: tháng có quay lại không. Không hỏi tên tháng.
> Hình là vòng mười hai hạt khép kín (đúng vật được nói tới), không đẩy về phía misconception. Gợi ý trỏ tới bằng chứng nhìn thấy (lần theo vòng), không hỏi câu có hay không. Phản hồi tả vòng hạt, không lặp gợi ý.
> `explanation_correct` là đúng câu `correction` ở `_topic.md`, đứng một mình cho thẻ "Ý sai → Ý đúng".
> [CẦN KIỂM] Nguồn quan niệm: trẻ dưới tám tuổi còn khó hiểu thời gian theo vòng (William Friedman), như `_topic.md`.

## Từ vựng

### month
id: 65ef4eed-d927-48ac-ab15-d00c2ce1f123
tier: core
term.en: month
term.vi: tháng
example.en: Twelve months make one year.
example.vi: Mười hai tháng làm thành một năm.
image.brief: Dùng lại hình `explore_months`. Từ khoá tìm ảnh (EN): wooden beads circle
image.alt.en: Twelve beads in a ring
image.alt.vi: Mười hai hạt tròn xếp thành vòng

### year
id: aa514aef-da1e-454c-8ace-5371950c70e8
tier: core
term.en: year
term.vi: năm
example.en: When one year ends, a new one starts.
example.vi: Hết một năm, năm mới lại bắt đầu.
image.brief: Dùng lại hình `explore_seasons` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`.
image.alt.en: Four pictures from one year
image.alt.vi: Bốn hình trong một năm
> Câu ví dụ dạy ý quay vòng của ý chính hai (chuẩn bị câu q6) mà không cần tên tháng.
> Hình gốc là hình ghép (bảng `_topic.md` ghi "ghép, không tìm"), nên brief dùng lại không có dòng từ khoá.

### holiday
id: 5c0ce94f-0197-41a6-a0c3-78c17223780c
tier: extra
term.en: holiday
term.vi: kỳ nghỉ
example.en: Some families go to the beach on holiday.
example.vi: Kỳ nghỉ, có nhà đi chơi biển.
image.brief: Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): empty beach blue sea
image.alt.en: A beach by the sea
image.alt.vi: Bãi biển vắng
> "Some families" · "có nhà": không ngầm cho rằng nhà bé nào cũng đi biển.

### festival
id: b6d5b2c3-0dc6-48ae-872f-ed787f689ffc
tier: extra
term.en: festival
term.vi: ngày hội
example.en: Tet is a big festival.
example.vi: Tết là ngày hội lớn.
image.brief: Dùng lại hình `explore_tet`. Từ khoá tìm ảnh (EN): Ochna integerrima; yellow mai flower branch
image.alt.en: Yellow blossoms on a branch
image.alt.vi: Cành hoa vàng
> `festival` thay `calendar` của đề xuất PM (`_topic.md` mục Lệch, phiên chính đã chấp nhận).

## Thưởng

### banh_chung_card
id: bcd98297-1ccd-4c60-82f2-90d266039a40
set: weather
rarity: common
name.en: Banh chung
name.vi: Bánh chưng
tag.en: Made for Tet
tag.vi: Gói dịp Tết
fact.en: It is wrapped in green dong leaves.
fact.vi: Bánh chưng được gói bằng lá dong xanh.
image.brief: Dùng lại hình `tray_banh_chung` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): banh chung
image.alt.en: Two square cakes wrapped in leaves
image.alt.vi: Hai chiếc bánh vuông gói lá
> Thẻ chốt ở `_topic.md`. Bánh chưng chưa có thẻ trong bộ `set: weather`.
> [CẦN KIỂM] Bánh chưng gói bằng lá dong; giọng EN đọc "banh chung", "dong leaves".

## Ghi chú cho hoạ sĩ

- **Hình tự vẽ (một, PM đã duyệt 17/11):** `explore_months`, mười hai hạt tròn cùng cỡ, cùng màu xâu thành vòng khép kín, nhìn từ trên xuống, nền trơn, vẽ gần thực tế như chuỗi hạt gỗ. Không chữ số, không chữ, không mũi tên, không hạt nào nổi bật (không có hạt "đầu"), không nét viền. Dùng ở ô Twelve months, q2, q6, từ `month`. Hình nằm cạnh các ảnh chụp chỉ ở ô Học (một ô trong bốn) và không bao giờ là một lựa chọn trong cùng câu với ảnh chụp (q2, q6 là câu Đúng/Sai).
- **Ảnh mới (sáu):**
  - `explore_tet`: cành hoa mai vàng *Ochna integerrima*, chụp gần; không lẫn hoa đào, mai chiếu thuỷ; không câu đối, bao lì xì, chữ. Ảnh khó: kiểm loài ở trang gốc.
  - `explore_school`: cặp đeo lưng màu đen treo bên bàn trong lớp học, cạnh một chiếc đỏ; không nhãn hiệu, không hình nhân vật hoạt hình (ảnh thật 18/11).
  - `tray_bucket`: xô và xẻng nhựa trên bãi cát, không người.
  - `tray_swim_ring`: phao bơi tròn xanh lá trong suốt nổi trên mặt nước, không trẻ em, không hình in (ảnh thật 18/11).
  - `tray_toothbrush`: chụp gần đầu bàn chải, thấy nửa cán; không kem, không bao bì (ảnh thật 18/11).
  - `tray_rice_bowl`: bát cơm trắng, không đũa có chữ.
- **Ảnh dùng lại trong chủ đề này** (chờ bài gốc xong; key và `alt` theo bảng Hình dùng chung của `_topic.md`): bài 1 `explore_cold` (q1), `tray_raincoat` (w1); bài 2 `explore_spring` (w2), `explore_summer` (q3), `tray_banh_chung` (hai chiếc bánh chồng nhau; kệ Chơi, q1, q4, q5, thẻ), `explore_seasons` (từ `year`); bài 4 `tray_watering_can` (w1).
- **Ảnh dùng lại từ chủ đề khác:** *Gọi tên và nhóm động vật* bài một `w1` (hàng rào tre: hình câu w1, q1, q3, q4, q5), `w1_lotus` (q3); bài tám `q3` (bãi biển vắng: ô Summer holiday, q4, q5, từ `holiday`).
- **Khung cần kiểm:** q4 ba thẻ vuông cùng kiểu ảnh (bánh chưng, bãi biển, cặp sách); bãi biển là cảnh rộng, hai thẻ kia là đồ vật chụp gần, nên designer xem ba thẻ có cân không. q3 ba hoa phải khác hẳn màu và dáng.
- **Không có:** tờ lịch, chữ số, đồng hồ, cây đào cạnh cây mai, trẻ nhìn rõ mặt.
- **Màu:** Học: Twelve months `gi_dong`, Tet `vang_hoe`, Summer holiday `cham`, Back to school `nau_dat`. Chơi: Tết `vang_hoe`, Nghỉ hè `cham`, Khai giảng `nau_dat`, Ngày nào cũng dùng `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (month, year). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Sai). Quiz `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`months_stop_after_december`). Không có `labels` ở câu `true_false`.
- **Thứ tự đúng q4:** `q4_tet`, `q4_holiday`, `q4_school`. Thẻ trong file không theo thứ tự đúng.
- **Màn Chơi, ví dụ để kiểm:** Bánh chưng, Xô và xẻng, Cặp sách → `balanced`; Hoa mai, Phao bơi, Bát cơm → `has_limited`; Bánh chưng, Hoa mai, Cặp sách → `missing.tray_holiday`; Xô và xẻng, Phao bơi, Cặp sách → `missing.tray_tet`; Hoa mai, Phao bơi, Bàn chải đánh răng → `has_limited`.
- **Khởi động trỏ bài khác:** w1 → `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho`, w2 → `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he` (hai bài này phải có id trước khi chạy `ids` bài 5).
- **Hình dùng lại bài 1 tới 4:** brief trỏ sang bài gốc chỉ hợp lệ khi bài gốc đặt đúng key ở bảng Hình dùng chung (`explore_cold`, `tray_raincoat`, `explore_spring`, `explore_summer`, `tray_banh_chung`, `explore_seasons`, `tray_watering_can`). Phiên chính đối chiếu sau khi bài 1 tới 4 xong.
- **Hình gốc ở bài này:** `explore_months` (hình vẽ, mục `own`, `method: "drawn"`), `explore_tet`, `explore_school`, `tray_bucket`, `tray_swim_ring`, `tray_toothbrush`, `tray_rice_bowl`. Bài 6 không dùng lại hình gốc nào của bài này (w1 bài 6 dùng `tray_banh_chung` của bài 2 và bãi biển của chủ đề số một).
- **Từ EN có thể ngoài Starters/Movers:** month (Movers), festival, holiday, Tet, banh chung, apricot, blossom, peach, flame tree, spade, swim ring, toothbrush, watering can, September và tên các tháng. Nghe thử giọng EN đọc "Tet", "banh chung", "yellow apricot", "dong leaves" và ba câu vè tên tháng; giọng VI đọc "tháng Tư", "tháng Mười Một", "tháng Mười Hai".
- **Grep chữ bé nghe (tự kiểm 17/11):** không có chữ nào trong danh sách cấm ở `_topic.md` Lỗi hay gặp số 17.
