# SK-018 · Hình giấy cắt thật cho bài 1 (4 nhóm chất, thẻ rau muống, rồi 36 brief)

Trạng thái: review (đợt 1) · Ngày: 2026-10-28 · Phụ trách: designer · Tester: tester
Nguồn: docs/ios-test-build.md mốc 1 việc D1 và bảng "Cắt gì để nhanh" (36 hình giữ chỗ); technical-plan.md B9 (hình vẽ trên Claude Design, artboard SVG giấy cắt, filter `paperE`, xuất WebP sau); `.claude/agents/designer.md` (luật style E, 3–6 lớp mỗi vật); `content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md` (dòng `image.brief`, mục "Ghi chú cho hoạ sĩ"); canvas Discoverer 9 Học, 10 Chơi, 11 Quiz, 13 Thưởng (hình đang có trong màn)

## Mục tiêu
Designer vẽ hình giấy cắt thật cho bài 1 theo brief của biên tập, ưu tiên những hình bé thấy to nhất, để thay dần 36 hình giữ chỗ của app khi có bước xuất ảnh.

## Phạm vi
- **Đợt 1** (5 hình, Duy duyệt trước khi vẽ tiếp):
  - 4 nhóm chất của màn Học (`explore_carb`, `explore_protein`, `explore_fat`, `explore_vit`);
  - thẻ thưởng rau muống (`rau_muong`).
- **Đợt 2:** phần còn lại của 36 chỗ có `image.brief` trong bài:
  - 8 món trong khay mâm cơm;
  - 14 hình trong quiz (lựa chọn và hình câu hỏi);
  - 8 từ vựng;
  - 1 hình câu khởi động w2.

  Nhiều brief là cùng một vật (cơm, trứng, cá, cam…). Một hình dùng được cho nhiều chỗ thì vẽ một lần và ghi rõ các chỗ dùng.
- **Cách làm** (B9, `designer.md`):
  - mỗi hình là một artboard SVG giấy cắt trong `design/play-ui/project/`, 3–6 lớp mỗi vật;
  - bóng bằng filter `paperE`; màu dịu gần bảng style E;
  - không nét viền, không gradient;
  - bối cảnh Việt Nam đúng brief, không nhãn hiệu thật.
  - Đề xuất gom theo nhóm thành vài file `Art-AnUong01-*.dc.html` (ví dụ nhóm chất, món ăn, từ vựng), mỗi hình một khung có tên là `key` trong bài.
- `canvas.json`: thêm board cho các file hình, không chồng lên board cũ (dùng lại script kiểm chồng lấn của SK-004).
- Bảng trong ticket này: `key` trong bài → file và id khung hình → trạng thái (đợt 1, đợt 2, đã duyệt).

## Ngoài phạm vi
- Xuất SVG → WebP, tính hash, đưa vào gói: cần lệnh `content-cli assets` (B8.0), chưa có ticket. Đến lúc đó app vẫn dùng hình giữ chỗ.
- Sửa màn canvas đang có để thay hình cũ bằng hình mới.
- Hình cho bài 2–5.

## Tiêu chí nghiệm thu
- [ ] Đợt 1: 5 hình mở được trên canvas, đúng brief. Duy duyệt trên canvas trước khi bắt đầu đợt 2, ghi kết quả duyệt vào ticket.
- [ ] Đợt 2: đủ 36 chỗ có hình (một hình có thể phủ nhiều chỗ). Bảng `key → hình` không thiếu chỗ nào; tester đối chiếu với 36 dòng `image.brief` của bài.
- [ ] Đúng style E: không có `stroke` trên hình khối, không `linearGradient` hay `radialGradient`, không emoji. Màu trong bảng style E hoặc ghi lý do. Mỗi vật 3–6 lớp. Tester kiểm bằng `grep` trên các file hình.
- [ ] Mỗi khung hình có kích thước đủ cho cỡ lớn nhất trên iPad (1,5× bản phone, SK-004).
- [ ] `python3 -m json.tool canvas.json` chạy được; script chồng lấn báo 0.
- [ ] Không sửa file `.dc.html` đã có. Không publish canvas, không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- Không chặn mốc 1. Không chờ ticket nào.
- Nếu SK-006 (tokens) xong trước thì dùng tên màu của tokens trong ghi chú.

**Quyết định đã ghi** (PM đề xuất 28/10)
1. Chia 2 đợt có điểm duyệt ở giữa, vì Duy từng chê bản đầu "nhìn AI". Duyệt 5 hình trước đỡ phải vẽ lại 36 hình.

**Câu hỏi còn mở**
- Cần một ticket cho `content-cli assets` (xuất WebP, nướng bóng `paperE`, ra @2x/@3x) nếu muốn hình thật vào bản thử. PM đề xuất làm sau mốc 1.

## Bảng hình: key → file#khung → trạng thái

File nằm trong `design/play-ui/project/`. Khung là `<svg id="key">` 120 × 120, xem ở 240px.

| key | file#khung | Dùng ở | Trạng thái |
| --- | --- | --- | --- |
| `explore_carb` | `Art-AnUong01-Nhom-chat.dc.html#explore_carb` | Học (nhóm chất bột đường); từ vựng `carbohydrate` | đợt 1 · chờ Duy duyệt |
| `explore_protein` | `Art-AnUong01-Nhom-chat.dc.html#explore_protein` | Học (nhóm chất đạm) | đợt 1 · chờ Duy duyệt |
| `explore_fat` | `Art-AnUong01-Nhom-chat.dc.html#explore_fat` | Học (nhóm chất béo) | đợt 1 · chờ Duy duyệt |
| `explore_vit` | `Art-AnUong01-Nhom-chat.dc.html#explore_vit` | Học (nhóm vitamin, chất khoáng); bó rau muống dùng chung với `rau_muong` | đợt 1 · chờ Duy duyệt |
| `rau_muong` | `Art-AnUong01-The.dc.html#rau_muong` | Thưởng (thẻ rau muống) | đợt 1 · chờ Duy duyệt |
