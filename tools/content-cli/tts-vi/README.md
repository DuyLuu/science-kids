# tts-vi: giọng đọc tiếng Việt bằng VieNeu-TTS v3 Turbo

Môi trường Python riêng để sinh audio tiếng Việt cho content-cli ([SK-023](../../../docs/backlog/SK-023-tts-vi-listening-test.md) listening test; [SK-024](../../../docs/backlog/SK-024-content-cli-tts-vi.md) sẽ gọi lại từ `content-cli tts`). Chạy hoàn toàn trên CPU qua ONNX Runtime, không cần GPU, không cần key.

## Phiên bản đã ghim

| Thành phần | Bản | Giấy phép |
| --- | --- | --- |
| Gói `vieneu` (PyPI) | 3.8.3 | Apache-2.0 |
| Model `pnnbao-ump/VieNeu-TTS-v3-Turbo`, thư mục `onnx_update/` (fp32) | commit `61b85e3d937fbbacb387714180e8182823512523` (23/09/2026) | Apache-2.0 |
| Codec `OpenMOSS-Team/MOSS-Audio-Tokenizer-Nano-ONNX` | commit `ceff0d0749bfb3fa2d61149794ec6feef0d1e1ae` (17/04/2026) | Apache-2.0 |
| Python | 3.12 (qua `uv`; máy có 3.15 nhưng không dùng) | |
| onnxruntime, huggingface-hub, sea-g2p, tokenizers, numpy… | theo `uv.lock` upstream của vieneu 3.8.3 (`constraint-dependencies` trong `pyproject.toml`) | |

Mọi phiên bản Python nằm trong `uv.lock`. Không dùng onnxruntime mới hơn 1.24.4: bản 1.31 từ chối file `.data` của model khi đọc qua symlink của cache Hugging Face ("External data path escapes model directory").

## Dựng lại từ đầu

Cần: `uv` (đã có ở `~/.local/bin/uv`), macOS (`afconvert`, `afinfo` có sẵn).

```sh
cd tools/content-cli/tts-vi
uv sync                               # tạo .venv/ Python 3.12 (khoảng 770 MB, gitignore)
uv run python vieneu_vi.py fetch      # tải model đã ghim (608,6 MB), kiểm sha256 theo model-files.json
```

`fetch` là lệnh **duy nhất** dùng mạng. Model nằm ở `tools/content-cli/.models/vieneu/hf/` (đã gitignore, cạnh model Kokoro). Mọi lệnh khác chạy với `HF_HUB_OFFLINE=1`; script chặn mọi repo Hugging Face không có trong danh sách ghim.

Các file được tải (URL dạng `https://huggingface.co/<repo>/resolve/<commit>/<file>`), kích thước và sha256 ghi trong `model-files.json`:

- `pnnbao-ump/VieNeu-TTS-v3-Turbo`: `config.json`, `denoiser.onnx` (42,7 MB, SDK luôn nạp), `onnx_update/{config.json, tokenizer.json, vieneu_prefill.onnx, vieneu_decode_step.onnx, vieneu_acoustic_cached.onnx, vieneu_backbone_shared.data (415,3 MB), vieneu_v3_heads.npz (52,2 MB)}`
- `OpenMOSS-Team/MOSS-Audio-Tokenizer-Nano-ONNX`: `codec_browser_onnx_meta.json`, `moss_audio_tokenizer_decode_{full,step}.onnx`, `moss_audio_tokenizer_decode_shared.data` (44,2 MB), `moss_audio_tokenizer_encode.{onnx,data}` (44,5 MB)

## Dùng

```sh
uv run python vieneu_vi.py voices --region Nam          # giọng miền Nam (8), kèm giới tính, phong cách
uv run python vieneu_vi.py synth --voice "Adam" --text "Chất bột đường cho ta năng lượng." --out /tmp/x.m4a
uv run python vieneu_vi.py batch --jobs jobs.jsonl --results results.jsonl   # {"text","voice","out"} mỗi dòng

# Mẫu nghe mù SK-023 theo listening-set.md mục C1 (8 giọng miền Nam x 85 clip, khoảng 6 phút trên M4)
uv run python listening.py --set ../../../content/tts-vi/listening-set.md \
    --out <thư mục nghe> --key <thư mục khoá, nằm ngoài thư mục nghe>
```

