# SK-003 · Test vector v1 cho luật chấm B4.4

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: tester · Tester: dev đọc chéo (người sẽ implement engine)
Nguồn: technical-plan.md B4.4, B5.1 (`local_date` theo `timezone`), B5.3 (`lesson_progress`, `activity_days`, `quiz_answers`), B5.5 (`submit_attempts`, `get_warmup_items`), B7.2, B15; syllabus-progression.md mục 7 (khởi động giãn cách), mục 10 (sao 3 mức); SK-001 (tên `format` và trường đáp án)

## Mục tiêu
Tester viết bộ test vector JSON dùng chung cho luật chấm v1, để engine Swift (S1–S2), Kotlin (sau beta) và pgTAP của RPC cùng chạy một bộ input/output và không lệch nhau. B4.4 ghi sprint 1 không bắt đầu được nếu thiếu phần này.

## Phạm vi
Thư mục `packages/content-schema/test-vectors/` (thuộc tester; dev không sửa):

| File | Hàm thuần được kiểm (tên snake_case; Swift/Kotlin dùng camelCase tương ứng) | Số case tối thiểu |
| --- | --- | --- |
| `item-scoring.json` | `score_item(item, tries, rules) → { points, try_results[], final_correct, tries_used }` | 20 |
| `lesson-score.json` | `score_lesson(quiz_results, warmup_results) → { correct, max, completed }` | 6 |
| `stars.json` | `compute_stars(attempts, rules) → { stars, first_pass_date, mastered_date }` | 12 |
| `streak.json` | `compute_streak(studied_dates, today, rules) → { studied_days, chain_start, rest_days[] }` | 14 |
| `local-date.json` | `local_date(completed_at, timezone) → "YYYY-MM-DD"` | 5 |
| `warmup-selection.json` | `select_warmup(history, current_lesson, today, rules) → { items: [{ item_id, from, slot }] }` | 10 |
| `vector.schema.json` | JSON Schema cho định dạng file vector | — |
| `README.md` | Định dạng, cách Swift/Kotlin/pgTAP dùng chung, case nào thuộc nền tảng nào | — |

**Định dạng một file:**
```json
{
  "suite": "stars", "version": 1,
  "source": "technical-plan.md B4.4",
  "function": "compute_stars(attempts, rules) -> {stars, first_pass_date, mastered_date}",
  "default_rules": { "pass_threshold": { "num": 5, "den": 6 }, "mastery_gap_days": 1 },
  "cases": [
    {
      "id": "stars-001",
      "description": "Mô tả tiếng Việt: luật đang kiểm và vì sao ra kết quả này",
      "status": "confirmed | proposed",
      "decision": "SK-003/D3",
      "rules": { "pass_threshold": { "num": 4, "den": 6 } },
      "input": { },
      "expected": { }
    }
  ]
}
```
- `rules` của case chỉ ghi phần khác `default_rules`.
- `status: proposed` cùng `decision` dùng cho case dựa trên quyết định tạm ở dưới, để Duy chốt xong chỉ cần sửa đúng các case đó.
- Ngày là chuỗi `YYYY-MM-DD` theo `local_date`; thời điểm là ISO 8601 có `Z`; tên múi giờ theo IANA.

**`default_rules` dùng chung** (bản sao tham số, sau này nằm ở `content/rules.json`):
`max_tries: 2`, `partial_order_min: null`, `pass_threshold: {num: 5, den: 6}`, `mastery_gap_days: 1`, `rest_days_per_week: 1`, `warmup: { min: 2, max: 3, week: {target: 7, min: 5, max: 10}, month: {target: 30, min: 21, max: 45}, exclude_dok: [3] }`.

**Input của `score_item`:** chỉ gồm trường đáp án theo SK-001: `format`; `options[].key` và `correct`; `answer`, `answers`, `items`. Mỗi lần thử là một phần tử của `tries`:
- `single_choice` và `picture_bar_chart`: `{selected: "fish"}`;
- `multi_choice`: `{selected: ["fish", "egg"]}`;
- `true_false`: `{value: false}`;
- `fill_blank_bank`: `{filled: ["air"]}`;
- `order_sequence`: `{order: ["a", "b", "c"]}`.

