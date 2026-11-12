# SK-030 · App hiện đủ syllabus, không khoá bài

Trạng thái: in_progress · Ngày: 2026-11-09 · Phụ trách: ios-dev (app), dev (schema), content-editor (tên VI) · Tester: tester
Nguồn: syllabus.md, syllabus-lessons.md (Duy duyệt 9/11/2026); syllabus.md mục 6 và 9

## Mục tiêu
Duy (và sau này trẻ, phụ huynh) mở app thấy đủ syllabus của nhóm tuổi: mọi chủ đề, mọi bài theo đúng thứ tự đã duyệt, không bài nào bị khoá. Bài đã soạn chơi được, bài chưa soạn báo chưa có nội dung.

## Phạm vi

**Danh mục syllabus `content/syllabus.json`** (main session sinh 9/11 từ dữ liệu đã duyệt, xem "Quyết định đã ghi"):

```jsonc
{
  "schema_version": 1, "syllabus_version": "2026-11-09", "ai_draft": true, "source": "…",
  "groups": [{
    "age_group": "explorer" | "discoverer" | "scientist", "oak_years": [1, 2],
    "topics": [{
      "key": "healthy-eating",               // unit slug của Oak, hoặc "new-…" cho chủ đề mới
      "number": 9,                           // thứ tự trong nhóm, 1..n liên tiếp
      "title": { "en": "…", "vi": "…" },
      "strand": "humans_health",             // enum strand của topic.schema.json
      "level": 2 | null,                     // null: chủ đề mới chưa chấm
      "source": { "kind": "oak", "unit_slug": "…", "year": 3, "unit_index": 4 } | { "kind": "new" },
      "topic_id": "uuid",                    // chỉ khi chủ đề đã có nội dung soạn
      "lessons": [{
        "number": 2,                         // 1..n liên tiếp
        "title": { "en": "…", "vi": "…" | null },   // vi null: chưa dịch, app dùng en
        "oak_lessons": ["types-of-food"],    // slug lesson Oak; [] với chủ đề mới; >1 khi gộp thí nghiệm
        "statutory": true,
        "sensitive": true,                   // chỉ khi có
        "lesson_id": "uuid"                  // chỉ khi bài đã soạn
      }]
    }]
  }]
}
```

- **dev:**
  - `packages/content-schema/schema/syllabus.schema.json` và test kiểm `content/syllabus.json`: đúng schema; key và number duy nhất, liên tiếp; mọi `topic_id`, `lesson_id` trỏ tới topic hoặc bài có thật trong `content/` (đọc markdown như `content-cli validate`), và `lesson_id` thuộc đúng `topic_id` của chủ đề.
  - `content-cli validate content` kiểm luôn file này.
  - Không sửa dữ liệu trong `content/syllabus.json`; cần đổi định dạng thì ghi đề xuất vào ticket.
- **content-editor:** tên VI cho 347 bài Oak còn `vi: null` (danh sách `content/.build/syllabus-vi-worklist.tsv`), ghi `content/.build/syllabus-vi.tsv`; main session gộp vào `content/syllabus.json`. Rà luôn tên VI của chủ đề.
- **ios-dev:**
  - Đưa `content/syllabus.json` vào bundle (như `content/rules.json`); model Codable; bỏ `BundledContent.plannedLessonCounts`.
  - **Home:**
    - hành trình hiện mọi chủ đề của nhóm theo `number`;
    - có cách xem 2 nhóm còn lại (mặc định nhóm của hồ sơ);
    - chủ đề chưa có nội dung vẫn bấm vào được.
  - **Màn chủ đề:**
    - hiện mọi bài, mỗi bài có số và tên;
    - tên theo chế độ ngôn ngữ, `vi` null thì dùng `en`;
    - bài có `lesson_id` mà gói nội dung có thì hiện tên trong nội dung và chơi được;
    - bài khác hiện "Chưa có nội dung" / "Coming soon", bấm vào báo nhẹ, không lỗi.
  - **Không khoá:**
    - bỏ luật khoá trong `LessonList`;
    - bỏ cờ `SK_UNLOCK_ALL_LESSONS` và sửa mục README "Bản thử lên máy thật".
  - **Gói trả phí tạm tắt:** không hiện nhãn Free ("topic.free", "home.continue_free").
  - **Thẻ "Học tiếp":** trỏ bài đã soạn đầu tiên theo thứ tự hành trình.
  - Dùng component và token có sẵn; designer xem lại sau.
- **pm:** sửa PRD, technical-plan, `docs/ios-test-build.md` theo quyết định 9/11 (syllabus.md mục 9). *Xong 9/11.* pm nêu 4 việc cần Duy chốt: phạm vi pilot (đề xuất b: Ăn uống lành mạnh + 5 chủ đề mới, 33 bài), gói trả phí tắt tới khi nào và giới hạn 1 hồ sơ, khởi động khi học nhảy cóc, khối lượng GĐ 2.

