# @science-kids/content-schema

Content schema v1 của Science Kids: hợp đồng dữ liệu cho file chủ đề (`topic.json`) và file bài (`<nn>-<slug>.json`). Ticket: [SK-001](../../docs/backlog/SK-001-content-schema-v1.md). Nguồn kiến trúc: `technical-plan.md` B4.1–B4.3.

- `schema/*.schema.json`: **nguồn**. JSON Schema draft 2020-12, mỗi file có `$id`. Model Swift/Kotlin viết tay theo đây (B3).
- `src/*.ts`: zod khớp 1:1 (cùng tên `$defs`, cùng trường, cùng luật) và kiểu TS (`z.infer`). Dùng cho CLI và CMS sau này.
- `scripts/validate.mjs`: kiểm file bằng **cả** Ajv và zod, hai bên phải cùng kết luận, sau đó kiểm chéo giữa các file.

`$id` có dạng `https://science-kids.example/schema/content/v1/<tên>.schema.json`. Đây chỉ là định danh, không tải qua mạng; đổi sang domain thật khi có.

## Chạy

Cần Node `^22.18.0` hoặc `>= 23.6.0`. Code `.ts` chạy thẳng nhờ type stripping của Node, không có bước build.

```sh
cd packages/content-schema
npm install
npm run validate            # = node scripts/validate.mjs fixtures/valid
npm test                    # node --test test/*.test.mjs
npm run typecheck           # tsc --noEmit trên src/
```

```sh
node scripts/validate.mjs [--require-assets] <file|thư mục>...
```

- Thư mục được duyệt đệ quy, lấy mọi `*.json` (bỏ thư mục `.xxx` và `node_modules`).
- Loại file lấy từ trường gốc `kind`: `topic` hoặc `lesson`.
- Kiểm một bài lẻ thì đưa kèm `topic.json` của chủ đề, nếu không sẽ báo lỗi `/topic_id`.
- `--require-assets`: bắt buộc mọi `Spoken` có `audio.en` và `audio.vi`, mọi `Image` có `asset`. Mặc định tắt, vì lúc soạn chưa có TTS và hình.
- Mỗi lỗi một dòng: `<file> <JSON pointer> <thông báo>`. Lỗi ở cấp file (JSON hỏng, không phải object) in pointer là `/`. Dòng có thông báo bắt đầu bằng `parity:` nghĩa là Ajv và zod lệch nhau; đó là lỗi của schema chứ không phải của nội dung.
- Exit `0` = sạch, `1` = có lỗi nội dung, `2` = sai cách gọi hoặc Node quá cũ.

Dùng từ code (content-cli sau này):

```ts
import { Lesson, type Topic } from "@science-kids/content-schema";
import { validateDocuments } from "@science-kids/content-schema/validate";
import { validateSyllabus } from "@science-kids/content-schema/syllabus";   // content/syllabus.json, SK-030
```

## Cách kiểm

1. **JSON** đọc được và gốc là object có `kind` hợp lệ.
2. **Schema**: Ajv trên `schema/` và zod trên `src/`. Thông báo in ra lấy từ Ajv. Nếu một bên nhận, một bên từ chối thì thêm lỗi `parity`.
3. **Kiểm chéo** (`scripts/lib/refs.mjs`). Bước này chỉ chạy trên file đã qua bước 2, vì JSON Schema không diễn đạt được các luật này:
   - Mọi `id` (UUID) duy nhất trên mọi file được đưa vào.
   - `key` duy nhất trong cả bài, kể cả key con (`options`, `groups`, `items`, `bank`, `bars`), theo quy ước `q5_egg`, `tray_egg` của `content/TEMPLATE.md`. Trong topic: key của `misconceptions`.
   - `lesson.topic_id` trỏ tới một topic trong các file được đưa vào. `misconception_id` có trong `misconceptions` của topic đó.
   - `word_list.term_keys` có trong `vocab`. `fill_blank_bank.answers` có trong `bank`. `order_sequence.answer` là hoán vị của `items`. `build_tray.items[].group` có trong `groups`.
   - `fill_blank_bank`: ô trống trong `sentence.en` đánh số `{1}…{n}`, mỗi số một lần, và `answers` có đúng `n` phần tử. Ô trống trong `vi` là tuỳ chọn, nhưng không được vượt quá `n`.
   - `build_tray`: có ít nhất 1 nhóm `required`. Mỗi nhóm `required` có một lời nhắc trong `messages.missing`, và `missing` chỉ chứa nhóm `required`. `capacity` không nhỏ hơn số nhóm `required`.
   - File tên `topic.json` có `slug` trùng tên thư mục. Topic không là điều kiện của chính nó. `recall_from.lesson_id` không trỏ vào chính bài đó.
   - Chưa kiểm ở v1 (cần cả kho nội dung): `prerequisite_topic_ids` và `recall_from.lesson_id` có trỏ tới file có thật không.

