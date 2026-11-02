# SK-005 · Khung app iOS `apps/ios`: XcodeGen, SKKit rỗng, font, iPhone + iPad

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: ios-dev · Tester: tester
Nguồn: docs/ios-test-build.md mốc 1 việc I1 và mục "Ghi chú kỹ thuật"; technical-plan.md B3 (cấu trúc repo), B7.1 (module), B7.3 (iOS 17, Swift 6, universal), B7.9 (`Localizable.xcstrings`), B7.10 (xoay màn), B12 (dữ liệu tối thiểu, App Privacy); `.claude/agents/ios-dev.md` mục "Cấu trúc" và "Quy ước phải theo"; canvas `design/play-ui/project/Discoverer-Welcome.dc.html` (nền điệp, cặp font)

## Mục tiêu
ios-dev dựng khung `apps/ios` build và test được trên simulator iPhone và iPad, không cần tài khoản Apple, để các ticket SK-008 (DesignSystem), SK-009 (ContentModel) và SK-010 (LessonEngine) bắt đầu ngay trên một nền chung.

## Phạm vi
- **Cây thư mục** (theo `.claude/agents/ios-dev.md`):
  ```
  apps/ios/
    project.yml                 # XcodeGen, nguồn duy nhất của project
    bootstrap.sh                # cài XcodeGen qua Homebrew nếu thiếu → xcodegen generate
    README.md                   # cách chạy: bootstrap, build, test, đổi bundle id
    Config/Base.xcconfig        # bundle id, version, team (để trống)
    ScienceKids/                # app target mỏng
      App/ScienceKidsApp.swift  # một màn giữ chỗ (xem dưới)
      Resources/Fonts/          # Phudu, Be Vietnam Pro + OFL.txt mỗi họ
      Resources/Localizable.xcstrings   # EN + VI
      Resources/PrivacyInfo.xcprivacy
      Info.plist                # hoặc khai trong project.yml
    ScienceKidsTests/           # unit test của app target
    Packages/SKKit/
      Package.swift             # swift-tools-version 6.0, platforms .iOS(.v17)
      Sources/{DesignSystem,ContentModel,LessonEngine,ContentKit,LessonPlayer,AudioKit}/
      Tests/{DesignSystem,ContentModel,LessonEngine,ContentKit,LessonPlayer,AudioKit}Tests/
  ```
- **`project.yml`:**
  - một target app universal (`TARGETED_DEVICE_FAMILY = 1,2`), iOS 17.0, Swift 6 language mode, strict concurrency `complete`;
  - SKKit là local package; scheme `ScienceKids` chạy test của app và của cả 6 target SKKit trong một lệnh `xcodebuild test`;
  - `MARKETING_VERSION = 0.1.0`, `CURRENT_PROJECT_VERSION = 1`.
- **Bundle id tạm `vn.sciencekids.app`.** Bundle id chưa chốt (ios-test-build mục quyết định 2), nên chuỗi này chỉ được xuất hiện **ở một chỗ** (`Config/Base.xcconfig` hoặc `project.yml`). Bundle id của test target suy ra từ biến đó. README ghi cách đổi.
- **Ký:** simulator build không cần ký. `DEVELOPMENT_TEAM` để trống; không đăng nhập Apple ID, không tạo certificate hay profile. Ký cho máy thật là SK-020.
- **SKKit:** 6 target **rỗng**, mỗi target một file public tối thiểu (ví dụ `public enum DesignSystemModule { public static let name = "DesignSystem" }`) và một test target có ≥ 1 test chạy thật. Dựng đúng phụ thuộc giữa module theo B7.1: `LessonPlayer` phụ thuộc `DesignSystem`, `ContentModel`, `LessonEngine`, `AudioKit`; `ContentKit` phụ thuộc `ContentModel`; `LessonEngine` không phụ thuộc gì (thuần, không I/O).
- **Font:**
  - Tải từ repo `google/fonts` (giấy phép OFL), thư mục `ofl/phudu/` và `ofl/bevietnampro/`. Ghi commit SHA của repo vào `Resources/Fonts/README.md`.
  - Chép kèm `OFL.txt` của mỗi họ, đặt cạnh file font.
  - Cần các weight canvas dùng: Phudu 500 · 700 · 900, Be Vietnam Pro 400 · 600 · 700. Nếu Phudu chỉ có bản variable thì dùng bản đó và kiểm 3 weight hiện đúng; ghi cách làm vào "Quyết định đã ghi".
  - Khai trong `UIAppFonts`; không tải font từ mạng lúc chạy.
