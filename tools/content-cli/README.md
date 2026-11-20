# content-cli

CLI cho pipeline nội dung của Science Kids ở MVP (technical-plan.md B8.0). Hiện có ba lệnh: `tts` sinh clip giọng đọc cho mọi chuỗi `Spoken` của file topic/lesson, chạy trên máy, rồi ghi bản sao JSON có `audio.en` / `audio.vi`: tiếng Anh bằng **Kokoro-82M v1.0** ([SK-014](../../docs/backlog/SK-014-content-cli-tts-en.md)), tiếng Việt bằng **VieNeu-TTS v3 Turbo**, giọng Kim Thanh ([SK-024](../../docs/backlog/SK-024-content-cli-tts-vi.md), mục "Tiếng Việt" bên dưới); `build` gói topic, bài và clip thành thư mục gói nội dung có manifest và sha256 cho app nhúng ([SK-015](../../docs/backlog/SK-015-content-cli-build-pack.md)); `validate` kiểm file JSON bằng content-schema rồi theo luật soạn của nhóm tuổi ([SK-026](../../docs/backlog/SK-026-quiz-formats-by-age.md), mục "validate: luật theo nhóm tuổi" bên dưới). `validate`, `import`, `ids` đọc thẳng bài markdown của biên tập, báo lỗi theo file và số dòng, ghi JSON schema v1 và điền id ([SK-027](../../docs/backlog/SK-027-content-cli-import-markdown.md), mục "Markdown: validate, import, ids" bên dưới). Các lệnh `assets`, `publish` làm sau.

## Cần có

- macOS: `afconvert`, `afinfo` có sẵn trong hệ điều hành (mã hoá AAC, đo thời lượng, ghép file nghe thử).
- Node `^22.18.0` hoặc `>= 23.6.0`. Code `.ts` chạy thẳng nhờ type stripping, không có bước build.
- Khoảng 330 MB trống cho model (bản fp32).

## Cài đặt

```sh
cd tools/content-cli
npm install
```

npm 11 sẽ báo `allow-scripts` cho `onnxruntime-node`, `sharp`, `protobufjs`. Không cần cho phép: trên macOS, thư viện ONNX Runtime đã nằm sẵn trong gói npm (script chỉ tải bản CUDA cho Linux), `sharp` chỉ dùng cho ảnh, `protobufjs` chỉ in thông báo.

`npm audit` báo lỗ hổng mức high ở `sharp` (thư viện ảnh, phụ thuộc của transformers.js). CLI không xử lý ảnh nên không chạm tới phần đó.

## Tải model

Lần chạy `tts` đầu tiên tự tải model nếu thiếu. Muốn tải trước:

```sh
npm run fetch-model                 # bản fp32 (mặc định), 325,5 MB
npm run fetch-model -- --dtype q8   # bản q8, 92,4 MB, nếu muốn thử
```

Model đặt ở `tools/content-cli/.models/onnx-community/Kokoro-82M-v1.0-ONNX/` (ngoài git). Đây là **lần duy nhất** CLI dùng mạng. Các URL được tải, cùng một commit đã ghim (`1939ad2a8e416c0acfeecc08a694d14ef25f2231`, 08/02/2025):

```
https://huggingface.co/onnx-community/Kokoro-82M-v1.0-ONNX/resolve/1939ad2a8e416c0acfeecc08a694d14ef25f2231/config.json
https://huggingface.co/onnx-community/Kokoro-82M-v1.0-ONNX/resolve/1939ad2a8e416c0acfeecc08a694d14ef25f2231/tokenizer.json
https://huggingface.co/onnx-community/Kokoro-82M-v1.0-ONNX/resolve/1939ad2a8e416c0acfeecc08a694d14ef25f2231/tokenizer_config.json
https://huggingface.co/onnx-community/Kokoro-82M-v1.0-ONNX/resolve/1939ad2a8e416c0acfeecc08a694d14ef25f2231/onnx/model.onnx
```

Mỗi file được kiểm kích thước và sha256 (ghi trong `src/tts/kokoro-model.ts`) trước khi dùng; sai thì xoá và báo lỗi. Giọng `af_heart.bin` có sẵn trong gói npm `kokoro-js`, không tải riêng. Khi sinh clip, transformers.js chạy với `allowRemoteModels = false`, chỉ đọc file trong `.models/`.

Model Kokoro-82M và `kokoro-js` dùng giấy phép Apache-2.0, dùng thương mại được.

## Chạy

```sh
cd tools/content-cli
npm run tts -- ../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/topic.json \
               ../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json \
               --out ../../content/.build/tts/discoverer/an-uong-lanh-manh
```

Hoặc `node src/cli.ts tts <file.json>... --out <thư mục>`. Đường dẫn tương đối tính từ thư mục bạn gõ lệnh.

Lệnh làm theo thứ tự:

1. Kiểm input bằng `packages/content-schema` (Ajv + zod + kiểm chéo, như `validate.mjs`). Input sai thì dừng, exit 1. Chạy bài lẻ thì đưa kèm `topic.json` của chủ đề.
2. Lấy mọi chuỗi `Spoken` theo JSON Schema: chỗ nào schema `$ref` tới `common.schema.json#/$defs/Spoken` (đi theo `$ref`, `allOf`, `if/then`, `properties`, `additionalProperties`, `items`…), không đoán theo tên trường. `Text` (alt của hình, `recall_from.note`, `statement`/`correction` của misconception) không được đọc.
3. Chuẩn hoá chữ EN (xem dưới). Chữ sau chuẩn hoá là thứ được băm và được đọc. Chuỗi trùng nhau dùng chung một clip.
4. Clip đã có trong cache thì dùng lại; chưa có thì sinh: Kokoro (24 kHz) → WAV 16-bit → `afconvert` ra M4A AAC mono 64 kbps CBR.
5. Ghi bản sao từng file input vào `--out`, giữ nguyên cấu trúc, mỗi `Spoken` có thêm `audio.en` = **sha256 của bytes file m4a** (`AssetHash` của SK-001). `audio.vi` không đụng tới. File nguồn không bao giờ bị ghi đè (lệnh từ chối nếu `--out` là thư mục nguồn).
6. Kiểm lại bản sao bằng content-schema, in báo cáo, ghi `content/.audio/report-<chủ đề>-<số bài>.json`.
7. Với mỗi bài trong input: ghép file nghe thử `content/.build/tts/review-<số bài>.m4a` + `.txt`.

Tuỳ chọn:

| Cờ | Ý nghĩa |
| --- | --- |
| `--out <thư mục>` | Nơi ghi bản sao JSON (bắt buộc) |
| `--force` | Sinh lại mọi clip, bỏ qua cache |
| `--no-review` | Không ghép file nghe thử |
| `--cache <thư mục>` | Cache clip, mặc định `content/.audio` |
| `--review-dir <thư mục>` | Nơi ghi file nghe thử, mặc định `content/.build/tts` |
| `--dtype fp32\|fp16\|q8` | Bản model, mặc định `fp32` |
| `--voice <giọng>` | Giọng Kokoro, mặc định `af_heart` |
| `--lang en` | Thứ tiếng; MVP chỉ có `en` |

Exit `0` = xong, `1` = lỗi nội dung hoặc lỗi chạy, `2` = sai cách gọi.

## Cache

```
content/.audio/                  (ngoài git)
├── en/<khoá>.m4a                một clip cho mỗi chuỗi EN đã chuẩn hoá
├── vi/<khoá>.m4a                một clip cho mỗi chuỗi VI đã chuẩn hoá (SK-024)
├── index.json                   theo khoá: sha256 bytes m4a, số byte, thời lượng ms, chữ đã chuẩn hoá, model, giọng, ngày sinh
└── report-<chủ đề>-<nn>[-vi].json  báo cáo lần chạy gần nhất của bài đó
```

- **Khoá** = sha256 của JSON chuẩn tắc gồm: chữ đã chuẩn hoá, thứ tiếng, model id + commit + dtype + sha256 file model, giọng + sha256 file giọng, tốc độ, sample rate, phiên bản `kokoro-js` / transformers.js / onnxruntime-node / phonemizer, cách xử lý ô trống, và tham số mã hoá (`afconvert`, AAC, 1 kênh, 64000 bps, CBR, quality 127). Đổi bất kỳ thứ gì trong đó thì clip tương ứng sinh lại ở lần chạy sau; không cần xoá tay.
- **Tên file là khoá** (theo input) để chạy lại không phải sinh hay băm lại. **`audio.en` là sha256 của bytes** (theo nội dung). SK-015 chép clip vào gói thành `assets/<sha256>.m4a`, tra `index.json` để biết khoá nào ứng với hash nào.
- Dùng lại khi khoá có trong `index.json` và file còn đúng số byte. Có file mà mất dòng trong `index.json` thì đọc lại file (không sinh lại).
- EN: `afconvert` ghi thời điểm tạo vào file m4a, nên **sinh lại cùng một câu cho ra bytes khác, hash khác**. Chạy lại bình thường không đổi gì; chỉ `--force` hoặc xoá cache mới làm đổi `audio.en`. VI xoá ngày giờ nên sinh lại ra cùng hash (mục "Tiếng Việt").

Xoá cache:

```sh
rm -rf content/.audio                    # toàn bộ clip, lần sau sinh lại hết (~1 phút cho bài 1)
rm content/.audio/en/<khoá>.m4a          # một clip, lần sau chỉ sinh lại clip đó
rm -rf tools/content-cli/.models         # model, lần sau tải lại
```

## Chuẩn hoá EN (`src/normalize/en.ts`)

| Luật | Ví dụ |
| --- | --- |
| Ô trống `{1}`, `{2}`… của `fill_blank_bank` thành quãng ngắt, **không** đọc "one" | `need food, water and {1} to live.` → `need food, water and … to live.` |
| Số nguyên, kiểu Anh có "and" | `105` → `one hundred and five`, `1,250` → `one thousand two hundred and fifty` |
| Năm sau từ báo (`in`, `since`, `from`, `until`, `by`, `before`, `after`, `around`, `during`, `year`…) và trước `BC`/`AD`; thập niên | `in 1990` → `in nineteen ninety`, `in 2026` → `in twenty twenty-six`, `1990s` → `nineteen nineties` |
| Số 4 chữ số đứng một mình: đọc số đếm và **cảnh báo** để biên tập thêm từ báo nếu là năm | `It was 1990.` → cảnh báo `maybe_year` |
| Số thứ tự | `1st` → `first`, `22nd` → `twenty-second` |
| Thập phân, phân số, khoảng, số âm, giờ, phần trăm, đơn vị sau số | `1.5 kg` → `one point five kilograms`, `3/4` → `three quarters`, `5-7` → `five to seven`, `-5°C` → `minus five degrees Celsius`, `7:30` → `seven thirty`, `50%` → `fifty percent` |
| Ký hiệu và viết tắt đọc đầy đủ | `&` → `and`, `+` → `plus`, `=` → `equals`, `e.g.` → `for example` |
| Không đọc được thì **cảnh báo**, không đoán: `/` ngoài phân số, chữ viết tắt in hoa (`DNA`), chữ số còn sót (`H2O`), ký tự ngoài tiếng Anh | |
| Bỏ khoảng trắng thừa, bỏ khoảng trắng trước dấu câu | |

Cảnh báo in ở cuối báo cáo kèm file và JSON pointer; biên tập sửa cách viết trong markdown.

**Ô trống.** Kokoro đọc `…` giữa câu chỉ ngắt khoảng 0,27 s, như một dấu phẩy, nên trẻ không nhận ra có chỗ trống. CLI tách câu tại ô trống, đọc từng phần (phần trước giữ `…` để giọng ngừng lửng), rồi nối lại: khoảng lặng ở mép hai đoạn tạo quãng ngắt khoảng 0,8 s. Ô trống đứng đầu câu thì chèn 0,6 s lặng. Cách này nằm trong khoá cache.

## File nghe thử

`content/.build/tts/review-01.m4a`: 10 câu và toàn bộ từ vựng (từ + câu ví dụ), cách nhau 0,7 s. `review-01.txt` ghi thứ tự, mốc giây, `file#JSON pointer`, chữ EN và chữ đã đọc nếu khác. 10 câu chọn theo luật chung (`src/tts/review.ts`): tiêu đề bài, `objective`, `key_points` đầu, câu điền từ của câu khởi động và câu quiz `fill_blank_bank` đầu tiên, lời nhân vật ở câu `true_false` có `speaker`, `hint` của câu điền từ quiz, `explanation_correct` câu 1, lời nhắn mâm cơm `balanced`, nhãn `instruction` của câu misconception.

## build: gói nội dung

```sh
cd tools/content-cli
npm run build -- ../../content/.build/tts/discoverer/an-uong-lanh-manh/topic.json \
                 ../../content/.build/tts/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json \
                 --out ../../content/.build/pack
```

Hoặc `node src/cli.ts build <topic.json> <lesson.json>... [--out <thư mục>]`. Input là **JSON đầu ra của `tts`** (có `audio.en`), không phải fixture gốc. Chạy mất dưới 1 giây, không dùng mạng, không cần model. Ảnh (SK-033) lấy từ file chọn ảnh `content/images/…` và cache `content/.images/` do `images fetch` ghi (mục "Ảnh: images search, chọn, images fetch"); hình ghép và hình tự vẽ là file trong repo (`content/images/composed/…`, `content/images/own/…`), cũng đi qua `images fetch`.

Lệnh làm theo thứ tự, và chỉ ghi khi mọi bước kiểm đều qua:

1. Kiểm input bằng `validateDocuments` của `packages/content-schema` (Ajv + zod + kiểm chéo). Cần ít nhất một `topic.json`; bài nào cũng phải có topic của nó trong input.
2. Đọc `content/rules.json`, kiểm theo `schema/rules.schema.json`. Rồi chạy luật soạn theo nhóm tuổi như `validate` (SK-026): lỗi in cùng dòng `<file> <pointer> [<mã>] <thông báo>` và chặn build; cảnh báo in ở mục Cảnh báo. Ở `build`, `format_not_rendered` là **lỗi**. Nhóm tuổi của chủ đề không có trong file, hoặc không có `authoring`, thì báo `age_rules_missing`.
3. Tìm mọi `AssetHash` theo JSON Schema (như cách `tts` tìm `Spoken`):
   - mọi `Spoken` phải có `audio.en`;
   - mỗi `audio.<lang>` phải có clip trong cache: có dòng trong `index.json` với `sha256` đó, file còn, và sha256 thật của bytes file đúng bằng hash (không có hash trùng mà khác nội dung);
   - `Image.asset` viết sẵn trong nội dung là lỗi: `asset` do build điền (bước 3b);
   - `AssetHash` ở chỗ khác thì báo lỗi.
