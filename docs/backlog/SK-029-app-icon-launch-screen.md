# SK-029 · Bộ app icon và màn khởi động

Trạng thái: review · Ngày: 2026-11-02 (vòng 3 xong 8/11) · Phụ trách: designer (vòng 1–2) → ios-dev (vòng 3) · Tester: tester
Nguồn: Duy 2/11 "trước khi build thì thiết kế bộ app icon và splash screen trước"; SK-020 phần Designer (B3, "icon tạm"); prd.md mục "Còn mở" (tên app, mascot); canvas style E; asset đang có `ArtBrandMark` (bình thí nghiệm trên ô đỏ son), `ArtMascot` (linh vật tròn xanh có ăng-ten), màu khởi động `LaunchBackground` = `diep`

## Mục tiêu
Trước khi cài lên máy thật (SK-020), app có icon và màn khởi động theo style E. Duy chọn từ vài hướng, để icon trên màn hình chính iPhone, iPad dễ nhận ra và không lẫn với app khác.

## Phạm vi

**Vòng 1 · designer dựng hướng trên canvas để Duy chọn**
- **Icon: 3 hướng khác hẳn nhau.** Gợi ý, designer đổi được:
  - A: phát triển từ dấu thương hiệu đang có (bình thí nghiệm trên ô đỏ son).
  - B: linh vật đang có ló từ mép giấy.
  - C: một biểu tượng "khám phá" (ví dụ kính lúp, lá, mầm cây) kiểu mộc bản Đông Hồ.
- Mỗi hướng hiện ở cỡ 1024 và ở cỡ thật trên máy: màn hình chính iPhone 60 pt, iPad 83,5 pt, Spotlight 40 pt, Cài đặt 29 pt. Đặt trên nền màn hình chính sáng và tối, cạnh vài ô icon giả lập. Ô giả lập là khối màu trơn, không dùng logo app thật.
- **Màn khởi động** (`UILaunchScreen` của iOS): là ảnh tĩnh, không chuyển động, không chữ. Hệ thống tự bo góc, không có hiệu ứng.
  - 2 phương án, mỗi phương án hiện trên iPhone dọc, iPad dọc và iPad ngang.
  - Màn này nên khớp với màn đầu tiên của app (Chào mừng, hoặc Trang chủ khi đã có hồ sơ), để lúc chuyển không nháy sang màu khác.
- **Màn chào động trong app**: chỉ nêu ưu và nhược điểm, kèm đề xuất có hay không, chưa vẽ. Đây là màn ngắn chạy sau màn khởi động. Nếu có thì: tối đa 1 giây, tắt hẳn khi bật Giảm chuyển động, chạm vào là bỏ qua.

**Vòng 2 · designer hoàn thiện hướng Duy chọn**
- Icon 1024×1024 ba bản: sáng, tối, tinted (iOS 18). File nguồn SVG để trong `design/`.
- Bản PNG xuất cho asset catalog: sRGB, bản sáng không có kênh alpha.
- Giữ vùng an toàn để sau này dùng lại làm adaptive icon Android, nhưng chưa xuất bản Android.
- Hình cho màn khởi động, và token màu nền nếu cần màu mới.

**Vòng 3 · ios-dev đưa vào app**
- `AppIcon` trong `Assets.xcassets`: một cỡ 1024, có bản Any, Dark, Tinted.
- `UILaunchScreen` trong `Info.plist`: `UIColorName` cộng `UIImageName` nếu phương án có hình.
- Nếu Duy chọn có màn chào động: làm theo đúng spec của designer, tôn trọng Giảm chuyển động.
- Không đổi luồng app.

## Ngoài phạm vi
- Tên app và chữ thương hiệu (wordmark): tên chưa chốt (prd.md "Còn mở").
- Mascot chính thức, icon Android, ảnh chụp màn hình cho App Store.

