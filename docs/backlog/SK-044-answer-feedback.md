# SK-044 · Lời giải thích khi chọn sai (để chọn lại) và khi chọn đúng (hiểu thêm), theo lứa tuổi

Trạng thái: in_progress · Ngày: 2026-11-13 · Phụ trách: content-editor, dev, ios-dev · Tester: tester
Nguồn: Duy 13/11 ("phần giải thích khi chọn 1 đáp án sai, cần giải thích để cho trẻ chọn lại … kể cả sau khi chọn đúng … cần có phần giải thích thêm để trẻ hiểu rõ. dùng ngôn ngữ phù hợp vs từng lứa tuổi")

## Mục tiêu
Sau mỗi lần bé chọn, app nói vì sao: chọn sai thì bé hiểu vì sao lựa chọn đó chưa đúng và có gợi ý để chọn lại; chọn đúng thì bé nghe thêm một ý giải thích, không chỉ "Đúng rồi".

## Quyết định (main session 13/11, Duy đổi được)
- Thêm trường tuỳ chọn `feedback` cho từng lựa chọn sai (`single_choice`, `multi_choice`, thẻ `fill_blank_bank`; `true_false` dùng `feedback` của câu cho từng đáp án): một câu ngắn nói vì sao lựa chọn đó chưa đúng. Cú pháp markdown dưới khối lựa chọn: `feedback.en: …` / `feedback.vi: …`; có giọng EN/VI.
- Chọn sai, còn lượt: app đọc `feedback` của lựa chọn vừa chọn, rồi `hint` (gợi ý cách nghĩ); không có `feedback` thì chỉ `hint`. Hết lượt: `explanation_wrong`. Chọn đúng: `explanation_correct` là câu giải thích thêm (vì sao đúng / thêm một ý), luôn đọc.
- Luật chữ theo tuổi (content-editor ghi vào TEMPLATE):
  - Explorer (5–7): 1 câu ≤ 8 từ EN; nói điều nhìn thấy được ("Con dơi không có lông vũ."); giọng ấm, không chê; không dùng "sai".
  - Discoverer (7–9): 1–2 câu ≤ 10 từ mỗi câu; nêu lý do; không lộ đáp án trong `feedback`/`hint`.
  - Scientist (9–11): 1–2 câu; được dùng thuật ngữ đã học.
- Làm trước cho Explorer *Gọi tên và nhóm động vật* (đang test), sau đó 6 chủ đề Discoverer pilot.

## content-editor 13/11

Không chạy lệnh, không đổi dòng `id:`. Mọi chữ mới là nháp AI.

**TEMPLATE** (`content/TEMPLATE.md`): thêm mục "Phản hồi sau mỗi lần chọn (SK-044)" ngay trước "Luật soạn câu Explorer": cách app dùng `feedback` → `hint` → `explanation_wrong` / `explanation_correct`; luật viết bốn trường; bảng theo ba nhóm tuổi (Explorer một câu tối đa tám từ, nói điều nhìn thấy; Discoverer một đến hai câu tối đa mười từ; Scientist một đến hai câu, được dùng thuật ngữ); ví dụ Explorer. Mục C thêm mẫu `#### option` có `feedback.en/.vi` và hai dòng `feedback_true` / `feedback_false` ở mẫu `true_false`.

**Tám bài *Gọi tên và nhóm động vật*** (`content/explorer/goi-ten-va-nhom-dong-vat/01` … `08`, Khởi động và Quiz):
- **`feedback` cho mọi lựa chọn sai: sáu mươi lăm lựa chọn** (bài 1 đến 8: mười, sáu, chín, bảy, mười, chín, năm, chín). Đặt ngay dưới `correct: false` trong khối `#### option`. Một câu, tối đa tám từ EN, nói điều nhìn thấy về chính con hay vật bé vừa chọn ("A lizard has scales, not fur." · "Thằn lằn có vảy, không có lông."); không nói "sai", không gọi tên đáp án.
- **`true_false`: hai mươi tám câu**, mỗi câu một dòng cho **phía bé chọn nhầm** (đặt sau `explanation_wrong.vi`): câu đáp án Đúng có `feedback_false.en/.vi`, câu đáp án Sai có `feedback_true.en/.vi`. Không viết phía còn lại (phía đó là đáp án đúng, app đọc `explanation_correct`). **Tên trường tạm**, dev chốt; đổi tên thì thay bằng tìm và thay một lượt.
- **`order_sequence`** (năm câu q4, bài 2, 3, 4, 5, 7): chưa có `feedback` (chấm cả chuỗi); giữ `hint`.
- **`hint`** giữ như cũ (đã qua hai lượt rà chữ, đều là cách nghĩ, không nói đáp án); đọc lại để không lặp ý với `feedback` mới.
- **`explanation_correct`** sửa ở mười bảy câu chỉ nhắc lại đáp án, cho có thêm một ý (danh sách dưới). `explanation_wrong` sửa một câu (bài 8 q3) vì trùng chữ với `explanation_correct` mới.

**Chữ trẻ nghe đổi** (ngoài chín mươi ba dòng `feedback*` mới):
| Bài · câu | Trường | Sau |
| --- | --- | --- |
| 1 w1 | `explanation_correct` | Yes! A duck walks, swims and eats. · Đúng rồi! Vịt biết đi, biết bơi và tự kiếm ăn. |
| 1 q1 | `explanation_correct` | Yes! People feed and care for pet cats. · Đúng rồi! Người cho mèo ăn và chăm sóc mèo. |
| 2 w2 | `explanation_correct` | Yes! A buffalo helps on the farm. · Đúng rồi! Trâu là vật nuôi, giúp nhà nông cày ruộng. |
| 2 q1 | `explanation_correct` | Yes! A cat has fur. It is a mammal. · Đúng rồi! Mèo có bộ lông mềm. Mèo là động vật có vú. |
| 3 q1 | `explanation_correct` | Yes! A sparrow has feathers and a beak. · Đúng rồi! Chim sẻ có lông vũ và có mỏ. |
| 3 q3 | `explanation_correct` | Yes! A gecko has dry, scaly skin. · Đúng rồi! Thạch sùng có da khô phủ vảy nhỏ. |
| 4 w1 | `explanation_correct` | Yes! Hens and other birds lay eggs. · Đúng rồi! Gà mái và các loài chim đều đẻ trứng. |
| 5 w1 | `explanation_correct` | Yes! A goldfish breathes in water with gills. · Đúng rồi! Cá vàng thở dưới nước bằng mang. |
| 5 q1 | `explanation_correct` | Yes! A duck flaps its wings to fly. · Đúng rồi! Vịt vỗ hai cánh để bay. |
| 6 w2 | `explanation_correct` | Yes! A crocodile has dry, scaly skin. · Đúng rồi! Cá sấu có da khô phủ vảy. |
| 6 q1 | `explanation_correct` | Yes! A buffalo eats only plants. · Đúng rồi! Trâu chỉ ăn thực vật. |
| 6 q5 | `explanation_correct` | Yes! An egret is a meat-eater. · Đúng rồi! Cò là con vật ăn thịt. (ý "cá cũng là thịt" chuyển sang `feedback_false`) |
| 7 w1 | `explanation_correct` | Yes! An egret catches fish and frogs. · Đúng rồi! Cò bắt cá và ếch nhái để ăn. |
| 7 q1 | `explanation_correct` | Yes! Ants, bees and butterflies are insects. · Đúng rồi! Kiến, ong, bướm đều là côn trùng. |
| 8 w1 | `explanation_correct` | Yes! Spiders and scorpions have eight legs. · Đúng rồi! Nhện và bọ cạp đều có tám chân. |
| 8 q1 | `explanation_correct` | Yes! An octopus can squeeze into small gaps. · Đúng rồi! Thân bạch tuộc mềm, chui lọt cả khe nhỏ. |
| 8 q3 | `explanation_correct`, `explanation_wrong` | Yes! Water flows through a sponge's holes. · Đúng rồi! Nước chảy qua những lỗ nhỏ trên thân bọt biển. / The answer is the sponge. It is full of holes. · Đáp án là bọt biển. Thân bọt biển đầy lỗ nhỏ. |