3b. Ảnh (SK-033): với mỗi `Image`, tìm khoá hình của nó trong file chọn ảnh của bài (`--images`, mặc định `content/images/<age_group>/<topic_slug>/<lesson_slug>.json`), theo `same_as` (cả sang bài khác), rồi lấy ảnh trong cache (`--image-cache`, mặc định `content/.images`). Lỗi khi: ảnh đã chọn chưa có trong cache (chưa `images fetch`), file chọn ảnh ghi nguồn/giấy phép/tác giả/tên khác lúc fetch, bytes trong cache không khớp sha256, `same_as` trỏ sai, file chọn ảnh sai định dạng. Hình chưa chọn thì để trống (app vẽ hình giữ chỗ); `--require-assets` biến mỗi hình chưa có ảnh thành một lỗi. Hình tự vẽ (mục "Hình tự vẽ") chưa có file, chưa fetch, file sửa sau lần fetch, hoặc `title`/`method` đổi: lỗi (mục `own` nghĩa là hình đã vẽ xong). Khoá trong file chọn ảnh không còn hình nào trong bài: cảnh báo. Một ảnh dùng ở nhiều chỗ chỉ thành một file.
4. Tạo `pack.json` cho từng chủ đề: topic và các bài của nó (theo `order`), **bỏ `brief` của mọi `Image`** (SK-001) và điền `image.asset` của hình đã có ảnh. Kiểm lại nội dung gói bằng content-schema.
5. Ghi gói vào một thư mục tạm cạnh `--out`, kiểm lại sha256 và size của từng file, rồi thay cả `--out` bằng thư mục đó.

Lỗi in mỗi dòng `<file> <JSON pointer> <thông báo>`, ví dụ `…/01-thuc-an-cho-ta-nhung-gi.json /quiz/1/hint/audio/en thiếu clip en: …`. Bài hoặc topic có `ai_draft: true` thì in cảnh báo, vẫn build. Cảnh báo hình của validate (`image_missing`, `image_brief_keywords`) gộp thành một dòng đếm mỗi file; xem từng dòng bằng `validate`.

| Cờ | Ý nghĩa |
| --- | --- |
| `--out <thư mục>` | Nơi ghi gói, mặc định `content/.build/pack`. **Bị thay toàn bộ** mỗi lần build. Lệnh từ chối (exit 2) nếu thư mục đã có thứ khác ngoài `catalog/`, `topics/`, `assets/` |
| `--cache <thư mục>` | Cache clip, mặc định `content/.audio`. Build chỉ đọc, không ghi |
| `--rules <file>` | Luật chấm, mặc định `content/rules.json` |
| `--min-app-version <x.y.z>` | Bản app thấp nhất của mọi chủ đề, mặc định `0.1.0` (bản thử iOS đầu tiên) |
| `--images <thư mục>` | Gốc các file chọn ảnh, mặc định `content/images` |
| `--image-cache <thư mục>` | Cache ảnh của `images fetch`, mặc định `content/.images`. Build chỉ đọc |
| `--require-assets` | Mọi `Image` phải có ảnh; thiếu thì lỗi (dùng khi bài đã chọn đủ ảnh) |

Exit `0` = xong, `1` = lỗi nội dung (chưa ghi gì), `2` = sai cách gọi hoặc `--out` không an toàn.

**Chạy lại** với cùng input và cùng cache cho ra đúng từng byte, trừ `generated_at` của manifest. Clip chỉ chép từ cache, không sinh lại; sinh lại clip (`tts --force`, xoá cache) thì hash đổi vì `afconvert` ghi ngày giờ vào m4a, và gói đổi theo.

Kiểm một gói độc lập với code build (dùng `shasum`, `stat`, `jq`, `grep`; ảnh thêm `sips` của macOS): sha256 và size, tên file = sha256, không còn `brief`, mọi `audio.*` và `image.asset` có file, số file = số hash audio + số hash ảnh; mỗi ảnh là JPEG, không EXIF/ICC, cạnh dài ≤ 1024, `width`/`height` đúng file; ảnh nguồn ngoài: `credit` đủ 6 trường, giấy phép hợp quy tắc, URL https; hình ghép và hình tự vẽ kiểm theo mục của chúng:

```sh
sh tools/content-cli/scripts/check-pack.sh content/.build/pack   # từ gốc repo
```

### Cấu trúc gói (technical-plan.md B4.3)

```
<out>/
├── catalog/v1/manifest.json                  danh mục: chủ đề, rules, asset
├── topics/<topic_id>/<version>/pack.json     một chủ đề: topic + mọi bài có trong input
├── assets/<sha256>.m4a                       clip, tên là sha256 của bytes
└── assets/<sha256>.jpg                       ảnh (SK-033), tên là sha256 của bytes
```

Mọi đường dẫn trong manifest tính từ gốc gói, dùng `/`. Gói này là bản app nhúng ở mốc 1 (SK-016) và cũng là bố cục sẽ tải về ở GĐ 1, nên ContentKit chỉ đổi nguồn đọc.

### `catalog/v1/manifest.json`

| Khoá | Kiểu | Ý nghĩa |
| --- | --- | --- |
| `schema_version` | số nguyên | Bản content schema của mọi `pack.json` (hiện `1`) |
| `generated_at` | ISO 8601 UTC | Lúc build. Khoá duy nhất đổi giữa hai lần build cùng input |
| `content_version` | 12 ký tự hex | 12 ký tự đầu của sha256 trên JSON chuẩn tắc (khoá sắp xếp) của `schema_version`, `topics`, `rules`, `assets`. Đổi khi bất cứ thứ gì trong gói đổi; không phụ thuộc `generated_at` |
| `topics[]` | mảng | Theo nhóm tuổi (`explorer`, `discoverer`, `scientist`) rồi `order` |
| `topics[].id`, `slug`, `age_group`, `order`, `is_free` | | Chép từ `topic.json` |
| `topics[].title` | `Spoken` | Chép từ `topic.json`, có `audio.en` (clip có trong `assets`) |
| `topics[].version` | 12 ký tự hex | Phiên bản của chủ đề: 12 ký tự đầu của sha256 trên JSON chuẩn tắc của `schema_version`, `topic`, `lessons` của gói. Nội dung đổi thì đổi; giống nhau thì giữ nguyên |
| `topics[].path` | chuỗi | `topics/<id>/<version>/pack.json` |
| `topics[].sha256`, `size` | hex, số byte | Của file `pack.json` đúng như trên đĩa |
| `topics[].min_app_version` | `MAJOR.MINOR.PATCH` | Lớn nhất của `--min-app-version` và mọi `min_app_version` của block trong chủ đề |
| `rules` | object | Chép nguyên `content/rules.json`: `rules.<age_group>` |
| `assets[]` | mảng | Mọi file trong `assets/`, theo `sha256` |
| `assets[].sha256`, `size` | hex, số byte | Của bytes file |
| `assets[].kind`, `lang` | `audio`, `en` · `vi` | Clip. `lang` chỉ có ở `audio` |
| `assets[].kind`, `width`, `height` | `image`, px | Ảnh (SK-033): JPEG sRGB, cạnh dài ≤ 1024, không metadata |
| `assets[].credit` | object | Chỉ ở `image`: `title`, `author`, `license` (`CC0 1.0` · `Public domain` · `PDM 1.0` · `CC BY <phiên bản>`), `license_url`, `source` (`Wikimedia Commons` · `Openverse/<nhà cung cấp>`), `source_url` (trang gốc), `changes` (`cropped`, `resized`: CC BY 4.0 yêu cầu ghi đã sửa gì). App hiện ở màn "Nguồn hình" |
| `assets[].credit` của hình ghép | object | `title`, `author` = `Science Kids`, `license` (chặt nhất trong các phần: CC BY nếu có phần CC BY), `license_url`, `source` = `composed`, `changes` (luôn có `composed`, thêm `resized` nếu file ghép lớn hơn 1024 px), `parts` (mỗi ảnh nguồn: `title`, `author`, `license`, `license_url`, `source`, `source_url`). Không có `source_url` riêng. Mục "Hình ghép" |
| `assets[].credit` của hình tự vẽ | object | `title`, `author` = `Science Kids`, `license` = `Science Kids`, `license_url` = `""`, `source` = `Science Kids`, `changes` = `["drawn"]` (cách làm, không phải sửa ảnh của ai). Không có `source_url`, không có `parts`. App hiện title, author, license, source; `license_url` trống coi như thiếu. Mục "Hình tự vẽ" |
| `assets[].path` | chuỗi | `assets/<sha256>.m4a` hoặc `assets/<sha256>.jpg` |

Ví dụ rút gọn:

```json
{
  "schema_version": 1,
  "generated_at": "2026-10-28T14:43:45.809Z",
  "content_version": "38dd0baa2f03",
  "topics": [
    {
      "id": "d3a514ef-02cd-4386-a358-f01e425a10f8",
      "slug": "an-uong-lanh-manh",
      "age_group": "discoverer",
      "order": 1,
      "title": { "en": "Healthy eating", "vi": "Ăn uống lành mạnh", "audio": { "en": "ea2299ee…" } },
      "is_free": true,
      "version": "5ed502d1cb23",
      "path": "topics/d3a514ef-02cd-4386-a358-f01e425a10f8/5ed502d1cb23/pack.json",
      "sha256": "30061a60…",
      "size": 50994,
      "min_app_version": "0.1.0"
    }
  ],
  "rules": { "explorer": { … }, "discoverer": { "max_tries": 2, "pass_threshold": { "num": 5, "den": 6 }, … }, "scientist": { … } },
  "assets": [
    { "sha256": "02742903…", "size": 14976, "kind": "audio", "lang": "en", "path": "assets/02742903….m4a" },
    { "sha256": "5c1e77a0…", "size": 98213, "kind": "image", "path": "assets/5c1e77a0….jpg", "width": 1024, "height": 683,
      "credit": { "title": "Blue sea horizon", "author": "Example Author", "license": "CC0 1.0",
                  "license_url": "https://creativecommons.org/publicdomain/zero/1.0/", "source": "Wikimedia Commons",
                  "source_url": "https://commons.wikimedia.org/wiki/File:Blue_sea_horizon.jpg", "changes": ["resized"] } },
    { "sha256": "9b04c2e1…", "size": 87120, "kind": "image", "path": "assets/9b04c2e1….jpg", "width": 1024, "height": 512,
      "credit": { "title": "Sea and river", "author": "Science Kids", "license": "CC BY 2.0",
                  "license_url": "https://creativecommons.org/licenses/by/2.0/", "source": "composed", "changes": ["composed"],
                  "parts": [ { "title": "Blue sea horizon", "author": "Example Author", "license": "CC0 1.0", "license_url": "https://creativecommons.org/publicdomain/zero/1.0/",
                               "source": "Wikimedia Commons", "source_url": "https://commons.wikimedia.org/wiki/File:Blue_sea_horizon.jpg" },
                             { "title": "River & boat", "author": "Example Photographer", "license": "CC BY 2.0", "license_url": "https://creativecommons.org/licenses/by/2.0/",
                               "source": "Openverse/Flickr", "source_url": "https://www.flickr.com/photos/example/9002" } ] } },
    { "sha256": "c4d8e0f1…", "size": 64210, "kind": "image", "path": "assets/c4d8e0f1….jpg", "width": 800, "height": 800,
      "credit": { "title": "Plastic globe on a desk", "author": "Science Kids", "license": "Science Kids", "license_url": "",
                  "source": "Science Kids", "changes": ["drawn"] } }
  ]
}
```

### `topics/<topic_id>/<version>/pack.json`

| Khoá | Ý nghĩa |
| --- | --- |
| `schema_version` | Bản content schema (`1`) |
| `topic_id`, `version` | Trùng `topics[].id`, `topics[].version` của manifest |
| `topic` | File `topic.json` theo schema v1, bỏ `brief` |
| `lessons` | Các bài của chủ đề theo `order`, mỗi bài là file bài theo schema v1, bỏ `brief` của mọi `Image` |

`topic` và từng phần tử `lessons` vẫn hợp lệ với `packages/content-schema` (build kiểm lại). Mỗi `audio.<lang>` là sha256 của một file `assets/<sha256>.m4a` có trong gói và trong `manifest.assets`.

**Cách app tra clip:** đọc `audio.en` của chuỗi → mở `assets/<audio.en>.m4a` → trước khi dùng, so sha256 và `size` với dòng có cùng `sha256` trong `manifest.assets`. `pack.json` kiểm bằng `topics[].sha256` và `size`.

**Cách app tra ảnh:** `image.asset` → dòng `kind: image` cùng `sha256` trong `manifest.assets` → `path` (`assets/<sha256>.jpg`), kiểm sha256 như clip; không có `asset` thì vẽ hình giữ chỗ. Màn "Nguồn hình" liệt kê `credit` của mọi dòng `kind: image`.

### `content/rules.json`

Một nguồn cho `rules` (B5.3). Khoá cấp 1 là nhóm tuổi; mỗi nhóm:

