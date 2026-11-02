# content-cli

CLI cho pipeline nội dung của Science Kids ở MVP (technical-plan.md B8.0). Hiện có ba lệnh: `tts` sinh clip giọng đọc cho mọi chuỗi `Spoken` của file topic/lesson, chạy trên máy, rồi ghi bản sao JSON có `audio.en` / `audio.vi`: tiếng Anh bằng **Kokoro-82M v1.0** ([SK-014](../../docs/backlog/SK-014-content-cli-tts-en.md)), tiếng Việt bằng **VieNeu-TTS v3 Turbo**, giọng Kim Thanh ([SK-024](../../docs/backlog/SK-024-content-cli-tts-vi.md), mục "Tiếng Việt" bên dưới); `build` gói topic, bài và clip thành thư mục gói nội dung có manifest và sha256 cho app nhúng ([SK-015](../../docs/backlog/SK-015-content-cli-build-pack.md)); `validate` kiểm file JSON bằng content-schema rồi theo luật soạn của nhóm tuổi ([SK-026](../../docs/backlog/SK-026-quiz-formats-by-age.md), mục "validate: luật theo nhóm tuổi" bên dưới). Các lệnh `assets`, `publish` và `validate` trên markdown làm sau.

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

Hoặc `node src/cli.ts build <topic.json> <lesson.json>... [--out <thư mục>]`. Input là **JSON đầu ra của `tts`** (có `audio.en`), không phải fixture gốc. Chạy mất dưới 1 giây, không dùng mạng, không cần model.

Lệnh làm theo thứ tự, và chỉ ghi khi mọi bước kiểm đều qua:

1. Kiểm input bằng `validateDocuments` của `packages/content-schema` (Ajv + zod + kiểm chéo). Cần ít nhất một `topic.json`; bài nào cũng phải có topic của nó trong input.
2. Đọc `content/rules.json`, kiểm theo `schema/rules.schema.json`. Rồi chạy luật soạn theo nhóm tuổi như `validate` (SK-026): lỗi in cùng dòng `<file> <pointer> [<mã>] <thông báo>` và chặn build; cảnh báo in ở mục Cảnh báo. Ở `build`, `format_not_rendered` là **lỗi**. Nhóm tuổi của chủ đề không có trong file, hoặc không có `authoring`, thì báo `age_rules_missing`.
3. Tìm mọi `AssetHash` theo JSON Schema (như cách `tts` tìm `Spoken`):
   - mọi `Spoken` phải có `audio.en`;
   - mỗi `audio.<lang>` phải có clip trong cache: có dòng trong `index.json` với `sha256` đó, file còn, và sha256 thật của bytes file đúng bằng hash (không có hash trùng mà khác nội dung);
   - `Image.asset` chưa được nhận: gói bản thử không có hình (chưa có `content-cli assets`), app vẽ hình giữ chỗ;
   - `AssetHash` ở chỗ khác thì báo lỗi.
4. Tạo `pack.json` cho từng chủ đề: topic và các bài của nó (theo `order`), **bỏ `brief` của mọi `Image`** (SK-001). Kiểm lại nội dung gói bằng content-schema.
5. Ghi gói vào một thư mục tạm cạnh `--out`, kiểm lại sha256 và size của từng file, rồi thay cả `--out` bằng thư mục đó.

Lỗi in mỗi dòng `<file> <JSON pointer> <thông báo>`, ví dụ `…/01-thuc-an-cho-ta-nhung-gi.json /quiz/1/hint/audio/en thiếu clip en: …`. Bài hoặc topic có `ai_draft: true` thì in cảnh báo, vẫn build.

| Cờ | Ý nghĩa |
| --- | --- |
| `--out <thư mục>` | Nơi ghi gói, mặc định `content/.build/pack`. **Bị thay toàn bộ** mỗi lần build. Lệnh từ chối (exit 2) nếu thư mục đã có thứ khác ngoài `catalog/`, `topics/`, `assets/` |
| `--cache <thư mục>` | Cache clip, mặc định `content/.audio`. Build chỉ đọc, không ghi |
| `--rules <file>` | Luật chấm, mặc định `content/rules.json` |
| `--min-app-version <x.y.z>` | Bản app thấp nhất của mọi chủ đề, mặc định `0.1.0` (bản thử iOS đầu tiên) |

Exit `0` = xong, `1` = lỗi nội dung (chưa ghi gì), `2` = sai cách gọi hoặc `--out` không an toàn.

