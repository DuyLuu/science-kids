# SK-041 · Soạn chủ đề Explorer #1 "Gọi tên và nhóm động vật" (6 bài, Oak Y1)

Trạng thái: review · Ngày: 2026-11-12 · Phụ trách: content-editor (soạn), designer (hình), main session chạy lệnh · Tester: tester
Nguồn: Duy 12/11; content/syllabus.json (`naming-and-grouping-animals`); Oak unit [Naming and grouping animals](https://www.thenational.academy/teachers/programmes/science-primary-ks1/units/naming-and-grouping-animals/lessons); sườn ở `docs/oak/naming-and-grouping-animals.md`; SK-026 (luật quiz Explorer); content/rules.json (explorer: câu EN ≤ 8 từ, 2–3 lựa chọn, `single_choice`/`true_false`/`order_sequence`, mọi lựa chọn có hình)

## Mục tiêu
Chủ đề Explorer đầu tiên có 6 bài theo đúng thứ tự Oak, bé 5–7 tuổi chơi được bằng nghe và nhìn.

## Tiêu chí nghiệm thu
- [ ] 6 bài theo lesson Oak; Explorer: câu ngắn, từ dễ, không cần đọc chữ; mọi câu hỏi và lựa chọn có hình.
- [ ] Rút kinh nghiệm các chủ đề Discoverer (SK-036–SK-039): một câu một loại hình, đáp án không lộ bằng hình thức, gợi ý không nói đáp án, không người lộ mặt/logo/chữ.
- [ ] `validate` 0 lỗi; gói và app (SK-040) chơi được trên iPhone.

## content-editor 12/11

Phạm vi: chỉ viết trong `content/explorer/goi-ten-va-nhom-dong-vat/`. Không chạy lệnh (chưa `validate`, chưa `ids`). Mọi file `ai_draft: true`, mọi dòng `id:` để trống. Chạy `ids` theo thứ tự: `_topic.md`, rồi bài 1 tới bài 6 (Khởi động bài sau trỏ bài trước; không trỏ sang chủ đề Discoverer nào).

**File**
- `_topic.md`: frontmatter (`order: 1`, `strand: plants_animals`, `level: 1`, difficulty 1-1-2-2-1 = bảy điểm, `is_free: true`, `oak_unit_ref`), sáu misconception, tổng quan sáu bài, bảng Tên gọi, Quy ước hình, Hình dùng chung, bảng Đúng/Sai (mười Đúng, chín Sai), Vị trí đáp án, Khởi động, phần Chơi, thẻ thưởng `set: animals`, An toàn, Để dành, Lệch so với sườn, Còn mở.
- `01-con-vat-nuoi-trong-nha.md` (`opener`): thú cưng, động vật hoang dã, vật nuôi trong chuồng (thêm cho Việt Nam). q6 `pets_have_four_legs`: chọn thú cưng giữa cá vàng, cá sấu, voọc.
- `02-dong-vat-co-vu.md` (`core`): lông, sữa, to nhỏ (dơi, cá heo), con người. q6 `people_not_animals`: "You have hair, so you are a mammal." (Đúng).
- `03-chim-va-bo-sat.md` (`core`): lông vũ, cánh, mỏ; chim không bay; vảy; trứng. q6 `all_birds_fly`: con nào là chim giữa dơi, chuồn chuồn, chim cánh cụt.
- `04-ca-va-luong-cu.md` (`core`): vây, mang, lưỡng cư, nòng nọc là ếch con. q6 `water_animals_are_fish`: "A dolphin is a fish." (Sai). Phần Chơi chỉ hai chỗ.
- `05-co-the-cac-con-vat.md` (`apply`): chân, cánh, vây và đuôi, bộ phận đặc biệt. q6 `all_animals_four_legs`: con nào có hai chân giống em (chim sẻ giữa thằn lằn, mèo).
- `06-con-vat-an-gi.md` (`review`): ăn thực vật, ăn thịt, ăn tạp (mâm cơm cho con người). q6 `all_animals_eat_same`: "A buffalo eats grass. What does a cat eat?"
- Mỗi bài: Khởi động hai đến ba câu (`single_choice`, `true_false`), Học bốn ô `explore_groups` + `word_list`, Chơi `build_tray`, Quiz DOK 1·1·1·2·2·2, bốn đến năm từ vựng, một thẻ thưởng. Bài 2 đến 5 có `order_sequence` ở q4 (nhỏ tới to; trứng, gà con, gà mái; trứng ếch, nòng nọc, ếch; số chân). Bài 1 và 6 chỉ hai format.
- Không có câu lời Na (lý do ở câu hỏi 1 dưới đây). Câu sáu là câu misconception "bằng hình", DOK 2.

**Lệch so với sườn Oak** (chi tiết ở `_topic.md`, mục "Lệch so với sườn")
- Bài 1 thêm nhóm "vật nuôi trong chuồng" (trâu, gà) ở ô Học, để bé không gộp vào thú cưng.
- Bỏ "máu nóng, máu lạnh", "có xương sống" (bài 2, 3).
- "Phần lớn bò sát đẻ trứng"; câu hỏi chỉ hỏi cá sấu. Nòng nọc là "ếch con", không xếp như một loài lưỡng cư.
- Bài 5 không làm câu "con nào xếp sai nhóm lông vũ"; không dùng chữ "structure".
- Hoạt động xếp vào vòng của Oak thành `build_tray` (chưa có `sort_into_groups`).
- Không dùng ví dụ quiz của Oak (thỏ trong quiz, gấu Bắc Cực, cá mập, hươu cao cổ, sói, sóc, cá hề, cá hồi, sư tử, gấu trúc, chim cổ đỏ).

**[CẦN KIỂM]** (đều có dòng `>` trong file)
- Chim cánh cụt có lông vũ, dùng cánh để bơi (sườn hỏi; biên tập chắc có lông vũ, chỉ nhờ xác nhận cách nói). Đà điểu không bay.
- "Phần lớn bò sát đẻ trứng"; mọi loài cá sấu đẻ trứng; rùa đẻ trứng trong cát, đất.
- Nòng nọc sống dưới nước, mọc chân, lên cạn; cóc đẻ trứng dưới nước, da cóc khô hơn da ếch.
- Cá heo là động vật có vú; dơi là động vật có vú duy nhất bay thật sự (thẻ); cánh dơi là lớp da.
- Cá thở bằng mang (lấy ô-xi trong nước). Trâu có lông thưa.
- Thú mỏ vịt đẻ trứng ("phần lớn động vật có vú đẻ con").
- Voọc chà vá chân nâu: nơi sống, màu chân (thẻ bài 1). Thạch sùng bám tường nhờ ngón chân (thẻ bài 3). Ếch đồng kêu sau mưa (thẻ bài 4). Chim bói cá bắt cá bằng mỏ (thẻ bài 5). Trâu nhai lại (thẻ bài 6).
- Voi ăn mía; cò ăn cá, ếch nhái; gà, vịt ăn tạp; mèo ăn thịt.
- "Cơm trộn cá" cho mèo (bài 1 q4): quen ở Việt Nam, nhờ người có chuyên môn thú y xem.
- Rắn ở bài 3: người chọn ảnh ghi tên loài để xác nhận không độc.
- CT GDPT 2018 lớp 1 có chủ đề thực vật và động vật (chưa đối chiếu sách).

**Hình khó tìm** (bốn mươi bảy ảnh mới, toàn ảnh chụp, không hình vẽ mới; danh sách ở Ghi chú cho hoạ sĩ từng bài)
- Voọc chà vá chân nâu không thấy người, chuồng, chữ (bài 1).
- Bát cơm trộn cá không có mèo, không có tay (bài 1; có phương án thay trong file).
- Cá rô đồng còn sống trong nước (bài 4; phương án thay: cá rô phi).
- Trứng ếch; đàn nòng nọc (bài 4).
- Chim cánh cụt hoang dã, không hàng rào sở thú (bài 3).
- Mâm cơm gia đình không người, không chữ (bài 6; nếu không có thì hỏi PM cho phép `[hình vẽ]` riêng ô Học này).
- Cò ngậm cá không có máu (bài 6); tượng sư tử đá không chữ khắc (bài 6); chim bói cá (bài 5).
- Ảnh dùng lại cần kiểm thấy chân: cò bay (bài 5 Chơi), trâu bên suối (bài 5 q4), chim sẻ (bài 5 q6).
- `order_sequence`: designer cắt ba thẻ cho con vật cùng cỡ trong khung (bài 2 q4 so to nhỏ theo hiểu biết, không theo cỡ hình).

**Câu hỏi về luật Explorer chưa rõ (cho PM)**
1. **Câu lời Na ở Explorer.** TEMPLATE ghi "Câu 6 có lời Na" cho mọi chủ đề, nhưng Explorer không có DOK 3, và bé năm tuổi phải nghe hai giọng rồi dùng biểu tượng gật, lắc đầu cho "Na đúng / Na chưa đúng" (dễ lẫn với "câu này đúng / sai"). Chủ đề này không dùng lời Na. PM chốt: giữ cách này (đề xuất), hay thêm lời Na (bài 2 q6, bài 4 q6 đổi được mà không đổi ý)?
2. **`labels` của `true_false` Explorer để trống** (luật Explorer số 5, đang "chờ PM chốt").
3. **Hình cấp câu ở `single_choice` và `order_sequence` Explorer.** Luật SK-033 bắt mọi câu có `image` cấp câu; ở Explorer lựa chọn đã là hình to, nên hình câu hỏi phần lớn là cảnh trung tính (vườn, ao, ruộng, trời chiều) chỉ để đủ luật. Nếu màn Explorer (SK-040) chật trên iPhone, đề xuất PM cho Explorer bỏ hình cấp câu với hai format này (giữ bắt buộc với `true_false`).
4. **Gợi ý "nhớ lại ô Học".** Luật Explorer số 6 muốn gợi ý chỉ vào điều nhìn thấy trong hình. Sáu gợi ý không làm được vậy (điều cần biết không nhìn thấy: bú sữa, đẻ trứng, thức ăn), nên gợi ý nhắc tên ô Học hoặc bài ("Remember the mammals lesson."). Bé nghe tên ô ở màn Học nên vẫn hiểu. PM xem có chấp nhận không.
5. **`is_free: true`** theo syllabus-progression mục 5.1 (Explorer số 1 "Free"). PM xác nhận.

**Đề xuất cho ios-dev (SK-040)**
- **Chơi `build_tray` ở Explorer:** chip nhóm, dòng điều kiện và nhãn món là chữ; bé chưa đọc được. Đề xuất: tự đọc `prompt` và `messages.start` khi mở màn; chạm món thì đọc `label` (như D4); chip nhóm có màu và đọc tên khi chạm; mọi `messages.*` tự đọc. Số từ EN trên màn Chơi vượt mười lăm nếu tính nhãn bảy, tám món; nếu nhãn món không hiện chữ thì đạt.
- **`build_tray` hai chỗ** (bài 4, `capacity: 2`, hai nhóm `required`): nhờ kiểm app hiện đúng hai ô.
- **Học `explore_groups` ở Explorer:** chạm ô thì tự đọc `label` rồi `sentence`; `examples` có tự đọc hay chỉ hiện, ios-dev chốt (mỗi ví dụ tối đa tám từ, hầu hết dưới sáu).
- **`order_sequence`:** thẻ trong file đã không theo thứ tự đúng; nếu app xáo thẻ thì càng tốt. Prompt nói "Tap in order" · "Em chạm theo thứ tự".
- **Bộ thẻ mới `set: animals`:** khoá `collectible.set.animals` (đề xuất "Animal cards" · "Thẻ con vật").
- **Câu "Em nghĩ sao?"** (đề xuất schema v1.1 `think_first`, bài 1): Explorer cần một biểu tượng cho lựa chọn "Em chưa chắc" bên cạnh gật đầu, lắc đầu.

## Main session chốt 12/11 (mặc định, Duy/PM đổi được)
- `ids` đã chạy, `validate` 0 lỗi; id gắn vào `content/syllabus.json`.
- Câu hỏi luật Explorer: (1) không có câu lời Na; (2) `labels` của `true_false` để trống; (3) giữ hình cấp câu như luật hiện tại; (4) gợi ý được nhắc tên ô Học khi điều cần biết không nhìn thấy được; (5) `is_free` không quan trọng vì gói trả phí đang tắt.
- Việc app gom vào SK-040 lượt 2; `format_not_rendered` cho `order_sequence` ở Explorer giao dev.

## Rà chữ (tester 12/11)

Phạm vi: đọc `_topic.md` và sáu bài của `content/explorer/goi-ten-va-nhom-dong-vat/`; đọc đối chiếu `content/discoverer/khung-long/`, `ho-hap/` ở những chỗ chủ đề này trỏ tới; `content/rules.json` (`explorer.authoring`), `content/TEMPLATE.md` (bảy luật Explorer, bảng luật theo nhóm tuổi), SK-026 D1–D5, `docs/oak/naming-and-grouping-animals.md`, `content/syllabus.json`. Không sửa file nội dung, không chạy lệnh nội dung, không dùng simulator. `validate` do phiên chính chạy (0 lỗi), không chạy lại.

Ngoài đọc tay, chạy năm script kiểm cấu trúc trong scratchpad (không phải test sản phẩm, để ở `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk041/`): (1) `check_struct.py` — format, DOK, số lựa chọn, vị trí đáp án, key misconception từng câu; (2) `check_text.py` — số từ EN, dấu tiếng Việt trong `.en`, chữ số, ký hiệu trong `.vi`, `messages.full`, dấu phẩy ở nhãn; (3) `check_img.py` — thiếu `brief`/`alt`, key "Dùng lại hình" có thật, từ khoá và `alt` chép đúng gốc, không trỏ qua một hình dùng lại khác; (4) `check_tf.py` — luật `true_false` Explorer; (5) `check_reuse2.py` — bản đồ hình gốc và chỗ dùng lại, để đối chiếu bảng Hình dùng chung.

**Tổng kết: chặn 1 · nên sửa 6 · nhỏ 16.**

### Đạt (đã kiểm bằng máy, không có lỗi)

- Sáu bài, mỗi bài quiz sáu câu, DOK 1·1·1·2·2·2 (Explorer 3·3·0), câu một DOK 1, đúng một câu misconception mỗi bài ở q6; sáu key đều có thật trong `_topic.md`, mỗi key dùng đúng một lần, không key nào gắn ở Khởi động. `single_choice` hai hoặc ba lựa chọn, `order_sequence` đúng ba thẻ, không bài nào dùng format ngoài `explorer.quiz_formats`. Bài 1 và 6 hai format, bài 2–5 ba format (≥ `min_formats` 2). Khởi động hai hoặc ba câu, DOK một, câu nào cũng có `recall_from`; bốn bài được trỏ tới đều trong chủ đề này và đã có `id`.
- **Vị trí đáp án khớp đúng từng ô bảng "Vị trí đáp án đúng"** (`_topic.md:258-267`), gồm cả bốn câu `order_sequence`. Đếm máy 27 câu một đáp án: chỗ thứ nhất chín, thứ hai mười, thứ ba tám — đúng con số biên tập ghi. Không thẻ `order_sequence` nào nằm sẵn đúng thứ tự trong file; cả bốn câu chỉ có một thứ tự đúng (mèo < trâu < voi; trứng → gà con → gà mái; trứng ếch → nòng nọc → ếch; không chân → hai chân → bốn chân).
- Đúng/Sai khớp bảng `_topic.md:230-251`: mười chín câu, mười Đúng, chín Sai, bài nào cũng có cả hai. **Không câu `true_false` nào dùng câu phủ định** (luật Explorer số 5), không câu nào có `labels`, câu nào cũng có `image` cấp câu. Không câu đáp án Sai nào có `explanation_correct` mở đầu "Yes!" · "Đúng rồi!"; mọi `explanation_wrong` đúng khuôn "This is false." · "Câu này sai." và "This is true." · "Câu này đúng.".
- **Không chỗ nào thiếu hình:** mọi lựa chọn, mọi thẻ `order_sequence`, mọi món kệ Chơi, mọi câu Khởi động và Quiz đều đủ `image.brief` + `alt.en` + `alt.vi`.
- **196 chỗ "Dùng lại hình": không chỗ nào sai.** Mọi key có thật (gồm 14 hình của bốn bài thuộc hai chủ đề Discoverer), không chỗ nào trỏ qua một hình dùng lại khác, từ khoá tìm ảnh chép đúng từng chữ của hình gốc.
- **Bảng "Hình dùng chung" (`_topic.md:176-226`) đúng hết 48 dòng**, đối chiếu máy từng chỗ dùng lại — đây là chỗ SK-037 và SK-038 từng có lỗi. Đếm máy 47 ảnh mới, chia đúng 15 · 8 · 8 · 6 · 4 · 6 như `_topic.md:339`.
- Số từ EN: không câu nào quá tám từ (đếm theo câu, như `age_words_en`), kể cả `hint`, `explanation`, `examples`, `fact`, `messages`. Chuỗi `.en` không có dấu tiếng Việt; chuỗi `.vi` không có chữ số, ký hiệu, dấu "—". `messages.full` đúng chữ chung ở cả sáu bài; nhãn `limit` đều dạng "Not …" · "Không …"; không nhãn nhóm nào có dấu phẩy; mọi `has_limited` nói lý do, không nhắc chạm.
- Kệ Chơi khớp bảng `_topic.md:284-291` về nhóm và món (trừ một chỗ ở n1): bài 4 đúng hai chỗ, hai nhóm `required`; các bài khác ba chỗ, ba nhóm `required` cộng một nhóm `limit`. Mỗi món bẫy giống một nhóm bắt buộc.
- Từ vựng: bốn hoặc năm từ mỗi bài, đúng ba từ `core`, `term_keys` khớp ba từ `core`. Màu nhóm: bốn màu khác nhau trong mỗi khối, `do_son` cho nhóm `limit`.
- Tên bài, thứ tự, `topic_id` và sáu `lesson_id` khớp `content/syllabus.json`; sáu bài khớp 1:1 sáu lesson Oak đúng thứ tự. `difficulty` 1-1-2-2-1 = bảy điểm.
- **Lựa chọn phân biệt được bằng hình, không cần chữ:** đọc hết 33 câu có lựa chọn, không câu nào có hai hình gần giống nhau (luật Explorer số 7), không câu nào hỏi tên hay chữ (luật 1), mọi lựa chọn là một vật cụ thể (luật 2), mọi `brief` ghi "không có chữ" (luật 4).
- **Đúng khoa học ở mức 5–7 tuổi:** chim cánh cụt có lông vũ và dùng cánh để bơi; "phần lớn bò sát đẻ trứng" và câu hỏi chỉ hỏi cá sấu; nòng nọc là ếch con; cá heo và dơi là động vật có vú; "phần lớn động vật có vú đẻ con"; "phần lớn cá có vảy"; "cá cũng là thịt"; thạch sùng bám tường, trâu nhai lại, bói cá bắt cá bằng mỏ — mọi dòng `[CẦN KIỂM]` tester đọc đều đúng, trừ một chỗ ở C1 (lỗi là bản VI, không phải kiến thức).
- An toàn: không con vật chết, không cảnh săn mồi đẫm máu (cò ngậm cá nhỏ, ghi rõ "không có máu"), không con vật bị xích hay nhốt chật, không người lộ mặt (chỉ bàn tay, mái tóc sau gáy, hai bàn chân), không logo, biển, chữ; không hỏi "nhà em nuôi con gì"; rắn chọn ảnh hiền và có dòng nhờ xác nhận loài; mâm cơm loại món gây tranh cãi.
- Không dùng ví dụ quiz của Oak (thỏ trong quiz, gấu Bắc Cực, cá mập, hươu cao cổ, sói, sóc, cá hề, cá hồi, sư tử, gấu trúc, chim cổ đỏ): grep sáu bài không thấy chữ nào trong số đó. Không nhắc tên Oak. Không dùng "structure" · "cấu tạo", "máu nóng", "máu lạnh", "có xương sống" trong chữ cho bé.

### Lỗi chặn (1)

**C1. Bài 2, ô Học "Milk": bản VI bỏ mất "động vật có vú", thành một câu sai mà chính chủ đề này bác lại hai lần.**
- `02-dong-vat-co-vu.md:139-140`: `sentence.en: Baby mammals drink milk from their mother.` · `sentence.vi: Con non bú sữa mẹ.`
- Bản EN đúng. Bản VI không có chủ ngữ giới hạn, nên bé nghe thành "con non nào cũng bú sữa mẹ". Ý chính 2 của chính bài (`02:28`) viết đủ: "Con non của động vật có vú bú sữa mẹ."
- Chủ đề bác lại câu này hai lần sau đó: bài 3 w1 (`03:53`) "Mèo con bú sữa. Gà con ăn thóc."; bài 4 ô "Baby frogs" (`04:187-199`) nòng nọc sống dưới nước, mọc chân. Bé nào nhớ ô "Sữa" theo bản VI sẽ trả lời sai chính câu w1 bài 3.
- **Vì sao chặn:** đây là chữ app đọc lên (`tts` sinh audio từ đúng chuỗi này), và là ô định nghĩa của một trong ba từ `core` của bài (`milk`). Sửa trước khi chạy `tts` và `build`; sửa sau thì phải thu lại.
- **Sửa:** `02:140` → `sentence.vi: Con non của động vật có vú bú sữa mẹ.` (khớp `02:28`; EN giữ nguyên). Kiểm luôn hai chỗ cùng ý đã đúng, không cần sửa: `02:521-522` từ `milk` ("Kittens drink their mother's milk." · "Mèo con bú sữa mẹ."), `02:146-147` ví dụ hai của ô.

### Nên sửa (6)

**N1. Bài 2 q5: hình câu hỏi "trời chiều" là đúng giờ con dơi, mà dơi là đáp án.**
- `02:438-455`. Hình câu hỏi (`02:445`) "Bầu trời lúc chạng vạng … trên một rặng tre"; ba lựa chọn: dơi (đúng), chim sẻ, cò. Ô Học của chính bài vừa nói `02:168-169` "a bat flies at night" · "con dơi bay ban đêm".
- Bé chưa đọc chữ chỉ có hai nguồn tin: câu app đọc và hình. Hình chạng vạng trỏ thẳng vào con bay đêm, nên câu chạy được mà không cần ý "có lông mềm, bú sữa mẹ" — trái `_topic.md:165` ("hình câu hỏi là cảnh trung tính … không tả sẵn đáp án hay bằng chứng").
- Cùng kiểu, nhẹ hơn: `05:325` bài 5 q1 "Which animal has wings?" cũng dùng ảnh trời chiều này, ba lựa chọn vịt (đúng), thằn lằn, chó — nền trời gợi con biết bay.
- **Sửa:** đổi hình câu q5 bài 2 sang `ho-hap/vi-sao-ta-phai-tho` `q3` (sân nhà làng quê) — chủ đề đã dùng hình này làm hình câu hỏi ở bài 1 q5, bài 3 q4, bài 4 q5, chưa dùng ở bài 2. Ảnh trời chiều vẫn giữ làm hình gốc, nhưng chuyển `[ảnh]` sang câu w2 (`02:68`, đáp án là con trâu, không liên quan trời chiều) và cho q5 trỏ ngược lên, kèm sửa bảng `_topic.md:208`. Bài 5 q1 đổi sang `w1` góc vườn của bài 1 hoặc `ca-va-luong-cu/q1` ao làng — chọn cảnh không phải bầu trời.

**N2. Bài 6 q4: bản VI của câu hỏi đọc ra thành một câu hỏi khác.**
- `06-con-vat-an-gi.md:443-444`: `prompt.en: We eat plants and meat. Who else does?` · `prompt.vi: Mình ăn cả thực vật lẫn thịt. Con nào cũng vậy?`
- "Con nào cũng vậy?" trong tiếng Việt đọc tự nhiên thành "có phải con nào cũng vậy không?" (câu hỏi phổ quát), không phải "còn con nào giống mình?" (chọn một trong ba). Bé nghe xong không biết phải chạm gì; mà đây là câu DOK 2 của bài ôn.
- **Sửa:** `06:444` → `prompt.vi: Mình ăn cả thực vật lẫn thịt. Con nào ăn giống mình?` (EN giữ nguyên, tám từ). Kiểm luôn `06:449` gợi ý "Em nhớ lại ô Ăn tạp nhé." — vẫn hợp.

**N3. Bài 1 q4: "cơm trộn cá" cho mèo con; nhận ngay phương án thay của chính biên tập.**
- `01-con-vat-nuoi-trong-nha.md:411-432`, dòng `[CẦN KIỂM]` ở `01:423`, phương án thay ở `01:614`.
- Ba lý do nhận phương án thay thay vì chờ thú y: (a) mèo là loài ăn thịt bắt buộc, "cơm trộn cá" là thói quen nuôi chứ không phải thức ăn đúng, mà câu này là lời khuyên chăm sóc thú cưng bé có thể làm theo; (b) gợi ý của chính câu (`01:416-417`) nói "Think what cats like to catch." · "mèo thích bắt con gì" — bát cơm không phải thứ mèo bắt; (c) bài 6 q6 (`06:507`) hỏi lại đúng ý này và đã dùng "cá nhỏ".
- **Sửa:** `01:426-432` đổi `q4_rice_fish` thành `q4_fish`, `label.en: small fish` · `label.vi: cá nhỏ`, dùng lại hình `q1_fish` của bài 6 (`06:369-376`, đàn cá nhỏ bơi trong nước) — đổi luôn bài 6 thành bài phụ trách hình đó hoặc chuyển `[ảnh]` lên bài 1; sửa `01:418-421` giải thích ("Yes! Cats like fish. Give fresh water, too." giữ được), sửa bảng Hình dùng chung `_topic.md:226` và danh sách ảnh `01:611`. Ba nhãn cũng về cùng dạng (cá nhỏ · bó cỏ · nải chuối).

**N4. Bài 3 q3: đáp án là ảnh mới duy nhất của câu.**
- `03-chim-va-bo-sat.md:379-420`. Đáp án `q3_snake` (`03:397-404`) là ảnh mới; hai lựa chọn sai là gà mái (bài 1) và thỏ (ô Học bài 2). Ghi chú của chính câu (`03:395`) viết điều này ra như một điểm đạt.
- Với bé 5–7 tuổi, tấm ảnh chưa từng thấy hút mắt; chọn "con lạ" là xong câu mà không cần dấu hiệu "da khô phủ vảy". Đây là mặt ngược của luật `_topic.md:166`, luật mới chặn một chiều.
- **Sửa:** đổi đáp án sang thạch sùng — dùng lại `tray_gecko` (`03:272-279`, món Chơi bé vừa chạm), giữ gà mái và thỏ; sửa `03:391-394` giải thích ("Yes! A gecko is a reptile." · "Đúng rồi! Thạch sùng là bò sát."). Con rắn vẫn vào bài ở hình câu hỏi q5 (`03:471`) và từ `scales` (`03:595`), nên không mất ảnh nào; sửa bảng `_topic.md:214` bỏ "q3" khỏi dòng `q3_snake` và đổi tên key.

**N5. Bài 4 w2: hình là con cò đang bay, tức bằng chứng cho đáp án sai.**
- `04-ca-va-luong-cu.md:73-92`. `prompt.en: Every bird can fly.` · `answer: false`; hình (`04:82`) dùng lại `tray_egret` "Con cò bay trên bãi cỏ".
- `_topic.md:165` nêu chính câu này làm ví dụ đạt, vì tránh được ảnh chim cánh cụt. Nhưng tránh lộ đáp án mới là một nửa: bé chưa đọc chữ nhìn thấy một con chim **đang bay** ngay khi app đọc "Chim nào cũng biết bay" → chạm gật đầu. Luật Explorer số 5 muốn hình "vẽ đúng vật được nói tới"; ở đây vật được nói tới là "mọi loài chim", nên phải chọn một con chim trung tính về chuyện bay.
- **Sửa:** `04:82-84` đổi sang `ho-hap/vi-sao-ta-phai-tho` `tray_sparrow` (chim sẻ đậu trên cành — một con chim, đang đậu, không gợi bay cũng không gợi không bay). Không dùng gà mái hay vịt: hai con đó gợi sẵn "chim không bay". Gợi ý `04:86-87` giữ nguyên.

**N6. Bài 3, kệ Chơi: con vịt xếp ở nhóm "Chim biết bơi" nhưng vịt cũng bay.**
- `03:224-234` hai nhóm "Bird that flies" · "Chim biết bay" (sẻ, cò) và "Bird that swims" · "Chim biết bơi" (vịt `03:264-270`, chim cánh cụt). Biên tập đã ghi chỗ chồng lấn ở `03:222`.
- Bé chọn vịt làm "con biết bay" rồi thêm chim cánh cụt sẽ nhận `missing.tray_fly` dù trong khay đã có một con chim biết bay thật. Bé 5 tuổi khó hiểu vì sao.
- **Sửa (chọn một):** (a) bỏ món `tray_duck` khỏi kệ (còn bảy món, nhóm "Chim biết bơi" chỉ còn chim cánh cụt — đúng như bài 2 nơi nhóm "Trên trời" chỉ có dơi và "Dưới nước" chỉ có cá heo), sửa `_topic.md:288`; (b) giữ vịt nhưng đổi tên hai nhóm thành "Chim trên trời" · "Chim dưới nước", để nhóm nói chỗ bé thấy con vật chứ không nói khả năng. Tester nghiêng về (a): ít chữ hơn, và vịt cỏ trong ảnh cũng gần như không bay.

### Nhỏ (16)

- **n1. Bảng Phần Chơi bài 4 thiếu một món bẫy** (`_topic.md:289`): ghi "cá heo, thằn lằn", nhưng kệ có ba món bẫy — `04:310-316` `tray_duck` cũng ở nhóm `limit`, và ghi chú của chính bài (`04:217`) kể đủ ba. Thêm "vịt" vào ô.
- **n2. Quy ước hình nói chủ đề không có `[hình vẽ]`** (`_topic.md:159`), nhưng ba hình câu hỏi dùng lại hình vẽ `ho-hap/vi-sao-ta-phai-tho` `q3` (`01:459`, `03:429`, `04:474`). Sửa thành "không vẽ hình mới; ba hình câu hỏi dùng lại hình vẽ sân nhà của *Hô hấp*".
- **n3. Dòng `w1_buffalo` của bảng Hình dùng chung không ghi `alt` đổi** (`_topic.md:182`), trong khi dòng `w1_elephant` ngay dưới (`:183`) có ghi. Đếm máy: mười một chỗ dùng lại ảnh trâu đều đổi `alt` thành "A water buffalo" · "Con trâu" (gốc `trai-dat-rat-lau-ve-truoc`: "An animal with two curved horns" · "Con vật có hai sừng cong"); ba chỗ ảnh voi đổi tương tự. Thêm một câu vào dòng trâu cho khớp cách làm.
- **n4. Gợi ý bài 1 q4 không khớp đáp án** (`01:416-417`): "Think what cats like to catch." · "Em nghĩ xem mèo thích bắt con gì nhé." nhưng đáp án là bát cơm trộn cá. Nhận N3 thì hết; giữ bát cơm thì đổi gợi ý thành "Think what people feed a cat." · "Em nghĩ xem người cho mèo ăn gì nhé."
- **n5. Một ví dụ VI đọc to không xuôi** (`04:198-199`): "then they hop on land" · "rồi lên bờ nhảy". Đề xuất "rồi nhảy lên bờ".
- **n6. Hai thẻ của bài 4 q4 dễ nhìn thành một** (`04:453-465`): "trứng ếch" (đám trong suốt có chấm đen trên mặt nước) và "nòng nọc" (đàn con đen trong nước) đều là mảng đen trong nước; câu sắp thứ tự hỏng nếu bé không phân biệt được. Ghi chú hoạ sĩ (`04:614`) mới yêu cầu "cùng cỡ trong khung"; thêm yêu cầu cắt cận để thấy rõ chấm trứng trong màng so với đầu tròn và đuôi của nòng nọc.
- **n7. Hai thẻ từ vựng gần trùng nhau** (`04:577-586` `fins` `extra` "vây" và `05:573-583` `fin` `core` "vây"): cùng nghĩa, cùng ảnh cận vây cá, chỉ khác số ít số nhiều; bé Explorer nghe, không đọc, nên hai thẻ nghe y hệt. Đề xuất bỏ `fins` ở bài 4 (bài còn bốn từ, vẫn đúng luật) hoặc đổi bài 4 sang `tail` · "đuôi".
- **n8. EN và VI lệch nhau ở một ví dụ** (`05:129-130`): "long legs help a frog jump" · "chân sau dài giúp ếch nhảy xa". VI thêm "sau" và "xa". Khớp lại một trong hai (VI đúng hơn, nên sửa EN thành "long back legs help a frog jump", bảy từ).
- **n9. Thẻ thưởng bài 3: VI dài hơn EN một vế** (`03:621-622`) "A gecko can walk up walls." · "Thạch sùng bò được lên tường, cả trên trần nhà." Biên tập đã ghi `>` và đề xuất sửa EN (`03:626`). Chọn một trong hai, đừng để lệch.
- **n10. Thẻ thưởng bài 6: VI chi tiết hơn EN và hơi thô khi đọc to** (`06:615-616`) "A buffalo chews its food again and again." · "Trâu nuốt cỏ rồi ợ lên nhai lại nhiều lần." Đề xuất VI "Trâu nhai lại thức ăn nhiều lần."
- **n11. Nhãn đáp án bài 1 q4 dài hơn hai nhãn sai** ("rice and fish" ba từ, "cơm trộn cá" ba tiếng, so với "grass" · "bó cỏ", "bananas" · "nải chuối"). Explorer không hiện chữ trên thẻ nên không lộ đáp án; chỉ lệch nếp chung. Hết nếu nhận N3.
- **n12. Ba chỗ hình câu hỏi gợi đáp án ở mức nhẹ** (cùng kiểu N1, chưa tới mức phải sửa): `05:46` w1 ao làng, gợi ý "Con nào sống dưới nước?", đáp án cá vàng; `06:403` q3 ao làng, đáp án cá sấu là con duy nhất ở nước trong ba con; `01:503` q6 phòng khách, mà ảnh cá vàng trong bể là ảnh trong nhà duy nhất trong ba lựa chọn. Cả ba chỗ hình đều đẩy bé theo hướng suy nghĩ đúng chứ không cho lối tắt lạ, nên ghi lại để biên tập cân nhắc, không bắt sửa.
- **n13. Bài 2 w2 mượn hình của câu q5 cùng bài** (`02:68`): `[ảnh]` gốc nằm ở q5 (`02:445`) trong khi chỗ dùng đầu tiên là w2. Nhận N1 thì chuyển `[ảnh]` lên w2 luôn.
- **n14. Bảng Hình dùng chung ghi "—" không đều**: có dòng cho năm hình chỉ dùng một chỗ (`explore_no_fly`, `chim-va-bo-sat/q6`, `q6_dragonfly`, `con-vat-nuoi-trong-nha/q6`, `co-the-cac-con-vat/q6`) nhưng bỏ chín hình một-chỗ khác (`q1_worm`, `q4_eggs`, `q4_rice_fish`, `tray_stool`, `tray_rubber_duck`, `tray_stone_lion`, `w1_lotus`, `w1_hat`, hình thẻ `kingfisher_card`). Chọn một cách: hoặc chỉ liệt kê hình dùng từ hai chỗ trở lên, hoặc liệt kê hết.
- **n15. Khởi động chỉ có mốc một ngày tới bốn ngày**, không có mốc "khoảng một tuần" và "một tháng" (`_topic.md:280` đã nói lý do: đây là chủ đề Explorer đầu tiên). Ghi lại để khi soạn chủ đề Explorer số 2 nhớ cho bài 1 của nó ôn lại chủ đề này, không thì cả nhóm Explorer không bao giờ có mốc một tháng.
- **n16. "Em nghĩ sao?" chưa có trong schema** (`01:631-634`), mà ghi chú bài 6 w3 (`06:113`) viết như thể bé đã trả lời ("để bé tự so với câu trả lời lúc đầu chủ đề"). Chữ bé nghe không phụ thuộc vào đó nên không hỏng; chỉ đừng thêm câu "Lúc đầu em nghĩ…" (`06:644`) vào chữ cho bé khi chưa có `think_first`.

### Chưa kiểm

- Không chạy `tts`, `build`, `import`, `ids`; không chạy lại `validate`; không dùng simulator. Màn Explorer thật (số từ trên một màn Chơi, chip nhóm có chữ, `order_sequence` chưa có renderer) thuộc SK-040 lượt 2, tester chưa kiểm được trên máy.
- Không đối chiếu sách CT GDPT 2018 lớp 1 (`_topic.md:94`), không kiểm giấy phép ảnh (chưa có ảnh), không nghe thử giọng đọc các từ khó ("douc", "parakeet", "amphibian", "herbivore", "carnivore", "omnivore", "kingfisher").

## content-editor 12/11 · sửa theo tester

Đã đọc "Main session chốt 12/11" trước khi sửa. Không chạy lệnh. Không đổi dòng `id:` nào; không thêm khối mới cần id (các khối đổi là `#### option`/`#### item`, không có id). Một khối có id bị xoá: từ vựng `fins` bài 4 (id `d4bb8a48-8fba-425a-86a9-b5fa542bcbef`, n7); phiên chính chạy lại `validate`.

**Đã sửa**
- **C1** bài 2 ô "Milk": `sentence.vi` → "Con non của động vật có vú bú sữa mẹ."
- **N1** bài 2 q5: hình câu hỏi → sân nhà làng quê (`ho-hap` `q3`); ảnh trời chiều thành hình gốc ở w2 (n13 xong luôn). Bài 5 q1: hình câu hỏi → góc vườn bài 1 (không phải bầu trời, không phải ao vì đáp án là con vịt).
- **N2** bài 6 q4: `prompt.vi` → "Mình ăn cả thực vật lẫn thịt. Con nào ăn giống mình?"
- **N3** bài 1 q4: `q4_rice_fish` → `q4_fish` "small fish" · "cá nhỏ"; `explanation_wrong` → "The answer is the small fish." · "Đáp án là cá nhỏ. Mèo thích ăn cá."; bỏ `[CẦN KIỂM]` cơm trộn cá. Hình gốc đàn cá nhỏ chuyển từ bài 6 `q1_fish` lên bài 1 `q4_fish` (n4, n11 xong luôn).
- **N4** bài 3 q3: đáp án `q3_snake` → `q3_gecko` (dùng lại `tray_gecko`); giải thích → "Yes! A gecko is a reptile." · "Đúng rồi! Thạch sùng là bò sát."; "The answer is the gecko. It has scales." · "Đáp án là thạch sùng. Thạch sùng có vảy.". Ảnh rắn thành hình gốc ở hình câu q5; bài 3 `scales`, bài 5 `tray_snake`, bài 6 w1 trỏ sang `chim-va-bo-sat/q5`. Thêm một `[CẦN KIỂM]`: ảnh thạch sùng đủ nét để thấy da sần.
- **N5** bài 4 w2: hình → chim sẻ đậu (`ho-hap` `tray_sparrow`).
- **N6** chọn (a): bỏ món `tray_duck` ở kệ bài 3 (còn bảy món; nhóm "Chim biết bơi" chỉ còn chim cánh cụt). Lý do: phương án (b) đổi tên nhóm thành "trên trời / dưới nước" thì nhóm nói chỗ ở, mất ý chính của kệ là có chim không biết bay (`all_birds_fly`); (a) ít chữ hơn và giống bài 2.
- **Nhỏ đã sửa:** n1 (bảng Chơi bài 4 thêm vịt), n2 (Quy ước hình mục 1 ghi rõ ba hình câu hỏi dùng lại hình vẽ của *Hô hấp*), n3 (dòng trâu ghi `alt` đổi), n5 (bài 4 "rồi nhảy lên bờ"), n6 (brief trứng ếch cắt cận thấy chấm trong hạt thạch, thẻ nòng nọc cắt cận thấy đầu và đuôi), n7 (bỏ từ `fins` bài 4), n8 (bài 5 EN "long back legs help a frog jump"), n9 (thẻ bài 3 EN "A gecko can walk on walls and ceilings."), n10 (thẻ bài 6 VI "Trâu nhai lại thức ăn nhiều lần."), n14 (bảng Hình dùng chung chỉ liệt kê hình dùng từ hai chỗ trở lên, bỏ các dòng "—"), n15 (ghi chú trong `_topic.md` mục Khởi động: chủ đề Explorer số 2 ôn chủ đề này), n16 (ghi chú bài 6 w3 và Ghi chú cho dev không nhắc câu trả lời "Em nghĩ sao?" trong chữ cho bé).
- **Nhỏ không sửa:** n12 (ba hình câu hỏi gợi nhẹ: bài 5 w1, bài 6 q3 ao làng; bài 1 q6 phòng khách). Tester cũng ghi là không bắt sửa; hình chỉ đẩy bé theo hướng suy nghĩ đúng của bài (sống dưới nước, sống trong nhà), không cho lối tắt ngoài ý bài. Đổi thì phải lấy thêm cảnh trung tính khác, mà chủ đề đã có năm cảnh nền dùng lặp.
- Cập nhật kèm: `_topic.md` (bảng Hình dùng chung, Quy ước hình mục 6 thêm luật "đáp án không là ảnh mới duy nhất", số ảnh mới bốn mươi sáu), Ghi chú cho hoạ sĩ bài 1, 2, 3, 4, 6; Ghi chú cho dev bài 3.

**Chữ trẻ nghe đổi** (cần sinh lại giọng nếu đã chạy `tts`)
| Bài · chỗ | Trước | Sau |
| --- | --- | --- |
| 2 `explore_milk` `sentence.vi` | Con non bú sữa mẹ. | Con non của động vật có vú bú sữa mẹ. |
| 6 q4 `prompt.vi` | … Con nào cũng vậy? | … Con nào ăn giống mình? |
| 1 q4 lựa chọn đúng `label` | rice and fish · cơm trộn cá | small fish · cá nhỏ |
| 1 q4 `explanation_wrong` | The answer is rice and fish. · Đáp án là cơm trộn cá. Mèo thích ăn cá. | The answer is the small fish. · Đáp án là cá nhỏ. Mèo thích ăn cá. |
| 3 q3 lựa chọn đúng `label` | snake · con rắn | gecko · thạch sùng |
| 3 q3 `explanation_correct` | Yes! A snake is a reptile. · Đúng rồi! Rắn là bò sát. | Yes! A gecko is a reptile. · Đúng rồi! Thạch sùng là bò sát. |
| 3 q3 `explanation_wrong` | The answer is the snake. It has scales. · Đáp án là con rắn. Rắn có vảy. | The answer is the gecko. It has scales. · Đáp án là thạch sùng. Thạch sùng có vảy. |
| 3 kệ Chơi | có món Duck · Con vịt | bỏ món này |
| 3 thẻ `gecko_card` `fact.en` | A gecko can walk up walls. | A gecko can walk on walls and ceilings. |
| 4 `explore_tadpoles` `examples.4.vi` | rồi lên bờ nhảy | rồi nhảy lên bờ |
| 4 từ vựng | fins · vây | bỏ |
| 5 `explore_legs` `examples.4.en` | long legs help a frog jump | long back legs help a frog jump |
| 6 thẻ `buffalo_card` `fact.vi` | Trâu nuốt cỏ rồi ợ lên nhai lại nhiều lần. | Trâu nhai lại thức ăn nhiều lần. |

`alt` đổi (VoiceOver đọc) ghi ở bảng "Hình đổi sau rà chữ" dưới đây.

## Hình đổi sau rà chữ

| Bài · chỗ | Trước | Sau | Ghi chú cho designer |
| --- | --- | --- | --- |
| 2 w2 (hình câu hỏi) | Dùng lại `dong-vat-co-vu/q5` (trời chiều) | `[ảnh]` gốc trời chiều (brief như cũ), key gốc nay là `dong-vat-co-vu/w2` | Cùng ảnh, chỉ đổi key gốc |
| 2 q5 (hình câu hỏi) | `[ảnh]` gốc trời chiều | Dùng lại `ho-hap/vi-sao-ta-phai-tho` `q3` (sân nhà, hình vẽ); `alt` "A yard in a village" · "Sân nhà ở làng quê" | |
| 3 q3 (hình câu hỏi) | Dùng lại `dong-vat-co-vu/q5` | Dùng lại `dong-vat-co-vu/w2` (cùng ảnh trời chiều) | Chỉ đổi key trỏ tới |
| 5 q1 (hình câu hỏi) | Dùng lại `dong-vat-co-vu/q5` (trời chiều) | Dùng lại `con-vat-nuoi-trong-nha/w1` (góc vườn); `alt` "A village garden" · "Góc vườn ở làng quê" | |
| 1 q4 lựa chọn đúng | `q4_rice_fish` `[ảnh]` bát cơm trộn cá | `q4_fish` `[ảnh]` đàn cá nhỏ còn sống bơi trong nước nông (brief cũ của `con-vat-an-gi/q1_fish`); `alt` "Small fish in water" · "Cá nhỏ dưới nước" | Bỏ ảnh bát cơm; ảnh đàn cá nhỏ nay là gốc ở bài 1 |
| 6 q1 lựa chọn `q1_fish` | `[ảnh]` gốc đàn cá nhỏ | Dùng lại `con-vat-nuoi-trong-nha/q4_fish` | Cùng ảnh |
| 6 q6 lựa chọn `q6_fish` | Dùng lại `q1_fish` | Dùng lại `con-vat-nuoi-trong-nha/q4_fish` | Cùng ảnh |
| 3 q3 lựa chọn đúng | `q3_snake` `[ảnh]` rắn xanh trên cành | `q3_gecko`, dùng lại `tray_gecko`; `alt` "A gecko on a wall" · "Con thạch sùng trên tường" | Ảnh thạch sùng đủ nét để thấy da sần |
| 3 q5 (hình câu hỏi) | Dùng lại `q3_snake` | `[ảnh]` gốc rắn xanh trên cành (brief cũ của `q3_snake`), key gốc nay là `chim-va-bo-sat/q5` | Cùng ảnh, chỉ đổi key gốc |
| 3 từ `scales`; 5 `tray_snake`; 6 w1 | Dùng lại `q3_snake` | Dùng lại `chim-va-bo-sat/q5` | Chỉ đổi key trỏ tới |
| 3 kệ Chơi `tray_duck` | Dùng lại `w1_duck` | Bỏ món | |
| 4 w2 (hình câu hỏi) | Dùng lại `ho-hap` `tray_egret` (cò bay) | Dùng lại `ho-hap` `tray_sparrow`; `alt` "A sparrow on a branch" · "Chim sẻ đậu trên cành" | |
| 4 q4 thẻ `q4_eggs` | Brief đám trứng ếch | Brief thêm: cận cảnh, thấy rõ chấm đen trong hạt thạch, không có nòng nọc | `alt` giữ |
| 4 q4 thẻ `q4_tadpole` | Dùng lại `explore_tadpoles` | Giữ, thêm dòng `>`: cắt cận một hai con thấy đầu tròn và đuôi | Ghi `crop` |
| 4 từ vựng `fins` | Dùng lại `ho-hap` `q2_fins` | Bỏ từ (bài 5 `fin` vẫn dùng ảnh này) | |

## designer 12/11 · hình

Theo SK-033 ("Hợp đồng ảnh"), cách làm SK-038, SK-039, Quy ước hình và Hình dùng chung ở `_topic.md`, bảng "Hình đổi sau rà chữ" ở trên (đã dựng lại khoá từ `.md` mới nhất bằng `images search --cache-only --out <scratchpad>`). Chờ Duy duyệt; chưa build, chưa commit. Không sửa `.md`.

**File**
- File chọn ảnh: `content/images/explorer/goi-ten-va-nhom-dong-vat/{con-vat-nuoi-trong-nha,dong-vat-co-vu,chim-va-bo-sat,ca-va-luong-cu,co-the-cac-con-vat,con-vat-an-gi}.json` (240 mục; 241 khoá, 1 trống). Tool nhận đường dẫn `explorer` (search, fetch, `SelectionSet`). Kiểm offline: 0 lỗi, mọi `same_as` tìm được, mỗi câu và mỗi kệ một loại hình (toàn ảnh chụp; bốn hình câu hỏi là sân nhà vẽ của *Hô hấp*, như brief).
- Không có hình tự vẽ, hình ghép mới (`content/images/own/goi-ten-va-nhom-dong-vat/` không cần tạo).
- Trang duyệt (ngoài git): `content/.build/images/goi-ten-va-nhom-dong-vat/index.html`, `<bài>/review.html` (mỗi hàng: đầy đủ, ô lưới 2:1, ô vuông).

**Dùng lại ảnh Discoverer: `same_as` + `lesson` không trỏ sang nhóm tuổi khác** (`SelectionSet.fileOf(ageGroup, …)` chỉ tìm trong `explorer/`). Vì vậy 90 mục dùng lại ảnh của *Khủng long*, *Hô hấp* được **chép nguyên mục gốc** (cùng `file_url`, `crop`, `title`, giấy phép; cache trùng nên không tải lại), `note` ghi "Chép mục gốc `<key>` ở discoverer/<bài>". Đề xuất cho dev: cho `lesson` có tiền tố nhóm tuổi (vd `discoverer/khung-long/khung-long-la-gi`) để khỏi chép; khi đó thay các mục chép bằng `same_as`.

**Số hình** (46 ảnh nguồn mới, khác trang gốc)

| Bài | Ảnh mới | Dùng lại (trong chủ đề + chép Discoverer) | Trống |
| --- | --- | --- | --- |
| 1 Con vật nuôi trong nhà | 14 | 25 | 0 |
| 2 Động vật có vú | 8 | 27 | 1 (`q6`) |
| 3 Chim và bò sát | 9 (1 là bản cắt khác của ảnh ô Học) | 33 | 0 |
| 4 Cá và lưỡng cư | 7 (1 bản cắt khác) | 32 | 0 |
| 5 Cơ thể các con vật | 5 | 39 | 0 |
| 6 Con vật ăn gì? | 5 | 36 | 0 |

- Giấy phép 46 ảnh mới: CC0 25, CC BY 2.0 11, CC BY 4.0 6, CC BY 3.0 2, CC BY 2.5 1, Public domain 1 (NOAA). Nguồn: Commons 38, Openverse/Flickr 8. Không BY-SA, NC, ND, AI, Pinterest, Rawpixel (đã loại 4 ứng viên Rawpixel và 1 StockSnap lọt qua Openverse). Ảnh CC0/PD đổi tên trung tính khi tên gốc lạ; ảnh CC BY giữ tên gốc.
- 8 ảnh Flickr: đã mở trang Flickr, giấy phép khớp (CC0: dơi, ghế đẩu, sư tử đá, vẹt; CC BY 2.0: trời chiều, cò ngậm cá, đĩa cơm, cá nhỏ).
- So với brief (46 ảnh mới sau rà chữ): 45 có ảnh mới hoặc dùng lại theo brief (`tray_croc` dùng lại `khung-long-la-gi/q1_reptiles`, cá sấu Xiêm hoang dã, như brief cho phép), 1 trống; thêm 2 ảnh ngoài brief (voi, chim sẻ đứng) thay hai ảnh dùng lại không đạt luật (dưới).
- Rắn (bài 3 `q5`, cả bài 5, 6): *Dendrelaphis philippinensis* (rắn roi đồng, họ Colubridae, không độc), nằm yên trên lá, miệng khép. Cò ngậm cá (bài 6): cò ngàng lớn ngậm cá nhỏ, không thấy máu.

**Chỗ trống: bài 2 `q6` (mái tóc bạn nhỏ từ phía sau).** Commons, Openverse 12/11 chỉ có ảnh người lớn, ảnh lộ mặt, ảnh trẻ khoả thân, tranh vẽ; ảnh hợp nhất là "Braids Hair" (CC0, tóc tết vàng, vai trần có dây áo) nhưng nguồn là StockSnap qua Openverse, ngoài danh sách nguồn nên không dùng. Hướng: (1) Duy cho phép StockSnap (CC0) thì gắn ngay; (2) nhóm tự chụp; (3) biên tập đổi hình câu hỏi thành cảnh trung tính đã có (vd góc vườn bài 1), vì câu "You have hair…" nghe được không cần hình tóc.

**Thay ảnh dùng lại không đạt luật**
- Voi (`trai-dat-rat-lau-ve-truoc/w1_elephant`): sau voi là hàng cọc dây thép (chuồng lộ rõ). Thay bằng ảnh voi châu Á đứng dưới nước (CC BY 2.0), gốc ở bài 2 `explore_big_small`; bài 2 `q4_elephant`, bài 5 `explore_special`, từ `trunk`, bài 6 `q3_elephant` trỏ về. Voi này là con trưởng thành (cắt từ ảnh đàn), không phải voi non.
- Chim sẻ bài 5 `q6_sparrow` (câu "hai chân giống em"): ảnh *Hô hấp* gần như không thấy chân; dùng ảnh chim sẻ đứng trên gờ, thấy rõ hai chân (CC BY 4.0). Các chỗ khác vẫn dùng ảnh *Hô hấp*.
- Trâu bài 5 `q4_buffalo` (xếp theo số chân): ảnh trâu bên suối khuất hai chân sau; trỏ về bài 6 `explore_plants` (trâu gặm cỏ, thấy đủ bốn chân).
- Đã kiểm thấy chân: cò bay (bài 5 Chơi) thấy hai chân duỗi sau.

**`order_sequence`** (cắt để con vật chiếm khung gần như nhau): bài 2 voi, mèo, trâu; bài 3 gà con, gà mái, ổ trứng (`q4_egg` là bản cắt sát của ảnh ô Học); bài 4 ếch, trứng ếch cắt cận, nòng nọc cắt cận hai con (`crop` trong file); bài 5 cá vàng, chim cánh cụt, trâu gặm cỏ.

**Đề xuất cho content-editor** (designer không sửa `.md`; chữ trẻ nghe không đổi, chỉ `brief`/`alt`)

| Bài · key (và chỗ dùng lại) | Hiện tại | Đề xuất |
| --- | --- | --- |
| 1 `w1` (các chỗ "góc vườn") | brief vườn làng VN có bãi cỏ | brief: hàng rào tre trước khu vườn (vườn thực vật, không phải VN); alt "A bamboo fence in a garden" · "Hàng rào tre trước khu vườn" |
| 1 `w1_duck` (mọi chỗ vịt) | alt "A duck on a pond bank" | ảnh vịt nhà đứng trên bờ đá có cỏ, không thấy ao; alt "A duck standing on the grass" · "Con vịt đứng trên bãi cỏ" |
| 1 `w1_hat` | nón lá trên ghế tre | brief: nón lá nhìn từ trên xuống, nền sáng; alt "A conical hat" · "Chiếc nón lá" |
| 1 `explore_pets` (`tray_dog`, `q3`, `q5_dog`, `pet`, bài 5 `q1_dog`) | chó vàng trên hiên | brief: chó trắng đốm nâu nằm trên sàn gạch trong nhà; alt "A dog lying on the floor" · "Chú chó nằm trên sàn nhà" |
| 1 `tray_croc` | `[ảnh]` | "Dùng lại hình `q1_reptiles` ở bài `khung-long/khung-long-la-gi`." |
| 1 `q4` | mèo con trên sàn gạch | brief: mèo con ngồi trên khúc gỗ, nền cây xanh, ngẩng nhìn lên (alt giữ) |
| 1 `q4_grass` (bài 6 `q1_grass`, `q6_grass`, `plant`) | bó cỏ buộc lạt | brief: khay cỏ tươi trong hộp kính; alt "Fresh green grass" · "Cỏ tươi" |
| 1 `q6` | phòng khách VN | brief: phòng khách có tủ gỗ, cửa sổ, đèn (không phải VN) (alt giữ) |
| 2 `w2` (bài 3 `q3`) | trời chiều trên rặng tre | brief: trời chiều cam trên rặng cây in bóng; alt "The evening sky over the trees" · "Trời chiều trên rặng cây" |
| 2 `explore_big_small` và các chỗ voi | Dùng lại `w1_elephant` (*Khủng long*) | `[ảnh]` riêng: voi châu Á đứng dưới nước; alt "An elephant in the water" · "Con voi dưới nước"; bài 2 `q4_elephant`, bài 5 `explore_special`, `trunk`, bài 6 `q3_elephant` "Dùng lại hình `explore_big_small` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`." |
| 2 `q3` (bài 4 `w3`) | nghé không có trâu mẹ | brief: nghé đứng trước, phía sau thấy chân trâu mẹ và một sợi dây thép rào bãi cỏ (đầu trâu mẹ đã cắt) (alt giữ) |
| 2 `q6` | mái tóc từ phía sau | chờ chọn hướng (mục Chỗ trống) |
| 3 `q5` (rắn, mọi chỗ) | rắn xanh trên cành | brief: rắn roi đồng sọc vàng nâu nằm trên lá; alt "A snake on the leaves" · "Con rắn nằm trên lá" |
| 3 `q4_egg` | Dùng lại `explore_eggs` | "Dùng lại ảnh `explore_eggs`, cắt sát ba quả trứng." |
| 5 `tray_stool` | ghế đẩu thấp trên sàn gạch | brief: ghế đẩu gỗ chân cao trên nền tối, thấy ba chân (alt giữ) |
| 5 `q6` | chân trần trên sàn gạch | brief: ảnh đen trắng hai bàn chân trần em bé ngồi trên ghế; alt "Two bare feet" · "Hai bàn chân trần" |
| 5 `q6_sparrow` | Dùng lại `tray_sparrow` (*Hô hấp*) | `[ảnh]` riêng: chim sẻ đứng trên gờ, thấy hai chân (alt giữ) |
| 5 `q4_buffalo` | Dùng lại `w1_buffalo` (*Khủng long*) | "Dùng lại hình `explore_plants` ở bài `goi-ten-va-nhom-dong-vat/con-vat-an-gi`."; alt "A buffalo eating grass" · "Trâu gặm cỏ" |
| 6 `explore_both` (`q4`, `omnivore`) | mâm cơm gia đình VN | brief: một đĩa cơm, đậu xanh và miếng cá (không có ảnh hợp lệ mâm cơm VN không người) (alt giữ) |
| 6 `tray_stone_lion` | nghê đá VN | brief: tượng sư tử đá đỏ kiểu Trung Hoa trên bệ (alt giữ) |

**`images fetch content/images/explorer/goi-ten-va-nhom-dong-vat`** (một tiến trình): 6 file chọn ảnh · 61 ảnh khác nhau · 47 tải mới · 14 đã có · **0 lỗi**; hình tự vẽ 1 (sân nhà *Hô hấp*, đã có). 8 dòng "Kiểm tay" Flickr đã kiểm (trên).
- Commons 429: 3 lần khi tìm (lượt đầu, giãn 2,5 s), rồi giãn 4–5 s không còn 429; 3 lần khi fetch, mỗi lần qua sau lượt chờ đầu (Retry-After 21–40 s). Không lượt nào bị 429 quá 3 lần liên tiếp.
- Openverse: designer 45 lượt (tìm), fetch 8 lượt kiểm chi tiết; tổng hôm nay 53/80. Đã cộng 45 lượt ngoài bộ đếm vào `content/.build/images/.cache/openverse-usage.json` (8 → 53). Ảnh nhỏ xem trước tải thẳng từ Flickr, không qua API Openverse.

**Chưa chắc**
- Gà mẹ và gà con (bài 1 ô Học, từ `animal`, bài 6 `explore_food`): gà con nhỏ trong khung (ảnh dọc, cắt hết mức còn nét).
- Nón lá nhìn từ trên, ánh sáng xuyên qua lá nón có bóng mờ phía sau (không nhận ra người); bé có thể khó nhận ra là nón.
- Ảnh nhỏ: vẹt 460×615, sư tử đá 512×601, voi khoảng 525 px ngang sau cắt; hơi mềm trên iPad.
- Nghé bài 2 `q3`: còn thấy chân, bụng trâu mẹ phía sau; nếu Duy muốn nghé hoàn toàn một mình thì cần tìm tiếp.
- Bài 1 `q4`: mèo ăn cả cỏ đôi khi; câu do biên tập chốt, chỉ ghi để tester xem.

## dev 13/11 · bài mở rộng

Duy 13/11 thêm 2 bài mở rộng (động vật không xương sống) vào cuối chủ đề Oak `naming-and-grouping-animals`; Oak không có lesson tương ứng. Trước khi sửa, `validate content` báo `syllabus_oak` cho hai bài này vì `oak_lessons` rỗng. Chưa commit.

**Đã làm**
- `packages/content-schema/schema/syllabus.schema.json`: `SyllabusLesson` thêm trường `extension` (boolean, mặc định false, chỉ ghi khi true), giống `sensitive`. Trường mới là tuỳ chọn nên `syllabus.json` cũ vẫn hợp lệ.
- `packages/content-schema/scripts/lib/syllabus.mjs`, luật `syllabus_oak` mở rộng. Bài `extension: true`:
  - chỉ nằm trong chủ đề Oak;
  - có `oak_lessons` rỗng;
  - có `statutory: false` (bài mở rộng không thuộc chương trình bắt buộc của Anh);
  - đứng sau mọi bài Oak: bài Oak đứng sau bài mở rộng là lỗi, chỉ vào bài Oak đó;
  - chủ đề Oak phải còn ít nhất 1 bài Oak; toàn bài mở rộng thì đó là chủ đề mới (`source.kind = new`).
  - Bài Oak thiếu `oak_lessons` vẫn lỗi như cũ; thông báo giờ nhắc ghi `"extension": true` nếu là bài riêng.
- `content/syllabus.json`: bài 7 *Insects and other many-legged animals* và bài 8 *Snails, octopuses and sea animals* có `"extension": true`.
- Số bài trong test đổi theo danh mục: explorer 73 thành 75, tổng 384 thành 386. Sửa ở `packages/content-schema/test/syllabus.test.mjs` và `tools/content-cli/test/syllabus.test.ts`.
- Thêm 8 ca test trong `syllabus.test.mjs`. Hợp lệ: một bài mở rộng; hai bài mở rộng, có `sensitive`. Lỗi: có `oak_lessons`, `statutory: true`, bài Oak đứng sau, nằm trong chủ đề mới, chủ đề Oak toàn bài mở rộng, `extension` không phải boolean.
- README `packages/content-schema` (bảng `SyllabusLesson`, luật) và README content-cli (bảng mã `syllabus_oak`, dòng tổng 386 bài).
- `tools/content-cli`: không cần đổi type. `src/types/content-schema.d.ts` chỉ khai báo mã lỗi, mã không đổi.

**iOS (chỉ đọc, không sửa):** `Syllabus.LessonEntry` (`apps/ios/Packages/SKKit/Sources/ContentModel/Syllabus.swift`) tự viết `init(from:)` với `CodingKeys` number, title, statutory, sensitive, lesson_id. Container có khoá bỏ qua khoá lạ, nên `extension` không làm vỡ việc đọc `syllabus.json`. Gợi ý cho ios-dev, không bắt buộc: nếu muốn hiện nhãn "Mở rộng" ở danh sách bài thì thêm `extension` (`decodeIfPresent`, mặc định false).

**Kiểm (13/11, chạy 1 lần):**
- `packages/content-schema` `npm test`: 152/152 qua; `typecheck` và `validate` fixture đều OK.
- `tools/content-cli` `npm test`: 376/376 qua (gồm cả test cảnh báo tỉ lệ ảnh của SK-043); `typecheck` OK.
- `node tools/content-cli/src/cli.ts validate content`: 0 lỗi, 127 cảnh báo, exit 0. Syllabus 3 nhóm, 45 chủ đề, 386 bài, 48 bài có `lesson_id`. Cảnh báo là của nội dung: bài 7 và 8 còn dòng `[CẦN KIỂM]`, không có cảnh báo syllabus nào.

**Tester kiểm:** xoá `"extension": true` của bài 7 rồi validate thì ra 1 lỗi `syllabus_oak` ở `.../lessons/6/oak_lessons`. Chuyển bài 7 lên trước bài 6 (đánh số lại) thì ra lỗi "bài Oak đứng sau bài mở rộng".

## Rà chữ bài 7–8 (tester 13/11)

Phạm vi: `content/explorer/goi-ten-va-nhom-dong-vat/07-con-trung-va-con-vat-nhieu-chan.md`, `08-oc-bach-tuoc-va-con-vat-bien.md` và `_topic.md` đã cập nhật; đọc đối chiếu sáu bài trước, `content/rules.json` (`explorer.authoring`), `content/TEMPLATE.md` (bảy luật Explorer), `content/syllabus.json`, `syllabus.md`, yêu cầu Duy 13/11 (chân khớp · thân mềm · da gai · thân lỗ · sứa để riêng). Không sửa file nội dung, không chạy lệnh nội dung, không dùng simulator. `validate` do dev chạy 13/11 (0 lỗi, 127 cảnh báo `[CẦN KIỂM]`), tester không chạy lại.

Chạy lại năm script scratchpad của 12/11 (`check_struct.py`, `check_text.py`, `check_img.py`, `check_tf.py`, `check_hint.py` ở `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk041/`), cộng ba đoạn đếm mới: số từ EN **theo câu** của bài 7–8, màu và `role` của mọi nhóm Chơi tám bài, vị trí đáp án `single_choice` tám bài.

**Tổng kết: chặn 0 · nên sửa 6 · nhỏ 18.**

### Đạt (đã kiểm bằng máy, không có lỗi)

- Quiz sáu câu mỗi bài, DOK 1·1·1·2·2·2 (Explorer 3·3·0), câu một DOK 1, đúng một câu misconception ở q6; hai key mới `bugs_not_animals`, `starfish_is_fish` có thật trong `_topic.md`, mỗi key dùng một lần, không gắn ở Khởi động. Bài 7 ba format (`single_choice`, `true_false`, `order_sequence`), bài 8 hai format — đều ≥ `min_formats` 2. `single_choice` hai hoặc ba lựa chọn, `order_sequence` đúng ba thẻ. Khởi động ba câu mỗi bài, DOK 1, đủ `recall_from`, trỏ đúng bài trong chủ đề và bài được trỏ đã có `id`.
- **Số từ EN ≤ 8 theo từng câu** ở mọi chuỗi trẻ nghe (`prompt`, `hint`, `explanation`, `sentence`, `examples`, `messages`, `fact`): đếm máy bài 7–8 không câu nào quá tám từ. Chuỗi `.en` không có dấu tiếng Việt; chuỗi `.vi` không có chữ số, ký hiệu; `messages.full` đúng chữ chung; không nhãn nhóm nào có dấu phẩy; `has_limited` nói lý do, không nhắc chạm.
- **Không chỗ nào thiếu hình:** mọi lựa chọn, thẻ `order_sequence`, món kệ, câu Khởi động và Quiz đều đủ `image.brief` + `alt.en` + `alt.vi`. 258 chỗ "Dùng lại hình" cả chủ đề: mọi key có thật (gồm key của *Khủng long*, *Hô hấp*), không chỗ nào trỏ qua một hình dùng lại khác, từ khoá và `alt` chép đúng gốc (trừ dòng trâu đã ghi chủ ý từ 12/11).
- **Bảng Hình dùng chung cho bài 7, 8 đúng hết** (`_topic.md:252-265` và đoạn thêm `:267-270`): đối chiếu máy từng chỗ dùng lại, không dòng nào sai, không chỗ dùng nào thiếu. Mười sáu ảnh mới (tám mỗi bài) khớp mục "Ảnh cần tìm" của hai bài.
- `true_false`: chín câu (bài 7 năm, bài 8 bốn), **không câu nào phủ định**, không câu nào có `labels`, câu nào cũng có `image` cấp câu; đáp án Sai không có `explanation_correct` mở đầu "Yes!" · "Đúng rồi!"; mọi `explanation_wrong` đúng khuôn. Khớp đúng bảng Đúng/Sai `_topic.md:298-306`; tổng tám bài mười lăm Đúng · mười ba Sai như bảng ghi.
- **Vị trí đáp án khớp bảng `_topic.md:322-323`** từng ô, gồm thứ tự thẻ `order_sequence` bài 7 (trong file: cuốn chiếu, kiến, nhện → đúng: kiến, nhện, cuốn chiếu; thẻ trong file không nằm sẵn đúng thứ tự).
- Kệ Chơi khớp bảng `_topic.md:354-355`; cả hai bài ba chỗ, ba nhóm `required` + một nhóm `limit`; mọi món bẫy giống một nhóm bắt buộc (chim sẻ ~ con bay, thằn lằn ~ con bò; cá ngựa, cá heo ~ con biển). Ba ví dụ kiểm ở Ghi chú cho dev của mỗi bài cho ra đúng `balanced` · `has_limited` · `missing.*` khi tính tay theo `success_when`.
- Từ vựng: năm từ mỗi bài, đúng ba từ `core`, `term_keys` khớp ba từ `core`. Màu: bốn màu khác nhau trong mỗi khối (xem N1 về màu nhóm `limit`).
- `content/syllabus.json`: bài 7, 8 có `number`, `title` EN/VI khớp tên bài, `oak_lessons: []`, `statutory: false`, `extension: true`, `lesson_id` khớp đúng `id` ở frontmatter hai file. Không `id` trùng trong chủ đề.
- **Đúng khoa học ở mức 5–7 tuổi** (đọc hết các dòng `[CẦN KIỂM]`): côn trùng trưởng thành sáu chân; nhện và bọ cạp tám chân, càng bọ cạp không tính là chân; cua, tôm mười chân, đôi trước của cua là càng; cuốn chiếu, rết nhiều đôi chân (không nói một nghìn, một trăm); vỏ cua nói là "vỏ cứng bên ngoài", không nói "bộ xương ngoài"; cá, chim, thú, ếch, rắn có xương sống; ốc, bạch tuộc, mực là thân mềm và "con mực", không "cá mực"; sao biển, nhím biển, hải sâm da gai, phần lớn sao biển năm cánh; bọt biển là động vật, bám một chỗ, lọc thức ăn; **sứa để một ô riêng, ghi đúng là ruột khoang trong ghi chú, không xếp vào thân mềm**; cá ngựa là cá, có xương sống; bạch tuộc đổi màu da; kiến vàng được nhà vườn dùng bắt sâu hại. Không chỗ nào sai.
- An toàn, không gây sợ: không có ảnh rết, ảnh bọ cạp (chỉ có trong ví dụ chữ); nhện chụp vừa, không cận răng nanh, không nhện lông to; sứa trôi trong nước, không cảnh dạt bờ; ba lời dặn "đừng chạm" viết nhẹ, không doạ; không con vật chết (xem N2 về ảnh bộ xương), không người lộ mặt, không logo, biển, chữ.
- Luật Explorer: đọc hết mười ba câu có lựa chọn của hai bài — không câu nào hỏi tên hay chữ (luật 1), mọi lựa chọn là một vật cụ thể (luật 2), mọi `brief` ghi "không có chữ" (luật 4), không câu nào có hai hình dễ lẫn (luật 7). Một câu, một kệ một loại hình: toàn ảnh chụp, trừ hai hình **câu hỏi** dùng lại hình vẽ sân nhà của *Hô hấp* (07 q5, 08 q5) đúng ngoại lệ ở Quy ước hình mục 1.
- Nhãn `limit` "Has a backbone" · "Có xương sống" (không theo dạng "Not …"): **tester đồng ý giữ**. "Not without a backbone" là phủ định hai lần, khó nghe hơn; `prompt` và `messages.start` đã nói rõ việc cần làm, `messages.has_limited` nói đúng lý do. Nhưng phải đổi màu, xem N1.

### Lỗi chặn (0)

Không có chỗ nào sai kiến thức hay sai chữ trẻ nghe tới mức phải chặn `tts`. Sáu mục dưới nên sửa trước khi designer đi tìm mười sáu ảnh mới và trước khi chạy `tts`.

### Nên sửa (6)

**N1. Nhóm bẫy ở phần Chơi đổi màu: sáu bài trước `do_son`, bài 7 và 8 thành `nau_dat`.**
- `07:286` và `08:267`: `tray_backbone` `color: nau_dat`, `role: limit`. Trong khi `do_son` lại rơi vào một nhóm **bắt buộc**: `07:271-275` `tray_eight` "Tám chân", `08:252-256` `tray_spiny` "Da có gai".
- Đếm máy sáu bài trước: nhóm `limit` **luôn** là `do_son` (`01:259`, `02:251`, `03:245`, `04:257`, `05:244`, `06:263`). Bé Explorer chưa đọc được chữ trên chip nhóm; sau sáu bài, màu đỏ là tín hiệu "đừng lấy món này". Bài 7, 8 vừa bỏ tín hiệu đó, vừa đem màu đỏ gắn cho một nhóm cần lấy — bé dễ bỏ qua con nhện (bài 7) và con sao biển (bài 8) vì tưởng là món bẫy, và dễ nhặt chim sẻ, cá ngựa vì chip màu nâu trông như nhóm thường. Nhãn `limit` lại là câu khẳng định ("Có xương sống"), nên không còn gì báo cho bé biết đây là nhóm cần tránh.
- Màu ô Học của sáu bài trước **không** đi theo màu kệ Chơi (ví dụ bài 1: ô "Thú cưng" `vang_hoe`, kệ "Biết bay" `vang_hoe`), nên không có ràng buộc nào buộc bài 7 phải lấy `nau_dat` cho nhóm xương sống.
- **Sửa:** bài 7 `tray_backbone` → `do_son`, `tray_eight` → `nau_dat`; bài 8 `tray_backbone` → `do_son`, `tray_spiny` → `nau_dat`. Muốn giữ màu kệ khớp màu ô Học thì đổi luôn ô Học: bài 7 `explore_backbone` (`07:135`) → `do_son` và `explore_spiders` (`07:172`) → `nau_dat`; bài 8 `explore_spiny` (`08:153`) → `nau_dat`. Sửa kèm mục **Màu** ở Ghi chú cho hoạ sĩ (`07:624`, `08:621`).

**N2. Ô Học "Xương sống" dùng ảnh bộ xương con mèo — con mèo là thú cưng sống mà bé đã gặp ở cả sáu bài trước.**
- `07:132-147`, `brief` ở `07:138`: "Bộ xương một con mèo dựng trong tủ kính bảo tàng… thấy rõ cột sống chạy dọc lưng tới đuôi". Biên tập đã tự ghi dòng lo ngại ở `07:147` và đề nghị phương án thay là "xương cá trên đĩa sau bữa ăn".
- Ảnh `khung-long-la-gi/w3_cat` (mèo mướp trên bậc thềm) xuất hiện ở sáu bài, kể cả chính bài 7 (`07:380` lựa chọn `q1_cat`) và bài 8 (`08:105` w3). Bé năm tuổi nhìn bộ xương mèo ngay sau khi vừa thấy con mèo sống trong cùng bài rất dễ hiểu thành "con mèo chết rồi". Trái mục An toàn `_topic.md:195` ("Con vật sống, khoẻ mạnh… Không xác con vật") và `_topic.md:380` ("không nói chuyện thú cưng ốm, chết"). Phương án thay "xương cá trên đĩa" còn nặng hơn (con vật đã bị ăn).
- **Sửa (chọn một, PM hoặc Duy chốt vì là chuyện cảm xúc, không phải kiến thức):**
  - (a) Dùng lại bộ xương khủng long trong bảo tàng đã có ảnh ở repo: `trai-dat-rat-lau-ve-truoc/t_rex` (dùng ở `khung-long/03-hoa-thach-ke-chuyen-khung-long:172`, `alt` "A T. rex skeleton in a museum" · "Bộ xương khủng long bạo chúa trong bảo tàng"). Bé Explorer chưa học chủ đề *Khủng long* nên không lộ gì; bộ xương khủng long ở bảo tàng là thứ trẻ thấy vui chứ không thấy buồn. Phải sửa `sentence` cho khớp hình, ví dụ `sentence.en: Lots of animals have a backbone.` · `sentence.vi: Rất nhiều con vật có xương sống.` và đẩy "cá, chim, động vật có vú" xuống `examples`.
  - (b) Giữ ảnh bộ xương nhưng chọn con **không** xuất hiện ở chủ đề này dưới dạng con vật sống (ví dụ bộ xương cá voi treo ở bảo tàng), `alt` "An animal skeleton in a museum" · "Bộ xương con vật trong bảo tàng"; giữ nguyên `sentence`.
  - Không chọn: ảnh X-quang (brief đã loại), xương cá trên đĩa.

**N3. Kệ Chơi bài 7 xếp con cua, con tôm vào nhóm "Rất nhiều chân", trong khi ô Học vừa dạy "Cua có mười chân" là một nhóm riêng.**
- Ô Học `07:189-205`: `explore_crabs` nhãn "Crabs and shrimps" · "Cua và tôm", `sentence` "Crabs have ten legs and hard shells." · "Cua có mười chân và lớp vỏ cứng.". Ô kế `07:207-215`: `explore_millipedes` nhãn **"Lots of legs" · "Rất nhiều chân"**, chỉ gồm cuốn chiếu và rết.
- Kệ Chơi `07:277-281`: nhóm `tray_lots` lấy **đúng nhãn đó** "Lots of legs" · "Rất nhiều chân" nhưng gồm cua (`07:314-320`), tôm (`07:346-352`) và cuốn chiếu (`07:338-344`). Bảng `_topic.md:354` ghi đúng như file.
- Cùng một cụm chữ bé vừa nghe ở màn Học chỉ một nhóm, sang màn Chơi lại chỉ một nhóm khác. Nặng hơn: `brief` của ảnh cua (`07:195`) yêu cầu "thấy rõ hai càng và **tám chân bò**", nên bé đếm chân trên ảnh ra tám và có thể coi cua là món của nhóm "Tám chân"; nếu bé lấy kiến + cua + cuốn chiếu thì app đọc "Em còn thiếu một con tám chân" (`07:260`) trong khi trong khay đã có một con bé vừa đếm được tám chân.
- **Sửa (chọn một):**
  - (a) Đổi nhãn nhóm Chơi cho khác nhãn ô Học và đúng với cả cua lẫn cuốn chiếu: `07:278-279` → `label.en: More than eight legs` · `label.vi: Nhiều hơn tám chân`; `07:249-250` → `messages.start.en: Find six legs, eight legs and more.` · `messages.start.vi: Em tìm một con sáu chân, một con tám chân, một con nhiều chân hơn nữa nhé.`; `07:261-262` → `messages.missing.tray_lots.en: You still need one with more legs.` · `.vi: Em còn thiếu một con nhiều chân hơn nữa.`. Sửa kèm `_topic.md:354`.
  - (b) Bỏ cua và tôm khỏi kệ (còn sáu món: kiến, bướm, nhện, cuốn chiếu, chim sẻ, thằn lằn), nhóm "Rất nhiều chân" chỉ còn cuốn chiếu — giống cách đã nhận cho bài 3 ở rà chữ 12/11 (N6). Kệ sáu món ít hơn khuôn "bảy đến tám món" (`_topic.md:149`) nên cần PM đồng ý; cua vẫn vào bài ở ô Học, câu q5 và từ `crab`.
  - Tester nghiêng về (a): giữ đủ món, và "nhiều hơn tám chân" là điều bé đếm được.

**N4. Bài 7 w1: hình câu hỏi là trời chiều, mà đáp án đúng là con cò — đúng kiểu lỗi N1 của rà chữ 12/11, nay đã thành luật.**
- `07:40-74`. Hình câu hỏi (`07:49`) dùng lại `dong-vat-co-vu/w2` "Trời chiều trên rặng cây"; hai lựa chọn là con thỏ (`07:60`) và con cò (`07:68`, đáp án đúng). Câu hỏi là "Which one is a meat-eater?" · "Con nào ăn thịt?".
- `_topic.md:198` (luật viết ra sau rà chữ 12/11) ghi thẳng: "cảnh trời chiều không dùng cho câu có con dơi hay **con biết bay**". Nền trời đẩy bé chọn con chim mà không cần nhớ ý "cò ăn cá" của bài 6. Ghi chú của chính câu (`07:58`) chỉ tránh ao và ruộng, quên nền trời.
- **Sửa:** `07:49-51` → dùng lại `con-vat-nuoi-trong-nha/w1` (hàng rào tre trước khu vườn), `alt` "A bamboo fence in a garden" · "Hàng rào tre trước khu vườn" — cảnh trung tính cho cả thỏ lẫn cò, chủ đề đã dùng ở bảy chỗ. Sửa kèm dòng `_topic.md:270` (bỏ "7 (w1)" ở `dong-vat-co-vu/w2`, thêm w1 vào dòng `con-vat-nuoi-trong-nha/w1`) và mục **Dùng lại** ở `07:622`.

**N5. Bốn câu có đáp án đúng là con vật mới của hôm nay, hai lựa chọn sai là con quen — bé chọn "con lạ" là xong.**
- `07:358-398` q1 "Which one is an insect?": mèo (gặp sáu bài), **kiến (mới hôm nay)**, chim sẻ (gặp bốn bài).
- `08:333-373` q1 "Which one has a soft body?": cua (bài 7), rùa (gặp hai bài), **bạch tuộc (mới hôm nay)**.
- `08:435-475` q4 "Which animal has no backbone?": cá heo (gặp ba bài), **nhím biển (mới hôm nay)**, ếch (gặp sáu bài).
- `07:478-519` q5 "Which one has no backbone?": ếch, chim sẻ (quen), **cua (mới hôm nay)**.
- Đây là mặt ngược của luật `_topic.md:200` (đáp án không là ảnh mới duy nhất). Bốn con đó bé đã gặp ở màn Học hoặc màn Chơi cùng bài nên chưa phạm luật từng chữ, nhưng vẫn là một lối tắt chạy được cho cả bốn câu mà không cần ý của bài, và lối tắt này mạnh hơn ở Explorer vì bé chỉ nhìn hình.
- **Sửa:** đổi một lựa chọn sai thành một con khác cũng mới hôm nay, để lối tắt hỏng mà hình vẫn phân biệt rõ.
  - `07:376-382` q1: thay `q1_cat` bằng con nhện (dùng lại `explore_spiders`, `label.en: spider` · `label.vi: con nhện`, `alt` "A spider in its web" · "Con nhện trên mạng tơ"). Gợi ý "Count the legs. Look for six." thành việc thật: tám, sáu, hai chân. Sửa `07:374` và `_topic.md:252`.
  - `08:359-365` q1: thay `q1_turtle` bằng con nhím biển (dùng lại `tray_urchin`, `label.en: sea urchin` · `label.vi: nhím biển`). Gợi ý "Look for one with no hard shell." vẫn đúng (cua, nhím biển đều cứng). Sửa `08:349` và `_topic.md:263`.
  - `08:469-475` q4: thay `q4_frog` bằng con cá ngựa (dùng lại `tray_seahorse`, `label.en: seahorse` · `label.vi: cá ngựa`) — con này có xương sống thật, lại dọn đường cho q5. Sửa `08:451` và `_topic.md:264`.
  - `07` q5: không đổi được (ba lựa chọn "có xương sống" đều là con quen); ghi lại là chỗ chấp nhận.

**N6. Ô Học bài 7 tên là "Spiders and scorpions" · "Nhện và bọ cạp" nhưng cả chủ đề không có một ảnh bọ cạp nào.**
- `07:169-177`: nhãn nhóm nói hai con, `sentence` chỉ nói con nhện, `image` chỉ có con nhện. Ghi chú `07:122` nói rõ là cố ý không có ảnh bọ cạp cho đỡ sợ — quyết định đúng, nhưng cái nhãn thì chưa theo.
- Bé Explorer nghe tên ô rồi nhìn một tấm ảnh: dễ hiểu "con này tên là bọ cạp". Trái luật Explorer số 5 và mục 2 Quy ước hình ("mỗi hình một con vật… hình vẽ đúng vật được nói tới").
- **Sửa:** `07:170-171` → `label.en: Spiders` · `label.vi: Nhện`. Bọ cạp giữ nguyên ở ví dụ hai (`07:180-181` "a scorpion has eight legs, too" · "bọ cạp cũng có tám chân") — ví dụ là chữ app đọc, không có hình, nên vẫn vào bài được. Sửa kèm mục **Màu** `07:624` và ghi chú `07:120`.

### Nhỏ (18)

- **n1. Bảng "Hình dùng chung" bị chèn vỡ:** `_topic.md:267-270` là một đoạn gạch đầu dòng nằm **giữa bảng**, làm ba dòng cuối (`:271-273`: `con-vat-an-gi/explore_meat`, `explore_both`, `ho-hap tray_kite`) rơi ra thành một bảng riêng không có dòng tiêu đề. Designer đọc bảng này để dựng khoá ảnh. Chuyển đoạn `:267-270` xuống dưới dòng `:273`, hoặc tốt hơn là nhập mười lăm chỗ dùng ở đoạn đó vào đúng cột "Dùng lại ở" của từng dòng bảng.
- **n2. `syllabus.md:104` vẫn ghi chủ đề 1 có "6 (6)" bài** trong khi `content/syllabus.json` đã có tám bài. `_topic.md:138` giao việc này cho PM, phiên chính mới làm phần `syllabus.json`.
- **n3. `_topic.md:325` sai số sau khi thêm hai bài:** ghi "ba mươi tư câu, chỗ thứ nhất mười một, thứ hai mười ba, thứ ba mười". Đếm máy tám bài: **ba mươi lăm** câu `single_choice`, mười một · mười ba · **mười một**, năm câu hai lựa chọn (đúng như ghi).
- **n4. `_topic.md` tự mâu thuẫn về `stage` bài 6:** `:130` ghi `core` (đổi từ `review` 13/11, khớp frontmatter `06:6`), nhưng `:141` vẫn viết "bài 6 là `review`". Sửa `:141` và nói luôn bài 8 là `review`.
- **n5. `stage: review` của bài 8 (`08:6`) đáng xem lại:** bài 8 mang nhiều ý mới nhất chủ đề (bốn ô Học mới, ba từ `core` mới), trong khi bài 6 vừa bị đổi khỏi `review` vì cùng lý do. Đề xuất `core` hoặc `apply`; PM chốt.
- **n6. "Khuôn chung mỗi bài" chưa tính bài 7, 8:** `_topic.md:148` "Học: một `explore_groups` **bốn ô**" (bài 7 có năm ô), `:150` "bài 1 và 6 hai format; bài 2 đến 5 ba format" (bài 7 ba, bài 8 hai), `:149` "kệ bảy đến tám món" (bài 8 bảy, bài 7 tám — đạt, chỉ cần ghi).
- **n7. Quy ước hình mục 1 (`_topic.md:192`) ghi "ba hình câu hỏi dùng lại hình vẽ sân nhà"** rồi liệt kê bốn chỗ; nay là sáu chỗ (thêm `07:485` q5, `08:484` q5). Đổi thành "sáu hình câu hỏi" và thêm hai chỗ.
- **n8. Số ảnh mới cho designer chưa cộng bài 7, 8:** `_topic.md:408` còn "bốn mươi sáu ảnh mới (bài 1 đến 6…)". Thực tế thêm mười sáu ảnh (bài 7 tám: bộ xương, châu chấu, nhện, cua, cuốn chiếu, kiến, bướm, tổ kiến vàng; bài 8 tám: bạch tuộc, sao biển, bọt biển, sứa, ốc sên, nhím biển, cá ngựa, bãi biển) → **sáu mươi hai**. Ảnh khó cần ghi thêm: bọt biển thấy rõ lỗ, cá ngựa hoang dã không phải bể thuỷ cung, bạch tuộc không có thợ lặn.
- **n9. Ghi chú giãn cách `_topic.md:342` (n15 của 12/11) đã cũ:** bài 7 w2 ôn bài 2 (cách năm bài), bài 8 w2 ôn bài 5 — chủ đề nay có mốc gần một tuần. Cập nhật câu đó, vẫn giữ kiến nghị cho chủ đề Explorer số 2 về mốc một tháng.
- **n10. Gợi ý bài 7 q5 không phân biệt được ba lựa chọn** (`07:488-489`): "Look for legs that bend at joints." · "Em tìm con có chân gập ở nhiều khớp nhỏ nhé." — chân ếch và chân chim sẻ cũng gập ở khớp, mà gợi ý chỉ bật sau khi bé đã sai một lần, tức là lần thử cuối. Đề xuất: "Look for a hard shell outside." · "Em tìm con có vỏ cứng bên ngoài nhé." (khớp `explanation_correct` ở `07:490-491`, không gọi tên con cua).
- **n11. Giải thích bài 8 q5 chỉ khẳng định, không cho bé dấu hiệu nhìn được** (`08:489-492`): "Yes! A seahorse is a fish. It has a backbone." Bé vừa học ở bài 4 rằng cá heo **không** phải cá dù tên có chữ "cá", nên "cá ngựa là cá" nghe như chuyện tên gọi. Đề xuất `explanation_correct.en: Yes! A seahorse has fins. It is a fish.` · `.vi: Đúng rồi! Cá ngựa có vây nên là một loài cá.` (bảy và chín tiếng, EN sáu rồi bốn từ).
- **n12. Chữ "cánh" của sao biển trùng với "cánh" của chim trong cùng bài 8:** `08:29-30` và `08:154-155` "Sao biển có da gai và có nhiều cánh"; `08:82-83` w2 "Cánh giúp chim bay". Bé nghe (không đọc) dễ hình dung sao biển có cánh để bay. Hai hướng: đổi w2 sang một câu khác ôn bài 5 (ví dụ "A fish uses legs to swim." Sai — khi đó sửa bảng `_topic.md:303` và bảng Khởi động `:338`), hoặc bản VI nói "năm cánh sao". Bản EN "arms" không vướng.
- **n13. Hai câu hỏi liền nhau chỉ khác chữ "không"** (`08:440` q4 "Con nào không có xương sống?" rồi `08:482` q5 "Con nào có xương sống?"). Luật Explorer số 5 cấm câu phủ định ở `true_false`, không cấm ở `single_choice`, nhưng lý do của luật ("bé phải nghe kịp thêm chữ không") vẫn đúng ở đây. Không có cách viết khẳng định nào giữ được ý bài, nên đề xuất: ghi vào Ghi chú cho dev để ios-dev cho đọc chậm, nhấn chữ "không" · "no", và giữ thứ tự q4 trước q5 như hiện nay (q4 có phản hồi trước, đỡ cho q5).
- **n14. Bài 8 w3 "A cat eats grass." (Sai)** (`08:103-115`): mèo có gặm cỏ thật, biên tập đã ghi `[CẦN KIỂM]` và có sẵn phương án thay "A buffalo eats meat." (Sai, hình `w1_buffalo`). Nhận phương án thay thì khỏi phải nhờ chuyên môn, và không còn chỗ nào trong chủ đề nói chuyện mèo và cỏ. Nếu giữ nguyên thì nên nhận phương án "Mèo ăn cỏ **thay cơm**"… không viết được trong năm từ, nên tester nghiêng về phương án thay.
- **n15. Bài 7 q3 có thể trả lời bằng cách đếm chân trên chính tấm ảnh** (`07:419-436`): hình là con nhện, câu là "A spider has six legs.", gợi ý bảo đếm. Biên tập đã ghi là cố ý (`07:436`) và đây là DOK 1 quan sát, nên không bắt sửa; ghi lại vì trái một nửa tinh thần N5 của 12/11 (hình không làm bằng chứng cho đáp án).
- **n16. Khoá `q3` trong một bài có hai nghĩa:** `08:442` "Dùng lại hình `q3`" là bãi biển của chính bài 8, còn `08:484` "Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`" là sân nhà vẽ; bài 7 cũng có khoá `q3` riêng (`07:426`, nhện) bên cạnh `07:485` trỏ `ho-hap` `q3`. Hiện không sai vì chỗ nào cũng ghi rõ `ở bài`, nhưng designer dựng `same_as` dễ lấy nhầm. Đề xuất đổi tên hình gốc bài 8 thành `q3_beach` (sửa kèm `08:400`, `08:409`, `08:442`, `_topic.md:265`).
- **n17. EN "arms" · VI "xúc tu"** cho bạch tuộc (`08:141-142`, từ `octopus` `08:547-548`): hai bản không cùng nghĩa đen (xúc tu = tentacle, bạch tuộc chỉ có tay). "Xúc tu" là chữ trẻ Việt quen, nên tester không bắt sửa; ghi để biên tập biết khi làm chủ đề biển sau này.
- **n18. `_topic.md:108` ghi "các ví dụ Oak dùng trong quiz (thỏ, …) không có trong chủ đề này"** nhưng con thỏ có ở bài 3 q3, bài 6 (ba chỗ) và nay là lựa chọn w1 bài 7 (`07:60-66`). Câu trong `_topic.md` cần viết lại cho đúng (ví dụ "không dùng lại **câu hỏi** của Oak; con thỏ có ở chủ đề này nhưng trong câu khác").

### Chưa kiểm

- Không chạy `validate`, `tts`, `build`, `import`, `ids`; dev đã chạy `validate` 13/11 (0 lỗi) và tester không chạy lại.
- Không kiểm ảnh: bài 7, 8 chưa có file chọn ảnh (`content/images/explorer/goi-ten-va-nhom-dong-vat/` mới có sáu bài), nên chưa kiểm được giấy phép, kích thước, có thấy đủ chân hay không, bọt biển có nhận ra là bọt biển không.
- Không dùng simulator: màn Explorer thật (chip nhóm có chữ, `order_sequence` chưa có renderer, số từ trên một màn Chơi) vẫn thuộc SK-040 lượt 2.
- Không nghe thử giọng đọc các từ mới khó: "millipede", "centipede", "scorpion", "arthropod", "mollusc", "urchin", "seahorse", "sponge".
- Không đối chiếu sách CT GDPT 2018 (động vật không xương sống không có ở lớp 1; nếu Duy muốn bám sách thì PM xem lại chỗ đặt hai bài này).

## content-editor 13/11 · sửa bài 7–8 theo tester

Không chạy lệnh, không đổi dòng `id:`, không thêm khối mới cần id (khối đổi đều là `#### option`/`#### group`).

- **Đã sửa cả sáu mục nên sửa:** N1 (nhóm `limit` bài 7, 8 về `do_son`; "Tám chân", "Da có gai" và ô Học tương ứng sang `nau_dat`); N2 (phương án a: ô "Backbone" dùng lại `t_rex`, `sentence` "Lots of animals have a backbone." · "Rất nhiều con vật có xương sống."); N3 (phương án a: nhóm "More than eight legs" · "Nhiều hơn tám chân", giữ cua và tôm để kệ đủ tám món; "nhiều hơn tám" bé đếm được cả khi đếm cua ra tám chân bò); N4 (bài 7 w1 hình câu hỏi sang hàng rào tre); N5 (bài 7 q1 mèo → nhện; bài 8 q1 rùa → nhím biển; bài 8 q4 ếch → cá ngựa; bài 7 q5 không đổi được, ghi chấp nhận); N6 (ô Học "Spiders" · "Nhện").
- **Nhỏ đã sửa:** n1 (bảng Hình dùng chung liền lại, chỗ dùng bài 7, 8 nhập vào từng dòng), n3, n4, n6, n7, n8 (số ảnh nay sáu mươi mốt vì bỏ ảnh bộ xương mèo), n9, n10 (gợi ý bài 7 q5 "Look for a hard shell outside."), n11 (bài 8 q5 "Yes! A seahorse has fins. It is a fish."), n12 (bài 8 w2 đổi sang "A fish uses legs to swim.", Sai), n13 (ghi đề xuất ios-dev ở Ghi chú cho dev bài 8), n14 (bài 8 w3 đổi sang "A buffalo eats meat.", Sai), n18.
- **Nhỏ không sửa:** n2 (`syllabus.md` là vùng PM); n5 (giữ bài 8 `review` vì chủ đề cần bài tổng kết, ghi để PM chốt); n15 (tester không bắt sửa); n16 (khoá `q3` là khoá câu hỏi, không đổi tên được; đã ghi lưu ý cho designer ở Ghi chú cho dev bài 8); n17 (tester không bắt sửa).
- **Chữ trẻ nghe đổi:** bài 7 ô "Backbone" (`sentence`, bốn ví dụ), tên ô "Spiders" · "Nhện", tên nhóm Chơi "More than eight legs" · "Nhiều hơn tám chân", `messages.start` "Find six legs, eight legs and more." · "Em tìm một con sáu chân, một con tám chân, một con nhiều chân hơn nữa nhé.", `messages.missing.tray_lots` "You still need one with more legs." · "Em còn thiếu một con nhiều chân hơn nữa.", q1 lựa chọn "spider" · "con nhện", q5 gợi ý, từ `backbone` ví dụ "You have a backbone, too." · "Em cũng có xương sống."; bài 8 w2, w3 (cả câu), q1 lựa chọn "sea urchin" · "nhím biển", q4 lựa chọn "seahorse" · "cá ngựa", q5 giải thích khi đúng.
- Đúng/Sai tám bài nay mười bốn Đúng, mười bốn Sai.

## Hình đổi bài 7–8

| Bài · chỗ | Trước | Sau | Ghi chú cho designer |
| --- | --- | --- | --- |
| 7 `explore_backbone` | `[ảnh]` bộ xương mèo trong bảo tàng | Dùng lại hình `t_rex` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`; `alt` "A T. rex skeleton in a museum" · "Bộ xương khủng long bạo chúa trong bảo tàng" | Chép mục gốc Discoverer như các ảnh *Khủng long* khác. Bỏ việc tìm ảnh bộ xương mèo |
| 7 từ `backbone` | Dùng lại `explore_backbone` | Dùng lại hình `t_rex` ở bài `khung-long/trai-dat-rat-lau-ve-truoc` (cùng `alt` như trên) | Trỏ thẳng về gốc |
| 7 w1 (hình câu hỏi) | Dùng lại `dong-vat-co-vu/w2` (trời chiều) | Dùng lại `con-vat-nuoi-trong-nha/w1`; `alt` "A bamboo fence in a garden" · "Hàng rào tre trước khu vườn" | |
| 7 q1 lựa chọn | `q1_cat` (dùng lại `w3_cat`) | `q1_spider`, dùng lại `explore_spiders`; `alt` "A spider in its web" · "Con nhện trên mạng tơ" | Ba thẻ q1: nhện, kiến, chim sẻ |
| 8 w2 (hình câu hỏi) | Dùng lại `ho-hap` `tray_sparrow` | Dùng lại `con-vat-nuoi-trong-nha/tray_goldfish`; `alt` "A goldfish in a tank" · "Cá vàng trong bể" | |
| 8 w3 (hình câu hỏi) | Dùng lại `khung-long-la-gi/w3_cat` | Dùng lại `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`; `alt` "A water buffalo" · "Con trâu" | |
| 8 q1 lựa chọn | `q1_turtle` (dùng lại `q3_turtle`) | `q1_urchin`, dùng lại `tray_urchin`; `alt` "A sea urchin on a rock" · "Con nhím biển trên đá" | |
| 8 q4 lựa chọn | `q4_frog` (dùng lại `q4_frog` *Khủng long*) | `q4_seahorse`, dùng lại `tray_seahorse`; `alt` "A seahorse under the sea" · "Con cá ngựa dưới biển" | |
| 7, 8 màu nhóm | `limit` `nau_dat` | `limit` `do_son`; bài 7 "Tám chân", ô "Nhện" `nau_dat`; bài 8 "Da có gai" (kệ và ô Học) `nau_dat` | Chỉ màu chip, không đổi ảnh |