Phủ đủ 6 format của v1.

**Nội dung phải có trong từng bộ:**
- `item-scoring`:
  - đúng ngay lần đầu, sai rồi đúng, sai hết số lần thử;
  - `max_tries` bằng 1 và bằng 3;
  - `multi_choice` chọn thiếu, chọn thừa, chọn đúng tập nhưng khác thứ tự (vẫn đúng);
  - `fill_blank_bank` 2 ô, sai 1 ô;
  - `order_sequence` khi `partial_order_min` để `null` và khi bằng 3;
  - số lần thử vượt `max_tries` → `expected: {error: "too_many_tries"}`.
- `lesson-score`: 6/6, 0/6, 5/6 trong đó có câu đúng ở lần thử 2 (không tính điểm), khởi động sai hết nhưng không ảnh hưởng điểm, mới trả lời 5 câu → `completed: false`.
- `stars`:
  - một lần làm có điểm thấp → ⭐;
  - đạt trong ngày → ⭐⭐;
  - đạt lại cùng ngày → vẫn ⭐⭐;
  - đạt lại ngày hôm sau → ⭐⭐⭐;
  - trượt rồi mới đạt;
  - sao không giảm khi lần sau điểm thấp;
  - `mastery_gap_days` bằng 2;
  - **ít nhất 3 case có cùng lịch sử nhưng kết quả khác nhau giữa `pass_threshold` 4/6 (PRD) và 5/6 (đề xuất)**;
  - 2 lần làm cách nhau chưa tới 24 giờ nhưng khác `local_date` → vẫn tính là cách 1 ngày.
- `streak`:
  - học liền nhiều ngày;
  - nghỉ 1 ngày trong tuần;
  - nghỉ 2 ngày trong cùng tuần ISO → đứt chuỗi;
  - nghỉ Chủ nhật rồi nghỉ tiếp thứ Hai (hai tuần ISO khác nhau, mỗi tuần 1 ngày nghỉ) → không đứt;
  - hôm nay chưa học;
  - chỉ học hôm nay;
  - ngày nghỉ ở đầu chuỗi bị bỏ;
  - `rest_days_per_week` bằng 0 và bằng 2;
  - qua tuần 53: 28/12/2026 – 3/1/2027 là tuần 2026-W53, 4/1/2027 là 2027-W01;
  - chưa học ngày nào → `studied_days: 0`, `chain_start: null`.
- `local-date`:
  - `Asia/Ho_Chi_Minh`: `2026-11-02T16:59:59Z` → `2026-11-02`, `2026-11-02T17:00:00Z` → `2026-11-03`;
  - 1 case `Europe/London` ở ngày đổi giờ mùa hè 28/3/2027;
  - 1 case `America/Los_Angeles`;
  - 1 case qua giao thừa.
- `warmup-selection`:
  - chưa có lịch sử, bài có câu `prior_knowledge` → dùng câu soạn sẵn;
  - chưa có lịch sử, bài không có câu soạn sẵn → rỗng;
  - chỉ có bài gần nhất;
  - có bài gần nhất và bài ở cửa sổ tuần;
  - đủ cả 3 khe;
  - biên của cửa sổ: 5, 10, 21, 45 ngày, cùng 4 và 46 ngày;
  - hai bài cách đều target;
  - loại câu DOK 3;
  - ưu tiên câu lần trước làm sai;
  - chỉ có đúng 1 bài trong lịch sử.

