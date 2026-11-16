# Đề xuất · Hệ thống quiz

Trạng thái: Duy chọn hướng B và thêm bước Tổng kết bài theo cách T1 (15/11). Đợt 1 có ticket [SK-047](backlog/SK-047-quiz-system-wave-1.md), viết theo 3 mặc định ở mục 9; *(16/11)* đã làm và nghiệm thu, tài liệu đã cập nhật, ticket ở `review` chờ Duy commit. Đợt 2 và 3 chưa có ticket · Ngày: 2026-11-15 · Người viết: phiên chính
Nguồn: review các dạng quiz ngày 15/11 (code `apps/ios/Packages/SKKit/Sources/LessonPlayer`, thống kê 59 bài trong `content/`); syllabus-progression mục 6, 7, 9, 10; technical-plan B4.2, B4.4; SK-026; SK-043 (A2 "Sách tranh", Duy duyệt 14/11); SK-044.

Ký hiệu: **(đ)** là số hoặc luật đề xuất, chưa có nguồn, hiệu chỉnh sau playtest.

## 0. Tóm tắt

- **Vấn đề:** quiz hiện là 6 dạng rời. Mỗi bài ráp theo thói quen, không câu nào được định rõ là để kiểm cái gì. Hệ quả:
  - câu khó nhất bài (DOK 3) đoán mò đúng 50%;
  - có những mẫu lặp mà bé học được mẹo;
  - sai thì lần thử hai không giúp bé hiểu thêm;
  - biên tập phải cân vị trí đáp án bằng tay.
- **Ba hướng:**
  - A · Vá trong khung cũ;
  - **B · Quiz theo vai trò câu (Duy chọn 15/11)**;
  - C · Ngân hàng câu thích ứng.
- **Hướng B gồm:**
  - khung 6 câu theo vai trò;
  - 5 cơ chế chạm dùng chung cho mọi dạng;
  - một thang phản hồi chung;
  - app tự xáo lựa chọn;
  - một dạng mới `claim_check` cho câu 6;
  - luật chống mẹo do máy kiểm;
  - **bước Tổng kết bài sau Quiz** (Duy thêm 15/11, mục 4.9): 3 ý chính, ý sai đặt cạnh ý đúng, từ mới, câu "I can…". Ý nào bé làm sai trong Quiz thì có thêm một dòng xem lại.
- **Làm theo 3 đợt:**
  - đợt 1 không đổi schema;
  - đợt 2 là schema v1.1;
  - đợt 3 sau beta.
- **Cần Duy quyết:** mục 9.

## 1. Hiện trạng (số liệu 15/11)

| Điểm | Số liệu | Hệ quả |
| --- | --- | --- |
| Khuôn quiz Discoverer | 18/40 bài đúng khuôn SC · FB · MC · SC · SC · TF; 40/40 bài câu 6 là TF | Mỗi câu không có vai trò riêng; dạng câu không theo nội dung bài |
| Câu DOK 3 | 40/40 câu DOK 3 là TF "Na nói đúng không?", 1 lượt (`max_tries_by_format.true_false: 1`) | Câu khó nhất đoán bừa đúng 1/2. Phần suy luận bằng bằng chứng không được kiểm |
| Dạng có app mà nội dung không dùng | Discoverer: `order_sequence` 1 câu, `picture_bar_chart` 1 câu | Kỹ năng trình tự, đọc biểu đồ (syllabus mục 9) gần như không được kiểm |
| `multi_choice` | 34/40 câu là "chọn 2 trong 4"; 40/40 cùng một câu hướng dẫn | Bé học được mẹo "luôn chọn 2" |
| `fill_blank_bank` | 37/40 câu có 1 chỗ trống, 38/40 kho 3 từ; ở Quiz 35/37 câu là DOK 1; chạm là trả lời | Về nhận thức giống `single_choice` dùng chữ |
| Vị trí đáp án | App không xáo. Biên tập cân tay (bảng trong `_topic.md`), tester chạy script (SK-031, 032, 036) | Tốn công; khi học lại, bé nhớ được vị trí |
| Gợi ý | `hint` của 158 câu TF không bao giờ hiện (1 lượt), nhưng vẫn phải viết và vẫn sinh clip. A2 bỏ nút "Gợi ý" trước khi trả lời, nên `hint_used` luôn false | Phí nội dung; mất dữ liệu cho báo cáo |
| Thử lại `order_sequence` | Sai thì cả 3 thẻ về kho | Bé không biết mình sai ở chỗ nào |
| `picture_bar_chart` | Tên cột ẩn tới khi chấm; không trục, không số | Chỉ hỏi được "cột nào cao nhất" |

## 2. Hệ thống cần đạt gì

Dùng 7 tiêu chí này để so ba hướng:
1. **Mỗi câu kiểm một việc rõ ràng,** biết được câu đó để kiểm cái gì.
2. **Câu càng khó càng khó đoán mò:** đoán bừa câu DOK 3 đúng ≤ 1/6 (đ).
3. **Sai thì học được:** lần thử hai có giàn giáo, không phải đoán lại từ đầu.
4. **Giữ A2:** ít chữ, hình to, chạm là trả lời.
5. **Ít việc tay cho biên tập:** máy kiểm được.
6. **Tương thích:** schema v1 chỉ thêm; app cũ không vỡ.
7. **Dữ liệu dùng được** cho báo cáo phụ huynh và ôn tập sau này.
8. **Bé ra khỏi bài với bức tranh chung** (Duy thêm 15/11): quiz kiểm từng mảnh, cuối bài cần ghép lại.

