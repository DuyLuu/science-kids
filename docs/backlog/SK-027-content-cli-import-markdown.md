# SK-027 · `content-cli` đọc bài markdown: `validate` báo lỗi theo dòng, `import` ra JSON schema v1, `ids` điền id

Trạng thái: done (2/11: tester đạt mọi tiêu chí sau một vòng sửa L1–L6; `npm test` 273/273; A1 trùng từng byte, A4 trùng sha256 mốc. Còn L7, L8 nhẹ, không chặn: xem "Kết luận (phiên chính, 2/11)") · Ngày: 2026-11-02 · Phụ trách: dev · Tester: tester
Nguồn: Duy giao 2/11 ("Giao luôn"); technical-plan.md B4.2 (id ổn định), B8.0 (`validate`), B16 GĐ 0; syllabus.md mục 6 (soạn 34 bài 10/11 – 19/12, mốc pilot 16/1/2027); `content/TEMPLATE.md` mục A (cú pháp, id), B, C, D (bảng ánh xạ); SK-001 (schema v1, fixture bài 1), SK-002 (khung markdown), SK-014 và SK-024 (`tts`), SK-015 (`build`), SK-017 (23 UUID đã chép vào markdown), SK-026 (luật theo tuổi, mã lỗi, dạng dòng báo)

## Mục tiêu
Biên tập viên chạy một lệnh trên thư mục chủ đề markdown và thấy mọi lỗi chỉ về đúng file `.md` và số dòng. Dev chạy `import` để có JSON schema v1, không còn chép tay. Như vậy từ bài 2 (soạn từ 10/11), nội dung đi trọn đường: markdown → kiểm lỗi → `tts` EN/VI → `build` → app.

## Bối cảnh
- `validate`, `tts`, `build` hiện chỉ đọc JSON. JSON bài 1 (`packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/`) do dev chép tay từ markdown. Chép tay 34 bài vừa chậm vừa dễ lệch.
- Thứ tự khoá trong fixture theo thứ tự `properties` của JSON Schema, không theo thứ tự dòng trong markdown. Ví dụ `Image`: `alt` rồi `brief`; option: `key`, `label`, `correct`, `image`; `build_tray`: `success_when` sau `messages`.
- `build` ghi `pack.json` bằng `JSON.stringify` giữ nguyên thứ tự khoá của input (`src/build/command.ts` dòng 75, 258). Vì vậy sha256 của `pack.json` và `content_version` phụ thuộc thứ tự khoá, không chỉ giá trị. `topics[].version` băm JSON chuẩn tắc nên không phụ thuộc. Khoảng trắng của file input không ảnh hưởng, vì `build` parse rồi ghi lại.

## Phạm vi

### 1. Ba lệnh (PM đề xuất, dev đổi được nếu có lý do và ghi vào đây)

| Lệnh | Ai chạy | Làm gì | Ghi gì |
| --- | --- | --- | --- |
| `validate <đường dẫn>...` | biên tập; **lệnh duy nhất cần nhớ** | Nhận thêm file `.md` và thư mục. Parse → JSON trong bộ nhớ → content-schema → luật theo tuổi SK-026 | Không ghi gì |
| `import <đường dẫn>... [--out <thư mục>]` | dev hoặc Duy, trước `tts` | Chạy đúng các bước của `validate`. Không có lỗi thì ghi JSON | `--out` mặc định `content/.build/json/`, bố cục `<age_group>/<topic_slug>/topic.json` và `<nn>-<slug>.json` |
| `ids <đường dẫn>...` | người soạn bài, một lần cho mỗi bài mới | Điền UUID vào các dòng `id:` còn trống (mục 4) | Chỉ các dòng `id:` trống của file `.md` |

- **Đường dẫn:** file `.md` hoặc thư mục. Với thư mục, máy tìm mọi thư mục chủ đề (có `_topic.md`) bên trong, nên `validate content/` kiểm cả kho.
  - Trong một thư mục chủ đề, máy đọc `_topic.md` và mọi file `NN-*.md`, bỏ qua file khác.
  - Đưa một bài lẻ thì máy tự lấy `_topic.md` cùng thư mục. Khác với JSON: không bắt người chạy đưa kèm topic.
- Trộn `.md` với `.json` trong một lần gọi: exit 2. `validate` trên `.json` giữ nguyên như hiện nay.
- **`import` ghi theo chủ đề:**
  - Thư mục đầu ra của một chủ đề bị thay cả, qua thư mục tạm rồi đổi tên như `build`, và chỉ chứa topic cùng các bài có trong lần gọi.
  - Có lỗi ở bất kỳ file nào thì không ghi gì, exit 1.
  - Tên file như fixture. Nội dung là `JSON.stringify(…, null, 2)` cộng xuống dòng cuối.
- **Đường đi đầy đủ:** `import` → `tts --lang en` → `tts --lang vi` → `build`. README ghi đủ, và `import` in lệnh tiếp theo ở cuối output. `tts` và `build` giữ nguyên, vẫn đọc JSON.
- `validate`, `import`, `ids` không cần model Kokoro, môi trường Python VieNeu hay mạng, và không nạp module của `tts`.
- Exit theo quy ước hiện có: 0 = xong (có thể có cảnh báo), 1 = lỗi nội dung, 2 = gọi sai.
- README ghi một dòng lệnh để biên tập chạy từ gốc repo, ví dụ `npm --prefix tools/content-cli run validate -- content/discoverer/an-uong-lanh-manh`. Dev kiểm lệnh này chạy đúng với đường dẫn tương đối.

**Lý do chọn:**
- Biên tập chỉ cần `validate`, không phải biết JSON nằm đâu. `validate` và `import` dùng chung một đường kiểm, nên `validate` sạch thì `import` chắc chắn chạy được.
- JSON là sản phẩm dẫn xuất, nên để trong `content/.build/` (đã có trong `.gitignore` dòng 16). Ghi JSON cạnh markdown hay vào fixture thì sẽ có hai nguồn, dễ bị sửa tay rồi lệch, đúng cái đang muốn bỏ.
- Không cho `tts` và `build` đọc thẳng markdown. `build` cần JSON đã có `audio.*` do `tts` ghi. Giữ hai lệnh này nguyên thì không đụng cache, khoá clip và test của SK-014, SK-015, SK-024.

### 2. Parser
- **Đặc tả:** đúng TEMPLATE mục A ("Cú pháp", "id và key") và bảng ánh xạ ở mục D. Chỗ mục D không rõ, hoặc khác fixture: dev ghi vào ticket, không tự sửa TEMPLATE.
- **Cách đọc file:**
  - Gợi ý viết parser theo dòng, vì khung là ngữ pháp dòng `tên: giá trị`; không cần thư viện markdown tổng quát.
  - Frontmatter đọc bằng YAML tối giản (khoá phẳng, `difficulty` lồng hai cấp, danh sách `[]`) hoặc bằng một thư viện YAML ghim phiên bản. Dev chọn và ghi lý do.
  - Giá trị đọc theo kiểu của schema, không đoán kiểu như YAML 1.1 (`no` không thành `false`).
- **Bỏ qua:** dòng bắt đầu bằng `>`, dòng trống, toàn bộ mục `## Ghi chú cho hoạ sĩ`, `## Ghi chú cho dev` và `## Ghi chú` (topic). Ở các chỗ khác, dòng không đúng dạng `tên: giá trị` (đoạn văn, bảng `|`, danh sách `-`) là lỗi.
- **Giá trị:**
  - Tách tại dấu `:` đầu tiên sau tên trường, nên giá trị được chứa `:` (`Sweets: just a little`, `Prior knowledge: …`). Bỏ khoảng trắng hai đầu.
  - Dòng có tên trường mà giá trị trống thì coi như không có trường đó. Nhờ vậy `labels.*` để trống của Explorer là hợp lệ. `id:` trống xử lý theo mục 4.
- **Danh sách và map:**
  - `a, b, c` thành mảng; một phần tử vẫn là mảng (`answers: w1_air` → `["w1_air"]`).
  - `messages.missing.<key>` giữ thứ tự dòng trong file, vì đó là thứ tự nhắc của mâm cơm (Duy chốt 29/10, SK-012).
  - `examples.<n>` và Ý chính `1`–`3` phải đánh số liền từ 1.
- **Tham chiếu đổi sang id:**
  - `topic` → `topic_id`, lấy từ `_topic.md` cùng thư mục. `topic` phải trùng tên thư mục.
  - `misconception` → `misconception_id`.
  - `prerequisites` → `prerequisite_topic_ids`: tìm `_topic.md` theo slug trong gốc nội dung.
  - `recall_from.lesson` → `recall_from.lesson_id`.
  - Không tìm thấy thứ được trỏ tới là lỗi có số dòng.
- **Tên file:** `<nn>-<slug>.md`, với `nn` là `order` viết hai chữ số và phần sau trùng `slug` (TEMPLATE mục A).
- **Trường do máy ghi:** chỉ `kind` và `schema_version` = 1. Markdown không viết thì không tự thêm giá trị mặc định (ví dụ `tier`). `## Thưởng` trống thành `reward: {}`.
- **Thứ tự khoá:** theo thứ tự `properties` của JSON Schema v1, khớp fixture hiện có. Mảng theo thứ tự trong file; map theo thứ tự dòng.
- Đọc được file có BOM và xuống dòng CRLF.

### 3. Dòng báo lỗi
- **Dạng:** `<file .md>:<dòng> <JSON pointer> [<mã>] <thông báo>`. Đây là dạng của SK-026, chỉ thêm `:<dòng>` sau tên file; terminal và VS Code bấm vào được. Ví dụ:
  ```
  content/discoverer/an-uong-lanh-manh/02-mam-com-can-bang.md:118 /quiz/0/format [md_unknown_format] format "single_choise" không có. Có phải "single_choice"? Dùng được: single_choice, multi_choice, true_false, fill_blank_bank, order_sequence, picture_bar_chart
  content/discoverer/an-uong-lanh-manh/02-mam-com-can-bang.md:121 /quiz/0/dok [age_first_item_dok] câu 1 của Quiz phải là DOK 1, đang là 2
  ```
- **Số dòng** là dòng thật trong file, đếm từ 1, tính cả frontmatter:
  - lỗi ở một trường: dòng của chính trường đó;
  - thiếu trường: dòng tiêu đề `###` hoặc `####` của khối;
  - lỗi của cả mục (số câu Quiz, `age_dok_mix`…): dòng tiêu đề `##` của mục;
  - thiếu cả một mục `##`: dòng tiêu đề `##` ngay sau chỗ lẽ ra có mục đó.
- **Pointer:** JSON pointer của JSON sẽ ghi ra, như SK-026, để dev tra. Lỗi không ứng với chỗ nào trong JSON thì pointer là `/`.
- **Mã:**
  - lỗi luật tuổi giữ mã của SK-026;
  - lỗi content-schema có mã `schema`;
  - lỗi cú pháp markdown dùng mã `md_*` ở bảng dưới. Dev đổi tên mã thì sửa ticket và README.
