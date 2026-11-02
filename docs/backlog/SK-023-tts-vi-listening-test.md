# SK-023 · Listening test giọng tiếng Việt (VieNeu-TTS, giọng Nam) và chốt giọng

Trạng thái: done (Duy nghe và chốt Kim Thanh 1/11) · Ngày: 2026-10-31 · Phụ trách: dev (dựng VieNeu, sinh mẫu), content-editor (bộ câu, phiếu chấm) · Chấm: Duy + biên tập viên · Tester: tester (kiểm bộ mẫu và cách ẩn tên)
Nguồn: Duy 31/10 ("phần voice tiếng việt… quan trọng, check plan rồi ưu tiên làm"; chỉ thử VieNeu-TTS, chỉ giọng Nam); prd.md dòng 17, 125; technical-plan.md B4.1, B9 (Audio VI, chuẩn hoá, duyệt audio), B16 (lịch listening test), B18 #3; docs/ios-test-build.md mục "Giọng tiếng Việt"; SK-014 (cách dựng Kokoro EN, định dạng clip, file nghe thử); `content/tts-vi/listening-set.md` (content-editor đang soạn)

## Mục tiêu
Duy và biên tập viên nghe mù cùng một bộ 60 mục đọc bằng các giọng miền Nam của VieNeu-TTS, rồi chốt một giọng và một tốc độ cho toàn bộ audio tiếng Việt (SK-024 dùng kết quả này).

## Phạm vi

**content-editor: bộ câu và phiếu chấm** (`content/tts-vi/listening-set.md`, đang soạn)
- 30 câu + 30 từ đơn, mỗi mục có mã (ví dụ `S01`…`S30`, `W01`…`W30`), chữ đưa vào engine, và ghi chú "cần nghe gì".
- Phủ được: số (có hàng chục 0, năm, số thập phân), đơn vị, tên khoa học và từ mượn (vitamin…), câu hỏi (ngữ điệu lên), lời mascot (cảm thán, khen), câu có ô trống, tên người (Na, Nam), từ có dấu thanh đặt kiểu cũ (khoẻ/khỏe), câu dài cỡ câu dài nhất của bài 1 (78 ký tự).
- Mục có số hoặc đơn vị: chữ đưa vào engine là bản đã viết thành chữ, giống bản SK-024 sẽ chuẩn hoá. Có thể thêm vài mục để nguyên chữ số, để biết engine tự đọc thế nào.
- Phiếu chấm, mỗi mục chấm theo thang điểm content-editor chọn:
  - đọc đúng dấu thanh, theo chuẩn giọng Nam;
  - đọc đúng số và đơn vị;
  - từ đơn nghe tự nhiên;
  - hợp tai trẻ: ấm, rõ, không đều đều;
  - tốc độ vừa cho bé 7–9;
  - lỗi kỹ thuật: rè, nuốt chữ, lặp, đọc chữ không có trong câu, cắt cụt.
- Phiếu có thêm một ô nhận xét chung cho từng biến thể.

**dev: dựng VieNeu-TTS và sinh mẫu**
- **Giấy phép, làm trước khi sinh mẫu đầu tiên.** Ghi vào "Quyết định đã ghi" của ticket này:
  - đúng bản model: repo Hugging Face, commit, tên file, kích thước;
  - giấy phép của model và của gói `vieneu`, có link;
  - xác nhận đây là v3 Turbo (Apache-2.0), không phải bản 0.3B cũ (CC-BY-NC);
  - nguồn dữ liệu huấn luyện và nguồn giọng, nếu model card có ghi;
  - điều kiện kèm theo, ví dụ ghi công hay watermark.

  Nếu giấy phép không cho dùng thương mại hoặc không rõ, dev dừng và báo PM. Khi đó chưa sinh mẫu.
- **Runtime.** Dựng theo cách của SK-014:
  - model đặt ở `tools/content-cli/.models/`; môi trường Python (nếu cần) tạo bằng `uv`, nằm ngoài git;
  - ghim mọi phiên bản; ghi URL tải và kích thước;
  - không gọi mạng ngoài lần tải gói và model.

  B9 ghi `pip install vieneu`. Máy có Python 3.15, nên có thể cần Python 3.12 qua `uv`, như phương án dự phòng của Kokoro. Code dựng ở đây được SK-024 dùng lại, nên đặt trong `tools/content-cli/`.
- **Danh sách giọng.** Liệt kê mọi giọng miền Nam của bản model: tên, giới tính, mô tả theo model card hoặc code. Tất cả đều vào thử, trừ khi Duy loại bớt.
- **Tốc độ.** Nếu engine có tham số tốc độ: mỗi giọng thử mức mặc định và một mức chậm hơn (khoảng 0,9). Không có tham số thì ghi lại; không kéo giãn bằng hậu kỳ. Mỗi cặp giọng + tốc độ là một **biến thể**.
- **Sinh mẫu.**
  - Mỗi biến thể đọc đủ 60 mục, bằng chữ trong `listening-set.md`.
  - Clip cùng định dạng EN (SK-014 quyết định 10): M4A AAC mono 64 kbps qua `afconvert`, để nghe giống trong app.
  - Nếu engine lấy mẫu ngẫu nhiên thì cố định seed và ghi lại.
- **Chấm mù.**
  - Mỗi biến thể có một mã ngẫu nhiên (A, B, C…), thứ tự mã xáo.
  - Tên file, file `.txt` và metadata của m4a không chứa tên giọng hay tốc độ.
  - Bảng khoá (mã → giọng, tốc độ) ghi ở một file riêng. Người chấm không mở file này trước khi nộp phiếu.
- **File nghe.** Đặt ở `content/.build/tts-vi-test/`, ngoài git:
  - mỗi biến thể có `<mã>-cau.m4a` và `<mã>-tu.m4a`, các clip cách nhau khoảng 0,7 s, như `review-01`;
  - kèm `.txt` ghi mốc giây, mã mục và chữ.
- **Hai vòng, nếu có hơn 3 biến thể.**
  - Vòng 1 (lọc): mỗi biến thể một file ngắn, 8 câu + 8 từ, cùng các mục cho mọi biến thể. Duy chọn tối đa 3 biến thể.
  - Vòng 2: chấm đủ 60 mục theo phiếu.
  - Có 3 biến thể trở xuống thì bỏ vòng 1.
- **Đo và ghi vào ticket:**
  - thời gian sinh, hệ số thời gian thật (RTF) trên máy Duy;
  - cỡ model, cỡ môi trường cài;
  - khoảng lặng đầu và cuối clip;
  - lỗi kỹ thuật thấy được khi chạy (crash, clip rỗng, clip quá dài so với chữ).

**Duy + biên tập viên: chấm**
- Điền phiếu cho từng biến thể, nộp phiếu rồi mới mở bảng khoá.
- Dev hoặc PM tổng hợp điểm theo biến thể vào ticket.
- Duy ghi quyết định: giọng, tốc độ. Hoặc ghi "không đạt", khi đó đi theo phương án dự phòng.

**PM: ghi kết quả**
- Ghi giọng, tốc độ, bản model và giấy phép vào technical-plan.md B9, B18 #3, B20.
- Báo cho SK-024.

