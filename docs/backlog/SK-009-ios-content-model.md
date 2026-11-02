# SK-009 · ContentModel iOS: Codable theo content schema v1

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: ios-dev · Tester: tester
Nguồn: docs/ios-test-build.md mốc 1 việc I5; technical-plan.md B3 (model viết tay, kiểm bằng decode fixtures), B4.1–B4.3 (cây nội dung, registry, bỏ qua `type` lạ); SK-001 mục "Hợp đồng trường v1" và quyết định 9–18; `packages/content-schema/schema/*.schema.json`, `README.md`

## Mục tiêu
ios-dev viết model `Codable` khớp schema v1 để app đọc được topic và bài 1. Block `type` hay quiz `format` mà app chưa biết thì bỏ qua, không crash (B4.2).

## Phạm vi
- Module `ContentModel` trong SKKit, Swift thuần (Foundation), mọi kiểu `Sendable`, `Equatable`.
- Kiểu dùng chung: `Spoken` (`en`, `vi`, `audio?` gồm `en?`, `vi?`), `Text`, `Image` (`alt`, `brief?`, `asset?`), `AssetHash`, `Uuid` (dạng `UUID`), `Key`, `ColorToken`.
- `Topic`, `Misconception`, `Lesson`, `VocabTerm`, `Collectible`, `RecallFrom`.
- **Block:** `enum LearnBlock` và `PlayBlock`, mỗi case một kiểu: `explore_groups`, `sentence_card`, `word_list`, `build_tray`. Thêm case `.unknown(type: String, id: UUID?)` cho `type` lạ.
- **QuizItem:** trường chung cộng `enum Answer` theo `format`, đủ 6 format v1 (`single_choice`, `multi_choice`, `true_false`, `fill_blank_bank`, `order_sequence`, `picture_bar_chart`) và `.unknown(format)`. Có đủ 6 format để engine (SK-010) chạy được mọi vector, dù UI chỉ có 4 dạng.
- **Bỏ qua thứ lạ:** block hay câu `.unknown` bị lọc khỏi danh sách mà LessonPlayer nhận, và ghi log (`os.Logger`, category `content`). Bài vẫn mở được. Trường thiếu hay sai kiểu ở phần bắt buộc thì decode lỗi, kèm đường dẫn trường, không crash.
- **`build_tray.messages.missing`:** `JSONDecoder` không giữ thứ tự key của object. Thứ tự xét lời nhắc lấy theo thứ tự `groups` (quyết định 1).
- Helper cho `fill_blank_bank`: tách `sentence.en` (và `vi` nếu có ô) thành đoạn chữ và ô `{n}`.
- Test đọc fixture thẳng từ `packages/content-schema/fixtures/` qua đường dẫn tương đối từ `#filePath`; không chép fixture vào `apps/ios`.

## Ngoài phạm vi
- Đọc gói, kiểm sha256 (`ContentKit`): SK-016.
- Chấm điểm: SK-010. Hiển thị: SK-012.
- Validate đủ luật của schema (pattern, biên số phần tử): việc của `validate` ở CLI. App chỉ cần decode đúng và không crash.

## Tiêu chí nghiệm thu
- [ ] `ContentModelTests` decode **mọi** file trong `packages/content-schema/fixtures/valid/` (hiện có 2: `topic.json`, `01-thuc-an-cho-ta-nhung-gi.json`) không lỗi. Kiểm vài giá trị: bài có 2 câu khởi động, 2 block học, 1 block chơi có 8 món, 6 câu quiz, 8 từ vựng, thẻ thưởng `rau_muong`.
- [ ] Test "bỏ qua thứ lạ" (sửa JSON trong bộ nhớ, không tạo file mới trong `packages/`):
  - thêm một block `"type": "hotspot_image"` vào `learn` → decode được, block bị lọc, còn 2 block;
  - đổi `format` của q3 thành `"label_diagram"` → decode được, còn 5 câu, có log;
  - thêm trường lạ ở cấp bài → decode được (app đọc lỏng hơn CLI).
