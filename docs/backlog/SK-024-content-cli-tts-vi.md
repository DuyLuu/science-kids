# SK-024 · `content-cli tts` cho tiếng Việt (VieNeu-TTS): chuẩn hoá, sinh `audio.vi` bài 1, build lại gói

Trạng thái: todo · Ngày: 2026-10-31 · Phụ trách: dev · Tester: tester
Nguồn: Duy 31/10 (giọng VI ưu tiên trước mọi việc khác); technical-plan.md B4.1 (chuỗi đọc to có `audio.en` và `audio.vi`), B4.3 (asset theo `sha256`), B8.0 (lệnh `tts`), B9 (Audio VI, chuẩn hoá chữ, duyệt audio: nghe hết phần VI); SK-014 (`EngineSpec`, `NORMALIZERS`, khoá cache, file nghe thử); SK-015 (`build`, `check-pack.sh`); SK-023 (giọng, tốc độ, runtime VieNeu, giấy phép); docs/ios-test-build.md mục "Giọng tiếng Việt"

## Mục tiêu
Dev thêm bộ sinh tiếng Việt vào `content-cli tts`, sinh `audio.vi` cho mọi chuỗi đọc to của bài 1 bằng giọng chốt ở SK-023, rồi build lại gói. Nhờ vậy app (SK-025) có giọng Việt thật, và Duy nghe duyệt được toàn bộ phần VI.

## Phạm vi

**Engine VI**
- Thêm một `EngineSpec` cho VieNeu-TTS, sau giao diện SK-014 đã chừa (`src/tts/engine.ts`). `--lang vi` gọi engine này.
- Giọng, tốc độ, model là tham số. Mặc định lấy theo kết quả SK-023.
- Dùng lại runtime đã dựng ở SK-023, không dựng lần hai.
- Engine dự phòng của B9 (Google, FPT/Azure) phải thêm được bằng một `EngineSpec` khác, không phải sửa lệnh. Ticket này không viết engine dự phòng.

**Chuẩn hoá VI** (`src/normalize/vi.ts`, đăng ký vào `NORMALIZERS.vi`). Mỗi luật có unit test.
- **Số thành chữ tiếng Việt:**
  - số đếm, gồm các biến âm "mốt", "lăm", "mười", "mươi";
  - hàng chục 0 ("linh" hay "lẻ"), "nghìn" hay "ngàn", "tư" hay "bốn": theo câu hỏi 1. Chưa chốt thì làm thành tuỳ chọn;
  - dấu phân cách kiểu Việt: "1.000" là một nghìn, "1,5" là một phẩy năm;
  - năm, số thứ tự ("thứ nhất", "thứ tư"), phân số ("1/2" là một phần hai), phần trăm.
- **Đơn vị:** bảng đơn vị, ít nhất kg, g, m, cm, km, l, ml, °C, %. Đơn vị chỉ đọc khi đứng sau số.
- **Viết tắt:** bảng viết tắt. Chữ in hoa toàn bộ chưa có trong bảng thì in cảnh báo kèm pointer.
- **Từ mượn và tên Latin:** không tự đoán cách đọc.
  - Bảng thay chữ để ép cách đọc, nếu nghe thấy cần.
  - Từ không theo cấu trúc âm tiết tiếng Việt thì in cảnh báo, để content-editor viết phiên âm kèm (B9).
  - Bài 1 chỉ có "vitamin", ở 10 chuỗi.
- **Dấu thanh:**
  - NFC;
  - đưa vị trí dấu về một kiểu: khoẻ/khỏe, hoà/hòa, thuý/thúy. Chọn kiểu engine đọc đúng hơn, bằng cách nghe thử, rồi ghi lại.
  - Chữ hiển thị không đổi; chỉ chữ đưa vào engine được chuẩn hoá.
- **Ô trống `{1}`:** không đọc thành "một". Dùng lại cách của SK-014 (`src/tts/utterance.ts`: tách câu, chèn quãng ngắt), đo lại quãng ngắt với giọng VI.
- **Ký hiệu `:` và `—`:** thành quãng ngắt tự nhiên. Có ở 5 chuỗi của bài 1.
- Bỏ khoảng trắng thừa.
- Chuỗi sau chuẩn hoá là thứ được băm và được đọc.

**Cache, đầu ra, chạy lại**
- **Khoá cache** = sha256 của:
  - thứ tiếng, chữ đã chuẩn hoá;
  - engine, model (repo + commit hoặc sha256 file), giọng, tốc độ, seed và mọi tham số sinh;
  - phiên bản gói hoặc thư viện;
  - tham số mã hoá.

  Clip ghi vào `content/.audio/vi/<khoá>.m4a`, dùng chung `index.json` với EN. Đổi giọng hay model thì sinh lại toàn bộ phần VI, không trộn hai giọng.
- **Tính tất định:** nếu engine lấy mẫu ngẫu nhiên thì cố định seed (đưa vào khoá). Ghi lại nếu cùng input vẫn ra audio khác.
- **Clip:** M4A AAC mono 64 kbps qua `afconvert` như EN (SK-014 quyết định 10). Giữ sample rate của engine.
- **JSON đầu ra:**
  - thêm `audio.vi` vào cùng JSON đầu ra của SK-014, giữ nguyên `audio.en`;
  - chạy được `--lang en` rồi `--lang vi` trên cùng thư mục (hoặc `--lang en,vi`);
  - không sửa fixture gốc.
- **Báo cáo cuối lệnh**, ghi thêm `content/.audio/report-<bài>-vi.json`:
  - số `Spoken`, số clip VI khác nhau, sinh mới, dùng lại;
  - tổng ký tự VI, tổng thời lượng, thời gian chạy, RTF;
  - engine, giọng, tốc độ;
  - cảnh báo chuẩn hoá.

**Nghe duyệt** (B9: bản publish đầu phải có người nghe hết phần VI)
- `content/.build/tts/review-01-vi.m4a`: mọi clip VI khác nhau theo thứ tự trong bài, mỗi clip cách nhau khoảng 0,7 s.
- `review-01-vi.txt`: mốc giây, JSON pointer, chữ VI gốc và chữ đã chuẩn hoá.

**Build lại gói** (lệnh `build` của SK-015)
- Nhận `audio.vi`: chép clip từ `content/.audio/vi/` vào `assets/`; `manifest.assets[].lang` = `"vi"`.
- `audio.vi` có giá trị mà thiếu clip là lỗi: exit 1, báo pointer.
- Chưa bắt buộc mọi chuỗi phải có `audio.vi`, vì bài sau chưa có. Dev đề xuất cờ để bắt buộc, ví dụ `--require-lang en,vi`.
- Cập nhật `scripts/check-pack.sh`. Build lại `content/.build/pack`.

**README** của content-cli: thêm mục VI gồm cài đặt, tải model, giọng, luật chuẩn hoá, cách nghe duyệt.