- **Màn giữ chỗ khi mở app:**
  - nền điệp `#F0E6CF`;
  - một dòng tiêu đề Phudu 700: "Thức ăn cho ta những gì?";
  - một dòng thân Be Vietnam Pro 400: "Ta cần ăn gì để khoẻ mạnh?";
  - một dòng nhỏ hiện phiên bản và bundle id, để tester kiểm.
  - Hai chuỗi trên lấy từ `Localizable.xcstrings` (EN: "What does food give us?" / "What should we eat to stay healthy?"), hiện theo ngôn ngữ máy.
  - Màu đặt tạm trong một hằng ở app target, ghi `// TODO(SK-008): thay bằng Tokens`. Không tạo gì trong `DesignSystem` (đó là SK-008).
- **`PrivacyInfo.xcprivacy`:** `NSPrivacyTracking = false`, `NSPrivacyTrackingDomains` rỗng, `NSPrivacyCollectedDataTypes` rỗng. `NSPrivacyAccessedAPITypes` khai đúng lý do cho API mà code thật sự dùng; I1 chưa dùng API nào cần khai thì để mảng rỗng và ghi chú để các ticket sau bổ sung (ví dụ UserDefaults `CA92.1`).
- **Xoay màn:** iPhone chỉ dọc. iPad đủ 4 hướng (`UISupportedInterfaceOrientations~ipad`), không đặt `UIRequiresFullScreen`, để Split View và Slide Over chạy được (B7.10). Có `UILaunchScreen` nền điệp.
- **`.gitignore` gốc** thêm: `apps/ios/*.xcodeproj/`, `apps/ios/**/xcuserdata/`, `apps/ios/**/.build/`, `apps/ios/DerivedData/`, `apps/ios/Config/Local.xcconfig` (dùng ở SK-022).

## Ngoài phạm vi
- `DesignSystem` (tokens, thành phần giấy, motion, `LayoutMetrics`): SK-007, SK-008.
- `ContentModel` (Codable theo schema v1): SK-009. `LessonEngine` (chấm, sao, XP): SK-010. `ContentKit`, `AudioKit`, `LessonPlayer`: SK-012, SK-016.
- Điều hướng, màn Welcome, hồ sơ: SK-011.
- Ký cho máy thật, icon, archive, TestFlight: SK-020.
- `supabase-swift`, GRDB, CI.

## Tiêu chí nghiệm thu
- [ ] **Máy sạch:** clone mới (hoặc `git clean -xdf apps/ios`), máy chưa có `xcodegen` (`brew uninstall xcodegen` nếu đã có) → `cd apps/ios && ./bootstrap.sh` cài XcodeGen, sinh `ScienceKids.xcodeproj`, exit 0. Chạy lại lần 2 vẫn exit 0, không cài lại.
- [ ] **Build và test xanh trên hai simulator** (iOS 18.4, Xcode 16.3), không có `DEVELOPMENT_TEAM`:
  ```sh
  cd apps/ios
  xcodebuild build -project ScienceKids.xcodeproj -scheme ScienceKids \
    -destination 'platform=iOS Simulator,name=iPhone 16'
  xcodebuild test  -project ScienceKids.xcodeproj -scheme ScienceKids \
    -destination 'platform=iOS Simulator,name=iPhone 16'
  xcodebuild test  -project ScienceKids.xcodeproj -scheme ScienceKids \
    -destination 'platform=iOS Simulator,name=iPad Pro 11-inch (M4)'
  ```
  Cả ba lệnh in `** BUILD SUCCEEDED **` hoặc `** TEST SUCCEEDED **`. Log test có đủ 7 bundle (app + 6 target SKKit), mỗi bundle ≥ 1 test pass. Dán phần cuối log vào ticket.
