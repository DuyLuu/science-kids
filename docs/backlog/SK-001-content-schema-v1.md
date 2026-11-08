# SK-001 · Content schema v1: JSON Schema + zod + validate

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: dev · Tester: tester
Nguồn: technical-plan.md B3, B4.1–B4.3, B5.2 (cột của `cms_*` để đặt tên trường), B8.0 (`validate`), B16 GĐ 0 (mốc 4/11 – 14/11); canvas Discoverer 8–13, 16

## Mục tiêu
Dev dựng `packages/content-schema` gồm JSON Schema (nguồn) và zod khớp 1:1 cho topic, lesson, block, quiz_item, vocab, collectible, kèm một fixture bài mẫu và script `validate` chạy bằng `node`, để biên tập (SK-002) và tester (SK-003) có một hợp đồng dữ liệu chung trước khi soạn 34 bài pilot.

## Phạm vi
- `packages/content-schema/` (gói đứng riêng, chưa cần Yarn workspace gốc):
  ```
  package.json          # "type": "module", engines.node, scripts: validate, test
  .gitignore            # node_modules/ (.gitignore gốc chưa có dòng này)
  README.md             # cách chạy, bảng trường, cách thêm một block type
  schema/               # JSON Schema draft 2020-12, mỗi file có $id
    common.schema.json  # Text, Spoken, Image, Uuid, Key, AssetHash, ColorToken
    topic.schema.json · lesson.schema.json · block.schema.json
    quiz-item.schema.json · vocab-term.schema.json · collectible.schema.json
  src/                  # zod khớp 1:1 với schema/, export kiểu TS
  fixtures/valid/discoverer/an-uong-lanh-manh/topic.json
  fixtures/valid/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json
  fixtures/invalid/     # mỗi file sai đúng một lỗi
  scripts/validate.mjs
  ```
- Thư mục `test-vectors/` trong gói này thuộc SK-003 (tester); dev không tạo, không sửa.
- Fixture bài mẫu dựng từ nội dung canvas: chữ đã có liệt kê ở SK-002 mục "Nội dung đã có trên canvas". Câu quiz 1–4 và 3 ý chính chưa có trên canvas: dùng chữ giữ chỗ `[SK-002]`, đủ cấu trúc để qua validate. Dev không tự soạn nội dung.
- `validate`:
  - `node scripts/validate.mjs <file|thư mục>...` (và `npm run validate` = chạy trên `fixtures/valid`); chạy thẳng bằng `node`, không cần bước build. Nếu viết TS thì dựa vào type stripping của Node và ghi phiên bản trong `engines.node`.
  - Nhận biết loại file qua trường gốc `kind` (`topic` · `lesson`).
  - Kiểm mỗi file bằng **cả** Ajv (JSON Schema) **và** zod; hai bên phải cùng kết luận, lệch nhau là lỗi `parity`.
  - Kiểm chéo giữa các file được đưa vào: `lesson.topic_id` có trong một topic; `misconception_id` có trong `misconceptions` của topic đó; mọi UUID duy nhất; mọi `key` duy nhất trong phạm vi của nó; các tham chiếu bằng `key` trong bài trỏ tới thứ có thật.
  - Báo lỗi dạng `<file> <JSON pointer> <thông báo>`; exit 0 khi sạch, 1 khi có lỗi.
  - Cờ `--require-assets`: bắt buộc mọi `Spoken` có `audio.en` và `audio.vi`, mọi `Image` có `asset`. Mặc định tắt, vì lúc soạn chưa có TTS và hình (B8.0 chạy `tts`, `assets` sau).

### Hợp đồng trường v1
Tên trường `snake_case` tiếng Anh. SK-002 dựng khung markdown theo đúng bảng này; đổi tên hay thêm bớt trường nào thì ghi vào "Quyết định đã ghi" ở đây **và** báo trong SK-002.

**Kiểu dùng chung**