| Khoá | v1 | Nguồn |
| --- | --- | --- |
| `max_tries`, `partial_order_min`, `pass_threshold`, `mastery_gap_days`, `rest_days_per_week`, `warmup` | `2`, `null`, `{num: 5, den: 6}`, `1`, `1`, `{min 2, max 3, week, month, exclude_dok [3]}` | Đúng `default_rules` của `packages/content-schema/test-vectors/` (SK-003). `test/rules.test.ts` so khoá và giá trị |
| `max_tries_by_format` (tuỳ chọn) | `{ "true_false": 1 }` ở cả ba nhóm | Duy 14/11 (SK-043): `true_false` (gồm câu Na) một lượt ở Explorer và Discoverer; Scientist theo cùng lý do (dev 14/11, Duy đổi được). Số lần thử của một câu = `max_tries_by_format[format]` nếu có, không thì `max_tries`; áp cả Khởi động và Quiz. App cũ bỏ qua khoá (vẫn 2 lượt); server không chấm lại số lượt (`quiz_answers.tries` chỉ kiểm 1–10). Chưa có trong `default_rules` của vector: đề xuất cho tester ở SK-043 |
| `xp_per_correct`, `xp_lesson_complete`, `xp_game_complete`, `xp_mastery_review` | `10`, `20`, `10`, `20` | B4.4 |
| `default_voice_mode` | `{bilingual, en_first, vi_first}` → `en` · `vi` · `both` | B4.1: Song ngữ → `both`, EN-first → `en`, VI-first → `both`; Explorer luôn `both` |
| `authoring` | Luật soạn Khởi động và Quiz theo nhóm (mục "validate: luật theo nhóm tuổi"). Chỉ `content-cli` đọc; app (`Decodable`) và RPC (`rules_for` đọc từng khoá) bỏ qua | SK-026, bảng "Đặc tả theo nhóm tuổi"; SK-033 (khoá ảnh); SK-047 (`multi_choice_correct_spread`, `vocab_item_uses_lesson_word`). `test/rules.test.ts` chép tay bảng đó và so |

Định dạng ở `schema/rules.schema.json`, mọi object đều đóng (khoá gõ sai là lỗi). `authoring` là khoá tuỳ chọn (thiếu thì validate và build báo `age_rules_missing`). Đổi giá trị do Duy chốt; đổi phần luật chấm thì sửa `default_rules` ở cả 6 file vector cùng lúc (tester), nếu không `npm test` đỏ.

GĐ 0 **chưa** đặt `xp_*` = 0 cho Explorer (D1 của SK-026): server lấy `rules` theo nhóm của hồ sơ (`submit_attempts` → `rules_for(child.age_group)`), app lấy theo nhóm của chủ đề, nên bé lớp 1 học thử Discoverer sẽ lệch XP. Chờ chốt câu "rules của nhóm nào" ở SK-026.

## Markdown: validate, import, ids

Biên tập soạn bài bằng markdown theo `content/TEMPLATE.md`; ba lệnh dưới đây đọc thẳng file `.md` ([SK-027](../../docs/backlog/SK-027-content-cli-import-markdown.md)). Không cần model Kokoro, môi trường Python VieNeu hay mạng, không nạp module nào của `tts`.

**Lệnh cho biên tập** (chạy từ gốc repo; cần Node `^22.18.0` hoặc `>= 23.6.0` và `npm install` một lần trong `tools/content-cli`):

```sh
npm --prefix tools/content-cli run validate -- content/discoverer/an-uong-lanh-manh   # kiểm cả chủ đề
npm --prefix tools/content-cli run validate -- content                                # kiểm cả kho
npm --prefix tools/content-cli run ids -- content/discoverer/an-uong-lanh-manh/02-mam-com-can-bang.md   # bài mới: điền id
```

Mỗi dòng báo: `<file .md>:<dòng> <JSON pointer> [<mã>] <thông báo>`, bấm vào được trong terminal và VS Code. Ví dụ:

```
content/discoverer/an-uong-lanh-manh/02-mam-com-can-bang.md:118 /quiz/0/format [md_unknown_format] format "single_choise" không có. Có phải "single_choice"? Dùng được: single_choice, …
content/discoverer/an-uong-lanh-manh/02-mam-com-can-bang.md:121 /quiz/0/dok [age_first_item_dok] câu 1 là DOK 2; nhóm discoverer cần câu 1 là DOK 1
```

| Lệnh | Làm gì | Ghi gì |
| --- | --- | --- |
| `validate <thư mục hoặc .md>...` | Đọc markdown → JSON trong bộ nhớ → content-schema → luật theo nhóm tuổi (SK-026) | Không ghi gì |
| `import <thư mục hoặc .md>... [--out <thư mục>]` | Đúng các bước của `validate`; không có lỗi nào (kể cả `md_id_missing`) thì ghi JSON schema v1 | `--out` mặc định `content/.build/json/` (gitignore) |
| `ids <thư mục hoặc .md>...` | Điền UUID v4 vào các chỗ chưa có id | Chỉ các dòng `id:` của file `.md` |

Tuỳ chọn chung: `--content-root <thư mục>` (xem dưới); `validate` và `import` nhận thêm `--rules <file>`, `--min-app-version <x.y.z>` như `validate` JSON.

**Đường dẫn**
- Thư mục: máy tìm mọi thư mục chủ đề (có `_topic.md`) bên trong, kể cả chính nó. Trong mỗi thư mục chủ đề máy đọc `_topic.md` và mọi `<nn>-*.md`. File `.md` khác bắt đầu bằng chữ số mà sai dạng tên (`2-mam-com.md`, `02_mam.md`) thì báo `md_filename` và không đọc; các file khác (README…) bỏ qua.
- Một bài lẻ: máy tự lấy `_topic.md` cùng thư mục (`ids` thì chỉ ghi vào bài đó).
- Trộn `.md` (hoặc thư mục) với `.json` trong một lần gọi: exit 2. `validate` trên `.json` giữ nguyên như mục "validate: luật theo nhóm tuổi". Thư mục không có `_topic.md` nào, hoặc bài không có `_topic.md` cùng thư mục: exit 2. Đường dẫn không có: `<đường dẫn> / không tìm thấy file`, exit 1 (như validate JSON).
- **Gốc nội dung** (`--content-root`): nơi máy tìm id trùng (`md_id_duplicate`) và chủ đề, bài được trỏ tới (`prerequisites`, `recall_from.lesson`). Mặc định `content/` khi mọi chủ đề nằm trong đó; bản chép ở chỗ khác (vd `/tmp/x/discoverer/an-uong-lanh-manh`) thì là thư mục trên `<age_group>/` (`/tmp/x`). Dòng tổng in gốc đã dùng.

**Ba bước, nối tiếp theo từng chủ đề**
1. Cú pháp markdown (`src/markdown/syntax.ts`, `convert.ts`): mã `md_*`.
2. content-schema trên JSON trong bộ nhớ (`validateDocuments`, như validate JSON): mã `schema`.
3. Luật theo nhóm tuổi (`src/validate/age-rules.ts`): mã của SK-026 (`age_*`, `format_not_rendered`).

Chủ đề có lỗi ở một bước thì không chạy bước sau, trừ `md_id_missing`: `validate` dùng id tạm trong bộ nhớ để vẫn chạy bước 2, 3, nên biên tập thấy hết lỗi nội dung ngay lần đầu; id tạm không ghi ra đâu. Dòng tổng ghi chủ đề nào dừng ở bước nào.

**Số dòng** là dòng thật trong file, đếm từ 1, tính cả frontmatter: lỗi ở một trường chỉ vào dòng của trường đó; thiếu nửa của một cặp (`label.vi`) chỉ vào nửa còn lại (`label.en`); thiếu cả trường chỉ vào tiêu đề `###`/`####` của khối (frontmatter: dòng 1); lỗi của cả mục (số câu Quiz, `age_dok_mix`) chỉ vào `##` của mục; thiếu cả một mục chỉ vào `##` ngay sau chỗ lẽ ra có mục đó. Một lỗi ra một dòng: mục gõ sai tên không kèm dòng "thiếu mục"; `format`/`type` lạ không kèm lỗi các `####` con, và khối không rõ `format`/`type` không kèm `md_id_missing`; thiếu một tiêu đề `##` thì các lỗi do nội dung của mục đó "rơi" vào mục trước không in ra; thiếu một tiêu đề `###`/`####` thì các dòng rơi vào khối trước báo một dòng "thiếu tiêu đề ngay phía trên dòng X" khi có dấu hiệu rõ (dòng lạ là trường chỉ khối `###` mới có: `id`, `format`, `type`, `version`, `dok`; hoặc từ ba dòng lạ liền nhau; hoặc cả một nhóm dòng lặp liền nhau như `label.en` + `label.vi`), còn hai lỗi gõ rời nhau vẫn ra hai dòng. Nhiều lỗi content-schema trên cùng một dòng gộp thành một dòng. Thông báo gọi theo tên trong markdown (`label.vi`, `#### option q1_rice`, `misconception`), pointer vẫn là JSON pointer của JSON mà `import` ghi.

Thứ tự in: lỗi trước, cảnh báo sau; mỗi nhóm theo file (topic trước, rồi các bài) rồi theo dòng; cuối cùng một dòng tổng. Exit `0` = không lỗi (có thể có cảnh báo), `1` = có lỗi (`import` không ghi gì), `2` = sai cách gọi.

**Mã `md_*`** (bước 1; `src/markdown/source.ts`, `MD_CODES`):

| Mã | Mức | Khi nào |
| --- | --- | --- |
| `md_frontmatter` | lỗi | Thiếu dòng `---` mở hay đóng, dòng frontmatter sai dạng, thiếu khoá bắt buộc (`id` thì xem `md_id_missing`) |
| `md_filename` | lỗi | Tên file không theo `<nn>-<slug>.md`; `nn` khác `order`; phần sau `nn-` khác `slug`; `topic` (bài) hoặc `slug` (chủ đề) khác tên thư mục |
| `md_missing_section` | lỗi | Thiếu mục `##` bắt buộc (mọi mục của khung trừ các mục Ghi chú). Thông báo nói mục nằm giữa hai mục nào (kèm số dòng), chỉ dòng gần giống tiêu đề nếu có (`### Quiz`, `##Quiz`), không thì chỉ dòng nội dung của mục bắt đầu (vd `### explore` có `type: explore_groups`) |
| `md_unknown_section` | lỗi | Mục `##` lạ (gợi ý tên gần nhất) hoặc viết hai lần; nội dung của mục đó không được đọc |
| `md_bad_line` | lỗi | Ở chỗ có cấu trúc, dòng không phải `tên: giá trị`, `>` hay dòng trống (bảng, danh sách `-`, đoạn văn, thiếu `:`, `#`/`#####`, `###` dưới mục không có `###`). Nhiều dòng liền nhau báo một lần ở dòng đầu |
| `md_unknown_field` | lỗi | Tên trường không dùng được ở loại khối này (theo `format`/`type`); gợi ý tên gần nhất mà khối còn thiếu (`prompt.vn` → `prompt.vi`). Tên chỉ khác chữ hoa (`Format:`) thì báo ở chính dòng đó, nhắc viết chữ thường, và vẫn đọc giá trị |
| `md_duplicate_field` | lỗi | Một trường viết hai lần trong một khối |
| `md_bad_value` | lỗi | Sai kiểu (số nguyên, `true`/`false`); danh sách sai cú pháp (`[a, b]`, `a; b`, các dòng `-`); `examples.<n>`/Ý chính đánh số không liền từ 1; `[CẦN KIỂM]` nằm trong giá trị |
| `md_unknown_format` | lỗi | `format:` thiếu hoặc không thuộc 6 format v1 |
| `md_unknown_type` | lỗi | `type:` thiếu, không thuộc block v1, hoặc không dùng ở mục này (`## Học`: `explore_groups`, `sentence_card`, `word_list`; `## Chơi`: `build_tray`) |
| `md_unknown_child` | lỗi | `#### <loại>` không dùng được với `format`/`type` của khối cha (vd `#### bank` trong `single_choice`) |
| `md_heading_level` | lỗi | Tiêu đề sai cấp: `#### q2` (một từ, không phải loại `####` nào) là `###` thừa một `#`; `### option q1_rice` ngay sau một `###` là `####` thiếu một `#`. Máy đọc tiếp như đã sửa, nên không có lỗi kéo theo; `ids` không đụng tới khối đó |
| `md_block_count` | lỗi | `## Chơi` không có đúng một `###`; `## Thưởng` có hơn một `###` |
| `md_ref_unknown` | lỗi | `misconception`, `prerequisites`, `recall_from.lesson`, `group`, `answers`, `answer`, `term_keys`, `messages.missing.<key>` trỏ tới thứ không có (có gợi ý) |
| `md_id_missing` | lỗi | Còn chỗ chưa có id (dòng `id:` trống, hoặc khối không có dòng `id:`). Một dòng cho mỗi file, chỉ vào chỗ đầu, liệt kê các chỗ còn lại, nhắc chạy `ids` |
| `md_id_invalid` | lỗi | `id` không phải UUID chữ thường 8-4-4-4-12 |
| `md_id_duplicate` | lỗi | `id` trùng một id khác trong gốc nội dung; báo `file:dòng` của chỗ kia. Nhiều id trùng cùng một file khác (chép bài cũ quên xoá id) gộp một dòng |
| `md_needs_check` | cảnh báo | File còn dòng `[CẦN KIỂM]`. Một dòng cho mỗi file, liệt kê số dòng |

**Danh mục `syllabus.json`** ([SK-030](../../docs/backlog/SK-030-full-syllabus-no-lock.md)). Thư mục đưa cho `validate` có `syllabus.json` ngay bên trong (`content/`) thì máy kiểm luôn file đó; thư mục chủ đề thì không. Luật nằm ở `packages/content-schema` (`syllabus.schema.json`, `scripts/lib/syllabus.mjs`, xem README ở đó); content-cli đọc file và đưa danh sách id của mọi `_topic.md` và bài `<nn>-*.md` dưới chính thư mục đó (`contentIndex` trong `src/markdown/files.ts`, chỉ đọc frontmatter bằng cùng parser). Bài thuộc chủ đề của thư mục chứa nó. Mỗi dòng: `<syllabus.json> <JSON pointer> [<mã>] <thông báo>`, thông báo mở đầu bằng nhóm, chủ đề (số, key) và bài (số, tên en). Thứ tự in: lỗi markdown, lỗi syllabus, cảnh báo markdown, cảnh báo syllabus. Dòng tổng thêm `· syllabus content/syllabus.json (3 nhóm, 43 chủ đề, 375 bài; 98 bài có lesson_id)`; phần "chưa có tên vi" mất khi mọi bài đã có `title.vi`. `import` không kiểm syllabus. Gọi `validate content/syllabus.json` (file lẻ) thì exit 2, nhắc đưa thư mục.

