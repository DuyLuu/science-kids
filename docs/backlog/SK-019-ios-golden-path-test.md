# SK-019 · Kiểm luồng vàng bản iOS chạy thử trên 5 simulator

Trạng thái: todo · Ngày: 2026-10-28 · Phụ trách: tester · Tester: pm nghiệm thu báo cáo
Nguồn: docs/ios-test-build.md mốc 1 việc T1 và "Đích"; technical-plan.md B7.8 (trợ năng), B7.10 (iPad), B15 (UI test luồng vàng, ma trận thiết bị); `.claude/agents/tester.md`; canvas Discoverer 1, 2, 4, 5, 8–13 và 4 bản iPad

## Mục tiêu
Tester xác nhận bé chơi trọn bài 1 trên mọi cỡ màn của bản thử, với VoiceOver, giảm chuyển động và chữ to, rồi báo lỗi theo mức để ios-dev sửa trước khi lên máy thật (SK-020).

## Phạm vi
- **Thiết bị** (iOS 18.4): iPhone 16e, iPhone 16 Pro Max, iPad Pro 11-inch (M4) dọc và ngang, iPad mini (A17 Pro). iPhone 16 đã được ios-dev chạy ở các ticket trước; chạy lại một lượt.
- **Luồng vàng:** cài mới → Chào mừng → Tạo hồ sơ → Trang chủ → Chủ đề → Khởi động → Học → Chơi → Quiz 6 câu → Thưởng. Chạy hai lần: đúng hết, và có sai để thấy gợi ý và giải thích.
- **Kiểm trên mỗi thiết bị:**
  - **VoiceOver:** mọi nút và lựa chọn đọc được tên; hình đọc `alt`; thứ tự đọc theo thứ tự hiện. Dùng Accessibility Inspector và `XCUIApplication.performAccessibilityAudit()` (iOS 17+).
  - **Giảm chuyển động** (Settings → Accessibility → Motion): không có animation nào, kể cả lật thẻ và giấy vụn.
  - **Vùng chạm:** mọi phần tử bấm được ≥ 56×56pt. Đo bằng UI test: duyệt `buttons` và đọc `frame`.
  - **Không tràn chữ:** chạy ở cỡ chữ lớn nhất trong trần Dynamic Type của tokens (`xcrun simctl ui <device> content_size <mức>`); không chữ nào bị cắt hay chồng.
  - **Âm thanh:** nút nghe phát đúng câu (simulator có loa của Mac).
  - **Xoay iPad giữa bài:** không mất trạng thái.
  - **Dừng giữa bài:** tắt app ở quiz rồi mở lại, vào đúng câu.
- **Báo cáo** trong ticket này: bảng lỗi theo mức (lỗi chặn · lỗi · góp ý), mỗi lỗi có thiết bị, bước tái hiện, mong đợi, thực tế, ảnh chụp, file và dòng nếu biết. Lỗi giao về ticket gốc (SK-011, SK-012, SK-013, SK-016).
- UI test tester viết thêm đặt trong `apps/ios/ScienceKidsUITests/` (vùng test của tester, theo CLAUDE.md).

## Ngoài phạm vi
- Máy thật, nút gạt im lặng: SK-020.
- Sửa code sản phẩm: tester chỉ báo lỗi.
- Split View 1/2, snapshot đủ ma trận: để sau.

## Tiêu chí nghiệm thu
- [ ] Luồng vàng chạy xong trên đủ 5 cấu hình (iPhone 16e, iPhone 16 Pro Max, iPad Pro 11 dọc, iPad Pro 11 ngang, iPad mini). Mỗi cấu hình có ảnh chụp màn Quiz câu 5 và màn Thưởng.
- [ ] `performAccessibilityAudit()` chạy trên 6 màn bài học và 4 màn mở app, ở iPhone 16e và iPad Pro 11. Dán kết quả; mọi lỗi audit có trong bảng lỗi.
- [ ] Bảng vùng chạm: số phần tử đã đo, số phần tử dưới 56pt (mong đợi 0).
- [ ] Đã kiểm giảm chuyển động và chữ lớn nhất trên ít nhất iPhone 16e và iPad mini. Ghi kết quả.
- [ ] Báo cáo có kết luận: đạt để lên máy thật, hoặc danh sách lỗi chặn.
- [ ] Không sửa code sản phẩm. Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- SK-012, SK-013, SK-016 xong.
- Trần Dynamic Type lấy từ SK-006. Chưa có thì dùng `accessibility-extra-large` và ghi lại.

**Quyết định đã ghi**
1. Bản thử chỉ có Discoverer, nên vùng chạm tối thiểu là 56pt.

**Câu hỏi còn mở**
- Không có.
