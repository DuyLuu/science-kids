# SK-010 · LessonEngine iOS: chấm câu, điểm bài, sao, XP theo test vector

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: ios-dev · Tester: tester
Nguồn: docs/ios-test-build.md mốc 1 việc I6 và mục quyết định 4 (ngưỡng đạt); technical-plan.md B4.4 (luật chấm và thưởng), B7.2 (engine dùng chung, test vector); SK-003 (vector, quyết định D1–D6, T1–T6); `packages/content-schema/test-vectors/README.md`

## Mục tiêu
ios-dev viết engine Swift thuần chấm từng câu, tính điểm bài, sao và XP tạm trên máy. Engine phải cho đúng kết quả của bộ vector chung, để sau này Android và server tính giống hệt.

## Phạm vi
- Module `LessonEngine` trong SKKit: Swift thuần, không I/O, không phụ thuộc module khác. Kiểu input riêng của engine, không dùng thẳng model của `ContentModel`. LessonPlayer chuyển đổi.
- Hàm theo tên camelCase ở README vector:
  - `scoreItem(item, tries, rules)`;
  - `scoreLesson(quizResults, warmupResults)`;
  - `computeStars(attempts, rules)`.
  - Lỗi trả mã như vector (`too_many_tries`, `try_after_correct`, `no_tries`, `invalid_answer`, `invalid_results`), không ném crash.
