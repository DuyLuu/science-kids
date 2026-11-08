# SK-026 · Dạng câu hỏi và cách hiện quiz theo nhóm tuổi: Explorer, Discoverer, Scientist

Trạng thái: done cho GĐ 0 (luật kiểm và TEMPLATE đạt nghiệm thu 1/11; Duy chốt hình thức D2 ngày 2/11). Phần GĐ 2 chưa làm, chép sang ticket con khi mở GĐ 2 · Ngày: 2026-11-01, sửa 2026-11-02 · Phụ trách: GĐ 0: dev (luật theo tuổi trong `content-cli`), content-editor (TEMPLATE), designer (phương án màn Explorer); GĐ 2: dev, ios-dev, designer, content-editor · Tester: tester
Nguồn: Duy 1/11 (nguyên ý: "mỗi lứa tuổi sẽ có dạng quiz khác nhau, ví dụ như trẻ nhỏ chưa biết chữ thì tập trung vô voice và hình ảnh"); Duy 1/11 chốt 5 câu hỏi của ticket ("Theo đề xuất"); syllabus-progression.md mục 7 (DOK, số lựa chọn, dạng câu) và mục 8 (hỗ trợ VI, số từ); syllabus.md dòng 15; prd.md dòng 33–35; technical-plan.md A2 (dòng 31–33), B4.1 (dòng 193), B4.2 (dòng 199–212), B4.3 (dòng 239), B4.4, B5.3 (dòng 309), B7.8, B8.0 (dòng 478), dòng 663 và 672; canvas `Explorer-Quiz`, `Explorer-Reward`, `Explorer-Play`, `Scientist-Quiz`, `Discoverer-Quiz`, `Discoverer-QuizFill`, `Discoverer-QuizMyth`; SK-001, SK-002, SK-003, SK-012, SK-015, SK-016 (câu hỏi 4, 5), SK-024, SK-025

## Mục tiêu
Mỗi nhóm tuổi có bộ dạng câu hỏi và cách hiện quiz riêng, ghi thành luật máy kiểm được, để bé Explorer chưa biết chữ làm trọn quiz chỉ bằng nghe và nhìn, còn Discoverer và Scientist có lượng chữ và độ khó hợp tuổi.

## Quyết định của Duy (1/11)
Duy trả lời 5 câu hỏi cuối ticket: "Theo đề xuất". Trong ticket, các quyết định này được gọi là D1–D5.
- **D1.** Explorer chấm ngầm: bé chỉ thấy sao và sticker, không thấy số câu đúng, không có XP (câu hỏi 1, phương án b).
- **D2.** Explorer: câu hỏi và lời linh vật có chữ ngắn làm phụ đề; lựa chọn, Đúng/Sai và nút không có chữ (câu 2, b). Hình thức cụ thể Duy chốt ngày 2/11, xem mục "Hình thức D2 (Duy chốt 2/11)".
- **D3.** Làm luật kiểm theo tuổi ngay ở GĐ 0, cho cả 3 nhóm, chỉ với 6 dạng câu đang có (câu 3, a).
- **D4.** Explorer: chạm thẻ là trả lời ngay; app đọc tên hình sau khi bé chọn (câu 4, a).
- **D5.** Scientist không tự đọc câu hỏi, nhưng có nút nghe ở câu hỏi, lời nhân vật và lựa chọn (câu 5, a).

Còn mở: 6 câu kỹ thuật cho dev và ios-dev ở cuối ticket. Trong đó có câu về số lần thử của câu Đúng/Sai Explorer.

## Hình thức D2 (Duy chốt 2/11)
Duy xem 3 phương án màn và 2 bộ biểu tượng của designer (mục "Kết quả GĐ 0 (designer)") rồi trả lời "Theo đề xuất".
- **Khung là A · Bạn kể chuyện.**
  - Linh vật và bong bóng lời ở đầu màn. Mọi câu app nói hiện trong bong bóng; cả bong bóng là nút nghe lại.
  - Thẻ hình xếp dọc trên iPhone, một hàng trên iPad, như đặc tả.
- **Đúng:** triện vuông lá tre có tích ở góc thẻ, cùng hình với triện "ĐÚNG" của Discoverer. Lấy từ B, thay cho dấu tròn của A.
- **Sai, còn lượt:** thẻ lõm, hình xám như A. Góc thẻ bong xuống, có mũi tên vòng; chi tiết này lấy từ B, thay cho mẩu giấy gấp góc của A.
- **Hết lượt, nút sang câu, thanh tiến độ:** giữ như A.
  - Thẻ đáp án có nền vàng hoè nhạt.
  - Nút sang câu màu đỏ, to cả bề ngang, chỉ có mũi tên.
  - Các ô câu đã làm cùng một màu.
- **Biểu tượng Đúng/Sai:** dùng bộ 1, bạn nhỏ gật đầu và lắc đầu. Bộ 2 (ngón cái) giữ trên canvas để playtest so cùng. Lý do: hai mặt gật và lắc chỉ khác nhau ở mũi nhọn chỉ hướng.
- **Không lấy:**
  - karaoke của B: để sau, khi `content-cli tts` có mốc thời gian theo từ;
  - góc trang cong để sang câu của B;
  - kiểu lật úp tranh của C.
- **Màn tham chiếu:** `Explorer-QuizTF.dc.html` đã dựng đúng cách ghép này. `Explorer-Quiz-A.dc.html` vẫn vẽ dấu tròn và mẩu gấp góc; khi mở GĐ 2, designer gộp thành màn chốt.

## Hiện trạng (PM kiểm trong repo 1/11)
1. **Schema mới đủ cho Discoverer.**
   - `packages/content-schema/schema/quiz-item.schema.json` có 6 format: `single_choice`, `multi_choice`, `true_false`, `fill_blank_bank`, `order_sequence`, `picture_bar_chart`.
   - `block.schema.json` có `explore_groups`, `sentence_card`, `word_list`, `build_tray`.
   - Explorer còn thiếu: phân nhóm trong quiz, block `sort_into_groups` (Chơi), `hotspot_image` (Học).
   - Scientist còn thiếu: `fill_blank_free`, `evidence_choice` (quiz), `fair_test` (Chơi), `timeline_slider` (Học).
2. **Chưa có luật nào theo nhóm tuổi.**
   - `ChoiceOption`: `label` bắt buộc, `image` tuỳ chọn.
   - `tools/content-cli` chỉ có lệnh `tts`, `build`, `fetch-model` (`src/cli.ts`); chưa có lệnh `validate`. Về nhóm tuổi, nó chỉ biết tên 3 nhóm (`src/build/rules.ts`).
   - README của content-schema (dòng 55) để luật theo tuổi lại cho `content-cli validate`, nhưng lệnh này chưa có.
   - Hệ quả: câu Explorer có lựa chọn không hình, có 4 lựa chọn hay dùng `fill_blank_bank` vẫn qua mọi bước kiểm.
3. **Chưa đặc tả cách hiện cho bé chưa biết chữ.**
   - `true_false` mặc định hiện chữ "Đúng · True" / "Sai · False" của app (bài 1, Ghi chú cho dev, dòng 651). Nhãn mặc định này không có clip: `LessonSpeech.swift` dòng 75 chỉ đọc `labels` của nội dung.
   - Canvas `Explorer-Quiz` đã đúng hướng: lựa chọn chỉ có hình, nút loa 72pt. Nhưng triện "ĐÚNG", nhãn "Thử lại" và nút "Câu tiếp" vẫn là chữ.
   - Canvas `Scientist-Quiz` không có nút nghe nào.
   - Phần audio đã sẵn: mọi chuỗi đọc to có `audio.en` và `audio.vi` (SK-024, SK-025).
4. **Mâu thuẫn chấm điểm Explorer (3 nguồn).** Đã giải bằng D1; technical-plan A2 sửa 1/11.
   - technical-plan A2 ghi Explorer "không điểm số".
   - `content/rules.json` cho Explorer cùng `pass_threshold` 5/6, `max_tries` 2 và cùng XP với hai nhóm kia.
   - Canvas `Explorer-Reward` có "Được 2 trên 3 sao", "Sao thứ 3: chơi lại vào ngày mai" và sổ sticker, không có XP.
5. **Ràng buộc tương thích** (xem mục Tương thích ngược):
   - app từ chối cả gói nếu `schema_version` khác 1;
   - app bỏ câu có format lạ, nên quiz còn dưới 6 câu;
   - bản 0.1.0 chưa hiện được `order_sequence` và `picture_bar_chart`;
   - nhóm tuổi của giao diện lấy từ nội dung (`apps/ios/ScienceKids/App/ScienceKidsApp.swift` dòng 29), không lấy từ hồ sơ.

## Đặc tả theo nhóm tuổi

Ký hiệu: **(đ)** là PM đề xuất, chưa có nguồn, hiệu chỉnh sau playtest; từ 1/11 đã ghi vào syllabus-progression mục 7 với nhãn đề xuất. **(Dn)** là quyết định n của Duy ngày 1/11. Số không đánh dấu lấy từ syllabus-progression mục 7–8, TEMPLATE mục A hoặc design tokens.

| | Explorer 5–7 | Discoverer 7–9 (pilot) | Scientist 9–11 |
| --- | --- | --- | --- |
| Nội dung soạn ở | GĐ 2 | GĐ 0 | GĐ 2 |
| Format ở Khởi động | `single_choice` (chọn hình), `true_false` (biểu tượng) (đ) | `single_choice`, `multi_choice`, `true_false`, `fill_blank_bank` (đ; bài 1 dùng 2 dạng cuối) | Như Discoverer, thêm `fill_blank_free` ở GĐ 2 (đ) |
| Format ở Quiz | `single_choice` (chọn hình), `true_false` (biểu tượng), `order_sequence` (sắp hình); `sort_into_groups` (mới, GĐ 2). Không dùng `multi_choice`, `fill_blank_bank`, `picture_bar_chart` và các format của Scientist | 6 format v1. GĐ 2 thêm `sort_into_groups`, `label_diagram` | Mọi format của Discoverer, cộng `fill_blank_free` và `evidence_choice` (GĐ 2). Đọc bảng hay biểu đồ đường: format mới, làm sau. "Chọn biến cần giữ nguyên": dùng `single_choice` hoặc `multi_choice` |
| Số format khác nhau trong 6 câu | ≥ 2 (đ; TEMPLATE hiện ghi ≥ 3 cho mọi nhóm) | ≥ 3 | ≥ 3 |
| Số lựa chọn | `single_choice`: 2–3<br>`true_false`: 2<br>`order_sequence`: 3 hình (đ)<br>`sort_into_groups`: 2–3 nhóm, 3–4 thẻ (đ) | `single_choice`, `picture_bar_chart`: 3–4<br>`multi_choice`: ≤ 6<br>`order_sequence`: 3–5 (đ) | `single_choice`, `evidence_choice`, `picture_bar_chart`: 4 (`picture_bar_chart` chốt 1/11)<br>`multi_choice`: ≤ 6<br>`order_sequence`: 3–6 |
| Hình bắt buộc | **Có** ở mọi lựa chọn, mọi thẻ sắp thứ tự, mọi thẻ và nhóm phân nhóm. Câu `true_false` có `image` (đ) | Không (`image?`) | Không |
| Chữ trên màn (D2) | **Đã chốt** (hình thức chốt 2/11: khung A, triện và góc bong của B):<br>- câu hỏi và lời linh vật hiện chữ ngắn làm phụ đề;<br>- lựa chọn, Đúng/Sai, nút sang câu, dấu đúng và dấu thử lại **không có chữ**;<br>- chữ không bao giờ là cách duy nhất để hiểu màn.<br>EN ≤ 8 từ/câu, ≤ 15 từ/màn | Chữ EN + phụ đề VI theo chế độ ngôn ngữ, như canvas. ≤ 10 từ/câu, ≤ 30 từ EN/màn | Chữ EN; VI ẩn, chạm nút "VI" để hiện (canvas `Scientist-Quiz`). ≤ 15 từ/câu, soạn nhắm 12 (chốt 1/11), ≤ 40–50 từ EN/màn |
| Tự đọc (theo `voice_mode`) | Khi mở câu: tự đọc câu hỏi và `instruction`.<br>Tên lựa chọn **không** đọc trước khi chọn (D4); chạm xong thì đọc tên hình vừa chọn.<br>Sai: tự đọc `hint`. Xong câu: tự đọc `explanation_*`.<br>Nút nghe lại 72pt luôn có | Tự đọc câu hỏi khi mở (SK-016). Gợi ý và giải thích có nút nghe, không tự đọc (SK-016 câu 4 còn chờ Duy) | Không tự đọc (D5). Có nút nghe ở câu hỏi, lời nhân vật và lựa chọn; canvas chưa có, designer thêm |
| Nhãn Đúng/Sai | Hai biểu tượng to, không chữ: bạn nhỏ gật đầu / lắc đầu (chốt 2/11; bộ ngón cái giữ để playtest). Lần đầu gặp dạng này trong bài, giọng giao diện đọc hướng dẫn "đúng thì chạm …, sai thì chạm …" | Như hiện tại: "Đúng · True" / "Sai · False" của app, hoặc `labels` của nội dung (q6 "Yes" / "No") | "True" / "False" (VI khi bật), hoặc `labels` |
| Cách trả lời | Chạm là trả lời, chấm ngay, không có nút "Kiểm tra" (như canvas `Explorer-Quiz`) (D4) | Chọn rồi bấm "Kiểm tra". Riêng Khởi động điền từ: chạm từ là trả lời | Chọn rồi bấm "Kiểm tra" |
| Phản hồi | Xem mục "Explorer: một câu không cần đọc" | Như SK-012:<br>- đúng lần đầu: triện "ĐÚNG" + "Chính xác!" kèm XP; đúng lần sau: "Đúng rồi!";<br>- sai: mẩu "Gợi ý", cho thử lại;<br>- hết lượt: giải thích | Như Discoverer, chữ dài hơn:<br>- đúng: "Correct!" + giải thích;<br>- sai: giải thích theo lựa chọn sai, nút "Thử lại" |
| Số lần thử | `max_tries` 2. Riêng `true_false`: còn mở, xem "Câu hỏi còn mở" | 2 | 2 |
| Điểm, sao, XP (D1) | **Đã chốt:**<br>- chấm ngầm theo B4.4, để có sao, báo cáo phụ huynh và gợi ý ôn nhanh;<br>- màn của bé không hiện số câu đúng, không có XP (`xp_*` = 0);<br>- phần thưởng là sao + sticker như canvas `Explorer-Reward` | 1 điểm khi đúng ở lần thử đầu; sao 3 mức theo `pass_threshold`; có XP | Như Discoverer |
| Vùng chạm tối thiểu | 72pt; thẻ lựa chọn hình cao ≥ 108pt (canvas) | 56pt | 48pt |
| DOK 1·2·3 | 3·3·0 | 2·3·1 | 1·3·2 |
| Câu 1 | DOK 1 | DOK 1 | DOK 1 |
| Câu misconception | 1 (câu 6, bằng hình) | 1 | 1–2 |
| Tỉ lệ đúng kỳ vọng cả quiz | ~85% | ~80% | ~77% |

