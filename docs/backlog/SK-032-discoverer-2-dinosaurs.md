# SK-032 · Soạn chủ đề Discoverer #2 "Khủng long và Trái Đất thời xa xưa" (5 bài)

Trạng thái: in_progress · Ngày: 2026-11-09 · Phụ trách: content-editor (soạn), main session chạy lệnh · Tester: tester
Nguồn: Duy 9/11 ("Soạn chủ đề #2"); syllabus.md mục 4 và 8 (pilot); syllabus-lessons.md (5 bài nháp); `content/TEMPLATE.md`; 5 bài *Bề mặt Trái Đất* (SK-031) làm mẫu

## Mục tiêu
Chủ đề thứ hai của pilot có đủ 5 bài chơi được trong app, có tiếng EN và VI.

## Phạm vi
Như SK-031:
- **content-editor:** `_topic.md` cùng kế hoạch 5 bài, rồi soạn 5 bài.
- **main session:**
  - `ids`, `validate`, `import`, `tts` EN/VI, `build`;
  - gắn id vào `content/syllabus.json`;
  - cài lên iPhone.
- **tester:** rà chữ.

## Ngoài phạm vi
- Hình thật: xem SK-033.
- Duyệt chuyên môn cổ sinh vật.

## Tiêu chí nghiệm thu
- [ ] 5 bài theo TEMPLATE, `ai_draft: true`, có `[CẦN KIỂM]` ở chỗ cần chuyên gia.
- [ ] **Hình (Duy 9/11):**
  - mọi câu Khởi động và Quiz có hình ở câu hỏi;
  - mọi lựa chọn (`single_choice`, `multi_choice`) có hình;
  - mọi thẻ từ của `fill_blank_bank` có hình;
  - mọi món ở phần Chơi có hình.
  - `brief` tả một **ảnh chụp thật hoặc hình vẽ gần thực tế**, kèm từ khoá tiếng Anh để tìm ảnh.
- [ ] Rút kinh nghiệm SK-031:
  - đáp án Đúng/Sai đổi qua lại, không theo một kiểu;
  - nhãn nhóm `limit` không làm lộ món bẫy;
  - `messages.full` dùng "Tap one to take it off" · "Chạm vào để bỏ ra";
  - nhãn câu 6 là "Challenge: check Na's idea" · "Thử thách: kiểm tra ý của Na".
- [ ] `validate` 0 lỗi; `build` và `check-pack` OK; iPhone chơi được 5 bài, có tiếng.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở
**Phụ thuộc:** SK-030, SK-031.

**Lưu ý nội dung**
- Người và khủng long chưa bao giờ sống cùng thời: đây là misconception chính.
- Thời gian rất dài ("hàng triệu năm"): dùng so sánh dễ hiểu, số liệu để `[CẦN KIỂM]`.
- Hoá thạch khủng long ở Việt Nam và các nước lân cận: không khẳng định khi chưa chắc, để `[CẦN KIỂM]`.
- Chủ đề này đứng trước *Đá và đất*, nên bài hoá thạch phải tự giới thiệu ý nền. Không dạy tiến hoá; đó là việc của Scientist #14.

**Quyết định đã ghi**
- Duy 9/11:
  - Đổi chỗ bài 3 và bài 4: 3 *Hoá thạch kể chuyện khủng long*, 4 *Khủng long ăn gì, sống ra sao?* (bài vận dụng). Đã sửa danh mục và syllabus-lessons.md.
  - Không nhắc "chim là một nhóm khủng long".
  - Thêm hình cho thẻ từ `fill_blank_bank` (dev sửa schema, ios-dev hiện hình). Trong lúc chờ, chủ đề này không dùng câu điền từ.
  - Pinterest không dùng làm nguồn hình (bản quyền thuộc tác giả gốc), chỉ để tham khảo.

**Câu hỏi còn mở**

## Rà chữ (tester 9/11)