## 3. Ba hướng

| | A · Vá trong khung cũ | **B · Quiz theo vai trò câu** | C · Ngân hàng câu thích ứng |
| --- | --- | --- | --- |
| Làm gì | Xáo lựa chọn; giữ thẻ đúng chỗ khi thử lại; hiện tên cột biểu đồ; nút gợi ý; luật chống mẹo cho MC | A, cộng: khung 6 câu theo vai trò; trường `skill`; dạng `claim_check` cho câu 6; 5 cơ chế dùng chung; thang phản hồi chung | B, cộng: mỗi câu gắn khái niệm, kỹ năng, độ khó; app chọn câu theo kết quả của bé; Khởi động và ôn tập lấy câu từ ngân hàng theo lịch giãn cách |
| Đạt tiêu chí | 3, 4, 5, 6 | Cả 7 | Cả 7, và quiz hợp sức từng bé |
| Chưa giải quyết | Câu DOK 3 vẫn đoán 50%; quiz vẫn ráp theo thói quen | Quiz vẫn giống nhau cho mọi bé | — |
| Đổi schema | Không | v1.1: thêm 1 format và 1 trường tuỳ chọn | Thêm khái niệm, độ khó; nhiều câu hơn mỗi bài |
| Việc nội dung | Nhỏ: sửa MC, FB | Vừa: chuyển 40 câu 6; chọn lại câu 5 ở những bài hợp | Lớn: số câu gấp 2–3 lần; cần `p_correct` từ beta |
| Việc app | Nhỏ | Vừa | Lớn, thêm logic chọn câu ở server |
| Khi nào làm được | Ngay | Trước beta | Sau beta (cần dữ liệu thật) |

**Duy chọn B (15/11)** và thêm bước Tổng kết bài (mục 4.9). Lý do khuyến nghị B:
- A rẻ, nhưng không sửa được câu khó nhất bài.
- C cần dữ liệu mà ta chưa có.
- B sửa đúng các lỗ hiện có, và trường `skill` cùng ngân hàng câu chuẩn bị sẵn để sau này nối sang C.

## 4. Hướng B chi tiết

### 4.1 Khung 6 câu theo vai trò

| Câu | Vai trò | Kiểm điều gì | Explorer | Discoverer | Scientist |
| --- | --- | --- | --- | --- | --- |
| 1 | **Nhớ** | Ý chính của bài | SC, TF | SC, TF | SC |
| 2 | **Từ mới** | Một từ trong mục Từ vựng của bài (`vocab`) | SC "nghe từ, chọn hình" | FB, từ trong chỗ trống là từ của bài | FB; `fill_blank_free` ở GĐ 2 |
| 3 | **Hiểu** | Giải thích, so sánh trong ngữ cảnh của bài | SC, TF | SC, TF, MC | SC, MC |
| 4 | **Áp dụng** | Dùng ý đã học vào tình huống mới, chưa gặp trong bài | SC | SC, MC | SC, MC |
| 5 | **Kỹ năng của bài** | Kỹ năng chính của bài, chọn theo loại bài (xem dưới) | OS; phân nhóm sau beta | OS, BAR, MC, SC | OS, BAR, MC; đọc bảng và đồ thị ở GĐ 2 |
| 6 | **Quan niệm sai** | Nhận ra ý sai và lý do | Như hiện tại: TF hoặc SC bằng hình | **`claim_check`** | **`claim_check`** |

| DOK theo câu 1 → 6 | Explorer | Discoverer | Scientist |
| --- | --- | --- | --- |
| | 1 · 1 · 1 · 2 · 2 · 2 (= 3·3·0) | 1 · 1 · 2 · 2 · 2 · 3 (= 2·3·1) | 1 · 2 · 2 · 2 · 3 · 3 (= 1·3·2) |

Khung khớp `dok_mix` hiện có ở `content/rules.json`, nên luật DOK giữ nguyên.

**Câu 5 chọn theo loại bài:**

| Bài nói về | Câu 5 dùng | Ví dụ |
| --- | --- | --- |
| Quá trình, chuỗi, dòng thời gian | `order_sequence` | Đường đi của không khí; hoá thạch hình thành |
| Thí nghiệm, đo đạc | `picture_bar_chart` | Nước thấm qua đất nào nhanh hơn; đo thời tiết |
| Phân loại | `multi_choice`; `sort_into_groups` sau beta | Đá nào thấm nước |
| Nhân quả, dự đoán | SC "Điều gì sẽ xảy ra nếu…?" | Ăn toàn kẹo thì sao |
| Bộ phận, cấu tạo | SC bây giờ; `label_diagram` ở GĐ 2 | Bên trong Trái Đất; bộ não |

**So với hiện tại (Discoverer):**
- Câu 1 và câu 2 gần như giữ nguyên: hiện đã thường là SC rồi FB.
- Việc nội dung dồn vào câu 5 (chọn theo kỹ năng của bài) và câu 6 (chuyển sang `claim_check`).

