# SK-015 · `content-cli build` tối giản: gói bài 1 để app nhúng

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: dev · Tester: tester
Nguồn: docs/ios-test-build.md mốc 1 việc C2 và "Ghi chú kỹ thuật" (gói nhúng có cấu trúc như bản tải về ở GĐ 1); technical-plan.md B4.3 (catalog, gói chủ đề, asset theo `sha256`, `rules` trong manifest), B5.3 (`rules` có một nguồn: `content/rules.json`), B8.0 (`build`); SK-001 (`Image.brief` bỏ khi build); SK-003 (`default_rules`); SK-014 (JSON có `audio.en`, cache clip)

## Mục tiêu
Dev thêm lệnh `build` vào `tools/content-cli`, gói topic, bài 1 và clip EN thành một thư mục có manifest và sha256. App nhúng thư mục này (SK-016) và đọc nó giống hệt cách sẽ đọc gói tải về ở GĐ 1.

## Phạm vi
- Lệnh: `node tools/content-cli/src/cli.ts build <topic.json> <lesson.json>... --out <thư mục>`. Đề xuất `--out content/.build/pack`. Input là JSON đầu ra của SK-014 (đã có `audio.en`).
- **Cấu trúc theo B4.3:**
  ```
  <out>/
    catalog/v1/manifest.json
    topics/<topic_id>/<version>/pack.json   # topic + mọi bài có trong input
    assets/<sha256>.m4a                     # chép từ content/.audio/en/ theo index.json
  ```
- **`manifest.json`:**
  - `schema_version`, `generated_at`, `content_version`;
  - danh sách chủ đề: `id`, `slug`, `age_group`, `order`, `title`, `is_free`, `version`, đường dẫn gói, `sha256`, `size`, `min_app_version`;
  - `rules` theo nhóm tuổi;
  - `assets`: mỗi file `sha256`, `size`, `kind` (`audio`), `lang` (`en`).
- **`pack.json`:** topic và các bài như schema v1, bỏ `brief` của mọi `Image` (SK-001). Mỗi `audio.en` trỏ tới một file có thật trong `assets/`.
- **`content/rules.json`** (B5.3: một nguồn cho `rules`) chưa có. Dev tạo file này với giá trị:
  - đúng `default_rules` của `packages/content-schema/test-vectors/` (ngưỡng 5/6, `max_tries` 2…);
  - cộng XP của B4.4;
  - cộng giọng mặc định theo `language_mode` của B4.1.

  PM giao việc tạo file này cho dev vì đây là tham số kỹ thuật, không phải chữ cho trẻ. Đổi giá trị về sau vẫn do Duy chốt.
- `build` kiểm trước khi ghi:
  - input qua validate của `packages/content-schema` (gọi thư viện, không chép luật);
  - mọi `audio.en` có clip trong cache;
  - không có hash trùng mà khác nội dung.

  Sai thì exit 1, báo file và JSON pointer.
- Chạy lại với cùng input cho ra thư mục giống hệt, trừ `generated_at`.
- Bài có `ai_draft: true` thì in cảnh báo, vẫn build (bản thử).

## Ngoài phạm vi
- `publish`, upload lên R2 hay Supabase Storage, ghi `content_publishes`.
- Hình (`asset` của `Image`): chưa có `content-cli assets`. Gói bản thử không có hình; app vẽ hình giữ chỗ (SK-012).
- Clip VI. Chặn theo `min_app_version` của app đang phổ biến.
- Schema JSON cho manifest và `pack.json`: ghi định dạng trong README của content-cli. Đưa vào `packages/content-schema` khi tới GĐ 1.

## Tiêu chí nghiệm thu
- [ ] Theo README:
  ```sh
  npm run build -- ../../content/.build/tts/discoverer/an-uong-lanh-manh/topic.json \
                   ../../content/.build/tts/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json \
                   --out ../../content/.build/pack
  ```
  exit 0. In số chủ đề, bài, asset và tổng dung lượng gói.