## Ngoài phạm vi
- Google Cloud TTS, FPT.AI, Azure: Duy không thử lần này (31/10). Không tạo tài khoản, không có API key nào.
- Giọng miền Bắc và miền Trung.
- Nhân bản giọng (voice cloning) từ giọng một người thật. Việc này cần Duy quyết về pháp lý và quyền giọng nói.
- Fine-tune model.
- Sinh audio VI cho bài 1 và bộ chuẩn hoá tự động: thuộc SK-024. Bộ câu dùng chữ viết tay đã chuẩn hoá.

## Tiêu chí nghiệm thu
- [ ] Mục "Giấy phép" trong ticket có đủ:
  - repo và commit model;
  - phiên bản gói `vieneu`;
  - giấy phép model và gói, có link;
  - xác nhận không phải bản 0.3B CC-BY-NC.

  Có mục này trước khi có file mẫu đầu tiên. Tester mở link đối chiếu.
- [ ] Danh sách đủ giọng miền Nam của bản model, kèm nguồn (model card hoặc dòng code).
- [ ] Mỗi biến thể có đủ 60 clip, kiểm bằng script và dán số vào ticket:
  - không clip nào ngắn dưới 0,3 s;
  - không clip nào chỉ có khoảng lặng;
  - `afinfo` cho AAC, 1 kênh, khoảng 64 kbps.
- [ ] Ẩn tên: tìm tên mọi giọng và chữ "vieneu" trong tên file, file `.txt` và metadata m4a ở `content/.build/tts-vi-test/` (trừ file khoá) → 0 kết quả. Dán lệnh và output.
- [ ] Mỗi biến thể có file nghe ghép kèm `.txt` mốc giây. Mốc giây khớp file, kiểm ngẫu nhiên 3 mục.
- [ ] Không secret. Không gọi mạng ngoài lần tải gói và model. `git status --porcelain -uall` không có `.m4a`, `.wav`, `.onnx`, `.bin`, `.safetensors`, thư mục model hay môi trường Python.
- [ ] Phiếu đã chấm của Duy (và biên tập viên, nếu có) ghi vào ticket, có bảng điểm tổng theo biến thể.
- [ ] Duy ghi quyết định vào ticket: giọng + tốc độ, hoặc "không đạt".
- [ ] PM cập nhật technical-plan.md B9, B18 #3, B20 và đầu SK-024.
- [ ] dev chỉ sửa trong `tools/content-cli/` và `content/.build/` (cộng ticket). content-editor chỉ sửa trong `content/tts-vi/`. Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- Bộ câu và phiếu của content-editor. Dev dựng runtime, kiểm giấy phép và liệt kê giọng song song, không chờ bộ câu.
- SK-024 chờ giọng và tốc độ từ ticket này. Các phần của SK-024 không phụ thuộc giọng thì làm song song: chuẩn hoá, EngineSpec, cache, build.

**Quyết định đã ghi**
1. (Duy 31/10) Giọng tiếng Việt ưu tiên trước mọi việc khác. Listening test làm ngay, không chờ lịch 17/11 – 28/11 của B16.
2. (Duy 31/10) Chỉ thử **VieNeu-TTS**, **chỉ giọng Nam**. Không thử Google, FPT, Azure lần này.
3. (Duy 31/10) Cho phép dev tải gói `vieneu` và model từ Hugging Face. Dev ghi URL, phiên bản, kích thước vào ticket.
4. (Duy 31/10) **Dự phòng:** nếu không giọng Nam nào của VieNeu đạt, PM hỏi lại Duy theo thứ tự của B9: Google Cloud TTS Chirp 3 HD, rồi FPT.AI Ban Mai hoặc Azure HoaiMy. Tài khoản và key bàn khi tới bước đó.
5. (PM 31/10) Clip mẫu cùng định dạng clip trong app. Chấm mù, hai vòng nếu có hơn 3 biến thể.
6. (PM 31/10, Duy xác nhận) "Đúng dấu" chấm theo chuẩn giọng Nam: hỏi và ngã nghe gần nhau là bình thường, không trừ điểm.

