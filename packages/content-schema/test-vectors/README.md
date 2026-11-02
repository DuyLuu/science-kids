# Test vector luật chấm v1 (SK-003)

Bộ input và output mong đợi dùng chung cho mọi bản cài luật chấm ở B4.4: engine Swift (sprint 1–2), engine Kotlin (sau beta) và hàm SQL mà pgTAP kiểm. Ba nơi cùng chạy một bộ file nên không lệch nhau.

Thư mục này thuộc tester. Dev đọc, không sửa: thấy case sai thì ghi vào ticket SK-003. Luật gốc nằm ở `technical-plan.md` B4.4, B5.1, B5.5 và các quyết định D1–D6 (PM), T1–T6 (tester) trong `docs/backlog/SK-003-scoring-test-vectors-v1.md`.

## File

| File | Hàm (vector, SQL) | Swift / Kotlin | Case | Chạy ở |
| --- | --- | --- | --- | --- |
| `item-scoring.json` | `score_item(item, tries, rules)` | `scoreItem` | 33 | app |
| `lesson-score.json` | `score_lesson(quiz_results, warmup_results)` | `scoreLesson` | 11 | app, server |
| `stars.json` | `compute_stars(attempts, rules)` | `computeStars` | 27 | app, server |
| `streak.json` | `compute_streak(studied_dates, today, rules)` | `computeStreak` | 18 | app, server |
| `local-date.json` | `local_date(completed_at, timezone)` | `localDate` | 13 | app, server |
| `warmup-selection.json` | `select_warmup(history, current_lesson, today, rules)` | `selectWarmup` | 27 | server, app khi offline |
| `build-tray.json` | `build_tray(block, tray, taps)` (SK-012, không nhận `rules`) | `buildTray` | 39 | app |
| `vector.schema.json` | JSON Schema 2020-12 cho định dạng file | | | |
| `tools/` | Công cụ của tester, không phải code sản phẩm (xem dưới) | | | |

**Bộ nào chạy ở đâu** (trường `platforms` của từng file ghi đúng như vậy):
- `item-scoring` chỉ chạy trên app. MVP chưa có bảng `cms_*` ở server (B8.0), nên server không có đáp án để chấm lại và phải tin cờ `correct` app gửi lên. Câu hỏi này còn mở ở SK-003.
- `lesson-score`, `stars`, `streak`, `local-date` chạy cả hai nơi. App tính tạm để hiện thưởng ngay, server chốt trong `submit_attempts`.
- `build-tray` chỉ chạy trên app (mini-game, không có luật ở server). Luật gốc ở `docs/backlog/SK-012-ios-lesson-player.md` mục "Vector mâm cơm" (T1–T4, T1–T3 đã chốt 29/10); khác các bộ kia, bộ này không dùng `rules` (`default_rules` vẫn phải có cho đủ hình dạng file).
- `warmup-selection` chạy ở server (`get_warmup_items`). App chỉ chạy bộ này nếu app tự chọn câu khởi động khi offline (`app_offline`).

## Chạy kiểm

Từ `packages/content-schema`. Cả hai lệnh không cần `npm install`; khi đã cài thì `check-vectors` chạy thêm Ajv.

```sh
node test-vectors/tools/check-vectors.mjs   # hình dạng và nhất quán của vector
node test-vectors/tools/run-reference.mjs   # chạy mọi case qua bản cài tham chiếu
```

