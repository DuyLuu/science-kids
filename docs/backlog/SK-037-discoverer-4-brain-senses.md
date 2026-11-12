# SK-037 · Soạn chủ đề Discoverer #4 "Não bộ và giác quan" (4 bài)

Trạng thái: review · Ngày: 2026-11-10 · Phụ trách: content-editor (soạn), designer (hình), main session chạy lệnh · Tester: tester
Nguồn: Duy 10/11 ("tiếp tục" các phần còn "Sắp có"); syllabus.md mục 8 (pilot); syllabus-lessons.md mục 4; `content/TEMPLATE.md`; SK-031, SK-032 làm mẫu; SK-036 soạn song song

## Mục tiêu
Chủ đề thứ tư của pilot có đủ 4 bài chơi được trong app, có hình, tiếng EN và VI.

## Phạm vi
- **content-editor:** `content/discoverer/nao-bo-va-giac-quan/_topic.md` rồi soạn 4 bài:
  1. Não điều khiển cơ thể · The brain is in charge
  2. Dây thần kinh truyền tin · Nerves carry messages
  3. Giác quan gửi tin về não · Senses send messages to the brain
  4. Ngủ đủ giấc và đội mũ bảo hiểm · Sleep and protecting your head
- **designer, main session, tester:** như SK-036.

## Ngoài phạm vi
- Duyệt chuyên môn y khoa.

## Tiêu chí nghiệm thu
- [ ] Như SK-036 (TEMPLATE, hình mọi chỗ, rút kinh nghiệm SK-031/032/033, `validate`, `build`, `check-pack`, chơi được trên iPhone).
- [ ] Không lặp ý với *Hô hấp* (SK-036); giác quan nối được với năm giác quan bé đã biết, nâng lên "tin gửi về não".
- [ ] Bài 4: mũ bảo hiểm gắn với đi xe máy, xe đạp ở Việt Nam; không cảnh tai nạn, không máu.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở
**Phụ thuộc:** SK-030, SK-033.

**Quyết định đã ghi:** slug thư mục `nao-bo-va-giac-quan` (main session 10/11).

**Câu hỏi còn mở**

## content-editor 10/11

Phạm vi: chỉ viết trong `content/discoverer/nao-bo-va-giac-quan/`. Không sửa `content/discoverer/ho-hap/`, `content/TEMPLATE.md` hay file dùng chung. Không chạy lệnh: chưa chạy `validate`, `ids`. Mọi dòng `id:` để trống; `ai_draft: true` ở cả năm file.

**File**
- `content/discoverer/nao-bo-va-giac-quan/_topic.md`: frontmatter (`order: 4`, `strand: humans_health`, `level: 3`, độ khó 3-1-2-2-2 = mười điểm), sáu misconception, kế hoạch bốn bài, bảng Tên gọi, Quy ước hình (ba bộ hình vẽ dùng chung, bảng hình dùng chung), bảng Đúng/Sai, bảng vị trí đáp án, bảng Khởi động, câu sáu, thẻ thưởng, an toàn, "Không lặp với *Hô hấp*", đề xuất, còn mở.
- `01-nao-dieu-khien-co-the.md` (`opener`), `02-day-than-kinh-truyen-tin.md` (`core`), `03-giac-quan-gui-tin-ve-nao.md` (`apply`), `04-ngu-du-giac-va-doi-mu-bao-hiem.md` (`review`).

**Tóm tắt từng bài**

| Bài | Ba ý chính | Misconception (câu sáu) | Câu sáu |
| --- | --- | --- | --- |
| 1 Não điều khiển cơ thể | Bộ não ở trong đầu, dưới hộp sọ · giúp nghĩ, nhớ, cử động · làm việc suốt ngày đêm, cả khi ngủ (giữ tim đập) | `brain_stops_when_resting` | Na nằm võng: "I am resting in the hammock. My brain is not working." → Na chưa đúng |
| 2 Dây thần kinh truyền tin | Dây thần kinh là sợi mảnh chạy khắp cơ thể (tuỷ sống trong xương sống) · mang tin về não và từ não ra · tin rất nhanh, nhanh hơn chớp mắt | `nerve_messages_slow` (`veins_are_nerves` là món bẫy ở phần Chơi) | "My toe is far from my brain. I still feel it fast." → Na đúng |
| 3 Giác quan gửi tin về não | Mắt, tai, mũi, lưỡi, da cảm nhận · mỗi giác quan gửi tin về não theo dây thần kinh · bộ não ghép tin lại và nhận ra (quả xoài chín) | `taste_only_tongue` (`senses_know_alone` sửa ở Học, q3, q5) | "My nose is blocked. My phở still tastes the same." → Na chưa đúng |
| 4 Ngủ đủ giấc và đội mũ bảo hiểm | Mũ bảo hiểm che chở bộ não trên mọi chuyến đi · bộ não cần ngủ đủ mỗi đêm · khi ngủ, bộ não sắp xếp điều đã học | `helmet_only_long_rides` | "School is very close. I still wear my helmet." → Na đúng |

- Phần Chơi (cả bốn bài `build_tray`, ba chỗ, ba nhóm `required`, một nhóm `limit` dạng "Not …"):
  - bài một "Find three jobs of the brain": nghĩ, cử động, không cần nghĩ; bẫy quạt quay, mưa rơi, kim đồng hồ;
  - bài hai "Build the path of a message": chỗ cảm thấy, đường mang tin, chỗ nhận tin; bẫy dây điện, gân xanh, điện thoại ống bơ;
  - bài ba "Eyes closed! Find three messages" (Mai nhắm mắt ở nhà bà): tai, mũi, da; bẫy cầu vồng, cánh bướm;
  - bài bốn "A good day for your brain": đội mũ, ngủ đủ, cho bộ não học; bẫy mũ treo trên tay lái, quai để hở, chơi điện tử tới khuya.
- Quiz cả bốn bài: DOK 1, 1, 2, 2, 2, 3; bốn format (`single_choice`, `fill_blank_bank` có thẻ từ hình, `multi_choice`, `true_false`); không dùng `order_sequence`, `picture_bar_chart`.
- Năm giác quan bé đã biết nối vào chủ đề ở bài một (w1, w2: tai để nghe, năm giác quan), rồi bài ba nâng lên "tin gửi về não" và "bộ não ghép tin".
- Bài bốn: mũ bảo hiểm gắn với xe máy chở con trong ngõ, xe đạp, nón lá, mũ treo tay lái; không tai nạn, không máu; giấc ngủ nói lợi ích, không doạ.
- Thẻ thưởng `set: body`: Bộ não, Dây thần kinh, Cái lưỡi, Mũ bảo hiểm (key `*_card`).

**Đáp án Đúng/Sai** (bốn Đúng, bốn Sai; câu sáu Sai, Đúng, Sai, Đúng)

| Bài | Câu | Đáp án |
| --- | --- | --- |
| 1 | w2 "We have five senses." | Đúng |
| 1 | q6 Na nằm võng, não không làm việc | Sai |
| 2 | q6 Ngón chân xa nhưng thấy ngay | Đúng |
| 3 | w2 "The blue lines on your wrist are nerves." | Sai |
| 3 | q6 Nghẹt mũi, phở vẫn ngon như thường | Sai |
| 4 | w2 "In an earthquake, cover your head with your arm." (ôn *Bề mặt Trái Đất*) | Đúng |
| 4 | w3 "When you sleep, your brain switches off." (câu "Em nghĩ sao?" bài một) | Sai |
| 4 | q6 Trường gần vẫn đội mũ | Đúng |

**Vị trí đáp án đúng** (câu một đáp án; nhiều đáp án trong ngoặc)
- Bài một: w1 3, q1 2, q4 1, q5 3 (q3: 1, 4).
- Bài hai: w1 1, w2 2, q2 1, q4 3, q5 2 (q3: 1, 3).
- Bài ba: w1 2, q1 1, q4 2, q5 3 (q3: 2, 3).
- Bài bốn: w1 3, q1 1, q4 3, q5 2 (q3: 2, 4).
- Tổng: thứ nhất năm, thứ hai sáu, thứ ba sáu. w1 bốn bài: 3, 1, 2, 3.

**Chỗ `[CẦN KIỂM]`** (mỗi chỗ có dòng `>` ngay dưới trường; không có trong giá trị)
- `_topic.md`: thân não giữ nhịp tim; tốc độ tin thần kinh và so với chớp mắt; gân xanh là tĩnh mạch nông; "mắt gửi tin, não nhận ra"; mùi góp phần vào vị; luật đội mũ cho trẻ từ sáu tuổi trên xe máy, xe đạp; CT GDPT 2018 lớp ba "cơ quan thần kinh"; tên "tuỷ sống", "xương sống", "giác quan" theo sách; "bản đồ lưỡi" sai; số giờ ngủ; lời khuyên màn hình trước khi ngủ; thí nghiệm bắt thước.
- Bài một: ý chính ba (não làm việc khi ngủ); "năm giác quan" (w2); não mềm như đậu phụ, to cỡ hai nắm tay; não điều khiển đổ mồ hôi; bắt nhịp tim ở cổ tay; ảnh mô hình hộp sọ có đáng sợ không; não người lớn nặng cỡ quả dứa (thẻ).
- Bài hai: tốc độ và chớp mắt (ý chính ba); tuỷ sống là "bó dây thần kinh"; rụt tay khỏi nồi nóng là phản xạ qua tuỷ sống; gân xanh; tin nhanh hơn ô tô (thẻ).
- Bài ba: năm giác quan (ý chính một); gân xanh (w2); mũi giúp nếm (ô Học); hàng nghìn nụ vị giác (thẻ).
- Bài bốn: não sắp xếp điều đã học khi ngủ (ý chính ba); luật đội mũ (ô Helmet); cách đội mũ đúng; chín tới mười hai tiếng ngủ (ô Sleep; câu thay nếu bỏ số: "Children need more sleep than grown-ups."); phòng tối, không chơi điện tử tới khuya; giờ đi ngủ chín giờ; thức khuya khó nhớ bài (q5); lớp xốp EPS (thẻ).