## Tiêu chí nghiệm thu
- [ ] Canvas có 3 hướng icon, mỗi hướng ở 1024 và 4 cỡ thật, trên nền sáng và tối. Icon không chữ, không vùng trong suốt ở bản sáng, hình khối không có nét viền (style E). Ở cỡ 29 pt vẫn nhận ra hình.
- [ ] Canvas có 2 phương án màn khởi động: iPhone dọc, iPad dọc, iPad ngang.
- [ ] Màu chỉ lấy từ `packages/design-tokens/tokens.json`. Cần màu mới thì thêm token, ghi lý do.
- [ ] Duy chọn hướng; ghi vào "Quyết định đã ghi".
- [ ] Vòng 2: có SVG nguồn và PNG 1024 cho ba bản sáng, tối, tinted; bản sáng không có alpha (kiểm bằng `sips -g hasAlpha`).
- [x] Vòng 3, build không có cảnh báo về `AppIcon`.
- [ ] Vòng 3, trên iPhone 16 Pro (simulator đang mở, chạy một lần): icon hiện ở màn hình chính cả chế độ sáng và tối; mở app từ trạng thái tắt hẳn thì màn khởi động hiện đúng và chuyển sang màn đầu không nháy màu.
- [ ] iPad: kiểm khi lên máy thật ở SK-020 (quy tắc một simulator).

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- Không. SK-020 dùng kết quả của ticket này thay cho "icon tạm".

**Quyết định đã ghi**
1. Icon và màn khởi động không có chữ, nên không phụ thuộc vào tên app chưa chốt. Phiên chính đặt mặc định ngày 2/11; Duy đổi được.
2. **Duy chọn icon B · Linh vật ló mép giấy (3/11).** Chọn B nghĩa là linh vật đang có (`ArtMascot`) trở thành mặt của app trên màn hình chính: đổi linh vật thì phải đổi icon.
3. **Duy chọn màn khởi động PA2 (3/11):** nền `LaunchBackground` cộng một hình 128 pt ở giữa. Với icon B, hình giữa là linh vật ló mép giấy, không phải triện.
4. **Không làm màn chào động ở GĐ 0 và beta** (đề xuất của designer, Duy không chọn khác).

**Câu hỏi còn mở**
- Tên app (shortlist ở prd.md). Khi chốt tên thì có thể thêm chữ thương hiệu vào màn chào, không thêm vào icon.
- Linh vật chính thức (prd.md "Còn mở"): icon B đã dùng linh vật hiện có. Cần Duy xác nhận đây là linh vật chính thức hay chỉ dùng tới beta.

## Designer · vòng 1 (2/11)

**File**
- Mới: `design/brand/icon-a.svg`, `icon-b.svg`, `icon-c.svg`. Mỗi file là SVG 1024 × 1024 vuông đủ, nền phủ kín nên không có vùng trong suốt, không chữ, không nét viền. Bóng dùng filter `paperE` phóng cho khung 1024 (vân /8, mép lệch 12, bóng dy 18). Hình chính nằm trong ô giữa 683 (66%).
- Mới: `design/play-ui/project/Brand-Icons.dc.html` (1840 × 1760) và `Brand-Launch.dc.html` (2050 × 1640).
- Sửa: `design/play-ui/project/canvas.json`, thêm 2 board vào `boards` và `order` ở hàng riêng (y 11038, dưới hàng Explorer Quiz), thêm note `brandTitle` và `brandOptions`. JSON hợp lệ, không đè board nào.
- Màu chỉ lấy từ `tokens.json` (đã kiểm bằng script), không thêm token.

