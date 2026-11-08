# SK-020 · Bản iOS lên máy thật: ký, icon tạm, cài trực tiếp hoặc TestFlight

Trạng thái: todo · Ngày: 2026-10-28 · Phụ trách: ios-dev (designer làm icon) · Tester: tester
Nguồn: docs/ios-test-build.md mốc 2 việc B1–B4 và mục quyết định 1–2; technical-plan.md B7.3 (TestFlight), B12 (App Privacy), B14 (phát hành); `.claude/agents/ios-dev.md` mục "Ranh giới" (không đụng tài khoản Apple, không upload khi Duy chưa bảo)

## Mục tiêu
Duy cầm iPhone hoặc iPad thật chơi được bài 1 có tiếng. Nếu Duy chọn Developer Program, người trong team nhận bản qua TestFlight.

## Phạm vi
- **Duy quyết trước (B1, B2):**
  - cách cài: Apple ID miễn phí (cài thẳng từ Xcode, hết hạn sau 7 ngày, tối đa 3 máy) hay Apple Developer Program 99 USD/năm (TestFlight);
  - bundle id thật (ví dụ `vn.<tên>.sciencekids`) và tên hiển thị tạm.
- **ios-dev (B3):**
  - đổi bundle id ở chỗ duy nhất của SK-005;
  - ký tự động theo Team ID, đặt trong `Config/Signing.xcconfig` (gitignore) cùng file mẫu `Signing.example.xcconfig`; không đưa Team ID vào git;
  - số build tăng tự động (ví dụ theo `git rev-list --count HEAD` hoặc thời gian), `MARKETING_VERSION` 0.1.0;
  - `ITSAppUsesNonExemptEncryption = NO`;
  - script `apps/ios/scripts/archive.sh`: `xcodebuild archive` rồi `-exportArchive` với `ExportOptions.plist` theo cách cài Duy chọn;
  - `PrivacyInfo.xcprivacy` rà lại đủ API đang dùng.
- ~~**Designer (B3):** icon tạm 1024×1024 theo style E (giấy cắt, không chữ nhỏ, không trong suốt), đặt vào asset catalog `AppIcon`. Nộp 2–3 phương án để Duy chọn.~~ Đã làm ở [SK-029](SK-029-app-icon-launch-screen.md) (8/11): icon B và màn khởi động đã có trong app. Trên máy thật cần kiểm thêm: icon Dark và Tinted (giữ màn hình chính → Edit → Customize), màn khởi động trên iPad có dùng bản 160 pt không.
- **Nếu chọn TestFlight (B4):**
  - ios-dev viết mục "TestFlight" trong `apps/ios/README.md`: tạo app trên App Store Connect, upload bằng Xcode Organizer hoặc `archive.sh`, thêm tester nội bộ;
  - Duy tự bấm mọi bước trên App Store Connect. ios-dev không upload khi Duy chưa bảo rõ.
- **Nếu chọn Apple ID miễn phí:** hướng dẫn trong README `apps/ios`: thêm Apple ID vào Xcode, chọn Personal Team, cài lên máy, tin cậy developer trên máy, cài lại mỗi 7 ngày.

## Ngoài phạm vi
- Kids Category, App Privacy đầy đủ trên store, nộp review App Store.
- Tester ngoài team (cần beta review). Supabase: SK-021, SK-022.

## Tiêu chí nghiệm thu
- [ ] Bundle id mới ở đúng một chỗ (`grep` như SK-005); `vn.sciencekids.app` không còn trong `apps/ios`, trừ khi Duy chọn đúng id này.
- [ ] `git status` không có Team ID, certificate, profile hay `Signing.xcconfig`.
- [ ] `apps/ios/scripts/archive.sh` chạy trên máy Duy (sau khi có Team ID) ra `.xcarchive` và `.ipa`, exit 0. Dán log rút gọn.
- [ ] App mở trên ít nhất 1 iPhone và 1 iPad thật của Duy, icon tạm hiện đúng. Chơi trọn bài 1, có tiếng.
- [ ] **Kiểm nút gạt im lặng** trên iPhone thật: gạt im lặng rồi chạm nút nghe, ghi có tiếng hay không. Kết quả này để Duy chốt session audio (SK-016, câu hỏi mở).
- [ ] Nếu TestFlight: build hiện trong App Store Connect, 1 tester nội bộ cài được qua app TestFlight.
- [ ] Tester chạy lại luồng vàng của SK-019 trên máy thật (một iPhone, một iPad). Báo cáo theo mức.
- [ ] Không commit, không upload khi Duy chưa bảo.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- SK-019 đạt (không còn lỗi chặn trên simulator).
- **Duy:** chọn cách cài (mục quyết định 1), chốt bundle id và tên tạm (mục 2), đăng nhập Apple ID trong Xcode, đưa Team ID. Nếu chọn Developer Program: đăng ký tài khoản (cá nhân thường duyệt trong 48 giờ; tổ chức cần D-U-N-S, 1–2 tuần).

**Quyết định đã ghi**
- Chưa có. Ghi lựa chọn của Duy vào đây khi có.

**Câu hỏi còn mở**
- Tài khoản Developer cá nhân hay tổ chức? Tên trên store là tên người bán (ios-test-build mục 1).