- [ ] Build không có warning Swift 6 concurrency. Nếu có warning khác thì liệt kê.
- [ ] **Font nạp được:** unit test của app kiểm `UIFont.fontNames(forFamilyName: "Phudu")` và `UIFont.fontNames(forFamilyName: "Be Vietnam Pro")` đều không rỗng, và tạo được font ở 3 weight của mỗi họ. Trong bundle `.app` có `OFL.txt` của cả hai họ (`find <đường dẫn .app> -name 'OFL*'`).
- [ ] **Màn giữ chỗ:** ảnh chụp iPhone 16 và iPad Pro 11 (dọc), máy để tiếng Việt. Thấy nền điệp; tiêu đề là Phudu, câu thân là Be Vietnam Pro; dấu "ứ, ă, ữ, ì, ẻ, ạ" hiện đúng, không rơi về font hệ thống. Chạy lại với `-AppleLanguages "(en)"` thì thấy chuỗi EN.
- [ ] **Bundle id ở một chỗ:** `grep -rn "vn.sciencekids.app" apps/ios --exclude-dir='*.xcodeproj'` → đúng 1 dòng. `plutil -p <.app>/Info.plist | grep CFBundleIdentifier` → `vn.sciencekids.app`.
- [ ] **Xoay màn:** `plutil -p <.app>/Info.plist` cho thấy `UISupportedInterfaceOrientations` chỉ có Portrait; `UISupportedInterfaceOrientations~ipad` có cả 4 hướng; không có `UIRequiresFullScreen`. Trên simulator iPad xoay ngang thì màn xoay theo; iPhone xoay thì không.
- [ ] **Privacy manifest:** `plutil -lint ScienceKids/Resources/PrivacyInfo.xcprivacy` OK, và file có trong bundle `.app`.
- [ ] **`.xcodeproj` không vào git:** sau bootstrap, `git status --porcelain apps/ios | grep -c xcodeproj` → 0; `git check-ignore apps/ios/ScienceKids.xcodeproj` in ra đường dẫn.
- [ ] Không có thư viện bên ngoài nào ngoài XcodeGen (công cụ) và font. `Package.swift` của SKKit không có `dependencies`.
- [ ] Không sửa file ngoài `apps/ios/` và `.gitignore` gốc (trừ ghi chú trong ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- Không chờ ticket nào. Chạy song song với SK-006 (tokens) và SK-014 (TTS).
- SK-007, SK-008, SK-009, SK-010 bắt đầu khi ticket này xong.
- Tải XcodeGen và font: Duy đã cho phép ở ios-test-build mục quyết định 5 (duyệt 28/10).

**Quyết định đã ghi** (PM đề xuất 28/10 để làm được ngay; Duy xác nhận khi review)
1. Bundle id tạm `vn.sciencekids.app`, đổi ở một chỗ. Chốt thật ở SK-020.
2. Một Swift package `SKKit` có nhiều target, không phải 6 package riêng, cho đơn giản (theo `ios-dev.md`).
3. Simulator mặc định là iPhone 16 và iPad Pro 11-inch (M4). Máy nhỏ (iPhone 16e), máy lớn (iPhone 16 Pro Max) và iPad mini kiểm ở SK-019.
4. Màu nền tạm là hằng trong app target, xoá ở SK-008. Đây là chỗ duy nhất được viết hex trong code Swift.

**Câu hỏi còn mở**
- Tên hiển thị dưới icon (`CFBundleDisplayName`): tạm "Science Kids" cho tới khi Duy chốt tên app (ios-test-build mục quyết định 2).

## Kết quả (ios-dev)

Ngày 28/10/2026 · Xcode 16.3 (16E140), Swift 6.1, XcodeGen 2.46.0 · simulator iOS 18.4. Chưa commit.

### Đã làm
- Dựng `apps/ios` đúng cây thư mục ở mục Phạm vi: `project.yml`, `bootstrap.sh` (thêm cờ `--open` để mở Xcode), `README.md`, `Config/Base.xcconfig` + `Config/Local.xcconfig.example`, app target `ScienceKids/`, `ScienceKidsTests/`, package `Packages/SKKit` với 6 target và 6 test target.
- Màn giữ chỗ: nền điệp, tiêu đề Phudu 700, câu thân Be Vietnam Pro 400, dòng phiên bản `0.1.0 (1) · <bundle id>` đọc từ bundle lúc chạy. Hai chuỗi lấy từ `Localizable.xcstrings` (khoá `placeholder.title`, `placeholder.body`, EN + VI).
- Font tải từ `google/fonts` commit `ddf386ba1b9fbc6b2c818f1ddcd9148f54ced94b`, ghi nguồn, tên file, SHA-256 trong `ScienceKids/Resources/Fonts/README.md`.
- 13 test của app (Swift Testing): font nạp được, đủ 3 weight mỗi họ, có glyph cho chữ có dấu; Info.plist lúc chạy (hướng xoay theo thiết bị, không `UIRequiresFullScreen`, font + OFL + privacy manifest có trong bundle); chuỗi EN/VI biên dịch ra `en.lproj` và `vi.lproj`. Mỗi target SKKit có 1–2 test, `ContentKitTests` và `LessonPlayerTests` kiểm cả phụ thuộc giữa module.
- Thêm `apps/ios/.gitignore` (`.swiftpm/` mà Xcode tạo trong local package khi resolve, và `build/`). `.gitignore` gốc đã có sẵn 5 dòng của ticket, không sửa.

### Quyết định đã ghi (ios-dev, Duy xác nhận khi review)
5. **Phudu chỉ có bản variable** (`Phudu[wght].ttf`, trục wght 300–900, mặc định 300). Dùng một file, chọn weight bằng `kCTFontVariationAttribute` `{wght: 500|700|900}` (`AppFont.phuduUIFont`). Test kiểm `CTFontCopyVariation` trả đúng 500/700/900 và độ rộng chữ khác nhau ở 3 weight. File đổi tên thành `Phudu-VariableFont_wght.ttf` (tên Google Fonts dùng khi tải zip) cho khỏi dấu `[]`.
6. **Mỗi họ font một folder reference** (`Phudu/`, `BeVietnamPro/` trong bundle). Như vậy hai file `OFL.txt` giữ đúng tên mà không trùng; `UIAppFonts` ghi đường dẫn con (`Phudu/Phudu-VariableFont_wght.ttf`…).
7. **Info.plist viết tay** (`ScienceKids/Info.plist`, `GENERATE_INFOPLIST_FILE = NO`), vì `UIAppFonts` và `UILaunchScreen.UIColorName` không khai được bằng `INFOPLIST_KEY_*`. `CFBundleDisplayName` = "Science Kids" (tạm, như câu hỏi mở). `UIApplicationSupportsMultipleScenes = false`: một cửa sổ, vẫn chạy được Split View và Slide Over.
8. **Màn khởi động** dùng màu `LaunchBackground` trong `Assets.xcassets` (`#F0E6CF`), vì `UILaunchScreen` chỉ nhận tên màu trong asset catalog. Nên hex điệp có ở 2 chỗ: colorset này và hằng `PlaceholderPalette` (có `// TODO(SK-008): thay bằng Tokens`). SK-007/SK-008 nên sinh luôn colorset này từ tokens.
9. **Chưa có app icon:** `ASSETCATALOG_COMPILER_APPICON_NAME = ""` (preset của XcodeGen mặc định đòi `AppIcon`, build lỗi nếu thiếu). Icon làm ở SK-020.
10. **Test dùng Swift Testing** (`import Testing`, có `@Test(arguments:)` hợp cho test vector ở SK-010). Lưu ý: dòng XCTest `Executed 0 tests` trong log là bình thường; số test thật xem dòng `✔ Test run with N tests passed` hoặc xcresult.
11. **Bundle id test:** `$(SK_BUNDLE_ID).tests`. `Base.xcconfig` có `#include? "Local.xcconfig"` cho Team ID (SK-020) và URL/key Supabase (SK-022).
12. Màn giữ chỗ dùng `@ScaledMetric` và chặn Dynamic Type ở `accessibility2`; phần typography thật là của SK-008.

### Tự kiểm tiêu chí nghiệm thu

| Tiêu chí | Kết quả | Bằng chứng |
| --- | --- | --- |
| Máy sạch, bootstrap 2 lần | pass | Lần 1, máy chưa có `xcodegen` (`which xcodegen` → not found): `./bootstrap.sh` → `brew install xcodegen` (2.46.0) → `Created project at …/ScienceKids.xcodeproj`, exit 0. Lần 2: `==> XcodeGen 2.46.0 already installed`, exit 0, không cài lại. Lần cuối: xoá `ScienceKids.xcodeproj` và `.swiftpm` rồi chạy lại, exit 0. Không chạy `git clean -xdf apps/ios` vì toàn bộ `apps/ios` chưa commit, lệnh đó sẽ xoá hết. |
| Build + test xanh trên 2 simulator | pass | Đúng 3 lệnh của ticket (thêm `-derivedDataPath` ngoài repo, DerivedData sạch): `** BUILD SUCCEEDED **`, `** TEST SUCCEEDED **` (iPhone 16), `** TEST SUCCEEDED **` (iPad Pro 11-inch (M4)). Mỗi máy 21/21 test, 7 bundle (bảng dưới). Không đặt `DEVELOPMENT_TEAM`. |
| Không warning Swift 6 concurrency | pass | Cả 7 module app + SKKit và 7 module test biên dịch với `-swift-version 6`; `SWIFT_STRICT_CONCURRENCY = complete`. Warning duy nhất trong log: `appintentsmetadataprocessor … warning: Metadata extraction skipped. No AppIntents.framework dependency found.` (log của công cụ AppIntents, có ở mọi app SwiftUI không dùng AppIntents; không phải warning Swift). |
| Font nạp được | pass | `FontTests` (6 test, 12 lượt chạy theo tham số: 2 họ đã đăng ký; Phudu wght 500/700/900 đúng trục và khác độ rộng; Be Vietnam Pro Regular/SemiBold/Bold đúng tên; glyph tiếng Việt có dấu ở cả 4 mặt chữ) pass trên cả 2 máy. `find ScienceKids.app -name 'OFL*'` → `Phudu/OFL.txt`, `BeVietnamPro/OFL.txt`. |
| Màn giữ chỗ VI/EN | pass | Ảnh dưới. Simulator đặt `AppleLanguages (vi-VN, en-VN)`, `AppleLocale vi_VN`: nền điệp, tiêu đề Phudu, thân Be Vietnam Pro, "ứ, ă, ữ, ì, ẻ, ạ" đúng, không rơi về font hệ thống. Chạy lại với `-AppleLanguages "(en)"` → chuỗi EN. Đã trả simulator về ngôn ngữ cũ (`en-VN, vi-VN`, `en_VN`). |
| Bundle id ở một chỗ | pass | `grep -rn "vn.sciencekids.app" apps/ios --exclude-dir='*.xcodeproj'` → 1 dòng `apps/ios/Config/Base.xcconfig:8:SK_BUNDLE_ID = vn.sciencekids.app`. `plutil -p <.app>/Info.plist \| grep CFBundleIdentifier` → `"CFBundleIdentifier" => "vn.sciencekids.app"`. |
| Xoay màn | pass | `plutil -p`: `UISupportedInterfaceOrientations` = [Portrait]; `~ipad` = Portrait, PortraitUpsideDown, LandscapeLeft, LandscapeRight; không có `UIRequiresFullScreen`. Trên simulator: UI test tạm (chỉ ở scratchpad, không vào repo) gọi `XCUIDevice.shared.orientation = .landscapeLeft`: iPad khung cửa sổ `834×1210 → 1210×834` (xoay theo); iPhone `393×852 → 393×852` (không xoay). Lý do dùng UI test: tool điều khiển simulator chưa được cấp quyền. Tester có thể kiểm tay bằng ⌘← trong Simulator. |
| Privacy manifest | pass | `plutil -lint ScienceKids/Resources/PrivacyInfo.xcprivacy` → OK; file có trong `.app`, 4 khoá đúng như ticket, `NSPrivacyAccessedAPITypes` rỗng kèm ghi chú (UserDefaults `CA92.1`, file timestamp `C617.1`). |
| `.xcodeproj` không vào git | pass | `git status --porcelain --untracked-files=all apps/ios \| grep -c xcodeproj` → 0; `git check-ignore apps/ios/ScienceKids.xcodeproj` → `apps/ios/ScienceKids.xcodeproj`. |
| Không thư viện ngoài | pass | `swift package dump-package` → `dependencies: []`; chỉ phụ thuộc nội bộ giữa target. Tải về máy chỉ có XcodeGen (Homebrew) và 4 file font + 2 `OFL.txt`. |
| Không sửa ngoài `apps/ios/` | pass | Chỉ tạo file trong `apps/ios/` và sửa ticket này. Không commit. |

Kết quả từng bundle (xcresult, giống nhau trên iPhone 16 và iPad Pro 11-inch (M4), iOS 18.4):

```
ScienceKidsTests:  Passed 13/13
DesignSystemTests: Passed 1/1
ContentModelTests: Passed 1/1
LessonEngineTests: Passed 1/1
ContentKitTests:   Passed 2/2
LessonPlayerTests: Passed 2/2
AudioKitTests:     Passed 1/1
```

Phần cuối log `xcodebuild test` trên iPad Pro 11-inch (M4) (log iPhone 16 giống hệt):

```
✔ Test run with 13 tests passed after 0.018 seconds.
✔ Test run with 1 test passed after 0.001 seconds.
✔ Test run with 1 test passed after 0.001 seconds.
✔ Test run with 1 test passed after 0.001 seconds.
✔ Test run with 2 tests passed after 0.001 seconds.
✔ Test run with 2 tests passed after 0.001 seconds.
✔ Test run with 1 test passed after 0.001 seconds.
** TEST SUCCEEDED **
```

Phần cuối log `xcodebuild build` (iPhone 16): `** BUILD SUCCEEDED **`.

### Ảnh chụp (scratchpad, không vào repo)
- iPhone 16, tiếng Việt: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-005/iphone16-vi.png`
- iPhone 16, `-AppleLanguages "(en)"`: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-005/iphone16-en.png`
- iPad Pro 11 dọc, tiếng Việt: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-005/ipad-pro11-portrait-vi.png`
- iPad Pro 11 ngang, tiếng Việt (ảnh xoay lại cho thẳng): `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-005/ipad-pro11-landscape-vi.png`
- iPhone 16 sau khi xoay máy sang ngang (UI vẫn dọc): `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-005/iphone16-after-landscape-left-vi.png`

### Việc còn lại · ghi chú cho người khác
- **tester:** kiểm lại theo bảng trên; phần xoay màn kiểm tay bằng ⌘← / ⌘→ trong Simulator. Nếu muốn có UI test xoay màn cố định trong repo thì thêm ở SK-013 hoặc SK-019 (một target UI test, scheme riêng để scheme chính vẫn đúng 7 bundle).
- **designer:** Phudu là font **chỉ có chữ hoa**: chữ thường cũng hiện thành chữ hoa (xem ảnh). Canvas dùng cùng font nên chắc đã đúng ý, ghi lại để biết khi viết chuỗi tiêu đề.
- **SK-007/SK-008:** thay `PlaceholderPalette`, `AppFont` trong `ScienceKids/App/PlaceholderStyle.swift` bằng DesignSystem; sinh colorset `LaunchBackground` từ tokens.
- **Duy:** chưa commit. Việc cần quyết ghi ở câu hỏi mở dưới.

### Câu hỏi còn mở (thêm)
- **Chế độ tối:** style E chỉ có giao diện sáng. Màn giữ chỗ tự đặt màu chữ nên vẫn đọc được, nhưng thanh trạng thái sẽ đổi sang chữ trắng trên nền điệp nếu máy để Dark Mode. Đề xuất khoá giao diện sáng bằng `UIUserInterfaceStyle = Light` trong Info.plist; cần Duy chốt (có thể làm trong SK-008).