Phạm vi: đọc `_topic.md` và 5 bài (không sửa file nội dung, không chạy `tts`/`build`/`import`). Chuẩn đối chiếu: `content/TEMPLATE.md`, `content/rules.json` (Discoverer), `syllabus-progression.md` mục 6-8, tiêu chí SK-032, quy tắc hình SK-033, các luật riêng trong `_topic.md`. Ngoài đọc tay, chạy 4 script kiểm cấu trúc (không phải test sản phẩm): (1) mỗi câu: format, DOK, số lựa chọn, vị trí đáp án đúng, `answer`, key misconception; (2) mọi `Dùng lại hình <slug>/<key>` trỏ tới key có thật; (3) mọi khối cần hình có `image.brief` + `alt` EN/VI; (4) từ cấm, nhãn `limit`, dấu phẩy ở nhãn nhóm, số từ EN mỗi câu.

**Tổng kết: chặn 0 · nên sửa 7 · nhỏ 12.**

### Đạt (đã kiểm, không có lỗi)
- Quiz 6 câu mỗi bài, DOK 1·1·2·2·2·3 (Discoverer 2·3·1), câu 1 DOK 1, đúng 1 câu misconception (q6) và đúng key; 3 format (`single_choice`, `multi_choice`, `true_false`); `single_choice` 3 lựa chọn, `multi_choice` 4 lựa chọn; Khởi động 2-3 câu.
- Đáp án Đúng/Sai khớp bảng `_topic.md`: 6 Đúng, 6 Sai; q6 là Sai, Đúng, Sai, Sai, Đúng. Không câu Sai nào có `explanation_correct` mở đầu bằng "Yes!"/"Đúng rồi!".
- 0 `Dùng lại hình` trỏ sai key; mọi câu, lựa chọn, món Chơi, ô Học, từ vựng, thẻ thưởng đều có `image.brief` và `alt` EN+VI; mọi `brief` mới có loại hình và từ khoá EN (trừ một ô ghép, xem n11).
- Nhãn `limit` đều dạng "Không/Not/Did not" và không gọi tên món bẫy; nhãn nhóm Học/Chơi không dấu phẩy; `messages.full` và nhãn q6 đúng chữ ticket; không câu EN nào quá 10 từ; không có từ cấm ("T-rex", "khủng long bay/biển", "ăn cỏ", "thiên thạch", "tiến hoá", "tiền sử", "Pangaea", "crater").
- Không câu nào dạy người sống cùng khủng long, không gọi thằn lằn bay/bò sát biển/voi ma mút là khủng long, không nói chim là khủng long (chim chỉ có ở `05` ví dụ "birds" trong ô "Sống sót", đúng quyết định Duy 9/11), không chạm tiến hoá. Không người và khủng long còn sống trong cùng một `brief`.
- Khởi động ôn đúng ý bài trước và giãn cách 1 ngày/1 tuần/1 tháng hợp lý (vd bài 5 w2 ôn bài 1). Tiểu hành tinh nói nhẹ: không lửa, không xác, không cảnh hoảng loạn. `[CẦN KIỂM]` đủ ở các chỗ cần chuyên gia (mốc 66 triệu năm, kích thước, tên gọi, "dấu chân song song = đàn", "xương hoá thành đá", "thiếu thức ăn").

### Lỗi chặn
Không có.

### Nên sửa (7)

**N1. Bài 3 q5: câu hỏi có hai đáp án hợp lý.**
- `03-hoa-thach-ke-chuyen-khung-long.md:575`: "Which bone could become a fossil one day?" · "Khúc xương nào sau này có thể thành hoá thạch?"
- Đáp án đúng "in river mud"; lựa chọn sai "on dry grass" (dòng 589). Chữ "could"/"có thể" không loại được "on dry grass": xương trên cỏ bị lũ hay đất phủ lên cũng có thể thành hoá thạch (chính ghi chú dòng 587 thừa nhận "dễ thành hơn", không phải "chỉ có").
- Đề xuất: "Which bone is most likely to become a fossil?" · "Khúc xương nào dễ thành hoá thạch nhất?" và sửa `explanation_*` theo (nhấn "bùn phủ kín sớm").