**Chạy lại** với cùng input và cùng cache cho ra đúng từng byte, trừ `generated_at` của manifest. Clip chỉ chép từ cache, không sinh lại; sinh lại clip (`tts --force`, xoá cache) thì hash đổi vì `afconvert` ghi ngày giờ vào m4a, và gói đổi theo.

Kiểm một gói độc lập với code build (dùng `shasum`, `stat`, `jq`, `grep`):

```sh
sh tools/content-cli/scripts/check-pack.sh content/.build/pack   # từ gốc repo
```

### Cấu trúc gói (technical-plan.md B4.3)

```
<out>/
├── catalog/v1/manifest.json                  danh mục: chủ đề, rules, asset
├── topics/<topic_id>/<version>/pack.json     một chủ đề: topic + mọi bài có trong input
└── assets/<sha256>.m4a                       clip, tên là sha256 của bytes
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
| `assets[].kind`, `lang` | `audio`, `en` · `vi` | Loại asset. Hình (`image`) chưa có |
| `assets[].path` | chuỗi | `assets/<sha256>.m4a` |

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
    { "sha256": "02742903…", "size": 14976, "kind": "audio", "lang": "en", "path": "assets/02742903….m4a" }
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

### `content/rules.json`

Một nguồn cho `rules` (B5.3). Khoá cấp 1 là nhóm tuổi; mỗi nhóm:

| Khoá | v1 | Nguồn |
| --- | --- | --- |
| `max_tries`, `partial_order_min`, `pass_threshold`, `mastery_gap_days`, `rest_days_per_week`, `warmup` | `2`, `null`, `{num: 5, den: 6}`, `1`, `1`, `{min 2, max 3, week, month, exclude_dok [3]}` | Đúng `default_rules` của `packages/content-schema/test-vectors/` (SK-003). `test/rules.test.ts` so khoá và giá trị |
| `xp_per_correct`, `xp_lesson_complete`, `xp_game_complete`, `xp_mastery_review` | `10`, `20`, `10`, `20` | B4.4 |
| `default_voice_mode` | `{bilingual, en_first, vi_first}` → `en` · `vi` · `both` | B4.1: Song ngữ → `both`, EN-first → `en`, VI-first → `both`; Explorer luôn `both` |
| `authoring` | Luật soạn Khởi động và Quiz theo nhóm (mục "validate: luật theo nhóm tuổi"). Chỉ `content-cli` đọc; app (`Decodable`) và RPC (`rules_for` đọc từng khoá) bỏ qua | SK-026, bảng "Đặc tả theo nhóm tuổi". `test/rules.test.ts` chép tay bảng đó và so |

Định dạng ở `schema/rules.schema.json`, mọi object đều đóng (khoá gõ sai là lỗi). `authoring` là khoá tuỳ chọn (thiếu thì validate và build báo `age_rules_missing`). Đổi giá trị do Duy chốt; đổi phần luật chấm thì sửa `default_rules` ở cả 6 file vector cùng lúc (tester), nếu không `npm test` đỏ.

GĐ 0 **chưa** đặt `xp_*` = 0 cho Explorer (D1 của SK-026): server lấy `rules` theo nhóm của hồ sơ (`submit_attempts` → `rules_for(child.age_group)`), app lấy theo nhóm của chủ đề, nên bé lớp 1 học thử Discoverer sẽ lệch XP. Chờ chốt câu "rules của nhóm nào" ở SK-026.

## validate: luật theo nhóm tuổi

```sh
cd tools/content-cli
npm run validate -- ../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/topic.json \
                    ../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json