**Cần dev / ios-dev / PM**
- **Tên trường `true_false`:** đang viết `feedback_true` (bé chạm Đúng) và `feedback_false` (bé chạm Sai), mỗi câu chỉ một trong hai. Nếu dev chọn một trường `feedback` duy nhất cho phía sai (vì `true_false` chỉ có một phía sai), đổi cả hai tên thành `feedback` là đủ.
- **`true_false` thử lại:** `feedback` của câu Đúng/Sai gần như nói luôn đáp án (chỉ còn một phía), nên lượt thử thứ hai không còn là thử. SK-026 còn mở "số lần thử của `true_false` Explorer"; đề xuất `true_false` chỉ một lượt: chọn nhầm thì đọc `feedback_*` rồi `explanation_wrong`.
- **[CẦN KIỂM]** mới: bài 3 q2 "cá sấu mẹ đẻ trứng trên bờ"; bài 8 q1 "bạch tuộc chui lọt khe nhỏ"; bài 6 q4 "cá sấu chỉ ăn thịt"; bài 5 q5 "vịt bơi bằng chân có màng". Biên tập chắc cả bốn, chỉ nhờ chuyên môn đọc lướt.
- **Lộ nhẹ giữa các câu (chấp nhận):** bài 8 q4 `feedback` cá ngựa "A seahorse has fins, like a fish." gợi đáp án câu q5 kế tiếp; chỉ bé chọn nhầm cá ngựa ở q4 mới nghe câu này. Bài 6 q1 `feedback` cá nhỏ nói "cá là thức ăn của cò" trước câu q5 về cò (q5 đã nêu điều này trong câu hỏi).

## dev 13/11

Phần nội dung (content-schema + content-cli) xong. Tất cả là trường **tuỳ chọn**: nội dung cũ vẫn validate và build y như trước (fixture cũ không đổi byte nào, gói không có `feedback` thì không khác gì). Không đụng database, RPC hay app.

**Quyết định đã chốt (dev)**
- Lựa chọn và thẻ từ dùng `feedback` (Spoken: `{ en, vi, audio? }`) đặt **trên chính lựa chọn đó**: `ChoiceOption.feedback` (`single_choice`, `multi_choice`, và cả `picture_bar_chart` vì dùng chung `ChoiceOption`) và `BankWord.feedback` (`fill_blank_bank`).
- `true_false` dùng **hai trường ở cấp câu, `feedback_true` và `feedback_false`**: đặt tên theo phía bé chạm, đúng như content-editor đang viết. Vì sao không gộp thành một `feedback` duy nhất: app tra theo lựa chọn bé vừa chạm, giống cách tra ở `options` (`tapped ? feedback_true : feedback_false`); validate cũng bắt được trường hợp viết nhầm phía. Nhờ vậy 8 bài Explorer giữ nguyên, không phải đổi tên trường nào.
- Luật "chỉ lựa chọn sai" kiểm ở bước kiểm chéo (`packages/content-schema/scripts/lib/refs.mjs`), mức **lỗi**:
  - option có `correct: true` mà có `feedback` → lỗi tại `/…/options/<j>/feedback`;
  - thẻ `bank` có key nằm trong `answers` mà có `feedback` → lỗi tại `/…/bank/<j>/feedback`;
  - `true_false` có `answer: true` mà có `feedback_true`, hoặc `answer: false` mà có `feedback_false` → lỗi tại trường đó.
  Luật áp cho cả Khởi động lẫn Quiz.
- `order_sequence` và cấp câu của các format khác **không** có `feedback`; viết vào đó thì báo trường lạ.
- Số từ theo tuổi: `feedback` là Spoken nên luật `age_words_en` có sẵn tự đếm (mức cảnh báo, theo `max_words_en` trong `content/rules.json`: Explorer 8, Discoverer 10, Scientist 15 từ mỗi câu EN). Chưa kiểm **số câu** (Explorer 1 câu, Discoverer 1–2 câu). Muốn kiểm thì thêm một khoá vào `authoring` của rules.json; việc này cần PM đồng ý.

**Cú pháp markdown (cho content-editor)**

```markdown
#### option q1_bat
correct: false
feedback.en: A bat has fur, not feathers.
feedback.vi: Con dơi có lông, không có lông vũ.
label.en: bat
label.vi: con dơi

#### bank q2_air
label.en: air
label.vi: không khí
feedback.en: We breathe air.
feedback.vi: Ta hít thở không khí.

### q6
format: true_false
answer: false
feedback_true.en: …        (bé chạm Đúng; chỉ khi answer: false)
feedback_true.vi: …
# câu answer: true thì viết feedback_false.en / feedback_false.vi (bé chạm Sai)
```

Trong một khối, thứ tự các dòng không quan trọng. Thiếu một nửa của cặp `.en/.vi` thì báo lỗi ở dòng nửa còn lại, giống `label`.

**Cho ios-dev (hình dạng JSON và audio)**
- `options[j].feedback` và `bank[j].feedback`: `Spoken?`, khớp model đang có trong `ContentModel/QuizItem.swift`. Không cần sửa gì.
- **Còn phải thêm:** `TrueFalse.feedbackTrue: Spoken?` (khoá JSON `feedback_true`) và `feedbackFalse: Spoken?` (`feedback_false`). Bé chạm Đúng thì đọc `feedback_true`, chạm Sai thì đọc `feedback_false`; content đảm bảo chỉ phía chọn nhầm có. Nên thêm cả hai vào `LessonSpeech.feedbackSpoken` để tải trước audio.
- Audio: giống mọi Spoken, `feedback.audio.en` / `feedback.audio.vi` là sha256 của `assets/<sha256>.m4a` trong gói. `tts --lang en/vi` sinh clip, `build` chép vào gói và đưa vào manifest. Không có khoá audio riêng nào.
- Thứ tự khoá trong gói: option `key, label, correct, image, feedback`; bank `key, label, image, feedback`; `true_false` `… labels, feedback_true, feedback_false`.
- Gói của bản app hiện tại decode ổn vì `feedback` là optional; bản app cũ không biết trường này thì bỏ qua, không lỗi.

**File đã đổi**
- `packages/content-schema/schema/quiz-item.schema.json`, `src/quiz-item.ts` (zod khớp 1:1), `scripts/lib/refs.mjs` (`checkFeedback`), `scripts/make-invalid-fixtures.mjs` (thêm 2 mutation), `fixtures/invalid/feedback-on-correct-option.json`, `fixtures/invalid/true-false-feedback-right-side.json`, `test/invalid-fixtures.json`, `test/contract.test.mjs`, `test/feedback.test.mjs` (mới), `README.md`.
- `tools/content-cli/src/markdown/convert.ts` (đọc `feedback.*` dưới option/bank, `feedback_true.*` / `feedback_false.*` ở true_false), `src/markdown/check.ts` (gọi đúng tên markdown trong thông báo thiếu `.en/.vi`), `test/markdown.test.ts`, `test/fixtures/markdown/expected.json` (ca 36–39), `test/build.test.ts`, `README.md`.
- TTS và build **không cần sửa code**: hai bước này tìm Spoken qua schema (`spoken.ts` / `schema-walk.ts`), nên chữ `feedback` mới tự có clip EN/VI và audio trong gói. `build.test.ts` có test kiểm điều này.

