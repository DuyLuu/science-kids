# SK-002 · Khung markdown một bài + bài mẫu "Ăn uống lành mạnh — bài 1"

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: content-editor · Tester: tester
Nguồn: technical-plan.md B4.1–B4.2, B8.0, B16 GĐ 0 (mốc 4/11 – 14/11); syllabus-progression.md mục 6–8; `.claude/agents/content-editor.md` (khung một bài); SK-001 mục "Hợp đồng trường v1"; canvas `design/play-ui/project/Discoverer-Warmup`, `-Learn`, `-Play`, `-Quiz`, `-QuizMyth`, `-Reward`, `-Words`, `-Topic` (`.dc.html`)

## Mục tiêu
Content-editor viết khung markdown chuẩn cho một bài và soạn bài mẫu chuẩn chất lượng "Ăn uống lành mạnh — bài 1 · Thức ăn cho ta những gì?" (Discoverer), để biên tập bắt đầu soạn 34 bài pilot từ 10/11 và dev chuyển được sang JSON theo schema v1 mà không phải đoán.

## Phạm vi
1. **`content/TEMPLATE.md`:**
   - Frontmatter YAML cho các trường đơn của lesson: `id` (để trống, CLI sinh sau), `topic` (slug chủ đề), `slug`, `order`, `stage`, `est_minutes`, `sensitive`, `ai_draft`.
   - Các mục cố định theo thứ tự: `## Tiêu đề`, `## Mục tiêu`, `## Ý chính`, `## Khởi động`, `## Học`, `## Chơi`, `## Quiz`, `## Từ vựng`, `## Thưởng`, `## Ghi chú cho hoạ sĩ`, `## Ghi chú cho dev`.
   - Mỗi câu quiz, block hay từ vựng nằm dưới một `### <key>` (key theo SK-001: chữ thường, số, `_`).
   - Chỉ có **một** cách viết cặp song ngữ (ví dụ hai dòng `en:` / `vi:`) và **một** cách viết hình (`brief` + `alt` EN/VI). Hình thức cụ thể do content-editor chọn, miễn là parse được bằng máy: tên mục không đổi, mỗi dòng một trường `tên: giá trị`.
   - Một bảng ánh xạ "chỗ trong markdown → trường SK-001", phủ mọi trường của Lesson, QuizItem (đủ 6 `format` của v1), 4 block type, VocabTerm, Collectible, Topic, Misconception.
   - Hướng dẫn ngắn (≤ 60 dòng), viết cho biên tập không quen git: quy tắc chữ theo nhóm tuổi (mục 8), DOK và phân bổ quiz (mục 7), cách đặt `key`, để trống `id`, cách dùng `[CẦN KIỂM]`, khi nào để `ai_draft: true`.
   - Kèm khung riêng cho `_topic.md`: frontmatter của topic cùng mục `## Misconceptions`.
2. **`content/discoverer/an-uong-lanh-manh/_topic.md`:** cần có vì misconception đặt ở cấp chủ đề (SK-001, quyết định 5).
   - `slug: an-uong-lanh-manh`, `age_group: discoverer`, `order: 1`, `strand: humans_health`, `level: 2`, difficulty 1-2-2-3-1 (syllabus-progression 5.2), `prerequisites: []`, `is_free: true`, `oak_unit_ref` (nội bộ), `sensitive: false`.
   - Tiêu đề "Healthy eating / Ăn uống lành mạnh", câu hỏi lớn.
   - Misconception `all_fat_bad`.
3. **`content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md`:** bài mẫu đủ mọi mục, `stage: opener`, `order: 1`, `est_minutes: 8`, `ai_draft: true`.

### Nội dung đã có trên canvas (giữ nguyên chữ, trừ khi có lý do ghi ở "Ghi chú cho dev")
- **Chủ đề:** "Healthy eating · Ăn uống lành mạnh", Mức 2, Miễn phí. Câu hỏi lớn "What should we eat to stay healthy? / Ta cần ăn gì để khoẻ mạnh?". Bài 1/5, khoảng 8 phút.
- **Khởi động** (nhãn "Nhớ lại · từ Year 2", 2 câu nhanh):
  - W1 `fill_blank_bank`:
    - Câu: "Animals, including humans, need food, water and {1} to live." / "Động vật, kể cả con người, cần thức ăn, nước và không khí để sống."
    - Ngân hàng từ: air · toys · sweets; đáp án air.
    - Gợi ý: "Thứ gì mình hít vào mỗi giây?"
    - Giải thích khi đúng: "We need air to breathe." / "Ta cần không khí để thở."
  - W2 `true_false`, đáp án Sai:
    - Câu: "Humans can make their own food, like plants." / "Con người tự làm ra thức ăn, giống như cây."
    - Hình có nhãn: plant · cây, sunlight · nắng.
    - Gợi ý: "Cây dùng ánh nắng để làm thức ăn. Còn mình thì sao?"
    - Giải thích: "Plants make food from sunlight. We need to eat food." / "Cây tự làm thức ăn từ ánh nắng. Con người phải ăn."