**Hình khó tìm** (phương án thay ghi trong `brief` hoặc Ghi chú cho hoạ sĩ)
- Bài bốn `explore_helmet`: người lớn chở trẻ trên xe máy trong ngõ, cả hai đội mũ đã cài quai, nhìn từ sau, không biển số, không logo. Thay bằng hình ghép hoặc hình vẽ; nếu vẽ thì nên vẽ cả hai món bẫy mũ của kệ Chơi cho cùng kiểu.
- Bài bốn `tray_handlebar`, `tray_open_strap`, thẻ `helmet_card` (mặt trong mũ), câu q1 (xe máy đỗ): mũ và xe hay có logo, biển số.
- Bài một `tray_bike` (trẻ đạp xe đội mũ, nhìn từ sau), `tray_sweat` (giọt mồ hôi trên da).
- Bài hai `explore_fast` (bàn tay bắt thước rơi, thước không đọc được số) và bài ba câu q4 (tay thò vào túi vải): đã ghi phương án vẽ.
- Bài ba `explore_send` (trống trường Việt Nam, không băng rôn khẩu hiệu), câu q5 (sạp hoa quả không thấy mặt người bán), câu q3 (đèn giao thông không có số đếm ngược).
- Hình tự vẽ khoảng hai mươi sáu (bộ khuôn người, bộ cơ quan, bộ giác quan, cả kệ Chơi bài hai, ba cách đội mũ); ảnh cần tìm khoảng năm mươi tư; một hình ghép (`explore_five`).

**Còn chưa chắc**
- **Kệ Chơi bài hai toàn hình vẽ**, kể cả ba món bẫy (dây điện, gân xanh, điện thoại ống bơ) vốn tìm được ảnh. Lý do: ba món bắt buộc chỉ vẽ được, nếu bẫy là ảnh thì bé chọn theo kiểu hình. Cách này lệch câu "`[hình vẽ]` chỉ khi không có ảnh hợp lệ" của TEMPLATE; nhờ PM hoặc designer xác nhận (đã có tiền lệ SK-033 10/11 tối vẽ lại lựa chọn cho cùng kiểu).
- **Bài một chỉ có hai câu Khởi động ôn kiến thức nền**, bài hai w2 ôn *Khủng long* thay vì *Hô hấp*, vì *Hô hấp* chưa có id. Khi *Hô hấp* xong, đề xuất PM thêm w3 cho bài một ôn *Hô hấp* (ý "não giữ cho em thở cả khi ngủ" là cầu nối tốt, chưa đưa vào chữ cho trẻ để khỏi lặp).
- **`set: body` là bộ thẻ mới.** Cần ios-dev thêm khoá `collectible.set.body` "Body cards" · "Thẻ cơ thể"; *Hô hấp* có thể dùng chung, phiên chính thống nhất với biên tập *Hô hấp*.
- **Bài bốn câu q4** (cách đội mũ): nhãn tả cách đội nên bé đọc nhãn có thể đoán; gợi ý đưa bé nhìn hình. Nhờ tester xem.
- **Bài hai nhóm `tray_get`** chỉ có một món (bộ não). Nhờ tester xem trên máy có lạ không.
- **Màn Học** cả bốn bài khoảng ba mươi hai tới ba mươi ba từ EN (bốn ô), như hai chủ đề trước.
- **Chữ "tin"** cho "message": ngắn, khớp tên bài, nhưng tiếng Việt "tin" có nhiều nghĩa; thẻ từ câu q1 bài hai chỉ có một chữ "tin". Nếu tester thấy khó hiểu, đổi nhãn thẻ thành "tin tức".
- **"phở" trong chuỗi EN** (bài ba): nhờ nghe thử giọng EN; nếu đọc sai thì viết "pho" ở chuỗi EN.
- **Mức của chủ đề** mười điểm, Mức 3 (PM chốt).
- **Số liệu y khoa** (giờ ngủ, tốc độ tin, cân nặng não, nụ vị giác): cần người chuyên môn; quiz không hỏi con số nào.

**Việc cho phiên chính**
- Chạy `validate content/discoverer/nao-bo-va-giac-quan` và gửi lại các dòng lỗi.
- Chạy `ids` theo thứ tự `_topic.md`, `01`, `02`, `03`, `04` (bài sau có `recall_from.lesson` trỏ bài trước của chủ đề này; bài được trỏ tới phải có id trước).
- Gắn `topic_id`, bốn `lesson_id`, `level: 3` cho `new-brain` ở `content/syllabus.json`.
- Thống nhất `set: body` với *Hô hấp*; báo ios-dev khoá `collectible.set.body`.

## Rà chữ (tester 10/11)

Phạm vi: đọc `_topic.md` và bốn bài của `content/discoverer/nao-bo-va-giac-quan/`; đọc lướt `content/discoverer/ho-hap/` để đối chiếu không lặp ý (chủ đề đó do tester khác rà). Không sửa file nội dung, không chạy `tts`/`build`/`import`/`ids`, không dùng simulator. `validate` do phiên chính chạy (0 lỗi), không chạy lại.

Chuẩn đối chiếu: `content/TEMPLATE.md`, `content/rules.json` (`discoverer.authoring`), `syllabus-progression.md` mục 6–8, tiêu chí SK-036 và SK-037, luật riêng trong `_topic.md`, cách làm của SK-032. Ngoài đọc tay, chạy ba script kiểm cấu trúc (không phải test sản phẩm): (1) mỗi câu: format, DOK, số lựa chọn, vị trí đáp án đúng, key misconception, số từ EN mỗi câu; (2) mọi khối cần hình có đủ `image.brief` + `alt` EN/VI, mọi `Dùng lại hình` trỏ tới key có thật (cả sáu hình của chủ đề khác); (3) nguồn hình của từng lựa chọn (mới · dùng lại của Học · của Chơi · của bài khác) để tìm chỗ đáp án lộ bằng hình.

**Tổng kết: chặn 0 · nên sửa 9 · nhỏ 17.**

### Đạt (đã kiểm, không có lỗi)
- Quiz sáu câu mỗi bài, DOK 1·1·2·2·2·3 (Discoverer 2·3·1), câu một DOK 1, đúng một câu misconception mỗi bài đặt ở q6, key có thật trong `_topic.md`; bốn format mỗi bài (`single_choice`, `multi_choice`, `true_false`, `fill_blank_bank`). Số lựa chọn đúng luật: `single_choice` ba, `multi_choice` bốn, `fill_blank_bank` ba thẻ.
- Khởi động hai tới ba câu, không câu nào DOK 3; câu nào cũng có `recall_from`; mọi `recall_from.lesson` trỏ tới bài đã có id.
- Bảng Đáp án Đúng/Sai ở `_topic.md` khớp file: bốn Đúng, bốn Sai, câu sáu là Sai · Đúng · Sai · Đúng. Không câu đáp án Sai nào có `explanation_correct` mở đầu bằng "Yes!"/"Đúng rồi!". Bốn câu sáu đủ `speaker: na`, `instruction` và `labels` đúng chữ ticket.
- Vị trí đáp án của **câu một đáp án** khớp đúng bảng `_topic.md` (w1 bốn bài 3·1·2·3; câu nhiều đáp án 1·4 / 1·3 / 2·3 / 2·4), không bài nào theo chu kỳ trong bài. (Thẻ `fill_blank_bank` thì có, xem N1.)
- 185 chỗ có hình đều đủ `image.brief` + `alt.en` + `alt.vi`; không `Dùng lại hình` nào trỏ sai key; bảng "Hình dùng chung xuyên bài" ở `_topic.md` khớp đúng file.
- `messages.full` đúng chữ chung ở cả bốn bài; bốn nhãn nhóm `limit` đều dạng "Not …" · "Không …" và không gọi tên món bẫy; `messages.has_limited` đều nói lý do; nhắc thiếu nhóm đều dạng "You still need…" · "Em còn thiếu…"; nhãn nhóm Học và Chơi không có dấu phẩy.
- Chữ VI không có chữ số, ký hiệu, viết tắt hay dấu "—"; số viết bằng chữ. Không câu EN nào quá mười từ (ba `alt` mười một từ, nhưng `alt` không nằm trong luật đếm: `tools/content-cli/src/validate/age-rules.ts:280`).
- Từ vựng đúng luật Discoverer: bốn tới năm từ mỗi bài, đúng ba từ `core`; `term_keys` của `word_list` khớp ba từ `core`.
- An toàn: không chỗ nào có tai nạn, máu, mũ vỡ, băng bó, bệnh viện; giấc ngủ chỉ nói lợi ích, không doạ; không lời khuyên thay bác sĩ; không nhắc luật, phạt, công an; không "mười phần trăm bộ não", không "bản đồ lưỡi" (bài ba ghi rõ lưỡi một màu, không chia vùng), không não trái não phải; không nói về khiếm thị, khiếm thính.

### Lỗi chặn
Không có.

### Nên sửa (9)

**N1. Bốn thẻ từ `fill_blank_bank` của cả chủ đề đều là thẻ thứ hai.**
- `01-nao-dieu-khien-co-the.md:394-413` (`q2_heart`, `q2_brain`, `q2_stomach`; `answers: q2_brain`) · `02-day-than-kinh-truyen-tin.md:365-384` (`q1_food`, `q1_messages`, `q1_water`) · `03-giac-quan-gui-tin-ve-nao.md:385-404` (`q2_veins`, `q2_nerves`, `q2_wires`) · `04-ngu-du-giac-va-doi-mu-bao-hiem.md:418-437` (`q2_bell`, `q2_strap`, `q2_seat`).
- App không xáo, nên bé chạm thẻ giữa là đúng ở cả bốn bài. Bảng "Vị trí đáp án đúng" (`_topic.md:230-239`) không có cột cho thẻ `fill_blank_bank` nên chỗ này lọt; tính cả thẻ, tổng vị trí là **5 · 10 · 6**, không phải 5 · 6 · 6 như bảng ghi. Hai chủ đề trước có xáo (*Hô hấp* 2, 3, 3, 2; *Bề mặt Trái Đất* 2, 3, 2, 3).
- Đề xuất: đổi thứ tự `#### bank` để thẻ đúng lần lượt ở 1 · 3 · 2 · 3 — bài một `q2_brain, q2_heart, q2_stomach` (thẻ 1); bài hai `q1_food, q1_water, q1_messages` (thẻ 3); bài ba giữ nguyên (thẻ 2); bài bốn `q2_bell, q2_seat, q2_strap` (thẻ 3). Chỉ đổi thứ tự khối `#### bank`, không đổi `answers:`. Thêm cột thẻ vào bảng "Vị trí đáp án đúng" ở `_topic.md`.