**Giấy phép** (dev kiểm 31/10 lúc 23:00, trước khi tải model; ghi vào ticket sau khi sinh mẫu vì lúc kiểm ticket chưa có)
- **Model:** [`pnnbao-ump/VieNeu-TTS-v3-Turbo`](https://huggingface.co/pnnbao-ump/VieNeu-TTS-v3-Turbo), commit `61b85e3d937fbbacb387714180e8182823512523` (23/09/2026). Dùng bản ONNX fp32 trong thư mục `onnx_update/` (bản SDK chọn mặc định khi chạy CPU) và `denoiser.onnx`, tổng 518,1 MB. Codec [`OpenMOSS-Team/MOSS-Audio-Tokenizer-Nano-ONNX`](https://huggingface.co/OpenMOSS-Team/MOSS-Audio-Tokenizer-Nano-ONNX), commit `ceff0d0749bfb3fa2d61149794ec6feef0d1e1ae` (17/04/2026), 90,6 MB. Tổng tải 608,6 MB. Tên file, kích thước, sha256 từng file: `tools/content-cli/tts-vi/model-files.json`.
- **Gói `vieneu`:** [3.8.3 trên PyPI](https://pypi.org/project/vieneu/3.8.3/) (23/09/2026, bản mới nhất ngày 31/10), mã nguồn [github.com/pnnbao97/VieNeu-TTS](https://github.com/pnnbao97/VieNeu-TTS). Phụ thuộc chính: `sea-g2p` 0.9.1 (tách âm và chuẩn hoá chữ, cùng tác giả), `onnxruntime` 1.24.4.
- **Giấy phép, link:**
  - Gói `vieneu` và mã nguồn: Apache-2.0 ([LICENSE](https://github.com/pnnbao97/VieNeu-TTS/blob/main/LICENSE); PyPI ghi `License :: OSI Approved :: Apache Software License`).
  - Model v3 Turbo: Apache-2.0 (thẻ `license: apache-2.0` trên [model card](https://huggingface.co/pnnbao-ump/VieNeu-TTS-v3-Turbo)). Mục "Usage Rights & Licensing FAQ" của model card ghi rõ: giấy phép áp cho **mọi** file trong repo (trọng số, bản ONNX, tokenizer, giọng có sẵn); audio sinh bằng giọng có sẵn **được dùng thương mại**, không phí, không cần giấy phép thêm.
  - Codec MOSS-Audio-Tokenizer-Nano (bản ONNX và repo gốc): Apache-2.0. `sea-g2p`: Apache-2.0. `onnxruntime`: MIT. `soxr` (chỉ dùng khi nhân bản giọng, không dùng): LGPL-2.1, chỉ nằm trong công cụ trên máy, không vào app.
  - **Không phải bản 0.3B.** Bản 0.3B là repo khác (`pnnbao-ump/VieNeu-TTS-0.3B`), dùng backend `standard`/LMDeploy; SDK 3.8.3 ở chế độ `v3turbo` chỉ đọc hai repo đã ghim ở trên (script chặn mọi repo khác). Ghi thêm: ngày 31/10, thẻ giấy phép trên trang 0.3B cũng hiện `apache-2.0`, khác với ghi chú CC-BY-NC trong B9. Mình không dùng bản đó nên không cần làm rõ.
- **Dữ liệu huấn luyện, nguồn giọng:** model card ghi v3 Turbo do tác giả Phạm Nguyễn Ngọc Bảo thiết kế và huấn luyện từ đầu trên khoảng 10.000 giờ tiếng Anh–Việt, không phải fine-tune model khác. Bộ dữ liệu `pnnbao-ump/VieNeu-TTS-10k-ENVI` không công khai (trang trả 401), quy trình thu thập "không công bố". Về giọng có sẵn, model card khẳng định người nói (hoặc chủ quyền) đã đồng ý cho dùng giọng để huấn luyện AI và sinh giọng tổng hợp. Mình không tự kiểm được điều này.
- **Điều kiện kèm theo:**
  - Apache-2.0: khi phân phối lại **model** thì giữ giấy phép và ghi công. Mình chỉ phân phối audio sinh ra, không phân phối model, nên app không bắt buộc ghi công. Ghi công ở trang giấy phép trong app vẫn là cách lịch sự, PM quyết.
  - Watermark: SDK mặc định `apply_watermark=True`, nhưng chỉ có tác dụng khi cài gói phụ `resemble-perth` (extra `[watermark]`). Mình không cài và truyền `apply_watermark=False`, nên clip không có watermark. Giấy phép không bắt buộc watermark.
  - Nhân bản giọng: model card ghi người dùng tự chịu trách nhiệm về quyền giọng nói. Ngoài phạm vi ticket này.
- **Chỗ lệch cần biết:** README trên GitHub, mục Roadmap, ghi v3 Turbo là "on-device, personal use". Câu này mâu thuẫn với giấy phép Apache-2.0 và mục FAQ của model card, vốn cho phép dùng thương mại rõ ràng. Văn bản giấy phép là thứ có hiệu lực, nên dev không dừng. Nếu Duy muốn chắc chắn hơn trước khi phát hành, có thể hỏi tác giả xác nhận bằng văn bản (Discord hoặc email trong `pyproject.toml`). Bản v4 là bản độc quyền, chỉ có qua API vieneu.io; mình không dùng.

**Câu hỏi còn mở**
1. *(PM → Duy)* "Giọng Nam" ở đây PM hiểu là **giọng miền Nam**. Có thử cả giọng nam lẫn giọng nữ không?
   - (a) Cả hai. **Đề xuất**, để chấm mù quyết. Giọng EN `af_heart` là nữ, nên cũng cần nghe hai giọng nối nhau ở chế độ "Cả hai" có hợp không.
   - (b) Chỉ giọng nữ.
   - (c) Chỉ giọng nam.

   Nếu "giọng Nam" nghĩa là giọng nam (không theo miền) thì phạm vi đổi. Cần Duy xác nhận trước khi dev sinh mẫu.
2. *(PM → Duy)* Ai chấm cùng Duy?
   - Biên tập viên (người) đã có chưa? Agent không nghe được nên không chấm.
   - **Đề xuất** thêm một người lớn quen giọng miền Bắc, để biết bé miền Bắc nghe giọng Nam có dễ không.
3. *(PM → Duy)* Nếu engine chỉnh được tốc độ: thử 2 mức (mặc định và khoảng 0,9) hay nhiều hơn? **Đề xuất** 2 mức, để số biến thể vừa sức chấm.

## Kết quả (dev)

31/10/2026. Chạy trên máy Duy (Mac M4, 10 nhân: 4 hiệu năng cao + 6 tiết kiệm điện, 16 GB RAM, macOS 15.3.1), `uv` 0.7.8. Chưa commit.

**Đã làm**
- `tools/content-cli/tts-vi/`: môi trường Python 3.12 riêng, dựng bằng `uv`. SK-024 sẽ gọi lại từ đây.
  - `pyproject.toml` và `uv.lock` ghim mọi phiên bản. `vieneu==3.8.3`; các gói chạy chính ghim theo `uv.lock` upstream của vieneu 3.8.3: `onnxruntime` 1.24.4, `huggingface-hub` 0.36.0, `sea-g2p` 0.9.1, `numpy` 2.3.4. Không dùng bản mới nhất vì `onnxruntime` 1.31 từ chối nạp file `.data` của model qua symlink của cache Hugging Face ("External data path escapes model directory").
  - `vieneu_vi.py`: lệnh `fetch` (tải model ở commit đã ghim, kiểm sha256 theo `model-files.json`), `voices`, `synth`, `batch`. Mọi lệnh trừ `fetch` chạy với `HF_HUB_OFFLINE=1`. Mọi lệnh tải của SDK bị ép về commit đã ghim; repo lạ bị từ chối.
  - `listening.py`: sinh bộ nghe mù theo mục C1 của `listening-set.md`.
  - `README.md`: cách dựng lại, URL tải, kích thước, các lưu ý. `.gitignore` riêng cho `.venv/`.
- Model nằm ở `tools/content-cli/.models/vieneu/hf/` (608,6 MB, đã gitignore cạnh Kokoro). `.venv` 767 MB, phần lớn là `gradio`: gói `vieneu` bắt buộc cài nó cho giao diện web, script không dùng.
- Không sửa `content/`, `apps/ios`, `docs/backlog/README.md`.

**Giọng miền Nam của bản model** (nguồn: `vieneu/assets/voices_v3_turbo.json` trong gói 3.8.3, khớp bảng "Preset Voices" của model card; SDK có 25 giọng: Bắc 15, Trung 2, Nam 8)

| Giọng | Giới | Phong cách (theo SDK) |
| --- | --- | --- |
| Adam | nam | tự nhiên |
| Minh Triết | nam | tin tức |
| Thái Sơn | nam | kể chuyện |
| Đức Trí | nam | đọc truyện |
| Thùy Dung | nữ | tin tức |
| Thục Đoan | nữ | kể chuyện |
| Mỹ Duyên | nữ | đọc truyện |
| Kim Thanh | nữ | đọc truyện |

- Câu hỏi mở 1 chưa có câu trả lời của Duy. Dev sinh cả 8 giọng miền Nam, cả nam lẫn nữ. Đây là tập lớn nhất, chứa cả ba lựa chọn (a), (b), (c). Nếu Duy loại bớt thì chỉ cần bỏ cột khi chấm, không phải sinh lại.
- Nếu "giọng Nam" thật ra nghĩa là **giọng nam ở mọi miền** (SDK có 14 giọng nam) thì chạy lại `listening.py --region all --gender male` với thư mục mới, khoảng 10 phút.
- **Không có tham số tốc độ.** v3 Turbo không nhận `speed` (chỉ bản Nano có). `style` cũng bị bỏ qua: giọng quyết định cách đọc. Vì vậy mỗi giọng là một biến thể ở tốc độ mặc định, tổng 8 biến thể. Không kéo giãn bằng hậu kỳ. Tốc độ đọc mặc định khác nhau rõ giữa các giọng: 2,9 tới 4,6 tiếng/giây, đo trên các câu phần A không có chữ số.
- **Seed:** engine lấy mẫu ngẫu nhiên (temperature 0,8, top-k 25, top-p 0,95). Script đặt `numpy` seed = 4 byte đầu của sha256(`giọng` + xuống dòng + `chữ`), A03 mỗi nửa một seed. Seed của từng clip ghi trong `metrics.jsonl` ở thư mục khoá.

**Câu thử** "Chất bột đường cho ta năng lượng." (giọng Adam): clip 1,84 s, sinh mất 0,51 s ở lần gọi đầu (RTF 0,28), 0,36 s ở các lần sau. Nạp model 1,2 s. RAM đỉnh 1,1 GB. `afinfo`: AAC, 1 kênh, 48 kHz, 64,2 kbps.

**Bộ nghe** (theo mục C1 của `listening-set.md`; 8 cấu hình × 85 clip = 680 clip)
- **Thư mục nghe:** `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/tts-vi-listening/`
  - `index.html`: **trang nghe**. Mỗi dòng một clip, 8 cấu hình cạnh nhau, có nút phát. "▶ lần lượt" phát cả hàng theo thứ tự xáo riêng cho từng mã. Có ô bật "chỉ vòng 1" và điểm nhanh 1–5, lưu trên trình duyệt.
  - `X/X-A01.m4a` … `P/P-B30n.m4a`: clip, mỗi cấu hình một thư mục.
  - `joined/<chữ>-cau.m4a`, `-tu.m4a`, `-vong1.m4a`, mỗi file kèm `.txt` ghi mốc giây. Clip cách nhau 0,7 s.
  - `playlists/playlist-<mã>.m3u` (85 file) và `playlist-all.m3u`. Thứ tự cấu hình xáo riêng cho từng mã (C1.9).
- **Thư mục khoá** (thư mục anh em, nằm ngoài thư mục nghe; chỉ mở sau khi nộp phiếu): `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/tts-vi-listening-key/`. Trong đó có `key.md`, `key.json`, `metrics.jsonl` và `summary.json` (cờ kỹ thuật theo từng clip).
- **Khác với ticket và với C1:**
  - Đặt trong scratchpad ngoài repo, theo lệnh của phiên chính, thay cho `content/.build/tts-vi-test/`. Muốn chuyển sang đó thì chạy lại `listening.py` với `--out content/.build/tts-vi-test --key content/.build/tts-vi-test-key`.
  - Có 8 cấu hình, nhiều hơn 6 chữ cái của C1, nên thêm hai chữ Q và P sau X, Y, Z, W, V, U.
  - **Vòng 1** dùng 16 mục giống nhau cho mọi cấu hình: A01, A04, A05, A07, A11, A13, A15, A30, B05, B09, B10, B12, B16, B18, B19, B20. Đủ 85 clip của mọi cấu hình đã có sẵn, nên vòng 2 không phải chờ sinh.
- **Bản chuẩn hoá `n`** lấy cột "Bản đọc mong đợi": gạch nối đổi thành dấu cách, "linh" đổi thành "lẻ", "nghìn" đổi thành "ngàn" (A18n, A21n, A24n). Chưa viết bộ chuẩn hoá. **A03** tách tại ô trống: nửa đầu "…và…", nửa sau "để sống.", quãng ngừng 0,80 s ở cả 8 cấu hình. **Âm lượng:** cân về RMS phần có tiếng -20 dBFS, đỉnh tối đa -1 dBFS; gain thực tế -5,8 tới +3,6 dB. **Metadata:** đặt ngày giờ trong m4a về 0, chỉ giữ thông tin gapless `iTunSMPB`.

**Đo trên máy Duy** (lượt sinh 680 clip)

| Mục | Kết quả |
| --- | --- |
| Tổng audio | 1.834,9 s (30,6 phút), 8 cấu hình × 85 clip |
| Thời gian model sinh | 340,3 s, **RTF 0,185** (nhanh gấp khoảng 5,4 lần thời gian thật); từng cấu hình 0,174–0,201 |
| Thời gian chạy cả lượt | 6 phút 14 s, gồm mã hoá, ghép file và trang nghe; nạp model 2,2 s |
| Luồng ONNX | 5 (mặc định của SDK: nửa số nhân, tối đa 8). Đổi 1, 2 hay 5 luồng đều ra đúng PCM, nhanh chậm khác nhau không nhiều |
| RAM đỉnh | 1,1 GB khi sinh một câu; 2,5 GB ở cuối lượt 680 clip |
| Cỡ model / môi trường | 608,6 MB / 767 MB |
| Khoảng lặng đầu clip | trung vị 0,065 s, từ 0 tới 0,72 s |
| Khoảng lặng cuối clip | trung vị 0,178 s, từ 0 tới 0,58 s. Ngắn hơn Kokoro EN nhiều (0,33 s đầu, 0,47 s cuối) |

**Kiểm theo tiêu chí** (đã chạy script, số dán dưới đây)
- Đủ clip: mỗi thư mục X, Y, Z, W, V, U, Q, P có 85 file. Không clip nào dưới 0,3 s (ngắn nhất 0,32 s). Không clip nào chỉ có khoảng lặng (đỉnh thấp nhất trước khi cân âm lượng là 0,241). `afinfo` cả 680 clip: `aac`, 1 kênh, 48.000 Hz, bitrate 62.979–65.152 bit/s.
- Ẩn tên: quét tên file, nội dung và bytes của cả 816 file trong thư mục nghe (680 clip, 48 file ghép và `.txt`, 86 playlist, `index.html`, `items.json`). Danh sách tìm gồm tên và bí danh của cả 25 giọng (có dấu, bỏ dấu, có gạch dưới), "vieneu", "pnnbao", "turbo", "onnx", "moss", tên phong cách và hai mã commit. Kết quả: **0** chỗ trùng.
- Mốc giây: kiểm ngẫu nhiên 3 mục bằng tương quan tín hiệu. `Y-cau` A15: `.txt` ghi 55,51 s, tìm thấy ở 55,514 s. `U-tu` B29n: 57,86 s, tìm thấy ở 57,860 s. `Y-vong1` B10: 38,60 s, tìm thấy ở 38,600 s. Tổng độ dài file khớp dòng "tổng" trong `.txt` tới 0,01 s.
- Mạng: chạy `synth` và `listening.py` với một wrapper chặn `socket.connect`, `create_connection`, `getaddrinfo`. Cả hai exit 0, **0 lần gọi mạng**. Chỉ lệnh `fetch` dùng mạng.
- `git status --porcelain -uall`: 0 file `.m4a`, `.wav`, `.onnx`, `.data`, `.npz`, `.safetensors`, `.models/` hay `.venv/`. `.venv` bị `tools/content-cli/tts-vi/.gitignore` loại; `.models/vieneu` bị `.gitignore` gốc loại (dòng `tools/content-cli/.models/`).
- Trang nghe: đã mở thử qua server cục bộ. Có 85 dòng; bật vòng 1 còn 16 dòng; nút phát và "lần lượt" chạy đúng.

**Lỗi kỹ thuật thấy được qua số đo** (dev không nghe được; người chấm nghe kỹ các clip này; chi tiết trong `summary.json` ở thư mục khoá)
- **Có thể bị cắt cụt hoặc có tiếng lạ ở cuối** (40 ms cuối vẫn to hơn -30 dB): X-B30, Y-B27, W-B05, V-B05, V-B27, U-B06, U-B23n. Toàn là từ mượn hoặc cụm ngắn. Nghi do SDK giới hạn số khung hình theo độ dài phiên âm, để chặn "đọc thừa" ở câu ngắn.
- **Engine tự sinh lại** vì nghi đọc thừa ở cụm ≤ 3 tiếng (SDK có sẵn cơ chế, chọn bản tốt nhất trong tối đa vài lần): Y-B10, Z-B13, Z-B16, Z-B18, Z-B26, V-B09c, V-B10, V-B22, V-B22c, U-B10, Q-B26, P-B02. Riêng "Cơm" (B10) bị ở 3 cấu hình. Đây là dấu hiệu từ đơn khó với model, đúng chỗ B18 #3 lo.
- **Ngắt giữa câu dài hơn 0,8 s:** V-A07 1,18 s (sau "Tuyệt!"), Q-A30 0,86 s, W-A21n 0,84 s, V-A29 0,82 s.
- **Không có khoảng lặng đầu** (có tiếng ngay từ 0 ms): P ở 71/85 clip, Y ở 21/85. Nghe xem âm đầu có bị mất không.
- **Nền ồn ở chỗ ngắt:** V khoảng -57 dB, P khoảng -65 dB; các cấu hình khác từ -81 dB trở xuống. Có thể nghe thấy tiếng xì khi bật to.
- **Dài bất thường so với số tiếng:** W-A24 và Q-A24 (bản thô có "1835", tự đọc thành chữ nên dài là đúng), W-B05, V-B05 ("vitamin" kéo 1,1–1,8 s), Y-B27, W-B27, V-B27 ("carbohydrate"). Số tiếng chữ ở đây đếm "vitamin" là 1 tiếng, nên chỉ coi là gợi ý chỗ cần nghe.
- 4 clip chạm trần đỉnh nên nhỏ hơn mức chung một chút: Z-A17n, Z-A25, Z-B19, W-B05.
- Không crash, không clip rỗng.

**Chạy trên VPS Linux được không** (Duy hỏi; chỉ đọc tài liệu và kiểm gói, chưa dựng VPS)
- **Linux x86_64, chỉ CPU: được.** `vieneu` là Python thuần. Mọi gói có phần biên dịch đều có wheel `manylinux_2_28` x86_64 cho Python 3.12, nên không phải build: `onnxruntime` 1.24.4, `sea-g2p` 0.9.1 (Rust), `tokenizers`, `kaldi-native-fbank`, `soxr`, `soundfile` (kèm sẵn libsndfile), `numpy`, `numba`/`llvmlite`. Đã kiểm bằng `uv pip compile --python-platform x86_64-manylinux_2_28 --python-version 3.12 --only-binary :all:` trên đúng bộ gói đã khoá. Cần glibc ≥ 2.28 (Ubuntu 20.04, Debian 11 trở lên). Upstream có `docker/Dockerfile.cpu` dựa trên `python:3.12-slim-bookworm`.
- **Không cần GPU.** Đường CPU qua ONNX là mặc định và không cần torch. GPU chỉ để chạy nhanh hơn (upstream đo RTF khoảng 0,02 khi gộp lô trên RTX 3060).
- **RAM và đĩa:** tài liệu không ghi mức tối thiểu. Theo số đo trên Mac: RAM tối thiểu 2 GB, nên có 4 GB (lượt dài lên 2,5 GB). Đĩa cần khoảng 2 GB trống: model 0,6 GB, môi trường khoảng 0,8 GB, cộng cache `uv`.
- **Tốc độ trên 2–4 vCPU:** tài liệu không đo trên VPS. Số gần nhất của upstream (`docs/streaming.md`): Intel Core i5 thế hệ 12 với 6 nhân P, fp32, RTF 0,55–0,62. Tài liệu cũng ghi máy 2–4 nhân có thể RTF > 1 khi phát trực tiếp. Bản int8 nhanh hơn khoảng 1,6 lần nhưng cần CPU có VNNI (Intel từ Cascade Lake, AMD Zen 4); CPU không có VNNI thì int8 ra tiếng lảm nhảm. **Ước lượng của dev, chưa đo:** fp32 trên 4 vCPU RTF khoảng 1–1,5, trên 2 vCPU khoảng 2–3. Mỗi bài có khoảng 4–5 phút audio VI, nên VPS mất 5–15 phút một bài, máy Mac M4 mất khoảng 1 phút. Sinh offline có cache thì RTF > 1 vẫn dùng được.
- **Cùng model và tham số, arm64 với x86 có ra cùng clip không:**
  - Đo trên Mac: cố định seed thì PCM giống từng bit giữa các lần chạy và khi đổi 1, 2, 5 luồng. Không cố định seed thì mỗi lần ra một clip khác, khác cả độ dài (1,76 s so với 1,84 s cho cùng một câu).
  - Giữa arm64 và x86: chưa đo được, tài liệu không nói. Dev dự đoán là **khác**. Nhân tính của ONNX Runtime dùng lệnh SIMD khác nhau trên hai kiến trúc (NEON với AVX2/AVX-512), nên số thực lệch ở vài bit cuối. Engine lấy mẫu từng khung theo xác suất, nên chỉ cần lệch một token là phần sau của clip đổi hẳn: ngữ điệu khác, độ dài khác, không chỉ khác nhiễu. Ngoài ra Linux không có `afconvert`, phải mã hoá bằng `ffmpeg`, nên bytes chắc chắn khác.
  - **Hệ quả cho cache theo hash (đề xuất cho SK-024):**
    - Khoá cache tính theo đầu vào, như SK-014: chữ đã chuẩn hoá, giọng, commit model, bản `vieneu` và `onnxruntime`, độ chính xác (fp32/int8), seed, tham số lấy mẫu, tham số mã hoá.
    - Clip đã sinh là bản gốc: `audio.vi` là sha256 của bytes clip đó. Đừng trông chờ sinh lại ra cùng hash.
    - Clip Duy đã nghe duyệt thì giữ nguyên, không sinh lại. Sinh lại có thể ra một cách đọc khác, kể cả một lỗi mới.
    - Chọn một máy sinh chính (Mac của Duy). Sao lưu `content/.audio/`, hoặc đưa lên Storage cùng lúc publish.
    - Ghi thêm nền tảng (`darwin-arm64`) vào `index.json` để truy vết.

**Đề xuất cho SK-024** (chưa làm)
1. Dùng lại `vieneu_vi.generate` / `encode_m4a` qua tiến trình con: CLI Node gửi JSONL, Python trả JSONL (lệnh `batch` đã có), như cách Kokoro tách engine.
2. Xoá ngày giờ trong m4a đã làm ở đây (`strip_m4a_times`, khoảng 30 dòng). Đem sang EN thì giải quyết luôn đề xuất 1 của SK-014.
3. Cân âm lượng cả EN và VI về cùng mức, để clip EN và VI phát nối nhau không chênh. Trước khi cân, clip VI chênh nhau tới khoảng 9 dB (gain phải bù từ -5,8 tới +3,6 dB).
4. Khoảng lặng cuối clip VI ngắn (trung vị 0,18 s). Khi app phát nối EN rồi VI ở chế độ "Cả hai" có thể cần chèn thêm quãng nghỉ.
5. Bộ chuẩn hoá VI lấy "Ghi chú cho dev: luật đọc" và các cặp A18–A28, B23–B30 làm unit test, như content-editor đề xuất.

**Còn chưa chắc**
- Dev không nghe được audio. Mọi nhận xét trên chỉ dựa vào số đo.
- Bộ câu đang ở trạng thái "nháp do AI soạn, chưa duyệt". Nếu biên tập sửa chữ thì chạy lại `listening.py` vào cùng thư mục: chỉ clip có chữ đổi mới bị sinh lại, chữ cái của các giọng giữ nguyên.
- Lượt thử trước (10 câu bài 1, mã X1–X8, xáo khác) đã chuyển sang `scratchpad/archive/bai1-fallback-10cau/` và không còn dùng. Thư mục đó có khoá riêng, người chấm đừng mở.

## Chấm bằng máy (dev, 31/10)

> **Đây là điểm do máy chấm, chưa có người nghe.** Duy nhờ chọn giúp ("tự chọn voice tốt nhất giúp t"), nhưng không agent nào nghe được audio. Mọi số dưới đây đến từ máy nhận dạng giọng nói (ASR) và các phép đo tín hiệu. Whisper có thể tự "sửa" một chữ đọc sai thành chữ đúng, nên các số chỉ dùng để so các giọng với nhau, không phải điểm tuyệt đối. Chạy xong lúc 0 giờ 13 ngày 01/11.

**Kết quả**

| Hạng | Giọng | Giới | Mã mù | Điểm |
| --- | --- | --- | --- | --- |
| **1** | **Đức Trí** | nam | Q | 0,843 |
| **2** | **Kim Thanh** | nữ | W | 0,837 |
| 3 | Mỹ Duyên | nữ | V | 0,791 |

- Hai giọng đầu gần như ngang nhau: cách nhau 0,006 điểm, tương đương khoảng hai lỗi chữ trong 17 câu bài 1. Lấy mẫu lại các mục 2.000 lần (bootstrap): Đức Trí đứng đầu 68 % số lần, Kim Thanh 32 %; cả hai cùng nằm trong top 2 ở 99,8 % số lần.
- **Đề xuất:**
  - Chọn một trong hai giọng này, nhờ Duy nghe nhanh để chốt.
  - Máy nghiêng nhẹ về **Đức Trí**, chủ yếu vì ngữ điệu thay đổi nhiều hơn (F0 3,7 so với 3,5 nửa cung) và không có clip nào cụt cuối. Từ đơn của hai giọng sai ngang nhau (11,8 %).
  - Kim Thanh đúng chữ hơn một chút ở câu bài 1 (1,1 % so với 1,6 % âm tiết sai). Kim Thanh là giọng nữ như giọng EN `af_heart`, nên chế độ "Cả hai" sẽ nghe liền mạch hơn. Đây là tiêu chí máy không đo.
- **File nghe nhanh** (2 phút, có đọc tên giọng): `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/tts-vi-eval/nghe-nhanh-duc-tri-kim-thanh.m4a`. Mốc giây ở file `.txt` cùng tên. Phần 1: mỗi giọng tự giới thiệu rồi đọc 6 câu bài 1 (A01, A04, A05, A07, A13, A15). Phần 2: từng câu, Đức Trí đọc trước, Kim Thanh đọc sau.

**Bảng 8 giọng** (khoá được mở sau khi đã có bảng xếp hạng)

| Hạng | Mã | Giọng | Giới | Tổng | Đúng chữ (50 %) | SER a | SER b | SER d | Lỗi thanh a+b | CER a có dấu / bỏ dấu | Âm tiết đầu sai | Kỹ thuật (20 %) | cụt cuối / sinh lại / ngắt > 0,8 s / không lặng đầu | Nền ồn dB | Tốc độ (15 %) | tiếng/s (p10–p90) | Ngữ điệu (15 %) | F0 SD (nửa cung) | Bị loại |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Q | Đức Trí | nam | **0,843** | 0,91 | 1,6 % | 11,8 % | 2,2 % | 2,1 % | 1,4 / 1,3 % | 7,1 % | 0,90 | 0 / 1 / 1 / 0 | -94 | 1,00 | 3,08 (2,80–3,72) | 0,41 | 3,73 | – |
| 2 | W | Kim Thanh | nữ | **0,837** | 0,91 | 1,1 % | 11,8 % | 2,2 % | 2,1 % | 1,1 / 0,9 % | 7,1 % | 0,89 | 1 / 0 / 1 / 0 | -95 | 1,00 | 3,19 (2,78–3,56) | 0,35 | 3,50 | – |
| 3 | V | Mỹ Duyên | nữ | **0,791** | 0,95 | 1,6 % | 5,9 % | 0,0 % | 1,3 % | 1,4 / 1,2 % | 7,1 % | 0,59 | 2 / 4 / 2 / 0 | -57 | 1,00 | 3,27 (2,84–3,85) | 0,34 | 3,44 | – |
| 4 | Y | Thục Đoan | nữ | **0,741** | 0,81 | 7,0 % | 13,7 % | 13,0 % | 3,4 % | 3,6 / 3,1 % | 23,5 % | 0,70 | 1 / 1 / 0 / 21 | -80 | 0,98 | 3,82 (3,32–4,42) | 0,34 | 3,40 | – |
| 5 | X | Adam | nam | **0,680** | 0,86 | 3,7 % | 15,7 % | 2,2 % | 3,8 % | 1,3 / 0,9 % | 11,8 % | 0,92 | 1 / 0 / 0 / 0 | -97 | 0,09 | 4,53 (4,15–4,89) | 0,37 | 3,56 | – |
| 6 | U | Thùy Dung | nữ | **0,579** | 0,68 | 7,5 % | 33,3 % | 13,0 % | 3,4 % | 4,4 / 4,2 % | 23,5 % | 0,84 | 2 / 1 / 0 / 0 | -83 | 0,00 | 4,90 (4,21–5,84) | 0,46 | 3,57 | E2 |
| 7 | P | Thái Sơn | nam | **0,567** | 0,58 | 9,6 % | 47,1 % | 10,9 % | 4,6 % | 6,3 / 6,0 % | 43,5 % | 0,25 | 0 / 1 / 0 / 71 | -65 | 1,00 | 3,78 (3,40–4,23) | 0,52 | 4,23 | E2 |
| 8 | Z | Minh Triết | nam | **0,540** | 0,68 | 10,7 % | 29,4 % | 8,7 % | 0,4 % | 5,9 / 5,3 % | 22,4 % | 0,88 | 0 / 4 / 0 / 0 | -81 | 0,00 | 4,68 (4,24–5,26) | 0,18 | 2,75 | E2 |

Ký hiệu: SER là tỉ lệ âm tiết sai. Nhóm a là 17 câu bài 1 (A01–A17), thứ sẽ ship. Nhóm b là từ đơn và cụm ngắn tiếng Việt (B01–B22 trừ B05, cộng B09c, B21c, B22c). Nhóm d là A29, A30. Nhóm c là số, đơn vị, từ mượn, tên riêng, công thức (A18–A28, B05, B23–B30, mọi bản `n`). Nhóm c chỉ để tham khảo: SER c từ 4,6 % (Đức Trí, Kim Thanh) tới 10,5 %; trên các bản `n` có số và đơn vị, 7/8 giọng sai không quá 2,4 % (riêng Thùy Dung 8,1 %).

**Cách chấm**
- **ASR:**
  - Dùng `mobiuslabsgmbh/faster-whisper-large-v3-turbo` (snapshot `0a363e91…`, có sẵn trong cache trên máy; không tải model nào mới), float32, `language="vi"`, beam 5, **không** `initial_prompt`.
  - Whisper hay "bịa" câu kiểu cuối video YouTube với clip một từ: "Cơm" thành "Hãy subscribe cho kênh…". Vì vậy các clip của mỗi giọng được ghép thành 16 cửa sổ khoảng 26 s, cách nhau 1 s lặng, có 0,5 s lặng ở đầu. Mọi giọng dùng cùng cách chia mục vào cửa sổ.
  - Cửa sổ nào ra câu bịa thì tách đôi và chạy lại. Lần chạy này không clip nào phải chạy riêng lẻ hay bị bỏ.
  - Chữ nhận được chia lại về từng clip bằng cách căn cả cửa sổ với chữ mong đợi, vì mốc thời gian từng từ lệch được tới nửa giây.
- **So chữ:** chuẩn hoá NFC, chữ thường, bỏ dấu câu. Số, đơn vị, phân số viết thành chữ ở cả hai phía. Từ mượn phiên âm gộp về một dạng ("vi-ta-min" = "vitamin"). Kiểu bỏ dấu cũ và mới tính như nhau ("khoẻ" = "khỏe").
- **Nét miền Nam không tính là lỗi** (C2 và quyết định 6): hỏi = ngã, tr = ch, s = x, d = gi = v, n = ng = nh cuối, t = c = ch cuối, lẻ = linh, ngàn = nghìn, tư = bốn. Bảng có ghi thêm SER chặt (không bỏ qua nét miền) trong file CSV. Câu bài 1 của Đức Trí: SER chặt 2,1 %, SER có bỏ qua nét miền 1,6 %.
- **Kỹ thuật:** lấy từ `metrics.jsonl` của lượt sinh.
  - 60 % là lỗi trên từng clip. Trọng số: cụt cuối 1, engine phải sinh lại 0,5, ngắt > 0,8 s 0,5, không có lặng đầu 0,25. Đạt 0 điểm khi tổng lỗi bằng 20 % số clip.
  - 20 % là nền ồn: -50 dB được 0, -80 dB trở xuống được 1.
  - 20 % là độ ổn định: lệch âm lượng gốc giữa các clip, tính 0 khi tới 4 dB; và hệ số biến thiên tốc độ giữa các câu, tính 0 khi tới 0,3.
- **Tốc độ:** trung vị số tiếng/giây trên 18 câu (nhóm a và d, trừ A03). Được 1 trong khoảng 3,0–3,8; giảm về 0,5 ở 4,2 và về 0 ở 4,6; phía chậm giảm về 0,5 ở 2,6.
- **Ngữ điệu:** F0 đo bằng `librosa.pyin`.
  - 70 % là độ lệch chuẩn F0 trong câu, tính bằng nửa cung: 2 được 0, 5 được 1.
  - 30 % là mức lên giọng ở 20 % cuối câu hỏi so với câu kể: 2 nửa cung trở lên được 1.
  - Gần như mọi giọng không lên giọng cuối câu hỏi (−0,6 đến +0,6 nửa cung). Ở tiếng Việt điều này không hẳn là lỗi, vì câu hỏi đã có từ hỏi ("gì", "nào", "không").
- **Trọng số:**
  - Tổng: đúng chữ 50 %, kỹ thuật 20 %, tốc độ 15 %, ngữ điệu 15 %, theo gợi ý.
  - Trong phần đúng chữ: nhóm a 60 %, nhóm b 30 %, nhóm d 10 %, nhóm c 0 %. Điểm nhóm = 1 − SER/0,5.
- **Luật loại** (thay cho C6, vì C6 dựa vào điểm người chấm; ngưỡng đặt trước khi xem kết quả):
  - E1: lỗi thanh ở nhóm a+b trên 8 %. Không giọng nào bị.
  - **E2: SER từ đơn (nhóm b) trên 25 %. Loại Thùy Dung, Thái Sơn, Minh Triết.**
  - E3: SER trên bản `n` có số và đơn vị trên 20 %. Không giọng nào bị.
  - E4: hơn 3 clip cụt cuối (thay cho "lỗi R ở hơn ba mục"). Không giọng nào bị.
  - Luật nào loại cả 8 giọng thì coi là lỗi chung, không áp. Lần này không có trường hợp đó.
- **Độ vững:** tăng hoặc giảm 10 điểm phần trăm ở từng trọng số (8 phương án, các trọng số còn lại co giãn theo tỉ lệ). Thứ tự 3 giọng đầu không đổi ở cả 8 phương án: Đức Trí, Kim Thanh, Mỹ Duyên.
- **Vì sao các giọng khác thấp hơn:**
  - Mỹ Duyên đúng chữ nhất (0,95), nhưng nền ồn -57 dB (có tiếng xì ở chỗ ngắt), 4 clip phải sinh lại, 2 clip cụt cuối.
  - Adam đọc 4,5 tiếng/giây, quá nhanh cho bé 7–9.
  - Thục Đoan có 21 clip không có lặng đầu và 23,5 % clip sai âm tiết đầu.
  - Thái Sơn sai âm tiết đầu ở 43,5 % clip: "Em kể" thành "anh kể", "năng lượng" thành "ăn lượng", "khoẻ mạnh" thành "phẻ mạnh", "Chuối" thành "cúi", và mất hẳn chữ "Tuyệt!" ở A07. Đây gần như chắc là clip bị **mất phụ âm đầu**, khớp với 71/85 clip không có lặng đầu.

**Lỗi của giọng số 1 (Đức Trí) theo mã mục** (ASR nghe ra; các mục có dấu * là lỗi chung của mọi giọng, xem mục sau)
- Câu bài 1:
  - A04: "**Cây** dùng ánh nắng…" nghe thành "**Tôi** dùng…". Âm tiết đầu câu, cần nghe kiểm.
  - A08*: "giàu" thành "dầu".
  - A11*: "trầy" thành "chảy".
- Từ đơn:
  - **B03** "chất đạm" nghe thành "chất đàm" (thanh nặng ra huyền), cần nghe kiểm.
  - B19*: dãy sáu thanh.
- Câu khác: A29* "thìa" thành "thề".
- Nhóm c (tham khảo):
  - A22: bản thô đọc "ba **trên** bốn"; bản `n` đúng.
  - A24: "đến" nghe thành "đếm"; "Galápagos" thành "Galapigos".
  - A24n, A26n, B26n, B27n: tên riêng và từ mượn đọc theo kiểu phiên âm, ASR viết lại khác.
  - B05n: "vi ta min" ra "vita min". B23, B24: "oxy", "CO₂" bị ghép lẫn.
- Kỹ thuật:
  - A30: một chỗ ngắt 0,86 s trong câu dài.
  - B26 "protein": engine phải tự sinh lại.
  - Không có clip cụt cuối, không thiếu lặng đầu; nền ồn -94 dB.
- Tốc độ: 3,08 tiếng/giây, ở mép chậm của khoảng 3,0–3,8. 10 % số câu chậm hơn 2,8 tiếng/giây.

(Để so: Kim Thanh sai ở A08*, A11*, A29*, B19* như mọi giọng; riêng của Kim Thanh là **B16** "Kẹo" nghe thành "keo" (thanh nặng ra ngang), B05 "vitamin" cụt cuối, A21n một chỗ ngắt 0,84 s, B30 "câu" thành "cầu".)

**Mục mọi giọng đều sai** (≥ 7/8 giọng; sửa ở chữ hoặc ở bộ chuẩn hoá, không phải lỗi của một giọng)

| Mục | Mong đợi | Máy nghe ra | Hướng xử lý (đề xuất, PM/biên tập quyết) |
| --- | --- | --- | --- |
| A22 (bản thô, 8/8) | "3/4" → ba phần tư | "ba trên bốn" (`sea-g2p` đọc "/" thành "trên") | Bộ chuẩn hoá SK-024 viết phân số thành chữ, hoặc biên tập viết chữ theo quy tắc D. Bản `n` thì đúng |
| A11 (8/8) | trầy | chạy / chày / chảy | Có thể giọng Nam đọc "ây" gần "ay" mà ASR không phân biệt được. Cần người nghe; nếu đúng là đọc lệch thì cân nhắc đổi từ ("trầy" thành "trầy xước") |
| A08 (7/8) | giàu | dầu | gi đọc như d là nét giọng Nam, nhưng ASR nghe ra vần "âu". Cần người nghe |
| A29 (7/8) | thìa | thề / thì / thịa | "thìa" là từ miền Bắc (miền Nam nói "muỗng"); engine đọc vần "ia" không rõ. Liên quan câu hỏi mở về giọng Nam với từ ngữ Bắc |
| A27n (8/8) | Nòng nọc | Nồng / Nông / Đồng nọc | Cần người nghe; có thể do vần "ong" của giọng Nam |
| B19 (8/8) | la, là, lá, lả, lã, lạ | "lạ lạ lạ…", "lá lá…" | ASR không chép được dãy sáu thanh vô nghĩa. Mục này **chỉ người chấm được** |
| A24n, A26n, B26n, B28n (7–8/8) | Sác lơ Đác uyn, prô tê in, các bô hi đrát, Ai dắc Niu tơn | ASR viết thành chữ lạ ("Sarkler", "perotein", "Ajax Newton") | Quy tắc D: không đưa tên và từ tiếng Anh vào chữ VI. Nếu bắt buộc phải có thì cần người nghe duyệt bảng phiên âm |

**Chưa chắc**
- Đức Trí và Kim Thanh gần như hoà. Thứ tự giữa hai giọng tuỳ trọng số ngữ điệu và vài từ đơn ASR nghe ra. **Nên để Duy nghe 2 phút rồi chốt.**
- ASR được huấn luyện thiên về giọng chuẩn, nên có thể chấm thiệt cho nét miền Nam mà luật bỏ qua ở trên chưa bao hết.
- Các ngưỡng loại và thang điểm do dev đặt, không phải chuẩn có sẵn. Ngưỡng đặt trước khi xem kết quả. Hai giọng đầu không bị luật nào chạm tới, nên đổi ngưỡng cũng không đổi kết luận.
- Không đo được độ "ấm", "hợp tai trẻ" (tiêu chí 5) và độ rõ trên loa điện thoại (tiêu chí 7).
- Giới tính mỗi giọng lấy theo SDK và khớp F0 đo được: Đức Trí 100 Hz, Kim Thanh 227 Hz.

**File**
- Script: `tools/content-cli/tts-vi/evaluate.py`. Môi trường chấm riêng `.venv-eval`, thuộc nhóm `[dependency-groups] eval`; môi trường sinh không đổi.
  - Gói: faster-whisper 1.2.1 (MIT), librosa 0.11.0. Không dùng parselmouth vì GPL.
  - SK-024 dùng lại được làm bước tự kiểm mọi clip VI.
- Kết quả: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/tts-vi-eval/`
  - `result.json`: bảng, luật loại, độ vững, lỗi chung.
  - `configs.csv`: một dòng mỗi giọng.
  - `clips.csv`: 680 dòng, có chữ ASR, chữ mong đợi, phép sửa, số đo.
  - `transcripts.json`: bản chép lời gốc.
  - File nghe nhanh `.m4a` và `.txt`.
- Thời gian: cả lượt mất 18 phút trên M4, trong đó ASR khoảng 2 phút mỗi giọng; chấm lại từ bản chép lời đã lưu mất khoảng 1 phút.

## Kết quả chấm (Duy)

Duy không tự chấm. Ngày 1/11, Duy nhờ phiên chính chọn ("tự chọn voice tốt nhất giúp t"), nên giọng được chọn theo bảng "Chấm bằng máy" ở trên, chưa có người nghe.

**Chọn: Kim Thanh (W), giọng nữ miền Nam.** Dự phòng: Đức Trí (Q).

Hai giọng gần như hoà về tổng điểm (0,837 và 0,843). Phiên chính chọn Kim Thanh vì:
- **Đúng chữ ở câu bài 1 hơn,** tức đúng phần sẽ phát cho bé: sai 1,1 % âm tiết, Đức Trí 1,6 %.
  - Lỗi của Kim Thanh ở nhóm bài 1 chỉ là nét giọng Nam mà Đức Trí cũng có: "giàu" nghe ra "dầu" (A08), "trầy" nghe ra "chạy" (A11).
  - Đức Trí có thêm hai lỗi thật ở chữ: "Cây" nghe ra "Tôi" (A04), và "chất đạm" nghe ra "chất đàm" (B03). "chất đạm" là từ vựng chính của bài 1.
- **Cùng giới với giọng EN `af_heart`,** nên chế độ "Cả hai" nghe liền mạch hơn.
- **Lỗi kỹ thuật** duy nhất là 1 clip cụt cuối, nằm ở nhóm số và từ mượn, không thuộc bài 1. Cách xử lý: sinh lại theo bước tự kiểm của SK-024.

Cần để ý ở SK-024:
- **B16:** "kẹo" nghe ra "keo", sai thanh ở một món trong mâm. Bước tự kiểm (`evaluate.py`) phải bắt được; nếu đúng là sai thì sinh lại clip này.
- **Đức Trí hơn ở ngữ điệu** (3,7 so với 3,5 nửa cung). Nếu Duy nghe thấy Kim Thanh đều đều thì đổi sang Đức Trí; sinh lại cả bài 1 chỉ mất khoảng 1 phút.

**Duy nghe và chốt (1/11):** nghe bài 1 đọc bằng Kim Thanh (file nghe duyệt của SK-024), trả lời "ok, chốt giọng này". Giọng VI là **Kim Thanh, tốc độ mặc định** (VieNeu v3 Turbo không có tham số tốc độ). Không đổi sang Đức Trí.

Câu Duy chưa trả lời khi chốt, chuyển sang SK-024: 5 clip máy đánh dấu, cân âm lượng EN/VI và đệm khoảng lặng clip VI, cách đọc số, từ miền Bắc đọc bằng giọng Nam.