- **Học:**
  - Mục tiêu: "I can name the main nutrients in food." / "Em kể được các nhóm chất dinh dưỡng chính."
  - Block `explore_groups` "Tap each group · Chạm từng nhóm", 4 nhóm:
    - Carbohydrates · Chất bột đường (vàng hoè): "Carbohydrates give us energy." / "Chất bột đường cho ta năng lượng." Món: cơm, bánh mì, khoai lang.
    - Protein · Chất đạm (đỏ son): "Protein helps our body grow and repair." / "Chất đạm giúp cơ thể lớn lên và tự phục hồi." Món: cá, trứng, đậu phụ.
    - Fats · Chất béo (nâu): "Fats give us energy and keep us warm." / "Chất béo cho năng lượng và giữ ấm cơ thể." Món: dầu ăn, lạc, quả bơ.
    - Vitamins & minerals · Vitamin, chất khoáng (gỉ đồng): "Vitamins and minerals help us stay healthy." / "Vitamin và chất khoáng giúp ta khoẻ mạnh." Món: rau muống, cam, sữa.
  - Ô "Từ mới · New words": nutrient, carbohydrate, protein, fat (dùng block `word_list`).
- **Chơi** — `build_tray` "Xếp mâm cơm cân bằng · Build a balanced meal", mâm 4 chỗ:
  - Món theo nhóm:
    - bột đường: Cơm, Bánh mì;
    - đạm: Cá kho, Trứng;
    - rau & quả: Rau muống, Chuối;
    - đồ ngọt ("Đồ ngọt: nên ăn ít"): Kẹo, Nước ngọt.
  - Mâm đạt khi có đủ bột đường, đạm, rau & quả và không có đồ ngọt.
  - Lời nhắn:
    - mở đầu: "Pick foods for a healthy tray." / "Chọn món cho mâm cơm khoẻ mạnh nhé."
    - mâm đầy: "Your tray is full!" / "Mâm đầy rồi — chạm món trong mâm để bỏ ra."
    - đạt: "Great! Your tray is balanced." / "Tuyệt! Mâm cơm cân bằng rồi."
    - có đồ ngọt: "Sweets are for sometimes." / "Kẹo và nước ngọt chỉ nên ăn ít thôi."
    - thiếu đạm: "Add some protein!" / "Thêm một món giàu chất đạm nhé!"
    - thiếu rau quả: "Add vegetables or fruit!" / "Mâm còn thiếu rau hoặc quả!"
    - thiếu bột đường: "Add some carbohydrates!" / "Thêm cơm hoặc bánh mì nhé!"
- **Quiz:** canvas chỉ có câu 5 và câu 6.
  - Câu 5 `multi_choice`:
    - Câu hỏi: "Tap all the foods with lots of protein." / "Chạm vào tất cả thức ăn giàu chất đạm." Hướng dẫn: "Chọn tất cả đáp án đúng".
    - Lựa chọn: fish·cá ✓, rice·cơm, egg·trứng ✓, banana·chuối, tofu·đậu phụ ✓, bread·bánh mì.
    - Gợi ý: "Chất đạm giúp cơ thể lớn lên. Thường có trong cá, thịt, trứng và các loại đậu."
    - Giải thích khi đúng: "Cá, trứng và đậu phụ đều giàu chất đạm."
  - Câu 6, câu misconception "Thử thách · bắt lỗi sai":
    - Na nói "All fat is bad for you." / "Chất béo lúc nào cũng có hại." Câu hỏi: "Is Na right? / Na nói đúng không?"
    - Hai nhãn "Na đúng" / "Na chưa đúng"; đáp án: Na chưa đúng.
    - Giải thích: "Our body needs a little fat for energy and to keep warm." / "Cơ thể cần một ít chất béo để có năng lượng và giữ ấm."
    - Gợi ý khi sai: "Nhớ lại phần học: Chất béo cho ta năng lượng và giữ ấm cơ thể."
  - Câu 1–4: content-editor soạn.
