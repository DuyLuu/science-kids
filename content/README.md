# Nội dung bài học

Kịch bản do `content-editor` soạn, cấu trúc `content/<age_group>/<topic_slug>/<nn>-<lesson_slug>.md` (mỗi chủ đề thêm một `_topic.md`), trước khi nhập vào CMS.

- Khung bài, khung `_topic.md`, hướng dẫn và bảng ánh xạ sang schema: [TEMPLATE.md](TEMPLATE.md).
- Bài mẫu chuẩn chất lượng: [discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md](discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md).

## Kiểm bài (SK-027)

Chạy từ gốc repo:

```sh
npm --prefix tools/content-cli run validate -- content/discoverer/an-uong-lanh-manh   # kiểm cả chủ đề
npm --prefix tools/content-cli run validate -- content                                # kiểm cả kho
npm --prefix tools/content-cli run ids -- content/discoverer/an-uong-lanh-manh/02-mam-com-can-bang.md   # bài mới: điền id
```

- `validate` đọc thẳng markdown: kiểm cú pháp, schema, rồi luật theo nhóm tuổi. Mỗi lỗi một dòng, chỉ về file `.md` và số dòng. Lệnh không ghi gì vào file.
- `ids` điền UUID vào các dòng `id:` còn trống của bài mới. Chạy một lần, sau khi `validate` đã hết các lỗi khác.
- **Cách làm hiện tại** (SK-027, quyết định 7):
  1. content-editor viết bài, để trống mọi dòng `id:`.
  2. Phiên chính chạy `validate` và gửi lại các dòng lỗi; content-editor sửa. Lặp tới khi 0 lỗi.
  3. Phiên chính chạy `ids`, `import`, `tts --lang en`, `tts --lang vi` và `build`.
- Biên tập viên là người thật thì tự chạy `validate` và `ids` trên máy mình. Cần Node `^22.18.0` hoặc `>= 23.6.0`, và chạy `npm install` một lần trong `tools/content-cli`.
- Chi tiết:
  - TEMPLATE mục A, bước 3 và đoạn "id và key";
  - mã lỗi và đường đi `import` → `tts` → `build`: [tools/content-cli/README.md](../tools/content-cli/README.md), mục "Markdown: validate, import, ids".