**Kết quả chạy**
- `packages/content-schema`: `npm test` 159/159 pass · `npm run typecheck` sạch · `npm run validate` OK.
- `tools/content-cli`: `npm test` 383/383 pass (chạy trước khi thêm test build; test build SK-044 chạy riêng thì pass) · `npm run typecheck` sạch.
- `node src/cli.ts validate ../../content`: **0 lỗi**, 127 cảnh báo (`[CẦN KIỂM]`, hình…, có từ trước). Lần chạy đầu có 4 cảnh báo `age_words_en` cho `feedback_*` dài 9 từ ở Explorer; ở lần chạy sau thì không còn (content-editor đã sửa chữ).
- Import thử 8 bài *Gọi tên và nhóm động vật* vào scratch: đọc ra 65 `options[].feedback`, 14 `feedback_true`, 14 `feedback_false`, 0 `bank[].feedback` (Explorer không dùng `fill_blank_bank`).
- Chưa chạy TTS thật hay build gói thật cho chủ đề này (Kokoro/VieNeu chạy lâu). Bước đó làm khi phát hành gói mới.

**Tester cần kiểm**
1. Viết `feedback` dưới lựa chọn đúng, dưới thẻ đáp án, hoặc ở phía đúng của `true_false`: `validate` báo lỗi `schema` ở đúng dòng `feedback….en`.
2. Thiếu `feedback.vi` → lỗi ở dòng `feedback.en`, thông báo nhắc `feedback.vi`.
3. Câu `feedback` dài hơn luật tuổi → cảnh báo `age_words_en`, pointer `…/feedback/en`.
4. Sau `tts` + `build`: trong `pack.json`, mỗi `feedback` có `audio.en` và `audio.vi`, và file `assets/<hash>.m4a` có trong gói.
5. Gói cũ (không có `feedback`) build ra đúng từng byte như trước.

**Câu hỏi còn mở:** đề xuất của content-editor "`true_false` chỉ một lượt" thuộc phần luật chấm và app (PM/ios-dev, SK-026). Schema không ràng buộc chuyện này.

## ios-dev 13/11

Phần app xong (tiếp phiên trước bị dừng). Gói cũ không có `feedback` vẫn chơi như trước (mọi trường đều optional).

**Đã làm**
- Model (`ContentModel/QuizItem.swift`): `ChoiceOption.feedback` và `BankWord.feedback` (`Spoken?`, đã có từ phiên trước); thêm `TrueFalse.feedbackTrue` (`feedback_true`), `feedbackFalse` (`feedback_false`) và `TrueFalse.feedback(for:)`: trả `nil` khi phía bé chạm là đáp án.
- Lời nói (`LessonPlayer/LessonSpeech.swift`): `feedbackSpoken` gồm feedback của option, thẻ bank và `feedback_true/false`, đọc trước audio cùng bước. `feedback(_:for:)` tra theo lần thử: single choice và picture bar chart lấy option vừa chọn; multi choice lấy option sai đầu tiên có feedback; fill blank lấy thẻ sai đầu tiên có feedback; true_false lấy theo phía bé chạm; order_sequence không có feedback.
- Luồng đọc, cả Explorer lẫn Discoverer: chọn sai mà còn lượt thì hiện và đọc `feedback` rồi `hint` (không có feedback thì chỉ `hint`). Chọn đúng thì luôn hiện và đọc `explanation_correct`. Hết lượt thì đọc `explanation_wrong`.
  - Explorer: bong bóng mascot (`explorerLine` / `retryLines`). Sau khi chạm, app đọc tên hình rồi lời mascot trong cùng một lượt phát.
  - Discoverer: mảnh giấy "Gần đúng!" (`HintNote`) hiện feedback và hint, nút nghe đọc cả hai; khi xong, `ResultSheet` hiện lời giải thích. Lời giải thích giờ **tự đọc** ngay sau khi chấm (`resultUtterance`).
  - Khởi động Discoverer (chạm là trả lời): từ vừa chạm và lời phản hồi nằm trong một lượt phát, từ đọc trước, nên phản hồi không cắt ngang từ (`resultUtterance(_:status:name:)`).
  - Chế độ "Cả hai": như mọi câu nói khác (SK-042), app tự đọc EN; bản VI phát khi bé chạm nút "VI" nhỏ cạnh loa (bong bóng Explorer, `HintNote`, `ResultSheet`).
- **Quyết định:** `true_false` giữ số lượt thử theo `rules` như hiện nay. Đề xuất "một lượt" của content-editor vẫn để mở ở SK-026 (PM/Duy chốt). Hết lượt thì chỉ đọc `explanation_wrong`, không đọc lại `feedback`.

**File đổi (phiên này):** `apps/ios/Packages/SKKit/Sources/ContentModel/QuizItem.swift`, `Sources/LessonPlayer/LessonSpeech.swift`, `Sources/LessonPlayer/Views/QuestionStep.swift`, `Tests/LessonPlayerTests/ExplorerTests.swift` (thêm 2 test: `trueFalseFeedbackFollowsTheSideTapped`, `tappedWordLeadsTheResultUtterance`). Phiên trước đã đổi: `Views/LessonParts.swift` (`HintNote.feedback`) và phần feedback trong `QuestionStep` / `LessonSpeech`.

**Kết quả chạy (iPhone 16 Pro, 1 lần)**
- `xcodebuild build-for-testing` (Debug, scheme ScienceKids): TEST BUILD SUCCEEDED.
- `xcodebuild test-without-building -skip-testing:ScienceKidsUITests`: 375 test Swift Testing pass, 0 fail (có 3 test SK-044); TEST EXECUTE SUCCEEDED. Chưa chạy UI test.
- Thử trên máy với chủ đề thật: dùng `content-cli import content/explorer/goi-ten-va-nhom-dong-vat` vào scratchpad (đọc ra 65 `feedback`, 14 `feedback_true`, 14 `feedback_false`), mở bằng `-SKContentFolder`. Chế độ này không có hình và audio, nên thẻ hiện hình giữ chỗ và chưa nghe được clip. Ảnh trong scratchpad `shots/feedback-*.png`:
  - `feedback-explorer-retry.png`: bài 1, chọn sai còn lượt → "A pet dog eats from its bowl." + hint;
  - `feedback-explorer-out-of-tries.png`: hết lượt → `explanation_wrong`;
  - `feedback-explorer-correct.png`: chọn đúng → `explanation_correct`;
  - `feedback-discoverer-correct.png`: Khởi động, điền từ đúng;
  - `feedback-discoverer-tf-retry.png`: true_false, bé chạm Đúng → `feedback_true` (chữ thử, chỉ có trong bản sao ở scratchpad) + hint.
- Chưa kiểm: iPad, máy nhỏ, nghe audio thật (cần gói có `tts`), VoiceOver đọc mảnh "Gần đúng!" có feedback.