```
content/syllabus.json /groups/1/topics/8/lessons/5/lesson_id [syllabus_lesson_ref] discoverer, chủ đề 9 "healthy-eating", bài 6 "Nutrient-rich meal": lesson_id 2360…e340 không có trong content: không bài markdown nào có id này
```

| Mã | Mức | Khi nào |
| --- | --- | --- |
| `syllabus_json` | lỗi | File không đọc được thành JSON |
| `schema` | lỗi | Sai `syllabus.schema.json` (kiểu, trường thiếu hoặc lạ, enum). Có lỗi này thì chưa chạy các luật dưới |
| `syllabus_duplicate` | lỗi | `age_group`, `key` chủ đề, `topic_id`, `lesson_id` hoặc một slug lesson Oak xuất hiện hai lần trong file |
| `syllabus_number` | lỗi | `number` của chủ đề (trong nhóm) hoặc của bài (trong chủ đề) không đi 1, 2, 3… theo thứ tự trong file |
| `syllabus_key` | lỗi | Chủ đề Oak có `key` khác `source.unit_slug`; chủ đề mới có `key` không bắt đầu bằng `new-` |
| `syllabus_oak` | lỗi | Bài của chủ đề Oak có `oak_lessons` rỗng (trừ bài `extension`); bài của chủ đề mới có `oak_lessons` không rỗng; `source.year` ngoài `oak_years` của nhóm; bài `extension` (bài mở rộng, Duy 13/11) có `oak_lessons` không rỗng, `statutory` khác false, hoặc nằm trong chủ đề mới (bài mở rộng đứng giữa các bài Oak thì hợp lệ, SK-051); chủ đề Oak chỉ toàn bài `extension` |
| `syllabus_topic_ref` | lỗi | `topic_id` không là id của `_topic.md` nào, hoặc là chủ đề của nhóm tuổi khác |
| `syllabus_lesson_ref` | lỗi | `lesson_id` không là id của bài nào, là bài của chủ đề khác, hoặc chủ đề chứa nó chưa có `topic_id` |
| `syllabus_unlisted` | cảnh báo | Chủ đề hoặc bài có trong thư mục mà chưa ô nào trỏ tới (app sẽ không hiện) |

**Đọc markdown** (TEMPLATE mục A "Cú pháp", bảng ánh xạ mục D)
- Parser tự viết, đọc theo dòng (không thư viện markdown hay YAML). Frontmatter là YAML tối giản: `tên: giá trị` ở cột 0, `difficulty:` với các dòng thụt lề bên dưới, `prerequisites: []` hoặc `[slug-a, slug-b]`, dòng `#` là chú thích. Giá trị đọc theo kiểu của schema, không đoán như YAML 1.1 (`no` không thành `false`), không bỏ ngoặc kép.
- Bỏ qua: dòng `>`, dòng trống, cả mục `## Ghi chú cho hoạ sĩ` (hoặc "họa sĩ"), `## Ghi chú cho dev`, `## Ghi chú` (topic). Đọc được file có BOM và CRLF.
- Giá trị tách tại dấu `:` đầu tiên (`Sweets: just a little` hợp lệ), bỏ khoảng trắng hai đầu. Trường có tên mà giá trị trống thì coi như không có (`labels.*` trống của Explorer hợp lệ).
- `a, b, c` thành mảng, một phần tử vẫn là mảng. `messages.missing.<key>` giữ thứ tự dòng (thứ tự nhắc của mâm cơm). `topic` → `topic_id` (id trong `_topic.md` cùng thư mục), `misconception` → `misconception_id`, `prerequisites` → `prerequisite_topic_ids`, `recall_from.lesson: <slug chủ đề>/<slug bài>` → `recall_from.lesson_id`.
- Máy chỉ ghi `kind` và `schema_version` = 1; không thêm giá trị mặc định (`tier`, `rarity`…). `## Thưởng` trống thành `reward: {}`.
- **Thứ tự khoá** theo `properties` của JSON Schema v1, như fixture của `packages/content-schema` (sha256 của `pack.json` phụ thuộc thứ tự khoá). Một ngoại lệ theo fixture: lựa chọn (`ChoiceOption`) là `key, label, correct, image, feedback`, schema ghi `image` trước `correct`. `test/markdown.test.ts` kiểm từng loại khối.
- **`feedback` (SK-044, tuỳ chọn):** dưới `#### option` sai (`single_choice`, `multi_choice`, `picture_bar_chart`) và `#### bank` không nằm trong `answers` (`fill_blank_bank`) viết `feedback.en:` / `feedback.vi:` → `feedback` (Spoken) của lựa chọn đó. Câu `true_false` viết ở cấp câu `feedback_true.en/.vi` (bé chạm Đúng, chỉ khi `answer: false`) hoặc `feedback_false.en/.vi` (bé chạm Sai, chỉ khi `answer: true`). Viết ở lựa chọn đúng, thẻ đáp án hay phía đúng của `true_false` là lỗi `schema` (kiểm chéo của content-schema) ở dòng `feedback…en`; thiếu nửa cặp là lỗi như `label`. `feedback` là Spoken nên `tts` đọc ra clip EN/VI, `build` gắn `audio` và `age_words_en` đếm từ như mọi câu khác. `order_sequence` không có `feedback`.

**`import`** ghi `<--out>/<age_group>/<topic_slug>/topic.json` và `<nn>-<slug>.json` (tên như fixture), nội dung `JSON.stringify(…, null, 2)` cộng xuống dòng cuối. Thư mục của mỗi chủ đề bị thay cả (ghi vào thư mục tạm cạnh nó, kiểm lại rồi đổi tên, như `build`) và chỉ chứa topic cùng các bài có trong lần gọi. Lệnh từ chối (exit 2) nếu thư mục đó có thứ khác ngoài `topic.json` và `<nn>-*.json`. JSON là sản phẩm dẫn xuất, không sửa tay; fixture ở `packages/content-schema` vẫn là dữ liệu test, bài 1 đổi thì sinh lại fixture bằng `import` (test khớp fixture sẽ đỏ tới khi đó).

**`ids`** điền `crypto.randomUUID()` (v4, chữ thường) vào mọi dòng `id:` trống ở frontmatter và ngay dưới `###` của các mục có cấu trúc; khối không có dòng `id:` thì thêm `id: <uuid>` ngay dưới tiêu đề (frontmatter: dưới `---` mở), nhưng chỉ khi khối rõ loại (câu có `format:` đúng, block có `type:` đúng, từ vựng / thẻ / misconception có ít nhất một trường). Tiêu đề sai cấp (`md_heading_level`) và khối chưa rõ loại thì không đụng, in `<file>:<dòng> bỏ qua "<tiêu đề>": <lý do>`. Không đụng id đã có, mọi byte khác giữ nguyên (CRLF, dòng `>`). In `<file>:<dòng> <uuid>` cho từng id mới; chạy lần hai không đổi gì. `validate` và `import` không bao giờ sửa file `.md`. Id trùng thì `ids` không tự đổi: xoá id ở bài mới (để `id:` trống) rồi chạy `ids`.

**Đường đi đầy đủ:** `import` → `tts --lang en` → `tts --lang vi` → `build`. `import` in sẵn ba lệnh tiếp theo. Với `--out` mặc định:

```sh
cd tools/content-cli
npm run import -- ../../content/discoverer/an-uong-lanh-manh
npm run tts -- ../../content/.build/json/discoverer/an-uong-lanh-manh/topic.json \
               ../../content/.build/json/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json \
               --lang en --out ../../content/.build/tts/discoverer/an-uong-lanh-manh
npm run tts -- ../../content/.build/tts/discoverer/an-uong-lanh-manh/topic.json \
               ../../content/.build/tts/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json \
               --lang vi --out ../../content/.build/tts/discoverer/an-uong-lanh-manh
npm run build -- ../../content/.build/tts/discoverer/an-uong-lanh-manh/topic.json \
                 ../../content/.build/tts/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json
```

`tts` và `build` vẫn chỉ đọc JSON. Thư mục chứa `topic.json` phải mang tên slug của chủ đề (content-schema kiểm), nên bản chép ngoài `content/.build` đặt theo `<age_group>/<slug>/`.

**Fixture** (`test/fixtures/markdown/`): `valid/` là bản chép bài 1 và `_topic.md` (test báo khi bản chép lệch `content/`); `expected.json` ghi tay mỗi ca lỗi dưới dạng sửa bản chép (thay một đoạn, cắt, thêm file, đổi tên) và dòng lỗi mong đợi (file, dòng, pointer, mã). Gốc nội dung khi chạy test là thư mục tạm chứa bản chép.

Test chỉ gắn với `content/` qua `_topic.md` và bài 1 (SK-028): bài 2, 3… thêm vào hay đang soạn dở không làm đỏ test. **Đổi `_topic.md` hoặc bài 1 thì dev sinh lại, trong cùng lần sửa:**

```sh
cd tools/content-cli
npm run import -- ../../content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md --out <tạm>/json   # chỉ topic + bài 1
cp <tạm>/json/discoverer/an-uong-lanh-manh/*.json ../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/
(cd ../../packages/content-schema && node scripts/make-invalid-fixtures.mjs)        # fixtures/invalid theo bài mẫu mới
cp ../../content/discoverer/an-uong-lanh-manh/{_topic.md,01-thuc-an-cho-ta-nhung-gi.md} test/fixtures/markdown/valid/discoverer/an-uong-lanh-manh/
npm test && (cd ../../packages/content-schema && npm test)
```

Test iOS (`apps/ios/Packages/SKKit/Tests`) cũng đọc fixture này: báo ios-dev khi giá trị trong fixture đổi.

## validate: luật theo nhóm tuổi

```sh
cd tools/content-cli
npm run validate -- ../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/topic.json \
                    ../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json
```

Hoặc `node src/cli.ts validate <topic.json> <lesson.json>... [--rules <file>] [--min-app-version <x.y.z>]`. Đọc JSON (fixture gốc hoặc đầu ra của `tts`, như nhau); file `.md` và thư mục chủ đề thì xem mục "Markdown: validate, import, ids" (cùng hai bước kiểm này, sau bước đọc markdown). Không ghi gì.

1. Kiểm bằng `packages/content-schema` (Ajv + zod + kiểm chéo). Sai thì in lỗi schema, exit 1, chưa kiểm luật tuổi. Bài lẻ thì đưa kèm `topic.json`.
2. Đọc `--rules` (mặc định `content/rules.json`).
3. Với mỗi topic, lấy `rules.<age_group>.authoring` theo `age_group` **của topic**, kiểm các bài của topic đó (`src/validate/age-rules.ts`, hàm thuần; `build` gọi cùng hàm).

Mỗi dòng: `<file> <JSON pointer> [<mã>] <thông báo>`. Cảnh báo có `cảnh báo:` ở đầu thông báo và không làm exit 1. Lỗi in trước, cảnh báo sau, rồi một dòng tổng. Exit `0` = không lỗi (có thể có cảnh báo), `1` = có lỗi, `2` = sai cách gọi.