- **Thông báo** viết tiếng Việt cho người không phải dev:
  - gọi theo tên trong markdown (`label.vi`, `#### option q1_rice`, `## Quiz`, `misconception`), không theo tên JSON (`misconception_id`, "phần tử");
  - nói cách sửa;
  - tên gõ gần đúng (mục, trường, format, type, key được trỏ tới) thì gợi ý tên đúng.
- **Thứ tự in:** lỗi trước, cảnh báo sau; trong mỗi nhóm theo file rồi theo dòng. Cuối cùng là một dòng tổng như `validate` hiện nay.
- **Một lỗi chỉ ra một dòng.** Các bước chạy nối tiếp như `validate` hiện nay: (1) cú pháp markdown, (2) content-schema, (3) luật tuổi.
  - Chủ đề có lỗi ở một bước thì không chạy các bước sau, trừ `md_id_missing` (mục 4).
  - Trong bước 1, máy không báo lỗi kéo theo. Ví dụ: mục gõ sai tên không sinh thêm dòng "thiếu mục"; format lạ không sinh lỗi cho các `####` con của câu đó.

**Mã `md_*` đề xuất**

| Mã | Mức | Khi nào |
| --- | --- | --- |
| `md_frontmatter` | lỗi | Thiếu `---`, YAML sai, thiếu khoá bắt buộc |
| `md_filename` | lỗi | Tên file không theo `<nn>-<slug>.md`, `nn` khác `order`, slug lệch; `topic` khác tên thư mục |
| `md_missing_section` | lỗi | Thiếu mục `##` bắt buộc |
| `md_unknown_section` | lỗi | Mục `##` lạ (gợi ý tên gần nhất) hoặc viết hai lần |
| `md_bad_line` | lỗi | Ở chỗ có cấu trúc, dòng không phải `tên: giá trị`, `>` hay dòng trống (bảng, danh sách `-`, đoạn văn, thiếu dấu `:`). Nhiều dòng liền nhau thì báo một lần, ở dòng đầu |
| `md_unknown_field` | lỗi | Tên trường không có ở loại khối này |
| `md_duplicate_field` | lỗi | Một trường viết hai lần trong một khối |
| `md_bad_value` | lỗi | Sai kiểu (số, `true`/`false`); danh sách sai cú pháp (`[a, b]`, `a; b`); đánh số không liền |
| `md_unknown_format` | lỗi | `format:` không thuộc 6 format v1 |
| `md_unknown_type` | lỗi | `type:` không thuộc các block v1 |
| `md_unknown_child` | lỗi | `#### <loại>` không dùng được với format hay type của khối cha |
| `md_ref_unknown` | lỗi | `misconception`, `prerequisites`, `recall_from.lesson`, `topic`, `group`, `answers`, `term_keys` trỏ tới thứ không có |
| `md_id_missing` | lỗi | Có dòng `id:` trống (mục 4) |
| `md_id_invalid` | lỗi | `id` không đúng dạng UUID |
| `md_id_duplicate` | lỗi | `id` trùng một `id` khác trong gốc nội dung; báo cả `file:dòng` của chỗ kia |
| `md_needs_check` | cảnh báo | File còn dòng `[CẦN KIỂM]`. Một dòng cho mỗi file, liệt kê số dòng |

Key trỏ sai (`group`, `answers`, `term_keys`) nếu content-schema đã bắt thì dev chọn bắt ở bước 1 hay bước 2, miễn là ra đúng một dòng và chỉ đúng dòng.

### 4. Id (UUID)
- `validate` và `import` không bao giờ sửa file `.md`.
- **`id:` trống:**
  - Báo lỗi `md_id_missing`, gộp thành một dòng cho mỗi file: chỉ vào id trống đầu tiên, liệt kê số dòng của các id trống còn lại, nhắc chạy `ids`.
  - Ở `validate`, máy dùng id tạm trong bộ nhớ để vẫn chạy bước 2 và 3. Biên tập thấy hết lỗi nội dung ngay lần đầu; id tạm không được ghi ra đâu.
  - Ở `import`, còn `md_id_missing` thì không ghi JSON.
- **`ids <đường dẫn>`:**
  - Điền `crypto.randomUUID()` (UUID v4, chữ thường, như bài 1) vào mọi dòng `id:` trống ở chỗ có cấu trúc: frontmatter và ngay dưới `###`.
  - Không đụng id đã có. Mọi byte khác của file giữ nguyên, kể cả CRLF và các dòng `>`.
  - In `<file>:<dòng> <uuid>` cho từng id mới. Chạy lần hai không đổi gì.
- **`id` trùng:**
  - Máy kiểm trong mọi file `.md` dưới gốc nội dung, không chỉ các file của lần gọi. Gốc mặc định là `content/`; có cờ để test đổi gốc. Lý do: lỗi hay gặp là chép bài mẫu mà quên xoá id.
  - `ids` không tự đổi id trùng. Biên tập xoá id ở bài mới rồi chạy `ids`.
- **Lý do:**
  - Id cấp một lần và không đổi (B4.2), vì `topics[].version`, `lesson_progress`, `vocab_progress` và `p_correct` dựa vào id. Cache TTS băm theo chữ, không theo id, nên không phụ thuộc id.
  - Ghi id vào file một lần, qua một lệnh riêng, thì id nằm trong git, hiện trong diff của PR, và mọi lần chạy sau dùng đúng id đó.
- **Không chọn:**
  - (a) `import` tự sinh id và ghi ngược vào file: một lệnh chỉ đọc lại sửa nguồn; dev chạy `import` sẽ sửa `content/`, vùng của content-editor; CI không ghi được.
  - (b) UUID v5 suy từ slug và key: id đổi khi đổi slug hay key trước lúc phát hành; bài 1 đã dùng v4.

### 5. Test (trong `tools/content-cli/test/`)
- **Test khớp fixture:** đọc thẳng `content/discoverer/an-uong-lanh-manh/` và so từng byte với hai fixture. Từ nay bài 1 đổi thì test đỏ cho tới khi fixture được sinh lại (quyết định 2).
- **Fixture markdown** ở `test/fixtures/markdown/`:
  - `valid/`: bản chép bài 1 và `_topic.md`;
  - mỗi bản lỗi là bài 1 với đúng một lỗi;
  - `expected.json` viết tay: file, dòng, pointer, mã.
  - Gốc nội dung khi chạy test là thư mục fixture, không phải `content/`.
- **`ids`:** chỉ chạy trên bản chép trong thư mục tạm.

## Ngoài phạm vi
- Đổi schema v1 (`packages/content-schema`: JSON Schema, zod, fixture), app iOS, phần chạy của `tts` và `build` (README thì sửa).
- Sửa `content/`: bài 1, `_topic.md`, TEMPLATE, README.
  - Thấy markdown lệch fixture thì ghi vào mục "Đề xuất cho content-editor" cuối ticket.
  - Không sửa markdown hay fixture cho khớp. PM chốt bên nào đúng.
- Chạy `ids` trên file trong `content/`.
- Lệnh `assets`, `publish`, `draft`; CI; một lệnh gộp `import` → `tts` → `build`; chế độ watch; CMS nhập markdown (GĐ 2).
- Luật theo tuổi mới; đổi `content/rules.json`.

## Tiêu chí nghiệm thu
Chạy trong `tools/content-cli` nếu không ghi khác. Dán lệnh và output vào mục Kết quả. Đầu ra tạm để trong scratchpad, không ghi vào `content/.build/pack`.

**A. Bài 1 đi trọn đường**
- [ ] **A1 · import khớp fixture.** `npm run import -- ../../content/discoverer/an-uong-lanh-manh --out <tmp>/json` exit 0. `cmp` hai file ra với `packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/topic.json` và `01-thuc-an-cho-ta-nhung-gi.json`: **trùng từng byte**.
  - Chỗ nào không thể trùng thì liệt kê từng chỗ: pointer, giá trị hai bên, lý do. Phần còn lại phải trùng khi so sâu (deep-equal, không tính thứ tự khoá).
  - Có chỗ lệch thì PM chốt chấp nhận hay không trước khi làm A4.
- [ ] **A2 · validate bài 1.** `npm run validate -- ../../content/discoverer/an-uong-lanh-manh` exit 0, 0 lỗi.
  - Tập (mã, pointer) của cảnh báo trùng với tập khi chạy `validate` trên hai fixture JSON.
  - Ngoài tập đó, chỉ có một dòng `md_needs_check` cho mỗi file (bài 1 hiện có 5 dòng `[CẦN KIỂM]`, `_topic.md` có 1).
- [ ] **A3 · mốc đối chứng.** Build lại gói từ JSON `tts` hiện có (`content/.build/tts/discoverer/an-uong-lanh-manh/`) vào thư mục tạm. Ghi lại sha256 của `pack.json`, `topics[].version` và `content_version`.
  - Kỳ vọng: `59d874acba16fe7643b2c7e59d97cfdb523e75a647b28cdcf38cefda381a00a5`, `692f2e75ba89`, `803c0cb00461` (gói `content/.build/pack`, build 1/11).
  - Khác thì ghi lý do (ví dụ `content/rules.json` đổi sau lần build 1/11 thì `content_version` đổi) và lấy số mới làm mốc. Mốc lệch không phải lỗi của ticket này.
- [ ] **A4 · gói từ markdown trùng mốc.** Từ đầu ra A1, chạy `tts --lang en` rồi `tts --lang vi`, cả hai `--no-review`, không `--force`, `--out` vào thư mục tạm. Cả hai tiếng báo **0 clip mới**.
  - Sau đó `build` ra thư mục tạm: sha256 `pack.json`, `topics[].version` và `content_version` trùng mốc A3.
  - `sh tools/content-cli/scripts/check-pack.sh <gói tạm>` OK.
  - `content/.build/pack` (gói app đang nhúng) không bị thay.

**B. Lỗi chỉ về file và dòng**
- [ ] **B1 · mỗi fixture lỗi một dòng.** Mỗi fixture lỗi cho đúng một dòng lỗi (không tính cảnh báo), đúng file, dòng, mã và pointer như `expected.json`, exit 1. `import` trên cùng fixture không ghi file nào. Tối thiểu các ca sau:
  1. thiếu một mục bắt buộc (bỏ cả `## Mục tiêu`): chỉ vào dòng `## Ý chính`;
  2. tên mục gõ sai (`## Tu vung`): một dòng `md_unknown_section`, không kèm dòng "thiếu mục Từ vựng";
  3. sai tên format (`single_choise`): một dòng, có gợi ý tên đúng;
  4. sai `type` của block (`explore_group`);
  5. UUID trùng giữa hai câu trong cùng bài;
  6. UUID trùng với một bài khác trong gốc nội dung;
  7. một dòng `id:` trống (`md_id_missing`);
  8. UUID sai dạng;
  9. option thiếu `label.vi`;
  10. option thiếu cả `label.en` và `label.vi`: chỉ vào dòng `#### option`;
  11. bảng markdown trong một câu quiz;
  12. danh sách sai cú pháp: `term_keys` viết thành danh sách `-` nhiều dòng, hoặc `answers: [q2_energy]`;
  13. trường gõ sai (`promt.en`);
  14. một trường viết hai lần trong một khối;
  15. dòng thiếu dấu `:`;
  16. `misconception:` trỏ tới key không có trong `_topic.md`;
  17. `#### bank` trong câu `single_choice`;
  18. `dok: hai` hoặc `correct: yes`;
  19. Quiz còn 5 câu: mã `schema`, chỉ vào dòng `## Quiz`;
  20. q1 `dok: 2`: mã `age_first_item_dok`, chỉ vào dòng `dok:` của q1 (luật tuổi trỏ về được dòng);
  21. tên file `03-…` trong khi `order: 2`.