**N2. Đáp án đúng là ảnh duy nhất bé đã thấy ở màn Học (ba câu).**
- `04:425-430` q2: thẻ đúng `q2_strap` dùng lại `explore_strap` (ô "Wear it right"); hai thẻ sai `q2_bell`, `q2_seat` là ảnh mới hoàn toàn (chuông xe, yên xe).
- `03:534-540` q5: `q5_ripe_mango` dùng lại `explore_join`; `q5_green_mango`, `q5_lime` là ảnh mới.
- `04:561-567` q5: `q5_sleep` dùng lại `explore_sleep` (ô "Sleep"); `q5_study_night` là ảnh mới.
- Bé chọn "cái đã gặp" mà không cần hiểu câu (lỗi cùng loại SK-032 n10). Các câu khác của chủ đề cân: q3 bài một bốn ảnh đều của kệ Chơi, q3 bài hai có một đúng và một sai cùng lấy từ Học.
- Đề xuất: cho ít nhất một lựa chọn sai cũng là hình của Học hoặc Chơi (bài bốn q2: thay `q2_bell` bằng "tay lái" dùng lại `tray_handlebar`), hoặc tìm ảnh khác cùng kiểu cho đáp án đúng.

**N3. Bài bốn: q3 và q5 dùng chung hình với cùng vai đúng · sai.**
- `explore_sleep` là đáp án **đúng** ở cả `04:483-489` (`q3_bed` "an early bedtime") và `04:561-567` (`q5_sleep` "a good night's sleep").
- `tray_late_games` là lựa chọn **sai** ở cả `04:459-465` (`q3_games` "games late at night") và `04:569-575` (`q5_games` "games until late"), nhãn gần như giống nhau.
- Bé làm q5 bằng trí nhớ của q3, không cần đọc câu hỏi. Thêm nữa hai lựa chọn sai của q5 cùng một ý "thức khuya", nên q5 thực chất chỉ còn hai lựa chọn.
- Đề xuất: q5 đổi `q5_games` sang bẫy khác loại (ví dụ "đọc lại bài ngay trước giờ ngủ" · "read it again right before bed", hoặc "chép lại mười lần" · "copy it ten times") và dùng một ảnh khác cho `q5_sleep` (ví dụ bạn nhỏ thức dậy kéo rèm, chụp từ sau).

**N4. Bài bốn q4: nhãn và `alt` lộ đáp án bằng hình thức** (đúng chỗ biên tập nhờ xem).
- `04:510-532`. `q4_right` là nhãn duy nhất có hai vế ngăn bằng dấu phẩy: `label.en: flat, strap clicked` · `label.vi: ngay ngắn, đã cài quai`; hai nhãn sai một vế ("tipped back", "strap hanging open"). Đây cũng là nhãn lựa chọn duy nhất của cả bốn bài có dấu phẩy. `alt` lặp lại đúng thế (`04:531` "A helmet sitting flat, strap clicked"), nên VoiceOver và phụ đề cũng lộ.
- Hai nhãn sai là đúng hai vế phủ định của ô Học `explore_strap` (`04:170-175`: "snug, not loose" · "flat on your head, not tipped back" · "strap clicked under your chin"), nên bé chỉ đọc nhãn là loại được, không cần nhìn hình; gợi ý `04:501` còn nói đúng hai chỗ phải nhìn.
- Đề xuất: ba nhãn song song, nhãn nào cũng đủ hai vế (vị trí mũ · quai), để không nhãn nào nổi bật:
  - `q4_back`: "tipped back, strap clicked" · "ngả ra sau gáy, đã cài quai"
  - `q4_open`: "flat, strap hanging open" · "ngay ngắn, quai buông thõng"
  - `q4_right`: "flat, strap clicked" · "ngay ngắn, đã cài quai"
  - `alt` theo cùng khuôn: "A helmet tipped back, strap clicked" · "Mũ bảo hiểm ngả ra sau, đã cài quai"; "A helmet sitting flat, strap hanging open" · "Mũ bảo hiểm đội ngay ngắn, quai buông thõng"; "A helmet sitting flat, strap clicked" · "Mũ bảo hiểm đội ngay ngắn, đã cài quai".
  - Giữ gợi ý `04:501-502`; lúc đó gợi ý mới đúng là gợi ý, vì bé phải xét cả hai vế.

**N5. Bài hai q3: dạng ngữ pháp của nhãn chia đúng đôi theo đáp án.**
- `02:448-478`. Hai lựa chọn **đúng** là cụm danh từ: `q3_bite` "a mosquito on your arm" · "con muỗi đậu trên tay", `q3_rain` "cold rain on your skin" · "mưa lạnh trên da". Hai lựa chọn **sai** là mệnh đề chủ ngữ + động từ: `q3_scratch` "your hand scratches" · "tay em gãi", `q3_run` "your legs run" · "chân em chạy".
- Bé (hay người đọc cho bé) phân loại được chỉ bằng dạng câu, không cần hiểu chiều của tin.
- Đề xuất: cả bốn cùng dạng mệnh đề — "a mosquito lands on your arm" · "con muỗi đậu trên tay em"; "your hand scratches" · "tay em gãi"; "cold rain falls on your skin" · "mưa lạnh rơi trên da em"; "your legs run" · "chân em chạy". Giải thích `02:444-445` sửa theo.

**N6. Bài hai q2: nhãn đáp án đúng khác dạng hai nhãn sai.**
- `02:404-426`: `q2_back` "along the back" · "dọc theo lưng" so với `q2_chest` "in the chest" · "trong ngực" và `q2_tummy` "in the tummy" · "trong bụng". Đáp án là nhãn duy nhất dùng "along" · "dọc theo".
- Đề xuất: "in the back" · "ở lưng" · "in the chest" · "in the tummy"; `explanation_wrong` (`02:400-401`) sửa thành "The answer is the back. The spinal cord runs down it." · "Đáp án là lưng. Tuỷ sống chạy dọc ở đó."

**N7. Ảnh mô hình hộp sọ nhựa trái Quy ước hình của chính chủ đề.**
- `_topic.md:155` viết: "Não, dây thần kinh, tuỷ sống, tim, dạ dày, bộ phận cơ thể người … `[hình vẽ]`. Lý do: … mô hình nhựa thường có số, nhãn chữ."
- `01:379` lại là `[ảnh]` mô hình hộp sọ người bằng nhựa, rồi dùng tiếp ở `01:516` (câu q5) và `01:601` (từ `skull`) — ba lần trong một bài. Biên tập đã tự ghi `[CẦN KIỂM]` ở `01:392` ("nếu vẫn đáng sợ với trẻ bảy tuổi").
- Thêm nữa, ở q2 hình câu hỏi là ảnh chụp còn ba thẻ từ (`q2_heart`, `q2_brain`, `q2_stomach`) đều là hình vẽ, nên một màn trộn hai kiểu hình.
- Đề xuất: đổi `01:379` sang `[hình vẽ]` hộp sọ nhìn nghiêng, cùng nét bộ cơ quan, trắng ngà, hốc mắt vẽ nhạt; `alt` "A skull" · "Hộp sọ". `explore_head` (`01:126`) đã vẽ hộp sọ nên dùng chung được nét, và cả màn q2 thành một kiểu hình.

**N8. Bài ba q5 nhắc lại y nguyên ô Học, kể cả ảnh; `alt` lộ chữ của câu hỏi.**
- Ô `explore_join` (`03:155-171`) liệt kê "eyes: yellow and round · nose: a sweet smell · hands: a little soft · brain: a ripe mango!". Câu q5 (`03:505-540`) hỏi đúng ba dấu hiệu đó, và đáp án đúng dùng lại **đúng ảnh quả xoài của ô Học**. Ghi `dok: 2` nhưng thực chất là nhớ lại một ô.
- `03:539` `alt.en` "A ripe yellow mango" chứa đúng hai chữ của câu hỏi ("yellow", và nhãn đáp án "ripe mango"), nên phụ đề và VoiceOver lộ.
- Đề xuất: giữ ý "ghép ba tin" nhưng đổi sang một quả khác chưa xuất hiện ở ô Học (ví dụ "Red, a little soft, sweet smell" với đu đủ chín · ổi chín · cà chua), hoặc ít nhất: dùng ảnh xoài chín **khác góc** cho `q5_ripe_mango` và sửa `alt` thành "A yellow mango" · "Quả xoài vàng" (giữ `alt` gốc "A ripe yellow mango" cho `explore_join`; luật dùng lại hình cho phép sửa `alt` để khỏi lộ đáp án, `TEMPLATE.md:85`).

**N9. "phở" nằm trong chuỗi EN** (đúng chỗ biên tập nhờ xem) — nên viết "pho".
- `03:181`, `03:187`, `03:552`, `03:561`, `03:605`. Đây là những chuỗi `.en` duy nhất trong cả `content/` có dấu tiếng Việt (kiểm bằng grep toàn thư mục).
- Tiền lệ của repo: `be-mat-trai-dat/01-dat-va-nuoc-tren-trai-dat.md:648-657` viết "Ha Long Bay" trong chuỗi EN, không dấu.
- Chưa nghe thử được giọng EN (không chạy `tts` trong lượt này), nhưng rủi ro rõ: engine EN gặp "ở" thường đọc sai hoặc đánh vần từng chữ; `alt.en` còn là nhãn VoiceOver tiếng Anh.
- Đề xuất: chuỗi `.en` viết "pho" (`examples.3.en: then pho tastes plain`; `statement.en: My nose is blocked. My pho still tastes the same.`; `image.alt.en: A hot bowl of pho`), giữ "phở" ở mọi chuỗi `.vi`. Nếu Duy muốn giữ dấu thì phải nghe thử EN trước khi `build`.