**N2. Gợi ý (`hint`) nói thẳng đáp án, trái luật "gợi ý chỉ cách nghĩ" (SK-031 N5, `_topic.md` mục "Khi soạn năm bài").**
Trích:
- `02-khung-long-la-gi.md:103`: "Thời khủng long đã có ruộng lúa chưa?" (câu Sai; hình câu hỏi là ruộng lúa nên gần như đã trả lời).
- `02-khung-long-la-gi.md:454` (q2): "Chân của nó dùng để đi, để bơi hay để bay?" (ba lựa chọn của câu là trên cạn/dưới biển/trên trời).
- `03:99` (w2): "Khủng long nào cũng khổng lồ sao? Em nhớ lại có rất nhiều loài nhé."
- `03:52` (w1): "Khủng long là bò sát sống trên cạn. Em nhìn chân của từng con nhé." (nhắc đúng tiêu chí của đáp án "đi bằng những đôi chân khoẻ").
- `04:101` (w2) và `05:134` (w3): "Tất cả đều là xương sao?"
- `01:625` (q6): "Phim hoạt hình là chuyện tưởng tượng." (đã là lời giải).
- `01:106` (w2): vỏ trứng nứt; biên tập đã ghi nhận.
- Đề xuất: câu `true_false` chỉ có 2 lựa chọn nên hint chỉ cần chỉ về chỗ cần nhớ ("Em nhớ lại ô Học về hoá thạch"), không nêu ý trả lời. Bài 3 w1 bỏ vế "bò sát sống trên cạn".

**N3. Bài 4 q2: đáp án đúng lộ bằng hình thức (số ít/số nhiều và kiểu hình).**
- `04-khung-long-an-gi-song-ra-sao.md:458`: nhãn đúng "sharp, curved tooth" số ít, hai nhãn sai là "flat teeth", "pencil-like teeth" số nhiều.
- Hình đúng là một chiếc răng rời trên nền trơn (`tray_sharp_tooth`); hai hình sai là hàm/hộp sọ có nhiều răng (`tray_flat_teeth`, nửa `explore_plants`). Bé chọn "cái khác hẳn" mà không cần nhìn răng.
- Đề xuất: ba lựa chọn cùng kiểu (cả ba là hàm răng, hoặc cả ba là một chiếc răng), nhãn cùng số ("sharp, curved teeth").

**N4. Bài 3 và bài 4: bẫy "dấu chân trên cát ướt" dễ gây hiểu sai.**
- `03:344` và `04:72`: lựa chọn sai là dấu chân chim ba ngón trên cát ướt, đặt cạnh dấu chân khủng long ba ngón trên đá. Hai hình giống nhau, trẻ tò mò sẽ hỏi "chim giống khủng long à?", ngược ý Duy 9/11 (không nhắc chim là khủng long). Chọn hình dấu chân con chó, con trâu hoặc dép thì vẫn là bẫy tốt mà không gợi liên hệ.
- `03:275` `has_limited`: "That is not a fossil" · "Thứ này không phải hoá thạch" không nói vì sao, trong khi bài vừa dạy "dấu chân cũng có thể thành hoá thạch" (và bài 4 w2, bài 5 w3 nhắc lại). Đề xuất: "It has not turned to rock." · "Thứ này chưa hoá thành đá."

**N5. Bài 5 Chơi: món bẫy "People run away".**
- `05-vi-sao-khung-long-bien-mat.md:379`: "People run away" · "Con người chạy trốn" với hình bóng người chạy. Mâu thuẫn mục tiêu "nhẹ nhàng, không gây sợ", và hình vẫn gợi ý người có mặt lúc đó. `_topic.md` mục "Còn mở" 3 đã đề xuất thay.
- Đề xuất: nhận phương án "People watch the sky" · "Con người ngước nhìn bầu trời" (hình người nhìn trời, ngày nay), hoặc chọn món bẫy khác không có người, ví dụ "Dinosaurs find lots of food" · "Khủng long có thật nhiều thức ăn".

**N6. Bài 5 q5: lựa chọn sai quá yếu.**
- `05:603` "dinosaur toys" · "khủng long đồ chơi" (hình lấy lại `q6` bài 1). Không bé nào nghĩ nhà khoa học biết nhờ đồ chơi, nên câu thành 2 lựa chọn. "Old photos" (`05:595`) là bẫy tốt vì nối với `dinosaur_pictures_are_photos`.
- Đề xuất: đổi thành lựa chọn có sức hút hơn, ví dụ "someone told us" · "có người kể lại" hoặc "old books" · "sách cũ", có hình cụ thể.