- [ ] **B2 · cảnh báo có dòng.** Một câu EN quá `max_words_en` cho cảnh báo `age_words_en` chỉ vào đúng dòng `.en` của chuỗi đó.
- [ ] **B3 · thông báo đọc được.** Phần thông báo của mọi dòng ở B1 dùng tên markdown: không có `misconception_id`, `options/1` hay "phần tử" (pointer vẫn giữ). Tester đọc từng dòng.
- [ ] **B4 · lỗi do tester tự đặt.** Tester tự thêm ít nhất 3 lỗi ngoài danh sách B1, không báo trước cho dev. Mỗi lỗi phải ra đúng một dòng, đúng số dòng. Lỗi nào ra nhiều dòng hoặc sai dòng thì ghi vào ticket để dev sửa.

**C. `ids`**
- [ ] **C1 · điền đúng chỗ.** Trên bản chép bài 1 trong thư mục tạm, xoá 3 id: frontmatter của bài, `### q3` và `### all_fat_bad` trong `_topic.md`.
  - `ids` điền đúng 3 dòng đó; `diff` chỉ ra 3 dòng.
  - UUID là v4 hợp lệ và không trùng id nào khác.
  - Chạy lần hai không đổi file nào (so sha256).
  - File CRLF vẫn giữ CRLF.
- [ ] **C2 · id trống không chặn kiểm nội dung.** Trên bản có id trống và một lỗi nội dung:
  - `validate` in một dòng `md_id_missing` mỗi file, kèm lỗi nội dung kia (id trống không chặn bước 2, 3);
  - `import` exit 1 và không ghi gì.

**D. Chung**
- [ ] **D1 · chạy không cần TTS.** `validate`, `import` và `ids` chạy được khi chưa có `.models/` và `tts-vi/.venv` (đổi tên tạm hoặc dùng bản clone repo), không dùng mạng.
- [ ] **D2 · gọi sai.** Trộn `.md` với `.json`, hoặc thư mục không có `_topic.md` nào: exit 2, thông báo rõ. Đường dẫn không tồn tại: theo quy ước hiện có của `validate`.
- [ ] **D3 · không làm vỡ cái cũ.** `validate` trên JSON không đổi hành vi. `npm test` (mọi test cũ, lần gần nhất 215 ở SK-026, cộng test mới) và `npm run typecheck` xanh. `packages/content-schema` `npm test` xanh.
- [ ] **D4 · README.** README của `tools/content-cli` có mục "Markdown: validate, import, ids", gồm:
  - lệnh cho biên tập chạy từ gốc repo;
  - bảng mã `md_*`;
  - đường đi `import` → `tts` → `build`;
  - chỗ ghi JSON.

  Sửa dòng 3 và mục `validate` của README (hiện ghi "parse markdown làm sau"), và comment dòng 3 của `src/validate/command.ts`.
- [ ] **D5 · nhanh.** `validate` thư mục chủ đề bài 1 chạy dưới 2 giây.
- [ ] **D6 · đúng vùng.** Chỉ sửa trong `tools/content-cli/` và mục Kết quả của ticket này. `content/`, `packages/content-schema/` và `apps/` không đổi (so sha256 trước và sau). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- **Dùng lại:**
  - `validateDocuments` của content-schema (SK-001);
  - `checkAgeRules` và `formatIssue` (SK-026);
  - `content/rules.json`;
  - cache clip `content/.audio` của SK-014 và SK-024 (cho A4).
- **Lịch:** không chặn ticket app nào. Cần xong trước 10/11, ngày bắt đầu soạn bài 2. Mục tiêu: dev xong 6/11, tester 7/11.
- **SK-017:** tiêu chí 2 và 6 (markdown ↔ fixture khớp, kể cả id) vẫn chờ. A1 là bằng chứng cho hai tiêu chí đó; PM xét đóng SK-017 sau khi tester đạt A1.
- **Việc sau khi ticket done (PM giao content-editor):**
  - TEMPLATE mục A, bước 3 và đoạn "id và key": ghi lệnh `validate`, `ids`; bỏ câu "dev chép bài sang JSON";
  - `content/README.md`: thêm lệnh kiểm bài.

**Quyết định đã ghi** (PM đề xuất 2/11; dev đổi được nếu có lý do, ghi lại ở đây)
1. Ba lệnh `validate` / `import` / `ids` như mục 1. `tts` và `build` giữ nguyên.
2. **Vai trò của fixture:** JSON ra `content/.build/json/`, ngoài git. Fixture ở `packages/content-schema` vẫn là dữ liệu test. Từ nay bài 1 đổi thì dev sinh lại fixture bằng `import` trong cùng lần sửa, không chép tay; test khớp fixture giữ hai bên trùng nhau.
3. Dòng báo `<file .md>:<dòng> <pointer> [<mã>] <thông báo>`. Mã luật tuổi giữ của SK-026, lỗi schema mang mã `schema`, lỗi cú pháp mang mã `md_*`.
4. Ba bước kiểm nối tiếp; bước trước có lỗi thì không chạy bước sau, trừ id trống.
5. Id: `validate` và `import` báo id trống, không tự ghi; lệnh `ids` điền một lần. Id trùng kiểm trên cả gốc nội dung.
6. Thứ tự khoá JSON theo `properties` của schema, vì sha256 của gói phụ thuộc thứ tự khoá. *(dev đổi 2/11, phiên chính chấp nhận: riêng lựa chọn theo thứ tự của fixture `key, label, correct, image`, vì theo schema thì A1 và A4 lệch. Chi tiết ở "Kết quả (dev)".)*
7. *(Duy 2/11)* **Phiên chính chạy `validate` và `ids` hộ content-editor** (phương án a). Không đổi cấu hình agent. Mỗi bài: content-editor viết, phiên chính chạy `validate` và gửi các dòng lỗi lại, lặp tới khi sạch, rồi phiên chính chạy `ids`, `import`, `tts`, `build`.
8. *(phiên chính 2/11)* Chấp nhận 4 lựa chọn còn lại của dev ghi ở "Kết quả (dev)": mã `md_block_count`; thiếu `label.vi` thì báo ở dòng `label.en`; `ids` thêm dòng `id:` khi khối chưa có; bản chép ngoài `content/` lấy gốc nội dung là thư mục trên `<age_group>/`. Tester thấy chỗ nào sai thì ghi vào ticket.

**Câu hỏi còn mở**
- *(Duy, không chặn dev)* **Ai chạy `validate` và `ids` khi soạn 34 bài?** **Đã chốt (a), Duy 2/11:** xem quyết định 7. Agent content-editor hiện chỉ có Read, Grep, Glob, Write, Edit, không chạy được lệnh.
  - (a) Phiên chính chạy hộ sau mỗi bài và gửi output cho content-editor sửa. Không đổi cấu hình, nhưng mỗi vòng sửa tốn thêm một lượt điều phối.
  - (b) Duy cho content-editor quyền Bash, chỉ cho `npm run validate` và `npm run ids` (`.claude/agents/content-editor.md`). Agent tự sửa tới khi sạch.
  - Đề xuất: (b), vì 34 bài nhân vài vòng sửa mỗi bài. Nếu Duy không muốn mở Bash cho agent này thì (a).
  - Biên tập viên là người thật thì chạy trên máy mình: cần Node 22.18 trở lên và `npm install` một lần.
- *(dev)* Đọc YAML bằng parser tự viết hay thư viện ghim phiên bản: chọn và ghi lý do.
- *(dev → PM)* Chỗ nào TEMPLATE mục D không rõ hoặc khác fixture: ghi ở đây, PM chốt.

## Đề xuất cho content-editor
*(dev ghi khi thấy markdown bài 1 lệch fixture hoặc TEMPLATE: file, dòng, giá trị hai bên, đề xuất. Không tự sửa `content/`.)*

**Markdown bài 1 ↔ fixture: không lệch chỗ nào** (dev, 2/11). `import` ra trùng từng byte hai fixture (A1), nên không có dòng nào cần sửa ở `01-thuc-an-cho-ta-nhung-gi.md`, `_topic.md` hay fixture.

Chữ của TEMPLATE nên sửa theo máy (gộp vào việc PM đã giao sau khi ticket done, không gấp):
1. `content/TEMPLATE.md` dòng 10 (mục A, bước 3) và dòng 21 (đoạn "id và key"): còn ghi "dev chép bài sang JSON", "Máy sinh mã và ghi ngược vào file". Nay: biên tập chạy `npm --prefix tools/content-cli run validate -- <thư mục chủ đề>`; bài mới chạy `… run ids -- <file>` một lần để điền id; `validate`/`import` không ghi vào file. Đúng như mục "Việc sau khi ticket done".
2. Dòng 530 (`tier`, "mặc định `core`") và dòng 540 (`rarity`, "mặc định `common`"): máy không ghi giá trị mặc định (mục 2 của ticket); để trống thì JSON không có trường, app hiểu theo `default` của schema. Đề xuất ghi rõ "để trống = app hiểu là core/common; máy không tự điền".
3. Dòng 303 (`prerequisites` là "danh sách slug"): máy đọc đúng hai dạng `prerequisites: []` và `prerequisites: [slug-a, slug-b]` (YAML một dòng); dạng `- slug` nhiều dòng là lỗi. Đề xuất thêm ví dụ có hai slug.
4. Dòng 9 ("Không đổi, không thêm, không bỏ tên mục `##`"): máy bắt buộc mọi mục của khung, **trừ** các mục Ghi chú (`## Ghi chú cho hoạ sĩ`, `## Ghi chú cho dev`, `## Ghi chú`) vì không ra dữ liệu. `## Câu hỏi lớn` bắt buộc có tiêu đề, được để trống. Nếu PM muốn bắt buộc cả mục Ghi chú thì đổi `required` trong `src/markdown/syntax.ts`.

## Kết quả (dev)

Dev, 2/11. Trạng thái đề xuất: **review** (dòng trạng thái ở đầu ticket chưa đổi: ngoài vùng được sửa; PM đổi). Không commit. Không có migration.