**Trường mới `skill` (tuỳ chọn) trên `quiz_item`:**
- Giá trị: `recall`, `vocab`, `understand`, `transfer`, `sequence`, `data`, `classify`, `cause`, `misconception`.
- Ba việc dùng tới trường này:
  - CLI kiểm khung (mục 4.7);
  - báo cáo phụ huynh theo kỹ năng;
  - ôn tập GĐ 2 chọn câu theo kỹ năng yếu.

### 4.2 Năm cơ chế chạm, dùng chung cho mọi dạng

Bé chỉ cần học 5 cách chạm; mọi dạng câu, kể cả dạng thêm sau này, là nội dung đặt lên một trong 5 cơ chế này.

| Cơ chế | Cách bé làm | Dạng dùng | Trong app hiện nay |
| --- | --- | --- | --- |
| 1. Chạm là trả lời | Chạm một thẻ | SC, TF, BAR, từng bước của `claim_check` | Có (A2) |
| 2. Chọn nhiều rồi Xong | Chạm nhiều thẻ, bấm mũi tên | MC | Có |
| 3. Đặt thẻ vào ô | Chạm thẻ để đặt vào ô trống kế tiếp; chạm thẻ đã đặt để lấy ra; kéo cũng được | FB (ô trong câu), OS (ô theo hàng), `label_diagram` (ô trên hình, GĐ 2) | Có, nhưng là 2 bản code riêng (`bankCards`, `ExplorerOrderSequence`). Đề xuất gộp làm một |
| 4. Xếp vào nhóm | Chạm thẻ rồi chạm nhóm | `sort_into_groups` (sau beta), dùng chung với Chơi | Chơi có `build_tray`; Quiz chưa có |
| 5. Hai bước | Nhận định, rồi chọn lý do | `claim_check` | Mới |

Lợi ích: thêm `label_diagram` về sau chỉ là cơ chế 3 đặt trên một tấm hình, không phải màn mới.

### 4.3 Thang phản hồi chung

| Lúc | Mọi dạng | Riêng theo cơ chế |
| --- | --- | --- |
| Trước khi trả lời | Discoverer, Scientist: nút **gợi ý** (biểu tượng, không chữ) cạnh nút nghe. Chạm thì in và đọc `hint`, ghi `hint_used`. Explorer không có nút này, vì gợi ý đã tự đọc khi sai | — |
| Sai lần 1, còn lượt | `feedback` của lựa chọn vừa chọn (SK-044), rồi `hint` | Chạm: thẻ sai lõm xuống (có sẵn) · Chọn nhiều: thẻ sai bong, thẻ đúng giữ (có sẵn) · **Đặt thẻ: thẻ đúng chỗ khoá lại, thẻ sai về kho (mới)** · Xếp nhóm: thẻ sai nảy về · Hai bước: xem 4.4 |
| Đúng, hoặc hết lượt | Giải thích; hết lượt thì hiện đáp án (có sẵn) | — |

- **Điểm giữ như B4.4:** 1 điểm khi đúng ở lần thử đầu. Giàn giáo ở lần hai không đổi điểm.
- **TF giữ 1 lượt.** `hint` của TF có chỗ dùng là nút gợi ý, nên không còn phí.
- **Mở gợi ý vẫn được điểm** (đ): chỉ ghi `hint_used` để báo cáo. Duy quyết, xem mục 9.

### 4.4 Dạng mới `claim_check` (câu 6 Discoverer và Scientist)

**Cách chơi:**
1. **Nhận định:** Na nói một câu, bé chạm gật (Na đúng) hoặc lắc (Na chưa đúng). Chạm là trả lời, 1 lượt.
2. **Lý do:** app hỏi "How do you know?" · "Sao em biết?". Có 3 thẻ (Scientist 4 thẻ), mỗi thẻ là hình cùng một câu ngắn:
   - 1 thẻ là **bằng chứng đúng**;
   - 1 thẻ là **điều đúng nhưng không chứng minh được gì**;
   - 1 thẻ **lặp lại hoặc dựa vào ý sai**.

**Cách xử lý khi sai:**
- **Sai ở bước 1:** app nói nhận định đúng ("Na chưa đúng đâu"), rồi vẫn sang bước 2. Bé vẫn đi tìm bằng chứng, nhưng câu này không có điểm.
- **Sai ở bước 2, còn lượt:** đọc `feedback` của thẻ vừa chọn và `hint`, rồi bé chọn lại ở bước 2. Bước 1 không làm lại. Bước 2 có tối đa `max_tries` lượt.

**Chấm và dữ liệu:**
- **Điểm:** 1 điểm khi cả hai bước đúng ở lần đầu. Đoán bừa đúng 1/2 × 1/3 = 1/6 (Scientist 1/8), so với 1/2 của TF hiện nay.
- **Dữ liệu** (dev chốt):
  - `claim` và `speaker` (như `statement`/`speaker` của TF);
  - `verdict: bool`;
  - `reasons[3..4]` cùng kiểu `ChoiceOption` (`label`, `image`, `correct`, `feedback`);
  - `hint`, `explanation_*`, `misconception_id`.
  - Một lần thử ghi là `{"verdict": false, "reason": "q6_fog"}`.

