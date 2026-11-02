# SK-014 · `content-cli tts` cho tiếng Anh bằng Kokoro (bài 1)

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: dev · Tester: tester
Nguồn: docs/ios-test-build.md mốc 1 việc C1 và "Ghi chú kỹ thuật" (Kokoro chạy bằng gì); technical-plan.md B4.1 (chuỗi đọc to có `audio`), B4.3 (asset đặt tên theo `sha256`), B8.0 (lệnh `tts`, cache `content/.audio/`), B9 (Kokoro, chuẩn hoá chữ, M4A mono ~64 kbps, dùng lại theo hash, duyệt audio); SK-001 kiểu `Spoken`, `SpokenAudio`, `AssetHash` và cờ `--require-assets`; `packages/content-schema/README.md`

## Mục tiêu
Dev dựng lệnh `tts` đầu tiên của `tools/content-cli`: đọc JSON bài 1, sinh clip tiếng Anh giọng `af_heart` cho mọi chuỗi trẻ nghe, ghi hash clip vào bản JSON đầu ra. App iOS có tiếng ngay ở mốc 1 (SK-015, SK-016) và Duy nghe thử được chất lượng Kokoro trước khi soạn 34 bài.

## Phạm vi
- **Công cụ:** `tools/content-cli/` (Node/TypeScript, gói đứng riêng như `packages/content-schema`):
  - `package.json` có `"type": "module"`, `engines.node` giống content-schema (`^22.18.0 || >=23.6.0`), chạy TS bằng type stripping, không bước build;
  - lệnh: `node tools/content-cli/src/cli.ts tts <file.json>... --out <thư mục>` (kèm `npm run tts -- …`);
  - `README.md`: cài đặt, tải model, chạy, cache nằm đâu, cách xoá cache.
- **Kokoro:**
  - Thử `kokoro-js` (chạy trong Node) trước.
  - Nếu không chạy được, hoặc chất lượng hay tốc độ kém rõ, thì dùng `uv` dựng môi trường Python 3.12 cho `kokoro-onnx`. Máy có Python 3.15, `uv`, `ffmpeg`, `afconvert`. CLI Node gọi script Python qua tiến trình con.
  - Model Kokoro-82M v1.0 (Apache-2.0), giọng `af_heart`, tốc độ 1.0.
  - Chọn bản model (fp32, fp16 hay q8) theo chất lượng nghe; ghi lại kích thước tải về.
  - Ghi cách chọn và lý do vào "Quyết định đã ghi".
- **Chuỗi cần đọc:**
  - Lấy **mọi chuỗi `en` của trường kiểu `Spoken`**, xác định theo schema (`$ref` tới `Spoken` trong `packages/content-schema/schema/`), không đoán theo tên trường.
  - Không đọc `Text`: `alt` của hình (VoiceOver đọc), `recall_from.note`, `statement` và `correction` của misconception.
  - Input mốc 1: `packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/topic.json` và `01-thuc-an-cho-ta-nhung-gi.json`. Đếm hiện tại: 128 chuỗi `Spoken` (topic 2, bài 126), 107 chuỗi EN khác nhau, khoảng 2.800 ký tự.
- **Chuẩn hoá trước khi sinh** (B9), mỗi luật có unit test:
  - số thành chữ: số nguyên, năm, số thứ tự (bài 1 chưa có số; viết sẵn cho các bài sau);
  - ô trống `{1}`, `{2}`… của `fill_blank_bank` **không** đọc thành "one": thay bằng một quãng ngắt (ví dụ "…"), chọn cách nghe tự nhiên nhất và ghi lại;
  - bỏ khoảng trắng thừa. Viết tắt và ký hiệu (`&`, `/`, `%`) thì đọc đầy đủ, hoặc báo cảnh báo tên chuỗi để biên tập sửa;
  - chuỗi sau chuẩn hoá là thứ được băm và được đọc.
- **Clip:**
  - Kokoro ra WAV 24 kHz. Chuyển sang M4A (AAC) mono khoảng 64 kbps bằng `afconvert`; `ffmpeg` dùng cho việc đo và ghép file nghe thử.
  - **Khoá cache** = sha256 của (chữ đã chuẩn hoá + giọng + tốc độ + model id và bản + phiên bản thư viện + tham số mã hoá). Tên file clip là khoá này: `content/.audio/en/<khoá>.m4a`. Chuỗi trùng nhau (ví dụ "rice" xuất hiện 3 lần) dùng chung một clip.
  - `content/.audio/index.json` ghi theo từng khoá: sha256 của **bytes file m4a**, thời lượng ms, chữ đã chuẩn hoá, model, giọng, ngày sinh.