## Ngoài phạm vi
- Đưa danh mục vào gói nội dung (`content-cli build`) và CMS: làm sau, khi có CMS.
- Cổng trả phí; chọn chủ đề miễn phí.
- Soạn nội dung bài mới; tách lại hai bài *Ăn uống lành mạnh* theo 1:1.
- Thiết kế mới trên canvas cho trạng thái "chưa có nội dung" (designer làm sau, app dùng component có sẵn).

## Tiêu chí nghiệm thu
- [ ] `content/syllabus.json` qua schema và test của dev: 3 nhóm; 12, 17, 16 chủ đề; 73, 155, 156 bài, tổng 384. Thứ tự khớp syllabus.md mục 3–5.
- [ ] Sửa `content/syllabus.json` cho một `lesson_id` trỏ sai → test dev đỏ, báo đúng chủ đề và bài.
- [ ] Mọi bài có `title.vi` (sau khi gộp tên của content-editor).
- [ ] App, hồ sơ Discoverer: Home hiện 17 chủ đề theo đúng thứ tự; xem được nhóm Explorer (12) và Scientist (16).
- [ ] Màn chủ đề *Ăn uống lành mạnh* (#9) hiện 10 bài. Bài 2 "Thức ăn cho ta những gì?" và bài 6 "Mâm cơm cân bằng" chơi trọn được, có tiếng. 8 bài còn lại hiện "Chưa có nội dung", bấm vào không lỗi.
- [ ] Một chủ đề chưa có nội dung (ví dụ Discoverer #1) mở được, hiện đủ 5 bài.
- [ ] Không còn biểu tượng khoá hay chữ "Mở sau bài n" ở đâu; không còn nhãn Free.
- [ ] `grep -rn SK_UNLOCK_ALL_LESSONS apps/ios` không còn kết quả.
- [ ] Unit test iOS, content-schema, content-cli đều qua. iOS chạy một lần trên iPhone 16 Pro simulator.
- [ ] Bản Release cài lên iPhone Luu, Duy xem được như trên.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc:** syllabus đã duyệt (9/11).

**Quyết định đã ghi**
- 9/11, Duy: thứ tự chủ đề, 1 bài = 1 lesson Oak (gộp thí nghiệm), 8 chủ đề mới đứng đầu, không khoá, gói trả phí tạm tắt và bản test mở toàn bộ (syllabus.md).
- 9/11, main session:
  - Danh mục là file JSON tay `content/syllabus.json`, app đọc từ bundle (cùng cách `rules.json`). Lý do: thấy được ngay trên máy thật; đưa vào gói nội dung khi có CMS.
  - File sinh một lần từ dữ liệu Oak và các quyết định trong syllabus-lessons.md; sau đó sửa trực tiếp.
- Hai bài đã soạn gắn vào ô theo lesson Oak chính của chúng:
  - "Thức ăn cho ta những gì?" ở bài 2 (*Types of food*);
  - "Mâm cơm cân bằng" ở bài 6 (*Nutrient-rich meal*).
- dev 9/11:
  - **Schema** `packages/content-schema/schema/syllabus.schema.json`, khớp định dạng ở mục Phạm vi, không đổi dữ liệu.
    - `age_group` và `strand` là `$ref` vào `topic.schema.json`, nên luôn cùng enum với Topic.
    - Chủ đề: `title` là `Text` (bắt buộc đủ en, vi); `level` là 1–5 hoặc `null`.
    - Bài: `title.vi` phải có mặt, là chuỗi hoặc `null`.
    - `topic_id`, `lesson_id`, `sensitive` tuỳ chọn; `sensitive: false` vẫn hợp lệ.
    - Không có trường `kind`.
    - Chỉ có JSON Schema (Ajv), chưa có bản zod; thêm khi CMS cần.
  - **Luật ngoài schema** ở `scripts/lib/syllabus.mjs` (`@science-kids/content-schema/syllabus`), hàm thuần, không I/O.
    - Theo ticket: key chủ đề duy nhất; `number` liên tiếp từ 1; `age_group` không trùng; `oak_lessons` theo `source.kind`; `topic_id`, `lesson_id` có thật và bài thuộc đúng chủ đề.
    - Thêm vì rẻ và bắt lỗi thật: chủ đề Oak có `key` = `source.unit_slug`, chủ đề mới có `key` bắt đầu bằng `new-`; `source.year` thuộc `oak_years`; một id hay một slug lesson Oak không gắn hai ô; `topic_id` phải là chủ đề cùng nhóm tuổi.
    - Cảnh báo `syllabus_unlisted`: chủ đề hoặc bài trong `content/` mà chưa ô nào trỏ tới (app sẽ không hiện).
    - Mã lỗi: `tools/content-cli/README.md`, mục "Danh mục `syllabus.json`".
  - **Đọc markdown** bằng `contentIndex` mới trong `tools/content-cli/src/markdown/files.ts`: chỉ đọc frontmatter, bằng đúng parser của `validate` (SK-027).
    - Lý do: chỉ có một parser markdown; bài đang soạn dở có lỗi nội dung vẫn tra được id.
    - Bài thuộc chủ đề của thư mục chứa nó (`validate` đã kiểm `topic:` trùng thư mục).
    - Test của content-schema import hàm này từ `tools/content-cli`, nên cần `npm install` ở đó. Phụ thuộc ngược này chỉ có trong test.
  - **content-cli:** `validate <thư mục>` kiểm `<thư mục>/syllabus.json` khi có (vd `content`), đối chiếu id với markdown dưới chính thư mục đó.
    - Dòng báo: `<file> <JSON pointer> [<mã>] <thông báo>`; thông báo mở đầu bằng nhóm, chủ đề (số, key), bài (số, tên en).
    - Dòng tổng thêm số nhóm, chủ đề, bài, số bài có `lesson_id` và số bài chưa có tên vi.
    - `import` không kiểm syllabus; `validate content/syllabus.json` (file lẻ) thì exit 2, nhắc đưa thư mục.
  - Số của nghiệm thu (12, 17, 16 chủ đề; 73, 155, 156 bài) ghi cứng trong `packages/content-schema/test/syllabus.test.mjs`; duyệt lại syllabus thì sửa test cùng lúc.
  - Cho ios-dev: định dạng không đổi. Model Codable cần:
    - `title.vi` của bài là `String?`; `level` là `Int?`;
    - `topic_id`, `lesson_id`, `sensitive` là optional;
    - `source` tách theo `kind` (`oak` có `unit_slug`, `year`, `unit_index`; `new` không có gì thêm).
  - Kiểm một lần (không thành test) `content/syllabus.json` với bảng syllabus.md mục 3–5: số thứ tự, tên VI, nguồn (Y/#, Mới), số bài, mức khớp cả 45 chủ đề.
- ios-dev 9/11:
  - **Bundle và model.** `content/syllabus.json` vào bundle thành `syllabus.json` (`project.yml`, đọc tại chỗ như `rules.json`). Model `Syllabus` (Codable) ở `ContentModel`; bỏ qua `source`, `oak_lessons` vì app không hiện, nên không tách `source` theo `kind`. Thiếu hoặc hỏng file: ghi log, hành trình chỉ hiện chủ đề có nội dung, không crash.
  - **Ghép.** `ContentKit.Journey` (hàm thuần, có test) đặt nội dung lên danh mục: `topic_id` lấy chủ đề trong gói, `lesson_id` lấy bài trong chính chủ đề đó; id gói không có thì ô hiện "Chưa có nội dung". Bài hoặc chủ đề có nội dung mà danh mục chưa trỏ tới vẫn hiện, đặt cuối danh sách (không giấu bài chơi được). Tên và mức: có nội dung thì lấy của nội dung, không thì của danh mục. `BundledContent.plannedLessonCounts` và `LessonList` (luật khoá, cờ `SK_UNLOCK_ALL_LESSONS`) đã xoá.
  - **Home.** Mở theo nhóm của hồ sơ; ba chip Explorer · Discoverer · Scientist (kiểu chip lớp của màn Hồ sơ, `PaperChipStyle`) để xem nhóm khác, lựa chọn giữ khi vào chủ đề rồi quay lại. Tiêu đề "Hành trình Year n" với nhóm của hồ sơ, "Hành trình Explorer" với nhóm khác. Chủ đề chưa chấm mức (`level: null`) ghi "Chủ đề mới". Bỏ dòng cuối "Sắp có thêm chủ đề" (có khoá). Thẻ "Học tiếp" trỏ bài đã soạn đầu tiên của nhóm đang xem; nhóm chưa có bài nào thì không có thẻ. Định danh dòng chủ đề đổi sang key danh mục: `home.topic.healthy-eating`.
  - **Màn chủ đề.** Mọi bài có số và tên. Bài đã soạn đầu tiên là "Đang học" (nền vàng hoè, một chuyển động lặp); bài đã soạn khác hiện "~8 phút", không lặp. Bài chưa soạn dùng hàng xám của canvas (bỏ ổ khoá), ghi "Chưa có nội dung"; bấm vào hiện dòng "Bài này đang được soạn, sắp có nhé." dưới tên và VoiceOver đọc dòng đó. Chủ đề không có câu hỏi lớn thì bỏ cả khối hero (gọn), không có từ vựng thì không có chip từ vựng. Định danh: `topic.lesson.<n>` (bài chơi được), `topic.lesson.soon.<n>`.
  - **Ô tiến độ** (Home, chủ đề) không tô ô nào: `ProgressSquares` tô "xong" mọi ô trước ô hiện tại, mà bài đã soạn đầu tiên là bài 2 (chưa có tiến độ, SK-012). Chủ đề nhiều bài (tới 19) thì ô nhỏ lại, không vừa nữa thì chỉ còn chữ "0/n bài" (`LessonSquares`).
  - **Tên VI null** thì hiện `en`, và không hiện tên phụ (tránh lặp tiếng Anh hai lần).
  - **Nhãn Miễn phí:** cờ `AppFeatures.paidPlanEnabled = false` (`ScienceKids/App/AppFeatures.swift`); đặt `true` thì "Miễn phí" theo `is_free` hiện lại ở màn chủ đề và thẻ Học tiếp.
  - **Giao diện vẫn theo Discoverer** (`AppFeatures.trialWorld`: bán kính, vùng chạm) cho mọi nhóm, vì canvas chỉ có Discoverer; câu "bé học thử Discoverer" ở màn Hồ sơ giữ nguyên. Luật chuỗi ngày trên Home đổi sang nhóm của hồ sơ (trước là Discoverer).
  - **Bài `sensitive`** (3 bài Scientist) vẫn hiện tên trong danh sách, chưa có nội dung nên không mở được gì. Xem câu hỏi bên dưới.
  - Đầu bài học ghi số theo hành trình: "Ăn uống lành mạnh · Bài 6/10".

**Câu hỏi còn mở**
- Phạm vi pilot GĐ 0 và tên hai chủ đề mùa (syllabus.md mục 8).
- dev 9/11: tên VI của chủ đề đang ở hai nơi, syllabus.md mục 3–5 ("sửa trực tiếp ở đây") và `content/syllabus.json` ("sau đó sửa trực tiếp"), nên dễ lệch nhau. Đề xuất: `content/syllabus.json` là nguồn, syllabus.md chỉ ghi lại; hoặc dev thêm test so hai nơi. pm hoặc Duy chọn.
- dev 9/11: sau khi gộp tên VI (dòng tổng của `validate content` về "0 bài chưa có tên vi"), có siết schema để `title.vi` của bài không được `null` không? App vẫn đọc được vì `String?` nhận chuỗi; đổi thì bản chép tay sau này phải luôn có tên VI.
- dev 9/11: dòng báo lỗi của syllabus.json chưa có số dòng, chỉ có JSON pointer và tên chủ đề, bài. Nếu main session sửa tay nhiều và cần bấm vào dòng thì thêm sau.
- ios-dev 9/11, cho dev: cảnh báo `syllabus_unlisted` ghi "app sẽ không hiện", nhưng app hiện nội dung chưa có ô ở cuối danh sách (xem Quyết định). Đề xuất sửa câu cảnh báo, hoặc báo lại nếu muốn app giấu.
- ios-dev 9/11, cho pm/Duy: tên 3 bài `sensitive` (dậy thì, ma tuý, rượu bia; Scientist #9, #12) đang hiện trong danh sách bài. Khi có nội dung, bài sẽ cần cờ của Góc phụ huynh như `LocalContentLibrary` đang làm với bài nhạy cảm. Có cần giấu cả tên từ bây giờ không?
- ios-dev 9/11, cho designer: trạng thái "chưa có nội dung" (hàng, dòng báo khi bấm), ba chip nhóm tuổi trên Home, ô tiến độ khi bài đã soạn đầu tiên không phải bài 1 (cần một kiểu "đang học" mà không tô "xong" các ô trước), glyph cho 5 mạch ngoài `humans_health` (hiện là dấu "…"; mọi chủ đề sức khoẻ dùng chung hình bát cơm).

## Kết quả kiểm (tester 9/11)

Máy: iPhone 16 Pro `14DF158D-…` (một máy, đã `simctl shutdown` sau khi xong). Mỗi bộ chạy một lần, không chạy lại. Theo yêu cầu Duy, lượt iOS cuối chỉ chạy `ScienceKidsUITests/OnboardingUITests`; LessonUITests, AudioUITests **chưa chạy lại theo yêu cầu Duy**; SyncUITests (ghi Supabase) và IPadLayoutUITests (cần iPad) **chưa kiểm**.

**Kết quả**
- content-schema `npm test`: 142/142 pass. content-cli `npm test`: 282/282 pass. `validate content`: 0 lỗi, 3 cảnh báo `md_needs_check` (có từ trước); dòng tổng "3 nhóm, 45 chủ đề, 384 bài; 2 bài có lesson_id".
- iOS lượt 1 (`scratchpad/xctest.log`, bị main session dừng giữa chừng, exit 75): chỉ có kết quả `ScienceKidsTests` = 57/57 pass. `ContentKitTests/ContentPackTests`, `JourneyTests`, `ContentModelTests/SyllabusTests` **không có dòng kết quả trong log**, nên **chưa kiểm** (không được coi là đã sửa xong `builtPackOpens()`).
- iOS lượt 2 (`scratchpad/xctest-onboarding.log`): OnboardingUITests 11 test, 8 pass, 1 skip (`testScreenshots`, cần `SK_SCREENSHOT_DIR`), **2 đỏ**:
  1. `testEveryGroupAndAnUnwrittenTopic` dòng 188: "Hành trình Year 4" khác "Hành trình Year 3". Phân loại: **lỗi test**. Hồ sơ lớp 3, `Grade.ukYear(for: 3) == 4` (`Modes.swift:105`, `ProfilesTests`). Test phải mong "Year 4". Các kiểm trước dòng 188 đã pass (nhóm mặc định chọn sẵn, 17 chủ đề, Explorer 12, tiêu đề Explorer, không có thẻ Học tiếp). Phần sau dòng 188 (Scientist 16, chủ đề `new-earth-surface` mở được với 5 bài, bấm bài báo "đang được soạn") **chưa chạy tới**.
  2. `testTopicListsEveryLessonNoneLocked` dòng 168: sau khi quay về Home, bấm `home.start_lesson` (nút trên thẻ Học tiếp) rồi không thấy `lesson.title` trong 5 giây. **Chưa phân loại được** (không được chạy lại): các kiểm trước đó đều pass (10 hàng bài, 8 hàng "Chưa có nội dung", không có "mở sau bài", bấm bài 2 từ màn chủ đề mở được). Đường mở bài từ thẻ và từ hàng cùng gọi `openLesson`, nên nghi do nhịp animation (`.motion(nudge)`, `reveal`) hoặc trạng thái điều hướng sau hai lần quay lại; cần dev xem hoặc Duy cho phép chạy lại một test.

**Tiêu chí**
- [x] `content/syllabus.json` qua schema và test; 3 nhóm, 12/17/16 chủ đề, 73/155/156 bài = 384 (test node + validate). Thứ tự, số bài, mức, nguồn (Y/#, Mới), tên VI chủ đề khớp syllabus.md mục 3–5 cả 45 chủ đề (script đối chiếu). Hai chỗ lệch tên en có chủ ý, báo dev xem lại: Explorer #2 và #5 (syllabus.md ghi "Seasonal changes: …", json ghi "Autumn, winter and the dry season" / "Spring, summer and the rainy season"), Scientist #16 (md "Climate change and sustainability (non-statutory)", json "Energy and climate change").
- [x] `lesson_id` trỏ sai → đỏ, nêu đúng chủ đề và bài. Thử trên bản chép (scratchpad/neg): id không tồn tại → `[syllabus_lesson_ref] discoverer, chủ đề 9 "healthy-eating", bài 3 …`, exit 1; chuyển lesson_id sang chủ đề khác → `[syllabus_lesson_ref]` báo chủ đề 6 "rocks-and-soils" bài 1.
- [x] Mọi bài có `title.vi`: 0/384 chưa có.
- [ ] Home Discoverer 17 chủ đề, xem được Explorer 12 / Scientist 16: một phần. Discoverer 17 và Explorer 12 đã pass trong UI test; Scientist 16 chưa chạy tới (xem lỗi test 1). Thứ tự đúng theo `number` đã kiểm ở danh mục, chưa kiểm bằng UI.
- [ ] Chủ đề #9 hiện 10 bài, bài 2 và 6 chơi trọn có tiếng, 8 bài còn lại "Chưa có nội dung": một phần. UI test xác nhận 10 hàng, 8 hàng soon, bài 2 mở được. Bài 6 chơi trọn và tiếng chưa kiểm; thẻ Học tiếp mở bài đang đỏ (lỗi 2).
- [ ] Chủ đề chưa có nội dung (Discoverer #1) mở được, 5 bài: chưa chạy tới (test bị chặn bởi lỗi test 1). Journey.swift có test đơn vị nhưng chưa có kết quả (xem trên).
- [x] Không còn khoá, "Mở sau bài", nhãn Free (mã nguồn): grep `lock.fill|isLocked|LessonList|Mở sau bài` trong `apps/ios` chỉ còn khoá chuỗi `topic.free`, `home.continue_free` (không hiển thị khi `paidPlanEnabled == false`) và một assertion âm trong test. UI test pass phần "không có 'mở sau bài'".
- [x] `grep -rn SK_UNLOCK_ALL_LESSONS apps/ios` không còn kết quả. Còn nhắc ở `docs/ios-test-build.md:131` (vùng pm, xem Nên sửa).
- [ ] Unit test iOS, content-schema, content-cli đều qua: content-schema và content-cli đạt; iOS `ScienceKidsTests` 57/57 đạt nhưng package tests mới (JourneyTests, SyllabusTests, ContentPackTests) chưa có kết quả; UI test còn 2 đỏ.
- (không đánh dấu) Bản Release lên iPhone Luu: main session.

**Lỗi và góp ý (cho ios-dev / dev / pm)**
- Nên sửa: `OnboardingUITests.swift:188` mong "Year 3", đúng là "Year 4" (lỗi test của ios-dev; tester không sửa vì ios-dev đang giữ file).
- Nên sửa: `home.start_lesson` không mở bài trong `testTopicListsEveryLessonNoneLocked` (dòng 168), cần tái hiện và phân loại. Bước: hồ sơ lớp 3 → Home → bấm chủ đề Ăn uống lành mạnh → bài 2 → thoát bài → thoát chủ đề → bấm nút play trên thẻ Học tiếp.
- Nên sửa (hỏi Duy/ios-dev): hồ sơ lớp 1–2 (Explorer) hoặc lớp 5–6 (Scientist) mở Home ra nhóm của mình, không có bài nào soạn nên không có thẻ Học tiếp và không có gì chơi được; phải tự bấm chip Discoverer. `HomeScreen.swift:191-194` (`shownGroup` mặc định theo hồ sơ). Test cũ (`profile.world` "bé thử Discoverer") vẫn nói bé học thử Discoverer, lệch với Home mới.
- Nên sửa (pm): `docs/ios-test-build.md:131` còn nhắc cờ `SK_UNLOCK_ALL_LESSONS` "bản thử đang mở khoá bằng cờ".
- Nhỏ: `Localizable.xcstrings` còn khoá `topic.free`, `home.continue_free` (đang ẩn sau cờ, chủ ý).
- Nhỏ: `Journey.topics` gán `key` của chủ đề chưa liệt kê bằng `topic.slug`; nếu trùng key syllabus thì `journeyTopic(key:)` lấy nhầm. Chưa xảy ra với dữ liệu hiện tại.
- Nhỏ (dev, đã có trong câu hỏi mở): cảnh báo `syllabus_unlisted` nói "app sẽ không hiện" nhưng app hiện ở cuối danh sách.

**ios-dev 9/11, sau tester**
- **Lỗi 2 (`home.start_lesson` không mở bài): lỗi test, app không lỗi.**
  - Nguyên nhân: khi quay lại, Home giữ vị trí cuộn. Test đã cuộn Home xuống để bấm chủ đề #9, nên lúc về thẻ Học tiếp nằm dưới thanh trạng thái. Cây giao diện lúc đỏ (xcresult) ghi nút play ở `{{302, -8}, {64, 64}}`.
  - Vì khung nút còn chạm mép cửa sổ, XCUITest không cuộn mà chạm thẳng vào tâm nút (y = 24 pt). Điểm đó thuộc thanh trạng thái, nên cú chạm không tới nút.
  - Tái hiện bằng tay trên iPhone 16 Pro đúng các bước của tester (Home → cuộn → #9 → bài 2 → thoát bài → thoát chủ đề): cuộn lên thấy thẻ rồi bấm play thì bài 2 mở ("Bài 2/10"). Trên máy thật bé bấm vào nút đang nhìn thấy nên không bị lỗi này.
- **Đã sửa (chỉ code test):**
  - `OnboardingUITests`: helper `scrollHomeToTop` vuốt Home lên tới khi nút cách mép trên ≥ 100 pt, và kiểm thêm điều đó trước khi bấm.
  - `IPadLayoutUITests.toLearn`: thêm bước vuốt tương tự trước khi bấm, vì trên iPhone test này cũng đi qua chủ đề #9 rồi bấm Học tiếp. Chưa chạy, theo yêu cầu Duy lượt này.
- **Lỗi 1:** `testEveryGroupAndAnUnwrittenTopic` đổi thành mong "Hành trình Year 4" (lớp 3 = Year 4).
- **Kết quả**, chạy một lần trên iPhone 16 Pro: `xcodebuild test … -only-testing:ScienceKidsTests -only-testing:ScienceKidsUITests/OnboardingUITests -only-testing:ContentKitTests -only-testing:ContentModelTests` → `** TEST SUCCEEDED **`.
  - ScienceKidsTests 57/57.
  - ContentKitTests 25/25: gồm ContentPackTests (`builtPackOpens()` qua) và JourneyTests.
  - ContentModelTests 25/25: gồm SyllabusTests.
  - OnboardingUITests 11 test: 10 pass, 1 skip (`testScreenshots`, cần `SK_SCREENSHOT_DIR`), 0 đỏ.
  - Log: `scratchpad/xctest-iosdev-r2.log`. Simulator đã shutdown.

## ios-dev 10/11: tiến độ trên hành trình
Duy góp ý 10/11 sau khi chơi trên iPhone: học xong *Khủng long và Trái Đất thời xa xưa* mà Hành trình không có dấu hiệu gì; tiêu đề phụ còn "· dễ → khó" (sai từ khi syllabus theo thứ tự Oak).

**Nguồn dữ liệu** (không thêm file hay bảng nào, chỉ đọc cái đã có):
- `lessons/history.json` trên máy (SK-012): mỗi lượt học xong có `stars` của bài sau lượt đó. Sao server chốt được ghi đè vào đây (SK-022 `updateStars`).
- `lesson_progress` của `get_home` lần cuối (SK-022, cache theo hồ sơ trong `sync/state.json`): lấy sao cao hơn của máy và server, để cài lại app vẫn thấy bài đã xong.
- `lessons/in_progress/<lesson>.json` (SK-012, chưa quá 7 ngày): bài đang dở.
- Chỉ lấy dữ liệu của `child_id` hồ sơ đang mở.

**Luật "bài xong":** sao tốt nhất ≥ 1, tức đã hoàn thành ít nhất một lượt. Đây là luật ⭐ của `computeStars` (B4.4: hoàn thành lượt là có ⭐, điểm bao nhiêu cũng vậy), nên không cần vector mới. Bài xong rồi mà đang học lại thì vẫn tính là xong; lượt dở không làm mất trạng thái xong.

**View model (`ContentKit/JourneyProgress.swift`, hàm thuần, có test):**
- `LessonProgressSnapshot`: sao tốt nhất theo bài, tập bài đang dở. App dựng nó bằng `LessonProgressSnapshot.of(...)` (`ScienceKids/Home/LessonProgressSource.swift`), qua `AppModel.lessonProgress(for:)` và `journeyProgress(for:profile:)`.
- `JourneyStop` (một chặng): `state` = `done` / `inProgress(done:total:)` / `notStarted` / `comingSoon`; `lessonStates` từng bài = `done(stars:)` / `inProgress` / `notStarted` / `comingSoon`; `next` (bài Học tiếp của chủ đề); `doneCount`, `playableCount`; `isCurrent`.
- `JourneyProgress` (cả nhóm): `stops`, `next`, `allDone`, `startedCount`.
- Bản đồ đường đi của designer (`journey-roadmap-spec.md`) chỉ cần thay phần vẽ `JourneyTopicRow`; trạng thái giữ nguyên.

**Quyết định (ios-dev):**
- "x/n bài": n = số bài đã soạn chơi được của chủ đề, x = số bài trong đó đã xong. Màn chủ đề dùng cùng cách đếm, và ô tiến độ chỉ vẽ bài đã soạn: *Ăn uống lành mạnh* có 2 ô, ghi "0/2 bài", danh sách vẫn hiện đủ 10 bài. Như vậy Home và màn chủ đề khớp nhau. Chủ đề chưa có bài nào thì ghi "Sắp có", không có ô.
- `inProgress` gồm cả chủ đề chưa xong bài nào nhưng có một bài đang dở.
- **Thẻ "Học tiếp"** trỏ bài đã soạn đầu tiên chưa xong theo thứ tự hành trình, kể cả khi bài sau đã xong. Nó không ưu tiên bài đang dở.
  - Ô tiến độ trên thẻ: bài xong (lá tre, tích), bài Học tiếp (vàng hoè), còn lại giấy lõm.
  - Xong hết bài đã soạn của nhóm đang xem thì thay bằng thẻ "Đã học hết" · "All done", kèm triện lá tre: "Em đã học xong mọi bài hiện có. Bài mới đang được soạn, sắp có nhé!"
  - Nhóm không có bài nào soạn: không có thẻ, như trước.
- **Hành trình** (phone và thanh bên iPad):
  - chủ đề của thẻ Học tiếp: nền vàng hoè như cũ, "Đang học · 2/5 bài" màu đỏ son;
  - chủ đề đã bắt đầu khác: "Đang học · x/n bài", chữ phụ;
  - xong hết: triện nhỏ lá tre có dấu tích ở góc chặng, "Đã xong · 5/5 bài" màu `text_correct`;
  - chưa bắt đầu: "Mức 3 · 0/2 bài" hoặc "Chủ đề mới · 0/5 bài";
  - chưa có nội dung: chặng giấy lõm (thêm kiểu `PaperDisc.soon`, như `.locked` nhưng không có ổ khoá), tên chữ phụ, "Sắp có".
  - Bỏ mức ở chủ đề đang học và chủ đề đã xong cho gọn.
- **Màn chủ đề**, mỗi bài đã soạn:
  - xong: triện tích lá tre ở góc ô số, "Đã xong" và 3 sao nhỏ (vàng hoè cho sao đạt, giấy lõm cho sao còn thiếu), vẫn bấm để học lại;
  - đang dở: "~8 phút · Đang học" màu đỏ son;
  - bài Học tiếp của chủ đề: nền vàng hoè, chuyển động lặp duy nhất của màn; chưa bắt đầu thì ghi "~8 phút · Học tiếp";
  - còn lại: "~8 phút".
  - "Đang học" giờ chỉ dành cho bài có lượt dở. Trước đây chữ này hiện ở bài đã soạn đầu tiên.
- **Tiêu đề phụ:** "17 chủ đề", có chủ đề đã bắt đầu thì "17 chủ đề · 3 đã bắt đầu" · "17 topics · 3 started". Số đã bắt đầu tính cả chủ đề đã xong.
- **Màu triện "xong":** dùng lá tre (`Seal` tone `.correct`), vì token `feedback_correct` có ghi cho "ô tiến độ đã xong". Doc của `Seal` còn ghi `.correct` chỉ cho "ĐÚNG"; designer xem lại khi dựng bản đồ. Triện trong danh sách không đóng dấu động, để cả danh sách không cùng nhảy; triện lớn trên thẻ "Đã học hết" có chuyển động `stamp` một lần.
- Home và màn chủ đề đọc lại tiến độ khi một bài kết thúc, khi đồng bộ xong, và khi rời màn bài học (`AppModel.lessonClosed()` trong `onDisappear` của route bài học). Lượt dở được lưu mà không đổi `progressVersion`, nên cần bước này.
- **Chuỗi mới** (EN + VI): `home.journey.count_started`, `.done`, `.learning`, `.level`, `.new %lld %lld`, `.soon`, `home.all_done.tag`, `home.all_done.body`, `progress.lessons_a11y`, `topic.progress_soon`, `topic.lesson.done`, `.done_a11y`, `.next`, `.next_a11y`. Đã bỏ: `home.journey.current %lld`, `.current_new`, `.open %lld`, `home.journey.new`, `topic.progress_a11y`. `home.journey.count` bỏ "· dễ → khó".
- Sửa luôn `OnboardingUITests.testEveryGroupAndAnUnwrittenTopic`:
  - mong "17 chủ đề" thay cho "· dễ → khó";
  - chủ đề chưa có nội dung đổi từ `new-earth-surface` sang `new-weather` (#5, 5 bài), vì SK-031 đã soạn #1.
  - Chưa chạy.

**Test** (một lần, iPhone 16 Pro `14DF158D…`, `xcodebuild test … -skip-testing:ScienceKidsUITests`): `** TEST SUCCEEDED **`, 313 test, 0 đỏ.
- ScienceKidsTests 71, DesignSystemTests 47, ContentModelTests 27, LessonEngineTests 19, ContentKitTests 41, LessonPlayerTests 56, AudioKitTests 13, ProfilesTests 21, SyncTests 18.
- Log: `scratchpad/xctest-journey-progress.log` của phiên.
- **Mới, đã chạy, qua:** `ContentKitTests/JourneyProgressTests` (6 test):
  - chưa bắt đầu;
  - xong / đang học / chưa bắt đầu / sắp có trong cùng một hành trình;
  - Học tiếp bỏ qua bài đã xong, kể cả khi bài xong đứng sau bài chưa xong, và bỏ qua chủ đề chưa có nội dung;
  - xong hết;
  - nhóm không có bài nào soạn;
  - luật xong = ≥ 1 sao.
  - Kèm `InfoPlistTests.formatsFillIn` cho các chuỗi mới.
- **Mới, chưa chạy:** `ScienceKidsTests/JourneyProgressAppTests` (3 test: snapshot từ lịch sử + server + bài dở; ô tiến độ khi xong lệch thứ tự; `AppModel` đọc file của trẻ). Do ios-dev: file thêm sau khi đã `xcodegen generate`, nên không vào lượt test duy nhất. `build-for-testing` sau đó qua. Cần một lượt: `-only-testing:ScienceKidsTests/JourneyProgressAppTests`.
- **Ảnh** (iPhone 16 Pro, giao diện VI, `-SKSyncOff YES`), trong `scratchpad/shots/` của phiên:
  - `home-progress.png`;
  - `topic-dinosaurs-done.png`;
  - `topic-earth-in-progress.png`.
  - Dữ liệu thử ghi tay vào container của app: Khủng long xong cả 5 bài; Bề mặt Trái Đất xong bài 1–2, bài 3 đang dở. Chụp xong đã trả lại dữ liệu cũ của simulator và shutdown.

**Chưa kiểm:** iPad (thanh bên 340 pt: chữ trạng thái EN có thể xuống hai dòng); VoiceOver trên máy; UI test (Onboarding, Lesson, iPad) sau đổi chuỗi.

**Tester kiểm:**
- Học xong mọi bài của một chủ đề:
  - Hành trình: chặng có triện tích và "Đã xong · n/n bài";
  - màn chủ đề: mỗi bài "Đã xong" với số sao đúng như màn Thưởng;
  - thẻ Học tiếp chuyển sang bài chưa xong kế tiếp.
- Thoát giữa bài (nút đóng): màn chủ đề ghi "Đang học" ở bài đó; Hành trình ghi "Đang học · x/n bài".
- Học xong hết bài đã soạn của nhóm: thẻ "Đã học hết" thay cho Học tiếp.
- Tiêu đề phụ: hồ sơ mới "17 chủ đề"; sau một bài "17 chủ đề · 1 đã bắt đầu"; EN "17 topics · 1 started".
- Chủ đề chưa có nội dung: chặng nhạt, "Sắp có"; màn chủ đề ghi "Sắp có" thay cho ô tiến độ.