**N7. `alt` của bài 3 q4 không theo luật câu phân loại như `_topic.md` khẳng định.**
- `_topic.md` (mục "Khi soạn năm bài", Ba luật chữ) ghi "Đã áp ... bài ba q4 (`alt`)". Thực tế: `03:544` "Hộp sọ khủng long ba sừng trong đá", `03:551` "Mô hình khủng long cổ dài" (EN "A model of a long-necked dinosaur"), `03:568` "Trứng khủng long trong đá". Cả ba tên vật, không tả đặc điểm; riêng "Trứng gà trong rổ" không có chữ "khủng long" nên VoiceOver/phụ đề cho thấy khác biệt.
- Câu hỏi là "hoá thạch khủng long", nên nhãn không có "hoá thạch" là đủ; nhưng `alt` cần đồng đều. Đề xuất: "A skull with horns, partly in rock", "A model of an animal with a long neck", "Round eggs in rock", "Hen's eggs in a basket"; hoặc sửa lại ghi chú trong `_topic.md` cho khớp.

### Nhỏ (12)
- **n1. Vị trí đáp án có chu kỳ, đoán được.** Bài 2: 3-1-2-3-1-2 (`w1,w3,q1,q2,q4,q5`). Bài 5: 2-3-1-2-3 (`w1,q1,q2,q4,q5`). Bài 1-4: w1 đều là lựa chọn thứ ba (4/4). Tổng chủ đề cân (thứ 1: 9, thứ 2: 8, thứ 3: 10), nhưng trong bài nên xáo lại.
- **n2.** `01:89`/`01:82`: lựa chọn đúng w1 là "mô hình" còn hai lựa chọn sai là ảnh con vật thật, nên chữ "mô hình" trong `alt` và hình đã lộ (biên tập đã ghi nhận). Có thể để ba hình cùng loại (tranh phục dựng cả ba, tranh voi và trâu cùng nền kem).
- **n3.** `01:540`, `01:548`, `01:556`: ba lựa chọn q4 trỏ `q4`, mà `q4` (dòng 524) lại là "Dùng lại `explore_people`". Luật `_topic.md` mục ba: luôn trỏ về hình gốc, không trỏ qua hình dùng lại khác.
- **n4.** `03:521`: VI "Cái nào là hoá thạch khủng long?" cho câu nhiều đáp án; các câu `multi_choice` khác dùng "Những loài nào/Những con nào". Đề xuất "Những cái nào là hoá thạch khủng long?".
- **n5.** `02:615` nhãn "a long crest on its head" · "có mào dài trên đầu": đặc điểm mào không có trong phần Học bài 2; bé chỉ làm được bằng loại trừ (hợp lý với DOK 2, nhưng nên có `[CẦN KIỂM]` hoặc thêm vào ví dụ ô "Nhiều loài").
- **n6.** `01:59`: "Khủng long ba sừng là một loài khủng long có ba cái sừng." lặp tên trong định nghĩa; đề xuất "Khủng long ba sừng đi bằng bốn chân, có ba cái sừng trên đầu."
- **n7.** `05:226`: "Some animals lived on, and they are still here." đọc như chính những con vật đó còn sống tới nay; thẻ thưởng lại dùng "relatives" cho đúng. Đề xuất "Some kinds of animals lived on. They are still here today." · "Một số loài đã sống sót. Ngày nay vẫn còn."
- **n8.** `02:271` (Chơi bài 2, "Great! There were many kinds of dinosaurs."): bé có thể xếp cùng khay khủng long bạo chúa với khủng long phiến sừng, ngược thẻ thưởng bài 1 "They never met." Đề xuất thêm vào `balanced`: "They did not all live at the same time." · "Các loài này không sống cùng một lúc."
- **n9.** `04:529` và `04:531`: "Many footprints going one way show a herd." → dùng "suggest"/"cho biết có thể" (đã có `[CẦN KIỂM]` dòng 534 nhưng chữ cho trẻ nói chắc hơn ghi chú).
- **n10.** `04:394` và `04:410`: hình câu hỏi q1 là trứng hoá thạch, hình lựa chọn đúng "nest" cũng là hoá thạch (`tray_rock_nest`), còn hai lựa chọn sai là ảnh trứng ếch, trứng bướm hiện nay. Bé chọn hình "giống hình trên". Đề xuất đổi hình câu hỏi sang ảnh khác (vd quả dừa dùng cho thẻ, hoặc hình trung tính).
- **n11.** `03:193` (`explore_tracks`): `brief` ghép ảnh không có "Từ khoá tìm ảnh (EN)"; đúng luật vì chỉ dùng lại, nhưng cảnh báo `images search` có thể kêu. Ghi kèm "(không cần từ khoá)".
- **n12.** `04-khung-long-an-gi-song-ra-sao.md:116` (w3). Khởi động bài 4 ôn "thằn lằn bay sống cùng thời khủng long", mà ở bài 2 ý này chỉ nằm ở q6 (lời Na), thẻ thưởng và `alt`/ví dụ, không có câu riêng ở ô Học (`explore_not_dinosaurs` nói "không phải khủng long"). Nên thêm ý "sống cùng thời" vào ví dụ ô Học bài 2 để câu ôn bám vào bài.