- **Từ vựng** (8 từ, câu ví dụ EN / VI):
  - nutrient · chất dinh dưỡng: "Food gives us nutrients." / "Thức ăn cho ta chất dinh dưỡng."
  - carbohydrate · chất bột đường: "Rice is a carbohydrate." / "Cơm thuộc nhóm chất bột đường."
  - protein · chất đạm: "Fish is rich in protein." / "Cá giàu chất đạm."
  - fat · chất béo: "Fat keeps us warm." / "Chất béo giữ ấm cơ thể."
  - vitamin · vitamin: "Oranges have vitamins." / "Quả cam có vitamin."
  - fibre · chất xơ: "Vegetables have fibre." / "Rau có chất xơ."
  - energy · năng lượng: "Food gives us energy." / "Thức ăn cho ta năng lượng."
  - healthy · khoẻ mạnh: "We eat well to stay healthy." / "Ta ăn uống đủ chất để khoẻ mạnh."
- **Thưởng:** thẻ "Rau muống · water spinach", nhãn "Vitamin & khoáng chất", bộ "Thẻ thực phẩm". "Em có biết?": "Water spinach has vitamins and fibre." / "Rau muống có nhiều vitamin và chất xơ — món rau quen thuộc trong mâm cơm Việt."

Chỗ nào canvas chỉ có tiếng Việt (gợi ý, món ví dụ, nhãn mâm cơm) thì content-editor viết thêm tiếng Anh. Chỗ nào chỉ có tiếng Anh thì viết thêm tiếng Việt. Tiêu đề EN của bài, 3 ý chính và câu 1–4 do content-editor soạn.

## Ngoài phạm vi
- Bài 2–5 của chủ đề và các chủ đề khác.
- Chuyển markdown sang JSON: dev làm ở SK-001 (chép tay), sau đó là `content-cli`.
- Vẽ hình, sửa canvas: chỉ ghi đề xuất cho designer ở "Ghi chú cho hoạ sĩ".
- Audio: chưa có TTS. Chỉ cần viết câu sao cho đọc lên nghe xuôi.

## Tiêu chí nghiệm thu
- [ ] `content/TEMPLATE.md` có frontmatter và đủ các mục ở Phạm vi. Bảng ánh xạ phủ mọi trường bắt buộc trong "Hợp đồng trường v1" của SK-001; tester đối chiếu từng dòng, không thiếu trường nào. Phần hướng dẫn ≤ 60 dòng.
- [ ] `_topic.md` và bài mẫu dùng đúng khung: không có mục lạ, mọi trường bắt buộc đều có giá trị, mọi `key` duy nhất trong bài.
- [ ] Chữ đã có trên canvas (danh sách ở trên) giữ nguyên. Chỗ nào đổi thì ghi lý do trong "Ghi chú cho dev" và ghi rõ màn canvas nào designer cần sửa theo.
- [ ] Quiz đúng 6 câu, xếp dễ → khó:
  - câu 1 là DOK 1, cả bài phân bổ DOK 1·2·3 = 2·3·1;
  - đúng 1 câu gắn `misconception: all_fat_bad`;
  - `single_choice` có 3–4 lựa chọn, `true_false` có 2;
  - dùng ít nhất 3 `format` khác nhau;
  - mỗi câu có đủ `prompt`, `hint`, `explanation_correct`, `explanation_wrong`, cả EN và VI.
- [ ] Khởi động có 2 câu theo canvas, mỗi câu có `recall_from: prior_knowledge` kèm ghi chú kiến thức nền.
- [ ] Mỗi câu EN dành cho trẻ ≤ 10 từ, gồm cả lời nhắn mâm cơm và giải thích. Mỗi màn ≤ 30 từ EN. Ngoài từ mới của bài, từ EN phải thuộc Starters/Movers hoặc đã học. Chuỗi nào cũng có cả EN và VI.
- [ ] Tiếng Việt viết để TTS đọc xuôi: số viết bằng chữ, không viết tắt, không ký hiệu. Nếu giữ dấu "—" của canvas thì ghi lại để nghe thử khi có TTS.
- [ ] Từ vựng đủ 8 từ: 4 `core` (nutrient, carbohydrate, protein, fat, đúng ô "Từ mới" ở màn Học) và 4 `extra`. Từ nào cũng có câu ví dụ EN và VI.
- [ ] Mọi hình (nhóm chất, món ăn, mâm cơm, lựa chọn quiz, thẻ Rau muống, từ vựng nếu có) có `brief` một dòng (vật, bối cảnh Việt Nam) và `alt` EN/VI.
- [ ] Không chép câu chữ của Oak, không nhắc tên Oak trong chữ cho trẻ (`oak_unit_ref` là trường nội bộ, được phép). Số liệu nào chưa chắc thì gắn `[CẦN KIỂM]` và liệt kê ở cuối ticket này.
- [ ] Frontmatter bài mẫu để `ai_draft: true`. Chỉ Duy hoặc người duyệt đổi sang `false` sau khi đọc duyệt (B8.1).
- [ ] **Khi SK-001 xong:** dev chép bài mẫu và `_topic.md` sang fixture JSON, chạy `npm run validate` → exit 0. Lỗi do nội dung, content-editor sửa trong markdown cho tới khi sạch.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- Đọc bảng "Hợp đồng trường v1" trong SK-001 ngay bây giờ; không phải chờ dev code xong. Nếu SK-001 đổi tên trường, dev ghi vào đây và content-editor sửa khung theo.
- Chạy song song với SK-001, SK-003, SK-004. Chỉ tiêu chí cuối cùng (validate) chờ SK-001.

