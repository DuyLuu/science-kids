---
id: 27d6d67a-1662-4c49-a55b-af5a44d1eff8
topic: ho-hap
slug: giu-phoi-khoe
order: 4
stage: review
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Keeping lungs healthy
vi: Giữ phổi khoẻ: khói bụi, khói thuốc, khẩu trang
> Giữ đúng tên ở `syllabus-lessons.md` và `content/syllabus.json` (`new-breathing`, bài số bốn). Nghe thử giọng VI đọc dấu hai chấm trong tiêu đề như một chỗ ngắt.

## Mục tiêu
en: I can name ways to keep my lungs healthy.
vi: Em kể được những cách giữ cho phổi khoẻ.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-036, ngày 10/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids` sau ba bài trước.
> Bài tổng kết (`review`): ôn trộn cả chủ đề. Khởi động ôn bài ba, bài hai (câu "Em nghĩ sao?" về `air_goes_to_belly`) và bài *Núi lửa* của chủ đề một; Quiz q2 ôn bài một (ô-xi), q5 ôn bài hai (đường đi của không khí), q4 nối với bài ba (chạy nhảy hít vào nhiều không khí hơn, nên chọn chỗ không khí sạch).
> Bài sửa `clear_air_is_clean` ở ý chính ba, ô Bụi mịn, câu q4 và câu q6 (gắn key, Na chưa đúng). `smoke_only_hurts_smoker` chỉ nói nhẹ ở ô Khói và một món bẫy ở phần Chơi, không gắn key, không có câu hỏi riêng (mục An toàn ở `_topic.md`).
> 14/11 (SK-044, ngân sách chữ Discoverer A2): thêm `feedback` cho mọi lựa chọn sai và `feedback_true/false`; hai lời giải thích còn một câu, bỏ "Yes!" · "Đúng rồi!" và "The answer is…" · "Đáp án là…"; câu hỏi tối đa mười chữ VI, lời Na và câu ô Học một câu tối đa mười hai chữ. Nháp AI.

## Ý chính
1.en: Dust and smoke in the air can hurt your lungs.
1.vi: Bụi và khói trong không khí có thể làm hại phổi.
2.en: A mask helps stop dust going into your nose.
2.vi: Khẩu trang giúp ngăn bụi đi vào mũi.
> [CẦN KIỂM] Khẩu trang giúp ngăn một phần bụi; khẩu trang vải ngăn bụi mịn kém hơn (biên tập nhớ). Chữ cho trẻ nói "giúp ngăn bụi", không nói "chặn hết bụi".
3.en: Some dust is too tiny to see.
3.vi: Có loại bụi nhỏ tới mức mắt không nhìn thấy.
> [CẦN KIỂM] như `clear_air_is_clean` ở `_topic.md`.
> Ba ý đi từ thứ nhìn thấy được (bụi, khói), tới việc bé tự làm được (đeo khẩu trang), tới thứ không nhìn thấy (bụi mịn).

## Khởi động

> Ba câu, đúng bảng Khởi động ở `_topic.md`. Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.
> - w1 ôn bài ba (khoảng một ngày trước), bốn lựa chọn.
> - w2 ôn bài hai (khoảng hai bài trước): đây là câu "Em nghĩ sao?" đề xuất cho bài một (Ghi chú cho dev bài một), hỏi lại dạng `true_false` (đáp án Sai) để bé tự so. Không gắn key: luật chỉ đếm câu misconception ở Quiz.
> - w3 ôn bài *Núi lửa* của chủ đề một (khoảng một tháng trước): tro núi lửa nối sang ý "bụi trong không khí". Gợi ý đủ để bé chưa học chủ đề một vẫn làm được.

### w1
id: cfacd56e-aa7d-4c76-8dcb-9f197f2ff32f
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: ho-hap/tho-khi-chay-nhay
prompt.en: Which one makes you breathe fastest?
prompt.vi: Việc nào làm em thở nhanh nhất?
image.brief: Dùng lại hình `q1` ở bài `ho-hap/tho-khi-chay-nhay`. Từ khoá tìm ảnh (EN): empty schoolyard Vietnam trees
image.alt.en: An empty schoolyard
image.alt.vi: Sân trường vắng
hint.en: Remember the bar chart in the last lesson.
hint.vi: Em nhớ lại biểu đồ cột ở bài trước nhé.
explanation_correct.en: Skipping had the tallest bar in Mai's chart.
explanation_correct.vi: Nhảy dây có cột cao nhất trong biểu đồ của Mai.
explanation_wrong.en: Skipping works your leg muscles the hardest.
explanation_wrong.vi: Nhảy dây làm cơ bắp ở chân làm việc nhiều nhất.
> Đi bộ là lựa chọn sai có sức hút (cũng là vận động, cũng có trong biểu đồ câu q4 bài ba). Đáp án ở chỗ thứ tư; câu w1 của bốn bài ở bốn chỗ khác nhau.

#### option w1_walking
correct: false
feedback.en: Walking moves your legs, but gently.
feedback.vi: Đi bộ có vận động, nhưng nhẹ nhàng.
label.en: walking
label.vi: đi bộ
image.brief: [hình vẽ] Một lối đi lát gạch vắng trong công viên, hai bên có cây xanh, nhìn dọc theo lối đi; không có người, không có chữ, không có biển chỉ dẫn. Từ khoá tìm ảnh (EN): empty park footpath trees
image.alt.en: A path in a park
image.alt.vi: Lối đi trong công viên

#### option w1_chess
correct: false
feedback.en: In chess, your body sits still at the table.
feedback.vi: Chơi cờ thì người em ngồi yên bên bàn.
label.en: playing chess
label.vi: chơi cờ vua
image.brief: Dùng lại hình `q3_chess` ở bài `ho-hap/tho-khi-chay-nhay`. Từ khoá tìm ảnh (EN): chess board game in progress wooden table
image.alt.en: A chess board
image.alt.vi: Bàn cờ vua

#### option w1_hammock
correct: false
feedback.en: In a hammock, your body rests.
feedback.vi: Nằm võng là lúc cơ thể em nghỉ.
label.en: lying in a hammock
label.vi: nằm võng
image.brief: Dùng lại hình `q3_hammock` ở bài `ho-hap/tho-khi-chay-nhay`. Từ khoá tìm ảnh (EN): empty hammock between trees garden
image.alt.en: A hammock between two trees
image.alt.vi: Cái võng mắc giữa hai cây

#### option w1_skipping
correct: true
label.en: skipping
label.vi: nhảy dây
image.brief: Dùng lại hình `tray_rope` ở bài `ho-hap/tho-khi-chay-nhay`. Từ khoá tìm ảnh (EN): skipping rope wooden handles ground
image.alt.en: A skipping rope
image.alt.vi: Sợi dây nhảy

### w2
id: cfd71442-6015-459d-a599-b1513fff833b
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: ho-hap/duong-di-cua-khong-khi
prompt.en: When we breathe in, the air goes into our belly.
prompt.vi: Khi mình hít vào, không khí đi vào bụng.
image.brief: Dùng lại hình `q6` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A child lying down with a teddy on the belly
image.alt.vi: Bạn nhỏ nằm ngửa, gấu bông trên bụng
answer: false
hint.en: Remember the Food and air card.
hint.vi: Em nhớ lại ô Thức ăn và không khí nhé.
explanation_correct.en: Your belly moves, but the air goes into your lungs.
explanation_correct.vi: Bụng em nhấp nhô, còn không khí đi vào phổi.
explanation_wrong.en: The air goes down your windpipe into your lungs.
explanation_wrong.vi: Không khí đi xuống khí quản, vào phổi.
feedback_true.en: Food goes to your belly, but air takes another path.
feedback_true.vi: Thức ăn xuống bụng, còn không khí đi đường khác.
> Câu giữ đúng chữ `statement` của `air_goes_to_belly`, cũng là câu "Em nghĩ sao?" đề xuất ở bài một. Khi schema có `think_first` (v1.1), app hiện được câu trả lời ở bài một cạnh câu trả lời ở câu này.
> Hình gấu bông trên bụng là hình câu q6 bài hai, cho thấy bụng nhấp nhô (vế đúng của misconception), không cho thấy không khí đi đâu.
> Giải thích khi đúng không mở đầu bằng "Yes!" (đáp án Sai).

### w3
id: 2a87a42d-847c-498e-a246-f1d4b81e2f5c
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/nui-lua
prompt.en: Volcanoes can throw ash high into the sky.
prompt.vi: Núi lửa có thể phun tro lên trời cao.
image.brief: Dùng lại hình `q1` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): volcano cone quiet landscape
image.alt.en: A quiet volcano
image.alt.vi: Núi lửa đang yên lặng
answer: true
hint.en: Remember the volcano lesson about Earth.
hint.vi: Em nhớ lại bài Núi lửa nhé.
explanation_correct.en: Ash is like dust, and it is bad to breathe.
explanation_correct.vi: Tro giống như bụi, hít phải tro thì có hại.
explanation_wrong.en: Volcano ash is made of tiny bits of rock.
explanation_wrong.vi: Tro núi lửa là những mảnh đá rất nhỏ.
feedback_false.en: When a volcano wakes up, ash fills the sky.
feedback_false.vi: Khi núi lửa phun, tro bay đầy trời.
> Ôn món ví dụ "ash · tro núi lửa" ở ô Học và lựa chọn `q4_ash` của bài *Núi lửa*. Hình là núi lửa đang yên lặng (không có cột tro), không lộ đáp án.
> [CẦN KIỂM] "Tro núi lửa giống như bụi, hít phải có hại": tro núi lửa là những mảnh đá, thuỷ tinh rất nhỏ (biên tập nhớ). Giải thích khi đúng bắc cầu sang bài này.

## Học

> Bốn ô, từ thứ nhìn thấy được tới thứ không nhìn thấy:
> - Bụi (ý chính một): đường đông xe, công trường, ngày hanh khô;
> - Khói (ý chính một): đốt rơm rạ, bếp than tổ ong, khói thuốc lá ở gần; tránh ra chỗ thoáng;
> - Khẩu trang (ý chính hai): khi ngồi sau xe máy, che kín mũi và miệng;
> - Bụi mịn (ý chính ba): nhỏ hơn sợi tóc rất nhiều, trời trông trong vẫn có thể có (`clear_air_is_clean`).
>
> Ví dụ gắn với Việt Nam (xe máy, rơm rạ, bếp than) nhưng không gọi tên thành phố, không chê ai. Khói thuốc lá chỉ là một ví dụ, lời khuyên là việc bé tự làm được: tránh ra chỗ thoáng.

### explore
id: 96cfb575-bbf4-495a-9f3f-77552c1f0968
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_dust
label.en: Dust
label.vi: Bụi
color: nau_dat
sentence.en: Dust comes from busy roads and building work.
sentence.vi: Bụi bay lên từ đường đông xe và từ chỗ xây nhà.
image.brief: [hình vẽ] Một con đường đất đỏ bụi mù sau khi một chiếc xe tải chạy qua, nhìn từ xa; xe nhỏ ở xa, không có biển số, không thấy mặt người, không có biển hiệu, không có chữ. Câu q1, câu q5, thẻ q2_dust và từ dust dùng lại ảnh này. Từ khoá tìm ảnh (EN): dusty road truck dust cloud
image.alt.en: A dusty road
image.alt.vi: Con đường bụi mù
examples.1.en: motorbikes and cars
examples.1.vi: xe máy và ô tô
examples.2.en: building work
examples.2.vi: công trường xây dựng
examples.3.en: dry, windy days
examples.3.vi: những ngày hanh khô, nhiều gió
examples.4.en: sweeping a dry floor
examples.4.vi: quét nhà khô làm bụi bay lên
> Ví dụ bốn chuẩn bị món "Lau bụi bằng khăn ẩm" ở phần Chơi [CẦN KIỂM: lau ẩm làm ít bụi bay hơn quét khô].

#### group explore_smoke
label.en: Smoke
label.vi: Khói
color: do_son
sentence.en: Smoke from fires and cigarettes is bad for lungs.
sentence.vi: Khói lửa và khói thuốc lá đều hại cho phổi.
image.brief: [hình vẽ] Khói trắng xám bốc lên từ những đống rơm rạ đang đốt trên cánh đồng sau mùa gặt, nhìn từ xa; không có người, không có nhà gần, không có chữ; khói không dày đặc như cháy lớn, không có cảnh đáng sợ. Món Chơi tray_straw, thẻ q2_smoke và từ smoke dùng lại ảnh này. Từ khoá tìm ảnh (EN): burning rice straw field smoke
image.alt.en: Smoke from burning straw in a field
image.alt.vi: Khói đốt rơm rạ trên cánh đồng
examples.1.en: burning straw or rubbish
examples.1.vi: đốt rơm rạ, đốt rác
examples.2.en: a smoky coal stove
examples.2.vi: bếp than tổ ong nhiều khói
examples.3.en: cigarette smoke nearby
examples.3.vi: khói thuốc lá ở gần em
examples.4.en: move away to fresh air
examples.4.vi: em tránh ra chỗ thoáng
> [CẦN KIỂM] Khói đốt rơm rạ, khói bếp than tổ ong và khói thuốc lá thụ động có hại cho đường hô hấp (biên tập nhớ khuyến cáo của Bộ Y tế, chưa tra nguồn). Không nói tác hại cụ thể, không nói bệnh.
> Ví dụ ba và bốn là chỗ duy nhất của bài nói về khói thuốc lá ngoài món bẫy ở phần Chơi (`smoke_only_hurts_smoker`, không gắn key). Câu không nói ai hút thuốc, không bảo bé nhắc người lớn bỏ thuốc.

#### group explore_mask
label.en: Mask
label.vi: Khẩu trang
color: cham
sentence.en: A mask helps stop dust going into your nose.
sentence.vi: Khẩu trang giúp ngăn bụi đi vào mũi em.
image.brief: [hình vẽ] Một chiếc khẩu trang vải màu trơn đặt trên mặt bàn gỗ, dây đeo thả hai bên, vẽ từ trên xuống; không có người, không có nhãn hiệu, không có chữ, không có hình in. Món Chơi tray_mask, lựa chọn q1_mask và từ mask dùng lại ảnh này. Từ khoá tìm ảnh (EN): cloth face mask on table
image.alt.en: A cloth mask on a table
image.alt.vi: Chiếc khẩu trang vải trên bàn
examples.1.en: on dusty roads
examples.1.vi: khi đi đường nhiều bụi
examples.2.en: on the back of a motorbike
examples.2.vi: khi ngồi sau xe máy
examples.3.en: cover your nose and mouth
examples.3.vi: che kín cả mũi và miệng
examples.4.en: wash it, or use a new one
examples.4.vi: giặt sạch hoặc thay cái mới
> [CẦN KIỂM] Ví dụ bốn: khẩu trang vải giặt dùng lại; khẩu trang y tế dùng một lần. Bài không so loại khẩu trang, không nói khẩu trang chống bệnh. Hình không có người đeo, để không có mặt người.

#### group explore_tiny_dust
label.en: Tiny dust
label.vi: Bụi mịn
color: vang_hoe
sentence.en: Some dust is too tiny to see.
sentence.vi: Có loại bụi nhỏ tới mức mắt không nhìn thấy.
image.brief: [ảnh] Một thành phố nhìn từ trên cao vào ngày trời mù bụi: toà nhà ở xa mờ đục trong lớp không khí xám, mặt trời nhạt; không đọc được biển hiệu, quảng cáo hay chữ nào, không thấy người. Ưu tiên ảnh một thành phố Việt Nam nếu có ảnh hợp giấy phép; nếu không, bất kỳ thành phố nào, miễn không có chữ. Câu q4 dùng lại ảnh này. Từ khoá tìm ảnh (EN): city haze smog skyline Hanoi
image.alt.en: A hazy city
image.alt.vi: Thành phố mù bụi
examples.1.en: much smaller than a hair
examples.1.vi: nhỏ hơn sợi tóc rất nhiều
examples.2.en: lots of it makes the sky hazy
examples.2.vi: nhiều bụi mịn làm trời mờ đục
examples.3.en: clear air can still have some
examples.3.vi: trời trông trong vẫn có thể có bụi mịn
examples.4.en: grown-ups can check it on a phone
examples.4.vi: người lớn xem được chỉ số bụi trên điện thoại
> [CẦN KIỂM] như `clear_air_is_clean`. Ví dụ bốn: ứng dụng chất lượng không khí trên điện thoại; bài không nói tên ứng dụng, không bảo bé tự xem.
> Ô sửa `clear_air_is_clean`; ví dụ ba là ý câu q6 kiểm.

### new_words
id: 8be29f4d-3ef3-4391-a174-e44b020c23be
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: dust, smoke, mask

## Chơi

> Bé chọn ba cách giữ phổi khoẻ: một cách tránh bụi, một nơi không khí trong lành, một cách vận động. Đạt khi đủ ba nhóm và không chọn thứ nào tạo ra khói. Chạm hình đã chọn để bỏ ra.
> Trò chơi gom cả chủ đề: tránh bụi (ô Bụi, ô Khẩu trang bài này; lông mũi ở bài hai), không khí trong lành, vận động (bài ba). Ba món bẫy đều tạo ra khói (ô Khói), nên một lời nhắn `has_limited` nói đúng lý do cho cả ba.
> Món "Khói thuốc lá" là hình điếu thuốc trên gạt tàn, không có người, không có tay (Quy ước hình ở `_topic.md`, mục bốn). Duy có thể thay bằng "Đốt rác" (mục Còn mở ở `_topic.md`).

### tray
id: 4c9985b2-460f-4a29-aebe-1b93063b7d31
type: build_tray
version: 1
prompt.en: Pick three ways to keep your lungs healthy
prompt.vi: Chọn ba cách giữ cho phổi khoẻ
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Keep dust away, find fresh air, and move your body.
messages.start.vi: Em tránh bụi, tìm không khí trong lành và vận động nhé.
> Rà chữ tester 10/11 (n5): VI cũ "Em chọn một cách tránh bụi, …" lệch kiểu với EN (ba mệnh lệnh). VI mới theo EN, như đề xuất của tester.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Your lungs will thank you.
messages.balanced.vi: Tuyệt! Phổi của em sẽ cảm ơn em đấy.
messages.has_limited.en: That one makes smoke. Smoke is bad for lungs.
messages.has_limited.vi: Thứ này tạo ra khói. Khói có hại cho phổi.
messages.missing.tray_dust_away.en: You still need a way to keep dust away.
messages.missing.tray_dust_away.vi: Em còn thiếu một cách tránh bụi.
messages.missing.tray_fresh.en: You still need a place with fresh air.
messages.missing.tray_fresh.vi: Em còn thiếu một nơi không khí trong lành.
messages.missing.tray_move.en: You still need a way to move.
messages.missing.tray_move.vi: Em còn thiếu một cách vận động.

#### group tray_dust_away
label.en: Keep dust away
label.vi: Tránh bụi
color: cham
role: required

#### group tray_fresh
label.en: Fresh air
label.vi: Không khí trong lành
color: gi_dong
role: required

#### group tray_move
label.en: Move and play
label.vi: Vận động
color: vang_hoe
role: required

#### group tray_smoke
label.en: Not good for lungs
label.vi: Không tốt cho phổi
color: do_son
role: limit
> Nhãn `limit` dạng "Not …" · "Không …", gọi tên loại, không gọi tên món bẫy. Dòng điều kiện sẽ là "Cần đủ Tránh bụi, Không khí trong lành, Vận động · Không tốt cho phổi".

#### item tray_mask
label.en: Wear a mask
label.vi: Đeo khẩu trang
group: tray_dust_away
image.brief: Dùng lại hình `explore_mask`. Từ khoá tìm ảnh (EN): cloth face mask on table
image.alt.en: A cloth mask on a table
image.alt.vi: Chiếc khẩu trang vải trên bàn

#### item tray_straw
label.en: Straw smoke
label.vi: Khói rơm rạ
group: tray_smoke
image.brief: Dùng lại hình `explore_smoke`. Từ khoá tìm ảnh (EN): burning rice straw field smoke
image.alt.en: Smoke from burning straw in a field
image.alt.vi: Khói đốt rơm rạ trên cánh đồng
> Rà chữ tester 10/11 (n6): nhãn cũ "Burning straw" · "Đốt rơm rạ" là một việc, đứng cạnh hai món là vật ("Cigarette smoke", "Smoky coal stove"). Đổi sang "Straw smoke" · "Khói rơm rạ", cùng kiểu với "Cigarette smoke" · "Khói thuốc lá". Món "Bếp than tổ ong" giữ nguyên chữ cho tới khi Duy trả lời về hai món bẫy (main session 10/11); khi đó đề xuất đổi thành "Coal stove smoke" · "Khói bếp than", để ba nhãn cùng dạng "khói …". Hình không đổi.

#### item tray_park
label.en: Green park
label.vi: Công viên nhiều cây
group: tray_fresh
image.brief: [hình vẽ] Một công viên nhiều cây xanh lớn, bãi cỏ rộng, buổi sáng trời trong, nhìn rộng, xa đường lớn; không có người, không có biển chữ, không có quảng cáo. Câu q3 và câu q4 dùng lại ảnh này, và từ fresh air. Từ khoá tìm ảnh (EN): green park big trees lawn morning
image.alt.en: A green park with big trees
image.alt.vi: Công viên nhiều cây xanh

#### item tray_rope
label.en: Skipping
label.vi: Nhảy dây
group: tray_move
image.brief: Dùng lại hình `tray_rope` ở bài `ho-hap/tho-khi-chay-nhay`. Từ khoá tìm ảnh (EN): skipping rope wooden handles ground
image.alt.en: A skipping rope
image.alt.vi: Sợi dây nhảy

#### item tray_cigarette
label.en: Cigarette smoke
label.vi: Khói thuốc lá
group: tray_smoke
image.brief: [hình vẽ] Một điếu thuốc lá đang cháy dở gác trên chiếc gạt tàn bằng thuỷ tinh, một làn khói mỏng bốc lên, vẽ gần, nền tối trơn; không có người, không có tay, không có bao thuốc, không có nhãn hiệu, không có chữ trên điếu thuốc. Từ khoá tìm ảnh (EN): cigarette ashtray smoke dark background
image.alt.en: A cigarette smoking in an ashtray
image.alt.vi: Điếu thuốc lá bốc khói trên gạt tàn
> Hình duy nhất về thuốc lá của chủ đề. Không chọn ảnh có người hút, có tay cầm, có bao thuốc.

#### item tray_cloth
label.en: Wipe with a wet cloth
label.vi: Lau bụi bằng khăn ẩm
group: tray_dust_away
image.brief: [hình vẽ] Một bàn tay cầm khăn ẩm lau mặt bàn gỗ, chỉ thấy bàn tay và khăn, vẽ gần; không thấy mặt, không có nhãn hiệu, không có chữ. Từ khoá tìm ảnh (EN): hand wiping table damp cloth
image.alt.en: A hand wiping a table with a wet cloth
image.alt.vi: Bàn tay lau bàn bằng khăn ẩm
> [CẦN KIỂM] Lau ẩm làm ít bụi bay lên hơn quét khô (ví dụ bốn ô Bụi).

#### item tray_rice
label.en: Rice fields
label.vi: Cánh đồng lúa
group: tray_fresh
image.brief: [hình vẽ] Ruộng lúa xanh rộng dưới trời có mây, nhìn rộng, lúa đang xanh (không phải mùa gặt); không có người, không có khói, không có chữ; cùng nét với tám món kia của kệ.
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh
> Ruộng lúa đang xanh (không phải mùa gặt), khác cảnh đốt rơm rạ của món bẫy.
> Theo hình designer làm (SK-036, designer 10/11): kệ Chơi bài này cả chín món là hình vẽ, nên món này vẽ riêng, không dùng lại ảnh `q2_rice` của chủ đề *Khủng long* (nếu dùng ảnh sẽ là ảnh chụp duy nhất trên kệ).

#### item tray_ball
label.en: Football
label.vi: Đá bóng
group: tray_move
image.brief: Dùng lại hình `tray_ball` ở bài `ho-hap/tho-khi-chay-nhay`. Từ khoá tìm ảnh (EN): football on grass close up
image.alt.en: A football on the grass
image.alt.vi: Quả bóng trên sân cỏ

#### item tray_coal
label.en: Smoky coal stove
label.vi: Bếp than tổ ong
group: tray_smoke
image.brief: [hình vẽ] Một chiếc bếp than tổ ong đặt trên nền xi măng, viên than tổ ong đang cháy, khói xám bốc lên, vẽ gần; không có người, không có tay, không có chữ, không có nồi có nhãn hiệu. Từ khoá tìm ảnh (EN): honeycomb briquette coal stove smoke
image.alt.en: A coal stove with smoke
image.alt.vi: Bếp than tổ ong bốc khói
> [CẦN KIỂM] Khói bếp than tổ ong có hại khi đun trong nhà kín. Nhiều gia đình còn dùng; Duy có thể thay bằng "Đốt rác" (mục Còn mở ở `_topic.md`).

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q4), `fill_blank_bank` (q2, q5), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình.
> Ôn trộn: q2 ôn bài một (ô-xi), q4 nối bài ba với bài này, q5 ôn bài hai.

### q1
id: b72d4dc5-3cc1-4c19-af22-7a042493c89a
format: single_choice
version: 1
dok: 1
prompt.en: Which one keeps dust out of your nose?
prompt.vi: Thứ nào giúp ngăn bụi vào mũi em?
image.brief: Dùng lại hình `explore_dust`. Từ khoá tìm ảnh (EN): dusty road truck dust cloud
image.alt.en: A dusty road
image.alt.vi: Con đường bụi mù
hint.en: Think about how dust gets into your body.
hint.vi: Em nghĩ xem bụi đi vào cơ thể qua đâu nhé.
explanation_correct.en: A mask covers both your nose and your mouth.
explanation_correct.vi: Khẩu trang che kín cả mũi lẫn miệng.
explanation_wrong.en: A mask helps stop dust going into your nose.
explanation_wrong.vi: Khẩu trang giúp ngăn bụi đi vào mũi.
> Câu nhớ lại ý chính hai. Ba thứ đều là đồ người Việt Nam hay mang khi đi xe máy (mũ vải, áo mưa, khẩu trang), nên hai lựa chọn sai có sức hút. Không dùng mũ bảo hiểm (bài bốn của *Não bộ và giác quan* dạy mũ bảo hiểm).
> Gợi ý nêu cách nghĩ (bụi vào qua đâu, tức là mũi), không gọi tên lựa chọn.
> Rà chữ tester 10/11 (n1): khẩu trang chuyển xuống chỗ thứ ba (trước đây thứ hai). Chỉ đổi thứ tự khối, không đổi chữ hay hình.

#### option q1_hat
correct: false
feedback.en: A sun hat shades your head from the sun.
feedback.vi: Mũ vải che nắng cho đầu em.
label.en: sun hat
label.vi: mũ vải
image.brief: [hình vẽ] Một chiếc mũ vải rộng vành màu trơn đặt trên mặt bàn gỗ, vẽ chéo từ trên xuống; không có người, không có nhãn hiệu, không có chữ. Cùng nền bàn gỗ như hình khẩu trang. Từ khoá tìm ảnh (EN): cloth sun hat on table
image.alt.en: A sun hat on a table
image.alt.vi: Chiếc mũ vải trên bàn

#### option q1_raincoat
correct: false
feedback.en: A raincoat keeps rain off your body.
feedback.vi: Áo mưa che mưa cho người em.
label.en: raincoat
label.vi: áo mưa
image.brief: [hình vẽ] Một chiếc áo mưa ni-lông màu trơn gấp gọn trên mặt bàn gỗ, vẽ chéo từ trên xuống; không có người, không có nhãn hiệu, không có chữ. Từ khoá tìm ảnh (EN): folded plastic raincoat on table
image.alt.en: A raincoat on a table
image.alt.vi: Chiếc áo mưa trên bàn

#### option q1_mask
correct: true
label.en: mask
label.vi: khẩu trang
image.brief: Dùng lại hình `explore_mask`. Từ khoá tìm ảnh (EN): cloth face mask on table
image.alt.en: A cloth mask on a table
image.alt.vi: Chiếc khẩu trang vải trên bàn
> Ba ảnh cùng kiểu: một vật trên mặt bàn gỗ, chụp từ trên xuống.

### q2
id: be21d1bc-e6eb-4b21-a369-5e4bace511e4
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: [ảnh] Bầu trời xanh có mây trắng trên những ngọn cây, chụp từ dưới lên; không có người, không có chữ. Câu q3 dùng lại ảnh này. Từ khoá tìm ảnh (EN): blue sky white clouds tree tops
image.alt.en: Blue sky over the trees
image.alt.vi: Bầu trời xanh trên ngọn cây
sentence.en: Our body needs {1} from the air.
sentence.vi: Cơ thể mình cần {1} từ không khí.
answers: q2_oxygen
hint.en: Remember the first lesson, Why we breathe.
hint.vi: Em nhớ lại bài đầu tiên, Vì sao ta phải thở.
explanation_correct.en: Every breath brings oxygen to your whole body.
explanation_correct.vi: Mỗi hơi thở đưa ô-xi tới khắp cơ thể.
explanation_wrong.en: Your body needs oxygen, while dust and smoke hurt lungs.
explanation_wrong.vi: Cơ thể cần ô-xi, còn bụi và khói làm hại phổi.
> Câu ôn ý chính ba bài một, đặt trong bối cảnh bài này: bụi và khói cũng ở trong không khí, nên có sức hút ("cũng từ không khí"), nhưng cơ thể không cần.

#### bank q2_dust
label.en: dust
label.vi: bụi
feedback.en: Dust in the air can hurt your lungs.
feedback.vi: Bụi trong không khí làm hại phổi.
image.brief: Dùng lại hình `explore_dust`. Từ khoá tìm ảnh (EN): dusty road truck dust cloud
image.alt.en: A dusty road
image.alt.vi: Con đường bụi mù

#### bank q2_smoke
label.en: smoke
label.vi: khói
feedback.en: Smoke is bad for your lungs.
feedback.vi: Khói có hại cho phổi em.
image.brief: Dùng lại hình `explore_smoke`. Từ khoá tìm ảnh (EN): burning rice straw field smoke
image.alt.en: Smoke from burning straw in a field
image.alt.vi: Khói đốt rơm rạ trên cánh đồng

#### bank q2_oxygen
label.en: oxygen
label.vi: khí ô-xi
image.brief: Dùng lại hình `oxygen` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): aquarium air stone bubbles fish
image.alt.en: Bubbles from an air pump in a fish tank
image.alt.vi: Bọt khí từ máy sục khí trong bể cá
> Rà chữ tester 10/11 (n14): trước dùng lại ảnh thợ lặn mang bình khí (bình chứa không khí nén, không phải ô-xi); nay dùng lại ảnh bể cá có máy sục khí của từ `oxygen` bài một. Ba thẻ vẫn cùng là ảnh chụp.

### q3
id: f4b064fb-8ed6-4e08-b520-7945d3ef7908
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones put dust or smoke into the air?
prompt.vi: Thứ nào làm bụi, khói bay vào không khí?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `q2`. Từ khoá tìm ảnh (EN): blue sky white clouds tree tops
image.alt.en: Blue sky over the trees
image.alt.vi: Bầu trời xanh trên ngọn cây
hint.en: Which ones make something you should not breathe?
hint.vi: Thứ nào tạo ra thứ mà em không nên hít vào?
explanation_correct.en: Cars and digging both throw dust up into the air.
explanation_correct.vi: Xe cộ và việc đào đất đều làm bụi bay lên.
explanation_wrong.en: Roads and building sites put dust into the air.
explanation_wrong.vi: Đường đông xe và công trường làm bụi bay lên.
> DOK 2: phân loại nơi tạo ra bụi, khói, ở những cảnh chưa có ở phần Học (ô Bụi chỉ có đường đất đỏ). Hơi nồi cơm có sức hút vì trông như khói trắng; công viên có sức hút ngược (bé biết công viên là chỗ tốt, nên kiểm lại cách nghĩ).
> [CẦN KIỂM] Hơi bốc lên từ nồi cơm là hơi nước, không hại phổi. Ý này nối với *Các thể của vật chất* (Discoverer số mười ba, "hơi nồi cơm").

#### option q3_steam
correct: false
feedback.en: Steam from rice is just water, like tiny clouds.
feedback.vi: Hơi nồi cơm chỉ là hơi nước thôi.
label.en: steam from rice
label.vi: hơi nồi cơm
image.brief: [hình vẽ] Góc bếp trong nhà nhìn rộng: một nồi cơm đang sôi trên bếp, làn hơi nước trắng bốc cao từ khe vung, thấy cả mặt bếp và bức tường phía sau. Bắt buộc vẽ rộng cả góc bếp, cùng cỡ cảnh với ba hình kia (đường phố, công viên, công trường); không vẽ cận nồi. Không có người, không có nhãn hiệu trên nồi, không có chữ, không phải nồi cơm điện có logo. Từ khoá tìm ảnh (EN): kitchen stove pot steam rising
image.alt.en: Steam rising from a pot of rice
image.alt.vi: Hơi bốc lên từ nồi cơm
> Rà chữ tester 10/11 (n10): ảnh cận nồi cơm lệch cỡ cảnh với ba lựa chọn kia, nên món bẫy dễ bị loại bằng kiểu ảnh. Brief nay ghi chụp rộng là yêu cầu bắt buộc; từ khoá đổi theo.

#### option q3_road
correct: true
label.en: busy road
label.vi: đường đông xe
image.brief: [hình vẽ] Một con đường đông xe máy và ô tô ở thành phố Việt Nam, nhìn từ trên cao (cầu vượt hay toà nhà) xuống, xe nhỏ; không có biển số, không vẽ nét mặt người, không có biển hiệu, quảng cáo hay chữ. Cả bốn lựa chọn của câu là hình vẽ. Câu q4 dùng lại ảnh này. Từ khoá tìm ảnh (EN): busy road motorbikes aerial view Vietnam
image.alt.en: A busy road seen from above
image.alt.vi: Con đường đông xe nhìn từ trên cao

#### option q3_park
correct: false
feedback.en: Trees in a park help keep the air fresh.
feedback.vi: Cây trong công viên giúp không khí trong lành.
label.en: green park
label.vi: công viên nhiều cây
image.brief: Dùng lại hình `tray_park`. Từ khoá tìm ảnh (EN): green park big trees lawn morning
image.alt.en: A green park with big trees
image.alt.vi: Công viên nhiều cây xanh

#### option q3_building
correct: true
label.en: building site
label.vi: công trường
image.brief: [hình vẽ] Một công trường xây dựng nhìn từ xa, có cần cẩu, đống cát và lớp bụi mờ; không có người, không có biển tên công ty, logo hay chữ. Từ khoá tìm ảnh (EN): construction site dust crane distance
image.alt.en: A building site with dust
image.alt.vi: Công trường xây dựng có bụi

### q4
id: 45431ccf-b994-43e4-b619-a7468aee53e7
format: single_choice
version: 1
dok: 2
prompt.en: Where should Nam play on a smoky day?
prompt.vi: Hôm nhiều khói bụi, Nam nên chơi ở đâu?
image.brief: Dùng lại hình `explore_tiny_dust`. Từ khoá tìm ảnh (EN): city haze smog skyline Hanoi
image.alt.en: A hazy city
image.alt.vi: Thành phố mù bụi
hint.en: Where is the air cleanest on a smoky day?
hint.vi: Hôm nhiều khói bụi, chỗ nào không khí sạch nhất?
explanation_correct.en: Closed windows help keep smoky air out.
explanation_correct.vi: Đóng cửa sổ giúp ngăn bớt khói bụi vào nhà.
explanation_wrong.en: On smoky days, playing inside keeps your lungs safer.
explanation_wrong.vi: Hôm khói bụi, chơi trong nhà giúp phổi an toàn hơn.
> DOK 2: áp dụng vào một ngày cụ thể. Công viên là lựa chọn sai có sức hút mạnh: bài ba và phần Chơi bài này đều khen chạy nhảy ngoài trời, công viên nhiều cây. Bé phải nghĩ theo tình huống: hôm nay không khí ngoài trời nhiều khói bụi. Nối với bài ba: chạy nhảy thì hít vào nhiều không khí hơn.
> [CẦN KIỂM] Khuyến cáo chung khi chất lượng không khí xấu: hạn chế ra ngoài, đóng cửa sổ (mục An toàn ở `_topic.md`). Câu không bảo bé tự quyết, chỉ hỏi chỗ chơi.

#### option q4_inside
correct: true
label.en: inside the house
label.vi: trong nhà
image.brief: [hình vẽ] Mấy khối đồ chơi xếp hình bằng gỗ trên sàn nhà, phía sau là cửa sổ đang đóng, ngoài cửa trời xám; không có người, không có nhãn hiệu đồ chơi, không có chữ trên khối gỗ. Từ khoá tìm ảnh (EN): wooden toy blocks floor closed window
image.alt.en: Toy blocks inside, by a closed window
image.alt.vi: Khối đồ chơi trong nhà, cạnh cửa sổ đóng

#### option q4_park
correct: false
feedback.en: Today, the smoky air reaches the park too.
feedback.vi: Hôm nay khói bụi bay cả vào công viên.
label.en: in the park
label.vi: ở công viên
image.brief: Dùng lại hình `tray_park`. Từ khoá tìm ảnh (EN): green park big trees lawn morning
image.alt.en: A green park with big trees
image.alt.vi: Công viên nhiều cây xanh

#### option q4_road
correct: false
feedback.en: Cars by the road add even more dust.
feedback.vi: Xe cộ bên đường còn làm thêm bụi.
label.en: by the road
label.vi: bên đường
image.brief: Dùng lại hình `q3_road`. Từ khoá tìm ảnh (EN): busy road motorbikes aerial view Vietnam
image.alt.en: A busy road seen from above
image.alt.vi: Con đường đông xe nhìn từ trên cao

### q5
id: cbfc5d1b-857c-4fef-a6a3-d3db2cb51c11
format: fill_blank_bank
version: 1
dok: 2
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `explore_dust`. Từ khoá tìm ảnh (EN): dusty road truck dust cloud
image.alt.en: A dusty road
image.alt.vi: Con đường bụi mù
sentence.en: Tiny dust can go down your {1} into your lungs.
sentence.vi: Bụi mịn có thể đi xuống {1}, vào tới phổi.
answers: q5_windpipe
hint.en: Follow the journey of air from the nose.
hint.vi: Em lần theo đường đi của không khí từ mũi nhé.
explanation_correct.en: Tiny dust slips past nose hairs, down the windpipe.
explanation_correct.vi: Bụi mịn lọt qua lông mũi, đi xuống khí quản.
explanation_wrong.en: Air and dust go down the windpipe to the lungs.
explanation_wrong.vi: Không khí và bụi đi xuống khí quản, vào phổi.
> DOK 2: áp dụng đường đi của không khí (bài hai) cho bụi mịn (bài này). Thực quản và dạ dày là hai thẻ sai, nối với `air_goes_to_belly`.
> Ba thẻ là ba hình tự vẽ dùng lại của bài hai, cùng nét. Hình câu hỏi là ảnh chụp; luật "cùng kiểu hình" áp cho các thẻ với nhau.
> [CẦN KIỂM] Bụi mịn nhỏ tới mức lông mũi không giữ hết, vào sâu tới phổi (biên tập nhớ).

#### bank q5_food_pipe
label.en: food pipe
label.vi: thực quản
feedback.en: The food pipe is for food you swallow.
feedback.vi: Thực quản là đường của thức ăn em nuốt.
image.brief: Dùng lại hình `tray_food_pipe` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A food pipe
image.alt.vi: Thực quản

#### bank q5_windpipe
label.en: windpipe
label.vi: khí quản
image.brief: Dùng lại hình `tray_windpipe` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A windpipe
image.alt.vi: Khí quản

#### bank q5_stomach
label.en: stomach
label.vi: dạ dày
feedback.en: The stomach is where food goes, not air.
feedback.vi: Dạ dày chứa thức ăn, không chứa không khí.
image.brief: Dùng lại hình `tray_stomach` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A stomach
image.alt.vi: Dạ dày

### q6
id: f24a8564-4465-45a2-9a85-a4a276fc3894
format: true_false
version: 1
dok: 3
misconception: clear_air_is_clean
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: The air looks clear today, so it has no dust.
statement.vi: Trời trông thật trong, vậy không khí không có bụi.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
image.brief: [hình vẽ] Bầu trời xanh trong trên những mái nhà của một thị trấn, buổi trưa nắng, nhìn hơi chếch lên; không thấy khói hay bụi, không có biển hiệu, không có chữ, không có người. Từ khoá tìm ảnh (EN): clear blue sky over rooftops town
image.alt.en: A clear sky over the roofs
image.alt.vi: Trời trong xanh trên những mái nhà
hint.en: Remember the Tiny dust card.
hint.vi: Em nhớ lại ô Bụi mịn nhé.
explanation_correct.en: Clear air can still hold dust too tiny to see.
explanation_correct.vi: Trời trong vẫn có thể có bụi mịn, mắt không thấy.
explanation_wrong.en: Tiny dust can hide in clear air.
explanation_wrong.vi: Bụi mịn có thể có cả khi trời trông trong.
feedback_true.en: Your eyes cannot see the tiniest dust.
feedback_true.vi: Mắt em không nhìn thấy loại bụi nhỏ nhất.
> Lời Na, hình và đáp án Sai đúng như `_topic.md` (mục "Câu sáu, lời Na" và bảng Đáp án Đúng/Sai).
> DOK 3: bé đánh giá một kết luận rút ra từ quan sát bằng mắt. Na lấy "trông trong" làm bằng chứng; bé phải dùng ý chính ba (có loại bụi mắt không nhìn thấy) để thấy bằng chứng đó chưa đủ. Câu không nói hôm nay có bụi hay không, chỉ nói "không thể biết chỉ bằng mắt".
> Giải thích khi đúng không mở đầu bằng "Yes!", vì bé vừa chọn "Na chưa đúng".

## Từ vựng

### dust
id: eb9fab88-f407-4223-af81-a7a0312a943a
tier: core
term.en: dust
term.vi: bụi
example.en: Dust from the road can hurt your lungs.
example.vi: Bụi đường có thể làm hại phổi.
image.brief: Dùng lại hình `explore_dust`. Từ khoá tìm ảnh (EN): dusty road truck dust cloud
image.alt.en: A dusty road
image.alt.vi: Con đường bụi mù

### smoke
id: fcc044a0-d27f-4c30-a4dc-df776d175e59
tier: core
term.en: smoke
term.vi: khói
example.en: Stay away from smoke. Find fresh air.
example.vi: Em tránh xa khói, ra chỗ không khí trong lành.
image.brief: Dùng lại hình `explore_smoke`. Từ khoá tìm ảnh (EN): burning rice straw field smoke
image.alt.en: Smoke from burning straw in a field
image.alt.vi: Khói đốt rơm rạ trên cánh đồng

### mask
id: 6eeed5d0-0a0b-4341-b37f-dd95e1061b0c
tier: core
term.en: mask
term.vi: khẩu trang
example.en: I wear a mask on dusty roads.
example.vi: Em đeo khẩu trang khi đi đường nhiều bụi.
image.brief: Dùng lại hình `explore_mask`. Từ khoá tìm ảnh (EN): cloth face mask on table
image.alt.en: A cloth mask on a table
image.alt.vi: Chiếc khẩu trang vải trên bàn

### fresh_air
id: 31c0944e-203b-4ac0-aec4-2ee2587cea64
tier: extra
term.en: fresh air
term.vi: không khí trong lành
example.en: A green park has fresh air.
example.vi: Công viên nhiều cây có không khí trong lành.
image.brief: Dùng lại hình `tray_park`. Từ khoá tìm ảnh (EN): green park big trees lawn morning
image.alt.en: A green park with big trees
image.alt.vi: Công viên nhiều cây xanh

### healthy
id: 39127a49-e004-4c01-8bbf-2b26df7f2c8c
tier: extra
term.en: healthy
term.vi: khoẻ mạnh
example.en: Run and play to keep your lungs healthy.
example.vi: Chạy nhảy vui chơi giúp phổi em khoẻ mạnh.
image.brief: Dùng lại hình `tray_ball` ở bài `ho-hap/tho-khi-chay-nhay`. Từ khoá tìm ảnh (EN): football on grass close up
image.alt.en: A football on the grass
image.alt.vi: Quả bóng trên sân cỏ

## Thưởng

### banyan
id: f1b5e413-bde4-452e-9e61-66126aa5c85d
set: breathing
rarity: common
name.en: Banyan tree
name.vi: Cây đa
tag.en: Fresh air
tag.vi: Không khí trong lành
fact.en: Trees give out oxygen. Their leaves can catch some dust, too.
fact.vi: Cây xanh nhả ra khí ô-xi. Lá cây còn giữ lại được một ít bụi.
> [CẦN KIỂM] Cây nhả ô-xi vào ban ngày khi quang hợp; lá cây giữ lại một phần bụi (biên tập nhớ). Ý "cây nhả ô-xi" để dành dạy kỹ ở *Cây làm gì và cần gì* (Discoverer số mười); ở đây chỉ là "Em có biết?".
image.brief: [ảnh] Một cây đa cổ thụ đầu làng, tán rộng, rễ phụ buông xuống, bãi cỏ phía trước, chụp rộng cả cây; không có người, không có đình chùa hay bàn thờ trong khung, không có biển chữ. Từ khoá tìm ảnh (EN): banyan tree village Vietnam
image.alt.en: A big banyan tree
image.alt.vi: Cây đa cổ thụ
> Không chọn ảnh có bàn thờ, miếu dưới gốc cây (trung tính với niềm tin).

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp thật cho mọi cảnh và đồ vật; ba thẻ từ câu q5 dùng lại hình tự vẽ của bài hai. Hình không có chữ.
  - **Theo hình designer làm 10/11** (ticket SK-036, mục "designer 10/11 · hình"): Commons không có ảnh hợp lệ cho phần lớn đồ vật và cảnh đường phố, nên designer vẽ trọn mọi chỗ cùng kiểu: kệ Chơi chín món (kể cả điếu thuốc và ruộng lúa), w1 bốn lựa chọn, q1 (mũ, áo mưa, khẩu trang cùng một kiểu bàn gỗ), q2 ba thẻ (bụi, khói, bể cá), q3, q4, q6, và ba ô Học bụi, khói, khẩu trang. Chỉ còn ba ảnh chụp: ô Bụi mịn (thành phố mù khói, ảnh EPA Documerica), câu hỏi q2 (trời xanh) và thẻ thưởng cây đa. Các mục "Ảnh cần tìm", "Khó tìm" và "cùng kiểu" dưới đây là bản trước khi có hình; nay các lựa chọn trong mỗi câu và kệ Chơi cùng là hình vẽ.
- **Ảnh cần tìm (mười tám):**
  - Khởi động (một): lối đi trong công viên (w1_walking).
  - Học (bốn): đường đất đỏ bụi mù; khói đốt rơm rạ; khẩu trang vải trên bàn; thành phố mù bụi nhìn từ trên cao.
  - Chơi (bốn): công viên nhiều cây; điếu thuốc trên gạt tàn (không người, không tay); bàn tay lau bàn bằng khăn ẩm; bếp than tổ ong bốc khói.
  - Quiz (tám): mũ vải và áo mưa trên bàn gỗ (q1); trời xanh trên ngọn cây (q2); nồi cơm bốc hơi, đường đông xe nhìn từ trên cao, công trường từ xa (q3); khối đồ chơi gỗ cạnh cửa sổ đóng (q4); trời trong trên mái nhà (q6).
  - Thưởng (một): cây đa cổ thụ đầu làng.
- **Khó tìm, phương án thay:**
  - **Đường đông xe máy** (`q3_road`): ảnh đường phố Việt Nam hay thấy biển số, mặt người, biển hiệu. Chọn ảnh chụp từ trên cao, xe nhỏ. Không có thì `[hình vẽ]`, và đổi cả bốn lựa chọn câu q3 sang hình vẽ để không lệch kiểu.
  - **Đường bụi mù** (`explore_dust`): thay được bằng công trường bụi từ xa; không có thì `[hình vẽ]`. Hình này còn ở q1, q2, q5 và từ `dust`; nếu đổi sang hình vẽ thì xem lại kiểu hình các thẻ q2 (bụi, khói, ô-xi cùng ảnh chụp).
  - **Thành phố mù bụi** (`explore_tiny_dust`): ảnh Hà Nội trên Commons phần lớn CC BY-SA (bị loại); dùng được thành phố khác, miễn không có chữ.
  - **Bếp than tổ ong, đốt rơm rạ:** ảnh có giấy phép có thể hiếm; không có thì Duy chọn thay bằng "Đốt rác" (mục Còn mở ở `_topic.md`), không vẽ.
- **Dùng lại:** từ bài một từ `oxygen`, bể cá có máy sục khí (thẻ q2_oxygen; đổi từ ảnh thợ lặn, rà chữ tester 10/11 n14); từ bài hai `q6` (câu w2), `tray_food_pipe`, `tray_windpipe`, `tray_stomach` (q5); từ bài ba `q1` (câu w1), `q3_chess`, `q3_hammock`, `tray_rope` (w1, kệ Chơi), `tray_ball` (kệ Chơi, từ `healthy`); từ chủ đề *Bề mặt Trái Đất* `nui-lua/q1` (câu w3). Trong bài: `explore_dust`, `explore_smoke`, `explore_mask`, `explore_tiny_dust`, `tray_park`, `q2`, `q3_road`.
- **An toàn:**
  - không có người hút thuốc, không tay cầm điếu thuốc, không bao thuốc;
  - không có mặt người ở đường phố, công trường; không đọc được biển số;
  - khói đốt rơm rạ, bếp than không dày đặc như đám cháy, không có lửa lớn;
  - không có người bệnh, không bệnh viện, không người ho.
- **Các lựa chọn trong một câu cùng khung, cùng kiểu:**
  - w1: bốn ảnh nơi chốn hay đồ vật không có người (lối đi, bàn cờ, võng, dây nhảy).
  - q1: ba đồ vật trên cùng một kiểu mặt bàn gỗ, chụp từ trên xuống.
  - q2: ba ảnh chụp (đường bụi, khói rơm, bể cá có máy sục khí). Từ rà chữ 10/11 (n14), thẻ ô-xi là bể cá chụp ngang mặt kính, không còn là thợ lặn; ảnh bể cá cùng cỡ cảnh vừa, không chụp cận viên đá sục.
  - q3: bốn ảnh cảnh rộng, **bắt buộc** cả ảnh nồi cơm (chụp cả góc bếp; rà chữ tester 10/11, n10).
  - q4: ba ảnh nơi chốn.
  - q5: ba hình tự vẽ dùng lại của bài hai.
- **Kệ Chơi:** chín món đều là hình vẽ (designer 10/11); ba món bẫy cũng là hình vẽ. Món Cánh đồng lúa vẽ riêng, không dùng lại ảnh `q2_rice`.
- **Màu:** Học: bụi `nau_dat`, khói `do_son`, khẩu trang `cham`, bụi mịn `vang_hoe`. Chơi: tránh bụi `cham`, không khí trong lành `gi_dong`, vận động `vang_hoe`, nhóm "Không tốt cho phổi" `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: dust, smoke, mask).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, chín món.
  - Khởi động: `single_choice` (w1, bốn lựa chọn), `true_false` (w2 Sai, w3 Đúng). DOK một. `recall_from.lesson`: `ho-hap/tho-khi-chay-nhay` (w1), `ho-hap/duong-di-cua-khong-khi` (w2), `be-mat-trai-dat/nui-lua` (w3, đã có id).
  - Quiz: `single_choice` (q1, q4), `fill_blank_bank` (q2, q5; một ô trống, ba thẻ có hình), `multi_choice` (q3, bốn lựa chọn, hai đúng), `true_false` (q6 Sai, `speaker: na`).
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3.
  - Câu có `misconception`: q6, key `clear_air_is_clean`.