## Quyết định tạm để viết được vector (PM đề xuất 28/10, Duy chốt; case liên quan để `status: proposed`)
- **D1 · `max_tries`** là tổng số lần thử, tính cả lần đầu: mặc định 2, tức được thử lại 1 lần. Chỉ được `points: 1` khi lần thử 1 đúng.
- **D2 · `partial_order_min = k`:** `order_sequence` được 1 điểm nếu ở lần thử 1 có ít nhất k phần tử đúng vị trí. `final_correct` vẫn chỉ là true khi khớp hoàn toàn. `null` là tắt.
- **D3 · Ngưỡng đạt** lưu dạng phân số `{num, den}` và so bằng số nguyên: `correct * den >= num * max`. Không dùng số thực, để Swift, Kotlin và SQL không lệch vì làm tròn.
- **D4 · Sao:**
  - ⭐ khi có 1 lần làm `completed`;
  - ⭐⭐ khi có 1 lần đạt; `first_pass_date` là `local_date` của lần đạt đầu tiên;
  - ⭐⭐⭐ khi có một lần đạt khác với `local_date − first_pass_date ≥ mastery_gap_days` (tính theo ngày lịch, không theo 24 giờ);
  - sao không bao giờ giảm.
- **D5 · Chuỗi ngày:**
  - Một ngày được tính là đã học khi có ít nhất 1 bài hoàn thành.
  - Hôm nay chưa học thì không tính là nghỉ và không làm đứt chuỗi.
  - Đi lùi từ hôm qua: gặp ngày không học thì dùng phần ngày nghỉ của tuần ISO chứa ngày đó nếu còn, hết phần thì chuỗi đứt.
  - Phần ngày nghỉ không cộng dồn sang tuần khác.
  - Ngày nghỉ nằm trước ngày học đầu tiên của chuỗi thì bỏ.
  - Output trả `studied_days` (số ngày có học) và `chain_start`. Màn "6 ngày liên tiếp" hiện số nào thì Duy chốt; vector đủ dữ liệu cho cả hai cách.
- **D6 · Khởi động:**
  - Ứng viên là câu `quiz` (không phải `warmup`) của các bài đã hoàn thành, trừ bài đang học; `age` = `today − last_completed_date`.
  - Khe `recent`: bài có `age` nhỏ nhất; nếu bằng nhau, chọn bài có `last_completed_at` muộn hơn.
  - Khe `week`: bài còn lại có `age` trong khoảng [5, 10], gần 7 nhất.
  - Khe `month`: bài còn lại có `age` trong khoảng [21, 45], gần 30 nhất.
  - Nếu hai bài cách đều target thì chọn bài cũ hơn.
  - Thiếu khe thì lấp bằng bài kế tiếp có `age` nhỏ nhất cho đủ `min` (2). Hết bài thì lấy câu thứ 2 của bài `recent`. Vẫn thiếu thì lấy câu `warmup` soạn sẵn có `recall_from: prior_knowledge` của bài đang học. Tối đa `max` (3) câu.
  - Trong một bài, chọn câu không thuộc `exclude_dok`, ưu tiên câu lần trước làm sai, sau đó tới `order` nhỏ nhất.
  - Kết quả rỗng thì không có màn khởi động. Như vậy câu "bài đầu tiên không có khởi động" ở B4.4 vẫn đúng, trừ khi bài có câu nhớ lại soạn sẵn như bài 1 trên canvas.

## Quyết định tạm của tester (28/10, Duy chốt; case liên quan để `status: proposed`)
D1–D6 chưa nói tới các trường hợp dưới đây, nhưng engine nào cũng phải xử lý. Tester chọn cách an toàn nhất để ba nền tảng làm giống nhau.
- **T1 · Thử tiếp sau khi đã đúng** → `{error: "try_after_correct"}`. App không cho thử tiếp sau khi đúng, nên dữ liệu như vậy là hỏng và không được chấm. Case: `item-scoring-028`.
- **T2 · Không có lần thử nào** (`tries` rỗng) → `{error: "no_tries"}`. Câu chưa trả lời không bị chấm là sai. Case: `item-scoring-029`.
- **T3 · Câu trả lời không hợp lệ** → `{error: "invalid_answer"}`, không chấm là sai. Gồm: key không có trong `options` hoặc `bank`; `multi_choice` chọn trùng một lựa chọn; `fill_blank_bank` số ô điền khác số ô trống; `order_sequence` không phải hoán vị của `items`. Case: `item-scoring-030`–`033`.
- **T4 · `completed` của `score_lesson`** là đủ 6 câu quiz có kết quả. Khởi động thiếu, sai hay rỗng không ảnh hưởng. Case: `lesson-score-007`, `008`.
- **T5 · `quiz_results` hỏng** (trùng `item_id` hoặc quá 6 phần tử) → `{error: "invalid_results"}`, để `correct` không bao giờ vượt `max`. Case: `lesson-score-010`, `011`.
- **T6 · Khởi động:**
  - `items` theo đúng thứ tự chọn: `recent` → `week` → `month` → `fill` → `recent_second` → `prior_knowledge`.
  - Mỗi bước dự phòng chỉ lấp tới `min`. Bài đang học có 3 câu `prior_knowledge` mà chưa có lịch sử thì lấy 2.
  - Hết mọi nguồn mà vẫn dưới `min` thì trả số câu đang có, không bỏ màn khởi động.
  - Case: `warmup-selection-003`, `024`, `026`.