**Nhóm tuổi của cách hiện** lấy theo `age_group` của chủ đề (nội dung), không theo hồ sơ. Lý do: luật soạn (hình bắt buộc, số lựa chọn) gắn với nội dung. Một câu Discoverer không có hình thì không hiện kiểu Explorer được. Code hiện tại đã làm như vậy.

### Explorer: một câu không cần đọc
Bé phải làm trọn 6 câu chỉ bằng nghe và nhìn. Áp cho mọi format Explorer.

1. **Mở câu:**
   - Linh vật đọc câu hỏi theo `voice_mode`; Explorer luôn được gợi ý `both` (B4.1).
   - Hình của câu, nếu có, hiện to.
   - Đang đọc mà bé chạm thì dừng tiếng, như `SpeechPlayer` hiện có.
2. **Lựa chọn:**
   - 2–3 thẻ hình, không có chữ trên thẻ.
   - iPhone: xếp dọc như canvas. iPad: xếp một hàng.
   - Nhãn VoiceOver lấy từ `label` (B7.8).
3. **Chạm thẻ là trả lời.** App đọc tên hình vừa chạm (`label`), rồi phản hồi.
4. **Đúng:**
   - triện bằng biểu tượng (chữ "ĐÚNG" nếu giữ thì chỉ để trang trí) và một tiếng ngắn;
   - linh vật đọc `explanation_correct`;
   - nút mũi tên to hiện ra để sang câu. Chữ "Câu tiếp" chỉ là phụ.
5. **Sai, còn lượt:** thẻ xám đi, có biểu tượng thử lại, linh vật tự đọc `hint`.
6. **Sai, hết lượt:** thẻ đúng sáng lên, linh vật đọc `explanation_wrong`, nút mũi tên hiện ra.
7. **Không bước nào đòi đọc:** không có nút "Kiểm tra", không có chữ trên lựa chọn, không có nhãn chữ Đúng/Sai.
8. **Trợ năng:** VoiceOver bật thì không tự phát (SK-016). Giảm chuyển động thì triện không xoay, linh vật không nhún.

Theo format:
- **`true_false`:**
  - luôn có `image` (vật được nói tới) và câu khẳng định đọc to;
  - hai thẻ biểu tượng;
  - biểu tượng phải khác hẳn dấu phản hồi đúng/sai, để bé không lẫn "thẻ Sai" với "em trả lời sai".
- **`order_sequence`:**
  - 3 thẻ hình, bé chạm lần lượt theo thứ tự; thẻ bay vào ô 1, 2, 3;
  - đặt xong thẻ thứ 3 thì chấm, đúng khi khớp hoàn toàn (B4.4).
- **`sort_into_groups`:**
  - mỗi nhóm có hình đại diện;
  - chạm thẻ rồi chạm nhóm, như canvas `Explorer-Play`;
  - thẻ đặt sai nảy về chỗ cũ và linh vật đọc gợi ý;
  - đề xuất chấm: mỗi lần đặt sai là một lần thử, câu có điểm khi không đặt sai thẻ nào (đ). Chốt bằng test vector.

Luật soạn câu Explorer (content-editor đưa vào TEMPLATE):
- Trả lời được chỉ bằng cách nghe câu hỏi và nhìn hình: bé nhận ra đáp án bằng hình, không cần nghe tên các lựa chọn.
- Vẫn viết `label` EN/VI cho mọi lựa chọn: đó là tên app đọc sau khi chọn và là nhãn VoiceOver.
- `explanation_wrong` nói tên đáp án (ví dụ "The answer is the hen."), vì app làm sáng thẻ đúng cùng lúc.
- Mỗi hình một vật, nền đơn giản, không có chữ trong hình.

### Format quiz mới (GĐ 2)
Hình dạng là đề xuất; dev chốt và ghi vào ticket.

| Format | Nhóm | Dữ liệu | Chấm |
| --- | --- | --- | --- |
| `sort_into_groups` | Explorer, Discoverer | `groups[2..3]: { key, label: Spoken, image }`, `items[3..6]: { key, label: Spoken, image?, group: Key }`. Dùng chung `$defs` và component với block Chơi cùng tên | Như mục Explorer ở trên |
| `fill_blank_free` | Scientist | `sentence` có ô `{1}`…; `accepted: string[][]`, mỗi ô là danh sách cách viết EN được nhận (ví dụ `fibre`, `fiber`) | So sau khi chuẩn hoá (bỏ khoảng trắng đầu và cuối, không phân biệt hoa thường, bỏ dấu chấm cuối). v1.1 không chấm gần đúng chính tả (đ) |
| `evidence_choice` | Scientist | `claim: Spoken` + `speaker: Key` (như `true_false`), `options[4]` kiểu `ChoiceOption`, đúng 1 lựa chọn đúng | Như `single_choice` |
| Đọc bảng, biểu đồ đường | Scientist | Tên và hình dạng chưa chốt; ticket riêng khi bắt đầu soạn Scientist | — |

- **Vì sao `evidence_choice` là format riêng**, không phải `single_choice` thêm trường `statement`: app cũ bỏ qua khoá lạ nên vẫn hiện câu hỏi nhưng mất lời nhân vật, thành câu vô nghĩa. Format mới thì app cũ bỏ cả câu, và `min_app_version` chặn chủ đề.
- **Dữ liệu trẻ:** với `fill_blank_free`, app không gửi chữ bé gõ lên server.
  - `quiz_answers.answer` chỉ ghi chỉ số của cách viết khớp trong `accepted`, hoặc `null` khi sai (B7.8, dữ liệu tối thiểu).
  - Bàn phím tắt tự sửa và gợi ý từ.

## Tương thích ngược (bắt buộc)
1. **`schema_version` giữ 1.**
   - App iOS từ chối cả gói khi khác 1: `apps/ios/Packages/SKKit/Sources/ContentKit/ContentPack.swift` dòng 102 và 198, `PackManifest.supportedSchemaVersion = 1`. Tăng lên 2 thì bản thử mất luôn bài 1.
   - Phần bổ sung gọi là "schema v1.1", như cách gọi ở SK-001 và SK-002.
2. **Chỉ thêm, không đổi, không bỏ.**
   - Thêm giá trị vào `enum` của `format`.
   - Không thêm trường bắt buộc vào kiểu đang có; không nới hay siết trường đang có. `ChoiceOption.label` vẫn bắt buộc.
   - Luật riêng của từng nhóm nằm ở `content-cli` theo `age_group`, không nằm trong JSON Schema.
3. **Ý mới làm đổi nghĩa câu hỏi thì phải là format mới,** không phải trường tuỳ chọn (xem `evidence_choice`).
4. **Chặn bằng `min_app_version` theo format.**
   - App cũ gặp format lạ thì bỏ câu (`ContentModel/Lesson.swift` dòng 100–119) và chỉ chơi câu có renderer (`LessonPlayer/LessonSession.swift` dòng 114). Quiz còn dưới 6 câu, `max_score` giảm và sao lệch.
   - Vì vậy `build` giữ bảng `format → bản app đầu tiên hiện được`. Bài dùng format mà `--min-app-version` chưa hiện được thì `build` báo lỗi.
   - Khi đó app cũ thấy chủ đề "cần cập nhật" (`ContentPack.swift` dòng 182), thay vì chơi bài thiếu câu.
   - Bảng áp ngay ở GĐ 0: bản 0.1.0 chưa hiện được `order_sequence` và `picture_bar_chart` (`LessonPlayer/ContentScoring.swift`, `hasRenderer`).
5. **`rules.json` chỉ thêm khoá.**
   - App đọc `rules` bằng `Decodable`, bỏ qua khoá lạ (`LessonPlayer/LessonRules.swift`). RPC đọc `rules_for` theo từng khoá.
   - Phải sửa cùng lúc `tools/content-cli/schema/rules.schema.json` (đang `additionalProperties: false`) và `tools/content-cli/test/rules.test.ts`.
   - Thiếu `presentation` thì app giữ hành vi Discoverer hiện tại.
6. **Bài 1 Discoverer không đổi một byte.** `pack.json` build lại có cùng sha256. Manifest chỉ khác ở `rules`, và vì thế khác `content_version` (SK-015).

## Phạm vi theo agent

### GĐ 0 (không chặn mốc nội dung 16/1/2027)

**dev**. Ước khoảng 2–3 ngày, dev xác nhận. Nên làm trước khi content-editor soạn bài 2–5 của chủ đề 1. Duy chốt làm ở GĐ 0 (D3).
1. **`content/rules.json`:** thêm `authoring` cho 3 nhóm theo bảng trên, chỉ với 6 format v1. Sửa `rules.schema.json` và `test/rules.test.ts` theo. Hình dạng gợi ý:
   ```json
   "authoring": {
     "quiz_formats": ["single_choice", "true_false", "order_sequence"],
     "warmup_formats": ["single_choice", "true_false"],
     "option_count": { "single_choice": [2, 3], "order_sequence": [3, 3] },
     "image_required": ["choice_option", "sequence_item", "true_false"],
     "dok_mix": [3, 3, 0],
     "first_item_dok": 1,
     "misconception_items": [1, 1],
     "min_formats": 2,
     "max_words_en": 8
   }
   ```
2. **Luật theo tuổi** trong `tools/content-cli`, ở một module riêng (ví dụ `src/validate/age-rules.ts`). Đọc `authoring` theo `age_group` của topic.
   - Chạy trong `build`: có lỗi thì exit 1 và không ghi gói.
   - Chạy trong lệnh mới `validate <topic.json> <lesson.json>…`, đọc JSON. Parse markdown là việc khác, theo lịch 1/12–12/12 ở B16. *(2/11: kéo lên làm ngay ở SK-027.)*
   - Dòng báo: `<file> <JSON pointer> [<mã>] <thông báo tiếng Việt>`. Cảnh báo không làm exit 1.