**Vì sao là format mới,** không phải thêm trường cho TF: theo luật tương thích 3 (SK-026), app cũ gặp TF có trường lạ sẽ hiện thiếu bước 2, thành một câu khác nghĩa.

**Gộp với `evidence_choice`:** SK-026 dự định thêm `evidence_choice` cho Scientist ở GĐ 2. `claim_check` làm được việc đó; Scientist chỉ dùng 4 lý do. Như vậy là một format thay cho hai.

**Chất liệu sẵn có:** khoảng 17/40 câu 6 đã ghi trong dòng `> DOK 3:` bằng chứng bé cần dùng, ví dụ "hơi thở làm mờ kính lạnh", "cơ thể giữ lại ô-xi".

**Ví dụ chuyển từ câu thật** (`content/discoverer/ho-hap/01-vi-sao-ta-phai-tho.md`, q6):

| | EN | VI |
| --- | --- | --- |
| Na nói | I breathe out the same air I breathe in. | Không khí mình thở ra y hệt không khí mình hít vào. |
| Bước 1 | gật / lắc → **lắc** | |
| Bước 2 | How do you know? | Sao em biết? |
| ✓ bằng chứng | Breath fogs up a cold window. *(dùng lại hình `q5_foggy`)* | Hơi thở làm mờ kính lạnh. |
| ✗ đúng nhưng không liên quan | We breathe through our nose. · feedback: That is true, but it shows no change. | Mình thở bằng mũi. · Đúng vậy, nhưng nó không cho thấy khí đổi khác. |
| ✗ dựa vào ý sai | Air goes in, then comes out. · feedback: Yes, but what comes out is different. | Khí vào rồi lại ra. · Đúng, nhưng khí đi ra đã khác rồi. |
| Giải thích | Your breath out is warmer, wetter and has less oxygen. *(giữ câu cũ)* | Hơi thở ra ấm hơn, ẩm hơn và ít ô-xi hơn. |

**Explorer** không dùng `claim_check`, vì `dok_mix` của Explorer không có DOK 3. Câu 6 Explorer giữ như hiện tại: câu misconception bằng hình, hiện là 12 câu TF và 7 câu SC.

### 4.5 App tự xáo lựa chọn

- **Cách xáo:** xáo một lần mỗi lượt học, hạt giống là `attemptId` cộng key của câu (SK-047: chỉ dùng `attemptId` thì mọi câu cùng số lựa chọn ra cùng một hoán vị), cùng cách kệ Chơi đang làm (`ShelfOrder.swift`). Học tiếp lượt dở thì giữ thứ tự cũ; lượt mới thì thứ tự khác.
- **Xáo:**
  - lựa chọn SC và MC;
  - kho từ FB;
  - thẻ OS, không bao giờ ra đúng thứ tự đáp án;
  - lý do của `claim_check`;
  - thẻ phân nhóm.
- **Không xáo:** hai thẻ TF, cột biểu đồ, chỗ trống trong câu.
- **Bỏ việc cân tay:** bỏ luật cân vị trí đáp án, bảng "Vị trí đáp án đúng" trong `_topic.md` và script vị trí của tester.
- **Không cần lưu thêm dữ liệu:** thứ tự tái tạo được từ `attemptId` nếu sau này cần phân tích lệch vị trí.

### 4.6 Từng dạng sau đề xuất

| Dạng | Đổi gì | Đợt |
| --- | --- | --- |
| `single_choice` | Chỉ xáo | 1 |
| `true_false` | Dùng cho DOK 1–2 (một sự thật, một tấm ảnh). Câu 6 Discoverer chuyển sang `claim_check`; câu 6 Explorer giữ như hiện tại. `hint` hiện qua nút gợi ý | 1, 2 |
| `multi_choice` | Với 4 lựa chọn, số đáp án đúng là 1–3. Trong một chủ đề, không quá một nửa số câu MC có cùng số đáp án đúng (đ). Câu hướng dẫn giữ "Pick all the right answers.", không báo số | 1 (nội dung) |
| `fill_blank_bank` | Thành câu **Từ mới**: từ trong chỗ trống là một từ trong mục Từ vựng của bài; hiện mới 15/37 câu FB ở Quiz làm vậy. Kho 3–4 từ cùng loại (danh từ với danh từ). Cho phép 2 chỗ trống ở câu nhân–quả DOK 2 (engine đã hỗ trợ) | 1 (nội dung) |
| `order_sequence` | Thử lại thì thẻ đúng chỗ khoá lại. Luôn có mũi tên giữa các ô. Với 4–5 thẻ trên iPhone thì xếp 2 hàng. Dùng chung component "đặt thẻ vào ô" với FB | 1 |
| `picture_bar_chart` | Tên dưới cột luôn hiện: nhãn là dữ liệu, ngoại lệ của luật ít chữ. Khi `value` là số nguyên ≤ 10, vẽ cột bằng khối đếm được (đ) | 1 |
| Hỏi "bao nhiêu" trên biểu đồ | Lựa chọn là con số, không gắn với cột. Đổi nghĩa so với quy ước `options[i]` ↔ `bars[i]` (dev 14/11), nên cần format riêng hoặc chặn bằng `min_app_version`; dev chốt | 3 |
| `claim_check` | Mới (4.4) | 2 |
| `sort_into_groups`, `label_diagram` | Giữ quyết định SK-043: làm sau beta. Đã có chỗ trong khung (câu 5) | 3 |