- **JSON đầu ra:**
  - Ghi bản sao từng file input vào `--out`, giữ nguyên cấu trúc. Đề xuất `content/.build/tts/discoverer/an-uong-lanh-manh/`.
  - Mỗi `Spoken` có thêm `audio.en` = sha256 của bytes file m4a. Đây là `AssetHash` theo SK-001: schema chỉ nhận hash 64 ký tự hex, không nhận đường dẫn.
  - SK-015 chép clip vào gói thành `assets/<sha256>.m4a` (B4.3).
  - Không sửa fixture gốc; `audio.vi` không đụng tới.
- **Chạy lại:** clip có khoá đã có trong cache thì không sinh lại. Cờ `--force` sinh lại tất cả.
- **Báo cáo cuối lệnh:**
  - số chuỗi `Spoken`, số clip khác nhau, số clip sinh mới, số clip dùng lại;
  - tổng ký tự, tổng thời lượng audio, thời gian chạy, model và giọng;
  - cảnh báo chuẩn hoá nếu có.
  - Ghi thêm ra `content/.audio/report-<bài>.json`.
- **Gói nghe thử cho Duy:** lệnh `tts --review` (hoặc file sinh kèm) tạo:
  - `content/.build/tts/review-01.m4a`: ghép 10 câu và **toàn bộ từ vựng** (8 từ + 8 câu ví dụ), mỗi clip cách nhau khoảng 0,7 s;
  - `review-01.txt`: thứ tự, mốc giây, JSON pointer, chữ EN.
  - 10 câu do dev chọn, phải phủ: tiêu đề bài, `objective`, một `key_points`, câu điền từ w1 và q2 (có ô trống), lời Na ở q6, một `hint`, một `explanation_correct`, một lời nhắn mâm cơm, nhãn ngắn "Challenge: spot the mistake".
- **`.gitignore` gốc** thêm: `content/.audio/`, `content/.build/`, `tools/content-cli/node_modules/`, thư mục model (ví dụ `tools/content-cli/.models/`, `.venv/`).