**Tester cần kiểm**
1. Gói có audio: chọn sai còn lượt → nghe tên hình, rồi feedback, rồi hint. Ở "Cả hai" chỉ nghe EN; nút "VI" phát feedback và hint bằng tiếng Việt.
2. Lựa chọn sai không có feedback → chỉ nghe hint.
3. Chọn đúng → luôn nghe `explanation_correct`; hết lượt → `explanation_wrong`.
4. Discoverer Quiz: sau "Kiểm tra" sai, `HintNote` có hai dòng (feedback, hint) và loa của nó đọc cả hai.
5. Gói cũ (6 chủ đề Discoverer, chưa có feedback) chơi y như trước.

## content-editor 14/11 · Bề mặt Trái Đất, Khủng long

Theo luật Discoverer ở TEMPLATE (SK-044) và ngân sách A2 (SK-043 "Duy 14/11 · duyệt Discoverer A2", bảng trong `design/play-ui/options/lesson-less-text/Discoverer-A2.html`). Mười bài: `content/discoverer/be-mat-trai-dat/01`…`05`, `content/discoverer/khung-long/01`…`05`. Không chạy lệnh, không đổi `id:`, key, đáp án, format hay `version`. Mọi chữ mới là nháp AI. Mỗi chỗ rút có ghi chú `> SK-044 (14/11, A2): …` ngay dưới dòng đã đổi.

**Feedback: 148 dòng mới** (cặp `.en/.vi`).
- 113 lựa chọn sai (`#### option`, `correct: false`) và 13 thẻ sai của `fill_blank_bank` (`#### bank` không nằm trong `answers`): mỗi cái một câu, tối đa mười từ EN và mười tiếng VI (vừa mẩu giấy A2). Nói về chính lựa chọn bé vừa chạm, nêu lý do, không gọi tên đáp án, không "sai".
- 22 câu `true_false` (cả câu Na): một dòng cho phía bé chọn nhầm (`feedback_true` khi đáp án Sai, `feedback_false` khi đáp án Đúng); đã soát cả 22 câu đúng phía.
- Theo bài (Bề mặt Trái Đất 1–5 · Khủng long 1–5): 14, 14, 15, 14, 16 · 14, 16, 16, 14, 15.
- `hint` giữ nguyên; feedback viết để không lặp ý với hint đọc ngay sau.

**Giải thích: 86 câu viết lại** (mọi câu Khởi động và Quiz của mười bài). `explanation_correct` một câu, bỏ "Yes!"/"Đúng rồi!", thêm một ý (ví dụ "Asia is the biggest continent, and Vietnam is in it."). `explanation_wrong` một câu lý do, bỏ "The answer is…"/"Đáp án là…", "This is true/false."/"Câu này đúng/sai", "Na is (not) right."/"Na nói đúng/Na chưa đúng". Mỗi câu tối đa mười từ EN, mười hai tiếng VI. Giữ chữ cũ (chỉ bỏ "Yes!" hoặc không đổi): Bề mặt Trái Đất 4 q6 `explanation_correct`; Khủng long 4 w2 `explanation_correct`; Khủng long 5 w2 `explanation_correct` (EN không đổi), q5 và q6 `explanation_correct` (chỉ bỏ "Yes!").

**Rút chữ: 48 chỗ** (chữ trẻ nghe đổi, ngoài feedback và giải thích):
| Bài | Đã rút |
| --- | --- |
| Bề mặt 1 | q5 câu hỏi (ngữ cảnh "Mai lấy ngón tay chặn quả địa cầu" chuyển sang `instruction`, xem câu hỏi 2 dưới); q6 lời Na một câu; Chơi `messages.start` đảo thứ tự hai câu |
| Bề mặt 2 | q5 câu hỏi một câu; q6 lời Na một câu |
| Bề mặt 3 | q4 câu hỏi (bỏ "Lan bổ đôi một quả đào"); q6 lời Na; Chơi `start` đảo thứ tự |
| Bề mặt 4 | Học ô Mác-ma và dung nham, ô Ở Việt Nam (VI); q2 câu điền thành một câu; q5 câu hỏi; q6 lời Na; Chơi `start` đảo thứ tự |
| Bề mặt 5 | w1 câu hỏi VI; Học ô Giữ an toàn (VI); q3, q5 câu hỏi; q6 lời Na; Chơi `start` |
| Khủng long 1 | Học ô Thời xa xưa, Con người (VI), ô Lâu cỡ nào (EN và VI, bỏ "Scientists found"); Chơi `start` VI; q6 lời Na |
| Khủng long 2 | Học ô Bò sát trên cạn (VI); Chơi `start` đảo thứ tự, `missing.tray_giant` VI; q6 lời Na |
| Khủng long 3 | Học ô Hoá thạch hình thành ra sao, ô Hình khủng long từ đâu (VI); Chơi `start` đảo thứ tự; q2 câu hỏi VI; q3 câu hỏi; q6 lời Na |
| Khủng long 4 | Học ô Khủng long ăn thực vật, ô Cách tự vệ (VI); Chơi `start` VI; q3, q4 câu hỏi; q6 lời Na |
| Khủng long 5 | Học ô Khối đá (EN và VI, bỏ "Scientists found"); Chơi `start`; q1 câu hỏi VI; q3, q4, q5 câu hỏi; q6 lời Na |

Cách rút: câu hỏi một câu, tối đa mười từ, mười tiếng; ngữ cảnh chuyển vào ảnh câu hỏi (ảnh đã có sẵn cảnh đó) hoặc vào câu chỉ đọc. Câu ô Học một câu, tối đa mười hai tiếng. Lời Na một câu, tối đa mười hai tiếng, giữ đủ hai vế và đáp án. `messages.start` của Chơi: câu đầu (in trong bong bóng) là việc bé cần làm và tự đứng được; câu thứ hai chỉ đọc. `khung-long/_topic.md` mục "Câu sáu, lời Na" thêm một dòng ghi bản lời Na mới.

**Sinh lại giọng:** toàn bộ dòng `feedback*` (mới), `explanation_correct/wrong` của 86 câu, và 48 chỗ ở bảng trên (gồm `instruction` mới ở Bề mặt Trái Đất 1 q5).

**Còn vượt ngân sách**
- Bề mặt Trái Đất 2, ô `explore_more_oceans`: câu Học hai câu, hai mươi mốt tiếng. Câu thứ hai ("Sách ở trường em có thể chia… theo cách khác") là câu Duy yêu cầu 9/11, nên chưa tự rút. Cần Duy chọn: gộp thành một câu khoảng mười ba tiếng, chuyển câu này sang ghi chú cho bố mẹ, hoặc giữ.
- Bề mặt Trái Đất 5 q4 (`fill_blank_bank` hai chỗ trống): câu điền hai câu, mười bốn từ ("Plates slip, and the ground {1}. Under the sea, this can make a {2}."). Gộp một câu thì mất ý "dưới đáy biển" hoặc thành câu khó đọc; giữ, chờ designer xem màn câu điền hai chỗ trống có chứa được không.
- Nhãn ô Học dài hơn một đến hai chữ (A2), chưa sửa vì không thuộc việc được giao: "Quả địa cầu", "Các châu lục khác", "Các đại dương khác", "Vỏ Trái Đất", "Nhân Trái Đất", "Mác-ma và dung nham", "Ở Việt Nam", "Giữ an toàn", "Thời xa xưa", "Lâu cỡ nào?", "Bò sát trên cạn", "Không phải khủng long", "Xương và răng", "Dấu chân và trứng", "Hoá thạch hình thành ra sao", "Hình khủng long từ đâu mà có", "Trứng và tổ", "Khủng long ăn thực vật", "Khủng long ăn thịt", "Cách tự vệ", "Khối đá từ vũ trụ", "Thiếu thức ăn". Rút được nếu PM/designer cho đổi nhãn.
- Bề mặt Trái Đất 4 ô Mác-ma: mười hai chữ nếu đếm "mác-ma" là một (theo dấu cách), mười ba nếu đếm theo tiếng.