- `scoreItem` chấm đủ 6 format v1. UI bản thử chỉ có 4 dạng, nhưng `order_sequence` và `picture_bar_chart` chỉ là logic ngắn và đã có 9 case vector (quyết định 1).
- `Rules` decode từ `default_rules` của vector; về sau đọc từ manifest (SK-015). Ngưỡng đạt so bằng số nguyên `correct * den >= num * max` (D3). Mặc định 5/6.
- **XP** theo B4.4: `xp_per_correct` 10, `xp_lesson_complete` 20, `xp_game_complete` 10, đọc từ `rules`. Chưa có vector (SK-003 để XP ngoài phạm vi, chờ B18 #13). Viết unit test theo đúng bảng B4.4 và đánh dấu "tạm, chờ vector".
- **Harness vector:** test đọc thẳng `packages/content-schema/test-vectors/{item-scoring,lesson-score,stars}.json` qua `#filePath`, chạy từng case, báo theo `id`. Chạy cả case `confirmed` lẫn `proposed`, in số đạt theo từng `status`.

## Ngoài phạm vi
- `streak`, `local-date`: SK-022 (mốc 3). Làm sớm hơn được nếu rảnh, vì không cần Supabase.
- `warmup-selection`: bản thử dùng nguyên 2 câu `warmup` soạn sẵn của bài 1, không chọn câu.
- Luật mâm cơm (`build_tray`): đặt trong module này nhưng làm ở SK-012, cùng vector mới của tester.
- Ôn nhanh, siêu sao, thẻ, huy hiệu.

## Tiêu chí nghiệm thu
- [ ] `xcodebuild test` scheme `ScienceKids` trên iPhone 16: harness chạy **71 case**, gồm `item-scoring` 33, `lesson-score` 11 và `stars` 27; **71/71 pass**. Log in số đạt theo `status` (`confirmed` 36, `proposed` 35). Dán log.
- [ ] Case lỗi cố ý: sửa `expected` của một case trong bản sao vector (trong bộ nhớ) → test báo fail đúng `id` đó. Chứng minh harness không pass rỗng.
- [ ] Đổi `default_rules.pass_threshold` thành 4/6 (trong bộ nhớ) → vẫn 71/71. Lý do: mọi case có kết quả phụ thuộc ngưỡng đều ghim `pass_threshold` riêng (SK-003). Như vậy engine đọc `rules` của từng case, không dùng hằng số.
- [ ] Unit test XP: 6/6 câu đúng ở lần đầu, xong mâm cơm, xong bài → 6×10 + 10 + 20 = 90. Câu đúng ở lần thử 2 không cộng `xp_per_correct`.
- [ ] `LessonEngine` không `import` UIKit, SwiftUI, AVFoundation hay module SKKit khác (kiểm bằng `grep`).
- [ ] Không sửa vector. Case nào ios-dev thấy sai thì ghi vào SK-003 cho tester, không sửa code cho khớp vector sai.
- [ ] Không sửa file ngoài `apps/ios/` (trừ ghi chú trong ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- SK-005. Chạy song song với SK-008, SK-009.
- SK-012 dùng engine này để chấm và hiện sao.
- Case `proposed` dựa trên D1–D6 và T1–T6 của SK-003, đang chờ Duy chốt. Duy đổi quyết định thì tester sửa vector, engine sửa theo.

**Quyết định đã ghi** (PM đề xuất 28/10)
1. Engine chấm đủ 6 format để đạt 71/71 như ios-test-build ghi. "Để sau" trong plan chỉ áp cho giao diện của 2 dạng `order_sequence` và `picture_bar_chart`.
2. XP tính theo B4.4 nhưng chỉ để hiện tạm. Server chốt ở mốc 3. Canvas đang ghi số khác (Chơi +20 XP), nên giữ B4.4 cho tới khi Duy chốt B18 #13.

**Câu hỏi còn mở**
- XP có trong bản thử không (B18 #13 đề xuất có thể lùi XP sang GĐ 2)? Nếu bỏ thì màn Thưởng chỉ hiện sao và thẻ.

## Kết quả (ios-dev)

Ngày 28/10/2026 · Xcode 16.3 (16E140), Swift 6.1, chế độ Swift 6 · simulator iOS 18.4 · DerivedData ở scratchpad, ngoài repo. Chưa commit.

### Đã làm
- Module `LessonEngine` (`apps/ios/Packages/SKKit/Sources/LessonEngine/`). Chỉ `import Foundation` (dùng `Date` cho `completed_at`), không phụ thuộc target nào:
  - `LessonEngine.swift`: `ScoringError` (rawValue là mã của vector).
  - `Rules.swift`: `Rules`, `Fraction` (`isReached(correct:max:)` so `correct * den >= num * max`), `XPRules`.
  - `ItemScoring.swift`: `ScoringItem` (6 format), `ScoringOption`, `Try`, `ItemScore`, `scoreItem(item:tries:rules:)`.
  - `LessonScoring.swift`: `ItemResult`, `LessonScore`, `quizLength`, `scoreLesson(quizResults:warmupResults:)`.
  - `Stars.swift`: `LessonAttempt`, `StarsResult`, `computeStars(attempts:rules:)`. `LocalDate.swift`: ngày lịch `YYYY-MM-DD`.
  - `XP.swift`: `XPAward`, `computeXP(score:gameCompleted:rules:)`.
- `LessonEngineTests` (`Tests/LessonEngineTests/`), 14 test:
  - `JSONValue.swift`: JSON bất kỳ, so sâu chính xác.
  - `VectorHarness.swift`: tìm `test-vectors/` từ `#filePath` như README của vector; gộp `rules`; chuyển input sang kiểu của engine, output sang JSON; báo theo `id`.
  - `VectorTests.swift`: mỗi bộ một test, một test chạy cả ba bộ, ba test tự kiểm harness.
  - `LessonEngineTests.swift`: XP, `Rules`, `Try`, `LocalDate`.
- Engine viết từ B4.4, D1–D6 và T1–T6, **không đọc** `tools/reference-engine.mjs`, nên là lần kiểm độc lập đầu tiên như SK-003 mong. Kết quả: 71/71 khớp ngay lần chạy đầu, không sửa engine theo case nào.

### Quyết định đã ghi (ios-dev, Duy xác nhận khi review)
3. **API.** Hàm tự do `scoreItem(item:tries:rules:)`, `scoreLesson(quizResults:warmupResults:)`, `computeStars(attempts:rules:)`, `computeXP(score:gameCompleted:rules:)`. Lỗi trả `Result<_, ScoringError>`, không ném, không trap. `computeStars` không có mã lỗi vì vector không có.
4. **Kiểu input riêng.**
   - `ScoringItem` chỉ giữ key và `correct`.
   - `Try` có 5 dạng, `Codable` đúng hình dạng vector (`{selected}` chuỗi hoặc mảng, `{value}`, `{filled}`, `{order}`). Đây cũng là đề xuất cho `quiz_answers.answer` (B5.3) và cho file lưu bài dở ở SK-012.
   - `ItemResult` `Codable` (`item_id`, `points`, `final_correct`).
   - `LessonAttempt.completion` là `{at: Date, localDate: LocalDate}?`: lần làm chưa xong thì `nil`, nên không có trạng thái "xong mà thiếu ngày".
5. **`Rules`** decode từ object rules phẳng: `max_tries`, `partial_order_min` (nhận `null`), `pass_threshold {num, den}`, `mastery_gap_days`. Khoá chưa dùng (`rest_days_per_week`, `warmup`) bị bỏ qua. Engine không có giá trị mặc định nào; test đọc `default_rules` từ file vector.
6. **XP** (tạm, chờ vector):
   - `XPRules` tách riêng (`xp_per_correct`, `xp_lesson_complete`, `xp_game_complete`), vì `default_rules` của vector chưa có khoá XP. Decode từ cùng object rules.
   - XP câu đúng = `perCorrect × LessonScore.correct`. Engine cộng `points`, nên câu đúng ở lần thử 2 không có XP, còn điểm sắp thứ tự từng phần (D2) thì có.
   - `gameComplete` cộng khi xong mâm. `lessonComplete` cộng khi `completed`. Khởi động không có XP.
   - Luật "ôn lại đạt thành thạo +20" của B4.4 chưa làm, vì `rules` chưa có tên khoá.
7. **Thứ tự kiểm lỗi** của `scoreItem`: `no_tries` → `too_many_tries` → `invalid_answer` (từng lần thử) → `try_after_correct`. Vector chưa chốt thứ tự ưu tiên; mỗi case lỗi chỉ có một lỗi nên thứ tự này không ảnh hưởng kết quả.
8. **Mở rộng T3, chưa có vector:**
   - lần thử có hình dạng của format khác (ví dụ `{value}` cho `single_choice`, `{selected: "x"}` cho `multi_choice`) → `invalid_answer`;
   - `multi_choice` chọn rỗng → hợp lệ, chấm sai;
   - `fill_blank_bank` điền cùng một từ vào hai ô → hợp lệ, so theo vị trí.
9. **Mở rộng T5, chưa có vector:** `quiz_results` có `points` ngoài 0…1 → `invalid_results`, để `correct` không vượt `max`. `warmup_results` không được kiểm (T4).
10. `quizLength = 6` là hằng của schema v1 (`quiz` có đúng 6 câu), không phải tham số `rules`.
11. **Sao:**
    - sắp lần làm theo `completed_at`; trùng thời điểm thì theo `attempt_id`;
    - khoảng cách tính bằng ngày lịch giữa hai `local_date` (`LocalDate`, công thức days-from-civil), không dùng `Calendar` hay múi giờ;
    - đổi thời điểm sang `local_date` là việc của SK-022.
12. **Harness:**
    - mỗi bộ là một `@Test` có tham số;
    - so sâu JSON: object đúng tập khoá, mảng theo thứ tự, `null` khác với thiếu khoá;
    - lệch thì `Issue.record("<id> [<status>]: expected …, got …")`;
    - in số đạt theo `status` cho từng bộ và cho cả ba bộ.

### Tự kiểm tiêu chí nghiệm thu

| Tiêu chí | Kết quả | Bằng chứng |
| --- | --- | --- |
| 71 case, 71/71 pass, in theo `status` | pass | Scheme `ScienceKids`, iPhone 16: `vectors all: 71/71 pass · confirmed 36/36 · proposed 35/35` (bảng và log dưới). iPad Pro 11-inch (M4) cho kết quả giống hệt. |
| Case lỗi cố ý báo đúng `id` | pass | Test `editedExpectationFailsByID` sửa trong bộ nhớ: `item-scoring-001` (points 1 → 0) → `failedIDs == ["item-scoring-001"]`; `lesson-score-003` (correct 5 → 6) → `["lesson-score-003"]`; `stars-006` (mastered 03/11 → 04/11) cùng `stars-002` (bỏ khoá `mastered_date`, để kiểm null khác thiếu khoá) → `["stars-002", "stars-006"]`. Thêm một lần chạy làm bằng chứng: tạm sửa `VectorTests.swift` để làm hỏng `item-scoring-001` và `stars-006` ngay trong test thật. Log: `✘ … ↳ item-scoring-001 [confirmed]: expected {…"points":0…}, got {…"points":1…}`, `vectors item-scoring: 32/33 pass · confirmed 20/21`; `↳ stars-006 [confirmed]: expected {…"mastered_date":"2026-11-04"…}, got {…"2026-11-03"…}`; `** TEST FAILED **`. Sau đó trả file về như cũ (`grep -c TEMPORARY` → 0) và chạy lại xanh. |
| `default_rules.pass_threshold` = 4/6 → vẫn 71/71 | pass | `defaultThresholdFourSixthsStillPasses`: `vectors with default_rules.pass_threshold 4/6: 71/71 pass`. Kiểm thêm chiều ngược lại (`unpinnedThresholdFollowsDefaultRules`): giữ mặc định 4/6 và bỏ ghim `pass_threshold` của `stars-021` → engine ra 2 sao và case fail. Như vậy ngưỡng đi từ `rules` của từng case, không phải hằng số. |
| Unit test XP | pass | `perfectLessonIs90`: 6 câu (đủ 6 format) đúng lần đầu qua `scoreItem` → `scoreLesson` → `computeXP` = 60 + 10 + 20 = **90**. `rightOnSecondTryEarnsNoCorrectXP`: q4 đúng ở lần 2 → points 0, XP câu đúng 50, tổng 80. `warmupAndUnfinishedParts`: khởi động không có XP, bài và mâm chưa xong thì không có XP hoàn thành. `xpRulesDecodeFromRulesObject`: giá trị đọc từ `rules`. Ghi trong code: tạm, chờ vector. |
| Không import UI, AV hay module SKKit khác | pass | `grep -rnE "import +(UIKit\|SwiftUI\|AVFoundation\|AVFAudio\|DesignSystem\|ContentModel\|ContentKit\|LessonPlayer\|AudioKit)" Sources/LessonEngine` → không có dòng nào (exit 1). `grep -rn "^import" Sources/LessonEngine` → chỉ `Stars.swift:1:import Foundation`. Trong `Package.swift`, `.target(name: "LessonEngine")` không có `dependencies`. |
| Không sửa vector | pass | `find packages/content-schema -type f -mmin -90` → rỗng. Không thấy case nào sai (xem "Gửi tester"). |
| Không sửa ngoài `apps/ios/` | pass | Ngoài `apps/ios/` chỉ sửa ticket này và SK-009. `Package.swift`, `project.yml` không đổi. Không commit. |

**Số case pass theo file và `status`** (iPhone 16 và iPad Pro 11-inch (M4) như nhau):

| File | confirmed | proposed | Tổng |
| --- | --- | --- | --- |
| `item-scoring.json` | 21/21 | 12/12 | 33/33 |
| `lesson-score.json` | 6/6 | 5/5 | 11/11 |
| `stars.json` | 9/9 | 18/18 | 27/27 |
| **Tổng** | **36/36** | **35/35** | **71/71** |

Phần cuối log `xcodebuild test -scheme ScienceKids -destination 'platform=iOS Simulator,name=iPhone 16'`:
```
✔ Test run with 13 tests passed after 0.051 seconds.
✔ Test run with 10 tests passed after 0.024 seconds.
ContentModel: decoded 2/2 valid fixtures (1 topic, 1 lesson)
✔ Test run with 20 tests passed after 0.044 seconds.
vectors item-scoring: 33/33 pass · confirmed 21/21 · proposed 12/12
vectors lesson-score: 11/11 pass · confirmed 6/6 · proposed 5/5
vectors stars: 27/27 pass · confirmed 9/9 · proposed 18/18
vectors item-scoring: 33/33 pass · confirmed 21/21 · proposed 12/12
vectors lesson-score: 11/11 pass · confirmed 6/6 · proposed 5/5
vectors stars: 27/27 pass · confirmed 9/9 · proposed 18/18
vectors all: 71/71 pass · confirmed 36/36 · proposed 35/35
harness self-check: edited expectations fail as ["stars-002", "stars-006"]
vectors with default_rules.pass_threshold 4/6: 71/71 pass
✔ Test run with 14 tests passed after 0.075 seconds.
✔ Test run with 2 tests passed after 0.001 seconds.
✔ Test run with 2 tests passed after 0.001 seconds.
✔ Test run with 1 test passed after 0.001 seconds.
** TEST SUCCEEDED **
```
Mỗi bộ in hai lần: một lần ở test riêng của bộ, một lần ở test chạy cả ba bộ. Bundle theo thứ tự: ScienceKidsTests 13, DesignSystemTests 10 (của SK-007), ContentModelTests 20, LessonEngineTests 14, ContentKitTests 2, LessonPlayerTests 2, AudioKitTests 1. Trên iPad Pro 11-inch (M4), xcresult ghi `Passed 62/62`. Lần chạy iPad trước đó cũng `TEST SUCCEEDED`, nhưng xcodebuild báo không lưu được result bundle (`mkstemp: No such file or directory`), nên đã chạy lại cho có xcresult sạch.

### Gửi tester (ghi ở đây vì phiên này chỉ được sửa SK-009, SK-010; nhờ điều phối chép sang SK-003)
- **Không thấy case nào sai.** Engine viết độc lập với `reference-engine.mjs` và khớp cả 71 case ngay lần đầu.
- **Đề xuất thêm vector** cho các chỗ engine đang tự chọn (quyết định 7–9, 11):
  1. lần thử có hình dạng của format khác → `invalid_answer`?
  2. `multi_choice` chọn rỗng `{selected: []}`: chấm sai hay `invalid_answer`?
  3. `fill_blank_bank` điền cùng một từ vào hai ô: hợp lệ không?
  4. `lesson-score` có `points` = 2 hoặc âm → `invalid_results`?
  5. `stars` có hai lần làm trùng `completed_at`; `max` = 0; `correct > max`;
  6. XP khi B18 #13 chốt: thêm `xp_*` vào `default_rules`, kèm các case 90 / 80 như unit test ở trên;
  7. thứ tự ưu tiên khi một input có hai lỗi (câu hỏi mở của SK-003).

### Việc còn lại
- **SK-012:** chuyển `QuizItem` (ContentModel) sang `ScoringItem`, gọi engine, lưu `Try` và `ItemResult` của bài dở.
- **SK-012 và vector mới của tester:** luật mâm cơm `build_tray`.
- **SK-022:** `streak`, `local-date` (cần `TimeZone`/`Calendar` ở harness hoặc engine).
- **Khi Duy chốt D1–D6, T1–T6:** tester sửa vector, chạy lại test. Engine chỉ phải sửa nếu luật đổi.

### Câu hỏi còn mở (thêm)
- *(ios-dev)* Bài còn dưới 6 câu quiz sau khi app bỏ format lạ thì `completed` không bao giờ là true, vì `max` cố định là 6 (T4). Xem câu hỏi mở cuối SK-009 (đề xuất: LessonPlayer chặn bài, hiện "Cập nhật app").
- *(ios-dev)* Tên khoá rules cho XP "ôn lại đạt thành thạo +20" (B4.4), nếu XP vào bản thử.