## Ngoài phạm vi
- Audio tiếng Việt: chờ listening test và chốt giọng (B18 #3). Code chỉ cần chừa chỗ cho một bộ sinh khác theo thứ tiếng, không viết code VI. *(31/10: Duy ưu tiên giọng VI; làm ở SK-023 và SK-024.)*
- Parse markdown → JSON (`content-cli validate`), `build` (SK-015), `assets`, `publish`.
- Ép phát âm bằng `[word](/IPA/)` và bảng phát âm riêng: làm sau khi Duy nghe thử, nếu cần.
- Cân bằng âm lượng giữa các clip, cắt khoảng lặng: chỉ làm nếu nghe thử thấy cần; ghi đề xuất.
- Clip "đọc lại câu đã điền đáp án" sau khi bé chọn đúng (câu điền từ).

## Tiêu chí nghiệm thu
- [ ] Trên máy Duy, theo README từ đầu (kể cả tải model):
  ```sh
  cd tools/content-cli && npm install
  npm run tts -- ../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/topic.json \
                 ../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json \
                 --out ../../content/.build/tts/discoverer/an-uong-lanh-manh
  ```
  exit 0. Báo cáo in: 128 `Spoken`, số clip khác nhau (≈ 107), tổng thời lượng, thời gian chạy. Dán báo cáo vào ticket.
- [ ] **Chạy lại lần 2** cùng lệnh: báo "sinh mới 0", và không file nào trong `content/.audio/en/` đổi thời gian sửa (`ls -lT` trước và sau giống nhau). Dán thời gian chạy lần 2.
- [ ] Sửa một chuỗi EN trong bản sao của fixture rồi chạy lại: chỉ đúng 1 clip sinh mới.
- [ ] **JSON đầu ra hợp lệ:**
  ```sh
  cd packages/content-schema
  node scripts/validate.mjs ../../content/.build/tts/discoverer/an-uong-lanh-manh/topic.json \
                            ../../content/.build/tts/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json
  ```
  exit 0. Mọi `Spoken` trong đầu ra có `audio.en` (128/128) và hash đó có trong `index.json`. Kiểm bằng script, dán số.
  - Mỗi `audio.en` bằng `shasum -a 256` của đúng file clip, kiểm ngẫu nhiên 5 clip.
  - `git diff --stat packages/content-schema/fixtures` rỗng.
- [ ] Clip đúng định dạng: `afinfo <clip>` cho AAC, 1 kênh, bitrate khoảng 64 kbps. Mở được bằng QuickTime.
- [ ] Unit test chuẩn hoá (`npm test`) pass, có ít nhất: số nguyên 0–9999, năm, số thứ tự, `{1}` không đọc thành "one", chuỗi không có gì cần đổi thì giữ nguyên.
- [ ] Có `review-01.m4a` và `review-01.txt` đúng 10 câu + 16 mục từ vựng. Duy nghe và ghi nhận xét vào ticket (câu nào sai, đọc kém). Câu sai: content-editor sửa cách viết, hoặc ghi đề xuất ép phát âm.
- [ ] `git status --porcelain` sau khi chạy không có file `.m4a`, `.wav`, `.onnx`, `.bin` hay thư mục model nào. `git check-ignore content/.audio content/.build` in ra cả hai.
- [ ] Không có secret, không gọi dịch vụ mạng nào ngoài lần tải model (ghi URL tải trong README).
- [ ] Không sửa file ngoài `tools/content-cli/` và `.gitignore` gốc (trừ ghi chú trong ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- Không chờ ticket nào. Dùng fixture của SK-001 (đã chép 1:1 từ markdown SK-002).
- SK-017 chỉ đổi `sentence.vi` và `id`, không đổi chữ EN, nên không làm clip cũ hỏng. Chạy lại sau SK-017 chỉ tốn vài giây vì dùng cache.
- SK-015 (`build`) chờ ticket này.
- Tải model Kokoro (90–330 MB tuỳ bản): Duy đã cho phép ở ios-test-build mục quyết định 5 (duyệt 28/10).

**Quyết định đã ghi** (PM đề xuất 28/10; Duy xác nhận khi review)
1. `audio.en` ghi sha256 của file clip, không ghi đường dẫn, vì `SpokenAudio` của SK-001 chỉ nhận `AssetHash`. Tên file trong cache là khoá theo input, để chạy lại không phải sinh hay băm lại.
2. Cache và JSON đầu ra nằm trong `content/.audio/` và `content/.build/`, ngoài git (B8.0). Chỉ dev và CLI ghi vào hai thư mục này; biên tập không cần đụng tới.
3. Chưa làm VI. App bỏ qua clip VI còn thiếu (SK-016).
4. (dev 28/10) **Runtime: `kokoro-js` 1.2.1 chạy trong Node**, không cần Python. Gói kèm transformers.js 3.8.1, onnxruntime-node 1.21.0 (CPU, binary macOS có sẵn trong gói npm) và phonemizer 1.2.1 (espeak-ng bản WASM). Lý do: chạy được ngay trên Node 24; nhanh gấp khoảng 4 lần thời gian thật (RTF ≈ 0,25): 107 clip, 4 phút audio sinh trong khoảng 64 s. Không cần `kokoro-onnx`/`uv`.
5. (dev 28/10) **Model `onnx-community/Kokoro-82M-v1.0-ONNX`, bản fp32** (`onnx/model.onnx`, 325,5 MB, sha256 `8fbea51e…`), ghim commit `1939ad2` (08/02/2025). Lý do: fp32 là bản gốc, chất lượng cao nhất, và tốc độ CPU đã đủ nhanh nên không có lý do dùng bản lượng tử. Bản q8 (92,4 MB) và fp16 (163,2 MB) chọn được bằng `--dtype` nhưng chưa ai nghe. Giọng `af_heart.bin` có sẵn trong gói `kokoro-js` (sha256 trùng bản trên Hugging Face). Model đặt ở `tools/content-cli/.models/`, transformers.js chạy với `allowRemoteModels = false`.
6. (dev 28/10) **Ô trống `{1}` đọc thành quãng ngắt bằng cách tách câu.** Kokoro đọc `…` giữa câu chỉ ngắt khoảng 0,27 s, như một dấu phẩy (đo bằng `silencedetect`). CLI tách câu tại ô trống, đọc từng phần (phần trước giữ `…` để giọng ngừng lửng), rồi nối PCM: khoảng lặng ở mép hai đoạn thành quãng ngắt 0,79 s (w1: từ 3,36 s tới 4,15 s). Ô trống cuối câu (q2) thì câu kết thúc bằng `…`. Ô trống đầu câu thì chèn 0,6 s lặng.
7. (dev 28/10) **Lấy `Spoken` theo schema:** một bộ duyệt JSON Schema (`src/schema-walk.ts`) đi theo `$ref`, `allOf`, `anyOf`/`oneOf`, `if/then/else`, `properties`, `patternProperties`, `additionalProperties`, `items`, `contains`. Các nhánh `if` do Ajv quyết định trên đúng bộ schema của `packages/content-schema`. Gặp applicator chưa hỗ trợ thì báo lỗi, không lặng lẽ bỏ sót.
8. (dev 28/10) **Số đọc kiểu Anh** ("one hundred **and** five"), vì nội dung viết chính tả Anh. Số 4 chữ số đứng một mình đọc là số đếm và in cảnh báo `maybe_year`; năm chỉ đọc kiểu năm khi có từ báo (`in`, `since`, `from`…) hoặc `BC`/`AD`.
9. (dev 28/10) **Đo và ghép file nghe thử bằng `afinfo`/`afconvert`, không dùng `ffmpeg`.** Bộ giải mã AAC của ffmpeg cho mỗi clip dài hơn 3–40 ms, nên mốc giây trong `review-01.txt` lệch dần, tới 0,6 s sau 26 clip. `afconvert` giải mã đúng độ dài, ghép PCM trong Node, mã hoá lại như clip: thời lượng đo được 73,150 s, khớp đúng mốc tính.
10. (dev 28/10) **Tham số mã hoá:** `afconvert -f m4af -d aac -c 1 -b 64000 -s 0 -q 127`: AAC-LC, mono, CBR 64 kbps, giữ 24 kHz của Kokoro. Tham số này nằm trong khoá cache.
11. (dev 28/10) **File nghe thử tạo mặc định** ở mỗi lần chạy có bài học. Tắt bằng `--no-review`. Chọn 10 câu theo luật chung trong `src/tts/review.ts`, để bài khác cũng có file tương đương.
12. (Duy 28/10) **Giọng `af_heart` (nữ Mỹ) đạt**, giữ làm giọng EN cho toàn bộ nội dung.

**Câu hỏi còn mở**
- Chính tả "fibre" (Anh) với giọng Mỹ `af_heart`: nghe thử xem có lạ không (SK-002 đang chờ Duy chốt chính tả Anh hay Mỹ).
- 60 trên 128 chuỗi chỉ có 1–2 từ (nhãn món, từ vựng). B9 ghi Kokoro đọc từ đơn đôi khi kém. Nghe thử xong mới biết có cần ép phát âm hay đặt từ vào câu mồi không.
- Ô trống `{1}`: đọc ngắt quãng hay đọc "blank"? Dev chọn một cách, Duy nghe rồi chốt.

## Kết quả (dev)

28/10/2026. Chạy trên máy Duy (macOS, Node 24.18, npm 11.16). Chưa commit.

**Đã làm**
- `tools/content-cli/`: gói Node/TS đứng riêng, `"type": "module"`, `engines.node` giống content-schema, chạy `.ts` bằng type stripping. Lệnh `tts` và `fetch-model`. `README.md` ghi cài đặt, URL tải model, cách chạy, cache, cách xoá cache, luật chuẩn hoá. Phụ thuộc: `@science-kids/content-schema` (`file:`, để kiểm input và đầu ra), `ajv` (quyết định nhánh `if` khi duyệt schema), `kokoro-js`, `@huggingface/transformers` (đặt `env`). Mọi phiên bản đều ghim cứng.
- Mã nguồn: `src/cli.ts`; `src/tts/{command,kokoro-en,kokoro-model,utterance,review,engine}.ts`; `src/normalize/{en,numbers-en}.ts`; `src/{spoken,schema-walk,cache,audio,json-pointer,paths}.ts`; `test/*.test.ts` (68 test).
- Chừa chỗ cho VI: interface `EngineSpec` và bảng `NORMALIZERS` theo thứ tiếng. Chưa có code VI; `--lang vi` báo chưa có bộ sinh.
- `.gitignore` gốc đã có đủ 5 dòng của ticket từ trước, nên không sửa. Không cần `tools/content-cli/.gitignore`.

**Lần 1** (từ đầu: xoá `node_modules` và `.models`, `npm install` mất 5 s, rồi chạy lệnh của tiêu chí 1; có tải model 325,5 MB). Exit 0.
```
TTS en · Kokoro-82M v1.0 ONNX fp32 (rev 1939ad2) · giọng af_heart · tốc độ 1.0
Input: topic.json (2 Spoken), 01-thuc-an-cho-ta-nhung-gi.json (126 Spoken)
Chuỗi Spoken: 128
Clip khác nhau: 107 · sinh mới 107 · dùng lại 0
Tổng ký tự: 2.809 (128 chuỗi) · 2.614 ký tự khác nhau · đã sinh 2.614
Tổng thời lượng audio: 4 phút 1,1 s (107 clip) · 4 phút 33,0 s nếu phát đủ 128 chuỗi
Thời gian chạy: 1 phút 31,4 s (nạp model 26,4 s)
Cảnh báo chuẩn hoá: 0
Đầu ra (hợp lệ theo content-schema): content/.build/tts/discoverer/an-uong-lanh-manh/topic.json, …/01-thuc-an-cho-ta-nhung-gi.json
Cache: content/.audio (107 clip trong index.json)
Báo cáo: content/.audio/report-an-uong-lanh-manh-01.json
Nghe thử: content/.build/tts/review-01.m4a (26 clip, 1 phút 13,2 s) + review-01.txt
```
"Nạp model 26,4 s" ở lần này gồm cả khoảng 25 s tải model; khi model đã có, nạp chỉ mất 0,5 s. Sau đó dòng này đã đổi thành "tải (nếu thiếu) và nạp model". Khi model có sẵn, sinh lại toàn bộ 107 clip (`--force`) mất 64,5 s.

**Lần 2** (cùng lệnh): `sinh mới 0 · dùng lại 107`, **thời gian chạy 0,6 s**, exit 0. `ls -lT content/.audio/en/` trước và sau giống hệt nhau (107 file). `index.json` cũng không được ghi lại.

**Theo từng tiêu chí**

| # | Tiêu chí | Kết quả |
| --- | --- | --- |
| 1 | Từ đầu theo README, exit 0, báo cáo đủ số | Pass. Báo cáo ở trên: 128 Spoken, 107 clip, 4 phút 1,1 s audio, chạy 1 phút 31,4 s |
| 2 | Lần 2: sinh mới 0, mtime không đổi | Pass. 0,6 s; `diff` hai bản `ls -lT` rỗng |
| 3 | Sửa 1 chuỗi EN trong bản sao → đúng 1 clip mới | Pass. Bản sao fixture trong scratchpad, đổi `/vocab/7/example` thành "We eat well to stay strong.", chạy với bản clone của cache thật (`cp -c`, để cache thật không có clip thừa): `sinh mới 1 · dùng lại 106` |
| 4 | Đầu ra hợp lệ, 128/128 `audio.en`, hash có trong `index.json`, 5 clip khớp `shasum`, fixture không đổi | Pass. `validate.mjs` in `OK: 2 file hợp lệ (1 topic, 1 lesson)`, exit 0. Script đếm: `có audio.en: 128/128 · hash có trong index.json: 128/128 · audio.vi xuất hiện: 0 · hash khác nhau: 107`. 5 clip ngẫu nhiên ("Carbohydrates give us …", "toys", "tofu", "Add vegetables or fruit!", "Add some carbohydrates!"): `shasum -a 256` đều trùng `audio.en`. Bỏ `audio` ra thì hai file đầu ra trùng từng byte với fixture. `git diff --stat packages/content-schema/fixtures` rỗng, nhưng **cả `packages/` chưa được track** nên lệnh này luôn rỗng. Bằng chứng thật: sha256 của 71 file trong `packages/content-schema` (trừ `node_modules`) trước và sau giống nhau; fixture vẫn là `bc1df479…` (bài) và `cd6bda0f…` (topic) |
| 5 | AAC, 1 kênh, ~64 kbps, mở được bằng QuickTime | Pass phần đo được. `afinfo` trên cả 107 clip: `1 ch, 24000 Hz, aac`, bitrate 63,7–63,9 kbps (trung bình 63,8). `ffprobe`: AAC LC. AVFoundation (bộ máy của QuickTime) báo `isPlayable = true` cho `review-01.m4a` và 2 clip. **Duy tự mở thử bằng QuickTime** |
| 6 | `npm test` pass, đủ các ca | Pass. 68/68: số đếm 0–9999 (18 ca cụ thể, thêm một test chạy hết 10.000 số, kiểm chỉ có chữ và không hai số nào đọc trùng nhau), năm (9 ca + trong câu), số thứ tự (14 ca), `{1}` không ra "one" (giữa câu, cuối câu, đầu câu, nhiều ô, câu hỏi, tách câu), câu không cần đổi giữ nguyên (gồm cả 126 chuỗi của bài 1, trừ 2 câu có ô trống). `npm run typecheck` sạch |
| 7 | `review-01.m4a` + `.txt` đúng 10 câu + 16 mục; Duy nghe | Đã có file, 26 clip, 1 phút 13,2 s. **Chờ Duy nghe và ghi nhận xét** |
| 8 | `git status` không có media/model; `check-ignore` in cả hai | Pass. `git status --porcelain -uall` không có `.m4a .wav .onnx .bin`, `.models`, `node_modules` hay `content/.audio\|.build`. `git check-ignore content/.audio content/.build` in cả hai dòng |
| 9 | Không secret, chỉ dùng mạng khi tải model | Pass. Chỉ `src/tts/kokoro-model.ts` có `fetch`, tới 4 URL Hugging Face đã ghim, ghi trong README. Sinh lại đủ 107 clip với một preload chặn `fetch`, `http(s).request`, `net.connect`, `tls.connect`, `dns.lookup`: exit 0, **0 lần gọi mạng** |
| 10 | Chỉ sửa trong `tools/content-cli/` (và ticket) | Pass. Ghi vào `tools/content-cli/`, `content/.audio/`, `content/.build/` và file ticket này. Chạy thử nghiệm ở scratchpad ngoài repo. Không commit |

**File nghe thử:** `/Users/buiduyluu/Documents/personal/science-kids/content/.build/tts/review-01.m4a` (598 KB, 73,15 s), mốc giây ở `review-01.txt` cùng thư mục.

| # | Bắt đầu | Câu | Pointer |
| --- | --- | --- | --- |
| 1 | 0:00,0 | What does food give us? | `/title` |
| 2 | 0:02,6 | I can name the main nutrients in food. | `/objective` |
| 3 | 0:05,9 | Food has nutrients that our body needs. | `/key_points/0` |
| 4 | 0:09,6 | Animals, including humans, need food, water and {1} to live. | `/warmup/0/sentence` (w1) |
| 5 | 0:15,5 | Carbohydrates give us {1}. | `/quiz/1/sentence` (q2) |
| 6 | 0:18,3 | All fat is bad for you. (lời Na) | `/quiz/5/statement` (q6) |
| 7 | 0:21,0 | Rice helps you run and play. What does it give you? | `/quiz/1/hint` |
| 8 | 0:24,9 | Oranges have lots of vitamins. | `/quiz/0/explanation_correct` |
| 9 | 0:28,2 | Great! Your tray is balanced. | `/play/messages/balanced` |
| 10 | 0:31,2 | Challenge: spot the mistake | `/quiz/5/instruction` |
| 11–26 | 0:34,1 → 1:11,0 | 8 từ, mỗi từ kèm câu ví dụ: nutrient, carbohydrate, protein, fat, vitamin, fibre, energy, healthy | `/vocab/0..7/term`, `/example` |

**Cần nghe kỹ** (dự đoán từ phiên âm espeak-ng en-us mà Kokoro dùng làm đầu vào, chưa ai nghe):
- `/warmup/1/hint` "Plants **use** sunlight to make food.": espeak cho `jˈuːs` (danh từ, âm cuối /s/) thay vì động từ `juːz`. Không nằm trong file nghe thử; nghe clip này riêng.
- `/quiz/3/prompt` "**Nam** hurt his knee…": đọc `nˈæm`, vần với "Sam", không giống tên Việt "Nam". "Na" đọc `nˈɑː` ("nah"), có lẽ ổn.
- **fibre**: đọc `fˈaɪbɚ`, đúng như "fiber" giọng Mỹ, nên chính tả Anh không làm đọc sai.
- **nutrient**: đọc `njˈuːtɹiənt`, có âm /j/ kiểu Anh dù giọng Mỹ. Không sai.
- 41 clip (60 chuỗi Spoken) chỉ có 1–2 từ: nhãn món, từ vựng, "Yes", "No". B9 ghi Kokoro đọc từ đơn đôi khi kém. Phần từ vựng ở #11–26.
- Ô trống: #4 có quãng ngắt 0,79 s, #5 kết thúc bằng giọng ngừng lửng. Duy chốt cách này hay đọc "blank".
- Mọi clip có khoảng 0,33 s lặng ở đầu và 0,47 s ở cuối (Kokoro tự thêm), nên app sẽ trễ khoảng 0,3 s mới có tiếng.

**Ghi cho SK-015, SK-016 (ios-dev) và tester**
- Clip nằm ở `content/.audio/en/<khoá>.m4a`, tên file là khoá cache. `audio.en` là sha256 của bytes, tra ngược qua `index.json` (trường `sha256` và `file`). SK-015 chép thành `assets/<sha256>.m4a`.
- **`afconvert` ghi thời điểm tạo vào m4a.** Sinh lại cùng một câu (`--force`, xoá cache, máy khác) cho ra bytes khác nhau, **hash khác**. `cmp` cho thấy chỉ khác ở các ô ngày giờ; thời lượng và số byte giống hệt. Chạy lại bình thường thì không đổi gì.
- `validate.mjs --require-assets` trên đầu ra báo 164 lỗi, đúng dự kiến: chưa có `audio.vi` và `Image.asset`. SK-015 chưa dùng cờ này được cho tới khi có VI và hình.
- Tester: `cd tools/content-cli && npm test`; bộ kiểm tiêu chí 4 có thể chép từ cách làm ở trên (đọc `audio.en` của mọi Spoken bằng `collectSpoken`, so với `index.json`, `shasum` ngẫu nhiên).

**Đề xuất (ngoài phạm vi, chưa làm)**
1. Xoá ngày giờ trong m4a (đặt các ô ngày giờ của `mvhd`/`tkhd`/`mdhd` về 0) để sinh lại trên cùng máy ra đúng hash cũ, gói không phải tải lại asset. Khoảng 30 dòng code; đổi tham số mã hoá thì toàn bộ cache sinh lại một lần (khoảng 1 phút).
2. Cắt khoảng lặng ở đầu clip còn khoảng 0,1 s, nếu Duy nghe trong app thấy trễ.
3. Nhãn chỉ khác chữ hoa đang ra clip riêng. Có 7 cặp: rice, bread, egg, banana, protein, sweets, water spinach. Có thể dùng chung một clip nếu Duy nghe thấy hai bản như nhau.
4. Khi có nhiều chủ đề, đặt tên `review-<chủ đề>-<nn>` để file nghe thử không ghi đè nhau. Hiện đang theo ticket: `review-01`.
5. content-schema có thể thêm chế độ `--require-assets=en` để SK-015 kiểm "đủ audio EN" trước khi có VI. Đề xuất cho người giữ SK-001, chưa sửa `packages/content-schema`.

**Còn chưa chắc / lưu ý**
- Chưa ai nghe. Chất lượng fp32 so với q8 chưa so bằng tai.
- `npm audit`: 3 lỗ hổng mức high, cùng một gốc là `sharp` (thư viện ảnh, phụ thuộc gián tiếp của transformers.js). CLI không xử lý ảnh. npm 11 không chạy install script của `onnxruntime-node`/`sharp`/`protobufjs` khi chưa được cho phép, và không cần trên macOS.
- `node_modules` nặng 441 MB (onnxruntime kèm binary mọi nền tảng), model 320 MB, cache bài 1 là 2,6 MB (trung bình 23 KB mỗi clip).
- Chỉ chạy trên macOS (dùng `afconvert`/`afinfo`). CI Linux sau này cần thay bằng ffmpeg; nếu vậy phải xử lý lại vấn đề độ dài khi giải mã nói ở quyết định 9.