| Kiểu | Hình dạng |
| --- | --- |
| `Text` | `{ en, vi }`, cả hai là chuỗi không rỗng. Dùng cho chữ nội bộ hoặc cho phụ huynh |
| `Spoken` | `Text` + `audio?: { en?: AssetHash, vi?: AssetHash }`. Dùng cho mọi chữ trẻ thấy hoặc nghe |
| `Image` | `{ alt: Text, brief?: string, asset?: AssetHash }`. `brief` là gợi ý hình cho hoạ sĩ (VI), bỏ đi khi build gói |
| `AssetHash` | sha256 hex, `^[0-9a-f]{64}$` |
| `Uuid` | UUID chữ thường. Cấp một lần, không đổi qua các lần publish (B4.2) |
| `Key` | `^[a-z][a-z0-9_]{0,39}$`, duy nhất trong bài (với misconception: trong chủ đề). Dùng để tham chiếu **trong cùng một file** |
| `ColorToken` | `do_son` · `vang_hoe` · `gi_dong` · `cham` · `nau_dat`. Tên tạm theo màu style E, đồng bộ lại khi có `packages/design-tokens` |

**Topic** (`kind: "topic"`): `schema_version` (= 1), `id`, `slug` (trùng tên thư mục), `age_group` (`explorer` · `discoverer` · `scientist`), `order`, `title: Spoken`, `question?: Spoken` (câu hỏi lớn trên màn Chủ đề), `strand` (`plants_animals` · `living_environment` · `humans_health` · `materials` · `energy_forces` · `earth_sky`), `level` (1–5), `difficulty: { abstraction, prior_knowledge, misconception, vocabulary, science_skill }` (mỗi ô 1–3, rubric syllabus-progression mục 3), `prerequisite_topic_ids: Uuid[]`, `is_free`, `oak_unit_ref?` (nội bộ, không bao giờ hiện cho trẻ), `sensitive` (mặc định false), `archived` (mặc định false), `ai_draft` (mặc định false), `misconceptions: Misconception[]`.

**Misconception**: `id`, `key`, `statement: Text`, `correction: Text`, `note?`.

**Lesson** (`kind: "lesson"`): `schema_version`, `id`, `topic_id`, `slug`, `order`, `stage` (`opener` · `core` · `apply` · `review`), `title: Spoken`, `objective: Spoken` ("I can…"), `key_points: Spoken[3]`, `est_minutes`, `sensitive`, `archived`, `ai_draft`, `warmup: QuizItem[0..3]`, `learn: LearnBlock[1..]`, `play: PlayBlock` (đúng 1), `quiz: QuizItem[6]` (đúng 6), `vocab: VocabTerm[4..8]`, `reward: { collectible?: Collectible }`.

**Block** (mọi block): `id`, `key`, `type`, `version` (số nguyên ≥ 1), `min_app_version?`; các trường riêng nằm phẳng cạnh `type` như ví dụ ở B4.2 (không bọc trong `data`). v1 có 4 type:

| `type` | Nhóm | Trường riêng |
| --- | --- | --- |
| `explore_groups` | learn | `prompt: Spoken`, `groups[2..6]: { key, label: Spoken, color: ColorToken, sentence: Spoken, image?: Image, examples: Spoken[1..4] }`, `complete_when: "all_seen"` |
| `sentence_card` | learn | `text: Spoken`, `image?: Image` |
| `word_list` | learn | `title?: Spoken`, `term_keys: Key[]` (trỏ vào `vocab` của bài) |
| `build_tray` | play | `prompt: Spoken`, `capacity`, `groups[]: { key, label: Spoken, color: ColorToken, role: "required" \| "limit" \| "neutral" }`, `items[]: { key, label: Spoken, group: Key, image?: Image }`, `messages: { start, full, balanced, has_limited: Spoken, missing: { <group key>: Spoken } }`, `success_when: "all_required_and_no_limit"` |

**QuizItem** (chung): `id`, `key`, `format`, `version`, `dok` (1–3), `prompt: Spoken`, `instruction?: Spoken`, `image?: Image`, `hint: Spoken`, `explanation_correct: Spoken`, `explanation_wrong: Spoken`, `misconception_id?: Uuid`, `p_correct?` (0–1, điền sau beta), `recall_from?` (bắt buộc với câu ở `warmup`, cấm ở `quiz`): `{ kind: "prior_knowledge", note: Text }` hoặc `{ kind: "lesson", lesson_id: Uuid }`. Trường theo `format`:

| `format` | Trường đáp án |
| --- | --- |
| `single_choice` | `options[2..6]: { key, label: Spoken, image?: Image, correct: bool }`, đúng 1 `correct` |
| `multi_choice` | `options[2..8]`, ít nhất 1 đúng và ít nhất 1 sai |
| `true_false` | `answer: bool`, `statement?: Spoken` (lời nhân vật), `speaker?: Key` (vd `na`), `labels?: { true: Spoken, false: Spoken }` |
| `fill_blank_bank` | `sentence: Spoken` có ô trống `{1}`, `{2}`… trong `en` (trong `vi` không bắt buộc), `bank[2..]: { key, label: Spoken }`, `answers: Key[]` (phần tử thứ i là đáp án ô `{i+1}`) |
| `order_sequence` | `items[3..6]: { key, label: Spoken, image?: Image }`, `answer: Key[]` (hoán vị đúng của `items`) |
| `picture_bar_chart` | `chart: { title?: Spoken, unit?: Spoken, bars[2..6]: { key, label: Spoken, image?: Image, value } }` + `options` như `single_choice` |

`fill_blank_free`, `evidence_choice` (Scientist) và `label_diagram` (GĐ 2) chưa có trong v1.

**VocabTerm**: `id`, `key`, `term: Spoken` (`en` = từ tiếng Anh, `vi` = nghĩa), `example: Spoken`, `image?: Image`, `tier` (`core` = từ mới của bài, được kiểm tra · `extra` = từ đọc thêm; mặc định `core`).

**Collectible**: `id`, `key`, `set: Key` (vd `food`), `name: Spoken`, `tag?: Spoken` (vd "Vitamin & khoáng chất"), `image: Image`, `fact: Spoken` ("Em có biết?"), `rarity` (`common` · `rare`, mặc định `common`).

## Ngoài phạm vi
- `tools/content-cli` (parse markdown, `tts`, `assets`, `build`, `publish`): ticket sau, B16 1/12 – 12/12. *(2/11: parse markdown kéo lên làm ngay ở SK-027.)*
- Quy tắc theo nhóm tuổi: phân bổ DOK, câu 1 là DOK 1, đúng 1 câu misconception, số lựa chọn 3–4, độ dài câu EN. Các quy tắc này thuộc `content-cli validate` và đọc tham số từ `content/rules.json`; v1 chỉ kiểm cấu trúc.
- Schema của `content/rules.json`, manifest, `pack.json`.
- Model Swift/Kotlin. MVP không codegen (B3); model viết tay ở sprint 1.
- Badge, thử thách tuần, các block của Explorer và Scientist (`hotspot_image`, `timeline_slider`, `sort_into_groups`, `fair_test`, `label_diagram`).