### Nhỏ (17)
- **n1. Bài hai `tray_fingertip`** (`02:315-321`): nhãn "Fingertips" · "Đầu ngón tay" nhưng dùng lại `q5_hand`, `alt` "A hand" · "Một bàn tay" — VoiceOver đọc "Một bàn tay" cho món tên "Đầu ngón tay". Cùng ảnh đó ở câu q5 (`02:557-563`) là lựa chọn **sai** "from your hand", còn ở kệ là món **đúng**; một hình, hai vai, trong cùng một bài (và ở bài ba còn đứng cho "da" trong `explore_five`). Đề xuất: vẽ riêng một hình đầu ngón tay (cận ngón trỏ chạm mặt bàn) cho `tray_fingertip`, hoặc đổi nhãn món thành "Skin on your fingers" · "Da ở đầu ngón tay" kèm `alt` riêng.
- **n2. Nhóm `tray_get` một món** (biên tập nhờ xem): chơi được, không phải lỗi — kệ có bốn cách xếp đạt, và bộ não là thứ duy nhất "nhận tin" nên thêm món thứ hai dễ sai khoa học. Hai điều nên sửa nhỏ: lời nhắc `02:247-248` dùng "the part" · "chỗ nhận tin" số ít xác định, gần như nói luôn chỉ có một món, đề xuất "You still need something that gets the message." · "Em còn thiếu chỗ nhận tin."; và kệ lệch (bắt buộc 2-2-1, `limit` 3), nên ghi rõ ở Ghi chú cho dev để người kiểm trên máy biết là cố ý. Hiển thị trên máy: **chưa kiểm**.
- **n3. Chữ "tin"** (biên tập nhờ xem): **giữ "tin", không đổi thành "tin tức"** — "tin tức" là bản tin thời sự, lệch nghĩa nhiều hơn; cả bốn bài, tên bài hai và từ vựng `message` đã dùng "tin". Thẻ `q1_messages` (`02:372-377`) có ảnh lá thư và nằm trong một câu đủ ngữ cảnh. Không đề xuất "lời nhắn" vì trùng chữ của `messages.*` trong trò chơi. Nhưng `sentence.vi` (`02:354`) "Dây thần kinh mang {1} đi về não và từ não đi khắp cơ thể." dài và thêm ý so với EN ("to and from your brain"); đề xuất "Dây thần kinh mang {1} về não và từ não đi ra." cho khớp EN và gọn khi đọc.
- **n4. Bài một q1 gợi ý theo vị trí**: `01:340-341` "Remember the first picture in the lesson." · "Em nhớ lại hình đầu tiên trong bài học nhé." Ba gợi ý còn lại của bài gọi tên ô (`01:477` "the Move picture", `01:572` "the All the time picture"). Đề xuất "Remember the In your head picture." · "Em nhớ lại ô Trong đầu em trong bài học nhé."
- **n5. Gợi ý nói thẳng tiêu chí đáp án**: `04:365-366` q1 "Which one is hard, like your skull?" · "Thứ nào cứng, giống như hộp sọ?" — câu DOK 1, ba lựa chọn, chỉ mũ bảo hiểm cứng, nên gợi ý thành lời giải. Đề xuất "Remember the Helmet picture in the lesson." · "Em nhớ lại ô Mũ bảo hiểm trong bài học nhé." Cùng kiểu nhưng nhẹ hơn (DOK 2): `01:519-520` "Your skull is hard. What job does it do?", đề xuất "Think what your skull does for your brain." · "Em nghĩ xem hộp sọ làm gì cho bộ não nhé."
- **n6. Bài một q5 và bài bốn q1 gần trùng nhau**: cùng hỏi vật cứng che đầu, cùng dùng lại `q5_helmet` và `q5_hat`, hai trong ba lựa chọn y hệt, giải thích cùng ý. Bài bốn là bài ôn nên lặp có chủ ý, nhưng nên đổi lựa chọn thứ ba của bài bốn (ví dụ "mũ lưỡi trai" · "cap") để không phải tập con của bài một. Thêm: `04:369` EN "The others are for sun, not bumps." nói chung, `04:370` VI lại gọi tên "Nón lá và mũ vải" — nên thống nhất hai bản.
- **n7. Bài ba q3 hai lựa chọn sai quá yếu**: `q3_tongue` (`03:426`) và `q3_toe` (`03:450`) không liên quan gì tới việc nhìn đèn đỏ, bé loại ngay. Đề xuất thay `q3_toe` bằng "veins" · "gân xanh" (dùng lại `day-than-kinh-truyen-tin/tray_veins`): bẫy thật, nối thẳng `veins_are_nerves` và câu w2 của chính bài, lại cùng là hình vẽ cùng nét.
- **n8. Bài ba q4 hình câu hỏi lệch tình huống**: `03:463` "Lan closes her eyes…" · "Lan nhắm mắt." nhưng hình (`03:465`) là hai bàn tay thò vào túi vải (trò túi bí mật). Đề xuất đổi prompt sang trò túi ("Lan reaches into a bag. She feels something soft and furry." · "Lan thò tay vào một chiếc túi. Bạn ấy sờ thấy thứ gì mềm và có lông.") hoặc đổi hình sang bạn nhỏ bịt mắt bằng khăn, chụp từ sau. Kèm: `alt` đáp án `03:489-490` "A fluffy kitten" · "Chú mèo con lông xù" nhắc lại đúng chữ "soft and furry" của câu hỏi; đề xuất "A kitten curled up" · "Chú mèo con nằm cuộn tròn".
- **n9. Bài ba, hai chỗ chữ EN khó hiểu**: `03:185` `examples.2.en: a cold can block your nose` — "a cold" dễ bị hiểu là "lạnh"; đề xuất "when you have a cold, your nose blocks" (giữ VI). `03:567` "Food tastes less with a blocked nose." không xuôi; đề xuất "Food tastes plain with a blocked nose.", khớp chữ "plain" đã dùng ở `03:187` và `03:624`.
- **n10. Lệch nghĩa EN · VI ở bài bốn q5**: `04:548` EN "Staying up late makes him tired." · `04:549` VI "Thức khuya làm Nam mệt và khó nhớ bài." Bản VI thêm một khẳng định khoa học (đúng chỗ có `[CẦN KIỂM]` ở `04:550`) mà bản EN không nói. Đề xuất bỏ vế "và khó nhớ bài", hoặc thêm vào bản EN và giữ `[CẦN KIỂM]`.
- **n11. `tray_clock`** (`01:318-324`): dùng lại `w1_clock` của *Bề mặt Trái Đất*, nhưng ảnh gốc (`be-mat-trai-dat/01-dat-va-nuoc-tren-trai-dat.md:64`) là đồng hồ "chụp hơi nghiêng để thấy rõ đồng hồ dẹt", và brief gốc cho phép "mặt đồng hồ có số". Ba chỗ lệch: nhãn là "Clock ticking" · "Kim đồng hồ chạy" trong khi ảnh tĩnh không cho thấy kim chạy; `alt` đổi thành "A wall clock" · "Chiếc đồng hồ treo tường" khác `alt` gốc "A flat round clock" mà không có lý do giấu đáp án (`TEMPLATE.md:85` nói chép `alt` của gốc); và số trên mặt đồng hồ trái Quy ước hình mục hai của chủ đề này ("Hình không có chữ"). Đề xuất: ghi thêm "chọn bản ảnh mặt đồng hồ không có số, chụp thẳng" vào brief, hoặc tìm ảnh riêng cho bài này.
- **n12. `w2_toy`** (`02:104-110`) đổi `alt` so với hình gốc (`khung-long/01-trai-dat-rat-lau-ve-truoc.md:631-632` "A toy dinosaur on a table" · "Khủng long đồ chơi trên bàn") thành "A plastic toy dinosaur" · "Khủng long đồ chơi bằng nhựa" mà không có lý do giấu đáp án. Đề xuất chép `alt` của gốc.
- **n13. Số đếm hình lệch**: `_topic.md:213` ghi "ảnh cần tìm khoảng năm mươi bốn (bài một mười sáu, bài hai mười, bài ba mười sáu, bài bốn mười ba)" — cộng lại là **năm mươi lăm**. Đếm bằng máy đúng là 16 · 10 · 16 · 13 = 55 ảnh mới, 12 · 10 · 1 · 3 = 26 hình tự vẽ, một hình ghép. Tiêu đề `02:664` ghi "Ảnh cần tìm (chín)" và `04:697` ghi "(mười hai)" trong khi đếm thật là mười và mười ba (chính hai dòng đó đã tự đính chính ở câu sau).
- **n14. Giờ đi ngủ cụ thể**: `04:295-296` "In bed by nine o'clock" · "Lên giường trước chín giờ" có `[CẦN KIỂM]` (`04:301`), nhưng từ vựng `bedtime` (`04:637-638`) "My bedtime is nine o'clock." · "Giờ đi ngủ của em là chín giờ." thì không. Mục An toàn (`_topic.md:289`) nói không chê bố mẹ; nhiều nhà ở Việt Nam cho con ngủ muộn hơn chín giờ. Đề xuất: ví dụ từ vựng đổi thành "I go to bed at the same time each night." · "Tối nào em cũng đi ngủ đúng giờ.", hoặc thêm `[CẦN KIỂM]` cho khớp món kệ.
- **n15. `tray_wire`** (`02:286`): hình vẽ đoạn dây điện "hai đầu tuốt lộ lõi đồng". Với trẻ bảy tới chín tuổi nên tránh vẽ dây điện hở lõi như một món cầm được. Đề xuất: dây điện còn nguyên vỏ, một đầu là phích cắm nhựa trơn không nhãn hiệu; vẫn nhận ra là dây điện mà không mời bắt chước.
- **n16. Nhắc nghe thử `term.vi` có dấu phẩy chưa đủ**: `smell` (`03:595`) có dòng `>` nhắc, nhưng `taste` (`03:601` "nếm, vị") và `dream` (`04:658` "giấc mơ, nằm mơ") cùng kiểu lại không có. Thêm cho đồng bộ.
- **n17. Bài một ô `explore_always`** (`01:185-186`): ví dụ bốn "no need to think about it" · "em không cần nghĩ tới" là một lời bình, ba ví dụ kia là việc cơ thể làm. Đề xuất đổi thành một việc nữa (ví dụ "your tummy works on your food" · "dạ dày em tiêu thức ăn", hợp hình `q2_stomach` đã có), hoặc chuyển ý này vào `sentence`.