3. **Mã lỗi** (tên do dev chốt; đổi tên thì sửa ticket):

   | Mã | Mức | Khi nào | Pointer |
   | --- | --- | --- | --- |
   | `age_rules_missing` | lỗi | Nhóm của topic không có `authoring` | `/age_group` của topic |
   | `age_format_not_allowed` | lỗi | Format không có trong `quiz_formats` hay `warmup_formats` | `/quiz/<i>/format` |
   | `age_option_count` | lỗi | Số lựa chọn, item hay nhóm ngoài khoảng | mảng, ví dụ `/quiz/0/options` |
   | `age_image_required` | lỗi | Thiếu `image` ở chỗ nhóm bắt buộc | object thiếu hình, ví dụ `/quiz/3/options/0` |
   | `age_first_item_dok` | lỗi | Câu 1 không phải DOK 1 | `/quiz/0/dok` |
   | `age_dok_mix` | lỗi | Phân bổ DOK khác `dok_mix` | `/quiz` |
   | `age_misconception_count` | lỗi | Số câu có `misconception_id` ngoài khoảng | `/quiz` |
   | `age_format_variety` | lỗi | Số format khác nhau < `min_formats` | `/quiz` |
   | `age_dok_order` | cảnh báo | DOK giảm giữa hai câu liên tiếp | `/quiz/<i>/dok` |
   | `age_words_en` | cảnh báo | Câu EN dài hơn `max_words_en` | pointer của chuỗi |
   | `format_not_rendered` | lỗi ở `build`, cảnh báo ở `validate` | Format chưa hiện được ở `--min-app-version` | `/quiz/<i>/format` |

4. **Bảng format → bản app** (`format_not_rendered`): đặt ở một chỗ, ios-dev đề xuất cập nhật mỗi khi thêm renderer.
5. **Fixture:** một bài Explorer và một bài Scientist tối thiểu hợp lệ. Đây là dữ liệu test, không phải nội dung cho trẻ. Thêm đột biến, mỗi file đúng 1 lỗi, như `scripts/make-invalid-fixtures.mjs`.
6. **README:** bảng mã trong README của `content-cli`. Sửa dòng 55 README của content-schema để trỏ sang đây.

**content-editor**
- `content/TEMPLATE.md` mục A "Quiz" (dòng 36–44): thay các dòng số lựa chọn và số format bằng bảng theo 3 nhóm, khớp `authoring`. Thêm "Luật soạn câu Explorer" ở trên.
- Không sửa bài 1.

**designer** (sau hình pilot đang làm, không chặn 16/1)
- 2–3 phương án màn Quiz Explorer để Duy chốt hình thức cụ thể của D2, dựng trên file canvas mới (ví dụ `Explorer-Quiz-A.dc.html`, `Explorer-Quiz-B.dc.html`) từ `Explorer-Quiz`.
  - Mọi phương án theo D2 (chữ chỉ ở câu hỏi và lời linh vật) và D4 (chạm thẻ là trả lời). Các phương án khác nhau ở cách đặt phụ đề, triện, biểu tượng thử lại và nút sang câu.
  - Mỗi phương án có đủ trạng thái đúng, sai, hết lượt, và không trạng thái nào dựa vào chữ.
- 2 phương án biểu tượng Đúng/Sai cho Explorer, khác hẳn dấu phản hồi.

**tester**
- Kiểm theo tiêu chí GĐ 0. Đối chiếu bảng trong TEMPLATE với `authoring` trong `rules.json`.
- Chạy unit `ContentKitTests` và `LessonPlayerTests` 1 lần trên iPhone 16 Pro, với gói build lại có `authoring` trong manifest.

**ios-dev:** không có việc ở GĐ 0.

**pm:** đã sửa tài liệu theo D1–D5 ngày 1/11 (mục "Sửa tài liệu" cuối ticket). Còn tách ticket GĐ 2 khi mở GĐ 2.

### GĐ 2 (tách ticket riêng khi mở GĐ 2)

**dev**
1. **Schema v1.1, `schema_version` vẫn 1:** thêm `sort_into_groups`, `fill_blank_free`, `evidence_choice` vào `quiz-item.schema.json`, zod, contract test và fixture, theo README content-schema mục "Thêm một block type mới".
2. **`authoring`:** Explorer thêm `sort_into_groups`; Scientist thêm `fill_blank_free` và `evidence_choice`. Cập nhật bảng format → bản app.
3. **`presentation` trong `rules`,** nếu ios-dev đồng ý làm theo tham số (câu hỏi cho dev và ios-dev). Ví dụ:
   ```json
   {
     "choice_text": false,
     "true_false": "icon",
     "submit": "tap",
     "autoplay": ["prompt", "chosen_label", "hint", "explanation"],
     "show_score": false,
     "show_xp": false
   }
   ```
