# SK-045 · Soạn chủ đề Explorer #3 Chuỗi thức ăn (4 bài)

Trạng thái: review · Ngày: 2026-11-14 · Phụ trách: content-editor · Tester: tester
Nguồn: `docs/oak/introduction-to-food-chains.md`, `content/syllabus.json` (`introduction-to-food-chains`, Explorer #3), `content/TEMPLATE.md` (bảy luật Explorer, mục "Phản hồi sau mỗi lần chọn (SK-044)"), `content/rules.json` (`explorer.authoring`), SK-026, SK-033, SK-043, SK-044, rút kinh nghiệm SK-041

## Mục tiêu
Bé 5–7 tuổi học chuỗi thức ăn qua bốn bài: cách con vật kiếm ăn, chuỗi và mũi tên, vai của từng mắt xích, so sánh hai chuỗi.

## Phạm vi
`content/explorer/chuoi-thuc-an/_topic.md` và bốn bài `01`–`04`. Ngoài phạm vi: ảnh thật, TTS, build gói, màn app.

## Rà chữ (tester 14/11)

Phạm vi: đọc `_topic.md` và bốn bài của `content/explorer/chuoi-thuc-an/`; đối chiếu `docs/oak/introduction-to-food-chains.md`, `content/TEMPLATE.md` (bảy luật Explorer, bảng luật theo nhóm tuổi, mục SK-044), `content/rules.json` (`explorer.authoring`), `content/syllabus.json`, `syllabus-progression.md` mục 5.1, bảng tỉ lệ khung của SK-043, và tám bài `content/explorer/goi-ten-va-nhom-dong-vat/` cùng các bài Discoverer mà chủ đề này mượn hình. Không sửa file nội dung, không chạy lệnh nội dung, không dùng simulator. `validate` do phiên chính chạy (0 lỗi, một cảnh báo `age_words_en` ở `objective.en` bài 3 — "I can tell each role in a food chain.", chín từ), tester không chạy lại.

Ngoài đọc tay, chạy bảy script kiểm cấu trúc trong scratchpad (không phải test sản phẩm, để ở `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk045/`, dùng lại bộ SK-041, chạy `python3 -I`): `check_struct.py` (format, DOK, số lựa chọn, vị trí đáp án, key misconception), `check_text.py` (số từ EN, dấu tiếng Việt trong `.en`, chữ số và ký hiệu trong `.vi`, `messages.full`, dấu phẩy ở nhãn), `check_img.py` (thiếu `brief`/`alt`, key "Dùng lại hình" có thật, `alt` và từ khoá chép đúng gốc), `check_tf.py` (luật `true_false` Explorer), `check_reuse2.py` (bản đồ hình gốc và chỗ dùng lại), `check_fb.py` (luật SK-044: số câu, số từ, `feedback` có gọi tên đáp án không, `explanation_correct` có thêm ý không), `check_misc.py` + `check_more.py` (vị trí đáp án, từ vựng, màu nhóm, kệ Chơi, `recall_from`, tên ô Học mà `hint` nhắc tới). Chạy thêm `check_fb1.py` trên chủ đề số một để so nếp.

**Tổng kết: chặn 0 · nên sửa 5 · nhỏ 12.**

### Đạt (đã kiểm bằng máy, không có lỗi)

- Bốn bài, mỗi bài quiz sáu câu, DOK 1·1·1·2·2·2 (Explorer 3·3·0), câu một DOK 1, đúng một câu misconception mỗi bài ở q6. Bốn key misconception đều có thật trong `_topic.md`, mỗi key dùng đúng một lần, không key nào gắn ở Khởi động.
- `single_choice` hai hoặc ba lựa chọn (mười sáu câu), `order_sequence` đúng ba thẻ (ba câu), không bài nào dùng format ngoài `explorer.quiz_formats`. Bài 1 hai format, bài 2–4 ba format (≥ `min_formats` 2). Khởi động hai hoặc ba câu, DOK 1, câu nào cũng có `recall_from`; mười một bài được trỏ tới đều có thật và đã có `id`.
- **Vị trí đáp án khớp đúng từng ô bảng "Vị trí đáp án đúng"** (`_topic.md:248-253`). Đếm máy mười sáu câu một đáp án: chỗ thứ nhất sáu, thứ hai năm, thứ ba năm — đúng con số biên tập ghi ở `_topic.md:255`.
- **Ba câu `order_sequence` chỉ có một thứ tự đúng** (lá cải → sâu → chim sẻ; lúa → châu chấu → ếch; lúa → châu chấu → gà mái), và không thẻ nào nằm sẵn đúng chỗ trong file (không thẻ nào trùng vị trí đáp án). Xem thêm N3: chuỗi bài 4 có đường nghĩ sai hợp lý.
- Đúng/Sai khớp bảng `_topic.md:223-240`: mười sáu câu, chín Đúng, bảy Sai, bài nào cũng có cả hai. **Không câu `true_false` nào dùng câu phủ định** (luật Explorer số 5), không câu nào có `labels`, câu nào cũng có `image` cấp câu. Không câu đáp án Sai nào có `explanation_correct` mở đầu "Yes!" · "Đúng rồi!"; mọi `explanation_wrong` đúng khuôn "This is false." · "Câu này sai." và "This is true." · "Câu này đúng.".
- **SK-044 phủ đủ:** hai mươi tám lựa chọn sai (bảy mỗi bài) đều có `feedback`; không `feedback` nào nằm trên lựa chọn đúng; mười sáu câu `true_false` đều có đúng một dòng `feedback_*` ở phía bé chọn nhầm, không câu nào viết nhầm phía.
- **Không chỗ nào thiếu hình:** mọi lựa chọn, mọi thẻ `order_sequence`, mọi món kệ Chơi, mọi câu Khởi động và Quiz, mọi ô Học, từ vựng và thẻ thưởng đều đủ `image.brief` + `alt.en` + `alt.vi`.
- **134 chỗ "Dùng lại hình": không chỗ nào sai.** Mọi key có thật (gồm hình của hai chủ đề Discoverer và chủ đề Explorer số một), không chỗ nào trỏ qua một hình dùng lại khác, từ khoá tìm ảnh chép đúng từng chữ. Mười chỗ ảnh trâu đổi `alt` thành "A water buffalo" · "Con trâu" — đúng như `_topic.md:204` ghi trước, không phải lỗi.
- **Bảng "Hình dùng chung" (`_topic.md:186-216`) đúng hết**, đối chiếu máy từng chỗ dùng lại. Đếm máy mười hai ảnh mới (bài 1 ba, bài 2 năm, bài 3 ba, bài 4 một) và sáu hình ghép (bài 2 ba, bài 3 một, bài 4 hai) — khớp `_topic.md:317`. Bảng chỉ liệt kê hình dùng từ hai chỗ trở lên, và làm đúng như vậy (sửa được điều n14 của SK-041).
- Số từ EN: **không câu nào quá tám từ** (đếm theo câu, như `age_words_en`), kể cả `hint`, `explanation`, `feedback`, `examples`, `fact`, `messages`. Chuỗi `.en` không có dấu tiếng Việt; chuỗi `.vi` không có chữ số, ký hiệu, dấu "—". `messages.full` đúng chữ chung ở cả bốn bài; không nhãn nhóm nào có dấu phẩy.
- Kệ Chơi khớp bảng `_topic.md:271-276`: bốn kệ, mỗi kệ ba chỗ, bảy món, ba nhóm `required` cộng một nhóm `limit`; `do_son` chỉ dùng cho nhóm `limit` và nhóm `limit` nào cũng `do_son`. Mỗi món bẫy giống một nhóm bắt buộc.
- Từ vựng: bốn từ mỗi bài, `core` 3·2·2·3 (Explorer 2–3), `term_keys` khớp đúng danh sách `core` của từng bài.
- `content/syllabus.json`: `topic_id` và bốn `lesson_id` khớp bốn file; bốn bài khớp 1:1 bốn lesson Oak đúng thứ tự; tên bài 3 trong danh mục **đã là tên mới** "Roles in a food chain" · "Mỗi loài một vai trong chuỗi thức ăn" (xem n4). `difficulty` 2-3-2-2-2 = mười một điểm, `level: 3`, `strand: living_environment` — khớp `syllabus-progression.md:122`.
- **Mũi tên đọc đúng.** Không chỗ nào trong chữ cho bé đọc mũi tên là "ăn". Ô Học "The arrow" và mọi ví dụ của ô "Food chain" dùng "is food for" · "là thức ăn của"; ý chính 3 bài 2 nói chiều mũi tên. Ba chỗ dùng động từ "eat" cạnh một hình chuỗi (bài 3 ô "Cuối chuỗi", bài 3 q6 `explanation_wrong`, bài 4 q6 `prompt`) đều đặt **con ăn đứng trước** trong câu, ngược thứ tự ảnh, nên không dạy bé ánh xạ mũi tên sang chữ "ăn".
- **Chuỗi đúng khoa học và quen với trẻ Việt:** cỏ → châu chấu → ếch; lá cải → sâu → chim sẻ; lúa → chuột → cú; lúa → châu chấu → ếch; lúa → châu chấu → gà; lúa → chuột → mèo. Chuỗi nào cũng bắt đầu từ cây, ba mắt xích, có thật ở đồng ruộng và vườn nhà Việt Nam; không chuỗi nào có thú cưng bị ăn; mèo và cú chỉ đứng cuối. Hai chỗ `[CẦN KIỂM]` của sườn Oak (rong biển/sao biển/rái cá/cá mập; lá/bọ rùa/nhện) đều không dùng.
- **Không cảnh săn mồi gây sợ:** không con mồi trong mỏ hay móng, không máu, không xác, không bẫy chuột, không chuột chết — mọi `brief` ghi rõ điều cấm. Chữ chỉ dùng "săn", "bắt", "ăn", không dùng "giết" (sườn Oak định nghĩa `hunt` có chữ "giết"; app bỏ đúng chỗ đó). Thẻ thưởng bài 3 là chính con chuột, ảnh chuột sống, sạch, ngoài đồng.
- **Giãn cách Khởi động:** bài nào cũng có ít nhất một câu ôn chủ đề số một (mốc dài), cộng câu ôn bài ngay trước (mốc ngắn) — đúng đề xuất n15 của SK-041. Bài 1 chỉ ôn chủ đề số một (đúng vì là bài mở chủ đề).
- Không dùng con vật, chuỗi hay ví dụ quiz của Oak (grep danh sách cấm ở `_topic.md:74`): không có chim sáo đen, rong biển, sao biển, rái cá, cá mập, cá ngừ, koala, cáo, lừa, hải cẩu, dê núi, lợn biển, rau diếp, quả sồi, sóc, tầm ma, hươu cao cổ, sư tử, hạt hướng dương, rệp, bọ rùa. Không nhắc tên Oak. Không dùng producer, consumer, predator, prey · sinh vật sản xuất, kẻ săn mồi, con mồi (để dành chủ đề Discoverer). Một chỗ chạm danh sách cấm: xem n11.

### Lỗi chặn (0)

Không có chỗ nào dạy sai cho bé, không có chữ nào phải sửa trước khi chạy `ids`. Năm mục "nên sửa" dưới đây nên sửa trước khi chạy `tts` và đặt ảnh, vì sửa sau phải thu lại giọng hoặc cắt lại ảnh.

### Nên sửa (5)

**N1. Ba `feedback` gọi thẳng tên đáp án đúng của chính câu đó; bé chọn sai xong là biết luôn phải chạm thẻ nào.**
- `02-chuoi-thuc-an-la-gi.md:395-396` · câu q3 "What is food for a frog?" · "Đâu là thức ăn của con ếch?" (đáp án `q3_grasshopper`). Bé chạm thẻ cỏ → app đọc `feedback.vi: Cỏ là thức ăn của châu chấu.`
- `03-moi-loai-mot-vai.md:359-360` · câu q1 "Which one starts a food chain?" (đáp án `q1_rice`). Bé chạm thẻ chuột → `feedback.vi: Chuột cần ăn lúa trước đã.`
- `03-moi-loai-mot-vai.md:416-417` · câu q3 "What is food for the owl?" (đáp án `q3_mouse`). Bé chạm thẻ lúa → `feedback.vi: Lúa là thức ăn của chuột.`
- Trái luật SK-044 ở `content/TEMPLATE.md:112`: "không nói đáp án đúng là gì, không gọi tên đáp án". Ba câu này mất luôn lượt thử thứ hai (`max_tries: 2`), nên phần quan trọng nhất — bé tự nghĩ lại — không xảy ra. Đếm máy: chủ đề số một **không có chỗ nào như vậy** trong chín mươi ba dòng `feedback`, nên đây là lệch nếp mới, không phải thói quen chung.
- **Sửa** (một câu, ≤ tám từ, nói điều nhìn thấy ở chính thẻ bé vừa chạm):
  - `02:395-396` → `feedback.en: Grass is a plant, not an animal.` · `feedback.vi: Cỏ là cây, không phải con vật.`
  - `03:359-360` → `feedback.en: A mouse has fur and a long tail.` · `feedback.vi: Chuột có bộ lông và cái đuôi dài.` (không lặp ý với `hint` "Look for the plant.")
  - `03:416-417` → `feedback.en: Rice is a plant, not an animal.` · `feedback.vi: Lúa là cây, không phải con vật.`
- Kiểm luôn hai chỗ gần giống đã đúng, không cần sửa: `03:426-427` (`q3_grass`, nói cỏ là thức ăn của châu chấu và trâu — hai con không có trong câu) và `04:59-60` (`w1_owl`, câu chỉ hai lựa chọn nên phản hồi nào cũng dẫn tới đáp án; chấp nhận như chủ đề số một).

**N2. Bài 2 q6 (câu misconception): câu hỏi dùng chữ chưa dạy ở đâu trong chủ đề. Hình chuỗi đặt ngược thì nên giữ.**
- `02-chuoi-thuc-an-la-gi.md:517-518`: `prompt.en: This arrow points the right way.` · `prompt.vi: Mũi tên này chỉ đúng chiều.`
- "the right way" · "đúng chiều" không xuất hiện ở ý chính, ô Học, ví dụ hay từ vựng nào. Cả bài dạy bằng một câu khác hẳn: "mũi tên bắt đầu từ thức ăn" · "mũi tên chỉ tới con vật ăn nó" (`02:29-30`, `02:156-159`). Bé 5–7 tuổi nghe câu hỏi một lần, không đọc chữ; ở câu khó nhất của bài mà phải tự dịch "đúng chiều" sang quy ước vừa học thì câu đang kiểm hai việc. Trái luật Explorer số 1 và số 3 (`content/TEMPLATE.md:143`, `:151`).
- **Sửa:** `02:517-518` → `prompt.en: The arrow starts at the food.` · `prompt.vi: Mũi tên này bắt đầu từ thức ăn.` (giữ `answer: false`; bảy từ EN; câu khẳng định, không phủ định). Chữ này trùng đúng `examples.1` của ô "The arrow", nên bé đã nghe một lần ở phần Học.
  Khi đó `feedback_true` (`02:529-530`) đang lặp y câu hỏi mới, đổi thành `feedback_true.en: The grasshopper is not food for grass.` · `feedback_true.vi: Châu chấu không phải thức ăn của cỏ.` `hint` (`02:523-524`), `explanation_correct` (`02:525-526`) và `explanation_wrong` giữ nguyên, vẫn khớp.
- **Trả lời Còn mở 3 của `_topic.md:323` (hình chuỗi đặt ngược có làm bé rối không): tester đề nghị giữ hình ngược.** Ba lý do: (a) Explorer chỉ có ba format, và đây là cách duy nhất bắt được misconception "mũi tên = ăn" bằng hình — `single_choice` thì app ẩn hình câu hỏi (SK-043, `:70`); (b) chiều đúng xuất hiện nhiều gấp bội chiều sai: `explore_arrow`, `explore_chain`, thẻ từ `arrow`, thẻ từ `food_chain`, bài 3 q6, bài 4 q6, hai hình ghép bài 4 — hình ngược chỉ hiện một lần, ở câu cuối, sau khi bé đã nghe quy ước năm lần; (c) phương án thay trong Còn mở 3 ("The arrow points to the grass." · "Mũi tên chỉ vào cỏ.") dạy cách đọc "mũi tên chỉ vào…" — đúng cái kéo bé về phía misconception — và tụt xuống DOK 1 (chỉ nhìn xem mũi tên chạm vào đâu).
  Kèm hai điều kiện: hình ngược giữ đúng `brief` hiện có (không dấu tích, dấu nhân, màu đỏ — `02:519`), và bé luôn nghe `explanation_correct` sau khi trả lời, nên hình ngược không bao giờ là thứ cuối cùng bé nhận.

**N3. Bài 4 q5 (`order_sequence`): màn Chơi ngay trước đó vừa dạy "gà ăn lúa", nên lúa → gà là đường nghĩ hợp lý mà vẫn sai; `hint` không gỡ được.**
- `04-so-sanh-cac-chuoi-thuc-an.md:484-501`, `answer: q5_rice, q5_grasshopper, q5_hen`.
- Cùng bài, `04:264-270` xếp `tray_hen` vào nhóm "Chim" của kệ "Chọn ba con vật ăn lúa", và `04:238` nói "Em còn thiếu một con chim". Bé vừa ghép xong "gà ăn lúa" thì sang q5 thấy đúng ba thẻ lúa, châu chấu, gà mái. Đặt gà ở giữa là áp dụng đúng điều vừa học, chỉ là không phải chuỗi bài muốn.
- `hint.en: Start with the plant.` (`04:495-496`) chỉ xác nhận lúa đứng đầu, không giúp chọn giữa gà và châu chấu ở ô thứ hai. Hết hai lượt là bé nghe `explanation_wrong`.
- **Sửa:** `04:495-496` → `hint.en: Who eats the grasshopper?` · `hint.vi: Em nghĩ xem con nào ăn châu chấu?` Gợi ý này chỉ vào mắt xích đang gây lẫn, không nói đáp án, và khác gợi ý của hai câu `order_sequence` kia (`02:432`, `03:493`) nên bốn bài không lặp một câu.
- Thêm một ý cho `explanation_correct` thì tốt hơn nữa: `04:497-498` hiện là "Yes! Grasshoppers are in many chains, too."; nếu đổi thành "Yes! A hen eats rice and grasshoppers." · "Đúng rồi! Gà ăn cả thóc lẫn châu chấu." thì gỡ hẳn chỗ bé thấy mâu thuẫn. Biên tập chọn một trong hai.

**N4. Hai thẻ từ vựng bài 4 dùng hình ghép hai hàng sáu ảnh, đặt vào thẻ Từ mới rộng khoảng 153 × 76 pt.**
- `04-so-sanh-cac-chuoi-thuc-an.md:558` (`compare` dùng lại `explore_compare`) và `04:569` (`same` dùng lại `explore_same`). Hai hình gốc là `[sơ đồ ghép ảnh]` khung 4:3, **hai hàng thẳng cột, mỗi hàng một chuỗi ba món** (`04:138`, `04:191`).
- Bảng tỉ lệ khung của SK-043 (`docs/backlog/SK-043-lesson-screens-picture-book.md:161`): khung `vocab` là **2:1**, trên iPhone 390 là ≈ 153 × 76 pt. Nhét ảnh 4:3 vào khung 2:1 lệch 1,5 lần, dưới ngưỡng `PictureFit.maxCropRatio` 2,2 (chốt 13/11), nên app **cắt lấp đầy**: mất trên dưới, tức mất một trong hai hàng. Kể cả không cắt thì sáu ảnh trong 153 × 76 pt mỗi ảnh còn chưa tới 25 pt — bé không nhận ra con gì.
- **Sửa (chọn một):** (a) nhờ designer xuất riêng một bản 2:1 cho hai khoá này (vẫn hai hàng, ảnh nhỏ hơn, nền giấy rộng ra hai bên) và đặt `crop` riêng trong file chọn ảnh — SK-043 đã có nếp "tách `same_as` thành mục riêng có crop riêng"; rồi ios-dev xem thử trên iPhone nhỏ xem đọc được không; (b) nếu không đọc được thì đổi ảnh hai thẻ sang ảnh đơn đã có trong bài: `same` → `moi-loai-mot-vai/explore_start` (bông lúa — chỗ giống nhau của hai chuỗi ở ô "Compare"), `compare` → giữ hình ghép nhưng chỉ lấy hàng trên.
- Cùng kiểu, nhẹ hơn: `02:544` (`food_chain` dùng `explore_chain`), `03:556` (`role` dùng `explore_whole`) là chuỗi **một hàng ba ảnh** trong khung 2:1 — mỗi ảnh còn khoảng 45 pt, nhỏ nhưng còn nhận ra, và hướng ảnh hợp khung. Chỉ nhờ ios-dev xem cùng lượt.

**N5. Ba `feedback` viết hai câu, trong khi luật Explorer là một câu.**
- `01-con-vat-kiem-an-the-nao.md:117-118` (w3): "Spiders have eight legs. Grasshoppers have six." · "Nhện mới có tám chân. Châu chấu có sáu chân."
- `03-moi-loai-mot-vai.md:465-466` (`q4_rice`): "Rice is food. It eats nothing." · "Lúa là thức ăn. Lúa không ăn gì cả."
- `04-so-sanh-cac-chuoi-thuc-an.md:476-477` (`q4_grasshopper`): "A grasshopper is small. It eats leaves." · "Châu chấu nhỏ xíu, chỉ ăn lá."
- `content/TEMPLATE.md:122` (bảng theo nhóm tuổi) và SK-044 mục Quyết định: Explorer `feedback` là **một câu, tối đa tám từ**. Đếm máy chủ đề số một: chín mươi ba dòng `feedback`, **không dòng nào hai câu** — nên đây là lệch nếp. Máy chưa kiểm số câu (dev ghi rõ ở SK-044, mục "dev 13/11"), nên chỉ người duyệt bắt được.
- **Sửa:**
  - `01:117-118` → `feedback_true.en: Spiders have eight legs, grasshoppers six.` · `feedback_true.vi: Nhện có tám chân, châu chấu có sáu.`
  - `03:465-466` → `feedback.en: Rice is a plant and eats nothing.` · `feedback.vi: Lúa là cây, lúa không ăn gì cả.`
  - `04:476-477` → `feedback.en: A grasshopper eats leaves, not mice.` · `feedback.vi: Châu chấu ăn lá, không ăn chuột.`

### Nhỏ (12)

- **n1. `hint` gọi tên ô Học sai một chữ** (`03-moi-loai-mot-vai.md:49`, `04-so-sanh-cac-chuoi-thuc-an.md:88`): "Remember the Arrow picture." nhưng nhãn ô ở bài 2 là `label.en: The arrow` (`02:148`). Mười sáu `hint` kiểu này của chủ đề đều khớp đúng tên ô, chỉ hai chỗ này lệch; bản VI ("ô Mũi tên" ↔ "Mũi tên") thì khớp. Đề xuất đổi `02:148` thành `label.en: Arrow` (giữ `label.vi: Mũi tên`), vì ba ô còn lại của bài là "Food from plants", "Food from animals", "Food chain" — không ô nào có mạo từ.
- **n2. Bản VI của ô "Cả chuỗi" dùng "cái" cho cây và con vật** (`03-moi-loai-mot-vai.md:187`): `sentence.vi: Mỗi con đều cần cái đứng trước nó.` Ý chính 3 của chính bài (`03:30`) viết đủ và xuôi hơn: "Mỗi con đều cần cây hay con vật đứng trước nó." Bản EN hai chỗ giống hệt nhau ("Each one needs the one before it."), nên chỉ VI lệch. Đề xuất chép câu ở `03:30` sang `03:187`.
- **n3. EN và VI lệch nội dung ở một `explanation_wrong`** (`02-chuoi-thuc-an-la-gi.md:527-528`): EN "This is false. The arrow starts at the grass." / VI "Câu này sai. Mũi tên phải đi từ cỏ sang châu chấu." Bản VI nói thêm đích đến. Khớp lại một trong hai (VI đủ ý hơn; EN đổi thành "The arrow starts at the grass, not the grasshopper." là chín từ, quá luật — nên sửa VI thành "Mũi tên phải bắt đầu từ cỏ.").
- **n4. Ghi chú về tên bài 3 đã lỗi thời.** `03-moi-loai-mot-vai.md:16` và `_topic.md:96-99` viết "`content/syllabus.json` đang ghi 'Roles within food chains' · 'Ai ăn ai trong chuỗi thức ăn?'", nhưng danh mục **đã đổi rồi**: `content/syllabus.json` ghi "Roles in a food chain" · "Mỗi loài một vai trong chuỗi thức ăn", và `lesson_id` khớp file. Còn mở 1 của `_topic.md:321` coi như đã chốt; PM xoá hai ghi chú này và đóng Còn mở 1, hoặc Duy xác nhận lại.
- **n5. Ghi chú đếm từ sai một chỗ** (`01-con-vat-kiem-an-the-nao.md:508`): "Hai câu EN bốn và sáu từ, cả màn mười từ" — thật ra "A hen finds worms." bốn từ, "We give it rice, too." năm từ, cả màn chín từ. Ba ghi chú đếm từ còn lại (`02:480`, `03:450`, `04:454`) đúng. Không ảnh hưởng chữ bé nghe.
- **n6. Một `feedback` khó đọc to** (`03-moi-loai-mot-vai.md:541-542`): "The frog's grasshoppers need grass to eat." · "Châu chấu mà ếch ăn cần có cỏ để sống." Sở hữu cách "the frog's grasshoppers" lạ tai với bé học tiếng Anh, và câu VI phải nghe hai lần mới hiểu. Đề xuất: "Grasshoppers need grass, and frogs need grasshoppers." · "Châu chấu cần cỏ, ếch cần châu chấu." (một câu, bảy từ EN).
- **n7. Một `explanation_correct` chỉ nói lại câu hỏi, chưa thêm ý** (`03-moi-loai-mot-vai.md:380-381`): câu q2 "The owl is food for the mouse." (Sai), giải thích khi đúng là "The mouse is food for the owl." · "Chuột mới là thức ăn của cú." Đúng nhưng mới là phần sửa chiều, chưa có "một điều bé chưa biết" như `content/TEMPLATE.md:115`. Đếm máy: chủ đề số một không có câu nào một câu. Đề xuất thêm một vế: "The mouse is food for the owl. Owls hunt at night." quá dài — chọn "The mouse is food for the owl." · "Chuột mới là thức ăn của cú. Cú bắt chuột ban đêm." thì VI dài hơn EN; gọn nhất là đổi cả cặp thành "The owl is bigger. It catches the mouse." · "Cú to hơn. Cú bắt con chuột." Hai `explanation_correct` một câu còn lại (`01:525` voọc tự tìm lá, `02:525` cỏ là thức ăn nên mũi tên đi từ đó) đều đã có ý thêm, không cần sửa.
- **n8. Tên thẻ thưởng bài 4 khác tên dùng trong bài** (`04-so-sanh-cac-chuoi-thuc-an.md:601-602`): thẻ là "Cattle egret" · "Cò ruồi", trong khi cả chủ đề gọi "egret" · "con cò" (nhãn thẻ, `feedback`, câu q2, kệ Chơi) và ảnh dùng chung là `tray_egret` "cò bay trên bãi cỏ". Bé mở thẻ ra thấy một cái tên mới và một con cò khác ảnh. Hoặc đổi tên thẻ thành "Egret" · "Con cò", hoặc thêm một dòng cho "cò ruồi" vào bảng Tên gọi `_topic.md:131-149` để người chọn ảnh dùng cùng một loài ở mọi chỗ.
- **n9. Nhãn ô Học bài 4 lệch nghĩa EN và VI** (`04:133-134`): `label.en: Same start` · `label.vi: Cùng bắt đầu từ cây`. Bản VI nói sẵn kết luận của ô trước khi bé chạm vào xem. Đề xuất `label.vi: Cùng bắt đầu` (ba ô còn lại của bài đều khớp nghĩa EN/VI).
- **n10. Hai thẻ của bài 2 q4 dễ nhìn thành một** (`02:448-461`): thẻ "lá cải" và thẻ "con sâu" — ảnh con sâu là sâu **bò trên lá cải**. Biên tập đã dặn cắt sát con sâu ở `02:461` và `02:608`, và dặn ảnh lá cải không có sâu ở `02:263`. Chỉ nhắc designer đây là chỗ phải kiểm bằng mắt sau khi cắt (cùng kiểu n6 của SK-041 với trứng ếch và nòng nọc).
- **n11. Một chỗ chạm danh sách cấm của Oak** (`01-con-vat-kiem-an-the-nao.md:117-118`): `_topic.md:74` ghi không dùng "rệp và bọ rùa, nhện", mà `feedback_true` của w3 nói "Spiders have eight legs." Con nhện ở đây đến từ bài 7 chủ đề số một (côn trùng sáu chân, nhện tám chân) chứ không phải chuỗi lá → bọ rùa → nhện của Oak, nên tester cho là dùng được. Đề xuất thêm nửa câu vào `_topic.md:74` ("nhện chỉ cấm trong chuỗi thức ăn; câu ôn số chân của chủ đề số một vẫn dùng") để lần rà sau không phải hỏi lại.
- **n12. `content/TEMPLATE.md:98` vẫn ghi "Câu 6 có lời Na (`speaker: na`)"** cho mọi nhóm tuổi, trong khi Explorer chốt 12/11 không có lời Na và chủ đề này làm đúng theo chốt (`_topic.md:102`; đã kiểm: không file nào có `speaker`, `instruction` hay `statement`). Nhờ PM sửa TEMPLATE để biên tập sau không làm theo dòng cũ.

### Chưa kiểm

- Không chạy `validate`, `ids`, `import`, `tts`, `build`; không dùng simulator; không mở Xcode. N4 nói về tỉ lệ khung là suy từ bảng SK-043 và hằng số `PictureFit.maxCropRatio` 2,2, **chưa xem trên máy** — nhờ ios-dev xác nhận khi có gói thật.
- Chưa kiểm giấy phép ảnh (chưa có ảnh nào), chưa nghe thử giọng đọc các từ khó ("grasshopper", "caterpillar", "graze", "cattle egret", và chuỗi "là thức ăn của" đọc liền nhiều lần ở ô "The arrow" — `_topic.md:151` đã nhờ).
- Không đối chiếu sách Tự nhiên và Xã hội lớp 1–2 của chương trình 2018.

## content-editor 14/11 · sửa theo tester

Đã đọc chốt của main session (N1, N2, N3, N5 theo tester; N4 đổi sang ảnh đơn hợp khung 2:1; mục nhỏ sửa những mục đúng; không sửa TEMPLATE). Không chạy lệnh. Không đổi, không xoá dòng `id:` nào (bài 4 đã có id, giữ nguyên); không thêm khối mới cần id.

**Nên sửa (cả năm)**
- **N1:** ba `feedback` không còn gọi tên đáp án: bài 2 q3 thẻ cỏ "Grass is a plant, not an animal." · "Cỏ là cây, không phải con vật."; bài 3 q1 thẻ chuột "A mouse has fur and a long tail." · "Chuột có bộ lông và cái đuôi dài."; bài 3 q3 thẻ lúa "Rice is a plant, not an animal." · "Lúa là cây, không phải con vật.".
- **N2:** giữ hình chuỗi đặt ngược. Bài 2 q6 `prompt` → "The arrow starts at the food." · "Mũi tên này bắt đầu từ thức ăn." (Sai); `feedback_true` → "The grasshopper is not food for grass." · "Châu chấu không phải thức ăn của cỏ.". `_topic.md`: đóng Còn mở 3, sửa bảng Đúng/Sai và note của `arrow_means_eats`.
- **N3:** bài 4 q5 sửa cả hai chỗ: `hint` → "Who eats the grasshopper?" · "Em nghĩ xem con nào ăn châu chấu?"; `explanation_correct` → "Yes! A hen eats rice and grasshoppers." · "Đúng rồi! Gà ăn cả thóc lẫn châu chấu.".
- **N4:** bài 4 từ `compare` → ảnh đơn con cú (dùng lại `explore_hunt` bài 1), ví dụ "Compare the owl and the cat." · "So sánh con cú với con mèo." (đi cặp với từ `different` là con mèo); từ `same` → ảnh đơn bông lúa (dùng lại `explore_start` bài 3), ví dụ "Both chains start with rice." · "Cả hai chuỗi đều bắt đầu từ lúa.". Hai hình ghép hai hàng nay chỉ dùng ở ô Học. Bảng hình đổi ở dưới.
- **N5:** ba `feedback` về một câu: bài 1 w3 "Spiders have eight legs, grasshoppers six." · "Nhện có tám chân, châu chấu có sáu."; bài 3 q4 thẻ lúa "Rice is a plant and eats nothing." · "Lúa là cây, lúa không ăn gì cả."; bài 4 q4 thẻ châu chấu "A grasshopper eats leaves, not mice." · "Châu chấu ăn lá, không ăn chuột.".
- Kèm cảnh báo `validate` của phiên chính: mục tiêu bài 3 EN → "I can tell each role in a chain." (tám từ).

**Nhỏ**
- Đã sửa:
  - n1: nhãn ô Học bài 2 "The arrow" → "Arrow".
  - n2: bài 3 ô "The whole chain" `sentence.vi` → "Mỗi con đều cần cây hay con vật đứng trước nó.".
  - n3: bài 2 q6 `explanation_wrong.vi` → "Câu này sai. Mũi tên phải bắt đầu từ cỏ.".
  - n4: ghi chú tên bài 3 (bài 3 và `_topic.md`) viết lại là "đã đổi"; đóng Còn mở 1; mục Đề xuất cho PM chỉ còn `syllabus.md`.
  - n5: ghi chú đếm từ bài 1 q5 (bốn và năm từ, cả màn chín từ).
  - n6: bài 3 q6 `feedback_false` → "Grasshoppers need grass, and frogs need grasshoppers." · "Châu chấu cần cỏ, ếch cần châu chấu.".
  - n7: bài 3 q2 `explanation_correct` → "The mouse is food. Owls hunt mice at night." · "Chuột mới là thức ăn. Cú săn chuột vào ban đêm.". Không dùng "The owl is bigger" của tester, vì "to hơn" gần với quan niệm "chuỗi xếp theo to nhỏ".
  - n8: thẻ thưởng bài 4 → "Egret" · "Con cò", `fact` "An egret follows buffaloes to catch insects." · "Con cò hay đi theo trâu để bắt côn trùng."; "cò ruồi" chỉ còn trong `brief`. Bảng Tên gọi thêm dòng "con cò".
  - n9: bài 4 ô "Same start" `label.vi` → "Cùng bắt đầu".
  - n11: `_topic.md` mục Nguồn thêm "Nhện chỉ cấm trong chuỗi thức ăn; câu ôn số chân của chủ đề số một (bài 1 w3) vẫn nhắc nhện.".
- Không sửa chữ:
  - n10: là việc kiểm của designer, đã có trong Ghi chú cho hoạ sĩ bài 2; nhắc lại ở bảng dưới.
  - n12: không sửa TEMPLATE (vùng PM). **Đề xuất cho PM:** `content/TEMPLATE.md` mục A, đoạn Quiz, dòng "Câu 6 có lời Na (`speaker: na`)…" thêm "(Discoverer, Scientist; Explorer không có lời Na, main session chốt 12/11 ở SK-041)".
- Bảng Tên gọi dòng "con cú": ghi ưu tiên ảnh cú mèo (ăn cả châu chấu), theo ghi chú "Chưa kiểm" của tester về kệ Chơi bài 3.

**Chữ trẻ nghe đổi** (cần sinh lại giọng nếu đã chạy `tts`): mọi chuỗi ở hai mục trên, cộng nhãn ô Học bài 2 ("Arrow"), mục tiêu bài 3 EN.

**Còn mở:** `[CẦN KIỂM]` không đổi; ba dòng tester nhờ chuyên môn (cú ăn châu chấu, chuột đồng ăn hạt cỏ, "cây không ăn gì cả") vẫn chờ.

## Hình đổi sau rà chữ

| Bài · chỗ | Trước | Sau | Ghi chú cho designer |
| --- | --- | --- | --- |
| 4 từ `compare` | Dùng lại `explore_compare` (hình ghép hai hàng, sáu ảnh) | Dùng lại `explore_hunt` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao` (cú đậu trên cành); `alt` "An owl on a branch" · "Con cú đậu trên cành" | Cắt khung `vocab` 2:1, con cú nằm gọn giữa khung |
| 4 từ `same` | Dùng lại `explore_same` (hình ghép hai hàng, sáu ảnh) | Dùng lại `explore_start` ở bài `chuoi-thuc-an/moi-loai-mot-vai` (bông lúa chín); `alt` "Ripe rice in a field" · "Bông lúa chín ngoài đồng" | Cắt khung `vocab` 2:1 |
| 4 `explore_same`, `explore_compare` | Dùng ở ô Học và từ vựng | Chỉ dùng ở ô Học (khung 4:3) | Không cần bản 2:1 |
| 4 thẻ `egret_card` | Tên "Cò ruồi"; `alt` "Con cò ruồi bên cạnh con trâu" | Tên "Con cò"; `alt.vi` "Con cò bên cạnh con trâu" | Ảnh vẫn là cò ruồi trên lưng trâu; nên chọn cùng dáng cò trắng với ảnh `ho-hap` `tray_egret` |
| 2 q4 thẻ `q4_caterpillar`, `q4_cabbage` | (không đổi) | (không đổi) | n10: sau khi cắt, kiểm bằng mắt hai thẻ không thành hai lá xanh giống nhau (thẻ sâu cắt sát con sâu, thẻ lá không có sâu) |
| 2 từ `food_chain`, 3 từ `role` | Hình ghép một hàng ba ảnh | Giữ | Tester N4: mỗi ảnh còn khoảng 45 pt trong khung 2:1; nhờ ios-dev xem trên iPhone nhỏ cùng lượt |
- Hai mươi sáu dòng `[CẦN KIỂM]` trong bốn bài (bài 1 bảy, bài 2 chín, bài 3 năm, bài 4 năm): tester đọc và thấy hợp lý cả hai mươi sáu, nhưng ba dòng nên để người chuyên môn xác nhận: cú (nhất là cú lợn) có ăn châu chấu không (`03:212`, vì kệ Chơi bài 3 cho phép ghép cỏ → châu chấu → cú; nếu ảnh chọn là cú lợn thì mắt xích này yếu, nên nhờ người chọn ảnh ưu tiên cú mèo); chuột đồng có ăn hạt, mầm cỏ không (`03:163`, `03:212`); cách nói "cây không ăn gì cả" cho bé năm tuổi (`03:472`, biên tập đã tự hỏi).

## designer 14/11 · ảnh và hình ghép

Đã làm: bốn file chọn ảnh `content/images/explorer/chuoi-thuc-an/{con-vat-kiem-an-the-nao,chuoi-thuc-an-la-gi,moi-loai-mot-vai,so-sanh-cac-chuoi-thuc-an}.json` (152 chỗ có hình, đủ cả 152) và sáu hình ghép `content/images/composed/chuoi-thuc-an/*.jpg`. `images fetch content/images/explorer/chuoi-thuc-an`: 0 lỗi, **0 cảnh báo tỉ lệ**, không bài nào "Chưa kiểm tỉ lệ". Không sửa `.md`.

- **Ảnh mới (13; brief ghi 12, thêm một ảnh cỏ):** chim sẻ ăn hạt trên nền đất (CC BY 3.0), cú (CC BY 2.0), tay cho gà ăn (CC BY 2.0, thay ảnh StockSnap), chuột đồng sọc (CC BY 2.0), sâu bướm cải trắng trên lá cải (CC BY 3.0), cây cải bắp non (CC0), châu chấu đan lá cọ (CC BY 2.0, Flickr), đống rơm (CC BY 2.0), bông lúa chín IRRI (CC BY 2.0), cú gỗ (CC0), chuột đồ chơi (CC0), cò ruồi trên lưng trâu (CC BY 4.0), khóm cỏ mần trầu (CC BY 2.0). Tổng: CC0 ba, CC BY mười. **Ảnh tay cho gà ăn (StockSnap) đã thay** (phiên chính 14/11: trang gốc trả 403, không kiểm được giấy phép) bằng ảnh Commons "Man feeds his chickens" (CC BY 2.0): crop chỉ còn hai bàn tay đưa thức ăn cho hai con gà mái trên bậc đá, không thấy mặt; dùng cho `learn.explore.explore_fed` và `vocab.feed`.
- **Hình ghép (6):** ảnh tròn cùng cỡ trên nền giấy điệp, đế giấy sáng, bóng giấy, mũi tên giấy cắt màu chàm chỉ sang phải, không chữ. `q6` là `explore_arrow` đổi chỗ hai ảnh, mũi tên giữ chiều, không dấu đúng sai. Giấy phép cả sáu là CC BY (theo phần chặt nhất).
- **Dùng lại:** ảnh của *Gọi tên và nhóm động vật* trỏ thẳng tới mục đã có crop đúng khung (vd trâu cho thẻ 5:2 lấy `con-vat-an-gi/q3.q3_buffalo`); ảnh Discoverer chép nguyên mục gốc (gà mái `khung-long-la-gi/w3_hen`, giun `da-va-dat/the-nao-la-dat-tot/vocab.earthworm`, sân nhà vẽ `ho-hap/q3`). Nón lá cho ô kệ: cùng ảnh `w1_hat`, crop vuông mới.
- **n10 đã kiểm bằng mắt:** thẻ `q4_cabbage` là cả cây cải bắp màu xanh nhạt, không sâu; thẻ `q4_caterpillar` là con sâu trên lá xanh đậm, cắt sát con sâu. Hai thẻ khác hẳn nhau.

**Đổi so với brief (đề xuất biên tập sửa chữ trong `.md` và `_topic.md`):**

| Bài · chỗ | Brief | Ảnh thật | Đề xuất |
| --- | --- | --- | --- |
| Cả chủ đề, cỏ (`q4_grass` của chủ đề số một: 2 `tray_grass`, `q3_grass`, ghép; 3 `w1_grass`, `tray_grass`, `q3_grass`) | khay cỏ trong hộp kính | khóm cỏ mần trầu mọc trên đất (ảnh mới, như `_topic.md` cho phép) | Sửa brief các chỗ này thành "khóm cỏ mọc ngoài bãi"; `alt` "Fresh green grass" · "Cỏ tươi" giữ được |
| 1 `explore_hunt` và mọi chỗ cú | cú lợn hoặc cú mèo | cú vọ mặt trắng (Glaucidium cuculoides), loài cú nhỏ phổ biến ở Việt Nam, ăn côn trùng lớn và chuột, đậu cành ngang ban ngày; không có ảnh cú mèo hợp lệ đủ rõ và đủ chỗ cho khung 5:2 | Bảng Tên gọi dòng "con cú" ghi ảnh là cú vọ; mắt xích cỏ → châu chấu → cú ở kệ Chơi bài 3 vững hơn |
| 1 `explore_need` (từ `food`) | chim sẻ mổ thóc trên sân | chim sẻ đứng trên nền đất, ngậm một hạt | `alt` "A sparrow eating a seed" · "Chim sẻ ăn hạt trên mặt đất" |
| 1 `explore_fed` (từ `feed`) | tay rải thóc cho đàn gà | hai bàn tay đưa thức ăn cho hai con gà mái, không thấy mặt | `alt.vi` "Bàn tay cho gà ăn" (giữ EN) |
| 2 `w2` và mọi chỗ chuột | chuột đồng nâu xám trên rạ | chuột đồng sọc trên bãi lá khô | Giữ chữ; brief ghi "trên đất, lá khô" |
| 2 `tray_toy_grasshopper` | châu chấu đan lá dừa | châu chấu đan lá cọ (Hawaii), duy nhất có giấy phép hợp lệ; ảnh hơi rối ở ô nhỏ | Giữ nhãn; nếu thấy khó nhận ra trên máy thì đổi sang hình tự vẽ |
| 2 `tray_straw` | đống rơm ở sân hoặc ruộng | một đống rơm trên ruộng gặt (Nga) | Giữ |
| 3 `tray_wood_owl` | tượng cú gỗ trên bàn | cú gỗ đánh bóng, mắt thuỷ tinh, trên cọc đỡ | Giữ |
| 3 `tray_toy_mouse` | chuột vải nỉ xám | chuột nhựa đen lên dây cót | `alt` "A black toy mouse" · "Con chuột đồ chơi màu đen" |
| 4 `egret_card` | cò cạnh trâu | cò ruồi đứng trên lưng trâu đang nằm | `alt` "An egret on a buffalo" · "Con cò trên lưng trâu" |

**Còn chưa chắc:** ảnh Openverse/Flickr `https://www.flickr.com/photos/8952189@N05/4412000584` (châu chấu lá cọ) đã mở trang gốc, ghi CC BY 2.0. Fetch lại sau khi thay ảnh StockSnap: 0 lỗi, 0 cảnh báo tỉ lệ, 152/152 chỗ có hình. Chưa xem trên máy: ba ảnh tròn trong thẻ từ 2:1 (`food_chain`, `arrow`, `role`) và châu chấu lá cọ ở ô kệ.