**Phạm vi:**
- Format được dùng, số lựa chọn và hình bắt buộc: áp cho từng câu ở **cả Khởi động** (`/warmup/<i>`) **và Quiz** (`/quiz/<i>`); món `build_tray` ở Chơi (`/play/items/<j>`) theo chỗ `tray_item`. Câu dùng format không được phép thì chỉ báo `age_format_not_allowed`, không kiểm tiếp số lựa chọn hay hình của câu đó.
- Hình (SK-033): mỗi chỗ thiếu `image` một dòng: `age_image_required` (lỗi) nếu chỗ đó có trong `image_required`, không thì `image_missing` (cảnh báo) nếu có trong `image_expected`. `image_brief_keywords`: mọi `Image` của topic và bài (cả ô Học, từ vựng, thẻ thưởng) phải có `brief` kết thúc bằng "Từ khoá tìm ảnh (EN): …", trừ brief dùng lại ("Dùng lại hình \`<key>\`."); brief dùng lại hình trong cùng bài mà không nêu key nào của bài thì cũng cảnh báo. Brief ghép (nhãn có chữ "ghép" như \`[sơ đồ ghép ảnh]\`, hoặc mở đầu "Ghép …", mục "Hình ghép") không cần từ khoá khi đã nêu hình dùng lại trong backtick hoặc có "Từ khoá cho <phần>: …"; không có gì thì cảnh báo "brief ghép … không có …". Brief hình tự vẽ (nhãn \`[hình vẽ]\`, \`[hình tự vẽ]\` hoặc \`[tự vẽ]\`, mục "Hình tự vẽ") không cần từ khoá: không tìm ảnh, brief tả cần vẽ gì.
- DOK, câu 1, số câu misconception, số format khác nhau, thứ tự DOK: chỉ tính 6 câu Quiz. Số format đếm mọi format có mặt, kể cả format không được phép.
- Số từ: mọi chuỗi `Spoken` (`en`) của topic và bài (câu hỏi, gợi ý, giải thích, lời nhắn, ý chính, ví dụ từ vựng…), tách câu sau `.` `!` `?` `…`, đếm từ theo khoảng trắng (từ có chữ hoặc số; ô trống `{1}` tính một từ, `—` không tính).
- `format_not_rendered`: mọi câu Khởi động và Quiz, so với bản app của chủ đề = lớn nhất của `--min-app-version` và mọi `min_app_version` của block (như `build`).
- `multi_choice_correct_spread` (SK-047, **cấp chủ đề**): gom mọi câu `multi_choice` ở **Khởi động và Quiz** của các bài trong lần gọi thuộc chủ đề, đếm theo số đáp án đúng (`correct: true`). Giới hạn = `max(1, floor(tỉ lệ × n))`, n là số câu MC của chủ đề (tỉ lệ 0.5: 1 hoặc 2 hoặc 3 câu → 1; 4, 5 → 2; 15 → 7). Một số đáp án đúng có nhiều câu hơn giới hạn thì một dòng ở file topic (pointer `/`, markdown: `_topic.md:1`), nêu chủ đề, số đáp án đúng bị lặp, số câu trên tổng, giới hạn, số câu phải đổi ít nhất, phân bố hiện tại và bài + key của các câu (`02-duong-di-cua-khong-khi q4`). Chỉ tính bài có trong lần gọi: chạy trên cả thư mục chủ đề (một bài lẻ thì n thường là 1, không báo).
- `vocab_item_uses_lesson_word` (SK-047, Đợt 1, gần đúng): mỗi `fill_blank_bank` ở **Quiz** (không tính Khởi động: câu Khởi động ôn bài khác) là câu Từ mới, nên ít nhất một từ trong `answers` có `label.en` trùng `term.en` của một **từ mới** của bài: từ trong `vocab` có `tier: core` (thiếu `tier` = core). Từ `tier: extra` (từ đọc thêm) không tính (phiên chính 15/11: content-schema gọi core là "từ mới của bài, được kiểm tra"; dải Từ mới ở Tổng kết hiện từ core); khi chỗ trống là một từ extra, dòng báo ghi thêm điều đó. So: không phân biệt hoa thường, gạch nối như khoảng trắng, bỏ dấu câu và "a/an/the" ở đầu; từ cuối nhận biến thể -s, -es, -ies, -ves, -ed, -ied, -ing (bỏ hoặc thêm e, bỏ phụ âm đôi) và vài số nhiều bất quy tắc (teeth, feet, mice, geese, children, people, men, women). Không có từ điển nên "breath" và "breathe" là hai từ. Đợt 2 (`skill`) thêm câu có `skill: vocab`, cùng khoá.

**Mã** (SK-026, Phạm vi theo agent › GĐ 0 › dev, mục 3):

| Mã | Mức | Khi nào | Pointer |
| --- | --- | --- | --- |
| `age_rules_missing` | lỗi | Nhóm của topic không có trong rules, hoặc không có `authoring` | `/age_group` của topic |
| `age_format_not_allowed` | lỗi | Format không có trong `warmup_formats` (Khởi động) hay `quiz_formats` (Quiz) | `/warmup/<i>/format`, `/quiz/<i>/format` |
| `age_option_count` | lỗi | Số phần tử ngoài `option_count[format]`: `options` (`single_choice`, `multi_choice`, `picture_bar_chart`), `items` (`order_sequence`), `bank` (`fill_blank_bank`) | mảng, vd `/quiz/0/options` |
| `age_image_required` | lỗi | Thiếu `image` ở chỗ `image_required` ghi | lựa chọn `/quiz/3/options/0`, thẻ `/quiz/3/items/1`, câu `true_false` `/quiz/5` |
| `age_first_item_dok` | lỗi | Câu quiz 1 không phải DOK `first_item_dok` | `/quiz/0/dok` |
| `age_dok_mix` | lỗi | Số câu DOK 1·2·3 khác `dok_mix` | `/quiz` |
| `age_misconception_count` | lỗi | Số câu có `misconception_id` ngoài `misconception_items` | `/quiz` |
| `age_format_variety` | lỗi | Số format khác nhau < `min_formats` | `/quiz` |
| `age_dok_order` | cảnh báo | DOK giảm giữa hai câu quiz liên tiếp | `/quiz/<i>/dok` (câu sau) |
| `age_words_en` | cảnh báo | Một câu EN dài hơn `max_words_en` từ | chuỗi, vd `/quiz/2/prompt/en` |
| `format_not_rendered` | lỗi ở `build`, cảnh báo ở `validate` | Format chưa hiện được ở bản app của chủ đề | `/quiz/<i>/format` |
| `image_missing` | cảnh báo | Thiếu `image` ở chỗ `image_expected` ghi (SK-033); Duy duyệt bài thử thì chuyển chỗ đó sang `image_required` | câu `/quiz/1`, lựa chọn `/quiz/0/options/2`, thẻ từ `/quiz/1/bank/0`, món `/play/items/3` |
| `image_brief_keywords` | cảnh báo | `brief` thiếu "Từ khoá tìm ảnh (EN): …" (khi `image_search_keywords: true`), brief dùng lại không nêu key, hoặc brief ghép không có từ khoá lẫn hình dùng lại | `…/image/brief`, hoặc `…/image` khi không có brief |
| `multi_choice_correct_spread` | lỗi (SK-047: cảnh báo trong lúc content-editor sửa 40 bài, lỗi từ 15/11) | Trong một chủ đề, một số đáp án đúng có quá `max(1, floor(multi_choice_correct_spread × n))` câu MC | `/` của topic |
| `vocab_item_uses_lesson_word` | cảnh báo | `fill_blank_bank` ở Quiz không có từ nào trong `answers` trùng một từ `tier: core` của `vocab` (khi `vocab_item_uses_lesson_word: true`) | `/quiz/<i>/answers` |

**`authoring`** (`content/rules.json`, khoá của `<nhóm>.authoring`; định dạng ở `schema/rules.schema.json#/$defs/Authoring`):

| Khoá | Explorer | Discoverer | Scientist |
| --- | --- | --- | --- |
| `quiz_formats` | `single_choice`, `true_false`, `order_sequence` | 6 format v1 | 6 format v1 |
| `warmup_formats` | `single_choice`, `true_false` | `single_choice`, `multi_choice`, `true_false`, `fill_blank_bank` | như Discoverer |
| `option_count` | `single_choice` [2, 3], `order_sequence` [3, 3] | `single_choice` [3, 4], `multi_choice` [2, 6], `order_sequence` [3, 5], `picture_bar_chart` [3, 4] | `single_choice` [4, 4], `multi_choice` [2, 6], `order_sequence` [3, 6], `picture_bar_chart` [4, 4] |
| `image_required` | `choice_option`, `sequence_item`, `true_false` | không | không |
| `image_expected` (SK-033) | `question`, `choice_option`, `sequence_item`, `bank_word`, `tray_item` | như Explorer | như Explorer |
| `image_search_keywords` (SK-033) | `true` | `true` | `true` |
| `dok_mix` | [3, 3, 0] | [2, 3, 1] | [1, 3, 2] |
| `first_item_dok` | 1 | 1 | 1 |
| `misconception_items` | [1, 1] | [1, 1] | [1, 2] |
| `min_formats` | 2 | 3 | 3 |
| `max_words_en` | 8 | 10 | 15 |
| `multi_choice_correct_spread` (SK-047) | không (không có MC) | 0.5 | 0.5 |
| `vocab_item_uses_lesson_word` (SK-047) | không (không có FB) | `true` | `true` |

- `multi_choice_correct_spread`: số trong (0, 1], thiếu thì không kiểm. `vocab_item_uses_lesson_word`: boolean, thiếu = `false`. **Mức** của hai mã nằm ở bảng `ISSUE_LEVELS` (`src/validate/age-rules.ts`), không ở `rules.json` (file này đi vào manifest và chỉ được thêm khoá, nên không thêm cờ tạm). `multi_choice_correct_spread` là cảnh báo trong lúc content-editor sửa 40 bài Discoverer và là **lỗi** từ 15/11, khi nội dung đã đạt: `validate` exit 1, `build` dừng. `vocab_item_uses_lesson_word` giữ cảnh báo vì chỉ so gần đúng. Đổi mức một mã: sửa dòng của nó trong `ISSUE_LEVELS`, cùng dòng trong `test/age-rules.test.ts` và bảng mã ở trên.
- `[min, max]` tính cả hai đầu; `rules.ts` kiểm `min <= max` và tổng `dok_mix` = 6. "`multi_choice` ≤ 6" ghi [2, 6]: 2 là mức tối thiểu của schema. Format không có trong `option_count` chỉ theo giới hạn của schema (vd `fill_blank_bank` chưa có luật số từ trong ngân hàng). `max_words_en` thiếu thì không kiểm.
- `image_required`, `image_expected` (cùng tập chỗ, `schema/rules.schema.json#/$defs/ImageSlot`): `question` = trường `image` của chính câu, mọi format; `choice_option` = mọi lựa chọn của `single_choice`, `multi_choice` (không gồm `picture_bar_chart`: bé chạm cột, lựa chọn không có hình, SK-043 14/11); `sequence_item` = mọi thẻ `order_sequence`; `true_false` = trường `image` của chính câu `true_false`; `bank_word` = mọi thẻ từ của `fill_blank_bank`; `tray_item` = mọi món `build_tray`. Một chỗ có trong cả hai danh sách thì là lỗi. `image_expected`, `image_search_keywords` là khoá tuỳ chọn (thiếu thì không kiểm); app và server bỏ qua cả `authoring`.
- Chưa kiểm bằng máy: câu misconception của Explorer đặt ở câu 6; số từ EN trên một màn; tỉ lệ đúng kỳ vọng; vùng chạm (việc của app).

**Bảng format → bản app** (`src/validate/format-renderers.ts`, một chỗ cho `build` và `validate`; nguồn: `hasRenderer(for:)` của iOS, `LessonPlayer/ContentScoring.swift`). App chọn màn theo `age_group` của chủ đề (SK-040: Explorer có màn riêng; Scientist chạy như Discoverer), nên bảng có một cột mỗi kiểu màn:

| Format | Discoverer, Scientist | Explorer |
| --- | --- | --- |
| `single_choice`, `true_false` | 0.1.0 | 0.1.0 |
| `multi_choice`, `fill_blank_bank` | 0.1.0 | chưa có (luật Explorer cũng không cho dùng) |
| `order_sequence` | 0.1.0 (SK-043, màn A2) | 0.1.0 (SK-040) |
| `picture_bar_chart` | 0.1.0 (SK-043, màn A2) | chưa có (luật Explorer cũng không cho dùng) |

App cũ gặp format chưa có renderer thì bỏ câu, quiz còn dưới 6 câu và sao lệch. Vì vậy `build` báo lỗi khi bài dùng format mà bản app của chủ đề chưa hiện được: khi có renderer, build với `--min-app-version` ≥ bản đó, app cũ thấy chủ đề "cần cập nhật". Câu dùng format mà luật nhóm không cho thì chỉ báo `age_format_not_allowed`, không báo thêm `format_not_rendered`. ios-dev đề xuất sửa bảng mỗi khi thêm renderer; `test/age-rules.test.ts` kiểm mỗi cột có đủ mọi format của content-schema.

Quy ước bản app (dev 12/11): `MARKETING_VERSION` của iOS là 0.1.0 (`apps/ios/Config/Base.xcconfig`) và chưa bản nào phát hành (SK-020 chưa làm: chưa TestFlight, chưa store). Renderer vào trước bản phát hành đầu tiên thì ghi 0.1.0, bằng mặc định `--min-app-version`, nên `validate`/`build` không cần cờ (Explorer `order_sequence`). Từ khi một bản đã phát hành, renderer mới ghi bản `MARKETING_VERSION` kế tiếp (ios-dev tăng số), và nội dung dùng nó phải build với `--min-app-version` (hoặc `min_app_version` của block) bằng bản đó.

**Fixture** (`test/fixtures/age-rules/`, dữ liệu test, không phải nội dung cho trẻ; sinh bằng `npm run make-age-fixtures`, đừng sửa tay):
- `valid/explorer/fixture-explorer/`, `valid/scientist/fixture-scientist/`: một bài tối thiểu hợp lệ mỗi nhóm. Discoverer dùng bài 1 của `packages/content-schema/fixtures/valid`.
- `invalid/*.json`: mỗi file là một bài hợp lệ với đúng **một** lỗi luật tuổi; `expected.json` ghi tay pointer và mã mong đợi. Cảnh báo không tính.

## Ảnh: images search, chọn, images fetch (SK-033)

Ảnh chụp thật hoặc hình vẽ gần thực tế từ nguồn miễn phí cho phép dùng thương mại; không lấy hình AI từ nguồn ngoài. Đồ vật không có ảnh miễn phí hợp lệ thì Science Kids tự vẽ (Duy 10/11; designer hoặc agent vẽ, kể cả vẽ bằng AI): mục "Hình tự vẽ". Quy trình cho một bài:

```sh
# 1. Tìm ứng viên (không tải ảnh): content/.build/images/<topic_slug>/<lesson_slug>/candidates.html + candidates.json
npm --prefix tools/content-cli run images -- search content/discoverer/be-mat-trai-dat/01-dat-va-nuoc-tren-trai-dat.md
# 2. Mở candidates.html, xem trang gốc từng ảnh, chọn; chép JSON ở cuối trang vào file chọn ảnh:
#    content/images/discoverer/be-mat-trai-dat/dat-va-nuoc-tren-trai-dat.json   (trong git)
# 3. Tải, kiểm lại giấy phép ở nguồn, xử lý vào cache content/.images/ (ngoài git)
npm --prefix tools/content-cli run images -- fetch content/images/discoverer/be-mat-trai-dat
# 4. build như cũ: điền image.asset, chép assets/<sha256>.jpg, credit vào manifest
```

**Quy tắc giấy phép** (SK-033 "Đề xuất" 2; `src/images/license.ts`, cả `search` lẫn `fetch` dùng):
- Nhận: CC0 1.0; public domain có nhãn trên trang gốc (Commons `Public domain`); PDM 1.0; CC BY mọi phiên bản (kể cả bản port) khi nguồn ghi tác giả.
- Loại: BY-SA, NC, ND, GFDL và giấy phép copyleft khác; nhãn không rõ ("Attribution", "No restrictions", "Copyrighted free use", không ghi); file Commons có `Restrictions` (personality = người nhận ra được, trademarked, insignia = huy hiệu cơ quan) hoặc `NonFree`; kết quả Openverse đánh dấu `mature`; ảnh nhỏ hơn 600 px cạnh dài; GIF.
- Ảnh CC0, public domain, PDM được sửa `title` cho trung tính (tên hiện ở màn "Nguồn hình"); ảnh CC BY phải giữ `title` như nguồn ghi (CC BY 2.0, 3.0 yêu cầu), `fetch` báo lỗi nếu khác.
- Người chọn vẫn phải mở trang gốc: không mặt người nhận ra được (nhất là trẻ em), không logo, nhãn hiệu, huy hiệu NASA/USGS/NOAA, tên gọi Biển Đông, Hoàng Sa, Trường Sa đúng.

**`images search <bài .md | thư mục chủ đề>...`**
- Mỗi `Image` của bài: lấy từ khoá ở cuối dòng `brief` ("Từ khoá tìm ảnh (EN): …"; tách theo `;` thành nhiều truy vấn, cụm hơn 6 từ có dấu phẩy thì tách cả dấu phẩy; thiếu thì dùng `alt.en`). Commons: tối đa 3 truy vấn, truy vấn hơn 3 từ không ra ảnh nào thì thử lại với 3 từ đầu. Openverse: tối đa 2 truy vấn, lọc `category` theo nhãn đầu brief (`[ảnh]`, `[ảnh mô hình]` → ảnh chụp; `[tranh]`, `[tranh phục dựng]` → hình vẽ; nhãn khác không lọc).
- Brief ghép (mục "Hình ghép"): mỗi truy vấn của "Từ khoá tìm ảnh (EN)" là **một ảnh cần tìm** (không phải truy vấn thay thế), "Từ khoá cho <phần>: <a>; <b>." thêm một ảnh có tên; mỗi ảnh tìm riêng, tối đa `--per-image` ứng viên. Key trong backtick của brief (\`tray_eggshell\`, \`<bài>/<key>\`, \`<key>\` ở bài \`<chủ đề>/<bài>\`) là ảnh dùng lại; hình của bài này mà chính nó dùng lại hình ghép thì bỏ qua. Trang ứng viên có lựa chọn "Hình ghép từ các ảnh đánh dấu" và ra mục `composed` (file đề xuất `content/images/composed/<chủ đề>/<bài>.<khoá>.jpg`, `title` = `alt.en`).
- Brief hình tự vẽ (\`[hình vẽ]\`, \`[hình tự vẽ]\`, \`[tự vẽ]\`): không tìm, không gọi mạng; `candidates.json` có `own` (mục đề xuất, file `content/images/own/<chủ đề>/<bài>.<khoá>.jpg`, `title` = `alt.en`), trang có lựa chọn "Hình tự vẽ (đã có file)". Brief dùng lại hay brief ghép có nhãn vẽ vẫn đọc như dùng lại, ghép.
- Brief "Dùng lại hình \`<key>\`." (hoặc kiểu cũ "Dùng lại hình … của món tray_rice"): không tìm, trang ứng viên đề xuất `{ "same_as": "<khoá>" }`. "… ở bài \`<chủ đề>/<bài>\`", "\`<bài>/<key>\`" hoặc "ở bài một": đề xuất `{ "same_as": "<key>", "lesson": "<chủ đề>/<slug bài>" }`.
- Lấy xen kẽ Commons và Openverse, bỏ trùng trang gốc, tối đa `--per-image` (mặc định 6). `candidates.json` ghi mỗi hình: khoá, pointer, alt, brief, truy vấn, ứng viên (nguồn, trang gốc, URL file, thumbnail, tên, tác giả, giấy phép, kích thước, `selection` chép được vào file chọn ảnh), số ứng viên bị loại theo lý do, ghi chú. `candidates.html`: mỗi hình một hàng, thumbnail hiện thẳng từ nguồn; chọn nút tròn thì khung cuối trang ra JSON của cả file chọn ảnh (gộp với lựa chọn đã có trong file).
- Trả lời API lưu ở `content/.build/images/.cache/` (`--refresh` để hỏi lại). Openverse không khoá: 20 lượt/phút (chờ 3,1 s giữa hai lượt), 200 lượt/ngày; lệnh dừng gọi Openverse ở lượt thứ 190 trong ngày (`.cache/openverse-usage.json`, dùng chung với `fetch`) hoặc khi nhận 429. Commons cách nhau 0,3 s. Mọi request gửi User-Agent riêng (`ScienceKidsContentCLI/0.1 …`), không có dữ liệu cá nhân.
- Trả lời 5xx (Openverse hay trả 504 khi tìm lâu) thì chờ 5 giây, thử lại một lần.
- Cờ: `--key <khoá>` (lặp được) chỉ tìm hình đó · `--per-image <n>` · `--refresh` · `--cache-only` (không gọi mạng, chỉ dựng lại trang từ cache; vd sau khi sửa file chọn ảnh) · `--sources commons|openverse|commons,openverse` · `--out <thư mục>` · `--images <thư mục>` (file chọn ảnh, để hiện lựa chọn cũ) · `--content-root`, `--rules` như validate. Exit 1 khi bài còn lỗi markdown hoặc content-schema (chưa tìm được).

**Khoá hình** (`src/images/slots.ts`): các `key` từ gốc bài tới hình, nối bằng dấu chấm; Khởi động, Quiz, Chơi không có tiền tố (key của câu, của block chơi đã đủ rõ), Học, Từ vựng, Thưởng thì có. Content-schema bắt mọi key trong bài là duy nhất, nên khoá hình cũng duy nhất.

| Hình | Khoá |
| --- | --- |
| câu `/quiz/2/image` | `q3` |
| lựa chọn `/quiz/2/options/1/image` | `q3.q3_river` |
| thẻ từ `/quiz/1/bank/0/image` | `q2.q2_piece` |
| món Chơi `/play/items/4/image` | `tray.tray_sea` (key của block chơi là `tray`) |
| nhóm ô Học `/learn/0/groups/1/image` | `learn.explore.explore_water` |
| từ vựng `/vocab/3/image` | `vocab.model` |
| thẻ thưởng `/reward/collectible/image` | `reward.ha_long` |

**File chọn ảnh** `content/images/<age_group>/<topic_slug>/<lesson_slug>.json` (`_topic.json` cho hình của topic; định dạng `schema/image-selection.schema.json`):

```json
{
  "images": {
    "tray.tray_sea": {
      "source": "Wikimedia Commons",
      "source_url": "https://commons.wikimedia.org/wiki/File:….jpg",
      "file_url": "https://upload.wikimedia.org/wikipedia/commons/…/….jpg",
      "title": "…", "author": "…", "license": "CC0 1.0",
      "license_url": "https://creativecommons.org/publicdomain/zero/1.0/",
      "crop": { "left": 0, "top": 0.1, "width": 1, "height": 0.8 }
    },
    "q1.q1_sea": { "same_as": "tray.tray_sea" },
    "tray.tray_river": {
      "source": "Openverse/Flickr", "openverse_id": "…uuid…",
      "source_url": "https://www.flickr.com/photos/…", "file_url": "https://live.staticflickr.com/….jpg",
      "title": "…", "author": "…", "license": "CC BY 2.0", "license_url": "https://creativecommons.org/licenses/by/2.0/"
    },
    "vocab.island": { "same_as": "tray_island", "lesson": "be-mat-trai-dat/dat-va-nuoc-tren-trai-dat" }
  }
}
```

- Mục ảnh: `source` (`Wikimedia Commons` hoặc `Openverse/<nhà cung cấp>`, khi đó bắt buộc `openverse_id`), `source_url`, `file_url`, `title`, `author` (`Unknown` khi nguồn không ghi, chỉ với CC0/PD/PDM), `license`, `license_url`, `crop` tuỳ chọn (tỉ lệ 0–1 của ảnh đã xoay theo EXIF), `note` tuỳ chọn. Sáu trường credit vào gói đúng như ghi.
- `same_as`: khoá hình, hoặc key như brief viết (`tray_island`, `q3`): khớp đúng khoá, không có thì khớp phần cuối khoá. Có `lesson` (`<slug chủ đề>/<slug bài>`, cùng nhóm tuổi; `nn-` ở đầu tên bài được bỏ qua) thì lấy ảnh đã chọn trong file chọn ảnh của bài đó. Một bước sang bài khác, rồi tối đa một `same_as` trong file đó.
- Hình không có trong file: chưa chọn (app vẽ hình giữ chỗ).
- `composed`: hình ghép, mục "Hình ghép" bên dưới.
- `own`: hình tự vẽ, mục "Hình tự vẽ" bên dưới.

**`images fetch <file chọn ảnh | thư mục>...`**
- Mỗi ảnh khác nhau (theo `file_url` + `crop`) xử lý một lần. `same_as` có `lesson` kéo theo ảnh gốc của bài kia, nên fetch một file là đủ cho build.
- Kiểm lại ở nguồn trước khi tải: Commons (imageinfo + extmetadata của trang `File:`): `file_url` vẫn là URL file, giấy phép hợp quy tắc và đúng `license`, `license_url`, có tác giả nếu CC BY, CC BY thì `title` như nguồn. Openverse (bản ghi chi tiết của `openverse_id`): giấy phép, `url`, trang gốc, nhà cung cấp, `title` (CC BY) khớp; trang gốc trên Commons thì kiểm cả ở Commons; nhà cung cấp khác (Flickr…) chỉ kiểm được qua Openverse nên lệnh in dòng "Kiểm tay: …" để người chọn xác nhận trên trang gốc. Lệch hoặc không hợp quy tắc: báo `KHÔNG DÙNG`, không tải, exit 1. Tác giả khác nguồn: cảnh báo, vẫn dùng.
- Tải (User-Agent riêng; tối đa 40 MB). Ảnh Commons (cả ảnh Openverse có trang gốc trên Commons, khi URL file trùng) **không tải file gốc**: lấy `thumburl` 1280 px trong cùng lượt imageinfo đã kiểm giấy phép (`iiurlwidth=1280`, một cỡ chuẩn của Wikimedia); ảnh rộng ≤ 1280 px dạng JPEG/PNG/WebP thì tải URL gốc (đã nhỏ), TIFF… luôn lấy bản Commons vẽ lại. `crop` là tỉ lệ nên áp như nhau trên bản thu nhỏ.
- Nhịp gọi: Commons API cách nhau 1 s, tải từ `upload.wikimedia.org` cách nhau 3 s, nguồn khác 0,3 s, Openverse 3,1 s (như search). Trả lời 429 hoặc 503 (Commons API và mọi lượt tải): chờ theo `Retry-After` (số giây hoặc ngày giờ), ít nhất 5 / 15 / 45 s cho lượt thử lại 1 / 2 / 3, nhiều nhất 120 s, in một dòng mỗi lần chờ; sau 3 lượt thử lại vẫn lỗi thì ảnh đó `KHÔNG DÙNG` như cũ. Openverse API không thử lại (mỗi lượt tính vào hạn mức ngày).
- Xử lý bằng `sharp`: xoay theo EXIF, cắt, cạnh dài ≤ 1024 px (không phóng to), sRGB, phần trong suốt thành nền trắng, JPEG q82 (mozjpeg), bỏ mọi metadata (EXIF, GPS, ICC). Cùng file nguồn ra cùng bytes.
- Ghi `content/.images/<sha256>.jpg` và `content/.images/index.json`: khoá cache → sha256, kích thước, `credit`, `changes`, URL đã tải, kích thước gốc, các bước kiểm giấy phép (`verified.via`, giấy phép và tác giả ở nguồn, thời điểm), ngày tải. Ảnh đã có (cùng khoá, cùng credit) thì bỏ qua; `--force` tải và kiểm lại; `--cache <thư mục>` đổi chỗ cache.
- Hình ghép: mục "Hình ghép". Hình tự vẽ: mục "Hình tự vẽ" (không gọi mạng).

### Hình ghép (SK-033, dev 10/11)

Một `Image` chỉ có một `asset`. Hình cần nhiều ảnh (trục thời gian, khủng long cạnh xe buýt, hai con vật chung một cảnh, sơ đồ mặt cắt đã xoá nhãn, ảnh tô nổi một phần) do designer ghép thành **một file** từ các ảnh nguồn hợp quy tắc giấy phép, rồi khai trong file chọn ảnh:

```json
"learn.explore.explore_people": {
  "composed": {
    "file": "content/images/composed/khung-long/trai-dat-rat-lau-ve-truoc.learn.explore.explore_people.jpg",
    "parts": [
      { "same_as": "tray_longneck" },
      { "same_as": "tray_stegosaurus", "lesson": "khung-long/khung-long-la-gi" },
      { "source": "Wikimedia Commons", "source_url": "https://commons.wikimedia.org/wiki/File:….jpg",
        "file_url": "https://upload.wikimedia.org/…/….jpg", "title": "…", "author": "…",
        "license": "CC0 1.0", "license_url": "https://creativecommons.org/publicdomain/zero/1.0/" }
    ]
  },
  "title": "Timeline from the dinosaurs to a kite",
  "note": "đã xoá nhãn gốc, thêm dải nâu"
},
"q4": { "same_as": "explore_people" }
```

- `file`: `content/images/composed/<slug chủ đề>/<tên>.jpg` (hoặc `.jpeg`), trong git. Nên là JPEG sRGB, cạnh dài ≤ 1024 px, không metadata; khác thì `fetch` vẫn xử lý lại theo hợp đồng và in "lưu ý" để designer lưu đè cho repo nhẹ.
- `parts` (1–12): mỗi phần là `{ "same_as": "<khoá>"[, "lesson": "<chủ đề>/<bài>"] }` trỏ tới ảnh đã có trong file chọn ảnh (cùng file hoặc bài khác, như `same_as` thường), hoặc một mục ảnh nguồn đầy đủ như ảnh thường (`source`, `source_url`, `file_url`, `title`, `author`, `license`, `license_url`, `openverse_id`, `crop` tuỳ chọn), hoặc một hình tự vẽ (`{ "own": …, "title": … }` viết ngay trong `parts`, hoặc `same_as` tới mục `own`). Phần trỏ tới một hình ghép khác thì lấy các ảnh nguồn của hình đó (chỉ một lớp; lồng hai lớp là lỗi). Cùng một ảnh nguồn hai lần thì tính một.
- `title` (bắt buộc): tên ở màn "Nguồn hình"; tự đặt, trung tính. `note` tuỳ chọn.
- `same_as` tới hình ghép (cả từ bài khác) dùng lại nguyên hình đó.
- Giấy phép của hình ghép là **giấy phép chặt nhất** trong các phần: CC BY (lấy phần CC BY đầu tiên trong `parts`) > Science Kids (có phần tự vẽ; `license_url` trống) > Public domain > PDM 1.0 > CC0 1.0. Credit trong gói: `author` = `Science Kids`, `source` = `composed`, `changes` luôn có `composed`, `parts` = credit đủ 6 trường của từng ảnh nguồn; phần tự vẽ là `{ title, author, license, license_url: "", source }` với ba trường "Science Kids", không có `source_url` (mục `catalog/v1/manifest.json`). App tự thêm dòng "Ghép từ nhiều ảnh" theo ngôn ngữ giao diện.

**Quy trình (designer):**

```sh
# 1. Ghi mục composed với parts (file ghép chưa cần có), rồi fetch: mọi ảnh thành phần được kiểm giấy phép ở nguồn
#    và tải, xử lý vào content/.images/; hình ghép in "chờ ghép" kèm đường dẫn từng ảnh thành phần (exit 0).
npm --prefix tools/content-cli run images -- fetch content/images/discoverer/khung-long/trai-dat-rat-lau-ve-truoc.json
# 2. Ghép từ các file content/.images/<sha256>.jpg vừa in ra (chỉ dùng ảnh trong danh sách parts),
#    lưu vào composed.file: content/images/composed/khung-long/….jpg (JPEG ≤ 1024 px, sRGB, không metadata)
# 3. fetch lại: ảnh thành phần "đã có" (không gọi mạng), file ghép được xử lý vào cache với credit từng phần
npm --prefix tools/content-cli run images -- fetch content/images/discoverer/khung-long/trai-dat-rat-lau-ve-truoc.json
# 4. build như cũ
```

- `fetch`: phần nào `KHÔNG DÙNG` (giấy phép lệch, hạn chế…) thì hình ghép cũng `KHÔNG DÙNG`, exit 1, không vào cache. Hai mục cùng `file` mà khác `title` hay `parts`: lỗi (dùng `same_as`). Khoá cache của hình ghép là sha256 của file ghép (cộng cách xử lý); `index.json` ghi `credit` (có `parts`), `changes`, `composed.file`, `composed.file_sha256`, kích thước gốc, sha256 của từng ảnh thành phần trong cache, các "lưu ý".
- `build`: chưa có file ghép thì hình đó vẽ hình giữ chỗ và có một cảnh báo "hình ghép chưa có file" (`--require-assets`: lỗi). Có file mà chưa fetch, file sửa sau lần fetch trước, hay `title`/`parts` đổi: lỗi, nhắc chạy lại `images fetch`.
- `check-pack.sh`: hình ghép phải có `title`, `author`, `license`, `changes` có `composed`, `parts` không rỗng; mỗi phần đủ 6 trường, giấy phép hợp quy tắc, URL https, không phải hình ghép (phần tự vẽ: `title`, `author`/`license` "Science Kids", không URL); có phần CC BY thì giấy phép hình ghép phải là CC BY; có phần tự vẽ mà không phần CC BY thì giấy phép là "Science Kids", `license_url` trống; còn lại giấy phép hợp quy tắc, `license_url` https.

### Hình tự vẽ (SK-033, dev 10/11)

Duy 10/11: đồ vật không có ảnh miễn phí hợp lệ thì "nhờ AI vẽ ảnh minh hoạ". Designer (hoặc agent) vẽ, xuất **JPEG**; hình do Science Kids làm, không có nguồn ngoài, nên không có giấy phép bên thứ ba để kiểm. Khai trong file chọn ảnh:

```json
"tray.tray_globe": {
  "own": { "file": "content/images/own/be-mat-trai-dat/globe.jpg", "method": "drawn" },
  "title": "Plastic globe on a desk",
  "note": "designer vẽ 10/11 theo brief"
},
"q2.q2_globe": { "same_as": "tray_globe" }
```

- `file`: `content/images/own/<slug chủ đề>/<tên>.jpg` (hoặc `.jpeg`), một cấp thư mục, trong git. Đọc từ `<gốc file chọn ảnh>/own/…`. Nên là JPEG sRGB, cạnh dài ≤ 1024 px, không metadata; khác thì `fetch` vẫn xử lý lại theo hợp đồng và in "lưu ý" để designer lưu đè.
- `method`: `drawn` (designer hoặc agent vẽ, kể cả vẽ bằng AI). Sau có thể thêm `photo` (tự chụp) mà không đổi cú pháp.
- `title` (bắt buộc): tên ở màn "Nguồn hình", tiếng Anh như `alt.en`, trung tính. `note` tuỳ chọn.
- `same_as` tới hình tự vẽ (cả từ bài khác) dùng như ảnh thường. Hình tự vẽ làm được phần của hình ghép (mục "Hình ghép").
- Brief của hình cần vẽ mở đầu bằng nhãn `[hình vẽ]` (hoặc `[hình tự vẽ]`, `[tự vẽ]`): `validate` không đòi "Từ khoá tìm ảnh (EN)", `images search` không tìm mà đề xuất mục `own` (file `content/images/own/<chủ đề>/<bài>.<khoá>.jpg`).

**Quy trình (designer):**

```sh
# 1. Vẽ theo brief, xuất JPEG vào content/images/own/<chủ đề>/<tên>.jpg; ghi mục own vào file chọn ảnh
# 2. fetch: kiểm file có thật, xử lý theo hợp đồng ảnh vào content/.images/ (không gọi mạng)
npm --prefix tools/content-cli run images -- fetch content/images/discoverer/be-mat-trai-dat/dat-va-nuoc-tren-trai-dat.json
# 3. build như cũ
```

- `fetch`: chưa có file: `KHÔNG DÙNG hình tự vẽ, chưa có file …`, exit 1 (khác hình ghép "chờ ghép": mục `own` nghĩa là đã vẽ xong; gõ sai đường dẫn cũng ra lỗi này). Có file: xoay EXIF, cạnh dài ≤ 1024 px, sRGB, nền trong suốt thành trắng, JPEG q82, bỏ metadata, như ảnh tải về. Khoá cache = `own.file` + sha256 bytes file + cách xử lý; `index.json` ghi `credit`, `changes` (`["drawn"]`), `own.file`, `own.file_sha256`, `own.method`, kích thước gốc, các lưu ý. Hai mục cùng `file` mà khác `title` hay `method`: lỗi (dùng `same_as`). Hình tự vẽ được xử lý trước hình ghép, nên hình ghép có phần tự vẽ chỉ cần một lượt fetch.
- `build`: credit trong gói `{ title, author: "Science Kids", license: "Science Kids", license_url: "", source: "Science Kids", changes: ["drawn"] }`, đúng thứ tự khoá này; không `source_url`, không `parts`. `changes` chỉ có cách làm: hình của mình thu nhỏ không cần ghi. Chưa có file, chưa fetch, file sửa sau lần fetch, hay `title`/`method` đổi: lỗi, nhắc chạy lại `images fetch`. Dòng báo cáo: "Hình: N file ảnh (k hình ghép, m hình tự vẽ) cho … Image".
- `check-pack.sh`, với `credit.source = "Science Kids"`: có `title`; `author`, `license` là "Science Kids"; `license_url` và `source_url` trống hoặc không có; không `parts`; `changes` có `drawn`.
- App (ios-dev): hiện như ảnh có credit; `changes: ["drawn"]` là giá trị app chưa biết nên hiện nhãn "Edited" · "Đã chỉnh sửa" tới khi ios-dev thêm nhãn riêng.

### Ảnh lệch khung (Duy 13/11, SK-043)

App lấp ảnh vào khung của chỗ dùng (thẻ lựa chọn, thẻ xếp, hình câu hỏi, trang Học, món ở màn Chơi, thẻ từ vựng, sticker thưởng). Ảnh dọc trong thẻ ngang thì bị cắt mất đầu con vật. `build` và `images fetch` so kích thước ảnh đã xử lý (sau `crop`) với tỉ lệ khung trong `tools/content-cli/image-slots.json` và **cảnh báo, không chặn**, khi lệch quá `max_factor` (2,2, khớp `PictureFit.maxCropRatio` của app iOS: quá mức đó app thôi cắt, hiện cả ảnh thu nhỏ giữa giấy; lệch 2 = lấp khung mất nửa ảnh). Hạ `max_factor` (vd 1,5) để thấy cả những ảnh bị cắt nhiều. Khung nào cắt ít hơn mức đó đã mất con vật thì có ngưỡng riêng, chặt hơn, trong `max_factors` (SK-053 19/11: `vocab` 1,6, để ảnh vuông ở thẻ từ 2:1 của Explorer, lệch ×2, bị cảnh báo; ảnh 4:3 lệch ×1,5 và ảnh đã `crop` 2:1 thì qua; Discoverer thẻ từ 4:3 nên ảnh vuông ×1,33 vẫn qua).

- Khung theo JSON pointer của Image: `/quiz|warmup/<i>/image` hình câu hỏi (`question`; nhóm có `hide_question_image_with_picture_choices` (Explorer, Discoverer A2) bỏ qua khi mọi lựa chọn, thẻ xếp hoặc thẻ từ đều có hình vì app ẩn nó), `…/options/<j>/image` thẻ lựa chọn (`choice_2`, `choice_3`, `choice_4` = 4 lựa chọn trở lên), `…/items/<j>/image` thẻ xếp (`order_item`), `…/bank/<j>/image` thẻ từ có hình (`bank_item`), `/learn/<i>/groups/<j>/image` (`learn_group`), `/play/items/<j>/image` (`tray_item`), `/vocab/<i>/image` (`vocab`), `/reward/collectible/image` (`reward`). Chỗ khác không kiểm.
- `image-slots.json`: `default` cho mọi nhóm tuổi, `age_groups.<nhóm>.ratios` ghi đè từng khung, `age_groups.<nhóm>.max_factor` nếu cần, `max_factors.<khung>` (và `age_groups.<nhóm>.max_factors.<khung>`) cho ngưỡng riêng một khung. Ngưỡng của một khung lấy cái có trước: `age_groups.<nhóm>.max_factors.<khung>`, `max_factors.<khung>`, `age_groups.<nhóm>.max_factor`, `max_factor`; mọi ngưỡng phải là số > 1, khung lạ thì lỗi. Giá trị `"rộng:cao"` (vd `"5:2"`) hoặc số. Sai dạng thì build/fetch dừng với lỗi nêu chỗ sai. Designer chốt tỉ lệ khung trong SK-043 thì sửa file này. Đang có: Explorer theo bảng designer 13/11 (`choice_3` 5:2, `choice_2` 17:10); Discoverer theo A2 Duy duyệt 14/11 (`choice_2`/`choice_3` 5:2 thẻ ngang, `choice_4` 4:5 lưới 2×2, `bank_item` 1:1, `vocab` 4:3, `learn_group`/`tray_item` 1:1; khung trang Học đo trên máy là khung dọc 0,78–0,89:1, xem ghi chú trong file). Lựa chọn của `picture_bar_chart` không có hình (bé chạm cột), cột không kiểm.
- Dòng cảnh báo: `<file bài> bài <nn-slug> · hình <khoá> (<chỗ dùng>): ảnh W×H <dọc|ngang|vuông> <tỉ lệ>, khung <tỉ lệ>; lệch ×N: lấp khung thì mất khoảng X% ảnh … Đặt "crop" trong <file chọn ảnh> mục <khoá> (gợi ý cắt giữa {…}) …, hoặc chọn ảnh khác.` Gợi ý crop là phần giữa ảnh theo đúng tỉ lệ khung, tính trên ảnh gốc (đã gộp `crop` cũ); dời `left`/`top` cho đúng chỗ cần thấy. Ảnh `same_as` thì crop đặt ở mục gốc và đổi mọi chỗ dùng chung. Hình ghép, hình tự vẽ: sửa file theo khung.
- `build`: một dòng tổng `ảnh lệch khung (…): N hình · <chủ đề> n, …` rồi từng dòng, trong mục Cảnh báo.
- `images fetch`: cuối lượt chạy, kiểm các bài của file chọn ảnh vừa fetch bằng markdown `content/<nhóm>/<chủ đề>/<nn>-<bài>.md` (cùng gốc với `content/images/`); bài chưa qua content-schema thì in "Chưa kiểm tỉ lệ ảnh", thư mục ảnh không có markdown bên cạnh thì bỏ qua.

## ui-voice: chữ giao diện có giọng (SK-059)

Lời mascot không thuộc gói bài (vd gợi ý lần đầu ở màn Chơi) có clip riêng, nhúng trong app.

```sh
# từ gốc repo; sửa câu ở content/ui-voice/strings.json (key = key của Localizable.xcstrings, đủ en và vi)
npm --prefix tools/content-cli run ui-voice -- build
# nghe thử ở chỗ khác: --review-dir content/.build/tts/sk059
```

- Mỗi key × thứ tiếng một clip, sinh y như `tts`: cùng chuẩn hoá, giọng (Kokoro `af_heart` EN, VieNeu Kim Thanh VI), chuẩn âm lượng, m4a, khoá cache và cache `content/.audio`; VI tự kiểm bằng Whisper và đổi seed như `tts --lang vi`. Câu đã có trong bài thì dùng lại clip trong cache.
- Đầu ra `content/.build/ui-voice/` (ngoài git): `<key>.<en|vi>.m4a` + `manifest.json` (key → `file`, `sha256`, `bytes`, `duration_ms`, `text`, `read`), không có ngày giờ nên chạy lại cho cùng byte. Thư mục bị thay cả (chỉ khi trống hoặc là ui-voice build trước đó).
- File nghe thử: `review-ui-voice-en.m4a` và `review-ui-voice-vi.m4a` (+ `.txt`), mặc định trong `content/.build/tts/ui-voice/`.
- App iOS nhúng thư mục này thành `ui-voice/` trong bundle (xem SK-059, ghi chú dev 19/11).

## Kiểm thử

```sh
npm test            # node --test: chuẩn hoá, lấy Spoken theo schema, khoá cache, WAV, chọn câu nghe thử, build (cache giả, cả ảnh + check-pack.sh), rules.json so với vector và bảng SK-026, luật theo tuổi + fixture, luật phân bố MC và câu Từ mới (SK-047), validate, lỗi gọi CLI, markdown (khớp fixture bài 1, mỗi ca một lỗi một dòng, ids, không nạp tts), syllabus.json khi validate thư mục, ảnh (khoá hình, từ khoá, luật hình, giấy phép, file chọn ảnh, search và fetch với API giả từ test/fixtures/images, sharp; hình ghép: brief ghép, parts, giấy phép chặt nhất, fetch chờ ghép rồi xử lý, build + check-pack; hình tự vẽ: nhãn [hình vẽ], file chọn ảnh, search không tìm, fetch không gọi mạng, phần của hình ghép, build + check-pack)
npm run typecheck   # tsc
```

Unit test không cần model và không gọi mạng; test của `build` dùng cache giả trong thư mục tạm, test ảnh giả lập Commons và Openverse bằng fixture JSON và ảnh sinh bằng `sharp`. Test viết trước SK-033 đếm mọi cảnh báo nên chạy với `content/rules.json` bỏ các khoá chỉ sinh cảnh báo thêm sau SK-026: hai khoá ảnh (SK-033) và `vocab_item_uses_lesson_word` (SK-047: các test này sửa bài 1 sang format khác, từ khác rồi đếm mọi cảnh báo, nên không nên phụ thuộc một luật cảnh báo thêm sau; bài 1 gốc đạt luật này từ 15/11, q2 hỏi "nutrients", từ core) (`test/helpers.ts` › `rulesFileWithoutLaterWarnings`). Test ảnh và test SK-047 dùng file thật. Kiểm đầu ra của `tts` bằng `packages/content-schema`:

```sh
cd packages/content-schema
node scripts/validate.mjs ../../content/.build/tts/discoverer/an-uong-lanh-manh/topic.json \
                          ../../content/.build/tts/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json
```

## Tiếng Việt (`--lang vi`, SK-024)

**Cài đặt một lần** (cần `uv`; môi trường Python riêng, ngoài git):

```sh
cd tools/content-cli/tts-vi
uv sync                                                   # môi trường sinh .venv (VieNeu 3.8.3, Python 3.12)
uv run python vieneu_vi.py fetch                          # model đã ghim, 608,6 MB, kiểm sha256 (tts cũng tự tải khi thiếu)
UV_PROJECT_ENVIRONMENT=.venv-eval uv sync --only-group eval   # môi trường tự kiểm .venv-eval (faster-whisper, librosa)
```

Bước tự kiểm dùng model ASR `mobiuslabsgmbh/faster-whisper-large-v3-turbo` có sẵn trong cache Hugging Face của máy (`~/.cache/huggingface/hub`), không tải. Chi tiết runtime, giấy phép, phiên bản: `tts-vi/README.md` và SK-023.

**Chạy** sau `--lang en`, trên chính bản sao JSON của lần chạy EN (ghi đè tại chỗ được, vì đó là file trong `content/.build/`):

```sh
cd tools/content-cli
npm run tts -- --lang vi ../../content/.build/tts/discoverer/an-uong-lanh-manh/topic.json \
                         ../../content/.build/tts/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json \
               --out ../../content/.build/tts/discoverer/an-uong-lanh-manh
```

Mỗi `Spoken` có thêm `audio.vi`, `audio.en` giữ nguyên.

**Giọng.** Mặc định `Kim Thanh` (nữ miền Nam, SK-023), dự phòng `--voice "Đức Trí"`. VieNeu v3 Turbo không có tham số tốc độ. Đổi giọng thì mọi khoá VI đổi, phần VI sinh lại toàn bộ, không trộn hai giọng; EN không đụng tới.

**Tính tất định.** VieNeu lấy mẫu ngẫu nhiên. CLI gửi kèm một seed = sha256(giọng + chữ [+ biến thể]); cùng máy, cùng chữ thì ra đúng từng bit PCM. Clip VI còn được xoá ngày giờ trong m4a (`M4A_ENCODING_ZERO_TIMES`), nên sinh lại cũng ra **cùng sha256**. Clip EN giữ cách mã hoá cũ để khoá và hash không đổi. Máy Mac của Duy là máy sinh chính: ONNX Runtime trên x86 cho số thực lệch vài bit, đủ làm phép lấy mẫu rẽ hướng, nên đừng sinh lại clip đã duyệt trên máy khác.

**Bước tự kiểm** (mặc định bật cho VI; tắt bằng `--no-self-check`):
- Mỗi clip mới chạy qua `tts-vi/evaluate.py check`: Whisper nghe 2 lượt với hàng xóm khác nhau, đo lặng đầu và cuối, chỗ ngắt dài nhất, mức tiếng 40 ms cuối.
- Clip bị đánh dấu khi có một trong các lỗi sau:
  - máy nghe ra sai chữ hoặc sai thanh (bỏ qua nét giọng Nam: hỏi = ngã, tr = ch, s = x, d = gi = v, n = ng cuối, t = c cuối);
  - cụt cuối (40 ms cuối to hơn -30 dB);
  - không có khoảng lặng đầu;
  - ngắt quá 0,8 s (cộng 0,8 s nếu có ô trống);
  - engine phải tự sinh lại;
  - clip dưới 0,3 s, hoặc chỉ có lặng.
- Clip bị đánh dấu được sinh thêm `--max-variants` (mặc định 4) seed khác. Bản gốc và các bản mới được nghe chung một lượt; bản ít lỗi nhất được giữ, hoà thì giữ biến thể thấp hơn.
- Lựa chọn ghi vào **`tts-vi/variants.json` (trong git)**, nên lần chạy sau, kể cả khi mất cache, sinh lại đúng clip đó. Kết quả tự kiểm của từng clip lưu trong `index.json`.
- Các cờ khác:
  - `--recheck "<chữ>"`: tìm lại seed cho một chuỗi dù clip đã có.
  - `--pin-variant "<chữ>=<n>:<lý do>"`: chọn tay một biến thể sau khi nghe.
  - `--check-all`: tự kiểm cả clip đã có.
  - `--check-passes <n>`: số lượt máy nghe mỗi clip.

**Hậu xử lý âm thanh** (`src/audio-post.ts`, SK-024 ngày 1/11; áp cho cả EN và VI trước khi mã hoá):
- **Âm lượng:**
  - Mọi clip được đưa về **-18 LUFS, đo trên phần có tiếng**: lọc K-weighting và cổng -70 LUFS / -10 LU như BS.1770, nhưng chia khối 100 ms, bước 25 ms. Lý do: phần lớn clip ngắn (một từ chỉ 0,6–0,8 s), mà khối 400 ms của integrated LUFS chỉ cho một hai khối ở đó, nên giá trị nhảy theo vị trí của từ trong clip.
  - Với ffmpeg `ebur128` (khối 400 ms), cùng các clip này đọc ra khoảng -19 LUFS.
  - Limiter có nhìn trước 5 ms, nhả 60 ms, đặt trần true peak -1,5 dBTP trước khi mã hoá; AAC cộng thêm vài phần mười dB. Đo trên bài 1: 20/107 clip EN chạm limiter (sâu nhất -4,7 dB, không quá 88 ms mỗi clip), 2/110 clip VI (-0,6 dB).
- **Khoảng lặng, chỉ VI:**
  - Lặng đầu cố định 0,15 s, lặng cuối 0,35 s quanh phần có tiếng. Phần có tiếng là các cửa sổ 10 ms to hơn -50 dBFS, chừa thêm 10 ms ở mỗi đầu. Chỗ cắt có fade 5 ms.
  - EN giữ khoảng lặng của Kokoro (khoảng 0,33 s đầu, 0,46 s cuối).
- **Phát hiện engine cắt cụt:** nếu 30 ms cuối của đầu ra VieNeu (trước khi sửa khoảng lặng) còn to hơn -45 dBFS, bước tự kiểm đánh dấu `cut_end`.
- **Tham số nằm trong khoá cache** (`postSpec`, `POST_VERSION`): đổi mức đích, trần, khoảng lặng hay phiên bản thì clip sinh lại. Hậu xử lý là hàm thuần nên sinh lại ra cùng bytes.

**Chuẩn hoá VI** (`src/normalize/vi.ts`, `numbers-vi.ts`). Ca test lấy từ `content/tts-vi/listening-set.md`, mục "Ghi chú cho dev: luật đọc".

| Luật | Ví dụ |
| --- | --- |
| Ô trống thành quãng ngắt khoảng 0,8 s, **không** đọc "một". Câu được tách tại ô trống, chỗ nối được đệm cho đủ 0,8 s, vì lặng ở mép clip VieNeu chỉ khoảng 0,25 s | `nước và {1} để sống.` → `nước và … để sống.` |
| Số đếm: mốt, lăm, mười, mươi; hàng chục 0 sau hàng trăm; "không trăm" khi có hàng nghìn | `21` → `hai mươi mốt`, `105` → `một trăm linh năm`, `2026` → `hai nghìn không trăm hai mươi sáu` |
| Kiểu đọc số: `--vi-numbers sgk` (mặc định: linh, nghìn, bốn) hoặc `nam` (lẻ, ngàn, tư). SK-024 còn để mở câu hỏi 1 | `206` → `hai trăm linh sáu` / `hai trăm lẻ sáu` |
| Dấu chấm ngăn nghìn, dấu phẩy thập phân. Số viết kiểu Anh thì cảnh báo, không đoán | `1.000` → `một nghìn`, `2,5` → `hai phẩy năm`; `1,000` và `2.5` → cảnh báo `number_format` |
| Năm đọc như số đếm. Số thứ tự 1 và 4, tháng 4 | `1835` → `một nghìn tám trăm ba mươi lăm`, `thứ 1` → `thứ nhất`, `tháng 4` → `tháng tư` |
| Phân số đọc "phần", vì sea-g2p đọc "/" thành "trên". Phân số trông như ngày tháng thì cảnh báo `maybe_date` | `3/4` → `ba phần tư`, `1/2` → `một phần hai` |
| Phần trăm, khoảng số, số âm, đơn vị (chỉ sau số): kg, g, mg, m, cm, mm, km, l, ml, °C, % | `71%` → `bảy mươi mốt phần trăm`, `5–7` → `năm đến bảy`, `12 cm` → `mười hai xăng ti mét`, `100 °C` → `một trăm độ xê` |
| Viết tắt, công thức. Chữ in hoa không có trong bảng thì cảnh báo `acronym` | `TP.HCM` → `Thành phố Hồ Chí Minh`, `CO₂` → `xê ô hai`, `H₂O` → `hát hai ô` |
| Bảng đọc ép `READINGS` cho từ mượn, tên riêng. "vitamin" có trong bảng vì sea-g2p đọc theo âm Anh ("vai-tơ-min") | `Vitamin` → `Vi ta min`, `oxy` → `ô xi`, `Darwin` → `Đác uyn`, `kỷ Jura` → `kỷ Giu ra`, `Mohs` → `Mốt`, `Mary Anning` → `Me ri An ninh` |
| Từ không phải âm tiết tiếng Việt thì cảnh báo `loanword`, để biên tập viết phiên âm kèm hoặc thêm vào bảng | `nutrient` |
| Dấu thanh kiểu mới, như bài 1. sea-g2p cho cùng âm vị với cả hai kiểu; quy về một kiểu để hai cách viết dùng chung clip | `khỏe` → `khoẻ`, `hòa` → `hoà`, `thủy` → `thuỷ` |
| Gạch ngang giữa hai chữ thành dấu phẩy. Ngoặc đơn thành hai dấu phẩy. Dấu `:` giữ nguyên (VieNeu tự ngắt) | `rồi — chạm` → `rồi, chạm` |

Chữ hiển thị không đổi; chỉ chữ đưa vào engine được chuẩn hoá. VieNeu tự đổi "?" thành "." trong bước chuẩn hoá của nó, nên câu hỏi không lên giọng cuối câu (SK-023).

**Nghe duyệt VI.** `content/.build/tts/review-01-vi.m4a` + `.txt`: mọi clip VI khác nhau. Clip bị đánh dấu nằm ở đầu (kèm lý do), rồi tới clip của bài theo thứ tự trong bài, cuối cùng là clip chỉ có ở `topic.json`. `.txt` ghi mốc giây, JSON pointer, chữ VI gốc và chữ đã đọc.

**Build.** `build` chép clip VI như EN (`manifest.assets[].lang = "vi"`). Có `audio.vi` mà thiếu clip thì exit 1. Khi mọi bài đều có VI, thêm `--require-lang en,vi` để bắt buộc.

## Thư mục

```
src/cli.ts                 điểm vào, đọc cờ (validate, import, ids, tts, build, images, fetch-model)
src/tts/command.ts         lệnh tts
src/tts/kokoro-en.ts       Kokoro qua kokoro-js; kokoro-model.ts: ghim commit, sha256, tải model
src/tts/vieneu-vi.ts       VieNeu qua tts-vi/vieneu_vi.py serve (JSON-lines, seed theo chữ)
src/tts/self-check.ts      gọi tts-vi/evaluate.py check; variants.ts: tts-vi/variants.json
src/tts/utterance.ts       tách câu tại ô trống, đệm quãng ngắt theo engine
tts-vi/                    môi trường Python VieNeu + bước chấm (README riêng)
src/tts/review.ts          file nghe thử
src/build/command.ts       lệnh build (gói nội dung); rules.ts: đọc và kiểm content/rules.json
src/validate/command.ts    lệnh validate (JSON); age-rules.ts: luật theo nhóm tuổi (dùng chung với build)
src/markdown/              validate, import, ids trên markdown (SK-027): syntax.ts đọc dòng, convert.ts ra JSON + số dòng,
                           check.ts ba bước, files.ts tìm file và gốc nội dung, ids.ts, command.ts,
                           syllabus.ts kiểm <thư mục>/syllabus.json khi validate thư mục (SK-030)
src/validate/format-renderers.ts  bảng format → bản app đầu tiên hiện được (format_not_rendered)
src/images/                ảnh (SK-033): slots.ts khoá hình, từ khoá, brief dùng lại; license.ts quy tắc giấy phép;
                           selection.ts file chọn ảnh + same_as; sources.ts Commons/Openverse; net.ts HTTP, throttle, hạn mức;
                           search.ts + candidates-html.ts lệnh search; fetch.ts, process.ts (sharp), cache.ts content/.images
schema/image-selection.schema.json  định dạng file chọn ảnh
src/app-version.ts         so sánh MAJOR.MINOR.PATCH
scripts/make-age-fixtures.ts  sinh test/fixtures/age-rules/
schema/rules.schema.json   định dạng content/rules.json
scripts/check-pack.sh      kiểm gói bằng shasum/jq, độc lập với code build
src/normalize/             chuẩn hoá EN (en.ts) và VI (vi.ts), số thành chữ
src/spoken.ts              lấy Spoken (và Image, AssetHash, AppVersion) theo schema (schema-walk.ts)
src/cache.ts               khoá cache, index.json
src/audio.ts               WAV, afconvert, afinfo, sha256, xoá ngày giờ m4a
src/audio-post.ts          độ to (K-weighting, khối 100 ms), true peak, limiter, khoảng lặng VI
test/                      node:test
```