**3 hướng icon** (canvas Brand-Icons: 1024 qua mặt nạ squircle iOS, rồi 60, 83,5, 40, 29 pt trên màn hình chính sáng và tối, cạnh ô màu trơn)
- A · Triện bình thí nghiệm: `ArtBrandMark` thành triện đỏ son hai lớp, nghiêng −4°, trên giấy điệp. Rõ nhất ở 29 pt. Rủi ro: bình thí nghiệm là hình quen của app khoa học; nền điệp gần màu hình nền sáng.
- B · Linh vật ló mép giấy: `ArtMascot` ló sau tờ giấy xé, hai tay bám mép, mắt nhìn lên, nền đỏ son. Trẻ nhận ra nhanh nhất. Rủi ro: chọn B là gần như chốt linh vật; kiểu ló đầu đã có ở nhiều app; bản tinted phải vẽ riêng vì gỉ đồng và đỏ son sáng gần bằng nhau.
- C · Kính lúp soi lá: vành vàng hoè, cán sơn đỏ, dưới kính là lá đề có bọ rùa, nền chàm. Rủi ro: kính lúp cũng là ký hiệu tìm kiếm; ở 29 pt chỉ còn vòng vàng.
- Kiểm ở 29 pt (chụp Chrome 2x): cả ba còn nhận ra (A khối đỏ có bình trắng, B mặt hai mắt, C vòng kính có cán). Nếu cắt tròn kiểu Android thì A bị xén góc triện, C bị xén đuôi cán.