Mỗi clip: VieNeu (48 kHz, float) → WAV 16-bit → `afconvert -f m4af -d aac -c 1 -b 64000 -s 0 -q 127` (cùng tham số EN, SK-014 quyết định 10), giữ 48 kHz, rồi xoá ngày giờ trong m4a (`mvhd`/`tkhd`/`mdhd`), nên cùng PCM luôn ra cùng bytes. `listening.py` còn cân âm lượng (RMS phần có tiếng -20 dBFS, đỉnh tối đa -1 dBFS) trước khi mã hoá; `synth`/`batch` thì chưa.

`listening.py` chạy lại vào cùng thư mục thì giữ chữ cái của từng giọng, dùng lại clip đã có và chỉ kiểm lại; `--force` sinh lại tất cả.

## Chấm bằng máy (`evaluate.py`)

Chấm clip bằng số đo, khi chưa có người nghe. SK-024 dùng lại làm bước tự kiểm. Chạy trong môi trường riêng `.venv-eval` (nhóm phụ thuộc `eval`: faster-whisper 1.2.1, librosa), không đụng môi trường sinh:

```sh
UV_PROJECT_ENVIRONMENT=.venv-eval uv sync --only-group eval
HF_HUB_OFFLINE=1 UV_PROJECT_ENVIRONMENT=.venv-eval uv run --only-group eval python evaluate.py \
    --set ../../../content/tts-vi/listening-set.md --clips <thư mục nghe> \
    --metrics <thư mục khoá>/metrics.jsonl --out <thư mục kết quả>
```

- ASR: `mobiuslabsgmbh/faster-whisper-large-v3-turbo`, đọc từ cache Hugging Face sẵn trên máy (`~/.cache/huggingface/hub`, snapshot ghim trong script). Script không tải model.
- Đo: âm tiết sai so với "bản đọc mong đợi" (bỏ qua nét giọng Nam), lỗi thanh, CER có dấu và bỏ dấu, lỗi kỹ thuật, số tiếng/giây, độ biến thiên F0. Kết quả ra `result.json`, `configs.csv`, `clips.csv`, `transcripts.json`.
- Bản chép lời được lưu lại, nên chạy lại chỉ chấm lại (khoảng 1 phút); ASR 85 clip mất khoảng 2 phút.
- Không đọc tên giọng, chỉ làm việc với chữ cái mù.

## Những điều cần biết

- **Lấy mẫu ngẫu nhiên.** Engine chọn token theo xác suất (temperature 0,8, top-k 25, top-p 0,95). Không cố định seed thì mỗi lần sinh ra một clip khác (khác cả độ dài). Script đặt `numpy` seed = 4 byte đầu của sha256(`giọng` + xuống dòng + `chữ`). Cùng seed, cùng máy: PCM giống từng bit, kể cả khi đổi số luồng (đã thử 1, 2, 5).
- **Không có tham số tốc độ** ở v3 Turbo (chỉ bản Nano có `speed`). `style` cũng bị bỏ qua: giọng quyết định cách đọc.
- **Watermark:** SDK mặc định `apply_watermark=True` nhưng chỉ có tác dụng khi cài `resemble-perth` (extra `[watermark]`, không cài). Script truyền `apply_watermark=False`.
- **Chuẩn hoá chữ:** `sea-g2p` tự chuẩn hoá số và ký hiệu bên trong SDK. Pipeline của mình (SK-024) vẫn nên viết số thành chữ trước, để chữ được băm đúng là chữ được đọc.
- **Tài nguyên** (Mac M4, 5 luồng ONNX mặc định): nạp model 1–2 s; RTF khoảng 0,19 (nhanh gấp 5 lần thời gian thật); RAM đỉnh 1,1 GB khi sinh một câu, 2,5 GB sau một lượt 680 clip.
- **Linux x86_64 (VPS) chưa chạy thử.** Mọi gói trong `uv.lock` đều có wheel `manylinux_2_28` x86_64 cho Python 3.12 (đã kiểm bằng `uv pip compile --python-platform x86_64-manylinux_2_28 --only-binary :all:`), nên cài được mà không phải build. Thiếu `afconvert`: trên Linux phải mã hoá AAC bằng `ffmpeg` (xem SK-014 quyết định 9 về độ dài khi giải mã).
- Gói `vieneu` kéo theo `gradio` (giao diện web của tác giả); script không import nó, nhưng nó chiếm chỗ trong `.venv`.
- Xoá cache model: `rm -rf ../.models/vieneu`. Xoá môi trường: `rm -rf .venv`.