### 4.7 Luật máy kiểm (`content-cli`, `rules.<nhóm>.authoring`)

Chỉ thêm khoá; sửa cùng lúc `rules.schema.json` và test.

| Khoá mới (đ) | Nội dung |
| --- | --- |
| `quiz_blueprint` | Mỗi câu 1–6 nhận `skill` nào. Ví dụ Discoverer: câu 1 `recall`; câu 2 `vocab`; câu 3–4 tự do; câu 5 `sequence`, `data`, `classify`, `cause`, `understand`; câu 6 `misconception` |
| `vocab_item_uses_lesson_word` | Câu `vocab` phải dùng một từ có trong mục Từ vựng của bài |
| `multi_choice_correct_spread` | Trong một chủ đề, tỉ lệ tối đa số câu MC có cùng số đáp án đúng (0.5) |
| `misconception_format` | Discoverer, Scientist: câu 6 là `claim_check`. Explorer: không đổi (TF hoặc SC, có hình) |
| `key_point_coverage` | Mỗi ý chính có ít nhất 1 câu Quiz gắn `key_point` (mục 4.9) |

Bỏ: việc cân vị trí đáp án bằng tay (4.5).

### 4.8 Dữ liệu và báo cáo

- **`quiz_answers` không thêm cột.** `answer` có thêm một hình dạng `{verdict, reason}`.
- **`hint_used` có dữ liệu trở lại** nhờ nút gợi ý.
- **Báo cáo phụ huynh** (giai đoạn sau): tỉ lệ đúng theo `skill`, ví dụ "Bé nhớ từ mới tốt; cần luyện đọc biểu đồ".
- **Ôn tập GĐ 2** chọn câu theo kỹ năng yếu. Đây là đường nối sang hướng C.

### 4.9 Tổng kết bài (Duy thêm 15/11)

**Mục đích:** sau Quiz, bé xem lại cả bài trong khoảng một phút:
- 3 ý chính của bài;
- ý sai đặt cạnh ý đúng;
- từ mới;
- câu "I can…".

Quiz kiểm từng mảnh riêng lẻ; bước này ghép các mảnh lại thành bức tranh chung. Ý nào bé làm sai trong Quiz thì được nhắc lại ngay ở đây.

**Nội dung đã có sẵn, nhưng app chưa hiện:**
- **Ý chính và mục tiêu:** 59/59 bài có đúng 3 ý chính (`key_points`) và một câu mục tiêu (`objective`), cả hai đều có audio EN/VI. Sau A2:
  - app không hiện ý chính ở đâu cả;
  - mục tiêu chỉ còn trong `LearnStep.swift` cũ, file này không còn được gọi.
- **Lời Na và giải thích:** 40/40 bài Discoverer có lời Na ở câu 6 (`statement`) và `explanation_correct`.
- **Từ mới:** có trong block `word_list` (`new_words`) của phần Học.

Vì vậy bản cơ bản không cần soạn thêm chữ hay audio.

**Ba cách làm:**

| | **T1 · Màn riêng sau Quiz** (Duy chọn 15/11) | T2 · Tổng kết chủ động | T3 · Gộp vào màn Thưởng |
| --- | --- | --- | --- |
| Bé làm gì | Nghe và xem 3 ý chính, ý sai cạnh ý đúng; ý nào bé sai thì có thêm một dòng xem lại | Mỗi ý chính hiện hình và một chỗ trống; bé tự nhớ ra rồi chạm để lật xem | Xem 3 ý chính in dưới hàng sao |
| Theo kết quả của bé | Có | Không | Khó, màn đã chật |
| Thời gian | Khoảng 45 giây (đ) | 1–2 phút | Không thêm |
| Hợp A2 "một màn một ý" | Có, 2 màn ngắn | Có | Không, màn Thưởng thêm nhiều chữ |
| Rủi ro | Thêm một bước trước phần thưởng | Thêm một vòng nhớ lại ngay sau 6 câu Quiz nên dễ mệt; Explorer không làm được | Bé lướt qua để lấy thưởng |

**Duy chọn T1 (15/11).** T2 có thể dùng sau này cho Scientist.

**Vị trí trong bài:** Khởi động → Học → Chơi → Quiz → **Tổng kết** → Thưởng.
- **Bài hoàn thành khi xong câu 6.** Hiện app chấm và lưu bài khi vào Thưởng; đề xuất chuyển sang lúc vào Tổng kết, để bé đóng app ở màn Tổng kết vẫn có sao.
- **Không chặn bé:** bé bỏ qua được bất cứ lúc nào bằng mũi tên. Bước này không chấm điểm.

**Màn 1 · "Em đã học": 3 thẻ ý chính**
- **Mỗi thẻ** có hình, câu ý chính và nút nghe.
  - Đọc theo luật tự đọc của từng nhóm: Explorer và Discoverer tự đọc lần lượt, thẻ đang đọc nổi lên; Scientist không tự đọc, chỉ có nút nghe (D5).
  - Explorer: thẻ chỉ có hình, câu hiện trong bong bóng của linh vật khi đọc, giống phần Học Explorer. Lý do: ý chính Explorer dài tới 11 từ, quá ngân sách 8 từ.