### Đã làm
- `validate`, `import`, `ids` trên markdown, parser tự viết đọc theo dòng (không thêm dependency, không mạng). `tts` và `build` không đổi phần chạy.
- Code mới `tools/content-cli/src/markdown/`:
  - `syntax.ts`: đọc dòng (BOM, CRLF, NFC), frontmatter YAML tối giản, mục `##` theo danh sách cố định, `###`, `####`, dòng `>` và mục Ghi chú bỏ qua; `md_frontmatter`, `md_bad_line`, `md_unknown_section`, `md_missing_section`.
  - `convert.ts`: markdown → JSON schema v1 theo thứ tự `properties`, ghi số dòng của từng giá trị; mã `md_*` còn lại.
  - `locator.ts`: JSON pointer → dòng (không có dòng riêng thì lùi về nửa còn lại của cặp, `####`, `###`, `##`, dòng 1).
  - `check.ts`: ba bước nối tiếp theo chủ đề, id trùng trên gốc nội dung, `md_id_missing` gộp mỗi file, lỗi schema và luật tuổi đổi sang dòng và tên markdown.
  - `files.ts`: tìm thư mục chủ đề, gốc nội dung, quét id; `ids.ts`: điền UUID giữ nguyên mọi byte khác; `command.ts`: in, ghi JSON qua thư mục tạm, in lệnh tiếp theo; `source.ts`: kiểu, bảng `MD_CODES`, gợi ý tên gần đúng.
- Sửa: `src/cli.ts` (thêm `import`, `ids`; `validate` chia nhánh `.json` / `.md`+thư mục; mọi module `src/tts/` và `normalize/numbers-vi.ts` chỉ nạp khi chạy `tts`, `fetch-model`, `--help`); `src/validate/command.ts` (comment dòng 3); `package.json` (script `import`, `ids`); `README.md` (mục mới "Markdown: validate, import, ids", dòng 3, mục validate, Kiểm thử, Thư mục).
- Test: `test/markdown.test.ts` (50 test), `test/fixtures/markdown/valid/discoverer/an-uong-lanh-manh/` (bản chép bài 1 và `_topic.md`, trùng `content/`), `test/fixtures/markdown/expected.json` (21 ca B1, 12 và 18 mỗi ca hai biến thể, thêm 6 ca 22–27, một ca B2). Mỗi ca là bản chép với các sửa (thay đoạn, cắt, thêm file, đổi tên) và dòng lỗi viết tay; test dựng ca trong thư mục tạm, gốc nội dung là thư mục tạm.

### Tiêu chí (lệnh và kết quả thật)

**A1 · import khớp fixture: trùng từng byte, không có chỗ lệch.**
```
$ npm run import -- ../../content/discoverer/an-uong-lanh-manh --out <scratch>/sk027/a1/json   # exit 0
$ cmp a1/json/discoverer/an-uong-lanh-manh/topic.json packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/topic.json   -> trùng
$ cmp a1/json/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json …/01-thuc-an-cho-ta-nhung-gi.json                           -> trùng
```
Test "content/ bài 1 ra đúng từng byte hai fixture" giữ điều này (quyết định 2). SK-017 tiêu chí 2 và 6: có bằng chứng.

**A2 · validate bài 1:** exit 0, 0 lỗi, 2 cảnh báo, 0,30 s.
```
$ npm --prefix tools/content-cli run validate -- content/discoverer/an-uong-lanh-manh      # từ gốc repo
content/discoverer/an-uong-lanh-manh/_topic.md:43 / [md_needs_check] cảnh báo: còn 1 dòng [CẦN KIỂM] (dòng 43): …
content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md:41 / [md_needs_check] cảnh báo: còn 5 dòng [CẦN KIỂM] (dòng 41, 74, 162, 447, 625): …
validate: 2 file markdown (1 topic, 1 bài) · nhóm discoverer · 0 lỗi · 2 cảnh báo · gốc nội dung content · luật content/rules.json · app 0.1.0
```
`validate` trên hai fixture JSON: 0 cảnh báo; ngoài hai dòng `md_needs_check` thì tập (mã, pointer) cũng rỗng.

**A3 · mốc đối chứng:** build lại từ `content/.build/tts/discoverer/an-uong-lanh-manh/` vào `<scratch>/sk027/a3-pack`: `pack.json` sha256 `59d874acba16fe7643b2c7e59d97cfdb523e75a647b28cdcf38cefda381a00a5`, `topics[].version` `692f2e75ba89`, `content_version` `803c0cb00461`. Trùng mốc 1/11, không đổi mốc.

**A4 · gói từ markdown trùng mốc.** Chạy với bản chép cache (`<scratch>/sk027/a4/audio-cache`, chép từ `content/.audio`) và `PATH` không có `afconvert`: nếu `tts` định sinh clip thì dừng ở bước kiểm công cụ, trước khi nạp model. Thư mục tạm đặt theo `<age_group>/<slug>/` vì content-schema đòi tên thư mục của `topic.json` trùng slug.
```
tts --lang en --no-review (vào a4/tts-en/discoverer/an-uong-lanh-manh): Clip khác nhau: 107 · sinh mới 0 · dùng lại 107   exit 0
tts --lang vi --no-review (vào a4/tts-vi/discoverer/an-uong-lanh-manh): Clip khác nhau: 110 · sinh mới 0 · dùng lại 110   exit 0
build (vào a4/pack): content_version 803c0cb00461 · version 692f2e75ba89
pack.json sha256 59d874acba16fe7643b2c7e59d97cfdb523e75a647b28cdcf38cefda381a00a5
sh tools/content-cli/scripts/check-pack.sh a4/pack -> OK (210 asset: en 100, vi 110)
```
Thêm: mọi file của gói a4 trùng gói a3 trừ `generated_at` của manifest; hai JSON sau `tts vi` trùng từng byte `content/.build/tts/…`. `content/.build/pack` không đổi (pack.json vẫn `59d874ac…`).

**B · lỗi chỉ về file và dòng.** 21 ca B1 + B2 chạy trong `npm test`, mỗi ca đúng một dòng lỗi, đúng file, dòng, mã, pointer; `import` trên cùng ca exit 1, không ghi file nào; thông báo không chứa `misconception_id`, `topic_id`, `lesson_id`, "phần tử", `/options/<n>`… (test kiểm bằng regex, tester vẫn đọc từng dòng cho B3). Dòng in thật (bỏ tiền tố `discoverer/an-uong-lanh-manh/`, file là bài 1 trừ ca 21):
```
1  01-…md:17  /objective [md_missing_section] thiếu mục "## Mục tiêu"; thêm trước dòng "## Ý chính"
2  01-…md:522 / [md_unknown_section] mục "## Tu vung" không có trong khung bài. Có phải "Từ vựng"? Các mục: …
3  01-…md:293 /quiz/0/format [md_unknown_format] format "single_choise" không có. Có phải "single_choice"? Dùng được: …
4  01-…md:93  /learn/0/type [md_unknown_type] type "explore_group" không có. Có phải "explore_groups"? Ở ## Học dùng được: …
5  01-…md:400 /quiz/3/id [md_id_duplicate] UUID b06b6e26-… trùng với id ở dòng 359 của file này; mỗi id chỉ dùng một lần: xoá giá trị sau "id:" ở chỗ mới chép (để trống) rồi chạy ids
6  01-…md:359 /quiz/2/id [md_id_duplicate] UUID b06b6e26-… trùng với id ở discoverer/chu-de-khac/01-bai-khac.md:2; …
7  01-…md:359 /quiz/2/id [md_id_missing] "id:" còn trống. Chạy "npm --prefix tools/content-cli run ids -- <file>" để máy điền UUID; …
8  01-…md:292 /quiz/0/id [md_id_invalid] id "1462983f-…-65b4ee731e5" không phải UUID chữ thường dạng 8-4-4-4-12; xoá giá trị … rồi chạy ids
9  01-…md:315 /quiz/0/options/1/label/vi [schema] #### option q1_rice thiếu label.vi
10 01-…md:313 /quiz/0/options/1/label [schema] #### option q1_rice thiếu label.en và label.vi
11 01-…md:298 /quiz/0 [md_bad_line] bảng markdown không dùng được ở đây; … (3 dòng, tới dòng 300)
12a 01-…md:170 /learn/1/term_keys [md_bad_value] term_keys: danh sách key viết trên một dòng, cách nhau bằng dấu phẩy, …
12b 01-…md:338 /quiz/1/answers [md_bad_value] answers: … không ngoặc, vd "answers: q2_energy"; đang là "[q2_energy]"
13 01-…md:296 /quiz/0 [md_unknown_field] trường "promt.en" không dùng được ở ### q1 (câu single_choice). Có phải "prompt.en"?
14 01-…md:300 /quiz/0/hint/en [md_duplicate_field] "hint.en" viết hai lần ở ### q1 (câu single_choice) (lần đầu ở dòng 298); giữ một dòng
15 01-…md:298 /quiz/0 [md_bad_line] dòng thiếu dấu ":" (cần dạng "tên: giá trị"); đoạn văn hay ghi chú thì bắt đầu bằng ">"
16 01-…md:502 /quiz/5/misconception_id [md_ref_unknown] misconception: "all_fats_bad" không có trong ## Misconceptions của _topic.md. Có phải "all_fat_bad"? …
17 01-…md:321 /quiz/0 [md_unknown_child] "#### bank" không dùng được trong ### q1 (câu single_choice). Dùng được: #### option
18a 01-…md:333 /quiz/1/dok [md_bad_value] dok: phải là số nguyên viết bằng chữ số (vd 2), đang là "hai"
18b 01-…md:306 /quiz/0/options/0/correct [md_bad_value] correct: viết true hoặc false (chữ thường, không ngoặc kép), đang là "yes"
19 01-…md:289 /quiz [schema] ## Quiz: cần đúng 6 câu (###), đang có 5
20 01-…md:295 /quiz/0/dok [age_first_item_dok] câu 1 là DOK 2; nhóm discoverer cần câu 1 là DOK 1
21 03-thuc-an-cho-ta-nhung-gi.md:5 /order [md_filename] tên file bắt đầu bằng 03 nhưng order: 2; đổi tên file thành 02-thuc-an-cho-ta-nhung-gi.md hoặc sửa order
B2 01-…md:296 /quiz/0/prompt/en [age_words_en] cảnh báo: câu EN 13 từ, nhóm discoverer tối đa 10: "…"
```
Ca 20 đổi thêm q3 sang `dok: 1` để giữ phân bổ 2·3·1; chỉ đổi q1 thì `age_dok_mix` cũng đúng là lỗi thứ hai (hai luật SK-026 khác nhau). Ca 19 bỏ q4. Ca 6 thêm chủ đề `chu-de-khac` có bài trùng id với q3, ngoài lần gọi.
B4 thuộc tester. Dev đã tự thử thêm ~45 lỗi (xoá từng tiêu đề `##`/`###`/`####`, mục trùng, frontmatter thiếu `---`, `stage` sai, key trỏ sai trong mâm, `examples` nhảy số, hai thẻ thưởng, `prerequisites` sai, `[CẦN KIỂM]` trong giá trị, giá trị viết xuống dòng…): mỗi lỗi một dòng; 6 ca thành test 22–27.