`check-vectors.mjs` (exit 0 sạch, 1 có lỗi, 2 sai cách gọi; `--coverage` in bảng tình huống → case):
- đủ 9 file của bảng Phạm vi (7 bộ vector, `vector.schema.json`, README);
- mỗi file đúng `vector.schema.json`, kiểm bằng `mini-json-schema.mjs` và Ajv 2020, hai bên phải cùng kết luận;
- `suite` trùng tên file; `function` đúng tên hàm; `platforms` đúng bảng trên; số case không dưới mức tối thiểu; `default_rules` giống hệt nhau ở mọi file;
- `id` duy nhất, đúng tiền tố, tăng dần; mô tả tiếng Việt có dấu, đủ dài; `decision` có trong ticket; `rules` của case chỉ ghi phần khác mặc định;
- ngày có thật; `derived.calendar` (thứ, tuần ISO), `derived.ages` và mọi `local_date` được tính lại bằng Node **và** bằng lệnh `date` của hệ điều hành; thứ nhắc trong mô tả ("thứ Hai 02/11") đúng lịch;
- item của `item-scoring` chỉ dùng tên trường có trong `schema/quiz-item.schema.json` (SK-001). Khi có Ajv, item được điền chữ giữ chỗ cho phần không phải đáp án rồi validate như một câu SK-001 thật. Item phải hợp lệ; chỉ `tries` mới được sai;
- `expected` tự nhất quán, ví dụ `tries_used` bằng số lần thử, sao ⭐⭐⭐ thì có `mastered_date`, ngày nghỉ không phải ngày học, slot khởi động đúng thứ tự;
- đủ mọi tình huống ở mục "Nội dung phải có trong từng bộ" của ticket, kể cả ≥ 3 cặp `stars` cùng lịch sử nhưng khác kết quả giữa 4/6 và 5/6.

`run-reference.mjs` chạy `tools/reference-engine.mjs` qua mọi case. Đây là bản cài tham chiếu viết theo luật trong ticket, để tester thử vector, không phải engine sản phẩm. Nếu nó lệch vector thì một trong hai sai: sửa theo luật, không sửa vector cho khớp code. Lệnh này cũng chặn case có kết quả đổi giữa 4/6 và 5/6 mà chưa ghim `rules.pass_threshold`.

## Định dạng file

```jsonc
{
  "$schema": "./vector.schema.json",
  "suite": "stars",                       // trùng tên file
  "version": 1,
  "source": "technical-plan.md B4.4 …",   // luật lấy từ đâu
  "function": "compute_stars(attempts, rules) -> {stars, first_pass_date, mastered_date}",
  "platforms": ["app", "server"],         // app · server · app_offline
  "context": { "timezone": "Asia/Ho_Chi_Minh" },  // chỉ để kiểm vector, không truyền vào hàm
  "notes": ["…"],                         // giải thích input/output của bộ
  "default_rules": { … },                 // bản sao content/rules.json, giống nhau ở mọi file
  "cases": [
    {
      "id": "stars-020",
      "description": "Luật đang kiểm và vì sao ra expected (tiếng Việt)",
      "status": "proposed",               // confirmed | proposed
      "decision": "SK-003/D3",            // bắt buộc khi proposed, cấm khi confirmed; chuỗi hoặc mảng
      "rules": { "pass_threshold": { "num": 4, "den": 6 } },
      "input": { … },
      "expected": { … },
      "derived": { "calendar": { "2026-11-02": "Mon 2026-W45" }, "ages": { "l01": 1 } }
    }
  ]
}
```

**Harness chạy một case:**
1. `rules = default_rules` gộp nông với `case.rules`, giống `jsonb ||` của Postgres. Ghi `warmup` thì phải ghi đủ cả object `warmup`.
2. Gọi hàm với các trường của `input` theo đúng thứ tự trong `function`, cộng `rules` nếu hàm nhận `rules`.
3. So kết quả với `expected` bằng so sánh sâu chính xác: object đúng tập khoá, không thừa không thiếu; mảng theo đúng thứ tự (`try_results`, `rest_days` tăng dần, `items` của khởi động theo thứ tự chọn); `null` khác với không có khoá. Lỗi trả `{ "error": "<mã>" }`, không ném exception. `local-date` trả chuỗi `"YYYY-MM-DD"`, không bọc object.
4. Bỏ qua `description`, `status`, `decision`, `derived`, `notes`, `context`, `source`. Case `proposed` vẫn chạy như case khác; nhãn này chỉ đánh dấu case cần xem lại khi Duy chốt.