### Ước lượng khối lượng (PM đếm 31/10)
Đếm bằng `collectSpoken` của content-cli trên gói hiện tại (`content/.build/pack/topics/d3a514ef-…/15880ff9df19/pack.json`). Chữ VI ở đây khớp 128/128 với fixture và JSON đầu ra của SK-014. Số ký tự là chữ thô, chưa chuẩn hoá: tính cả dấu câu, khoảng trắng và `{1}`.

| Chỉ số | VI | EN (SK-014, để so) |
| --- | --- | --- |
| Chuỗi `Spoken` (topic + bài) | 128 (2 + 126); không chuỗi nào thiếu `vi` | 128 |
| Chuỗi khác nhau = số clip | **110** (101 nếu bỏ qua chữ hoa: 9 cặp như "cơm"/"Cơm") | 107 |
| Ký tự, mọi chuỗi | **2.986** (4.003 byte UTF-8) | 2.809 |
| Ký tự, chuỗi khác nhau = ký tự cần sinh | **2.813** (3.762 byte UTF-8) | 2.614 |
| Chuỗi khác nhau dài 1–2 tiếng | 38 (14 chuỗi 1 tiếng, 24 chuỗi 2 tiếng) | 41 clip 1–2 từ |
| Chuỗi dài nhất | 78 ký tự, 17 tiếng (`/quiz/4/hint`) | — |

Những chỗ chuẩn hoá phải xử lý trong bài 1:
- **Ô trống:** 2 chuỗi, `/warmup/0/sentence` và `/quiz/1/sentence`.
- **Chữ số:** không có, ngoài số trong `{1}`. Luật số viết sẵn cho các bài sau.
- **Ký hiệu:** dấu `:` ở 3 chuỗi (`/play/groups/3/label`, `/quiz/5/instruction`, `/quiz/5/hint`); dấu `—` ở 2 chuỗi (`/play/messages/full`, `/reward/collectible/fact`).
- **Từ mượn:** chỉ "vitamin", ở 10 chuỗi. `/vocab/4/term` có `vi` giống hệt `en`.
- **Tên người:** "Nam" (`/quiz/3/prompt`), "Na" (4 chuỗi ở `/quiz/5`). Nghe thử xem có đọc đúng là tên không.
- **Dấu thanh kiểu cũ:** "khoẻ" ở 5 chuỗi (`topic#/question`, `/learn/0/groups/3/sentence`, `/play/messages/start`, `/vocab/7/term`, `/vocab/7/example`).
- **Viết tắt, chữ in hoa toàn bộ:** không có.

So với EN: phần VI dài hơn khoảng 6–8% theo ký tự, và có thêm 3 clip.
- Gói thêm khoảng 110 clip × 25 KB ≈ 2,7 MB, tức khoảng 5 MB cho bài 1.
- Thời gian sinh chưa biết; SK-023 đo RTF của VieNeu.
- Nghe duyệt toàn bộ phần VI ước khoảng 5–7 phút audio. PM ước theo tỉ lệ EN: 4 phút cho 107 clip.

## Ngoài phạm vi
- App phát VI: SK-025.
- Audio VI cho bài 2–5 và các chủ đề khác.
- Engine dự phòng (Google, FPT/Azure): chỉ làm khi SK-023 không đạt và Duy chọn.
- Cân bằng âm lượng giữa hai giọng và cắt khoảng lặng: chỉ đề xuất nếu nghe thấy cần, ghi số đo.
- Clip "đọc lại câu đã điền đáp án".
- Chạy trên CI Linux.

## Tiêu chí nghiệm thu
- [ ] `cd tools/content-cli && npm test` pass, `npm run typecheck` sạch. Có test VI cho:
  - số đếm 0–9999, gồm mốt, lăm, mười/mươi, hàng chục 0 theo tuỳ chọn;
  - số thập phân dấu phẩy, phân cách nghìn dấu chấm;
  - năm, số thứ tự, phân số, phần trăm;
  - ít nhất 5 đơn vị;
  - `{1}` không đọc thành "một";
  - vị trí dấu thanh thống nhất;
  - chuỗi không cần đổi thì giữ nguyên: gồm mọi chuỗi VI của bài 1, trừ chuỗi có ô trống, ký hiệu hay dấu thanh bị đổi.
- [ ] Lệnh `tts` VI trên hai file đầu ra của SK-014 exit 0. Báo cáo in 128 `Spoken`, số clip VI (≈ 110), tổng ký tự (≈ 2.986), thời lượng, thời gian chạy. Dán vào ticket.
- [ ] **Chạy lại** cùng lệnh: "sinh mới 0"; `ls -lT content/.audio/vi/` trước và sau giống nhau.
- [ ] **Đổi giọng hoặc tốc độ**, trên bản clone của cache: mọi clip VI sinh mới, không clip EN nào sinh mới.
- [ ] **JSON đầu ra:**
  - `validate.mjs` của content-schema exit 0;
  - `validate.mjs --require-assets` không còn lỗi audio, chỉ còn đúng 36 lỗi, tất cả là `Image.asset`. Trước ticket này là 164 lỗi = 128 thiếu `audio.vi` + 36 hình (SK-014). Dán output đếm.
- [ ] Kiểm bằng script: mọi `Spoken` có cả `audio.en` và `audio.vi` (128/128 mỗi bên), mọi hash có trong `index.json`. 5 clip VI ngẫu nhiên có `shasum -a 256` trùng `audio.vi`.
- [ ] **Clip VI:**
  - `afinfo` cho AAC, 1 kênh, khoảng 64 kbps;
  - không clip nào dưới 0,3 s hay chỉ có lặng (đo bằng script);
  - thời lượng không bất thường so với số ký tự: liệt kê 5 clip có tỉ lệ ms/ký tự cao nhất và thấp nhất để nghe kỹ.
- [ ] **`build` lại:**
  - exit 0; `sh tools/content-cli/scripts/check-pack.sh content/.build/pack` in OK;
  - số file trong `assets/` = số hash EN khác nhau + số hash VI khác nhau;
  - manifest có các dòng `lang: "vi"`;
  - xoá 1 clip VI khỏi bản clone của cache rồi build → exit 1, báo đúng pointer `…/audio/vi`.
- [ ] Có `review-01-vi.m4a` và `.txt`, đủ mọi clip VI khác nhau.
  - Duy nghe hết và ghi câu đọc sai vào ticket.
  - Câu sai thì dev sửa chuẩn hoá, hoặc content-editor sửa cách viết, rồi sinh lại.
  - Tiêu chí này đóng khi Duy ghi "đạt".