**Cần ios-dev / dev / PM**
1. **`true_false` một lượt** (Duy duyệt A2 điểm 6) và feedback: ios-dev 13/11 ghi "hết lượt thì chỉ đọc `explanation_wrong`, không đọc lại `feedback`". Nếu `true_false` chỉ còn một lượt, 22 dòng `feedback_true/false` sẽ không bao giờ được đọc. Đề xuất: bé chọn nhầm `true_false` thì đọc `feedback_*` rồi `explanation_wrong` (hai câu đã viết để không lặp ý), hoặc PM bỏ hẳn trường này cho Discoverer.
2. **`instruction` làm câu ngữ cảnh chỉ đọc:** Bề mặt Trái Đất 1 q5 (`single_choice`) nay có `instruction` "Mai stops a spinning globe with her finger." (schema cho phép ở mọi format; app đọc `instruction` trước `prompt`). A2 coi `instruction` là chỉ đọc, không in. ios-dev xác nhận Discoverer A2 không in `instruction` ở `single_choice`; nếu có in thì báo để chuyển câu này vào ảnh.
3. **Đổi format theo A2** (khung-long/03 q3 và be-mat-trai-dat/04 q3 sang `order_sequence`): chưa làm, vì việc này đổi đáp án và `version`, ngoài phạm vi lần này. Làm khi PM giao.
4. **[CẦN KIỂM] mới** (biên tập khá chắc, nhờ chuyên môn đọc lướt): Biển Đông là một phần của Thái Bình Dương (Bề mặt 2 q5); châu Á là châu lục lớn nhất (Bề mặt 2 q2); Châu Phi "bên kia Ấn Độ Dương", Đại Tây Dương "phía bên kia Trái Đất" so với Việt Nam (Bề mặt 2 q2, q5); "trong tối, cây không tự làm ra thức ăn" (Khủng long 5 q4); cổ dài giúp với tới lá cây cao (Khủng long 5 w1); răng như bút chì tuốt lá khỏi cành (Khủng long 4 q2); răng trâu dẹt nghiền lá (Khủng long 4 q3); chân thẳng dưới thân đỡ thân nặng (Khủng long 2 q4); chuồn chuồn và cây vạn tuế ngày nay vẫn còn, nói theo nhóm (Khủng long 1 q3).
5. **Lộ nhẹ (chấp nhận):** feedback `true_false` gần như nói lý do của đáp án (chỉ có hai phía), như đã ghi ở phần Explorer.

## content-editor 14/11 · Hô hấp, Não bộ, Thời tiết

Theo luật Discoverer ở TEMPLATE (SK-044) và ngân sách A2 (SK-043 "Duy 14/11 · duyệt Discoverer A2"). Mười ba bài: `content/discoverer/ho-hap/01`…`04`, `nao-bo-va-giac-quan/01`…`04`, `thoi-tiet-va-thien-tai/01`…`05`. Không chạy lệnh, không đổi `id:`, key, đáp án, format hay `version`. Mọi chữ mới là nháp AI; mỗi bài có một dòng `> 14/11 (SK-044, …)` dưới Mục tiêu, chỗ rút lớn có ghi chú riêng.

**Feedback: 185 dòng mới** (cặp `.en/.vi`).
- 119 lựa chọn sai (`#### option`, `correct: false`) và 30 thẻ sai `fill_blank_bank`: mỗi cái một câu, tối đa mười từ EN, mười tiếng VI (vừa mẩu giấy A2). Nói về chính thứ bé vừa chạm, nêu lý do, không gọi tên đáp án, không "sai". Đã soát: không còn lựa chọn sai hay thẻ sai nào thiếu `feedback`, không lựa chọn đúng nào có.
- 36 câu `true_false` (cả 13 câu Na): một dòng cho phía bé chọn nhầm, đúng phía theo `answer`.
- Theo bài (option + thẻ · true_false): Hô hấp 10·3, 10·3, 10·3, 13·3; Não bộ 14·2, 14·1, 12·2, 12·3; Thời tiết 12·2, 10·3, 10·4, 12·3, 10·4.

**Giải thích: 104 câu, cả hai lời viết lại** (mọi câu Khởi động và Quiz). `explanation_correct` một câu, bỏ "Yes!"/"Đúng rồi!", thêm một ý (ví dụ "Gills take oxygen from the water for the fish."). `explanation_wrong` một câu lý do, bỏ "The answer is…", "This is true/false.", "Na is (not) right." và bản VI. Tối đa mười từ EN, mười hai tiếng VI. Một ít câu `explanation_correct` vốn đã là lý do thì chỉ bỏ "Yes!".

**Hint sửa: 8 câu** (hai câu thành một, hoặc để không lặp ý với feedback đọc ngay trước): Hô hấp 1 q4, Hô hấp 2 q1; Não bộ 2 q2, q5, q6; Thời tiết 1 q1, q3, q6.

**Rút chữ: 65 chỗ** (chữ trẻ nghe đổi, ngoài feedback, giải thích, hint):
| Bài | Câu hỏi (prompt hoặc câu điền) | Câu ô Học | Lời Na |
| --- | --- | --- | --- |
| Hô hấp 1 | w2 (VI), q5 | Con vật, Khí ô-xi | |
| Hô hấp 2 | q3 (bỏ "Lan bị nghẹt mũi", ý nằm ở hình), q4 | Thức ăn và không khí | |
| Hô hấp 3 | q2 câu điền (VI), q4 (bỏ "sau ba việc") | Nghỉ ngơi (EN), Cơ bắp | q6 |
| Hô hấp 4 | w3 (VI), q3 (VI), q4 | Khói (VI) | q6 |
| Não bộ 1 | q3, q4 | | q6 (bỏ "trên võng", ý ở hình) |
| Não bộ 2 | w1, q1 câu điền, q4 (bỏ "đá quả cầu", ý ở hình) | Dây thần kinh, Rất nhanh (VI) | q6 |
| Não bộ 3 | w2 (VI), q3, q4 (bỏ "Lan nhắm mắt", ý ở hình), q5 | | q6 |
| Não bộ 4 | w1 (VI), q5 | Mũ bảo hiểm, Giấc ngủ, Khi em ngủ (VI) | q6 |
| Thời tiết 1 | w1, w2, q3 (bỏ "mây đen kéo tới", ý ở hình), q4 | | q6 |
| Thời tiết 2 | q4, q5 (VI) | Ống đo mưa, Cảm giác của mình (VI) | q6 |
| Thời tiết 3 | w2 (VI), q3, q5 (VI) | Dự báo (VI) | q6 |
| Thời tiết 4 | q2 câu điền (VI), q3, q4 | Lũ lụt, Hạn hán (VI), Hai mùa | q6 |
| Thời tiết 5 | w2 (VI), q2 câu điền (VI), q3, q4 | Lắng nghe (VI) | q6 |