## Ngoài phạm vi
- XP, ôn nhanh / siêu sao, thẻ sưu tầm, huy hiệu, thử thách tuần. XP còn chờ B18 #13; canvas lại đang lệch B4.4: Chơi +20 XP trong khi `xp_game_complete` là 10, Thưởng +40 XP với 5/6 câu.
- Mâm cơm cân bằng (`build_tray`), thí nghiệm công bằng: ticket sau, khi block đã chốt ở SK-001.
- `fill_blank_free`, `evidence_choice`, `label_diagram`.
- Code engine, harness Swift/Kotlin, script sinh pgTAP: dev làm ở sprint 1–2. Ticket này chỉ có vector và README.

## Tiêu chí nghiệm thu
- [x] Có đủ 8 file trong bảng Phạm vi, số case không dưới mức tối thiểu, có đủ các tình huống trong "Nội dung phải có trong từng bộ". *(129 case; 51/51 tình huống bắt buộc, `check-vectors.mjs --coverage` in bảng tình huống → case.)*
- [x] Mọi file vector hợp lệ theo `vector.schema.json`. Tester chạy kiểm (ví dụ `npx ajv-cli validate -s vector.schema.json -d "*.json"` hoặc một script node nhỏ trong thư mục này) và dán output thật vào ticket. *(`tools/check-vectors.mjs`, output ở "Kết quả chạy" dưới.)*
- [x] Mỗi case có `id` duy nhất, có tiền tố của bộ (`stars-001`…), có `description` tiếng Việt nêu luật đang kiểm và cách ra `expected`.
- [x] Ngày, thứ trong tuần và tuần ISO trong vector được tính bằng công cụ, không tính nhẩm; ghi lệnh đã dùng vào README. *(`check-vectors` tính lại 61 ngày, 112 thời điểm và 16 chỗ nhắc thứ bằng Node và bằng lệnh `date`; lệnh ở README mục "Thêm hoặc sửa case".)*
- [x] Case nào dựa trên D1–D6 thì để `status: proposed` và có `decision`. Các case còn lại để `confirmed`. *(Kể cả T1–T6 của tester.)*
- [x] README nêu:
  - định dạng file;
  - quy ước tên hàm snake_case ↔ camelCase;
  - Swift: test target đọc file qua đường dẫn tương đối từ `#filePath`, vì SwiftPM không cho resource nằm ngoài package;
  - Kotlin: `sourceSets["test"].resources.srcDir(...)` trỏ vào thư mục này;
  - pgTAP: một script node sinh `database/supabase/tests/vectors_*.test.sql` từ vector, CI kiểm file sinh ra đã cập nhật;
  - bộ nào chạy ở đâu: `item-scoring` chỉ chạy trên app (xem câu hỏi mở); `lesson-score`, `stars`, `streak`, `local-date` chạy cả app và pgTAP; `warmup-selection` chạy ở server và trên app nếu app chọn khi offline.