**C1 · ids** (bản chép trong `<scratch>/sk027/c1`, bài 1 đổi sang CRLF, xoá id frontmatter bài, `### q3`, `### all_fat_bad`):
```
…/_topic.md:33 64d11673-b146-41fb-bb7d-1c527ea410b8
…/01-thuc-an-cho-ta-nhung-gi.md:2 dab205b6-e1be-4ee5-9854-42161309bd24
…/01-thuc-an-cho-ta-nhung-gi.md:359 5307e7d4-92c3-4382-bae2-996180162b74
ids: 3 id mới trong 2 file (đọc 2 file)
```
`diff -r` chỉ ra đúng 3 dòng (2, 359, 33); bài vẫn CRLF 668/668 dòng; lần hai "ids: 0 id mới", sha256 hai file không đổi; `validate` sau đó 0 lỗi. Test C1 kiểm thêm UUID v4 hợp lệ, không trùng id nào khác.
**C2:** test "C2": id trống ở cả hai file + `label.vi` thiếu → 3 dòng: `_topic.md:33 [md_id_missing]`, `01-…md:2 [md_id_missing] … và 1 chỗ nữa ở dòng 358`, `01-…md:315 [schema]` (id trống không chặn bước 2, 3); `import` exit 1, thư mục ra rỗng.

**D1 · không cần TTS, không mạng.** Bản chép CLI trong `<scratch>/sk027/d1/repo` (không có `.models/`, không có `tts-vi/`), chạy dưới `sandbox-exec -p '(version 1)(allow default)(deny network*)'` (kiểm: `fetch` trong sandbox báo ENOTFOUND): `validate` exit 1 (một `md_id_missing` cố ý), `import` exit 1 không ghi, `ids` điền 1 id exit 0, `import` lại exit 0 ghi 2 file. Test "không nạp module nào của src/tts" dùng hook `module.registerHooks`: `validate`, `import`, `ids` không resolve file nào trong `src/tts/`, `kokoro*`, `transformers`; `tts --help` thì có.

**D2 · gọi sai:**
```
validate <bài.md> <topic.json>      -> "Không trộn file .json với file .md hay thư mục trong một lần gọi: …", exit 2
validate <thư mục fixture JSON>     -> "…: không có thư mục chủ đề nào (thư mục có _topic.md) bên trong. Thư mục này có file .json: validate JSON thì đưa từng file .json, không đưa thư mục.", exit 2
validate content/discoverer/khong-co.md -> "content/discoverer/khong-co.md / không tìm thấy file", exit 1 (như validate JSON)
import <topic.json>, ids <topic.json> -> exit 2; bài lẻ không có _topic.md cùng thư mục -> exit 2
```

**D3 · không làm vỡ cái cũ:** `npm test` (tools/content-cli) **265 pass, 0 fail** (215 cũ + 50 mới); `npm run typecheck` exit 0; `packages/content-schema` `npm test` **98 pass, 0 fail**. `validate` trên hai fixture JSON vẫn "0 lỗi · 0 cảnh báo", exit 0.

**D4 · README:** mục "Markdown: validate, import, ids" có lệnh cho biên tập từ gốc repo, bảng mã `md_*`, đường đi `import` → `tts en` → `tts vi` → `build`, chỗ ghi JSON; sửa dòng 3, mục validate; comment dòng 3 của `src/validate/command.ts`. Test kiểm README có lệnh và đủ mọi mã. Lệnh `npm --prefix tools/content-cli run validate -- content/discoverer/an-uong-lanh-manh` đã chạy đúng từ gốc repo (A2).

**D5 · nhanh:** `validate` thư mục bài 1 qua npm từ gốc repo: 0,29–0,30 s (3 lần); `node … validate content` cả kho 0,22 s. Test giữ mức dưới 2 s.

**D6 · đúng vùng:** sha256 mọi file trước và sau: `content/` 444 file, `packages/content-schema/` 72 file, `apps/` 1626 file: không đổi. Ngoài `tools/content-cli/` chỉ sửa hai mục cuối của ticket này. Không commit.

### Quyết định khác đề xuất của PM (hoặc thêm), kèm lý do
1. **Thứ tự khoá của lựa chọn** (`ChoiceOption`): `key, label, correct, image` theo fixture, không theo schema (`key, label, image, correct`). Theo schema thì A1 và sha256 gói (A4) đều lệch. Mọi loại khối khác theo đúng `properties`; test kiểm từng loại và ghi rõ ngoại lệ này.
2. **Thêm mã `md_block_count`** (lỗi): `## Chơi` không có đúng một `###`, `## Thưởng` hơn một `###`. JSON không chứa được hai block chơi hay hai thẻ, các mã có sẵn không hợp nghĩa. Đã ghi README.
3. **Thiếu nửa của một cặp** (`label.vi`) chỉ vào dòng nửa còn lại (`label.en`, ca 9 dòng 315), thiếu cả cặp mới chỉ vào `####`/`###` (ca 10). Cặp đã có ở dòng đó, biên tập thêm dòng ngay dưới.
4. **YAML:** parser tự viết, không thêm thư viện. Frontmatter chỉ có khoá phẳng, `difficulty` hai cấp, `prerequisites: [...]`; tự viết thì số dòng chính xác và không đoán kiểu như YAML 1.1. Không bỏ ngoặc kép, không đọc chú thích cuối dòng.
5. **Key trỏ sai** (`group`, `answers`, `answer`, `term_keys`, `messages.missing.<key>`) bắt ở bước 1 (`md_ref_unknown`, có gợi ý). Key trùng, sai mẫu key, ô trống `{n}`, nhóm `required`… vẫn do content-schema bắt ở bước 2.
6. **Một lỗi một dòng khi xoá nhầm tiêu đề** (thêm): thiếu `##` thì không in các lỗi do nội dung của mục đó rơi vào mục trước (giữ lỗi id, frontmatter, tên file); một khối có từ hai tên trường lạ hoặc lặp trở lên thì báo một dòng "thiếu tiêu đề ### (hoặc ####) ngay phía trên dòng X", và các `####` lạ, `term_keys` sau đó không báo; trường nằm ngay dưới `## Chơi`/`## Quiz`… khi chưa có `###` báo một dòng. Hai lỗi gõ thật (`promt.en`, `promt.vi`) vẫn ra hai dòng có gợi ý. Nhiều lỗi content-schema trên cùng một dòng gộp một dòng (vd `difficulty:` trống).
7. **`md_id_duplicate`** gộp một dòng cho mỗi cặp (file này, file kia) khi nhiều id trùng cùng một file (chép bài cũ quên xoá id), thay vì 20 dòng. Hai ca B1 (5, 6) mỗi ca vẫn một id.
8. **`ids` thêm dòng** `id: <uuid>` ngay dưới `###` (hoặc dưới `---` mở) khi khối không có dòng `id:` nào, để lời nhắc "chạy ids" của `md_id_missing` luôn đúng. Các byte khác giữ nguyên. Với bài ở dạng khung TEMPLATE (có `id:` trống) hành vi đúng như đề xuất.
9. **Gốc nội dung mặc định:** `content/` khi mọi chủ đề nằm trong đó; bản chép ở chỗ khác thì là thư mục trên `<age_group>/` của chủ đề (vd `/tmp/x` cho `/tmp/x/discoverer/an-uong-lanh-manh`), để tester chạy trên bản chép không bị báo trùng toàn bộ id với `content/`. `--content-root` ghi đè; dòng tổng in gốc đã dùng.
10. **File `.md` sai tên trong thư mục chủ đề** (bắt đầu bằng chữ số mà không phải `<nn>-…`, vd `2-mam-com.md`) báo `md_filename` thay vì lặng lẽ bỏ qua; README.md và file khác vẫn bỏ qua.
11. **Thư mục đưa cho `validate`** nay luôn là nhánh markdown. Trước đây thư mục cho ra "không tìm thấy file", exit 1; nay thư mục không có `_topic.md` ra exit 2 kèm nhắc đưa từng file `.json`. `validate` trên file `.json` không đổi.
12. **Mục Ghi chú không bắt buộc**; `[CẦN KIỂM]` nằm trong giá trị là `md_bad_value` (TEMPLATE cấm, trẻ sẽ thấy). Giá trị chuẩn hoá NFC (bài 1 vốn NFC nên không đổi byte nào).
13. **Pointer:** `md_unknown_section`, `md_needs_check`, tên file sai: `/`; `md_bad_line`, `md_unknown_field`, `md_unknown_child`: pointer của khối chứa dòng đó; còn lại là pointer của trường.

### Còn chưa chắc
- PM chốt các quyết định 1, 2, 3, 8, 9 (đều đã có trong test và README; đổi thì sửa `expected.json` và một chỗ code).
- Luật "từ hai tên trường lạ hoặc lặp trở lên là thiếu tiêu đề" là heuristic: một khối vừa có một dòng lặp vừa có một lỗi gõ sẽ ra một dòng gộp thay vì hai dòng riêng. Tester thử ở B4.
- Thiếu một tiêu đề `##` thì lỗi thật trong mục ngay trước tạm không in cho tới khi thêm lại tiêu đề (đổi lấy "một lỗi một dòng").
- Chưa chạy `import` với `--out` mặc định (`content/.build/json`) để giữ D6; lệnh này chỉ ghi vào thư mục gitignore đó.
- Câu hỏi mở cho Duy vẫn mở: ai chạy `validate`/`ids` khi soạn 34 bài (content-editor chưa có quyền Bash).

## Nghiệm thu (tester, 2/11)

Tester, 2/11. Tự chạy lại toàn bộ, không dựa log dev. Thư mục tạm: `<S>` = `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk027-test/`. Không sửa `content/`, `packages/`, `apps/`, `src/`; không commit; không mở simulator (máy iPhone 16 Pro đang Booted từ trước, không phải tester bật, để nguyên). Kết luận: **chưa đạt, chỉ vì B4** (L1, L2 ra nhiều dòng); mọi tiêu chí khác đạt, không có lỗi chặn.

### Bảng tiêu chí