### Kệ Chơi bài hai toàn hình vẽ (biên tập nhờ xem)
**Chấp nhận**, nên ghi thành luật thay vì xin ngoại lệ từng lần.
- Ba món bắt buộc (dây thần kinh, tuỷ sống, bộ não) chỉ vẽ được. Nếu ba món bẫy là ảnh chụp thì kệ tách đôi **đúng theo ranh giới bắt buộc · bẫy**, tức lộ đáp án bằng kiểu hình — nặng hơn nhiều so với việc lệch câu "`[hình vẽ]` chỉ khi không có ảnh hợp lệ" của `TEMPLATE.md:68`.
- Hai trong ba món bẫy còn có lý do riêng để vẽ: ảnh thật gân xanh cổ tay dễ trông như ảnh y tế, ảnh "điện thoại ống bơ" thật thường có nhãn trên lon.
- Đề xuất cho PM: thêm một câu vào đoạn **Hình** của `TEMPLATE.md` — "một kệ `build_tray` dùng một loại hình cho cả kệ; nếu món bắt buộc chỉ vẽ được thì món bẫy cũng vẽ" — để chủ đề sau không phải hỏi lại.
- Đi kèm, nhắc ngược lại bài bốn: `04:693` đã nói nếu `explore_helmet` phải chuyển sang hình vẽ thì **bắt buộc** vẽ cả `tray_handlebar` và `tray_open_strap`, nếu không kệ bài bốn lại có một hình vẽ duy nhất giữa toàn ảnh (đúng lỗi SK-033 ở kệ bài năm *Khủng long*). Nhờ designer chốt sớm, vì nó đổi số ảnh cần tìm.

### Chéo với *Hô hấp* (đọc lướt `content/discoverer/ho-hap/`)
- **Không lặp ý.** Bốn bài *Não bộ* không có một chữ nào về phổi, khí quản, thở, khói bụi, khẩu trang (grep 0 kết quả). *Hô hấp* không nhắc não hay dây thần kinh (`ho-hap/_topic.md:120` ghi rõ, grep xác nhận). Mũi: *Hô hấp* bài hai là lối vào của không khí, *Não bộ* bài ba chỉ ngửi và nếm. Mũ bảo hiểm: *Hô hấp* bài bốn cố ý dùng mũ vải và áo mưa (`ho-hap/04-giu-phoi-khoe.md:395`). Giấc ngủ: *Hô hấp* "thở cả khi ngủ", *Não bộ* "não làm việc cả khi ngủ" — bổ sung nhau, không mâu thuẫn.
- **Trùng hình, nên chốt dùng chung** (hai chỗ, SK-036 mới ghi ba chỗ mũi · tim · dạ dày):
  1. **Võng trống.** `nao-bo-va-giac-quan/01-nao-dieu-khien-co-the.md:569` (`q6`, dùng tiếp cho `tray_nap` bài bốn và từ `nap`) và `ho-hap/03-tho-khi-chay-nhay.md:452` (`q3_hammock`, dùng tiếp ở `ho-hap/04-giu-phoi-khoe.md:83`) có **đúng cùng một dòng từ khoá**: "empty hammock between trees garden". Hai lần tìm ảnh, hai asset cho cùng một ảnh.
  2. **Bạn nhỏ ngủ trong màn.** `nao-bo-va-giac-quan/01-nao-dieu-khien-co-the.md:176` (`explore_always`, hình tự vẽ) và `ho-hap/01-vi-sao-ta-phai-tho.md:359` (hình tự vẽ của câu q1) gần như cùng một hình; `alt.en` **giống hệt** ("A child asleep under a mosquito net"), `alt.vi` chỉ khác chữ "đang". Hai bản vẽ, hai lần công, và trong gói sẽ có hai asset khác nhau mang cùng một `alt` EN.
  - Đề xuất: PM hoặc phiên chính chốt bên nào là hình gốc, bên kia viết "Dùng lại hình `<key>` ở bài `<chủ đề>/<bài>`", như SK-036 đã làm (`ho-hap/_topic.md:115`).
- **Bộ thẻ:** *Hô hấp* dùng `set: breathing` (bốn thẻ), *Não bộ* dùng `set: body` (bốn thẻ) — **không dùng chung**, khác phỏng đoán ở `_topic.md:276`. ios-dev cần **hai** khoá: `collectible.set.body` "Body cards" · "Thẻ cơ thể" và `collectible.set.breathing` "Breathing cards" · "Thẻ hô hấp".

### Hết hiệu lực, cần PM xem lại
- `content/syllabus.json` đã có `topic_id`, bốn `lesson_id` và `level: 3` cho `new-brain`; **`new-breathing` cũng đã có đủ bốn `lesson_id`**. Vì vậy hai chỗ "chờ *Hô hấp* có id" ở `_topic.md:265-266` và mục "Còn chưa chắc" của ticket không còn bị chặn: PM quyết được ngay việc thêm w3 cho bài một (ôn *Hô hấp*) và đổi w2 bài hai từ *Khủng long* sang *Hô hấp*.
- Hiện cả bốn bài **không có câu Khởi động nào rơi vào mốc "một tuần"**: một ngày × bốn, hai tới ba ngày × hai, hai tới ba tuần × một, một tháng × một, `prior_knowledge` × hai (`content/rules.json`, `discoverer.warmup.week` target 7, min 5). Đổi w2 bài hai sang *Hô hấp* bài ba hoặc bốn sẽ lấp đúng mốc này.

### Chưa kiểm
- Hình thật: mới có `brief`, chưa có ảnh nào được chọn.
- Giọng đọc: EN "spinal cord", "shuttlecock", "tin-can phone", "phở"; VI `term.vi` có dấu phẩy và dấu hai chấm ở `explore_join`. Không chạy `tts` trong lượt này.
- Hiển thị trên máy: dòng điều kiện bốn màn Chơi (dài nhất là bài một, `01:689`), kệ bài hai toàn hình vẽ trông thế nào cạnh nhau, nhóm `tray_get` một món, vùng chạm, VoiceOver đọc `alt`. Không dùng simulator trong lượt này.
- Số liệu y khoa vẫn ở `[CẦN KIỂM]`: giờ ngủ, tốc độ tin thần kinh, cân nặng bộ não, số nụ vị giác, lớp xốp trong mũ, thân não giữ nhịp tim, "não sắp xếp điều đã học khi ngủ".

## content-editor 10/11 · sửa theo tester

Phạm vi: chỉ sửa năm file trong `content/discoverer/nao-bo-va-giac-quan/`. Không sửa `content/discoverer/ho-hap/`, `TEMPLATE.md` hay file dùng chung. Không đổi, không xoá dòng `id:` nào có sẵn. Một khối mới có `id:` trống: w3 bài một. Mỗi chỗ sửa có dòng `> Rà chữ tester 10/11 (mã)` ngay trong bài. Chưa chạy `ids`, `validate` (agent không chạy lệnh).

**Nên sửa (9/9)**
- **N1, thẻ đúng của câu điền từ:** đổi thứ tự `#### bank`, không đổi `answers:`. Bài một q2 thẻ 1, bài hai q1 thẻ 3, bài ba q2 giữ thẻ 2, bài bốn q2 thẻ 3. Bảng "Vị trí đáp án đúng" ở `_topic.md` thêm cột thẻ (tổng tính cả thẻ: bảy, bảy, tám).
- **N2, đáp án là ảnh duy nhất đã gặp ở Học:**
  - bài bốn q2: thẻ `q2_strap` dùng ảnh mới (khoá quai đã cài, không có tay), không dùng lại `explore_strap`. Không lấy "tay lái" như tester gợi ý, vì ảnh `tray_handlebar` có cả chiếc mũ, dễ rối với chữ "quai";
  - bài ba q5: xem N8;
  - bài bốn q5: xem N3.
- **N3, bài bốn q3 và q5 trùng ảnh, trùng vai:** q5 bỏ "chơi điện tử tới khuya", thay bằng bẫy khác loại "sleep with the TV on" · "ngủ mà vẫn bật ti vi" (nối ví dụ "a dark, quiet room" của ô Sleep). Đáp án `q5_sleep` dùng ảnh mới (phòng ngủ tắt đèn ban đêm). Ba ảnh q5 đều mới và đều là cảnh ban đêm. Không lấy hai bẫy tester gợi ý ("đọc lại bài trước giờ ngủ", "chép mười lần"), vì cả hai thật ra cũng giúp nhớ bài, câu sẽ có hai đáp án.
- **N4, bài bốn q4:** ba nhãn và ba `alt` cùng một khuôn hai vế, đúng đề xuất của tester; giải thích khi sai sửa theo.
- **N5, bài hai q3:** bốn nhãn cùng dạng câu ("a mosquito lands on your arm", "cold rain falls on your skin"…). Rút giải thích khi sai còn một câu để màn không dài thêm.
- **N6, bài hai q2:** ba nhãn "in the back" · "ở lưng", "in the chest" · "ở ngực", "in the tummy" · "ở bụng". Giải thích khi sai theo đề xuất.
- **N7, hộp sọ:** hình câu q2 bài một nay là `[hình vẽ]` hộp sọ nhìn nghiêng, cùng nét bộ cơ quan, hốc mắt vẽ nhạt. `alt` "A skull" · "Hộp sọ" ở câu q2, câu q5 và từ `skull`. Bỏ dòng `[CẦN KIỂM]` cũ về ảnh đáng sợ.
- **N8, bài ba q5:** đổi sang quả dâu tây ("Red, a little soft, sweet smell"), một quả chưa gặp ở Học. Lựa chọn sai: táo đỏ (cứng), chuối chín (màu vàng), mỗi quả trật một tin. Ba ảnh mới, đổi key ba lựa chọn. Ô `explore_join` giữ quả xoài.
- **N9, "pho":** mọi chuỗi `.en` viết "pho" (ví dụ ô Học, lời Na, ba `alt.en`); chuỗi `.vi` giữ "phở". Thêm dòng vào bảng Tên gọi.

**Khởi động, theo main session**
- Bài hai w2: đổi từ *Khủng long* sang ôn `ho-hap/tho-khi-chay-nhay` ("Which one makes you breathe fastest?"; đọc truyện, nhảy dây, ngủ; đáp án thứ hai), lấp mốc "một tuần". Giữ `id` và key `w2`; nội dung là câu mới. Nếu phiên chính muốn id mới thì xoá dòng `id:` của w2 rồi chạy `ids`.
- Bài một thêm w3 (`id:` trống): ôn `ho-hap/giu-phoi-khoe`, "Which one helps keep dust out of your nose?" (khẩu trang, mũ vải, áo mưa; đáp án thứ nhất). `single_choice`, nên bảng Đúng/Sai không đổi: bốn Đúng, bốn Sai, câu sáu Sai · Đúng · Sai · Đúng.
- Hai câu dùng lại đúng ảnh của câu tương ứng ở *Hô hấp*, trỏ về hình gốc, thứ tự lựa chọn khác *Hô hấp*.