- **Theo kết quả Quiz** (Discoverer, Scientist):
  - Ý mà mọi câu gắn với nó đều đúng ngay lần đầu: thẻ có dấu tích lá tre nhỏ.
  - Ý có câu sai: thẻ mở thêm một dòng "xem lại", là `explanation_correct` của câu đó, đọc ngay sau câu ý chính. Mỗi ý tối đa một dòng.
  - Không hiện số câu đúng.
- **Explorer theo kết quả:** không có dấu, không in dòng "xem lại" (D1). Ý nào có câu sai thì linh vật đọc thêm câu giải thích của câu đó (đ).
- **Nối câu quiz với ý chính:** cần một trường tuỳ chọn mới `key_point` (1–3) trên `quiz_item`.
  - Hiện 62/354 câu quiz đã ghi trong ghi chú `>` là câu kiểm ý chính nào.
  - Câu chưa có trường này thì thẻ không có dấu; đó là bản cơ bản.
- **Hình của thẻ** (dev chốt):
  - đề xuất một trường tuỳ chọn `key_point_images` ở cấp bài;
  - thiếu trường đó thì app lấy hình câu hỏi, hoặc hình đáp án đúng, của câu quiz đầu tiên gắn ý đó;
  - không có nữa thì lấy hình nhóm Học thứ n.

  Cách nào cũng dùng lại hình đã có, không cần ảnh mới.

**Màn 2 · "Nhớ nhé"**
- **Thẻ "Ý sai → Ý đúng":** lời Na ở câu 6 (Na lắc đầu, chữ gạch nhẹ) đặt cạnh câu đúng (`explanation_correct`).
  - Thẻ hiện cho mọi bé, kể cả bé làm đúng câu 6. Lý do: đặt ý sai ngay cạnh ý đúng giúp quan niệm được sửa bền hơn (refutation text, Tippett 2010).
  - Nguồn: `claim` của `claim_check` (đợt 2). Bây giờ dùng `statement` của câu TF ở câu 6.
  - Nếu Na nói đúng thì thẻ là "Na nói đúng: …".
  - Explorer: dùng câu 6 khi đó là TF có đáp án Sai, vì câu hỏi chính là câu khẳng định sai. Câu 6 là SC thì bỏ thẻ này.
- **Dải từ mới:** các từ của `new_words`, mỗi từ có hình nhỏ, chạm để nghe. Thêm một lần gặp từ (mục tiêu ≥ 10 lần, syllabus mục 8).
- **Câu mục tiêu "I can…"** (`objective`) có dấu tích và được đọc to. Đây là câu đóng bài.
- **Tuỳ chọn, Duy quyết:** bé tự đánh giá "Em làm được chưa?" bằng gật/lắc. Ghi lại để báo cáo phụ huynh; không ảnh hưởng điểm hay sao. Cần thêm một cột ở `lesson_attempts`.
- **Mũi tên** sang Thưởng.

**Số chữ (Discoverer):**
- Màn 1 khoảng 25 từ EN (3 ý, trung bình 8,5 từ mỗi ý), vừa ngân sách 25–30 từ một màn (syllabus mục 8).
- Màn 2 khoảng 20–25 từ.
- Mỗi dòng "xem lại" thêm tối đa 10 từ. Bé sai nhiều thì màn 1 vượt ngân sách; chấp nhận vì đó là lúc bé cần đọc lại nhất.

**Dùng lại ở chỗ khác:**
- **Ôn nhanh** (bài đạt ≤ 3/6, syllabus mục 10): trước bài sau, mở lại Màn 1 của bài đó, kèm các dòng "xem lại".
- **Đợt 3 · Tổng kết chủ đề:** ở bài cuối chủ đề (`stage: review`), mỗi bài một ý chính tiêu biểu, và quay lại câu "Em nghĩ sao?" của bài 1 (syllabus mục 6).
- **Đợt 3 · Sổ tay "Bài đã học"** trong Bộ sưu tập: Duy quyết.

**Luật máy kiểm:** `key_point_coverage` (đ). Mỗi ý chính có ít nhất 1 câu Quiz gắn `key_point`. Luật này vừa phục vụ Tổng kết, vừa kiểm được Quiz có phủ cả bài hay không.

## 5. Phác màn để hình dung (designer vẽ lại trên canvas)

Tổng kết bài, Discoverer, iPhone. Ví dụ bài *Vì sao ta phải thở*, bé sai câu q2; ghi chú của bài đã gắn q2 với ý chính hai:

```
 Màn 1 · Em đã học
 ┌──────┬─────────────────────────────────────┐
 │ hình │ We breathe in and out, even when    │ ✓
 │      │ we sleep.                    [nghe] │
 ├──────┼─────────────────────────────────────┤
 │ hình │ People and animals breathe, even    │
 │      │ fish in water.               [nghe] │
 │      │ ↳ xem lại: Gills take oxygen from   │
 │      │   the water for the fish.           │
 ├──────┼─────────────────────────────────────┤
 │ hình │ Our body takes oxygen from the air  │ ✓
 │      │ we breathe.                  [nghe] │
 └──────┴─────────────────────────────────────┘
                                         [ → ]

 Màn 2 · Nhớ nhé
 ┌─────────────────────────────────────────────┐
 │ (Na lắc) "I breathe out the same air I      │
 │           breathe in."                      │
 │  → Your breath out is warmer, wetter and    │
 │    has less oxygen.                  [nghe] │
 └─────────────────────────────────────────────┘
  Từ mới:  [hình breathe]  [hình oxygen]  [hình chest]
  ✓ I can say why my body needs air.     [nghe]
                                         [ → ]
```