| Tiêu chí | Kết quả | Ghi chú |
| --- | --- | --- |
| A1 import khớp fixture | Đạt | `cmp` trùng từng byte cả hai file |
| A2 validate bài 1 | Đạt | exit 0, 0 lỗi, đúng 2 `md_needs_check`; 0,38 s |
| A3 mốc đối chứng | Đạt | `59d874ac…a00a5`, `692f2e75ba89`, `803c0cb00461` |
| A4 gói từ markdown trùng mốc | Đạt | en 107 · sinh mới 0; vi 110 · sinh mới 0; trùng mốc A3; `check-pack.sh` OK |
| B1 21 ca một dòng | Đạt | 21 ca (+12a/12b, 18a/18b, 22–27): mỗi ca đúng 1 dòng lỗi, dòng trỏ đúng chữ (tôi in dòng nguồn cạnh mỗi dòng báo), exit 1, `import` không ghi |
| B2 cảnh báo có dòng | Đạt | `:296 /quiz/0/prompt/en [age_words_en]` trỏ đúng dòng `prompt.en` |
| B3 thông báo đọc được | Đạt | Đọc từng dòng 29 ca: không có `misconception_id`, `options/1`, "phần tử", `topic_id`, `lesson_id` trong phần thông báo; pointer giữ |
| B4 lỗi tester tự đặt | **Không đạt** | 25 lỗi tự đặt: 21 ra đúng một dòng đúng chỗ; L1 ra 4 dòng, L2 ra 2 dòng (lời nhắc dẫn tới hành động sai) |
| C1 ids điền đúng chỗ | Đạt | 3 dòng, diff 3 dòng, v4, không trùng (23 id), lần hai không đổi sha256, CRLF giữ 668/668 |
| C2 id trống không chặn kiểm nội dung | Đạt | 2 `md_id_missing` (mỗi file một dòng) + 1 `schema`; `import` exit 1, không tạo thư mục; `--out` có sẵn file cũ thì giữ nguyên |
| D1 không cần TTS, không mạng | Đạt | Bản chép CLI không có `.models/`, `tts-vi/`, chạy dưới `sandbox-exec (deny network*)` (kiểm `fetch` → ENOTFOUND): validate 0, import 0, ids 0 |
| D2 gọi sai | Đạt | trộn `.md`+`.json` exit 2; thư mục không có `_topic.md` exit 2 (có/không có JSON đều nhắc rõ); bài lẻ không có `_topic.md` exit 2; `import`/`ids` đưa `.json` exit 2; không tồn tại exit 1 (như validate JSON) |
| D3 không làm vỡ cái cũ | Đạt | `npm test` 265 pass / 0 fail; `npm run typecheck` exit 0; `packages/content-schema` 98 pass / 0 fail (mỗi bộ chạy 1 lần) |
| D4 README | Đạt | Mục "Markdown: validate, import, ids" có lệnh từ gốc repo, bảng mã (17 mã `md_*` trong README trùng 17 mã trong `source.ts`), đường đi, chỗ ghi; dòng 3, mục validate, comment `command.ts` dòng 3 đã sửa |
| D5 nhanh | Đạt | 0,38 s (npm từ gốc repo); cả kho `validate ../../content` 0,23 s |
| D6 đúng vùng | Đạt | sha256 gộp `content/`, `packages/content-schema/`, `apps/` trước = sau; `content/.build/pack/.../pack.json` vẫn `59d874ac…`; `content/.audio` không file nào mới |

### Lệnh và dòng báo thật (rút gọn)

```
A1  npm run import -- ../../content/discoverer/an-uong-lanh-manh --out <S>a1/json   -> ghi 2 file; cmp topic.json = trùng; cmp 01-….json = trùng
A2  npm --prefix tools/content-cli run validate -- content/discoverer/an-uong-lanh-manh
    content/…/_topic.md:43 / [md_needs_check] cảnh báo: còn 1 dòng [CẦN KIỂM] (dòng 43) …
    content/…/01-thuc-an-cho-ta-nhung-gi.md:41 / [md_needs_check] cảnh báo: còn 5 dòng [CẦN KIỂM] (dòng 41, 74, 162, 447, 625) …
    validate: 2 file markdown (1 topic, 1 bài) · nhóm discoverer · 0 lỗi · 2 cảnh báo · …    exit 0
    validate trên 2 fixture JSON: 0 lỗi · 0 cảnh báo, exit 0
A3  build từ content/.build/tts/… -> pack.json 59d874acba16fe7643b2c7e59d97cfdb523e75a647b28cdcf38cefda381a00a5 · version 692f2e75ba89 · content_version 803c0cb00461
A4  cache chép vào <S>a4/audio-cache, PATH không có afconvert (nếu tts định sinh clip thì dừng, không nạp model):
    tts --lang en --no-review: Clip khác nhau: 107 · sinh mới 0 · dùng lại 107
    tts --lang vi --no-review: Clip khác nhau: 110 · sinh mới 0 · dùng lại 110
    build: pack.json 59d874ac… · content_version 803c0cb00461 (trùng A3 và gói app đang nhúng)
    check-pack.sh <S>a4/pack: lang en: 100 asset … lang vi: 110 asset … OK
```

Dòng B1 (tester chạy bằng `<S>b1.mjs`, dùng `edits` của `expected.json`, in dòng nguồn cạnh dòng báo; ca 7 thêm: pointer, `/quiz/2/id`, nguồn `id:` trống). Mọi ca khớp bảng dev ở mục Kết quả. Ví dụ ca 9: `01-…md:315 /quiz/0/options/1/label/vi [schema] #### option q1_rice thiếu label.vi` (nguồn dòng 315 = `label.en: rice`); ca 20: `:295 /quiz/0/dok [age_first_item_dok] câu 1 là DOK 2; nhóm discoverer cần câu 1 là DOK 1` kèm cảnh báo `age_dok_order` ở dòng 333 (cảnh báo, không tính lỗi).

**Quyết định 6** (thứ tự khoá): đúng mô tả. Tôi duyệt 270 object trong hai JSON ra so với `properties` của `packages/content-schema/schema/*.json` (`<S>ord.mjs`): chỉ 12 object `ChoiceOption` lệch (`key,label,correct,image` thay vì `key,label,image,correct`), đúng như dev ghi; các object có danh sách `properties` đơn đều khớp. Chưa kiểm độc lập: thứ tự khoá của quiz item và block (schema dùng `allOf`/`if-then`, không có một danh sách duy nhất); phần này chỉ có bằng chứng gián tiếp là A1 trùng byte với fixture.

**Quyết định 8** (4 lựa chọn): đúng mô tả cả bốn.
1. `md_block_count`: `## Chơi` hai `###` → `:289 /play … "### tray2" là ### thứ 2`; `## Chơi` không có `###` → `:172 /play … đang trống`; `## Thưởng` hai thẻ → `:630 /reward … tối đa một ###`. Mỗi ca một dòng, đúng dòng.
2. Thiếu `label.vi` → báo ở dòng `label.en` (ca 9, dòng 315); thiếu cả hai → dòng `#### option` (ca 10, dòng 313).
3. `ids` thêm dòng `id:` khi khối chưa có: xoá hẳn dòng `id:` của `### q3` → validate `:358 /quiz/2/id [md_id_missing] … (dòng 358 chưa có dòng "id:", ids sẽ thêm ngay dưới tiêu đề)`; `ids` thêm đúng 1 dòng ở 359; thiếu `id:` frontmatter thì thêm ở dòng 2; revalidate 0 lỗi. Mặt trái xem L2.
4. Gốc nội dung của bản chép: chạy không cờ `--content-root` trên `<S>c1/discoverer/an-uong-lanh-manh` → dòng tổng ghi "gốc nội dung c1", không báo trùng id với `content/`.

**Hai điểm dev chưa chắc**
- *Khối vừa lặp vừa gõ sai* (`<S>b4b.py`, ca p1–p5): hai dòng lỗi cùng khối (lặp + gõ sai, hoặc hai lần gõ sai không có gợi ý) gộp một dòng "N dòng viết lại hoặc không dùng được ở ### q1 (dòng 296, 300); nếu từ dòng 296 là một câu hay khối khác thì thiếu tiêu đề ###". Có làm hiểu sai một phần: nguyên nhân "thiếu tiêu đề" là sai, và mất gợi ý tên đúng (`promt.en` → `prompt.en`) mà ca đơn có; nhưng không giấu lỗi, vì in đủ số dòng. Hai lỗi gõ có gợi ý (`promt.en` + `promt.vi`, ca 26) vẫn ra hai dòng, nên hành vi không nhất quán. Xem L5. Lặp + sai giá trị (`dok:` hai lần, lần hai là `hai`, p5) ra đúng 1 dòng `md_duplicate_field` ở dòng thứ hai; lỗi giá trị bị che tới khi sửa dòng lặp.
- *Thiếu `##` thì lỗi mục ngay trước không in* (`<S>b4b.py`, ca h1–h6): đúng như dev nói. Lỗi thật trong mục ngay trước bị che: xoá `## Quiz` + `format: single_choise` ở q1 → chỉ ra `md_missing_section`; xoá `## Từ vựng` + lỗi `format` ở Quiz → che; xoá `## Thưởng` + `tier: corr` ở Từ vựng → che; xoá `## Quiz` + `type: build_trai` ở `## Chơi` → che. Không có lỗi nào bị giấu hẳn: sau khi thêm lại tiêu đề các lỗi này hiện ra ở lần chạy kế (ca 3, 4 chứng minh lỗi đó tự hiện khi tiêu đề có mặt). Cái giá là một vòng chạy thêm; lời hướng dẫn vị trí thêm tiêu đề thì chưa đúng, xem L4.

### Lỗi tìm thấy

**L1 · Lỗi (trung bình): thừa một `#` ở tiêu đề câu quiz ra 4 dòng, 3 dòng là lỗi kéo theo.** B4 không đạt vì lỗi này.
- Tái hiện: bản chép bài 1, đổi dòng `### q2` thành `#### q2` (`<S>b4/e03-extra-hash-q2/`), `validate` thư mục chủ đề.
- Mong đợi: 1 dòng ở `#### q2`.
- Thực tế: 4 dòng, đều `[md_unknown_child] … không dùng được trong ### q1`: `:329` (`#### q2`, đúng), `:346` `#### bank q2_energy`, `:350` `#### bank q2_air`, `:354` `#### bank q2_sunlight` (ba dòng sau là kéo theo). Trái mục 3 ticket ("không báo lỗi kéo theo", "một lỗi một dòng").
- Code: `tools/content-cli/src/markdown/convert.ts` (chỗ sinh `md_unknown_child`); sau khi một `####` lạ xuất hiện, các `####` con của nó cũng bị coi là con của khối cha. Thông báo cũng không gợi ý "thừa một `#`?".

**L2 · Lỗi (trung bình): thiếu một `#` ở tiêu đề `#### option` ra 2 dòng cùng chỗ, và lời nhắc dẫn tới sửa sai file.**
- Tái hiện: đổi `#### option q1_rice` (dòng 313) thành `### option q1_rice` (`<S>b4/e04-missing-hash-option/`), `validate`.
- Thực tế: 2 dòng cùng dòng 313: `/quiz/1/format [md_unknown_format] ### option q1_rice thiếu "format:"` và `/quiz/1/id [md_id_missing] "id:" còn trống (dòng 313 chưa có dòng "id:", ids sẽ thêm ngay dưới tiêu đề). Chạy "…run ids -- …"`. Mong đợi: 1 dòng, tốt nhất nói "tiêu đề này giống một câu quiz mới; nếu là lựa chọn thì dùng `####`".
- Hậu quả: tôi chạy theo lời nhắc (`ids` trên bản chép): máy chèn `id: 23b1feaf-…` vào dưới `### option q1_rice` (diff +1 dòng, dòng 314), rác vào file, lỗi gốc vẫn còn. Cùng gốc với L1: khối lạ được coi là khối thật nên sinh `md_id_missing`. Đề xuất: khối đã bị `md_unknown_format`/`md_unknown_type` thì bỏ `md_id_missing` của nó.