- [ ] Test lỗi: xoá `title` của bài → decode ném lỗi có đường dẫn `title`, test bắt được, không crash.
- [ ] Test thứ tự `missing` theo `groups`: với fixture, thứ tự lời nhắc thiếu là thứ tự các nhóm `required` trong `groups`.
- [ ] Test helper `fill_blank_bank`: "Carbohydrates give us {1}." → `[text("Carbohydrates give us "), blank(1), text(".")]`.
- [ ] `xcodebuild test` xanh trên iPhone 16 và iPad Pro 11-inch (M4). Dán log.
- [ ] Không sửa file ngoài `apps/ios/` (trừ ghi chú trong ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- SK-005. Chạy song song với SK-008 và SK-010.
- Fixture đổi ở SK-017 (`sentence.vi` có ô `{1}`) thì test vẫn phải xanh; chạy lại sau SK-017.

**Quyết định đã ghi** (PM tạm chốt 28/10 cho bản thử; Duy chốt ở SK-001)
1. Thứ tự xét `messages.missing` theo `groups`. Đây là hướng 1 trong câu hỏi mở của SK-001; không cần đổi schema.
2. App decode lỏng (trường lạ không lỗi) để gói mới chạy được trên app cũ. CLI vẫn kiểm chặt.

**Câu hỏi còn mở**
- Không có.

## Kết quả (ios-dev)

Ngày 28/10/2026 · Xcode 16.3 (16E140), Swift 6.1, chế độ Swift 6 (strict concurrency `complete`) · simulator iOS 18.4 · DerivedData ở scratchpad, ngoài repo. Chưa commit.

### Đã làm
- Module `ContentModel` (`apps/ios/Packages/SKKit/Sources/ContentModel/`), chỉ `import Foundation` và `os`:
  - `Common.swift`: `Spoken`, `SpokenAudio`, `BilingualText` (= `Text` của schema), `ContentImage` (= `Image`), `Key`, `AssetHash`, `ColorToken`, protocol `OpenStringEnum`, `ContentBlock`.
  - `Topic.swift` (`Topic`, `Topic.Difficulty`, `Misconception`), `Lesson.swift` (`Lesson`, `SkippedContent`), `Blocks.swift` (`LearnBlock`, `PlayBlock`, `ExploreGroups`, `SentenceCard`, `WordList`, `BuildTray`, `TrayGroup`, `TrayItem`, `TrayMessages`), `QuizItem.swift` (`QuizItem`, `QuizItem.Answer` đủ 6 format + `.unknown(format:)`, `RecallFrom`), `VocabAndReward.swift` (`VocabTerm`, `Collectible`, `Reward`), `SentenceSegment.swift` (helper `fill_blank_bank`).
  - `ContentDecoder.swift`: điểm vào duy nhất. `decodeTopic(from:)`, `decodeLesson(from:)` ném `ContentDecodingError { path, message }` (typed throws), ghi log mục bị bỏ qua qua protocol `ContentLog`; mặc định `OSContentLog` dùng `os.Logger` category `content`.
  - Mọi kiểu `Sendable`, `Hashable` (nên `Equatable`), `Codable` cả hai chiều (encode rồi decode lại cho kết quả bằng hệt, có test).
- `ContentModelTests` (`Tests/ContentModelTests/`): `Fixtures.swift` (tìm `packages/content-schema/fixtures` bằng cách đi ngược từ `#filePath`), `ContentModelTests.swift` với 20 test.
- `apps/ios/README.md`: thêm mục "Nội dung và luật chấm".
- Không sửa `Package.swift`, `project.yml`, module DesignSystem.

### Quyết định đã ghi (ios-dev, Duy xác nhận khi review)
3. **Tên kiểu.** `Text` và `Image` của schema đặt tên Swift là `BilingualText` và `ContentImage`. Lý do: LessonPlayer import cả SwiftUI lẫn ContentModel; nếu cùng tên `Text`, `Image` thì mọi chỗ dùng đều báo "ambiguous". Kiểu đáp án nằm trong `QuizItem` (`QuizItem.SingleChoice`, `.TrueFalse`…). Enum chuỗi nằm trong kiểu dùng nó (`Topic.AgeGroup`, `Topic.Strand`, `Lesson.Stage`, `TrayGroup.Role`, `VocabTerm.Tier`, `Collectible.Rarity`), vì SK-007 sinh `AgeGroup` trong DesignSystem và LessonEngine có kiểu chấm riêng.
4. `Key`, `AssetHash` là `typealias String`; `Uuid` là `Foundation.UUID` (đọc được chữ thường; khi encode ra chữ hoa, chỉ dùng nội bộ).
5. **Enum chuỗi mở** (`OpenStringEnum`): `ColorToken`, `age_group`, `strand`, `stage`, `role`, `tier`, `rarity` nhận cả giá trị lạ (`isKnown == false`), không lỗi. Như vậy gói mới thêm màu hay `stage` không làm hỏng cả bài trên app cũ (mở rộng quyết định 2); tên `ColorToken` đổi khi chốt design tokens cũng không vỡ decode. `complete_when`, `success_when` để `String`. `recall_from.kind` lạ → `.unknown(kind:)`.
6. **Bỏ qua thứ lạ.**
   - Block `type` lạ chỉ cần có `type`; `id` đọc nếu có. Block chơi đặt trong `learn` (ví dụ `build_tray`) cũng tính là lạ.
   - Câu `format` lạ vẫn phải có đủ trường chung (`QuizBase`, mọi format đều dùng); phần đáp án thành `.unknown(format:)`.
   - Lọc ở `Lesson.init(from:)`: `learn`, `warmup`, `quiz` chỉ còn thứ app hiển thị được, `lesson.skipped` liệt kê thứ bị bỏ kèm JSON pointer của file gốc (`/learn/2`, `/quiz/2`).
   - `play` có đúng 1 block nên giữ `.unknown` để LessonPlayer bỏ bước Chơi (`lesson.play.isUnknown`); cũng có trong `skipped` với path `/play`.
7. **Log.** `ContentDecoder` ghi mỗi mục `skipped` qua `ContentLog`; test cắm bộ ghi riêng để kiểm có log. Subsystem của `Logger` lấy từ `Bundle.main.bundleIdentifier`, không viết bundle id lần thứ hai (giữ phép kiểm "bundle id ở một chỗ" của SK-005).
8. **Lỗi decode** thành `ContentDecodingError`, `path` là JSON pointer theo RFC 6901, cùng kiểu pointer CLI in. Đã đối chiếu với `test/invalid-fixtures.json`: 3 file app từ chối (`spoken-missing-vi`, `image-missing-alt`, `uuid-bad-format`) có path trùng đúng pointer của CLI. 16 file còn lại app decode được, vì luật số phần tử và kiểm chéo là việc của CLI; riêng `block-unknown-type` decode được và bỏ `/learn/1`. Không file nào làm crash.
9. `kind` phải đúng loại file (`lesson`/`topic`), sai thì lỗi `/kind`. `schema_version` đọc nhưng chưa chặn: manifest có `min_app_version` (B4.3).
10. Mặc định khi thiếu: `sensitive`, `archived`, `ai_draft` = false; `tier` = `core`; `rarity` = `common`.
11. Helper `fill_blank_bank`: `SentenceSegment.split(_:)` dùng đúng mẫu ô trống của CLI (`/\{(\d+)\}/` trong `scripts/lib/refs.mjs`); `FillBlankBank.segmentsEN`, `segmentsVI`. `{x}`, `{ }`, dấu ngoặc lẻ giữ nguyên là chữ.
12. `BuildTray.missingMessagesInGroupOrder`: lời nhắc thiếu theo thứ tự `groups`, chỉ nhóm `required` có lời nhắc (quyết định 1).

### Tự kiểm tiêu chí nghiệm thu

| Tiêu chí | Kết quả | Bằng chứng |
| --- | --- | --- |
| Decode mọi fixture hợp lệ | pass | `decodesEveryValidFixture` duyệt đệ quy `fixtures/valid/`: `ContentModel: decoded 2/2 valid fixtures (1 topic, 1 lesson)`, không mục nào bị bỏ, không log. `lessonOneValues`: warmup 2 (w1 `fill_blank_bank` có `recall_from: prior_knowledge`, w2 `true_false`); learn 2 (`explore_groups` 4 nhóm, `word_list`); play `build_tray` 8 món; quiz 6 câu q1–q6 đúng format; q6 có `speaker: na`, `labels`, `misconception_id`; vocab 8; thẻ `rau_muong`. `topicValues` kiểm topic. |
| Bỏ qua thứ lạ | pass | `unknownLearnBlockIsDropped`: thêm `hotspot_image` vào `learn` → còn 2 block, `skipped` = `/learn/2`, log nhận đúng 1 mục. `unknownQuizFormatIsDropped`: q3 → `label_diagram` → còn 5 câu (q1, q2, q4, q5, q6), log 1 mục `/quiz/2`. Log thật trên simulator (`log show --predicate 'category == "content"'`): `[com.apple.dt.xctest.tool:content] lesson 4b11eb40-… skipped /quiz/2: unknown quiz format "label_diagram", id b06b6e26-…` (trong app, subsystem là bundle id). `unknownFieldsAreIgnored`: trường lạ ở cấp bài, câu và block → kết quả bằng hệt bản gốc. Thêm: warmup format lạ, play type lạ, `build_tray` đặt trong `learn`, giá trị enum lạ, trường mặc định. Mọi sửa đổi làm trong bộ nhớ (`JSONSerialization`), không tạo file. |
| Lỗi có đường dẫn | pass | `missingTitle`: xoá `title` → `ContentDecodingError` path `/title` (`/title missing required field`), test bắt được. Thêm: `/quiz/2/options/0/key` (thiếu key lồng sâu), `/order` (sai kiểu), `/topic_id` (UUID hỏng), `/kind` (đọc topic như bài), `/` (JSON hỏng); `invalidFixturesNeverCrash` chạy cả 19 fixture sai. |
| Thứ tự `missing` theo `groups` | pass | `missingMessagesFollowGroupOrder`: `[tray_carb, tray_protein, tray_veg]`, đúng thứ tự nhóm `required` trong `groups`; file ghi `missing` theo thứ tự protein, veg, carb. |
| Helper `fill_blank_bank` | pass | `fillBlankSegments`: `"Carbohydrates give us {1}."` → `[text("Carbohydrates give us "), blank(1), text(".")]`; thêm nhiều ô, ô liền nhau, không có ô, ngoặc không phải ô, chữ có dấu, chuỗi rỗng; q2 của fixture. Phần `vi` chỉ kiểm số ô ≤ số đáp án, nên SK-017 thêm `{1}` vào `sentence.vi` vẫn xanh. |
| `xcodebuild test` xanh trên iPhone 16 và iPad Pro 11-inch (M4) | pass | Scheme `ScienceKids`, cả 7 bundle, log dưới. `ContentModelTests` 20/20 trên cả hai máy. Không warning Swift nào (chỉ có dòng AppIntents như SK-005). |
| Không sửa ngoài `apps/ios/` | pass | `find packages/content-schema -type f -mmin -90` → rỗng. `Package.swift`, `project.yml` giữ mtime 16:00/16:03 (SK-005). Ngoài `apps/ios/` chỉ sửa ticket này và SK-010. Không commit. |

Lệnh (từ `apps/ios`, `DD` là thư mục DerivedData trong scratchpad):
```
xcodebuild test -project ScienceKids.xcodeproj -scheme ScienceKids \
  -destination 'platform=iOS Simulator,name=iPhone 16' -derivedDataPath "$DD"
xcodebuild test -project ScienceKids.xcodeproj -scheme ScienceKids \
  -destination 'platform=iOS Simulator,name=iPad Pro 11-inch (M4)' -derivedDataPath "$DD"
```

Phần cuối log, iPhone 16 (iPad Pro 11-inch (M4) giống hệt; xcresult iPad: `Passed 62/62`):
```
✔ Test run with 13 tests passed after 0.051 seconds.      ScienceKidsTests
✔ Test run with 10 tests passed after 0.024 seconds.      DesignSystemTests (của SK-007)
ContentModel: decoded 2/2 valid fixtures (1 topic, 1 lesson)
✔ Test run with 20 tests passed after 0.044 seconds.      ContentModelTests
vectors all: 71/71 pass · confirmed 36/36 · proposed 35/35
✔ Test run with 14 tests passed after 0.075 seconds.      LessonEngineTests
✔ Test run with 2 tests passed after 0.001 seconds.       ContentKitTests
✔ Test run with 2 tests passed after 0.001 seconds.       LessonPlayerTests
✔ Test run with 1 test passed after 0.001 seconds.        AudioKitTests
** TEST SUCCEEDED **
```
(Cột tên bundle là chú thích thêm, theo thứ tự bundle trong log.) Lần chạy đầu trên DerivedData mới, `decodesEveryValidFixture` mất khoảng 8 giây; các lần sau chỉ khoảng 0,02 giây. Chưa rõ nguyên nhân, có thể do lần đầu simulator đọc thư mục của repo. Test không phụ thuộc thời gian nên không ảnh hưởng kết quả.

### Việc còn lại · ghi chú cho người khác
- **Sau SK-017:** chạy lại `xcodebuild test`. Test không ghim chữ `sentence.vi`, nên dự kiến vẫn xanh.
- **SK-012 (ios-dev):** chuyển `QuizItem.Answer` sang `ScoringItem` của LessonEngine; dùng `lesson.play.isUnknown` để bỏ bước Chơi; tra `WordList.termKeys` trong `lesson.vocab`; dùng `missingMessagesInGroupOrder` cho lời nhắc mâm cơm.
- **tester:**
  - đối chiếu từng trường Swift với bảng "Hợp đồng trường v1" của SK-001, nhất là các trường tuỳ chọn và mặc định;
  - xem quyết định 5 (enum mở) và 6 (format lạ vẫn cần trường chung) có hợp ý không;
  - thử thêm đột biến trong bộ nhớ nếu thấy thiếu.

### Câu hỏi còn mở (thêm)
- *(ios-dev, cho PM/Duy)* App bỏ một câu quiz có format lạ thì bài còn 5 câu. Khi đó `scoreLesson` (SK-010, T4) không bao giờ cho `completed`, vì cần đủ 6 kết quả, và `max` luôn là 6. Có ba hướng:
  - (a) tin bước publish chặn bằng `min_app_version`, nên app không gặp trường hợp này;
  - (b) bài còn dưới 6 câu sau khi lọc thì LessonPlayer hiện "Cập nhật app để học bài này", không cho vào;
  - (c) `max` = số câu app chấm được (đổi T4 và vector).

  Đề xuất (b) cho bản thử. Block học lạ thì vẫn bỏ qua như B4.2.