Dòng "xem lại" là `explanation_correct` của q2. Toàn bộ chữ trong phác lấy nguyên từ bài, không phải viết thêm.

`claim_check`, iPhone:

```
 ✕  ■ ■ ■ ■ ■ □                  ✕  ■ ■ ■ ■ ■ □
 ┌──────────────────────────┐    (Na) "I breathe out the same
 │  ảnh của câu             │          air I breathe in."
 └──────────────────────────┘    How do you know?        [nghe]
 (Na) "I breathe out the same    ┌────┬─────────────────────┐
       air I breathe in." [nghe] │hình│ Breath fogs up a     │
 ┌───────────┐ ┌───────────┐     │    │ cold window.         │
 │   gật     │ │   lắc     │     ├────┼─────────────────────┤
 │  Na đúng  │ │ Na chưa…  │     │hình│ We breathe through   │
 └───────────┘ └───────────┘     │    │ our nose.            │
                                 ├────┼─────────────────────┤
   Bước 1                        │hình│ Air goes in, then    │
                                 │    │ comes out.           │
                                 └────┴─────────────────────┘
                                   Bước 2 (thẻ lý do có chữ: lý do là một câu)
```

`order_sequence`, thử lại:

```
 ┌──────┐ →  ┌──────┐ →  ┌──────┐
 │ lá ✓ │    │  2   │    │  3   │     thẻ đúng chỗ khoá lại
 └──────┘    └──────┘    └──────┘
   kho:   [ chim sẻ ]  [ con sâu ]     thẻ sai đã về kho
```

`picture_bar_chart`:

```
          ▇
          ▇
    ▇     ▇
    ▇     ▇
    ▇     ▇     ▇
  vườn   cát   sét        tên luôn hiện; mỗi khối là 1 cốc nước
```

Nút gợi ý (Discoverer): `Câu hỏi ………………… [gợi ý] [nghe]`. Chạm thì in `hint` dưới câu hỏi và đọc to.

## 6. Tương thích ngược

- **`schema_version` giữ 1.** Chỉ thêm:
  - format `claim_check`;
  - trường tuỳ chọn `skill` và `key_point` trên `quiz_item`;
  - trường tuỳ chọn `key_point_images` ở cấp bài.
- **App cũ gặp `claim_check`** sẽ bỏ câu, và quiz còn 5 câu. `build` chặn trường hợp này bằng bảng format → bản app (SK-026, đã có).
- **Phần chỉ đổi app, không đổi nội dung:** xáo, giàn giáo, tên cột, nút gợi ý, và Tổng kết bản cơ bản (dùng `key_points`, `objective`, câu 6, `new_words` đã có). Gói nội dung cũ chạy được trên app mới.
- **Tổng kết và dữ liệu:**
  - bước Tổng kết không thêm gì vào `quiz_answers` hay `lesson_progress`;
  - chỉ khi Duy chọn cho bé tự đánh giá thì mới thêm một cột ở `lesson_attempts`, kèm một delta migration.
- **Test vector mới:**
  - chấm `claim_check` (đúng/sai từng bước, bước 2 nhiều lượt);
  - giàn giáo lần hai không đổi điểm.
- **Rủi ro: tỉ lệ đạt có thể giảm.** Câu 6 khó đoán hơn nên tỉ lệ đạt 5/6 có thể giảm. Syllabus đặt mục tiêu câu DOK 3 đúng 60–70%; TF hiện tại có sàn 50% nhờ đoán. Theo dõi trong playtest trước khi chuyển hết 40 câu.

## 7. Ảnh hưởng tới code iOS

- **Màn câu hỏi:**
  - `DiscovererQuestionStep` và `ExplorerQuestionStep` dùng chung 5 cơ chế;
  - hai nhóm khác nhau ở `presentation`: kích thước, chữ, XP;
  - nên làm việc này cùng lúc với `claim_check`.
- **Component "đặt thẻ vào ô"** dùng cho cả FB và OS; về sau dùng cho `label_diagram`.
- **Bước Tổng kết:**
  - thêm case `.recap` vào `Step` (`AttemptStore.swift`), nằm giữa câu Quiz cuối và `.reward`;
  - `finish()` chạy khi vào `.recap`, thay vì khi vào `.reward` (`LessonSession.advance`);
  - màn mới cho Discoverer/Scientist và bản Explorer; dùng lại `ListenButton`, bong bóng linh vật và thẻ của A2.
- **Dọn code không còn dùng** (sau A2):
  - `Views/QuestionStep.swift`;
  - phần lớn `Views/QuestionViews.swift` (giữ `FillBlankSentence`);
  - `ResultSheet` và `HintNote`;
  - `PositionDots`;
  - test `BankChipMarkTests`.

## 8. Lộ trình