- [ ] Không secret. Không gọi mạng ngoài lần tải model. `git status --porcelain -uall` không có media, model hay môi trường Python. `git check-ignore content/.audio content/.build` in cả hai.
- [ ] Chỉ sửa trong `tools/content-cli/` (cộng ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- **SK-023:** giọng, tốc độ, runtime VieNeu, giấy phép. Làm trước được, không chờ SK-023: chuẩn hoá, `EngineSpec` (dùng giọng tạm), khoá cache, sửa `build`, test. Chờ SK-023: lần sinh cuối và nghe duyệt.
- SK-014, SK-015: đã có, ở trạng thái review.
- SK-025 chờ gói có VI của ticket này. ios-dev làm trước được bằng gói test tự tạo.

**Quyết định đã ghi**
1. (Duy 31/10) Engine VI là VieNeu-TTS, giọng Nam. Giọng cụ thể và tốc độ chốt ở SK-023.
2. (Duy 31/10) Dev được tải gói `vieneu` và model từ Hugging Face (xem SK-023).
3. (PM 31/10) Clip VI cùng định dạng và cùng cách băm như EN. Mỗi thứ tiếng một thư mục cache, chung `index.json`.
4. (PM 31/10) Chữ hiển thị không đổi; chuẩn hoá chỉ áp lên chữ đưa vào engine.

**Câu hỏi còn mở**
1. *(PM → Duy, content-editor góp ý)* **Đọc số theo cách nào?** Bài 1 không có số nên không chặn ticket này, nhưng cần chốt trước khi soạn bài có số.
   - (a) Theo sách giáo khoa Toán tiểu học, là cách bé học ở lớp. **Đề xuất.** content-editor xác nhận SGK đang dạy "linh" hay "lẻ", "nghìn" hay "ngàn".
   - (b) Theo giọng Nam ("lẻ", "ngàn"), cho khớp với giọng đọc.

   Dev làm thành tuỳ chọn trong `rules` hoặc cấu hình engine để đổi sau không phải sửa code.
2. *(PM → content-editor)* **Viết "khoẻ" hay "khỏe" trong nội dung?** Đây là quy ước chính tả chung (chữ trẻ đọc), không chặn TTS vì chuẩn hoá xử lý riêng. Ghi quy ước vào `content/TEMPLATE.md` hay README.
3. *(dev → Duy)* **Chuỗi chỉ khác chữ hoa** (VI 9 cặp, EN 7 cặp): dùng chung một clip không? **Đề xuất** giữ riêng như EN, cho tới khi Duy nghe hai bản (SK-014 đề xuất 3). Dùng chung thì phần VI còn 101 clip.
4. *(dev → Duy, 1/11)* **Lặng đầu clip EN 0,33 s.**
   - Kokoro tự để khoảng 0,33 s lặng trước tiếng (0,27–0,41 s), nên bé chạm nút rồi phải chờ chừng một phần ba giây mới nghe.
   - Clip VI nay cố định 0,15 s.
   - Có cắt lặng đầu EN về 0,15 s như VI không?
     - Cắt thì mọi clip EN sinh lại khoảng 1 phút, và hash EN đổi.
     - Ở chế độ "Cả hai", quãng giữa clip VI và clip EN kế tiếp giảm từ khoảng 0,7 s xuống khoảng 0,5 s.
   - Lần này chưa sửa.

## Kết quả (dev)

Ngày 31/10 đến 01/11/2026, chạy trên máy Duy (Mac M4, Node 24, `uv` 0.7.8). Giọng **Kim Thanh** (SK-023, phiên chính chọn ngày 1/11). Chưa commit. **Chưa có người nghe**: mọi đánh giá "đúng, sai" ở đây là của máy (Whisper), xem mục "Còn chưa chắc".

**Đã làm**
- **Engine VI** `src/tts/vieneu-vi.ts`:
  - Một `EngineSpec` mới, gọi bằng `--lang vi`.
  - Chạy VieNeu qua môi trường Python của SK-023 (`tts-vi/.venv`). Script `vieneu_vi.py serve` nhận yêu cầu theo từng dòng JSON và giữ model nạp sẵn suốt lần chạy.
  - Model ghim theo commit và sha256 (`tts-vi/model-files.json`), đọc offline. Lần chạy đầu tự tải nếu thiếu.
  - `descriptor` đưa vào khoá cache gồm: vieneu 3.8.3, onnxruntime 1.24.4, sea-g2p 0.9.1, numpy, repo và commit của model và codec, sha256 danh sách file model, fp32, giọng, tốc độ, sample rate 48 kHz, tham số lấy mẫu, cách tính seed, nền tảng `darwin-arm64`.
  - Engine dự phòng (Google, FPT/Azure) chỉ cần thêm một `EngineSpec` khác.
- **Chuẩn hoá VI** `src/normalize/vi.ts` và `numbers-vi.ts`, đủ các luật trong ticket. Chi tiết ở README, mục "Tiếng Việt":
  - Số đếm có mốt, lăm, mười, mươi. Tuỳ chọn `--vi-numbers sgk|nam`: mặc định `sgk` là linh, nghìn, bốn; `nam` là lẻ, ngàn, tư.
  - Dấu chấm ngăn nghìn, dấu phẩy thập phân. Số viết kiểu Anh thì cảnh báo.
  - Năm, số thứ tự, tháng 4, phân số ("3/4" ra "ba phần tư"), phần trăm, khoảng số, số âm.
  - 11 đơn vị, chỉ đọc khi đứng sau số.
  - Bảng viết tắt (TP.HCM…), công thức (CO₂, H₂O, O₂), bảng đọc ép `READINGS`.
  - Cảnh báo `acronym` cho chữ in hoa lạ, `loanword` cho từ không phải âm tiết tiếng Việt.
  - Dấu thanh kiểu mới; ô trống; gạch ngang, ngoặc thành dấu phẩy.
- **Ô trống:** `utterance.ts` tách câu như EN, rồi đệm chỗ nối cho đủ **0,8 s**, tính cả khoảng lặng ở mép hai đoạn (`EngineSpec.blankPauseMs`). Đo trên clip `/warmup/0/sentence`: quãng ngắt 0,80 s. EN giữ nguyên cách cũ.
- **Mã hoá:** clip VI dùng cùng tham số AAC với EN, thêm bước xoá ngày giờ trong m4a (`M4A_ENCODING_ZERO_TIMES`). Clip EN không đổi nên khoá và hash EN giữ nguyên.
- **Bước tự kiểm:** `src/tts/self-check.ts` gọi `tts-vi/evaluate.py check` (môi trường riêng `.venv-eval`). Chọn lại seed khi cần. Lựa chọn ghi vào `tts-vi/variants.json`, file này nằm trong git. Cờ mới: `--no-self-check`, `--max-variants`, `--check-passes`, `--recheck`, `--pin-variant`, `--check-all`.
- **`tts`:**
  - Ghi đè tại chỗ được khi input là bản sao trong `content/.build/`, nên chạy `--lang en` rồi `--lang vi` trên cùng thư mục.
  - Báo cáo ghi ra `content/.audio/report-an-uong-lanh-manh-01-vi.json`.
  - File nghe duyệt `review-01-vi`.
- **`build`:** thêm `--require-lang en,vi`; mặc định vẫn là `en`, `audio.vi` có mặt thì luôn được kiểm. `scripts/check-pack.sh` đếm asset theo từng thứ tiếng.
- **Sửa test cũ:** `test/rules.test.ts` khẳng định đúng 6 file vector, nhưng ngày 29/10 có thêm `build-tray.json` nên test đã fail trước khi tôi sửa gì. Đổi thành "≥ 6, và mọi file có cùng `default_rules`" (cả 7 file trùng nhau).

**Lệnh và báo cáo** (lần sinh cuối, sinh lại từ đầu sau khi xoá cache VI):
```sh
cd tools/content-cli
npm run tts -- --lang vi ../../content/.build/tts/discoverer/an-uong-lanh-manh/topic.json \
                         ../../content/.build/tts/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json \
               --out ../../content/.build/tts/discoverer/an-uong-lanh-manh
```
```
TTS vi · VieNeu-TTS v3 Turbo ONNX fp32 (vieneu 3.8.3, rev 61b85e3) · giọng Kim Thanh · tốc độ mặc định
Chuỗi Spoken: 128
Clip khác nhau: 110 · sinh mới 110 · dùng lại 0
Tổng ký tự: 2.986 (128 chuỗi) · 2.826 ký tự khác nhau · đã sinh 2.826
Tổng thời lượng audio: 4 phút 9,8 s (110 clip) · 4 phút 29,7 s nếu phát đủ 128 chuỗi
Thời gian chạy: 7 phút 17,5 s (trong đó tải nếu thiếu và nạp model 1,8 s) · tự kiểm 6 phút 26,8 s · RTF sinh 0,18
Tự kiểm: 110 clip · bị đánh dấu ở lần đầu 6 · đổi seed 2 · còn đánh dấu 5 · 16 clip dùng biến thể đã chọn trước (tts-vi/variants.json)
Cảnh báo chuẩn hoá: 0
```
- **Sinh:** 4 phút 10 s audio trong khoảng 45 s, RTF 0,18. Phần lớn thời gian là bước tự kiểm: 2 lượt Whisper trên 110 clip mất khoảng 4,5 phút.
- **Số ký tự:** 2.826 ký tự khác nhau là chữ **đã chuẩn hoá**. Bảng của PM ghi 2.813 là chữ thô; chênh vì "vitamin" thành "vi ta min" và `{1}` thành "…".
- **Chạy lần 2** cùng lệnh: `sinh mới 0 · dùng lại 110`, mất 2,5 s. `ls -lT content/.audio/vi/` trước và sau giống hệt; `index.json` và `variants.json` có sha256 không đổi.
- **Sinh lại đúng từng bit:** xoá cả 110 clip VI rồi sinh lại.
  - 108 clip có cùng khoá ra **sha256 trùng 108/108**.
  - 2 clip đổi khoá vì bước tự kiểm của lần này chọn seed khác: "Chất bột đường cho ta năng lượng để chạy nhảy, vui chơi." và "Cá giàu chất đạm.". Nay cả hai đã ghi vào `variants.json`.
- **Đổi giọng** trên bản clone của cache (`--voice "Đức Trí" --no-self-check`): VI `sinh mới 110 · dùng lại 0`; sau đó EN trên cùng bản clone `sinh mới 0 · dùng lại 107`.
- **EN không bị ảnh hưởng:** chạy lại `tts` EN trên fixture được `sinh mới 0 · dùng lại 107`; `index.json` cũ và `ls -lT content/.audio/en` trước và sau giống hệt.

**Unit test:** `npm test` pass **162/162**, trong đó 78 test mới ở `test/normalize-vi.test.ts`. `npm run typecheck` sạch; ruff (E9, F) sạch cho các file Python. Test VI phủ:
- số đếm 0–9999: 24 ca cụ thể, cộng một test chạy hết 10.000 số, kiểm chỉ có chữ, không trùng, không có "mươi một" hay "mươi năm";
- tuỳ chọn lẻ, ngàn, tư; dấu phân cách kiểu Việt; số kiểu Anh thì cảnh báo;
- năm, số thứ tự, tháng 4, phân số, phần trăm, khoảng số; 10 ca đơn vị;
- `{1}` không đọc thành "một"; gạch ngang, ngoặc, dấu hai chấm; dấu thanh và kiểu cũ;
- bảng viết tắt, bảng đọc ép, cảnh báo từ mượn;
- **19 cặp chữ gốc → bản đọc mong đợi** của listening-set (A18–A28, B23–B30);
- 128 chuỗi VI của bài 1: chỉ 13 chuỗi bị đổi (2 ô trống, 2 gạch ngang, 10 "vitamin", 1 chuỗi có cả gạch ngang và vitamin), không cảnh báo nào;
- khoá cache: variant 0 giữ nguyên khoá EN; variant, quãng ngắt, cách mã hoá đều làm đổi khoá;
- mã hoá xoá ngày giờ ra cùng bytes; đệm quãng ngắt ô trống.

**Tự kiểm: trước và sau khi chọn lại seed**
- **Lần sinh đầu** (31/10):
  - 110 clip, 18 bị đánh dấu: 1 vì cụt cuối ("Chất bột đường"), phần lớn còn lại vì máy nghe ra sai chữ.
  - Thử thêm 4 seed cho mỗi clip:
    - 13 clip đổi seed và sạch;
    - 2 clip giữ seed gốc vì nghe lại thì sạch;
    - 3 clip vẫn còn đánh dấu, 1 trong số đó đã đổi seed.
- **"kẹo":**
  - Bước tự kiểm thường không đánh dấu "Kẹo": 2 lượt, sau đó 4 lượt `--recheck`, đều nghe ra "kẹo".
  - Tôi thử riêng 5 seed của "Kẹo" trong 6 ngữ cảnh ASR khác nhau, gồm đúng chuỗi của SK-023. Seed 0, tức clip SK-023 từng bị nghe ra "keo", lần này có 1 lần ra "kèo". Seed 1 không lần nào sai thanh; lần lệch duy nhất là ASR ghép sang từ bên cạnh ("kẹo nước"). Seed 2–4 kém hơn; seed 3 thì 0/6 lần ra "kẹo" (nghe thành "trẹo").
  - Nên **chọn tay seed 1 cho "Kẹo"** (`--pin-variant`, ghi lý do trong `variants.json`).
  - "kẹo" viết thường: seed 0 có 5/6 lần đúng, lần lệch là ghép từ, không sai thanh, nên giữ.
- **Lần sinh cuối** (sinh lại từ đầu, dùng bảng 19 mục): 6 clip bị đánh dấu, 2 đổi seed, **còn 5 clip đánh dấu, đều là lỗi "máy nghe", không có lỗi kỹ thuật**:

| # | Pointer | Chữ | Máy nghe (2 lượt) | Nhận định của dev |
| --- | --- | --- | --- | --- |
| 1 | `/quiz/3/prompt` | Nam bị **trầy** đầu gối… | "chạy" / "chạy" | Đúng mục A11 của SK-023, cả 8 giọng đều bị. Có thể giọng Nam đọc "ây" gần "ay", ASR không phân biệt được. Đã thử 5 seed, không seed nào khác |
| 2 | `/vocab/2/example` | Cá **giàu** chất đạm. | "dầu" / "giàu" | Đúng mục A08 của SK-023: "gi" giọng Nam đọc như "d". Seed 2 tốt nhất, 1/2 lượt đúng |
| 3 | `/key_points/2` | …**làm** một việc riêng… | "làm" / "là" | Một lượt hụt chữ "m" cuối. Lần sinh đầu clip này sạch ở cả 2 lượt, nên nhiều khả năng ASR dao động |
| 4 | `/quiz/5/explanation_wrong` | **Na** chưa đúng… | "na" / "nà" | Tên "Na": máy có lúc nghe thanh huyền. Cả 4 chuỗi có "Na" đều phải đổi sang seed 3 ở lần đầu, **cần Duy nghe tên Na** |
| 5 | `/quiz/5/labels/true` | **Na** đúng | "na đúng" / "nà đúng" | Như trên |

- Không clip nào cụt cuối, không clip nào thiếu lặng đầu (lặng đầu nhỏ nhất 19 ms), không ngắt dài bất thường, engine không phải tự sinh lại lần nào.
- "Thêm một món giàu chất đạm nhé!" bị đánh dấu ở lần đầu ("giàu" thành "rào"), nay sạch ở seed 1.
- Kết quả tự kiểm của từng clip lưu trong `content/.audio/index.json`, trường `check`. Bảng seed: `tools/content-cli/tts-vi/variants.json`, 19 mục.

**JSON đầu ra và `--require-assets`**
- `validate.mjs` trên 2 file đầu ra: `OK: 2 file hợp lệ (1 topic, 1 lesson)`, exit 0.
- `validate.mjs --require-assets`: `LỖI (--require-assets): 36 lỗi ở 1 file`. Đếm: 36 lỗi chứa `/asset` (`hình thiếu asset`), **0 lỗi audio**. Trước ticket này có 164 lỗi.
- Kiểm bằng script (`collectSpoken` + `index.json`): `Spoken 128 · audio.en 128/128 (trong index.json 128) · audio.vi 128/128 (trong index.json 128) · hash VI khác nhau 110`. 5 clip VI ngẫu nhiên ("khoai lang", "Cơm", "Chọn món cho mâm cơm khoẻ mạnh nhé.", "ánh nắng", "Chất bột đường cho ta năng lượng."): `shasum -a 256` đều trùng `audio.vi`.

**Clip VI**
- `afinfo` cả 110 clip: `1 ch, 48000 Hz, aac`, bitrate 63.318–64.048 bit/s.
- Ngắn nhất 640 ms, không clip nào dưới 0,3 s, không clip nào chỉ có lặng.
- Lặng đầu: trung vị 0,067 s (0,019–0,265). Lặng cuối: trung vị 0,31 s (0,07–0,42).
- 5 clip có tỉ lệ ms/ký tự cao nhất, đều là từ một tiếng nên tự nhiên dài theo ký tự: "cá" 640 ms (320 ms/ký tự), "sữa", "Đạm", "Kẹo", "cam" mỗi clip 800 ms.
- 5 clip có tỉ lệ thấp nhất (69–73 ms/ký tự), là câu đọc liền:
  - "Chất đạm giúp cơ thể lớn lên. Thường có trong cá, thịt, trứng và các loại đậu." 5,68 s;
  - "Rau muống có nhiều vi ta min…" 5,6 s;
  - "Chất bột đường cho ta năng lượng." 2,32 s;
  - "Mỗi nhóm chất dinh dưỡng…" 4,0 s;
  - "Em kể được các nhóm chất dinh dưỡng chính." 2,88 s.
- Nên nghe kỹ các clip đọc nhanh nhất.

**Gói** (`build --require-lang en,vi`)
- Exit 0. Kết quả: `asset: 217 (audio vi 110, audio en 107)`, gói 4,8 MB, trước là khoảng 2,6 MB.
- `check-pack.sh` in OK:
  - 218 file khớp manifest; tên asset bằng sha256;
  - `lang en: 107 asset` = 107 hash `audio.en`; `lang vi: 110 asset` = 110 hash `audio.vi`;
  - số file trong `assets/` = 217 = 107 + 110.
- Build 2 lần: `diff -r` chỉ khác `generated_at`.
- Xoá clip VI "Kẹo" khỏi bản clone của cache rồi build: exit 1, báo đúng `…/01-thuc-an-cho-ta-nhung-gi.json /play/items/6/label/audio/vi thiếu clip vi`.
- **Hash gói mới:**
  - manifest `catalog/v1/manifest.json` sha256 `9f53669aa6f7f27386e89aff7c2ecc3763050963958096d17e86c0d4ff0271e1`, `content_version` `0191a8837e5c`;
  - chủ đề `d3a514ef…` có `version` mới `7e4849fa98cb` (trước là `15880ff9df19`), `pack.json` sha256 `234df0aa5d45a036c18a648138d9e3b2a757bee5fce327705cc3e55ead25b008`, 62.433 byte.

**File nghe duyệt cho Duy** (110 clip, 5 phút 26 s, mỗi clip cách nhau 0,7 s)
- `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk024-nghe-duyet/review-01-vi.m4a`
- `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk024-nghe-duyet/review-01-vi.txt`: mốc giây, pointer, chữ VI gốc, chữ đã đọc, và với clip bị đánh dấu là chữ máy nghe được cùng số seed.
- Thứ tự: 5 clip bị đánh dấu ở đầu (0:00–0:19), rồi 103 clip của bài theo thứ tự trong bài, cuối cùng 2 clip chỉ có ở `topic.json`.
- Bản gốc nằm ở `content/.build/tts/review-01-vi.m4a` và `.txt`.

**Kiểm khác**
- `git status --porcelain -uall`: 0 file media, model hay môi trường Python. `git check-ignore` in ra `content/.audio`, `content/.build`, `tts-vi/.venv`, `tts-vi/.venv-eval`.
- File `tts-vi/variants.json` **cố ý để trong git**, để sinh lại ra đúng clip.
- Không secret. Chỉ dùng mạng khi tải model (lệnh `fetch`); lúc sinh, VieNeu chạy với `HF_HUB_OFFLINE=1`, bước tự kiểm cũng vậy.
- Không sửa `apps/ios`, `content/`, `docs/backlog/README.md`.

**Quyết định (dev)**
1. **"vitamin" đọc ép thành "vi ta min".** sea-g2p ra âm vị tiếng Anh `vˈaɪɾəmɪn` ("vai-tơ-min"), mà listening-set A05 mong đợi cách đọc Việt. Chữ hiển thị không đổi.
2. **Dấu thanh kiểu mới** (khoẻ, hoà, thuỷ), như bài 1. Kiểm sea-g2p với "khoẻ/khỏe", "hoà/hòa", "thuỷ/thủy": cùng âm vị, nên chọn kiểu nào cũng không đổi tiếng; quy về một kiểu chỉ để hai cách viết dùng chung clip.
3. **Phân số luôn đọc "phần"**, theo phiên chính và ticket. Listening-set đề xuất cảnh báo thay vì đổi; tôi vừa đổi vừa in cảnh báo `maybe_date` khi trông như ngày tháng.
4. **Dấu ":" giữ nguyên.** VieNeu tự đổi ":" và "—" thành quãng ngắt như dấu phẩy (đã kiểm). CLI vẫn tự đổi "—" thành "," cho rõ.
5. **Seed** = 4 byte đầu của sha256(giọng + chữ [+ "#" + biến thể]). Biến thể 0 trùng seed của bộ nghe SK-023, nên clip bài 1 có chữ trùng với listening-set sẽ trùng audio. Biến thể nằm trong khoá cache. Bảng `variants.json` gắn với dấu vân tay engine, nên đổi giọng hay model thì bắt đầu bảng mới.
6. **Clip VI xoá ngày giờ m4a**, nên sinh lại ra cùng sha256. Đây là đề xuất 1 của SK-014; chưa áp cho EN để không đổi 107 hash EN mà app đang nhúng.
7. **Không cân âm lượng** clip VI, giữ nguyên mức của engine như EN. Ghi là đề xuất.

**Còn chưa chắc**
- **Chưa người nào nghe.** Máy (Whisper) có thể tự "sửa" chữ đọc sai, và cũng dao động theo ngữ cảnh:
  - cùng một clip, lượt này đúng, lượt kia sai ("làm" / "là");
  - hai lần chạy cho ra danh sách đánh dấu khác nhau (18 so với 6 clip ở lần đầu), một phần vì lần sau đã có sẵn bảng seed.
  - Duy nghe 5 clip đầu của file duyệt trước, nhất là tên **"Na"** và chữ **"trầy"**.
- **Câu hỏi không lên giọng:** VieNeu đổi "?" thành "." trong bước chuẩn hoá của nó (đã kiểm `normalize_to_chunks_v3`). Muốn có ngữ điệu hỏi thì phải sửa engine; ngoài phạm vi.
- **Câu hỏi mở 1** (linh hay lẻ, nghìn hay ngàn): đã làm thành tuỳ chọn `--vi-numbers`, mặc định theo SGK. Bài 1 không có số nên chưa ảnh hưởng. Cần content-editor xác nhận SGK rồi Duy chốt.
- **Câu hỏi mở 3** (chuỗi chỉ khác chữ hoa): vẫn giữ riêng, 9 cặp ra 110 clip. "Kẹo" và "kẹo" vì vậy có seed khác nhau.
- **Kết quả tự kiểm phụ thuộc thứ tự chạy:** lần sau nghe một clip trong ngữ cảnh khác thì có thể ra khác. Clip đã chọn thì không sinh lại; muốn kiểm lại dùng `--check-all`.
- Bước tự kiểm mất khoảng 6 phút cho 110 clip. Với 34 bài nên chỉ chạy trên clip mới (mặc định).
- **Đề xuất:**
  1. Cân âm lượng EN và VI về cùng mức. Lặng cuối clip VI chỉ khoảng 0,3 s, nên khi phát nối EN rồi VI có thể cần chèn thêm quãng nghỉ (SK-025).
  2. Áp bước xoá ngày giờ m4a cho EN ở lần đổi model EN tới.

## Cân âm lượng và khoảng lặng (dev, 1/11)

Duy đã chốt giọng Kim Thanh, tốc độ mặc định (SK-023 done 1/11), và yêu cầu "Cân âm lượng". Chạy trên máy Duy. Chưa người nào nghe kết quả. Chưa commit.

**Đã làm**
- **`src/audio-post.ts`** (mới): bước hậu xử lý, hàm thuần, chạy sau khi engine sinh và trước khi mã hoá, áp cho cả EN và VI.
  - **Đo độ to:** K-weighting đúng hệ số BS.1770 (test so tới 1e-9 ở 48 kHz), cổng -70 LUFS và -10 LU. Khác BS.1770 ở chỗ chia **khối 100 ms, bước 25 ms**.
    - Lý do: integrated LUFS chia khối 400 ms. Clip một từ dài 0,6–0,8 s chỉ có 1–2 khối, nên giá trị nhảy theo vị trí của từ trong clip; "Trứng" đo bằng ffmpeg vẫn ra -20,7 dù đã cân.
    - Khối 100 ms vẫn phủ một âm tiết, và cổng loại được phần lặng.
    - Gọi tắt là **"LUFS phần có tiếng"**.
  - **Mức đích -18 LUFS phần có tiếng** cho cả hai thứ tiếng.
    - Chọn mức thấp nhất trong khoảng -16 đến -18 vì limiter ít phải làm nhất. Mô phỏng trên toàn bộ clip thật:

      | Mức đích | Clip EN chạm limiter | EN sâu nhất | Clip VI chạm limiter | VI sâu nhất |
      | --- | --- | --- | --- | --- |
      | -18 | 20 | 4,7 dB | 2 | 0,6 dB |
      | -17 | 43 | 5,8 dB | 9 | 1,8 dB |
      | -16 | 68 | 6,8 dB | 27 | 2,9 dB |

    - **ffmpeg `ebur128` đọc cùng các clip này là -19,0 LUFS (median).** Nếu cần -18 theo cách đo của ffmpeg thì đổi `LOUDNESS.target_lufs` thành -17, đổi đúng 1 dòng, sinh lại khoảng 9 phút; limiter khi đó phải làm nhiều hơn (bảng trên).
  - **Limiter:**
    - Đo trên true peak, nội suy 4 lần, test với sóng có đỉnh giữa hai mẫu.
    - Nhìn trước 5 ms; giảm gain theo trung bình trượt nên không có bước nhảy; nhả 60 ms.
    - Trần **-1,5 dBTP trước khi mã hoá**, vì AAC cộng thêm khoảng 0,4 dB. Sau limiter, phần độ to bị mất được bù lại (tối đa 5 vòng, luôn tính từ tín hiệu gốc).
    - Mỗi clip ghi thời gian limiter giữ gain giảm quá 1 dB:
      - EN: 20/100 clip chạm limiter, sâu nhất -4,7 dB ("I can name the main nutrients in food."), giữ tối đa 88 ms mỗi clip, tức chỉ ở một hai đỉnh;
      - VI: 2/110 clip, sâu nhất -0,6 dB, không clip nào giữ quá 1 dB.
  - **Khoảng lặng, chỉ VI: lặng đầu 0,15 s, lặng cuối 0,35 s**, đúng số gợi ý.
    - Phần có tiếng là các cửa sổ 10 ms to hơn -50 dBFS, cùng ngưỡng với `silencedetect` trong script đo của ios-dev. Chừa thêm 10 ms ở mỗi đầu, fade 5 ms ở chỗ cắt, rồi đệm lặng số.
    - Lý do chọn 0,15 s: đủ để bộ phát không nuốt âm đầu, mà nhanh hơn EN (0,33 s).
    - Lý do chọn 0,35 s: để giọng tắt hẳn. Cộng 0,1 s app chuyển clip và lặng đầu EN thì quãng VI → EN khoảng 0,8 s, EN → VI khoảng 0,7 s.
    - **EN không đổi khoảng lặng** (câu hỏi mở 4).
  - **Phát hiện engine cắt cụt** (trường hợp a): đo mức 30 ms cuối của đầu ra VieNeu trước khi sửa khoảng lặng. To hơn -45 dBFS thì bước tự kiểm đánh dấu `cut_end`. Đo sau khi đệm lặng thì vô ích, vì clip nào cũng kết thúc bằng lặng.
- **Khoá cache** có thêm `post` (`postSpec`: `POST_VERSION` 1, mức đích, trần, khối, limiter, khoảng lặng VI). Đổi tham số nào thì clip sinh lại.
  - Tham số không nằm trong `descriptor` của engine, nên bảng seed `variants.json` vẫn dùng được.
  - Mỗi clip lưu số đo hậu xử lý trong `index.json`, trường `post`.
- **EN cũng xoá ngày giờ m4a** (`M4A_ENCODING_ZERO_TIMES`), vì lần cân âm lượng này đã làm đổi mọi hash EN. Từ nay sinh lại EN cũng ra cùng sha256.
  - Hệ quả có lợi: 7 cặp EN chỉ khác chữ hoa ("rice"/"Rice"…) Kokoro đọc giống hệt, nay trùng bytes. Gói còn **100 asset EN** thay vì 107; 107 khoá vẫn giữ nguyên.
- `test/audio-post.test.ts` (mới, 11 test):
  - hệ số K-weighting; sóng sin 997 Hz ra -3,01 LUFS ở 48 kHz và 24 kHz; clip 0,3 s vẫn đo được;
  - true peak giữa hai mẫu; limiter kéo về dưới trần mà giữ đúng độ to;
  - đúng mức đích khi không cần limiter; tất định;
  - lặng đầu và cuối đúng 0,15 s và 0,35 s; EN không đổi khoảng lặng;
  - phát hiện cắt cụt; tham số nằm trong khoá cache.
- `npm test` **173/173 pass**, `npm run typecheck` sạch.
- Cập nhật README (mục "Hậu xử lý âm thanh"), `src/cache.ts`, `src/audio.ts`, `src/tts/command.ts`, `src/tts/self-check.ts`, `tts-vi/evaluate.py` (cờ `cut_end_raw`).

**Bảng đo trước và sau** (`measure_clips.py` của ios-dev; gói trước: `scratchpad/sk024-can-am-luong/pack-before`; gói sau: `content/.build/pack`). Các giá trị ghi median (min–max).

| Chỉ số | EN trước | EN sau | VI trước | VI sau |
| --- | --- | --- | --- | --- |
| Số clip | 107 | 100 (7 cặp chữ hoa trùng bytes) | 110 | 110 |
| Lặng đầu, s | 0,33 (0,27–0,41) | 0,32 (0,27–0,41) | 0,06 (0,00–0,26) | **0,16 (0,15–0,17)** |
| Lặng cuối, s | 0,46 (0,34–0,55) | 0,46 (0,34–0,54) | 0,31 (0,03–0,40) | **0,37 (0,35–0,39)** |
| Thời lượng, s | 2,09 (1,24–5,29) | 2,18 (1,24–5,29) | 2,05 (0,70–6,21) | 2,27 (0,85–6,42) |
| mean_volume, dB | -23,5 (-24,9 … -22,6) | -20,2 (-23,0 … -19,4) | -20,5 (-25,4 … -18,5) | -19,3 (-22,2 … -18,4) |
| Integrated LUFS (ffmpeg, khối 400 ms) | -22,0 (-23,1 … -19,9) | **-19,0 (-20,4 … -18,5)** | -20,4 (-24,0 … -17,5) | **-19,0 (-20,7 … -18,4)** |
| **LUFS phần có tiếng** (cách CLI cân) | -21,13 (-22,47 … -18,63), chênh 3,84 LU | **-18,05 (-18,17 … -17,57), chênh 0,60 LU** | -19,49 (-22,27 … -16,60), chênh 5,67 LU | **-18,02 (-18,12 … -17,95), chênh 0,17 LU** |
| Đỉnh mẫu, dB | -5,9 (max -1,2) | -2,9 (max -1,1) | -5,7 (max -1,4) | -4,15 (max -1,6) |
| True peak tối đa (ffmpeg), dBTP | -1,0 | **-1,1** | -1,4 | **-1,5** |
| VI − EN, LUFS integrated / LUFS phần có tiếng | **+1,6 LU / +1,64 LU** | | | **0,0 LU / +0,03 LU** |
| VI − EN, mean_volume | +3,0 dB | | | +0,9 dB |
| Quãng EN hết → VI bắt đầu (lặng trong clip), s | 0,54 (0,40–0,73) | | | 0,62 (0,50–0,71) |
| Quãng VI hết → EN bắt đầu, s | 0,64 (0,31–0,82) | | | 0,69 (0,62–0,80) |

- **Đạt:** lệch median EN–VI 0,0 LU, đích là ≤ 1. True peak ≤ -1 dBTP.
- **Lệch trong một thứ tiếng:**
  - Đo theo phần có tiếng: 0,6 LU (EN) và 0,17 LU (VI).
  - Đo bằng integrated của ffmpeg: 1,9 LU (EN) và 2,3 LU (VI). Phần dư so với "khoảng 2 LU" nằm ở clip một từ, do khối 400 ms. Clip nhỏ nhất theo ffmpeg là "Trứng" -20,7; theo cách đo phần có tiếng thì nó ở -18,0.
- Gói cũ: "lạc" nhỏ nhất (-24,0), "khoai lang" to nhất (-17,5). Gói mới: "lạc" -18,0 và "khoai lang" -18,0 LUFS phần có tiếng.

**Ba clip có thể bị cắt cuối: cả ba thuộc trường hợp (b), âm cuối đủ, chỉ thiếu khoảng lặng**
- **Cách kiểm:** sinh lại đúng PCM thô của cả 110 clip VI (cùng seed nên trùng từng bit), rồi so với m4a đã giải mã.
  - Độ dài bằng nhau ở 110/110 clip.
  - Đường năng lượng 100 ms cuối, đo theo cửa sổ 5 ms, lệch dưới 1 dB.
  - Kết luận: bước mã hoá AAC/M4A **không** cắt gì.
  - Sau hậu xử lý kiểm lại: độ dài PCM đã xử lý bằng m4a giải mã ở 110/110 clip; mức 30 ms cuối phần có tiếng lệch tối đa 0,4 dB.
- **"không khí":**
  - "í" tắt dần rồi còn một nền khoảng -57 dB (hơi thở, ồn) kéo tới cuối clip. Mức 30 ms cuối của đầu ra thô là -58,8 dBFS, không phải mức tiếng nói.
  - Whisper nghe đủ "không khí" ở cả hai lượt.
  - → (b). Nền -57 dB được cắt ở chỗ dưới -50 dB, có fade, rồi đệm lặng.
- **"Em kể được các nhóm chất dinh dưỡng chính.":** 30 ms cuối -90 dBFS, năng lượng tắt dần từ khoảng 75 ms trước điểm cuối. Whisper nghe đủ "chính". → (b).
- **"Đồ ngọt: nên ăn ít":** có một tiếng bật nhẹ của "t" (-45 dB) khoảng 75 ms trước điểm cuối, rồi tắt về -80…-95 dB. Đây là cách giọng Việt đọc "t" cuối: không bật hơi. Whisper nghe đủ "ăn ít". → (b).
- **Quét cả 110 clip VI:** mức 30 ms cuối của đầu ra thô to nhất là -58,8 dB ("không khí"), rồi -68,6 ("Chất béo") và -68,7 ("dầu ăn"); trung vị -123,6 dB. **Không clip nào thuộc trường hợp (a)** (ngưỡng -45 dBFS), nên không phải đổi seed vì lý do này. Sau xử lý, lặng cuối của cả 110 clip là 0,35–0,39 s.

**Sinh lại, tự kiểm, tất định**
- EN: sinh lại 107 khoá, mất 1 phút 7 s. VI: 110 clip, cùng seed như trước, mất 7 phút 12 s, trong đó tự kiểm 6 phút 5 s.
- Tự kiểm VI: bị đánh dấu ở lần đầu 6, đổi seed 2 ("Chọn từ còn thiếu" và "Rau muống" sang biến thể 1), còn đánh dấu 3. Cả 3 là "máy nghe" mà dev cho là ASR dao động hoặc nét giọng Nam, không phải lỗi kỹ thuật:
  - "Mỗi nhóm…" ("làm" nghe thành "là");
  - "Nam bị trầy…" ("chày", "chạy");
  - "Cá giàu…" ("dầu").
- Hai clip có "Na" lần này sạch. `variants.json` nay có 22 mục.
- **Tất định:**
  - Chạy lại EN và VI: sinh mới 0; `ls -lT content/.audio/en content/.audio/vi` trước và sau giống hệt.
  - Xoá 7 clip (3 EN, 4 VI, gồm 3 clip nghi cắt cuối và "Kẹo") khỏi bản sao của cache rồi sinh lại: **cùng khoá, sha256 trùng 7/7**.
- Cache đã dọn: bỏ 217 mục cũ của lần mã hoá trước và 107 mục EN chưa xoá ngày giờ. Còn 217 mục (EN 107, VI 110), khớp đúng các hash JSON đầu ra đang dùng. Bản lưu trước khi dọn ở `scratchpad/sk024-can-am-luong/audio-before`.

**Gói mới** (`build --require-lang en,vi`)
- Exit 0. **210 asset** (en 100, vi 110), **4,9 MB** (5.090.721 byte, 212 file; manifest 54,9 KB).
- `check-pack.sh` in OK: 210 file `assets/` = 100 hash `audio.en` + 110 hash `audio.vi`.
- Build 2 lần chỉ khác `generated_at`.
- **`content_version` `89d8ade0a3cd`.**
- **sha256 của manifest `138bf89d3b1a94e8541113a541310e0fb22f91035fc48921221cbd3e7794bd70`.**
- Chủ đề `d3a514ef…`: version `692f2e75ba89`, `pack.json` sha256 `59d874acba16fe7643b2c7e59d97cfdb523e75a647b28cdcf38cefda381a00a5`.
- `validate.mjs`: exit 0. `--require-assets`: 36 lỗi, đều là `/asset` của hình, **0 lỗi audio**.

**File để Duy nghe** (`/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk024-can-am-luong/`)
- `review-01-vi.m4a` và `.txt`: 110 clip, 5 phút 43 s.
  - 5 clip bị đánh dấu ở lần kiểm trước nằm đầu: "Mỗi nhóm…", "Nam bị trầy…", "Na chưa đúng…", "Na đúng", "Cá giàu…". Mỗi clip kèm chữ máy nghe được ở lần này.
  - Sau đó là các clip theo thứ tự trong bài.
- `both-01.m4a` và `.txt`: 15 chuỗi theo kiểu "Cả hai", 86 s.
  - Mỗi chuỗi: clip EN, 0,1 s, rồi clip VI của chính chuỗi đó; khoảng lặng trong clip giữ nguyên; 1,0 s giữa hai chuỗi.
  - Có đủ: 3 clip nghi cắt cuối, "lạc", "khoai lang", câu Khởi động có ô trống, lệnh Khởi động, "Kẹo", tên Nam và Na, "Cá giàu chất đạm.", câu có vitamin, lời khen.
- Các file đo: `measure-before.txt`, `measure-after.txt`, `measure-extra-before.txt`, `measure-extra-after.txt`.

**Còn chưa chắc**
- **Chưa người nào nghe:**
  - không biết limiter trên 5 clip EN giảm 2,9–4,7 dB có nghe ra không (mỗi lần chỉ dưới 0,1 s, ở một hai đỉnh);
  - không biết fade 5 ms ở chỗ cắt có nghe ra không.
  - Duy nghe `both-01` là đủ biết.
- **Mức đích theo cách đo nào:** CLI đo phần có tiếng (-18). Đo bằng công cụ chuẩn (ffmpeg integrated) thì là -19. Nếu ios-dev hay QA dùng ffmpeg làm chuẩn thì nên chốt lại: giữ -18 theo phần có tiếng, hay -17 để ffmpeg đọc ra -18.
- **True peak EN tối đa -1,1 dBTP:** sát trần -1. AAC cộng thêm 0,4 dB so với lúc trước mã hoá. Muốn rộng hơn thì hạ trần trước mã hoá xuống -2.
- **Hash EN đã đổi hết** (100 hash mới) và gói nặng hơn gói chỉ có EN. App phải nhúng gói mới (ios-dev, SK-025).
- **Đổi luồng chạy:** chạy lại `tts` EN từ fixture sẽ ghi đè JSON đầu ra và làm mất `audio.vi`, nên phải chạy VI lại ngay sau. Không sinh lại gì, mất khoảng 3 s. Thứ tự đúng: EN rồi VI rồi build.