- [x] Không có file nào ngoài `packages/content-schema/test-vectors/`, không có code sản phẩm. Không commit. *(Ngoài thư mục chỉ sửa ticket này và bảng `docs/backlog/README.md`. `tools/reference-engine.mjs` là oracle của tester, không phải engine.)*

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- Dùng tên `format` và trường đáp án trong bảng "Hợp đồng trường v1" của SK-001. Không cần chờ dev code xong. SK-001 đổi tên trường nào thì dev báo vào đây.
- Chạy song song với SK-001, SK-002, SK-004.

**Quyết định đã ghi:** D1–D6 ở trên, đang là đề xuất của PM. T1–T6 là đề xuất của tester (28/10). Cả hai nhóm chờ Duy chốt.

Tester ghi thêm ngày 28/10 về định dạng file. Các mục này không đổi luật, chỉ thêm vào mẫu "Định dạng một file":
- Thêm trường `platforms` (`app` · `server` · `app_offline`), `context.timezone` (múi giờ dùng để tính sẵn `local_date` trong input), `notes` và `derived`. `derived` ghi thứ, tuần ISO và `age` cho người đọc kiểm; harness bỏ qua.
- `decision` nhận một mã hoặc một mảng mã, vì có case dựa trên hai quyết định (ví dụ D6 và T6).
- Ngoại lệ của luật "`rules` của case chỉ ghi phần khác `default_rules`": case nào kết quả đổi giữa 4/6 và 5/6 thì ghim `pass_threshold`, kể cả khi bằng 5/6 mặc định. Như vậy khi Duy chốt 4/6 và sửa `default_rules`, các case đó không âm thầm đổi nghĩa. `run-reference.mjs` chặn case phụ thuộc ngưỡng mà chưa ghim.
- Lỗi trả `{error: <mã>}`. Mã có trong v1: `too_many_tries`, `try_after_correct`, `no_tries`, `invalid_answer`, `invalid_results`.
- `$id` của `vector.schema.json` theo quy ước `.example` của SK-001 (quyết định 16).

**Câu hỏi còn mở** (cho Duy)
- Thiếu nội dung ở server trong MVP: bảng `cms_*` đã lùi sang GĐ 2 (B8.0), nên server không có đáp án hay `dok` của câu.
  - Server không chấm lại được câu trả lời mà phải tin cờ `correct` app gửi lên.
  - `get_warmup_items` không biết câu nào là DOK 3.
  - Đề xuất: app gửi kèm `dok` trong `quiz_answers`, hoặc chép bảng `item_id → lesson_id, dok, order` vào `app_config` lúc publish.
- D5: "6 ngày liên tiếp" đếm số ngày có học, hay đếm cả ngày nghỉ được tha?
- D6: bài đầu tiên có khởi động bằng câu nhớ lại soạn sẵn (theo canvas) hay không có khởi động (theo B4.4)?
- PRD còn ghi ngưỡng 4/6, đề xuất là 5/6. `default_rules` tạm để 5/6; case 4/6 đặt `rules` riêng.
- *(tester)* T6: bài đang học có 3 câu `prior_knowledge` mà chưa có lịch sử thì lấy 2 câu (đủ `min`) hay cả 3 (tới `max`)? Xem `warmup-selection-003`.
- *(tester)* T6: chỉ có 1 câu khởi động thì hiện màn khởi động 1 câu hay bỏ màn? Xem `warmup-selection-026`.
- *(tester)* D6: câu khởi động soạn sẵn có `recall_from: {kind: "lesson"}` (SK-001) được chọn khi nào? Theo D6 hiện nay, câu đó không bao giờ được chọn. Xem `warmup-selection-004`.
- *(tester)* Một input có hai lỗi (ví dụ quá `max_tries` và có key lạ) thì trả mã nào? Thứ tự ưu tiên chưa chốt, nên vector chưa có case trộn hai lỗi.
- *(tester, cho dev)* Phần tử của `stars.attempts` dùng `correct` và `max` theo output của `score_lesson`, khác tên cột `lesson_attempts.score` và `max_score` ở B5.3. Bảng map nằm trong README. Nếu dev muốn dùng tên cột thì báo vào đây, tester đổi vector.
- *(tester, cho dev)* Hình dạng một lần thử (`{selected}`, `{value}`, `{filled}`, `{order}`) đề xuất dùng luôn cho `quiz_answers.answer` ở B5.3, để server lưu đúng thứ mà engine chấm.