Cách rút: câu hỏi một câu, tối đa mười từ EN, mười tiếng VI; ngữ cảnh chuyển vào ảnh câu hỏi (ảnh đã có sẵn cảnh đó), không dùng `instruction`. Câu ô Học một câu, tối đa mười hai tiếng. Lời Na một câu, tối đa mười hai tiếng, giữ hai vế và đáp án. Ba `_topic.md` sửa theo: mục "Câu sáu, lời Na" và các `note` có trích lời Na; luật "This is …/Na is …" ở mục Đúng/Sai ghi **hết hiệu lực 14/11**.

**Chữ trẻ nghe đổi nghĩa, cần người duyệt đọc**
- Hô hấp 1 w2: câu VI không còn đúng chữ ô Sống sót của *Khủng long* bài năm (EN giữ nguyên chữ).
- Hô hấp 1 q4: hint mới "Remember the diver on the Oxygen card." trỏ ô có ảnh thợ lặn mang bình khí; gần lộ đáp án hơn hint cũ. Ý "thức ăn, nước chờ được" của hint cũ nay ở feedback của chai nước, hộp cơm. Nếu thấy lộ, đổi lại hint thành "Think what your body needs every single minute."
- Não bộ 2 q1: câu điền EN đổi "to and from your brain" thành "between your brain and your body" (cho VI vừa mười tiếng).
- Não bộ 3 q5: câu hỏi nay hỏi "Quả nào…", không còn "Bộ não của em nhận ra đó là gì?"; ý "não ghép ba tin" chuyển vào `explanation_correct`.
- Thời tiết 1 w2 `explanation_correct`: so giọt nước trên kính với "một đám mây nhỏ" (nối ô Trời nhiều mây).
- Thời tiết 3 q1 `explanation_correct`: **[CẦN KIỂM]** "Bão thường tới từ tháng sáu đến tháng mười một" (biên tập nhớ). Phương án thay đã ghi trong bài nếu không xác nhận được.
- Thời tiết 4 q2: câu điền VI đổi "quá ít" thành "thiếu".

**Sinh lại giọng:** mọi dòng `feedback*` (mới), `explanation_correct/wrong` của 104 câu, 8 hint, và 65 chỗ ở bảng trên.

**Còn vượt ngân sách** (ngoài phạm vi lần này, chưa sửa)
- Thưởng `fact`: 11 thẻ còn hai câu hoặc hơn mười hai tiếng (Hô hấp 1–4; Não bộ 2, 4; Thời tiết 1–5). A2: tên thẻ + một câu tối đa mười hai tiếng.
- Chơi `messages.*`: khoảng 17 lời nhắn hơn mười hai tiếng, phần lớn là `start` một câu dài (ví dụ Não bộ 1 "Em tìm một việc cần suy nghĩ, một việc cử động, và một việc không cần nghĩ nhé."). Lời hai câu có câu đầu tự đứng được thì đạt A2 (câu hai chỉ đọc).
- Nhãn ô Học dài hơn một đến hai chữ (ví dụ "Thức ăn và không khí", "Suy nghĩ và ghi nhớ", "Cảm giác của mình"): chưa sửa, như ghi chú của phần Bề mặt Trái Đất, Khủng long.
- Sáu lời giải thích và mười một câu ô Học hoặc lời Na đang chạm đúng trần mười hai tiếng (đếm theo dấu cách; câu có "ô-xi" vẫn không quá mười hai nếu đếm "ô-xi" là hai tiếng).

**Cần ios-dev / dev / PM**
1. **`true_false` một lượt và feedback** (cùng câu hỏi với phần Bề mặt Trái Đất, Khủng long): 36 dòng `feedback_true/false` ở ba chủ đề này chỉ được đọc nếu app đọc `feedback_*` trước `explanation_wrong` khi bé chọn nhầm. Hai lời đã viết để không lặp ý.
2. **[CẦN KIỂM] mới** (biên tập khá chắc): mang lấy ô-xi từ nước (Hô hấp 1 q2); tôm thở bằng mang (Hô hấp 3 w2, đã có ở ô Chơi); tro núi lửa là mảnh đá rất nhỏ (Hô hấp 4 w3); đóng cửa sổ ngăn bớt khói bụi (Hô hấp 4 q4); tim bơm máu tới chân (Não bộ 1 q4); não giữ nhịp thở khi nghỉ (Não bộ 1 q6); dự báo báo bão trước vài ngày (Thời tiết 3 q3); hạn hán kéo dài nhiều tuần, nhiều tháng (Thời tiết 4 q2); ngoài biển không cây vẫn có gió (Thời tiết 1 q6, 3 w3).
3. **Lộ nhẹ giữa các câu (chấp nhận):** Hô hấp 4 q1 và Não bộ 1 w3 dùng cùng feedback cho mũ vải, áo mưa (cùng câu hỏi, khác bài); Não bộ 3 q3 feedback "Veins carry blood, not messages." nhắc lại thẻ q2 ngay trước.

## content-editor 14/11 · Đá và đất

Theo luật Discoverer ở TEMPLATE (SK-044) và ngân sách A2 (SK-043 "Duy 14/11 · duyệt Discoverer A2", bảng và ghi chú content trong `design/play-ui/options/lesson-less-text/Discoverer-A2.html`). Mười lăm bài `content/discoverer/da-va-dat/01`…`15`. Không chạy lệnh, không đổi `id:`, key, đáp án, format hay `version`. Mọi chữ mới là nháp AI. Chỗ rút câu hỏi có dòng `> A2 (SK-043, 14/11): …` ngay dưới khối giải thích.

**Feedback: 220 dòng mới** (cặp `.en/.vi`; 222 trước khi bài 8 q4 đổi sang `order_sequence`).
- 160 lựa chọn sai (`correct: false`) và 30 thẻ sai `fill_blank_bank`: mỗi cái một câu, tối đa mười từ EN, mười tiếng VI (vừa mẩu giấy A2). Nói về chính thứ bé vừa chạm, nêu lý do, không gọi tên đáp án, không "sai". Không lựa chọn đúng hay thẻ đúng nào có.
- 30 câu `true_false` (15 câu Na): một dòng cho phía bé chọn nhầm; đã soát cả 30 câu đúng phía theo `answer`.
- Theo bài 1 → 15 (option + thẻ · true_false): 12·2, 12·2, 11·2, 13·2, 12·2, 15·2, 12·2, 9·2, 13·2, 14·2, 11·2, 14·2, 15·2, 12·2, 15·2.
- `hint` giữ nguyên (chỉ đọc theo A2); feedback viết để không lặp ý với hint.

**Giải thích: 125 câu** (mọi câu Khởi động và Quiz). `explanation_correct` một câu, bỏ "Yes!"/"Đúng rồi!", thêm một ý (ví dụ "Gas bubbles in the lava left these tiny holes.", "River mud built the Mekong Delta this way."). `explanation_wrong` một câu lý do, bỏ "The answer is…", "This is true/false.", "Na is (not) right." và bản VI. Tối đa mười từ EN, mười hai tiếng VI. Giữ chữ cũ hoặc chỉ bỏ "Yes!": bài 1 q6, bài 12 w2 (`explanation_correct` không đổi); bài 8 q2, bài 10 q3 và q6, bài 13 q4 (chỉ bỏ "Yes!", bài 13 q4 rút VI).

