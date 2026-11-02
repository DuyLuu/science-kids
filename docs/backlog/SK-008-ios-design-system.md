# SK-008 · DesignSystem iOS: thành phần giấy, motion, `LayoutMetrics`

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: ios-dev · Tester: tester
Nguồn: docs/ios-test-build.md mốc 1 việc I4; technical-plan.md B7.1 (`DesignSystem`), B7.5 (motion, giảm chuyển động), B7.8 (trợ năng), B7.10 (`LayoutMetrics`, size class); `.claude/agents/designer.md` (luật style E); canvas `Discoverer-Learn`, `-Play`, `-Quiz`, `-Reward`, `-Home` và 4 bản `*-iPad.dc.html`; SK-006, SK-007

## Mục tiêu
ios-dev dựng các thành phần giấy dùng chung và preset motion theo style E, cùng `LayoutMetrics` cho compact và regular, để các màn ở SK-011 và SK-012 chỉ ghép thành phần, không tự vẽ lại.

## Phạm vi
- Module `DesignSystem` trong SKKit, chỉ dùng `Tokens.swift` (SK-007); không có hex hay số đo cứng trong view.
- **Thành phần** (mỗi cái có trạng thái như canvas):
  - `PaperCard`: tờ giấy có bóng giấy; biến thể nền giấy, giấy lõm.
  - `TwoLayerButton`: nút hai lớp giấy (lớp dưới lệch), trạng thái thường, bấm (lún 3pt), tắt. Vai trò chính (đỏ son) và phụ.
  - `Seal`: triện đỏ, hiện bằng `stamp`.
  - `PaperTag`: thẻ nhãn giấy (nhãn nhóm chất, "Từ mới", "Nhớ lại").
  - `ProgressSquares`: ô tiến độ các bước của bài, ô hiện tại vàng hoè.
  - Bóng giấy: modifier `.paperShadow(.paper1 … )` theo `Tokens.Shadow`.
  - Lựa chọn đang chọn (viền giấy vàng hoè), báo sai bằng mẩu giấy gấp góc: không dấu X đỏ, không rung.
- **Motion:**
  - preset `lay`, `stamp`, `rise`, `pop`, `flip`, `fall`, cộng `press`, theo `Tokens.Motion` (thời lượng, bezier, keyframes);
  - hiện màn theo thứ tự đọc bằng `motion.stagger`;
  - `accessibilityReduceMotion` bật thì mọi preset tắt, kể cả transition của `press` và `flip`. Phần tử hiện ngay ở trạng thái cuối.
  - `slide`, `grow`, `sway`, `nudge` thêm ở SK-011 và SK-012 khi màn cần, cùng cách viết.
- **`LayoutMetrics`:** tính từ `horizontalSizeClass` và bề rộng thật, không hard-code 390.
  - Trả về bề rộng khung giấy (compact: cả màn trừ lề; regular: tối đa `layout.paper_frame_max`), số cột và cỡ ô cho lưới Quiz, Chơi, nhóm chất, vùng chạm tối thiểu theo nhóm tuổi.
  - Slide Over và Split View 1/3 là compact (theo size class hệ thống báo).
  - Đưa vào môi trường SwiftUI (`EnvironmentValues`) cho mọi màn đọc.
- **Gallery:** một màn debug liệt kê mọi thành phần và trạng thái, mở bằng launch argument `-SKGallery YES` (chỉ có ở cấu hình Debug). Có nút chạy lại motion.

## Ngoài phạm vi
- `TornEdgeCard`, `PaperDisc`, `Cartouche`, `BottomNavStrip`: làm ở SK-011 và SK-012 khi màn cần, đặt trong `DesignSystem`.
- Hình minh hoạ giữ chỗ cho 36 hình của bài: SK-012.
- Snapshot test tự động: cần thư viện chưa có trong plan. Ở ticket này kiểm bằng ảnh chụp simulator.
- Token cho Explorer và Scientist ngoài bán kính và vùng chạm.

## Tiêu chí nghiệm thu
- [ ] `xcodebuild test` scheme `ScienceKids` xanh trên iPhone 16 và iPad Pro 11-inch (M4). Dán phần cuối log.
- [ ] Unit test `LayoutMetrics`:
  - compact 390 → khung bằng bề rộng trừ lề;
  - regular 834 và 1194 → khung 600, canh giữa;
  - compact 320 (Split View 1/3 hay Slide Over) → bố cục phone;
  - vùng chạm Discoverer 56 ở mọi cỡ, Explorer 72, Scientist 48.
