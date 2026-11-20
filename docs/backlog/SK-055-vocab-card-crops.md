# SK-055 · Mục cắt khung cho thẻ từ dùng ảnh vuông hoặc lệch khung (chủ đề đã soạn)

Trạng thái: todo · Ngày: 2026-11-19 · Phụ trách: designer · Tester: tester
Nguồn: SK-053, mục "Rà ảnh (tester 19/11)" B5 và "Ghi chú designer (19/11, lượt 2)"; `tools/content-cli/image-slots.json` (`max_factors.vocab` 1,6, thêm 19/11; Explorer `vocab` 2:1, Discoverer `vocab` 4:3); SK-043 (bảng tỉ lệ khung); SK-048 (*Những nơi sống trên Trái Đất*), SK-045 (*Chuỗi thức ăn*), SK-032, SK-036, SK-039 (Discoverer)

## Mục tiêu

Thẻ từ của các chủ đề đã soạn cho bé thấy trọn con vật hay vật cần nhìn, không bị app cắt mất nửa ảnh. Sau ticket này, `images fetch` và `build` không còn cảnh báo lệch khung ở thẻ từ.

## Bối cảnh

Thẻ từ Explorer là khung 2:1. App lấp khung bằng cách cắt khi ảnh lệch dưới ×2,2 (`PictureFit`). Vì vậy ảnh vuông bị bỏ nửa trên và nửa dưới mà trước đây máy không cảnh báo. Từ SK-053 (19/11), dev thêm ngưỡng riêng `max_factors.vocab` 1,6; ngưỡng này làm lộ ra:
- **27 thẻ từ Explorer dùng ảnh vuông:**
  - *Những nơi sống trên Trái Đất* (`content/images/explorer/noi-song-tren-trai-dat/*.json`): 25;
  - *Chuỗi thức ăn* (`content/images/explorer/chuoi-thuc-an/*.json`): 2;
- **vài thẻ từ Discoverer lệch khung 4:3**, ví dụ:
  - `da-va-dat`: `organic_matter`, `red_soil`;
  - `ho-hap`: `breath`;
  - `khung-long`: `herd`.

Danh sách đầy đủ lấy bằng `images fetch` (dòng "Ảnh lệch khung") trên từng thư mục. *Lớn lên* đã sửa hết trong SK-053 (12 thẻ có mục 2:1 riêng).

## Phạm vi / Ngoài phạm vi

### Phạm vi
- Chạy `node tools/content-cli/src/cli.ts images fetch <thư mục>` cho mọi thư mục `content/images/explorer/*` và `content/images/discoverer/*`. Ghi vào ticket danh sách đầy đủ các khoá `vocab.*` bị báo "Ảnh lệch khung".
- Với mỗi khoá: thêm mục riêng có `crop` đúng tỉ lệ khung của nhóm (Explorer 2:1, Discoverer 4:3) và chép đủ mục (không qua `same_as`), theo cách SK-053 đã làm (`vocab.grow`, `vocab.tadpole`…). Cắt sao cho con vật hay vật chính nằm trọn trong khung, không lộ chữ, logo hay mặt người.
- Khi không cắt được (vd ảnh dọc, cắt 2:1 mất vật chính): chọn ảnh khác cùng giấy phép hợp lệ, hoặc ghi vào ticket để content-editor xem lại `alt`.
- Chỉ sửa file chọn ảnh `content/images/**` (vùng chung designer và content-editor theo nếp SK-033). Không đổi key trong `.md`.

### Ngoài phạm vi
- Đổi ngưỡng `max_factors` hoặc tỉ lệ khung (việc của dev, xem câu hỏi dưới).
- Thẻ từ của chủ đề chưa soạn.
- Các khung khác (lựa chọn, ô Học, kệ Chơi).

## Tiêu chí nghiệm thu
- [ ] Ticket có bảng các khoá bị báo trước khi sửa (thư mục, khoá, tỉ lệ ảnh, độ lệch), khớp lần chạy `images fetch` đầu tiên.
- [ ] `images fetch` trên mọi thư mục `content/images/explorer/*` và `content/images/discoverer/*`: 0 lỗi, **0 dòng "Ảnh lệch khung"** ở khoá `vocab.*`.
- [ ] Mỗi mục cắt mới có `crop`, đúng giấy phép và ghi công như mục gốc; 0 `same_as` trỏ vào mục `same_as`.
- [ ] Tester xem tận mắt ít nhất 10 thẻ đã cắt (có cả Explorer và Discoverer): vật chính nằm trọn, không chữ hay logo lộ ra.
- [ ] `build` lại gói, `check-pack` OK; `validate content` 0 lỗi.
- [ ] Phiên chính chụp màn trang "Từ mới" của một bài *Những nơi sống trên Trái Đất* trên iPhone 16 (một máy, một lượt) và dán vào ticket.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc:**
- SK-053 (ngưỡng `max_factors.vocab` 1,6 đã có).
- Cây làm việc có thay đổi chưa commit ở vài file `content/images/explorer/…` (vd `chuoi-thuc-an/con-vat-kiem-an-the-nao.json`, `sinh-vat-song-o-dau/*.json`). Designer hỏi phiên chính trước khi sửa các file đó.
- Mạng tới Commons, Openverse có thể trả 429. Xem SK-056.

**Câu hỏi còn mở (dev, PM):** ngưỡng 1,6 đang đặt ở `max_factors.vocab` cấp chung nên áp cả Discoverer (khung 4:3). Ý định là chỉ Explorer, hay cả hai nhóm? Nếu chỉ Explorer thì dev chuyển sang `age_groups.explorer.max_factors.vocab`, và phần Discoverer của ticket này chỉ còn những thẻ lệch quá ngưỡng chung. PM đề xuất giữ áp cả hai nhóm: ảnh dọc trong thẻ 4:3 cũng mất vật chính.