**`build-tray`:** harness gọi `build_tray(input.block, input.tray, input.taps)`, không truyền `rules`. `block` chỉ có `capacity`, `groups[].key/role`, `items[].key/group`; `message` là khoá lời nhắn (`start`, `full`, `balanced`, `has_limited`, `missing.<nhóm>`), không phải chữ. Lỗi là `{ "error": "unknown_item" | "invalid_tray" }`. Mâm là mảng key món theo thứ tự đặt, so sánh đúng thứ tự. Thứ tự ưu tiên lời nhắn (Duy chốt 29/10): `balanced` (khi `success`, kể cả khi cờ `full` đang bật; cờ `full` vẫn true) > `full` > `has_limited` > `start` > `missing.<nhóm đầu theo thứ tự groups của block>`; `full` chỉ bật khi chạm thêm món lúc mâm đã đủ `capacity`. Thứ tự xét `missing` lấy từ `groups`, không khoá theo canvas: các case có block tự đặt (key không tiền tố `tray_`) bắt lỗi khoá cứng. T1–T3 đã chốt nên case của chúng là `confirmed`; chỉ T4 (dữ liệu hỏng) còn là quyết định tạm `SK-012/T4`, ghi ở mục "Vector mâm cơm" của SK-012.

**Quy ước:**
- Ngày là `YYYY-MM-DD` theo `local_date`. Thời điểm là ISO 8601 có `Z`, có thể có phần lẻ giây (`local-date-012`). Múi giờ là tên IANA.
- Ngưỡng là phân số `{num, den}`, so bằng số nguyên `correct * den >= num * max` (D3).
- Case nào kết quả phụ thuộc ngưỡng 4/6 hay 5/6 thì ghim `rules.pass_threshold`, kể cả khi bằng mặc định. Đây là ngoại lệ duy nhất của luật "rules chỉ ghi phần khác `default_rules`": khi Duy đổi mặc định, các case này giữ nguyên nghĩa.
- Mỗi case lỗi chỉ có đúng một lỗi. Thứ tự ưu tiên giữa các mã lỗi chưa chốt, nên engine không cần khớp khi một input có hai lỗi.

**Tên hàm và tên trường.** Tên hàm trong vector và trong SQL là `snake_case`; Swift và Kotlin dùng camelCase như bảng trên. Tên trường trong JSON giữ `snake_case`. Swift map bằng `CodingKeys` hoặc `keyDecodingStrategy = .convertFromSnakeCase`; Kotlin map bằng `@SerialName`. Mã lỗi và giá trị `slot` là chuỗi, so nguyên văn.

**Trường của vector lấy từ đâu:**

| Vector | Nguồn |
| --- | --- |
| `item-scoring` `input.item` | Phần đáp án của `QuizItem` (SK-001 "Hợp đồng trường v1"): `format`; `options[].key`, `options[].correct`; `answer`; `bank[].key`, `answers`; `items[].key`. Bỏ mọi chữ hiển thị |
| `item-scoring` `input.tries[i]` | Một lần bé trả lời: `{selected: key}` · `{selected: [key]}` · `{value: bool}` · `{filled: [key]}` · `{order: [key]}`. Đề xuất `quiz_answers.answer` (B5.3) lưu đúng hình dạng này |
| `lesson-score` `quiz_results[]`, `warmup_results[]` | `item_id` (= `QuizItem.id`) cùng `points`, `final_correct` lấy từ output của `score_item` |
| `stars` `attempts[]` | `attempt_id` = `lesson_attempts.id`; `completed` = `completed_at` khác null; `correct` = `lesson_attempts.score`; `max` = `max_score`; `local_date` = `local_date(completed_at, child_profiles.timezone)` |
| `stars` output | `stars` = `lesson_progress.stars`; `first_pass_date`, `mastered_date` là `local_date` của `first_pass_at`, `mastered_at` |
| `streak` `studied_dates` | `activity_days.local_date` có `lessons_completed ≥ 1`; `today` = `local_date(now(), timezone)`; output `rest_days` ứng với `activity_days.is_rest_day` |
| `warmup-selection` `history[]` | Bài đã hoàn thành: `lesson_id`, `last_completed_at` (`lesson_progress`), `last_completed_date` = `local_date` của nó. `items[]`: `item_id` (`quiz_answers.item_id`), `slot` (`quiz_answers.slot`), `order` (vị trí 1-based trong `lesson.quiz` hoặc `lesson.warmup`; SK-001 không có trường `order`), `dok` (`QuizItem.dok`), `last_correct` (`quiz_answers.correct` của lần làm gần nhất) |
| `warmup-selection` `current_lesson.warmup[]` | `lesson.warmup[]` của SK-001: `item_id` = `id`, `order` = vị trí, `recall_from` bỏ `note` |