```

Hoặc `node src/cli.ts validate <topic.json> <lesson.json>... [--rules <file>] [--min-app-version <x.y.z>]`. Đọc JSON (fixture gốc hoặc đầu ra của `tts`, như nhau); parse markdown làm sau (B16). Không ghi gì.

1. Kiểm bằng `packages/content-schema` (Ajv + zod + kiểm chéo). Sai thì in lỗi schema, exit 1, chưa kiểm luật tuổi. Bài lẻ thì đưa kèm `topic.json`.
2. Đọc `--rules` (mặc định `content/rules.json`).
3. Với mỗi topic, lấy `rules.<age_group>.authoring` theo `age_group` **của topic**, kiểm các bài của topic đó (`src/validate/age-rules.ts`, hàm thuần; `build` gọi cùng hàm).

Mỗi dòng: `<file> <JSON pointer> [<mã>] <thông báo>`. Cảnh báo có `cảnh báo:` ở đầu thông báo và không làm exit 1. Lỗi in trước, cảnh báo sau, rồi một dòng tổng. Exit `0` = không lỗi (có thể có cảnh báo), `1` = có lỗi, `2` = sai cách gọi.

**Phạm vi:**
- Format được dùng, số lựa chọn và hình bắt buộc: áp cho từng câu ở **cả Khởi động** (`/warmup/<i>`) **và Quiz** (`/quiz/<i>`). Câu dùng format không được phép thì chỉ báo `age_format_not_allowed`, không kiểm tiếp số lựa chọn hay hình của câu đó.
- DOK, câu 1, số câu misconception, số format khác nhau, thứ tự DOK: chỉ tính 6 câu Quiz. Số format đếm mọi format có mặt, kể cả format không được phép.
- Số từ: mọi chuỗi `Spoken` (`en`) của topic và bài (câu hỏi, gợi ý, giải thích, lời nhắn, ý chính, ví dụ từ vựng…), tách câu sau `.` `!` `?` `…`, đếm từ theo khoảng trắng (từ có chữ hoặc số; ô trống `{1}` tính một từ, `—` không tính).
- `format_not_rendered`: mọi câu Khởi động và Quiz, so với bản app của chủ đề = lớn nhất của `--min-app-version` và mọi `min_app_version` của block (như `build`).

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

**`authoring`** (`content/rules.json`, khoá của `<nhóm>.authoring`; định dạng ở `schema/rules.schema.json#/$defs/Authoring`):

| Khoá | Explorer | Discoverer | Scientist |
| --- | --- | --- | --- |
| `quiz_formats` | `single_choice`, `true_false`, `order_sequence` | 6 format v1 | 6 format v1 |
| `warmup_formats` | `single_choice`, `true_false` | `single_choice`, `multi_choice`, `true_false`, `fill_blank_bank` | như Discoverer |
| `option_count` | `single_choice` [2, 3], `order_sequence` [3, 3] | `single_choice` [3, 4], `multi_choice` [2, 6], `order_sequence` [3, 5], `picture_bar_chart` [3, 4] | `single_choice` [4, 4], `multi_choice` [2, 6], `order_sequence` [3, 6], `picture_bar_chart` [4, 4] |
| `image_required` | `choice_option`, `sequence_item`, `true_false` | không | không |
| `dok_mix` | [3, 3, 0] | [2, 3, 1] | [1, 3, 2] |
| `first_item_dok` | 1 | 1 | 1 |
| `misconception_items` | [1, 1] | [1, 1] | [1, 2] |
| `min_formats` | 2 | 3 | 3 |
| `max_words_en` | 8 | 10 | 15 |

- `[min, max]` tính cả hai đầu; `rules.ts` kiểm `min <= max` và tổng `dok_mix` = 6. "`multi_choice` ≤ 6" ghi [2, 6]: 2 là mức tối thiểu của schema. Format không có trong `option_count` chỉ theo giới hạn của schema (vd `fill_blank_bank` chưa có luật số từ trong ngân hàng). `max_words_en` thiếu thì không kiểm.
- `image_required`: `choice_option` = mọi lựa chọn của `single_choice`, `multi_choice`, `picture_bar_chart`; `sequence_item` = mọi thẻ `order_sequence`; `true_false` = trường `image` của chính câu `true_false`.
- Chưa kiểm bằng máy: câu misconception của Explorer đặt ở câu 6; số từ EN trên một màn; tỉ lệ đúng kỳ vọng; vùng chạm (việc của app).

**Bảng format → bản app** (`src/validate/format-renderers.ts`, một chỗ cho `build` và `validate`; nguồn: `hasRenderer` của iOS, `LessonPlayer/ContentScoring.swift`):

| Format | Bản app iOS đầu tiên hiện được |
| --- | --- |
| `single_choice`, `multi_choice`, `true_false`, `fill_blank_bank` | 0.1.0 |
| `order_sequence`, `picture_bar_chart` | chưa có (GĐ 1 S4) |