**Quyết định đã ghi** (PM tạm chốt 28/10 để làm được, Duy xác nhận khi review)
1. Bài 1 có khởi động bằng 2 câu "nhớ lại kiến thức nền" như canvas, dù B4.4 ghi "bài đầu tiên của bé không có khởi động". Cách chọn câu lúc chạy ở SK-003.
2. Quy tắc "3–4 lựa chọn" của Discoverer áp cho `single_choice` và `picture_bar_chart`. `multi_choice` được tới 6 lựa chọn, như câu 5 trên canvas Duy đã duyệt. `true_false` có 2.
3. Từ vựng: 8 từ = 4 `core` + 4 `extra`, để khớp cả canvas (8 từ) lẫn syllabus-progression mục 8 (3–4 từ mới).
4. Gợi ý và giải thích viết đủ EN và VI (SK-001, quyết định 3).
5. Câu 6 dùng `true_false` có `statement` (lời Na), `speaker: na`, `labels` "Na đúng / Na chưa đúng".

**Câu hỏi còn mở** (content-editor ghi đề xuất ngay trong bài, không chờ)
- Nhãn "Nhớ lại · từ Year 2": trẻ VN không biết "Year 2" là gì. Đề xuất nhãn khác, ghi vào "Ghi chú cho hoạ sĩ".
- Mâm cơm chia nhóm "rau & quả" và "đồ ngọt", phần Học thì chia 4 nhóm chất ("vitamin, chất khoáng", "chất béo"). Có cần một câu nối, hoặc đổi tên nhóm trong mâm không?
- Bài mở màn nên có câu "Em nghĩ sao?" không chấm điểm (syllabus-progression mục 6), nhưng schema v1 chưa có chỗ. Viết câu đề xuất vào "Ghi chú cho dev".
- Chính tả Anh (fibre, như canvas) hay Mỹ (fiber)? Giọng Kokoro đề xuất ở B9 là giọng Mỹ. Tạm dùng chính tả Anh, chờ Duy.
- Số từ vựng mỗi bài đang lệch giữa các tài liệu: syllabus.md ghi 3–5, prd.md 5 keyword, B4.1 4–8, syllabus-progression 3–4 từ mới. Bài mẫu theo quyết định 3.

**Kết quả** (content-editor, 28/10, chờ tester): `content/TEMPLATE.md`, `content/discoverer/an-uong-lanh-manh/_topic.md`, `content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md`, sửa `content/README.md` (trỏ tới khung). Đã tự kiểm bằng một script tạm (không nằm trong repo): đúng thứ tự mục, mọi dòng là `tên: giá trị`, đủ cặp en/vi và bộ ba của hình, 57 key không trùng, quiz 6 câu với DOK 1·1·2·2·2·3, bốn `format`, một câu misconception, mọi câu EN ≤ 10 từ, VI không có chữ số hay ký hiệu. Tiêu chí validate vẫn chờ dev chép sang fixture.

**Trả lời câu hỏi còn mở** (content-editor, 28/10; chi tiết trong bài mẫu, mục Ghi chú)
- Nhãn "Nhớ lại · từ Year 2" → đề xuất "Nhớ lại · điều em đã biết" / "Remember what you know" cho câu `prior_knowledge`, "Nhớ lại · bài <tên bài>" cho câu `lesson`. Đây là chữ giao diện, lấy theo `recall_from.kind`.
- Câu nối Học → Chơi: đề xuất giữ tên nhóm của mâm (trẻ nhận ra món dễ hơn nhận ra chất) và thêm một `sentence_card` `bridge` cuối phần Học: "Vegetables and fruit give us vitamins and minerals." / "Rau và quả cho ta vitamin và chất khoáng." **Chưa đưa vào bài** vì thêm một bước trên màn Học là chốt thiết kế, chờ Duy. Mâm không có nhóm chất béo là có chủ ý; đề xuất bài 2 thêm nhóm `role: neutral` cho dầu ăn, lạc.
- "Em nghĩ sao?": đề xuất trường `think_first` cho schema v1.1, câu "Why do we need to eat? What do you think?" / "Vì sao mình cần ăn? Em nghĩ sao?" với ba lựa chọn không chấm điểm; bài 5 hỏi lại.
- Chính tả: giữ "fibre" theo canvas, chờ Duy.
- Số từ vựng: theo quyết định 3 (4 `core` + 4 `extra`).