**Theo đề xuất A2 cho bài 02** (designer dùng bài này làm mẫu):
- Trang Học "Lỗ": một câu, theo bản rút của designer: "Pumice has tiny holes and was once hot lava." · "Đá bọt có lỗ nhỏ li ti, từng là dung nham nóng." (câu cũ nói chung "có loại đá có lỗ", nay nói đá bọt, đúng ảnh của ô; đá ba-dan vẫn là ví dụ).
- Lời Na: "Both are grey, but they are different kinds of rock." · "Cùng màu xám, nhưng đây là hai loại đá khác nhau."
- `messages.has_limited` không đổi: câu đầu "Thứ đó không phải đá." tự đứng được, câu sau chỉ đọc.
- q4: "Which rock is made of thin, flat sheets?" · "Hòn đá nào gồm nhiều tấm mỏng xếp chồng?" (bỏ nhân vật Nam). q5: "Which one is a real rock?" · "Thứ nào là đá thật?" (bỏ câu ngữ cảnh; ba ảnh tự cho thấy).
- q2 câu điền bỏ "nhiều màu": "Granite has lots of shiny {1}." · "Đá hoa cương có nhiều {1} lấp lánh."
- Chữ nháp của designer trên các màn: giữ feedback đèn pin, thẻ "lỗ", đá hoa cương (q3), `feedback_true` bê tông, cột thấp (bài 14). Đổi: `explanation_correct` q1 (thêm ý "thấy hạt rất nhỏ trên đá"), `feedback_false` câu Na ("Một hòn có lỗ nhỏ, hòn kia thì không có.", bỏ "Nhìn kỹ đi"), giải thích câu Na và biểu đồ theo chữ trong bài. Designer cập nhật trang A2 nếu cần.

**Hình đổi (cho designer)**
| Bài · chỗ | Trước | Sau |
| --- | --- | --- |
| 02 q1 `q1_mirror` | `[hình vẽ]` gương cầm tay tròn có cán (trông giống kính lúp, A2 phải dán nhãn ngoại lệ) | `[hình vẽ]` gương soi để bàn hình chữ nhật, khung gỗ mỏng, chân đỡ phía sau, không tròn, không cán; `alt` "A mirror on a stand" · "Chiếc gương soi để bàn". Nhãn giữ "mirror" · "cái gương". Bỏ ngoại lệ nhãn ở màn d-q1-ask. |
| 14 q4 (đã đổi sang `picture_bar_chart`) | ba hình biểu đồ có vầng sáng (`q4_left`, `q4_middle`, `q4_right`); hình câu hỏi là biểu đồ không đánh dấu | **bỏ** ba hình vầng sáng (app vẽ cột từ `chart.bars`); hình câu hỏi đổi sang dùng lại `sandy_soil` của bài 12; hình biểu đồ không đánh dấu chuyển làm hình gốc của từ vựng `data`. |
| 08 q4 (đã đổi sang `order_sequence`) | khung không là hình câu hỏi; ba khung (một, hai, bốn) là hình lựa chọn | khung không thành thẻ `q4_snail`; hình câu hỏi dùng lại `explore_not_dino`; không cần hình mới. |

**Rút chữ: 79 chỗ** (chữ trẻ nghe đổi, ngoài feedback và giải thích):
| Bài | Câu hỏi (prompt hoặc câu điền) | Câu ô Học | Lời Na | Chơi |
| --- | --- | --- | --- | --- |
| 1 | q4 (bỏ "Lan"), q5 | Đá quanh em (VI), Từ lòng đất (EN một câu), Do con người làm ra (EN, VI) | q6 | `balanced` (VI) |
| 2 | q2 câu điền, q4, q5 | Lỗ | q6 | |
| 3 | w1 (VI), q4 (bỏ "Mai"), q5 | Tính chất (VI) | q6 | |
| 4 | | Khoáng vật, Thang Mohs, Đối chiếu (VI), Nặng hay cứng (EN, VI) | q6 | `balanced` (VI) |
| 5 | q4 (bỏ "Mai"), q5 (bỏ "Nam") | Bọt khí (EN, VI) | q6 | |
| 6 | q4, q5 (bỏ "nhà Nam") | | q6 | |
| 7 | q4, q5 | Lực tự nhiên, Phong hoá (VI) | q6 | `has_limited` (VI) |
| 8 | w1, q2 câu điền (VI), q4 | Không chỉ khủng long (VI), Phân huỷ (EN, VI) | q6 | `balanced` (VI) |
| 9 | q4 | Hổ phách, Chất khoáng lấp đầy, Cổ sinh vật học (VI) | q6 | `balanced` (VI) |
| 10 | q2 câu điền (VI), q4 (bỏ "Lan"), q5 | Bà tìm thấy gì (VI) | q6 | |
| 11 | q1, q4 (bỏ "Mai"), q5 (bỏ "Lan") | Mảnh đá (VI) | | |
| 12 | q4 (bỏ "Lan"), q5 (bỏ "Mai") | | q6 | |
| 13 | q2 câu điền (VI), q4 | Quá ướt hay quá khô (VI) | q6 | |
| 14 | q1 (VI), q3 (bỏ "Lan"), q4 (bỏ "Mai"), q5 | Giữ công bằng, Kết quả (EN, VI) | | `has_limited` (EN, VI) |
| 15 | w2, q3, q4, q5 | Giữ an toàn (VI) | q6 | `balanced` (VI) |

Cách rút: câu hỏi một câu, tối đa mười từ EN, mười tiếng VI; ngữ cảnh dài vào ảnh câu hỏi (ảnh đã có cảnh đó) hoặc chuyển sang giải thích; không dùng `instruction`. Câu ô Học một câu, tối đa mười hai tiếng (EN cũng gộp một câu). Lời Na một câu, tối đa mười hai tiếng. `_topic.md`: mục "Câu sáu, lời Na" thêm dòng ghi bản lời Na mới; luật "This is …/Na is …" và "The answer is …" ghi **hết hiệu lực 14/11**.

**Chữ trẻ nghe đổi nghĩa, cần người duyệt đọc**
- Bài 2 Học "Lỗ": từ "có loại đá có lỗ… từng là dung nham" (nói chung) thành "đá bọt… từng là dung nham" (nói một loại).
- Bài 2 q1: hình gương đổi (bảng trên).
- Bài 3 q5, bài 5 q4: câu hỏi dùng "after the scratch test" / "after the water test" thay cho kể việc Mai làm.
- Bài 14 q4: câu hỏi "Which bar shows water through sandy soil?" (cột là lượng nước); ý "trong một phút" chuyển sang `explanation_correct`.
- Bài 15 q6 `explanation_correct`: "Rocks from space tell us about faraway worlds." (không dùng chữ "thiên thạch", theo bảng Tên gọi của chủ đề).

**Sinh lại giọng:** mọi dòng `feedback*` (mới), `explanation_correct/wrong` của 125 câu, và 79 chỗ ở bảng trên.