| Đợt | Việc | Ai | Đổi schema |
| --- | --- | --- | --- |
| **1** | Xáo lựa chọn; OS khoá thẻ đúng, có mũi tên, 2 hàng khi nhiều thẻ; tên cột biểu đồ; nút gợi ý và `hint_used`; dọn code; luật MC trong CLI. **Tổng kết bài bản cơ bản**: 3 ý chính, ý sai → ý đúng từ câu 6 hiện tại, từ mới, câu "I can…"; chưa có dấu theo kết quả. Nội dung: sửa MC (số đáp án đúng), FB (từ mới) ở 40 bài | designer (gợi ý, khoá thẻ, cột, 2 màn Tổng kết) → ios-dev; dev (CLI); content-editor; tester | Không |
| **2** | `claim_check`, `skill`, `quiz_blueprint`; test vector; chuyển 40 câu 6 Discoverer; chọn lại câu 5 ở những bài hợp. **Tổng kết theo kết quả**: `key_point` cho 354 câu quiz, dấu tích và dòng "xem lại", `key_point_images`, luật `key_point_coverage`; thẻ ý sai lấy từ `claim_check` | pm (ticket) → dev (schema, CLI, vector) · designer (màn 2 bước) → ios-dev · content-editor · tester | v1.1 |
| **3** (sau beta) | `sort_into_groups`, `label_diagram`, hỏi "bao nhiêu" trên biểu đồ; ôn tập theo `skill`; `p_correct` → hướng C. Tổng kết chủ đề ở bài cuối chủ đề; Ôn nhanh mở lại Tổng kết; sổ tay "Bài đã học" nếu Duy chọn | — | v1.1+ |

**Bài gợi ý đổi câu 5** (đ, biên tập xem lại):
- `ho-hap/02` Đường đi của không khí → OS;
- `khung-long/01` Trái Đất rất lâu về trước → OS dòng thời gian;
- `thoi-tiet-va-thien-tai/02` Đo thời tiết → BAR;
- `be-mat-trai-dat/04` Núi lửa → OS.

**Chi phí lớn nhất của đợt 2 là hình.** Mỗi `claim_check` cần 3 hình lý do, tức khoảng 120 hình cho 40 câu. Phần lớn dùng lại được hình đã có trong bài, nhưng vẫn phải theo chính sách ảnh thật, không AI.

## 9. Cần Duy quyết

Đã chốt 15/11: hướng B; thêm bước Tổng kết bài theo cách T1, màn riêng sau Quiz.

**Đợt 1 dùng 3 mặc định (15/11):** Duy bảo viết ticket Đợt 1 ([SK-047](backlog/SK-047-quiz-system-wave-1.md)) theo khuyến nghị, nên câu 3, phần biểu đồ của câu 4, và câu 7 đi theo mặc định dưới đây; Duy đổi được. Các câu 1, 2, 5, 6, 8 và phần `claim_check` của câu 4 thuộc đợt 2–3, không chặn Đợt 1.

1. **`claim_check` thay câu 6 ở mọi bài Discoverer,** hay chỉ bài cuối chủ đề? Khuyến nghị mọi bài, vì câu 6 là câu DOK 3 duy nhất của bài.
2. **`claim_check` thay luôn `evidence_choice` của Scientist,** tức một format thay cho hai?
3. **Bé mở gợi ý trước khi trả lời thì có còn được điểm không?** Khuyến nghị: vẫn được điểm, chỉ ghi `hint_used`. *Đợt 1 dùng mặc định này.*
4. **Tên dưới cột biểu đồ, và chữ trên thẻ lý do của `claim_check`,** có được làm ngoại lệ của luật ít chữ A2 không? *Đợt 1 dùng mặc định cho phần biểu đồ: tên cột luôn hiện. Phần `claim_check` chờ đợt 2.*
5. **`sort_into_groups`** giữ làm sau beta như SK-043, hay kéo lên đợt 2?
6. **Explorer:** linh vật đọc thêm câu giải thích cho ý bé làm sai, nhưng không hiện dấu. Như vậy có hợp D1 ("không thấy số câu đúng") không?
7. **Có cho bé tự đánh giá "Em làm được chưa?"** ở cuối Tổng kết không? Cần thêm một cột ở `lesson_attempts`. *Đợt 1 dùng mặc định: chưa có bước này, nên không đổi database.*
8. **Sổ tay "Bài đã học"** trong Bộ sưu tập (đợt 3): có làm không?

## Phụ lục · Số liệu (59 bài, 15/11)

| Dạng | Discoverer (40 bài) | Explorer (19 bài) |
| --- | --- | --- |
| `single_choice` | 163 | 84 |
| `true_false` | 92 (40 câu có lời Na) | 66 |
| `multi_choice` | 40 (34 câu "2 trong 4", 5 câu "3 trong 4", 1 câu "3 trong 6") | — |
| `fill_blank_bank` | 40 (37 câu một chỗ trống) | — |
| `order_sequence` | 1 | 12 |
| `picture_bar_chart` | 1 | — |

Số trên gồm cả Khởi động và Quiz. DOK của 6 câu Quiz Discoverer theo dạng:
- DOK 3: 40 TF;
- DOK 2: 69 SC, 40 MC, 7 TF, 2 FB, 1 OS, 1 BAR;
- DOK 1: 44 SC, 35 FB, 1 TF.

Lựa chọn sai có `feedback`: Discoverer SC 319/333, MC 71/76; Explorer SC 149/149.