**Quyết định content-editor tự chọn** (Duy xác nhận khi review)
1. Cú pháp markdown: mỗi dòng `tên: giá trị`; cặp song ngữ là hai dòng `<tên>.en:` / `<tên>.vi:`; hình là ba dòng `<tên>.brief:` / `<tên>.alt.en:` / `<tên>.alt.vi:`; phần tử con (lựa chọn, ô từ, nhóm, món, cột) là `#### <loại> <key>`; danh sách key cách bằng dấu phẩy; dòng `>` là ghi chú cho người duyệt, máy bỏ qua.
2. Key duy nhất trong **cả bài**, kể cả key con. Quy tắc đặt: key con = key cha + `_` + tên ngắn (`q5_egg`, `tray_egg`).
3. Tham chiếu sang file khác trong markdown viết bằng slug hoặc key, máy đổi sang UUID: `topic` → `topic_id`, `prerequisites` → `prerequisite_topic_ids`, `misconception: <key>` → `misconception_id`, `recall_from.lesson: <slug chủ đề>/<slug bài>` → `recall_from.lesson_id`. `slug` của bài không có tiền tố `nn-`.
4. Frontmatter bài thêm `archived: false` (trường bắt buộc của SK-001, ticket chưa liệt kê).
5. Tiêu đề EN "What does food give us?"; ba ý chính; câu quiz 1–4: q1 `single_choice` DOK 1 (món nhiều vitamin), q2 `fill_blank_bank` DOK 1 (chất bột đường cho năng lượng), q3 `single_choice` DOK 2 (bún cùng nhóm với khoai lang), q4 `single_choice` DOK 2 (Nam trầy gối, chất nào giúp phục hồi). Câu 5 DOK 2, câu 6 DOK 3.
6. Tên EN cho chữ canvas chỉ có VI: món mâm cơm (Rice, Bread, Braised fish như canvas Discoverer-Cards, Egg, Water spinach, Banana, Sweets, Fizzy drink), nhóm mâm (Carbohydrates, Protein, Vegetables and fruit, "Sweets: just a little"), món ví dụ ở Học, gợi ý EN, nhãn EN hai nút câu 6 ("Yes" / "No", để màn giữ ≤ 30 từ).
7. Nhãn "Thử thách · bắt lỗi sai" đưa vào `instruction` của câu 6. Câu khởi động w2 dùng nhãn Đúng / Sai mặc định của app.

**Chỗ lệch với canvas** (designer sửa theo; lý do trong "Ghi chú cho dev" của bài mẫu)
- Discoverer-Learn: "Vitamins & minerals" → "Vitamins, minerals".
- Discoverer-Play: "Rau & quả" → "Rau và quả".
- Discoverer-Reward, Discoverer-Cards: "Vitamin & khoáng chất" → "Vitamin và chất khoáng".
- Discoverer-QuizMyth: giải thích EN mười hai từ → "A little fat gives us energy and keeps us warm."; "Thử thách · bắt lỗi sai" → "Thử thách: bắt lỗi sai".
- Discoverer-Quiz: thêm hướng dẫn EN "Pick all the right answers."
- Discoverer-Warmup: nhãn "Nhớ lại · từ Year 2" (đề xuất ở trên).
- Màn Học vượt 30 từ EN (khoảng 34) nếu món ví dụ hiện bằng tiếng Anh; canvas hiện VI nên đúng 30.
- Giữ dấu "—" ở hai chuỗi VI (`messages.full`, `fact` của thẻ rau muống), cần nghe thử khi có TTS.

**Chỗ lệch với hợp đồng trường SK-001**
- Không có trường nào đổi tên hay thêm bớt. Các chuỗi canvas không có trường trong schema v1 (dòng điều kiện "Cần đủ bột đường, đạm, rau quả — và không đồ ngọt", "Mâm của em · …", tên bộ thẻ "Thẻ thực phẩm", nhãn "Nhớ lại · …") được coi là chữ giao diện của app.
- `build_tray.messages.missing` là map, nhưng canvas cần thứ tự xét (đạm → rau và quả → bột đường). Đề xuất: app xét theo thứ tự key trong map.
- Đề xuất v1.1: `Image.labels?` (nhãn chữ trên hình w2), `lesson.think_first?` (câu "Em nghĩ sao?").