## Dùng chung trên từng nền tảng

**Swift.** Test target đọc file bằng đường dẫn tính từ `#filePath`. SwiftPM không cho khai báo resource nằm ngoài thư mục package, nên không chép vector vào bundle. Để không phải đếm `../`, đi ngược lên tới khi gặp thư mục:

```swift
import Foundation

enum TestVectors {
    static let directory: URL = {
        var dir = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
        while dir.path != "/" {
            let candidate = dir.appendingPathComponent("packages/content-schema/test-vectors")
            if FileManager.default.fileExists(atPath: candidate.appendingPathComponent("vector.schema.json").path) {
                return candidate
            }
            dir.deleteLastPathComponent()
        }
        fatalError("Không thấy packages/content-schema/test-vectors từ \(#filePath)")
    }()

    static func data(_ suite: String) throws -> Data {
        try Data(contentsOf: directory.appendingPathComponent("\(suite).json"))
    }
}
```

Mỗi bộ là một test, lặp mọi case. Khi lệch thì báo `id` của case, ví dụ `XCTFail("\(c.id): …")`. `local_date` dùng `TimeZone(identifier:)` và `Calendar`, không cộng offset cố định. Chuỗi có phần lẻ giây cần `ISO8601DateFormatter` có `.withFractionalSeconds`.

**Kotlin.** Module engine (JVM thuần, không phụ thuộc Android) trỏ resource test vào thư mục này:

```kotlin
// apps/android/core-engine/build.gradle.kts
sourceSets["test"].resources.srcDir(rootProject.file("../../packages/content-schema/test-vectors"))
```

Test đọc bằng `javaClass.classLoader.getResource("stars.json")`. Gradle theo dõi thư mục này như input, nên sửa vector thì test chạy lại. `local_date` dùng `java.time.ZoneId`.

**pgTAP.** Dev viết một script node sinh `database/supabase/tests/vectors_<suite>.test.sql` từ vector, cho các bộ có `server` trong `platforms`. Đề xuất cách sinh:
- Luật viết thành hàm SQL thuần nhận và trả `jsonb`, ví dụ `compute_stars(p_attempts jsonb, p_rules jsonb)`. RPC `submit_attempts`, `get_warmup_items` gọi lại các hàm này. pgTAP kiểm thẳng hàm thuần bằng vector, còn RPC kiểm bằng test riêng.
- Mỗi case là một dòng `SELECT is(<hàm>(…), '<expected>'::jsonb, '<id>');`, với `rules` là `'<default_rules>'::jsonb || '<case.rules>'::jsonb`. So `jsonb` bằng `=` khớp đúng quy ước trên: khoá không theo thứ tự, mảng theo thứ tự.
- `local_date` trong SQL là `(p_completed_at AT TIME ZONE p_timezone)::date`.
- CI chạy lại script rồi `git diff --exit-code database/supabase/tests/vectors_*.test.sql`. File sinh ra khác bản đã commit thì CI đỏ.

## Thêm hoặc sửa case

