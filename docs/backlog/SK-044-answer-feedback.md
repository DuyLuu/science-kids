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