**[CẦN KIỂM]** (content-editor điền khi soạn; mỗi mục có dòng `>` ngay trong file)
- w1 `recall_from.note`: ý "cần thức ăn, nước và không khí" có nằm trong chủ đề Explorer "Em khoẻ mạnh" không; trẻ Việt Nam học ý này ở lớp mấy môn Tự nhiên và Xã hội.
- w2 `recall_from.note`: chủ đề Explorer nào dạy "cây tự làm thức ăn" (Chuỗi thức ăn hay Trồng cây).
- Học, nhóm vitamin và chất khoáng: sữa xếp vào nhóm này theo canvas, dù sữa cũng giàu chất đạm.
- q5: bánh mì trắng có khoảng 8–9 g chất đạm/100 g, gần bằng đậu phụ; xác nhận để bánh mì là lựa chọn sai của câu "giàu chất đạm".
- Thẻ rau muống: "nhiều chất xơ" (biên tập nhớ khoảng 2 g/100 g, mức vừa); xác nhận số liệu và cách nói.
- `_topic.md` `oak_unit_ref`: đang là tên unit, thay bằng mã hoặc slug chính xác nếu cần.

## Ghi chú của dev từ SK-001 (28/10)

**Kết quả chép sang fixture**
- `_topic.md` và `01-thuc-an-cho-ta-nhung-gi.md` đã được chép tay sang `packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/` (`topic.json`, `01-thuc-an-cho-ta-nhung-gi.json`).
- Dev đối chiếu từng giá trị giữa markdown và JSON: topic khớp 25/25, bài khớp 520/520. Không còn chữ `[SK-002]`.
- `npm run validate` → `OK: 2 file hợp lệ (1 topic, 1 lesson)`, exit 0.

**Lỗi do nội dung:** không có. Khung và bài mẫu qua cả JSON Schema, zod và bước kiểm chéo.

**Lệch hợp đồng content-editor cần biết** (chi tiết ở SK-001, quyết định 9–18)
- **Cờ của lesson.** `sensitive`, `archived`, `ai_draft` của lesson không bắt buộc, mặc định `false`, giống topic. Mục 4 ở trên ghi `archived` là bắt buộc, nhưng giữ dòng `archived: false` trong khung là đúng.
- **Object đóng.** Trường nào không có trong bảng ánh xạ của TEMPLATE là lỗi, kể cả lỗi chính tả tên trường.
- **Chuỗi không rỗng.** "Không rỗng" nghĩa là phải có ít nhất một chữ: chuỗi chỉ có dấu cách cũng là lỗi. Áp dụng cho mọi `en`, `vi`, `brief`, `note`, `oak_unit_ref`.
- **`slug`.** Chỉ gồm chữ thường không dấu và số, nối bằng `-`. `slug` trong `_topic.md` phải trùng tên thư mục.
- **`key`.** Duy nhất trong cả bài, kể cả key con. Sau SK-002, dev đã sửa validate theo đúng quy tắc 2 ở trên; trước đó key con chỉ cần duy nhất trong danh sách của nó.
- **`fill_blank_bank`.** Ô trống trong `sentence.en` đánh số `{1}…{n}`, mỗi số một lần, và `answers` có đúng `n` key. Trong `vi`, ô trống không bắt buộc, nhưng nếu có thì số không vượt quá `n`.
- **`order_sequence`.** `answer` là hoán vị đủ của các `#### item`.
- **`build_tray`.**
  - Có ít nhất một nhóm `role: required`.
  - Mỗi nhóm `required` có đúng một dòng `messages.missing.<key>`; nhóm `limit` hay `neutral` thì không có.
  - `capacity` không nhỏ hơn số nhóm `required`.
- **Kiểm một bài lẻ.** Validate cần cả `_topic.md` của chủ đề, để tra `topic` và `misconception`.
- **Về đề xuất "app xét `messages.missing` theo thứ tự key trong map":** Swift `Codable` đọc map thành `Dictionary` và không giữ thứ tự, nên đề xuất này không chắc chạy đúng trên iOS. Có hai hướng, cần Duy hoặc PM chốt:
  - app xét theo thứ tự `#### group` (content-editor xếp nhóm theo thứ tự cần xét);
  - v1.1 đổi `missing` thành danh sách có thứ tự.

  v1 chưa đổi gì.

**UUID đã sinh** (chép vào dòng `id:` tương ứng; không sửa, không chép sang bài khác)

