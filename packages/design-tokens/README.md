# packages/design-tokens

Design tokens v1 của style E "Giấy cắt Đông Hồ". `tokens.json` là nguồn duy nhất cho màu, chữ, bo góc, vùng chạm, khoảng cách, bóng giấy, hình cắt giấy, filter giấy, motion và bố cục iPad. SK-007 sinh `Tokens.swift` từ file này, SK-008 dựng DesignSystem trên đó, để dev không phải đọc HTML canvas hay tự đoán số.

Nguồn: CSS trong 21 file `design/play-ui/project/Discoverer-*.dc.html` (17 màn phone, 4 màn iPad của SK-004), `Style-E-Tile.dc.html`, note `explorerRules`, `discovererRules`, `scientistRules`, `discovererIpadRules` trong `canvas.json`, `.claude/agents/designer.md`, technical-plan B7.5, B7.8, B7.10. Trích ngày 28/10/2026. Canvas là bản Duy đã duyệt; file này không thiết kế lại. Ngày 29/10/2026 Duy chốt đổi màu báo đúng từ đỏ son sang lá tre `#3F7A33` (`color.palette.la_tre`); canvas và token đã đổi theo, chi tiết ở mục cuối của `docs/backlog/SK-006-design-tokens-v1.md`.

```
packages/design-tokens/
  tokens.json                  # nguồn duy nhất
  README.md                    # file này
  package.json                 # npm run export:swift | check:swift | test
  scripts/export-swift.mjs     # tokens.json → Tokens.swift (SK-007), xem mục "Xuất Swift"
  test/export-swift.test.mjs   # test của script (node:test)
```

## Cách đọc `tokens.json`

**Định dạng.** Theo W3C Design Tokens (DTCG): mỗi lá là một object có `$value` và `$type`, thêm `$description` khi cần. Nhóm (object không có `$value`) có thể có `$description`. Không có khoá nào khác ngoài nhóm, lá và các khoá `$…`.

**Tên.** Khoá là chữ thường không dấu, `snake_case` (`^[a-z0-9]+(_[a-z0-9]+)*$`).
- `color.palette` dùng tên màu Việt bỏ dấu: `diep`, `giay`, `do_son`… Năm khoá `do_son`, `vang_hoe`, `gi_dong`, `cham`, `nau_dat` trùng enum `ColorToken` của `packages/content-schema` (SK-001), nên nội dung bài dùng thẳng tên đó. `la_tre` chỉ để báo đúng, không phải màu nội dung, nên không vào `ColorToken`.
- Lớp dưới và sắc sáng của một màu gốc thêm hậu tố tiếng Anh `_deep`, `_light` (`do_son_deep`, `vang_hoe_light`).
- Mọi nhóm khác đặt bằng tiếng Anh: `color.role.action_primary`, `shadow.paper_3`, `motion.preset.lay`.
- Thang khoảng cách mang số trong tên (`space.s12` = 12) để đọc là biết giá trị; Swift không cho tên bắt đầu bằng số nên có chữ `s`.

**Tham chiếu.** Chuỗi `"{color.palette.do_son}"` trỏ tới lá có đường dẫn đó. Tham chiếu chỉ trỏ tới lá, có thể nằm trong giá trị ghép (màu của một lớp bóng, `family` và `weight` của một vai chữ). Vai màu luôn là tham chiếu, không ghi lại mã hex.

**Đơn vị.** Ghi số trần, không kèm đơn vị:

| Đại lượng | Đơn vị | Ghi chú |
| --- | --- | --- |
| Kích thước, khoảng cách, bán kính, bóng, cỡ chữ, `letter_spacing` | pt | 1 px trên canvas = 1 pt trong app |
| `line_height` | bội số của cỡ chữ | 1.3 nghĩa là dòng cao 1,3 × cỡ chữ |
| `duration`, `delay` | ms | |
| `easing` | 4 số cubic-bezier `[x1, y1, x2, y2]` | `ease` của CSS = `[0.25, 0.1, 0.25, 1]`, `ease-in-out` = `[0.42, 0, 0.58, 1]` |
| `rotate`, `rotate_y`, `shape.tilt_*` | độ | |
| `alpha`, `opacity` | 0–1 | |
| `origin` | `[x, y]` theo tỉ lệ khung (0–1) | khớp `UnitPoint` của SwiftUI |
| `translate_y_percent` | % chiều cao của chính phần tử | chỉ preset `rise` |

**`$type` dùng trong file.** Kiểu chuẩn DTCG: `color` (hex 6 số), `dimension`, `duration`, `number`, `fontFamily`, `fontWeight`, `typography`, `shadow`. Kiểu riêng của dự án: `string`, `boolean`, `polygon`, `grid`, `svgFilter`, `keyframeAnimation`, `stateTransition`.

**Chỗ lệch chuẩn DTCG (có chủ ý, theo ticket SK-006).**
- `dimension` và `duration` ghi số trần thay cho `{ "value": 16, "unit": "px" }`. Công cụ DTCG ngoài (Style Dictionary…) cần một bước đổi khi xuất Kotlin, CSS sau beta.
- `typography` dùng khoá `family`, `size`, `weight`, `line_height`, `letter_spacing`, `text_case` thay cho `fontFamily`, `fontSize`…
- `shadow` là mảng lớp `{x, y, blur, spread, color, alpha, inset}`; `color` là tham chiếu tới màu gốc đặc, độ trong suốt tách ra `alpha`. Nhờ vậy file không có mã màu 8 số và mọi mã hex đều có trên canvas.

**Giá trị ghép.**
- `typography`: `{ family, size, weight, line_height, letter_spacing, text_case }`; `text_case` là `none` hoặc `upper`.
- `shadow`: mảng lớp, lớp đầu vẽ trên cùng. `blur` là bán kính mờ kiểu CSS.
- `polygon` (`shape.torn_edge_top`): mảng điểm `[x, y]` của mép trên, `x` theo tỉ lệ bề rộng, `y` theo pt từ mép trên; khép hình bằng hai góc đáy.
- `grid`: `{ columns, cell_height, row_gap, column_gap }`.
- `svgFilter`: tham số filter SVG (`feTurbulence`, `feDisplacementMap`, `feDropShadow`, `feColorMatrix`) để `content-cli assets` nướng vào WebP. App không chạy filter.
- `keyframeAnimation`: `{ duration, easing, delay, stagger, iteration, fill_mode, origin, keyframes[] }`. `iteration` là `1` hoặc `"infinite"`. `stagger: true` nghĩa là độ trễ thật = `delay` + `--d` của mảnh đó (xem `motion.stagger`). `fill_mode: "backwards"`: trong lúc chờ trễ, mảnh đứng ở mốc đầu (thường là ẩn). Mỗi mốc `keyframes` có `offset` 0–1 và các thuộc tính `opacity`, `translate_x`, `translate_y`, `translate_y_percent`, `scale`, `scale_x`, `scale_y`, `rotate`, `rotate_y`. Theo luật CSS: thuộc tính vắng ở một mốc thì nội suy giữa hai mốc gần nhất có nó (ví dụ `stamp` mốc 0.78 chỉ có `scale`); `easing` áp cho từng đoạn giữa hai mốc, không phải cả đường.
- `stateTransition` (`press`, `flip`): `{ duration, easing, delay, trigger, from, to, also[] }`. `trigger` là `pressed` (đang giữ, CSS `:active`) hoặc `state` (trạng thái đổi, như thẻ lật). `duration`, `easing` là của thuộc tính chính (`translate` với press, `rotate` với flip); `also` liệt kê thuộc tính chạy kèm với thời lượng riêng.

**Ghi chú cho SK-007 và SK-008** (gợi ý đổi sang SwiftUI, dev quyết):
- `shadow.blur` là bán kính mờ CSS; `.shadow(radius:)` của SwiftUI nhận gần đúng độ lệch chuẩn, thường lấy `blur / 2`. So bằng mắt với canvas trước khi chốt hệ số.
- `line_height` là bội số; SwiftUI cần `lineSpacing = size × (line_height − 1)` cộng chênh lệch so với line height mặc định của font.
- `keyframes` map thẳng sang track theo từng thuộc tính của `KeyframeAnimator`.
- `motion.rules.reduce_motion = "disable_all"`: đọc `accessibilityReduceMotion`, bỏ qua mọi preset, kể cả `press` và `flip`, hiện ngay trạng thái cuối.
- Chữ trên nút chính dùng `typography.button`. Nút là hai lớp giấy: mặt `color.role.action_primary`, lớp dưới `action_primary_under` lệch xuống 7 (`shadow.button_under`). Bản CSS ở Quiz: mặt cao 58 và `margin-bottom: 7px`; bản SVG ở các màn khác: khung 66, mặt 52 đặt ở y = 3, lớp dưới ở y = 10, mỗi lớp có filter `paperE`.
- `weight` 900 của Phudu: canvas ghi 800 ở nút nhưng helmet không tải 800, trình duyệt vẽ 900. App chỉ đóng gói 500, 700, 900 như helmet.

## Xuất Swift

`scripts/export-swift.mjs` (SK-007) biến `tokens.json` thành `apps/ios/Packages/SKKit/Sources/DesignSystem/Generated/Tokens.swift`. Chỉ cần Node 22 trở lên, không có phụ thuộc nên không phải `npm install`.

```sh
cd packages/design-tokens
npm run export:swift                         # ghi Tokens.swift; không đổi gì thì không ghi lại
npm run check:swift                          # sinh trong bộ nhớ rồi so; lệch thì exit 1 và in tên token
npm run check:swift -- --tokens <bản sao>    # so một bản sao tokens.json với Tokens.swift đang có
npm test                                     # test của script
```