## Ghi chú của tester (28/10)

**File** (mọi file nằm trong `packages/content-schema/test-vectors/`)
- 6 file vector: `item-scoring.json` (33 case), `lesson-score.json` (11), `stars.json` (27), `streak.json` (18), `local-date.json` (13), `warmup-selection.json` (27). Tổng 129 case: 51 `confirmed`, 78 `proposed`.
- `vector.schema.json` và `README.md`.
- `tools/`: `check-vectors.mjs` (kiểm hình dạng và nhất quán), `run-reference.mjs` và `reference-engine.mjs` (bản cài tham chiếu, không phải engine sản phẩm), `mini-json-schema.mjs`, `calendar.mjs`, `dates.mjs` (CLI tính ngày).
- Không sửa file nào ngoài thư mục này, trừ ticket này và bảng `docs/backlog/README.md`.

**Kết quả chạy** (Node v24.18.0, từ `packages/content-schema`, sau `rm -rf node_modules && npm install`)
```
$ node test-vectors/tools/check-vectors.mjs
check-vectors (SK-003)
  Đủ 8 file của bảng Phạm vi                 8/8
  Đúng vector.schema.json                    6/6 file (mini-json-schema và Ajv 2020 cùng kết luận)
  Số case ≥ tối thiểu                        item-scoring 33/20 · lesson-score 11/6 · stars 27/12 · streak 18/14 · local-date 13/5 · warmup-selection 27/10
  default_rules giống nhau ở mọi file        có
  id duy nhất, đúng tiền tố, tăng dần        129 id
  decision có trong ticket                   12 mã: D1, D2, D3, D4, D5, D6, T1, T2, T3, T4, T5, T6
  Thứ và tuần ISO (derived.calendar)         61 ngày
  local_date (stars, warmup, local-date)     112 thời điểm
  Thứ nhắc trong mô tả                       16 chỗ
  Đối chiếu với lệnh date của hệ điều hành   173 lần gọi date (BSD)
  item-scoring dùng tên trường SK-001        240 trường; 6/6 format; 33 item hợp lệ theo quiz-item.schema.json
  expected tự nhất quán                      129 case
  Tình huống bắt buộc của ticket             51/51; cặp 4/6↔5/6: 4 (stars-020/stars-021, stars-021/stars-026, stars-022/stars-023, stars-024/stars-025)

OK: 6 file vector, 129 case, không có lỗi hình dạng hay nhất quán          (exit 0)

$ node test-vectors/tools/run-reference.mjs
item-scoring       33/33 khớp
lesson-score       11/11 khớp
stars              27/27 khớp
streak             18/18 khớp
local-date         13/13 khớp
warmup-selection   27/27 khớp

OK: 129/129 case khớp bản cài tham chiếu
OK: 120 case không ghim pass_threshold đều cho cùng kết quả ở 4/6 và 5/6     (exit 0)
```
- Không có `node_modules`, chạy với `--no-os-date`: `check-vectors` vẫn exit 0, bỏ hai bước Ajv và bước `date`, và báo rõ là đã bỏ. Hai lệnh cũng chạy được trên Node 20.19, vì không cần type stripping.
- **Kiểm chính công cụ kiểm:** 29 đột biến trên một bản sao thư mục, ví dụ thứ sai trong `derived`, `local_date` lệch, đổi tên `answers` → `answer`, `single_choice` có 2 đáp án đúng, mô tả tiếng Anh, `rules` bằng mặc định, `studied_days` sai, slot đảo thứ tự, chọn câu DOK 3, xoá case qua tuần 53, bỏ cặp 4/6↔5/6, ngày 30/2, thiếu README. Kết quả: **29/29 bị bắt**, bản gốc exit 0. Bỏ ghim `pass_threshold` ở `stars-021` thì `run-reference` báo `GHIM stars-021` và exit 1.