**Hình dùng chung với *Hô hấp*** (bên này chỉ dùng lại; không sửa file *Hô hấp*)
- Bạn nhỏ ngủ trong màn: `ho-hap/vi-sao-ta-phai-tho` `q1`. Dùng ở bài một `explore_always`, q3; bài hai w1; bài bốn w3, `explore_dream`, từ `dream`.
- Võng trống: `ho-hap/tho-khi-chay-nhay` `q3_hammock`. Dùng ở bài một q6; bài bốn `tray_nap`, từ `nap`.
- Mũi, tim, dạ dày: `ho-hap/duong-di-cua-khong-khi` `tray_nose`, `tray_heart`, `tray_stomach`. Thay mọi hình vẽ riêng bên này: bài một w1_nose, q2_heart, q2_stomach, q4_heart, q4_stomach; bài hai q4_heart, q4_stomach; bài ba w1_heart, w1_stomach, phần mũi của `explore_five`, từ `blocked_nose`; bài bốn w1_nose.
- `alt` chép của hình gốc *Hô hấp*. Bộ não, hộp sọ, dây thần kinh, mắt, tai, lưỡi bên này: brief nói vẽ cùng nét các hình đó.

**Nhỏ (17/17 có xử lý)**
- **Sửa theo đề xuất:** n2 (lời nhắc "something that gets the message"; Ghi chú cho dev nói rõ kệ lệch 2-2-1 là cố ý), n3 (giữ "tin"; câu VI rút gọn), n4, n5 (cả hai gợi ý), n7 (q3 bài ba "veins" · "mạch máu" thay "toe"), n9 (cả hai câu), n10, n13 (số hình đếm lại), n14 (từ `bedtime` "I go to bed at the same time each night."; món kệ "Early bedtime" · "Đi ngủ sớm"), n15, n16.
- **Sửa theo cách khác:**
  - n1: vẽ riêng hình đầu ngón tay cho `tray_fingertip`, `alt` riêng.
  - n6: q1 bài bốn đổi mũ vải thành mũ lưỡi trai (ảnh mới), và mũ bảo hiểm cũng dùng ảnh mới (mũ cỡ trẻ em). Nếu chỉ đổi mũ vải thì đáp án đúng thành ảnh duy nhất bé đã gặp (lỗi N2). Giải thích EN và VI cùng gọi tên nón lá, mũ lưỡi trai.
  - n8: giữ câu "Lan closes her eyes", đổi hình câu hỏi sang bạn nhỏ bịt mắt nhìn từ sau. Không đổi sang trò túi, vì mèo con trong túi là cảnh lạ. `alt` của `q4_kitten` "A kitten curled up" · "Chú mèo con nằm cuộn tròn".
  - n11: `tray_clock` nay là ảnh riêng (đồng hồ không có chữ số, chụp thẳng, thấy kim giây), không dùng lại `w1_clock` của *Bề mặt Trái Đất*.
  - n17: ví dụ bốn ô `explore_always` "you blink without trying" · "em chớp mắt mà không cần nghĩ". Không lấy ví dụ dạ dày vì ruột, dạ dày phần lớn có hệ thần kinh riêng, nói "bộ não lo" dễ sai.
- **Hết đối tượng:** n12 (`w2_toy` đã bỏ cùng câu w2 cũ).

**Chữ trẻ nghe đã đổi** (cần sinh lại clip; EN và VI trừ khi ghi khác)
- Bài một:
  - w3 mới: `prompt`, `hint`, hai `explanation`, ba nhãn;
  - `explore_always` ví dụ bốn;
  - q1 `hint`; q5 `hint`.
- Bài hai:
  - w2 câu mới: `prompt`, `hint`, hai `explanation`, ba nhãn;
  - `messages.missing.tray_get` (chỉ EN);
  - q1 `sentence` (chỉ VI);
  - q2: nhãn `q2_back` (EN, VI), nhãn `q2_chest`, `q2_tummy` (chỉ VI), `explanation_wrong`;
  - q3: nhãn `q3_bite`, `q3_rain`, `explanation_wrong`;
  - nhãn món `tray_fingertip` không đổi.
- Bài ba:
  - `explore_taste` ví dụ hai, ví dụ ba (chỉ EN);
  - q3 nhãn mới `q3_veins`;
  - q5: `prompt`, hai `explanation`, ba nhãn mới;
  - q6: `statement`, `explanation_wrong` (chỉ EN).
- Bài bốn:
  - nhãn món `tray_bed`;
  - q1: `hint`, `explanation_wrong`, nhãn mới `q1_cap`;
  - q4: nhãn `q4_back`, `q4_open`, `explanation_wrong`;
  - q5: `explanation_wrong`, nhãn mới `q5_tv`;
  - từ `bedtime` câu ví dụ.
- Không phải clip: mọi `alt` và `brief` ở bảng dưới, các dòng `>`, `_topic.md` (trừ `correction` hai misconception đã đổi lượt trước).

**Key đổi** (lựa chọn, thẻ từ, món: không có dòng `id:`)
- Bài hai: `w2_toy`, `w2_leg_bone`, `w2_chicken` thành `w2_reading`, `w2_skipping`, `w2_sleeping`.
- Bài ba: `q3_toe` thành `q3_veins`; `q5_green_mango`, `q5_lime`, `q5_ripe_mango` thành `q5_apple`, `q5_banana`, `q5_strawberry`.
- Bài bốn: `q1_hat` thành `q1_cap`; `q5_games` thành `q5_tv`.
- Bài một: thêm `w3` và `w3_mask`, `w3_hat`, `w3_raincoat`.

**Còn chưa chắc**
- **Bài bốn q5:** đáp án là phòng duy nhất tắt đèn; khớp ý "phòng tối, yên tĩnh" đã học, nhưng bé có thể chọn theo độ tối của ảnh. Nhờ tester xem.
- **Bài một q5 `q5_hat` và *Hô hấp* `giu-phoi-khoe/q1_hat`** đều là mũ vải. Bên này giữ ảnh riêng (nền trơn, cùng kiểu gối và mũ bảo hiểm); bên *Hô hấp* chụp trên bàn gỗ. Câu w3 bài một dùng ảnh của *Hô hấp*. Nếu muốn một vật một ảnh thì đổi cả ba ảnh q5 bài một sang nền bàn gỗ.
- **Bài hai câu w1 và w2** có hai ảnh "đọc" khác nhau (bạn nhỏ đọc sách; quyển truyện trên bàn của *Hô hấp*), mỗi ảnh đúng kiểu với các lựa chọn của câu mình.
- **Nét vẽ:** mũi, tim, dạ dày là hình gốc của *Hô hấp*; mắt, tai, lưỡi, bộ não, hộp sọ, dây thần kinh bên này phải vẽ cùng nét. Designer xem hai bộ đặt cạnh nhau.
- **Đề xuất cho PM, chưa sửa:**
  - thêm câu "một kệ một loại hình" vào `TEMPLATE.md`;
  - ios-dev cần hai khoá `collectible.set.body`, `collectible.set.breathing`.

### Hình đổi sau rà chữ