**Quy trình.** Sửa `tokens.json` → `npm run export:swift` → commit `Tokens.swift` cùng lúc (B18 #5: app dùng code sinh ra đã commit). Không sửa tay file trong `Generated/`. CI về sau chạy `npm run check:swift` (B14). Test `DesignSystemTests/TokensExportTests.swift` của SKKit đọc `tokens.json` qua đường dẫn tương đối từ `#filePath` và cũng fail khi quên chạy lại script.

**Bảo đảm của script.**
- Một lá = một `public static let`. Mỗi lần chạy script in `Lá trong tokens.json: N · Hằng trong Tokens.swift: N`; hai số lệch thì exit 1.
- Thứ tự hằng theo thứ tự khoá trong `tokens.json`, không ghi giờ sinh, nên chạy lại ra đúng từng byte.
- Mỗi hằng có dòng doc đầu là đường dẫn token (``/// `color.palette.do_son` #A93A27``), dòng sau là `$description`. `check:swift` dựa vào dòng này để báo `lệch`, `thiếu trong Tokens.swift`, `thừa trong Tokens.swift` theo tên token.
- Dừng với lỗi nêu tên token (exit 1) khi gặp: `$type` chưa có ánh xạ, khoá lạ trong giá trị ghép, tham chiếu gãy, sai `$type` hoặc vòng, màu không phải `#RRGGBB`, tên Swift trùng, bắt đầu bằng số hoặc che kiểu SwiftUI. Thêm kiểu hay thuộc tính mới thì sửa script trước (bảng ánh xạ và hằng `TYPES` ở đầu script), rồi mới thêm token.

**Tên.** Khoá `snake_case` → `lowerCamelCase` (`do_son` → `doSon`, `title_xl` → `titleXl`, `paper_1` → `paper1`); nhóm → `enum` UpperCamelCase lồng nhau; khoá trùng từ khoá Swift được bọc backtick (`` `default` ``). Hai nhóm gốc `color`, `font` được bỏ một tầng để không có `Tokens.Color`, `Tokens.Font` che kiểu của SwiftUI.

| `tokens.json` | Swift | Kiểu |
| --- | --- | --- |
| `color.palette.*` | `Tokens.Palette.doSon` | `Color` sRGB |
| `color.role.*`, `color.role.food_group.*` | `Tokens.Role.actionPrimary`, `Tokens.Role.FoodGroup.fat` | `Color`, viết là tham chiếu `Tokens.Palette.doSon` |
| `color.age_group.*` | `Tokens.AgeGroupColor.discoverer` | `Color` |
| `font.family.*` | `Tokens.FontFamily.display` | `String` |
| `font.weight.*` | `Tokens.FontWeight.displayBlack` | `Int` (100–900) |
| `typography.*` | `Tokens.Typography.button` | `Tokens.Typography` |
| `typography.dynamic_type.*` | `Tokens.Typography.DynamicType.maxCategory` | `DynamicTypeSize` (`*_category`), `CGFloat` (`*_scale`) |
| `radius.*`, `touch_target.*`, `space.*` | `Tokens.Radius.discoverer`, `Tokens.TouchTarget.discoverer`, `Tokens.Space.s12` | `CGFloat` |
| `shadow.*` | `Tokens.Shadow.paper3` | `Tokens.Shadow` |
| `shape.torn_edge_top` | `Tokens.Shape.tornEdgeTop` | `[CGPoint]` (x tỉ lệ, y pt) |
| `shape.tilt_*` | `Tokens.Shape.tiltStamp` | `Angle` |
| `shape.*` còn lại | `Tokens.Shape.foldCorner` | `CGFloat` |
| `illustration.*` | `Tokens.Illustration.paperE` | `String`: JSON tham số filter, giữ nguyên (app không chạy filter) |
| `motion.preset.*` | `Tokens.Motion.Preset.lay` | `Tokens.KeyframeAnimation`; `press`, `flip` là `Tokens.StateTransition` |
| `motion.stagger.*` | `Tokens.Motion.Stagger.step` | `TimeInterval`, giây |
| `motion.rules.*` | `Tokens.Motion.Rules.reduceMotion` | `Int`, `Bool`, `String` |
| `layout.*`, `layout.tray.*` | `Tokens.Layout.paperFrameMax`, `Tokens.Layout.Tray.slotRegular` | `CGFloat`; `compact_layout` là `String`, `illustration_max_scale` là `CGFloat` |
| `layout.grid.<màn>.<cỡ>` | `Tokens.Layout.Grid.Quiz.compact` | `Tokens.GridSpec` |

**Kiểu theo `$type`.**

| `$type` | Swift |
| --- | --- |
| `color` | `Color(.sRGB, red: 0xA9 / 255, …)`; tham chiếu thì là hằng được trỏ tới |
| `dimension` | `CGFloat` (pt) |
| `duration` | `TimeInterval` theo **giây** (ms / 1000: 60 → `0.06`) |
| `number` | khoá `tilt_*` → `Angle` (`.degrees(-8)`); khoá `*_scale` → `CGFloat`; số nguyên → `Int`; còn lại `Double` |
| `string` | khoá `*_category` → `DynamicTypeSize` (`.xxxLarge`); còn lại `String` |
| `boolean` | `Bool` |
| `fontFamily`, `fontWeight` | `String`, `Int` |
| `typography` | `Tokens.Typography(family:size:weight:lineHeight:letterSpacing:textCase:)`; `text_case` `none` → `nil`, `upper` → `.uppercase` (`Text.Case?`) |
| `shadow` | `Tokens.Shadow([Layer(x:y:blur:spread:color:inset:)])`; `color` = màu gốc `.opacity(alpha)`, alpha 1 thì không có `.opacity` |
| `polygon` | `[CGPoint]` |
| `grid` | `Tokens.GridSpec(columns:cellHeight:rowGap:columnGap:)` |
| `svgFilter` | `String` chứa JSON của giá trị |
| `keyframeAnimation` | `Tokens.KeyframeAnimation(duration:easing:delay:stagger:repeats:fillMode:origin:keyframes:)`; giây; `easing` là `Tokens.CubicBezier(x1, y1, x2, y2)`; `repeats` = `iteration == "infinite"`; `origin` là `UnitPoint`; mỗi mốc là `Tokens.Keyframe(offset:pose:)`, `Tokens.Pose` có 9 thuộc tính tuỳ chọn (`rotate`, `rotateY` là `Angle`) |
| `stateTransition` | `Tokens.StateTransition(duration:easing:delay:trigger:from:to:also:preserve3d:)`; `from`, `to` là `Tokens.Pose`; `also` là `[Companion(property:duration:easing:)]` |

**Tham chiếu.** `{color.palette.do_son}` ra hằng Swift của lá đó (`Tokens.Palette.doSon`), không chép giá trị. Giá trị cuối vẫn là màu thật; lợi ích là đổi một màu gốc thì chỉ hằng đó đổi, `check:swift` báo đúng một tên. Tham chiếu trong `illustration.*` giữ nguyên trong chuỗi JSON.

**Tra theo nhóm tuổi.** `Tokens.AgeGroup` (`explorer`, `discoverer`, `scientist`, rawValue trùng chữ trong schema nội dung) có `.radius`, `.touchTarget`, `.color` trỏ về `radius.*`, `touch_target.*`, `color.age_group.*`. `touch_target.parent` và các bán kính khác chỉ có hằng riêng.

```swift
import DesignSystem

let button = Tokens.Typography.button             // Phudu 24, weight 900, lineHeight 1.2, letterSpacing 0.5
let face = Tokens.Role.actionPrimary              // = Tokens.Palette.doSon (#A93A27)
let minTap = Tokens.AgeGroup.discoverer.touchTarget   // 56
let layers = Tokens.Shadow.buttonUnder.layers     // [y 7 đỏ son đậm, y 9 blur 6 mực bóng 0.3]
let lay = Tokens.Motion.Preset.lay                // duration 0.46, easing (0.2, 0.8, 0.2, 1), 2 keyframes
let frame = Tokens.Layout.paperFrameMax           // 600
let quizGrid = Tokens.Layout.Grid.Quiz.regular    // 3 cột, ô 150, gap 14/12
```

Lưu ý khi viết code quanh `Tokens`: trong `extension Tokens…`, tên `Shape` và `Layout` trỏ tới `Tokens.Shape`, `Tokens.Layout`; cần protocol của SwiftUI thì viết `SwiftUI.Shape`, `SwiftUI.Layout`.

## Số token theo nhóm

Tổng **179 lá**.

| Nhóm | Số lá | Nội dung |
| --- | --- | --- |
| color.palette | 19 | màu gốc |
| color.role | 27 | vai màu (gồm 5 màu nhóm chất) |
| color.age_group | 3 | màu thế giới theo nhóm tuổi |
| font.family | 2 | họ chữ |
| font.weight | 6 | độ đậm đóng gói |
| typography | 21 | 17 vai chữ + 4 trần Dynamic Type |
| radius | 9 | bo góc |
| touch_target | 4 | vùng chạm |
| space | 13 | thang khoảng cách |
| shadow | 18 | bóng giấy |
| shape | 6 | hình cắt giấy |
| illustration | 3 | filter giấy để nướng hình |
| motion.preset | 12 | 11 preset chung + turn của Thưởng |
| motion.stagger | 3 | độ trễ lượt hiện |
| motion.rules | 5 | luật motion |
| layout | 28 | bố cục phone và iPad |

## Bảng đối chiếu token ↔ canvas

Mỗi lá một dòng. "File canvas" là một file đại diện, "dòng" là dòng đầu tiên có giá trị đó trong file đại diện, cột cuối là số file trong 21 file `Discoverer-*.dc.html` có giá trị (đếm bằng regex trên chuỗi CSS; với Explorer, Scientist đếm trên 5 file của nhóm đó). Bảng sinh tự động từ `tokens.json` rồi soát tay vị trí.

| Token | Giá trị | File canvas | Selector hoặc vị trí | Số file |
| --- | --- | --- | --- | --- |
| `color.palette.diep` | `#F0E6CF` | Discoverer-Learn.dc.html | nền khung `<div style="… background: #F0E6CF">`, dòng 43 | 21/21 |
| `color.palette.diep_tham` | `#E6D9BC` | Discoverer-Parent.dc.html | nhóm nút chọn `background: #E6D9BC; box-shadow: inset …`, dòng 158 | 11/21 |
| `color.palette.giay` | `#FBF6EA` | Discoverer-Quiz.dc.html | nút "Gợi ý" và ô đáp án (`st[id]`) `background: #FBF6EA`, dòng 157 | 21/21 |
| `color.palette.giay_lom` | `#E2D4B4` | Discoverer-Home.dc.html | ô chủ đề khoá `background: #E2D4B4`, dòng 156 | 20/21 |
| `color.palette.giay_lom_deep` | `#C9B993` | Discoverer-Quiz.dc.html | `checkStyle` khi tắt `0 7px 0 #C9B993`, dòng 239 | 7/21 |
| `color.palette.than_tre` | `#1E1B18` | Discoverer-Learn.dc.html | `color: #1E1B18` của khung, dòng 43 | 21/21 |
| `color.palette.chu_phu` | `#4E4336` | Discoverer-Learn.dc.html | dòng phụ đầu màn `color: #4E4336`, dòng 68 | 21/21 |
| `color.palette.do_son` | `#A93A27` | Discoverer-Quiz.dc.html | nút hai lớp `rect … fill="#A93A27"`, dòng 183 | 21/21 |
| `color.palette.do_son_deep` | `#6E2216` | Discoverer-Quiz.dc.html | lớp dưới nút `rect y="10" … fill="#6E2216"`, dòng 183 | 19/21 |
| `color.palette.vang_hoe` | `#E2A52A` | Discoverer-Learn.dc.html | bước hiện tại `rect x="120" … fill="#E2A52A"`, dòng 75 | 20/21 |
| `color.palette.vang_hoe_deep` | `#B97F16` | Discoverer-Home.dc.html | hình ô chủ đề, `fill="#B97F16"`, dòng 103 | 10/21 |
| `color.palette.vang_hoe_light` | `#F0C873` | Discoverer-Quiz.dc.html | `markStyle` "Bỏ sót" `background: #F0C873`, dòng 229 | 16/21 |
| `color.palette.gi_dong` | `#3B6E6A` | Discoverer-Learn.dc.html | `data.vit.color`, dòng 189 | 17/21 |
| `color.palette.gi_dong_deep` | `#2F5B57` | Discoverer-Play.dc.html | lá chuối lớp dưới `fill="#2F5B57"`, dòng 112 | 16/21 |
| `color.palette.la_tre` | `#3F7A33` | Discoverer-Quiz.dc.html | ô tiến độ đã xong `rect … fill="#3F7A33"` dòng 69; triện "ĐÚNG" dòng 173 (thêm 29/10) | 10/21 |
| `color.palette.cham` | `#2E4A6E` | Discoverer-Play.dc.html | chỗ trong mâm `background: #2E4A6E`, dòng 116 | 18/21 |
| `color.palette.cham_deep` | `#24395A` | Discoverer-Quiz.dc.html | chân bát `fill="#24395A"`, dòng 116 | 13/21 |
| `color.palette.nau_dat` | `#8A5E3B` | Discoverer-Learn.dc.html | `data.fat.color`, dòng 188 | 9/21 |
| `color.palette.muc_bong` | `#5B3B17` | Discoverer-Learn.dc.html | `<filter id="paperE">` `flood-color`, dòng 49 | 21/21 |
| `color.role.bg_screen` | `{color.palette.diep}` = `#F0E6CF` | Discoverer-Learn.dc.html | nền khung 390×844, dòng 43 | 21/21 |
| `color.role.surface_paper` | `{color.palette.giay}` = `#FBF6EA` | Discoverer-Quiz.dc.html | ô đáp án, khung câu hỏi, dòng 83 | 21/21 |
| `color.role.surface_sunken` | `{color.palette.diep_tham}` = `#E6D9BC` | Discoverer-Parent.dc.html | nhóm nút chọn ở Góc phụ huynh, dòng 158 | 11/21 |
| `color.role.surface_inactive` | `{color.palette.giay_lom}` = `#E2D4B4` | Discoverer-Home.dc.html | ô chủ đề khoá trên hành trình, dòng 156 | 14/21 |
| `color.role.text_primary` | `{color.palette.than_tre}` = `#1E1B18` | Discoverer-Learn.dc.html | `color` của khung, dòng 43 | 21/21 |
| `color.role.text_secondary` | `{color.palette.chu_phu}` = `#4E4336` | Discoverer-Learn.dc.html | dòng phụ "Ăn uống lành mạnh · Bài 1/5", dòng 68 | 21/21 |
| `color.role.text_on_accent` | `{color.palette.giay}` = `#FBF6EA` | Discoverer-Quiz.dc.html | nhãn "Chọn tất cả đáp án đúng", triện "ĐÚNG", chữ nút chính, dòng 84 | 20/21 |
| `color.role.text_accent` | `{color.palette.do_son}` = `#A93A27` | Discoverer-Learn.dc.html | "Từ mới · New words" `color: #A93A27`, dòng 160 | 9/21 |
| `color.role.text_correct` | `{color.palette.la_tre}` = `#3F7A33` | Discoverer-Quiz.dc.html | "Chính xác!" `color: #3F7A33`, dòng 176; "Đúng rồi!", từ "air" điền vào chỗ trống ở Khởi động | 5/21 |
| `color.role.action_primary` | `{color.palette.do_son}` = `#A93A27` | Discoverer-Quiz.dc.html | nút "Tiếp" hai lớp, lớp trên, dòng 183 | 10/21 |
| `color.role.action_primary_under` | `{color.palette.do_son_deep}` = `#6E2216` | Discoverer-Quiz.dc.html | nút "Tiếp", lớp dưới `y="10"`, dòng 183 | 10/21 |
| `color.role.action_disabled` | `{color.palette.giay_lom}` = `#E2D4B4` | Discoverer-Quiz.dc.html | `checkStyle` khi chưa chọn, dòng 239 | 4/21 |
| `color.role.action_disabled_under` | `{color.palette.giay_lom_deep}` = `#C9B993` | Discoverer-Quiz.dc.html | `checkStyle` khi chưa chọn, dòng 239 | 4/21 |
| `color.role.text_on_disabled` | `{color.palette.chu_phu}` = `#4E4336` | Discoverer-Quiz.dc.html | `checkStyle` khi chưa chọn, dòng 239 | 7/21 |
| `color.role.state_current` | `{color.palette.vang_hoe}` = `#E2A52A` | Discoverer-Home.dc.html | ô icon tab hiện tại; bước hiện tại ở thanh 4 bước, dòng 196 | 5/21 |
| `color.role.state_selected` | `{color.palette.vang_hoe}` = `#E2A52A` | Discoverer-Quiz.dc.html | `st[id]` khi `on`, dòng 224 | 14/21 |
| `color.role.feedback_correct` | `{color.palette.la_tre}` = `#3F7A33` | Discoverer-Quiz.dc.html | triện "ĐÚNG" dòng 173; nhãn "Đúng" trên ô `markStyle` dòng 227; ô tiến độ đã xong dòng 69; chỉ số nhóm chất đã đủ ở Chơi (`okStyle`) | 10/21 |
| `color.role.feedback_wrong` | `{color.palette.giay_lom}` = `#E2D4B4` | Discoverer-Quiz.dc.html | tam giác gấp góc trong mẩu "Gần đúng!", dòng 193 | 7/21 |
| `color.role.feedback_missed` | `{color.palette.vang_hoe_light}` = `#F0C873` | Discoverer-Quiz.dc.html | `markStyle` "Bỏ sót", dòng 229 | 2/21 |
| `color.role.stamp_mark` | `{color.palette.do_son}` = `#A93A27` | Discoverer-Learn.dc.html | dấu "Đã xem" trên ô nhóm chất `background: #A93A27; transform: rotate(-8deg)`, dòng 106; món đã vào mâm ở Chơi; ô đang chọn ở Chào mừng, Hồ sơ, Quiz bắt lỗi | 12/21 |
| `color.role.shadow_ink` | `{color.palette.muc_bong}` = `#5B3B17` | Discoverer-Learn.dc.html | mọi `box-shadow` rgba(91, 59, 23, a), dòng 88 | 21/21 |
| `color.role.link` | `{color.palette.do_son}` = `#A93A27` | Discoverer-Learn.dc.html | helmet `a{color:#A93A27}`, dòng 14 | 21/21 |
| `color.role.food_group.carb` | `{color.palette.vang_hoe}` = `#E2A52A` | Discoverer-Learn.dc.html | `data.carb.color`, dòng 186 | 5/21 |
| `color.role.food_group.protein` | `{color.palette.do_son}` = `#A93A27` | Discoverer-Learn.dc.html | `data.protein.color`, dòng 187 | 5/21 |
| `color.role.food_group.fat` | `{color.palette.nau_dat}` = `#8A5E3B` | Discoverer-Learn.dc.html | `data.fat.color`, dòng 188 | 3/21 |
| `color.role.food_group.vitamin` | `{color.palette.gi_dong}` = `#3B6E6A` | Discoverer-Learn.dc.html | `data.vit.color`; màn Chơi `veg`, dòng 189 | 5/21 |
| `color.role.food_group.sweet` | `{color.palette.cham}` = `#2E4A6E` | Discoverer-Play.dc.html | `color.sweet`, dòng 247 | 2/21 |
| `color.age_group.explorer` | `{color.palette.gi_dong}` = `#3B6E6A` | Discoverer-Profile.dc.html | nhãn thế giới "Explorer" (sc-if world.explorer), dòng 174 | 1/21 |
| `color.age_group.discoverer` | `{color.palette.do_son}` = `#A93A27` | Discoverer-Profile.dc.html | nhãn thế giới "Discoverer" (sc-if world.discoverer), dòng 180 | 1/21 |
| `color.age_group.scientist` | `{color.palette.cham}` = `#2E4A6E` | Discoverer-Profile.dc.html | nhãn thế giới "Scientist" (sc-if world.scientist), dòng 186 | 1/21 |
| `font.family.display` | `"Phudu"` | Discoverer-Learn.dc.html | helmet `<link … family=Phudu`, dòng 11 | 21/21 |
| `font.family.text` | `"Be Vietnam Pro"` | Discoverer-Learn.dc.html | helmet `family=Be+Vietnam+Pro`; `font-family` khung, dòng 11 | 21/21 |
| `font.weight.display_medium` | `500` | Discoverer-Learn.dc.html | helmet `Phudu:wght@500;700;900`, dòng 11 | 21/21 |
| `font.weight.display_bold` | `700` | Discoverer-Learn.dc.html | helmet `Phudu:wght@500;700;900`, dòng 11 | 21/21 |
| `font.weight.display_black` | `900` | Discoverer-Learn.dc.html | helmet `Phudu:wght@500;700;900`, dòng 11 | 21/21 |
| `font.weight.text_regular` | `400` | Discoverer-Learn.dc.html | helmet `Be+Vietnam+Pro:wght@400;600;700`, dòng 11 | 21/21 |
| `font.weight.text_semibold` | `600` | Discoverer-Learn.dc.html | helmet `Be+Vietnam+Pro:wght@400;600;700`, dòng 11 | 21/21 |
| `font.weight.text_bold` | `700` | Discoverer-Learn.dc.html | helmet `Be+Vietnam+Pro:wght@400;600;700`, dòng 11 | 21/21 |
| `typography.title_xl` | Phudu 34/900, lh 1.05 | Discoverer-Reward.dc.html | "Hoàn thành bài 1!", dòng 86 | 1/21 |
| `typography.title_l` | Phudu 26/900, lh 1.1 | Discoverer-Quiz.dc.html | "Chính xác!", dòng 176 | 6/21 |
| `typography.title` | Phudu 21/900, lh 1.1 | Discoverer-Learn.dc.html | tiêu đề đầu màn "Thức ăn cho ta những gì?", dòng 67 | 6/21 |
| `typography.title_s` | Phudu 22/700, lh 1.15 | Discoverer-Quiz.dc.html | "Gần đúng!" trong mẩu gấp góc, dòng 194 | 4/21 |
| `typography.button` | Phudu 24/900, lh 1.2, ls 0.5 | Discoverer-Quiz.dc.html | nút "Kiểm tra", "Tiếp", "Thử lại", dòng 167 | 8/21 |
| `typography.button_s` | Phudu 19/700, lh 1.2 | Discoverer-Reward.dc.html | nút "Xem bộ thẻ"; chip chuỗi ngày ở Trang chủ, dòng 155 | 9/21 |
| `typography.label` | Phudu 15/700, lh 1.2 | Discoverer-Learn.dc.html | nhãn "Từ mới · New words", dòng 160 | 11/21 |
| `typography.eyebrow` | Phudu 14/700, lh 1.2, ls 0.84, viết hoa | Discoverer-Home.dc.html | "Học tiếp · Miễn phí", dòng 116 | 6/21 |
| `typography.stamp` | Phudu 16/900, lh 1.2, ls 1 | Discoverer-Quiz.dc.html | triện "ĐÚNG" 52×52, dòng 173 | 4/21 |
| `typography.number` | Phudu 18/700, lh 1.2 | Discoverer-Quiz.dc.html | "Câu 5/6", "+10 XP", dòng 79 | 8/21 |
| `typography.sentence` | Be Vietnam Pro 19/700, lh 1.3 | Discoverer-Learn.dc.html | `{{cur.sentence}}`, dòng 142 | 5/21 |
| `typography.item_title` | Be Vietnam Pro 16/700, lh 1.25 | Discoverer-Home.dc.html | tên chủ đề trên hành trình, dòng 153 | 4/21 |
| `typography.body_strong` | Be Vietnam Pro 15/700, lh 1.3 | Discoverer-Play.dc.html | chữ trên nút hai lớp đang tắt "Cần đủ bột đường, đạm, rau quả…", dòng 227 | 5/21 |
| `typography.body` | Be Vietnam Pro 15/400, lh 1.4 | Discoverer-Quiz.dc.html | phụ đề VI câu hỏi "Chạm vào tất cả…", dòng 88 | 11/21 |
| `typography.body_s` | Be Vietnam Pro 14/400, lh 1.4 | Discoverer-Learn.dc.html | `{{cur.sentenceVi}}`, dòng 143 | 8/21 |
| `typography.caption` | Be Vietnam Pro 13/600, lh 1.3 | Discoverer-Learn.dc.html | dòng phụ đầu màn "Ăn uống lành mạnh · Bài 1/5", dòng 68 | 14/21 |
| `typography.caption_s` | Be Vietnam Pro 12/600, lh 1.3 | Discoverer-Learn.dc.html | `{{g.vi}}` dưới tên nhóm chất, dòng 105 | 5/21 |
| `typography.dynamic_type.max_category` | `"xxxLarge"` | — | đề xuất designer theo B7.8, không có trên canvas; xem mục Dynamic Type | 0 |
| `typography.dynamic_type.max_scale` | `1.35` | — | đề xuất designer theo B7.8, không có trên canvas; xem mục Dynamic Type | 0 |
| `typography.dynamic_type.fixed_box_max_category` | `"xLarge"` | — | đề xuất designer theo B7.8, không có trên canvas; xem mục Dynamic Type | 0 |
| `typography.dynamic_type.fixed_box_max_scale` | `1.12` | — | đề xuất designer theo B7.8, không có trên canvas; xem mục Dynamic Type | 0 |
| `radius.explorer` | `20` | Explorer-Home.dc.html | `border-radius: 20px` (18 lần trong 5 file Explorer), dòng 139 | 5/5 Explorer |
| `radius.discoverer` | `10` | Discoverer-Quiz.dc.html | ô đáp án, nút, thẻ: `border-radius: 10px`, SVG `rx="10"`, dòng 98 | 21/21 |
| `radius.scientist` | `6` | Scientist-Home.dc.html | `border-radius: 6px` (15 lần trong 5 file Scientist), dòng 92 | 5/5 Scientist |
| `radius.tile_l` | `12` | Discoverer-Home.dc.html | ô chủ đề 56×56 trên hành trình, dòng 145 | 2/21 |
| `radius.tag` | `3` | Discoverer-Quiz.dc.html | triện "ĐÚNG", nhãn trên ô, nút lớp ở Hồ sơ, dòng 173 | 21/21 |
| `radius.bar` | `2` | Discoverer-Badges.dc.html | ô ngày trong tuần, rãnh tiến độ, dòng 79 | 5/21 |
| `radius.bubble` | `16` | Discoverer-Play.dc.html | bong bóng lời mascot `border-radius: 16px 16px 16px 4px`, dòng 100 | 3/21 |
| `radius.bubble_tail` | `4` | Discoverer-Play.dc.html | như trên, góc dưới trái, dòng 100 | 3/21 |
| `radius.full` | `9999` | Discoverer-Learn.dc.html | chấm màu nhóm chất, nút tròn: `50%` hoặc nửa cạnh, dòng 89 | 13/21 |
| `touch_target.explorer` | `72` | Explorer-Home.dc.html | ô chạm `height: 72px`; note explorerRules, dòng 58 | 5/5 Explorer |
| `touch_target.discoverer` | `56` | Discoverer-Learn.dc.html | nút về 56×56; note discovererRules, dòng 63 | 19/21 |
| `touch_target.scientist` | `48` | Scientist-Home.dc.html | ô chạm `height: 48px`; note scientistRules, dòng 58 | 5/5 Scientist |
| `touch_target.parent` | `44` | Discoverer-Parent.dc.html | nút trong Góc phụ huynh `height: 44px`, dòng 160 | 5/21 |
| `space.s2` | `2` | Discoverer-Play.dc.html | `padding`, `gap`, dòng 66 | 18/21 |
| `space.s4` | `4` | Discoverer-Parent.dc.html | `padding`, `gap`, dòng 71 | 21/21 |
| `space.s6` | `6` | Discoverer-Play-iPad.dc.html | `padding`, `gap`, dòng 120 | 19/21 |
| `space.s8` | `8` | Discoverer-Play-iPad.dc.html | `padding`, `gap`, dòng 74 | 20/21 |
| `space.s10` | `10` | Discoverer-Parent.dc.html | `padding`, `gap`, dòng 70 | 21/21 |
| `space.s12` | `12` | Discoverer-Parent.dc.html | `padding`, `gap`, dòng 71 | 21/21 |
| `space.s14` | `14` | Discoverer-Home-iPad.dc.html | `padding`, `gap`, dòng 84 | 20/21 |
| `space.s16` | `16` | Discoverer-Profiles.dc.html | `padding`, `gap`, dòng 101 | 17/21 |
| `space.s18` | `18` | Discoverer-Words.dc.html | `padding`, `gap`, dòng 61 | 17/21 |
| `space.s20` | `20` | Discoverer-Home-iPad.dc.html | `padding`, `gap`, dòng 96 | 20/21 |
| `space.s24` | `24` | Discoverer-Home-iPad.dc.html | `padding`, `gap`, dòng 64 | 4/21 |
| `space.s28` | `28` | Discoverer-Quiz-iPad.dc.html | `padding`, `gap`, dòng 61 | 4/21 |
| `space.s32` | `32` | Discoverer-Home-iPad.dc.html | `padding`, `gap`, dòng 64 | 4/21 |
| `shadow.paper_1` | `0 1 2 0 rgba(91,59,23,0.25)` | Discoverer-Learn.dc.html | chip từ mới `height: 30px`, dòng 149 | 8/21 |
| `shadow.paper_2` | `0 2 3 0 rgba(91,59,23,0.28)` | Discoverer-Home.dc.html | ô icon tab hiện tại 50×32, dòng 81 | 12/21 |
| `shadow.paper_3` | `0 3 4 0 rgba(91,59,23,0.22)` | Discoverer-Quiz.dc.html | ô đáp án chưa chọn `st[id]`, dòng 157 | 20/21 |
| `shadow.stamp` | `0 2 2 0 rgba(91,59,23,0.3)` | Discoverer-Learn.dc.html | dấu "Đã xem" trên ô nhóm chất, dòng 104 | 17/21 |
| `shadow.sunken` | `inset 0 2 5 0 rgba(91,59,23,0.28)` | Discoverer-Parent.dc.html | nhóm nút chọn, `background: #E6D9BC`, dòng 158 | 8/21 |
| `shadow.sunken_s` | `inset 0 1 3 0 rgba(91,59,23,0.28)` | Discoverer-Badges.dc.html | ô ngày trong tuần cao 12, dòng 120 | 4/21 |
| `shadow.offset_accent` | `5 6 0 0 #E2A52A, 0 3 4 0 rgba(91,59,23,0.22)` | Discoverer-Learn.dc.html | `g.ring` khi chọn; ô chủ đề hiện tại ở Trang chủ, dòng 196 | 14/21 |
| `shadow.offset_correct` | `5 6 0 0 #3F7A33, 0 3 4 0 rgba(91,59,23,0.22)` | Discoverer-Quiz.dc.html | `st[id]` đúng, dòng 227 | 4/21 |
| `shadow.offset_wrong` | `5 6 0 0 #E2D4B4, 0 3 4 0 rgba(91,59,23,0.22)` | Discoverer-Quiz.dc.html | `st[id]` sai, dòng 228 | 3/21 |
| `shadow.button_under` | `0 7 0 0 #6E2216, 0 9 6 0 rgba(91,59,23,0.3)` | Discoverer-Quiz.dc.html | `checkStyle` khi bật, dòng 239 | 3/21 |
| `shadow.button_under_disabled` | `0 7 0 0 #C9B993` | Discoverer-Quiz.dc.html | `checkStyle` khi tắt, dòng 239 | 3/21 |
| `shadow.drop_tag` | `0 2 2 0 rgba(91,59,23,0.32)` | Discoverer-Quiz.dc.html | nhãn "Chọn tất cả đáp án đúng", dòng 84 | 14/21 |
| `shadow.drop_sheet` | `0 3 3 0 rgba(91,59,23,0.3)` | Discoverer-Quiz.dc.html | khung câu hỏi xé mép, dòng 82 | 7/21 |
| `shadow.drop_fold` | `0 3 3 0 rgba(91,59,23,0.28)` | Discoverer-Quiz.dc.html | mẩu "Gần đúng!", dòng 191 | 5/21 |
| `shadow.drop_sheet_up` | `0 -3 4 0 rgba(91,59,23,0.22)` | Discoverer-Home.dc.html | thanh tab đáy; tờ "Chính xác!" ở Quiz, dòng 193 | 9/21 |
| `shadow.on_dark` | `0 2 3 0 rgba(30,27,24,0.3)` | Discoverer-Cards.dc.html | thẻ trong xấp trên nền chàm, dòng 85 | 2/21 |
| `shadow.frame_sides` | `5 0 7 -2 rgba(91,59,23,0.22), -5 0 7 -2 rgba(91,59,23,0.22)` | Discoverer-Learn-iPad.dc.html | nền khung giấy 600, dòng 62 | 3/21 |
| `shadow.sidebar` | `3 0 4 0 rgba(91,59,23,0.22)` | Discoverer-Home-iPad.dc.html | thanh bên 340 và 250, dòng 63 | 1/21 |
| `shape.torn_edge_top` | 14 điểm mép trên | Discoverer-Quiz.dc.html | khung câu hỏi `clip-path: polygon(0 6px, 6% 1px, …)`, dòng 83 | 12/21 |
| `shape.tag_chamfer` | `5` | Discoverer-Quiz.dc.html | nhãn "Chọn tất cả đáp án đúng" `polygon(5px 0, …)`, dòng 84 | 13/21 |
| `shape.fold_corner` | `22` | Discoverer-Quiz.dc.html | mẩu "Gần đúng!" `polygon(0 0, calc(100% - 22px) 0, 100% 22px, …)`, dòng 192 | 5/21 |
| `shape.fold_corner_s` | `7` | Discoverer-Quiz.dc.html | `markStyle` "Chưa đúng", dòng 228 | 2/21 |
| `shape.tilt_stamp` | `-8` | Discoverer-Quiz.dc.html | triện "ĐÚNG" `transform: rotate(-8deg)`, dòng 173 | 18/21 |
| `shape.tilt_tag` | `-2` | Discoverer-Quiz.dc.html | nhãn cắt góc `transform: rotate(-2deg)`, dòng 84 | 14/21 |
| `illustration.paper_e` | turbulence [0.04, 0.04] × 2, seed 3 | Discoverer-Learn.dc.html | `<filter id="paperE">` trong `<defs>` đầu khung, dòng 46 | 21/21 |
| `illustration.background_fiber` | turbulence [0.02, 0.5] × 2, seed 4 | Discoverer-Learn.dc.html | `<filter id="fiberE">`, `<rect … opacity="0.25">`, dòng 55 | 21/21 |
| `illustration.background_diep` | turbulence [0.85, 0.85] × 1, seed 21 | Discoverer-Learn.dc.html | `<filter id="diepE">`, `<rect … opacity="0.8">`, dòng 56 | 21/21 |
| `motion.preset.lay` | 460ms cubic-bezier(0.2,0.8,0.2,1) | Discoverer-Learn.dc.html | helmet `.e-lay`, `@keyframes eLay`, dòng 15 | 21/21 |
| `motion.preset.rise` | 440ms cubic-bezier(0.2,0.8,0.2,1) | Discoverer-Learn.dc.html | helmet `.e-rise`, `@keyframes eRise`, dòng 16 | 21/21 |
| `motion.preset.stamp` | 520ms cubic-bezier(0.3,0.7,0.3,1) | Discoverer-Learn.dc.html | helmet `.e-stamp`, `@keyframes eStamp`, dòng 17 | 21/21 |
| `motion.preset.pop` | 380ms cubic-bezier(0.3,0.7,0.3,1.2) | Discoverer-Learn.dc.html | helmet `.e-pop`, `@keyframes ePop`, dòng 18 | 21/21 |
| `motion.preset.fall` | 950ms cubic-bezier(0.2,0.7,0.3,1) | Discoverer-Learn.dc.html | helmet `.e-fall`, `@keyframes eFall`, dòng 19 | 21/21 |
| `motion.preset.slide` | 360ms cubic-bezier(0.2,0.8,0.2,1) | Discoverer-Learn.dc.html | helmet `.e-slide`, `@keyframes eSlide`, dòng 20 | 21/21 |
| `motion.preset.grow` | 620ms cubic-bezier(0.2,0.8,0.2,1) | Discoverer-Learn.dc.html | helmet `.e-grow`, `@keyframes eGrow`, dòng 21 | 21/21 |
| `motion.preset.sway` | 3600ms cubic-bezier(0.42,0,0.58,1) lặp | Discoverer-Learn.dc.html | helmet `.e-sway`, `@keyframes eSway`, dòng 22 | 21/21 |
| `motion.preset.nudge` | 2800ms cubic-bezier(0.42,0,0.58,1) lặp, trễ 1200ms | Discoverer-Learn.dc.html | helmet `.e-nudge`, `@keyframes eNudge`, dòng 23 | 21/21 |
| `motion.preset.turn` | 420ms cubic-bezier(0.2,0.8,0.2,1) | Discoverer-Reward.dc.html | helmet riêng của Reward `.e-turn`, `@keyframes eTurn`, dòng 37 | 1/21 |
| `motion.preset.press` | 120ms cubic-bezier(0.25,0.1,0.25,1) | Discoverer-Learn.dc.html | helmet `.e-press`, `.e-press:active`, dòng 34 | 21/21 |
| `motion.preset.flip` | 560ms cubic-bezier(0.3,0.7,0.3,1) | Discoverer-Cards.dc.html | helmet `.e-flip`; `cardRot` y 0deg ↔ y 180deg, dòng 36 | 21/21 |
| `motion.stagger.step` | 60 ms | Discoverer-Learn.dc.html | `--d` 60 → 120 → 180 (thứ tự đọc), dòng 88 | 9/21 |
| `motion.stagger.step_dense` | 40 ms | Discoverer-Quiz.dc.html | `--d` của 6 ô đáp án 160 → 360, bước 40, dòng 111 | 6/21 |
| `motion.stagger.max_delay` | 500 ms | Discoverer-Learn.dc.html | `--d` lớn nhất: Learn 430, Quiz 440, Welcome 460, dòng 170 | 12/21 |
| `motion.rules.reveal_per_screen` | `1` | Discoverer-Learn.dc.html | mọi khối đầu màn mang `.e-lay`, dòng 62 | 21/21 |
| `motion.rules.max_loops_per_screen` | `1` | Discoverer-Home.dc.html | `.e-nudge` (Home), `.e-sway` (Play, Welcome…), dòng 132 | 10/21 |
| `motion.rules.wrong_answer_shake` | `false` | Discoverer-Quiz.dc.html | phản hồi sai (`someWrong`) hiện bằng `.e-slide`; helmet không có keyframe rung, dòng 190 | 8/21 |
| `motion.rules.confetti_screen` | `"reward"` | Discoverer-Reward.dc.html | `.e-fall` trên giấy vụn, dòng 65 | 1/21 |
| `motion.rules.reduce_motion` | `"disable_all"` | Discoverer-Learn.dc.html | `@media (prefers-reduced-motion: reduce)`, dòng 37 | 21/21 |
| `layout.frame_width` | `390` | Discoverer-Learn.dc.html | khung `width: 390px; height: 844px`, dòng 43 | 17/21 |
| `layout.frame_height` | `844` | Discoverer-Learn.dc.html | khung `width: 390px; height: 844px`, dòng 43 | 17/21 |
| `layout.screen_padding_top` | `18` | Discoverer-Quiz.dc.html | wrapper `padding: 18px 20px 22px 20px`, dòng 61 | 13/21 |
| `layout.screen_padding_x` | `20` | Discoverer-Quiz.dc.html | wrapper `padding: … 20px … 20px`, dòng 61 | 17/21 |
| `layout.screen_padding_bottom` | `22` | Discoverer-Quiz.dc.html | wrapper `padding: … 22px …`, dòng 61 | 14/21 |
| `layout.section_gap` | `12` | Discoverer-Quiz.dc.html | wrapper `gap: 12px`, dòng 61 | 7/21 |
| `layout.compact_layout` | `"phone"` | canvas.json | note `discovererIpadRules`, dòng 586 | 1 |
| `layout.regular_reference_width` | `834` | Discoverer-Learn-iPad.dc.html | khung `width: 834px; height: 1194px`, dòng 43 | 4/21 |
| `layout.regular_reference_height` | `1194` | Discoverer-Learn-iPad.dc.html | khung `width: 834px; height: 1194px`, dòng 43 | 4/21 |
| `layout.paper_frame_max` | `600` | Discoverer-Learn-iPad.dc.html | wrapper `width: 600px; … margin: 0 auto`, dòng 61 | 3/21 |
| `layout.paper_frame_padding_x` | `28` | Discoverer-Learn-iPad.dc.html | wrapper `padding: 32px 28px 32px 28px`, dòng 61 | 3/21 |
| `layout.paper_frame_padding_y` | `32` | Discoverer-Learn-iPad.dc.html | wrapper `padding: 32px 28px 32px 28px`, dòng 61 | 3/21 |
| `layout.paper_frame_section_gap` | `16` | Discoverer-Learn-iPad.dc.html | wrapper `gap: 16px`, dòng 61 | 3/21 |
| `layout.home_sidebar_a` | `340` | Discoverer-Home-iPad.dc.html | `sc-if isA`, thanh bên `width: 340px`, dòng 63 | 1/21 |
| `layout.home_sidebar_b` | `250` | Discoverer-Home-iPad.dc.html | `sc-if isB`, thanh bên `width: 250px`, dòng 218 | 1/21 |
| `layout.illustration_max_scale` | `1.5` | Discoverer-Learn-iPad.dc.html | note `discovererIpadRules`; đĩa 76 → 110 (1,45×), dòng 119 | 1/21 |
| `layout.grid.quiz.compact` | 3 cột, ô 104, gap 12/10 | Discoverer-Quiz.dc.html | lưới đáp án `repeat(3, …); gap: 12px 10px`, ô `height: 104px`, dòng 97 | 1/21 |
| `layout.grid.quiz.regular` | 3 cột, ô 150, gap 14/12 | Discoverer-Quiz-iPad.dc.html | lưới đáp án `repeat(3, …); gap: 14px 12px`, ô `height: 150px`, dòng 101 | 1/21 |
| `layout.grid.play.compact` | 4 cột, ô 96, gap 12/9 | Discoverer-Play.dc.html | kệ món `repeat(4, …); gap: 12px 9px`, ô `height: 96px`, dòng 138 | 1/21 |
| `layout.grid.play.regular` | 4 cột, ô 124, gap 12/12 | Discoverer-Play-iPad.dc.html | kệ món `repeat(4, …); gap: 12px 12px`, ô `height: 124px`, dòng 142 | 1/21 |
| `layout.grid.food_group.compact` | 2 cột, ô 60, gap 12/10 | Discoverer-Learn.dc.html | ô nhóm chất `repeat(2, …); gap: 12px 10px`, `min-height: 60px`, dòng 101 | 1/21 |
| `layout.grid.food_group.regular` | 2 cột, ô 64, gap 14/12 | Discoverer-Learn-iPad.dc.html | ô nhóm chất `repeat(2, …); gap: 14px 12px`, `min-height: 64px`, dòng 105 | 1/21 |
| `layout.tray.width_compact` | `350` | Discoverer-Play.dc.html | mâm `height: 122px`, rộng 100% vùng nội dung, dòng 108 | 1/21 |
| `layout.tray.width_regular` | `544` | Discoverer-Play-iPad.dc.html | mâm `viewBox="0 -80 544 160"`, dòng 113 | 1/21 |
| `layout.tray.height_compact` | `122` | Discoverer-Play.dc.html | mâm `height: 122px`, dòng 108 | 1/21 |
| `layout.tray.height_regular` | `160` | Discoverer-Play-iPad.dc.html | mâm `height: 160px`, dòng 112 | 1/21 |
| `layout.tray.slot_compact` | `70` | Discoverer-Play.dc.html | chỗ trong mâm `width: 70px; height: 70px`, dòng 116 | 1/21 |
| `layout.tray.slot_regular` | `96` | Discoverer-Play-iPad.dc.html | chỗ trong mâm `width: 96px; height: 96px`, dòng 120 | 1/21 |
## Màu không thành token

`cat design/play-ui/project/Discoverer-*.dc.html | grep -oiE '#[0-9a-f]{6}\b' | tr a-f A-F | sort -u` cho **44 mã**: **19 mã** là `color.palette` (thêm `#3F7A33` lá tre ngày 29/10), **25 mã** dưới đây không thành token. Cả 25 chỉ nằm trong hình minh hoạ SVG (`fill` của mảnh giấy), trừ `#D3C29C` có thêm một lần làm nền ở Bộ thẻ. Hình minh hoạ được dùng "màu tự nhiên dịu gần bảng" (designer.md) và sẽ nướng thành WebP, nên app không cần các màu này.

| Mã | Số lần | File | Lý do |
| --- | --- | --- | --- |
| `#D9A066` | 18 | 8 file | chỉ dùng trong hình: món nâu vàng (trứng, bánh mì, cá kho) trên ô Quiz, Chơi, Bộ thẻ, Trang chủ |
| `#FFFDF6` | 15 | 12 file | chỉ dùng trong hình: cơm trắng trong bát (bát cơm ở Học, Quiz, Trang chủ, Bộ thẻ) |
| `#6B4A2E` | 11 | Cards | chỉ dùng trong hình: quai và vành nồi đất trên thẻ Cá kho (Bộ thẻ) |
| `#D9893A` | 9 | Learn, Learn-iPad, Parent, Profile, Profiles, Words | chỉ dùng trong hình: quả cam (Học), hình đại diện ếch và gà (Hồ sơ, Góc phụ huynh) |
| `#E9BE88` | 8 | Play, Play-iPad, Quiz, Quiz-iPad | chỉ dùng trong hình: điểm sáng trứng, vân bánh mì (Quiz, Chơi) |
| `#FFFFFF` | 8 | 7 file | chỉ dùng trong hình: lòng trắng trứng ốp la (Học) và điểm sáng nhỏ trong hình (Trang chủ, Chủ đề, Khởi động); trắng tinh không thuộc bảng style E |
| `#F4ECDA` | 7 | Home, Home-iPad, Learn, Learn-iPad, Topic, Words | chỉ dùng trong hình: lòng đĩa sứ sau hình nhóm chất (Học), đĩa trên Trang chủ, Chủ đề, Từ vựng |
| `#DDBB6E` | 7 | Home, Home-iPad, Quiz, Quiz-iPad, Topic, Words | chỉ dùng trong hình: đậu phụ lớp tối |
| `#EFE3C2` | 7 | Cards, Play, Play-iPad, Reward, Words | chỉ dùng trong hình: lòng đĩa, mặt thẻ úp (Bộ thẻ, Chơi, Thưởng, Từ vựng) |
| `#EBD293` | 7 | Home, Home-iPad, Quiz, Quiz-iPad, Topic, Words | chỉ dùng trong hình: đậu phụ lớp giữa |
| `#F6E7B8` | 7 | Home, Home-iPad, Quiz, Quiz-iPad, Topic, Words | chỉ dùng trong hình: đậu phụ lớp sáng (Quiz, Trang chủ, Chủ đề, Từ vựng) |
| `#D3C29C` | 5 | Cards | chỉ Bộ thẻ: thẻ chưa mở (hình) và một lớp nền xấp thẻ; một màn nên không thành token |
| `#E9D3B5` | 5 | Profile | chỉ dùng trong hình: hình đại diện con vật (Hồ sơ) |
| `#CDBB94` | 5 | Badges | chỉ dùng trong hình: huy hiệu chưa mở (Huy hiệu) |
| `#A86C12` | 3 | Cards | chỉ dùng trong hình: miếng cá kho trên thẻ (Bộ thẻ) |
| `#C9694F` | 2 | Unlock | chỉ dùng trong hình: cơ bắp (Mở khoá) |
| `#2E2824` | 2 | Profile | chỉ dùng trong hình: mắt, mũi hình đại diện (Hồ sơ) |
| `#F6EFE0` | 2 | Signup, Unlock | chỉ dùng trong hình: xương (Mở khoá, Đăng ký) |
| `#4A403A` | 1 | Profile | chỉ dùng trong hình: hình đại diện mèo, chim (Hồ sơ) |
| `#E9C39A` | 1 | QuizMyth | chỉ dùng trong hình: da bạn Na (Quiz bắt lỗi) |
| `#E9DDC2` | 1 | Unlock | chỉ dùng trong hình: xương lớp bóng (Mở khoá) |
| `#B8865B` | 1 | Profile | chỉ dùng trong hình: hình đại diện gà, mèo (Hồ sơ) |
| `#4F6F96` | 1 | Warmup | chỉ dùng trong hình: một mảnh xanh trong hình câu hỏi Khởi động |
| `#B8702E` | 1 | Profile | chỉ dùng trong hình: hình đại diện (Hồ sơ) |
| `#8A7B6C` | 1 | Profile | chỉ dùng trong hình: hình đại diện mèo, chim (Hồ sơ) |
## Bảng tương phản

Tỉ lệ WCAG 2.1 tính từ mã hex. Ngưỡng B7.8: chữ thường ≥ 4.5:1; chữ ≥ 18pt đậm hoặc ≥ 24pt được ≥ 3:1.

| Chữ | Nền | Tỉ lệ | Dùng ở đâu | Kết luận |
| --- | --- | --- | --- | --- |
| `text_primary` `#1E1B18` | `bg_screen` `#F0E6CF` | 13.81 | chữ trên nền màn | đạt |
| `text_primary` | `surface_paper` `#FBF6EA` | 15.89 | chữ trong thẻ, ô, nút phụ | đạt |
| `text_primary` | `surface_sunken` `#E6D9BC` | 12.26 | nút trong nhóm nút chọn | đạt |
| `text_primary` | `surface_inactive` = `feedback_wrong` `#E2D4B4` | 11.68 | nhãn "Chưa đúng" trên ô Quiz | đạt |
| `text_primary` | `state_current` = `state_selected` `#E2A52A` | 7.88 | icon và chữ trên nền vàng hoè (tab hiện tại); từ điền đang chọn trong câu (nền sát chữ) | đạt |
| `text_primary` | `feedback_missed` `#F0C873` | 10.79 | nhãn "Bỏ sót" | đạt |
| `text_secondary` `#4E4336` | `bg_screen` | 7.76 | phụ đề VI, chú thích | đạt |
| `text_secondary` | `surface_paper` | 8.93 | phụ đề VI trong thẻ | đạt |
| `text_secondary` | `surface_sunken` | 6.89 | nút chưa chọn trong nhóm | đạt |
| `text_on_disabled` `#4E4336` | `action_disabled` `#E2D4B4` | 6.56 | nút chính khi tắt | đạt |
| `text_secondary` `#4E4336` | `feedback_wrong` `#E2D4B4` | 6.56 | từ điền sai trong câu (nền giấy lõm sát chữ, chữ 400) | đạt |
| `text_on_accent` `#FBF6EA` | `action_primary` `#A93A27` | 5.86 | chữ nút chính, nhãn giấy đỏ, triện đánh dấu (`stamp_mark`) | đạt |
| `text_on_accent` | `feedback_correct` `#3F7A33` | 4.82 | triện "ĐÚNG", nhãn "Đúng" trên ô, dấu tích trên ô tiến độ, chỉ số "Đạm" 13pt đậm ở Chơi | đạt |
| `text_correct` `#3F7A33` | `surface_paper` | 4.82 | "Chính xác!", "Đúng rồi!", từ điền đúng trong câu (chữ trơn, không nền) | đạt |
| `text_correct` | `bg_screen` | 4.19 | canvas không dùng | chỉ chữ ≥ 18pt đậm |
| `text_correct` | `surface_sunken` `#E6D9BC` | 3.71 | canvas không dùng (từ điền đúng là chữ trơn trên thẻ giấy sáng, không nằm trong ô lõm) | chỉ chữ ≥ 18pt đậm |
| `text_on_accent` | `age_group.explorer` `#3B6E6A` | 5.37 | nhãn thế giới Explorer | đạt |
| `text_on_accent` | `age_group.scientist` `#2E4A6E` | 8.39 | nhãn thế giới Scientist, nhãn chàm ở Góc phụ huynh | đạt |
| `text_accent` = `link` `#A93A27` | `surface_paper` | 5.86 | "Chính xác!", "Mức 2 · Đang học", link | đạt |
| `text_accent` | `bg_screen` | 5.10 | "Từ mới", link trên nền màn | đạt |
| `text_accent` | `surface_sunken` | 4.52 | một nhãn 13pt đậm trong nhóm nút chọn | đạt sát ngưỡng; không giảm thêm |
| `gi_dong` `#3B6E6A` (màu gốc) làm chữ | `surface_paper` | 5.37 | chữ "nghỉ" ở Huy hiệu (1 chỗ) | đạt |
| `text_on_accent` | `state_current` `#E2A52A` | 2.02 | canvas không dùng | **không dùng cho chữ** |
| `text_accent` | `surface_inactive` `#E2D4B4` | 4.31 | canvas không dùng | chỉ chữ ≥ 18pt đậm; tránh |
| `text_primary` | `action_primary` `#A93A27` | 2.71 | canvas không dùng | **không dùng cho chữ** |
| `text_on_accent` | `food_group.fat` `#8A5E3B` | 5.20 | canvas không đặt chữ lên màu nhóm chất | đạt nếu cần |
| `text_on_content.vang_hoe` `#1E1B18` | `vang_hoe` `#E2A52A` | 7.88 | nhãn giấy cắt tên nhóm trên trang sách Học, dấu tích trên chấm nhóm ở Chơi (SK-060) | đạt |
| `text_on_content.do_son` `#FBF6EA` | `do_son` `#A93A27` | 5.86 | như trên | đạt |
| `text_on_content.gi_dong` `#FBF6EA` | `gi_dong` `#3B6E6A` | 5.37 | như trên | đạt |
| `text_on_content.cham` `#FBF6EA` | `cham` `#2E4A6E` | 8.39 | như trên | đạt |
| `text_on_content.nau_dat` `#FBF6EA` | `nau_dat` `#8A5E3B` | 5.20 | như trên | đạt |
| `text_primary` | `bg_screen` dưới bóng `drop_sheet_up` (≈ `#CFC0A7`) | 9.59 | chữ cuộn sát mép trên thanh tab | đạt; `text_secondary` 5.39, `gi_dong` 3.24, `text_accent` 3.54 thì không, nên vùng cuộn phải dừng trên bóng (SK-060 lỗi 4) |

Ma trận đủ mọi cặp vai chữ × vai nền của `color.role` (và màu thế giới có chữ đè lên). "(dùng)" là cặp canvas có dùng cho chữ; số **đậm** là dưới 4.5:1, không cặp đậm nào có "(dùng)". `age_group.discoverer` và `stamp_mark` trùng `action_primary` (đỏ son).

| Chữ \ Nền | `bg_screen` `#F0E6CF` | `surface_paper` `#FBF6EA` | `surface_sunken` `#E6D9BC` | `surface_inactive` = `action_disabled` = `feedback_wrong` `#E2D4B4` | `action_primary` `#A93A27` | `feedback_correct` `#3F7A33` | `state_current` = `state_selected` `#E2A52A` | `feedback_missed` `#F0C873` | `explorer` `#3B6E6A` | `scientist` `#2E4A6E` |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `text_primary` `#1E1B18` | 13.81 (dùng) | 15.89 (dùng) | 12.26 (dùng) | 11.68 (dùng) | **2.71** | **3.30** | 7.88 (dùng) | 10.79 (dùng) | **2.96** | **1.89** |
| `text_secondary` = `text_on_disabled` `#4E4336` | 7.76 (dùng) | 8.93 (dùng) | 6.89 (dùng) | 6.56 (dùng) | **1.52** | **1.85** | **4.43** | 6.06 | **1.66** | **1.06** |
| `text_on_accent` `#FBF6EA` | **1.15** | **1.00** | **1.30** | **1.36** | 5.86 (dùng) | 4.82 (dùng) | **2.02** | **1.47** | 5.37 (dùng) | 8.39 (dùng) |
| `text_accent` = `link` `#A93A27` | 5.10 (dùng) | 5.86 (dùng) | 4.52 (dùng) | **4.31** | **1.00** | **1.22** | **2.91** | **3.98** | **1.09** | **1.43** |
| `text_correct` `#3F7A33` | **4.19** | 4.82 (dùng) | **3.71** | **3.54** | **1.22** | **1.00** | **2.39** | **3.27** | **1.12** | **1.74** |

**Lá tre ngoài vai chữ** (WCAG 1.4.11, phần không phải chữ cần ≥ 3:1): lá tre trên `bg_screen` 4.19 (ô tiến độ, triện trên nền màn), trên `surface_paper` 4.82 (viền lệch `offset_correct` sau ô giấy). Lá tre cạnh `feedback_wrong` `#E2D4B4` 3.54, nên ô đúng và ô sai đứng cạnh nhau khác nhau bằng độ sáng chứ không chỉ bằng sắc.

**Mù màu** (mô phỏng Machado 2009, mức nặng nhất, tính tương phản trên màu đã mô phỏng):

| Cặp | Thường | Mù màu lục (deutan) | Mù màu đỏ (protan) | Mù màu lam (tritan) | Kết luận |
| --- | --- | --- | --- | --- | --- |
| lá tre `#3F7A33` – giấy lõm `#E2D4B4` (đúng – sai) | 3.54 | 3.72 | 3.31 | 3.57 | phân biệt bằng độ sáng ở mọi loại |
| chữ giấy `#FBF6EA` trên lá tre (triện "ĐÚNG") | 4.82 | 4.99 | 4.56 | 4.89 | đạt 4.5 ở mọi loại |
| lá tre – đỏ son `#A93A27` (triện đúng – nút chính) | 1.22 | 1.03 | 1.63 | 1.20 | mù màu lục thấy gần như cùng màu ô liu; phân biệt bằng chữ "ĐÚNG", dấu tích và vị trí (nút luôn ở đáy). Trước 29/10 hai thứ này cùng một màu nên không kém đi |
| lá tre – gỉ đồng `#3B6E6A` | 1.12 | 1.12 | 1.10 | 1.10 | khác nhau bằng sắc (lá tre ngả vàng, gỉ đồng ngả lam); không đặt lá tre làm báo đúng trên nền gỉ đồng (thế giới Explorer) |

**Chữ trên màu nội dung** (SK-060): khi một màu nội dung (`ColorToken` của bài) làm nền cho chữ hay icon, lấy màu chữ ở `color.role.text_on_content.<tên màu>`, không dùng thẳng `text_on_accent`: vàng hoè cần than tre, bốn màu kia giấy. Canvas `options/lesson-less-text/Explorer-A.html` đã vẽ đúng như vậy (`--fg:#1E1B18` trên `#E2A52A`).

Màu nhóm chất (`food_group.*`) trên canvas chỉ là chấm màu và mảng hình, luôn đi kèm tên nhóm bằng chữ, nên màu không phải nguồn thông tin duy nhất. `vang_hoe` trên `giay` chỉ đạt 2.02: không dùng vàng hoè làm chữ hay làm nét icon trên giấy.

**Từ điền chỗ trống** (designer 29/10, SK-013; canvas `Discoverer-QuizFill`, `Discoverer-Warmup`). Từ là một đoạn chữ trong câu, không chip, không lề, không bo góc, không bóng, nên chỉ dùng màu chữ, độ đậm và nền phẳng sát chữ. Không thêm token.

| Trạng thái | Nền đoạn chữ | Chữ | Độ đậm | Tương phản |
| --- | --- | --- | --- | --- |
| Ô trống | `surface_sunken` (giữ figure space quanh "?") | `text_secondary` | theo dòng | 6.89 |
| Đang chọn (chưa Kiểm tra) | `state_selected` | `text_primary` | `text_bold` 700 | 7.88 |
| Đúng | không | `text_correct` | `text_bold` 700 | 4.82 |
| Sai | `feedback_wrong` | `text_secondary` | `text_regular` 400 | 6.56 |

Không nhìn màu vẫn phân biệt: đang chọn có nền và đậm, đúng không nền, sai có nền và chữ mảnh. Nền đoạn chữ không phải nguồn thông tin duy nhất (ô từ bên dưới mang cùng màu và nhãn chữ "Đúng", "Chưa đúng"), nên không cần 3:1 với thẻ: vàng hoè 2.02, giấy lõm 1.36 trên `surface_paper`. Không gạch chân: vạch của Be Vietnam Pro (−75…−125 đơn vị) đè lên dấu nặng (−88…−247) và là nét, style E không dùng.

## Chỗ canvas lệch nhau

Cùng vai trò mà các file dùng giá trị khác nhau. Token lấy giá trị dùng nhiều nhất (quyết định 3 của ticket); canvas chưa sửa.

| Vai trò | Các giá trị trên canvas | Token chọn |
| --- | --- | --- |
| Độ đậm Phudu ở nút và vài tiêu đề | 800 (34 lần, 17 file) nhưng helmet chỉ tải 500, 700, 900 nên trình duyệt vẽ 900; Be Vietnam Pro 900 ở Welcome ("EN VI") vẽ thành 700 | `font.weight.display_black` 900; không thêm 800 |
| Phudu 500 | helmet tải nhưng không màn nào dùng | giữ `display_medium` vì ticket ghi, có thể bỏ khỏi gói font nếu Duy muốn nhẹ app |
| Cỡ chữ nút chính | 24 (Quiz, QuizMyth, Unlock, Warmup, Profile, Signup, Topic, Reward), 23 (Learn, Play và bản iPad), 22 (Words, Style-E-Tile) | `typography.button` 24 |
| Tiêu đề đầu màn | 21/900 (Cards, Learn, Play, Warmup), 23/900 (Home, Topic, Badges), 27/900 (Words) | `typography.title` 21. Nếu Duy muốn màn trung tâm to hơn, thêm vai `title_hub` 23 |
| Câu EN chính | 19/700/1.3 (Learn, Topic, Words, Reward), 20/700/1.25 (câu hỏi Quiz), 20/700/1.3 (QuizMyth, Warmup), 19/700/1.25 (Play), 21/700/1.25 (lời chào Profiles, Unlock, Welcome) | `typography.sentence` 19/700/1.3 |
| Phụ đề VI | 14/400/1.4 (Learn), 15/400/1.4 (Quiz) | hai vai `body_s`, `body` |
| Dòng phụ đầu màn | 13/600 không ghi line-height (13 file), 13/600/1.4 (Badges…), 13/600/1.35 (Welcome, Cards) | `typography.caption` 13/600, line-height 1.3 |
| Vai Phudu một dòng | `button`, `button_s`, `label`, `eyebrow`, `stamp`, `number` không ghi line-height | 1.2 |
| Tiêu đề lớn | 34 (Reward), 30–36 (Cards), 40 (Words), 46 (Signup, Unlock) | `typography.title_xl` 34 cho màn của trẻ; các cỡ khác dùng một lần, chưa thành vai |
| Triện "ĐÚNG" | 52×52, chữ 16/900 ls 1 (Quiz, QuizMyth, Warmup); 48×48, chữ 14/900 ls 0.5 (Style-E-Tile) | 16/900 ls 1 |
| Nút hai lớp | lớp dưới lệch 7, cao 58 + 7 (Discoverer); lệch 6, cao 49 + 6 (Style-E-Tile) | lệch 7 |
| `paper_2` | `0 2 3` alpha .28 (40 lần, 12 file), .3 (22 lần, 9 file), .22 (20 lần, 7 file), .24 (Parent, Profile, Signup), .25 (Warmup) | .28 |
| `paper_3` | `0 3 4` alpha .22 (63 lần, 19 file), .28 (7), .3 (5), .24, .32; thẻ lớn `0 3 5 .26` (Words), `0 4 6 .3` (Cards), `0 4 6 .34` (Signup) | `0 3 4` .22 |
| `paper_1` | `0 1 2` alpha .25 (13 lần, 8 file), .3 (8 lần, 5 file), .28, .32, .22 | .25 |
| `stamp` | `0 2 2` alpha .3 (61 lần, 17 file), .28 (Signup), .25 ("Bỏ sót" ở Quiz) | .3 |
| `sunken` | `inset 0 2 5 .28` (14 lần, 8 file), `inset 0 2 4 .2`/`.3` (Parent, Topic), `inset 0 2 5 .2` (Cards, Reward), `inset 0 2 6 .24` (Words), `inset 0 3 6 .3` (Profiles) | `inset 0 2 5 .28` |
| `offset_accent` | `5 6 0` vàng hoè (15 lần, 14 file), `4 5 0` (Badges, 1 lần) | `5 6 0` |
| `on_dark` | `0 2 3` than tre .3 (Cards, Reward), `0 3 4` than tre .3 (chỗ trong mâm ở Play) | `0 2 3` |
| `drop_tag` | `drop-shadow(0 2 2 .32)` (23 lần, 14 file), `.28` (Play) | .32 |
| Mẩu gấp góc báo sai | 22 (Quiz, QuizMyth, Unlock, Warmup), 16 (Style-E-Tile), 11 (nhãn "nên ăn ít" ở Play) | `shape.fold_corner` 22 |
| Nhãn cắt góc | vát 5 (13 file), 6 (nhãn thế giới ở Profile, Style-E-Tile) | `shape.tag_chamfer` 5 |
| Bán kính phụ | 8 (Parent, Words, Cards, Reward), 7 (Parent, Cards), 14 (xấp thẻ ở Cards), 11 (chấm 22×22 ở Home, thực chất là tròn) | không thành token; 8 và 7 dùng `radius.discoverer` hoặc `radius.scientist`, 11 dùng `radius.full` |
| Lề màn phone | trên 18 (14 file), 16 (Learn, Play, Reward, Warmup); dưới 22 (14 file), 18 (Learn), 20 (Play, Reward) | 18 / 20 / 22 |
| Khoảng giữa khối | 12 (Cards, Home, Play, Quiz, QuizMyth, Reward, Warmup), 10 (Badges, Learn), 14 (Topic, Welcome, Words), 16 (Profile) | `layout.section_gap` 12 |
| Bậc stagger | 60 (29 lần), 70 (19 lần: Home, Topic, Profile, Welcome), 80 (Profiles); ô lưới 40 (Quiz) | `step` 60, `step_dense` 40 |
| Mảnh cuối của lượt hiện | luật "xong trong ~0,5 s"; canvas: mảnh cuối bắt đầu 250–480 ms ở đa số màn, Home 600, Topic 540, Badges 500; Reward tới 1040 vì giấy vụn | `max_delay` 500; Home, Topic nên rút bậc về 60 khi dựng native |
| Vùng chạm trên phone | luật 56; chip lọc Bộ thẻ 44×44, chip chuỗi ngày và sao ở Home 44, nút Từ mới ở Learn 48, link ở Topic 48; vùng người lớn (Parent, Signup, Unlock, chọn lớp ở Profile) 44–48. iPad đã nâng các nút của trẻ lên 56 | `touch_target.discoverer` 56 cho mọi chỗ trẻ chạm, cả trên phone; thêm `touch_target.parent` 44 cho vùng người lớn (chờ Duy) |
| Preset `turn` | chỉ có ở helmet Reward, ngoài bộ 11 preset dùng chung | thêm `motion.preset.turn` |
| Nhóm rau quả | Learn, Cards gọi `vit`; Play gọi `veg`; cùng gỉ đồng. Play có thêm nhóm `sweet` màu chàm | `food_group.vitamin`, thêm `food_group.sweet` |
| Bảng Style-E-Tile | ô ghi "Điệp #F0E6CF" nhưng ô vẽ `#FBF6EA` | `diep` = `#F0E6CF` theo designer.md và nền mọi màn |
| Mép xé bên phải | thanh bên Home-iPad dùng mép xé dọc `polygon(… calc(100% − 6px) 28px …)` | chưa thành token (một chỗ) |

## Thang khoảng cách: giá trị lệch thang

Thang `space`: 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 24, 28, 32 (13 bậc, phủ 81% trong 1 419 lần dùng giá trị px ở `padding`, `gap`, `margin`). Giá trị lệch thang trên 21 file:

| Giá trị | Số lần | Chỗ dùng | Khi dựng native |
| --- | --- | --- | --- |
| 1 | 47 | `gap` giữa dòng EN và dòng VI ngay dưới | dùng 0 hoặc `s2`; khác biệt dưới 1pt |
| 3 | 44 | `gap` EN–VI, padding nhãn nhỏ | `s2` hoặc `s4` |
| 5 | 27 | `padding-right: 5px` của lưới để chừa chỗ viền lệch `5 6`; padding nhãn | giữ 5 ở lưới (bằng `x` của `shadow.offset_accent`), còn lại `s4` |
| 7 | 30 | `margin-bottom: 7px` dưới nút "Kiểm tra" (bằng độ lệch lớp dưới); padding nhãn | lấy từ `shadow.button_under` (y = 7) |
| 9 | 27 | `gap` cột lưới Chơi, padding nhãn | `layout.grid.play.compact.column_gap` giữ 9; còn lại `s8` hoặc `s10` |
| 11 | 25 | padding mẩu gấp góc `11px 34px 11px 16px` | `s10` hoặc `s12` |
| 15 | 6 | Parent | `s14` hoặc `s16` |
| 22 | 33 | lề dưới màn | `layout.screen_padding_bottom` |
| 26, 34, 36 | 14 | padding phải mẩu gấp góc (= góc gấp 22 + 12), nút nhỏ | tính từ `shape.fold_corner` + `s12` |
| 40, 44, 66, 74, 88, 132 | 11 | `margin-left` so le của đường hành trình, margin âm để tờ giấy chạm mép màn | không phải khoảng cách; dựng theo bố cục |

## Dynamic Type (đề xuất, chờ Duy chốt)

B7.8 yêu cầu Dynamic Type có trần. Đề xuất hai mức:

1. **Chữ đọc** (`sentence`, `body*`, `caption*`, tiêu đề): trần `xxxLarge`, hệ số 1,35 (`typography.dynamic_type.max_category`, `max_scale`). Android dùng 1,35 làm trần `fontScale`.
2. **Chữ trong ô cỡ cố định** (ô Quiz 104, ô Chơi 96, chỗ trong mâm 70, nút chính 58, thanh tab): trần `xLarge`, hệ số 1,12 (`fixed_box_max_category`, `fixed_box_max_scale`).

Lý do: chữ của canvas đã lớn (câu đọc 19, phụ đề 14–15, chú thích tối thiểu 12), nên 1,35 đưa câu đọc lên khoảng 26pt và chú thích lên 16pt, đủ cho trẻ và phụ huynh cần chữ to. Các cỡ Accessibility (AX1 ×1,65 trở lên) làm lưới 3 và 4 cột không còn chỗ; muốn hỗ trợ phải đổi số cột lưới trên phone, ngoài phạm vi v1.

Màn vỡ trước (đo vị trí từng khối trên bản tĩnh của canvas trong trình duyệt; bản tĩnh hiện mọi nhánh `sc-if` nên phải cộng tay từng trạng thái; là ước tính, chưa thử trên máy):
- **Quiz vỡ trước, theo chiều dọc.** Trạng thái dài nhất (trả lời sai và mở gợi ý) dùng khoảng 819–841 trong 844, chỉ còn 0–25pt. Câu hỏi 20pt hai dòng và phụ đề VI 15pt hai dòng chỉ cần ×1,12 là tràn. Vì vậy vùng giữa đầu màn và nút chính phải cuộn được khi chữ to hơn mặc định; nút chính và tờ kết quả giữ ở đáy.
- **Học** còn khoảng 110pt trống (khối `flex: 1` giữa khung từ mới và nút), chịu được tới khoảng ×1,35 rồi mới cần cuộn.
- **Chơi** còn khoảng 90–100pt theo chiều dọc, nhưng ô kệ vỡ theo chiều ngang trước: ô rộng khoảng 80pt, phần trong khoảng 75pt; "Nước ngọt" 13pt đậm rộng khoảng 70pt, tới ×1,12 sẽ xuống hai dòng. Ô cao 96 vẫn chứa được hai dòng, nên trần ô cố định để ở `xLarge`.
- Chỗ trong mâm 70pt (chữ 12pt) và thanh tab (chữ 12pt) tới `xLarge` vẫn vừa một dòng với tên ngắn; tên dài hơn 8 ký tự cần rút gọn ở nội dung.

## Đề xuất cho schema nội dung (dev, SK-001)

- `ColorToken` hiện có `do_son`, `vang_hoe`, `gi_dong`, `cham`, `nau_dat`: khớp đủ màu nhóm chất của canvas (`food_group.*` trỏ vào đúng 5 màu này, kể cả `sweet` = `cham`). Không cần thêm hay đổi tên.
- Mô tả của `ColorToken` trong `common.schema.json` đang ghi "Tên tạm … đồng bộ lại khi có packages/design-tokens". Dev có thể đổi mô tả thành "khoá của `color.palette` trong packages/design-tokens". Designer không sửa file schema.

## Cách kiểm

```sh
# JSON hợp lệ
python3 -m json.tool packages/design-tokens/tokens.json > /dev/null

# Mã hex trong tokens.json đều có trên canvas
grep -oiE '#[0-9a-f]{6}\b' packages/design-tokens/tokens.json | tr a-f A-F | sort -u > /tmp/tok.txt
cat design/play-ui/project/Discoverer-*.dc.html design/play-ui/project/Style-E-Tile.dc.html \
  | grep -oiE '#[0-9a-f]{6}\b' | tr a-f A-F | sort -u > /tmp/canvas.txt
comm -23 /tmp/tok.txt /tmp/canvas.txt   # phải rỗng

# Mã hex trên 21 file Discoverer: là token hoặc có dòng trong bảng "Màu không thành token"
cat design/play-ui/project/Discoverer-*.dc.html | grep -oiE '#[0-9a-f]{6}\b' | tr a-f A-F | sort -u \
  | while read h; do grep -qi "\"$h\"" packages/design-tokens/tokens.json \
      || grep -q "| \`$h\` |" packages/design-tokens/README.md || echo "THIẾU $h"; done

# Số lá = số dòng bảng đối chiếu
node -e 'const t=require("./packages/design-tokens/tokens.json");let n=0;(function w(o){if(o&&typeof o==="object"&&!Array.isArray(o)){if("$value"in o){n++;return}for(const[k,v]of Object.entries(o))if(!k.startsWith("$"))w(v)}})(t);console.log(n)'
awk '/^## Bảng đối chiếu/{f=1;next} /^## /{f=0} f' packages/design-tokens/README.md | grep -c '^| `'
```