- [ ] Mọi `sha256` và `size` trong manifest khớp file thật. Kiểm bằng `shasum -a 256` trên toàn bộ file, có script và dán output.
- [ ] `pack.json` không còn trường `brief` (`grep -c '"brief"'` → 0). Mọi `audio.en` có file `assets/<hash>.m4a`.
- [ ] Số file trong `assets/` bằng số `audio.en` khác nhau trong `pack.json`.
- [ ] Xoá một clip khỏi cache rồi chạy `build` → exit 1, báo đúng pointer của chuỗi thiếu clip.
- [ ] Chạy 2 lần: `diff -r` hai thư mục chỉ khác `generated_at`.
- [ ] `content/rules.json` hợp lệ JSON; giá trị trùng `default_rules` của vector (kiểm bằng script so khoá và giá trị). Manifest có `rules.discoverer` chép từ file này.
- [ ] `content/.build/` vẫn ngoài git.
- [ ] Không sửa file ngoài `tools/content-cli/` và `content/rules.json` (trừ ghi chú trong ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- SK-014 (JSON có `audio.en` và cache clip).
- Nên chạy lại sau SK-017, để gói có bản fixture đã sửa `sentence.vi`.
- SK-016 (ContentKit đọc gói) chờ ticket này. Đổi định dạng manifest hay `pack.json` thì ghi vào SK-016.

**Quyết định đã ghi** (PM đề xuất 28/10)
1. Theo bố cục B4.3 (`catalog/…/manifest.json`, `topics/…/pack.json`, `assets/<sha256>`), thay cho tách `topic.json` và `lesson.json` như dòng C2 của ios-test-build. Lý do: cùng mục ghi chú kỹ thuật yêu cầu gói nhúng giống hệt bản tải về ở GĐ 1.
2. Gói nằm ngoài git (`content/.build/pack`). Cách app nhúng gói quyết ở SK-016.
3. (dev 28/10) **`version` của chủ đề là hash nội dung**, không phải số đếm: 12 ký tự hex đầu của sha256 trên JSON chuẩn tắc (khoá sắp xếp) của `schema_version` + `topic` + `lessons` của gói. Lý do: build không có trạng thái để biết bản trước là số mấy; hash bảo đảm "một bản là bất biến" (B4.3), nội dung đổi thì đường dẫn đổi, chạy lại thì giữ nguyên. `content_version` của manifest tính cùng cách trên `schema_version` + `topics` + `rules` + `assets` (không gồm `generated_at`). Nếu GĐ 1 muốn số tăng dần thì `publish` gán, đổi ở một chỗ.
4. (dev 28/10) **`pack.json` = `{ schema_version, topic_id, version, topic, lessons }`.** `topic` và mỗi phần tử `lessons` là đúng file schema v1, chỉ bỏ `brief`; build kiểm lại bằng content-schema. Không có `generated_at` trong `pack.json`, nên sha256 của gói chỉ đổi khi nội dung đổi.
5. (dev 28/10) **`content/rules.json` có cả 3 nhóm tuổi**, khoá phẳng như B4.4. Luật chấm của cả 3 nhóm đúng `default_rules` (B4.4 v1 chưa phân theo tuổi). Tên `xp_mastery_review` do dev đặt (B4.4 chỉ ghi "ôn lại đạt thành thạo 20"). `default_voice_mode` theo `language_mode` với giá trị `bilingual` · `en_first` · `vi_first` (từ id `bilingual`/`enFirst`/`viFirst` của canvas Welcome, viết `snake_case` như DB); Explorer luôn `both`. Định dạng ở `tools/content-cli/schema/rules.schema.json`, object đóng. Manifest chép **nguyên file** vào `rules` (`rules.discoverer` là một khoá trong đó).
6. (dev 28/10) **`manifest.assets[]` có thêm `path`** (`assets/<sha256>.m4a`) ngoài 4 khoá của ticket, vì đuôi file đổi theo loại (m4a, sau này webp); app không phải tự ghép đuôi.
7. (dev 28/10) **`min_app_version` của chủ đề** = lớn nhất của `--min-app-version` (mặc định `0.1.0`, là `MARKETING_VERSION` của bản thử iOS) và mọi `min_app_version` của block trong chủ đề (tìm theo schema `AppVersion`).
8. (dev 28/10) **Build chặt:** `Spoken` thiếu `audio.en` là lỗi (input chưa qua tts). `Image.asset` có giá trị cũng là lỗi, vì chưa có lệnh `assets` để có file; 36 Image chưa có hình thì chỉ đếm và in ra. `AssetHash` ở chỗ không phải `Spoken.audio` hay `Image.asset` là lỗi. Mọi vị trí đều tìm theo JSON Schema (như `tts` tìm `Spoken`), không theo tên trường.
9. (dev 28/10) **`--out` bị thay cả thư mục.** Build ghi vào thư mục tạm cạnh `--out`, tự kiểm sha256 và size từng file, rồi đổi tên thay thư mục cũ, nên file thừa của lần trước không sót lại. Lệnh từ chối (exit 2, không xoá gì) nếu `--out` có thứ khác ngoài `catalog/`, `topics/`, `assets/`. Build chỉ đọc cache, không ghi.
10. (dev 28/10) **Chỉ bỏ `brief`.** `oak_unit_ref`, `misconceptions[].note`, `recall_from.note` (chữ nội bộ, không cho trẻ) vẫn nằm trong gói, vì ticket chỉ nói `brief` và `recall_from.note` là trường bắt buộc của schema. Xem câu hỏi còn mở.

**Câu hỏi còn mở**
- Có cần manifest liệt kê chủ đề 2–6 và bài 2–5 (chỉ tên, chưa có nội dung) để Trang chủ và màn Chủ đề giống canvas không? Xem SK-011. Nếu có thì content-editor phải viết tên EN/VI trước. *(dev)* Build đã nhận nhiều chủ đề và chủ đề chưa có bài (chỉ cảnh báo), nhưng `topic.json` bắt buộc đủ trường (strand, level, difficulty…) và tên cần chạy tts. Nếu chỉ muốn "tên + khoá" thì cần một kiểu mục rút gọn trong manifest; PM chọn.
- *(dev → PM)* `lesson_attempts.content_version` (B5.3) nên ghi **`topics[].version`** của gói đang học, không phải `content_version` của manifest. `content_version` đổi khi bất kỳ chủ đề hay `rules` nào đổi, nên `p_correct` theo (`item_id`, `content_version`) sẽ bị chia nhỏ không cần thiết. Ảnh hưởng SK-021, SK-022, SK-016.
- *(dev → Duy)* Giá trị `rules` cho Explorer và Scientist đang chép y Discoverer (trừ giọng mặc định của Explorer). `max_tries`, ngưỡng cho bé 5–7 có cần khác không? `rules.max_profiles` (B4.3, B5.5) chưa có trong file vì không theo nhóm tuổi và chưa có số; khi chốt thì thêm một khoá cấp tài khoản ngoài 3 nhóm tuổi.
- *(dev → PM)* Có bỏ `oak_unit_ref` và `misconceptions[].note` khỏi gói không (chữ nội bộ, phụ huynh và trẻ không thấy)? Bỏ được ngay ở build vì là trường tuỳ chọn.
- *(dev → PM, GĐ 1)* `manifest.assets` liệt kê mọi asset của cả danh mục: bài 1 đã 107 dòng, manifest 30 KB. 34 bài có thể lên khoảng 1 MB, tải mỗi lần mở app (dù có ETag). Đề xuất trước GĐ 1 chuyển danh sách asset vào từng `pack.json` (hoặc một file asset theo chủ đề).

## Kết quả (dev)

28/10/2026. Chạy trên máy Duy (macOS, Node 24.18). Chưa commit.

**Đã làm**
- `tools/content-cli/src/build/command.ts`: lệnh `build` (đọc, kiểm, tạo gói, ghi qua thư mục tạm rồi thay `--out`). `src/build/rules.ts` + `schema/rules.schema.json`: đọc và kiểm `content/rules.json` bằng Ajv.
- `src/cli.ts`: lệnh `build`, cờ `--out` (mặc định `content/.build/pack`), `--cache`, `--rules`, `--min-app-version`. `package.json`: `npm run build`.
- `src/spoken.ts`: thêm `locateCommon()` để tìm `Image`, `AssetHash`, `AppVersion` theo schema (cùng bộ duyệt với `Spoken`). `src/cache.ts`: thêm `bySha256()` (chỉ đọc). `src/paths.ts`: 2 đường dẫn mặc định.
- `scripts/check-pack.sh`: kiểm gói độc lập với code build (`shasum`, `stat`, `jq`, `grep`), cho tiêu chí 2–4 và cho tester.
- Test: `test/build.test.ts` (10 test, cache giả trong thư mục tạm, không đụng cache thật), `test/rules.test.ts` (6 test, so `rules.json` với vector). `README.md`: mục "build: gói nội dung", định dạng manifest, `pack.json`, `rules.json`.
- `content/rules.json`: tạo mới (quyết định 5).
- Không cần `tools/content-cli/.gitignore`: `.gitignore` gốc đã ignore `content/.build/`.

**Gói thực tế:** `/Users/buiduyluu/Documents/personal/science-kids/content/.build/pack`, 109 file, 2.536.507 byte (2,4 MB; `du` 2,6 MB). Manifest 30.122 byte, `pack.json` 50.994 byte, 107 clip 2,3 MB.
```
content/.build/pack/
├── catalog/v1/manifest.json
├── topics/d3a514ef-02cd-4386-a358-f01e425a10f8/5ed502d1cb23/pack.json
└── assets/
    ├── 027429033a2b0ce3ed42fd6750ee42310972a8a83a3b6361fe047c571810ce8b.m4a
    └── … (107 file <sha256>.m4a)
```
Manifest rút gọn:
```json
{
  "schema_version": 1,
  "generated_at": "2026-10-28T14:45:35.601Z",
  "content_version": "38dd0baa2f03",
  "topics": [{
    "id": "d3a514ef-02cd-4386-a358-f01e425a10f8", "slug": "an-uong-lanh-manh", "age_group": "discoverer", "order": 1,
    "title": { "en": "Healthy eating", "vi": "Ăn uống lành mạnh", "audio": { "en": "ea2299ee…" } },
    "is_free": true, "version": "5ed502d1cb23",
    "path": "topics/d3a514ef-02cd-4386-a358-f01e425a10f8/5ed502d1cb23/pack.json",
    "sha256": "30061a609ebf9fe20cd5d54eaec58bf0da1f5c61d44f60b855103032afae859b", "size": 50994,
    "min_app_version": "0.1.0"
  }],
  "rules": { "explorer": { … }, "discoverer": { "max_tries": 2, "partial_order_min": null, "pass_threshold": { "num": 5, "den": 6 }, "mastery_gap_days": 1, "rest_days_per_week": 1, "warmup": { … }, "xp_per_correct": 10, "xp_lesson_complete": 20, "xp_game_complete": 10, "xp_mastery_review": 20, "default_voice_mode": { "bilingual": "both", "en_first": "en", "vi_first": "both" } }, "scientist": { … } },
  "assets": [{ "sha256": "02742903…", "size": 14976, "kind": "audio", "lang": "en", "path": "assets/02742903….m4a" }, "… 107 mục"]
}
```
`pack.json`: `{ "schema_version": 1, "topic_id": "d3a514ef-…", "version": "5ed502d1cb23", "topic": { …topic.json… }, "lessons": [ { …bài 1… } ] }`.

**Lệnh của tiêu chí 1** (exit 0, chạy 0,5 s):
```
Build gói nội dung · schema v1 · content_version 38dd0baa2f03
Input: topic.json, 01-thuc-an-cho-ta-nhung-gi.json
Chủ đề: 1 · bài: 1 · asset: 107 (audio en 107)
  discoverer #1 an-uong-lanh-manh: 1 bài · version 5ed502d1cb23 · min_app_version 0.1.0 · pack.json 49,8 KB
Hình: 0 asset · 36 Image chưa có hình (app vẽ hình giữ chỗ); đã bỏ brief
Rules: explorer, discoverer, scientist (từ content/rules.json)
Tổng dung lượng gói: 2,4 MB (2.536.507 byte, 109 file) · asset 2,3 MB · manifest 29,4 KB
Gói: content/.build/pack (manifest: catalog/v1/manifest.json)
Cảnh báo: 2
  content/.build/tts/discoverer/an-uong-lanh-manh/topic.json: ai_draft = true (bản nháp AI chưa duyệt); vẫn build vì là bản thử
  content/.build/tts/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json: ai_draft = true (bản nháp AI chưa duyệt); vẫn build vì là bản thử
```
(Đường dẫn ngoài `tools/content-cli` thật ra in tuyệt đối; ở đây rút gọn.)

**Theo từng tiêu chí**

| # | Tiêu chí | Kết quả |
| --- | --- | --- |
| 1 | Lệnh theo README, exit 0, in số chủ đề, bài, asset, dung lượng | Pass. Output ở trên |
| 2 | Mọi `sha256`, `size` trong manifest khớp file thật, kiểm bằng `shasum -a 256` | Pass. `sh tools/content-cli/scripts/check-pack.sh content/.build/pack` (từ gốc repo): `sha256 + size: 108 file thật khớp manifest (1 pack.json, 107 asset); không file nào thừa hay thiếu` · `tên asset = sha256 nội dung: đúng cho mọi file trong assets/` · `OK`, exit 0. Thử trên bản sao hỏng (thêm 1 byte vào một clip, thêm 1 file lạ): script báo cả hai, exit 1 |
| 3 | `grep -c '"brief"'` = 0; mọi `audio.en` có file | Pass. Script in `pack.json: grep -c '"brief"' = 0 · audio: 128 chỗ dùng, 107 hash khác nhau, thiếu file: 0`. Thêm: tách `topic` và `lessons[0]` từ `pack.json` rồi chạy `validate.mjs` của content-schema: `OK: 2 file hợp lệ (1 topic, 1 lesson)`. Unit test kiểm trả `brief` về thì `topic`, bài trùng input |
| 4 | Số file `assets/` = số `audio.en` khác nhau | Pass. `assets/: 107 file · hash audio khác nhau trong pack.json + manifest: 107` |
| 5 | Xoá một clip khỏi cache → exit 1, đúng pointer | Pass. Chuyển clip "rice" (`en/eb189b4a….m4a`, sha256 `2d2074ee…`, dùng ở 3 chỗ) ra ngoài, chạy lệnh tiêu chí 1: exit 1, 3 dòng `…/01-thuc-an-cho-ta-nhung-gi.json /learn/0/groups/0/examples/0/audio/en thiếu clip en: …/content/.audio/en/eb189b4a….m4a không còn trong cache (index.json vẫn ghi sha256 2d2074eefae6…). Chạy lại content-cli tts; clip sinh lại có hash mới · "rice"`, cùng `/quiz/0/options/1/label/audio/en` và `/quiz/4/options/1/label/audio/en`; đúng 3 pointer `jq` tìm độc lập. `Không build được (3 lỗi). Chưa ghi gì vào …/content/.build/pack.`; sha256 cả gói trước và sau giống nhau. Trả clip về (`mv`), sha256 vẫn `2d2074ee…`. Thử thêm với `/quiz/1/hint` (1 chỗ dùng): đúng 1 dòng `/quiz/1/hint/audio/en` |
| 6 | Chạy 2 lần: `diff -r` chỉ khác `generated_at` | Pass. Lần 1 vào `content/.build/pack`, lần 2 vào thư mục ở scratchpad. `diff -r` chỉ in `< "generated_at": "2026-10-28T14:43:45.809Z"` / `> "generated_at": "2026-10-28T14:43:47.184Z"`. `shasum -a 256` 109 file: 108 trùng, chỉ khác `manifest.json`; bỏ dòng `generated_at` thì manifest trùng (`65df52f1…` cả hai) |
| 7 | `rules.json` hợp lệ JSON, trùng `default_rules`, manifest có `rules.discoverer` | Pass. `jq -e .` OK. 6 file vector có 1 bản `default_rules` duy nhất. Script `jq` so từng nhóm: `explorer/discoverer/scientist: 6 khoá luật chấm trùng default_rules · khoá thêm: default_voice_mode, xp_game_complete, xp_lesson_complete, xp_mastery_review, xp_per_correct`. `manifest.rules.discoverer = rules.json .discoverer`, `manifest.rules` = toàn bộ file. `node --test test/rules.test.ts`: 6/6 |
| 8 | `content/.build/` vẫn ngoài git | Pass. `git check-ignore -v content/.build/pack/catalog/v1/manifest.json` → `.gitignore:16:content/.build/`. `git status --porcelain -uall` không có file nào trong `content/.build` hay `.m4a` |
| 9 | Chỉ sửa trong `tools/content-cli/` và `content/rules.json` (và ticket) | Pass. sha256 của 187 file (`packages/content-schema` trừ `node_modules`, `content/` trừ `.build`, `content/.audio`, `.gitignore`, `technical-plan.md`, `docs/backlog/README.md`) trước và sau: chỉ thêm `content/rules.json`. 107 clip và `index.json`: bytes và mtime không đổi (riêng mtime thư mục `content/.audio/en/` đổi do bước 5 chuyển clip ra rồi trả về). JSON đầu ra của tts không đổi. Không commit |

`npm test`: 84/84 pass (68 cũ + 10 build + 6 rules). `npm run typecheck`: sạch.

**Việc ios-dev cần biết cho SK-016**
- Nhúng thư mục `content/.build/pack` (folder reference). Gốc gói có đúng 3 thư mục `catalog/`, `topics/`, `assets/`. Thư mục bị thay cả khi build lại (đổi tên thư mục, không ghi đè từng file).
- Đọc `catalog/v1/manifest.json` → chọn chủ đề trong `topics[]` → đọc `topics[].path` → so sha256 và `size` của `pack.json` với `topics[].sha256`, `size` → decode `{ schema_version, topic_id, version, topic, lessons }`. `topic` và `lessons[]` là đúng `Topic`, `Lesson` của SK-009 (schema v1), chỉ không có `brief` (trường tuỳ chọn).
- **Tra clip theo hash:** `Spoken.audio.en` (64 hex) → file `assets/<hash>.m4a`; trước khi phát, so sha256 và `size` với dòng cùng `sha256` trong `manifest.assets` (dựng một dictionary `sha256 → asset` từ manifest). `manifest.topics[].title` cũng có `audio.en`, clip nằm trong `assets/`.
- Chưa có hình: mọi `Image` chỉ có `alt`, app vẽ hình giữ chỗ (SK-012). Chưa có `audio.vi`.
- `rules` ở `manifest.rules.<age_group>`: luật chấm (khớp test vector SK-003) và `default_voice_mode[language_mode]` cho onboarding (TODO của SK-011). Giá trị `language_mode` dùng `bilingual` · `en_first` · `vi_first`.
- `generated_at` đổi mỗi lần build: đừng dùng làm khoá cache, dùng `content_version` (danh mục) hoặc `topics[].version` (chủ đề). Đề xuất ghi `topics[].version` vào `content_version` của lần làm bài (câu hỏi còn mở).
- Decoder nên bỏ qua khoá lạ trong manifest, vì GĐ 1 có thể thêm khoá.
- Sau SK-017 (sửa fixture) phải chạy lại cả hai: `npm run tts -- <fixture>… --out ../../content/.build/tts/discoverer/an-uong-lanh-manh` (vài giây, dùng cache) rồi `npm run build -- …`. Chữ EN không đổi thì clip và asset giữ nguyên; `version` chủ đề đổi vì `sentence.vi` đổi.

**Việc tester cần kiểm**
- `cd tools/content-cli && npm test && npm run typecheck`.
- Từ gốc repo: chạy lệnh tiêu chí 1, rồi `sh tools/content-cli/scripts/check-pack.sh content/.build/pack`.
- Tiêu chí 5 nên làm trên bản clone của cache (`cp -c -R content/.audio <tmp>` rồi `--cache <tmp>`) để cache thật không bị đụng.

**Đề xuất (ngoài phạm vi, chưa làm)**
1. content-schema (người giữ SK-001): thêm kiểm chéo "`order` của bài không trùng trong một chủ đề"; build đang sắp bài theo `order`.
2. Manifest thêm `topics[].sensitive` trước GĐ 1, để app ẩn chủ đề nhạy cảm trước khi tải gói (B4.2). Hiện cờ này chỉ nằm trong `pack.json`.
3. Vector SK-003 (tester): `default_rules` giờ là tập con của `rules.json` (thiếu 5 khoá XP và giọng). Khi viết vector cho XP thì thêm các khoá `xp_*` vào `default_rules` của cả 6 file; `test/rules.test.ts` sẽ báo nếu lệch.

**Còn chưa chắc / lưu ý**
- Chưa chạy app đọc gói (SK-016 làm). Định dạng mới chỉ kiểm bằng script và content-schema.
- `check-pack.sh` dùng `stat -f %z` của macOS; Linux cần `stat -c %s`.