Luật theo nhóm tuổi (format được dùng, số lựa chọn, hình bắt buộc, phân bổ DOK, câu 1 là DOK 1, số câu misconception, số format, số từ mỗi câu) **không** nằm ở đây: schema giữ chung cho mọi nhóm. Chúng thuộc `content-cli validate` (và `build`), đọc `rules.<age_group>.authoring` trong `content/rules.json` theo `age_group` của topic. Mã lỗi, cách chạy và bảng format → bản app: [`tools/content-cli/README.md`, mục "validate: luật theo nhóm tuổi"](../../tools/content-cli/README.md#validate-luật-theo-nhóm-tuổi) (SK-026).

## Bảng trường v1

`?` là trường tuỳ chọn. `= x` là mặc định khi bỏ trống. Tên trường dùng `snake_case`.

**Kiểu dùng chung** (`common.schema.json`)

| Kiểu | Hình dạng |
| --- | --- |
| `NonEmptyString` | chuỗi có ít nhất một ký tự không phải khoảng trắng |
| `Text` | `{ en, vi }`, không có trường khác. Dùng cho chữ nội bộ hoặc cho phụ huynh, không có audio |
| `Spoken` | `{ en, vi, audio?: { en?: AssetHash, vi?: AssetHash } }`. Dùng cho mọi chữ trẻ thấy hoặc nghe |
| `Image` | `{ alt: Text, brief?: string, asset?: AssetHash }`. `brief` chỉ ở nguồn (có "Từ khoá tìm ảnh (EN): …" cho `content-cli images search`), `build` bỏ khỏi gói. `asset` = sha256 của `assets/<sha256>.jpg` trong gói: `content-cli build` điền từ file chọn ảnh `content/images/…` (SK-033), không viết tay |
| `AssetHash` | `^[0-9a-f]{64}$` (sha256 hex) |
| `Uuid` | UUID chữ thường, `8-4-4-4-12` |
| `Key` | `^[a-z][a-z0-9_]{0,39}$` |
| `Slug` | `^[a-z0-9]+(-[a-z0-9]+)*$` |
| `AppVersion` | `MAJOR.MINOR.PATCH` |
| `ColorToken` | `do_son` · `vang_hoe` · `gi_dong` · `cham` · `nau_dat` |

**Topic** (`topic.schema.json`, `kind: "topic"`)

| Trường | Kiểu |
| --- | --- |
| `kind`, `schema_version` | `"topic"`, `1` |
| `id` | Uuid |
| `slug` | Slug, trùng tên thư mục |
| `age_group` | `explorer` · `discoverer` · `scientist` |
| `order` | số nguyên ≥ 1 |
| `title`, `question?` | Spoken |
| `strand` | `plants_animals` · `living_environment` · `humans_health` · `materials` · `energy_forces` · `earth_sky` |
| `level` | 1–5 |
| `difficulty` | `{ abstraction, prior_knowledge, misconception, vocabulary, science_skill }`, mỗi ô 1–3 |
| `prerequisite_topic_ids` | Uuid[], không trùng |
| `is_free` | boolean |
| `oak_unit_ref?` | chuỗi, chỉ dùng nội bộ |
| `sensitive?`, `archived?`, `ai_draft?` | boolean `= false` |
| `misconceptions` | `{ id, key, statement: Text, correction: Text, note? }[]` |

**Lesson** (`lesson.schema.json`, `kind: "lesson"`)

| Trường | Kiểu |
| --- | --- |
| `kind`, `schema_version` | `"lesson"`, `1` |
| `id`, `topic_id` | Uuid |
| `slug` | Slug |
| `order` | số nguyên ≥ 1 |
| `stage` | `opener` · `core` · `apply` · `review` |
| `title`, `objective` | Spoken |
| `key_points` | Spoken[], đúng 3 |
| `est_minutes` | số nguyên ≥ 1 |
| `sensitive?`, `archived?`, `ai_draft?` | boolean `= false` |
| `warmup` | QuizItem[0..3], mỗi câu **bắt buộc** có `recall_from` |
| `learn` | LearnBlock[1..] |
| `play` | PlayBlock (đúng 1) |
| `quiz` | QuizItem[], đúng 6, **không** câu nào có `recall_from` |
| `vocab` | VocabTerm[4..8] |
| `reward` | `{ collectible?: Collectible }` |

**Block** (`block.schema.json`). Trường chung: `id`, `key`, `type`, `version` (≥ 1), `min_app_version?`. Trường riêng nằm phẳng cạnh `type`.

| `type` | Nhóm | Trường riêng |
| --- | --- | --- |
| `explore_groups` | learn | `prompt`, `groups[2..6]: { key, label, color: ColorToken, sentence, image?, examples: Spoken[1..4] }`, `complete_when: "all_seen"` |
| `sentence_card` | learn | `text`, `image?` |
| `word_list` | learn | `title?`, `term_keys: Key[1..]` (không trùng) |
| `build_tray` | play | `prompt`, `capacity` (≥ 1), `groups[1..]: { key, label, color, role: required · limit · neutral }`, `items[1..]: { key, label, group: Key, image? }`, `messages: { start, full, balanced, has_limited, missing: { <key nhóm>: Spoken } }`, `success_when: "all_required_and_no_limit"` |

**QuizItem** (`quiz-item.schema.json`). Trường chung: `id`, `key`, `format`, `version` (≥ 1), `dok` (1–3), `prompt`, `instruction?`, `image?`, `hint`, `explanation_correct`, `explanation_wrong`, `misconception_id?`, `p_correct?` (0–1), `recall_from?`. Trong đó `recall_from` là `{ kind: "prior_knowledge", note: Text }` hoặc `{ kind: "lesson", lesson_id: Uuid }`.

| `format` | Trường đáp án |
| --- | --- |
| `single_choice` | `options[2..6]: { key, label, image?, correct }`, đúng 1 `correct: true` |
| `multi_choice` | `options[2..8]`, ít nhất 1 đúng và 1 sai |
| `true_false` | `answer: boolean`, `statement?`, `speaker?: Key`, `labels?: { true, false }` |
| `fill_blank_bank` | `sentence` (ô `{1}`, `{2}`… trong `en`), `bank[2..]: { key, label, image? }`, `answers: Key[1..]` |
| `order_sequence` | `items[3..6]: { key, label, image? }`, `answer: Key[]` (hoán vị của `items`) |
| `picture_bar_chart` | `chart: { title?, unit?, bars[2..6]: { key, label, image?, value ≥ 0 } }` + `options` như `single_choice` |

**VocabTerm**: `id`, `key`, `term` (`en` = từ, `vi` = nghĩa), `example`, `image?`, `tier?` (`core` · `extra`, `= core`).
**Collectible**: `id`, `key`, `set: Key`, `name`, `tag?`, `image`, `fact`, `rarity?` (`common` · `rare`, `= common`).

Mọi object đều đóng: trường không có trong bảng là lỗi.

## Danh mục syllabus (`syllabus.schema.json`, SK-030)

`content/syllabus.json`: mọi nhóm tuổi, chủ đề và bài theo thứ tự đã duyệt, app iOS đọc từ bundle ([SK-030](../../docs/backlog/SK-030-full-syllabus-no-lock.md)). Không có trường `kind`; file nhận ra theo tên. Chỉ có JSON Schema (Ajv), chưa có bản zod (thêm khi CMS cần).

| Kiểu | Trường |
| --- | --- |
| `Syllabus` | `schema_version` (= 1), `syllabus_version` (`YYYY-MM-DD`), `ai_draft?`, `source?`, `groups: SyllabusGroup[1..]` |
| `SyllabusGroup` | `age_group` (enum của Topic), `oak_years: int[1..]` (1–6, không trùng), `topics: SyllabusTopic[1..]` |
| `SyllabusTopic` | `key` (Slug), `number` (≥ 1), `title: Text` (luôn đủ en, vi), `strand` (enum của Topic), `level` (1–5 hoặc `null`), `source`, `topic_id?` (Uuid), `lessons: SyllabusLesson[1..]` |
| `source` | `{ kind: "oak", unit_slug, year (1–6), unit_index (≥ 1) }` hoặc `{ kind: "new" }` |
| `SyllabusLesson` | `number` (≥ 1), `title: { en, vi }` (`vi` là chuỗi hoặc `null` khi chưa dịch, phải có mặt), `oak_lessons: Slug[]` (không trùng), `statutory`, `sensitive?`, `lesson_id?` (Uuid) |

`age_group` và `strand` là `$ref` vào `topic.schema.json`, nên đổi enum ở Topic là syllabus theo. Kiểu `null` chỉ có ở syllabus, nên Ajv của syllabus bật `allowUnionTypes` riêng.

Luật ngoài JSON Schema (`scripts/lib/syllabus.mjs`, chỉ chạy khi schema đã qua): `age_group` không trùng; `key` chủ đề duy nhất cả file; `number` chủ đề trong nhóm và bài trong chủ đề đi 1..n theo thứ tự trong file; chủ đề Oak có `key` = `source.unit_slug`, `source.year` thuộc `oak_years`, mỗi bài có ít nhất 1 slug Oak; chủ đề mới có `key` bắt đầu bằng `new-` và mọi `oak_lessons` rỗng; `topic_id`, `lesson_id`, slug lesson Oak không gắn hai lần; bài có `lesson_id` thì chủ đề phải có `topic_id`. Có danh sách nội dung (tuỳ chọn `content`) thì kiểm thêm: `topic_id` là id của một chủ đề cùng nhóm tuổi, `lesson_id` là id của một bài thuộc đúng chủ đề đó; nội dung chưa ô nào trỏ tới thì cảnh báo. Mã lỗi và cách chạy: [`tools/content-cli/README.md`, "Danh mục `syllabus.json`"](../../tools/content-cli/README.md#markdown-validate-import-ids).

```ts
import { validateSyllabus } from "@science-kids/content-schema/syllabus";
validateSyllabus(data, { content: { root: "content", topics: [{ id, slug, age_group, file }], lessons: [{ id, slug, topic_id, topic_slug, file }] } });
// -> { ok, schemaOk, refsChecked, issues: [{ pointer, code, severity, message }], counts }
```

`test/syllabus.test.mjs` kiểm mỗi luật bằng một mẫu nhỏ, rồi kiểm file thật `content/syllabus.json`: đúng schema và luật, số nhóm, chủ đề, bài theo nghiệm thu SK-030 (12, 17, 16 chủ đề; 73, 155, 156 bài), và mọi id đối chiếu với markdown trong `content/`. Markdown đọc bằng `contentIndex` của `tools/content-cli` (một parser duy nhất), nên test này cần `npm install` trong `tools/content-cli`. Duyệt lại syllabus làm đổi số chủ đề hay bài thì sửa con số trong test cùng lúc.

## Thư mục

```
schema/                 JSON Schema (nguồn); syllabus.schema.json là danh mục content/syllabus.json (SK-030)
src/                    zod + kiểu TS, mỗi file khớp một file schema
scripts/validate.mjs    CLI
scripts/lib/            ajv.mjs · zod.mjs · refs.mjs · core.mjs · pointer.mjs · syllabus.mjs
scripts/make-invalid-fixtures.mjs   sinh fixtures/invalid/ + test/invalid-fixtures.json
fixtures/valid/         bài mẫu Discoverer "Ăn uống lành mạnh", bài 1: chép tay 1:1 từ content/discoverer/an-uong-lanh-manh/ (_topic.md, 01-….md)
fixtures/invalid/       mỗi file sai đúng một lỗi (sinh bằng script, đừng sửa tay)
test/                   node:test: fixture, parity, hợp đồng trường, require-assets, kiểm chéo, CLI
test-vectors/           SK-003, thuộc tester (luật chấm điểm), không thuộc schema
```

`test/contract.test.mjs` chép tay bảng "Hợp đồng trường v1" của SK-001 và so với cả JSON Schema lẫn zod. Đổi trường thì sửa bảng này cùng lúc với schema.

Sau khi sửa bài mẫu trong `fixtures/valid/`, chạy `node scripts/make-invalid-fixtures.mjs` để sinh lại `fixtures/invalid/`. Mỗi đột biến trong script ghi tay pointer mong đợi. `test/fixtures.test.mjs` kiểm mỗi file: đúng 1 lỗi, đúng pointer, Ajv và zod cùng từ chối (`schema`), hoặc cùng chấp nhận và bị kiểm chéo bắt (`refs`).

## Thêm một block type mới

Ví dụ thêm `hotspot_image` (Explorer Học):

1. **Schema** `schema/block.schema.json`:
   - Thêm `$defs.HotspotImage`: `"$ref": "#/$defs/BlockBase"`, `properties` gồm `"type": { "const": "hotspot_image" }` và các trường riêng, `required`, `"unevaluatedProperties": false`. Có thể chép `SentenceCard` rồi sửa.
   - Thêm giá trị vào `enum` của `type` và thêm một nhánh `if`/`then` trong `Block` và `LearnBlock` (hoặc `PlayBlock`).
   - Object con nào cũng cần `"additionalProperties": false`.
2. **zod** `src/block.ts`:
   - `export const HotspotImage = BlockBase.extend({ type: z.literal("hotspot_image"), … })`.
   - Thêm vào `z.discriminatedUnion` của `Block` và `LearnBlock`/`PlayBlock`, kèm `export type`.
3. **Hợp đồng** `test/contract.test.mjs`: thêm dòng vào `CONTRACT` và giá trị vào `UNIONS`.
4. **Kiểm chéo**: nếu block có `key` trỏ sang thứ khác (như `term_keys`), thêm luật vào `scripts/lib/refs.mjs` và test vào `test/refs.test.mjs`.
5. **Fixture hợp lệ**: thêm một ca tối thiểu vào `test/formats.test.mjs`. Nếu bài mẫu thật dùng block này thì thêm cả vào `fixtures/valid/`.
6. **Fixture sai**: thêm một đột biến vào `scripts/make-invalid-fixtures.mjs` (ví dụ thiếu một trường bắt buộc, ghi pointer mong đợi), chạy script rồi chạy `npm test`. Parity và mutation sweep sẽ báo nếu Ajv và zod lệch nhau.
7. **App**: model Swift/Kotlin viết tay theo schema. App cũ gặp `type` lạ thì bỏ qua block và ghi analytics. Đặt `min_app_version` cho block nếu bản app đang phổ biến chưa render được nó.

Thêm một `format` quiz cũng theo các bước trên, sửa ở `quiz-item.schema.json` / `src/quiz-item.ts` (`QuizBase`, `QuizItem`).

Đổi kiểu phá vỡ (đổi tên, bỏ trường, thêm trường bắt buộc) thì tăng `schema_version` và báo SK-002 (khung markdown) và SK-003 (test vector).