4. **`rules.explorer` theo D1:** đặt `xp_*` = 0. RPC, pgTAP và test vector không đổi.
   - Trước khi đặt, phải chốt câu kỹ thuật "luật của nhóm nào" ở cuối ticket. Lý do: server lấy `rules` theo nhóm của hồ sơ, app lấy theo nhóm của chủ đề.
   - Không đặt sớm ở GĐ 0. Bé lớp 1 (hồ sơ `explorer`) có thể học thử Discoverer (B18 #14): khi đó server sẽ tính 0 XP, còn app tính XP theo luật Discoverer.
5. **Giọng giao diện cho Explorer:** sinh clip EN/VI cho chuỗi giao diện (Đúng, Sai, hướng dẫn Đúng/Sai, Thử lại nhé, Đúng rồi…) bằng `content-cli tts`. content-editor viết chuỗi.
6. **`fill_blank_free`:** RPC và `quiz_answers` không nhận chữ tự do.

**ios-dev**
1. **Cách hiện theo `age_group` của chủ đề.**
2. **Explorer:**
   - thẻ hình không chữ; chạm là trả lời; đọc tên hình vừa chọn;
   - tự đọc gợi ý và giải thích;
   - Đúng/Sai bằng biểu tượng; mũi tên sang câu;
   - không hiện số câu đúng hay XP (D1);
   - `order_sequence` có hình; `sort_into_groups` dùng chung với block Chơi.
3. **Scientist:**
   - VI ẩn, có nút VI;
   - không tự đọc, có nút nghe (D5);
   - `fill_blank_free`: bàn phím EN, tắt tự sửa và gợi ý, không gửi chữ gõ;
   - `evidence_choice`.
4. **Engine Swift** chấm 3 format mới theo vector.
5. **`hasRenderer`** khớp bảng format → bản app của `content-cli`.
6. **Test tương thích và UI test** cho Explorer, Scientist. Mỗi bộ chạy 1 lần, trên 1 simulator.

**designer**
- Explorer: gộp `Explorer-Quiz-A` với triện và góc bong của B thành màn chốt theo mục "Hình thức D2 (Duy chốt 2/11)"; đủ 4 format, Khởi động, các trạng thái phản hồi, bản iPad.
- `Scientist-Quiz`: thêm nút nghe 48pt; thêm màn `fill_blank_free` và `true_false`.
- Spec biểu tượng Đúng/Sai đã chốt.

**content-editor**
- TEMPLATE mục C: mẫu cho 3 format mới.
- Chuỗi giọng giao diện Explorer.
- Một bài mẫu Explorer ("Gọi tên và nhóm động vật", bài 1) và một bài mẫu Scientist để playtest.

**tester**
- Vector `item-scoring` cho 3 format mới. `fill_blank_free` có ca hoa thường, khoảng trắng, dấu chấm cuối, `fibre` và `fiber`.
- Chạy UI test.
- Cùng Duy làm playtest với bé thật.

## Ngoài phạm vi
- **Block Học và Chơi mới** (`hotspot_image`, `sort_into_groups` ở Chơi, `timeline_slider`, `fair_test`, `label_diagram`): ticket riêng ở GĐ 2, đã có trong B4.2. Ticket này chỉ nói về Khởi động và Quiz.
- **Renderer `order_sequence` và `picture_bar_chart` cho Discoverer:** GĐ 1 S4 (technical-plan dòng 663).
- **Soạn bài Explorer, Scientist thật**, ngoài 2 bài mẫu cho playtest ở GĐ 2.
- **Đổi luật chấm B4.4 của Discoverer**; ôn tập thích ứng.
- **Parse markdown và báo lỗi theo số dòng:** lịch B16. Luật theo tuổi chạy trên JSON trước, rồi dùng lại khi có parser. *(2/11: làm ở SK-027, dòng báo thêm `:<dòng>` sau tên file, mã giữ nguyên.)*
- **Sửa `prd.md`, `technical-plan.md`, `syllabus-progression.md`:** ticket này chỉ đề xuất (cuối ticket).

## Tiêu chí nghiệm thu

### GĐ 0
- [x] **`rules.json`:** mỗi nhóm có `authoring` đúng bảng Đặc tả, với 6 format v1. `npm test` của `content-cli` xanh. `build` bài 1 chép `authoring` vào `manifest.rules`.
- [x] **Bài 1 sạch.** Chạy `node src/cli.ts validate` với hai file trong `packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/` (`topic.json`, `01-thuc-an-cho-ta-nhung-gi.json`).
  - Kết quả: exit 0, không có dòng lỗi.
  - Cảnh báo `age_words_en` hay `age_dok_order`, nếu có, dán vào ticket cho content-editor xem.
- [x] **Bài 1 đổi sang Explorer.** Chép hai file sang một thư mục tạm **tên `an-uong-lanh-manh`** (content-schema đòi `slug` trùng tên thư mục; sửa theo L1 của tester, 1/11), đổi `age_group` của topic thành `explorer`, rồi chạy `validate`. Kết quả: exit 1, có ít nhất các dòng:
  - `/warmup/0/format [age_format_not_allowed]` (w1 `fill_blank_bank`);
  - `/quiz/1/format [age_format_not_allowed]` (q2) và `/quiz/4/format [age_format_not_allowed]` (q5 `multi_choice`);
  - `/quiz/3/options/0 [age_image_required]` (q4: lựa chọn chỉ có chữ);
  - `/quiz/5 [age_image_required]` (q6 `true_false` không có hình);
  - `/quiz [age_dok_mix]` (bài là 2·3·1, Explorer cần 3·3·0).
- [x] **Fixture một lỗi:** mỗi file cho đúng 1 dòng lỗi, đúng pointer, đúng mã. Không tính cảnh báo.
  - Explorer `single_choice` bỏ `image` của lựa chọn 2 → `/quiz/0/options/1 [age_image_required]`.
  - Explorer `single_choice` có 4 lựa chọn → `/quiz/0/options [age_option_count]`.
  - Explorer có một câu `fill_blank_bank` → `/quiz/<i>/format [age_format_not_allowed]`.
  - Explorer `true_false` bỏ `image` → `/quiz/<i> [age_image_required]`.
  - Discoverer `single_choice` 2 lựa chọn → `[age_option_count]`. Scientist `single_choice` 3 lựa chọn → `[age_option_count]`.
  - Discoverer đổi chỗ q1 (DOK 1) với q3 (DOK 2) → `/quiz/0/dok [age_first_item_dok]`.
  - Discoverer không câu nào có `misconception_id` → `/quiz [age_misconception_count]`.
  - Scientist có 2 câu misconception → không lỗi. Có 3 câu → `[age_misconception_count]`.
  - Discoverer chỉ dùng 2 format → `/quiz [age_format_variety]`.
  - `rules.json` thiếu `authoring` của nhóm → `[age_rules_missing]`, exit 1.
- [x] **`build` chạy cùng luật:** bài có lỗi luật tuổi thì `build` exit 1, không ghi gói, in cùng dòng như `validate`.
- [x] **Chặn format chưa hiện được.** Trong bản sao bài 1, thay q2 bằng một câu `order_sequence` hợp lệ.
  - `build --min-app-version 0.1.0` → exit 1, có dòng `/quiz/1/format [format_not_rendered]`; thông báo nêu tên format và bản 0.1.0.
  - `validate` cùng bài → chỉ cảnh báo, exit 0.
- [x] **Tương thích.** Build lại bài 1 từ cùng input của gói hiện tại (`content_version` `89d8ade0a3cd`, chủ đề `692f2e75ba89`).
  - `pack.json` cùng sha256; version chủ đề vẫn là `692f2e75ba89`.
  - Manifest chỉ khác ở `rules` và `content_version`.
- [x] **App hiện tại đọc được manifest mới:** unit `ContentKitTests` và `LessonPlayerTests` xanh trên iPhone 16 Pro. Chạy 1 lần, dán log.
- [x] **Test cũ xanh:** `packages/content-schema` (`npm test`) và `tools/content-cli` (`npm test`).
- [x] **TEMPLATE khớp `rules.json`:** bảng theo 3 nhóm trong `content/TEMPLATE.md` trùng số với `authoring`. Tester đối chiếu từng ô.
- [x] **Phương án canvas:** designer có 2–3 phương án màn Quiz Explorer (theo D2, D4) và 2 phương án biểu tượng Đúng/Sai. Duy xem và chốt hình thức cụ thể của D2. **Đạt 2/11:** designer có 3 phương án và 2 bộ; Duy chốt theo đề xuất.
- [x] Mỗi agent chỉ sửa vùng của mình (cộng ticket). Không commit.

### GĐ 2 (chép sang ticket con khi tách)
- [ ] Schema v1.1: 3 format mới qua Ajv và zod cùng kết luận. `schema_version` vẫn 1. Contract test và fixture sai cập nhật.
- [ ] **Tương thích:**
  - App bản trước GĐ 2 nhận một chủ đề có câu `sort_into_groups`: chủ đề hiện "cần cập nhật", không chơi bài thiếu câu.
  - App mới đi trọn bài 1 Discoverer: luồng vàng `LessonUITests` xanh.
- [ ] **Explorer, UI test trên một bài Explorer fixture:**
  - mở câu thì probe ghi tự phát câu hỏi;
  - thẻ lựa chọn không có phần tử chữ hiện ra;
  - `true_false` hiện biểu tượng, không có chữ "Đúng · True";
  - chạm sai thì tự phát `hint`; hết lượt thì tự phát `explanation_wrong`;
  - không hiện số câu đúng hay XP (D1);
  - mọi vùng chạm ≥ 72pt.
- [ ] **Explorer, chụp màn với cờ debug ẩn mọi chữ** (ví dụ `-SKHideText YES`): 6 câu vẫn hiểu được. Duy và tester xem ảnh.
- [ ] **Playtest:** ít nhất 3 trên 5 bé 5–6 tuổi chưa đọc được làm xong 6 câu, không cần người lớn đọc hộ. Ghi lại chỗ bé kẹt.
  - Phụ huynh đồng ý trước. Không quay hay ghi âm bé nếu phụ huynh không đồng ý riêng.
- [ ] **Scientist:**
  - VI ẩn mặc định, chạm "VI" thì hiện; không tự đọc; nút nghe ≥ 48pt;
  - `fill_blank_free` không gửi chữ gõ: kiểm payload `submit_attempts`;
  - vector của `fill_blank_free` và `evidence_choice` qua trên app.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- **GĐ 0 phần dev** chạy được ngay trên JSON: SK-001 (schema, fixture), SK-015 (`build`), SK-003 (`default_rules`, nếu đụng phần chấm).
- **TEMPLATE:** SK-002.
- **SK-016 câu hỏi 4 và 5** (tự phát gợi ý và giải thích; chạm từ là trả lời): ticket này trả lời cho Explorer và Scientist. Phần Discoverer vẫn chờ Duy ở SK-016.
- **ios-dev GĐ 2** làm theo màn chốt của designer. D1, D4, D5 đã chốt 1/11; hình thức D2 chốt 2/11.
- **Explorer dùng `order_sequence` có hình,** nên cần renderer `order_sequence` của GĐ 1 S4.

**Quyết định đã ghi**
1. (Duy 1/11) Mỗi nhóm tuổi có dạng quiz và cách hiện riêng. Bé chưa biết chữ dựa vào giọng và hình.
2. (PM 1/11) Cách hiện theo `age_group` của chủ đề, không theo hồ sơ; khớp code hiện tại. dev và ios-dev phản biện được trong ticket.
3. (PM 1/11) Schema giữ `schema_version` 1 và chỉ bổ sung. Lý do ở mục Tương thích ngược.
4. (PM 1/11) Luật theo tuổi nằm ở `content/rules.json` (`authoring`), một nguồn như B5.3. JSON Schema giữ chung cho mọi nhóm.
5. (PM 1/11) `fill_blank_free` không gửi chữ bé gõ lên server (dữ liệu trẻ tối thiểu, B7.8).
6. (PM 1/11) Ở GĐ 0 không đổi bài 1 Discoverer và không đổi code app.
7. (Duy 1/11) 5 câu hỏi dưới đây chốt theo đề xuất của PM: D1–D5 ở mục "Quyết định của Duy (1/11)".
8. (Duy 2/11) Hình thức D2 theo đề xuất của designer: khung A, triện vuông và góc bong của B, biểu tượng gật đầu / lắc đầu. Xem mục "Hình thức D2 (Duy chốt 2/11)".

**Câu hỏi cho Duy: đã chốt cả 5 câu ngày 1/11, theo đề xuất** (giữ các phương án để tra lại)
1. **Explorer có điểm, sao, XP không?** (mâu thuẫn ở Hiện trạng 4) **Đã chốt (b), D1.**
   - (a) Như Discoverer: sao, XP, hiện số câu đúng. Chỉ cần sửa A2. Ít việc nhất, nhưng trái với "không điểm số", và PRD dòng 33 không nói tới điểm cho bé 5–7.
   - (b) Chấm ngầm: bé chỉ thấy sao và sticker, không thấy số câu đúng, không có XP (`xp_*` = 0). Server và test vector không đổi. **PM đề xuất**: khớp canvas `Explorer-Reward`, đúng tinh thần thưởng nỗ lực, phụ huynh vẫn có báo cáo, gợi ý ôn nhanh vẫn chạy.
   - (c) Không chấm: chỉ 1 sao hoàn thành và sticker. Phải thêm cờ trong `rules`, sửa RPC, pgTAP và vector. Báo cáo phụ huynh mất tín hiệu thành thạo.
2. **Explorer ẩn hẳn chữ, hay hiện chữ kèm giọng?** **Đã chốt (b), D2.** Hình thức cụ thể chốt 2/11.
   - (a) Ẩn hẳn: chỉ hình, biểu tượng và giọng. Màn gọn nhất cho bé, nhưng phụ huynh ngồi cạnh không đọc được câu hỏi để kèm.
   - (b) Câu hỏi và lời linh vật hiện chữ ngắn làm phụ đề (EN to, VI nhỏ theo chế độ ngôn ngữ). Lựa chọn, Đúng/Sai, nút và dấu phản hồi không có chữ. **PM đề xuất**: giống canvas `Explorer-Quiz`, khớp syllabus.md dòng 15 ("phụ đề VI chủ yếu cho phụ huynh"), bé vẫn làm được mà không đọc.
   - (c) Hiện chữ như Discoverer, kể cả nhãn lựa chọn, kèm giọng. Dễ làm nhất vì dùng chung renderer, nhưng màn dễ vượt 15 từ EN và bé dễ nghĩ mình phải đọc.

   Hình thức cụ thể của (b): Duy chốt 2/11 theo đề xuất của designer (mục "Hình thức D2 (Duy chốt 2/11)").
3. **Luật validate theo tuổi làm ngay ở GĐ 0, hay để GĐ 2?** **Đã chốt (a), D3.**
   - (a) GĐ 0, cả 3 nhóm, cho 6 format v1. **PM đề xuất**, vì:
     - cùng một đoạn code: luật Discoverer vốn đã nằm trong lịch 1/12–12/12 của B16, còn Explorer và Scientist chỉ là thêm dữ liệu vào `rules.json`;
     - 33 bài pilot còn lại đang soạn, bắt lỗi sớm có lợi;
     - bảng của ticket này thành luật máy kiểm, không trôi.
   - (b) GĐ 0 chỉ làm Discoverer; Explorer và Scientist bật ở GĐ 2 cùng format mới.
   - (c) Để cả sang GĐ 2. Ở GĐ 0, tester kiểm tay 34 bài.
4. **Explorer: chạm thẻ là trả lời ngay, hay chạm để nghe tên rồi mới xác nhận?** (cùng ý với SK-016 câu 5) **Đã chốt (a), D4.**
   - (a) Chạm là trả lời; app đọc tên hình vừa chọn rồi phản hồi, như canvas. **PM đề xuất**: ít bước, không có nút "Kiểm tra" mà bé phải hiểu. Đổi lại, bé không nghe được tên các hình trước khi chọn, nên câu phải nhận ra được bằng hình (luật soạn ở trên).
   - (b) Chạm lần đầu thì chọn và nghe tên, rồi chạm một nút dấu tích to để nộp. Bé nghe được mọi tên, nhưng thêm một bước và một nút.
   - (c) Mỗi thẻ có nút loa nhỏ riêng. Một thẻ có hai vùng chạm, khó giữ 72pt.
5. **Scientist có tự đọc câu hỏi không?** **Đã chốt (a), D5.**
   - (a) Không tự đọc; có nút nghe ở câu hỏi, lời nhân vật và lựa chọn. **PM đề xuất**: bé 9–11 tự đọc, và đọc hiểu là một phần thử thách (PRD dòng 35). Nút nghe vẫn đỡ bé đọc yếu.
   - (b) Tự đọc câu hỏi như Discoverer.
   - (c) Quiz Scientist không có giọng. Trái B4.1 ("nút nghe … vẫn có").

**Câu hỏi cho dev và ios-dev (không cần Duy)**
- Format phân nhóm trong quiz dùng chung tên `sort_into_groups` và `$defs` với block Chơi (PM nghiêng về cách này), hay đặt tên riêng?
- `presentation` là tham số trong `rules`, hay cố định trong code theo nhóm?
  - PM nghiêng về tham số: Duy chỉnh được sau playtest qua manifest, không cần phát hành app.
- Clip giọng giao diện để trong gói nội dung (asset theo hash, đổi không cần phát hành app), hay nhúng trong app?
- Bảng format → bản app đặt ở `packages/content-schema` hay `tools/content-cli`?
- *(thêm 1/11)* **`rules` của nhóm nào áp cho một lần làm bài: nhóm của hồ sơ hay nhóm của chủ đề?**
  - Server lấy theo hồ sơ: `submit_attempts` gọi `rules_for(c.age_group)` với `c` là `child_profiles` (`database/supabase/schemas/50_rpc.sql` dòng 144–149).
  - App lấy theo chủ đề: `content.rules(for: topic.topic.ageGroup)` (`apps/ios/ScienceKids/Home/MainFlow.swift` dòng 39).
  - Hiện 3 nhóm cùng luật chấm nên chưa lệch. D1 đặt `xp_*` = 0 cho Explorer thì sẽ lệch khi bé lớp 1 học thử Discoverer (B18 #14).
  - PM nghiêng về nhóm của chủ đề, cho khớp cách hiện. Nhưng server ở MVP có thể chưa biết bài thuộc nhóm nào: dev xem rồi chốt, và ghi vào ticket trước khi đặt `xp_*` = 0.
- *(thêm 2/11, từ designer)* **Câu Đúng/Sai của Explorer thử mấy lần?**
  - Câu chỉ có 2 thẻ. Với `max_tries` 2, sai lần đầu thì chỉ còn một thẻ, nên lần thử thứ hai gần như chắc đúng và không có trạng thái hết lượt.
  - Giữ 2: bé tự sửa và được một lần đúng.
  - Đặt 1 cho `true_false` của Explorer: cần thêm khoá theo format trong `rules`, cùng vector và pgTAP.
  - dev và PM chốt khi tách ticket GĐ 2; canvas `Explorer-QuizTF` vẽ được cả hai cách.

**Chưa chắc (PM)**
- **Các số có (đ)** chưa có nguồn; hiệu chỉnh sau playtest. Gồm: số thẻ của `order_sequence` và `sort_into_groups`, Explorer ≥ 2 format, format ở Khởi động.
- **Biểu tượng Đúng/Sai:** PM chưa có bằng chứng bé 5 tuổi hiểu chắc chắn biểu tượng nào. Chỉ playtest trả lời được.
- **Cảnh báo số từ trên bài 1:** chưa đếm. Có thể vài câu EN dài hơn 10 từ; tester liệt kê khi chạy.
- **Hồ sơ lớp 1 trong pilot:** `age_group_for_grade(1)` trả `explorer`, nhưng pilot chỉ có nội dung Discoverer.
  - technical-plan B18 #14 đề xuất cho nhóm chưa có nội dung học thử Discoverer.
  - Theo quyết định 2, bé lớp 1 sẽ thấy giao diện Discoverer, nhiều chữ; luật chấm thì xem câu kỹ thuật "luật của nhóm nào" ở trên.
  - PM chưa kiểm app đang xử lý hồ sơ lớp 1 thế nào. Duy nên biết trước beta.

**Sửa tài liệu** (PM sửa 1/11 theo D1–D5; mỗi chỗ ghi "1/11, Duy chốt SK-026")
- **technical-plan.md:**
  - Dòng "Trạng thái": thêm "Sửa 1/11: dạng quiz theo nhóm tuổi (SK-026)" kèm danh sách mục.
  - A2:
    - Explorer: bỏ "không điểm số"; thêm "làm được quiz chỉ bằng nghe và nhìn" và "chấm ngầm" (D1, D2, D4).
    - Scientist: thêm "quiz không tự đọc, có nút nghe" (D5).
  - B4.1: thêm đoạn "Tự đọc ở Khởi động và Quiz theo nhóm tuổi" (D4, D5).
  - B4.2:
    - dòng Quiz thêm `sort_into_groups`;
    - thêm đoạn "Dạng câu và cách hiện theo nhóm tuổi": luật ở `authoring`, hình bắt buộc của Explorer, luật "ý mới làm đổi nghĩa câu thì phải là format mới".
  - B4.3: thêm phần `schema_version` giữ 1 và bảng format → bản app.
  - B4.4 *(ngoài danh sách cũ, do D1 kéo theo)*: dòng XP thêm "Explorer: `xp_*` = 0", kèm ghi chú chưa đặt vào `rules.json`.
  - B5.3: `rules.<age_group>` có thêm `authoring`; `presentation` ở GĐ 2.
  - B8.0: dòng `validate` thêm luật đọc `authoring`, làm ngay GĐ 0 (D3).
  - B16 GĐ 0 *(ngoài danh sách cũ, do D3 kéo theo)*: thêm một dòng việc cho dev. B16 GĐ 2 (dòng "Explorer và Scientist (GĐ 2)…"): thêm format quiz mới, cách hiện theo nhóm, giọng giao diện.
- **syllabus-progression.md:**
  - mục 7, dòng "Dạng câu" của Explorer: "đúng/sai bằng biểu tượng, có audio";
  - thêm 5 dòng có nhãn *(1/11)*: hình bắt buộc, cách trả lời, chữ trên màn, tự đọc, bé thấy gì sau quiz;
  - thêm 2 dòng có nhãn *(đề xuất SK-026)*: số dạng câu tối thiểu, số thẻ;
  - thêm một đoạn ghi chú dưới bảng; thêm câu "Sửa 1/11/2026" vào dòng "Trạng thái".
- **prd.md:** mục 3, dòng Explorer, thêm "làm được quiz chỉ bằng nghe và nhìn" và "không hiện điểm số hay XP; thưởng bằng sao và sticker". Dòng "Cập nhật" thêm 1/11/2026.
- **SK-016:** câu hỏi 4 và 5 ghi chú phần Explorer và Scientist đã chốt ở SK-026; phần Discoverer vẫn mở.
- **Không sửa:**
  - `content/TEMPLATE.md`: vùng của content-editor, là việc GĐ 0 trong ticket này.
  - prd.md dòng 35 (Scientist): "Đọc hiểu EN dài hơn" đã khớp D5; chi tiết nằm ở technical-plan A2 và B4.1.
  - syllabus-progression mục 7, chữ "kéo–thả phân nhóm" của Explorer: canvas và B4.2 ghi "chạm–chạm", nhưng chỗ lệch này không do D1–D5 kéo theo, nên để lại.

## Kết quả GĐ 0 (content-editor)

Ngày 1/11/2026 · Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt**. Không sửa bài 1, `content/rules.json` hay tài liệu khác. Không commit.

**Đã sửa `content/TEMPLATE.md`, mục A, khối "Quiz"**
- Bỏ 4 dòng cũ: phân bổ DOK, số câu misconception, số lựa chọn, "ít nhất 3 format". Thay bằng hai dòng trỏ tới bảng. Giữ các dòng chung: 6 câu dễ → khó, định nghĩa DOK, đủ `prompt`/`hint`/`explanation_*`, Khởi động.
- Thêm "Luật soạn câu Explorer", 7 luật: nghe và nhìn là đủ; lựa chọn nhận ra được bằng hình; câu hỏi ngắn để đọc to; chữ chỉ ở câu hỏi và lời linh vật; Đúng/Sai bằng biểu tượng; gợi ý và giải thích viết để app tự đọc; không cần đọc nhãn mới phân biệt được.
  - Mỗi luật ghi ai kiểm (máy hay người duyệt), kèm một ví dụ đạt và một ví dụ không đạt, lấy từ chủ đề Explorer số 1. Ví dụ chỉ để minh hoạ, không phải câu của bài.
  - Đã gồm đủ 4 luật PM ghi dưới mục "Explorer: một câu không cần đọc".
- Thêm "Bảng luật theo nhóm tuổi": 9 dòng, 3 nhóm, có cột khoá `authoring` để tester đối chiếu từng ô. Dưới bảng ghi luật nào áp cả Khởi động, luật nào người duyệt kiểm.
- Thêm dòng "Máy kiểm (GĐ 0)": `validate` và `build`, mã `age_*`, `format_not_rendered` với bản 0.1.0.

**Cho tester khi đối chiếu với `authoring`**
- Hai ô cố ý chờ chốt (đề xuất 1 và 2 dưới đây): Scientist `max_words_en` ghi "12–15"; Scientist `option_count.picture_bar_chart` ghi "chưa có số".
  - **(Phiên chính, 1/11) Đã chốt theo đề xuất 1 và 2:** `max_words_en` = 15, `picture_bar_chart` = [4, 4]. Dev đã đặt vào `rules.json`; phiên chính đã sửa hai ô trong TEMPLATE và bảng Đặc tả cho khớp.
- `true_false` không có trong bảng số lựa chọn, vì schema cố định 2.
- "Đặt ở câu 6" của câu misconception Explorer không có khoá; người duyệt kiểm.

**Đề xuất cho PM** (content-editor không tự sửa số trong ticket)
1. **Scientist, số từ EN mỗi câu "12–15".** `max_words_en` cần một số. Đề xuất 15 làm ngưỡng cảnh báo, khi soạn nhắm 12. Cách này giống hai nhóm kia: Explorer "6–8" thành 8, Discoverer "8–10" thành 10. Chốt xong, content-editor sửa ô cho khớp.
2. **Scientist, số lựa chọn của `picture_bar_chart`.** Bảng Đặc tả không ghi, dù Scientist dùng cả 6 format. TEMPLATE trước 1/11 ghi 4. Đề xuất 4, như `single_choice` của Scientist.
3. **Hình bắt buộc và số lựa chọn ở Khởi động.** TEMPLATE ghi hai luật này áp cả Khởi động, vì bé Explorer cũng phải làm Khởi động chỉ bằng nghe và nhìn. Đề nghị dev xác nhận `age_image_required` và `age_option_count` kiểm cả `/warmup/<i>`. Tiêu chí "Bài 1 đổi sang Explorer" không phải đổi: w2 đã có `image`, còn w1 đã báo `age_format_not_allowed`.
4. **Explorer, `labels.*` của `true_false`.** TEMPLATE đề xuất để trống ở Explorer, vì app hiện biểu tượng chứ không hiện nhãn chữ. Ticket chưa nói tới; PM chốt. Muốn máy kiểm thì cần thêm luật (ví dụ cảnh báo khi câu Explorer có `labels`); TEMPLATE chưa đưa vào bảng.
5. **Explorer, đoán mò.** `single_choice` 2 lựa chọn và `true_false` đều cho đoán đúng một nửa. Nếu cả 6 câu chỉ có hai lựa chọn, bé đoán mò vẫn đạt 5 trên 6 khoảng 11% số lần. Không đổi số; sau playtest, nếu cần, thêm vào TEMPLATE câu "ưu tiên 3 lựa chọn, chỉ dùng 2 cho câu DOK 1 đầu quiz".
6. **Chưa có số theo tuổi:** cận dưới của `multi_choice`, số từ trong ngân hàng `fill_blank_bank`. Ticket không ghi; TEMPLATE ghi "chỉ có giới hạn của schema". Nếu `option_count.multi_choice` cần cận dưới, dùng 2 của schema để không đổi nghĩa "tối đa 6".

**Còn chưa chắc**
- Ví dụ trong luật Explorer chưa qua người duyệt chuyên môn. Ý khoa học trong ví dụ là kiến thức phổ thông: dơi là thú, không phải chim; trâu ăn cỏ; ếch là lưỡng cư.
- Từ "lông vũ" trong ví dụ `hint.vi` có dễ nghe với bé 5–7 không: chưa đối chiếu sách Tự nhiên và Xã hội lớp 1, lớp 2.
- Luật 6 "không nhắc vị trí thẻ" dựa trên bố cục iPhone xếp dọc, iPad một hàng. Hình thức D2 Duy chốt sau có thể đổi bố cục, nhưng luật vẫn đúng. *(Phiên chính, 2/11: khung A đã chốt giữ thẻ xếp dọc trên iPhone, nên luật không đổi.)*
- Mục "Chữ cho trẻ" của TEMPLATE vẫn ghi Explorer "≤ 6–8" từ mỗi câu (nhắm 6, tối đa 8). Khớp với ô 8 của bảng nên không sửa.

## Kết quả GĐ 0 (dev)

Ngày 1/11/2026 · dev xong phần GĐ 0, chờ tester. Không commit. Không sửa `apps/ios/`, `design/`, `content/TEMPLATE.md`, bài 1.

**Đã làm**
- `content/rules.json`: thêm `authoring` cho 3 nhóm, chỉ với 6 format v1. `xp_*` của Explorer giữ 10 · 20 · 10 · 20; test khoá giá trị này.
- `tools/content-cli/schema/rules.schema.json`: thêm `$defs/Authoring` (object đóng), `FormatList`, `QuizFormat`, `Range`. `authoring` là khoá tuỳ chọn.
- `tools/content-cli/src/build/rules.ts`: kiểu `Authoring`. Khi đọc file, kiểm thêm `min <= max` và tổng `dok_mix` = 6.
- `src/validate/age-rules.ts`: luật theo tuổi, hàm thuần. `validate` và `build` gọi cùng hàm này.
- `src/validate/command.ts` và `cli.ts`: lệnh mới `validate <topic.json> <lesson.json>… [--rules] [--min-app-version]`.
- `src/validate/format-renderers.ts`: bảng format → bản app.
- `src/app-version.ts`: so sánh phiên bản, tách ra từ `build`.
- `src/build/command.ts`:
  - chạy luật theo tuổi sau bước đọc `rules`; lỗi chặn build, cảnh báo in ở mục Cảnh báo;
  - dòng cũ "nhóm tuổi X không có trong rules" nay mang mã `[age_rules_missing]`.
- Fixture `tools/content-cli/test/fixtures/age-rules/`: 2 bài hợp lệ (Explorer, Scientist), 16 file một lỗi, bảng `expected.json`. Sinh bằng `scripts/make-age-fixtures.ts` (`npm run make-age-fixtures`).
- Test:
  - mới: `test/age-rules.test.ts`, 32 ca;
  - sửa `test/rules.test.ts`: chép tay bảng Đặc tả rồi so với `authoring`; kiểm enum format khớp content-schema; kiểm lỗi khi đọc `authoring`;
  - thêm 3 ca vào `test/build.test.ts`, sửa 1 regex cho mã `[age_rules_missing]`;
  - `tsconfig.json` kiểm cả `scripts/`.
- README:
  - `tools/content-cli/README.md`: thêm mục "validate: luật theo nhóm tuổi" (bảng mã, bảng `authoring`, bảng format → bản app, fixture), dòng `authoring` trong bảng `rules.json`, bước 2 của `build`;
  - `packages/content-schema/README.md` dòng 55: trỏ sang mục trên.
- Gói `content/.build/pack`: build lại.

**Hình dạng `authoring` đã chốt.** Tên khoá giữ đúng hình dạng gợi ý của ticket, nên content-editor không phải sửa cột "Khoá" của TEMPLATE. 11 mã giữ đúng tên ở mục 3.

| Khoá | Explorer | Discoverer | Scientist |
| --- | --- | --- | --- |
| `quiz_formats` | `single_choice`, `true_false`, `order_sequence` | 6 format v1 | 6 format v1 |
| `warmup_formats` | `single_choice`, `true_false` | `single_choice`, `multi_choice`, `true_false`, `fill_blank_bank` | như Discoverer |
| `option_count` | `single_choice` [2, 3]<br>`order_sequence` [3, 3] | `single_choice` [3, 4]<br>`multi_choice` [2, 6]<br>`order_sequence` [3, 5]<br>`picture_bar_chart` [3, 4] | `single_choice` [4, 4]<br>`multi_choice` [2, 6]<br>`order_sequence` [3, 6]<br>`picture_bar_chart` [4, 4] |
| `image_required` | `choice_option`, `sequence_item`, `true_false` | `[]` | `[]` |
| `dok_mix` | [3, 3, 0] | [2, 3, 1] | [1, 3, 2] |
| `first_item_dok` | 1 | 1 | 1 |
| `misconception_items` | [1, 1] | [1, 1] | [1, 2] |
| `min_formats` | 2 | 3 | 3 |
| `max_words_en` | 8 | 10 | 15 |

**Quyết định đã ghi (dev)**
1. **Hai ô Scientist bảng Đặc tả bỏ trống.** Điều phối chốt ngày 1/11 theo đề xuất 1 và 2 của content-editor:
   - `max_words_en` = 15: cận trên của 12–15, như Explorer lấy 8 và Discoverer lấy 10;
   - `picture_bar_chart` = [4, 4], như TEMPLATE trước 1/11.

   PM ghi 2 số này vào bảng Đặc tả. Content-editor sửa 2 ô "chờ PM" trong TEMPLATE.
2. **"`multi_choice` ≤ 6"** ghi là [2, 6]. Số 2 là mức tối thiểu của schema, nên nghĩa không đổi (đề xuất 6 của content-editor).
3. **Phạm vi áp** (trả lời đề xuất 3 của content-editor: có, kiểm cả Khởi động).
   - Format được dùng, số lựa chọn và hình bắt buộc kiểm từng câu, ở cả `/warmup/<i>` và `/quiz/<i>`. Đã có fixture `explorer-warmup-option-no-image` và `explorer-warmup-multi-choice`.
   - DOK, câu 1, misconception, số format và thứ tự DOK chỉ tính 6 câu Quiz.
4. **Câu dùng format không được phép** chỉ cho 1 lỗi `age_format_not_allowed`; không kiểm tiếp số lựa chọn hay hình của câu đó. `age_format_variety` đếm mọi format có mặt, kể cả format không được phép. Nhờ vậy mỗi fixture chỉ ra đúng 1 lỗi.
5. **`age_words_en`** đếm trên mọi `Spoken.en` của topic và bài, không chỉ Quiz, theo mục "Chữ cho trẻ" của TEMPLATE ("tính cả gợi ý, giải thích, lời nhắn").
   - Tách câu sau `.` `!` `?` `…`, đếm từ theo khoảng trắng; ô `{1}` tính một từ, `—` không tính.
   - Pointer trỏ tới chuỗi, ví dụ `/quiz/2/prompt/en`.
6. **`format_not_rendered`** áp cho câu Khởi động và Quiz.
   - So với bản app của chủ đề: lớn nhất của `--min-app-version` và các `min_app_version` của block, như `build` tính `topics[].min_app_version`.
   - Format chưa có bản app nào (`null`) thì `build` luôn lỗi, kể cả với `--min-app-version` cao.
7. **Bảng format → bản app đặt ở `tools/content-cli/src/validate/format-renderers.ts`** (trả lời câu kỹ thuật "đặt ở đâu").
   - Lý do: content-schema là hợp đồng dữ liệu chung cho mọi nền tảng, không nên biết bản app; chỉ `build` và `validate` dùng bảng này.
   - Test kiểm bảng có đủ mọi format của `quiz-item.schema.json`. Hàng 0.1.0 khớp `hasRenderer` của iOS: 4 format.
   - Android sẽ cần cột riêng khi phát hành.
8. **Thiếu luật cho nhóm thì báo `age_rules_missing`,** cả khi nhóm không có trong `rules.json` lẫn khi nhóm không có `authoring`.
9. **Fixture đặt ở `tools/content-cli/test/fixtures/age-rules/`,** không ở `packages/content-schema/fixtures/valid/`.
   - Lý do: test của content-schema đếm đúng "2 file hợp lệ", và luật theo tuổi thuộc `content-cli`.
   - Mọi fixture vẫn qua content-schema; test kiểm điều này.
10. **Cách in kết quả.**
    - `validate` in ra stdout: lỗi trước, cảnh báo sau (thông báo bắt đầu bằng `cảnh báo:`), cuối cùng là dòng tổng.
    - `build` in lỗi ra stderr với cùng định dạng dòng.
    - File nằm ngoài thư mục đang chạy lệnh thì in đường dẫn tuyệt đối, như `validate.mjs`.
11. **Không đặt `xp_*` = 0 cho Explorer.** Câu "rules của nhóm nào" vẫn để mở.

**Kết quả tiêu chí GĐ 0** (chạy ngày 1/11 trong `tools/content-cli`, Node 24.18.0)
- [x] **`rules.json`**:
  - `npm test` 215/215 pass, exit 0; `npm run typecheck` exit 0;
  - `test/rules.test.ts` so `authoring` với bảng trên;
  - `build` bài 1 chép `authoring` vào `manifest.rules`: test có assert, và đã kiểm trên gói thật.
- [x] **Bài 1 sạch:** `node src/cli.ts validate …/topic.json …/01-thuc-an-cho-ta-nhung-gi.json` → exit 0.
  - Dòng tổng: `nhóm discoverer · 0 lỗi · 0 cảnh báo`.
  - **Không có cảnh báo cho content-editor.** Câu EN dài nhất là 10 từ, đúng bằng ngưỡng Discoverer; có 3 câu như vậy: `/warmup/0/sentence`, `/quiz/2/prompt`, `/quiz/5/explanation_correct`. DOK của quiz là 1, 1, 2, 2, 2, 3, không giảm.
- [x] **Bài 1 đổi sang Explorer** (bản sao trong thư mục tạm): exit 1, 8 lỗi, 6 cảnh báo. Có đủ 6 dòng tiêu chí yêu cầu, thêm 2 dòng `/quiz/3/options/1`, `/quiz/3/options/2` (q4 có 3 lựa chọn đều không hình):
  ```
  01-thuc-an-cho-ta-nhung-gi.json /warmup/0/format [age_format_not_allowed] format fill_blank_bank không dùng ở Khởi động của nhóm explorer (được dùng: single_choice, true_false)
  01-thuc-an-cho-ta-nhung-gi.json /quiz/1/format [age_format_not_allowed] format fill_blank_bank không dùng ở Quiz của nhóm explorer (được dùng: single_choice, true_false, order_sequence)
  01-thuc-an-cho-ta-nhung-gi.json /quiz/3/options/0 [age_image_required] lựa chọn q4_protein thiếu image; nhóm explorer bắt buộc mọi lựa chọn có hình
  01-thuc-an-cho-ta-nhung-gi.json /quiz/3/options/1 [age_image_required] lựa chọn q4_fats thiếu image; nhóm explorer bắt buộc mọi lựa chọn có hình
  01-thuc-an-cho-ta-nhung-gi.json /quiz/3/options/2 [age_image_required] lựa chọn q4_carbs thiếu image; nhóm explorer bắt buộc mọi lựa chọn có hình
  01-thuc-an-cho-ta-nhung-gi.json /quiz/4/format [age_format_not_allowed] format multi_choice không dùng ở Quiz của nhóm explorer (được dùng: single_choice, true_false, order_sequence)
  01-thuc-an-cho-ta-nhung-gi.json /quiz/5 [age_image_required] câu true_false q6 thiếu image (hình vật được nói tới); nhóm explorer bắt buộc câu đúng/sai có hình
  01-thuc-an-cho-ta-nhung-gi.json /quiz [age_dok_mix] phân bổ DOK 1·2·3 là 2·3·1; nhóm explorer cần 3·3·0
  ```
  6 cảnh báo `age_words_en` (Explorer tối đa 8 từ), ở: `/key_points/2/en` (9), `/warmup/0/sentence/en` (10), `/quiz/2/prompt/en` (10), `/quiz/4/explanation_correct/en` (9), `/quiz/5/hint/en` (9), `/quiz/5/explanation_correct/en` (10).
- [x] **Fixture một lỗi:** chạy `validate <topic> <file>` cho từng file. Mỗi file cho exit 1 và đúng 1 dòng lỗi:

  | File | Dòng lỗi |
  | --- | --- |
  | `explorer-option-no-image` | `/quiz/0/options/1 [age_image_required]` |
  | `explorer-single-choice-4-options` | `/quiz/0/options [age_option_count]` |
  | `explorer-fill-blank-bank` | `/quiz/2/format [age_format_not_allowed]` |
  | `explorer-true-false-no-image` | `/quiz/1 [age_image_required]` |
  | `discoverer-single-choice-2-options` | `/quiz/0/options [age_option_count]` |
  | `scientist-single-choice-3-options` | `/quiz/0/options [age_option_count]` |
  | `discoverer-first-item-dok` | `/quiz/0/dok [age_first_item_dok]` |
  | `discoverer-no-misconception` | `/quiz [age_misconception_count]` |
  | `scientist-3-misconceptions` | `/quiz [age_misconception_count]` |
  | `discoverer-2-formats` | `/quiz [age_format_variety]` |
  | `explorer-warmup-multi-choice` (thêm) | `/warmup/0/format [age_format_not_allowed]` |
  | `explorer-warmup-option-no-image` (thêm) | `/warmup/0/options/0 [age_image_required]` |
  | `explorer-sequence-item-no-image` (thêm) | `/quiz/3/items/1 [age_image_required]` |
  | `explorer-order-sequence-4-items` (thêm) | `/quiz/3/items [age_option_count]` |
  | `explorer-dok-mix` (thêm) | `/quiz [age_dok_mix]` |
  | `explorer-2-misconceptions` (thêm) | `/quiz [age_misconception_count]` |

  - Scientist hợp lệ có 2 câu misconception: exit 0, 0 lỗi.
  - Explorer hợp lệ: 0 lỗi, 1 cảnh báo `format_not_rendered`, vì q4 là `order_sequence`.
  - `rules.json` thiếu `discoverer.authoring` → exit 1, dòng `…/topic.json /age_group [age_rules_missing] nhóm tuổi discoverer chưa có authoring trong <file>; chưa kiểm được luật soạn theo tuổi`.
- [x] **`build` chạy cùng luật:** bản sao đầu ra tts, q1 bỏ một lựa chọn sai.
  - `build` → exit 1, `Không build được (1 lỗi). Chưa ghi gì vào …`, thư mục `--out` không được tạo.
  - Dòng lỗi giống hệt dòng của `validate`: `…/01-thuc-an-cho-ta-nhung-gi.json /quiz/0/options [age_option_count] single_choice có 2 lựa chọn; nhóm discoverer cần 3–4`.
- [x] **Chặn format chưa hiện được:** bản sao đầu ra tts, q2 thay bằng `order_sequence` 3 thẻ hợp lệ. Câu mới dùng lại `Spoken` có audio của q2 và nhãn lựa chọn q1, nên không có lỗi thiếu clip.
  - `build --min-app-version 0.1.0` → exit 1, không ghi gói, dòng `…/quiz/1/format [format_not_rendered] format order_sequence chưa hiện được ở app 0.1.0: chưa bản app nào hiện được format này; app cũ sẽ bỏ câu này`.
  - `validate` cùng bài → exit 0, dòng tổng `0 lỗi · 1 cảnh báo`, dòng `… [format_not_rendered] cảnh báo: format order_sequence chưa hiện được ở app 0.1.0: …; build sẽ báo lỗi`.
- [x] **Tương thích:** build lại từ `content/.build/tts/discoverer/an-uong-lanh-manh/`.
  - Input này trùng fixture bài 1 (chỉ thêm `audio`); clip lấy từ cache, không sinh lại.
  - `build` exit 0, 210 asset (100 EN, 110 VI).
  - `pack.json` sha256 `59d874acba16fe7643b2c7e59d97cfdb523e75a647b28cdcf38cefda381a00a5`, giống bản cũ. Version chủ đề vẫn `692f2e75ba89`. Mọi file ngoài manifest giống từng byte.
  - Manifest khác đúng 3 khoá: `content_version` (`89d8ade0a3cd` → `803c0cb00461`), `rules` và `generated_at` (đổi ở mọi lần build, SK-015).
  - `rules` mới bỏ `authoring` thì bằng `rules` cũ.
  - `sh tools/content-cli/scripts/check-pack.sh content/.build/pack` → OK, exit 0.
- [ ] **App hiện tại đọc được manifest mới:** việc của tester, xem dưới. Dev không chạy simulator.
  - Theo code, app đọc an toàn: `LessonRules` decode `Rules`, `XPRules`, `StreakRules` bằng `JSONDecoder`, nên bỏ qua khoá lạ.
- [x] **Test cũ xanh:**
  - `tools/content-cli`: `npm test` 215/215 (trước khi sửa là 173), exit 0; typecheck exit 0.
  - `packages/content-schema`: `npm test` 98/98, exit 0; typecheck exit 0.
- [ ] **TEMPLATE khớp `rules.json`:** tester đối chiếu. Hiện lệch 2 ô Scientist, vì TEMPLATE còn ghi "chờ PM" (quyết định 1 ở trên).

**Việc cho tester**
- Chạy unit `ContentKitTests` và `LessonPlayerTests` 1 lần trên iPhone 16 Pro, với gói `content/.build/pack` (`content_version` `803c0cb00461`).
- Đối chiếu bảng TEMPLATE với `authoring`, sau khi content-editor sửa 2 ô Scientist.
- Chạy lại `npm test` ở `tools/content-cli` và `packages/content-schema`.
- Xem `test/fixtures/age-rules/expected.json`: pointer và mã mong đợi được ghi tay trong `scripts/make-age-fixtures.ts`, không do validator tính ra.

**Máy chưa kiểm** (người duyệt kiểm, hoặc cần thêm luật)
- câu misconception của Explorer đặt ở câu 6;
- số từ EN trên một màn;
- `labels` của `true_false` ở Explorer (đề xuất 4 của content-editor);
- cận dưới riêng theo tuổi của `multi_choice` và số từ trong ngân hàng `fill_blank_bank`;
- tỉ lệ đúng kỳ vọng;
- vùng chạm.

**Còn chưa chắc**
- **Đếm từ** dựa trên khoảng trắng và dấu câu. Chữ viết tắt có dấu chấm theo sau là khoảng trắng (`e.g. rice`) sẽ bị tách thành hai câu. Bài 1 không có chữ nào như vậy.
- **Hai số Scientist** (15 và [4, 4]) do điều phối chốt theo đề xuất của content-editor, chưa có trong bảng Đặc tả của PM.
- **`age_words_en` dùng `max_words_en` của nhóm của topic.** Một chủ đề Explorer có câu ví dụ từ vựng dài vẫn bị cảnh báo. Đúng như TEMPLATE ghi, nhưng sẽ nhiều cảnh báo hơn khi bắt đầu soạn Explorer.

## Nghiệm thu GĐ 0 (tester, 1/11)

Ngày 1/11/2026 · tester tự chạy lại, không dựa log của dev. Mọi thử nghiệm sửa file làm trên bản sao ở `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/t/`; không sửa file nguồn, không ghi đè `content/.build/pack`. Không commit. Tiêu chí "Phương án canvas" không thuộc lần này.

| Tiêu chí | Kết quả |
| --- | --- |
| `rules.json` có `authoring` đúng bảng; `npm test` xanh; `build` chép vào manifest | **Đạt** |
| Bài 1 sạch | **Đạt** |
| Bài 1 đổi sang Explorer | **Đạt** (kèm L1 về cách làm trong ticket) |
| Fixture một lỗi (16 file) | **Đạt** |
| `build` chạy cùng luật | **Đạt** |
| Chặn format chưa hiện được | **Đạt** |
| Tương thích | **Đạt** phần kiểm được; so manifest với bản `89d8ade0a3cd` **chưa kiểm** (gói cũ không còn) |
| App hiện tại đọc được manifest mới | **Đạt** (68/68) |
| Test cũ xanh | **Đạt** |
| TEMPLATE khớp `rules.json` | **Đạt**, 27/27 ô khớp; xem "Ô cần chú ý" |
| Phương án canvas | Không thuộc lần này |
| Mỗi agent chỉ sửa vùng của mình, không commit | Chưa kiểm hết (tester không có diff theo agent); không thấy file ngoài vùng trong các thư mục đã đọc |

### Lệnh và dòng báo thật
- `cd tools/content-cli && npm test`: `ℹ tests 215 · pass 215 · fail 0 · skipped 0`; `npm run typecheck` exit 0.
- `cd packages/content-schema && npm test`: `ℹ tests 98 · pass 98 · fail 0 · skipped 0`.
- **Bài 1 sạch:** `node src/cli.ts validate ../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/{topic.json,01-thuc-an-cho-ta-nhung-gi.json}` → exit 0, `nhóm discoverer · 0 lỗi · 0 cảnh báo`. Không có cảnh báo cho content-editor.
- **Bài 1 sang Explorer** (thư mục `explorer/an-uong-lanh-manh/`, `age_group` = explorer): exit 1, 8 lỗi + 6 cảnh báo `age_words_en`. Có đủ 6 dòng tiêu chí: `/warmup/0/format`, `/quiz/1/format`, `/quiz/4/format` (`age_format_not_allowed`); `/quiz/3/options/0` (+ options/1, options/2); `/quiz/5` (`age_image_required`); `/quiz [age_dok_mix]` (2·3·1, cần 3·3·0).
- **Fixture:** chạy `validate` từng file của 15 file trong `test/fixtures/age-rules/invalid/`, mỗi file exit 1, đúng 1 dòng lỗi, đúng pointer và mã (đối chiếu bảng dev: khớp cả 15). Ca thứ 16 (`rules.json` thiếu `authoring`) chạy bằng `--rules` bản sao: `/age_group [age_rules_missing]`, exit 1; bỏ hẳn nhóm khỏi file cũng ra `age_rules_missing`, exit 1.
- **`build` có lỗi luật:** bản sao bài 1, q1 còn 2 lựa chọn → `/quiz/0/options [age_option_count] single_choice có 2 lựa chọn; nhóm discoverer cần 3–4`, `Không build được (1 lỗi). Chưa ghi gì vào …`, exit 1, thư mục `--out` không tồn tại.
- **`format_not_rendered`:** bản sao bài 1, q2 thành `order_sequence` 3 thẻ: `build --min-app-version 0.1.0` → `/quiz/1/format [format_not_rendered] format order_sequence chưa hiện được ở app 0.1.0: …`, exit 1, không ghi gói. `--min-app-version 9.9.9` vẫn lỗi (format chưa có renderer nào). `validate` cùng bài: 0 lỗi · 1 cảnh báo, exit 0.
- **Tương thích:** `build` từ `content/.build/tts/discoverer/an-uong-lanh-manh` với `--require-lang en,vi --out <scratchpad>/t/pack` → exit 0, 212 file. `pack.json` sha256 `59d874acba16fe7643b2c7e59d97cfdb523e75a647b28cdcf38cefda381a00a5` = bản trong `content/.build/pack` (và = sha dev ghi cho gói cũ); version chủ đề `692f2e75ba89`; `diff -r` với `content/.build/pack` chỉ khác `generated_at` của manifest; `content_version` `803c0cb00461`; `rules.discoverer.authoring` có mặt.
- **TEMPLATE vs `rules.json` vs bảng Đặc tả:** đối chiếu thủ công 9 hàng × 3 nhóm = 27 ô (format Khởi động, format Quiz, số lựa chọn, hình bắt buộc, DOK mix, DOK câu 1, misconception, số format, số từ EN). Mọi số trùng nhau, gồm 2 ô Scientist đã sửa (`max_words_en` 15, `picture_bar_chart` 4).

### Ca ticket không nêu (thử trên bản sao fixture Scientist hợp lệ)
- Explorer `order_sequence` 4 thẻ → `/quiz/3/items [age_option_count]` (fixture của dev), 1 lỗi.
- Scientist `single_choice` 5 lựa chọn (Quiz và Khởi động) → `/quiz/0/options` và `/warmup/0/options [age_option_count] … cần 4`, 1 lỗi mỗi ca.
- Câu EN 15 từ: không cảnh báo. 16 từ: `/quiz/0/prompt/en [age_words_en] … 16 từ, nhóm scientist tối đa 15`, exit 0. Hai câu 10 + 15 từ trong một chuỗi: không cảnh báo (đếm theo câu, đúng ý dev).
- Topic thiếu `age_group`: content-schema chặn trước (`/age_group thiếu trường bắt buộc`), không tới luật tuổi; exit 1.
- `dok_mix` sai → đúng 1 dòng `age_dok_mix` (2·2·2); DOK giảm câu 4 → câu 5 → chỉ cảnh báo `age_dok_order`, exit 0.

### Unit iOS (1 lần, 1 máy)
- Máy: iPhone 16 Pro `14DF158D-5ED6-49CF-80A5-7519B0D594F5` (đã Booted sẵn, không có `xcodebuild` khác chạy).
- Build: `xcodebuild build-for-testing -project ScienceKids.xcodeproj -scheme ScienceKids -destination 'generic/platform=iOS Simulator' -derivedDataPath <scratchpad>/sk026/dd` → `** TEST BUILD SUCCEEDED **`; log `note: Content pack embedded … (212 files)`; manifest trong bundle có `authoring` và `content_version` `803c0cb00461`.
- Chạy: `xcodebuild test-without-building … -destination 'id=14DF158D-…' -only-testing:ContentKitTests -only-testing:LessonPlayerTests` → `** TEST EXECUTE SUCCEEDED **`, exit 0. **68 test: 68 pass, 0 fail, 0 skip** (ContentKit 18, LessonPlayer 50). `builtPackOpens`, `builtPackRefusesAChangedClip`, `builtPackRefusesAChangedPackJSON` đều pass; `pack voice: 112 strings shown on 11 steps, 94 different VI clips, all in the pack`.
- Không chạy UI test, không chạy lại.
- xcresult: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk026/result.xcresult`; log: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk026/logs/run.log`, `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk026/logs/build.log`.
- Sau đó `xcrun simctl shutdown`; số máy Booted = 0.

### Lỗi và góp ý
Không có lỗi chặn, không có lỗi sản phẩm.

- **L1 (góp ý, tiêu chí ghi sai cách làm):** tiêu chí "Bài 1 đổi sang Explorer" bảo chép hai file sang thư mục tạm bất kỳ. Làm đúng như vậy thì `validate` dừng ở content-schema: `/slug slug "an-uong-lanh-manh" phải trùng tên thư mục "exp"`, exit 1, không ra dòng `age_*` nào. Tái hiện: `mkdir /tmp/x; cp topic.json 01-*.json /tmp/x; sed age_group; validate`. Mong đợi theo ticket: các dòng `age_*`. Thực tế: chỉ 1 dòng `/slug`. Cách đúng: thư mục tạm phải tên `an-uong-lanh-manh`. Sửa chữ trong ticket, không sửa code.
- **L2 (góp ý):** ba điều của bảng Đặc tả máy chưa kiểm, dù TEMPLATE đã ghi rõ: Explorer có đúng 1 câu misconception đặt ở câu 6; số từ EN trên một màn (15 / 30 / 40–50); `labels` của `true_false` Explorer để trống. Luật 3, 5 của "Luật soạn câu Explorer" trong TEMPLATE nêu giới hạn 15 từ mỗi màn, nhưng `validate` chỉ đếm từng câu. Cần PM quyết định có thêm mã hay để người duyệt.
- **L3 (góp ý):** `order_sequence` và `picture_bar_chart` có `FORMAT_FIRST_APP_VERSION` = `null`, nên `build` không đóng gói được bài dùng hai format này với bất kỳ `--min-app-version` nào (đã thử 9.9.9) tới khi dev sửa bảng. Đúng ý "chưa có renderer", nhưng fixture Explorer hợp lệ của dev luôn kèm 1 cảnh báo `format_not_rendered`, và nhóm Explorer cho phép `order_sequence`: nhớ sửa bảng cùng lúc với renderer GĐ 1 S4.
- **L4 (góp ý):** `age_format_variety` đếm cả format không được phép; quyết định 4 của dev, mỗi fixture một lỗi. Hệ quả: quiz Explorer dùng `fill_blank_bank` + `single_choice` chỉ báo `age_format_not_allowed`, không báo thiếu đa dạng. Chấp nhận được.
- **Ô cần chú ý, không lệch:** TEMPLATE ghi "`multi_choice`: tối đa 6" còn `authoring` là [2, 6]; hai bên cùng nghĩa vì 2 là cận dưới của schema. Câu misconception Explorer "đặt ở câu 6" chỉ có trong TEMPLATE và bảng Đặc tả, không có khoá trong `authoring` (xem L2).

### Chưa kiểm
- So manifest mới với manifest cũ `89d8ade0a3cd` (chỉ khác `rules` và `content_version`): gói cũ không còn trong repo. Đã kiểm `pack.json` giống sha dev ghi, và manifest build lại chỉ khác manifest hiện tại ở `generated_at`.
- UI test, iPad, máy khác: không thuộc lần này.

**Phiên chính kiểm thêm (1/11):** so manifest mới (`803c0cb00461`) với manifest cũ `89d8ade0a3cd` (bản lưu ở scratchpad `sk024-can-am-luong/pack-rebuild`): chỉ khác `content_version`, `generated_at` và `rules`; bỏ `authoring` ra thì `rules` trùng bản cũ. Tiêu chí "Tương thích" đạt đủ. L1 đã sửa chữ trong tiêu chí. L2 (thêm mã cho câu misconception ở câu 6, số từ trên màn, `labels` của `true_false` Explorer) để PM quyết khi tách ticket GĐ 2.

## Kết quả GĐ 0 (designer)

Ngày 1/11/2026 · designer. Chưa publish canvas. Ngày 2/11, Duy chốt theo đề xuất bên dưới: xem mục "Hình thức D2 (Duy chốt 2/11)". Phiên chính sửa tiêu đề và ghi chú của khung trong `canvas.json` cho khớp.

**File** trong `design/play-ui/project/`:
- `Explorer-Quiz-A.dc.html`, `Explorer-Quiz-B.dc.html`, `Explorer-Quiz-C.dc.html`: 3 phương án trên cùng một nội dung, câu 4 "Which one is a bird?" (cá, gà, chó) và câu 5 khi sang câu.
- `Explorer-QuizTF.dc.html`: câu 6 `true_false` (chim cánh cụt), khung A với dấu kết quả theo đề xuất bên dưới; tweak `icons` đổi giữa 2 bộ biểu tượng.
- `Explorer-QuizTF-Icons.dc.html`: bảng so 2 bộ biểu tượng Đúng/Sai với dấu kết quả của A, B, C.
- `canvas.json`: thêm 5 frame ở hàng mới y = 9594 (dưới hàng Scientist), tiêu đề `explorerQuizTitle` và ghi chú `explorerQuizOptions`; trong `order` chèn sau `Explorer-Reward`. Frame và ghi chú cũ không đổi.
- Hình mới: chim cánh cụt (6 lớp giấy), 4 nét mặt linh vật (nói, cười, nghĩ, thường), 4 biểu tượng Đúng/Sai. Các con vật khác chép từ canvas Explorer.

**Cách xem:** tweak `state` gồm đang đọc câu hỏi · vừa chạm: đọc tên · đúng · sai lần 1: gợi ý · hết lượt: đáp án · sang câu; `showVi` tắt phụ đề VI. Chạm thẻ trên bảng thì chơi tiếp: app "đọc tên" 0,9 s rồi chấm; nút sang câu dẫn tới câu 5, rồi màn Đúng/Sai, rồi màn Thưởng. Màn Đúng/Sai có tweak `icons` và `state` riêng (hướng dẫn lần đầu, đang đọc câu, vừa chạm, đúng, sai lần 1, đúng ở lần 2).

**Chung cho cả 3** (D1, D2, D4):
- Chữ chỉ ở câu hỏi và lời linh vật. Thẻ, nút sang câu, dấu đúng, dấu thử lại không có chữ. Bỏ dòng "câu 4/6" dưới thanh tiến độ.
- Thanh tiến độ: câu đã làm cùng một màu gỉ đồng, không dấu tích, để không lộ đúng/sai (D1). Canvas `Explorer-Quiz` cũ dùng ô đỏ son có tích.
- Hết lượt: thẻ đáp án nền vàng hoè nhạt (`feedback_missed`, như nhãn "Đáp án" của Discoverer), thẻ sai xám đi. Không đóng triện đúng lên thẻ đáp án.
- Trạng thái đúng và hết lượt vẽ lúc đã đọc xong, nên vòng lặp duy nhất là nút sang câu nhún. Lúc đang đọc, A cho linh vật đung đưa; B và C không có vòng lặp.
- Motion chép nguyên bộ CSS của Discoverer; bật giảm chuyển động thì tắt hết.

**A · Bạn kể chuyện.** Linh vật và bong bóng lời ở đầu màn. Mọi câu app nói hiện trong một bong bóng, và cả bong bóng là nút nghe lại. Đang đọc: linh vật há miệng, đung đưa, huy hiệu loa chuyển vàng hoè. Đúng: dấu tròn lá tre có tích. Sai: thẻ lõm, hình xám, mẩu giấy gấp góc có mũi tên vòng. Sang câu: nút đỏ to cả bề ngang, chỉ có mũi tên.
- Hợp với bé: chỉ một nguồn tiếng là linh vật; nút sang câu to và dễ thấy nhất; gần canvas Duy đã duyệt.
- Rủi ro: ít cá tính nhất; dấu tròn có tích dễ giống huy hiệu "check" mặc định. Khi đang gợi ý, câu hỏi bị lời gợi ý thay chỗ.

**B · Sách tranh.** Ba tranh ghim nghiêng trên trang; phụ đề ở chân trang như sách tranh; linh vật ló đầu sau mép giấy. Đang đọc: từ đang đọc có nền vàng hoè sát chữ (karaoke). Đúng: tranh thẳng lại, triện vuông lá tre có tích, cùng hình triện "ĐÚNG" của Discoverer. Sai: tranh bong ghim, lệch thêm, góc lật xuống có mũi tên vòng. Sang câu: góc trang cong lên, màu đỏ son, có mũi tên; vùng chạm 136pt.
- Hợp với bé: "tranh bong ra" là cách báo sai mềm, không giống bị phạt. Karaoke giúp phụ huynh đọc kèm và bé lớp 1 tập đọc.
- Rủi ro: Kokoro và VieNeu không trả mốc thời gian theo từ, nên karaoke thêm việc cho dev; không có mốc thì chỉ tô được cả dòng. Bé 5 tuổi có thể chưa biết chạm góc trang. Góc trang ở đáy phải màn phải nằm trong vùng an toàn.

**C · Tranh treo.** Ba tranh dọc treo trên thanh gỗ thành một hàng, như tranh bộ. Câu hỏi giữ nguyên ở đầu màn; linh vật ở đáy chỉ nói lời phản hồi. Đang đọc: dải giấy vàng hoè chạy dưới câu theo độ dài clip, loa chuyển vàng hoè. Đúng: triện hoa thị lá tre đóng ở chân tranh. Sai: tranh lật úp, mặt sau có mũi tên vòng. Hết lượt: chỉ tranh đáp án còn ngửa. Sang câu: mũi tên băng giấy đỏ son, đuôi cắt chữ V.
- Hợp với bé: trạng thái hết lượt rõ nhất, vì chỉ còn một tranh ngửa. Câu hỏi không mất khi đang gợi ý. iPad dùng cùng bố cục một hàng.
- Rủi ro: lệch đặc tả "iPhone xếp dọc"; hình chỉ rộng khoảng 96pt; lật úp làm bé không nhìn lại được hình mình đã chọn; màn có hai chỗ chữ.

**Biểu tượng Đúng/Sai.**
- **1 · Gật đầu / lắc đầu:** mặt bạn nhỏ; bóng đầu và mũi nhọn gỉ đồng chỉ hướng cử động; hai mặt cùng cười, để "Sai" không thành "buồn". Lần đầu gặp dạng câu này, giọng đọc hướng dẫn và thẻ được nhắc tới nhún một nhịp.
- **2 · Ngón cái lên / xuống:** bàn tay giấy màu da rám, tay áo chàm. Rủi ro: dễ hiểu thành thích / không thích, và hình bàn tay dễ thành clip-art.
- Cả hai bộ không dùng lá tre, dấu tích, X hay mũi tên vòng. Đó là các hình của dấu kết quả (lá tre có tích; giấy lõm có mũi tên vòng). Biểu tượng nằm giữa thẻ, còn dấu kết quả đóng ở góc thẻ.
- Đề xuất bộ 1: đây là cử chỉ bé tự làm khi trả lời có/không, và không mang nghĩa thích/không thích. Hình tĩnh dựa vào mũi nhọn, nên vẫn cần playtest cả hai bộ.

**Đề xuất của designer.** Lấy A làm khung, thay hai chi tiết bằng của B:
- triện vuông lá tre, đồng bộ với triện "ĐÚNG" của Discoverer và bớt giống huy hiệu check;
- góc bong có mũi tên vòng, thay cho mẩu giấy gấp góc.

Màn câu 6 Đúng/Sai dựng đúng theo cách ghép này. Karaoke của B để sau, khi `content-cli tts` có mốc thời gian theo từ. Không lấy kiểu lật úp của C, vì khi nghe gợi ý bé cần nhìn lại hình mình đã chọn.

**Tự kiểm.** Chạy Chrome headless với runtime `support.js` của canvas, khung 390×844, mọi trạng thái của 4 màn.
- **Vừa khung:** mọi trạng thái vừa 844px, không chữ bị cắt. Khoảng dư nhỏ nhất: A 66, B 90, C 74, Đúng/Sai 34 (lúc đọc hướng dẫn, bong bóng dài nhất).
- **Không chữ trên thẻ:** thẻ chọn, biểu tượng Đúng/Sai, triện, dấu thử lại và nút sang câu không có phần tử chữ. Nhãn VoiceOver đặt ở `aria-label`: Con cá, Đúng, Sai, Câu tiếp, Nghe lại…
- **Vùng chạm:** không vùng nào dưới 72pt.
  - Thẻ A: 345×128. Tranh B: 338×128. Tranh C: 108×290. Thẻ Đúng/Sai: 166×168.
  - Nút thoát, nút nghe lại: 72.
  - Nút sang câu: A 350×84, B 136×136, C 240×88.
- **Tương phản chữ:** than tre/giấy 15,89; chữ phụ/giấy 8,93; than tre/vàng hoè (karaoke) 7,88.
- **Tương phản hình cần nhận biết:**
  - tích giấy/lá tre 4,82; triện lá tre/thẻ giấy 4,82;
  - mũi tên giấy/đỏ son 5,86; nút đỏ son/nền điệp 5,10;
  - mũi tên vòng than tre/mặt sau giấy 8,85; mũi nhọn gỉ đồng/đĩa điệp 4,67;
  - bàn tay da rám/đĩa điệp 3,37. Da sáng chỉ đạt 1,33 nên đã đổi.
- **Dưới 3:1 nhưng không phải tín hiệu duy nhất:**
  - dải đọc vàng hoè của C (1,56), đi kèm loa đổi màu (7,88);
  - thẻ đáp án vàng hoè nhạt trên giấy (1,47), trong khi các thẻ khác xám đi;
  - ô tiến độ hiện tại vàng hoè trên điệp (1,75), to hơn các ô khác như ở Discoverer.
- **Chuyển động:** mỗi trạng thái có tối đa 1 vòng lặp. Bật giảm chuyển động thì không còn animation nào.
- **Console và luồng:** console không lỗi. Chạm lần lượt các thẻ rồi nút sang câu thì chạy hết luồng.
- **Không sửa:** `tokens.json`, canvas Discoverer, `docs/backlog/README.md`. Màu ngoài token chỉ có trong hình minh hoạ: lông cánh cụt `#33363D` và `#262A30`, tóc `#3A2A20`, da `#E9C39A`, `#A86F43`, `#8E5A34`, `#C99467`.

**Còn chưa chắc**
- Chữ trên canvas là lời mẫu của designer. content-editor viết lời thật (gợi ý, giải thích, hướng dẫn Đúng/Sai) ở GĐ 2.
- **Đúng/Sai với `max_tries` 2:** câu có 2 lựa chọn, nên sau lần sai đầu chỉ còn một thẻ và không có trạng thái hết lượt. Cần dev/PM chọn:
  - giữ 2: bé tự sửa và được một lần đúng;
  - đặt 1 cho `true_false` của Explorer.
- Karaoke (B) cần mốc thời gian theo từ. dev nên xem `content-cli tts` làm được không trước khi Duy chọn B.
- Canvas dùng `sc-for` và `<use href="{{…}}">`. Runtime `support.js` hỗ trợ và đã chạy được, nhưng chưa canvas nào khác dùng. Nếu bản Claude Design hiển thị khác thì báo designer.