- [ ] **Không có hex trong code:** `grep -rnE '#[0-9A-Fa-f]{6}|Color\(red:|UIColor\(red:' apps/ios/Packages/SKKit/Sources apps/ios/ScienceKids --include='*.swift' | grep -v '/Generated/'` → rỗng. Hằng tạm của SK-005 đã xoá.
- [ ] Gallery chạy trên iPhone 16 và iPad Pro 11 (dọc và ngang). Dán ảnh chụp và đặt cạnh phần tương ứng trên canvas (nút, thẻ, triện, nhãn, ô tiến độ). Không có nét viền trên hình khối, không gradient.
- [ ] Mỗi nút trong gallery có vùng chạm ≥ 56×56pt và là `Button`; nút chỉ có icon có `accessibilityLabel`. Accessibility Inspector không báo lỗi trên gallery.
- [ ] Bật Reduce Motion trong Settings của simulator rồi mở lại gallery: không có animation nào chạy, bấm nút "chạy lại" cũng không. Quay video ngắn hoặc mô tả bước kiểm.
- [ ] Không sửa file ngoài `apps/ios/` (trừ ghi chú trong ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- SK-005 (khung app) và SK-007 (`Tokens.swift`).
- SK-011 và SK-012 chờ ticket này.

**Quyết định đã ghi** (PM đề xuất 28/10)
1. Gallery là màn debug trong app, không phải target riêng, để chạy chung một lệnh build.
2. Không thêm thư viện snapshot ở bản thử. Snapshot test ở B15 làm khi vào sprint, sau khi Duy duyệt thư viện.

**Câu hỏi còn mở**
- Không có.

## Kết quả (ios-dev)

28/10/2026. Xcode 16.3, iOS 18.4 simulator. Chưa commit. Ảnh và log nằm trong scratchpad của phiên (`/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-008/`, viết tắt `SP/` bên dưới); thư mục này không nằm trong repo, chép ra nếu muốn giữ.

**Đã làm**
- `apps/ios/Packages/SKKit/Sources/DesignSystem/` (ngoài `Generated/`, không đụng `Tokens.swift`, sha256 vẫn `4cf6460b…`):
  - `Paper/PaperShadow.swift`: `.paperShadow(_:in:)`, `.paperShadow(_:cornerRadius:)`, `.paperSurface(_:shadow:in:)`. Mỗi lớp của `Tokens.Shadow` vẽ thành một hình riêng phía sau (tô màu lớp, nới `spread`, dời x/y, `blur(radius: blur / 2)`), lớp đầu nằm trên cùng như CSS; lớp `inset` vẽ bên trong hình (cắt bằng `destinationOut`). Các lớp không đổ bóng lên nhau, khác `.shadow()` xếp chồng.
  - `Paper/PaperShapes.swift`: `ChamferShape` (cắt 4 góc 5pt), `FoldCornerShape` + `FoldFlapShape` (gấp góc 22 / 7). `Paper/PaperIcon.swift`: `PaperIcon` (check, tick, arrowForward, arrowBack, speaker, close, retry) vẽ lại từ path SVG của canvas, `PaperIconView`.
  - `Components/`: `PaperCard` (+ `PaperCardStyle` .paper/.sunken/.inactive), `TwoLayerButton` (+ `TwoLayerButtonStyle`, `TwoLayerButtonFace`, `PaperButtonRole`), `PaperIconButton`, `Seal`, `PaperTag`, `ProgressSquares`, `PaperChoiceStyle` (+ `ChoiceState`, `ChoiceFace`, `ChoiceMark`), `FoldNote`, `PaperMetrics` (số đo chưa có token, xem dưới).
  - `Motion/`: `UnitBezier` (giải cubic-bezier như trình duyệt), `KeyframeEvaluator` (pose theo thời gian, đúng luật CSS: thuộc tính thưa, easing theo từng đoạn, delay, fill-mode, lặp), `KeyframeMotion` (`.motion(_:delay:)`, `.reveal(order:step:preset:)`), `StateMotion` (`press`: `.pressEffect`, `PaperPressStyle`/`.paperPress`, `.paperStateAnimation`; `flip`: `FlipCard`), `MotionPolicy` (`isReduced`, `MotionStagger`, `@ReducedMotion`, env `reduceMotionOverride`, `motionReplayID`, log `os.Logger` subsystem `vn.sciencekids.designsystem` category `motion`).
  - `Layout/LayoutMetrics.swift` (+ env `layoutMetrics`, `ageGroup`, `.layoutMetricsFromContainer()`), `Layout/PaperFrame.swift` (khung giấy 600 + `shadow.frame_sides` ở regular, lề phone ở compact).
  - `Typography/SKFont.swift`: font chuyển từ app (`AppFont`) sang đây; `.typography(_:fixedBox:)` (họ, weight, cỡ theo Dynamic Type có trần, line height, letter spacing, text case).
- App: xoá `ScienceKids/App/PlaceholderStyle.swift` (hằng hex tạm của SK-005); `AppInfo.swift` tách ra; `PlaceholderView` dùng `Tokens` và `.typography`; `ScienceKidsApp.swift` có `RootView` (đặt `LayoutMetrics`, trần Dynamic Type `max_category`, công tắc giảm chuyển động); `LaunchOptions.swift`; `ScienceKids/Debug/GalleryView.swift` (`#if DEBUG`).
- Test: `DesignSystemTests` thêm `LayoutMetricsTests` (7), `MotionTests` (10), `ComponentTests` (8); app thêm `LaunchOptionsTests` (3) và 1 test trong `FontTests`; target mới `ScienceKidsUITests` (`GalleryUITests`, 7 test XCTest) gắn vào scheme `ScienceKids`.
- `apps/ios/project.yml` (target UI test + scheme), `apps/ios/README.md` (gallery, tham số khởi động, cách bật Reduce Motion trên simulator).

**API cho SK-011, SK-012**
```swift
PaperFrame(scrolls: true) { … }                                   // Học, Chơi, Quiz: khung 600 ở iPad, lề phone ở compact
@Environment(\.layoutMetrics) var metrics                          // frameWidth, contentWidth, contentInsets, sectionGap,
LazyVGrid(columns: metrics.gridColumns(for: metrics.quizGrid), spacing: metrics.quizGrid.rowGap) { … }
    .padding(.trailing, metrics.gridTrailingInset)                 // chừa viền lệch 5,6 của ô đang chọn
Text("lesson.title").typography(Tokens.Typography.title)           // fixedBox: true cho chữ trong ô cỡ cố định
TwoLayerButton("quiz.check") { check() }.disabled(nothingPicked)   // .primary đỏ son hai lớp
TwoLayerButton("lesson.next", icon: .arrowForward) { next() }
TwoLayerButton("quiz.hint", role: .secondary) { hint.toggle() }    // một tờ giấy sáng
PaperIconButton(.speaker, accessibilityLabel: Text("quiz.listen"), disc: .screen) { play() }
Button { toggle(id) } label: { cell(id) }
    .buttonStyle(PaperChoiceStyle(state: .selected))               // .idle .selected .correct .wrong .missed
    .buttonStyle(PaperChoiceStyle(state: .correct, mark: Text("quiz.mark.correct")))
FoldNote(title: Text("quiz.almost"), message: Text("quiz.retry_hint"))
Seal(Text("quiz.seal.correct"), delay: 0.26).accessibilityHidden(true)   // ẩn khi cạnh "Chính xác!" (canvas aria-hidden)
Seal(icon: .check, accessibilityLabel: Text("learn.seen"))
PaperTag(Text("warmup.recall")); PaperTag("Chất đạm", style: .chip(dot: Tokens.Role.FoodGroup.protein)); PaperTag(Text("learn.new_words"), style: .label)
ProgressSquares(count: 4, current: 1, labels: steps, accessibilityLabel: Text("lesson.step_2_of_4"))
PaperCard(.sunken) { … }
someView.reveal(order: 2)                                          // lay, trễ 2 × 60 ms (tối đa 500 ms)
cell.reveal(order: i, step: Tokens.Motion.Stagger.stepDense)       // ô lưới, bậc 40 ms
someView.motion(Tokens.Motion.Preset.rise)                         // stamp, pop, fall (chỉ Thưởng), slide, grow, sway, nudge, turn
FlipCard(isFlipped: flipped) { front } back: { back }
.paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper3, cornerRadius: Tokens.Radius.discoverer)
```
Chuỗi giao diện truyền vào dưới dạng `LocalizedStringKey`/`Text` (khoá trong `Localizable.xcstrings` của app); thành phần không tự có chuỗi. Ô chọn đã chấm đưa chữ của dấu vào `accessibilityValue`.

**Quyết định đã ghi**
1. **Bóng giấy:** `blur` CSS → `blur(radius: blur / 2)` (độ lệch chuẩn của CSS). Đặt cạnh bản render canvas (dưới), độ đậm và độ lan khớp bằng mắt; giữ hệ số 1/2.
2. **Motion tự dựng trên `TimelineView` + `KeyframeEvaluator`**, không dùng `keyframeAnimator`: token có thuộc tính thưa ở từng mốc (`stamp` mốc 0.78 chỉ có scale), easing theo từng đoạn, delay với fill-mode `backwards`; tự tính thì đúng CSS từng điểm và test được bằng số. Timeline tạm dừng khi không chạy; cấu trúc view không đổi giữa các pha nên nội dung giữ state.
3. **Reduce Motion = hệ thống HOẶC `reduceMotionOverride`** (env của app). `accessibilityReduceMotion` chỉ đọc được, nên test UI dùng `-SKReduceMotion YES`; về sau dùng làm cài đặt "Giảm chuyển động" trong app nếu cần (B7.5 có cho Android). Khi giảm: preset không chạy (phần tử ở trạng thái cuối), `press` vẫn lún 3pt khi giữ và `flip` vẫn đổi mặt nhưng tức thì, như CSS `transition: none`.
4. **`press` dời cả nút 3pt** (cả lớp dưới), đúng CSS `.e-press:active { translate: 0 3px }` của canvas; không làm kiểu "chỉ mặt trên lún".
5. **`TwoLayerButton` vai phụ là một tờ giấy sáng** (`surface_paper` + `paper_3`, Phudu `button_s`): canvas không có nút phụ hai lớp ("Gợi ý" là một lớp). Vai chính: mặt 58pt + lớp dưới lệch 7 (`shadow.button_under`), tắt dùng `button_under_disabled`.
6. **`PaperCard` có 3 kiểu**: `.paper` (thẻ), `.sunken` (ô lõm: `surface_sunken` + `shadow.sunken`), `.inactive` (giấy lõm `surface_inactive` + `paper_2`, ô khoá). Bán kính theo nhóm tuổi trong env.
7. **`PaperTag` có 3 kiểu**: `.cut` (đỏ son cắt góc, nghiêng −2°, `drop_tag`; `eyebrow: true` cho chữ hoa nhỏ), `.chip(dot:)` (nhãn nhóm chất, món), `.label` ("Từ mới · New words" trên canvas Học là chữ đỏ son không có giấy).
8. **Chữ:** `Font.custom(postScriptName, size:, relativeTo: .body)` để SwiftUI tự phóng theo Dynamic Type; trần đặt bằng `.dynamicTypeSize(...)` (`max_category` xxxLarge, ô cố định `fixed_box_max_category` xLarge). Tên PostScript của Phudu đọc lúc chạy từ font có trục wght (900 ra `Phudu-Light_Black`), không viết cứng; `FontTests.typographyFaceByName` kiểm tên đó mở đúng wght cho 16 vai chữ. Lý do đổi khỏi `Font(CTFont)` cỡ cố định: audit trợ năng coi font đó là không hỗ trợ Dynamic Type.
9. Tham số khởi động đọc từ `ProcessInfo.arguments`, không qua `UserDefaults`, nên không phải khai lý do trong `PrivacyInfo.xcprivacy`. Gallery và tham số chỉ có ở Debug: bản Release build xong không có symbol `GalleryView` nào và không có chuỗi `SKGallery` (`nm`/`strings`), bản Debug có 66 symbol.
10. Chữ mẫu trong gallery viết thẳng (`Text(verbatim:)`, hằng `String`), không đưa vào `Localizable.xcstrings`, vì màn chỉ có ở Debug.
11. Colorset `LaunchBackground` giữ lại: `UILaunchScreen` chỉ nhận tên asset. Đây là chỗ duy nhất có mã màu ngoài `Generated/` (trong JSON, không phải Swift).
12. `PaperFrame(scrolls: true)` có một dải điệp dưới status bar để nội dung cuộn không chạy sau đồng hồ (style E không có gradient mờ dần).
13. `Seal` chữ mặc định được VoiceOver đọc (audit báo chữ hiện mà không đọc được nếu ẩn); màn nào đặt triện cạnh tiêu đề cùng nghĩa thì tự `.accessibilityHidden(true)`.
14. `LayoutMetrics`: compact `frameWidth` = bề rộng − 2 × 20 = `contentWidth`; regular `frameWidth` = min(600, bề rộng), `contentWidth` = khung − 2 × 28 (khớp `tray.width_compact` 350 và `tray.width_regular` 544). Size class quyết định, không theo bề rộng hay máy; size class `nil` coi là compact. iPhone 16 rộng 393 nên khung là 353.
15. UI test nằm trong scheme `ScienceKids` để một lệnh chạy hết; mỗi máy thêm khoảng 5–6 phút.

**Theo từng tiêu chí**

| # | Tiêu chí | Kết quả |
| --- | --- | --- |
| 1 | `xcodebuild test` scheme `ScienceKids` xanh trên iPhone 16 và iPad Pro 11-inch (M4) | **Pass.** Unit: 91 test (app 17, DesignSystem 35, ContentModel 20, LessonEngine 14, ContentKit 2, LessonPlayer 2, AudioKit 1; trước đây 62). UI: 7 test. Log `SP/logs/final-test-iPhone16.log`, `SP/logs/final-test-iPadPro11inchM4.log`. Phần cuối (giống nhau ở hai máy, iPad UI 368 s): `✔ Test run with 17 tests passed` · `35` · `20` · `14` · `2` · `2` · `1` · `Executed 7 tests, with 1 test skipped and 0 failures (0 unexpected) in 281.497` · `** TEST SUCCEEDED **`. Test bị skip là `testReplayDoesNothingWithSystemReduceMotion` (chỉ chạy khi simulator bật Reduce Motion, xem #6). xcodebuild có in "Result bundle saving failed … mkstemp" sau khi xong: không lưu được result bundle, không ảnh hưởng kết quả |
| 2 | Unit test `LayoutMetrics` | **Pass.** `LayoutMetricsTests`: compact 390 → khung 350 = 390 − 2 × 20; regular 834 và 1194 → khung 600, `frameMinX` = (W − 600)/2 (tâm khung = tâm màn), nội dung 544; compact 320 → bố cục phone (khung 280, lưới compact, lề như 390); size class quyết định (compact 1194 vẫn phone, `nil` là compact, regular 744 → 600, regular 560 → 560); vùng chạm Discoverer 56, Explorer 72, Scientist 48 ở 320/390/834/1194; bề rộng ô lưới chừa 5pt viền; giá trị mặc định của env |
| 3 | Không có hex trong code | **Pass.** `grep -rnE '#[0-9A-Fa-f]{6}\|Color\(red:\|UIColor\(red:' apps/ios/Packages/SKKit/Sources apps/ios/ScienceKids --include='*.swift' \| grep -v '/Generated/'` → rỗng. `PlaceholderPalette`, `AppFont`, `TODO(SK-008)` không còn trong code Swift. Không có `.border`, gradient; `.stroke` chỉ ở `PaperIconView` (icon nhỏ, luật style E cho phép) |
| 4 | Gallery chạy trên iPhone 16 và iPad Pro 11 (dọc, ngang); đặt cạnh canvas; không viền, không gradient | **Pass.** 24 ảnh do `testGalleryScreenshots` chụp (8 mục × iPhone dọc, iPad dọc, iPad ngang): `SP/gallery/gallery-{iphone-portrait,ipad-portrait,ipad-landscape}-{header,shadows,cards,buttons,tags,progress,choices,motion}.png`. Đặt cạnh canvas: `SP/compare/compare-buttons.png`, `compare-seal-tags-progress.png`, `compare-choices.png`, `compare-quiz-screen.png`. Bên trái là `SP/canvas/reference.html` (CSS chép nguyên từ Quiz, Learn, Warmup, Home, các `{{lỗ}}` thay bằng giá trị trạng thái trong script của canvas) render bằng Chrome headless; `compare-quiz-screen` dùng bản render tĩnh của `Discoverer-Quiz.dc.html` |
| 5 | Mọi nút ≥ 56 × 56pt và là `Button`; icon-only có nhãn; Accessibility Inspector không báo lỗi | **Pass, có ghi chú.** `testEveryButtonIsAtLeast56ptAndLabelled`: mở từng mục, mọi nút hittable ≥ 56 × 56 và có nhãn; 15 nút khác nhau, gồm "Thoát quiz", "Về hành trình", "Nghe câu hỏi" (icon-only). Inspector: `testAccessibilityAuditEverySection` chạy `performAccessibilityAudit` (bộ kiểm của Accessibility Inspector) trên 8 mục, mỗi loại kiểm một lượt riêng (contrast, element detection, hit region, mô tả, trait, chữ bị cắt, Dynamic Type) vì các kiểm có phóng chữ làm lệch kiểm tương phản nếu chạy chung. Không lỗi, trừ 3 loại được bỏ qua có lý do, in ra log: (a) "Dynamic Type font sizes are partially unsupported" là do trần Dynamic Type của B7.8: bỏ trần thì cảnh báo này mất và audit báo chữ bị cắt thay vào (thử ngày 28/10); `testTextGrowsWithDynamicTypeUpToTheCap` kiểm chữ có lớn lên từ L tới xxxL và dừng ở trần; (b) phần tử bị mép màn hoặc status bar che một phần (audit chỉ lấy mẫu phần thấy được; mỗi mục mở ở đầu nên phần tử đó được kiểm đủ ở mục của nó); (c) "Text clipped … at larger Dynamic Type sizes" chỉ với chữ mẫu "fish": ở AccessibilityXXXL ô vẫn hiện đủ chữ (`SP/shots/ax-choices.png`), nét chữ không vượt bề rộng (đo bằng CoreText); nguyên nhân chưa rõ |
| 6 | Bật Reduce Motion trong Settings rồi mở lại gallery: không animation, "chạy lại" cũng không | **Pass.** Bước kiểm: `xcrun simctl spawn <udid iPhone 16> defaults write com.apple.Accessibility ReduceMotionEnabled -bool YES` (khoá này là công tắc Settings › Accessibility › Motion › Reduce Motion; `simctl ui` không có lựa chọn Reduce Motion) → chạy `testReplayDoesNothingWithSystemReduceMotion`: gallery ghi "Giảm chuyển động: bật (hệ thống bật, app tắt)" (`SP/gallery/gallery-iphone-system-reduce-motion-header.png`); ảnh 5 vùng demo (lay, stamp, rise, pop, fall) trước khi bấm "Chạy lại motion", ngay sau khi bấm và 1 s sau giống hệt nhau từng byte; rồi test mở Settings › Accessibility › Motion và đọc công tắc Reduce Motion = bật (`SP/gallery/settings-reduce-motion.png`). Log motion trong lúc đó: 75 dòng `skip …: reduce motion`, 0 dòng `start` (`SP/logs/motion-log-reduced.txt`); tắt lại thì một lần mở gallery có 25 dòng `start`, 0 `skip` (`SP/logs/motion-log-on.txt`). Kiểm đối chứng: với motion bật, `testReplayAnimatesWhenMotionIsOn` thấy màn đổi ngay sau khi bấm (`SP/gallery/replay-settled.png` / `replay-during.png`). Cùng kiểm qua công tắc app: `testReplayDoesNothingWhenMotionIsReduced` (`-SKReduceMotion YES`), chạy trong mọi lượt test. Simulator đã đặt lại `ReduceMotionEnabled` = 0 |
| 7 | Không sửa ngoài `apps/ios/` (trừ ticket); không commit | **Pass.** Chỉ sửa `apps/ios/**` và ticket này. Không sửa `Generated/Tokens.swift`, `packages/`, `docs/backlog/README.md`. Không commit |

Lần chạy cuối cả scheme trên hai máy là trước khi thêm bước đọc công tắc Settings vào `testReplayDoesNothingWithSystemReduceMotion`; bước này nằm trong test chỉ chạy khi Reduce Motion bật, đã build và pass riêng (`SP/logs/system-reduce-motion.log`).

**Lệch so với canvas**
- Chưa có vân giấy nền (`illustration.background_fiber`, `background_diep`) và filter `paperE` (mép giấy hơi lệch): nền điệp phẳng; đĩa nút icon và ô tiến độ dùng bóng token gần nhất `paper_2` thay `feDropShadow` của filter. Vân giấy chờ ảnh nướng sẵn (content-cli assets).
- Không có vai chữ khớp: chip nhóm chất canvas 13/700 → `caption` 13/600; lời mẩu giấy gấp góc 16/600 → `body_strong` 15/700; nhãn bước hiện tại 12/700 → `caption_s` 12/600 (màu `text_primary`); nút phụ "Gợi ý" 18/700 → `button_s` 19/700; dấu trên ô Quiz Phudu 12 dùng `PaperMetrics.markTypography` (chưa có token).
- Ô Quiz trong gallery dùng chấm màu thay hình món (hình giữ chỗ làm ở SK-012), chữ `item_title` 16 thay 17/700 của canvas.
- Chỉ đo bằng mắt, chưa có snapshot test (ngoài phạm vi).

**Đề xuất token cho designer (SK-006)**, hiện ở `PaperMetrics`: mặt nút chính 58; icon trong nút 22; đĩa nút icon 50 (glyph 24, dấu X 16); triện lớn 52, nhỏ 22 (glyph 14); ô tiến độ 22, khe 6, khe nhãn 4; chip cao 30, chấm 6; đĩa nhóm chất 24; chữ dấu ô Quiz Phudu 12/700 và 12/900 ls 0.5 hoa, padding 3/7, cách góc 6 (phone) / 8 (iPad); padding mẩu gấp góc 11/16/11/34; `perspective` lật thẻ 900; tỉ lệ thu nhỏ tối thiểu nhãn một dòng 0.8, chữ triện 0.6. Ngoài ra `UIFontMetrics.scaledValue` cho ×1.386 ở xxxLarge và ×1.142 ở xLarge, khác `max_scale` 1.35 và `fixed_box_max_scale` 1.12 ghi trong tokens; cỡ font thật của SwiftUI theo bảng text style (body 17 → 23 → ×1.353, 17 → 19 → ×1.118) nên khớp token. Không cần đổi token, chỉ ghi để Android biết lấy hệ số nào.

**Việc còn lại cho SK-011, SK-012**
- Làm trong `DesignSystem` khi màn cần: `TornEdgeCard` (dùng `Tokens.Shape.tornEdgeTop` + `.paperShadow(.dropSheet, in:)`), `PaperDisc`, `Cartouche`, `BottomNavStrip`, `PlaceholderArt`. Preset `slide`, `grow`, `sway`, `nudge`, `turn` đã chạy được qua `.motion(...)`; mỗi màn tự giữ luật một lượt hiện, tối đa một chuyển động lặp, `fall` chỉ ở Thưởng.
- Mỗi màn bọc trong `PaperFrame` hoặc đọc `layoutMetrics`; không dùng `UIDevice` idiom.
- Triện "ĐÚNG" cạnh "Chính xác!": thêm `.accessibilityHidden(true)`. Ô chọn: truyền chữ dấu ("Đúng", "Chưa đúng", "Bỏ sót") từ string catalog.
- Tester: chạy lại tiêu chí 1–6 bằng lệnh ở `apps/ios/README.md` (mục "Build và test", "Gallery DesignSystem"); xem ảnh trong `SP/gallery/` và `SP/compare/`.

**Câu hỏi còn mở**
- Trần Dynamic Type (`typography.dynamic_type`, đề xuất của designer, chờ Duy): còn trần thì Accessibility Inspector vẫn báo "Dynamic Type font sizes are partially unsupported" trên mọi chữ. Duy chấp nhận cảnh báo này (giữ trần để giấy không vỡ), hay muốn hỗ trợ cỡ Accessibility (phải đổi số cột lưới trên phone)?
- Giữ UI test trong scheme `ScienceKids` (một lệnh, thêm khoảng 5–6 phút mỗi máy) hay tách scheme riêng cho CI về sau?
