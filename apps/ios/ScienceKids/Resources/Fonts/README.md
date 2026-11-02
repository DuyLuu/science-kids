# Font đóng gói trong app

Hai họ font của style E, đóng gói trong bundle, khai trong `UIAppFonts` (`ScienceKids/Info.plist`). App không tải font từ mạng lúc chạy.

| Họ | File | Weight dùng | Giấy phép |
| --- | --- | --- | --- |
| Phudu | `Phudu/Phudu-VariableFont_wght.ttf` (variable, trục `wght` 300–900) | 500 · 700 · 900 | `Phudu/OFL.txt` (SIL OFL 1.1) |
| Be Vietnam Pro | `BeVietnamPro/BeVietnamPro-Regular.ttf`, `-SemiBold.ttf`, `-Bold.ttf` | 400 · 600 · 700 | `BeVietnamPro/OFL.txt` (SIL OFL 1.1) |

## Nguồn

- Repo `github.com/google/fonts`, nhánh `main`, commit `ddf386ba1b9fbc6b2c818f1ddcd9148f54ced94b` (27/10/2026).
- Thư mục `ofl/phudu/` và `ofl/bevietnampro/`, tải ngày 28/10/2026 (SK-005).
- `Phudu[wght].ttf` được đổi tên thành `Phudu-VariableFont_wght.ttf` (tên Google Fonts dùng khi tải zip) để tránh dấu ngoặc vuông trong đường dẫn. Nội dung file giữ nguyên.

SHA-256 lúc tải:

```
56dfb12f5f7b6a851f3638cf975d7733fbcaba0a8f81865513f025730e3536a0  Phudu/Phudu-VariableFont_wght.ttf
cd1ef6e9d7db28ad5cdb88a65ccbe693870e60d340b791f349d248342b4fe4c3  BeVietnamPro/BeVietnamPro-Regular.ttf
bd8e27eb02720b9d91e59e4f10a90878643219f25ce6a8d9a4f06a8a88d3bb71  BeVietnamPro/BeVietnamPro-SemiBold.ttf
7f738fe5c43c8872807b20e2d30d42163618de8a4daf7f48a939adac32c16847  BeVietnamPro/BeVietnamPro-Bold.ttf
```

## Cách dùng

- **Phudu chỉ có bản variable.** Instance mặc định là `Phudu-Light` (wght 300); CoreText tự đặt tên cho các instance còn lại kiểu `Phudu-Light_Bold`, không ổn định nên không gọi theo tên. Muốn weight 500 · 700 · 900 thì tạo font họ `Phudu` với thuộc tính `kCTFontVariationAttribute` = `{'wght': 500|700|900}`; xem `AppFont.phuduUIFont(weight:size:)`.
- **Phudu chỉ có chữ hoa:** chữ thường cũng hiện thành chữ hoa (kể cả dấu tiếng Việt), đúng như trên canvas. Chuỗi trong `Localizable.xcstrings` vẫn viết thường như câu bình thường.
- **Be Vietnam Pro** là file tĩnh, gọi theo tên PostScript: `BeVietnamPro-Regular`, `BeVietnamPro-SemiBold`, `BeVietnamPro-Bold`.
- Mỗi họ nằm trong một thư mục riêng và được chép vào bundle dạng folder reference (`Phudu/`, `BeVietnamPro/`), để hai file `OFL.txt` giữ đúng tên mà không trùng nhau. File README này không vào bundle.
- `ScienceKidsTests/FontTests.swift` kiểm: hai họ đã đăng ký, đủ 3 weight mỗi họ, và có glyph cho chữ tiếng Việt có dấu.
- Cần thêm weight (ví dụ Be Vietnam Pro 800 mà canvas dùng ở vài chỗ) thì tải từ cùng commit, thêm vào `UIAppFonts`, cập nhật bảng trên.