**L3 · Góp ý (nhẹ): `Format:` viết hoa chỉ báo "thiếu format:" ở dòng `###`, không chỉ dòng `Format:`.**
- Tái hiện: `format: single_choice` thành `Format: single_choice` (dòng 293) (`<S>b4/e12-capital-field/`).
- Thực tế: một dòng `:291 /quiz/0/format [md_unknown_format] ### q1 thiếu "format:"; dùng được: …`. Biên tập nhìn thấy rõ dòng `Format:` ngay dưới nên khó hiểu. Mong đợi: nhắc "có dòng `Format:` ở dòng 293, tên trường viết chữ thường" (như `promt.en` có gợi ý). Chỉ một dòng nên không vi phạm B4.

**L4 · Góp ý: thiếu `##` do gõ lệch (`### Quiz`, `##Quiz`) hoặc xoá, lời hướng dẫn vị trí dễ dẫn sai.**
- Tái hiện: (a) `## Quiz` thành `### Quiz` (dòng 289) hoặc `##Quiz` → `:522 /quiz [md_missing_section] thiếu mục "## Quiz"; thêm trước dòng "## Từ vựng"` (một dòng, đúng spec ticket mục 3), nhưng không nhắc dòng 289 gần giống. (b) xoá riêng dòng `## Học` (dòng 89 cũ) → `:171 /learn … thêm trước dòng "## Chơi"`; làm theo thì `## Học` rỗng, nội dung Học vẫn nằm dưới `## Khởi động`, lần chạy sau ra lỗi mới.
- Đề xuất: nói "mục nằm giữa `## Khởi động` (dòng 29) và `## Chơi` (dòng 171)" và, nếu có, "dòng 289 `### Quiz` giống tên mục này". Mức góp ý, vì số dòng đúng theo quy ước ticket.

**L5 · Góp ý (nhẹ): heuristic "thiếu tiêu đề" gộp hai lỗi gõ không có gợi ý.** Xem mục "Hai điểm dev chưa chắc". Ca p1 (`<S>b4b.out`): lặp `hint.en` + `promt.en` → `:296 … 2 dòng viết lại hoặc không dùng được … nếu từ dòng 296 là một câu hay khối khác thì thiếu tiêu đề ###`. Đề xuất: chỉ gộp khi có từ ba dòng lạ liền nhau hoặc dòng lạ trùng tên trường của khối khác (`id`, `format`); còn lại báo từng dòng như ca 26.

**L6 · Góp ý (rất nhẹ): gợi ý tên gần đúng trỏ vào tên đã có trong khối.** `prompt.vi` gõ thành `prompt.vn` (`<S>b4/e20-vi-before-en-swap-name/`) → `Có phải "prompt.en"?`, trong khi `prompt.en` đã có ở dòng trên; nên gợi ý `prompt.vi` (tên còn thiếu). Sửa theo gợi ý sẽ ra `md_duplicate_field`.

### 25 lỗi tester tự đặt (B4), ngoài danh sách B1

Chạy trên bản chép bài 1 trong `<S>b4/<tên>/`. Đúng 1 dòng, đúng dòng (đã in dòng nguồn): sai chính tả `format` khác ca 3 (`fill_blank_bnk` → `:35`, có gợi ý); xoá `explanation_wrong.vi` (`:302 … thiếu explanation_wrong.vi`); `### Quiz`/`##Quiz` (L4); `answers:` trống (`:338 answers đang trống`); không có đáp án đúng (`:291`); `est_minutes: tám` (`:7`); dấu `:` toàn chiều rộng `label.en： orange` (`:307 md_bad_line`); key option trùng (`:313 key "q1_orange" trùng … đã có ở dòng 305`); thiếu `image.alt.vi` (`:310`); `correct: True` (`:306`); `topic:` sai tên thư mục (`:3 md_filename`); `answers: q2_energi` (`:338`, gợi ý `q2_energy`); dòng chú thích `//` (`:298 md_bad_line`); đoạn văn trước `### q2` (`:329`); `dok: 0` (`:295`); `label.vi:` trống (`:308`); `version: one` (`:294`); chép bài 1 thành `02-bai-hai.md` quên xoá id (`02-bai-hai.md:2 /id [md_id_duplicate] 21 id trùng với … 01-….md: dòng 2 = dòng 2, …`, đúng một dòng gộp); `## Quiz` hai lần (hai dòng, nhưng là hai lỗi thật vì tôi thay mất `## Thưởng`). Chấp nhận im lặng, JSON ra trùng fixture từng byte: dấu cách không ngắt (NBSP) sau `:`, thụt lề bằng tab. Ra nhiều dòng hoặc kéo theo: L1, L2.

### Chưa kiểm
- Thứ tự khoá của quiz item và block theo `properties` (chỉ gián tiếp qua A1).
- `import` với `--out` mặc định `content/.build/json` (tránh D6; `content/.build` hiện chỉ có `pack`, `tts`, đã xác nhận không bị ghi).
- Lời nhắc `ids` khi chạy từ thư mục ngoài gốc repo: in đường dẫn `npm --prefix ../../…` dài; từ gốc repo thì đúng (`npm --prefix tools/content-cli run ids -- <file>`). Không coi là lỗi.
- Chạy với model Kokoro, VieNeu hay thiết bị thật: ngoài phạm vi ticket; không mở simulator.

### Kiểm lại sau sửa (tester, 2/11)

Chạy lại trên bản chép trong `<S>` (cùng script `b4.py`, `b4b.py`; ca mới `n.py`, kết quả `<S>n.out`). Không sửa `src/`, `content/`, `packages/`, `apps/`; không mạng, không simulator, không commit. Kết luận: **L1–L6 đạt, B4 đạt cho các ca cũ; tìm thêm L7 (lỗi nhẹ) và L8 (góp ý). SK-027 đạt có điều kiện: không còn lỗi chặn; đề nghị dev xử L7, L8 không chặn đóng ticket nếu PM chấp nhận.**

| Mục | Kết quả | Dòng báo thật sau sửa |
| --- | --- | --- |
| L1 `#### q2` | Đạt | 1 dòng `:329 /quiz/1 [md_heading_level] tiêu đề "#### q2" thừa một #`; 3 dòng `#### bank` kéo theo biến mất |
| L2 `### option q1_rice` | Đạt | 1 dòng `:313 /quiz/0/options/1 [md_heading_level] … thiếu một #: … viết "#### option q1_rice"`; không còn `md_id_missing`. `ids` trên bản chép: exit 0, in `bỏ qua "### option q1_rice"`, `diff -r` rỗng (cả L1 và L2) |
| L3 `Format:` | Đạt | 1 dòng `:293 /quiz/0/format [md_unknown_field] tên trường viết chữ thường: "format:", không phải "Format:"` |
| L4 thiếu/gõ lệch `##` | Đạt | `### Quiz`/`##Quiz` → `:522 … nằm giữa "## Chơi" (dòng 172) và "## Từ vựng" (dòng 522); dòng 289 "### Quiz" giống tiêu đề mục này`; xoá `## Học` → `:171 … giữa "## Khởi động" (dòng 29) và "## Chơi"; nội dung có vẻ bắt đầu ở dòng 90 ("### explore")`. Số dòng đúng, hướng dẫn đúng; thêm 4 ca xoá `##` khác (h2–h6) đều chỉ đúng dòng bắt đầu nội dung |
| L5 luật gộp | Đạt một phần | lặp `hint.en` + `promt.en` → 2 dòng (`:296` có gợi ý `prompt.en`, `:300` lặp); `zzz.en` + `qqq.vi` → 2 dòng. Còn gộp sai: xem L8 |
| L6 gợi ý tên | Đạt | `prompt.vn` → `Có phải "prompt.vi"?` |
| B4 (25 ca cũ) | Đạt | 26 ca chạy lại: mỗi ca đúng 1 dòng đúng dòng, trừ `e25` (2 lỗi thật do tôi thay mất `## Thưởng`) |
| `npm test` | Đạt | 273 pass / 0 fail (một lần) |
| `npm run typecheck` | Đạt | exit 0 |
| A1 | Đạt | `import` exit 0; `cmp` trùng từng byte cả hai fixture |
| A4 | Chưa chạy lại | dev báo lại trùng mốc; ngoài A1 không đổi gì phần ghi JSON. A1 trùng byte nên `tts`/`build` đầu vào không đổi |
| D6 | Đạt | sha256 gộp `content/`, `packages/content-schema/`, `apps/` = trước khi nghiệm thu |

**Ca mới quanh tiêu đề sai cấp và tên trường** (`<S>n/<tên>/`). Đúng một dòng, đúng dòng, đúng nguyên nhân, và `ids` không đổi file nào (exit 0): `#### banks q2_air` (`:350 md_unknown_child … Có phải "bank"?`); `#### items` không key (`:321 md_unknown_child`, dùng được `#### option`); `#### q3` ngay sau các `#### bank` của q2 (`:358 md_heading_level`); `### group tray_protein` (`:201 md_heading_level … viết "#### group tray_protein"`); `#### explore` ở `## Học` (`:91 md_heading_level`); `#### q` chỉ một chữ (`:399 md_heading_level`); hai trường gõ sai sát nhau `correc:` + `labl.en:` (hai dòng `:306`, `:307`, mỗi dòng một gợi ý đúng, là hai lỗi thật); `### option q1_rice` kèm `label.en` lặp (hai dòng thật, `:313` và `:316`); hai câu `#### q2` + `#### q3` cùng lúc (hai dòng thật). Không có báo nhầm ở các ca này.

**L7 · Lỗi (nhẹ-trung): `#####` thừa hai `#`, hoặc `####option` thiếu dấu cách, vẫn ra 2 dòng, dòng sau là kéo theo.**
- Tái hiện: `#### option q1_rice` (dòng 313) đổi thành `##### option q1_rice` hoặc `####option q1_rice` (`<S>n/n5-five-hash/`, `<S>n/n6-no-space/`), `validate`.
- Thực tế: dòng 313 `[md_bad_line]` (đúng) và dòng 314 `/quiz/0/options/0 [md_duplicate_field] 6 trường viết hai lần ở #### option q1_orange (dòng 314, 315, 316, 317, 318, 319); nếu từ dòng 314 là một câu hay khối khác thì thiếu tiêu đề`. Mong đợi: 1 dòng ở 313, như `md_heading_level` của L1/L2 (tiêu đề dạng `#{n}` sai cấp hoặc thiếu dấu cách ngay sau `#`). Cùng loại lỗi biên tập viên hay gõ (thừa/thiếu một `#`).
- Code: chỗ nhận `md_bad_line` cho dòng tiêu đề lạ trong `tools/content-cli/src/markdown/syntax.ts`; nên đọc `#####` và `####option` như tiêu đề sai cấp rồi đọc tiếp như đã sửa.

