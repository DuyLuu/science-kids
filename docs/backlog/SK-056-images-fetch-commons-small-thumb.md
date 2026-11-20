# SK-056 · `images fetch`: tải bản thumbnail cỡ chuẩn cho ảnh Commons nhỏ để tránh HTTP 429

Trạng thái: todo · Ngày: 2026-11-19 · Phụ trách: dev · Tester: tester
Nguồn: SK-053, mục "Ghi chú designer (19/11)" (chỗ lệch brief 1) và "Ghi chú designer (19/11, lượt 2)" (`q6` bị 429 ba lượt liền); SK-051 mục 11; `tools/content-cli/src/images/sources.ts:69–73` (`COMMONS_THUMB_WIDTH = 1280`), `src/images/fetch.ts:17–19, 269`, `src/images/net.ts:69–76` (throttle và thử lại khi gặp 429/503)

## Mục tiêu

Designer chọn được ảnh Commons tốt nhất dù ảnh gốc nhỏ, và `images fetch` tải được ngay trong một lượt mà không bị `upload.wikimedia.org` chặn bằng HTTP 429.

## Bối cảnh

Hiện `images fetch` xin Commons bản 1280 px (`thumburl`). Commons chỉ cho bản thu nhỏ khi ảnh gốc rộng hơn mức xin. Với ảnh gốc rộng ≤ 1280 px, nó trả thẳng URL bản gốc, và những URL bản gốc này bị 429 lặp lại kể cả khi đã giãn nhịp và thử lại theo Retry-After.

Ở SK-053, hậu quả là:
- designer phải bỏ bốn ảnh tốt nhất: mèo tam thể với đàn con nhiều màu, vịt con trên cỏ, chó ta vàng với đàn con, bàn tay bạn nhỏ thổi bong bóng;
- ảnh `q6` (gốc 1024 px) bị 429 ba lượt liền, khoảng 25 phút sau mới tải được.

## Phạm vi / Ngoài phạm vi

### Phạm vi
- Khi ảnh gốc trên Commons rộng ≤ `COMMONS_THUMB_WIDTH`, xin Commons một bản thumbnail cỡ chuẩn nhỏ hơn bề rộng gốc (designer đề xuất khoảng 960 px). Dev chọn cỡ chuẩn cụ thể nằm trong cache của Wikimedia và ghi lý do vào code và ticket. Nếu Commons vẫn không cho thumbnail, giữ cách cũ (tải gốc, throttle, thử lại).
- Nếu `content/.images/index.json` có ghi kích thước ảnh, ghi kích thước của bản thật đã tải, để `build` và bước kiểm tỉ lệ khung dùng đúng số.
- Test đơn vị với `Http` giả: ảnh gốc 1024 px thì URL được xin là thumbnail, không phải bản gốc; ảnh gốc 3000 px thì vẫn xin 1280 như cũ; ảnh đã có trong cache thì không tải lại.
- Cập nhật `tools/content-cli/README.md` (mục `images fetch`).

### Ngoài phạm vi
- Đổi nguồn ảnh khác (Openverse, Flickr).
- Tải lại ảnh đã có trong cache.
- Đổi ngưỡng tỉ lệ khung (SK-055).

## Tiêu chí nghiệm thu
- [ ] `npm --prefix tools/content-cli test` xanh, có test mới cho ba trường hợp ở "Phạm vi".
- [ ] Thử thật một lượt (một tiến trình, giãn nhịp như hiện tại): `images fetch` một file chọn ảnh tạm, trỏ tới ít nhất 2 ảnh Commons gốc ≤ 1280 px (vd "Suckling kittens" hoặc ảnh `q6` của SK-053). Tải xong trong một lượt, 0 lỗi 429. Dán dòng tổng kết của lệnh vào ticket; dọn file tạm.
- [ ] Ảnh tải về có cạnh dài bằng cỡ đã xin (hoặc bằng ảnh gốc nếu Commons không có thumbnail). Tỉ lệ khung vẫn được kiểm đúng: 0 dòng "Chưa kiểm tỉ lệ" mới.
- [ ] `images fetch content/images/explorer/lon-len` vẫn ra "0 tải mới, 0 lỗi": cache cũ không bị coi là ảnh mới.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc:** không. Làm song song được với SK-055; SK-055 đỡ bị 429 nếu ticket này xong trước.

**Câu hỏi còn mở (dev):** ảnh tải dưới 960 px có đủ nét cho khung lớn nhất trên iPad (ô Học ~523×644 pt, @2x) không? Nếu không đủ, đề xuất PM một ngưỡng: ảnh gốc nhỏ hơn mức đó thì giữ bản gốc, chấp nhận chậm.