| File | Chỗ | `id` |
| --- | --- | --- |
| `_topic.md` | frontmatter | `d3a514ef-02cd-4386-a358-f01e425a10f8` |
| `_topic.md` | `### all_fat_bad` | `93c51bb0-1d45-45df-99c5-a0397967fe10` |
| `01-thuc-an-cho-ta-nhung-gi.md` | frontmatter | `4b11eb40-9a47-4e5e-b4b5-bea60264ded3` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### w1` | `8c88f06a-e6dc-4c85-8da8-3d41913f3f03` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### w2` | `fd376a92-d053-4447-a292-979c91698c9b` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### explore` | `3a560eb7-9c22-43d6-a271-16e027e99c50` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### new_words` | `c233cec2-d80d-4957-b9a0-1fcd96eb8ab8` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### tray` | `bd0706ad-2c42-4e59-a6ee-66c1feac9ff7` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### q1` | `1462983f-bd03-44ee-a91b-65b4ee731e51` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### q2` | `aeb7debc-28ed-4fd8-a192-8a9e5a581455` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### q3` | `b06b6e26-f1b1-412e-b110-78e00e3d510f` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### q4` | `00bb56f5-6adc-4d54-b48a-5bbbbae20eab` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### q5` | `59dd3f4a-3967-436a-aec9-4048d8bb501c` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### q6` | `9efe4b78-71d1-4398-b9f8-e4e9e1c250d4` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### nutrient` | `6656ad65-b2dd-4f06-808c-fe1d1995e085` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### carbohydrate` | `728f378a-1bee-4106-ba15-612d17927b73` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### protein` | `8477b4f7-9605-457b-9a21-1bc5832484a0` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### fat` | `ee8c53bc-21cd-419e-a0d5-ef087d093f64` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### vitamin` | `cfa86593-542f-4519-bdc2-00bfe1cb6018` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### fibre` | `59b5cb47-2f15-49c1-8358-71ac83e735a1` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### energy` | `4b314313-1ed2-47a5-8147-75b6e175efb2` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### healthy` | `0cac2335-c9b2-4136-b724-ecff59a95f80` |
| `01-thuc-an-cho-ta-nhung-gi.md` | `### rau_muong` | `43376993-bf69-49cc-bb35-837581f0cc1a` |

## Kết quả kiểm (tester, 28/10)

**Kết luận:** chưa đạt hết. Có 3 lỗi (không có lỗi chặn) và 4 góp ý. Phần còn lại đạt.

**Cách kiểm:** tester viết một parser riêng theo TEMPLATE mục A và D, không dùng script của content-editor hay bản chép của dev. Parser dựng JSON từ `_topic.md` và bài mẫu rồi so với fixture của dev. Sau đó tester kiểm quy tắc Discoverer trên dữ liệu đó và đọc tay toàn bài. Script ở thư mục tạm, không nằm trong repo.

**Đạt**
- Fixture khớp markdown: 27 giá trị của topic và 521 giá trị của bài giống hệt nhau, chỉ trừ `id` (xem lỗi 2). Thứ tự `messages.missing` trong JSON cũng đúng thứ tự dòng.
- Mục đúng khung, không có mục lạ. Mọi dòng là `tên: giá trị`. 57 key không trùng và đúng dạng `Key`.
- Quiz 6 câu, DOK 1·1·2·2·2·3: câu 1 là DOK 1, phân bổ 2·3·1 đúng syllabus-progression mục 7, xếp dễ → khó.
- Đúng 1 câu misconception (q6 → `all_fat_bad`). `single_choice` có 3·3·3 lựa chọn; `multi_choice` 6 (quyết định 2); `true_false` 2. Có 4 `format`.
- Câu nào cũng đủ `prompt`, `hint`, `explanation_correct`, `explanation_wrong`, cả EN và VI. Khởi động có 2 câu `prior_knowledge`, mỗi câu có `note`.
- Mọi chuỗi song ngữ đủ `en` và `vi`: 168/168. Mọi hình có `brief` và `alt` EN/VI: 36/36.
- Không câu EN nào cho trẻ quá 10 từ. Câu dài nhất là w1 `sentence` (10 từ). Có 6 câu 9–10 từ, vẫn trong mức ≤ 8–10.
- Màn quiz nhiều chữ nhất là q5: 30 từ EN, đếm câu hỏi, hướng dẫn, 6 lựa chọn và phản hồi dài nhất.
- VI không có chữ số, viết tắt hay ký hiệu, trừ hai dấu "—" đã ghi chú để nghe thử.
- Từ vựng 4 `core` khớp `word_list`, cộng 4 `extra`; từ `core` nào cũng có hình và nghĩa VI. Không có "Oak" hay "Year" trong chữ cho trẻ. `ai_draft: true`. Có 6 mục `[CẦN KIỂM]` trong file, khớp danh sách ở ticket.