## Tiêu chí nghiệm thu
- [x] Trên máy sạch: `cd packages/content-schema && npm install && npm run validate` → exit 0, in số file hợp lệ (topic + lesson mẫu).
- [x] `fixtures/invalid/` có ít nhất 10 file, mỗi file sai đúng một lỗi: quiz 5 câu; thiếu `vi` ở một `Spoken`; UUID sai dạng; `single_choice` có 2 đáp án đúng; `multi_choice` không có đáp án đúng; `type` block lạ; `Image` thiếu `alt`; `misconception_id` không có trong topic; UUID trùng; `vocab` 9 từ; `key_points` 2 ý; câu `warmup` thiếu `recall_from`. `npm test` chạy từng file và xác nhận **cả Ajv lẫn zod** đều từ chối, đúng JSON pointer mong đợi. *(19 file. Hai ca `misconception_id` và UUID trùng là luật kiểm chéo: Ajv và zod cùng nhận hình dạng, bước kiểm chéo từ chối đúng pointer; xem quyết định 14.)*
- [x] Test parity: với mọi fixture, kết quả Ajv = kết quả zod.
- [x] `node scripts/validate.mjs --require-assets fixtures/valid` → exit 1 và liệt kê từng chuỗi thiếu audio hoặc hình thiếu `asset`; có test cho trường hợp đủ asset (hash giả hợp lệ) → exit 0.
- [x] Thông báo lỗi có tên file và JSON pointer, đọc được, không phải stack trace.
- [x] Mọi trường trong bảng "Hợp đồng trường v1" có trong cả JSON Schema và zod. Chỗ nào lệch thì đã ghi lý do ở "Quyết định đã ghi" và báo sang SK-002. *(Không đổi tên, không bỏ trường nào; các bổ sung ở quyết định 9–13. Chưa ghi vào file SK-002 vì phiên này chỉ được sửa SK-001; nhờ điều phối chuyển.)*
- [x] README của gói: cách chạy, bảng trường, cách thêm một block type mới (schema + zod + fixture + invalid fixture).
- [x] **Khi SK-002 sang `review`:** cập nhật fixture bài mẫu cho khớp 1:1 với `content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md` và `_topic.md` (chép tay, chưa có parser), bỏ hết chữ `[SK-002]`, chạy `npm run validate` → exit 0. Lỗi do nội dung ghi vào SK-002 cho content-editor sửa; lỗi do schema thì dev sửa ở đây. *(28/10: đã chép 1:1 và đối chiếu từng giá trị: topic khớp 25/25, bài khớp 520/520. Không còn `[SK-002]`. `npm run validate` exit 0. Không có lỗi nội dung. Một chỗ sửa ở schema: quyết định 12.)*
- [x] Không đổi file nào ngoài `packages/content-schema/` (trừ ghi chú trong ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- Không chờ ticket nào; chạy song song với SK-002, SK-003, SK-004.
- SK-002 dựng khung markdown theo "Hợp đồng trường v1"; SK-003 dùng tên `format`, `options[].key`, `correct`, `answer`, `answers` của bảng này làm input test vector. Đổi tên trường thì báo cả hai ticket.
- Bước nghiệm thu cuối cần file markdown của SK-002.

**Quyết định đã ghi** (PM đề xuất 28/10 để làm được ngay; Duy xác nhận khi review)
1. Trường của block nằm phẳng cạnh `type` như ví dụ B4.2; GĐ 2 CMS lưu phần còn lại vào `cms_blocks.data`.
2. Audio gắn vào từng chuỗi `Spoken`. Bỏ trường `audio` riêng của quiz_item ở B4.2 vì trùng.
3. `hint` và `explanation_*` lưu đủ cả `en` và `vi` (B4.2 ghi "thường là VI"). App chọn thứ tiếng hiển thị theo `language_mode`, vì chế độ EN-first vẫn cần gợi ý tiếng Anh.
4. Tham chiếu trong cùng file dùng `key`, tham chiếu sang file khác (`topic_id`, `misconception_id`, `prerequisite_topic_ids`, `recall_from.lesson_id`) dùng UUID.
5. Misconception đặt ở cấp topic, theo `cms_misconceptions.topic_id` ở B5.2.
6. Câu khởi động soạn sẵn của bài (`warmup`) phải có `recall_from`. Bài 1 trên canvas có 2 câu "nhớ lại kiến thức nền", nên `prior_knowledge` là hợp lệ. Cách app chọn câu khởi động lúc chạy nằm ở SK-003.
7. Thêm `vocab.tier`: syllabus-progression mục 8 cho Discoverer 3–4 từ mới mỗi bài, trong khi canvas Từ vựng có 8 từ.
8. Thêm `kind` và `schema_version` ở gốc file để `validate` nhận loại file.

Dev ghi thêm ngày 28/10 khi implement. Không đổi tên và không bỏ trường nào của bảng; SK-003 dùng nguyên `format`, `options[].key`, `correct`, `answer`, `answers`, `items`.

9. **Cờ của lesson.** `sensitive`, `archived`, `ai_draft` của lesson không bắt buộc, mặc định `false`, giống Topic. Bảng không ghi "mặc định" cho lesson, nhưng giữ một luật cho cả hai loại file. Khung SK-002 vẫn ghi `sensitive` và `ai_draft` trong frontmatter như đã định.
10. **Kiểu dùng chung thêm vào** (chỉ là tên kiểu, không đổi trường nào):
    - `NonEmptyString`: chuỗi có ít nhất một ký tự không phải khoảng trắng. Đây là cách hiểu "không rỗng".
    - `Slug`: `^[a-z0-9]+(-[a-z0-9]+)*$`, dùng cho `slug`.
    - `AppVersion`: `MAJOR.MINOR.PATCH`, dùng cho `min_app_version`.
    - `SchemaVersion` (= 1) và `SpokenAudio`.
11. **Ràng buộc bảng chưa ghi.** Dev chọn mức tối thiểu:
    - `order`, `est_minutes`, `version`, `capacity` là số nguyên ≥ 1; `bars[].value` ≥ 0.
    - `build_tray.groups` và `items` có ≥ 1 phần tử; `messages.missing` có ≥ 1 mục.
    - `word_list.term_keys` có ≥ 1 phần tử và không trùng. `prerequisite_topic_ids` và `order_sequence.answer` không trùng. `fill_blank_bank.answers` có ≥ 1 phần tử.
    - `brief`, `note`, `oak_unit_ref` không rỗng.
    - Mọi object đều đóng: trường lạ là lỗi.
12. **Phạm vi `key`** (sửa 28/10 sau SK-002). Mọi `key` duy nhất trong cả bài, kể cả key con (`options`, `groups`, `items`, `bank`, `bars`), đúng chữ của hợp đồng ("duy nhất trong bài") và quy ước `q5_egg`, `tray_egg` của `content/TEMPLATE.md`. Misconception: duy nhất trong topic.
    - Bản đầu của dev cho mỗi danh sách con một phạm vi riêng. Bỏ cách đó vì khung SK-002 đã đặt key con theo key cha, nên không còn lo đụng tên.
13. **Kiểm chéo thêm** ngoài danh sách của ticket:
    - Các ô `{n}` của `fill_blank_bank` khớp với `answers`.
    - `order_sequence.answer` là hoán vị của `items`.
    - `build_tray`: mỗi món trỏ tới một nhóm có thật; `missing` có lời nhắc cho đúng các nhóm `required`; `capacity` không nhỏ hơn số nhóm `required`.
    - File `topic.json` có `slug` trùng tên thư mục.
    - Không tự tham chiếu ở `prerequisite_topic_ids` và `recall_from.lesson_id`. Hai trường này chưa đối chiếu với file có thật, vì file đích thường không nằm trong bộ file đang kiểm.
14. **Hai ca kiểm chéo trong danh sách.** "`misconception_id` không có trong topic" và "UUID trùng" là luật giữa các phần của một file hoặc giữa các file; JSON Schema không diễn đạt được. Test xác nhận Ajv và zod **cùng nhận** hình dạng, và bước kiểm chéo từ chối đúng pointer (`stage: refs`). 10 ca còn lại của danh sách thì cả hai cùng từ chối (`stage: schema`).
15. **Cách gọi `validate`.**
    - Kiểm một bài lẻ phải đưa kèm `topic.json`; nếu không sẽ có lỗi `/topic_id`.
    - Lỗi cấp file (JSON hỏng…) in pointer là `/`.
    - Exit 2 khi sai cách gọi hoặc Node quá cũ (ticket chỉ định exit 0 và 1).
16. **`$id`.** Tạm dùng `https://science-kids.example/schema/content/v1/<tên>.schema.json`. `.example` là domain dành cho ví dụ; ở đây nó chỉ là định danh.
17. **Công cụ.**
    - Code TS chạy bằng type stripping của Node, nên `engines.node` là `^22.18.0 || >=23.6.0`.
    - zod 4.6 và Ajv 8.20 (Ajv2020, bật strict trừ `strictRequired`). TypeScript 7 chỉ dùng cho `npm run typecheck`.
    - Thư mục `fixtures/invalid/` sinh bằng `scripts/make-invalid-fixtures.mjs`. Mỗi đột biến trong script ghi tay pointer mong đợi.
18. **Fixture bài mẫu.** Bản tạm có chữ giữ chỗ `[SK-002]`. Ngày 28/10 đã thay bằng bản chép 1:1 từ markdown của SK-002.
    - UUID giữ theo vị trí của bản tạm. Danh sách 23 UUID đã ghi vào SK-002 để content-editor chép ngược vào markdown.
    - Bài mẫu không dùng `order_sequence` và `picture_bar_chart`. Hai format này được phủ ở `test/formats.test.mjs`; luật hoán vị của `order_sequence` được phủ ở `test/refs.test.mjs`.
    - Vì vậy bỏ fixture sai `order-sequence-not-permutation`; còn 19 fixture sai.

**Câu hỏi còn mở**
- `ColorToken`: canvas dùng `#8A5E3B` cho nhóm chất béo, màu này không có trong bảng màu B7.5. Tên token chốt cùng designer khi dựng `packages/design-tokens`.
- Câu "Em nghĩ sao?" của bài mở màn (syllabus-progression mục 6, không chấm điểm) chưa có chỗ trong B4. v1 chưa có; nếu Duy muốn thì thêm ở v1.1 (block học mới hoặc trường của lesson).
- UUID: biên tập không chạy được script. Đến khi có `content-cli`, dev sinh UUID cho fixture; UUID nào cần ghi ngược vào markdown thì ghi vào SK-002 để content-editor chép.
  - *(28/10)* Đã sinh đủ 23 UUID: topic, misconception, lesson, mọi `###` của bài. Danh sách nằm cuối SK-002.
- *(dev)* `build_tray` chưa có trường hình cho chính cái mâm, trong khi SK-002 yêu cầu `brief` cho "mâm cơm". Nếu hoạ sĩ cần, đề xuất thêm `image?: Image` cho `build_tray` ở v1.1; v1 chưa thêm.
- *(dev)* Thứ tự xét `messages.missing`: SK-002 đề xuất app xét theo thứ tự key trong map, nhưng Swift `Codable` không giữ thứ tự của `Dictionary`. Có hai hướng, cần chốt: app xét theo thứ tự `groups`, hoặc v1.1 đổi `missing` thành danh sách có thứ tự. Đã ghi vào SK-002.
- *(dev)* `true_false` không có `labels` thì app dùng nhãn mặc định Đúng/True · Sai/False. Các nhãn này cũng cần audio. Cần chốt chúng nằm trong app hay trong `rules` của manifest.
- *(dev, cho PM)* `syllabus-progression.md` dòng 365 ghi `difficulty: {abstraction, prerequisites, misconception, language, skills, total}`, khác bảng ở đây (`prior_knowledge`, `vocabulary`, `science_skill`, không có `total`). Schema theo bảng của ticket.

## Ghi chú của dev (28/10)

**File** (mọi file nằm trong `packages/content-schema/`)
- `package.json`, `package-lock.json`, `.gitignore`, `tsconfig.json`, `README.md`.
- `schema/`: 7 file `*.schema.json`.
- `src/`: 7 file `.ts` khớp `schema/`, cùng `index.ts`.
- `scripts/validate.mjs` (CLI), `scripts/lib/` (`ajv`, `zod`, `refs`, `core`, `pointer`), `scripts/make-invalid-fixtures.mjs`.
- `fixtures/valid/discoverer/an-uong-lanh-manh/{topic,01-thuc-an-cho-ta-nhung-gi}.json` (chép từ SK-002) và 19 file `fixtures/invalid/*.json`.
- `test/`: 7 file `*.test.mjs`, `helpers.mjs`, `invalid-fixtures.json`.
- Không đụng `test-vectors/` (SK-003).

**Kết quả chạy thật** (Node v24.18.0, npm 11.16.0, sau khi xoá `node_modules`)
```
$ npm install                 → found 0 vulnerabilities (exit 0)
$ npm run validate            → OK: 2 file hợp lệ (1 topic, 1 lesson) (exit 0)
$ node scripts/validate.mjs --require-assets fixtures/valid
  fixtures/valid/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json /title/audio thiếu audio (cần audio.en và audio.vi)
  …
  LỖI (--require-assets): 151 lỗi ở 2 file; 0/2 file hợp lệ (0 topic, 0 lesson) (exit 1)
$ npm test                    → tests 99 · pass 99 · fail 0 (exit 0)
$ npm run typecheck           → exit 0
```

Chạy lại ngày 28/10, sau khi chép SK-002 (fixture thật, key duy nhất trong cả bài, 19 fixture sai):
```
$ npm run validate            → OK: 2 file hợp lệ (1 topic, 1 lesson) (exit 0)
$ node scripts/validate.mjs --require-assets fixtures/valid
                              → LỖI (--require-assets): 164 lỗi ở 2 file; 0/2 file hợp lệ (exit 1)
$ npm test                    → tests 98 · pass 98 · fail 0 (exit 0)
$ npm run typecheck           → exit 0
```

**`npm test` kiểm những gì**
- 19 fixture sai: mỗi file đúng 1 lỗi, đúng pointer, đúng stage.
- Parity trên mọi fixture: cùng kết luận và cùng pointer. Với `--require-assets`: cùng kết luận, và zod không báo pointer nào Ajv không báo.
- Mutation sweep: hơn 1000 đột biến một điểm của bài mẫu (xoá trường, sai kiểu, trường lạ, chuỗi rỗng, số ngoài khoảng…), cả hai chế độ, Ajv và zod luôn cùng kết luận.
- Bảng "Hợp đồng trường v1" chép tay trong `test/contract.test.mjs`, so với cả JSON Schema và zod: trường, bắt buộc/tuỳ chọn, enum, discriminator.
- `--require-assets` so với một oracle độc lập. Có ca đủ asset (hash giả hợp lệ) → exit 0.
- Mọi luật kiểm chéo; CLI không in stack trace.

**Việc tester cần kiểm**
- Chạy lại trên máy sạch (nếu được thì cả Node 22.18): `rm -rf node_modules && npm install && npm run validate && npm test && npm run typecheck`.
- Đối chiếu từng dòng `CONTRACT` trong `test/contract.test.mjs` với bảng "Hợp đồng trường v1" ở trên. Đây là oracle chép tay, nên cần một người thứ hai đọc.
- Xem pointer mong đợi trong `scripts/make-invalid-fixtures.mjs` / `test/invalid-fixtures.json` có hợp lý không. Thêm ca sai nếu thấy thiếu: thêm đột biến vào script rồi chạy lại script.
- Đọc thử thông báo lỗi của vài file sai: có hiểu được không khi không đọc code.
- Xác nhận tên trường đáp án mà SK-003 dùng không đổi.

## Kết quả kiểm (tester, 28/10)

**Kết luận:** đạt mọi tiêu chí nghiệm thu. Không có lỗi chặn và không có lỗi; có 7 góp ý ở dưới.

**Chạy thật** (Node v24.18.0, npm 11.16.0, từ `packages/content-schema`)
```
$ rm -rf node_modules && npm install      → found 0 vulnerabilities (exit 0)
$ npm run validate                         → OK: 2 file hợp lệ (1 topic, 1 lesson) (exit 0)
$ npm test                                 → tests 98 · pass 98 · fail 0 (exit 0)
$ npm run typecheck                        → exit 0
$ node scripts/validate.mjs --require-assets fixtures/valid → LỖI (--require-assets): 164 lỗi ở 2 file (exit 1)
Node 23.11.0: validate exit 0, node --test 98/98 pass
Node 22.15.0 và 20.x: "Cần Node ^22.18.0 hoặc >= 23.6.0 …" (exit 2)
```
- Chạy `make-invalid-fixtures.mjs` trên một bản sao gói: `fixtures/invalid/` và `test/invalid-fixtures.json` sinh ra giống hệt bản trong repo.
- **CONTRACT** (`test/contract.test.mjs:15–51`) đối chiếu từng dòng với bảng "Hợp đồng trường v1": khớp tên trường, bắt buộc hay tuỳ chọn, enum, `ColorToken` và discriminator. Oracle không kiểm kiểu và biên, nên tester đọc thẳng `$defs` của schema. Mọi kiểu `Spoken`/`Text`/`Image`/`Uuid`/`Key` và mọi biên đều đúng bảng: `level` 1–5, ô `difficulty` 1–3, `key_points` 3, `warmup` 0–3, `quiz` 6, `vocab` 4–8, `groups` 2–6, `examples` 1–4, số lựa chọn 2–6/2–8, `items` 3–6, `bars` 2–6, `dok` 1–3, `p_correct` 0–1.
- **Pointer của 19 fixture sai:** hợp lý. Mỗi pointer trỏ đúng trường gây lỗi. Ca trùng (UUID, key) trỏ vào lần xuất hiện thứ hai và nêu lần đầu ở thông báo.
- **Thông báo lỗi:** đọc 19 file sai và 16 file hỏng do tester tạo (rỗng, `null`, mảng, BOM, dấu phẩy thừa, `quiz` là object, phần tử `null`, `kind` viết hoa, file `.md`, đường dẫn không có). Không file nào in stack trace. Thông báo hiểu được khi không đọc code, ví dụ `/quiz cần đúng 6 phần tử, đang có 5`, `/vocab/1/id UUID … trùng với /vocab/0/id`.
- Các luật kiểm chéo thêm cũng bắt đúng: `answers` trỏ key ngoài `bank`, `{1}…{3}` nhảy số, `recall_from.lesson_id` trỏ chính bài, `prerequisite_topic_ids` chứa chính chủ đề, misconception trùng key, `missing` cho nhóm `limit`, `capacity` nhỏ hơn số nhóm bắt buộc, key con trùng giữa hai câu.
- Tên trường đáp án mà SK-003 dùng không đổi: `check-vectors.mjs` đối chiếu 240 trường của 33 item với `schema/quiz-item.schema.json`, và validate từng item như một câu SK-001.

**Góp ý**
1. **Ajv và zod lệch nhau với số nguyên lớn hơn 2^53.** Ajv nhận, `z.int()` từ chối, nên validate báo lỗi `parity` thay vì một lỗi nội dung.
   - Tái hiện: trong bản sao bài mẫu đặt `"order": 9007199254740993` (hoặc `1e21`), chạy `node scripts/validate.mjs <topic.json> <bài>`.
   - Thực tế: `/order parity: JSON Schema chấp nhận nhưng zod từ chối: Quá lớn: mong đợi int <=9007199254740991`. Mong đợi: hai bên cùng từ chối.
   - File: `schema/lesson.schema.json:26–29` và mọi trường số nguyên (`order`, `est_minutes`, `version`, `capacity`, `level`).
   - Gợi ý sửa: thêm `maximum` vào schema. Mutation sweep chưa có đột biến số rất lớn.
2. **`NonEmptyString` nhận chuỗi chỉ có ký tự vô hình.** Ví dụ U+200B (zero-width space): `\S` coi đó là một chữ.
   - Tái hiện: `title.en = "​"` → validate OK. Mong đợi: bị từ chối, vì trẻ thấy một ô trống.
   - File: `schema/common.schema.json:6–10`, `src/common.ts:19`.
3. **File UTF-8 có BOM khó hiểu lỗi.** Notepad trên Windows hay lưu kiểu này.
   - Thực tế: `JSON không hợp lệ: Unexpected token '﻿', "﻿{"kind":""… is not valid JSON`. Ký tự BOM vô hình nên người đọc không thấy lỗi ở đâu.
   - File: `scripts/lib/core.mjs:65`. Gợi ý: bỏ BOM trước `JSON.parse`, hoặc báo "file có BOM".
4. **Thư mục không có file `.json` nào vẫn ra `OK: 0 file hợp lệ (0 topic, 0 lesson)`, exit 0.** CI trỏ nhầm vào thư mục rỗng vẫn xanh.
   - Tái hiện: `mkdir /tmp/rong && node scripts/validate.mjs /tmp/rong; echo $?` → 0.
   - File: `scripts/validate.mjs:48`. Gợi ý: 0 file thì exit 1 kèm thông báo.
5. **Chưa bắt hai bài cùng `order` hoặc cùng `slug` trong một topic.** Luật này ngoài danh sách của ticket.
   - Tái hiện: đưa topic cùng hai bài cùng `topic_id`, cùng `order: 1` → validate không báo lỗi về chuyện này.
   - File: `scripts/lib/refs.mjs:76` (`checkLesson`). App xếp bài theo `order`, nên trùng `order` làm thứ tự bài mơ hồ.
6. **CONTRACT chỉ là oracle tên trường.** Đề xuất thêm kiểu (`Spoken` hay `Text`) và biên vào `test/contract.test.mjs` để máy giữ phần tester vừa đọc tay.
7. **Node 23.x in cảnh báo ra stderr mỗi lần chạy:** `ExperimentalWarning: Type Stripping is an experimental feature`. Không sai, nhưng biên tập dễ tưởng là lỗi. Gợi ý: ghi vào README, hoặc chạy với `--disable-warning=ExperimentalWarning`.