**Đề xuất cho dev** (ngoài vùng của tester): thêm `"vectors": "node test-vectors/tools/check-vectors.mjs && node test-vectors/tools/run-reference.mjs"` vào `packages/content-schema/package.json` và chạy trong CI của `packages/*`.

**Còn chưa chắc**
- Bản cài tham chiếu và vector do cùng một người viết. Engine Swift là lần kiểm độc lập đầu tiên; dev đọc chéo, thấy case nào ngờ thì ghi vào đây.
- Lệnh `date` chỉ mới chạy với BSD date trên macOS. Script có nhánh GNU date cho CI Linux nhưng chưa chạy thử nhánh đó.

## Đề xuất vector từ SK-010 (28/10)

Chép từ SK-010 mục "Gửi tester" (ios-dev chỉ được sửa SK-009, SK-010 nên nhờ điều phối chép sang). Đợt này **chỉ ghi chữ**: chưa thêm case vào `item-scoring.json`, `lesson-score.json`, `stars.json`, vì ios-dev đang chạy toàn bộ test iOS và case mới làm test đỏ ngoài ý muốn. Thêm case làm ở đợt sau, khi ios-dev báo xong SK-008. Cột "iOS trả" lấy từ SK-010 (quyết định 7–9, 11) và đối chiếu với `apps/ios/Packages/SKKit/Sources/LessonEngine/`; cột "Bản tham chiếu" là `tools/reference-engine.mjs` hiện tại, để biết thêm case thì phía nào phải sửa.