### Chưa kiểm
- Hình thật (chưa có ảnh; mới đọc `brief`), giọng đọc EN/VI của "T. rex", "Jura", "palaeontologist", và hiển thị trên máy (dòng điều kiện Chơi, giới hạn từ trên màn).
- Cách gọi tiếng Việt (khủng long phiến sừng, đuôi chuỳ, mào dài) cần chuyên gia, vẫn `[CẦN KIỂM]`.

## Sửa theo rà chữ (content-editor 9/11)

Phạm vi: chỉ sửa trong `content/discoverer/khung-long/`. Không đổi slug, không đổi hay xoá dòng `id:`; không thêm khối có `id:` (lựa chọn và món Chơi không có dòng `id:`). Mỗi chỗ sửa có ghi chú `> Rà chữ tester 9/11 (mã lỗi)` ngay trong bài. Biên tập không chạy được lệnh: chưa chạy `validate`.

**Tổng kết:** sửa đủ 7 lỗi nên sửa; lỗi nhỏ sửa 11/12 (n2 giữ, có lý do); thêm `explore_tracks` một ảnh. Đổi hai key: `05` `tray_people` thành `tray_lots_food`, `05` `q5_toys` thành `q5_books`; đã sửa mọi tham chiếu (`_topic.md` bảng hình dùng chung, ghi chú hoạ sĩ bài một và bài năm).

### Nên sửa (7/7)
- **N1, `03` q5.** "Which bone is most likely to become a fossil?" · "Khúc xương nào dễ thành hoá thạch nhất?". Giải thích khi đúng: "Yes! Mud covers this bone quickly and keeps it safe." · "Đúng rồi! Bùn sớm phủ kín khúc xương này và che chở cho nó."; khi sai: "The answer is the bone in river mud. Mud covers it quickly." · "Đáp án là khúc xương trong bùn ở lòng sông. Bùn sớm phủ kín nó."
- **N2, gợi ý lộ đáp án.** Gợi ý mới chỉ chỗ cần nhớ hoặc cách nghĩ:
  - `02` w2: "Remember the plants and animals of dinosaur times." · "Em nhớ lại cây cối và con vật của thời khủng long nhé."
  - `02` q2: "Think of the animals that were not dinosaurs." · "Em nhớ lại những con vật không phải khủng long nhé." (bé tự loại trừ trời, biển)
  - `03` w1: "Look at each one. How did it move around?" · "Em nhìn từng con nhé. Con đó di chuyển bằng cách nào?" (bỏ vế "bò sát sống trên cạn")
  - `03` w2: "Remember the three dinosaurs you found last lesson." · "Em nhớ lại ba con khủng long em đã tìm ở bài trước nhé."
  - `04` w2: "Remember the fossil game in the last lesson." · "Em nhớ lại trò tìm hoá thạch ở bài trước nhé."
  - `05` w3: "Remember the fossil game. What kinds did you find?" · "Em nhớ lại trò tìm hoá thạch. Em đã tìm những loại nào?"
  - `01` q6: "Look at the timeline. Where are dinosaurs and people?" · "Em nhìn lại trục thời gian. Khủng long và con người nằm ở đâu?" (bỏ "Phim hoạt hình là chuyện tưởng tượng")
  - `01` w2 (vỏ trứng nứt): **giữ**, như ghi chú cũ của bài: bé chưa học *Bề mặt Trái Đất* vẫn phải làm được (`prerequisites: []`). Gợi ý là một phép so sánh, không nói "câu này đúng".