App cũ gặp format chưa có renderer thì bỏ câu, quiz còn dưới 6 câu và sao lệch. Vì vậy `build` báo lỗi khi bài dùng format mà bản app của chủ đề chưa hiện được: khi có renderer, build với `--min-app-version` ≥ bản đó, app cũ thấy chủ đề "cần cập nhật". ios-dev đề xuất sửa bảng mỗi khi thêm renderer; `test/age-rules.test.ts` kiểm bảng có đủ mọi format của content-schema.

**Fixture** (`test/fixtures/age-rules/`, dữ liệu test, không phải nội dung cho trẻ; sinh bằng `npm run make-age-fixtures`, đừng sửa tay):
- `valid/explorer/fixture-explorer/`, `valid/scientist/fixture-scientist/`: một bài tối thiểu hợp lệ mỗi nhóm. Discoverer dùng bài 1 của `packages/content-schema/fixtures/valid`.
- `invalid/*.json`: mỗi file là một bài hợp lệ với đúng **một** lỗi luật tuổi; `expected.json` ghi tay pointer và mã mong đợi. Cảnh báo không tính.

## Kiểm thử

```sh
npm test            # node --test: chuẩn hoá, lấy Spoken theo schema, khoá cache, WAV, chọn câu nghe thử, build (cache giả), rules.json so với vector và bảng SK-026, luật theo tuổi + fixture, validate, lỗi gọi CLI
npm run typecheck   # tsc
```

Unit test không cần model; test của `build` dùng cache giả trong thư mục tạm. Kiểm đầu ra của `tts` bằng `packages/content-schema`:

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
| Bảng đọc ép `READINGS` cho từ mượn, tên riêng. "vitamin" có trong bảng vì sea-g2p đọc theo âm Anh ("vai-tơ-min") | `Vitamin` → `Vi ta min`, `oxy` → `ô xi`, `Darwin` → `Đác uyn` |
| Từ không phải âm tiết tiếng Việt thì cảnh báo `loanword`, để biên tập viết phiên âm kèm hoặc thêm vào bảng | `nutrient` |
| Dấu thanh kiểu mới, như bài 1. sea-g2p cho cùng âm vị với cả hai kiểu; quy về một kiểu để hai cách viết dùng chung clip | `khỏe` → `khoẻ`, `hòa` → `hoà`, `thủy` → `thuỷ` |
| Gạch ngang giữa hai chữ thành dấu phẩy. Ngoặc đơn thành hai dấu phẩy. Dấu `:` giữ nguyên (VieNeu tự ngắt) | `rồi — chạm` → `rồi, chạm` |

Chữ hiển thị không đổi; chỉ chữ đưa vào engine được chuẩn hoá. VieNeu tự đổi "?" thành "." trong bước chuẩn hoá của nó, nên câu hỏi không lên giọng cuối câu (SK-023).

**Nghe duyệt VI.** `content/.build/tts/review-01-vi.m4a` + `.txt`: mọi clip VI khác nhau. Clip bị đánh dấu nằm ở đầu (kèm lý do), rồi tới clip của bài theo thứ tự trong bài, cuối cùng là clip chỉ có ở `topic.json`. `.txt` ghi mốc giây, JSON pointer, chữ VI gốc và chữ đã đọc.

**Build.** `build` chép clip VI như EN (`manifest.assets[].lang = "vi"`). Có `audio.vi` mà thiếu clip thì exit 1. Khi mọi bài đều có VI, thêm `--require-lang en,vi` để bắt buộc.

## Thư mục

```
src/cli.ts                 điểm vào, đọc cờ (tts, build, validate, fetch-model)
src/tts/command.ts         lệnh tts
src/tts/kokoro-en.ts       Kokoro qua kokoro-js; kokoro-model.ts: ghim commit, sha256, tải model
src/tts/vieneu-vi.ts       VieNeu qua tts-vi/vieneu_vi.py serve (JSON-lines, seed theo chữ)
src/tts/self-check.ts      gọi tts-vi/evaluate.py check; variants.ts: tts-vi/variants.json
src/tts/utterance.ts       tách câu tại ô trống, đệm quãng ngắt theo engine
tts-vi/                    môi trường Python VieNeu + bước chấm (README riêng)
src/tts/review.ts          file nghe thử
src/build/command.ts       lệnh build (gói nội dung); rules.ts: đọc và kiểm content/rules.json
src/validate/command.ts    lệnh validate; age-rules.ts: luật theo nhóm tuổi (dùng chung với build)
src/validate/format-renderers.ts  bảng format → bản app đầu tiên hiện được (format_not_rendered)
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