**2 phương án màn khởi động** (canvas Brand-Launch: iPhone dọc, iPad dọc, iPad ngang, cạnh màn Chào mừng)
- PA1 · Giấy điệp trơn: chỉ có `UIColorName = LaunchBackground` (#F0E6CF, đã có trong app), không hình.
- PA2 · Triện giữa giấy: thêm `UIImageName = LaunchMark`, hình 128 × 128 pt (triện 106 pt nghiêng −4°, bóng nướng sẵn, nền trong suốt quanh triện), cùng cỡ trên mọi máy, @2x 256 px, @3x 384 px. Nếu chọn icon B hoặc C thì hình giữa đổi theo, giữ khung 128 pt.
- Cả hai cùng màu nền với Chào mừng, Chọn hồ sơ và Trang chủ (`bg_screen`), nên không nháy màu. App chưa có giao diện tối, colorset một màu, nên máy bật Dark vẫn mở bằng giấy điệp.

**Màn chào động trong app: đề xuất không làm ở GĐ 0 và beta.**
- Ưu: có khoảnh khắc thương hiệu; che được lúc nạp gói nội dung lần đầu.
- Nhược: bé chờ thêm tới 1 giây mỗi lần mở. Màn đầu đã có lượt hiện giấy đặt xuống, thêm màn chào là hai lượt chuyển động liền nhau. Thêm đường code phải test (Giảm chuyển động, chạm bỏ qua). Apple cũng khuyên không dùng màn chào.
- Xem lại khi chốt tên app và chữ thương hiệu. Nếu làm thì chỉ chạy ở lần mở đầu tiên sau khi cài, ≤ 0,8 giây.

**Đề xuất: icon A và khởi động PA2.**
- Icon, màn khởi động và đầu màn Chào mừng là cùng một con triện: icon nền điệp phóng lên thành màn điệp có triện, rồi các mảnh giấy đặt xuống.
- Không phụ thuộc tên app và linh vật chưa chốt.
- Rõ nhất ở cỡ nhỏ.
- Nếu Duy muốn chốt linh vật sớm thì B là lựa chọn có cảm xúc hơn.

**Còn chưa chắc**
- Mặt nạ squircle trên canvas là siêu elip n = 5, gần đúng với mặt nạ iOS, không phải đường cong chính xác của Apple.
- Ô giả trên màn hình chính dùng màu token, nên gần màu icon hơn màn hình thật: đây là phép thử khó hơn thực tế.
- Cỡ 128 pt của PA2 chọn bằng mắt; trên iPad trông hơi nhỏ, có thể thêm bản riêng cho iPad trong imageset.
- Màn Chào mừng trên iPad trong board là bản dựng theo `PaperFrame` 600 pt (hình đồi phóng 1,35× khi dọc, 1,15× khi ngang). Canvas chưa có artboard Chào mừng iPad.
- Vòng 2 xuất PNG phải kiểm lại vân điệp và bóng: renderer khác Chrome có thể vẽ filter khác.
- Bản tối và tinted chưa vẽ (vòng 2). Icon Android cần dựng lại cho vòng tròn an toàn.

## Designer · vòng 2 (3/11)

**File**
- SVG nguồn trong `design/brand/`:
  - `icon-b.svg`: bản sáng. Chỉnh một chỗ: tờ giấy trước đổi từ giấy sáng sang giấy điệp, để tách hơn khỏi hình nền sáng và trùng màu nền khởi động.
  - `icon-b-dark.svg`, `icon-b-tinted.svg`: mới.
  - `launch-mark-b.svg`: mới. Khung 128 × 128, nền trong suốt.
- PNG trong `design/brand/export/`: `AppIcon-light.png`, `AppIcon-dark.png`, `AppIcon-tinted.png` (1024), `LaunchMark@2x.png` (256), `LaunchMark@3x.png` (384), `LaunchMark-iPad@2x.png` (320).
- `design/brand/export.sh` xuất lại sáu PNG từ SVG: Chrome headless sRGB, ImageMagick bỏ alpha, gắn profile sRGB. Đã chạy thử; kết quả trùng từng điểm ảnh với bản đã xuất.
- Canvas:
  - Mới `Brand-Final.dc.html` (1840 × 1900), đăng ký trong `canvas.json` cùng hàng Brand (x 4530, y 11038).
  - `Brand-Icons`: B có nhãn "Duy chọn 3/11", A ghi "Designer đề xuất ở vòng 1". A và C giữ nguyên để lưu lại.
  - `Brand-Launch`: PA2 có nhãn "Duy chọn 3/11", hình giữa đổi sang linh vật, phần spec và màn chào động cập nhật.
  - Note `brandTitle`, `brandOptions` cập nhật.
- Màu chỉ lấy từ `tokens.json`, không thêm token.

**Bản tối: nền tự vẽ, không trong suốt.**
- Lý do chọn nền có sẵn:
  - Nếu để trong suốt, iOS vẽ vào đó một nền chuyển màu, mà style E không dùng chuyển màu.
  - Bố cục B cần nền làm trời sau linh vật; nếu trong suốt thì hai tờ giấy trôi lơ lửng.
  - Tự vẽ nền thì giữ đúng màu và vân giấy.
- Cách làm: giữ bố cục, hạ độ sáng các mảng lớn.
  - Trời đỏ son sẫm `do_son_deep`, giấy sau `do_son`, giấy trước `chu_phu`.
  - Linh vật giữ màu, nên mặt là phần sáng nhất.
  - Cần ăng-ten đổi sang `vang_hoe_deep`, vì than tre chìm trên nền tối.
- Đã thử nền than tre với giấy trước đỏ son: mép trên chìm vào hình nền tối nên bỏ.

**Bản tinted: ảnh xám trên nền trong suốt, có alpha là cố ý.**
- iOS 18 dùng độ sáng của ảnh để phủ màu tint, rồi tự vẽ nền tối pha tint vào chỗ trong suốt. Để trong suốt thì icon cùng nền với các icon khác ở chế độ này.
- Vẽ riêng theo độ sáng (luma Rec.709):
  - mắt và quả ăng-ten 96%;
  - thân, tay, cần ăng-ten 66%;
  - giấy trước 27%;
  - giấy sau 11%;
  - bỏ má.
- Lý do vẽ riêng: ở bản sáng, gỉ đồng (39%) và đỏ son (31%) gần bằng nhau, đổi sang xám thì mặt lẫn vào nền.
- Cách dựng: dùng màu token rồi đổi sang xám bằng filter `grayE` (saturate 0, trên giá trị sRGB). PNG có R = G = B; đã kiểm độ bão hoà lớn nhất bằng 0, và đo được thân 169 (66%), ăng-ten 246, giấy sau 28.
- Đã thử giấy trước sáng 90%: mảng giấy lấn mất mặt nên bỏ.

**Kiểm sau khi xuất**
- `sips -g hasAlpha`:
  - `AppIcon-light.png`: no
  - `AppIcon-dark.png`: no
  - `AppIcon-tinted.png`: yes (cố ý)
  - `LaunchMark@2x.png`, `LaunchMark@3x.png`, `LaunchMark-iPad@2x.png`: yes (cố ý)
- Cả sáu file đều sRGB IEC61966-2.1, đúng kích thước.
- Màu điểm ảnh khớp token:
  - trời bản sáng 169,59,40, tức đỏ son lệch ±1 do vân giấy;
  - giấy trước 240,230,207, đúng điệp;
  - trời bản tối 110,35,23, tức đỏ son sẫm.
- Vân giấy và bóng: bản Chrome giữ bóng, mép lệch và vân giống canvas. ImageMagick dựng cùng SVG thì mất cả ba, nên chỉ dùng PNG đã xuất.
- Đặt `LaunchMark@3x.png` lên nền #F0E6CF: màu và bóng khớp canvas.

**Bàn giao cho ios-dev (vòng 3)**. Mọi file nằm trong `design/brand/export/`.
- `AppIcon` (iOS, một cỡ 1024):
  - `AppIcon-light.png` → Any Appearance
  - `AppIcon-dark.png` → Dark
  - `AppIcon-tinted.png` → Tinted
- Imageset `LaunchMark`:
  - `LaunchMark@2x.png`, `LaunchMark@3x.png` → idiom iPhone, 2x và 3x. Cỡ 128 × 128 pt.
  - `LaunchMark-iPad@2x.png` → idiom iPad, 2x. Cỡ 160 × 160 pt: cùng hình, to hơn 1,25× vì 128 pt trông nhỏ trên màn 834 pt.
- `Info.plist` → `UILaunchScreen`:
  - `UIColorName = LaunchBackground`: colorset có sẵn, #F0E6CF (token `diep`), một màu cho mọi giao diện.
  - `UIImageName = LaunchMark`, đặt giữa toàn màn, không bật `UIImageRespectsSafeAreaInsets`.
- Dùng đúng PNG đã xuất. Không đưa SVG vào asset catalog, vì Xcode dựng SVG sẽ mất bóng và vân giấy.
- Không có màn chào động (quyết định 4).

**Còn chưa chắc**
- Bản tối và tinted mới chỉ mô phỏng trên canvas (tint vàng hoè, nền tối pha tint). iOS thật dùng nền chuyển màu và tint do người dùng chọn, nên cần xem ở vòng 3 trên simulator. Với tint đỏ hay xanh, mặt (66%) vẫn sáng hơn giấy trước (27%).
- Theo tôi biết, `UILaunchScreen` chọn ảnh theo idiom của asset catalog, nhưng chưa thử. Nếu không, iPad sẽ hiện bản 128 pt (vẫn ổn).
- iOS lưu tạm màn khởi động: sau khi thay hình, có thể phải xoá app hoặc khởi động lại simulator mới thấy.
- Mặt nạ squircle trên canvas là siêu elip gần đúng, không phải đường cong chính xác của iOS.
- Icon Android chưa làm. Nếu cắt tròn thì hai tay và đỉnh quả ăng-ten bị xén một chút.
- `export.sh` cần Google Chrome và ImageMagick trên máy. Sửa SVG thì phải chạy lại script; không dùng công cụ xuất khác.

## ios-dev · vòng 3 (8/11)

**Đã đổi** (chỉ trong `apps/ios/`, chưa commit)
- Mới `apps/ios/ScienceKids/Resources/Assets.xcassets/AppIcon.appiconset/`:
  - `Contents.json`: một cỡ `1024x1024`, `idiom: universal`, `platform: ios`, ba bản: không `appearances` (Any), `luminosity` `dark`, `luminosity` `tinted`.
  - `AppIcon-light.png`, `AppIcon-dark.png`, `AppIcon-tinted.png`: chép nguyên từ `design/brand/export/` (`cmp` trùng từng byte).
- Mới `apps/ios/ScienceKids/Resources/Assets.xcassets/LaunchMark.imageset/`:
  - `Contents.json`: iPhone 2x `LaunchMark@2x.png`, iPhone 3x `LaunchMark@3x.png`, iPad 2x `LaunchMark-iPad@2x.png`. Ô iPhone 1x và iPad 1x để trống, đúng như Xcode ghi khi chọn thiết bị iPhone + iPad. Không có ô universal vì app chỉ chạy iPhone, iPad.
  - Ba PNG chép nguyên từ `design/brand/export/`.
  - Tên file giữ như designer đặt: tiền tố là tên asset, giống `Art/ArtMascot.imageset/ArtMascot.svg`.
- `apps/ios/ScienceKids/Info.plist:50-51`: thêm `UIImageName = LaunchMark` vào `UILaunchScreen`, giữ `UIColorName = LaunchBackground`. Không đặt `UIImageRespectsSafeAreaInsets`, nên hình nằm giữa toàn màn.
- `apps/ios/project.yml:95-98`: `ASSETCATALOG_COMPILER_APPICON_NAME: AppIcon` (trước là `""`), kèm comment SK-029. Đã chạy `./bootstrap.sh`; `.xcodeproj` sinh ra có `ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon` ở cả Debug và Release.
- `apps/ios/README.md:118`: dòng mô tả `Assets.xcassets` thêm AppIcon và LaunchMark.
- Không đổi luồng app, `ArtMascot` hay `ArtBrandMark`. Không có màn chào động (quyết định 4).

**Kiểm** (log và ảnh ở `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk029/ios/`)
1. **Build**: `xcodebuild build -project ScienceKids.xcodeproj -scheme ScienceKids -destination 'generic/platform=iOS Simulator'` (DerivedData mặc định). Kết quả `** BUILD SUCCEEDED **`.
   - actool không báo warning hay notice nào; log không có warning nào nhắc tới `AppIcon` hay `LaunchMark`.
   - Warning còn lại, có từ trước, không liên quan: `appintentsmetadataprocessor … warning: Metadata extraction skipped. No AppIntents.framework dependency found.`
2. **Trong `.app`**:
   - `xcrun assetutil --info ScienceKids.app/Assets.car` có:
     - `AppIcon` Any, 1024, opaque;
     - `AppIcon` `UIAppearanceDark`, 1024, opaque;
     - `AppIcon` `ISAppearanceTintable`, 1024, Gray, có alpha.
     - Mỗi bản có cho cả phone và pad.
     - `LaunchMark`: phone 2x 256 px, phone 3x 384 px, pad 2x 320 px.
   - Bundle có thêm `AppIcon60x60@2x.png` và `AppIcon76x76@2x~ipad.png`: actool tự sinh.
   - `Info.plist` đã build có `CFBundleIcons` và `CFBundleIcons~ipad` (`CFBundleIconName = AppIcon`). `UILaunchScreen` có đủ `UIColorName` và `UIImageName`.
3. **Simulator iPhone 16 Pro** `14DF158D-5ED6-49CF-80A5-7519B0D594F5`. Lúc bắt đầu máy đang Booted, appearance `light`; lúc xong vẫn Booted, `light`. Không boot máy nào khác.
   - `simctl uninstall` app cũ (dữ liệu hồ sơ đã lưu trên máy này mất theo), rồi `simctl install` bản vừa build.
   - **Màn hình chính sáng**: `home-light.png`, phóng to ở `home-light-icon.png`. Icon đúng bản sáng: trời 170,63,43 (đỏ son), giấy trước 240,230,207 (điệp).
     - Ảnh chụp ngay sau khi cài thấy icon tối: đó là lớp mờ iOS phủ lúc đang cài, không phải bản Dark.
   - **Màn hình chính tối: chưa kiểm được icon Dark.**
     - Sau `xcrun simctl ui <udid> appearance dark` (`home-system-dark.png`), dock và thư mục chuyển tối, nhưng mọi icon vẫn bản sáng, kể cả icon của Apple (Files, Safari).
     - Nguyên nhân: cấu hình màn hình chính của simulator này (`PRBPosterExtensionDataStore/…/homescreenConfiguration.plist`) đặt `_iconUserInterfaceStyleType = light`, tức kiểu icon cố định "Light", không theo giao diện hệ thống.
     - Thử Edit → Customize trên màn hình chính để đổi kiểu icon: bảng không mở trên simulator. Không sửa tay file cấu hình.
     - Bản Dark mới được xác nhận có trong `Assets.car`, chưa thấy trên màn hình.
   - **Tinted: chưa kiểm**, cùng lý do. `Assets.car` có bản `ISAppearanceTintable`.
   - **Màn khởi động**: app chưa từng chạy. Quay `simctl io recordVideo` trong lúc `simctl launch`, rồi tách khung 60 fps.
     - `launch-screen-light.png`: khung đầy đủ. `launch-mark-crop.png`: phần giữa. `launch-light-sequence.png`: 8 khung từ màn hình chính tới Chào mừng. Video gốc `launch-light.mp4`; màu từng khung ở `launch-light-frames.txt`.
     - Màn khởi động hiện nền điệp, linh vật ló mép giấy ở giữa màn, có bóng. Phần hình nhìn thấy rộng khoảng 120 pt trong khung 128 pt.
   - **Không nháy màu**:
     - Điểm (20 pt, 200 pt) giữ 237,229,205 (#F0E6CF sau nén H.264) từ khung khởi động đầu tiên tới hết video.
     - Không có khung nào trắng, đen hay màu khác.
     - Màn đầu là Chào mừng (`launch-first-screen-light.png`). iOS mờ dần hình khởi động sang màn Chào mừng trong khoảng 0,5 giây, nên có lúc thấy mờ cả linh vật giữa màn khởi động và linh vật trên đồi của Chào mừng. Đây là cách chuyển mặc định của iOS, nền không đổi màu.
4. **Test**: `xcodebuild test -project ScienceKids.xcodeproj -scheme ScienceKids -destination 'platform=iOS Simulator,id=14DF158D-5ED6-49CF-80A5-7519B0D594F5' -skip-testing:ScienceKidsUITests`, chạy một lần.
   - Kết quả `** TEST SUCCEEDED **`: 9 bundle, 251 test (51 + 41 + 20 + 19 + 18 + 50 + 13 + 21 + 18), không fail.
   - Warning chỉ có dòng `appintentsmetadataprocessor` như trên.

**Còn chưa kiểm**
- Icon Dark và Tinted trên màn hình chính. Kiểm trên máy thật ở SK-020: giữ màn hình chính → Edit → Customize → Dark, rồi Tinted với vài màu tint.
- Màn khởi động khi máy bật Dark. Colorset một màu nên dự kiến vẫn là giấy điệp; chưa quay vì quy tắc chạy một lần.
- iPad: icon, và việc `UILaunchScreen` chọn `LaunchMark-iPad@2x.png` (160 pt) theo idiom. Kiểm trên máy thật ở SK-020.
- Các cỡ iPhone khác: hình khởi động cùng 128 pt trên mọi iPhone, chưa chụp.

**Đề xuất cho tester**
- Thêm unit test ở `ScienceKidsTests` kiểm `Info.plist` của bundle có `UILaunchScreen.UIImageName == "LaunchMark"`, `CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconName == "AppIcon"`, và `UIImage(named: "LaunchMark")` khác nil. Như vậy lỡ đặt lại `ASSETCATALOG_COMPILER_APPICON_NAME` rỗng thì test bắt được.