**Order_sequence / picture_bar_chart: đã đổi** (sau khi dev chốt ở SK-043 "## dev 14/11", main session báo 14/11):
- Bài 08 q4 → `order_sequence`, `version` 2: bốn thẻ bộ "Mặt cắt lòng đất" `q4_snail` (mới), `q4_decay`, `q4_layers`, `q4_found` (giữ key), `answer` theo thứ tự đó. Câu hỏi "How does a shell become a fossil?" · "Vỏ ốc thành hoá thạch ra sao?", gợi ý và hai lời giải thích mới. Bỏ hai dòng feedback của `q4_layers`, `q4_found` (dạng này không có `feedback`).
- Bài 14 q4 → `picture_bar_chart`, `version` 2: ba `#### bar` trái sang phải đất vườn (sáu), đất cát (chín), đất sét (hai), `value` [CẦN KIỂM]; ba `#### option` giữ key `q4_left`, `q4_middle`, `q4_right` và hai feedback, nhãn trùng nhãn cột (tên đất), không có hình; `chart.unit` "water caught in one minute". Đáp án vẫn ở chỗ thứ hai.
- `_topic.md` mục Luật soạn chung ghi ngoại lệ này. `FORMAT_FIRST_APP_VERSION.picture_bar_chart` còn `null` nên `build` có thể báo `format_not_rendered` cho bài 14 tới khi ios-dev có renderer.

**Còn vượt ngân sách** (ngoài phạm vi lần này, chưa sửa)
- Thưởng `fact`: 14 thẻ hai câu hoặc hơn mười hai tiếng (mọi bài trừ bài 2). A2: tên thẻ + một câu tối đa mười hai tiếng.
- Chơi `messages.start`: tám lời một câu dài mười ba đến mười bảy tiếng (bài 1, 2, 3, 4, 7, 13, 14, 15). A2 dùng `prompt` của khay làm lời mở đầu, nên `start` chỉ đọc; nếu app vẫn in `start` thì cần rút.
- Nhãn ô Học dài hơn hai chữ (ví dụ "Do con người làm ra", "Người săn hoá thạch hôm nay", "Một ngày hay nhiều năm", "Chất khoáng lấp đầy") và chip nhóm Chơi hơn ba chữ (ví dụ "Móng tay cào xước được", "Chỉ thìa mới cào xước được", "Không phải khoáng vật", "Không phải thành phần của đất"). Rút được nếu PM, designer cho đổi nhãn.
- `hint` hai câu (bài 6 q3, q5; bài 8 w1, q3): chỉ đọc theo A2, chưa sửa.
- Ghi chú "Số từ EN trên một màn" ở Ghi chú cho dev của các bài là số cũ.

**Cần ios-dev / dev / PM**
1. **`true_false` một lượt và feedback:** đã giải quyết. Main session báo 14/11: app đọc `feedback_*` trước `explanation_wrong` khi bé chọn nhầm, giữ trường. 30 dòng của chủ đề này viết để không lặp ý với `explanation_wrong`.
2. **TEMPLATE** (PM): bảng "Phản hồi sau mỗi lần chọn" cột Discoverer còn ghi `explanation_wrong` "Như Explorer" ("The answer is …" + lý do) và Discoverer `feedback` "một đến hai câu". A2 Duy duyệt đã đổi: giải thích một câu, không "Đáp án là …"; mẩu giấy in một câu feedback. Ba chủ đề đã soạn theo A2; đề xuất sửa TEMPLATE cho khớp.
3. **[CẦN KIỂM] mới** (biên tập khá chắc, nhờ chuyên môn đọc lướt): chỉ kim cương cào xước được kim cương (bài 4 q1); kim cương cắt được kính (bài 5 w1); mỗi hạt đá hoa cương là một khoáng vật (bài 4 q2, bài 9 w2); khoáng vật lấp đầy xương thành đá (bài 8 w2); phù sa bồi nên đồng bằng sông Cửu Long (bài 7 q4); hút cát làm bờ sông lở nhanh hơn (bài 7 q5); bò sát biển thời khủng long thở bằng phổi (bài 10 w3); đá ong mới đào để ngoài trời thì cứng dần (bài 6 q5); Đà Lạt mát vì nằm trên cao (bài 13 q6); Việt Nam trồng nhiều lúa trên đất phù sa (bài 13 w1); đất ngấm nước nặng hơn, dễ trượt ở sườn dốc (bài 15 q4).
4. **Lộ nhẹ (chấp nhận):** bài 12 feedback cà phê, hồ tiêu chỉ nói "trồng trên đồi", không nói "đất đỏ", để không lộ câu q4 ngay sau; bài 4 q4 feedback "thạch anh trước hoạt thạch mềm hơn" nói thứ tự của hai trong ba thẻ (là lý do, không gọi tên hàng đúng).

## designer 14/11 · hình theo bảng "Hình đổi" (chủ đề Đá và đất)
Đã đọc lại `.md` mới nhất của bài 02, 08, 14 trước khi làm. Không sửa `.md`.
- **02 q1 `q1_mirror`:** vẽ lại `content/images/own/da-va-dat/b02-q1.q1_mirror.jpg` (1024×768) theo brief mới.
  - Gương soi để bàn hình chữ nhật, khung gỗ mỏng, chân đỡ phía sau, vẽ chéo, mặt gương chỉ phản chiếu nền. Không tròn, không cán.
  - Cùng nét và cùng cỡ với đèn pin, kính lúp. Nằm trọn trong dải giữa 5:2 của thẻ A2.
  - `title` trong file chọn ảnh đổi thành "A mirror on a stand". Màn `d-q1-ask` không cần nhãn ngoại lệ nữa.
- **08 q4 (order_sequence):**
  - Hình khung không (`b08-q4.jpg`) đổi tên thành `b08-q4.q4_snail.jpg`, làm thẻ `q4_snail`.
  - Hình câu hỏi `q4` là `same_as learn.explore.explore_not_dino`. App A2 ẩn hình này vì mọi thẻ xếp đều có hình.
  - Bốn thẻ đều là hình vẽ 1024×768, cùng bộ "Mặt cắt lòng đất".
- **14 q4 (picture_bar_chart):**
  - Bỏ `q4.q4_left`, `q4.q4_middle`, `q4.q4_right` khỏi file chọn ảnh và xoá ba file vẽ.
  - Hình câu hỏi `q4` là `same_as sandy_soil` (bài `cac-loai-dat-o-viet-nam`).
  - Biểu đồ không đánh dấu (`b14-q4.jpg`) đổi tên thành `b14-vocab.data.jpg`, làm hình gốc của `vocab.data`.
- `images fetch` chạy không gọi mạng (Commons đã trả 429 quá ba lần): ba hình tự vẽ mới đã vào cache, không lỗi.

**Đề xuất alt (content-editor quyết, designer không sửa `.md`):**
| Bài · chỗ | Alt hiện tại | Đề xuất | Lý do |
| --- | --- | --- | --- |
| da-va-dat 01 q1 `q1_kiln` | "Brick kilns by a river" · "Những lò gạch bên sông" | "Brick kilns" · "Những lò nung gạch" | Thẻ 5:2 cắt ngang hàng lò, không còn thấy sông (người đứng ở bờ sông bị cắt ra ngoài). |

**Đề xuất brief cho các bài sau (Discoverer A2):**
- Thẻ lựa chọn 2–3 đáp án là dải ngang 5:2. Brief của vật đứng riêng (quả bóng, chai, đồng hồ, lá) nên ghi: "ảnh ngang, vật ở giữa, hai bên còn khoảng trống cùng nền" hoặc "vật nằm ngang".
- Ảnh vật dọc (chai nước, cốc đá, hộp cơm) hiện chỉ cắt được một dải giữa. Ví dụ: chai nước chỉ còn nắp và vai chai.
- Lưới 4 đáp án là 4:5 dọc. Kệ Chơi và thẻ từ là 1:1.
- Bảng khung chính thức: `tools/content-cli/image-slots.json` và SK-043 mục "designer 14/11".