| Bài | Key | Đổi gì |
| --- | --- | --- |
| 1 | `w1_nose` | Hình vẽ riêng → dùng lại `tray_nose` ở bài `ho-hap/duong-di-cua-khong-khi`; `alt.vi` "Cái mũi" |
| 1 | `w1_eye`, `w1_ear` | Brief: vẽ cùng nét hình mũi của *Hô hấp* (vật không đổi) |
| 1 | `w3` (mới), `w3_mask`, `w3_hat`, `w3_raincoat` (mới) | Dùng lại `explore_dust`, `explore_mask`, `q1_hat`, `q1_raincoat` ở bài `ho-hap/giu-phoi-khoe`; `alt` chép gốc |
| 1 | `explore_always` | Hình vẽ riêng → dùng lại `q1` ở bài `ho-hap/vi-sao-ta-phai-tho`; `alt.vi` "Bạn nhỏ ngủ trong màn" |
| 1 | `tray_clock` | Dùng lại `w1_clock` của *Bề mặt Trái Đất* → `[ảnh]` riêng: đồng hồ treo tường không chữ số, chụp thẳng, thấy kim giây |
| 1 | `q2` (hình câu) | `[ảnh]` mô hình hộp sọ nhựa → `[hình vẽ]` hộp sọ nhìn nghiêng, cùng nét bộ cơ quan; `alt` "A skull" · "Hộp sọ" |
| 1 | `q2_brain` | Brief: vẽ cùng nét tim, dạ dày của *Hô hấp*; thẻ lên thứ nhất |
| 1 | `q2_heart`, `q2_stomach` | Hình vẽ riêng → dùng lại `tray_heart`, `tray_stomach` ở bài `ho-hap/duong-di-cua-khong-khi` |
| 1 | `q3` (hình câu) | Dùng lại `explore_always` → dùng lại `q1` ở bài `ho-hap/vi-sao-ta-phai-tho`; `alt.vi` |
| 1 | `q4_heart`, `q4_stomach` | → `tray_heart`, `tray_stomach` của *Hô hấp* |
| 1 | `q5` (hình câu), từ `skull` | `alt` "A skull" · "Hộp sọ" |
| 1 | `q5_hat`, `q5_helmet` | Brief: sửa câu "bài bốn dùng lại" (mũ vải không còn dùng ở bài bốn; mũ bảo hiểm còn ở hình câu q4 và từ `helmet` bài bốn) |
| 1 | `q6` (hình câu) | Ảnh võng riêng → dùng lại `q3_hammock` ở bài `ho-hap/tho-khi-chay-nhay`; `alt` "A hammock between two trees" · "Cái võng mắc giữa hai cây" |
| 2 | `w1` (hình câu) | → `q1` ở bài `ho-hap/vi-sao-ta-phai-tho`; `alt.vi` |
| 2 | `w2` (hình câu), `w2_reading`, `w2_skipping`, `w2_sleeping` (mới) | Thay ba hình *Khủng long* (`w2_toy`, `w2_leg_bone`, `w2_chicken` bỏ) bằng `q1`, `tray_book`, `tray_rope`, `q1_sleeping` ở bài `ho-hap/tho-khi-chay-nhay` |
| 2 | `tray_wire` | Brief: dây còn nguyên vỏ, một đầu phích cắm trơn, không hở lõi |
| 2 | `tray_fingertip` | Dùng lại `q5_hand` → `[hình vẽ]` riêng: đầu ngón trỏ chạm mặt bàn; `alt` "A fingertip touching a table" · "Đầu ngón tay chạm mặt bàn" |
| 2 | `q1_food`, `q1_water`, `q1_messages` | Chỉ đổi thứ tự (thẻ đúng xuống thứ ba) |
| 2 | `q4_heart`, `q4_stomach` | → `tray_heart`, `tray_stomach` của *Hô hấp* |
| 2 | `q4_nerve`, `q5_toe`, `q5_hand` | Brief: sửa danh sách chỗ dùng lại, nhắc cùng nét *Hô hấp* (hình không đổi) |
| 3 | `explore_five` (ghép) | Phần mũi → `tray_nose` ở bài `ho-hap/duong-di-cua-khong-khi` |
| 3 | `explore_join` | Brief: bỏ câu "câu q5 dùng lại" (hình không đổi) |
| 3 | `explore_taste`, `q6` (hình câu), từ `taste` | `alt.en` "A hot bowl of pho" |
| 3 | `w1_heart`, `w1_stomach` | → `tray_heart`, `tray_stomach` của *Hô hấp* |
| 3 | `q3_veins` (thay `q3_toe`) | Dùng lại `day-than-kinh-truyen-tin/tray_veins` |
| 3 | `q4` (hình câu) | Tay thò vào túi vải → `[ảnh]` bạn nhỏ bịt mắt nhìn từ sau (không có thì `[hình vẽ]`); `alt` "A child with a blindfold, seen from behind" · "Bạn nhỏ bịt mắt, nhìn từ phía sau" |
| 3 | `q4_kitten` | `alt` "A kitten curled up" · "Chú mèo con nằm cuộn tròn" (hình không đổi) |
| 3 | `q5_apple`, `q5_banana`, `q5_strawberry` (thay `q5_green_mango`, `q5_lime`, `q5_ripe_mango`) | Ba `[ảnh]` mới: táo đỏ, một quả chuối chín, dâu tây chín; nền trơn, chụp chéo, cùng cỡ |
| 3 | từ `blocked_nose` | → `tray_nose` của *Hô hấp*; `alt.vi` "Cái mũi" |
| 4 | `w1_nose` | → `tray_nose` của *Hô hấp*; `alt.vi` "Cái mũi" |
| 4 | `w3` (hình câu), `explore_dream`, từ `dream` | → `q1` ở bài `ho-hap/vi-sao-ta-phai-tho`; `alt.vi` |
| 4 | `explore_strap`, `explore_sleep`, `tray_late_games` | Brief: sửa danh sách chỗ dùng lại (hình không đổi) |
| 4 | `tray_nap`, từ `nap` | → `q3_hammock` ở bài `ho-hap/tho-khi-chay-nhay`; `alt` |
| 4 | `q1_helmet` | Dùng lại `q5_helmet` bài một → `[ảnh]` mới: mũ bảo hiểm nửa đầu cỡ trẻ em, khác màu |
| 4 | `q1_cap` (thay `q1_hat`) | `[ảnh]` mới: mũ lưỡi trai trơn trên nền trơn |
| 4 | `q1_conical` | Brief: "cùng cỡ với mũ bảo hiểm và mũ lưỡi trai" |
| 4 | `q2_strap` | Dùng lại `explore_strap` → `[ảnh]` mới: khoá quai đã cài, không có tay; `alt` "A clicked helmet strap" · "Quai mũ bảo hiểm đã cài"; thẻ xuống thứ ba |
| 4 | `q4_back`, `q4_open`, `q4_right` | `alt` theo khuôn hai vế (hình không đổi) |
| 4 | `q5_sleep` | Dùng lại `explore_sleep` → `[ảnh]` mới: phòng ngủ tắt đèn ban đêm, màn đã buông; `alt` "A dark bedroom at night" · "Phòng ngủ tối lúc đêm" |
| 4 | `q5_tv` (thay `q5_games`) | `[ảnh]` mới: ti vi sáng trong phòng tối, màn hình chỉ là vệt sáng |

Số hình sau sửa: ảnh cần tìm sáu mươi (15 · 10 · 17 · 18), hình tự vẽ hai mươi bốn (9 · 11 · 1 · 3), một hình ghép. Năm hình trùng *Hô hấp* không còn tính bên này.

## designer 10/11 · hình

Theo SK-033 ("Hợp đồng ảnh", "Hình ghép", "Hình tự vẽ"), bảng "Hình đổi sau rà chữ" ở trên, và phương án (b) phiên chính chốt 10/11 tối: chỗ không có ảnh miễn phí hợp lệ thì vẽ; câu hay kệ nào vì thế mà trộn ảnh với hình vẽ thì vẽ cả bộ. Chờ Duy duyệt; chưa `build`, chưa commit.

**File**
- File chọn ảnh: `content/images/discoverer/nao-bo-va-giac-quan/` (4 file, mỗi bài một file).
- Hình tự vẽ: `content/images/own/nao-bo-va-giac-quan/`, 63 file JPEG 1024×768, sRGB, không metadata, không chữ.
- Hình ghép: `content/images/composed/nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao.learn.explore.explore_five.jpg`, ảnh vuông 1024×1024.
- Trang duyệt: `content/.build/images/nao-bo-va-giac-quan/index.html` và `<bài>/review.html`. Mỗi hàng có ba ô: hình đầy đủ, ô lưới 2:1, ô vuông.

**Số hình** (189 chỗ có hình, **0 chỗ trống**)

| Bài | Ảnh nguồn | Tự vẽ | Ghép | Dùng lại |
| --- | --- | --- | --- | --- |
| 1 Não điều khiển cơ thể | 6 | 18 | 0 | 26 |
| 2 Dây thần kinh truyền tin | 5 | 16 | 0 | 26 |
| 3 Giác quan gửi tin về não | 11 | 9 | 1 | 24 |
| 4 Ngủ đủ giấc và đội mũ bảo hiểm | 1 | 20 | 0 | 26 |
| Cộng | 23 | 63 | 1 | 102 |

- **Giấy phép của 23 ảnh nguồn:** CC0 11, Public domain 5, CC BY 2.0 4, CC BY 4.0 2, CC BY 3.0 1.
  - Tất cả lấy từ Wikimedia Commons; `images fetch` đã kiểm lại giấy phép ở nguồn.
  - Không có BY-SA, NC, ND, ảnh AI hay Pinterest. Openverse không gọi.
- **Hình tự vẽ:** vẽ bằng SVG, cùng nét các hình tự vẽ của *Bề mặt Trái Đất*, *Khủng long*, *Hô hấp*: màu chuyển nhẹ, bóng mềm, không viền đen, không nét mặt người.
  - Mắt, tai, lưỡi: da phủ kín khung, cùng tông da với hình mũi `tray_nose` của *Hô hấp*.
  - Bộ não: cùng cỡ, cùng kiểu với tim, dạ dày của *Hô hấp*.
  - Các bạn nhỏ, xe máy, ngõ, mũ: cùng hàm vẽ trẻ em đã dùng ở *Bề mặt Trái Đất*.
- **Dùng lại *Hô hấp*:** 28 chỗ, cộng phần mũi trong hình ghép. Mũi, tim, dạ dày, bạn ngủ trong màn, võng, sân trường, sách, dây nhảy, gối chăn, đường bụi, khẩu trang, mũ, áo mưa đều trỏ thẳng về mục gốc của *Hô hấp*. Lựa chọn w2 bài 4 dùng lại `q3` của *Động đất và sóng thần*.
- **`images fetch content/images/discoverer/nao-bo-va-giac-quan` (lượt cuối):** 4 file chọn ảnh, 24 ảnh khác nhau (23 ảnh nguồn và ảnh `q3` của *Động đất và sóng thần*), 76 hình tự vẽ (tính cả hình *Hô hấp* dùng lại), 1 hình ghép, **0 lỗi**. Hình tự vẽ xử lý trên máy, không gọi mạng. Các lượt tải ảnh trước có 3 lần HTTP 429, lệnh tự chờ Retry-After rồi tải được.

**Câu và kệ đã vẽ lại cả bộ** cho cùng kiểu hình (phương án b)
- **Kệ Chơi bài 1** (9 món): sách, xe đạp, bắt mạch, mồ hôi không có ảnh, nên vẽ cả quạt, mưa vào vũng nước, dây nhảy, đồng hồ, ghép tranh.
  - Ghép tranh vẽ ở ô Học `explore_think`, nên món `tray_puzzle` bài 1, bài 4 và từ `remember` cũng là hình vẽ.
  - Câu q3 bài 1, câu q4 bài 1, w1 bài 2 và từ `heartbeat` dùng lại các hình vẽ này.
- **Câu q3 bài 2** (4 lựa chọn): vẽ gãi cánh tay (`explore_from_brain`, ô Học dùng chung), mưa trên cánh tay, chân chạy. `q3_bite` dùng lại hình vẽ con muỗi `tray_arm` thay cho ảnh `explore_to_brain`. Ô Học `explore_to_brain` vẫn là ảnh.
- **Câu q4 bài 3** (3 lựa chọn): vẽ riêng gối, mèo con, hòn cuội. Ảnh gối (câu q5 bài 1) và ảnh mèo (kệ bài 3) vẫn giữ ở chỗ gốc.
- **Câu q5 bài 3** (3 quả): vẽ táo, chuối, dâu tây.
- **Kệ Chơi bài 4** (9 món): toàn hình vẽ.
  - Đã vẽ từ trước: `explore_helmet`, `tray_handlebar`, `tray_open_strap`; `tray_nap` là võng của *Hô hấp*.
  - Vẽ thêm: `explore_strap` (tay cài khoá quai, dùng cho `tray_strap`, từ `strap`), `explore_sleep` (giường có màn vén, đèn ngủ, dùng cho `tray_bed`, `q3_bed`, từ `bedtime`), `tray_late_games`.
  - `tray_book`, `tray_puzzle` dùng lại hình vẽ của bài 1.