| # | Đề xuất vector | File sẽ nhận | iOS đang trả | Ý kiến của tester |
| --- | --- | --- | --- | --- |
| 1 | Lần thử có hình dạng của format khác (ví dụ `{value}` cho `single_choice`, `{selected: "x"}` cho `multi_choice`). | `item-scoring.json`, mở rộng T3, khoảng 2–3 case | `{error: "invalid_answer"}`. Bản tham chiếu đã trả như vậy. | **Đồng ý.** Cùng tinh thần T3: dữ liệu hỏng không được chấm là sai. Chỉ thêm case, không phải sửa bản tham chiếu. |
| 2 | `multi_choice` chọn rỗng `{selected: []}`: chấm sai hay `invalid_answer`? | `item-scoring.json`, 1 case | Hợp lệ và chấm sai: `points: 0`, `try_results: [false]`. Bản tham chiếu cũng ra kết quả này. | **Đồng ý, nên chốt chung với T3.** Chọn rỗng là câu trả lời có thật (bé bấm Kiểm tra khi chưa chọn gì); UI nên khoá nút Kiểm tra, nhưng engine không được coi là dữ liệu hỏng. Ghi thành case `proposed` (T3 mở rộng). |
| 3 | `fill_blank_bank` điền cùng một từ vào hai ô: hợp lệ không? | `item-scoring.json`, 1–2 case (đáp án khác nhau và đáp án trùng) | Hợp lệ, so theo vị trí. Bản tham chiếu cũng so theo vị trí. | **Đồng ý.** Engine chỉ so vị trí; luật "mỗi từ trong kho dùng một lần" nếu có là việc của UI, không thuộc luật chấm. Hỏi content-editor xem `answers` của một câu có được trùng key không (SK-001 hiện không cấm), để case dùng đúng dữ liệu hợp lệ. |
| 4 | `lesson-score` có `points` = 2 hoặc âm → `invalid_results`? | `lesson-score.json`, mở rộng T5, 2 case (2 và -1) | `{error: "invalid_results"}`. **Bản tham chiếu chưa có guard này**: cộng thẳng `points`, nên `correct` có thể vượt `max`. | **Đồng ý.** Cùng lý do với T5: `correct` không bao giờ được vượt `max`. Khi thêm case, tester sửa `reference-engine.mjs` trước; schema vector đã chỉ cho `points` là 0 hoặc 1 nên cần nới `vector.schema.json` cho riêng case lỗi này. |
| 5 | `stars` có hai lần làm trùng `completed_at`; `max` = 0; `correct > max`. | `stars.json` | (a) Trùng `completed_at`: sắp theo `attempt_id` tăng dần (so chuỗi). (b) `max` = 0 và (c) `correct > max`: không có xử lý riêng, `correct * den >= num * max` nên cả hai đều **đạt** (⭐⭐). Bản tham chiếu: (a) giữ thứ tự mảng, (b), (c) giống iOS. | (a) **Đồng ý**, nhưng case chỉ kiểm được rằng kết quả không phụ thuộc cách phá hoà, vì hai lần cùng thời điểm có cùng `local_date`. (b) **Cần Duy chốt:** lần làm 0/0 hay 7/6 được ⭐⭐ là sai rõ ràng. Đề xuất: lần làm có `max` ≠ 6 (hay `correct > max`, `max` < 1) là hỏng, RPC từ chối (ràng buộc ở DB, B5), `compute_stars` không cần xử lý; vector chỉ ghi nhận hành vi đầu vào hợp lệ. Nếu Duy muốn engine tự bỏ qua lần hỏng thì thêm case "lần hỏng không được tính". (c) cùng quyết định với (b). |
| 6 | XP khi B18 #13 chốt: thêm `xp_*` vào `default_rules`, kèm case 90 và 80 như unit test của ios-dev. | Bộ mới (đề xuất `xp.json`, hàm `compute_xp`), vì kết quả của `lesson-score` không có XP; `default_rules` ở cả 7 file phải thêm `xp_per_correct`, `xp_game_complete`, `xp_lesson_complete` | `computeXP` = 60 + 10 + 20 = **90** cho 6/6 và xong mâm; câu đúng ở lần 2 không cộng: **80** (6 câu, một câu đúng lần 2: 50 + 10 + 20). Tạm theo B4.4, chưa có vector. | **Cần Duy chốt B18 #13** (giữ XP hay ẩn, SK-012 cũng hỏi) và giá trị các tham số. Chưa nên thêm gì đến khi chốt, vì thêm khoá vào `default_rules` buộc sửa cả 7 file và làm test iOS đọc `default_rules` phải cập nhật `Rules`. Khi chốt: bộ mới chạy ở app và server, gồm case 90 / 80 / 0 (bài chưa xong) / khởi động không có XP. |
| 7 | Thứ tự ưu tiên khi một input có hai lỗi (câu hỏi mở của SK-003). | `item-scoring.json`, 2–4 case "hai lỗi" | `no_tries` → `too_many_tries` → `invalid_answer` (kiểm cả chuỗi `tries`) → `try_after_correct`. Bản tham chiếu kiểm theo từng lần thử (`invalid_answer` rồi `try_after_correct` ở từng lần), nên với input như `[đúng, đúng, key lạ]` (max_tries 3) tham chiếu ra `try_after_correct`, iOS ra `invalid_answer`. | **Cần Duy chốt (nhẹ).** Tester đồng ý thứ tự của iOS (dữ liệu hỏng nặng hơn lần thử thừa) và sẽ sửa bản tham chiếu theo. Cần chốt thật vì SQL (nếu sau này chấm lại ở server) và Kotlin phải làm giống. Case "hai lỗi" chỉ thêm sau khi Duy chốt, để không khoá một thứ tự chưa ai đồng ý. |

**Tóm lại cho Duy:** 1, 2, 3, 4 và (a) của 5 là chi tiết kỹ thuật, tester đề nghị đồng ý và thêm case ở đợt sau (đánh dấu `proposed`, T3 hoặc T5 mở rộng). Cần Duy quyết: (b)(c) của 5 (lần làm hỏng được xử lý ra sao), 6 (XP) và 7 (ưu tiên khi hai lỗi). Việc đợt sau, khi ios-dev xong SK-008: thêm case cho 1–5(a), sửa `reference-engine.mjs` cho 4 và 7, nới `vector.schema.json` cho `points` ngoài 0–1 ở case lỗi, chạy lại `check-vectors` và `run-reference`.