- **N3, `04` q2.** Ba lựa chọn cùng một kiểu: ảnh hoá thạch cắt cận một đoạn hàm có nhiều răng, khung vuông, không nhãn chữ.
  - `q2_sharp`: nhãn "sharp, curved teeth"; hình dùng lại `explore_meat`, cắt cận đoạn hàm có răng; `alt` "A fossil jaw with sharp, curved teeth" · "Hàm hoá thạch có răng nhọn và cong".
  - `q2_flat`, `q2_pencil`: cắt cùng khung; `alt` của `q2_pencil` thành "A fossil jaw with pencil-like teeth" · "Hàm hoá thạch có răng như bút chì".
  - Giải thích khi sai: "The answer is the sharp, curved teeth. …" · "Đáp án là răng nhọn và cong. …".
  - Món Chơi `tray_sharp_tooth` (một chiếc răng) giữ nguyên: ở kệ nó là món bẫy, không phải một trong ba đáp án, và từ `clue` dùng ảnh này ("This sharp tooth…"). Bảng Tên gọi ở `_topic.md` thêm dạng số nhiều.
- **N4, bẫy dấu chân.**
  - `03` `tray_sand_prints`: `brief` đổi sang dấu chân con chó trên cát ướt, cùng góc chụp với `tray_rock_print`; `alt` "Dog footprints in wet sand" · "Dấu chân chó trên cát ướt". Nhãn món giữ ("Footprints in wet sand"). Chọn chó, không chọn trâu: dấu chân trâu nằm trên bùn, mà bài dạy dấu chân trên bùn chính là bước đầu của hoá thạch, dễ rối.
  - `04` w1_sand: `alt` đổi theo.
  - `03` `has_limited`: "It has not turned to rock. Tap it to take it off." · "Thứ này chưa hoá thành đá. Em chạm vào để bỏ ra nhé." Câu đúng cho cả ba món bẫy.
- **N5, `05` món bẫy con người.** Chọn món không có người: `tray_lots_food` "Dinosaurs have lots of food" · "Khủng long có thật nhiều thức ăn". Hình dùng lại hình câu q1 (khủng long ba sừng gặm dương xỉ xanh, trời trong), thành cặp trước và sau với món `tray_plant_eater`. Không chọn "People watch the sky": món có người, vẽ thế nào cũng đặt con người vào lúc khối đá đâm xuống. Món mới đối với nhóm "Khủng long" như hai món bẫy kia đối với nhóm của mình. `people_with_dinosaurs` vẫn được nhắc ở w2 và q5 bài năm. `_topic.md` mục "Còn mở" ghi để Duy xem lại.
- **N6, `05` q5.** `q5_books` "old books" · "sách cổ", ảnh mới: chồng sách cổ trên bàn gỗ, cùng khung với xấp ảnh cũ, không đọc được chữ. Hai lựa chọn sai đều là thứ con người ghi lại, nên sai vì thời đó chưa có con người (giải thích khi sai đã nói "No people lived then."). Không chọn "someone told us", vì khó có hình không thấy mặt người. Số ảnh nguồn bài năm vẫn hai mươi sáu (bỏ ảnh bóng người chạy, thêm ảnh sách).
- **N7, `03` q4.** Sửa `alt`, không sửa ghi chú `_topic.md`, vì luật câu phân loại có lý do (phụ đề không lộ đáp án) và các bài khác đã theo: "A skull with horns, partly in rock" · "Hộp sọ có sừng, một phần còn trong đá"; "A model of an animal with a long neck" · "Mô hình một con vật cổ dài"; "Round eggs in rock" · "Những quả trứng tròn trong đá". "Hen's eggs in a basket" giữ.

### Nhỏ (11/12 sửa)
- **n1, vị trí đáp án** (xáo tay, chỉ đổi thứ tự `#### option`):

  | Bài | Câu một đáp án, theo thứ tự trong bài | Nhiều đáp án |
  | --- | --- | --- |
  | 1 | w1 2 (cũ 3), q1 2, q2 1, q4 3, q5 1 | q3: 2, 4 |
  | 2 | w1 1, w3 3, q1 3, q2 2, q4 1, q5 2 | q3: 1, 3 |
  | 3 | w1 2, w3 1, q1 1, q2 3, q3 2, q5 3 | q4: 1, 4 |
  | 4 | w1 2, q1 3, q2 1, q3 1, q4 2 | q5: 1, 3, 4 |
  | 5 | w1 3, q1 1, q2 2, q4 1, q5 3 | q3: 2, 3 (cũ 1, 3, trùng bài hai) |

  Tổng câu một đáp án: thứ nhất 10, thứ hai 9, thứ ba 8. Câu w1 năm bài: 2, 1, 2, 2, 3. Bài một q4 giữ đáp án thứ ba vì ba lựa chọn xếp theo thứ tự thời gian. Ghi chú cho dev của từng bài đã cập nhật.