- **Câu q3 bài 4** (4 lựa chọn): nay toàn hình vẽ.
- **Câu q1 bài 4:** vẽ mũ bảo hiểm hồng cỡ trẻ em, nón lá, mũ lưỡi trai. Hình câu hỏi là xe máy đỗ, cũng vẽ.
- **Câu q2 bài 4:** vẽ chuông xe đạp, yên xe, khoá quai đã cài.
- **Câu q5 bài 4:** vẽ đèn bàn sáng lúc đêm, phòng ngủ tối có màn buông, ti vi sáng trong phòng tối. Cả ba cùng là cảnh đêm, thay ảnh tông nâu.
- **Giữ ảnh chụp:**
  - kệ Chơi bài 3 (toàn ảnh);
  - câu q5 bài 1 (gối, mũ vải, mũ bảo hiểm);
  - thẻ từ câu q1 bài 2 (cơm, nước, phong bì);
  - các hình câu hỏi và ô Học còn lại.
  
  Mỗi câu và mỗi kệ nay chỉ có một loại hình. Kệ bài 2 vẫn toàn hình vẽ như quy ước.

**Đề xuất sửa brief hoặc alt** (content-editor quyết; designer không sửa `.md`)

*Nhãn `[ảnh]` → `[hình vẽ]`* (alt giữ nguyên, hình đã vẽ đúng ý brief):
- bài 1: `explore_think`, `tray_book`, `tray_fan`, `tray_bike`, `tray_pulse`, `tray_rain`, `tray_sweat`, `tray_jump`, `tray_clock`;
- bài 2: `explore_from_brain`, `explore_fast`, `q3_rain`, `q3_run`, `q4`;
- bài 3: `explore_send`, `q4`, `q4_stone`, `q5_apple`, `q5_banana`, `q5_strawberry`;
- bài 4: `explore_helmet`, `explore_strap`, `explore_sleep`, `tray_handlebar`, `tray_open_strap`, `tray_late_games`, `q1`, `q1_helmet`, `q1_conical`, `q1_cap`, `q2_bell`, `q2_seat`, `q2_strap`, `q5_study_night`, `q5_sleep`, `q5_tv`, thẻ `helmet_card`.

*Brief "Dùng lại …" đổi chỗ trỏ:*
- bài 2 `q3_bite`: "Dùng lại hình `day-than-kinh-truyen-tin/explore_to_brain`" → "Dùng lại hình `day-than-kinh-truyen-tin/tray_arm`".
- bài 3 `q4_pillow`: "Dùng lại hình `nao-dieu-khien-co-the/q5_pillow`" → "[hình vẽ] Một cái gối trắng, cùng nét hai lựa chọn kia".
- bài 3 `q4_kitten`: "Dùng lại hình `giac-quan-gui-tin-ve-nao/tray_kitten`" → "[hình vẽ] Chú mèo con lông xám nằm cuộn tròn, cùng nét hai lựa chọn kia".
- Các câu "… dùng lại ảnh này" trong brief gốc của `tray_kitten`, `q5_pillow` (bài 1), `explore_to_brain` nên bỏ phần nói câu q4 bài 3 và câu q3 bài 2.

*Sửa chữ cho khớp hình:*

| Bài | Key | Chữ cũ | Chữ mới đề xuất | Lý do |
| --- | --- | --- | --- | --- |
| 3 | `explore_five` (brief) | "xếp thành một hàng ngang trên nền kem trơn" | "xếp thành hai hàng (ba trên, hai dưới) trong ảnh vuông, nền kem trơn" | Ô Học và thẻ từ là ô vuông |
| 3 | `tray_rainbow` (alt) | "A rainbow over a rice field" · "Cầu vồng trên cánh đồng lúa" | "A rainbow over green fields" · "Cầu vồng trên cánh đồng xanh" | Ảnh là ruộng khoai môn ở Hawaii |
| 3 | `tray_rain_roof` (alt; cả w1 bài 4) | "Rain on a metal roof" · "Mưa rơi trên mái tôn" | "Rain on a roof" · "Mưa rơi trên mái nhà" | Không có ảnh mái tôn lượn sóng hợp giấy phép |
| 1 | `q5_helmet` (brief) | "quai đã cài" | bỏ ý này | Ảnh mũ nửa đầu trắng ngà có quai da buông |
| 1 | `w1` (brief) | "chụp ngang cả con" | "chụp cận đầu, mỏ há" | Ảnh gà gáy là ảnh cận đầu |
| 2 | `q6` (alt) | "Bare feet on a pebble path" · "Đôi bàn chân trần trên lối sỏi" | "Children walking barefoot" · "Các bạn nhỏ đi chân trần" | Ảnh: ba bạn đi chân trần trên đường, nhìn từ sau |
| 1 | `tray_jump` (alt) | "Feet jumping over a rope" · "Đôi chân nhảy qua sợi dây" | giữ, hoặc "Feet and a skipping rope" · "Đôi chân và sợi dây nhảy" | Hình vẽ: dây vòng dưới chân, chân vừa chạm đất |

**Còn chưa chắc**
- **Ảnh nhỏ, sẽ hơi mềm trên iPad:** nửa quả chanh (q1 bài 3) 640×615, sạp hoa quả (q5 bài 3) 666×311, chân trần (q6 bài 2) 538×468. Cả ba là hình câu hỏi.
- **Hình vẽ nên xem trên máy:** khuôn người đứng chỉ cao khoảng 50 pt trong ô lưới 2:1. Bạn nhỏ bịt mắt nhìn từ sau trông như giơ tay. Các bộ mới vẽ nhanh hơn bộ cơ quan và giác quan: bắt mạch, gãi tay, cài khoá quai, điện thoại trong tay, giường có màn vén. Nhờ tester xem các hình này.
- **Cần người chuyên môn** xem hình bộ não, tuỷ sống trong xương sống, hộp sọ, dây thần kinh.
- **Ảnh đã cắt:**
  - đã bỏ thẻ mã QR và nhãn có chữ (`q5` bài 3), giấy gói đũa (`explore_taste`), bàn tay đeo găng (`tray_corn`), mặt bạn nhỏ (`explore_move`);
  - tấm biển nhỏ trên cổng ở ảnh ngõ (`q6` bài 4) cũng đã cắt, nhưng nên mở ảnh gốc xem lại.
- **Ảnh nguồn không còn dùng** sau khi vẽ lại cả bộ (mười bốn ảnh, gồm quạt, mưa, dây nhảy, đồng hồ, ghép tranh, táo, dâu, nón lá, mũ lưỡi trai, chuông, yên xe, đèn bàn, phòng ngủ tối, giường có màn) vẫn nằm trong cache `content/.images/`, không vào gói.

## content-editor 10/11 · theo hình

Áp mục "designer 10/11 · hình" vào bốn bài và `_topic.md`. Đối chiếu từng key với bốn file chọn ảnh `content/images/discoverer/nao-bo-va-giac-quan/*.json`:
- 23 brief `[ảnh]` đúng 23 mục ảnh nguồn;
- 64 brief `[hình vẽ]` hoặc `[sơ đồ ghép ảnh]` đúng 63 mục `own` và 1 mục `composed`;
- mọi mục `same_as` là "Dùng lại hình …" trỏ đúng chỗ.

Không đổi dòng `id:` nào; chưa chạy lệnh.

**Đã sửa**
- **Đổi `[ảnh]` → `[hình vẽ]`** đúng danh sách của designer: bài một 9, bài hai 5, bài ba 6, bài bốn 17 (tính cả thẻ `helmet_card`). Cộng hai lựa chọn `q4_pillow`, `q4_kitten` bài ba, trước là "Dùng lại", nay là hình vẽ riêng. Giữ nội dung tả, đổi "chụp" thành "vẽ", "ảnh này" thành "hình này", bỏ câu dự phòng "không có ảnh thì vẽ". Dòng từ khoá giữ như *Hô hấp*. Ba brief thêm chi tiết theo hình designer đã vẽ:
  - trống gỗ sơn đỏ;
  - khăn bịt mắt đỏ;
  - mũ bảo hiểm hồng; giường có màn vén, đèn ngủ.
- **Brief "Dùng lại" đổi chỗ trỏ:**
  - bài hai `q3_bite` dùng lại `day-than-kinh-truyen-tin/tray_arm`, `alt` chép của `tray_arm`;
  - bài ba `q4_pillow`, `q4_kitten` thành `[hình vẽ]` riêng của câu q4;
  - bỏ câu "… dùng lại ảnh này" cũ ở `tray_kitten`, `q5_pillow` (bài một), `explore_to_brain`, `explore_join`.
- **Sửa theo bảng của designer:**
  - `explore_five`: hai hàng trong ảnh vuông;
  - `tray_rainbow`: `alt` "A rainbow over green fields" · "Cầu vồng trên cánh đồng xanh";
  - `tray_rain_roof`: `alt` "Rain on a roof" · "Mưa rơi trên mái nhà"; brief nói mái nhà chung;
  - `q5_helmet` bài một: bỏ "quai đã cài";
  - `w1` bài một: "chụp cận đầu, mỏ há";
  - `q6` bài hai: brief tả mấy bạn đi chân trần nhìn từ sau, `alt` "Children walking barefoot" · "Các bạn nhỏ đi chân trần";
  - `tray_jump`: `alt` "Feet and a skipping rope" · "Đôi chân và sợi dây nhảy".
- **Ghi chú cho hoạ sĩ bốn bài và `_topic.md`:** số hình theo file chọn ảnh (ảnh nguồn 6 · 5 · 11 · 1, tự vẽ 18 · 16 · 9 · 20, ghép 1). Kệ bài một, hai, bốn toàn hình vẽ; kệ bài ba toàn ảnh.

**Chữ trẻ nghe đã đổi** (cần sinh lại clip). Ảnh mưa là mái nhà chung, không phải mái tôn, nên tôi sửa thêm chữ cho khớp hình:
- bài ba, nhãn món `tray_rain_roof`: "Rain on the tin roof" · "Tiếng mưa trên mái tôn" thành "Rain on the roof" · "Tiếng mưa trên mái nhà" (EN và VI);
- bài bốn câu w1: `prompt.vi` và `explanation_correct.vi`, "mái tôn" thành "mái nhà" (chỉ VI; chữ EN vốn là "roof").

Ngoài ba chuỗi đó, chỉ đổi `alt`, `brief` và dòng `>`.