**L8 · Góp ý (nhẹ): lặp `dok:` (hoặc cả nhóm `hint.en`/`hint.vi` lặp) kèm một lỗi gõ khác vẫn bị gộp "thiếu tiêu đề".**
- Tái hiện: q1 có `dok:` lặp và `hnt.vi:` gõ sai (`<S>b4b.out`, ca p2): một dòng `:299 … 2 dòng viết lại hoặc không dùng được … thiếu tiêu đề ###`. Ca p3 (`hint.en`, `hint.vi` lặp) cũng gộp, nói "thiếu tiêu đề". Ca đơn (`dok:` lặp một mình, p5) báo đúng `md_duplicate_field`.
- Ảnh hưởng: nguyên nhân nói sai, mất gợi ý `hnt.vi` → `hint.vi`; không giấu lỗi vì in đủ số dòng. Đề xuất: không tính trường lặp có sẵn trong chính khối (`dok` đã có một lần ở dòng trên) là "dấu hiệu thiếu `###`".

### Chưa kiểm sau sửa
- A4 không chạy lại (không cần cho kết luận trên).
- Các ca `##`/`###` với CRLF hoặc BOM sau sửa.

## Sửa sau nghiệm thu (dev, 2/11)

Dev, 2/11, sửa theo mục "Nghiệm thu (tester, 2/11)". Đã sửa cả sáu lỗi L1–L6, không để lại lỗi nào. Chỉ sửa trong `tools/content-cli/` và thêm mục này. Không commit. Tester chạy lại B4.

### Đã sửa
- **L1, L2: thêm mã `md_heading_level` (lỗi).**
  - `#### q2` là một từ và không phải loại `####` nào (option, bank, item, bar, group), cũng không gần tên loại nào: máy hiểu là `###` thừa một `#`.
  - `### option q1_rice` ngay sau một `###` mà từ đầu là loại `####` và có key: máy hiểu là `####` thiếu một `#`.
  - Báo một dòng ở chính tiêu đề đó, rồi đọc tiếp như đã sửa. Vì vậy các `#### bank` của q2 vẫn là con của q2, không có dòng kéo theo.
  - Dòng báo thật:
    - L1: `01-…md:329 /quiz/1 [md_heading_level] tiêu đề "#### q2" thừa một #: câu hay block viết "### q2"; …`
    - L2: `01-…md:313 /quiz/0/options/1 [md_heading_level] tiêu đề "### option q1_rice" thiếu một #: … viết "#### option q1_rice"; …`
  - Mã mới đã thêm vào bảng mã của README và vào `MD_CODES`.
- **L2, phần `ids`:**
  - `ids` không đụng khối có tiêu đề sai cấp (không điền, không chèn).
  - `ids` không chèn `id:` vào khối chưa rõ loại: câu thiếu hoặc sai `format:`, block thiếu hoặc sai `type:`, từ vựng / thẻ / misconception không có trường nào.
  - Mỗi chỗ bỏ qua in một dòng, ví dụ `…md:329 bỏ qua "#### q2": tiêu đề sai cấp (…); sửa theo validate rồi chạy lại ids`. Dòng tổng thêm "· bỏ qua N khối". Exit 0, file không đổi.
  - `validate` thôi báo `md_id_missing` cho những khối đó, như tester đề xuất. Một `### q7` không có `format:` và không có `id:` nay chỉ ra một dòng `md_unknown_format`.
- **L3:** tên trường chỉ khác chữ hoa (`Format:`, `Slug:`) nay báo ở chính dòng đó và vẫn đọc giá trị, không còn "thiếu format:" ở dòng `###`. Ví dụ: `:293 /quiz/0/format [md_unknown_field] tên trường viết chữ thường: "format:", không phải "Format:"`. Frontmatter cũng vậy: `Slug:` không kèm thêm dòng "thiếu slug".
- **L4:** `md_missing_section` nay:
  - nói mục nằm giữa hai mục nào, kèm số dòng;
  - chỉ dòng gần giống tiêu đề nếu có (`### Quiz`, `##Quiz`, `# Quiz`, `Quiz`);
  - nếu không có dòng gần giống, chỉ dòng nội dung đầu tiên của mục. Tiêu chí: `###` có `type`/`format` đúng loại của mục, từ vựng có `term.*`, thẻ có `set`/`fact.*`; mục cặp hay mục đánh số thì lấy dòng `en:` lặp hoặc `1.en:`.
  - Số dòng báo giữ như quy ước ticket (dòng `##` ngay sau chỗ thiếu); vị trí chính xác nằm trong thông báo. Ví dụ:
    - `:522 /quiz [md_missing_section] thiếu mục "## Quiz"; mục này nằm giữa "## Chơi" (dòng 172) và "## Từ vựng" (dòng 522); dòng 289 "### Quiz" giống tiêu đề mục này: sửa thành "## Quiz"`
    - `:171 /learn [md_missing_section] thiếu mục "## Học"; mục này nằm giữa "## Khởi động" (dòng 29) và "## Chơi" (dòng 171); nội dung của mục có vẻ bắt đầu ở dòng 90 ("### explore"): thêm dòng "## Học" ngay trên dòng đó`
- **L5:** chỉ gộp thành một dòng "thiếu tiêu đề ### (hoặc ####) ngay phía trên dòng X" khi có dấu hiệu rõ:
  - một dòng lạ là trường mà chỉ khối `###` mới có (`id`, `format`, `type`, `version`, `dok`);
  - hoặc các dòng lạ liền nhau: từ ba dòng, hoặc cả một nhóm dòng lặp (`label.en` + `label.vi` của một `#### bank` bị xoá tiêu đề).
  - Còn lại báo từng dòng. Hai lỗi gõ không gợi ý (`xyz.en`, `qqq.vi`) ra hai dòng. Ca p1 (lặp `hint.en` + `promt.en`) ra hai dòng, dòng `promt.en` có lại gợi ý `prompt.en`. Các ca xoá tiêu đề cũ (22, 25, xoá `### fat`, `#### option`, `### new_words`) vẫn mỗi ca một dòng.
- **L6:** gợi ý tên trường bỏ những tên khối đã có: `prompt.vn` → `Có phải "prompt.vi"?`.
- Thông báo mới không dùng chữ "phần tử" (B3). Đã sửa cả hai chỗ cũ có "phần tử con".

### Test
- Thêm 7 ca vào `test/fixtures/markdown/expected.json`, mỗi ca kiểm đúng file, dòng, mã, pointer và đoạn chữ phải có trong thông báo:
  - 28 (L1), 29 (L2), 30 (L3);
  - 31, 32 (L4: dòng gần giống; dòng nội dung đầu tiên);
  - 33 (L5: hai dòng), 34 (L6).
- Ca 23 kiểm thêm chữ "giữa … (dòng 89) và … (dòng 288)" và "dòng 176 ("### tray")".
- Thêm test "ids không chèn id vào tiêu đề sai cấp hay khối chưa rõ loại". Ba bản chép (`#### q2`, `### option q1_rice`, `### q7` không `format:`/`id:`), mỗi bản kiểm:
  - `ids` exit 0, in dòng "bỏ qua", không file nào đổi;
  - `validate` ra đúng một dòng lỗi.
- `npm test` (tools/content-cli): **273 pass, 0 fail** (215 cũ + 58 markdown). `npm run typecheck`: exit 0.
- `packages/content-schema` không đổi nên không chạy lại; lần trước 98 pass.

### Chạy lại A1, A4 (đã sửa phần đọc trường trong `convert.ts`)
- A1: `npm run import -- ../../content/discoverer/an-uong-lanh-manh --out <scratch>/sk027/r2/a1/json` exit 0. `cmp` với hai fixture: `topic.json` trùng, `01-thuc-an-cho-ta-nhung-gi.json` trùng.
- A4: dùng bản chép cache `<scratch>/sk027/r2/audio-cache`, `PATH` không có `afconvert`.
  - `tts en`: 107 clip, sinh mới 0. `tts vi`: 110 clip, sinh mới 0.
  - `build`: `pack.json` `59d874acba16fe7643b2c7e59d97cfdb523e75a647b28cdcf38cefda381a00a5`, `version` `692f2e75ba89`, `content_version` `803c0cb00461`. Trùng mốc A3.
  - `check-pack.sh`: OK.
- D6: sha256 của `content/`, `packages/content-schema/`, `apps/` trùng ảnh chụp trước khi làm ticket.

### File đổi trong lần này
- `tools/content-cli/src/markdown/syntax.ts`: nhận tiêu đề sai cấp; ghi lại `###` lạc chỗ; thông báo `md_missing_section`.
- `tools/content-cli/src/markdown/convert.ts`: tên trường không phân biệt hoa thường; gợi ý tên còn thiếu; luật gộp mới; không theo dõi id của khối sai cấp hay chưa rõ loại.
- `tools/content-cli/src/markdown/ids.ts`, `command.ts`: bỏ qua và in lý do.
- `tools/content-cli/src/markdown/source.ts`: mã `md_heading_level`.
- `tools/content-cli/README.md`: bảng mã; đoạn "một lỗi một dòng"; đoạn `ids`.
- `tools/content-cli/test/markdown.test.ts`, `test/fixtures/markdown/expected.json`.

### Còn chưa chắc
- Nhận `#### <một từ>` là `###` thừa `#` chỉ khi từ đó không gần tên loại nào. `#### items` vẫn coi là gõ sai loại (`md_unknown_child`, gợi ý `item`). Một `###` có key một từ trùng tên loại (`### option`) vẫn là khối.
- `ids` bỏ qua khối thì vẫn exit 0. Nếu PM muốn exit 1 để dễ thấy hơn thì đổi một dòng.

## Kết luận (phiên chính, 2/11)

Đóng ticket. Tester kiểm lại sau sửa: B4 đạt, L1–L4 và L6 đạt, L5 đạt một phần. Các tiêu chí còn lại đã đạt từ lần đầu.

**Để lại, không chặn** (gộp vào lần sửa `content-cli` kế tiếp, hoặc sửa khi biên tập gặp thật):
- **L7 (nhẹ-trung):** `##### option …` hoặc `####option …` (thiếu dấu cách) vẫn ra 2 dòng: một dòng `md_bad_line` đúng, một dòng `md_duplicate_field` kéo theo. Cách sửa tester đề xuất: coi hai dạng này là tiêu đề sai cấp (`md_heading_level`). Tái hiện ở scratchpad `sk027-test/n/n5-five-hash/` và `n/n6-no-space/`.
- **L8 (góp ý nhẹ):** trường lặp cộng một trường gõ sai trong cùng khối vẫn có ca bị gộp thành một dòng "thiếu tiêu đề ###", nói sai nguyên nhân. Không giấu lỗi.
- **Chưa kiểm:** file có CRLF hoặc BOM với các ca tiêu đề sai cấp sau sửa.
- **`ids` gặp khối phải bỏ qua thì exit 0:** giữ nguyên. Lý do: `import` chạy sau vẫn báo lỗi ở khối đó.

**Việc kéo theo:**
- content-editor sửa TEMPLATE mục A (bước 3, đoạn "id và key") và `content/README.md`: ghi lệnh `validate`, `ids`; bỏ câu "dev chép bài sang JSON"; ghi cách làm theo quyết định 7 (phiên chính chạy lệnh hộ).
- PM xét đóng SK-017: A1 trùng từng byte là bằng chứng cho tiêu chí 2 và 6 của SK-017.
