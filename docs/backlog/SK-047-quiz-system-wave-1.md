# SK-047 · Hệ thống quiz Đợt 1: xáo lựa chọn, nút gợi ý, xếp thứ tự giữ thẻ đúng, tên cột biểu đồ, Tổng kết bài bản cơ bản

Trạng thái: review · Ngày: 2026-11-15 · Phụ trách: designer → ios-dev; dev và content-editor song song · Tester: tester
Nguồn: [docs/quiz-system-proposal.md](../quiz-system-proposal.md) mục 4.3, 4.5, 4.6, 4.7, 4.9, 5, 6, 7, 8 (hàng Đợt 1), 9; Duy 15/11 (hướng B, Tổng kết theo T1, viết Đợt 1 theo mặc định khuyến nghị); [SK-026](SK-026-quiz-formats-by-age.md) (luật tương thích); [SK-043](SK-043-lesson-screens-picture-book.md) (A2 "Sách tranh", Duy duyệt 14/11); [SK-044](SK-044-answer-feedback.md) (`feedback`); `content/rules.json`; `content/TEMPLATE.md`; technical-plan.md B4.4

## Mục tiêu
Bé Explorer và Discoverer làm quiz mà không đoán được qua vị trí đáp án hay mẹo "luôn chọn 2"; bé có gợi ý khi cần và được giữ phần đúng khi xếp thứ tự sai. Sau Quiz, bé xem lại cả bài trong một bước Tổng kết ngắn trước phần thưởng. Không đổi schema (`schema_version` giữ 1), không đổi database, gói nội dung cũ vẫn chạy.

## Phạm vi / Ngoài phạm vi

### Phạm vi

| # | Việc | Ai | Đề xuất |
| --- | --- | --- | --- |
| 1 | App tự xáo lựa chọn; bỏ việc cân vị trí đáp án bằng tay | ios-dev; content-editor, tester bỏ phần việc tay | 4.5 |
| 2 | `order_sequence`: thử lại thì thẻ đúng chỗ khoá lại, thẻ sai về kho; luôn có mũi tên giữa các ô; iPhone 4–5 thẻ xếp 2 hàng | designer → ios-dev | 4.3, 4.6 |
| 3 | `picture_bar_chart`: tên dưới cột luôn hiện | designer → ios-dev; content-editor sửa 1 câu | 4.6 |
| 4 | Nút gợi ý (Discoverer, Scientist) và `hint_used` | designer → ios-dev | 4.3 |
| 5 | Tổng kết bài bản cơ bản: 2 màn sau Quiz, chưa có dấu theo kết quả | designer → **Duy duyệt** → ios-dev | 4.9 |
| 6 | Dọn code không còn dùng sau A2 | ios-dev | 7 |
| 7 | Luật CLI `multi_choice_correct_spread` | dev | 4.7 |
| 8 | Nội dung 40 bài Discoverer: MC theo luật phân bố, FB ở Quiz thành câu Từ mới | content-editor; designer tìm ảnh; phiên chính chạy lệnh | 4.6 |

**Thứ tự giao việc**
1. designer vẽ trên canvas (mục designer dưới). Song song: dev làm việc 7; content-editor làm việc 8.
2. ios-dev làm ngay phần không cần màn: xáo (việc 1), bước `.recap` và `finish()` với màn tạm (việc 5, phần logic), dọn code (việc 6). Phần có màn thì làm sau khi designer bàn giao.
3. **Màn Tổng kết chỉ được dựng sau khi Duy duyệt trên canvas** (chốt thiết kế thuộc Duy). Nút gợi ý, khoá thẻ, tên cột làm theo bản designer, Duy xem lúc review cuối.
4. content-editor đổi lựa chọn hoặc thẻ từ thì liệt kê hình cần tìm; designer tìm ảnh. Phiên chính chạy `validate`, `ids`, `images fetch`, `tts`, `build`.
5. tester kiểm cuối, theo tiêu chí dưới. Một simulator, chạy một lần (quy ước của Duy).

#### designer
Vẽ trên canvas `design/play-ui/project/`, dùng lại thành phần của bộ A2 Duy đã duyệt (`design/play-ui/options/lesson-less-text/Discoverer-A2.html`, `Explorer-A.html`). iPhone 390×844; iPad (khung 600) cho những màn có bố cục khác. Mỗi màn có ghi chú cho ios-dev: kích thước, token, nhãn VoiceOver, cách xử lý khi giảm chuyển động.
- **Nút gợi ý:** chỉ biểu tượng, đặt cạnh nút nghe. Vẽ ở câu thường, câu điền từ, câu Na và biểu đồ. Vẽ trạng thái đã mở: `hint` in dưới câu hỏi. Ghi rõ nút làm gì khi câu đã xong (ẩn hay mờ).
- **`order_sequence`:** mũi tên giữa các ô (3 thẻ); trạng thái thử lại có thẻ đúng chỗ đã khoá và thẻ sai đã về kho; 4 thẻ trên iPhone xếp 2 hàng, mũi tên nối từ cuối hàng 1 sang đầu hàng 2. Áp cho cả Explorer.
- **`picture_bar_chart`:** tên cột hiện ngay khi mở câu. Designer quyết có vẽ cột bằng khối đếm được khi `value` là số nguyên ≤ 10 không (đề xuất (đ)).
- **Tổng kết, bản Discoverer và bản Explorer, mỗi bản 2 màn:**
  - Màn 1 "Em đã học": 3 thẻ ý chính. Thẻ đang đọc nổi lên. Explorer: thẻ chỉ có hình, câu hiện trong bong bóng linh vật.
  - Màn 2 "Nhớ nhé": thẻ "Ý sai → Ý đúng", ba dạng: Na nói sai; Na nói đúng; Explorer câu 6 là `true_false` đáp án Sai. Dải từ mới; câu "I can…" có dấu tích; mũi tên sang Thưởng.
  - Ví dụ dùng bài thật: Discoverer `ho-hap/01` (Na sai), `ho-hap/03` (Na đúng); Explorer `goi-ten-va-nhom-dong-vat/08` (có thẻ), `/06` (câu 6 là SC, không thẻ).
  - **Không thêm câu nào phải đọc to** ngoài nội dung có sẵn: ý chính, lời Na hoặc câu khẳng định, `explanation_correct`, từ, mục tiêu. Đề xuất tiêu đề màn không chữ như header A2. Chuỗi giao diện mới (nhãn VoiceOver) ghi thành danh sách; chuỗi nào cần đọc to thì ghi rõ để dev sinh clip.
  - Đề xuất PM: "Na nói đúng" thể hiện bằng biểu tượng gật, không thêm chữ mới.
- **Hình thẻ ý chính** khi chưa có `key_point_images` (Đợt 2): dùng hình nhóm Học thứ n. Ghép theo vị trí, không theo nghĩa, nên designer xem trên 3–4 bài xem có lệch không; lệch nhiều thì đề xuất cách khác, chỉ dùng hình đã có.
- **Sau content-editor:** tìm ảnh cho lựa chọn và thẻ từ mới. Theo chính sách: ảnh thật miễn phí cho phép thương mại (CC0, PD, CC BY), không AI, không Pinterest; mọi lựa chọn có hình; crop đúng khung `image-slots.json`.

#### ios-dev
1. **Xáo** (4.5): xáo một lần mỗi lượt học. Hạt giống gồm `attemptId` **và key của câu**, cùng cách `ShelfOrder.swift`.
   - Xáo: lựa chọn SC và MC; kho từ FB; thẻ OS. Áp cho Khởi động và Quiz, cả Explorer lẫn Discoverer.
   - Thẻ OS không bao giờ ra đúng thứ tự `answer`.
   - Không xáo: hai thẻ TF, cột biểu đồ (giữ quy ước `options[i]` ↔ `bars[i]`), chỗ trống trong câu.
   - Thứ tự phải tái tạo được từ `attemptId` + key, để sau này phân tích lệch vị trí và để Android ra cùng thứ tự. Nên tự viết Fisher–Yates trên `SplitMix64`, vì thuật toán của `shuffled(using:)` trong stdlib không cam kết giữ nguyên giữa các bản Swift. Ghi thuật toán trong chú thích code.
2. **`order_sequence`:** hiện tại sai là cả hàng về kho (`Views/ExplorerOrderSequence.swift` dòng 72, `.onChange(of: tried.count)`). Đổi thành: thẻ đúng chỗ (so với `answer` theo từng ô) khoá lại, không chạm hay kéo được; thẻ sai về kho. Thêm mũi tên giữa các ô; iPhone từ 4 thẻ thì 2 hàng. Lần thử sau vẫn gửi đủ `{"order": [...]}`. Chấm không đổi. Gộp component "đặt thẻ vào ô" cho FB và OS là việc ios-dev tự cân, không phải tiêu chí bắt buộc.
3. **Biểu đồ:** tên cột luôn hiện. Hiện tên đang ẩn tới khi chấm (`Views/DiscovererQuestionStep.swift` dòng 284–285, `NameLabel … .opacity(look == .right || look == .answer ? 1 : 0)`).
4. **Nút gợi ý** (Discoverer; Scientist hiện chơi như Discoverer): chạm thì in và đọc `hint` theo `voice_mode`; chế độ "Cả hai" in EN, VI qua nút VI (A2 điểm 5). Gọi `LessonSession.markHintUsed`; hàm này hiện chỉ được gọi trong `Views/QuestionStep.swift`, một file chết. Explorer không có nút. `true_false` giữ 1 lượt.
5. **Tổng kết** (sau khi Duy duyệt màn):
   - Thêm case `.recap` vào `AttemptProgress.Step` (`AttemptStore.swift`, cả `init(from:)` và `encode`), nằm giữa câu Quiz cuối và `.reward`.
   - `finish()` chạy khi vào `.recap`, không phải khi vào `.reward` (`LessonSession.advance`). Điều kiện `if progress.step == .reward { finish() }` trong `init` cũng phải tính `.recap`.
   - Cập nhật mọi `switch` trên `Step`: `phaseIndex`, `LessonPlayerView`, `LessonSpeech` (`autoplayUtterance`, `clipsToPreload`, `spokenShown`, `step(after:)`).
   - Màn 1: 3 thẻ từ `lesson.keyPoints`, có hình, câu và nút nghe. Explorer và Discoverer tự đọc lần lượt; Scientist không tự đọc (D5) khi có màn Scientist riêng. Dưới VoiceOver không tự đọc (như mọi màn).
   - Màn 2, thẻ "Ý sai → Ý đúng": lấy từ câu Quiz có `misconceptionId` (câu 6) khi câu đó là `true_false`. Câu khẳng định là `statement` nếu có, không thì `prompt`; câu đúng là `explanation_correct`. Na nói đúng (`answer: true`) thì thẻ ở dạng "Na nói đúng". Explorer chỉ hiện thẻ khi câu đó là `true_false` đáp án Sai; câu 6 là SC thì bỏ thẻ.
   - Màn 2, dải từ mới: các từ trong `word_list.term_keys` (`new_words`), có hình nhỏ, chạm để nghe. Bài không có `word_list` thì bỏ dải này.
   - Màn 2, câu `objective` đọc to; mũi tên sang Thưởng.
   - Bỏ qua được bất cứ lúc nào bằng mũi tên. Rời màn thì giọng dừng. Không có gì được chấm ở Tổng kết.
   - Dùng lại `ListenButton`, bong bóng linh vật, thẻ A2.
6. **Dọn code** (mục 7): xoá `Views/QuestionStep.swift` (gồm `QuizHeader`, `WarmupTagRow`); phần lớn `Views/QuestionViews.swift`, giữ `FillBlankSentence` và `FilledWordLook` (`FillBlankSentence` dùng); `ResultSheet`, `HintNote` (`Views/LessonParts.swift`); `PositionDots` (`Views/ExplorerOrderSequence.swift`); test `BankChipMarkTests`. `LearnStep.swift` cũng chết nhưng không nằm trong danh sách. Nếu xoá file này thì giữ `WrapLayout`, vì `PlayStep` còn dùng.
7. **Test:** unit test cho xáo, khoá thẻ OS, `.recap` và `finish()`, `hint_used`, giải mã file đang học dở do bản cũ ghi. Chạy toàn bộ unit test một lần trên một simulator.

#### dev
- Thêm khoá `multi_choice_correct_spread` (số trong (0, 1], đặt 0.5) vào `rules.discoverer.authoring` và `rules.scientist.authoring` của `content/rules.json`. Sửa cùng lúc `tools/content-cli/schema/rules.schema.json` (đang `additionalProperties: false`), `test/rules.test.ts`, README. Luật tương thích 5 của SK-026: chỉ thêm khoá.
- Đây là luật **cấp chủ đề**: gom mọi câu MC của các bài cùng chủ đề, đếm số câu theo số đáp án đúng, báo khi một số đáp án đúng chiếm quá `max(1, floor(0.5 × n))` câu. Các luật `age_*` hiện tại chạy theo từng bài (`src/validate/age-rules.ts`), nên cần thêm bước gom.
- Đề xuất PM: đếm cả Khởi động và Quiz; hiện cả 40 câu MC đều ở Quiz. Mức cảnh báo cho tới khi content-editor sửa xong 40 bài, rồi nâng lên lỗi trong ticket này, để không chặn `build` các chủ đề khác. Dev chốt và ghi vào ticket.
- Luật "FB dùng từ mới": khoá `vocab_item_uses_lesson_word` của 4.7 dựa vào `skill` (Đợt 2). Đợt 1 có thể kiểm gần đúng: mọi `fill_blank_bank` ở Quiz phải có ít nhất một từ trong `answers` có `label.en` trùng một `vocab[].term.en` của bài (không phân biệt hoa thường; biến thể -s, -es, -ed, -ing do dev chốt).
  - Nếu làm, dùng luôn tên khoá cuối `vocab_item_uses_lesson_word`, mức cảnh báo, để Đợt 2 chỉ mở rộng phạm vi, không phải thêm khoá thứ hai (`rules.json` chỉ thêm, không bỏ khoá).
  - Nếu không làm, ghi lý do vào ticket; tester kiểm bằng script.
- Không format mới, nên bảng `FORMAT_FIRST_APP_VERSION` không đổi. Không migration, không RPC.

#### content-editor
Không chạy lệnh. Không đổi `id:`. Câu nào đổi đáp án hoặc lựa chọn thì tăng `version`. Mọi chữ mới là nháp AI, ghi chú dưới dòng đổi như các lượt trước.
1. **MC theo luật phân bố.** Trong mỗi chủ đề, không số đáp án đúng nào chiếm quá một nửa số câu MC. Với 4 lựa chọn thì có 1–3 đáp án đúng; schema đã bắt ≥ 1 đúng và ≥ 1 sai. Câu hướng dẫn giữ "Pick all the right answers.". Số hiện tại (PM đếm bằng grep 15/11):

   | Chủ đề | Câu MC | 2 đúng | 3 đúng | Tối đa cùng số đúng | Đổi ít nhất |
   | --- | --- | --- | --- | --- | --- |
   | be-mat-trai-dat | 5 | 5 | 0 | 2 | 3 |
   | khung-long | 5 | 4 | 1 | 2 | 2 |
   | ho-hap | 4 | 4 | 0 | 2 | 2 |
   | nao-bo-va-giac-quan | 4 | 4 | 0 | 2 | 2 |
   | thoi-tiet-va-thien-tai | 5 | 5 | 0 | 2 | 3 |
   | da-va-dat | 15 | 11 | 4 | 7 | 4 |
   | an-uong-lanh-manh | 2 | 1 | 1 | 1 | 0 |
   | **Tổng** | **40** | **34** | **6** | | **16** |

   Lựa chọn đổi từ sai sang đúng thì bỏ `feedback` (validate báo lỗi nếu lựa chọn đúng có `feedback`). Đổi từ đúng sang sai thì viết `feedback` theo SK-044. Sửa giải thích nào còn nhắc "cả hai" hay "hai thứ".
2. **FB ở Quiz thành câu Từ mới** (4.6): từ trong chỗ trống là một từ trong mục Từ vựng của bài. Có 37 câu FB ở Quiz (PM đếm lại 15/11, khớp đề xuất); theo đề xuất, 15 câu đã đạt, nên khoảng 22 câu phải sửa. Kho 3–4 từ cùng loại (danh từ với danh từ). Thẻ từ mới phải có hình; thẻ sai có `feedback`. *Khủng long* không có câu FB nào; thêm FB thuộc khung câu của Đợt 2, không làm ở đây.
3. **`da-va-dat/14` q4 (biểu đồ):** khi tên cột luôn hiện, câu "Which bar shows water through sandy soil?" thành câu đọc nhãn. Đổi câu hỏi sang hỏi dữ liệu, ví dụ "Which soil let the most water through?"; đáp án vẫn là cột đất cát. Xem lại `feedback` và hai giải thích cho khớp. (PM thêm, hệ quả của việc 3.)
4. **Bỏ cân vị trí đáp án:**
   - Các bảng và luật "Vị trí đáp án đúng" trong `_topic.md` ghi "hết hiệu lực 15/11 (SK-047, app xáo)" hoặc xoá: `goi-ten-va-nhom-dong-vat`, `sinh-vat-song-o-dau`, `chuoi-thuc-an`, `khung-long`, `nao-bo-va-giac-quan`, `thoi-tiet-va-thien-tai`, `ho-hap`, `da-va-dat`. Gồm cả câu "Quiz sáu câu theo bảng Vị trí đáp án" ở `da-va-dat/_topic.md`, nếu còn ý số lựa chọn thì giữ phần đó.
   - Dòng "Vị trí đáp án đúng" trong "Ghi chú cho dev" của từng bài: xoá hoặc ghi hết hiệu lực.
   - TEMPLATE, mục luật chung: `hint`, `feedback`, giải thích không nhắc vị trí thẻ ("thẻ đầu", "bên trái"). Hiện luật này chỉ có ở luật Explorer số 6.
   - Rà lựa chọn mà nghĩa phụ thuộc thứ tự (thang số, "cả hai", "tất cả"); báo PM nếu có.
5. **Rà `hint` của 92 câu `true_false` Discoverer** (gồm 40 câu Na). Trước nay `hint` của TF không bao giờ hiện (1 lượt); nay bé mở được trước khi trả lời và vẫn được điểm. Chỉ sửa câu nào gần lộ đáp án; ví dụ `ho-hap/04` q6 "Remember the Tiny dust card." gần như nói luôn đáp án. (PM thêm, hệ quả của việc 4; Duy bỏ được.)
6. **Rà `explanation_correct` của câu 6** (40 Na Discoverer, và các câu 6 `true_false` đáp án Sai ở Explorer): đọc được như một câu đứng riêng trên thẻ "Ý sai → Ý đúng". Không mở đầu "Yes!" hay "Đúng rồi!", không "Na chưa đúng". Hai bài `an-uong-lanh-manh` chưa qua lượt viết lại A2 của SK-044 (bài 02 còn 4 câu "Yes!").
7. **Bàn giao:** danh sách câu đã đổi (bài, key, trường), danh sách hình cần tìm cho designer, danh sách chữ cần sinh lại giọng.

#### tester
- Kiểm theo tiêu chí dưới, sau khi các agent báo xong. Một simulator, chạy một lần; cần máy khác (iPad) thì chạy lần lượt, xong tắt máy.
- Rà chữ phần nội dung đổi (MC, FB, câu biểu đồ, `hint` TF, `explanation_correct` câu 6).
- Bỏ phần kiểm vị trí đáp án khỏi khuôn rà chữ (script `check_tables.py` của SK-041 và SK-046 nằm trong scratchpad, không ở repo).
- Kiểm FB dùng từ mới bằng script nếu CLI không có luật.
- UI test luồng bài (`LessonUITests`, `SyncUITests`) đang giả định Thưởng đến ngay sau Quiz, và đã hỏng từ A2 (SK-043, việc 6 của tester). Nếu đã viết lại theo A2 thì thêm bước Tổng kết; nếu chưa thì kiểm tay và ghi lại.

### Ngoài phạm vi
- `claim_check`, `skill`, `quiz_blueprint`, `key_point`, `key_point_images`, `key_point_coverage`.
- Tổng kết theo kết quả: dấu tích, dòng "xem lại", linh vật đọc thêm cho Explorer.
- Đổi câu 5; `sort_into_groups`, `label_diagram`; hỏi "bao nhiêu" trên biểu đồ.
- Ôn nhanh mở lại Tổng kết; tổng kết chủ đề; sổ tay "Bài đã học".
- Bé tự đánh giá "Em làm được chưa?". Vì vậy không có cột mới ở `lesson_attempts`, không migration, không đổi RPC.
- Thêm câu FB cho bài chưa có (*Khủng long*); màn Scientist riêng; viết lại UI test theo A2 (thuộc SK-043).

## Tiêu chí nghiệm thu

Bài dùng để kiểm: Discoverer `ho-hap/01-vi-sao-ta-phai-tho` (q6 Na sai; từ mới breathe, oxygen, chest, gills — gills nâng lên core 15/11), `ho-hap/03` (q6 Na đúng), `da-va-dat/08` q4 (`order_sequence` 4 thẻ, `answer` snail, decay, layers, found), `da-va-dat/14` q4 (biểu đồ). Explorer `goi-ten-va-nhom-dong-vat/04` q4 (OS 3 thẻ, eggs, tadpole, frog), `/06` (q6 SC), `/07` (q6 TF Đúng), `/08` (q6 TF Sai). Máy: iPhone 16 Pro simulator, một lần.

### designer
- [x] Canvas có đủ màn ở mục designer: iPhone, và iPad khi bố cục khác. Mỗi màn có id `?shot=` ghi trong ticket.
- [x] Mỗi màn có ghi chú cho ios-dev: kích thước, token, nhãn VoiceOver, cách xử lý khi giảm chuyển động.
- [x] Danh sách chuỗi giao diện mới; không chuỗi nào cần clip giọng mới, hoặc có danh sách clip cho dev.
- [x] **Duy duyệt 2 màn Tổng kết** (Discoverer và Explorer), ngày duyệt ghi vào ticket, trước khi ios-dev dựng màn.
- [x] Ảnh cho lựa chọn và thẻ từ content-editor đổi: nguồn CC0, PD hoặc CC BY, ghi giấy phép và tác giả. `images fetch` 0 lỗi, 0 cảnh báo lệch khung.

### ios-dev
**Xáo**
- [x] Bắt đầu `ho-hap/01` hai lượt mới (hai `attemptId` khác nhau) → ít nhất một câu SC có thứ tự lựa chọn khác giữa hai lượt. Unit test dùng hai UUID cố định.
- [x] Đang ở q3 thì thoát (lượt dở), mở lại bài → thứ tự lựa chọn của mọi câu, kể cả câu đã trả lời, giữ như trước khi thoát.
- [x] Unit test: mọi câu `order_sequence` trong gói nhúng (12 Explorer, 1 Discoverer) với 1.000 `attemptId` ngẫu nhiên → kho thẻ không lần nào trùng thứ tự `answer`.
- [x] Unit test: trong một lượt, hai câu cùng số lựa chọn không bị ép cùng một hoán vị (hạt giống có key câu).
- [x] Mọi lượt: thẻ gật bên trái, lắc bên phải; cột biểu đồ theo thứ tự `bars`; chỗ trống FB theo câu.
- [x] Chấm không đổi: chọn đáp án đúng ở vị trí mới → đúng, 1 điểm. `answer` trong `history.json` vẫn ghi key, không ghi vị trí.
- [ ] VoiceOver đọc thẻ theo thứ tự hiện trên màn.

**`order_sequence`**
- [x] `da-va-dat/08` q4: xếp snail, layers, decay, found → sai. Lần 2: snail (ô 1) và found (ô 4) khoá, không chạm hay kéo ra được; decay, layers về kho. Xếp đúng ở lần 2 → câu đúng nhưng 0 điểm; `answer` có 2 lần thử.
- [ ] Explorer `goi-ten-va-nhom-dong-vat/04` q4: xếp eggs, frog, tadpole → eggs khoá; frog, tadpole về kho.
- [ ] Mũi tên giữa các ô ở 3 và 4 thẻ. iPhone, 4 thẻ → 2 hàng, không cuộn ngang, ô và thẻ không nhỏ hơn cỡ chạm tối thiểu của nhóm. iPad giữ một hàng.

**Biểu đồ**
- [x] `da-va-dat/14` q4: mở câu, chưa chạm → thấy tên ba cột (đất vườn, đất cát, đất sét; ở "Cả hai" in EN). Chấm, sai còn lượt, hết lượt như cũ.

**Nút gợi ý**
- [x] Discoverer: nút gợi ý (chỉ biểu tượng, VoiceOver đọc tên nút) cạnh nút nghe ở SC, MC, TF, câu Na, FB, OS, biểu đồ, ở cả Khởi động và Quiz. Chạm → `hint` in dưới câu hỏi và được đọc; "Cả hai": in EN, nút VI phát bản VI.
- [x] `ho-hap/01`: mở gợi ý ở q4 rồi chọn đúng lần đầu → q4 `points = 1`, `hint_used = true` trong `history.json`; các câu khác `hint_used = false`; tổng điểm bằng một lượt làm đúng như vậy mà không mở gợi ý. Có mạng và đăng nhập staging thì hàng `quiz_answers` của q4 có `hint_used = true`.
- [x] Sai lần 1 rồi app tự đọc `hint` (không chạm nút) → `hint_used` vẫn `false`.
- [x] Explorer: không có nút gợi ý. `true_false` vẫn 1 lượt ở cả hai nhóm.

**Tổng kết**
- [x] Trả lời xong câu Quiz cuối, chạm mũi tên → Tổng kết màn 1, không phải Thưởng. Luồng: Quiz → màn 1 → màn 2 → Thưởng.
- [x] `ho-hap/01` màn 1: 3 thẻ đúng 3 câu `## Ý chính`, tự đọc lần lượt, thẻ đang đọc nổi lên; nút nghe từng thẻ đọc lại câu đó.
- [ ] Explorer `goi-ten-va-nhom-dong-vat/04` màn 1: thẻ chỉ có hình; linh vật đọc từng ý trong bong bóng.
- [x] `ho-hap/01` màn 2: thẻ "I breathe out the same air I breathe in." (Na lắc) cạnh "Your breath out is warmer, wetter and has less oxygen." (`explanation_correct` của q6); dải từ breathe, oxygen, chest, gills (sau khi build lại gói; gói cũ có 3 từ), chạm từ nào nghe từ đó; "I can say why my body needs air." có dấu tích và được đọc.
- [x] `ho-hap/03` màn 2: thẻ ở dạng Na nói đúng, không gạch câu của Na.
- [ ] Explorer màn 2: `/08` có thẻ (q6 TF đáp án Sai); `/06` (q6 SC) và `/07` (q6 TF đáp án Đúng) không có thẻ, các phần khác của màn 2 vẫn đủ.
- [x] Màn 1 vừa mở, chưa đọc xong: chạm mũi tên → sang màn 2, giọng dừng; chạm tiếp → Thưởng. Tổng cộng 2 lần chạm, không phải chờ.
- [x] Đang ở Tổng kết màn 1 thì tắt hẳn app (kill), mở lại → bài có sao ở màn chủ đề; `history.json` có đúng 1 bản ghi của lượt đó; lượt đã vào hàng đợi sync. Mở lại bài thì bắt đầu lượt mới.
- [x] Đi hết Tổng kết vào Thưởng → sao, điểm, XP như trước khi có Tổng kết; `history.json` không thêm bản ghi thứ hai.
- [x] Unit test: file `in_progress/<lesson>.json` do bản trước SK-047 ghi (bước `quiz`, index 5, đủ 6 câu đã trả lời) mở được trên bản mới, `advance()` vào `.recap` và có `summary`.
- [x] Unit test: bài không có `word_list` → màn 2 không có dải từ, không lỗi.
- [x] Bật giảm chuyển động → thẻ đang đọc chỉ đổi nền (hoặc theo cách designer ghi), không nổi hay nhảy.

**Tương thích và dọn code**
- [ ] Gói nhúng hiện tại (build trước SK-047, chưa có sửa MC/FB) chạy trên app mới: một bài Discoverer và một bài Explorer đi từ Khởi động tới Thưởng, qua Tổng kết, không crash, không thiếu câu.
- [x] Các file ở mục ios-dev việc 6 đã xoá; `markHintUsed` chỉ được gọi từ nút gợi ý mới. `build-for-testing` thành công; toàn bộ unit test (bỏ UI test) chạy một lần trên iPhone 16 Pro, ghi số pass và fail vào ticket.

### dev
- [x] `content/rules.json` có `multi_choice_correct_spread: 0.5` ở `discoverer.authoring` và `scientist.authoring`. Trong bản sao `rules.json`, đặt `0`, `1.5`, `"a"` → `build` dừng, lỗi chỉ đúng pointer.
- [x] Bản sao `content/discoverer/ho-hap` (4 câu MC, đều 2 đáp án đúng) → `validate` báo `multi_choice_correct_spread`, nêu chủ đề, số đáp án đúng bị lặp (2), số câu (4/4), giới hạn (2), và bài cùng key của các câu đó. Sửa hai câu thành 1 và 3 đáp án đúng → hết báo.
- [x] Chủ đề chỉ có 1 câu MC → không báo. Chủ đề 2 câu MC cùng số đáp án đúng → báo.
- [x] Mức (cảnh báo hay lỗi) và phạm vi đếm (Khởi động và Quiz hay chỉ Quiz) ghi trong ticket. Cuối ticket, sau khi content-editor xong, luật ở mức lỗi.
- [x] Luật FB dùng từ mới: có, kèm test (một FB ở Quiz không có từ nào trong `vocab` → cảnh báo ở đúng câu); hoặc ghi lý do không làm.
- [x] `npm test` và `npm run typecheck` của `tools/content-cli` qua; README cập nhật.
- [x] Sau khi content-editor xong, phiên chính chạy: `validate content` 0 lỗi; `build --min-app-version 0.1.0` thành công (không format mới); `check-pack` OK.

### content-editor
- [x] Mỗi chủ đề Discoverer đạt luật phân bố MC. Bảng sau sửa (theo chủ đề: số câu theo số đáp án đúng) ghi vào ticket, và `validate` không báo `multi_choice_correct_spread`.
- [x] 37 câu FB ở Quiz: từ trong chỗ trống là một từ của mục Từ vựng; kho 3–4 từ cùng loại; mọi thẻ từ có hình (có brief cho designer); mọi thẻ sai có `feedback`. Danh sách 37 câu kèm từ vựng được dùng ghi vào ticket.
- [x] Câu đổi đáp án hoặc lựa chọn có `version` tăng; không `id:` nào đổi; câu hướng dẫn MC vẫn là "Pick all the right answers.".
- [x] `da-va-dat/14` q4 hỏi dữ liệu, không hỏi tên cột.
- [x] `_topic.md` của 8 chủ đề và TEMPLATE đã sửa theo việc 4. Grep "Vị trí đáp án đúng" trong `content/` chỉ còn các dòng ghi hết hiệu lực.
- [x] Danh sách câu TF đã sửa `hint` (hoặc "không câu nào lộ"), và danh sách `explanation_correct` câu 6 đã sửa.
- [x] Phiên chính chạy `validate` cho 40 bài: 0 lỗi.

### tester
- [x] Chạy lại tiêu chí của ios-dev, dev, content-editor như ghi trên; mỗi lỗi có bước tái hiện, báo về agent sở hữu.
- [x] Rà chữ phần nội dung đổi: không chặn, mục "nên sửa" đã sửa hoặc có quyết định PM.
- [x] FB ở Quiz dùng từ mới: 37/37, bằng CLI hoặc script.
- [x] Gói build lại sau Đợt 1: `check-pack` OK; mở một bài mỗi chủ đề Discoverer trên simulator, xáo, gợi ý và Tổng kết chạy.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

### Phụ thuộc
- Code A2 Discoverer và Explorer (SK-043, đã vào commit `026f23d`); `feedback` SK-044.
- Duy duyệt 2 màn Tổng kết trên canvas trước khi ios-dev dựng màn.
- Ảnh mới cho MC và FB: mạng tới Commons (SK-043 ghi Commons từng trả 429; giãn nhịp, mỗi lúc một tiến trình).
- Luật MC ở mức lỗi chỉ sau khi content-editor sửa xong.

### Quyết định đã ghi
- **Duy 15/11:** hướng B; thêm Tổng kết bài theo T1, màn riêng sau Quiz (2 màn); luồng Quiz → Tổng kết → Thưởng; ticket Đợt 1 viết theo mặc định khuyến nghị.
- **Duy 15/11, duyệt thiết kế:** Tổng kết phương án A ở cả 4 chỗ, huy hiệu gật cho "Na nói đúng"; giữ các quyết định của designer (mục bàn giao designer cuối ticket).
- **Mặc định, Duy đổi được** (mục 9 của đề xuất):
  - Câu 3: bé mở gợi ý trước khi trả lời **vẫn được điểm**; chỉ ghi `hint_used`.
  - Câu 4, phần biểu đồ: **tên dưới cột luôn hiện**, là ngoại lệ của luật ít chữ A2. Phần chữ trên thẻ lý do `claim_check` thuộc Đợt 2, không quyết ở đây.
  - Câu 7: **Đợt 1 không có** bước bé tự đánh giá "Em làm được chưa?", nên không đổi database.
- **PM 15/11** (chi tiết thực hiện, đổi được):
  - Hạt giống xáo gồm `attemptId` và key câu. Chỉ dùng `attemptId` thì mọi câu cùng số lựa chọn sẽ có cùng một hoán vị, và đáp án từng cân tay cùng chỗ sẽ lại dồn về một chỗ.
  - Xáo cả câu Khởi động (trước đây cũng cân tay).
  - `hint_used = true` khi bé chạm nút gợi ý lúc câu chưa xong. Gợi ý app tự đọc sau lần sai không tính. Nút có ở Khởi động và Quiz; chỉ câu Quiz đi vào `quiz_answers`.
  - Thẻ "Ý sai → Ý đúng" lấy từ câu Quiz có `misconceptionId`. Câu khẳng định là `statement`, không có thì `prompt`.
  - Luật MC: giới hạn `max(1, floor(0.5 × n))` câu cùng số đáp án đúng trong một chủ đề.
  - Hình thẻ ý chính: hình nhóm Học thứ n (bài mẫu `ho-hap/01` khớp 3/3). designer, ios-dev đổi cách khác được nếu lệch, chỉ dùng hình có sẵn.
  - Scientist hiện chơi như Discoverer (`LessonPresentation` chỉ có `discoverer`, `explorer`). Luật "Scientist không tự đọc" ở Tổng kết áp dụng khi có màn Scientist.

### Rủi ro
- **`Step` được lưu** trong `in_progress/<lesson>.json` (Codable theo `name`).
  - Hiện `finish()` xoá file này, và `save()` không ghi sau khi đã có `summary`; vì vậy bình thường file không chứa `recap` hay `reward`.
  - Bản mới đọc file do bản cũ ghi: các bước cũ vẫn giải mã được (tiêu chí unit test ở trên).
  - Hạ cấp app: bản cũ gặp `"recap"` thì ném lỗi giải mã, xoá file, bài bắt đầu lại. Chấp nhận được, vì lượt đó đã nằm trong lịch sử.
  - ios-dev kiểm lại sau khi sửa.
- **Thứ tự xáo phụ thuộc thuật toán:** cần tái tạo được trên Android và khi phân tích, nên không dựa vào thuật toán nội bộ của stdlib.
- **Gợi ý trước khi trả lời, ở câu `true_false` 1 lượt:** câu DOK 3 (Na) vốn đoán đúng 1/2, nay còn dễ hơn nếu `hint` gần lộ đáp án. Việc 5 của content-editor giảm rủi ro này; `claim_check` (Đợt 2) mới sửa tận gốc. Theo dõi tỉ lệ `hint_used` trong playtest.
- **Tổng kết thêm khoảng 45 giây (đ)** trước phần thưởng: theo dõi trong playtest xem bé có bấm qua ngay không.
- **Hình nhóm Học thứ n** có thể không khớp nghĩa với ý chính thứ n. Đợt 2 sửa bằng `key_point_images`.

### Câu hỏi còn mở
**Không chặn Đợt 1** (mục 9 của đề xuất, thuộc Đợt 2–3):
1. `claim_check` thay câu 6 ở mọi bài Discoverer hay chỉ bài cuối chủ đề? (khuyến nghị: mọi bài)
2. `claim_check` thay luôn `evidence_choice` của Scientist?
3. Câu 4, phần chữ trên thẻ lý do `claim_check`: có là ngoại lệ của luật ít chữ A2 không?
4. Câu 5: `sort_into_groups` giữ sau beta hay kéo lên Đợt 2?
5. Câu 6: Explorer, linh vật đọc thêm giải thích cho ý bé làm sai mà không hiện dấu, có hợp D1 không?
6. Câu 8: sổ tay "Bài đã học" trong Bộ sưu tập (Đợt 3) có làm không?

**Cho agent, chốt trong ticket:**
- dev: mức của `multi_choice_correct_spread` trong lúc chờ nội dung; đếm cả Khởi động hay chỉ Quiz; luật FB từ mới có làm ở Đợt 1 không.
- designer: tên file canvas mới trong `design/play-ui/project/`. Bộ A2 Duy duyệt nằm ở `design/play-ui/options/lesson-less-text/`. Nếu đặt màn mới cạnh A2 hợp hơn thì ghi lý do.

**PM làm khi đóng ticket** (ngoài `docs/`, chờ nghiệm thu):
- [x] Thêm bước Tổng kết và nút gợi ý vào: `technical-plan.md` dòng 46 (vòng lặp bài học) và dòng 472 (`Lesson(warmup → … → reward)`); `syllabus.md` dòng 38 (cấu trúc một bài); `prd.md` dòng 64 (vòng lặp bài học). *(16/11, xem "pm 16/11 · đóng tài liệu")*
- [x] Ghi vào technical-plan B4.4: mở gợi ý không đổi điểm. *(16/11)*

## designer 15/11 · bàn giao thiết kế (Duy duyệt 15/11)

> **Duy duyệt 15/11 ("Chốt theo khuyến nghị"):** Tổng kết theo phương án **A ở cả 4 chỗ** (`r-d1-a`, `r-d2-a`, `r-x1-a`, `r-x2-a`); "Na nói đúng" bằng huy hiệu gật (`r-d2-a-nod`). Các quyết định của designer (khối đếm được, nút gợi ý ẩn giữ chỗ khi câu xong, khoá thẻ OS, hình thẻ ý chính ghép theo chữ) giữ như vẽ. Nút thoát ở Tổng kết giữ như vẽ. Nhãn "Từ mới" giữ, vì là chuỗi có sẵn của A2 (`lesson.learn.words_tag`). Khung phương án B giữ trong trang để tham khảo, ios-dev không dựng. Từ đây ios-dev, dev, content-editor bắt đầu.

Chỉ thiết kế. Không sửa code, nội dung, không tìm ảnh mới. Chưa commit.

**File**
- `design/play-ui/options/lesson-less-text/Quiz-Dot1.html`: 25 khung, có ghi chú cho ios-dev dưới từng khung, kèm mục "Hình thẻ ý chính", "Chuỗi giao diện mới", "Id các khung". Mở trực tiếp bằng trình duyệt (cần mạng để tải font Google như A2); một khung riêng: `Quiz-Dot1.html?shot=<id>`.
- `index.html` cùng thư mục: thêm mục "Mới 15/11 · Quiz Đợt 1" có 9 ảnh thu nhỏ.
- `img/`: 32 ảnh thu nhỏ từ `content/.build/pack/assets` (tiền tố `hh1-`, `hh3-`, `dd8-`, `dd14-`, `x6-`, `x8-`), là ảnh của bài, không ảnh mới. Thêm `img/na-shake.svg`, `img/na-nod.svg`: ghép mặt Na (`ArtSpeakerNa`) với mũi tên gỉ đồng của `ArtExplorerShake`/`ArtExplorerNod`, không vẽ mới.
- **Vì sao không đặt ở `design/play-ui/project/`:** các thành phần A2 Duy duyệt (CSS, ảnh, mặt Na, gật/lắc) nằm ở `options/lesson-less-text/` và chưa có trên canvas; đặt cạnh thì dùng lại nguyên CSS và ảnh, Duy xem cùng chỗ với A2. `canvas.json` không đổi.

**Id `?shot=`**

| Phần | iPhone 390×844 | iPad 834×1194 |
| --- | --- | --- |
| Nút gợi ý | `h-sc-ask`, `h-sc-open`, `h-fill-open`, `h-na-open`, `h-chart-open` ("Cả hai"); trạng thái đã xong ở `c-right` | — (cùng bố cục) |
| `order_sequence` | `o-d-ask` (4 thẻ, 2 hàng), `o-d-retry` (khoá thẻ đúng chỗ), `o-x-retry` (Explorer) | `o-ipad` (một hàng) |
| `picture_bar_chart` | `c-ask` (tên cột, khối), `c-solid` (cột liền, để so), `c-retry`, `c-right` | — |
| Tổng kết Discoverer | Màn 1: `r-d1-a`, `r-d1-b`, `r-d1-a-vi`, `r-d1-dot2` (Đợt 2, minh hoạ). Màn 2: `r-d2-a`, `r-d2-b`, `r-d2-a-nod` | — (khung 600, cùng bố cục) |
| Tổng kết Explorer | Màn 1: `r-x1-a`, `r-x1-b`. Màn 2: `r-x2-a`, `r-x2-b`, `r-x2-none` (`/06`, không thẻ) | — |

**Duy cần chốt (Tổng kết)**
- Discoverer Màn 1: **A · ba thẻ một trang** (khuyến nghị: thấy cả bài một lúc, Đợt 2 thêm dấu và dòng xem lại vào đúng thẻ) hay B · thẻ lớn và hàng thẻ nhỏ (hình to hơn nhưng không thấy ba ý cùng lúc).
- Discoverer Màn 2: **A · một tấm giấy hai phần, ý sai trên (giấy lõm, gạch nhẹ), ý đúng dưới** (khuyến nghị: cột rộng, đọc theo thứ tự giọng) hay B · hai tờ đặt cạnh nhau (ngang hàng nhưng mỗi tờ hẹp, 3–5 dòng).
- Explorer: Màn 1 **A** (ba hình 168, câu trong bong bóng) / B (một hình lớn, giống trang Học); Màn 2 **A** (ảnh câu 6 + huy hiệu lắc + hai câu in sẵn) / B (chữ chỉ trong bong bóng, ý sai và ý đúng không cùng hiện).
- "Na nói đúng": huy hiệu gật, không gạch, không thêm chữ (`r-d2-a-nod`), như PM đề xuất.
- Tiêu đề màn không chữ: "Em đã học", "Nhớ nhé" chỉ là tiêu đề ẩn cho VoiceOver. **Không chuỗi nào cần thu giọng.**

**Designer đã quyết (Duy đổi được)**
- **Khối đếm được: có.** Mọi `bars[].value` là số nguyên và lớn nhất ≤ 10 → mỗi đơn vị một khối giấy chàm; còn lại → cột liền như A2; không trộn hai kiểu trong một câu. Lý do: bé đếm được khi hai cột gần bằng nhau; biểu đồ khối là dạng trẻ lớp 2–3 đã gặp ở môn Toán, chuẩn bị câu "bao nhiêu" (Đợt 3); hợp style E (giấy chồng, không cần trục số); không đổi schema.
- **Nút gợi ý:** bóng đèn 56, trái nút nghe; ở câu Na nằm dưới nút nghe (hàng lời Na không đủ chỗ cho nút thứ ba). Đã mở: đĩa vàng hoè, mẩu giấy gợi ý không gấp góc (gấp góc là dấu sai A2) dưới câu hỏi; chạm lại là đọc lại. **Câu đã xong (đúng hoặc hết lượt): nút ẩn, giữ chỗ**, không chạm, VoiceOver bỏ qua; không làm mờ vì nút mờ trông như app hỏng.
- **`order_sequence`:** thẻ đúng chỗ khoá bằng lớp lá tre lệch + triện tích (như thẻ đúng A2), không nét viền; thẻ sai chỗ về kho ở trạng thái thường (không bong góc, khác A2 `d-order-retry`, vì nó vẫn có thể đúng ở chỗ khác). iPhone ≥ 4 thẻ: 2 hàng, dải giấy gấp khúc nối chỗ 2 → chỗ 3.
- **Hình thẻ ý chính: ghép theo chữ, không theo thứ tự.** Quy tắc "hình nhóm Học thứ n" đúng 3/3 ở `ho-hap/01`, `ho-hap/03`, Explorer `/04`, `/08`, `da-va-dat/14`, nhưng sai nghĩa rõ ở bài khác (đọc kỹ 13 bài): Explorer `/01` ý "Wild animals…" ra con chó nằm trong nhà; `/06` ý "ăn cả thực vật lẫn thịt" ra con cò (nhóm Ăn thịt); `be-mat-trai-dat/02` ý "Oceans…" ra bản đồ châu Mỹ; `ho-hap/04` ý "khẩu trang" ra khói rơm; `da-va-dat/08` ý "dấu in" ra lớp trầm tích. Lý do: bài có 4–5 nhóm Học, ý 3 thường ứng với nhóm 4. Quét 59 bài: 34 bài, 47/177 ý nên lấy nhóm khác. Đề xuất ios-dev: so từ chung giữa ý chính và `label.en` + `sentence.en` của từng nhóm (thuật toán 5 bước, tất định, có danh sách từ dừng, trong mục "Hình thẻ ý chính" của trang), chỉ dùng hình có sẵn, không đổi schema; bảng kết quả 34 bài trong trang dùng làm test vector. Đợt 2 thay bằng `key_point_images`.

**Chuỗi giao diện mới** (chỉ VoiceOver, không đọc to, không clip): `lesson.hint.button`, `lesson.hint.opened_a11y`, `lesson.order.locked_a11y`, `lesson.recap.learned_a11y`, `lesson.recap.remember_a11y`, `lesson.recap.steps_done_a11y`, `lesson.recap.key_point_a11y`, `lesson.listen.key_point`, `lesson.listen.myth`, `lesson.recap.na_wrong_a11y`, `lesson.recap.na_right_a11y`, `lesson.recap.not_true_a11y`, `lesson.recap.word_a11y` (dùng chuỗi trang Từ mới nếu đã có), `lesson.recap.goal_a11y`, `lesson.listen.objective`, `lesson.recap.to_reward`. VI/EN trong bảng của trang. Chữ in duy nhất là nhãn "Từ mới" đã có (`lesson.learn.words_tag`). Biểu tượng mới: `PaperIcon.hint` (path trong trang).

**Đề xuất cho content-editor (không chặn, chưa sửa)**
- `da-va-dat/14` q4: khi câu hỏi đổi sang hỏi dữ liệu, ảnh câu hỏi "nắm đất cát" lộ đáp án; đề xuất dùng ảnh `explore_setup` có sẵn của bài (khung `c-ask` vẽ theo cách này). Đơn vị biểu đồ nên đếm được khi giá trị nguyên ("cốc nước hứng được trong một phút").
- Câu hỏi biểu đồ trong khung là ví dụ "Which soil let the most water through?" của ticket, chưa có bản VI.

**Đã kiểm**
- Chụp cả 25 khung bằng Chrome headless và xem từng ảnh: chữ tiếng Việt đủ dấu (cả chữ hoa Phudu "NA CHƯA ĐÚNG", "TỪ MỚI").
- Script đo trên trang (flex không co): mọi khung iPhone vừa 390×844 trong vùng an toàn (đáy 814), iPad vừa 834×1194; không phần tử nào tràn ngang; không `border`/`outline` trên phần tử nào trong khung; không `stroke` ngoài icon nhỏ; mọi màu trong CSS mới và trong khung thuộc bảng token. Tương phản: chữ phụ trên giấy lõm 6,9:1, than tre trên vàng hoè 7,9:1, chữ giấy trên lá tre 4,8:1.
- Chưa kiểm: trên simulator, Dynamic Type lớn, VoiceOver thật.

**Còn chưa chắc**
- Chữ "ô-xi" có thể xuống dòng ở dấu gạch (thấy ở `r-d2-a-nod`); app iOS cũng có thể ngắt như vậy. ios-dev xem có nên hiển thị bằng gạch không ngắt (U+2011) không.
- Explorer Màn 2 A khoảng 30 tiếng in trên màn, nhiều nhất trong các màn Explorer, dù mọi câu đều được đọc to.
- Mặt Na ghép (72) và bóng đèn gợi ý cần nhìn trên máy thật xem đủ rõ ở cỡ thật không.
- 5 thẻ `order_sequence` (3 + 2) chỉ ghi luật, chưa vẽ (nội dung hiện chưa có câu 5 thẻ).
- Nút thoát ở Tổng kết đưa về chủ đề và bỏ qua Thưởng (bài đã lưu khi vào Màn 1); Duy muốn bỏ nút thoát ở đây thì header chỉ còn ô bước.
- Việc tìm ảnh cho lựa chọn và thẻ từ (sau content-editor) chưa làm, chờ danh sách.

## dev 15/11 · bàn giao

Việc 7 (luật MC) và luật FB của mục dev. Không migration, không RPC, bảng `FORMAT_FIRST_APP_VERSION` không đổi. Không build gói, không TTS. Không sửa `content/**/*.md`, `content/TEMPLATE.md`, `apps/ios/`. Chưa commit.

**File đổi**
- `content/rules.json`: thêm `multi_choice_correct_spread: 0.5` và `vocab_item_uses_lesson_word: true` vào `discoverer.authoring`, `scientist.authoring`. Chỉ thêm khoá (luật 5 của SK-026). App iOS chép nguyên file này vào bundle nhưng không giải mã `authoring`, nên app không bị ảnh hưởng.
- `tools/content-cli/schema/rules.schema.json`: hai khoá trong `Authoring`. `multi_choice_correct_spread` là số trong (0, 1]; `vocab_item_uses_lesson_word` là boolean. Cả hai tuỳ chọn.
- `tools/content-cli/src/build/rules.ts`: kiểu `Authoring`.
- `tools/content-cli/src/validate/age-rules.ts`: thêm hai mã; thêm các hàm `checkCorrectSpread` (cấp chủ đề), `checkVocabItems`, `correctSpreadLimit`, `wordForms`, `sameWord`. `validate` (JSON và markdown) và `build` gọi chung hàm này.
- Test:
  - `test/age-rules.test.ts`: bảng mức và 9 test SK-047, trong đó 1 test chạy CLI `validate`.
  - `test/rules.test.ts`: bảng `authoring`; 1 test mới kiểm các giá trị sai bị từ chối.
  - `test/build.test.ts`: `build` dừng khi gặp `0`, `1.5`, `"a"`.
  - `test/helpers.ts`: `withoutImageChecks` đổi tên thành `withoutLaterWarnings`, và `rulesFileWithoutImageChecks` thành `rulesFileWithoutLaterWarnings`; `test/markdown.test.ts`, `test/syllabus.test.ts` chỉ đổi tên gọi theo.
    - Các test SK-026, SK-027, SK-030 đếm mọi cảnh báo trên bài 1 fixture, nên chạy với `rules.json` đã bỏ khoá ảnh SK-033 và bỏ thêm `vocab_item_uses_lesson_word`.
    - Lý do: q2 của bài 1 fixture hỏi "energy", là từ `tier: extra`. Fixture này phải giữ nguyên từng byte (luật 6 của SK-026), vì test iOS cũng đọc nó.
    - Test SK-047 dùng `rules.json` thật.
- `tools/content-cli/scripts/make-age-fixtures.ts` và 3 file fixture Scientist sinh lại bằng `npm run make-age-fixtures`: câu q4 của fixture Scientist đổi sang điền `fish` (một từ trong vocab), để fixture hợp lệ vẫn không có cảnh báo.
- `tools/content-cli/test/aspect.test.ts` (**ngoài phạm vi**): test này đã đỏ ở HEAD `026f23d`. `image-slots.json` đặt `bank_item` của Discoverer là 1:1 (ghi chú trong file: "designer chốt 14/11"), nhưng test vẫn chờ 3:5. Đã sửa số mong đợi thành 1:1 cho khớp file; `image-slots.json` giữ nguyên.
- `tools/content-cli/README.md`: phạm vi của hai luật, bảng mã, bảng `authoring`, cách nâng mức.

**Quyết định (dev chốt)**
1. **Mức của `multi_choice_correct_spread`: cảnh báo** cho tới khi content-editor sửa xong 40 bài; **nâng lên lỗi ngày 15/11** (xem "dev 15/11 · nâng mức" ngay dưới). Mức nằm ở bảng `ISSUE_LEVELS` trong `src/validate/age-rules.ts`, không nằm ở `rules.json`.
   - Nâng lên lỗi: đổi `"warning"` thành `"error"` ở dòng đó, sửa dòng tương ứng trong `test/age-rules.test.ts` và bảng mã trong README.
   - Lý do không dùng cờ trong `rules.json`: file này đi vào manifest và bundle app, và chỉ được thêm khoá. Một cờ tạm sẽ phải ở lại mãi. `ISSUE_LEVELS` vốn là chỗ duy nhất giữ mức của mọi mã và đã có test.
2. **Phạm vi đếm: Khởi động và Quiz** (theo đề xuất PM), vì bé học mẹo "luôn chọn 2" từ mọi câu MC gặp trong chủ đề. Hiện không có câu MC nào ở Khởi động, nên số liệu không đổi.
   - Luật chỉ tính các bài có trong lần gọi, nên phải chạy trên cả thư mục chủ đề. Chạy trên một bài lẻ thì n = 1 và không báo.
   - Mỗi số đáp án đúng vượt giới hạn cho một dòng ở file topic (`_topic.md:1`, pointer `/`). Dòng báo nêu chủ đề, số đáp án đúng bị lặp, số câu trên tổng, giới hạn, số câu phải đổi ít nhất, phân bố hiện tại, và bài + key của từng câu.
3. **Luật FB dùng từ mới: làm**, khoá `vocab_item_uses_lesson_word: true`, **mức cảnh báo**. Vì là luật gần đúng nên giữ cảnh báo trong Đợt 1; PM muốn nâng thì làm như mục 1.
   - Phạm vi: mọi `fill_blank_bank` ở Quiz. Không tính Khởi động, vì câu Khởi động ôn bài khác.
   - Đạt khi ít nhất một từ trong `answers` có `label.en` trùng `term.en` của một **từ mới** của bài, tức từ vựng `tier: core` (thiếu `tier` thì tính là core).
   - **Phiên chính chốt 15/11: chỉ tính core.** Lý do: content-schema ghi core là "từ mới của bài, được kiểm tra"; dải Từ mới ở Tổng kết hiện đúng các từ core (`word_list.term_keys`), nên câu Từ mới phải khớp dải đó.
   - Chỗ trống là một từ `tier: extra` thì dòng báo ghi thêm "… là từ đọc thêm (tier: extra) của bài, chưa phải từ mới: dùng một từ core, hoặc đổi tier của từ đó thành core".
   - Cách so: không phân biệt hoa thường; gạch nối tính như khoảng trắng; bỏ "a/an/the" ở đầu. Từ cuối nhận các biến thể -s, -es, -ies, -ves, -ed, -ied, -ing (thêm hoặc bỏ e, bỏ phụ âm đôi) và vài số nhiều bất quy tắc (teeth, feet, mice, geese, children, people, men, women). Không có từ điển, nên "breath" và "breathe" là hai từ khác nhau.
   - Có ở Discoverer và Scientist, vì câu 2 của Scientist cũng là FB (đề xuất 4.1). Đợt 2 dùng chung khoá này, chỉ thêm các câu có `skill: vocab`.

**Test**
- Trước khi sửa: `npm test` 387/388 (test `aspect.test.ts` nói ở trên đỏ sẵn).
- Sau khi sửa: `npm test` 398/398 pass; `npm run typecheck` exit 0.

**Kiểm theo tiêu chí dev.** Chạy trên bản sao trong scratchpad, không đụng `content/`.
- **`rules.json` sai giá trị:** `build` dừng, không ghi gói (`build.test.ts` kiểm exit 1). Ba dòng lỗi ra đúng pointer:
  - `0`: `rules-bad.json /discoverer/authoring/multi_choice_correct_spread must be > 0 (… exclusiveMinimum)`.
  - `1.5`: cùng pointer, `must be <= 1`.
  - `"a"`: cùng pointer, `must be number`.
- **Bản sao `content/discoverer/ho-hap`.** Phải chép cả `discoverer/` vì `recall_from` trỏ sang chủ đề khác.
  - Trước khi sửa, `validate` báo: `ho-hap/_topic.md:1 / [multi_choice_correct_spread] cảnh báo: chủ đề ho-hap: 4/4 câu multi_choice có 2 đáp án đúng; nhóm discoverer cho tối đa 2 câu cùng số đáp án đúng (max(1, floor(0.5 × 4))), cần đổi ít nhất 2 câu sang số đáp án đúng khác. Phân bố: 2 đúng × 4. Các câu: 01-vi-sao-ta-phai-tho q3, 02-duong-di-cua-khong-khi q4, 03-tho-khi-chay-nhay q3, 04-giu-phoi-khoe q3`.
  - Sửa hai câu: 01 q3 còn 1 đáp án đúng (`q3_hen` thành sai); 02 q4 lên 3 đáp án đúng (`q4_stomach` thành đúng, bỏ `feedback`). Chạy lại: hết báo, exit 0.
- **Số câu MC (unit test):** 1 câu thì không báo; 2 câu cùng số đáp án đúng thì báo (giới hạn 1); 2 câu khác số thì không báo; câu MC ở Khởi động được đếm.
- **Luật FB (unit test):**
  - Bài 1 fixture có q2 "energy" (từ extra) → cảnh báo ở `/quiz/1/answers`, kèm câu "energy là từ đọc thêm…". Đổi tier của energy thành core → hết báo.
  - Đổi đáp án q2 sang `sunlight` (không có trong vocab) → cảnh báo ở đúng câu.
  - Câu hai chỗ trống có một từ core → đạt.
  - Câu FB ở Khởi động (`w1`, "air") không bị kiểm.

**`validate content` lúc 15/11 20:58 (chỉ đọc), sau khi đổi sang chỉ tính core:** 0 lỗi, 165 cảnh báo. Trước khi có luật mới là 140; thêm 6 dòng MC và 19 dòng FB. Lúc chạy, content-editor chưa lưu sửa nào vào `content/`; phần MC giống hệt lần chạy 20:51. Lấy danh sách mới: `npm --prefix tools/content-cli run validate -- content | grep -E "multi_choice_correct_spread|vocab_item_uses_lesson_word"`.

*MC theo chủ đề.* Khớp bảng PM 15/11: 16 câu phải đổi.

| Chủ đề | Câu MC | Phân bố | Giới hạn | Đổi ít nhất | Các câu có số đáp án đúng bị lặp |
| --- | --- | --- | --- | --- | --- |
| be-mat-trai-dat | 5 | 2 đúng × 5 | 2 | 3 | 01 q3, 02 q3, 03 q3, 04 q4, 05 q3 |
| khung-long | 5 | 2 đúng × 4 · 3 đúng × 1 | 2 | 2 | 01 q3, 02 q3, 03 q4, 05 q3 |
| ho-hap | 4 | 2 đúng × 4 | 2 | 2 | 01 q3, 02 q4, 03 q3, 04 q3 |
| nao-bo-va-giac-quan | 4 | 2 đúng × 4 | 2 | 2 | 01 q3, 02 q3, 03 q3, 04 q3 |
| thoi-tiet-va-thien-tai | 5 | 2 đúng × 5 | 2 | 3 | 01 q3, 02 q3, 03 q3, 04 q3, 05 q3 |
| da-va-dat | 15 | 2 đúng × 11 · 3 đúng × 4 | 7 | 4 | q3 của 01, 02, 04, 05, 06, 07, 09, 10, 13, 14, 15 |
| an-uong-lanh-manh | 2 | 2 đúng × 1 · 3 đúng × 1 | 1 | 0 | — |
| **Tổng** | **40** | | | **16** | |

*FB ở Quiz theo chủ đề (chỉ tính từ core).* 37 câu, 19 câu bị cảnh báo. Câu có dấu (extra) là câu điền một từ `tier: extra` của bài.

| Chủ đề | FB ở Quiz | Cảnh báo | Câu: từ trong chỗ trống (từ core của bài) |
| --- | --- | --- | --- |
| an-uong-lanh-manh | 2 | 2 | 01 q2: energy (extra) (nutrient, carbohydrate, protein, fat); 02 q2: biggest (balanced, meal, mix) |
| be-mat-trai-dat | 6 | 2 | 02 q1: land (continent, ocean, Asia, Pacific Ocean); 05 q2: crust (earthquake, tsunami, plate, shake) |
| da-va-dat | 15 | 5 | 09 q2: fossils (resin, amber, palaeontology); 11 q2: clay (extra) (soil, silt, organic matter); 12 q2: silt (alluvial soil, red soil, sandy soil); 14 q2: one thing (fair test, measure, result); 15 q2: diamond (fieldwork, sample, geology) |
| ho-hap | 5 | 4 | 01 q2: gills (extra) (breathe, oxygen, chest); 03 q2: breaths (extra) (exercise, muscle, blood); 04 q2: oxygen và 04 q5: windpipe (dust, smoke, mask) |
| nao-bo-va-giac-quan | 4 | 1 | 03 q2: nerves (sense, smell, taste) |
| thoi-tiet-va-thien-tai | 5 | 5 | 01 q2: water (weather, wind, cloud); 02 q2: wind (thermometer, temperature, rain gauge); 03 q2: wind (storm, season, forecast); 04 q2: rain (flood, drought, rise); 05 q2: news (warning, power line, torch) |
| khung-long | 0 | 0 | — |
| **Tổng** | **37** | **19** | |

So với ước của PM (khoảng 22 câu phải sửa):

| Cách đếm | Câu đạt | Câu phải sửa |
| --- | --- | --- |
| **Chỉ từ `core`, nhận biến thể (luật hiện tại, chốt 15/11)** | **18** | **19** |
| Chỉ từ `core`, chỉ khớp nguyên văn | 14 | 23 (gần số PM) |
| Mọi tier, nhận biến thể (bản đầu, trước khi chốt) | 22 | 15 |
| Mọi tier, chỉ khớp nguyên văn | 17 | 20 |

- 4 câu đạt nhờ biến thể: `da-va-dat/01` materials, `/02` grains, `/04` minerals, `nao-bo-va-giac-quan/02` messages. `be-mat-trai-dat/05` q4 có "shakes", nhưng câu này đạt nguyên văn nhờ "tsunami".

**Câu hỏi còn mở và chỗ chưa chắc**
1. ~~Câu Từ mới có chỉ dùng từ `tier: core` không?~~ **Phiên chính chốt 15/11: chỉ core** (xem Quyết định 3).
   - Có 4 câu content-editor phải sửa thêm: `an-uong-lanh-manh/01` q2 (energy), `da-va-dat/11` q2 (clay), `ho-hap/01` q2 (gills), `ho-hap/03` q2 (breaths). Mỗi câu sửa theo một trong hai cách: dùng một từ core, hoặc đổi tier của từ đó thành core.
   - `ho-hap/01` là bài dùng để kiểm Tổng kết: dải Từ mới của bài là breathe, oxygen, chest.
   - Đổi tier chỉ hợp khi từ đó thật là từ mới của bài. Cả 40 bài Discoverer hiện có `word_list.term_keys` đúng bằng tập từ core. Đây là quy ước, schema và CLI không kiểm. Vì vậy đổi tier thì thêm luôn từ đó vào `word_list` của trang Từ mới.
2. `da-va-dat/14` q2 "A fair test changes {1}." có "fair test" trong câu, nhưng chỗ trống là "one thing", nên luật báo. Làm vậy là theo đúng chữ ticket ("từ trong chỗ trống").
3. ~~Chưa nâng `multi_choice_correct_spread` lên lỗi~~: **đã nâng 15/11** (mục dưới). Còn lại cho phiên chính: chạy `build --min-app-version 0.1.0` và `check-pack` sau khi designer xong file chọn ảnh.
4. Luật FB không biết từ loại, nên không kiểm được "kho 3–4 từ cùng loại"; tester rà phần này bằng tay.
5. Cho tester: khi content-editor xong, kiểm "FB ở Quiz dùng từ mới 37/37" bằng CLI, đếm dòng `vocab_item_uses_lesson_word` khi chạy `validate content` phải bằng 0. Kiểm thêm `aspect.test.ts` (sửa ngoài phạm vi, nói ở trên).

### dev 15/11 · nâng mức `multi_choice_correct_spread` lên lỗi

Content-editor đã sửa xong. Lúc 15/11 21:42 phiên chính và dev cùng chạy `validate content`, kết quả không còn dòng MC hay FB nào. Chưa chạy `images`, `tts`, `build`, vì designer đang cập nhật file chọn ảnh.

**Đã đổi**
- `src/validate/age-rules.ts`: `ISSUE_LEVELS.multi_choice_correct_spread` đổi từ `"warning"` thành `"error"`. Từ nay `validate` exit 1 và `build` dừng khi một chủ đề vi phạm.
- `vocab_item_uses_lesson_word` giữ mức cảnh báo, vì luật này chỉ so gần đúng.
- `test/age-rules.test.ts`:
  - Bảng mức đổi theo.
  - Dòng báo MC không còn tiền tố "cảnh báo:".
  - Thêm ca: ở chế độ `build`, mức của MC cũng là lỗi.
  - Test CLI trên bản sao 4 bài nay chờ exit 1, "1 lỗi · 0 cảnh báo".
- `README.md`: bảng mã và đoạn "Mức".

**Kết quả**
- `validate content` (chỉ đọc), exit 0: 0 lỗi, 136 cảnh báo. Không còn dòng `multi_choice_correct_spread` hay `vocab_item_uses_lesson_word`. 136 cảnh báo còn lại gồm 69 `md_needs_check`, 37 `image_brief_keywords`, 28 `image_missing` và 2 `age_words_en`.
- `npm run typecheck`: exit 0.
- **`npm test`: 395/398, 3 test đỏ.** Ba test này đỏ không phải do việc nâng mức: content-editor đã sửa bài 1 `an-uong-lanh-manh/01`. Cụ thể: q2 đổi từ "energy" sang "nutrients", `version` 2, thêm hình và `feedback` cho thẻ từ; q6 đổi nhãn sang "check Na's idea" và đổi `hint`. Bài 1 là nguồn của fixture `packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/` và của bản chép `tools/content-cli/test/fixtures/markdown/valid/`, nên test so từng byte báo lệch. Ba test đó:
  - `markdown.test.ts` › "content/ bài 1 ra đúng từng byte hai fixture của packages/content-schema (A1 …)";
  - "bản chép trong test/fixtures/markdown/valid trùng content/";
  - "CLI import (spawn): … trùng fixture …".

**Cần phiên chính quyết, dev chưa làm.** README (mục "Fixture") ghi: đổi bài 1 thì dev sinh lại fixture ngay trong cùng lần sửa. Việc này đụng tới chỗ ngoài ranh giới đã giao cho dev:
- Sinh lại `packages/content-schema/fixtures/valid/…` và `fixtures/invalid` (`make-invalid-fixtures.mjs`).
- Test iOS đọc fixture này: `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/LessonSessionTests.swift` dòng 505 chờ `q2_energy`. ios-dev phải sửa, mà ios-dev đang làm song song.
- Trong `tools/content-cli`, các test gắn với giá trị của bài 1 cũng phải sửa theo:
  - số asset của `build.test.ts` ("asset: 107");
  - các test SK-047 dựng trên q2 "energy" (từ extra);
  - ghi chú `withoutLaterWarnings` trong `test/helpers.ts`.

Đề xuất: phiên chính cho phép dev sinh lại fixture theo README và sửa các test trong `tools/content-cli`, đồng thời báo ios-dev sửa `LessonSessionTests`. Sau đó dev chạy lại `npm test` của `tools/content-cli` và của `packages/content-schema`. **Phiên chính đồng ý 15/11; đã làm, xem mục dưới.**

### dev 15/11 · sinh lại fixture bài 1 sau khi content-editor sửa

Phiên chính đồng ý: sinh lại fixture theo mục "Fixture" của README `tools/content-cli`, không trả bài 1 về như cũ. Không sửa `apps/ios/`. Chưa chạy `images`, `tts`, `build`.

**Đã làm theo README**
1. `import` bài 1 vào scratchpad, rồi chép `topic.json` và `01-thuc-an-cho-ta-nhung-gi.json` vào `packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/`. `topic.json` không đổi byte nào.
2. Chạy `node scripts/make-invalid-fixtures.mjs`: 21 file `fixtures/invalid/` sinh lại theo bài mẫu mới, 20 file đổi nội dung. Bảng `test/invalid-fixtures.json` không đổi (cùng pointer).
3. Chép `_topic.md` và bài 1 vào `tools/content-cli/test/fixtures/markdown/valid/discoverer/an-uong-lanh-manh/`. Chỉ bài 1 đổi; `_topic.md` vẫn trùng.

**Khác biệt của bài 1 fixture** (cũ → mới). Topic không đổi.

| Chỗ | Cũ | Mới |
| --- | --- | --- |
| q2 `version` | 1 | 2 |
| q2 `sentence` | "Carbohydrates give us {1}." / "Chất bột đường cho ta {1}." | "Food gives us {1}, like protein and fat." / "Thức ăn cho ta {1}, như chất đạm và chất béo." |
| q2 `bank[0]` | `q2_energy` ("energy" / "năng lượng"), không hình | `q2_nutrients` ("nutrients" / "chất dinh dưỡng"), có `image` (brief dùng lại hình `nutrient`) |
| q2 `bank[1]` (`q2_air`), `bank[2]` (`q2_sunlight`) | không hình, không `feedback` | có `image` và `feedback` |
| q2 `answers` | `["q2_energy"]` | `["q2_nutrients"]` |
| q2 `hint`, `explanation_correct`, `explanation_wrong` | (cũ) | viết lại |
| q6 `instruction` | "Challenge: spot the mistake" / "Thử thách: bắt lỗi sai" | "Challenge: check Na's idea" / "Thử thách: kiểm tra ý của Na" |
| q6 `hint` | "Remember: fats give us energy and keep us warm." | "Think about what fat does for your body." |

Số đếm mới:
- Spoken: bài 126 → 128, tổng 128 → 130.
- Chuỗi EN khác nhau (số clip EN của gói): 107 → 110.
- Số `Image` trong bài: 36 → 39.

**Test của `tools/content-cli` đã sửa cho khớp**
- `test/fixtures/markdown/expected.json`:
  - Số dòng dời theo diff (bài 1 thêm 18 dòng từ q2 trở đi).
  - Năm ca có đoạn văn bản cần thay đã đổi:
    - 12b: `q2_nutrients`;
    - 18a: `version: 2`;
    - 35: bỏ hai dòng `image.alt` của `q2_air`, vì `q2_air` nay đã có hình;
    - 38: `feedback` dưới thẻ đáp án `q2_nutrients`;
    - 39: đổi theo `hint` mới của q6.
  - Hai `message_includes` có số dòng: 05, 31.
- `test/markdown.test.ts`:
  - Số dòng `[CẦN KIỂM]`, các dòng `ids`, ca thứ tự lỗi (`q2_nutrients`).
  - Ca SK-044: `q2_air` nay có sẵn `feedback`, nên bỏ chỗ sửa đó và kiểm `feedback` có sẵn.
- `test/spoken.test.ts`, `test/normalize-vi.test.ts`: số chuỗi 130 và 110; chuỗi VI có "vitamin" từ 10 lên 11.
- `test/build.test.ts`: asset 110, gói 112 file, `Image` 39, gói có ảnh 112 (audio en 110, image 2).
- `test/images.test.ts`:
  - Thẻ từ thiếu hình nay là `/warmup/0/bank/0` (`w1_air`).
  - Brief dùng lại hình của bài khác (`q2_air`, `q2_sunlight`) không bị cảnh báo; công thức đếm tính cả loại này.
- `test/age-rules.test.ts`:
  - Ca Explorer: 8 lỗi · 9 cảnh báo, thêm 3 `age_words_en` vì các câu mới của q2 dài hơn 8 từ.
  - Test SK-047 của luật FB: bài 1 nay đạt ("nutrients" khớp từ core "nutrient"). Ca từ extra tự dựng bằng cách đổi thẻ `q2_air` thành "energy". Thêm 1 test, tổng 43.
- `test/helpers.ts`: sửa ghi chú của `withoutLaterWarnings`. Các test SK-026, SK-027, SK-030 vẫn bỏ `vocab_item_uses_lesson_word`, vì chúng đếm mọi cảnh báo trên bài 1 đã sửa và không nên phụ thuộc luật cảnh báo thêm sau. Bài 1 gốc nay đạt luật này.

**Kết quả (15/11 21:53)**
- `tools/content-cli`: `npm test` 399/399 pass, `npm run typecheck` exit 0.
- `packages/content-schema`: `npm test` 160/160 pass, `npm run typecheck` exit 0, `npm run validate` "OK: 2 file hợp lệ".
- `validate content` (chỉ đọc): 0 lỗi, 136 cảnh báo, exit 0.

**Cho ios-dev: test iOS sẽ vỡ khi chạy với fixture mới** (dev chưa chạy Xcode, chỉ đọc code)

Phải sửa:
1. `Packages/SKKit/Tests/LessonPlayerTests/LessonSessionTests.swift` dòng 505: `fillBlankBank(bank: ["q2_energy", "q2_air", "q2_sunlight"], answers: ["q2_energy"])` → `bank: ["q2_nutrients", "q2_air", "q2_sunlight"], answers: ["q2_nutrients"]`.
2. `Packages/SKKit/Tests/ContentModelTests/ContentModelTests.swift`:
   - Dòng 418: `q2.segmentsEN` nay là `[.text("Food gives us "), .blank(1), .text(", like protein and fat.")]`.
   - Dòng 454: khoá kho là `["q2_nutrients", "q2_air", "q2_sunlight"]`.
   - Dòng 465, 467, 472, 475: `"q2_energy"` → `"q2_nutrients"`. `BankWordImage` tự gán hoặc xoá `image` của mọi thẻ, nên hình có sẵn trong fixture không ảnh hưởng.
   - Dòng 403–404 tách một chuỗi viết sẵn, không đọc fixture, nên không vỡ.
3. `Packages/SKKit/Tests/LessonPlayerTests/FillBlankSentenceTests.swift`. Chỗ trống của q2 không còn nằm ngay trước dấu chấm: từ điền nay đứng trước dấu phẩy.
   - Dòng 74–77 (`wordAtTheEnd`): câu điền xong là "Food gives us nutrients, like protein and fat." / "Thức ăn cho ta chất\u{00A0}dinh\u{00A0}dưỡng, như chất đạm và chất béo.". Test này kiểm "từ chạm dấu chấm", nên ios-dev chọn: đổi thành "chạm dấu phẩy", hoặc dựng câu riêng có chỗ trống trước dấu chấm.
   - Dòng 102: `("q2", "energy", "q2_energy", .en), ("q2", "năng\u{00A0}lượng", "q2_energy", .vi)` → `"nutrients"` và `"chất\u{00A0}dinh\u{00A0}dưỡng"` với `q2_nutrients`.
   - Dòng 141–144: số no-break space là 2, không còn 1 ("chất dinh dưỡng" có ba tiếng); tiền tố là `"Thức ăn cho ta "`.
   - Dòng 159: câu trống EN là `"Food gives us \u{2007}\u{2007}?\u{2007}\u{2007}, like protein and fat."`.
   - Chú thích đầu file (dòng 16, "q2 has it right before the full stop") cũng phải sửa.

Đọc fixture nhưng lấy giá trị động, theo code thì không vỡ, nên chạy lại để chắc:
- `ScienceKidsUITests/LessonFixture.swift`: đọc khoá, gợi ý, `explanation_wrong` từ fixture lúc chạy, không có chuỗi viết sẵn. Nhưng UI test chạy trên gói nhúng trong app. Cho tới khi phiên chính build lại gói, q2 của gói (cũ: `q2_energy`, gợi ý cũ) sẽ lệch với fixture (mới), nên các bước UI chạm q2 hay đọc gợi ý q2, q6 sẽ sai. Hết lệch sau khi build lại gói. UI test vốn đã hỏng từ A2 (SK-043).
- `ContentPackTests.swift` (`TestPack.made`): dựng gói từ fixture, nhưng chỉ kiểm tên chủ đề, tên bài, id và clip giả theo từng chuỗi. Không vỡ.
- `QuizWaveOneTests.swift`: bảng hoán vị xáo (dòng 57–59) không phụ thuộc nội dung, vì kho q2 vẫn 3 thẻ. Thẻ "Ý sai → Ý đúng" lấy `statement` và `explanation_correct` của q6, hai trường này không đổi. Không vỡ.
- `ContentModelTests.invalidFixturesNeverCrash`: `fixtures/invalid` sinh lại nhưng bảng pointer không đổi.
- Các file chỉ đọc giá trị không đổi: `lessonOneValues`, `topicValues`, `JourneyProgressAppTests` (đổi id), `OnboardingTests` (chỉ kiểm file có), `LessonSpeechTests` (clip giả theo từng chuỗi), `CollectionTests:121` (vocab không đổi).
- `LessonEngineTests.swift:28` dùng dữ liệu tự dựng, không đọc fixture.

App: `project.yml` dòng 50 đóng gói `fixtures/valid` làm nội dung dự phòng, chỉ dùng khi bản build không có gói. Bản build không gói sẽ hiện bài 1 mới, nhưng không có hình hay audio cho phần mới.

### dev 15/11 · pipeline: import, tts EN/VI, build, check-pack

Chạy sau khi designer xong file chọn ảnh (mục "designer 15/11 · ảnh nội dung Đợt 1"). Các bước chạy lần lượt, mỗi lúc một tiến trình, từ 21:59 đến 23:00. Không sửa `apps/ios/`, không sửa nội dung. Chưa commit (`content/.build`, `content/.audio`, `content/.images` không nằm trong git).

**1. `import`.** `npm run import -- ../../content/discoverer`: 47 file (7 topic, 40 bài), 0 lỗi, 114 cảnh báo, ghi vào `content/.build/json/discoverer/`.
- Explorer cũng được import, nhưng ra scratchpad để so: JSON trùng từng byte với `content/.build/json/explorer/`.
- 22 file `tts` của Explorer khớp JSON (bỏ `audio`), nên dùng lại, không chạy `tts` cho Explorer.

**2. `tts`.** Chạy cho cả 7 chủ đề Discoverer; chuỗi không đổi lấy từ cache.

| Chủ đề | Clip EN mới | Clip VI mới | Clip VI mới còn đánh dấu |
| --- | --- | --- | --- |
| an-uong-lanh-manh | 20 | 20 | 0 |
| be-mat-trai-dat | 27 | 20 | 0 |
| khung-long | 15 | 13 | 3 |
| ho-hap | 24 | 24 | 0 |
| nao-bo-va-giac-quan | 15 | 15 | 0 |
| thoi-tiet-va-thien-tai | 38 | 40 | 7 |
| da-va-dat | 44 | 46 | 3 |
| **Tổng** | **183** | **178** | **13** |

- Cache trước khi chạy: EN 7111, VI 7160. Sau khi chạy: EN 7294, VI 7338. Cả 183 clip EN và 178 clip VI mới đều có trong gói.
- **gills, breath, clay** đã là `tier: core` và có trong `word_list`. Từ và câu ví dụ của cả ba có đủ clip EN và VI trong gói. `tts` vốn đọc mọi `Spoken` không kể tier, nên ba từ này đã có clip từ trước, lượt này không cần sinh.
- Cảnh báo chuẩn hoá đều có từ trước, không phải chữ mới:
  - EN: viết tắt "TV" ở 6 chỗ (Kokoro có thể đánh vần);
  - VI: từ mượn "manti" ở 21 chỗ, "inox" ở 4 chỗ.
- **13 clip VI mới còn bị đánh dấu, chờ nghe.** Cả 13 đều là cờ `asr` (máy nghe ra chữ khác); đã thử đổi seed, giữ biến thể ít lỗi nhất. Cột "Nhận xét" là dev đoán, chưa nghe:

| Chủ đề | Chữ | Máy nghe ra | Biến thể | Nhận xét |
| --- | --- | --- | --- | --- |
| da-va-dat | Em tìm trên bãi cuội, cách xa vách đá. | … bãi **củi** … | 0 | cần nghe |
| da-va-dat | Tìm an toàn là tìm trên bãi cuội cùng người lớn. | … bãi **cụi** … | 1 | cần nghe |
| da-va-dat | Em nghĩ xem Me ri tìm được gì, ai học được từ đó nhé. | … **mary** … | 0 | có thể máy chỉ viết tên khác cách |
| khung-long | Khủng long bạo chúa ăn thịt, nhưng nhiều loài ăn thực vật. | … **bảo** chúa … | 1 | cần nghe (thanh) |
| khung-long | Rùa có vảy, ngày nay vẫn còn. | … có **vẫy** … | 0 | hỏi = ngã ở giọng Nam? cần nghe |
| khung-long | Thằn lằn bay đã tuyệt chủng cùng khủng long. | **thằng làng** bay … | 3 | cần nghe |
| thoi-tiet-va-thien-tai | Mây là giọt nước li ti, giọt to thì rơi thành mưa. | … **ly** ti … | 0 | có thể máy chỉ viết khác chính tả |
| thoi-tiet-va-thien-tai | Em nghĩ tới cánh diều, đám mây trên cao nhé. | … cánh **dìu** … | 0 | cần nghe (thanh) |
| thoi-tiet-va-thien-tai | Phích giữ nước nóng, không dùng để hứng mưa. | lượt 1 đúng chữ | 0 | lượt nghe thứ hai lệch; cần nghe |
| thoi-tiet-va-thien-tai | ruy băng trên que | **ri** băng trên que | 1 | cần nghe |
| thoi-tiet-va-thien-tai | cầu vồng | cầu **vòng** | 0 | cần nghe (thanh) |
| thoi-tiet-va-thien-tai | Cầu vồng hiện ra sau mưa, khi có nắng. | cầu **vòng** … | 0 | cần nghe (thanh) |
| thoi-tiet-va-thien-tai | Ti vi, đài và loa phát thanh làng đưa tin dự báo. | **tv** đài … | 0 | có thể máy chỉ viết tắt |

- Ngoài 13 clip này, có 226 lần dùng (223 câu) clip VI cũ mang cờ từ các lượt trước. Chúng được dùng lại nguyên, lượt này không đổi. Theo chủ đề:

  | Chủ đề | Lần dùng |
  | --- | --- |
  | da-va-dat | 96 |
  | thoi-tiet-va-thien-tai | 38 |
  | khung-long | 34 |
  | ho-hap | 21 |
  | nao-bo-va-giac-quan | 20 |
  | be-mat-trai-dat | 14 |
  | an-uong-lanh-manh | 3 |

  `tts-vi/variants.json` chưa có câu nào được ghim tay (`--pin-variant`). Danh sách đầy đủ ở `content/.audio/report-<chủ đề>-…-vi.json` (trường `clips[].check.flags`).
- File nghe thử: `content/.build/tts/review-01…15.m4a` và `review-01…15-vi.m4a`. Mỗi lần chạy `tts` ghi đè các file này, nên bộ hiện có là của lượt chạy sau cùng (`da-va-dat`).

**3. `build --min-app-version 0.1.0`** cho 69 file `tts` của 10 chủ đề (7 Discoverer, 3 Explorer, như gói nhúng trước). Exit 0, 0 lỗi.

| | Gói trước (15/11 08:53) | Gói mới (15/11 22:55) |
| --- | --- | --- |
| `content_version` | d01287a7c6df | **ceeb1eb6912a** |
| Chủ đề · bài | 10 · 59 | 10 · 59 |
| Asset | audio EN 6001, VI 6242, ảnh 1204 | audio EN 6001, VI 6245, ảnh 1206 |
| Số file | 13458 | 13463 |
| Dung lượng | 417 MB (`du`) | 392 MB = 411.027.830 byte (418 MB theo `du`) |

- Version mới của 7 chủ đề Discoverer:

  | Chủ đề | Version |
  | --- | --- |
  | an-uong-lanh-manh | 7146e453266d |
  | be-mat-trai-dat | 2223db821f04 |
  | khung-long | eb28e319d425 |
  | ho-hap | cd057e50f644 |
  | nao-bo-va-giac-quan | c4fd82c9ba7a |
  | thoi-tiet-va-thien-tai | e75a499d4381 |
  | da-va-dat | d48a1b498845 |

- Ba chủ đề Explorer giữ nguyên version (62462dd34421, 66db53d2c142, 556f6d940b59).
- Hình: 1206 file ảnh (77 hình ghép, 464 hình tự vẽ) cho 2522 `Image`. 67 `Image` chưa có ảnh: chủ đề `an-uong-lanh-manh` chưa có file chọn ảnh, app vẽ hình giữ chỗ.
- 73 cảnh báo, gồm:
  - 69 `ai_draft`;
  - 2 dòng gộp cảnh báo hình của `an-uong-lanh-manh` (36 + 29);
  - 2 `age_words_en` (câu EN 11 từ): `an-uong-lanh-manh/02` q2 `bank[1].feedback`, và `thoi-tiet-va-thien-tai/01` q2 `explanation_wrong`. Hai câu này thuộc việc của content-editor, không chặn build.
- **Không có cảnh báo khoá thừa trong file chọn ảnh, không có cảnh báo lệch khung**, ở cả 6 chủ đề có ảnh.
- Bài 1 trong gói khớp fixture vừa sinh lại (bỏ `audio`, `asset`, `brief`); q2 `answers` = `q2_nutrients`.

**4. `check-pack`** (`sh tools/content-cli/scripts/check-pack.sh content/.build/pack`): **OK**, exit 0, chạy khoảng 4,5 phút.
- 13462 file khớp manifest (10 `pack.json`, 13452 asset), không thừa không thiếu. Tên asset đúng bằng sha256.
- Không còn `brief`; không `audio` nào thiếu file.
- EN 6001 = 6001 hash, VI 6245 = 6245 hash, ảnh 1206 = 1206.
- 1206 ảnh qua các bước kiểm JPEG, metadata, kích thước, credit, giấy phép: 0 lỗi.

**Nhúng gói vào app iOS (cho ios-dev, không cần sửa `apps/ios/`)**
- Build phase "Embed content pack" (`apps/ios/scripts/embed-content-pack.sh`, khai trong `apps/ios/project.yml`) chép `content/.build/pack` vào bundle thành `pack/` **mỗi lần build**. Build setting `SK_CONTENT_PACK_DIR` mặc định là `$(SRCROOT)/../../content/.build/pack`; `basedOnDependencyAnalysis: false` (trong pbxproj là `alwaysOutOfDate = 1`). Gói mới đã nằm đúng chỗ đó.
- `tools/` không có script nào chép gói vào app, và không cần.
- Các bước:
  1. Build lại app như thường lệ, ví dụ `cd apps/ios && xcodebuild build -project ScienceKids.xcodeproj -scheme ScienceKids -destination 'platform=iOS Simulator,name=iPhone 16 Pro'`. Log build phải có dòng `note: Content pack embedded from …/content/.build/pack (13463 files).`
  2. Cài lên simulator rồi kiểm phiên bản gói: `grep -o '"content_version": *"[0-9a-f]*"' "$(xcrun simctl get_app_container booted vn.sciencekids.app)/pack/catalog/v1/manifest.json"` phải ra `ceeb1eb6912a`.
  3. Thử một gói khác mà không build lại (bản Debug): `xcrun simctl launch booted vn.sciencekids.app -SKContentPack <đường dẫn tuyệt đối tới content/.build/pack> -SKSyncOff YES`.
- Lượt học dở do gói cũ ghi (`in_progress/<bài>.json`) có thể trỏ tới key đã đổi, ví dụ `q2_energy`. Dev chưa xem app xử lý trường hợp này ra sao; ios-dev kiểm. Cài sạch (`-SKResetProfile YES` hoặc gỡ app) thì không gặp.

## ios-dev 15/11 · bàn giao

Làm đủ 6 việc ở mục ios-dev, dựng màn theo bản Duy duyệt 15/11 (Tổng kết phương án A ở 4 chỗ, `r-d2-a-nod`, `r-x2-none`; không dựng khung B). Dùng gói nhúng hiện có (`content/.build/pack`, build 15/11 08:53, trước khi sửa MC/FB), không build lại gói, không sửa `content/`, `tools/`, `packages/`. Chưa commit.

**Kết quả chạy (một máy iPhone 16 Pro simulator, iOS 18.4, một lần)**
- `xcodebuild build-for-testing` (generic iOS Simulator): thành công, 0 cảnh báo trong file đã sửa.
- `xcodebuild test-without-building -skip-testing:ScienceKidsUITests`: **394/394 pass, 0 fail, 0 skip** (9 bundle: `ScienceKidsTests` + 8 target SKKit). Test dùng gói nhúng chạy thật (gói có trên máy); in ra `order_sequence` trong gói: Explorer 12, Discoverer 1.
- Sau lần test, sửa 3 chỗ chỉ thuộc view (mặt Na ghép mũi tên lắc/gật, chữ từ mới xuống 2 dòng thay vì cắt, tên cột không bị xám khi câu đã chấm); `build-for-testing` lại thành công, không chạy lại test (quy ước chạy một lần).
- UI test (`LessonUITests`, `SyncUITests`, `AudioUITests`) không chạy: đã hỏng từ A2, việc của SK-043.

**File**
- Mới: `apps/ios/Packages/SKKit/Sources/LessonPlayer/SeededOrder.swift` (xáo), `LessonRecap.swift` (dữ liệu Tổng kết, ghép hình thẻ ý chính), `Views/RecapStep.swift` (2 màn × Discoverer/Explorer), `Views/FillBlankSentence.swift`, `Views/WrapLayout.swift` (giữ lại từ file đã xoá), `Tests/LessonPlayerTests/QuizWaveOneTests.swift`.
- Sửa: `AttemptStore.swift` (`.recap`), `LessonSession.swift` (bước, `finish()`, gợi ý, thứ tự hiện), `LessonSpeech.swift`, `LessonPlayerView.swift`, `ShelfOrder.swift`, `Language.swift` (U+2011), `Views/DiscovererQuestionStep.swift` (gợi ý, biểu đồ), `Views/ExplorerOrderSequence.swift` (viết lại), `Views/ExplorerQuestionStep.swift`, `Views/ExplorerParts.swift`, `Views/LessonParts.swift`, `Views/PictureBookParts.swift`, `DesignSystem/Paper/PaperIcon.swift` (`.hint`), `ScienceKids/Resources/Localizable.xcstrings` (14 khoá), `apps/ios/README.md`; test `LessonSessionTests`, `LessonSpeechTests`, `ExplorerTests`.
- Xoá: `Views/QuestionStep.swift` (gồm `QuizHeader`, `WarmupTagRow`), `Views/QuestionViews.swift` (giữ `FillBlankSentence`, `FilledWordLook` sang file mới), `Views/LearnStep.swift` (giữ `WrapLayout`), `ResultSheet` và `HintNote` (`LessonParts.swift`), `PositionDots`, test `BankChipMarkTests.swift`. Dọn thêm phần chết theo: `BilingualLines`, `LessonHeader`, `StepSquares`, `CompactLessonHeader`, `PageDots`, `FlowChips`, các hằng `LessonMetrics`/`ExplorerMetrics` không còn ai dùng. `markHintUsed` giờ chỉ được gọi từ nút gợi ý mới.

**Quyết định (đổi được)**
1. **Xáo** (`SeededOrder`, chú thích trong file là bản đặc tả để Android chép):
   - Hạt giống: 16 byte của `attemptId` theo thứ tự RFC 4122 (thứ tự chuỗi), đọc thành hai `UInt64` big-endian `hi`, `lo`. Key câu băm FNV-1a 64 trên UTF-8. Trạng thái đầu là `hi ^ lo ^ fnv(key)`.
   - Bộ sinh SplitMix64. Xáo Fisher–Yates (Durstenfeld) từ cuối mảng, `j = next() % (i + 1)`.
   - OS: nếu ra đúng thứ tự `answer` thì xoay trái một ô.
   - Vector vàng (kiểm bằng một bản Python viết riêng) nằm trong `SeededOrderTests.goldenPermutations`.
   - Key câu dùng nguyên `item.key`. Không xáo hai thẻ TF, cột biểu đồ (`shownOptions` của biểu đồ trả đúng `options`), chỗ trống.
   - Kệ Chơi (`ShelfOrder`) chuyển sang cùng thuật toán với key `play`, bỏ `shuffled(using:)` của stdlib. Hệ quả: một lượt đang dở ở bước Chơi khi cập nhật app sẽ thấy kệ đổi thứ tự một lần, mâm không đổi.
2. **`hint_used`:**
   - `markHintUsed(_:in:)` thêm tham số bước. Câu đã xong thì bỏ qua.
   - Gợi ý ở Khởi động lưu là `warmup/<key>` trong `hints_used`, để không bao giờ đánh dấu nhầm câu Quiz.
   - File đang học dở của bản cũ không có khoá nào như vậy, nên đọc vẫn đúng.
3. **Tổng kết:**
   - `finish()` chạy khi vào `.recap`. `init` cũng finish khi bước đã lưu là `.recap` hoặc `.reward`. Vào Thưởng không ghi thêm gì.
   - Mũi tên của câu Quiz cuối đổi nhãn VoiceOver thành `lesson.next` (trước là "Xem kết quả" / "Xem phần thưởng").
   - Nút X ở Tổng kết dùng nhãn có sẵn `lesson.reward.close` ("Đóng, về hành trình"), vì bài đã lưu và nút đưa về hành trình. Designer đề xuất dùng `lesson.quiz.close` ("Thoát quiz"); ở bước này nhãn đó sai nghĩa.
4. **Tự đọc ở Tổng kết:**
   - `autoplayUtterance(.recap)` trả ý chính 1. Màn tự nối ý 2, ý 3 khi lời trước đọc xong (dựa vào `SpeechStats.finished`). Thẻ đang đọc là thẻ có `speaking` trùng id.
   - Màn 2 tự đọc thẻ ý sai → ý đúng rồi mục tiêu. Từ mới chỉ đọc khi chạm.
   - Chạm bất kỳ loa nào, mũi tên hoặc rời màn thì chuỗi dừng. Dưới VoiceOver không tự đọc (`autoplay`).
5. **Thẻ "Ý sai → Ý đúng":**
   - Lấy câu Quiz cuối cùng có `misconception_id`, nếu là `true_false`. Explorer cần thêm `answer: false`. Câu khẳng định là `statement`, không có thì `prompt`.
   - Mặt Na vẽ đúng ảnh ghép của designer (`img/na-shake.svg`, `na-nod.svg`): `ArtSpeakerNa` cộng hai mũi tên gỉ đồng, viết lại thành `Shape` trong code, không thêm ảnh mới.
   - Ghi chú dưới khung `r-d2-a` ghi "huy hiệu 32 ArtExplorerShake ở góc". Bản đầu làm theo ghi chú đó thì trông như một mặt bé thứ hai nên đổi theo hình vẽ. Explorer dùng nguyên `ArtExplorerShake` 64 trên ảnh, như `r-x2-a`.
6. **Hình thẻ ý chính:**
   - Làm đúng thuật toán 5 bước của designer, thêm tiêu chí hoà thứ tư "j lớn trước" cho khớp script của designer.
   - Lấy mọi nhóm của khối `explore_groups` đầu tiên. Nhóm không có hình thì vẽ hình thay thế.
   - Bảng 34 bài của designer chạy trên cả 59 bài của gói: khớp 59/59 (`KeyPointPicturesTests.designerTableOnThePack`).
7. **"ô-xi" (U+2011):**
   - Có dùng. `Spoken.text(in: .vi)` và `BilingualText` đổi dấu gạch nằm giữa hai chữ cái thành U+2011 (gạch không ngắt).
   - Chỉ áp cho tiếng Việt, chỉ lúc hiển thị (clip không dùng chữ này). Gạch có dấu cách hai bên giữ nguyên.
   - Đã kiểm Be Vietnam Pro (Bold, SemiBold) và Phudu: cả ba có glyph U+2011, trùng glyph gạch nối, nên không bị lấy font khác.
   - Áp cho mọi màn đọc chữ qua `mode.sentence`/`name`. Câu điền từ (`FillBlankSentence`) ghép chữ riêng nên chưa áp.
8. **Biểu đồ:**
   - Khối khi mọi `value` là số nguyên từ 0 đến 10, còn lại vẽ cột liền.
   - Tên cột là hàng riêng dưới trục. Chạm tên cũng là chọn cột đó. VoiceOver đọc tên trên nút của cột, như trước.
9. **`order_sequence`:**
   - Khoá theo lần thử gần nhất (ô nào khớp `answer`).
   - Thẻ đã đặt (khoá hoặc đang xếp) để lại ô lõm trong kho, theo `o-d-retry`.
   - Ô xếp vuông, cỡ `min(116, …)`, iPad `min(160, …)`. Khe mũi tên 44 khi 2 hàng, 28 khi một hàng iPhone, 36 trên iPad. Thẻ kho cao 104 (Discoverer, iPhone), 150 (Explorer, iPad).
10. **Cỡ chữ:**
   - Token không có 18/600, 18/700, 17/600 như canvas. Đã dùng token gần nhất: `itemTitle` cho ý chính và câu sai, `sentence` cho câu đúng và mục tiêu (Discoverer), `title` (Phudu 900) cho từ mới.
   - Từ dài ("SEA SPONGE") thu nhỏ tới 80% rồi xuống dòng, không bị cắt.
11. Ô từ mới ở Tổng kết không có nút VI riêng (khung không vẽ), nhãn VoiceOver giống trang Từ mới, nên không thêm `lesson.recap.word_a11y`. Chuỗi mới: `lesson.hint.button`, `lesson.hint.opened_a11y`, `lesson.order.locked_a11y`, `lesson.recap.learned_a11y`, `lesson.recap.remember_a11y`, `lesson.recap.steps_done_a11y`, `lesson.recap.key_point_a11y %lld %lld`, `lesson.listen.key_point`, `lesson.listen.myth`, `lesson.recap.na_wrong_a11y`, `lesson.recap.na_right_a11y`, `lesson.recap.not_true_a11y`, `lesson.recap.goal_a11y`, `lesson.recap.to_reward`. Dùng lại `lesson.listen.objective`. Không chuỗi nào cần clip giọng.

**Tiêu chí ios-dev đã kiểm** (không tick ô trong danh sách tiêu chí; tester kiểm lại rồi tick)

*Unit test (pass):*
- Xáo: hai `attemptId` cố định cho `ho-hap/01` → có câu SC đổi thứ tự. Lượt dở mở lại → mọi câu giữ thứ tự. Hai câu cùng số lựa chọn trong một lượt không cùng hoán vị.
- OS: 13 câu `order_sequence` của gói × 1.000 `attemptId` → kho không lần nào trùng `answer`.
- Chấm không đổi: `answer` ghi key, không ghi vị trí.
- Khoá thẻ:
  - `da-va-dat/08` q4: snail, layers, decay, found → khoá ô 1 và ô 4. Lần 2 đúng → câu đúng, 0 điểm, `answer` có 2 lần thử.
  - Explorer `/04` q4: eggs khoá.
  - Bố cục 2 hàng ở bề rộng iPhone 16e, 16 / 16 Pro, Pro Max: ô ≥ 72. iPad một hàng.
- `hint_used`: mở gợi ý q4 → q4 `points = 1`, `hint_used = true`, các câu khác `false`, tổng điểm và XP như lượt không mở. Sai rồi app tự đọc gợi ý → `false`. Câu đã xong → không ghi.
- Tổng kết:
  - Luồng Quiz → `.recap` → `.reward`, `history.json` đúng 1 bản ghi. Tắt app ở Tổng kết → bài đã lưu, mở lại là lượt mới.
  - File dở của bản cũ (bước `quiz` index 5) → `.recap` có `summary`.
  - Bài không có `word_list` → không có dải từ, không lỗi.
  - `ho-hap/01`: claim, truth, từ breathe, oxygen, chest, mục tiêu. `ho-hap/03` Na đúng. Explorer `/08` có thẻ; `/06` và `/07` không có.
- U+2011.

*Trên simulator (seed file dở để vào thẳng câu; ảnh ở `/private/tmp/claude-501/-Users-buiduyluu--claude-spares-spare-7hJEda/5730aa52-aac5-4944-a855-c98bfdd7bb76/scratchpad/iosdev/shots/ios-*.png`, chế độ Cả hai):*
- Nút gợi ý: thấy ở SC, Na, OS, biểu đồ. Mở ở SC (`ho-hap/01` q4) và câu Na (q6): mẩu giấy hiện dưới câu hỏi, đĩa vàng hoè, có nút VI. Sai còn lượt có `feedback` → mẩu gấp góc vẫn in `feedback`. Câu xong → nút ẩn giữ chỗ.
- Mở gợi ý q6 → `history.json` có q6 `hint_used = true`, `points = 1`, +10 XP như thường.
- Thứ tự lựa chọn khác thứ tự nội dung (SC `ho-hap/01` q4; kho OS).
- OS 4 thẻ 2 hàng có dải nối. Thử sai → ô 1 và ô 4 khoá (lá tre + triện), hai thẻ về kho. Lần 2 đúng → không có XP. Explorer `/04` khoá eggs.
- Biểu đồ `da-va-dat/14` q4: ba tên cột hiện ngay; khối đếm được; sai → chồng khối lõm, khối trên bong góc; đúng → lá tre + triện; nút gợi ý ẩn.
- Tổng kết, tự đọc lần lượt, thẻ đang đọc nổi lên vàng hoè:
  - Discoverer `ho-hap/01` màn 1 và màn 2 (Na lắc, câu gạch).
  - `ho-hap/03` màn 2 (Na gật, không gạch).
  - Explorer `/08` màn 1 (bong bóng đổi theo ý) và màn 2 (ảnh + lắc + hai câu).
  - Explorer `/06` màn 1 (ý 3 lấy hình "Eat both", không phải con cò) và màn 2 không thẻ (từ mới dạng hàng).
- Vào Tổng kết là file dở bị xoá, bài vào `history.json` và hàng đợi sync ngay lúc đó, chưa cần tới Thưởng.

**Chưa kiểm**
- iPad (không mở máy thứ hai; bố cục OS iPad chỉ kiểm bằng unit test), iPhone 16e và Pro Max trên máy thật hay simulator.
- Dynamic Type lớn, VoiceOver thật (thứ tự đọc, tiêu đề ẩn "Em đã học"/"Nhớ nhé"), bật giảm chuyển động trên máy.
- Nghe bằng tai: giọng dừng khi lật trang, nút VI phát VI.
- Staging `quiz_answers.hint_used` (chạy với `-SKSyncOff YES`).
- Explorer `/04` màn 1 và `/07` màn 2 trên màn (unit test có), hết lượt ở biểu đồ, câu MC/TF thường/FB có nút gợi ý (cùng nhánh code với SC).
- Đi trọn một bài từ Khởi động trên gói nhúng (lần này seed thẳng vào Quiz).
- Màn 2 Discoverer trên iPhone 16 Pro hơi cao hơn màn: thẻ mục tiêu nằm một phần dưới thanh mũi tên, phải cuộn. Explorer `/08` màn 2 cũng phải cuộn.
- Nội dung mới của content-editor (MC, FB, câu biểu đồ `da-va-dat/14`) chưa có trong gói nên chưa thấy trên màn.

**Lưu ý môi trường:** máy iPhone 16 Pro đã bật sẵn từ trước, đang mở app khác ("[STG]ISE English"), nên để máy chạy, không tắt. Đã trả `lessons/` của app về bản sao lưu và gỡ 7 lượt thử của phiên này khỏi `sync/queue.json` (các lượt được ghi khi `-SKSyncOff YES`, nên chưa lên staging).

**Đề xuất cho vùng khác**
- tester: chuyển vector vàng của `SeededOrder` và bảng 34 bài hình thẻ ý chính sang `packages/content-schema/test-vectors/` để Android dùng chung. Hiện hai bộ này nằm trong `QuizWaveOneTests.swift`.
- designer:
  - Token chữ thiếu 18/600 và 18/700. Cân nhắc thêm token hoặc chốt dùng `itemTitle` / `sentence`.
  - Màn 2 Tổng kết cao hơn 844 khi chạy với token hiện có. Xem có cần thu gọn không.
  - Xem mặt Na ghép (43 pt trong khung 72) trên máy thật.

### ios-dev 15/11 · lượt sửa 2, bước A (theo "designer 15/11 · rà bản dựng iOS" và fixture bài 1 mới)

Chỉ sửa code và test; `build-for-testing` (generic iOS Simulator) thành công, 0 cảnh báo. **Chưa chạy unit test, chưa chụp màn**: để bước B, sau khi có gói mới.

**Phải sửa (7/7)**
1. Thẻ ý sai → ý đúng Discoverer (`RecapStep.mythCard`):
   - Phần trên lề 8/6/14/76, mặt Na 72, khe 10.
   - Phần dưới lề 18/14/12/14. "Cả hai": phải 80, cao tối thiểu 58.
   - Cột [nghe][VI] ghim vào mép nối bằng `VerticalAlignment.recapSeam`: nút nghe kết thúc 2 pt trên mép, VI bắt đầu 2 pt dưới mép, cách phải 10. Bỏ cột nút khỏi phần dưới.
   - Mũi tên tròn cách trái 27 (tâm thẳng mặt Na), mũi tên 18.
   - VoiceOver: cột nút đọc sau chữ (`accessibilitySortPriority(-1)`).
2. Ô từ mới (Discoverer và Explorer, `wordGrid`, `wordCell`):
   - Số cột bằng số từ (tối đa 4, nhiều hơn thì xuống hàng), khe 10, đệm 6.
   - Ảnh Discoverer bằng 3/4 bề rộng trong của ô, tối đa 80. Ảnh Explorer cao 72, ô bo 18, ảnh bo 12.
   - Bỏ loa nhỏ.
   - Chữ từ tính cỡ bằng `WordFit`, đo bề rộng thật bằng font Phudu của `title`:
     - Một chữ: một dòng, thu nhỏ vừa đủ.
     - Cụm nhiều chữ: một dòng nếu thu tới 0,8 là vừa; không thì 2 dòng ngắt ở dấu cách, thu đủ để chữ dài nhất vừa một dòng.
     - Không cắt "…", không ngắt giữa chữ.
   - **Lệch canvas:** sàn thu nhỏ của từ một chữ là 0,5, không phải 0,6. Đo bằng CoreText (Phudu 900, 21 pt): "CARBOHYDRATE" rộng 131 pt. Ô 4 cột còn 66,8 pt (máy 390) và 69,8 pt (16 Pro), nên cần 0,51 và 0,53; ở 0,6 sẽ bị cắt "…".
   - Các từ khác vừa ở 0,6 trở lên: "PALAEONTOLOGIST" 3 cột cần 0,6 (91,9 pt trong 96,3 pt); "SEA SPONGE" và "PACIFIC OCEAN" theo luật cụm.
3. Thẻ "I can…" Discoverer: "Cả hai" lề 8/14/4/10, chế độ khác 10/14/10/10, triện `Seal` medium 28.
4. Khe giữa các khối Màn 2 là 12 (`Tokens.Layout.sectionGap`), nhãn tới ô từ 10. Áp cho Discoverer và Explorer.
5. Thẻ ý sai Explorer (`explorerMythCard`):
   - Ảnh cao 120, bo 14.
   - Huy hiệu lắc 64 ở góc dưới trái, cách 10.
   - [VI 72][nghe 72] ghim góc dưới phải ảnh, cách 8, khe 4.
   - Hai câu dưới ảnh dùng hết bề rộng, lề 10/10/8, khe 4.
   - Không có ảnh: [lắc][hai câu][nút] một hàng.
   - VoiceOver: huy hiệu, hai câu, rồi nút. Ảnh ẩn với VoiceOver.
6. Thẻ mục tiêu Explorer: [triện 42][chữ `itemTitle`][VI 72][nghe 72] một hàng, lề 10/14/10/10. Thêm cỡ `Seal.Size.goal` (42, dấu tích 25) và `.row` (32, dấu tích 19) vào `DesignSystem` (`Seal.swift`, `PaperMetrics.swift`).
7. Kiểm trên simulator: để bước B.

**Nên sửa (4/4)**
1. Hàng câu hỏi căn trên: chữ đệm trên 15 (`DiscovererMetrics.promptTopInset`). Hàng lời Na (`SpeakerLine`) căn trên. Hàng câu điền từ giữ căn giữa (không nằm trong danh sách rà).
2. `order_sequence` đúng cả câu: lớp lá tre lệch (`shadow.offset_correct`) dưới cả dải và một triện 32 ở góc trên phải dải; thẻ trong ô không còn triện riêng hay viền lá tre. Lúc thử lại, thẻ khoá vẫn giữ lá tre và triện 28.
3. Biểu đồ đúng: triện 28 ở góc trên phải khối trên cùng (lệch 7, −8), đè mép.
4. Khe mũi tên một hàng trên iPhone 28 → 32 (`OrderLayout.arrowGapOneRow`).

**Test sửa theo fixture bài 1 mới** (q2 "Food gives us {1}, like protein and fat.", `q2_nutrients`)
- `LessonSessionTests` (`ScoringItem` của q2) và `ContentModelTests` (`segmentsEN`, kho, `BankWordImage`) đổi theo danh sách của dev.
- `FillBlankSentenceTests`: test "chạm dấu chấm" đổi thành "chạm dấu phẩy" (`wordBeforePunctuation`), giữ ý kiểm từ dính dấu câu. Dùng luôn câu của fixture, không dựng câu riêng.
- Cũng trong `FillBlankSentenceTests`: "chất dinh dưỡng" có 2 dấu cách không ngắt; câu trống EN mới; chú thích đầu file.
- Thêm `WordFitTests` (4 test) trong `QuizWaveOneTests.swift`.

**File đổi thêm ở lượt này**
- `apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/RecapStep.swift`, `Views/DiscovererQuestionStep.swift`, `Views/ExplorerOrderSequence.swift`.
- `Sources/DesignSystem/Components/Seal.swift`, `Components/PaperMetrics.swift`.
- Test: `LessonPlayerTests/QuizWaveOneTests.swift`, `LessonPlayerTests/LessonSessionTests.swift`, `LessonPlayerTests/FillBlankSentenceTests.swift`, `ContentModelTests/ContentModelTests.swift`.

**Còn lệch canvas:** SwiftUI `strikethrough` không đặt được độ dày 1,5 pt; dùng độ dày mặc định của font.

### ios-dev 15/11 · lượt sửa 2, bước B (gói `ceeb1eb6912a`)

**Gói và cài đặt.** Build có dòng `Content pack embedded from …/content/.build/pack (13463 files)`. Cài lên iPhone 16 Pro (simulator đang chạy, iOS 18.4). `pack/catalog/v1/manifest.json` trong app container cho `content_version` `ceeb1eb6912a`, 10 chủ đề, 13463 file.

**Unit test, chạy một lần** (`test-without-building -skip-testing:ScienceKidsUITests`): **400 test, 399 pass, 1 fail, 0 skip.**
- Test fail: `RecapTests.mythCardsOfTheTicketLessons`. Test viết cứng 3 từ mới của `ho-hap/01` (breathe, oxygen, chest); gói mới có thêm `gills`. App không sai.
- Đã sửa kỳ vọng thành 4 từ và chạy `build-for-testing` lại (thành công). Không chạy lại test, theo quy ước một lần.
- Lần chạy này gồm: `WordFitTests`, `StaleProgressTests`, các test sửa theo fixture bài 1 mới (đều pass), và test dùng gói mới (xáo OS trên 13 câu, bảng hình thẻ ý chính 59 bài, đều pass).

**Ảnh chụp** (chế độ "Cả hai"), trong `/private/tmp/claude-501/-Users-buiduyluu--claude-spares-spare-7hJEda/5730aa52-aac5-4944-a855-c98bfdd7bb76/scratchpad/iosdev/shots-b/`:

*Tổng kết Màn 2:* cả ba màn **không còn cuộn**, thẻ mục tiêu hiện hết trên thanh mũi tên.

| Ảnh | Bài | Phần trống còn lại (ước theo ảnh) |
| --- | --- | --- |
| `ios-r-d2-a-ho-hap-01.png` | `ho-hap/01`, 4 từ, có gills | ≈ 100 pt dưới thẻ mục tiêu |
| `ios-r-d2-a-nod-ho-hap-03.png` | `ho-hap/03` | ≈ 120 pt |
| `ios-r-x2-a-explorer-08.png` | Explorer `/08` | ≈ 85 pt |

- Với cả ba: cột [nghe][VI] ghim ở mép nối; "SEA SPONGE" một dòng, không bị cắt.
- `ios-r-d1-a-ho-hap-01.png`: Màn 1, thẻ ý 2 đang đọc.

*Biểu đồ `da-va-dat/14` q4:*
- `ios-c-ask-da-va-dat-14.png`: câu mới "Which soil let the most water through?", ảnh `explore_setup`, khối đếm được, tên cột hiện sẵn, câu hỏi căn trên.
- `ios-c-right-da-va-dat-14.png`: chọn đúng "sandy soil", triện 28 ở góc khối trên cùng.
- Ảnh `explore_setup` hiện như một hình vuông nhỏ giữa nền giấy lõm, chưa phủ hết bề ngang khung. designer xem lại cách cắt.

*MC đổi số đáp án đúng:* `ho-hap/04` q3, 2 → 3 đúng.
- `ios-mc-ho-hap-04-q3.png`: lựa chọn đã xáo.
- `ios-mc-ho-hap-04-q3-chosen.png`: chọn đủ 3 thẻ.
- `ios-mc-ho-hap-04-q3-right.png`: đúng, +10 XP.

**Điểm 4 của dev: lượt học dở từ gói cũ trỏ tới key đã bỏ**
- **Trước khi sửa (đọc code):**
  - Không crash.
  - Câu có lần thử không còn hợp nội dung (`q2_energy`, lựa chọn MC cũ, thẻ OS cũ, quá số lượt) thì engine từ chối. `status` coi câu đó là "đã xong, sai" dù bé chưa được hỏi lại.
  - `finish()` bỏ câu đó, nên lượt không bao giờ tính là hoàn thành và mất sao.
- **Đã sửa:** `LessonSession.reconciled`, chạy khi mở lại lượt dở.
  - Câu nào có lần thử bị engine từ chối thì bỏ lần thử và `hint_used` của câu đó; câu mở lại từ đầu.
  - Lượt đang đứng sau câu Quiz đó thì lùi về câu mở lại đầu tiên.
  - Lần thử của key câu không còn tồn tại, món ăn của mâm và nhóm Học không còn tồn tại cũng bị bỏ.
  - Lần thử còn hợp thì giữ nguyên.
  - Mỗi lần bỏ đều ghi log.
- **Kiểm:**
  - Unit test `StaleProgressTests` (pass trong lần chạy trên): file dựng tay có `q2_energy`, lựa chọn MC đã bỏ, key câu `q9` không còn, `w1_old`, món ăn và nhóm Học đã bỏ. Kết quả: không crash; lùi về q2; q2, q5, w1 mở lại; q1 và q3 giữ nguyên; lượt hoàn thành 6/6.
  - Trên simulator: file `in_progress` dựng tay cho bài 1 *Ăn uống lành mạnh* (đứng ở q4, q2 = `q2_energy`, bản sao `stale-in-progress-lesson1.json`). Mở bài thì vào thẳng q2 với kho mới (nutrients, sunlight, air), file lưu lại không còn q2 và `hints_used`, log ghi `saved tries no longer fit the content, questions open again: q2`. Ảnh `ios-stale-q2-energy-reopened.png`.

**File đổi ở bước B**
- `apps/ios/Packages/SKKit/Sources/LessonPlayer/LessonSession.swift` (`reconciled`).
- `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/QuizWaveOneTests.swift` (`StaleProgressTests`, kỳ vọng 4 từ).

**Thấy thêm, không thuộc ios-dev**
- Bài 1 *Ăn uống lành mạnh* q2: ba thẻ từ (nutrients, sunlight, air) đang hiện hình thay thế. Gói chưa có ảnh cho các thẻ này. Cần designer hoặc phiên chính chạy `images` cho bài này.

**Dọn máy:** đã tắt app Science Kids, trả `lessons/` và `sync/` của app về bản trước bước B. Máy iPhone 16 Pro để chạy (app khác của Duy).

## content-editor 15/11 · bàn giao

Làm đủ 6 việc ở mục content-editor. Chỉ sửa `content/**/*.md` và `content/TEMPLATE.md`; không sửa `content/rules.json`, `apps/`, `tools/`. Không chạy lệnh nào (chưa `validate`). Không đổi dòng `id:` nào. Mọi chữ mới là nháp AI, có dòng `> SK-047 (15/11, nháp AI): …` ngay dưới chỗ đổi. Chưa commit.

### 1. MC sau sửa

Luật: trong chủ đề, không số đáp án đúng nào vượt max(1, floor(0,5 × n)). Câu hướng dẫn giữ "Pick all the right answers." · "Chọn tất cả đáp án đúng". Lựa chọn sai thành đúng thì bỏ `feedback`; đúng thành sai thì có `feedback` (SK-044). Giải thích có "both" · "cả hai" đã rà, không còn câu nào sai số.

| Chủ đề | Câu MC | 1 đúng | 2 đúng | 3 đúng | Giới hạn | Câu đã đổi (số đáp án đúng cũ → mới) |
| --- | --- | --- | --- | --- | --- | --- |
| be-mat-trai-dat | 5 | 1 | 2 | 2 | 2 | 01 q3 (2→1), 02 q3 (2→3), 05 q3 (2→3) |
| khung-long | 5 | 1 | 2 | 2 | 2 | 01 q3 (2→3), 05 q3 (2→1) |
| ho-hap | 4 | 1 | 2 | 1 | 2 | 03 q3 (2→1), 04 q3 (2→3) |
| nao-bo-va-giac-quan | 4 | 1 | 2 | 1 | 2 | 01 q3 (2→1), 04 q3 (2→3) |
| thoi-tiet-va-thien-tai | 5 | 1 | 2 | 2 | 2 | 02 q3 (2→3), 03 q3 (2→3), 05 q3 (2→1) |
| da-va-dat | 15 | 1 | 7 | 7 | 7 | 07 q3 (2→3), 09 q3 (2→3), 10 q3 (2→1), 14 q3 (2→3) |
| an-uong-lanh-manh | 2 | 0 | 1 | 1 | 1 | không đổi |
| **Tổng** | **40** | **6** | **18** | **16** | | **16 câu** |

*Đá và đất* đang chạm giới hạn ở cả hai đúng và ba đúng (bảy trên mười lăm). Đổi thêm câu MC nào của chủ đề này thì phải đổi sang một đáp án đúng.

### 2. 37 câu FB ở Quiz (câu Từ mới)

Từ trong chỗ trống là một từ `tier: core` của bài (có trong `word_list.term_keys`). Kho 3 thẻ cùng là danh từ; mọi thẻ có hình; mọi thẻ sai có `feedback`. **19 câu dev báo đã sửa: 16 câu đổi câu (đánh dấu *đổi*), 3 câu giữ câu và nâng từ lên core (đánh dấu *nâng*).** 18 câu còn lại đạt sẵn, không đổi.

| Chủ đề | Bài · câu: từ trong chỗ trống |
| --- | --- |
| be-mat-trai-dat (6) | 01 q2: model · 02 q1: oceans *đổi* · 03 q2: core · 04 q2: magma, lava · 05 q2: plates *đổi* · 05 q4: shakes, tsunami |
| ho-hap (5) | 01 q2: gills *nâng* · 02 q2: nose, windpipe · 03 q2: breaths *nâng* (từ `breath`) · 04 q2: smoke *đổi* · 04 q5: dust *đổi* |
| nao-bo-va-giac-quan (4) | 01 q2: brain · 02 q1: messages · 03 q2: senses *đổi* · 04 q2: strap |
| thoi-tiet-va-thien-tai (5) | 01 q2: clouds *đổi* · 02 q2: rain gauge *đổi* · 03 q2: storm *đổi* · 04 q2: drought *đổi* · 05 q2: warning *đổi* (giữ câu, đổi nhãn thẻ đúng "news" thành "warning", giữ key `q2_news`) |
| da-va-dat (15) | 01: materials · 02: grains · 03: scratch · 04: minerals · 05: permeable · 06: limestone · 07: crack · 08: sediment · 09: palaeontology *đổi* · 10: evidence · 11: clay *nâng* · 12: alluvial soil *đổi* · 13: climate · 14: fair test *đổi* · 15: geology *đổi* (đều là q2) |
| an-uong-lanh-manh (2) | 01 q2: nutrients *đổi* · 02 q2: meal *đổi* |
| khung-long (0) | không có câu FB (thêm FB thuộc Đợt 2) |

Chọn nâng hay đổi (theo ghi chú phiên chính 15/11):
- **Nâng lên core, thêm vào `term_keys`:**
  - `ho-hap/01` gills: giữ câu và ba thẻ cá, vì hai hình cá là hình gốc của hai bài Explorer.
  - `ho-hap/03` breath: thở là ý chính của bài.
  - `da-va-dat/11` clay: bài 12 tới 14 dùng tiếp từ này.
  - Cả ba bài nay có bốn từ core, trong ngân sách ba đến bốn của Discoverer.
- **Đổi sang một từ core có sẵn:** 16 câu còn lại.
  - `an-uong-lanh-manh/01` không nâng "energy", vì bài đã có bốn từ core.
  - `ho-hap/04` q2 không thêm "oxygen" làm từ mới, vì đó là từ của bài một. Câu đổi sang "smoke".

Mười câu đạt nhờ luật nhận dạng số nhiều thêm "-s" của dev: oceans, plates, senses, clouds, breaths, nutrients, messages, grains, materials, minerals.

### 3. Câu đã đổi (bài, key, trường)

Mọi câu đổi đáp án hoặc lựa chọn đã tăng `version` (v2; riêng `da-va-dat/14` q4 lên v3). Ba bài nâng từ core chỉ đổi `tier` và `word_list.term_keys`, không đổi câu nào.

**be-mat-trai-dat**
- 01: q3 v2, `q3_forest` → `q3_lake` (sai) + `label`, `feedback`, `explanation_correct`. `hint` của w2 và q6.
- 02:
  - q1 v2: FB mới; thẻ `q1_oceans`, `q1_continents`, `q1_islands` (thay ba thẻ cũ); đổi `sentence`, `label`, `feedback`, `hint`, `explanation_*`, `image.alt` của câu.
  - q3 v2: `q3_africa` → `q3_atlantic` (đúng), `label`.
  - `hint` của w2 và q6.
- 03: `hint` của q6.
- 04: `hint` của w2 và w3.
- 05:
  - q2 v2: FB mới; thẻ `q2_plates`, `q2_waves`, `q2_volcanoes`; đổi `sentence`, `label`, `feedback`, `hint`, `explanation_*`.
  - q3 v2: `q3_window` → `q3_leg` (đúng), `label`, `explanation_correct`.
  - `hint` của w3 và q6.

**khung-long**
- 01: q3 v2, `q3_buffalo` → `q3_frog` (đúng), `label`, `explanation_*`. `hint` của w2.
- 02: `explanation_correct` của q6.
- 03: `hint` của q6.
- 04: `hint` của w3; `hint` và `explanation_correct` của q6.
- 05: q3 v2, `q3_croc` → `q3_pterosaur` (sai), `label`, `feedback`, `explanation_*`. `hint` của w2, w3, q6.

**ho-hap**
- 01: từ `gills` extra → core, thêm vào `term_keys`. `hint` của w2.
- 02: `hint` của q6.
- 03: từ `breath` extra → core, thêm vào `term_keys`. q3 v2, `q3_bike` → `q3_crayons` (sai), `label`, `feedback`, `explanation_*`. `hint` của q5 và q6.
- 04:
  - q2 v2: FB "smoke"; thẻ `q2_dust` bỏ, thêm `q2_fresh_air`; đổi `sentence`, `label`, `feedback`, `hint`, `explanation_*`.
  - q3 v2: `q3_park` → `q3_coal` (đúng), `label`, `explanation_*`.
  - q5 v2: FB "dust"; thẻ `q5_dust`, `q5_smoke`, `q5_oxygen`; đổi `sentence`, `label`, `feedback`, `hint`, `explanation_*`, hình câu hỏi.
  - `hint` của q6.

**nao-bo-va-giac-quan**
- 01: q3 v2, `q3_sweat` → `q3_puzzle` (sai), `label`, `feedback`, `explanation_*`. `hint` của q6.
- 02: `hint` của q6.
- 03: q2 v2, `q2_nerves` → `q2_senses`, `sentence`, `label`, `explanation_*`. `hint.vi` của q6.
- 04: q3 v2, `q3_games` → `q3_strap` (đúng), `label`, `explanation_wrong`. `hint` của w3 và q6.

**thoi-tiet-va-thien-tai**
- 01: q2 v2, `q2_water` → `q2_clouds`, `sentence`, `label`, `feedback` (thẻ khói), `hint`, `explanation_*`, hình câu hỏi. `hint` của q6.
- 02:
  - q2 v2: FB "rain gauge"; thẻ `q2_rain_gauge`, `q2_umbrella`, `q2_flask`; đổi `sentence`, `label`, `feedback`, `hint`, `explanation_*`, hình câu hỏi.
  - q3 v2: `q3_clock` → `q3_ribbon` (đúng), `label`, `explanation_wrong`.
  - `hint` của w2.
- 03:
  - q2 v2: FB "storm"; thẻ `q2_storm`, `q2_sunny`, `q2_rainbow`; đổi `sentence`, `label`, `feedback`, `hint`, `explanation_*`, `image.alt` của câu.
  - q3 v2: `q3_umbrella` → `q3_radio` (đúng), `label`, `explanation_wrong`.
  - `hint` của w2, q5, q6.
- 04: q2 v2, FB "drought"; thẻ `q2_drought`, `q2_flood`, `q2_storm`; đổi `sentence`, `label`, `feedback`, `hint`, `explanation_*`, hình câu hỏi. `hint` của q5 và q6.
- 05: q2 v2, `label` của `q2_news` ("warning" · "tin cảnh báo"), `explanation_*`. q3 v2, `q3_bring` → `q3_window` (sai), `label`, `feedback`, `explanation_wrong`. `hint` của q6.

**da-va-dat**
- 02: `hint` của w2; `explanation_correct` của q6.
- 03: `hint` của q6.
- 05: `hint` của w2.
- 07: q3 v2, `q3_stream` → `q3_banyan` (đúng), `label`. `hint` và `explanation_correct` của q6.
- 09: q2 v2, `q2_fossils` → `q2_palaeontology`, `sentence`, `label`, `hint`, `explanation_*`. q3 v2, `q3_brick` → `q3_footprint` (đúng), `label`, `explanation_*`. `hint` của w2 và q6.
- 10: q3 v2, `q3_museum` → `q3_climb` (sai), `label`, `feedback`, `explanation_*`. `hint` của q6.
- 11: từ `clay` extra → core, thêm vào `term_keys`.
- 12: q2 v2, `q2_silt` → `q2_alluvial` (chỗ trống chuyển sang "alluvial soil"), `label`, `hint`, `explanation_*`. `hint` của q6.
- 13: `hint` của q6.
- 14:
  - q2 v2: FB "fair test"; thẻ `q2_fair_test`, `q2_result`, `q2_chart`; đổi `sentence`, `label`, `feedback`, `hint`, `explanation_*`.
  - q3 v2: `q3_drips` → `q3_bottles` (đúng), `label`, `explanation_*`.
  - q4 v3: `prompt` "Which soil let the most water through?" · "Đất nào cho nhiều nước chảy qua nhất?", `chart.unit` "cups of water caught in one minute" · "số cốc nước hứng được trong một phút", `hint`, `explanation_*`, hai `feedback`, hình câu hỏi `explore_setup`. `#### option` và `#### bar` giữ nguyên, đáp án vẫn là cột đất cát.
- 15: q2 v2, FB "geology"; thẻ `q2_geology`, `q2_palaeontology`, `q2_fieldwork`; đổi `sentence`, `label`, `feedback`, `hint`, `explanation_*`. `hint` của q6.
- 01, 04, 06, 08: chỉ sửa ghi chú vị trí đáp án.

**an-uong-lanh-manh** (hai bài chưa qua lượt viết lại A2)
- 01:
  - q2 v2: `q2_energy` → `q2_nutrients`; đổi `sentence`, `label`, `feedback`, `explanation_*`.
  - q6: `instruction` đổi "spot the mistake" sang nhãn trung tính của TEMPLATE; đổi `hint`.
- 02:
  - Bỏ "Yes!" · "Đúng rồi!" ở `explanation_correct` của w2, q1, q3, q5.
  - q2 v2: FB "meal"; thẻ `q2_meal`, `q2_dessert`, `q2_sweet`; đổi `sentence`, `label`, `feedback`, `hint`, `explanation_*`.
  - q6: đổi `instruction`, `hint`, `explanation_correct`.

**Explorer:** không đổi chữ nào bé đọc hay nghe; chỉ đổi ghi chú.

### 4. Hình cho designer

**Hình mới: một hình.**
- `thoi-tiet-va-thien-tai/03` thẻ `q2_rainbow`.
- Loại: hình vẽ cùng nét với hình vẽ ô Bão và món nắng của kệ Chơi.
- Nội dung: một cầu vồng cong trên cánh đồng lúa sau cơn mưa; trời còn vài đám mây xám; cây đứng yên, không có gió mạnh; không có người, không có chữ.
- Nếu hai thẻ kia là ảnh chụp thì dùng ảnh cầu vồng CC0, PD hoặc CC BY (từ khoá: rainbow over rice field after rain). Không dùng ảnh AI, không lấy ảnh Pinterest.

**Key mới dùng lại hình có sẵn.** Không cần tìm hình. Designer thêm mục vào file chọn ảnh của chủ đề, trỏ tới cùng ảnh (nguồn ghi ở `image.brief` từng thẻ):
- be-mat-trai-dat:
  - 01 `q3_lake`.
  - 02 `q1_oceans` (`tray_pacific`), `q1_continents` (`explore_continents`), `q1_islands` (`tray_island` bài một), `q3_atlantic`.
  - 05 `q2_plates` (`explore_plates`), `q2_waves` (từ `wave`), `q2_volcanoes` (`q1_lava`), `q3_leg`.
- khung-long: 01 `q3_frog` (`tray_frog`) · 05 `q3_pterosaur` (tranh kệ Chơi bài hai).
- ho-hap:
  - 03 `q3_crayons`.
  - 04 `q2_fresh_air` (hình kệ, cũng là hình từ `fresh_air`), `q3_coal` (`tray_coal`), `q5_dust`, `q5_smoke`, `q5_oxygen`. Hình câu hỏi q5 là `q1_sleeping` của `ho-hap/tho-khi-chay-nhay`.
- nao-bo-va-giac-quan: 01 `q3_puzzle` (`tray_puzzle`) · 03 `q2_senses` (hình từ `sense`) · 04 `q3_strap` (`tray_strap`).
- thoi-tiet-va-thien-tai:
  - 01 `q2_clouds` (`tray_dark` bài ba); hình câu hỏi q2 là `tray_puddle`.
  - 02 `q2_rain_gauge` (`explore_rain_gauge`), `q2_umbrella` (`tray_umbrella`), `q2_flask` (`tray_flask`), `q3_ribbon`; hình câu hỏi q2 là `q1_rain` bài núi lửa.
  - 03 `q2_storm` (`explore_storm`), `q2_sunny` (`tray_sun`), `q3_radio` (`q2_news` bài năm).
  - 04 `q2_drought` (`tray_dry_pond`), `q2_flood` (`tray_river_over`), `q2_storm` (`explore_storm` bài ba); hình câu hỏi q2 là `q1_rain`.
  - 05 `q3_window` (`tray_window`).
- da-va-dat:
  - 07 `q3_banyan`.
  - 09 `q2_palaeontology` (`palaeontologist` bài khung-long ba), `q3_footprint` (`tray_rock_print`).
  - 10 `q3_climb`.
  - 12 `q2_alluvial`: ảnh bùn mịn của thẻ cũ `q2_silt`, không dùng ảnh `alluvial_soil` vì đó là lựa chọn của câu w3.
  - 14 `q2_fair_test` (`explore_fair`), `q2_result` (`explore_results`), `q2_chart` (hình từ `data`), `q3_bottles` (`tray_same_bottles`); hình câu hỏi q4 là `explore_setup`.
  - 15 `q2_geology` (`geologist` bài bốn), `q2_palaeontology`, `q2_fieldwork` (`magnifying_glass` bài hai).
- an-uong-lanh-manh: chủ đề chưa có file chọn ảnh. Khi làm file, thêm 01 `q2_nutrients` và 02 `q2_meal`, `q2_dessert`, `q2_sweet`. Hình `nutrient` vẫn là brief kiểu cũ, chưa theo luật SK-033.

Key đã bỏ (designer gỡ khỏi file chọn ảnh nếu `images fetch` báo key thừa): các thẻ FB cũ của 16 câu đổi, và lựa chọn MC cũ của 16 câu đổi (`q3_forest`, `q3_africa`, `q3_window` của be-mat-trai-dat/05, `q3_buffalo`, `q3_croc`, `q3_bike`, `q3_park`, `q3_sweat`, `q3_games`, `q3_clock`, `q3_umbrella`, `q3_bring`, `q3_stream`, `q3_brick`, `q3_museum`, `q3_drips`).

Nhờ designer xem: `thoi-tiet-va-thien-tai/02` q2 có ba thẻ cùng kiểu hình chưa (hình vẽ hay ảnh). Lệch thì báo.

### 5. Chữ cần sinh lại giọng

- Gồm mọi chuỗi `.en` và `.vi` của các trường ghi ở mục 3: `sentence`, `label`, `feedback`, `hint`, `explanation_correct`, `explanation_wrong`, `prompt` và `chart.unit` (`da-va-dat/14` q4), `instruction` (câu q6 của hai bài *Ăn uống lành mạnh*; chữ này giống hệt các bài khác).
- Explorer không có chữ nào cần sinh lại.
- Ba từ nâng core (gills, breath, clay) không đổi chữ. Nếu `tts` trước đây không sinh clip cho từ `extra` thì nay cần sinh, vì ba từ này có trong dải Từ mới.

### 6. `hint` TF và `explanation_correct` câu 6 đã sửa

**`hint` TF: sửa 46 trên 92 câu** (EN và VI, trừ `nao-bo-va-giac-quan/03` q6 chỉ sửa VI).
- Chuẩn sửa: gợi ý trỏ tới một ô, thẻ hay vật mà tên hoặc câu của nó chính là phán quyết; hoặc gợi ý là câu hỏi (có/không hay hỏi thẳng) mà câu trả lời quyết định đáp án.
- Gợi ý mới trỏ tới bằng chứng, một cảnh quen, hoặc cách nghĩ. Gợi ý nào đã trỏ bằng chứng thì giữ.

| Chủ đề | Câu đã sửa `hint` |
| --- | --- |
| be-mat-trai-dat | 01 w2, q6 · 02 w2, q6 · 03 q6 · 04 w2, w3 · 05 w3, q6 |
| khung-long | 01 w2 · 03 q6 · 04 w3, q6 · 05 w2, w3, q6 |
| ho-hap | 01 w2 · 02 q6 · 03 q5, q6 · 04 q6 ("Remember the Tiny dust card." → "Think of a sunbeam shining into a dark room.") |
| nao-bo-va-giac-quan | 01 q6 · 02 q6 · 03 q6 (VI) · 04 w3, q6 |
| thoi-tiet-va-thien-tai | 01 q6 · 02 w2 · 03 w2, q5, q6 · 04 q5, q6 · 05 q6 |
| da-va-dat | 02 w2 · 03 q6 · 05 w2 · 07 q6 · 09 w2, q6 · 10 q6 · 12 q6 · 13 q6 · 15 q6 |
| an-uong-lanh-manh | 01 q6 · 02 q6 |

Ngoài TF, cũng theo chuẩn trên, sửa thêm `hint` của sáu câu FB vừa viết (`be-mat-trai-dat/02` q1, `/05` q2, `ho-hap/04` q2 và q5, `da-va-dat/09` q2, `/15` q2), vì nút gợi ý mở được trước khi trả lời. Gợi ý cũ của các câu này hỏi thẳng từ cần điền, hoặc có chữ gần như chữ của thẻ đúng (geologist, geology).

**`explanation_correct` câu 6 Discoverer: sửa 5 câu.** Các câu đã sửa nay đứng riêng được trên thẻ "Ý sai → Ý đúng":
- `khung-long/02`: "Flying reptiles flew, but dinosaurs lived on land." Trước đây câu mở bằng "It".
- `khung-long/04`: "T. rex ate meat, but many dinosaurs ate plants." Câu cũ chỉ nói chỗ sai của lập luận.
- `da-va-dat/02`: câu cũ cần hình hai hòn đá bên cạnh mới hiểu; câu mới tự đứng được.
- `da-va-dat/07`: "Erosion starts only when the broken bits are carried away." Bỏ "It".
- `an-uong-lanh-manh/02`: "One food alone cannot give every nutrient we need." Gộp hai câu thành một.

35 câu Na còn lại đã đạt: không có "Yes!", "Đúng rồi!" hay "Na chưa đúng", và mỗi câu tự nói ý đúng. Explorer: rà tám câu q6 `true_false` đáp án Sai (`goi-ten-va-nhom-dong-vat/04`, `/08`; `sinh-vat-song-o-dau/03`, `/05`, `/06`; `chuoi-thuc-an/01`, `/02`, `/04`), không câu nào phải sửa.

### 7. Việc 4: bỏ cân vị trí đáp án

- `_topic.md` của tám chủ đề:
  - Bảng và luật vị trí ghi "hết hiệu lực 15/11 (SK-047, app xáo)".
  - Ba chủ đề Explorer giữ một bảng nhỏ ghi thứ tự đúng của các câu `order_sequence`, để tra.
  - `da-va-dat/_topic.md` giữ phần số lựa chọn của mục cũ, và thêm luật MC cùng luật câu Từ mới.
  - `chuoi-thuc-an/_topic.md`: luật "không đặt thẻ chuột ở giữa" ghi hết hiệu lực.
- Dòng "Vị trí đáp án đúng" trong Ghi chú cho dev của 40 bài Discoverer và 19 bài Explorer: đều ghi hết hiệu lực. Grep "Vị trí đáp án đúng" trong `content/` nay chỉ còn hai loại dòng: dòng ghi hết hiệu lực, và tiêu đề mục `### Vị trí đáp án đúng` mà ngay dòng dưới ghi hết hiệu lực.
- Còn lại khoảng mười lăm ghi chú lịch sử trong từng câu, kiểu "Thẻ đúng ở chỗ thứ ba (bảng vị trí)" (ví dụ `da-va-dat/02`, `/03`, `/06`, `/07`, `/08`, `/09`, `ho-hap/03`). Tôi giữ chúng làm lịch sử, không còn hiệu lực. PM muốn xoá thì báo.
- `content/TEMPLATE.md` có mục mới "Thứ tự trên màn, câu nhiều đáp án, câu Từ mới, gợi ý (SK-047)", áp cho mọi nhóm tuổi, gồm năm luật:
  - `hint`, `feedback` và giải thích không nhắc vị trí thẻ.
  - Nhãn không dựa vào thẻ đứng cạnh.
  - Luật phân bố MC.
  - Câu Từ mới dùng từ `tier: core`.
  - `hint` không được gần như nói đáp án, và câu 6 có `explanation_correct` đứng riêng được.
  - Luật Explorer số 6 trỏ sang mục này.

**Lựa chọn mà nghĩa phụ thuộc thứ tự (báo PM).** Không có câu nào hỏng khi xáo:
- `khung-long/01` q4: ba lựa chọn từng xếp theo thời gian (trước, cùng, sau). Nhãn tự nói thời điểm, nên xáo vẫn đọc được.
- `be-mat-trai-dat/01` q5: lựa chọn "cả hai như nhau" so hai vật trong câu hỏi, không so hai thẻ bên cạnh.
- `da-va-dat/04` q4: nhãn tả cả chuỗi (mềm trước, lẫn lộn, cứng trước), không dựa vào chỗ thẻ.
- `ho-hap/03` q4 và `thoi-tiet-va-thien-tai/02` q4: nhãn "cột bên trái", "ống ở giữa" là vị trí **trong hình**. Mỗi lựa chọn là cả hình với một cột được tô, nên vẫn đúng khi xáo.
- Explorer `chuoi-thuc-an/03` q4: câu hỏi đọc "Rice, mouse, owl". Khoảng một lần trong ba lượt, thẻ chuột sẽ nằm giữa, và bé có thể chọn theo chỗ. Câu vẫn dùng được. Nếu PM muốn chặt hơn thì đổi lời hỏi ở Đợt 2.
- Explorer `chuoi-thuc-an/02` q6: câu khẳng định cần hình mới hiểu trọn. Thẻ Tổng kết Explorer có hình, nên không sao.

### 8. Chưa chắc · đề xuất

1. **Tiêu chí nghiệm thu cần PM sửa:** dải Từ mới của `ho-hap/01` nay là breathe, oxygen, chest, gills (bốn từ). Mục "Bài dùng để kiểm" và tiêu chí Tổng kết màn 2 của ios-dev và tester đang ghi ba từ.
2. Số câu sửa `hint` TF là 46/92, nhiều hơn mức "chỉ câu gần lộ". Lý do: phần lớn gợi ý cũ trỏ đúng ô Học có tên hoặc câu là lời bác bỏ. Gợi ý đó hợp khi nó chỉ hiện sau lần sai, nhưng nay bé mở được trước. Duy bỏ được: gợi ý cũ vẫn còn trong lịch sử git.
3. Hai bài *Ăn uống lành mạnh* chưa qua lượt viết lại A2. Tôi chỉ làm phần ticket nêu.
   - `explanation_wrong` còn "Na is not right." · "Na chưa đúng" (tester R13 dặn giữ tới khi Duy nghe clip), và `01` q3 còn "The answer is …".
   - Tôi có đổi nhãn `instruction` q6 của hai bài sang nhãn trung tính. Việc này ngoài danh sách của ticket, nhưng nhãn cũ "spot the mistake" báo trước Na sai.
   - Đề xuất một lượt A2 riêng cho hai bài này.
4. `[CẦN KIỂM]` mới:
   - `khung-long/01` q3: ếch đã có từ thời khủng long (nói theo nhóm).
   - `ho-hap/04` q5: chăn để lâu bám bụi, giũ chăn làm bụi bay lên, nên giũ ngoài trời.
   - `ho-hap/04` q3 `q3_coal`: như món `tray_coal` đã có.
   - `da-va-dat/14` q4: sáu, chín, hai cốc là số minh hoạ.
5. `thoi-tiet-va-thien-tai/02` q2: thẻ ô và thẻ phích cũng là lựa chọn sai ở q3 và q1 của bài. Vai không đổi (luôn sai), nên không phạm luật "một hình một vai", nhưng bé gặp lại hai hình này.
6. Luật FB của dev không kiểm "kho cùng loại", nên tester rà phần này bằng tay. Ở `da-va-dat/09` q2 (rocks, palaeontology, stars), chỉ thẻ đúng là tên một ngành. Kho vẫn cùng là danh từ, nhưng thẻ đúng dễ nhận hơn các câu khác.
7. Đề xuất cho dev: sau khi phiên chính chạy `validate content` và có 0 dòng `multi_choice_correct_spread`, 0 dòng `vocab_item_uses_lesson_word`, thì nâng `multi_choice_correct_spread` lên mức lỗi (Quyết định 1 của dev).

## designer 15/11 · ảnh nội dung Đợt 1

Theo mục 4 "Hình cho designer" của content-editor. Chỉ sửa `content/images/` (21 file chọn ảnh Discoverer, 4 hình tự vẽ mới, 1 hình ghép mới). Không sửa `content/**/*.md`, `design/`, `packages/`, `apps/`, `tools/`. Chưa chạy `tts`, `build`. Chưa commit.

### 1. Key thêm, gỡ (21 file, 45 thêm, 45 gỡ, 6 sửa)
- **Cách đối chiếu:** `images fetch` không báo khoá thừa (chỉ `build` báo, ở mức cảnh báo). Tôi dùng một script tạm đọc markdown bằng `checkMarkdown` + `imageRefs` của content-cli, so với từng file chọn ảnh. Sau khi sửa: 6 chủ đề còn **0 khoá thiếu, 0 khoá thừa**. Chỉ còn trống `be-mat-trai-dat/cac-chau-luc-va-dai-duong` `learn.explore.explore_vietnam` (bản đồ nhà nước, chờ Duy từ 10/11).
- **Khoá gỡ:** mọi thẻ FB cũ và lựa chọn MC cũ trong danh sách của content-editor. Trước khi gỡ đã tìm mọi `same_as` trỏ tới (trong file và từ bài khác, cả Explorer). Chỉ có một chỗ: `khung-long/05` `reward.crocodile` trỏ `q3.q3_croc`. Mục ảnh của `q3_croc` chuyển nguyên sang `reward.crocodile` (giữ crop, nên không tải lại).
- **Khoá thêm:** theo `image.brief` từng thẻ. Phần lớn là `same_as`:
  - nguồn cùng file: trỏ thẳng;
  - nguồn là `same_as` sang bài khác: trỏ thẳng tới bài gốc, vì `same_as` không nối hai bước. Ví dụ `mua-mua-bao` `q2_sunny` → `khung-long/vi-sao-khung-long-bien-mat` `q2_sun`.

| Chủ đề · bài | Thêm | Gỡ |
| --- | --- | --- |
| be-mat-trai-dat 01 | `q3_lake` | `q3_forest` |
| be-mat-trai-dat 02 | `q1_oceans`, `q1_continents`, `q1_islands`, `q3_atlantic` (mục ảnh riêng, crop 4:5) | `q1_water`, `q1_sky`, `q1_land`, `q3_africa` |
| be-mat-trai-dat 05 | `q2_plates`, `q2_waves`, `q2_volcanoes`, `q3_leg` | `q2_core`, `q2_mantle`, `q2_crust`, `q3_window` |
| khung-long 01 | `q3_frog` (mục ảnh riêng, crop 4:5) | `q3_buffalo` |
| khung-long 05 | `q3_pterosaur` (hình ghép 4:5) | `q3_croc` (ảnh chuyển sang `reward.crocodile`) |
| ho-hap 03 | `q3_crayons` (hình tự vẽ 4:5) | `q3_bike` |
| ho-hap 04 | `q2_fresh_air`, `q3_coal`, `q5_dust`, `q5_smoke`, `q5_oxygen` | `q2_dust`, `q3_park`, `q5_food_pipe`, `q5_windpipe`, `q5_stomach` |
| nao-bo-va-giac-quan 01, 03, 04 | `q3_puzzle`, `q2_senses`, `q3_strap` | `q3_sweat`, `q2_nerves`, `q3_games` |
| thoi-tiet-va-thien-tai 01 | `q2_clouds` | `q2_water` |
| thoi-tiet-va-thien-tai 02 | `q2_rain_gauge`, `q2_umbrella`, `q2_flask`, `q3_ribbon` (hình tự vẽ 4:5) | `q2_wind`, `q2_rain`, `q2_sun`, `q3_clock` |
| thoi-tiet-va-thien-tai 03 | `q2_storm`, `q2_sunny`, `q2_rainbow` (**hình mới**), `q3_radio` | `q2_rain`, `q2_wind`, `q2_clouds`, `q3_umbrella` |
| thoi-tiet-va-thien-tai 04 | `q2_drought`, `q2_flood`, `q2_storm` | `q2_wind`, `q2_sun`, `q2_rain` |
| thoi-tiet-va-thien-tai 05 | `q3_window` | `q3_bring` |
| da-va-dat 07, 09, 10, 12 | `q3_banyan` · `q2_palaeontology`, `q3_footprint` · `q3_climb` · `q2_alluvial` (cùng ảnh bùn của `q2_silt` cũ) | `q3_stream` · `q2_fossils`, `q3_brick` · `q3_museum` · `q2_silt` |
| da-va-dat 14 | `q2_fair_test`, `q2_result`, `q2_chart`, `q3_bottles` (hình tự vẽ 4:5) | `q2_two`, `q2_one`, `q2_all`, `q3_drips` |
| da-va-dat 15 | `q2_geology`, `q2_palaeontology`, `q2_fieldwork` | `q2_diamond`, `q2_quartz`, `q2_talc` |

- **Hình câu hỏi đổi theo brief mới (6 mục sửa):**
  - `thoi-tiet/01` q2 → `tray_puddle`.
  - `thoi-tiet/02` q2 và `/04` q2 → `be-mat-trai-dat/nui-lua` `q1_rain`.
  - `ho-hap/04` q5 → `ho-hap/tho-khi-chay-nhay` `q1_sleeping`.
  - `da-va-dat/14` q4 → `explore_setup`, thay ảnh đất cát bài 12 (SK-044).
  - Bốn câu FB trên có mọi thẻ đều có hình, nên app ẩn hình câu hỏi. Mục vẫn sửa cho khớp `alt`.
- **File ảnh không còn mục nào dùng (giữ trong repo, Duy quyết xoá):** `content/images/own/ho-hap/bicycle.jpg`, `own/thoi-tiet-va-thien-tai/nang-mua-gio-may.q2.q2_water.jpg`, `own/da-va-dat/b14-q2_one.jpg`, `b14-q2_two.jpg`, `b14-q2_all.jpg`.

### 2. Khung (crop) theo loại thẻ mới
Khung theo `image-slots.json` Discoverer: lựa chọn MC 4 thẻ là `choice_4` 4:5 (lưới 2×2), thẻ từ FB là `bank_item` 1:1. Mỗi thẻ mới đã được xem ở đúng khung, cắt giữa như app.
- **Dùng `same_as` khi ảnh nguồn cắt giữa vẫn thấy trọn vật** (lệch ≤ ×1,74, dưới ngưỡng 2,2). Ảnh mới cùng khung thì không tải thêm.
- **Mục ảnh riêng, cùng `file_url`, crop riêng** (giữ nguyên nguồn, giấy phép, tác giả của mục gốc):
  - `be-mat-trai-dat/02` `q3_atlantic`: crop `{0,274; 0; 0,452; 1}`. Ảnh gốc 16:9 vào khung 4:5 lệch ×2,21, quá ngưỡng.
  - `khung-long/01` `q3_frog`: crop `{0,25; 0; 0,6; 1}`. Cắt giữa thì mất mõm ếch.
- **Hình ghép một phần** (đệm khung, không cắt vật chính, như tranh khủng long nền trắng ở A2 14/11): `khung-long/05` `q3_pterosaur`.
  - File: `content/images/composed/khung-long/vi-sao-khung-long-bien-mat.q3.q3_pterosaur.jpg`, 816×1020.
  - Nội dung: tranh Pteranodon (TotalDino, CC BY 4.0, phần `same_as` `khung-long-la-gi` `tray_pterosaur`) cắt sát vật, đặt giữa nền trắng, thấy trọn hai cánh. Ảnh gốc 2:1 vào khung 4:5 lệch ×2,5.
- **Bản 4:5 của ba hình tự vẽ có sẵn**, vì cắt giữa thì mất vật:
  - `own/ho-hap/crayons-4x5.jpg` (`q3_crayons`): đệm trên dưới bằng vân gỗ lật gương.
  - `own/da-va-dat/b14-q3_bottles.jpg` (`q3_bottles`): cắt giữa thì mỗi chai mất một nửa; đệm bằng nền kem lật gương.
  - `own/thoi-tiet-va-thien-tai/do-thoi-tiet.q3.q3_ribbon.jpg` (`q3_ribbon`): cắt quanh que và trọn dải ruy băng (đuôi ruy băng cho biết chiều gió).
  - Cả ba không vẽ thêm vật. Hình gốc của kệ Chơi giữ nguyên.

### 3. Ảnh mới: `thoi-tiet-va-thien-tai/03` `q2_rainbow`
- Hai thẻ kia của câu (`q2_storm` = `explore_storm`, `q2_sunny` = `q2_sun`) đều là **hình tự vẽ**. Vì vậy thẻ cầu vồng cũng là hình vẽ, không tìm ảnh.
- **Hình tự vẽ:** `content/images/own/thoi-tiet-va-thien-tai/mua-mua-bao.q2.q2_rainbow.jpg`.
  - JPEG 1024×1024, vuông theo khung thẻ từ.
  - Mục `own`, `method: drawn`, `title` "A rainbow over the fields" (= `alt.en`).
  - Giấy phép trong gói: "Science Kids". Không có nguồn ngoài, không ảnh AI tải về, không Pinterest.
- **Nội dung:** cầu vồng cong trên cánh đồng lúa sau mưa, góc trên còn mây xám, nắng từ phía sau người xem. Cây, khóm tre và lúa đứng thẳng, không có gió. Xa xa có một nếp nhà mái ngói. Không người, không chữ.
- **Nét vẽ:** cùng nét `explore_storm` và `tray_dark` (vẽ SVG, màu chuyển nhẹ, mây mờ, không viền đen). Đã đặt cạnh hai thẻ kia ở khung 1:1: cùng kiểu, không thẻ nào nổi hơn.
- **Chờ Duy duyệt** như các hình tự vẽ khác.

### 4. `thoi-tiet-va-thien-tai/02` q2
Ba thẻ `q2_rain_gauge`, `q2_umbrella`, `q2_flask` đều là hình tự vẽ cùng nét. Không lệch, không cần sửa.

**Kiểu hình lẫn trong câu (báo, chưa sửa):**
- `be-mat-trai-dat/05` q2: thẻ `q2_waves` (ảnh chụp, sai) đứng giữa hai hình vẽ, gồm cả thẻ đúng `q2_plates`.
- `da-va-dat/15` q2: thẻ `q2_palaeontology` (ảnh chụp, sai) đứng giữa hai hình vẽ, gồm cả thẻ đúng `q2_geology`.
- `khung-long/05` q3: tranh thằn lằn bay (sai) đứng giữa ba ảnh chụp.

Cả ba không phạm luật 10/11 (thẻ đúng không phải hình vẽ duy nhất giữa các ảnh chụp), nhưng ba thẻ không cùng kiểu. Không có hình cùng kiểu sẵn để thay: hình vẽ sóng duy nhất của bài 05 là sóng thần, đang là thẻ đúng của q4. Muốn đồng kiểu thì cần content-editor đổi brief, hoặc vẽ hình mới.

### 5. `images fetch` (15/11)
Chạy lần lượt từng chủ đề, mỗi lúc một tiến trình. Chỉ 2 lượt tải từ Commons (q3_atlantic, q3_frog), không gặp 429.

| Chủ đề | File chọn ảnh | Ảnh khác nhau | Tải mới | Hình ghép | Lỗi | Lệch khung |
| --- | --- | --- | --- | --- | --- | --- |
| be-mat-trai-dat | 5 | 87 | 1 | 12 | 0 | 0 |
| khung-long | 5 | 118 | 1 | 25 (1 mới) | 0 | 0 |
| ho-hap | 4 | 36 | 0 (1 hình tự vẽ mới) | 0 | 0 | 0 |
| nao-bo-va-giac-quan | 4 | 24 | 0 | 1 | 0 | 0 |
| thoi-tiet-va-thien-tai | 5 | 18 | 0 (2 hình tự vẽ mới) | 1 | 0 | 0 |
| da-va-dat | 15 | 167 | 0 (1 hình tự vẽ mới) | 33 | 0 | 0 |

- Mọi bài qua markdown, nên không có dòng "Chưa kiểm tỉ lệ ảnh". Không có dòng "Kiểm tay" mới.
- `validate` bảy chủ đề Discoverer: exit 0, **0 lỗi**, 114 cảnh báo. Mọi cảnh báo hình đều ở *Ăn uống lành mạnh* (dưới); còn lại là `[CẦN KIỂM]` và số từ.

### 6. `an-uong-lanh-manh`: chưa dựng file chọn ảnh
**Hiện trạng:**
- Chưa có `content/images/discoverer/an-uong-lanh-manh/`, nên 66 Image của hai bài (39 + 27) chưa có ảnh; app vẽ hình giữ chỗ.
- `validate`: 28 `image_missing` (chỗ chưa có cả `image`) và 37 `image_brief_keywords` (brief kiểu cũ, không nhãn `[ảnh]`/`[hình vẽ]`, không "Từ khoá tìm ảnh (EN)").
- **`build` không chặn:** bài không có file chọn ảnh thì mỗi Image chỉ tính "chưa có ảnh". Chỉ `--require-assets` biến chỗ đó thành lỗi (đã đọc `build/command.ts`).

**Vì sao chưa làm:**
- Bốn key mới đều cần hình chưa có:
  - 01 `q2_nutrients` → `vocab.nutrient` (bát cơm, trứng, chai dầu, bó rau, chấm màu nhóm chất);
  - 02 `q2_meal` → `vocab.meal` → `vocab.healthy` (gia đình ba thế hệ quanh mâm cơm);
  - 02 `q2_dessert` → `vocab.dessert` (đĩa thanh long, chuối);
  - 02 `q2_sweet` → `tray_candy` bài một (kẹo bọc giấy).
- Làm riêng bốn thẻ này thì không ổn:
  - 01 q2 sẽ có hai ảnh thật (`q2_air`, `q2_sunlight` dùng lại hình Hô hấp, Núi lửa) cạnh một hình giữ chỗ, mà hình giữ chỗ lại là thẻ đúng.
  - Hình gốc (`nutrient`, `healthy`) còn dùng ở Từ mới, nên phải chọn kiểu cho cả bài.
- Làm cả chủ đề theo SK-033 thì cần khoảng 37 hình gốc, phần lớn là món ăn Việt và cảnh có người. Brief chưa theo SK-033. content-editor đã đề xuất một lượt A2 riêng cho hai bài này (mục 8.3). SK-033 cũng đã ghi chủ đề này "bổ sung hình sau".

**Đề xuất thứ tự:**
1. content-editor làm lượt A2 cho hai bài, viết brief theo SK-033 (nhãn kiểu hình, từ khoá EN).
2. designer chọn, vẽ trọn chủ đề trong một ticket riêng.
3. Duy duyệt.

Đến lúc đó, hai câu FB mới của chủ đề này chạy với hình giữ chỗ.

### Còn chưa chắc
- Hình cầu vồng, ba bản 4:5 và hình ghép thằn lằn bay chưa được Duy xem. Trang duyệt `content/.build/images/<chủ đề>/<bài>/review.html` chưa dựng lại.
- Chưa build, nên chưa thấy dòng cảnh báo "khoá không còn hình" của `build`. Theo script đối chiếu, các dòng này nay là 0 ở sáu chủ đề.

## designer 15/11 · rà bản dựng iOS

Rà 23 ảnh `ios-*.png` (iPhone 16 Pro, "Cả hai") với khung cùng id trong `Quiz-Dot1.html`, và gỡ lỗi Tổng kết Màn 2 cao hơn màn. Không sửa `apps/ios/`, `content/`. Không mở simulator. Chưa commit.

**Màn 2: chọn (b), giữ token chữ có sẵn và chỉnh bố cục.** `packages/design-tokens` không đổi.
- Đo bằng một bản sao bố cục `RecapStep.swift` (HTML, font Be Vietnam Pro và Phudu lấy từ bundle app, line-height tính như `TypographyModifier`). Bản sao cho `ho-hap/01` "Cả hai" cao 602 pt, khớp ảnh `ios-r-d2-a.png`.
- Ngân sách nội dung dưới header: Discoverer 554 pt trên iPhone 390×844, 569 trên 16 Pro. Explorer 527 và 542. Cách tính: vùng an toàn, `PaperFrame` lề trên 18 và lề dưới 22 trong vùng cuộn, header 56 + khe 12, thanh dưới 101 (Explorer: header + khe 80, thanh dưới 116).
- Nguyên nhân tràn nằm ở bố cục, không ở cỡ chữ.
  - Nút VI xếp dưới nút nghe có ô chạm 56, trong khi canvas cũ vẽ chip 34. Cột nút vì thế cao 116 ở hai thẻ.
  - Lề rộng hơn canvas: phần trên của thẻ 14/20 so với 8/14, phần dưới 20/14 so với 18/12. Khe giữa các khối 14 so với 12.
  - 7 bài có 4 từ (5 bài *Bề mặt Trái Đất*, `khung-long/04`, `an-uong-lanh-manh/01`). Lưới 3 cột đẩy từ thứ tư xuống hàng hai, thêm 150 pt.
  - Đổi chữ sang 18/600 và 18/700 chỉ lệch tối đa 2 pt. Lời Na đổi từ 16 lên 17 còn làm thẻ cao hơn.
- Vì sao không thêm token: thêm token không gỡ được tràn. 18/700 và `sentence` 19/700 gần như không phân biệt được; README token đã gộp các biến thể 19, 20, 21 của câu chính thành một vai. A2 (SK-043) cũng đã dựng chữ 18/600 của canvas bằng `item_title`. **Chốt:**
  - Câu ý chính, lời Na, mẩu gợi ý: `item_title` 16/700.
  - Câu đúng, câu mục tiêu Discoverer: `sentence` 19/700.
  - Câu sai Explorer: `body_strong` 15/700. Mục tiêu Explorer: `item_title`.
  - Từ mới: `title` 21/900, thu nhỏ cho vừa ô. Nghĩa VI: `caption` 13/600.
  
  Canvas đã đổi theo.

| Đo trên bản sao (390×844) | Ngân sách | Bản dựng 15/11 | Bố cục mới |
| --- | --- | --- | --- |
| `ho-hap/01` "Cả hai" | 554 | 602 | 528 |
| `ho-hap/03` "Cả hai" | 554 | 602 | 503 |
| Discoverer, 40 bài × 3 chế độ | 554 | "Cả hai": cả 40 bài vượt. 7 bài 4 từ vượt ở mọi chế độ | Xấu nhất 537 (`da-va-dat/01` "Cả hai"). Tiếng Việt 503, Chỉ EN 449 |
| Explorer `/08` "Cả hai" / Tiếng Việt / Chỉ EN | 527 | 686 / 569 / 539 | 503 / 473 / 453 |
| Explorer, 19 bài × 3 chế độ | 527 | Cả 8 bài có thẻ đều vượt ở "Cả hai"; 7 bài vượt ở Tiếng Việt | Xấu nhất 503 ("Cả hai") |

Trên 16 Pro mọi trường hợp còn dư ít nhất 46 pt (Explorer: 60 pt). Đo thẳng trên canvas mới (font Google): `r-d2-a` 521, `r-d2-a-nod-bi` 496, `r-d2-a-4w` 506, `r-x2-a` 473, `r-x2-a-bi` 482.

**File đổi**
- `design/play-ui/options/lesson-less-text/Quiz-Dot1.html`, sinh lại từ script trong scratchpad. Từ 25 lên 28 khung.
  - Vẽ lại bốn khung `r-d2-a`, `r-d2-a-nod`, `r-x2-a`, `r-x2-none`.
  - Thêm ba khung: `r-d2-a-nod-bi` (`ho-hap/03` "Cả hai"), `r-d2-a-4w` (`be-mat-trai-dat/02`, 4 từ), `r-x2-a-bi` (Explorer `/08` "Cả hai").
  - Dưới mỗi khung có ô vàng "Rà bản dựng iOS 15/11" ghi chỗ đổi. Ghi chú iOS viết lại theo token.
  - Thẻ ý chính và mẩu gợi ý đổi sang 16/700. Mục "Cỡ và token" thêm ngân sách iOS. Bảng id thêm 3 khung.
  - Đã sửa ghi chú dưới `r-d2-a`: mặt Na là hình ghép 72 (`na-shake.svg`, `na-nod.svg`), không phải huy hiệu 32 ở góc.
- `img/bm2-continent.jpg`, `bm2-ocean.jpg`, `bm2-asia.jpg`: ảnh có sẵn của `be-mat-trai-dat/02` trong gói, thu nhỏ như 32 ảnh trước.
- `index.html`: số khung.
- Kiểm bằng script cũ của trang: 28 khung vừa khung máy, không `border`/`outline`, không `stroke` ngoài icon nhỏ, mọi màu thuộc token. Duy nhất `r-x2-b` (phương án B, không dựng) vượt ngân sách iOS.

**Mặt Na ghép: xác nhận đúng ý.** ios-dev dựng mặt Na ghép với mũi tên lắc/gật, như `img/na-shake.svg` và `img/na-nod.svg`. Đó là hình tôi vẽ. Ghi chú cũ "huy hiệu 32 `ArtExplorerShake`" là chỗ tôi ghi sót, đã sửa trong trang. Explorer giữ `ArtExplorerShake` 64 trên ảnh.

**Mặt Na 43 pt và bóng đèn ở cỡ thật** (xem ảnh chụp thu về 1 px = 1 pt): đủ rõ, không đổi.
- Mặt Na nhận ra ngay (tóc, mắt, má) và trùng mặt Na 56 bé vừa thấy ở câu 6.
- Mũi tên lắc/gật là phần nhỏ nhất, cao khoảng 13 pt, vẫn nhìn được. Nghĩa "chưa đúng" còn có ở giấy lõm, chữ gạch và giọng đọc, nên mũi tên nhỏ không làm mất nghĩa.
- Bóng đèn nhận ra rõ ở cả hai trạng thái và nặng ngang hình loa. Tester xem lại trên máy thật khi có.

### Phải sửa (ios-dev)
1. **Tổng kết Discoverer Màn 2, thẻ ý sai → ý đúng** (`RecapStep.mythCard`; khung `r-d2-a`, `r-d2-a-nod`, `r-d2-a-nod-bi`):
   - **Phần trên:** lề trên 8, trái 6, dưới 14, phải 76 (hiện 14/14/20/14). `SpeakerBadge` 72, khe 10, rồi lời Na.
   - **Cột nút:** [nút nghe 56][VI trong ô chạm 56], khe 4, cách mép phải 10. Cột ghim ở mép nối hai phần: đáy ô nút nghe cách mép nối 2 pt về phía trên, ô VI bắt đầu 2 pt dưới mép nối. Ngoài "Cả hai" chỉ có nút nghe, cùng chỗ.
     - Cách làm gợi ý: một `VerticalAlignment` riêng cho mép nối.
     - Bỏ cột nút khỏi HStack của phần dưới.
   - **Phần dưới:** lề trên 18, trái 14, dưới 12, phải 14. "Cả hai": phải 80, cao tối thiểu 58.
   - **Mũi tên tròn 30:** tâm thẳng tâm mặt Na, cách mép trái 27.
   - **VoiceOver:** đọc theo thứ tự mặt Na, lời Na, câu đúng, nút nghe, VI.
2. **Ô từ mới, Discoverer và Explorer** (`wordCell` và lưới; khung `r-d2-a`, `r-d2-a-4w`, `r-x2-a`):
   - Số cột bằng số từ (2–4), không cố định 3.
   - Ảnh Discoverer: cao bằng 3/4 bề rộng trong của ô (≈ 72 khi có 3 từ, ≈ 50 khi có 4 từ, trên 390). Ảnh Explorer: cao 72.
   - Bỏ biểu tượng loa nhỏ 16 trong ô. Cả ô là nút, nhãn VoiceOver giữ như hiện nay.
   - Chữ từ, cỡ `title`:
     - Từ một chữ: một dòng, thu nhỏ tới 0,6.
     - Cụm nhiều chữ: thu nhỏ tới 0,8, rồi xuống tối đa 2 dòng ở dấu cách.
     - Không cắt bằng "…", không ngắt giữa chữ.
   - Kiểm các từ:
     - "SEA SPONGE" (`/08`): ảnh 21:16 còn hiện "SEA SPON…".
     - "PALAEONTOLOGIST" (`da-va-dat/10`, 3 cột).
     - "CARBOHYDRATE" (`an-uong-lanh-manh/01`, 4 cột).
     - "PACIFIC OCEAN" (`be-mat-trai-dat/02`).
3. **Thẻ "I can…" Discoverer:** "Cả hai" lề trên 8, dưới 4, trái 14, phải 10. Ô chạm VI đã có 8 pt trong suốt ở dưới, nên chip vẫn cách mép thẻ 12. Chế độ khác: lề trên và dưới 10. Triện giữ `Seal` medium 28.
4. **Khe giữa các khối Màn 2** (thẻ, nhãn cùng ô từ, thẻ mục tiêu): 12 (`layout.section_gap`), không 14. Discoverer và Explorer.
5. **Tổng kết Explorer Màn 2, thẻ ý sai → ý đúng** (`explorerMythCard`; khung `r-x2-a`, `r-x2-a-bi`):
   - Ảnh cao 120 (hiện 140).
   - Huy hiệu lắc 64 ở góc dưới trái, cách 10. Hiện đang ở giữa cạnh trái.
   - Nút nghe 72 ghim góc dưới phải ảnh, cách 8. "Cả hai": VI trong ô chạm 72, đặt ngay trái nút nghe, khe 4.
   - Hai câu nằm dưới ảnh và dùng hết bề rộng: lề 10/10/8, khe 4. Bỏ cột nút bên phải chữ.
   - Câu 6 không có ảnh: [huy hiệu 64][hai câu][nút] trên một hàng.
6. **Thẻ mục tiêu Explorer** (`r-x2-a`, `r-x2-a-bi`, `r-x2-none`):
   - Nút xếp một hàng [VI 72][nghe 72], khe 4. Không xếp VI dưới nút nghe; cách xếp đó làm thẻ cao 172.
   - Triện tích 42 (hiện `Seal` large 52; cần thêm cỡ 42), chữ `item_title`, lề 10, trái 14.
7. **Kiểm sau khi sửa,** trên một simulator, theo quy ước chạy một lần:
   - `ho-hap/01` và `ho-hap/03` ở "Cả hai", cùng Explorer `/08` ở "Cả hai" và Tiếng Việt: Màn 2 không cuộn trên iPhone 16 Pro.
   - Ghi chiều cao vùng cuộn vào ticket.
   - Khi có máy 390×844 thì chạy thêm `be-mat-trai-dat/02` và `da-va-dat/01`.

### Nên sửa
1. **Hàng câu hỏi và hàng lời Na ở "Cả hai"** (`h-sc-open`, `o-d-ask`, `c-ask`, `na-ask`, `h-na-open`):
   - Hiện tượng: cột nút cao 116–176 pt mà chữ được căn giữa theo cột. Kết quả là nút nghe và gợi ý nổi cao hơn dòng chữ đầu 33–55 pt, trông như thuộc tấm ảnh bên trên.
   - Đề xuất: căn trên. Câu hỏi đệm trên 15 để dòng đầu ngang tâm nút 56. Hàng Na: mặt Na và bong bóng căn trên, ngang nút nghe.
   - Đây là cách căn có từ A2, không chặn Đợt 1.
2. **`order_sequence` đúng cả câu** (`ios-o-d-right`):
   - Hiện tượng: thẻ ô 4 mang triện 52, che góc ảnh.
   - Đề xuất: theo A2 `ex-x-q4-order-right`, đặt lớp lá tre lệch dưới cả dải chỗ xếp và một triện 32 ở góc trên phải dải. Thẻ không có triện to riêng.
3. **Biểu đồ đúng** (`ios-c-right`): triện tích hiện 22 và nằm giữa đỉnh cột. Canvas vẽ 28, ở góc trên phải khối trên cùng (top −8, right −7), đè mép khối.
4. **Explorer `order_sequence` thử lại** (`ios-o-x-retry`): mũi tên giữa ô 1 và ô 2 dính vào lớp lá tre lệch 5 pt của thẻ khoá. Đề xuất: khe mũi tên 32 (hiện 28) khi có 3 ô trên iPhone, hoặc dịch mũi tên sang phải 2,5 pt khi ô trước nó đã khoá.

**Khớp thiết kế, không cần sửa:**
- Nút gợi ý: vị trí, trạng thái mở, ẩn nhưng giữ chỗ khi câu xong, mẩu giấy có VI.
- `order_sequence` 2 hàng có dải nối. Thẻ khoá có lá tre và triện. Kho có ô lõm.
- Biểu đồ: khối, tên cột, chồng lõm có khối bong góc.
- `r-d1-a`, `r-x1-a`, `r-x1-a-06` (ý 3 lấy hình "Eat both").
- Nhãn `lesson.reward.close` cho nút X: đồng ý với ios-dev.

**Chưa kiểm / còn chưa chắc**
- Bản sao HTML ngắt dòng bằng Chrome chứ không bằng CoreText, nên có thể lệch một dòng. Phần dư nhỏ nhất là 17 pt ở Discoverer và 24 pt ở Explorer, trên 390×844. Dynamic Type lớn vẫn cuộn; `PaperFrame` cuộn được nên chấp nhận.
- Explorer "Cả hai": chữ mục tiêu chỉ còn rộng khoảng 107 pt, xuống 3–4 dòng (`r-x2-a-bi`). Đây là giá phải trả để thẻ không cao 172 pt. Bé Explorer nghe câu này là chính.
- Chưa có ảnh iOS cho `h-fill-open`, `h-chart-open`, `o-ipad`, `r-d1-a-vi`. Tester chụp ở lượt kiểm.
- Nội dung, không chặn:
  - `be-mat-trai-dat/02`: `ocean` và `pacific_ocean` dùng chung một ảnh, nên hai ô cạnh nhau trùng hình. Tôi ghi vào danh sách tìm ảnh.
  - `da-va-dat/14` q4 trên ảnh iOS vẫn là câu cũ và ảnh đất cát. Gói chưa build lại.

## tester 15/11 · nghiệm thu

Kiểm trên một máy iPhone 16 Pro simulator (iOS 18.4, máy Duy đang mở app khác, không tắt máy), gói nhúng `ceeb1eb6912a`, chạy với `-SKSyncOff YES`. Không sửa code sản phẩm, nội dung hay thiết kế. Chỉ thêm một file test của tester: `apps/ios/ScienceKidsUITests/SK047FlowUITests.swift`. Chưa commit.

**Vì sao có file UI test mới.** Phiên agent không điều khiển được chuột trên máy (CGEvent cần quyền Accessibility, `osascript` treo), nên không "kiểm tay" được như người. `LessonUITests` cũ vẫn theo màn trước A2 (SK-043), nên tôi viết một file riêng cho luồng Đợt 1, đọc bài và đáp án đúng từ chính gói `content/.build/pack`, không viết chữ của bài vào test. File này không đụng test cũ.

### Số test

| Bộ | Kết quả |
| --- | --- |
| `tools/content-cli` `npm test` | **399/399 pass**, exit 0 |
| `tools/content-cli` `npm run typecheck` | exit 0 |
| `packages/content-schema` `npm test` | **160/160 pass**, exit 0 |
| `packages/content-schema` `npm run typecheck` | exit 0 |
| `validate content` | exit 0 · **0 lỗi**, 136 cảnh báo (69 `md_needs_check`, 37 `image_brief_keywords`, 28 `image_missing`, 2 `age_words_en`) · **0 dòng `multi_choice_correct_spread`, 0 dòng `vocab_item_uses_lesson_word`** |
| `check-pack content/.build/pack` | **OK**, exit 0 · 13462 file khớp manifest, EN 6001, VI 6245, ảnh 1206 (giấy phép, metadata, kích thước: 0 lỗi) |
| iOS unit test (bỏ UI test), 1 lần, iPhone 16 Pro | **400 test, 400 pass, 0 fail** (`RecapTests.mythCardsOfTheTicketLessons` ios-dev sửa đã qua) |
| `SK047FlowUITests` (tester viết, UI) | 6 test · **5 test pass**, 1 test (`order_sequence`) đỏ vì harness, phần chấm chính của nó đã qua (dưới) |

`build-for-testing` thành công mỗi lần; log có `Content pack embedded … (13463 files)`; `manifest.json` trong app container cho `content_version` `ceeb1eb6912a`.

**UI test của tester, lịch sử chạy.** Mỗi lượt đỏ dưới đây là lỗi harness của tôi, không phải lỗi app; tôi chỉ chạy lại test đã sửa harness, không chạy lại test đã xanh.

| Test | Kết quả | Ghi chú |
| --- | --- | --- |
| `testChartQuestionShowsItsBars` | **pass** (lượt 1) | `da-va-dat/14` từ Khởi động tới Tổng kết |
| `testClosingAtRecapKeepsTheLesson` | **pass** (lượt 1) | `ho-hap/03`, tắt app ở Tổng kết |
| `testDiscovererGoldenFlowWithHintAndRecap` | **pass** (lượt 3) | `ho-hap/01`, mở gợi ý ở q4 |
| `testOneLessonOfEveryOtherDiscovererTopic` | **pass** (lượt 3) | 5 chủ đề còn lại, mỗi bài mở gợi ý ở câu 1 |
| `testExplorerRecapWithAndWithoutMythCard` | **pass** (lượt 4) | Explorer `/08` có thẻ, `/06` không |
| `testOrderSequenceLocksCardsInPlace` | đỏ ở bước phụ | xem dưới |

Lỗi harness đã gặp: (1) nút chủ đề không có trên Home khi bản đồ hành trình chưa cuộn tới; (2) một lượt học bỏ dở làm app mở thẳng vào bài đó ở lần chạy sau (`AppModel.reopenCutOffLesson`, đúng B7.6) nên Home không hiện; (3) màn câu hỏi Explorer không có `lesson.prompt`. Sửa: mở bài bằng `-SKOpenLesson <id>`.

**`testOrderSequenceLocksCardsInPlace`.** Lượt chạy có nội dung: `da-va-dat/08` q4, xếp snail → layers → decay → found (sai). Các khẳng định về khoá thẻ **đã qua**: ô 1 và ô 4 có `value` = "In the right place, locked", hai thẻ sai trở lại kho, ảnh `o-d-retry-da-va-dat-08.png` cho thấy đúng bản vẽ `o-d-retry` (lá tre + triện ở ô 1 và 4, ô 2 và 3 trống, hai ô lõm trong kho, mũi tên và dải gấp khúc 2 → 3). Test dừng ở một khẳng định phụ tôi viết sai (`isHittable` của ô đã khoá): SwiftUI dùng `allowsHitTesting(false)` nên XCUITest vẫn coi là "hittable", trong khi chạm thật không làm gì (action có `guard !isLocked`, `dropDestination` trả `false`). Lượt sau đó đỏ vì bài đang dở được mở lại — chính lượt đó cho thấy thêm: **trạng thái khoá sống sót qua lần mở lại app** (mở lại bài thì ô 1, ô 4 vẫn giữ thẻ, kho vẫn hai thẻ sai).

### Bảng tiêu chí

Ô "cách kiểm" ghi bằng chứng. Ảnh chụp ở `/private/tmp/claude-501/-Users-buiduyluu--claude-spares-spare-7hJEda/5730aa52-aac5-4944-a855-c98bfdd7bb76/scratchpad/shots/` (`r-d1-*`, `r-d2-*`, `c-ask-da-va-dat-14`, `c-right-da-va-dat-14`, `o-d-retry-da-va-dat-08`, `topic-after-closing-at-recap`).

**designer** — 5/5 đạt
| Tiêu chí | Kết quả | Cách kiểm |
| --- | --- | --- |
| Canvas đủ màn, mỗi màn có id `?shot=` | đạt | `Quiz-Dot1.html` có 28 id, khớp bảng trong ticket |
| Ghi chú cho ios-dev mỗi màn | đạt | đọc trang: kích thước, token, nhãn VoiceOver, giảm chuyển động |
| Danh sách chuỗi mới, không cần clip | đạt | 14 khoá mới có trong `Localizable.xcstrings`; **370/370 chuỗi của app có đủ `en` và `vi`** |
| Duy duyệt 2 màn Tổng kết | đạt | ghi 15/11 trong ticket, ios-dev dựng theo phương án A |
| Ảnh mới: giấy phép, khung | đạt | `check-pack`: 1206 ảnh qua kiểm JPEG, metadata, kích thước, credit, giấy phép, 0 lỗi; `build` 0 cảnh báo lệch khung (tôi không chạy lại `images fetch`) |

**ios-dev** — 28 đạt (2 trong đó chỉ đạt theo code hoặc unit test) · 5 chưa kiểm được
| Tiêu chí | Kết quả | Cách kiểm |
| --- | --- | --- |
| Hai lượt mới → thứ tự SC khác nhau | đạt | unit test `twoAttemptsShowAnotherOrder` |
| Lượt dở mở lại giữ thứ tự | đạt | unit test `resumedAttemptKeepsItsOrders` |
| 13 câu OS × 1000 `attemptId` không trùng `answer` | đạt | unit test `orderCardsNeverInAnswerOrder` |
| Hai câu cùng số lựa chọn khác hoán vị | đạt | unit test `questionsOfOneAttemptHaveTheirOwnOrder` |
| Gật trái/lắc phải; cột theo `bars`; chỗ trống theo câu | đạt | code (`ForEach([true, false])`, `shownOptions` trả `chart.options`), unit test `chartKeepsBarsAndOptionsTogether`, ảnh `c-ask` (đất vườn → đất cát → đất sét đúng thứ tự `bars`) |
| Chấm không đổi, `answer` ghi key | đạt | unit test `scoringUsesKeysNotPlaces`; `history.json` của 8 lượt chạy thật chỉ chứa key |
| VoiceOver đọc thẻ theo thứ tự trên màn | chưa kiểm được | không bật được VoiceOver thật trong phiên agent |
| `da-va-dat/08` q4: khoá ô 1 và ô 4, hai thẻ về kho | đạt | UI test + ảnh `o-d-retry-da-va-dat-08` |
| Thẻ đã khoá không chạm hay kéo ra được | đạt theo code | `allowsHitTesting(isEditing && !isLocked)`, `guard !isLocked` trong action, `dropDestination` trả `false`; chạm thật: chưa kiểm (xem mục UI test) |
| Lần 2 đúng → câu đúng nhưng 0 điểm, `answer` có 2 lần thử | đạt | unit test `secondTryRightScoresAsBefore` (trên màn chưa kiểm) |
| Explorer `/04` q4 khoá eggs | đạt | unit test `explorerLocksTheEggs` (trên màn: chưa kiểm) |
| Mũi tên giữa ô, 4 thẻ 2 hàng, ô ≥ cỡ chạm | đạt | ảnh `o-d-retry` (2 hàng, mũi tên, dải gấp khúc 2→3); unit test `boardFitsThePhone` cho 335/353/390 |
| iPad một hàng | chưa kiểm được | một máy, không mở iPad (unit test có) |
| Biểu đồ: tên ba cột hiện ngay khi mở câu | đạt | ảnh `c-ask-da-va-dat-14` (garden/sandy/clay soil hiện trước khi chạm) |
| Nút gợi ý ở SC, MC, TF, câu Na, FB, OS, biểu đồ, cả Khởi động và Quiz | đạt | code (mọi nhánh của `question`), ảnh `c-ask` và `o-d-retry` (bóng đèn cạnh loa ở biểu đồ và OS), UI test mở gợi ý trên 6 bài |
| `ho-hap/01` q4: `points = 1`, `hint_used = true`, câu khác `false`, tổng điểm như lượt không mở | đạt | `history.json` thật: slot 4 `hint_used=true points=1`, 5 slot còn lại `false`, 6/6, 90 XP — bằng lượt `ho-hap/03` không mở gợi ý. Payload trong `sync/queue.json` cũng mang `hint_used: true` đúng slot 4 (staging thật: chưa kiểm, chạy `-SKSyncOff YES`) |
| Sai lần 1, app tự đọc `hint` → `hint_used` vẫn `false` | đạt | unit test `onlyTheButtonBeforeTheEndCounts`; `markHintUsed` chỉ được gọi từ `HintButton` (grep toàn repo) |
| Explorer không có nút gợi ý; TF 1 lượt | đạt | UI test Explorer khẳng định không có `lesson.hint.button` ở `/08` và `/06`; code `ExplorerQuestionStep` |
| Quiz → màn 1 → màn 2 → Thưởng | đạt | UI test (6 bài Discoverer + Explorer) |
| `ho-hap/01` màn 1: 3 thẻ đúng 3 câu `## Ý chính` | đạt | UI test so từng chữ với `key_points` của gói; ảnh `r-d1-ho-hap-01` |
| Tự đọc lần lượt, thẻ đang đọc nổi lên | đạt phần nhìn | ảnh: thẻ 1 có lớp vàng hoè; **nghe bằng tai: chưa kiểm** |
| Explorer `/04` màn 1 (thẻ chỉ có hình, linh vật đọc từng ý) | chưa kiểm được trên màn | chạy `/08` và `/06` thay; bố cục màn 1 Explorer giống nhau, unit test có `/04` |
| `ho-hap/01` màn 2: thẻ ý sai → ý đúng, dải 4 từ, câu "I can…" | đạt | UI test so `statement`, `explanation_correct`, 4 từ `breathe, oxygen, chest, gills`, `objective`; ảnh `r-d2-ho-hap-01` |
| `ho-hap/03` màn 2 dạng Na nói đúng, không gạch | đạt | UI test (`lesson.recap.nod` có, `lesson.recap.shake` không) + ảnh `r-d2-nod-ho-hap-03` |
| Explorer `/08` có thẻ; `/06` không; cả hai vẫn có dải từ và mục tiêu | đạt | UI test `testExplorerRecapWithAndWithoutMythCard` (pass) + ảnh `r-x1-*`, `r-x2-*` |
| Explorer `/07` không có thẻ | chưa kiểm được trên màn | unit test `mythCardsOfTheTicketLessons` có |
| Hai lần chạm từ màn 1 tới Thưởng, không phải chờ | đạt | UI test chạm mũi tên ngay khi màn mở |
| Tắt app ở Tổng kết → bài có sao, `history.json` 1 bản ghi, vào hàng đợi sync, mở lại là lượt mới | đạt | UI test + ảnh `topic-after-closing-at-recap` (bài 3 "Done ★★"), `history.json` đúng 1 bản ghi `ho-hap/03`, `sync/queue.json` có lượt đó |
| Đi hết Tổng kết → sao, điểm, XP như trước; không thêm bản ghi | đạt | 8 lượt chạy thật: mỗi bài đúng 1 bản ghi, 6/6, 90 XP (60 + 10 + 20 theo `rules.json`) |
| Unit test file dở bản cũ → `.recap` có `summary` | đạt | `progressFileFromBeforeTheRecapOpens` |
| Unit test bài không có `word_list` | đạt | `lessonWithoutWordList` |
| Giảm chuyển động: thẻ chỉ đổi nền | đạt | code `RecapPaper` (bỏ `offset` khi `reduced`); mọi ảnh chụp chạy với `-SKReduceMotion YES` |
| Gói nhúng **trước** SK-047 chạy trên app mới | chưa kiểm lại | gói cũ đã bị ghi đè (`content/.build/pack` là gói mới); ios-dev đã chạy ở lượt 1 với gói cũ |
| File đã xoá; `markHintUsed` chỉ từ nút gợi ý; unit test chạy 1 lần | đạt | `git status` (5 file xoá), grep, 400/400 |

**dev** — 8/8 đạt
| Tiêu chí | Kết quả | Cách kiểm |
| --- | --- | --- |
| `rules.json` có `multi_choice_correct_spread: 0.5` ở `discoverer` và `scientist` | đạt | `git diff content/rules.json` (kèm `vocab_item_uses_lesson_word: true`) |
| Giá trị `0`, `1.5`, `"a"` → `build` dừng, pointer đúng | đạt | `test/build.test.ts` trong 399 test pass |
| Chủ đề `ho-hap` 4 câu MC cùng số đáp án đúng → báo đúng nội dung | đạt | `test/age-rules.test.ts` (ca chạy CLI thật) |
| 1 câu MC không báo; 2 câu cùng số đúng thì báo | đạt | `test/age-rules.test.ts` |
| Mức và phạm vi đếm ghi trong ticket; cuối ticket ở mức lỗi | đạt | `ISSUE_LEVELS.multi_choice_correct_spread = "error"` |
| Luật FB dùng từ mới, có test | đạt | `vocab_item_uses_lesson_word` (cảnh báo) + test |
| `npm test`, `typecheck`, README | đạt | 399/399, exit 0, README có cả hai mã, bảng `authoring`, cách nâng mức |
| `validate` 0 lỗi, `build` thành công, `check-pack` OK | đạt | tester chạy lại `validate` và `check-pack` |

**content-editor** — 7/7 đạt (kèm 5 mục "nên sửa" ở phần rà chữ)
| Tiêu chí | Kết quả | Cách kiểm |
| --- | --- | --- |
| Mỗi chủ đề đạt luật phân bố MC | đạt | tôi đếm lại độc lập trên gói: 40 câu MC, phân bố 1 đúng × 6, 2 đúng × 18, 3 đúng × 16; không chủ đề nào vượt giới hạn |
| 37 câu FB ở Quiz dùng từ core, kho cùng loại, mọi thẻ có hình, thẻ sai có `feedback` | đạt | tôi dump 37 câu từ gói: 37/37 có từ core trong chỗ trống, 3–4 thẻ, 100% thẻ có `image`, mọi thẻ sai có `feedback`, không thẻ đúng nào có `feedback` |
| `version` tăng, không đổi `id:`, câu hướng dẫn MC giữ nguyên | đạt | `git diff` không có dòng `id:` nào đổi; 40/40 câu MC vẫn "Pick all the right answers." |
| `da-va-dat/14` q4 hỏi dữ liệu | đạt | ảnh `c-ask-da-va-dat-14`: "Which soil let the most water through?" |
| `_topic.md` 8 chủ đề và TEMPLATE sửa theo việc 4 | đạt | grep "Vị trí đáp án đúng": chỉ còn tiêu đề mục + dòng ghi hết hiệu lực |
| Danh sách `hint` TF và `explanation_correct` câu 6 | đạt | 46 câu `hint`, 5 câu `explanation_correct`; tôi rà 40 câu Na: không câu nào mở bằng "Yes!", "Na chưa đúng", "This is false" |
| `validate` 40 bài 0 lỗi | đạt | exit 0 |

**tester**
| Tiêu chí | Kết quả |
| --- | --- |
| Chạy lại tiêu chí của ba agent, mỗi lỗi có bước tái hiện | đạt |
| Rà chữ: không chặn | đạt (5 mục "nên sửa", dưới) |
| FB ở Quiz dùng từ mới 37/37 | đạt (CLI 0 dòng + dump tay) |
| `check-pack` OK; mỗi chủ đề Discoverer mở một bài, xáo + gợi ý + Tổng kết chạy | đạt (7/7 chủ đề) |

### Lỗi

**Chặn: không có.** Không tìm thấy lỗi nào chặn nghiệm thu Đợt 1.

**Nên sửa**

1. **`thoi-tiet-va-thien-tai/02` q6: gợi ý gần như nói đáp án** · content-editor — **đã sửa** (tester 16/11: gợi ý mới trỏ bằng chứng; q5 cũng đã sửa; ảnh `w02-q6-hint-1611`, `w02-q5-hint-1611`)
   - Tái hiện: mở bài *Đo thời tiết*, tới câu 6 (Na: "I feel hot after running, so the air got hotter.", đáp án Sai), chạm nút gợi ý. Gợi ý in ra: "Remember the Our feelings card." · "Em nhớ lại ô Cảm giác của mình nhé."
   - Ô Học `explore_feelings` có câu "Two people can feel the same air differently." — đúng là phán quyết của câu hỏi. Theo chuẩn chính content-editor đặt ở lượt này ("không trỏ tới một ô mà tên hoặc câu của nó chính là phán quyết") thì câu này phải sửa; 02 q6 không có trong danh sách 46 câu đã sửa.
   - Gần ngưỡng, cùng bài: q5 "Remember where to put a rain gauge." (câu khẳng định hỏi chỗ đặt ống đo mưa).
2. **`ho-hap/04`: một hình vừa là thẻ đúng vừa là thẻ sai trong cùng bài** · content-editor (designer nếu phải đổi hình) — **đã sửa** (tester 16/11: `q5_steam`, `q4_schoolyard`; quét lại `ho-hap` 0 chỗ; ảnh `hh04-q4-1611`, `hh04-q5-1611`)
   - q2 (câu Từ mới) có thẻ đúng `q2_smoke`, hình `explore_smoke`. q5 có thẻ sai `q5_smoke`, cũng hình `explore_smoke`.
   - Luật "không hình nào vừa đúng vừa sai" được chính content-editor ghi lại ở `thoi-tiet-va-thien-tai/_topic.md` khi chọn thẻ sai cho lượt này; `ho-hap` lọt.
   - Tái hiện: `content/discoverer/ho-hap/04-giu-phoi-khoe.md`, `#### bank q2_smoke` và `#### bank q5_smoke` (cùng `image.brief: Dùng lại hình explore_smoke`).
3. **`da-va-dat/15` q2: gợi ý trỏ thẳng tới trang in sẵn đáp án** · content-editor — **đã sửa** (tester 16/11: gợi ý mới không có "geolog-"; ảnh `dd15-q2-hint-1611`)
   - Câu: "The science of rocks and soil is called {1}." (đáp án `geology`). Gợi ý: "Remember the New words page of this lesson." — trang Từ mới của chính bài in "GEOLOGY · địa chất học", và nghĩa VI gần như là câu hỏi. Đề xuất đổi sang bằng chứng (việc nhà địa chất làm).
4. **`thoi-tiet-va-thien-tai/02` q2: câu chứa gốc từ của đáp án** · content-editor — **đã sửa** (tester 16/11: 0/40 câu FB bản EN còn gốc từ của đáp án; ảnh `w02-q2-1611`)
   - "The {1} catches rain to show how much fell." với đáp án `rain gauge`; TEMPLATE (mục SK-047 mới) ghi "Câu không chứa gốc từ của đáp án". Hai thẻ sai là "umbrella" và "flask", nên chữ "rain" trong câu chỉ thẳng thẻ đúng.
5. **Ghi chú cũ trong file còn mâu thuẫn sau khi đổi câu** · content-editor (không phải chữ bé đọc) — **đã sửa** (tester 16/11: dòng DOK 2 và dòng rà chữ `q3_ribbon` đã khớp câu mới; `_topic.md` `tray_clock` đã ghi bỏ)
   - `thoi-tiet-va-thien-tai/02` q3 còn dòng "> DOK 2: … Hai lựa chọn sai có sức hút: kim đồng hồ… Đáp án ở chỗ thứ hai và thứ tư." trong khi câu nay có ba đáp án đúng, không còn thẻ đồng hồ, và vị trí đã hết hiệu lực. Dòng rà chữ 11/11 dưới `#### option q3_ribbon` cũng còn kể "wall clock".
6. **File rác chưa xoá** · dev — **đã sửa** (tester 16/11: `git status` không còn `expected.json.new`)
   - `tools/content-cli/test/fixtures/markdown/expected.json.new` (31 KB, untracked) là bản nháp của lượt sinh lại fixture; `git add .` sẽ nhặt phải.
7. **Hai chuỗi không còn code nào dùng** · ios-dev — **đã sửa** (tester 16/11: `Localizable.xcstrings` còn 368 chuỗi, 368/368 đủ `en` và `vi`, grep `.swift` không còn chỗ gọi)
   - `lesson.quiz.done` ("Xem kết quả") và `lesson.explorer.to_reward` không còn chỗ gọi sau khi `nextLabel` đổi; vẫn nằm trong `Localizable.xcstrings`.
8. **Hình thẻ ý chính của `khung-long/01` khó đọc ở cỡ 136** · designer (Đợt 2 đã có `key_point_images`) — **đã sửa** (tester 16/11: ảnh `kl01-recap1-1611`, thẻ 2 đọc được, thẻ 3 hiện trọn trục, không mảnh nào bị cắt)
   - Ảnh `r-d1-trai-dat-rat-lau-ve-truoc.png`: hai thẻ dùng hình nhóm Học vốn là ảnh ghép nhiều mảnh (dải thời gian, ba con khủng long với mũi tên). Cắt vuông 136 thì mảnh bị cắt dở, nhìn như hình lỗi. Thuật toán ghép theo chữ chạy đúng; vấn đề là nguồn hình.

### Rà chữ (phần content-editor đổi)

Rà 37 câu FB ở Quiz, 16 câu MC đổi đáp án, `da-va-dat/14` q4, 46 `hint` TF đã sửa và 40 `explanation_correct` câu 6 (dump từ gói, không đọc qua markdown).

**Đạt**
- **MC:** 40/40 giữ "Pick all the right answers." · "Chọn tất cả đáp án đúng."; phân bố theo chủ đề khớp bảng của content-editor (1 đúng × 6, 2 đúng × 18, 3 đúng × 16); lựa chọn đổi từ sai sang đúng đều đã bỏ `feedback`, đổi sang sai đều có `feedback`; giải thích không còn câu nào nói sai số ("both" khi có ba đáp án).
- **FB:** 37/37 chỗ trống là từ `tier: core` của chính bài; kho 3 thẻ (một câu 4 thẻ hai chỗ trống), cùng loại từ trong từng câu (danh từ với danh từ; `da-va-dat/05` cả ba là tính từ — vẫn cùng loại); 100% thẻ có hình; mọi thẻ sai có `feedback` một câu ngắn nói vì sao sai mà không nói đáp án.
- **`da-va-dat/14` q4:** câu hỏi nay hỏi dữ liệu, `hint` "More water makes a taller bar." dạy cách đọc biểu đồ, hai `feedback` nói cột của chính lựa chọn đó, `explanation_correct` nói lý do (hạt to), `explanation_wrong` nói dữ liệu. EN và VI khớp nghĩa.
- **`explanation_correct` câu 6:** 40/40 câu Na đứng riêng được, không "Yes!", "Đúng rồi!", "Na chưa đúng", "This is false", "The answer is". Explorer: 8 câu q6 `true_false` đáp án Sai cũng không câu nào vi phạm (các câu "Yes!" còn lại đều ở câu không có thẻ Tổng kết).
- **EN/VI:** mọi cặp chữ mới đọc khớp nghĩa; không câu VI nào dịch máy lệch. Số từ EN: `validate` chỉ còn 2 câu 11 từ (đã biết).
- **Vị trí thẻ:** không `hint`/`feedback`/giải thích mới nào nhắc "thẻ đầu", "bên trái"; hai câu nhắc vị trí *trong hình* (`ho-hap/03` q4, `thoi-tiet/02` q4) vẫn đúng vì hình không bị xáo.

**Nên sửa:** các mục 1–5 ở phần Lỗi.

### Việc 5 của đề bài (chuyển vector vàng sang `packages/content-schema/test-vectors/`): chưa làm

Lý do: thư mục vector có khuôn chặt (`vector.schema.json`, `check-vectors.mjs` kiểm đủ file theo bảng Phạm vi, `platforms`, `default_rules` giống nhau ở mọi file, số case tối thiểu; `run-reference.mjs` chạy mọi case qua một bản cài tham chiếu bằng JS). Thêm hai bộ (`seeded-order`, `key-point-pictures`) phải sửa cả hai công cụ, README và viết bản cài tham chiếu JS cho SplitMix64 + Fisher–Yates và thuật toán ghép hình — việc này đủ một ticket riêng, và nên làm cùng lúc với lượt Android chép thuật toán. Hiện vector vàng vẫn nằm trong `QuizWaveOneTests.goldenPermutations` và bảng 34 bài trong `KeyPointPicturesTests`, cả hai đã pass trên gói thật (59/59 bài). Đề nghị PM mở ticket "test vector xáo + hình thẻ ý chính" cho Đợt 2.

### Dọn máy

Trả `lessons/` và `sync/` của Science Kids về bản sao lưu trước lượt kiểm; máy iPhone 16 Pro để nguyên (app khác của Duy đang chạy). Không chạy `tts`, không build lại gói.

### content-editor 16/11 · sửa mục nên sửa 1–5

Chỉ sửa `content/**/*.md`. Không chạy lệnh nào (chưa `validate`, `tts`, `build`). Không đổi dòng `id:` nào. Câu hướng dẫn MC không đổi. Mọi chữ mới là nháp AI, có dòng `> SK-047 (16/11, nháp AI, …)` ngay dưới chỗ đổi. Mỗi câu có chữ hay hình đổi đều tăng `version` (kể cả câu chỉ đổi `hint`). Chưa commit.

**File đã sửa (7 bài + 1 `_topic.md`):**
- `content/discoverer/thoi-tiet-va-thien-tai/02-do-thoi-tiet.md`: việc 1, 4, 5.
- `content/discoverer/ho-hap/04-giu-phoi-khoe.md`: việc 2, cộng hai chỗ cùng loại.
- `content/discoverer/da-va-dat/15-nha-dia-chat-lam-gi.md`: việc 3.
- Quét cùng loại: `thoi-tiet-va-thien-tai/03-mua-mua-bao.md`, `/04-lu-lut-va-han-han.md`, `/05-an-toan-khi-co-bao-lu.md`, `ho-hap/03-tho-khi-chay-nhay.md`.
- `thoi-tiet-va-thien-tai/_topic.md`: bảng Hình dùng chung, dòng `tray_clock` (bỏ "bài 2 q3_clock").

#### 1. Chữ cũ → chữ mới (chữ bé đọc hoặc nghe; dev sinh lại clip đúng các chuỗi này)

| Bài · câu · trường | Cũ (EN · VI) | Mới (EN · VI) | `version` |
| --- | --- | --- | --- |
| `thoi-tiet/02` q2 `sentence` | The {1} catches rain to show how much fell. · Mình dùng {1} để hứng mưa, xem mưa nhiều hay ít. | The {1} shows how much water fell from the sky. · Nhìn {1}, mình biết trời đổ xuống bao nhiêu nước. | 2 → 3 |
| `thoi-tiet/02` q5 `hint` | Remember where to put a rain gauge. · Em nhớ lại nên đặt ống đo mưa ở đâu nhé. | Think of standing under a big tree in the rain. · Em nghĩ tới lúc đứng dưới tán cây to khi trời mưa nhé. | 1 → 2 |
| `thoi-tiet/02` q6 `hint` | Remember the Our feelings card. · Em nhớ lại ô Cảm giác của mình nhé. | Think of a friend who sat and watched Na run. · Em nghĩ tới một bạn ngồi yên xem Na chạy nhé. | 1 → 2 |
| `ho-hap/04` q5 thẻ sai | `q5_smoke`: smoke · khói; feedback "Smoke comes from fire, and a blanket is not burning." · "Khói bốc lên từ lửa, mà chăn không cháy." | `q5_steam`: steam · hơi nước; feedback "Steam rises from hot water, not from a dry blanket." · "Hơi nước bốc lên từ nước nóng, không phải từ chăn khô." | 2 → 3 |
| `ho-hap/04` q4 thẻ sai (quét) | `q4_road`: by the road · bên đường; feedback "Cars by the road add even more dust." · "Xe cộ bên đường còn làm thêm bụi." | `q4_schoolyard`: in the schoolyard · ở sân trường; feedback "The schoolyard is outside, in the same smoky air." · "Sân trường ở ngoài trời, cũng đầy khói bụi." | 1 → 2 |
| `ho-hap/04` w2 `hint` (quét) | Remember the Food and air card. · Em nhớ lại ô Thức ăn và không khí nhé. | Put a hand on your chest and breathe in. · Em đặt tay lên ngực rồi hít vào nhé. | 1 → 2 |
| `da-va-dat/15` q2 `hint` | Remember the New words page of this lesson. · Em nhớ lại trang Từ mới của bài này nhé. | Think of the people who test rock and soil samples. · Em nghĩ tới những người mang mẫu đá, mẫu đất về thử nhé. | 2 → 3 |
| `thoi-tiet/04` w1 `hint` (quét) | Remember the Storm season card. · Em nhớ lại ô Mùa mưa bão nhé. | Think of the storm photo taken from space. · Em nghĩ tới tấm ảnh cơn bão chụp từ vũ trụ nhé. | 1 → 2 |
| `thoi-tiet/04` w3 `hint` (quét) | Remember the Rainy card in the first lesson. · Em nhớ lại ô Trời mưa ở bài đầu tiên nhé. | Look up at the sky just before it rains. · Em nhìn lên trời ngay trước khi mưa nhé. | 1 → 2 |
| `thoi-tiet/03` w3 `hint` (quét) | Remember Na's idea in the first lesson. · Em nhớ lại ý của Na ở bài đầu tiên nhé. | Think of wind over the sea, far from trees. · Em nghĩ tới gió ngoài biển, nơi không có cây nhé. | 1 → 2 |
| `thoi-tiet/05` q2 `hint` (quét) | Remember the Listen card. · Em nhớ lại ô Lắng nghe nhé. | Think of the village loudspeaker before a storm. · Em nghĩ tới cái loa xã trước khi bão tới nhé. | 2 → 3 |
| `thoi-tiet/05` q5 `hint` (quét) | Remember what wind is from the first lesson. · Em nhớ lại gió là gì ở bài đầu tiên nhé. | Think of how trees bend in a storm. · Em nghĩ tới cây cối ngả rạp trong cơn bão nhé. | 1 → 2 |
| `ho-hap/03` q2 thẻ sai `q2_jumps` (quét) | chỉ đổi hình: `tray_rope` → `tray_hopscotch`; `alt` "A skipping rope" · "Sợi dây nhảy" → "A hopscotch drawn on the ground" · "Ô nhảy lò cò vẽ trên sân" | nhãn, `feedback` giữ, không sinh giọng | 1 → 2 |

Chủ đề cần dev sinh lại giọng: *Thời tiết và thiên tai* (bài 2, 3, 4, 5), *Hô hấp* (bài 4), *Đá và đất* (bài 15). *Hô hấp* bài 3 chỉ đổi hình và `alt`.

Ngân sách chữ: mọi câu mới tối đa 10 từ EN (câu q2 `thoi-tiet/02` đúng 10 từ, chỗ trống tính một từ).

#### 2. Từng việc

1. **`thoi-tiet/02` q6, q5.** Gợi ý q6 nay trỏ bằng chứng: một bạn ngồi yên trong cùng không khí không thấy nóng như Na. Gợi ý q5 cũ trỏ thẳng ví dụ "put it in an open place" của ô Ống đo mưa, chính là phán quyết, nên tôi sửa luôn. Gợi ý mới trỏ trải nghiệm đứng trú dưới tán cây lúc mưa.
2. **`ho-hap/04`.** Thẻ sai `q5_smoke` đổi thành `q5_steam` (hơi nước), cùng loại với "dust", "oxygen". Hình dùng lại `q3_steam` của chính bài; hình này chỉ mang vai sai (lựa chọn sai ở câu q3), nên không phạm luật. Hơi nước có sức hút vì giũ chăn cũng bay lên một làn trắng. Cùng file, quét thấy thêm `q3_road` (đúng ở q3) và `q4_road` (sai ở q4) chung một hình, nên tôi đổi `q4_road` thành `q4_schoolyard`. Hình là sân trường vắng (hình vẽ) của `ho-hap/tho-khi-chay-nhay`; bài này chỉ dùng hình đó làm hình câu hỏi w1, không làm lựa chọn.
3. **`da-va-dat/15` q2.** Gợi ý trỏ việc của người làm ngành này trong bài (ô Mẫu: mang mẫu đá, mẫu đất về thử). Gợi ý không có chữ "geolog-" hay "địa chất".
4. **`thoi-tiet/02` q2.** Câu EN mới không có "rain" hay "gauge"; câu VI không có "mưa" hay "đo". Nghĩa giữ nguyên: ống đo mưa cho biết trời đổ xuống bao nhiêu nước. Chữ "nước" trong câu VI làm thẻ "phích nước" có sức hút; `feedback` của thẻ đó đã nói phích không hứng mưa.
5. **`thoi-tiet/02` ghi chú.**
   - Câu q3: dòng DOK 2 nay kể đúng ba đáp án đúng, một bẫy là cái ô, bỏ "kim đồng hồ" và "đáp án ở chỗ thứ hai và thứ tư".
   - Dòng rà chữ dưới `q3_ribbon`: bỏ "wall clock" và ghi chú hình đồng hồ, ghi hết hiệu lực.
   - Sửa theo các ghi chú cũ khác cùng bị lệch: Vai của hình ở đầu Quiz, Loại hình và Dùng lại cho hoạ sĩ, Block và format (q3 "ba đúng"), Nhãn dài, Ý chính (câu q2 không còn hỏi gió).

#### 3. Hình cho designer

Không cần hình mới. Ba việc ở file chọn ảnh:
- `content/images/discoverer/ho-hap/giu-phoi-khoe.json`:
  - thêm `q5.q5_steam` trỏ cùng ảnh với `q3.q3_steam`, gỡ `q5.q5_smoke`;
  - thêm `q4.q4_schoolyard` trỏ ảnh `q1` của `ho-hap/tho-khi-chay-nhay`, gỡ `q4.q4_road`.
- `content/images/discoverer/ho-hap/tho-khi-chay-nhay.json`: trỏ `q2.q2_jumps` sang ảnh `tray_hopscotch`.

#### 4. Kết quả quét cùng loại (`content/discoverer/**`, `content/explorer/**`)

**a. `hint` trỏ "New words" / "trang Từ mới".** Toàn repo chỉ có `da-va-dat/15` q2, đã sửa.

**b. `hint` trỏ một ô có câu chính là phán quyết.** Đã sửa sáu câu (bảng mục 1, đánh dấu "quét"). Ô hoặc lời Na mà gợi ý cũ trỏ tới:
- `thoi-tiet/04` w3: ô "Rain is water that falls from clouds.", trùng câu khẳng định.
- `thoi-tiet/04` w1: ô có sẵn câu FB đã điền đáp án.
- `thoi-tiet/05` q2: như `thoi-tiet/04` w1.
- `thoi-tiet/05` q5: ô "Wind is air that is moving.".
- `thoi-tiet/03` w3: lời Na ở bài một, mà bé đã biết Na chưa đúng.
- `ho-hap/04` w2: ô "Food goes to your stomach, and air to your lungs.".

Chưa sửa, cần người duyệt chốt:
- `thoi-tiet/05` w3 "Remember the Stay safe card about earthquakes." Câu của ô là "Drop, cover and hold on…", không phải phán quyết. Tôi chưa rà ví dụ của ô.
- Gợi ý của các câu SC, MC nhớ lại kiểu "Remember the X picture", mà ví dụ của ô X có đáp án. Ví dụ: `da-va-dat/15` q1 (ô Fieldwork có "rock hammer") và q3 (ô Samples có hai cách thử đúng). Tôi coi đây là gợi ý nhớ lại ở DOK 1 và 2, không tự sửa. Nếu PM muốn áp luật chặt cho cả SC, MC thì còn khoảng sáu mươi gợi ý "Remember the … picture/card" ở Discoverer phải rà từng câu.
- `ho-hap/03` q1 "Remember the Faster card." (tên ô gần chữ "fastest" của câu hỏi).
- `ho-hap/04` q2 "Think of farmers burning straw…" tả đúng hình của thẻ đúng.
- `ho-hap/04` q4 "Where is the air cleanest on a smoky day?" là câu hỏi thẳng.
- Explorer: không có nút gợi ý (tester đã xác nhận), `hint` chỉ đọc sau lần chạm sai, và luật Explorer số 6 cho nhắc tên ô Học. Tôi không áp luật SK-047 về gợi ý cho Explorer. Không có gợi ý Explorer nào trỏ "New words".

**c. Câu FB ở Quiz chứa gốc từ của đáp án.** Bản EN: sau khi sửa `thoi-tiet/02` q2, không còn câu nào (đã rà 37 câu Quiz và 3 câu Khởi động). Explorer không có FB. Bản VI còn bốn chỗ trùng gốc do cách gọi tên trong tiếng Việt, tôi chưa sửa vì tránh thì câu VI lệch nghĩa EN hoặc mất tự nhiên:
- `an-uong-lanh-manh/02` q2: "Bữa sáng, bữa trưa, bữa tối đều là một {1}.", đáp án "bữa ăn".
- `da-va-dat/11` q2: "Những mảnh đá nhỏ nhất trong đất là {1}.", đáp án "đất sét"; hai thẻ sai "bùn mịn", "chất hữu cơ" không có chữ "đất".
- `ho-hap/02` q2: "Không khí đi vào qua {1}, rồi xuống {2}.", đáp án "khí quản"; thẻ sai "thực quản".
- `da-va-dat/05` q2: chữ "nước" có ở đáp án "thấm nước" và cả thẻ sai "không thấm nước", nên không thành dấu hiệu. Không cần sửa.

**d. Một hình vừa là thẻ đúng vừa là thẻ sai trong cùng bài.**
- Cách quét: so lựa chọn và thẻ từ ở Khởi động và Quiz, theo `image.brief` "Dùng lại hình …" và key hình. Không tính hình câu hỏi, không tính kệ Chơi.
- Đã sửa ba chỗ: `ho-hap/04` (q2/q5 khói; q3/q4 đường), `ho-hap/03` (`tray_rope`: đúng ở q1, sai ở `q2_jumps`).
- Còn lại, chưa sửa, vì mỗi chỗ là ý đồ của câu (cùng một vật, cùng một nghĩa, nhưng câu hỏi khác nhau). Sửa thì phải soạn lại câu hoặc tìm hình mới.

| Bài | Hình | Đúng ở | Sai ở |
| --- | --- | --- | --- |
| `be-mat-trai-dat/01` | `tray_sea` | q4 (chứa nhiều nước nhất), q5 (nước) | q1 (nơi nào là đất) |
| `be-mat-trai-dat/02` | `tray_atlantic`, `tray_arctic` | q3 (đại dương) | q5 (Mai bơi ở đâu); lượt 15/11 đã ghi là cố ý |
| `be-mat-trai-dat/03` | `q1_crust`, `q1_core`, `q1_mantle` | q1, q2, q3 theo từng lớp | các câu còn lại hỏi lớp khác |
| `be-mat-trai-dat/04` | `q4_underground` | `q2_magma` | q4 |
| `khung-long/01` | `w1_triceratops`, `tray_longneck`, `tray_mammoth` | w1, q1 (khủng long); q5 (voi ma mút: sau khủng long) | q5 (khủng long); q3 (voi ma mút: cùng thời) |
| `nao-bo-va-giac-quan/03` | `w1_eye`, `q1_tongue` | q3 (mắt); q1 (lưỡi) | q1 (mắt); q3 (lưỡi) |

- **Câu hỏi cho PM:** luật "không hình nào vừa đúng vừa sai" áp chặt (mọi câu trong bài) hay theo `thoi-tiet/_topic.md` ("hai vai trái nhau cho cùng ý")? Nếu áp chặt, cần một lượt riêng cho sáu bài trên, có thể cần hình mới (ví dụ `be-mat-trai-dat/02` q5 cần ảnh một đại dương khác).
- `da-va-dat`: `_topic.md` đã có luật chặt (dòng 712), và bài 11–15 ghi đã đạt. **Bài 01–10 tôi chưa quét hết luật này** (hết ngân sách phiên). Explorer: chưa quét luật hình.

#### 5. Chưa chắc

- `thoi-tiet/02` q2: câu VI "Nhìn {1}, mình biết trời đổ xuống bao nhiêu nước." Nhờ người duyệt nghe thử; nếu thấy chưa xuôi, có thể dùng "Nhìn {1}, mình biết trời mưa xuống bao nhiêu nước." Nhưng chữ "mưa" sẽ quay lại, phạm luật gốc từ.
- `ho-hap/04` q4: thẻ sân trường. Hình sân trường cũng là hình câu hỏi của w1 cùng bài, bé gặp lại hình này hai lần (một lần là hình câu hỏi, một lần là lựa chọn sai).
- `ho-hap/03` q2: hình ô lò cò là món đúng (nhóm "Jump") ở kệ Chơi. Vai ở kệ Chơi tôi không tính vào luật.
- Tăng `version` cho cả câu chỉ đổi `hint` là theo đề bài lượt này; lượt 15/11 không tăng cho câu chỉ đổi `hint`. Nếu dev chỉ muốn tăng khi đổi đáp án hay lựa chọn thì báo, tôi trả lại.

**Bổ sung 16/11 (theo "designer 16/11"):** sửa chữ `image.brief` cho khớp hình dựng lại, chỉ ghi chú, không đổi chữ bé đọc hay nghe, không tăng `version`, không cần sinh giọng.
- `khung-long/01-trai-dat-rat-lau-ve-truoc.md`:
  - `explore_dinosaurs`: ba khung xếp cột dọc, cũ nhất ở trên, mũi tên đỏ son từ trên xuống.
  - `explore_people`: trục dày hết bề ngang, ảnh khủng long cổ dài to trên dải nâu, diều (trên) và voi ma mút (dưới) thành một cột ở cuối trục.
  - Hình câu q4 và ba lựa chọn: "ảnh nhỏ" thành "ảnh cỡ to đứng trên dải nâu, cắt giống hệt ô explore_people", dấu ngắt ở phần phải mẩu xám; `q4_before` thêm "không che dấu ngắt".
- `da-va-dat/14-nuoc-tham-qua-dat-nao-nhanh-hon.md` q4: brief thành "[hình vẽ] bản dải ngang của `explore_setup`", trỏ file riêng `b14-q4-chart.jpg`; ghi rõ hình là dụng cụ thí nghiệm, có hai chai (cát, sét), còn biểu đồ có ba loại đất. `alt` vẫn đúng, không đổi.

**Dọn ghi chú vị trí đáp án (16/11, theo tester kiểm lại):**
- Phạm vi: 67 dòng ghi chú `>` trong 27 file bài.
  - Discoverer: `thoi-tiet-va-thien-tai` 01–05, `ho-hap` 01–04, `khung-long` 01–05, `da-va-dat` 02, 03, 05–10, 13, 14, `nao-bo-va-giac-quan` 01, 02, 04.
  - Explorer: không có dòng nào.
- Đã bỏ:
  - mọi câu "Đáp án ở chỗ thứ…", "Thẻ đúng ở chỗ thứ…", "(bảng vị trí)";
  - ghi chú rà chữ "đáp án chuyển lên/xuống thứ … (trước đây thứ …)". 20 dòng chỉ có ý này nên xoá hẳn, 47 dòng sửa tại chỗ.
- Giữ phần còn đúng (DOK, sức hút của lựa chọn sai, kiểu hình). Bốn dòng ghi lại là nhãn tự nói vị trí hay thời điểm, nên app xáo vẫn đúng: `khung-long/01` q4, `da-va-dat/05`, `da-va-dat/14` (cột biểu đồ không xáo), `ho-hap/03` biểu đồ.
- Không đổi chữ bé đọc hay nghe, không tăng `version`.
- Đề mục và dòng "hết hiệu lực" trong `_topic.md` và TEMPLATE giữ nguyên.
- Còn hai dòng có "chỗ thứ" nhưng nói về kệ Chơi, không phải vị trí đáp án, nên giữ: `be-mat-trai-dat/04` dòng 310 và `nao-bo-va-giac-quan/01` dòng 259.
- Chưa đổi "ngả rạp" ở `thoi-tiet-va-thien-tai/05` (chờ Duy).

### Điều phối 16/11 · quyết định cho các câu content-editor để ngỏ

Duy chọn "Sửa 8 lỗi trước" (16/11). Các câu dưới đây là quyết định điều phối, giữ phạm vi Đợt 1; Duy có thể đổi khi review.

- **Luật "một hình vừa đúng vừa sai"**: áp theo cách `thoi-tiet-va-thien-tai/_topic.md` đã ghi, tức chỉ khi cùng một hình mang hai vai trái nhau cho cùng một ý trong bài (như `ho-hap/04` khói, `ho-hap/03` dây nhảy). Sáu bài chỉ phạm khi đọc luật chặt (`be-mat-trai-dat` 01–04, `khung-long/01`, `nao-bo-va-giac-quan/03`) giữ nguyên lượt này; ghi vào danh sách Đợt 2.
- **Phần quét chưa xong** (`da-va-dat` 01–10, Explorer) theo luật trên: tester quét trong lượt kiểm lại; có chỗ phạm thì trả content-editor.
- **Gốc từ chỉ còn ở câu VI** (`an-uong-lanh-manh/02` q2 "bữa", `da-va-dat/11` q2 "đất", `ho-hap/02` q2 "khí"): chấp nhận, vì là từ ghép tiếng Việt; câu EN đã sạch.
- **Gợi ý SC/MC "Remember the X picture"** (khoảng 60 câu): ngoài phạm vi lượt này, để Đợt 2 cùng lượt rà gợi ý.
- **`version`**: giữ việc tăng `version` cho câu chỉ đổi `hint`.

### designer 16/11 · hình thẻ ý chính và ảnh câu biểu đồ

Theo mục "nên sửa" 8 của tester, đoạn "Biểu đồ `da-va-dat/14` q4" và ba mục `ho-hap` của content-editor 16/11. Chỉ sửa `content/images/` và `design/`. Không sửa `content/**/*.md`, `apps/`, `tools/`. Không chạy `tts`, `build`. Chưa commit.

**Đã chạy:**
- `images fetch` cho 9 file chọn ảnh bị đổi: 0 lỗi, 0 tải mới (mọi ảnh nguồn đã có trong cache), không cảnh báo lệch khung.
- `validate` các chủ đề `ho-hap`, `khung-long`, `da-va-dat`, Explorer `chuoi-thuc-an`: 0 lỗi.
- Script đối chiếu khoá (markdown so với file chọn ảnh) cho `ho-hap`, `khung-long`, `da-va-dat`: 0 khoá thiếu, 0 khoá thừa.

**Trang duyệt:** `content/.build/images/sk047-1611.html`.
- Mỗi hình đổi có bản trước và sau, vẽ đúng cỡ trên máy (1 px = 1 pt) ở mọi chỗ dùng: thẻ ý chính, trang Học, Từ mới, thẻ lựa chọn.
- `content-cli` không có lệnh dựng `review.html`; các trang `review.html` theo bài là trang tay của các lượt trước. Trang của `khung-long/01` trỏ thẳng vào file ghép nên tự hiện hình mới, trừ dòng `vocab.million`.

#### 1. Việc 1: thẻ ý chính `khung-long/01`

**Nguyên nhân:**
- Hình vuông, app không cắt, nhưng mảnh nhỏ và rời rạc.
- `explore_dinosaurs` xếp ba khung nhỏ theo đường chéo, khung cách nhau xa.
- `explore_people`: dải trục mảnh, ba ảnh nhỏ không chạm trục.

**`explore_dinosaurs`, dựng lại:**
- Ba khung giấy cùng bề rộng xếp thành một cột, cũ nhất ở trên. Mũi tên đỏ son chạy dọc bên trái, từ trên xuống.
- Mỗi khung cắt sát con vật. Ở 136 pt, Plateosaurus to gấp 1,5 lần, hai con kia to hơn 12–20 %.
- Giữ quyết định 10/11: mỗi loài một khung, không chữ, không nhãn, không người.
- Lệch brief: brief ghi "xếp thành hàng ngang… mũi tên từ trái sang phải". Đề xuất content-editor sửa chữ brief theo hình: cột dọc, mũi tên từ trên xuống. Hàng ngang ba con vật dài trong khung vuông thì mỗi con chỉ rộng chừng 37 pt.

**`vocab.million`, mục mới:**
- Hình ghép 4:3 riêng, `trai-dat-rat-lau-ve-truoc.vocab.million.jpg`, cùng ba ảnh nguồn.
- Lý do: khung Từ mới 4:3 (150×104) cắt hình vuông, mất khung trên và chân khủng long bạo chúa.

**`explore_people`, dựng lại:**
- Trục giấy dày chạy hết bề ngang. Tỉ lệ dải nâu 71 % và đoạn nhạt 29 % giữ nguyên.
- Ảnh khủng long cổ dài to, đứng trên dải nâu.
- Cánh diều (trên) và voi ma mút (dưới) xếp sát nhau thành một cột ở cuối trục.
- Không mảnh nào lơ lửng.
- Nội dung nằm trong dải giữa (y 206–815 trên 1024), nên `vocab.timeline` (`same_as`) vẫn thấy trọn ở khung 4:3.

**`q4` và ba lựa chọn, dựng lại cho khớp trục mới:**
- Cùng mẩu xám, dải nâu, đoạn nhạt, cùng cách cắt ảnh khủng long. Brief yêu cầu "giống hệt hình ô Học".
- Hai khe chéo dời sang phần phải mẩu xám, để chấm "trước khủng long" không che dấu ngắt.
- Chấm đỏ cỡ 96 trong vòng 120 (trên 1024).
- App ẩn hình câu hỏi q4, vì mọi lựa chọn đều có hình.

**Ảnh nguồn:** giữ nguyên, không tìm ảnh mới.

| Hình | Ảnh nguồn | Giấy phép |
| --- | --- | --- |
| `explore_dinosaurs`, `vocab.million` | Plateosaurus reconstruction (Atlantis536) | CC0 1.0 |
| | Stegosaurus 2026 (Plegadis), dùng lại từ `khung-long-la-gi` | CC0 1.0 |
| | Tyrannosaurus 2026 (Plegadis), dùng lại từ `khung-long-la-gi` | CC0 1.0 |
| `explore_people` | ParkAnava2013Modiin 0022a (MathKnight) | CC BY 3.0 |
| | Woolly mammoth model (Thomas Quine) | CC BY 2.0 |
| | Rainbow kite in a cloudy sky (Jennifer Bourn) | CC0 1.0 |
| `q4` và ba lựa chọn | ParkAnava2013Modiin 0022a (MathKnight) | CC BY 3.0 |

Tranh của Plegadis vẫn cắt bỏ dấu ký tên. Không vẽ thêm vật. Hình ghép giữ giấy phép chặt nhất của các phần: `explore_people` và q4 là CC BY; `explore_dinosaurs` và `vocab.million` là CC0.

#### 2. Đối chiếu 59 bài (177 thẻ ý chính)

**Cách làm:**
- Script tính hình của từng thẻ bằng đúng thuật toán ghép theo chữ (mục `sec-kp` của `Quiz-Dot1.html`), trên gói `ceeb1eb6912a`.
- Hình của mỗi thẻ được vẽ ở cỡ thật: Discoverer 136, Explorer ~153, cắt giữa như app.

**Kết quả:**
- 22 thẻ là hình ghép, 51 thẻ là hình tự vẽ, 97 thẻ là ảnh chụp.
- 7 thẻ chưa có hình: `be-mat-trai-dat/02` ý 3 (bản đồ chờ Duy) và 6 thẻ của `an-uong-lanh-manh`.

Ngoài `khung-long/01`, thêm hai nhóm hình bị cắt mất mảnh, trông như hình lỗi, tệ ngang `khung-long/01`. Tôi đã sửa cả hai. Nguyên nhân chung: hình 4:3 trải hết bề ngang, nên khung vuông cắt mất mảnh đầu và mảnh cuối. Lỗi này có cả ở trang Học, không chỉ ở thẻ ý chính.

**Chuỗi thức ăn (Explorer):**
- Bốn hình: `02 explore_chain` (ý 2 "A food chain starts with a plant."), `03 explore_whole` (ý 3), `04 explore_same` (ý 1), `04 explore_compare` (ý 3).
- Lỗi: thẻ ý chính và trang Học Explorer (322×380, khung dọc) cắt mất nửa cây ở đầu chuỗi và nửa con vật cuối.
- Sửa: hình vuông 1024, chuỗi trọn ở giữa, rộng 856. Khung ngang (câu q6, hàng từ 140×92) vẫn lấp đầy.
- Ảnh nguồn và mũi tên giữ nguyên, chỉ thu nhỏ và đặt lại. Đều là CC BY 2.0, CC BY 3.0 và CC0, như mục ảnh cũ.

**`da-va-dat/03` `explore_properties` (ba hòn đá):**
- Lỗi: khung vuông cắt mất nửa đá phấn và nửa đá hoa cương.
- Sửa: hàng đá thu vào giữa (rộng 760 trên 1024), vẫn giữ 4:3 để câu q1 (khung ~2,3:1) còn lấp đầy.
- Ảnh nguồn: ba ảnh của James St. John, CC BY 2.0.

**Danh sách cho Đợt 2 (`key_point_images`), chưa sửa:**

| Bài · ý | Hình | Vì sao |
| --- | --- | --- |
| `khung-long/02` ý 1 | `explore_kinds` (ghép) | Khủng long nhỏ và con gà chỉ còn 2–3 pt, nên thẻ chỉ nói được "to", không nói được "nhỏ". Cần một hình to và nhỏ cạnh nhau. |
| `khung-long/02` ý 2 | `explore_reptiles` (ghép) | Hai mảnh có mũi tên. Ở 136, chân bộ xương khó đọc. |
| `khung-long/03` ý 2 | `explore_forms` (tự vẽ) | Sơ đồ ba bước có mũi tên, mỗi bước chỉ khoảng 40 pt. |
| `da-va-dat/09` ý 1 | `explore_amber` (tự vẽ, 4:3) | Khung vuông cắt mất phần phải miếng hổ phách. Trang Học cũng bị. Sửa được như ba hòn đá nếu Duy muốn. |
| `da-va-dat/14` ý 2 | `explore_fair` (tự vẽ, 4:3) | Ca nước bên trái sát mép. |
| `nao-bo-va-giac-quan/03` ý 1 | `explore_five` (ghép) | Năm ô giác quan, mỗi ô khoảng 25 pt. Còn đọc được. |
| 7 thẻ chưa có hình | | Như trên. |

Các hình ghép khác đọc được ở 136 (`be-mat-trai-dat/03` ba cặp vỏ trứng, `khung-long/02` ý 3, `khung-long/05` ý 3, `da-va-dat/13` ý 3, `chuoi-thuc-an/02` ý 3).

Đề xuất chung cho hình nhóm Học về sau: đặt mọi mảnh trong ô vuông giữa hình. Lý do: khung `learn_group` là 1:1; trang Học Explorer là khung dọc; thẻ ý chính là khung vuông.

#### 3. Việc 2: ảnh câu biểu đồ `da-va-dat/14` q4. Chọn hướng (a)

**Khung app không sai so với thiết kế:**
- Canvas `c-ask` vẽ ô ảnh rộng ~3:1 (338×112).
- App vẽ cao 120 (ảnh 104), rộng theo máy: 314×104 (SE), 329×104 (390), 341×104 (16 Pro), 379×104 (Pro Max), 523×164 (iPad). Tức là 3,0–3,6:1.
- Ảnh 4:3 `explore_setup` lệch ×2,4, quá ngưỡng 2,2 của `PictureFit` (Duy 13/11), nên app vẽ cả ảnh nhỏ giữa giấy lõm. Đúng luật.
- Canvas cắt lấp đầy (không theo luật 2,2), nên không lộ chỗ này.
- Gói chỉ có một câu biểu đồ, nên không có ảnh câu biểu đồ khác để so.

**Đã làm:**
- q4 có mục ảnh riêng, thay `same_as`: `own` `content/images/own/da-va-dat/b14-q4-chart.jpg`, 1024×352 (≈ 2,9:1), `method: drawn`, credit "Science Kids".
- Nội dung là chính hình vẽ `explore_setup`: chai đất cát, ca nước, chai đất sét xếp thành một hàng.
- Không vẽ thêm vật. Mỗi vật được dời theo phần khác nền (nền kem trơn, khớp bằng mặt cong bậc hai), nên không có đường nối. Đuôi bóng của cốc bên phải nằm dưới quai ca, được lấy đối xứng từ cốc bên trái.
- Nội dung cao 79 % ảnh, để máy rộng nhất (Pro Max) không cắt miệng chai.

**Vì sao 2,9:1 mà không 3:1:**
- `image-slots.json` kiểm hình câu hỏi theo khung 4:3. Ảnh 3:1 lệch ×2,25, quá 2,2, nên `build` sẽ báo "lệch khung… ảnh hiện nhỏ", báo sai.
- 2,9:1 lệch ×2,18, không bị báo. Trong app ảnh vẫn lấp đầy, chỉ cắt trên dưới 2–20 % tuỳ máy, phần đó để trống sẵn.

**Canvas:** `Quiz-Dot1.html` khung `c-ask`, `c-solid`, `c-retry`, `c-right`, `h-chart-open` dùng ảnh mới `img/dd14-q4-chart.jpg`, thêm ô "Rà 16/11" dưới `c-ask`.

**ios-dev:** không phải sửa gì.

**Đề xuất cho dev (không chặn):**
- Thêm khung riêng cho hình câu `picture_bar_chart` trong `image-slots.json` (~3:1) và `slotOf`.
- Như vậy ảnh câu biểu đồ 4:3 sẽ bị báo ngay (lần này lọt vì khung kiểm là 4:3).

**Nội dung, báo content-editor (không chặn):**
- Biểu đồ có ba loại đất (vườn, cát, sét), hình chỉ có hai chai (cát, sét).
- Brief q4 vẫn ghi "Dùng lại hình `explore_setup`". Nên đổi thành "[hình vẽ] bản dải ngang của `explore_setup`".

#### 4. Ba mục `ho-hap` (content-editor 16/11)

Không cần ảnh mới.

**`content/images/discoverer/ho-hap/giu-phoi-khoe.json`:**
- Thêm `q5.q5_steam` → `same_as: q3.q3_steam` (góc bếp nồi cơm bốc hơi, hình vẽ). Gỡ `q5.q5_smoke`.
  - Ở q3 hình này cũng là lựa chọn sai, nên không mang hai vai trái nhau.
  - Khung thẻ từ 1:1 cắt giữa vẫn thấy trọn nồi và làn hơi.
  - Cùng kiểu hình vẽ với `q5_dust`, `q5_oxygen`.
- Thêm `q4.q4_schoolyard` → `same_as: q1`, `lesson: ho-hap/tho-khi-chay-nhay`. Gỡ `q4.q4_road`.

**`content/images/discoverer/ho-hap/tho-khi-chay-nhay.json`:**
- `q2.q2_jumps` → `same_as: tray.tray_hopscotch` (ô lò cò vẽ trên sân), thay `tray.tray_rope`.
- Khung 1:1 cắt giữa vẫn thấy trọn các ô. Cùng kiểu hình vẽ với `q2_steps`, `q2_breaths`.

**Ảnh `q1` của `tho-khi-chay-nhay` có hợp lựa chọn "ở sân trường" không: hợp.**
- Hình vẽ sân trường vắng: dãy lớp vàng, hai cây phượng, sân lát.
- Cùng kiểu hình vẽ với `q4_inside` (khối đồ chơi cạnh cửa sổ) và `q4_park`.
- Khung thẻ 5:2 cắt giữa vẫn thấy dãy lớp, cây và sân.
- Hai điểm nhỏ, không phải sửa:
  - Trời trong hình xanh, trong khi câu hỏi là hôm khói bụi. Hình công viên cũng vậy: hình chỉ nơi chốn, không chỉ không khí hôm đó.
  - Bé gặp hình này hai lần trong bài: một lần là hình câu hỏi w1 ("thở nhanh nhất"), một lần là lựa chọn sai ở q4. Hai vai không trái nhau.

#### 5. File đổi

**`content/images/composed/`:**
- `khung-long/`:
  - `trai-dat-rat-lau-ve-truoc.learn.explore.explore_dinosaurs.jpg`
  - `trai-dat-rat-lau-ve-truoc.learn.explore.explore_people.jpg`
  - `trai-dat-rat-lau-ve-truoc.q4.jpg`
  - `trai-dat-rat-lau-ve-truoc.q4.q4_before.jpg`, `.q4_with.jpg`, `.q4_after.jpg`
  - mới: `trai-dat-rat-lau-ve-truoc.vocab.million.jpg`
- `chuoi-thuc-an/`:
  - `chuoi-thuc-an-la-gi.learn.explore.explore_chain.jpg`
  - `moi-loai-mot-vai.learn.explore.explore_whole.jpg`
  - `so-sanh-cac-chuoi-thuc-an.learn.explore.explore_same.jpg`
  - `so-sanh-cac-chuoi-thuc-an.learn.explore.explore_compare.jpg`
- `da-va-dat/b03-learn.explore.explore_properties.jpg`

**`content/images/own/`:** mới `da-va-dat/b14-q4-chart.jpg`.

**File chọn ảnh:**
- `content/images/discoverer/khung-long/trai-dat-rat-lau-ve-truoc.json`: note 6 mục, `vocab.million` thành hình ghép.
- `content/images/discoverer/da-va-dat/nuoc-tham-qua-dat-nao-nhanh-hon.json`: q4.
- `content/images/discoverer/da-va-dat/da-nao-cung-hon.json`: note.
- `content/images/explorer/chuoi-thuc-an/chuoi-thuc-an-la-gi.json`, `moi-loai-mot-vai.json`, `so-sanh-cac-chuoi-thuc-an.json`: note.
- `content/images/discoverer/ho-hap/giu-phoi-khoe.json`, `tho-khi-chay-nhay.json`.

**`design/`:**
- `design/play-ui/options/lesson-less-text/Quiz-Dot1.html`: 5 khung biểu đồ, ô "Rà 16/11" dưới `c-ask`.
- Mới: `design/play-ui/options/lesson-less-text/img/dd14-q4-chart.jpg`.

**Việc của dev:** chạy `build` ba chủ đề Discoverer (`khung-long`, `da-va-dat`, `ho-hap`) và Explorer `chuoi-thuc-an` để gói lấy hình mới. Không có chuỗi nào cần sinh giọng vì hình.

#### Chờ Duy duyệt
- Bố cục mới của `explore_dinosaurs`: cột dọc, mũi tên từ trên xuống, thay hàng ngang của brief.
- Bố cục mới của `explore_people`.
- Bốn hình chuỗi thức ăn đổi từ 4:3 sang vuông.
- Dải ảnh câu biểu đồ `b14-q4-chart.jpg` (hình tự vẽ dẫn xuất).
- Có sửa tiếp `da-va-dat/09` `explore_amber` ngay lượt này không, hay để Đợt 2.

#### 6. Sửa lại chiều 16/11 (theo tester kiểm lại, lỗi 1 và góp ý 4)

**Vùng ảnh thật của trang Học Discoverer, đo từ code.** Chỉ đọc `ExplorerLearnStep.pagePicture` và `discovererGroupPage`, không sửa:
- Rộng ảnh = rộng màn − 61. Gồm lề màn 2 × 20, `gridTrailingInset` 5 và đệm 2 × 8.
- Cao ảnh = chỗ còn lại sau thẻ câu, tối đa 440 − 16 = 424 (iPad × 1,5).
- Khi có nút VI ("Cả hai"), thẻ câu cao 139 pt; khi không có VI, thẻ câu cao 80 pt, nên ảnh cao thêm khoảng 59 pt.

| Máy, chế độ | Khung ảnh (pt) | Rộng : cao | Ảnh vuông thấy | Ảnh 4:3 thấy |
| --- | --- | --- | --- | --- |
| iPhone 16, "Cả hai" (ảnh `dd03-learn4-1611`) | 332 × 373 | 0,89 | 911 px giữa | 683 px giữa |
| Máy 390–393, "Chỉ EN" hoặc "Tiếng Việt" | 329 × 424 | 0,78 | **795 px giữa** | **596 px giữa** |
| 16 Pro, Pro Max | 341–379 × 424 | 0,80–0,89 | ≥ 820 | ≥ 615 |
| iPad (khung 600) | 523 × 644 | 0,81 | ≥ 830 | ≥ 622 |

**Vì sao lượt sáng vẫn cắt:**
- Lượt sáng tôi lấy khung trang Học là khoảng 1,1:1, theo canvas A2. Sai: trên máy, khung là khung dọc.
- Hình vuông chỉ chắc chắn thấy **795 px giữa** (x 115–909); hình 4:3 chỉ thấy **596 px giữa** (x 214–810).
- Hàng đá 4:3 rộng 740–760 nên mất mép. Hình `khung-long/01` lượt sáng (rộng 968 và 952) cũng sẽ mất mũi tên và cột cánh diều ở chế độ một ngôn ngữ.

**Đã sửa:**
- **`da-va-dat/03` `explore_properties`**:
  - Đổi sang hình vuông 1024, hàng ba hòn đá rộng 740 ở giữa (x 142–882). Không đổi ảnh nguồn, không đổi thứ tự.
  - Kiểm ở mọi chỗ dùng, cỡ thật: trang Học 329 × 424 và 332 × 373 (trọn ba hòn), thẻ ý chính 136 (trọn), khung Từ mới 4:3 (trọn), câu Đ/S w2 của bài 4 (329 × 224, trọn).
  - Câu q1 của bài 3 **không hiện hình câu hỏi**: ba lựa chọn đều có hình, app ẩn hình câu hỏi (`questionPictureHeight`). Nên không có chỗ nào cần ảnh lấp đầy khung ngang.
- **`khung-long/01`**, mọi mảnh vào trong 760–770 px giữa:
  - `explore_dinosaurs` dựng lại cột rộng 760 (x 132–892), cao 850. Stegosaurus và T. rex giữ cỡ; Plateosaurus nhỏ lại vì bị bề rộng giới hạn.
  - `explore_people` và `q4` thu × 0,8 (x 127–897), tỉ lệ mọi phần giữ nguyên nên vẫn khớp ba lựa chọn 2:1.
  - `vocab.million` dựng lại từ cột mới.
  - Ba lựa chọn q4 không đổi.
  - Ở thẻ ý chính 136, `explore_people` và Plateosaurus nhỏ hơn bản sáng khoảng 20 %. So với bản 10/11: ảnh khủng long cổ dài gần bằng, cánh diều và voi ma mút nhỏ hơn khoảng 5–10 %, nhưng mọi mảnh chạm trục, bố cục chắc, và không còn bị cắt ở trang Học.
  - Stegosaurus và T. rex giữ cỡ bản sáng. Đó là giá phải trả để trang Học không cắt.

**Bốn hình chuỗi thức ăn Explorer: giữ nguyên.**
- Khung trang Học Explorer cũng là khung dọc: (rộng màn − 61) × (tối đa 380 − 16). Tỉ lệ 0,86 trên máy 375, 0,90 trên máy 390, 0,99 trên iPhone 16 theo ảnh `ct02-learn4`. Trang này có cắt hai bên, giống trang Discoverer.
- Chuỗi chỉ to được tới bề rộng khung hẹp nhất:
  - hình vuông: chuỗi tối đa ~880/1024, hiện tại 856;
  - hình 4:3: chuỗi tối đa ~660/768.
- Trên iPhone 16, hai cách cho chuỗi gần bằng nhau: khoảng 280 pt và 288 pt. Ở thẻ ý chính 153 cũng vậy: 128 pt và 131 pt.
- Chuỗi 4:3 cũ to hơn khoảng 1,3 lần chỉ vì bị cắt mất cây ở đầu và con vật ở cuối.
- `explore_arrow` (hai vòng tròn) trông to hơn vì chỉ có hai mảnh.
- Không có cách nào làm chuỗi to hơn ở trang Học mà vẫn trọn ở máy hẹp, nên giữ nguyên.

**Góp ý 3 của tester (dải ảnh câu biểu đồ chỉ rộng 49 %):**
- Cỡ của chai và ca bị giới hạn bởi chiều cao ô (104 pt), không phải chiều ngang. Trải rộng ra chỉ thêm khoảng trống giữa các vật, vật không to hơn.
- Cách phủ hết bề ngang mà có nghĩa: thêm chai thứ ba "đất vườn", để hình khớp ba cột của biểu đồ. Đó là vẽ thêm vật, cần content-editor sửa brief và Duy đồng ý. Chưa làm.

**Vấn đề chung, báo PM và Duy (chưa sửa, ngoài phạm vi):**
- Trang Học Discoverer cắt hai bên mọi hình nhóm 4:3. Ở chế độ một ngôn ngữ trên máy 390, mất khoảng 21 % mỗi bên.
- Quét 89 hình tự vẽ và hình ghép của trang Học Discoverer (gói hiện tại):
  - Phần lớn là cảnh vẽ tràn khung, cắt bớt không sao.
  - Hình đặt đồ vật trên nền trơn có mép vật sát vùng cắt (ước theo nền, có thể lệch vài px): `ben-trong-trai-dat` ba hình, `khung-long-la-gi` `explore_kinds`, `explore_reptiles`, `explore_not_dinosaurs`, `hoa-thach-ke-chuyen-khung-long` `explore_forms`, `giac-quan-gui-tin-ve-nao` `explore_five`, `da-va-dat` `explore_soft`, `explore_hard`, `explore_grains`, `explore_layers`, `explore_holes`, `explore_rock_bits`, `explore_minerals` (bài 4), `explore_amber`, `explore_setup`, `explore_fair`, `explore_results`.
- Hai hướng, cần Duy chọn:
  - (a) designer thu các hình này vào vùng an toàn: vuông thì 760 px giữa, 4:3 thì 580 px giữa;
  - (b) ios-dev cho khung ảnh trang Học theo tỉ lệ ảnh (ảnh ngang thì khung thấp lại), thay vì luôn lấp chỗ còn lại.
- `image-slots.json` ghi `learn_group` Discoverer "~338×350 ≈ 1:1" (đo trên canvas A2); số đúng trên máy là 0,78–0,9:1. Đề xuất dev sửa ghi chú này.

**Đã chạy:**
- `images fetch` cho `khung-long/trai-dat-rat-lau-ve-truoc`, `da-va-dat/da-nao-cung-hon`, `da-va-dat/thang-do-cung-mohs`: 0 lỗi, 0 tải mới.
- `validate` `khung-long`, `da-va-dat`: 0 lỗi.
- Đối chiếu khoá: 0 thiếu, 0 thừa.

**Trang duyệt:** `content/.build/images/sk047-1611.html`, cập nhật cỡ khung trang Học thật (329 × 424).

**File đổi lượt chiều:**
- `content/images/composed/da-va-dat/b03-learn.explore.explore_properties.jpg` (nay vuông)
- `content/images/composed/khung-long/trai-dat-rat-lau-ve-truoc.learn.explore.explore_dinosaurs.jpg`
- `content/images/composed/khung-long/trai-dat-rat-lau-ve-truoc.learn.explore.explore_people.jpg`
- `content/images/composed/khung-long/trai-dat-rat-lau-ve-truoc.q4.jpg`
- `content/images/composed/khung-long/trai-dat-rat-lau-ve-truoc.vocab.million.jpg`
- note trong `content/images/discoverer/da-va-dat/da-nao-cung-hon.json` và `content/images/discoverer/khung-long/trai-dat-rat-lau-ve-truoc.json`

**Việc của dev:** `build` lại `da-va-dat` và `khung-long`. Bản build sáng của dev chưa có các hình này.

### dev 16/11 · sinh giọng và build lại

Chạy sau "content-editor 16/11" (chữ) và "designer 16/11" (hình), từ 08:45 đến 09:14, mỗi lúc một tiến trình. Không sửa `content/**/*.md`, `content/images/`, `apps/ios/`. Không chạy simulator, không build app. Chưa commit (`content/.build`, `content/.audio`, `content/.images` không nằm trong git).

**1. `validate content`** (08:45 và chạy lại 09:13 sau khi biên tập sửa `image.brief`): exit 0, **0 lỗi, 136 cảnh báo**, gồm 69 `md_needs_check`, 37 `image_brief_keywords`, 28 `image_missing`, 2 `age_words_en`.
- **Không có cảnh báo mới** so với lượt 15/11: cùng số theo mã, cùng tập (file, pointer, mã) ở hai lần chạy hôm nay.
- 13 dòng ghi chú `SK-047 (16/11 …)` của biên tập không có `[CẦN KIỂM]`, nên số dòng `[CẦN KIỂM]` mỗi file không đổi; chỉ số dòng dời.

**2. `import`.**
- `npm run import -- ../../content/discoverer/thoi-tiet-va-thien-tai ../../content/discoverer/ho-hap ../../content/discoverer/da-va-dat`: 27 file, 0 lỗi, 28 cảnh báo.
  - JSON đổi đúng 7 bài: `thoi-tiet` 02–05, `ho-hap` 03–04, `da-va-dat/15`.
  - `thoi-tiet/topic.json` trùng từng byte: dòng `tray_clock` của `_topic.md` chỉ là ghi chú hình.
  - So từng cặp EN/VI với JSON cũ: đổi đúng 14 chuỗi đọc (`Spoken`) của bảng mục 1 "content-editor 16/11", cộng 4 `alt` (không đọc).
- 09:07: import lại `khung-long` và `da-va-dat`, vì biên tập đã sửa `image.brief` ở `khung-long/01` (6 hình) và `da-va-dat/14` q4. So từng trường: chỉ `brief` đổi, không chữ đọc nào đổi. `build` bỏ `brief`, nên các lần sửa `brief` sau 09:07 không làm đổi gói.

**3. `tts` EN rồi VI** cho `thoi-tiet-va-thien-tai`, `ho-hap`, `da-va-dat` (lệnh như lượt 15/11; không `--force`, không `--check-all`). Chuỗi không đổi lấy từ cache.

| Chủ đề | Clip EN mới | Clip VI mới | Clip VI mới còn đánh dấu |
| --- | --- | --- | --- |
| thoi-tiet-va-thien-tai | 8 | 8 | 0 |
| ho-hap | 5 | 5 | 0 |
| da-va-dat | 1 | 1 | 0 |
| **Tổng** | **14** | **14** | **0** |

- Cache: EN 7294 → 7308, VI 7338 → 7352.
- **Clip cũ giữ nguyên:** đã so mọi `Spoken` của 4 chủ đề chạy `tts` (3991 chỗ, tính cả `khung-long` ở lượt 09:07). 14 chỗ đổi chữ có clip mới. 3977 chỗ còn lại có `audio.en` và `audio.vi` trùng hash cũ, 0 chỗ lệch. Bài không đổi chữ, `alt` hay `brief` ra JSON `tts` trùng từng byte.
- Cảnh báo chuẩn hoá không có gì mới: "TV" 3 chỗ (EN, `thoi-tiet/03`), "inox" 4 chỗ (VI, `da-va-dat/03`).
- `khung-long` và `da-va-dat` chạy lại `tts` lúc 09:07 với `--no-review` để lấy `brief` mới: 0 clip mới, mọi hash trùng.

**Kiểm clip VI mới** (bước tự kiểm mặc định: Whisper nghe 2 lượt, lặng đầu/cuối, chỗ ngắt, cụt cuối):
- **0 clip mới còn bị đánh dấu.**
- 5 clip bị đánh dấu ở lần nghe đầu và được thử thêm 4 seed. Đã ghi vào `tools/content-cli/tts-vi/variants.json` (+5 mục):

  | Chữ | Cờ lần đầu | Giữ |
  | --- | --- | --- |
  | Nhìn {1}, mình biết trời đổ xuống bao nhiêu nước. | `engine_retry` | biến thể 1, sạch |
  | ở sân trường | `asr`, `cut_end` | biến thể 1, sạch |
  | Em nghĩ tới cái loa xã trước khi bão tới nhé. | `asr` | biến thể 1; lượt 2 máy nghe "xả" (hỏi = ngã, được bỏ qua) |
  | Em nghĩ tới cây cối ngả rạp trong cơn bão nhé. | `asr` | biến thể 1; máy nghe "ngã" (hỏi = ngã, được bỏ qua) |
  | Em nghĩ tới những người mang mẫu đá, mẫu đất về thử nhé. | `asr` | biến thể 0: nghe lại cùng các biến thể khác thì sạch |

- Năm clip này nên được nghe trước. Chưa ai nghe; chưa ghim tay (`--pin-variant`).
- Clip VI cũ mang cờ vẫn dùng lại như cũ. Số clip có cờ đang dùng: `thoi-tiet` 45, `ho-hap` 20, `da-va-dat` 99. `ho-hap` bớt một clip vì câu "Xe cộ bên đường còn làm thêm bụi." không còn trong bài.

**File nghe thử**
- **Riêng 14 chuỗi đổi:** `content/.build/tts/review-sk047-1611-vi.m4a` (14 clip, 56,7 s) và `review-sk047-1611.m4a` (EN, 49,7 s).
  - `.txt` đi kèm ghi thứ tự theo bảng của biên tập, pointer, chữ đã đọc, chữ máy nghe được, biến thể.
  - Ghép bằng `writeReview` của `content-cli`, gọi từ một script tạm ngoài repo; không thêm lệnh mới.
- `review-01…15(-vi).m4a` là của lượt chạy `da-va-dat` lúc 09:05.

**4. `build --min-app-version 0.1.0`** cho 69 file `tts` của 10 chủ đề (7 Discoverer, 3 Explorer, như 15/11): exit 0, 0 lỗi.

| | Gói trước (15/11 22:55) | Gói mới (16/11 09:08) |
| --- | --- | --- |
| `content_version` | ceeb1eb6912a | **e01f9e6a616d** |
| Chủ đề · bài | 10 · 59 | 10 · 59 |
| Asset | audio EN 6001, VI 6245, ảnh 1206 | audio EN 6002, VI 6246, ảnh 1208 |
| Số file | 13463 | 13467 |
| Dung lượng | 411.027.830 byte | 411.229.513 byte (392,2 MB; 418 MB theo `du`) |

- Version chủ đề đổi (5), mỗi `pack.json` chỉ đổi đúng chỗ dự kiến:

  | Chủ đề | Version cũ → mới | Đổi gì trong `pack.json` |
  | --- | --- | --- |
  | thoi-tiet-va-thien-tai | e75a499d4381 → d3f019c44cc1 | 8 chuỗi, 8 clip EN + VI, `version` của 8 câu |
  | ho-hap | cd057e50f644 → 2983df3cd172 | 5 chuỗi đọc + 3 `alt`, 5 clip EN + VI, 2 `key`, 3 ảnh, `version` của 4 câu |
  | da-va-dat | d48a1b498845 → 51fe4f28697b | 1 chuỗi, 1 clip EN + VI, `version` q2 bài 15; 5 chỗ ảnh (`explore_properties` ở bài 3: Học, q1, Từ mới, và ở w2 bài 4; q4 bài 14) |
  | khung-long | eb28e319d425 → 0893b06b09a9 | 8 chỗ ảnh (hai hình Học, q4 + 3 lựa chọn, `vocab.million`, `vocab.timeline`) |
  | chuoi-thuc-an (Explorer) | 556f6d940b59 → ecf52a33df0d | 8 chỗ ảnh (4 hình chuỗi thức ăn) |

- Giữ nguyên version:
  - `an-uong-lanh-manh` 7146e453266d;
  - `be-mat-trai-dat` 2223db821f04;
  - `nao-bo-va-giac-quan` c4fd82c9ba7a;
  - Explorer 62462dd34421, 66db53d2c142.
- Ảnh tăng 2: `vocab.million` (hình ghép mới) và `b14-q4-chart.jpg` (hình tự vẽ mới). 1208 file ảnh, gồm 78 hình ghép và 465 hình tự vẽ, cho 2522 `Image`. 67 `Image` chưa có ảnh, đều ở `an-uong-lanh-manh`, như cũ.
- 73 cảnh báo, như 15/11: 69 `ai_draft`, 2 dòng gộp hình `an-uong-lanh-manh`, 2 `age_words_en`. Không có cảnh báo khoá thừa, không có cảnh báo lệch khung.
- Lần gọi `build` đầu tiên exit 1 và không ghi gì. Lỗi do cách gọi: zsh không tách biến, nên cả danh sách file thành một đường dẫn. Chạy lại bằng script `sh` thì qua.

**5. `check-pack`** (`sh tools/content-cli/scripts/check-pack.sh content/.build/pack`): **OK**, exit 0, 305 s.
- 13466 file khớp manifest (10 `pack.json`, 13456 asset). Tên asset đúng bằng sha256.
- Không còn `brief`, không `audio` nào thiếu file.
- EN 6002 = 6002 hash, VI 6246 = 6246 hash, ảnh 1208 = 1208.
- 1208 ảnh qua các bước kiểm JPEG, metadata, kích thước, credit, giấy phép (kiểm cả parts của 78 hình ghép): 0 lỗi.

**6. Bước nhúng vào app** (chỉ kiểm script, không build app)
- Chạy `apps/ios/scripts/embed-content-pack.sh` với `SK_CONTENT_PACK_DIR` = giá trị mặc định của `project.yml` (`$(SRCROOT)/../../content/.build/pack`) và `TARGET_BUILD_DIR` trỏ vào scratchpad.
- Kết quả:
  - in `note: Content pack embedded from …/content/.build/pack (13467 files).`;
  - `pack/catalog/v1/manifest.json` trong bản chép có `content_version` = **e01f9e6a616d**;
  - `diff -rq` với `content/.build/pack`: trùng.
- Đã xoá bản chép.
- Build phase vẫn `alwaysOutOfDate = 1`, nên lần build app tới sẽ lấy gói này.
- Cho ios-dev, khi build lại:
  - log phải có "13467 files";
  - kiểm trên simulator như mục 15/11, phải ra `e01f9e6a616d`.
- Lượt học dở do gói cũ ghi có thể trỏ key đã đổi: `ho-hap/04` `q4_road` → `q4_schoolyard`, `q5_smoke` → `q5_steam`. Cài sạch thì không gặp. Lưu ý này giống 15/11.

**7. Test `tools/content-cli`:** `npm test` **399/399 pass**, `npm run typecheck` exit 0. Không tạo lại `test/fixtures/markdown/expected.json.new`.

**File đổi (trong git):**
- `tools/content-cli/tts-vi/variants.json`: +5 mục ở trên.
- `tools/content-cli/README.md`: sửa một câu ở mục "Kiểm thử". Câu cũ vẫn nói bài 1 fixture hỏi "energy", sai từ lượt sinh lại fixture 15/11; nay khớp ghi chú trong `test/helpers.ts`.
- Mục này của ticket.

**Ngoài git:**
- `content/.build/json/discoverer/{thoi-tiet-va-thien-tai,ho-hap,da-va-dat,khung-long}`;
- `content/.build/tts/discoverer/…`, các file nghe thử;
- `content/.build/pack`;
- `content/.audio` (+28 clip, `index.json`, report).

**Migration:** không có.

**Cho tester**
1. Nghe `review-sk047-1611-vi.m4a` và `review-sk047-1611.m4a`. Nghe kỹ VI số 1, 6, 9, 13, 14 (năm clip từng bị đánh dấu lần đầu).
2. Trên app có gói `e01f9e6a616d`:
   - `ho-hap/03` q2: thẻ `q2_jumps` là ô lò cò.
   - `ho-hap/04` q4 `q4_schoolyard`, q5 `q5_steam`: chữ, giọng, hình.
   - Hình mới: `khung-long/01` (thẻ ý chính, trang Học, q4, Từ mới `million`), `da-va-dat/14` q4, `da-va-dat/03` `explore_properties`, bốn hình `chuoi-thuc-an`.
3. Chạy lại `check-pack` nếu muốn kiểm độc lập.

**Còn chưa chắc**
- Lần chạy `--no-review` lúc 09:07 ghi đè `content/.audio/report-da-va-dat-…-vi.json` và `report-khung-long-…` bằng báo cáo 0 clip mới. Kết quả tự kiểm của clip `da-va-dat/15` vẫn còn ở `index.json`, `variants.json` và file nghe thử riêng.
- Đề xuất của designer về khung kiểm ~3:1 cho ảnh câu biểu đồ: không làm lượt này, để Đợt 2 (theo phiên chính).

#### Lượt chiều 16/11 · phần A (10:18–10:20, chưa build gói)

Không ghi vào `content/.build/pack`; gói vẫn là `e01f9e6a616d` của buổi sáng. Không chạy `tts`.

**1. Ghi chú vị trí đáp án của biên tập (67 dòng `>` trong 27 file)**
- Có đúng 27 file `.md` đổi sau lần import 09:07, khớp danh sách của biên tập.
- `validate content`: exit 0, **0 lỗi, 136 cảnh báo**. So với lần chạy 09:13: cùng tập (file, pointer, mã), và cùng số dòng `[CẦN KIỂM]` mỗi file.
- `import` 5 chủ đề (`thoi-tiet-va-thien-tai`, `ho-hap`, `khung-long`, `da-va-dat`, `nao-bo-va-giac-quan`): 38 file, 0 lỗi.
- So JSON mới với JSON đầu vào của gói (JSON `tts`, bỏ `audio`): **0 trường khác, kể cả `brief`.** Ghi chú `>` không vào JSON.
  - So từng byte cũng trùng: với lần import 08:46 (`thoi-tiet`, `ho-hap`) và 09:06 (`khung-long`, `da-va-dat`).
  - Không chuỗi nào bé đọc hay nghe đổi, nên không cần `tts`.

**2. Hình designer đổi lần nữa** (`da-va-dat/03` `explore_properties`; `khung-long/01` `explore_dinosaurs`, `explore_people`, `q4`, `vocab.million`): chưa vào gói, chờ `build` ở phần B. Designer đã chạy `images fetch` (0 lỗi).

**3. `image-slots.json`: ghi chú `learn_group` Discoverer**
- Thay "~338×350, iPad 548×618 ≈ 1:1" bằng số đo trên máy của designer: khung dọc 0,78–0,89:1 (iPhone 16 Cả hai 332×373; máy 390–393 một ngôn ngữ 329×424; 16 Pro, Pro Max 341–379×424; iPad 523×644). Nói rõ tỉ lệ kiểm vẫn 1:1.
- **Tỉ lệ dùng để kiểm cũng sai. Chưa đổi, chờ phiên chính.**
  - App dùng `PictureFit` với khung đo thật: trang Học gọi `ContentPicture(box: .fillWidth)`, hàm này so ảnh với `boxSize` thật. Lệch quá 2,2 thì app hiện cả ảnh thu nhỏ giữa giấy, không lấp khung.
  - Đếm trên gói `e01f9e6a616d`: 149 ảnh trang Học Discoverer, 76 ảnh Explorer.

  | Tỉ lệ kiểm `learn_group` | Ảnh Discoverer lệch quá 2,2 (sẽ thành cảnh báo mới) |
  | --- | --- |
  | 1:1 (hiện tại) | 0 (lệch nhất 2,19: `da-va-dat/12` `explore_red` 499×228) |
  | 0,89 (iPhone 16, Cả hai) | 2: `ho-hap/01` `explore_animals` 1024×512, `da-va-dat/12` `explore_red` |
  | 0,8 (≈ 4:5) | 7: thêm `be-mat-trai-dat/05` `explore_quake`, `da-va-dat/07` `explore_slow`, `da-va-dat/10` `explore_finds`, `da-va-dat/13` `explore_climate`, `nao-bo-va-giac-quan/01` `explore_move` |
  | 0,78 (máy 390, một ngôn ngữ) | 9: thêm `da-va-dat/09` `explore_palaeo`, `da-va-dat/12` `explore_sandy` |

  - Các ảnh này rộng 1,7–2,2:1. Trên máy có khung hẹp, app không lấp khung mà hiện cả ảnh nhỏ. Không lỗi, nhưng ảnh nhỏ.
  - Explorer: khung trang Học cũng dọc (0,86–0,99), nhưng 0 ảnh lệch quá 2,2 ở mọi tỉ lệ trên, nên ghi chú Explorer không sửa.
  - Đề xuất: khi Duy chọn hướng (a) hay (b) ở mục designer "Vấn đề chung", đổi `learn_group` Discoverer sang 4:5. Lúc đó 7 cảnh báo mới chính là danh sách hình cần designer xem.
- `README.md`: sửa `bank_item` Discoverer "3:5" thành "1:1" cho khớp `image-slots.json` (đã là 1:1 từ 14/11). Thêm một câu trỏ về số đo trang Học.

**Test:** `npm test` 399/399 pass (gồm `aspect.test.ts` 13/13), `npm run typecheck` exit 0.

**Sự cố nhỏ:** lệnh sao lưu JSON trước khi import bị lỗi tách chữ của zsh (giống lần `build` sáng), nên không sao lưu được. Phép so ở mục 1 vì vậy dùng JSON `tts` hiện có và các bản import sáng còn trong scratchpad. Không mất gì: JSON mới trùng các bản đó.

#### Lượt chiều 16/11 · phần B: build lại gói (10:37–10:43, sau khi ios-dev xong)

**Gói hiện hành: `content_version` = `81e06c552629`.** Gói này thay `e01f9e6a616d` của buổi sáng; số ở các mục "Cho ios-dev" và "Cho tester" phía trên nay đọc là `81e06c552629`.
- Từ lần `import` 10:19 tới lúc build, không file `.md` nào đổi. JSON `tts` (đầu vào của `build`) vẫn đúng, không cần chạy `tts`.
- Tỉ lệ kiểm `learn_group` giữ 1:1, theo phiên chính.

**`build --min-app-version 0.1.0`** (69 file `tts`, 10 chủ đề, cùng script như buổi sáng): exit 0, 0 lỗi.
- 73 cảnh báo, như buổi sáng. Không có cảnh báo khoá thừa, không có cảnh báo lệch khung.
- Asset vẫn là audio EN 6002, VI 6246, ảnh 1208, vì 4 file ảnh được thay chứ không thêm. Gói có 13467 file, 411.185.926 byte (392,1 MB).
- Chỉ hai chủ đề đổi version, và chỉ đổi `image.asset`:

  | Chủ đề | Version | Chỗ đổi |
  | --- | --- | --- |
  | khung-long | 0893b06b09a9 → **8d70c78aba92** | bài 1: `explore_dinosaurs`, `explore_people`, hình câu q4, `vocab.million`, `vocab.timeline` (`same_as` `explore_people`). Ba lựa chọn q4 không đổi. |
  | da-va-dat | 51fe4f28697b → **6f35ba5ecc46** | `explore_properties` ở bài 3 (Học, q1, Từ mới) và ở w2 bài 4 |

- Tám chủ đề còn lại giữ version của buổi sáng.

**`check-pack`: OK**, exit 0, 288 s.
- 13466 file khớp manifest (10 `pack.json`, 13456 asset).
- EN 6002 = 6002 hash, VI 6246 = 6246 hash, ảnh 1208 = 1208.
- Kiểm 1208 ảnh (JPEG, metadata, kích thước, credit, giấy phép, parts của hình ghép): 0 lỗi.

**Script nhúng** (`apps/ios/scripts/embed-content-pack.sh`):
- Chạy như buổi sáng, với `SK_CONTENT_PACK_DIR` mặc định và đầu ra trong scratchpad.
- Script in `note: Content pack embedded from …/content/.build/pack (13467 files).`
- Manifest của bản chép có `content_version` = **81e06c552629**.
- `diff -rq` với `content/.build/pack`: trùng. Đã xoá bản chép.
- Không build app, không chạy simulator. ios-dev build app lần tới sẽ nhúng gói này.

### tester 16/11 · kiểm lại

Kiểm trên **một máy iPhone 16** simulator (`8620A918-…`, iOS 18.4), gói nhúng `e01f9e6a616d`, chạy với `-SKSyncOff YES -SKReduceMotion YES`, giao diện EN. Không đụng iPhone 16 Pro. Mỗi bộ test chạy đúng một lần; bộ nào đỏ thì ghi đỏ, không chạy lại. Xong đã `xcrun simctl shutdown` iPhone 16 (iPhone 16 Pro để nguyên). Không sửa code sản phẩm, nội dung hay thiết kế; chỉ thêm một file test của tester: `apps/ios/ScienceKidsUITests/SK047ShotsUITests.swift`. Chưa commit.

#### 1. Số test

| Bộ | Kết quả |
| --- | --- |
| `tools/content-cli` `npm test` | **399/399 pass**, exit 0 |
| `validate content` | exit 0 · **0 lỗi, 136 cảnh báo** (69 `md_needs_check`, 37 `image_brief_keywords`, 28 `image_missing`, 2 `age_words_en`) — đúng như lượt 15/11 |
| `build-for-testing` (iPhone 16) | **TEST BUILD SUCCEEDED**; log có `Content pack embedded … (13467 files)`; `pack/catalog/v1/manifest.json` trong `ScienceKids.app` = **e01f9e6a616d**, 13467 file |
| iOS unit test (bỏ UI test), 1 lần, iPhone 16 | **400 test, 400 pass, 0 fail** (89 + 59 + 28 + 19 + 51 + 100 + 14 + 22 + 18) |
| `SK047FlowUITests`, 1 lần | **6/6 ĐỎ** — xem dưới, nguyên nhân là máy cài sạch, không phải lỗi app |
| `SK047ShotsUITests` (tester viết 16/11), 1 lần | 9 test · **8 pass, 1 fail** (`testExplorerRecapsNotSeenBefore`) |

**`SK047FlowUITests` đỏ 6/6.** Đề bài yêu cầu "cài sạch", nên tôi `simctl uninstall` trước khi chạy. Máy không còn hồ sơ con, app mở màn Chào mừng, và `-SKOpenLesson` **không** bỏ qua onboarding. Cả 6 test dừng ở cùng một dòng:

```
SK047FlowUITests.swift:271: error: … XCTAssertTrue failed - lesson vi-sao-ta-phai-tho did not open;
on screen: anchors [], buttons ["welcome.next", "welcome.mode.bilingual", "welcome.mode.en_first", "welcome.mode.vi_first"]
```

Đây là thiếu sót của harness tester (file 15/11 giả định máy đã có hồ sơ), không phải lỗi app: cài sạch thì hiện Chào mừng là đúng. Theo luật chạy một lần, tôi **không chạy lại** bộ này. Hệ quả: **mọi tiêu chí mà lượt 15/11 chứng minh bằng `SK047FlowUITests` chưa được chạy lại trên gói `e01f9e6a616d`** (xem mục 6). Đề nghị tester lượt sau thêm bước qua Chào mừng vào `launch()` (hoặc gieo sẵn `child_profile.json`) rồi chạy một lần.

Sau đó tôi cài app và gieo một `child_profile.json` (Lớp 3 · Discoverer · Song ngữ) vào container rồi chạy bộ ảnh — vẫn là máy mới cài, không có lịch sử lượt học, nên không dính lưu ý "lượt dở của gói cũ trỏ key đã đổi" của dev.

**`SK047ShotsUITests` fail 1.** `testExplorerRecapsNotSeenBefore`: Explorer `/04` chạy trọn và có ảnh; Explorer `/07` dừng ở bước Chơi:

```
SK047ShotsUITests.swift:208: error: … failed - mâm chưa cân (con-trung-va-con-vat-nhieu-chan)
```

Harness chọn một món mỗi nhóm `required` (`tray_ant`, `tray_spider`, `tray_crab`; `capacity` 3, 3 nhóm required) nhưng nút `lesson.play.done` không hiện trong 5 s, rồi mọi bước sau đỏ theo. Chưa phân định được là do thời gian chờ của harness hay do app/nội dung; **đề nghị ios-dev xác nhận** mâm 3 món một-mỗi-nhóm ở `/07` có `success` không.

#### 2. Ảnh đã chụp

Thư mục `/private/tmp/claude-501/-Users-buiduyluu--claude-spares-spare-7hJEda/5730aa52-aac5-4944-a855-c98bfdd7bb76/scratchpad/shots/`, 36 ảnh hậu tố `-1611`:

| Việc | Ảnh | Kết quả |
| --- | --- | --- |
| `thoi-tiet/02` q2 câu mới | `w02-q2-1611` | "The ? shows how much water fell from the sky." · ba thẻ RAIN GAUGE, FLASK, UMBRELLA |
| `thoi-tiet/02` q5, q6 gợi ý | `w02-q5-hint-1611`, `w02-q6-hint-1611` | gợi ý mới hiện đúng, không lộ phán quyết |
| `ho-hap/03` q2 | `hh03-q2-1611` | thẻ JUMPS là ô lò cò |
| `ho-hap/04` q4, q5 | `hh04-q4-1611`, `hh04-q5-1611` | q4 có thẻ sân trường; q5 có thẻ STEAM (nồi cơm bốc hơi) |
| `da-va-dat/15` q2 gợi ý | `dd15-q2-hint-1611` | gợi ý mới; **thấy một lỗi mới, mục 3** |
| `khung-long/01` | `kl01-recap1-1611`, `kl01-learn1…5-1611`, `kl01-q4-1611` | Tổng kết màn 1 (thẻ 2, 3), trang Học hai nhóm, q4, trang Từ mới `million` |
| `da-va-dat/14` q4 | `dd14-q4-1611` | ảnh dải ngang mới; **xem góp ý mục 3** |
| `da-va-dat/03` | `dd03-learn1…5-1611` (trang `explore_properties` là `dd03-learn4-1611`) | **lỗi mới, mục 3** |
| Explorer `chuoi-thuc-an` | `ct02-learn1…5`, `ct03-learn1…5`, `ct04-learn1…5` (`-1611`) | 4 hình mới hiện trọn, không bị cắt |
| Explorer `/04` Tổng kết màn 1 | `x04-recap1-1611` | **kiểm được rồi** (15/11 còn để trống): ba thẻ chỉ có hình, linh vật đọc ý 1, thẻ đang đọc nổi lên |

Không chụp được, vẫn **chưa kiểm**: Tổng kết màn 2 của `ho-hap/01`, `ho-hap/03`, Explorer `/08` trên iPhone 16 (ba ảnh này nằm trong `SK047FlowUITests`, bộ đó đỏ), và Explorer `/07` Tổng kết màn 2.

**Khoảng dư trên iPhone 16** (392,7 × 852 pt, đo trên ảnh): Tổng kết màn 1 của `khung-long/01` (3 thẻ) còn **≈ 93 pt trống** giữa thẻ cuối và dải chấm trang; Explorer `/04` màn 1 còn **≈ 80 pt**. Không màn nào phải cuộn. Màn 2 của ba bài trong đề bài: chưa đo được, lý do ở trên.

#### 3. Lỗi mới (không chặn)

**Chặn: không có.**

**Lỗi · nên sửa**

1. **`da-va-dat/03` trang Học: hòn đá bên trái của `explore_properties` bị cắt mất mép** · designer
   - Tái hiện: mở *Đá nào cũng hơn?* (`da-va-dat/03`), đi hết Khởi động, tới trang Học thứ tư ("PROPERTIES" · "Hardness is a property we can use to group rocks."). Ảnh `dd03-learn4-1611.png`.
   - Mong đợi: ba hòn đá nằm trọn trong khung.
   - Thực tế: khung ảnh của trang Học Discoverer hẹp hơn 4:3 nên cắt hai bên khoảng 13,7 % mỗi bên; hàng đá mới rộng đúng 740/1024 px (x 141–881), tức **sát đúng mép cắt**, nên hòn đá phấn bên trái bị xén một phần mặt trái, bóng của hòn đá hoa cương bên phải cũng mất.
   - Đề xuất: thu hàng đá còn ≤ 70 % bề ngang, hoặc dựng bản vuông như bốn hình chuỗi thức ăn.

2. **Nhãn thẻ từ dài bị cắt cụt: "PALAEONTO…"** · designer, ios-dev (content-editor nếu đổi chữ)
   - Tái hiện: `da-va-dat/15` q2 (câu Từ mới), trên iPhone 16. Ảnh `dd15-q2-hint-1611.png`.
   - Mong đợi: bé đọc được cả ba nhãn.
   - Thực tế: thẻ giữa in "PALAEONTO…"; hai thẻ kia ("GEOLOGY", "FIELDWORK") đủ chữ. Bản VI ("cổ sinh vật học") còn dài hơn, chưa kiểm.
   - Đây là chữ bé phải đọc để chọn, nên cắt cụt là mất thông tin. Lựa chọn: cho nhãn thẻ từ xuống hai dòng, hạ `minimumScaleFactor`, hoặc biên tập rút gọn nhãn.

**Góp ý**

3. **Ảnh câu biểu đồ `b14-q4-chart.jpg` chưa thật sự phủ bề ngang.** Ảnh 1024 × 352 nhưng phần vẽ chỉ rộng 506 px (x 263–769), tức **49 % bề ngang**; 26 % mỗi bên là nền kem. Trên máy (ảnh `dd14-q4-1611.png`) khung ảnh được lấp đầy nhưng dụng cụ vẫn nằm gọn giữa khung, nhìn vẫn nhỏ. Nếu ý đồ là "dải ngang", nên trải hai chai và ca nước ra gần hết bề ngang.
4. **Bốn hình chuỗi thức ăn đổi sang vuông làm chuỗi nhỏ đi ở trang Học Explorer.** So `ct02-learn4-1611` (`explore_chain`, vuông, ba vòng tròn nhỏ giữa một khung rất rộng) với `ct02-learn3-1611` (`explore_arrow`, vẫn 4:3, hai vòng tròn to gấp rưỡi). Trang Học Explorer **không cắt hai bên** (ảnh fit theo bề ngang), nên hình vuông chỉ làm nội dung bé lại. Hình vuông vẫn đúng cho thẻ ý chính; nhờ designer cân lại, hoặc để Đợt 2 cùng `key_point_images`.
5. **`ho-hap/03`: hình ô lò cò là món đúng của kệ Chơi, đồng thời là thẻ sai ở q2.** Lỗi cũ (`tray_rope` đúng ở q1, sai ở q2) đã hết, nhưng thẻ mới dùng `tray_hopscotch`, vốn thuộc nhóm "Trò nhảy" (`required`) ở kệ Chơi cùng bài. Theo "Điều phối 16/11" vai ở kệ Chơi không tính, nên tôi **không xếp là lỗi**; ghi để Duy biết rằng lượt này chỉ dời vai trái nhau từ câu q1 sang kệ Chơi. (Kiểu này đã có sẵn trong bài: `ho-hap/04` hình công viên là món đúng ở kệ Chơi và là lựa chọn sai ở q4.)
6. **25 dòng "Đáp án ở chỗ thứ …" còn trong 12 file nội dung** (`grep -rn "Đáp án ở chỗ" content/`). Việc 4 (bỏ cân vị trí) đã ghi hết hiệu lực ở `_topic.md` và TEMPLATE, nhưng ghi chú theo từng câu thì chưa dọn; biên tập đọc lại dễ hiểu nhầm là vẫn còn luật. Không phải chữ bé đọc.
7. **`explore_gills` (Explorer `goi-ten-va-nhom-dong-vat/04`) có `alt` "A close-up of fish gills" nhưng ảnh là nửa trước con cá chép**, không thấy mang. Ảnh `x04-recap1-1611.png` (thẻ 2). Ngoài phạm vi 16/11; ghi cho lượt rà hình Đợt 2.

#### 4. Quét luật hình (phần biên tập chưa quét)

Luật theo "Điều phối 16/11": một hình không được mang hai vai trái nhau **cho cùng một ý** trong bài. Cách quét: script đọc thẳng gói `e01f9e6a616d`, so `asset` sha256 của mọi lựa chọn (`options`) và thẻ từ (`bank`) ở Khởi động và Quiz trong từng bài; thẻ đúng của `fill_blank_bank` lấy theo `answers`. Không tính hình câu hỏi, không tính kệ Chơi (theo cách biên tập đã quét 16/11).

- **`da-va-dat` 01–10: 0 chỗ.** (Quét luôn 11–15: cả chủ đề 15 bài **0 chỗ**.)
- **Explorer: 20 chỗ một hình mang hai vai** (`chuoi-thuc-an` 7, `sinh-vat-song-o-dau` 5, `goi-ten-va-nhom-dong-vat` 8). Đọc từng cặp câu hỏi thì **16 chỗ là hai ý khác nhau** (ví dụ `chuoi-thuc-an/01` cá vàng: sai ở q1 "con nào gặm cỏ", đúng ở q3 "con nào người cho ăn"), không phạm luật.
- **4 chỗ khớp mô tả "cùng một ý, hai vai trái nhau"**, nhưng cả bốn là **cặp câu hỏi lật ngược cùng một thuộc tính và dạy đúng một sự thật**, nên tôi xếp mức góp ý, **chờ Duy chốt**:

| Bài | Hình | Sai ở | Đúng ở |
| --- | --- | --- | --- |
| `sinh-vat-song-o-dau/01` | hoa sen | q4 "Which one is non-living?" | q6 "Which one is alive, like you?" |
| `sinh-vat-song-o-dau/07` | luống hoa | q1 "Which one harms tiny animals?" | q3 "What helps butterflies?" |
| `goi-ten-va-nhom-dong-vat/01` | con voọc | q6 "Which one can be a pet?" | q2 "Which one is a wild animal?" |
| `goi-ten-va-nhom-dong-vat/08` | cá ngựa | q4 "Which animal has no backbone?" | q5 "Which one has a backbone?" |

Tái hiện (ví dụ cặp cuối): mở Explorer *Ốc, bạch tuộc và con vật biển*, tới q4 — ảnh cá ngựa là lựa chọn sai; tới q5 — vẫn ảnh đó, nay là lựa chọn đúng. Nếu Duy muốn áp luật tới cả bốn chỗ này thì phải soạn lại câu hoặc tìm hình khác, nên để Đợt 2 cùng sáu bài Discoverer đã hoãn.

#### 5. Rà chữ mới của biên tập

Dump thẳng từ gói, không đọc qua markdown. 14 chuỗi đọc + 4 `alt`.

- **EN/VI khớp nghĩa:** 14/14 đạt. Hai chỗ lệch sắc thái nhẹ, không sai: `thoi-tiet/05` q5 "Think of how trees bend in a storm." ↔ "cây cối ngả rạp" (EN "cong", VI "đổ rạp"); `ho-hap/04` q4 feedback "in the same smoky air" ↔ "cũng đầy khói bụi".
- **Ngân sách chữ:** mọi câu EN mới ≤ 10 từ (dài nhất đúng 10: q2 `thoi-tiet/02`, gợi ý `da-va-dat/15` q2). `validate` vẫn chỉ 2 cảnh báo `age_words_en` cũ.
- **Gợi ý không lộ đáp án:** 12 gợi ý mới đều trỏ bằng chứng, không nêu phán quyết, không chứa đáp án. Hai chỗ **gần ngưỡng, không chặn**: `thoi-tiet/04` w1 "Think of the storm photo taken from space." (ảnh đó nằm trên chính ô có câu chứa đáp án — nay chỉ còn trỏ tấm ảnh, không gọi tên ô) và `thoi-tiet/05` q2 "Think of the village loudspeaker before a storm." (loa phát chính tin cảnh báo). Cả hai vẫn bắt bé tự nối một bước.
- **Câu FB không chứa gốc từ của đáp án (bản EN):** kiểm lại toàn bộ **40/40 câu `fill_blank_bank`** của gói (37 Quiz + 3 Khởi động) — **0 chỗ vi phạm**.
- **Thẻ từ cùng loại:** `q5_steam` ("steam" · "hơi nước") cùng loại danh từ không đếm được với "dust", "oxygen"; `q4_schoolyard` ("in the schoolyard") cùng dạng cụm nơi chốn với "inside the house", "in the park".
- **Hình có `alt` đủ hai thứ tiếng:** 2522 chỗ dùng ảnh trong gói, **0 chỗ thiếu `alt`**; **0 chuỗi hiển thị thiếu `en` hoặc `vi`**.
- **Cấu trúc quiz không đổi:** 59/59 bài vẫn 6 câu, DOK không giảm dần, câu 1 DOK 1, Discoverer 2·3·1; số lựa chọn trong khung `rules.json`.
- **`version`:** 14 câu đổi chữ và 2 câu chỉ đổi hình đều đã tăng đúng như bảng của biên tập.

#### 6. Giọng · danh sách cho Duy nghe

Đọc `content/.build/tts/review-sk047-1611-vi.txt` và bản EN, so chữ máy nghe với chữ gốc. **14/14 clip VI: chữ máy nghe khớp chữ gốc**, trừ hai chỗ chỉ lệch dấu hỏi/ngã (máy nghe đúng âm). Cả 5 clip từng bị đánh dấu đều đã ghim biến thể trong `tools/content-cli/tts-vi/variants.json`.

Nghe theo thứ tự này (file `content/.build/tts/review-sk047-1611-vi.m4a`, 56,8 s):

| # | Mốc | Chữ | Vì sao nghe |
| --- | --- | --- | --- |
| 1 | 0:00,0 | "Nhìn …, mình biết trời đổ xuống bao nhiêu nước." | clip phải chạy lại máy sinh (`engine_retry`), giữ biến thể 1; và biên tập còn phân vân câu VI này có xuôi không |
| 6 | 0:20,5 | "ở sân trường" | lần đầu bị cờ `cut_end` (cụt cuối), đổi sang biến thể 1 |
| 9 | 0:30,8 | "Em nghĩ tới những người mang mẫu đá, mẫu đất về thử nhé." | câu dài nhất, có dấu phẩy giữa câu |
| 13 | 0:48,6 | "Em nghĩ tới cái loa xã trước khi bão tới nhé." | lượt nghe thứ hai máy nghe thành "loa **xả**"; nghe xem có ra "xã" không, và xem bé thành phố có hiểu "loa xã" không |
| 14 | 0:53,0 | "Em nghĩ tới cây cối ngả rạp trong cơn bão nhé." | máy nghe "ngã rạp" cả hai lượt; **nhờ Duy chốt chính tả**: "ngả rạp" hay "ngã rạp" (phổ biến hơn), vì chữ in trên màn cũng theo đó |

Bản EN (`review-sk047-1611.m4a`, 49,8 s): **content-cli không chạy bước nghe máy cho EN**, file `.txt` không có dòng "máy nghe". Nhờ Duy nghe lướt cả 14 clip, kỹ hơn ở clip 1 (câu có chỗ trống, máy phải đọc thành một quãng nghỉ) và clip 6 ("in the schoolyard").

**Tôi không nghe được bằng tai** (phiên agent không phát tiếng, simulator cũng không); mục này chỉ là so chữ.

#### 7. Bảng tiêu chí sau lượt sửa

- **designer 5/5 đạt** (giữ nguyên) · thêm hai mục của 16/11: hình `khung-long/01` dựng lại **đạt** (ảnh `kl01-recap1-1611`); bốn hình chuỗi thức ăn và `b14-q4-chart` **đạt về kỹ thuật**, kèm hai góp ý mục 3; `explore_properties` **chưa đạt** (lỗi mới 1).
- **dev 8/8 đạt** (giữ nguyên) · thêm: gói `e01f9e6a616d` nhúng đúng (13467 file, `content_version` khớp trong `.app`), `validate` 0 lỗi/136 cảnh báo như cũ, 14 clip mới có đủ file trong gói (28/28 asset `audio` tồn tại) — **đạt**.
- **content-editor 7/7 đạt** (giữ nguyên) · 5 mục "nên sửa" của tester: **5/5 đã sửa**.
- **ios-dev: 28 đạt, 5 chưa kiểm được** — giữ nguyên **số của lượt 15/11, chứng minh trên gói `ceeb1eb6912a`**. Lượt này **không chạy lại được** phần dựa vào `SK047FlowUITests` (gợi ý và `hint_used`, khoá thẻ `order_sequence`, tên cột biểu đồ, hai màn Tổng kết, tắt app ở Tổng kết, luồng tới Thưởng) vì bộ đó đỏ do máy cài sạch. Unit test 400/400 vẫn xanh, và các màn tôi mở tay trong bộ ảnh (6 bài Discoverer, 2 bài Explorer, nút gợi ý ở FB và TF, biểu đồ, Tổng kết màn 1) chạy đúng.
- **tester:** chạy lại tiêu chí ba agent — đạt một phần (mục ios-dev ở trên); rà chữ — đạt; FB dùng từ mới 37/37 — đạt; quét luật hình phần còn thiếu — đạt (kết quả mục 4).

**Tổng: 48 tiêu chí đạt, 5 chưa kiểm được, 0 chặn** (15/11 là 48 đạt / 5 chưa kiểm). Hai lỗi mới ở mục 3 nằm ngoài bảng tiêu chí (hình và nhãn), nên không trừ số.

#### 8. Còn chưa kiểm

- Tổng kết **màn 2** của `ho-hap/01` (4 từ), `ho-hap/03` (Na nói đúng) và Explorer `/08` trên iPhone 16, cùng Explorer `/07` màn 2 — hai bộ test liên quan đỏ, lý do ở mục 1.
- Nghe bằng tai 28 clip mới (14 EN + 14 VI) — danh sách ở mục 6.
- Bản EN chưa qua bước nghe máy của `content-cli`.
- iPad, VoiceOver/TalkBack, gói nhúng **trước** SK-047 chạy trên app mới: như 15/11, vẫn chưa kiểm (một máy, một lượt).
- Mâm Chơi Explorer `/07` có cân với 3 món một-mỗi-nhóm không (mục 1).

### ios-dev 16/11 · sửa sau kiểm lại

Theo ba việc của "tester 16/11 · kiểm lại" thuộc `apps/ios`. Chỉ sửa trong `apps/ios` (và mục này). Máy: **chỉ iPhone 16** (`8620A918-…`, iOS 18.4); không đụng iPhone 16 Pro. Gói nhúng `e01f9e6a616d` (13467 file). Chưa commit.

#### 1. Nhãn thẻ từ bị cắt "PALAEONTO…"

**Nguyên nhân.**
- Thẻ kho FB (`DiscovererQuestionStep.bankCards`) in nhãn bằng `.lineLimit(1)` cùng `minimumScaleFactor(0.8)`.
- Trên iPhone 16, chữ trong thẻ rộng 92,3 pt. "PALAEONTOLOGY" ở `title` (Phudu 900, 21 pt) rộng 141 pt, nên cần thu còn 0,65. Mức tối thiểu là 0,8, nên SwiftUI cắt và thêm "…".
- `WordFit` (thu nhỏ tới 0,5) mới chỉ dùng cho lưới từ ở Tổng kết.
- Các chỗ khác in một từ cũng có lỗi này, gồm tên trên thẻ ảnh SC/MC sau khi đúng, chữ Đúng/Sai, tên cột biểu đồ và từ mới ở trang Học. Ở những chỗ đặt `lineLimit(2)`, một từ quá dài còn bị ngắt giữa từ.

**Đã sửa.**
- `Views/WordFit.swift` (mới) gồm ba phần:
  - `WordFit` chuyển từ `RecapStep` sang đây và được mở rộng:
    - Một từ: nằm một dòng, thu nhỏ tới 0,5.
    - Cụm nhiều chữ: một dòng nếu thu không dưới 0,8. Nếu không, chia thành ít dòng nhất (tối đa `maxLines`), ngắt ở dấu cách theo đúng cách SwiftUI ngắt dòng (greedy), ở cỡ lớn nhất mà mọi dòng đều vừa.
    - Bản cũ chỉ tính theo từ dài nhất. Với "thí nghiệm công bằng" cách đó sai: chữ thành 3 dòng và bị cắt.
  - `WordFitText`: đo bằng font thật, ở cỡ chữ đang dùng (đã tính Dynamic Type, cùng trần như `.typography`). `minimumScaleFactor(0.5)` chỉ còn là lưới an toàn.
  - `LabelWidths`: bề rộng chữ của từng loại thẻ, tính từ `LayoutMetrics` theo đúng cách view dựng thẻ. View và test dùng chung các con số này.
- Đã áp cho:
  - thẻ kho FB, tối đa 2 dòng; mọi thẻ trong kho cao bằng nhau (`reservedLines`);
  - lựa chọn không có hình (3 dòng);
  - `NameLabel` trên thẻ ảnh SC/MC (2 dòng);
  - chữ Đúng/Sai;
  - tên cột biểu đồ;
  - lưới từ ở Tổng kết;
  - thẻ "Từ mới" Explorer;
  - hai chỗ từ mới dạng hàng: trang Học Discoverer và Tổng kết Explorer khi không có thẻ Ý sai. Hai chỗ này đo bề rộng còn lại sau khi dựng, bằng `onGeometryChange`.
- **Bớt một cột khi một từ vẫn không vừa ở 0,5** (`LabelWidths.bankColumns`, `recapWordColumns`):
  - Kho FB ở Slide Over (320 pt): "palaeontology" cần 0,49.
  - Lưới Tổng kết ở cỡ chữ `xLarge` (trần của chữ trong hộp): "CARBOHYDRATE" cần 0,46 trên iPhone 16 và 16e. Lỗi này **mới tìm ra nhờ test quét gói** và đã có từ trước lượt này.
  - Ở cỡ chữ mặc định, cả ba máy giữ đúng số cột của thiết kế (3 cột kho trên phone, 4 trên iPad, 4 cột Tổng kết).

**Quét dữ liệu thật** (`WordFitLayoutTests`):
- Phạm vi: gói nhúng, cả EN và VI, **1954 nhãn mỗi máy**, ở cỡ chữ mặc định và `xLarge`.
- Kết quả: **0 nhãn bị cắt hay ngắt giữa từ** trên iPhone 16e (390), iPhone 16 (393) và iPad Pro 11 (834, khung 600).
- Cỡ nhỏ nhất ở cỡ chữ mặc định:

| Chỗ in | iPhone 16e | iPhone 16 | iPad Pro 11 |
| --- | --- | --- | --- |
| Thẻ kho FB | 0,65 "palaeontology" (1 dòng) | 0,65 | 0,96 "không thấm nước" |
| Tên trên thẻ ảnh SC/MC | 0,81 "go to the cliffs alone" | 0,80 "stomach fills with air" | 0,80 "trong bùn ở lòng sông" |
| Lựa chọn không hình | 1,00 | 1,00 | 0,81 "Chỉ một loại thức ăn" |
| Từ ở Tổng kết (4 cột) | 0,50 "CARBOHYDRATE" | 0,51 | 0,87 |
| Đúng/Sai, cột biểu đồ, thẻ Từ mới Explorer | 1,00 | 1,00 | 1,00 |

- "cổ sinh vật học" (bản VI của thẻ giữa): 2 dòng trên phone, ngắt giữa các chữ, cỡ không dưới 0,8 (`palaeontologyFitsTheBankCard`). Trên iPad nằm 1 dòng.
- Ảnh sau khi sửa: `/private/tmp/claude-501/-Users-buiduyluu--claude-spares-spare-7hJEda/5730aa52-aac5-4944-a855-c98bfdd7bb76/scratchpad/iosdev1611/shots/dd15-q2-hint-1611.png`.
  - Ba thẻ FIELDWORK · PALAEONTOLOGY · GEOLOGY đủ chữ, cao bằng nhau. "PALAEONTOLOGY" nhỏ hơn hai thẻ kia, khoảng 13 pt.

**Quyết định đã ghi:**
- Giữ mức thu tối thiểu 0,5 (designer 15/11).
- Thẻ kho tối đa 2 dòng, lựa chọn không hình 3 dòng.
- Thà bớt cột còn hơn cắt chữ.

**Chưa kiểm:**
- Bản VI trên máy (`-SKTestProfile vi_first`), iPad và Slide Over trên máy thật. Mới kiểm bằng test bề rộng.

#### 2. Mâm Chơi Explorer `/07` không hiện nút xong · lỗi harness, không phải lỗi app hay nội dung

**Bằng chứng.** Lấy từ cây giao diện lúc fail, file đính kèm trong `dd16/Logs/Test/Test-ScienceKids-2026.11.16_09-31-10-+0700.xcresult` của tester (bản chụp 09:38:39 và 09:38:50):
- Trên mâm chỉ có `tray_spider` và `tray_crab`. Lời nhắn: "You still need an animal with six legs."
- Lần chạm vào con kiến **không tới được app**.
- Kệ 8 hình, 3 cột, xáo theo lượt (`SeededOrder`, key `play`). Lượt này đặt `tray_ant` ở hàng 3, khung y 831–927, trên màn 852 pt.
- Thanh dưới của màn Chơi vẫn có khi chưa có nút. Đó là dải 16 pt nền `bg_screen`, kéo xuống hết vùng an toàn, nên che y 802–852.
- XCUITest coi con kiến là `isHittable`, vì một phần khung còn trong cửa sổ. Vì vậy harness không cuộn. Nó chạm vào phần lộ ra (khoảng y 841), và cú chạm rơi vào dải nền.

**Không phải app hay nội dung.** Unit test trên bài thật (`PlayTrayPackTests`):
- Kiến, nhện, cua, theo mọi thứ tự, cho `success`, lời nhắn `balanced`.
- Chỉ có nhện và cua thì ra đúng câu đã thấy trên ảnh.
- Cả **59 mâm của gói** (19 Explorer, 40 Discoverer): chọn một món mỗi nhóm `required` đều cân. Không nhóm `required` nào rỗng, và `capacity` đủ chỗ cho mỗi nhóm một món.

**Vì sao lúc được lúc không:**
- Mọi mâm Explorer có 7–8 hình, nên luôn có hàng 3 nằm dưới mép màn trên iPhone 16.
- Món nào rơi vào hàng 3 là do lượt xáo, mà mã lượt mới mỗi lần.
- `/04` qua vì cá chép và ếch rơi vào hàng 1–2.
- Trước SK-047 kệ cũng xáo ngẫu nhiên theo lượt, nên việc đổi sang `SeededOrder` không gây ra lỗi.

**Cách sửa harness cho tester.** Trong `tapElement` của `SK047FlowUITests.swift` và `SK047ShotsUITests.swift`:
- Cuộn tới khi **cả khung** nút nằm trên thanh dưới, đừng dựa vào `isHittable`.
- Sau mỗi lần chạm vào kệ, kiểm món đã lên mâm.

Ví dụ:

```swift
let bottom = app.windows.firstMatch.frame.maxY - 100   // vùng an toàn 34 + dải dưới/thanh mũi tên
var swipes = 0
while swipes < 4, !target.isHittable || target.frame.maxY > bottom {
    app.swipeUp(velocity: .slow)
    swipes += 1
}
target.tap()
// Chơi: món phải lên mâm (chạm lại món đã có trên mâm là bỏ nó ra)
// XCTAssertTrue(app.buttons["lesson.tray.\(key)"].waitForExistence(timeout: 3), "món \(key) không lên mâm")
```

Cách chọn món của harness (một món mỗi nhóm `required`, theo thứ tự nội dung) là **đúng** cho mọi bài.

**Góp ý cho designer (không sửa, ngoài phạm vi):**
- Chơi Explorer 7–8 hình trên iPhone 16: hàng 2 bị dải dưới che khoảng 19 pt, hàng 3 nằm hẳn dưới mép màn, bé phải cuộn mới thấy.
- Nếu muốn cả kệ vừa một màn thì cần chỉnh cỡ ô hoặc số cột.

#### 3. UI test cài sạch không vượt được màn Chào mừng

**Đã thêm launch argument `-SKTestProfile`** (chỉ bản Debug; bản Release không đọc tham số này, `LaunchOptions` nằm trong `#if DEBUG`).
- Cách dùng: `-SKTestProfile YES`, hoặc `bilingual` · `en_first` · `vi_first`.
- Khi máy **chưa có hồ sơ**, app lưu một hồ sơ thử trước màn đầu tiên: "Test", Lớp 3, Discoverer, `YES` là Song ngữ, giọng theo gợi ý.
  - App mở thẳng Trang chủ, hoặc mở bài nếu có `-SKOpenLesson`.
- Máy đã có hồ sơ thì giữ nguyên.
- Thêm `-SKResetProfile YES` thì mỗi lần mở là hồ sơ mới, không lịch sử, không lượt dở. Đừng dùng cách này cho test "tắt app rồi mở lại bài".
- Code ở `AppModel.makeTestProfileIfNone`. Test: `LaunchOptionsTests.testProfile`, `AppModelTests.testProfileOnlyWhenThereIsNone`.
- Đã ghi trong `apps/ios/README.md`, mục "Luồng mở app và hồ sơ".

**Đã thêm vào hai file của tester**, chỉ một tham số trong `launch()`:
- `"-SKTestProfile", "YES"`, trong `SK047FlowUITests.swift` (dòng 238) và `SK047ShotsUITests.swift` (dòng 171).
- Không đổi gì khác.

**Đã thử trên máy cài sạch:**
- `simctl uninstall` trên iPhone 16, rồi chạy **một** test `SK047ShotsUITests/testRocks15` một lần: **pass (71,6 s)**. App qua thẳng bài, không hiện Chào mừng.
- Không chạy các UI test khác.

#### 4. Số test (iPhone 16, một máy)

| Bộ | Kết quả |
| --- | --- |
| `build-for-testing` (iPhone 16) | **TEST BUILD SUCCEEDED**; log có `Content pack embedded … (13467 files)` |
| Unit test lượt 1 (bỏ UI test) | 410 test, **409 pass, 1 fail**: `everyPackLabelFitsItsCard` báo "CARBOHYDRATE" ở `xLarge` bị cắt (0,46) trên iPhone 16e và 16. Đây là lỗi thật, đã sửa ở mục 1 bằng cách bớt cột. |
| Unit test lượt 2, sau khi sửa | **411 test, 411 pass, 0 fail** (91 + 59 + 28 + 19 + 51 + 109 + 14 + 22 + 18) |
| UI test | chỉ `SK047ShotsUITests/testRocks15`, 1 lần, cài sạch: pass |

- Test mới: `WordFitLayoutTests` (5), `PlayTrayPackTests` (2), `WordFitTests` thêm 2, `LaunchOptionsTests.testProfile`, `AppModelTests.testProfileOnlyWhenThereIsNone`.
- Xong đã `xcrun simctl shutdown` iPhone 16. iPhone 16 Pro để nguyên.
- Log ở `/private/tmp/claude-501/-Users-buiduyluu--claude-spares-spare-7hJEda/5730aa52-aac5-4944-a855-c98bfdd7bb76/scratchpad/iosdev1611/`: `bft-1611b.txt`, `unit-1611.txt`, `unit-1611b.txt`, `uitest-rocks15-1611.txt`.

#### 5. File đổi

- `apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/WordFit.swift` (mới: `WordFit`, `WordFitText`, `LabelWidths`)
- `apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/DiscovererQuestionStep.swift`: kho FB, lựa chọn, `NameLabel`, Đúng/Sai, tên cột
- `apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/RecapStep.swift`: bỏ `WordFit` cũ; lưới từ và hàng từ Explorer
- `apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/ExplorerLearnStep.swift`: hàng từ Discoverer, thẻ từ Explorer
- `apps/ios/ScienceKids/App/LaunchOptions.swift`, `apps/ios/ScienceKids/App/AppModel.swift`: `-SKTestProfile`
- Test:
  - `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/WordFitLayoutTests.swift` (mới)
  - `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/PlayTrayPackTests.swift` (mới)
  - `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/QuizWaveOneTests.swift`
  - `apps/ios/ScienceKidsTests/LaunchOptionsTests.swift`
  - `apps/ios/ScienceKidsTests/OnboardingTests.swift`
- `apps/ios/ScienceKidsUITests/SK047FlowUITests.swift`, `SK047ShotsUITests.swift`: chỉ thêm `-SKTestProfile YES`
- `apps/ios/README.md`

**Duy cần làm:** không có (không cần key, Team ID hay migration).

#### 6. Tester cần chạy

1. **Cài sạch** iPhone 16 (`xcrun simctl uninstall <iPhone 16> vn.sciencekids.app`), rồi chạy `-only-testing:ScienceKidsUITests/SK047FlowUITests` một lần.
   - `launch()` đã có `-SKTestProfile YES`, nên không cần gieo `child_profile.json` nữa.
   - Đây là phần tiêu chí ios-dev "chưa chạy lại được" của lượt 16/11.
2. Sửa `tapElement` theo mục 2 (cuộn tới khi cả khung nút nằm trên thanh dưới, kiểm món lên mâm), rồi chạy `SK047ShotsUITests` một lần. `testExplorerRecapsNotSeenBefore` phải qua và chụp được `x07-recap2`.
3. Xem lại `dd15-q2-hint`: "PALAEONTOLOGY" đủ chữ.
   - Nếu được, chụp thêm bản VI bằng `-SKTestProfile vi_first -SKResetProfile YES`: "cổ sinh vật học" phải ở 2 dòng, ngắt giữa các chữ.
4. Chưa kiểm trên máy: iPad, Slide Over, cỡ chữ lớn. Hiện mới kiểm bằng `WordFitLayoutTests`.

### tester 16/11 · kiểm lại lượt 2

Kiểm trên **một máy iPhone 16** (`8620A918-…`, iOS 18.4), gói nhúng **`81e06c552629`**, `-SKSyncOff YES -SKReduceMotion YES`. Không đụng iPhone 16 Pro. Mỗi bộ test chạy **đúng một lần**. Xong đã `xcrun simctl shutdown` iPhone 16. Không sửa code sản phẩm, nội dung hay thiết kế; chỉ sửa hai file test của tester theo mục 2 "Tester cần chạy" của ios-dev. Chưa commit.

#### 1. Số test (tất cả xanh)

| Bộ | Kết quả |
| --- | --- |
| `build-for-testing` (iPhone 16) | **TEST BUILD SUCCEEDED**; log có `Content pack embedded … (13467 files)`; `manifest.json` trong `ScienceKids.app` = **81e06c552629**, 13467 file |
| iOS unit test (bỏ UI test), 1 lần | **411 test, 411 pass, 0 fail** (91 + 59 + 28 + 19 + 51 + 109 + 14 + 22 + 18) — khớp số ios-dev, nay trên gói mới |
| `SK047FlowUITests`, 1 lần, **máy vừa `simctl uninstall`** | **6 test, 6 pass, 0 fail**, 954 s, exit 0 |
| `SK047ShotsUITests`, 1 lần | **10 test, 10 pass, 0 fail**, exit 0 (thêm `testRocks15Vietnamese`) |
| `validate content` (chạy lại sau khi biên tập dọn ghi chú) | exit 0 · **0 lỗi, 136 cảnh báo**, cùng bốn mã và cùng số như trước |

**Việc 4 (cài sạch) đạt.** `-SKTestProfile YES` đưa app qua thẳng màn Chào mừng: lượt sáng 6/6 đỏ ở dòng `SK047FlowUITests.swift:271`, lượt này 6/6 xanh trên máy vừa gỡ app. Nhờ đó **mọi tiêu chí ios-dev mà lượt sáng không chạy lại được nay đã chạy lại trên gói `81e06c552629`**: xáo lựa chọn, nút gợi ý và `hint_used`, khoá thẻ `order_sequence` (`testOrderSequenceLocksCardsInPlace` nay xanh trọn, kể cả khẳng định "chạm vào ô đã khoá không lấy thẻ ra"), tên cột biểu đồ hiện từ đầu, hai màn Tổng kết, tắt app ở Tổng kết, luồng tới Thưởng.

**Việc 3 (mâm `/07`) đạt.** Tôi sửa `tapElement` trong cả hai file test theo đúng mẫu của ios-dev (cuộn tới khi `target.frame.maxY` nằm trên `maxY − 100`, `swipeUp(velocity: .slow)`, tối đa 4 lần) và thêm `tapShelf` kiểm `lesson.tray.<key>` sau mỗi lần chạm kệ. `testExplorerRecapsNotSeenBefore` nay **pass (386,8 s)** và chụp được `x07-recap2`. Không có lần chạm nào trượt trong cả hai bộ (0 lần `không lên mâm`).

#### 2. Ảnh (hậu tố `-1611b`, 63 ảnh ở `…/scratchpad/shots/`)

| Việc | Ảnh | Kết quả |
| --- | --- | --- |
| **Lỗi 1** `da-va-dat/03` trang Học | `dd03-learn4-1611b` | **đã sửa**: ba hòn đá nằm trọn, còn lề hai bên; hình nay vuông 1024, nội dung x 152–872 (cửa sổ hẹp nhất 115–909) |
| `khung-long/01` trang Học | `kl01-learn1…5-1611b` | hai hình nhóm dựng lại nằm trọn; `explore_dinosaurs` nội dung x 131–896, `explore_people` x 129–896 — đều trong vùng an toàn |
| `khung-long/01` Tổng kết màn 1 | `kl01-recap1-1611b` | ba thẻ đủ hình, không mảnh nào bị cắt; khoảng dư ≈ 93 pt |
| **Lỗi 2** nhãn thẻ, bản EN | `dd15-q2-1611b`, `dd15-q2-hint-1611b` | **đã sửa**: FIELDWORK · GEOLOGY · **PALAEONTOLOGY** đủ chữ, một dòng, không còn "…" |
| nhãn thẻ, bản VI (`-SKTestProfile vi_first -SKResetProfile YES`) | `dd15-q2-vi-1611b` | **"CỔ SINH VẬT HỌC" hai dòng, ngắt giữa các chữ**, không cắt; hai thẻ kia một dòng. Ba thẻ cao bằng nhau (đáy lệch 8 px = 2,7 pt, là bóng) |
| Tổng kết màn 2 trên iPhone 16 | `r-d2-ho-hap-01-1611b`, `r-d2-nod-ho-hap-03-1611b`, `r-x2-oc-bach-tuoc-va-con-vat-bien-1611b`, `x07-recap2-1611b` | **cả bốn vừa màn, không phải cuộn** |
| Explorer `/04` Tổng kết màn 1 | `x04-recap1-1611b` | vừa màn |

**Khoảng dư** (đo trên ảnh, từ đáy thẻ cuối tới dải chấm trang; màn 852 pt):

| Màn | Khoảng dư |
| --- | --- |
| `ho-hap/01` Tổng kết màn 2 (4 từ) | ≈ **80 pt** |
| `ho-hap/03` Tổng kết màn 2 (Na đúng) | ≈ **103 pt** |
| Explorer `/08` Tổng kết màn 2 (có thẻ Ý sai) | ≈ **67 pt** — chật nhất trong các màn đã đo |
| Explorer `/07` Tổng kết màn 2 (không thẻ) | ≈ 97 pt |
| Explorer `/06` Tổng kết màn 2 | ≈ 97 pt |
| `ho-hap/01` Tổng kết màn 1 | ≈ 93 pt |
| Explorer `/04` Tổng kết màn 1 (3 thẻ ảnh to) | ≈ **37 pt** — chật nhất trong các màn 1 |

#### 3. Lỗi mới: không có

**Chặn: không có. Lỗi: không có.** Hai lỗi của lượt sáng đã hết; không phát sinh lỗi nào khác trong phạm vi đã kiểm.

**Góp ý (không chặn, không cần sửa trong Đợt 1)**

1. **Thẻ ý chính 3 của `khung-long/01` nhỏ đi rõ** sau khi thu hình vào vùng an toàn (`kl01-recap1-1611b` so với `kl01-recap1-1611`): trục thời gian chỉ còn chiếm khoảng 2/3 bề ngang ô 136, ảnh khủng long cổ dài nhỏ hơn lượt sáng chừng 20 %. Vẫn đọc được và không bị cắt, nhưng đây là cái giá của việc sửa lỗi 1 — đúng như designer ghi. Nếu Duy thấy nhỏ quá thì hướng (b) của designer (khung ảnh trang Học theo tỉ lệ ảnh) sẽ gỡ được cả hai bên.
2. **`da-va-dat/15` q2 bản EN:** "PALAEONTOLOGY" nhỏ hơn hai nhãn kia rõ rệt (0,65 so với 1,0). Đúng thiết kế ("thà bớt cỡ còn hơn cắt chữ"), chỉ ghi để Duy biết khi xem ảnh.
3. Hai mục tôi nêu lượt sáng mà vòng này **không sửa**, đã có lý do trong ticket: dải ảnh câu biểu đồ `b14-q4-chart` (phần vẽ rộng 49 %; designer giải thích cỡ bị giới hạn bởi chiều cao ô, muốn phủ ngang phải vẽ thêm chai thứ ba — cần Duy đồng ý) và bốn hình chuỗi thức ăn giữ nguyên (designer đo: hình vuông và hình 4:3 cho chuỗi gần bằng nhau trên máy hẹp).
4. Bốn chỗ Explorer "cùng một ý, hai vai trái nhau" (hoa sen, luống hoa, voọc, cá ngựa) vẫn **chờ Duy chốt**, như lượt sáng.

#### 4. Việc 5 (dọn ghi chú vị trí đáp án)

`grep -rn "Đáp án ở chỗ" content/` → **0 dòng** (lượt sáng 25 dòng trong 12 file; biên tập báo dọn 67 dòng tính cả các dạng khác). 86 dòng "Vị trí đáp án đúng" còn lại đều là dòng ghi **hết hiệu lực 15/11**, đúng ý. `validate` sau khi dọn: 0 lỗi, 136 cảnh báo, không đổi. Ghi chú không vào gói nên `content_version` không đổi vì việc này.

#### 5. Bảng tiêu chí sau lượt 2

- **designer 5/5 đạt** · lỗi 1 (`explore_properties`) **đã sửa, kiểm trên máy**; hai hình `khung-long/01` dựng lại **đạt**.
- **dev 8/8 đạt** · gói `81e06c552629` nhúng đúng (13467 file, `content_version` khớp trong `.app`); `validate` 0 lỗi.
- **content-editor 7/7 đạt** · 5 mục "nên sửa" lượt 15/11 và việc dọn ghi chú đều xong.
- **ios-dev: 31 đạt, 3 chưa kiểm được** (lượt sáng 28 đạt / 5 chưa kiểm). Ba tiêu chí chuyển sang **đạt**: ① mọi tiêu chí dựa vào `SK047FlowUITests` nay đã chạy lại trên gói mới (gồm "thẻ đã khoá không chạm hay kéo ra được", trước chỉ đạt theo code); ② Explorer `/04` màn 1 **đã kiểm trên máy** (`x04-recap1-1611b`); ③ Explorer `/07` **đã kiểm trên máy** (`x07-recap2-1611b`, không có thẻ Ý sai). Thêm hai tiêu chí mới của lượt chiều: nhãn một từ không bao giờ bị cắt (**đạt**, EN và VI trên máy + `WordFitLayoutTests` quét 1954 nhãn), `-SKTestProfile` (**đạt**).
- **tester:** chạy lại tiêu chí ba agent — **đạt**; rà chữ — đạt; quét luật hình — đạt; ảnh theo đề bài — đủ.

**Tổng: 51 tiêu chí đạt, 3 chưa kiểm được, 0 chặn** (lượt sáng: 48 đạt / 5 chưa kiểm).

#### 6. Còn chưa kiểm

- **iPad và Slide Over**, **cỡ chữ lớn (`xLarge`)**: mới có `WordFitLayoutTests` (tính bề rộng), chưa xem trên máy. Một máy, một lượt.
- **VoiceOver/TalkBack đọc nhãn**: không bật được trong phiên agent.
- **Nghe bằng tai 28 clip của lượt sáng** (14 EN + 14 VI): danh sách ở mục "tester 16/11 · kiểm lại" phần 6; lượt chiều không sinh clip mới nên danh sách không đổi.
- **Gói nhúng trước SK-047 chạy trên app mới**: gói cũ đã bị ghi đè.

## pm 16/11 · đóng tài liệu

Duy duyệt 16/11 ("PM chốt tài liệu"). Chỉ sửa `docs/`, `prd.md`, `technical-plan.md`, `syllabus.md`, sửa từng chỗ, không đụng thay đổi chưa commit của SK-048. Chưa commit. Trạng thái giữ `review` tới khi Duy review và commit.

### File đã sửa

| File | Chỗ | Sửa |
| --- | --- | --- |
| `technical-plan.md` | dòng 3 (dòng "Sửa …") | thêm "Sửa 16/11: đóng SK-047 …" |
| `technical-plan.md` | A3 "Vòng lặp bài học" (dòng 46) | thêm Tổng kết bài giữa Quiz và Thưởng: 2 màn, bản Discoverer và bản Explorer (Scientist tạm dùng bản Discoverer), không chấm, bài được lưu khi vào Tổng kết; Discoverer có nút gợi ý mở được cả trước khi trả lời, Explorer không có nút |
| `technical-plan.md` | B4.4 (dòng 292) | hàng mới "Nút gợi ý": không đổi điểm, chỉ ghi `hint_used`; gợi ý app tự hiện sau lần sai không tính; Explorer không có nút |
| `technical-plan.md` | B7.6 (dòng 475, 477) | `Lesson(warmup → learn → play → quiz → recap → reward)`; một dòng về thời điểm lưu bài và nút gợi ý |
| `prd.md` | dòng 6 "Cập nhật"; mục 5 "Vòng lặp bài học" (dòng 64) | thêm Tổng kết bài và nút gợi ý |
| `syllabus.md` | đầu file (dòng 7); mục 1 "Cấu trúc 1 bài" (dòng 47–49) | thêm Tổng kết bài và nút gợi ý; ghi rõ khác bài "Tổng kết" cuối chủ đề (syllabus-progression mục 6) |
| `docs/quiz-system-proposal.md` | dòng 3 | trạng thái cũ "(todo, 15/11) … Chưa sửa code hay nội dung" đã sai, nay ghi Đợt 1 đã làm và nghiệm thu |
| `docs/backlog/README.md` | dòng SK-047 | ghi tài liệu đã cập nhật |
| Ticket này | "PM làm khi đóng ticket" | tick hai việc |

### Rà nhất quán `technical-plan.md`

Ngoài chuỗi vòng lặp và điều hướng đã sửa ở trên, không chỗ nào nói trái với việc SK-047 đã làm:
- B4.4 "Điểm một câu" và "sắp thứ tự … `partial_order_min` mặc định tắt": vẫn đúng. SK-047 không đổi cách chấm; khoá thẻ `order_sequence` chỉ là giao diện.
- B5.3 `quiz_answers.hint_used`: cột đã có. Nghĩa của cột nay ghi ở B4.4.
- B7.1 `QuizEngine` "thứ tự câu": không sai, vì câu vẫn theo thứ tự nội dung. Hàng này chỉ chưa nhắc việc xáo lựa chọn, nên để nguyên.
- B7.2: danh sách luật phải cho cùng kết quả trên hai nền tảng chưa có xáo lựa chọn và ghép hình thẻ ý chính. Vector của hai luật này hiện chỉ có trong test Swift. Để nguyên; sửa cùng việc Đợt 2 số 1.
- B8.0 `validate`: không có câu nào trái với hai luật mới (`multi_choice_correct_spread` mức lỗi, `vocab_item_uses_lesson_word` mức cảnh báo). README của `tools/content-cli` đã ghi đủ, nên để nguyên.
- Không có câu nào về tên cột biểu đồ hay việc cân vị trí đáp án bằng tay.

Ngoài phạm vi rà, chưa sửa: `docs/ios-test-build.md` dòng 7 (đích của bản chạy thử 28/10) vẫn ghi "Quiz 6 câu → Thưởng". File này đã cũ ở nhiều chỗ khác (Explorer 12 chủ đề), nên để nguyên.

### Nghiệm thu phía PM

- Theo "tester 16/11 · kiểm lại lượt 2": 51 tiêu chí đạt, 3 chưa kiểm được, 0 chặn, 0 lỗi. PM xác nhận đạt phía tài liệu.
- Ba tiêu chí chưa kiểm được trong bảng của tester:
  - VoiceOver đọc thẻ theo thứ tự trên màn;
  - iPad một hàng, cùng Slide Over và cỡ chữ lớn;
  - gói nhúng trước SK-047 chạy trên app mới (gói cũ đã bị ghi đè).
- Ngoài bảng tiêu chí, còn việc nghe bằng tai 28 clip mới. Các mục này cần máy thật hoặc người nghe. Đề xuất Duy kiểm khi cài lên máy; không mục nào chặn commit.
- Các ô trong danh sách tiêu chí ở trên:
  - Ba ô tester đã xác nhận đạt nhưng chưa tick (PM không tick thay): Explorer `/04` q4 khoá eggs; Explorer `/04` màn 1; Explorer màn 2 (`/08`, `/06`, `/07`).
  - Ba ô để trống đúng với kết quả kiểm: VoiceOver; ô mũi tên và 2 hàng (phần iPad chưa kiểm); gói nhúng trước SK-047.

### Việc sau (Đợt 2)

Gom từ ticket. Chưa tạo file ticket: số ticket và phạm vi Đợt 2 chờ Duy commit SK-047 rồi chốt.
1. **Ticket "test vector xáo + hình thẻ ý chính"** (tester, mục "Việc 5 của đề bài").
   - Chuyển vector vàng của `SeededOrder` và bảng 34 bài hình thẻ ý chính từ `QuizWaveOneTests.swift` sang `packages/content-schema/test-vectors/`.
   - Sửa `vector.schema.json`, `check-vectors.mjs`, `run-reference.mjs`; viết bản cài tham chiếu JS.
   - Nên làm cùng lượt Android chép thuật toán.
   - PM thêm: khi làm thì cập nhật luôn technical-plan B7.2 và hàng `QuizEngine` ở B7.1.
2. **Rà khoảng 60 gợi ý SC/MC kiểu "Remember the X picture/card"** ở Discoverer (Điều phối 16/11).
   - Cùng lượt này, rà các câu content-editor để ngỏ: `thoi-tiet-va-thien-tai/05` w3, `ho-hap/03` q1, `ho-hap/04` q2 và q4 (mục 4b của content-editor 16/11).
3. **Luật "một hình hai vai"**:
   - 6 bài chỉ phạm khi đọc luật chặt: `be-mat-trai-dat` 01–04, `khung-long/01`, `nao-bo-va-giac-quan/03`.
   - 4 chỗ Explorer cùng một ý mà hai vai: hoa sen (`sinh-vat-song-o-dau/01`), luống hoa (`/07`), voọc (`goi-ten-va-nhom-dong-vat/01`), cá ngựa (`/08`).
   - Duy chốt có đọc luật chặt hay không trước khi làm.
4. **`key_point_images`** (thay cách ghép hình thẻ ý chính theo chữ).
   - Danh sách của designer 16/11: `khung-long/02` ý 1, ý 2; `khung-long/03` ý 2; `da-va-dat/09` ý 1 (`explore_amber`); `da-va-dat/14` ý 2; `nao-bo-va-giac-quan/03` ý 1; 7 thẻ chưa có hình.
   - Cùng lượt rà hình: `alt` của `explore_gills` lệch ảnh (tester góp ý 7).
5. **Hai bài *Ăn uống lành mạnh***:
   - Chưa viết lại A2: còn "Na is not right." · "Na chưa đúng", và `01` q3 còn "The answer is …".
   - Chưa có file chọn ảnh: 67 `Image` hiện hình giữ chỗ (số của `build` 15/11), kể cả hai câu FB mới.
   - Thứ tự designer đề xuất: content-editor viết lại A2 và brief theo SK-033 → designer chọn và vẽ cả chủ đề → Duy duyệt.
6. **Câu hỏi còn mở 1–6** (mục "Câu hỏi còn mở"):
   - `claim_check` ở mọi bài hay chỉ bài cuối;
   - `claim_check` có thay `evidence_choice` không;
   - chữ trên thẻ lý do;
   - `sort_into_groups` giữ sau beta hay kéo lên Đợt 2;
   - Explorer cho linh vật đọc thêm có hợp D1 không;
   - sổ tay "Bài đã học" (Đợt 3).
7. **Phần ngoài phạm vi Đợt 1 đã ghi**:
   - Tổng kết theo kết quả: dấu tích, dòng "xem lại" (khung minh hoạ `r-d1-dot2`);
   - `claim_check`, `skill`, `quiz_blueprint`, `key_point_coverage`;
   - thêm câu FB cho *Khủng long*;
   - mở rộng `vocab_item_uses_lesson_word` cho các câu `skill: vocab`.
8. **Việc nhỏ**:
   - Explorer `chuoi-thuc-an/03` q4: đổi lời hỏi "Rice, mouse, owl", vì thẻ chuột có thể nằm giữa.
   - Khung kiểm khoảng 3:1 cho ảnh câu biểu đồ.
   - Ghi chú `learn_group` trong `image-slots.json`: tỉ lệ đo thật là 0,78–0,9:1, không phải 1:1.

### Chờ Duy (không chặn commit)

- Phạm vi và số ticket Đợt 2 (danh sách trên).
- Hình chờ duyệt:
  - cầu vồng `thoi-tiet-va-thien-tai/03` `q2_rainbow`;
  - ba bản 4:5 (bút sáp, chai, ruy băng) và hình ghép thằn lằn bay;
  - bố cục mới của `explore_dinosaurs` và `explore_people`;
  - bốn hình chuỗi thức ăn vuông;
  - dải `b14-q4-chart`: muốn phủ ngang thì phải vẽ thêm chai thứ ba.
- Trang Học Discoverer cắt hai bên hình 4:3. Chọn một trong hai hướng: (a) designer thu hình vào vùng an toàn, hoặc (b) ios-dev cho khung ảnh theo tỉ lệ ảnh.
- Chính tả "ngả rạp" hay "ngã rạp" (`thoi-tiet-va-thien-tai/05` q5 `hint`).
- Nghe 28 clip mới, kỹ hơn ở clip VI số 1, 6, 9, 13, 14 (`content/.build/tts/review-sk047-1611-vi.m4a`).
- 5 file ảnh không còn mục nào dùng (designer 15/11, mục 1): xoá hay giữ.