- **Tham chiếu:** chạy `ids` cho bài hai và bài ba trước bài này.
- **Vị trí đáp án đúng:** w1 thứ tư; q1 thứ ba (đổi từ thứ hai, rà chữ tester 10/11 n1); q2 thẻ thứ ba; q3 thứ hai và thứ tư; q4 thứ nhất; q5 thẻ thứ hai.
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Đeo khẩu trang, Công viên nhiều cây, Nhảy dây → `balanced`;
  - Khói thuốc lá → `has_limited`;
  - Đeo khẩu trang, Lau bụi bằng khăn ẩm, Đá bóng (thiếu không khí trong lành) → `missing.tray_fresh`;
  - rồi chạm Cánh đồng lúa → `full`; bỏ Lau bụi bằng khăn ẩm, đặt Cánh đồng lúa → `balanced`.
- **Nhãn dài:** "Wipe with a wet cloth" · "Lau bụi bằng khăn ẩm" (món Chơi), "Không khí trong lành" (chip nhóm), "inside the house" (q4). Nhờ tester xem trên iPhone bề rộng nhỏ nhất.
- **Số từ EN trên một màn:** Học khoảng hai mươi bảy (mục tiêu 9, hướng dẫn 3, bốn nhãn 6, câu dài nhất 9, ô Từ mới 5). Nhiều chữ nhất ở Quiz là q3 (khoảng ba mươi: câu hỏi 9, hướng dẫn 5, bốn nhãn 9, giải thích sai 12) và q6 (khoảng hai mươi bảy).
- **Từ EN có thể ngoài Starters/Movers:** từ mới dust, smoke, mask; fresh air, healthy, cigarette, straw, stove, steam, building site, hazy, tiny, banyan, ash, volcano (chủ đề một).
- **Giọng đọc:** VI tiêu đề có dấu hai chấm; nghe thử. "ni-lông" ở brief, không ở chữ cho trẻ. Chuỗi VI không có ký hiệu, không có dấu "—".
- **Asset:** không có audio, `asset` trong markdown.