**Lỗi**
1. **`sentence.vi` của câu điền từ lộ đáp án.**
   - Chỗ sai: bản EN để ô `{1}`, còn bản VI viết đủ đáp án.
     - w1 (`content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md:45`): "…cần thức ăn, nước và **không khí** để sống."
     - q2 (dòng 337, câu quiz có tính điểm): "Chất bột đường cho ta **năng lượng**."
   - Vì sao là lỗi: Discoverer bật phụ đề VI mặc định (syllabus-progression mục 8), nên bé đọc được đáp án ngay trên màn. Nhãn VI của ô từ cũng chính là "không khí", "năng lượng".
   - Canvas làm khác: `design/play-ui/project/Discoverer-Warmup.dc.html:139` vẽ ô trống trong câu VI, chỉ hiện "không khí" sau khi bé chọn đúng (`q1Right`).
   - Tái hiện: so dòng 45 và 337 của bài mẫu với dòng 139 của canvas.
   - Mong đợi: `sentence.vi: Động vật, kể cả con người, cần thức ăn, nước và {1} để sống.` và `sentence.vi: Chất bột đường cho ta {1}.` SK-001 đã cho phép `{n}` trong `vi`.
   - Đề xuất thêm: đổi ghi chú ở `content/TEMPLATE.md:267` thành "tiếng Việt cũng để ô trống ở đúng chỗ". Sửa xong thì dev chép lại fixture.
2. **23 dòng `id:` trong markdown vẫn để trống.**
   - Chỗ trống: `_topic.md` dòng 2 và 33; bài mẫu có 21 dòng, gồm frontmatter và mọi `###`.
   - Fixture thì đã dùng 23 UUID dev ghi ở bảng "UUID đã sinh" của ticket này.
   - Tái hiện: `grep -c '^id:$' content/discoverer/an-uong-lanh-manh/*.md` → `_topic.md` 2, bài 21.
   - Hậu quả: khi có `content-cli`, máy sẽ sinh UUID mới cho các dòng trống. Bài mẫu và fixture sẽ lệch `id`, trái B4.2 (id cấp một lần, không đổi).
   - Mong đợi: chép 23 UUID vào đúng dòng.
3. **TEMPLATE mục C có ba mẫu hình chỉ ghi `image.brief`, thiếu `image.alt.en` và `image.alt.vi`.**
   - Chỗ sai trong `content/TEMPLATE.md`: `#### item` của `order_sequence` (dòng 279), `sentence_card` (dòng 317), `#### item` của `build_tray` (dòng 342).
   - Trái với chính TEMPLATE: dòng 15 ghi "Hình luôn là ba dòng", bảng D dòng 358 ghi alt "bắt buộc khi có hình".
   - Hậu quả: biên tập chép mẫu này thì validate báo `thiếu trường bắt buộc "alt"`.
   - Mong đợi: ba mẫu ghi đủ ba dòng.

**Góp ý**
1. `content/TEMPLATE.md:10` ghi "Máy kiểm (`validate`) báo lỗi theo số dòng". Hiện `validate` chỉ báo JSON pointer trên file JSON; số dòng markdown chỉ có khi `content-cli` xong. Nên ghi rõ để biên tập không chờ.
2. q6 gắn DOK 3, nhưng chỉ hỏi đúng hay sai về lời của Na, và gợi ý (dòng 515–516) nêu thẳng ý "chất béo cho năng lượng và giữ ấm".
   - Mục 7 định nghĩa DOK 3 là lập luận bằng bằng chứng, ví dụ "Quan sát nào cho thấy Lan sai?". Câu này gần DOK 2 hơn.
   - Câu theo canvas Duy đã duyệt, nên tester chỉ ghi lại. Có thể cân nhắc hỏi "Vì sao Na chưa đúng?" với các lựa chọn bằng chứng.
3. Hai gợi ý gần như nói thẳng đáp án, trái `TEMPLATE.md:42`:
   - q5 `hint.en` (dòng 441) nêu cả 3 đáp án đúng: cá, trứng, đậu. Chữ VI lấy từ canvas.
   - q1 `hint` (dòng 298) chỉ tới "rau và quả", mà chỉ có một lựa chọn là quả.
   - Ảnh hưởng điểm thấp, vì lần thử 2 không được điểm.
4. Thẻ thưởng: `name.en: water spinach` viết thường (dòng 618), trong khi `name.vi: Rau muống` và nhãn món "Water spinach" viết hoa. Nên thống nhất.