- **n2, `01` w1 (chữ "mô hình" gợi ý):** **giữ.** Đổi voi và trâu sang tranh trái Quy ước hình mục hai (con vật ngày nay là ảnh thật); `alt` mô hình phải nói "model" (mục năm). Câu DOK một, ôn kiến thức nền. Đã ghi lý do trong bài.
- **n3, `01` q4:** ba lựa chọn trỏ thẳng về `trai-dat-rat-lau-ve-truoc/explore_people` ("…, bỏ hình voi ma mút và ảnh cánh diều như hình câu q4, thêm một chấm…").
- **n4, `03` q4:** "Những thứ nào là hoá thạch khủng long?" (chọn "thứ" cho xuôi hơn "cái").
- **n5, `02` q5 (mào):** không thêm "mào" vào phần Học. Câu này cố ý hỏi con vật bé chưa gặp, để bé xét "bò sát, sống trên cạn"; thêm vào phần Học thì bé chọn theo trí nhớ. Đã thêm ghi chú và `[CẦN KIỂM]` tên "mào".
- **n6, `01` w1 và từ `dinosaur`:** "Yes! Triceratops was a dinosaur. It walked on four legs." · "Đúng rồi! Khủng long ba sừng là một loài khủng long. Nó đi bằng bốn chân." Không dùng đúng câu tester đề xuất, vì bản VI đó bỏ ý "là khủng long" mà bản EN vẫn có. Câu ví dụ của từ `dinosaur` đổi cùng.
- **n7, `05` ô "Sống sót":** "Some kinds of animals lived on and still live today." · "Một số loài vật đã sống sót, và ngày nay vẫn còn." (mười từ).
- **n8, `02` Chơi:** `balanced` "Great! Many kinds of dinosaurs lived at different times." · "Tuyệt! Có rất nhiều loài khủng long, sống vào những thời khác nhau." Câu nói chung, không nói ba con bé vừa chọn khác thời, vì có cách xếp đạt mà cả ba cùng kỷ Jura.
- **n9, `04` q4:** giải thích khi đúng "Yes! Many footprints going one way are clues to a herd." · "Đúng rồi! Nhiều dấu chân đi cùng một hướng là manh mối cho biết có cả một đàn." (dùng từ `clue` của bài thay "suggest"); khi sai "The answer is a herd walking together." · "Đáp án là cả đàn đi cùng nhau."
- **n10, `04` q1:** hình câu hỏi dùng lại hình từ `hatch` (mô hình khủng long con đang nở), cắt không thấy tổ; `alt` "A model of a baby dinosaur hatching" · "Mô hình khủng long con đang nở". Không chọn quả dừa: không liên quan câu hỏi. `tray_rock_egg` nay chỉ còn dùng cho thẻ thưởng bài bốn.
- **n11, `03` `explore_tracks` (và SK-033 dòng 394):** một ảnh, không ghép: "Dùng lại hình `hoa-thach-ke-chuyen-khung-long/tray_rock_trackway`; designer thêm nhãn chữ…"; `alt` "A line of fossil footprints in rock" · "Đường dấu chân hoá thạch trên đá". Chọn dấu chân, không chọn ổ trứng: dấu chân là loại hoá thạch khó tin nhất với trẻ và được hỏi lại ở `04` w2, `05` w3; trứng vẫn có trong câu và ví dụ của ô, có hai món ở kệ Chơi, và có ô Học riêng với ảnh ổ trứng ở bài bốn. Không tách thành hai ô vì bài đã có bốn ô.
- **n12, `02` ô "Không phải khủng long":** thêm ví dụ "both lived in dinosaur times" · "cả hai sống cùng thời khủng long" (bốn ví dụ, đúng mức tối đa).