1. Chọn bộ, lấy số kế tiếp sau số lớn nhất. Không đánh số lại và không dùng lại `id` đã xoá, vì log của harness và ticket nhắc case theo `id`.
2. Viết `description` tiếng Việt: luật đang kiểm và vì sao ra `expected`. Có thể nhắc case khác (`xem stars-017`); `check-vectors` kiểm case được nhắc có thật.
3. `status: confirmed` khi kết quả suy thẳng ra từ B4.4 hay B5.1. Khi dựa trên quyết định tạm thì dùng `proposed` và ghi `decision`. Quyết định tạm mới thì thêm `T7…` vào mục "Quyết định đã ghi" của SK-003 (bộ `build-tray`: mục "Vector mâm cơm" của SK-012, mã `SK-012/T5…`) và vào `KNOWN_DECISIONS` trong `tools/check-vectors.mjs`.
4. `rules` chỉ ghi khoá khác mặc định. Ghi `warmup` thì ghi đủ cả object. Kết quả phụ thuộc ngưỡng thì ghim `pass_threshold`.
5. Ngày tính bằng công cụ, không tính nhẩm. Đây là các lệnh đã dùng để viết và kiểm bộ này:
   ```sh
   node test-vectors/tools/dates.mjs 2026-12-28 2027-01-03 2027-01-04         # thứ + tuần ISO, Node và date cạnh nhau
   node test-vectors/tools/dates.mjs 2026-12-01 -45                            # cộng/trừ ngày
   node test-vectors/tools/dates.mjs age 2026-10-17 2026-12-01                 # age cho khởi động
   node test-vectors/tools/dates.mjs 2027-03-28T23:00:00Z Europe/London        # local_date
   LC_ALL=C date -j -f %Y-%m-%d 2027-01-03 "+%a %G-W%V"                        # macOS (BSD date)
   LC_ALL=C date -d 2027-01-03 "+%a %G-W%V"                                    # Linux (GNU date)
   TZ=Europe/London date -r "$(node -p 'Date.parse("2027-03-28T23:00:00Z")/1000')" +%F    # macOS
   TZ=Europe/London date -d "@$(node -p 'Date.parse("2027-03-28T23:00:00Z")/1000')" +%F   # Linux
   ```
   Ghi thứ và tuần ISO của các ngày quan trọng vào `derived.calendar`; với khởi động thì ghi `derived.ages`. `check-vectors` tính lại toàn bộ bằng Node và bằng `date`, nên chép sai vẫn bị bắt.
6. Chạy cả hai lệnh ở mục "Chạy kiểm". Cả hai phải exit 0.

**Khi Duy chốt một quyết định** (tìm case theo mã: `grep -n '"SK-003/D5"' test-vectors/*.json`):
- Duy đồng ý với đề xuất: đổi các case đó sang `confirmed` và xoá `decision`.
- Duy chọn khác: sửa `expected` và `description`, giữ nguyên `id`, sửa `reference-engine.mjs` theo luật mới, rồi chạy lại hai lệnh.
- Đổi mặc định (ví dụ chốt 4/6): sửa `default_rules` ở cả 7 file (`check-vectors` bắt file nào lệch). Các case đã ghim `pass_threshold` giữ nguyên nghĩa.

## Công cụ (`tools/`)

| File | Việc |
| --- | --- |
| `check-vectors.mjs` | Kiểm hình dạng và nhất quán (mục "Chạy kiểm") |
| `run-reference.mjs` | Chạy bản cài tham chiếu qua mọi case, kiểm việc ghim ngưỡng |
| `reference-engine.mjs` | Bản cài tham chiếu (oracle) của luật v1, chỉ dùng cho tester |
| `mini-json-schema.mjs` | Validator JSON Schema rút gọn, chạy không cần `npm install`; gặp từ khoá lạ thì báo lỗi chứ không bỏ qua |
| `calendar.mjs` | Ngày lịch, thứ, tuần ISO, `local_date` qua `Intl` |
| `dates.mjs` | CLI tính ngày cho người viết vector |

Đề xuất cho dev (ngoài thư mục này): thêm `"vectors": "node test-vectors/tools/check-vectors.mjs && node test-vectors/tools/run-reference.mjs"` vào `package.json` và chạy trong CI của `packages/*`.