### `_topic.md`
- Sửa theo năm bài: ghi chú `people_with_dinosaurs`, `fossil_is_old_bone`; bảng kế hoạch (bài hai, ba, năm); bảng Tên gọi (răng nhọn và cong số nhiều); bảng hình dùng chung (bỏ hàng `trai-dat-rat-lau-ve-truoc/q6`; `tray_sand_prints` là dấu chân chó; `tray_rock_egg` bỏ câu q1 bài bốn; `tray_rock_nest` bỏ `explore_tracks`); số hình ghép còn khoảng mười một; mục "Còn mở" 3.
- Thêm mục "Rút kinh nghiệm rà chữ SK-032" trong "Khi soạn năm bài".

### Còn chưa chắc
- **Hình ghép khác.** SK-033 nói một `image` chỉ có một ảnh. Ngoài `explore_tracks`, chủ đề còn khoảng mười một `brief` "[sơ đồ ghép ảnh]" do designer dựng từ nhiều ảnh (`01` `explore_dinosaurs`, `explore_people`, bốn sơ đồ q4; `02` `explore_kinds`, `explore_reptiles`; `03` `explore_pictures`; `04` `explore_plants`, thẻ `long_neck_egg`). Các `brief` này có từ khoá cho phần ảnh mới, nên `images search` sẽ coi là một ảnh thường. Cần dev hoặc designer chốt đường đưa hình ghép vào gói. Lần này biên tập chưa sửa các hình đó.
- **"Old books" · "sách cổ"** (`05` q5): một bé biết nhà khoa học đọc sách có thể cho là đúng. Câu hỏi đã nói "No one saw the space rock hit", và giải thích khi sai nói "No people lived then"; tester xem lại có còn hai đáp án hợp lý không.
- **`04` q2_sharp** cắt từ hộp sọ khủng long bạo chúa của ô Học, trong khi gợi ý nói "Remember the T. rex skull". Bản cắt chỉ thấy đoạn hàm, nhưng bé vẫn có thể nhận ra hình. Câu DOK một, gợi ý chỉ hiện sau lần sai đầu, nên biên tập chấp nhận.
- **Kệ Chơi `04`:** hai món răng là hàm, món bẫy là một chiếc răng rời, vẫn lệch kiểu như q2 cũ. Ở kệ ít hại hơn (món bẫy không phải đáp án duy nhất); nếu tester muốn đồng nhất thì đổi `tray_sharp_tooth` sang hàm và tìm ảnh riêng cho từ `clue`.
- **`05` `tray_lots_food`** dùng cùng con khủng long ba sừng, cùng góc với `tray_plant_eater`, chỉ khác màu cây và trời. Cần designer xem hai hình đặt cạnh nhau trên kệ có phân biệt rõ không.

### Việc cho phiên chính
- Chạy `validate` (biên tập chưa chạy được). Chú ý hai key đổi (`tray_lots_food`, `q5_books`) khi `import`: khối cũ `tray_people`, `q5_toys` sẽ mất.
- Chạy lại `tts` EN/VI cho các chuỗi đã đổi (gợi ý, giải thích, lời nhắn, nhãn, câu Học, câu ví dụ, `alt`), rồi `build`. Không cần `ids`: không có khối mới mang dòng `id:`.
- `images search` cho hai ảnh mới: `05` `q5_books`, và `brief` mới của `03` `tray_sand_prints` (dấu chân chó). Ảnh bóng người chạy (`05` `tray_people`) không cần tìm nữa.

## Kết quả chạy lệnh (main session 10/11)
- `ids`, `validate content`: 0 lỗi; chủ đề không còn cảnh báo về hình. `content/syllabus.json` gắn `topic_id` và 5 `lesson_id` cho `new-dinosaurs`, `level: 4`.
- **TTS:**
  - EN: 531 clip mới.
  - VI: 525 clip mới; tự kiểm còn đánh dấu 31 clip, chờ Duy nghe.
  - Thời gian chạy kéo dài (EN khoảng 2 giờ, VI khoảng 8 giờ) vì máy chạy qua đêm.
- **Gói:** 3 chủ đề, 12 bài; `check-pack.sh` OK.
- **iOS unit test:** 299/299 qua.
- **Máy thật:** bản Release đã cài lên iPhone Luu. Chủ đề này chưa có ảnh thật; tìm ảnh làm theo SK-033.
