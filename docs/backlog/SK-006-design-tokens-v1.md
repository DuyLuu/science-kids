# SK-006 · Design tokens v1: `packages/design-tokens/tokens.json` trích từ canvas style E

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: designer · Tester: tester
Nguồn: docs/ios-test-build.md mốc 1 việc I2; technical-plan.md B7.5 (design system và motion), B7.8 (tương phản), B7.10 (iPad, `LayoutMetrics`); `.claude/agents/designer.md` mục "Luật style E"; canvas `design/play-ui/project/Discoverer-*.dc.html` (21 file, gồm 4 bản iPad của SK-004), `Style-E-Tile.dc.html` (bảng style E), note `explorerRules`, `discovererRules`, `scientistRules`, `discovererIpadRules` trong `canvas.json`; SK-001 kiểu `ColorToken`

## Mục tiêu
Designer gom mọi giá trị trực quan của style E đang nằm rải trong CSS của canvas thành một file tokens có tên, để dev xuất sang Swift (SK-007) và ios-dev dựng DesignSystem (SK-008) mà không phải đọc HTML hay tự đoán số.

## Phạm vi
- **File:**
  ```
  packages/design-tokens/
    tokens.json     # nguồn duy nhất
    README.md       # cách đọc, quy ước tên, bảng đối chiếu token ↔ canvas
  ```
- **Định dạng:** theo W3C Design Tokens (DTCG): mỗi lá có `$value`, `$type` và `$description` nếu cần. Đơn vị: px trên canvas = pt trong app, ghi số không kèm đơn vị; thời lượng ghi bằng ms. Tham chiếu giữa token dùng `{color.palette.do_son}`. SK-007 đọc đúng định dạng này.
- **Tên:** key là chữ thường không dấu, `snake_case`.
  - Bảng màu gốc đặt theo tên màu Việt bỏ dấu, khớp `ColorToken` của SK-001 (`do_son`, `vang_hoe`, `gi_dong`, `cham`, `nau_dat`).
  - Vai trò màu và mọi nhóm khác đặt bằng tiếng Anh.
- **Nhóm token phải có:**

| Nhóm | Nội dung tối thiểu | Lấy từ |
| --- | --- | --- |
| `color.palette` | `diep` `#F0E6CF`, `giay` `#FBF6EA`, `giay_lom` `#E2D4B4`, `than_tre` `#1E1B18`, `chu_phu` `#4E4336`, `do_son` `#A93A27` và lớp dưới `do_son_deep` `#6E2216`, `vang_hoe` `#E2A52A`, `gi_dong` `#3B6E6A`, `cham` `#2E4A6E`, `nau_dat` (`#8A5E3B`, màu nhóm chất béo), mực bóng `#5B3B17`; cộng các lớp dưới hoặc sắc phụ khác mà UI dùng nhiều lần (ví dụ `#2F5B57`, `#24395A`, `#B97F16`, `#F0C873`) | `designer.md`, B7.5, `Style-E-Tile`, CSS các file Discoverer |
| `color.role` | `bg_screen`, `surface_paper`, `surface_sunken`, `text_primary`, `text_secondary`, `text_on_accent`, `action_primary` (+ lớp dưới), `state_current`, `state_selected`, `feedback_correct`, `feedback_wrong` (mẩu giấy gấp góc), `shadow_ink`, `link`; màu 4 nhóm chất (`food_group.carb`, `protein`, `fat`, `vitamin`) | luật vai trò màu ở `designer.md`; `Discoverer-Learn`, `-Play`, `-Quiz` |
| `color.age_group` | màu "thế giới" mỗi nhóm: explorer gỉ đồng, discoverer đủ bộ, scientist chàm | note `*Rules` |
| `font.family` | `display` = Phudu, `text` = Be Vietnam Pro; weight có trong app: Phudu 500 · 700 · 900, Be Vietnam Pro 400 · 600 · 700 | helmet font của mọi file |
| `typography` | vai `title_l`, `title`, `button`, `body`, `body_strong`, `caption`, `number` (và vai khác nếu canvas dùng nhiều lần); mỗi vai có `family`, `size`, `line_height`, `weight`, `letter_spacing` nếu có | `font-size`, `font-weight`, `line-height` trong CSS |
| `typography.dynamic_type` | trần phóng chữ (B7.8 "Dynamic Type có giới hạn trên") | designer đề xuất, ghi lý do |
| `radius` | theo nhóm tuổi: `explorer` 18–22, `discoverer` 10, `scientist` 6–8; cộng bán kính phụ dùng chung (thẻ nhãn 3, 12, tròn…) | `border-radius` trong CSS, note `*Rules` |
| `touch_target` | `explorer` 72, `discoverer` 56, `scientist` 48 | `designer.md`, note `*Rules` |
| `space` | thang khoảng cách (padding, gap) mà canvas dùng; gom về một thang, ghi giá trị lệch thang ở README | `padding`, `gap`, `margin` |
| `shadow` | các mức bóng giấy, mỗi mức là mảng lớp `{x, y, blur, spread, color, inset}`: ít nhất `paper_1` (`0 1px 2px` .25), `paper_2` (`0 2px 3px` .28), `paper_3` (`0 3px 4px` .22), `sunken` (`inset 0 2px 5px` .28), `offset_accent` (`5px 6px 0` vàng hoè + bóng mực), lớp dưới của nút hai lớp | `box-shadow` với `rgba(91,59,23,…)` |
| `illustration.paper_e` | tham số filter `paperE` (vân giấy, độ lệch, bóng) để `content-cli assets` nướng sẵn vào WebP; app không chạy filter lúc chạy (B7.4, B9) | `<filter id="paperE">` |
| `motion.preset` | mỗi preset: tên, `duration` ms, `easing` cubic-bezier 4 số (`ease`, `ease-in-out` của CSS cũng đổi ra 4 số), `keyframes` (offset + opacity, translate, scale, rotate), `iteration` (1 hoặc vô hạn), `delay` nếu có, `origin` nếu có. `press` và `flip` là transition: ghi trạng thái đầu và cuối thay cho keyframes. Đủ bộ canvas: `lay`, `rise`, `stamp`, `pop`, `fall`, `slide`, `grow`, `sway`, `nudge`, `press`, `flip` | `@keyframes e*` và `.e-*` trong helmet |
| `motion.stagger` | bước trễ `--d` giữa các mảnh giấy khi hiện màn; giá trị canvas dùng và tổng thời gian tối đa (~0,5 s) | `--d` trong `style` của từng phần tử |
| `motion.rules` | mỗi màn 1 lượt hiện, tối đa 1 chuyển động lặp, sai không rung; giảm chuyển động thì tắt hết (`press` và `flip` cũng tắt transition) | `designer.md`, khối `prefers-reduced-motion` |
| `layout` | khung phone 390; iPad regular: `paper_frame_max` ~600, cột lưới compact và regular (Quiz, Chơi, nhóm chất), ô lưới (Quiz 104 → 150, Chơi 96 → 124, chỗ trong mâm 70 → 96, mâm 544), thanh bên Trang chủ (A 340, B 250), `illustration_max_scale` 1,5; compact gồm Split View 1/3 và Slide Over | B7.10, note `discovererIpadRules`, các file `*-iPad.dc.html` |

- **`README.md`:**
  - cách đọc file, quy ước tên, đơn vị;
  - **bảng đối chiếu:** mỗi token một dòng `token | giá trị | file canvas | selector hoặc vị trí` (ví dụ `motion.preset.lay | 460ms cubic-bezier(.2,.8,.2,1) | Discoverer-Learn.dc.html | .e-lay, @keyframes eLay`). Một token xuất hiện ở nhiều file thì ghi một file đại diện và số file có nó;
  - **bảng màu không thành token:** mọi mã hex có trong 21 file `Discoverer-*.dc.html` mà không thành token (thường là màu trong hình minh hoạ), mỗi mã ghi "chỉ dùng trong hình" hoặc lý do;
  - **bảng tương phản:** mọi cặp chữ/nền của `color.role` mà app dùng, kèm tỉ lệ tương phản; cặp nào dưới 4.5:1 thì ghi rõ chỉ dùng cho chữ ≥ 18pt đậm hoặc không dùng cho chữ.

## Ngoài phạm vi
- Script xuất `Tokens.swift`: SK-007 (dev). Xuất Kotlin, CSS: sau beta.
- Sửa file `.dc.html` hay `canvas.json`. Chỗ canvas lệch nhau (cùng vai trò mà hai file dùng hai giá trị) thì chọn một giá trị cho token và ghi chỗ lệch vào README, không sửa canvas trong ticket này.
- Token cho Explorer và Scientist ngoài các mục ở bảng (bán kính, vùng chạm, màu thế giới). Bộ đầy đủ làm ở GĐ 2.
- Tên màu đổi trong schema nội dung: nếu `ColorToken` của SK-001 cần thêm hoặc đổi tên, ghi đề xuất cho dev (xem Phụ thuộc).

## Tiêu chí nghiệm thu
- [ ] `python3 -m json.tool packages/design-tokens/tokens.json > /dev/null` chạy không lỗi.
- [ ] Mọi lá có `$value` và `$type`. Mọi tham chiếu `{…}` trỏ tới token có thật. Tester kiểm bằng một script node nhỏ, dán output vào ticket.
- [ ] Có đủ các nhóm ở bảng Phạm vi, gồm 11 preset motion, mỗi preset có `duration`, `easing` 4 số và `keyframes` (hoặc trạng thái đầu/cuối với `press`, `flip`). Giá trị khớp CSS của canvas: tester so ngẫu nhiên ≥ 15 token với file và selector ghi ở README.
- [ ] **Không có màu mới:** mọi mã hex trong `tokens.json` có trong ít nhất một file `Discoverer-*.dc.html` hoặc `Style-E-Tile.dc.html`. Kiểm bằng `grep`, dán số mã tìm thấy / tổng.
- [ ] **Không sót màu UI:** chạy
  ```sh
  cat design/play-ui/project/Discoverer-*.dc.html | grep -oiE '#[0-9a-f]{6}\b' | tr a-f A-F | sort -u
  ```
  Mỗi mã trong kết quả hoặc là token, hoặc có dòng trong bảng "màu không thành token" của README.
- [ ] `color.palette` có 5 key trùng 5 giá trị `ColorToken` của SK-001: `do_son`, `vang_hoe`, `gi_dong`, `cham`, `nau_dat`.
- [ ] `touch_target` đúng 72 / 56 / 48. `radius.discoverer` = 10. `layout.paper_frame_max` = 600.
- [ ] Bảng tương phản có đủ các cặp chữ/nền của `color.role`. Cặp dùng cho chữ thường đạt ≥ 4.5:1 (B7.8).
- [ ] README có bảng đối chiếu phủ **mọi** token (tester đếm số lá trong `tokens.json` = số dòng bảng).
- [ ] Không có file nào ngoài `packages/design-tokens/` bị đổi (trừ ghi chú trong ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- Không chờ ticket nào. Chạy song song với SK-005 và SK-014.
- SK-007 (script Swift) bắt đầu khi `tokens.json` qua tiêu chí đầu tiên. Đổi tên nhóm hay định dạng sau đó thì báo vào SK-007.
- Nếu designer đặt tên màu nhóm chất béo khác `nau_dat`, hoặc thấy `ColorToken` cần thêm màu, ghi vào đây để dev sửa schema (SK-001 đã ghi câu hỏi này).

**Quyết định đã ghi** (PM đề xuất 28/10; Duy xác nhận khi review)
1. Định dạng DTCG (`$value`, `$type`), để sau này xuất Kotlin và CSS bằng công cụ có sẵn nếu cần.
2. Tên màu gốc là tên Việt bỏ dấu, để khớp schema nội dung; vai trò màu bằng tiếng Anh.
3. Giá trị lấy từ canvas Duy đã duyệt, không thiết kế lại. Canvas lệch nhau thì lấy giá trị dùng nhiều nhất và ghi lại.
4. Lưới iPad theo bản giao của SK-004: giữ số cột của phone (Quiz 3, Chơi 4), ô to hơn. B7.10 ghi "3–4 cột thay vì 2", nhưng phone đã có 3 và 4 cột.

**Câu hỏi còn mở**
- `#8A5E3B` (nhóm chất béo) chưa có trong bảng màu B7.5. Đề xuất đưa vào `color.palette.nau_dat`. Duy xác nhận. *(designer: đã đưa vào `nau_dat`; `ColorToken` không cần thêm hay đổi tên.)*
- Trần Dynamic Type: designer đề xuất một mức (ví dụ tới `accessibility1`) và nêu màn nào vỡ trước. *(designer: đề xuất `xxxLarge` ×1,35 cho chữ đọc, `xLarge` ×1,12 cho chữ trong ô cỡ cố định; Quiz vỡ trước. Chi tiết ở README mục Dynamic Type.)*
- (designer) Tên màu gốc tiếng Việt bỏ dấu là đề xuất của PM, Duy chưa chốt. Designer thêm 7 tên mới theo cùng quy ước: `diep_tham` `#E6D9BC`, `giay_lom_deep` `#C9B993`, `vang_hoe_deep` `#B97F16`, `vang_hoe_light` `#F0C873`, `gi_dong_deep` `#2F5B57`, `cham_deep` `#24395A`, `muc_bong` `#5B3B17`. Duy chốt quy ước và các tên này.
- (designer) `touch_target.parent` = 44 cho vùng người lớn (Góc phụ huynh, cổng phụ huynh, Đăng ký; canvas dùng 44–48). Giữ hay bỏ?
- (designer) Tiêu đề đầu màn: màn bài học dùng 21, Trang chủ, Chủ đề, Huy hiệu dùng 23. Token chọn 21; nếu Duy muốn giữ 23 cho màn trung tâm thì thêm vai `title_hub`.
- (designer) Trên phone có chỗ trẻ chạm nhỏ hơn 56 (chip lọc Bộ thẻ 44, chip chuỗi ngày và sao ở Trang chủ 44, nút Từ mới ở Học 48). Token giữ 56; có cần mở ticket sửa canvas phone cho khớp không?
- (designer) Phudu 500 có trong helmet nhưng không màn nào dùng. Bỏ khỏi gói font của app cho nhẹ?

## Kết quả (designer)

**Đã làm** (28/10). Tạo hai file, không sửa file nào khác ngoài ticket này:
- `packages/design-tokens/tokens.json`: 176 lá, DTCG (`$value`, `$type`, `$description`), số trần (pt, ms, độ), tham chiếu `{…}`.
- `packages/design-tokens/README.md`: quy ước tên, đơn vị, kiểu riêng và chỗ lệch chuẩn DTCG, ghi chú đổi sang SwiftUI cho SK-007/SK-008, bảng đối chiếu 176 dòng (token, giá trị, file, dòng, số file có giá trị), bảng 25 màu không thành token, bảng và ma trận tương phản, bảng chỗ canvas lệch, giá trị lệch thang khoảng cách, đề xuất Dynamic Type, cách kiểm.

**Số token theo nhóm:** `color.palette` 18 · `color.role` 25 (gồm `food_group` 5) · `color.age_group` 3 · `font.family` 2 · `font.weight` 6 · `typography` 21 (17 vai + 4 trần Dynamic Type) · `radius` 9 · `touch_target` 4 · `space` 13 · `shadow` 18 · `shape` 6 · `illustration` 3 · `motion.preset` 12 · `motion.stagger` 3 · `motion.rules` 5 · `layout` 28. Ngoài bảng tối thiểu có thêm nhóm `shape` (mép xé, vát nhãn, gấp góc, góc nghiêng), `illustration.background_fiber`, `background_diep` (vân nền), `motion.preset.turn` (chỉ có ở helmet Reward), `color.role.food_group.sweet` (màn Chơi).

**Kết quả kiểm** (chạy ngày 28/10, lệnh ở README mục "Cách kiểm"):
- [x] `python3 -m json.tool packages/design-tokens/tokens.json > /dev/null` → exit 0.
- [x] Script node duyệt cây: 176 lá, 0 lá thiếu `$type`, 0 khoá sai `snake_case`; 86 tham chiếu, 0 tham chiếu gãy. (Tester chạy lại script riêng và dán output.)
- [x] Đủ nhóm ở bảng Phạm vi; 12 preset (11 bắt buộc + `turn`), mỗi preset có `duration`, `easing` 4 số và `keyframes` (hoặc `from`/`to` với `press`, `flip`). Tự soát 16 token ngẫu nhiên với dòng ghi ở README: khớp. Soát tự động (heuristic: dòng canvas chứa giá trị của token) 172 dòng có số dòng: 171 khớp, 1 là giá trị suy ra (`layout.tray.width_compact` 350 = 390 − 2 × 20, README đã ghi).
- [x] Không có màu mới: 18/18 mã hex trong `tokens.json` có trên `Discoverer-*.dc.html` hoặc `Style-E-Tile.dc.html`.
- [x] Không sót màu UI: lệnh `grep` của ticket cho 43 mã = 18 token + 25 dòng ở bảng "Màu không thành token"; thiếu 0.
- [x] `color.palette` có đủ 5 khoá của `ColorToken` (đọc từ `packages/content-schema/schema/common.schema.json`): `do_son` `#A93A27`, `vang_hoe` `#E2A52A`, `gi_dong` `#3B6E6A`, `cham` `#2E4A6E`, `nau_dat` `#8A5E3B`.
- [x] `touch_target` 72 / 56 / 48; `radius.discoverer` 10; `layout.paper_frame_max` 600.
- [x] Bảng tương phản có ma trận đủ 4 màu chữ của `color.role` × 9 nền (vai nền và màu thế giới). Mọi cặp canvas dùng cho chữ đạt ≥ 4.5:1; thấp nhất là `text_accent` trên `surface_sunken` 4.52. Cặp dưới 4.5 đều ghi "không dùng cho chữ" hoặc "chỉ chữ ≥ 18pt đậm".
- [x] Bảng đối chiếu có 176 dòng = 176 lá; mỗi lá đúng một dòng.
- [x] Không có file nào ngoài `packages/design-tokens/` và ticket này bị designer sửa: `canvas.json` và các `.dc.html` còn mtime 13:27 trở về trước. `git status` có thêm `apps/`, `tools/` là của hai agent đang chạy song song. Chưa commit.

**Chỗ canvas lệch chính** (đủ bảng ở README):
- Phudu 800 ghi ở 17 file nhưng helmet chỉ tải 500/700/900, trình duyệt vẽ 900 → token 900, không thêm 800.
- Nút chính 24 (8 file) / 23 (Learn, Play) / 22 (Words, Style-E-Tile) → 24. Tiêu đề đầu màn 21 / 23 → 21. Câu EN 19/700/1.3 / 20/700/1.25 (Quiz) → 19/700/1.3.
- Bóng cùng hình mà khác alpha (`0 2 3` .28/.3/.22…, `0 3 4` .22/.28/.3…) → lấy giá trị nhiều nhất (.28, .22).
- Lề màn trên 18 / 16, dưới 22 / 18 / 20, khoảng khối 12 / 10 / 14 / 16 → 18, 22, 12.
- Stagger 60 / 70 → 60; mảnh cuối Home 600, Topic 540 vượt mốc ~0,5 s → `max_delay` 500.
- Gấp góc 22 / 16 / 11 → 22; vát nhãn 5 / 6 → 5; triện 16/900 (Quiz) / 14/900 (Style-E-Tile) → 16.
- Style-E-Tile ghi "Điệp #F0E6CF" mà ô vẽ `#FBF6EA` → `diep` = `#F0E6CF`.
- Trên phone có vùng trẻ chạm 44–48 (< 56) → token giữ 56.

**Còn chưa chắc:**
- Hệ số đổi `blur` CSS sang `.shadow(radius:)` SwiftUI (gợi ý `blur / 2`) cần so bằng mắt ở SK-008.
- Số đo Dynamic Type là ước tính trên bản tĩnh của canvas (mọi nhánh `sc-if` hiện cùng lúc, cộng tay từng trạng thái), chưa thử trên máy.
- `line_height` của các vai mà canvas để `normal` (vai Phudu một dòng 1.2, `caption` 1.3) là giá trị designer chọn.

**Báo cho SK-007:** cấu trúc và kiểu riêng (`keyframeAnimation`, `stateTransition`, `grid`, `polygon`, `svgFilter`, `string`, `boolean`) mô tả ở README mục "Cách đọc". `shadow` dùng `{x, y, blur, spread, color, alpha, inset}` với `color` là tham chiếu màu gốc, không phải `offsetX`/`offsetY` của DTCG.

## Đổi màu báo đúng (Duy chốt 29/10)

**Lý do.** Đỏ son vừa là màu nút chính, link, nhóm đạm, màu thế giới Discoverer, vừa là màu báo đúng: triện "ĐÚNG" trùng màu với nút "Tiếp" ngay dưới nó. Trẻ cũng quen xanh là đúng. Duy chọn thêm một xanh lá tươi hơn gỉ đồng. Báo sai giữ như cũ: mẩu giấy lõm gấp góc, không đỏ, không dấu X, không rung.

**Màu và token** (designer, 29/10)
- `color.palette.la_tre` = **`#3F7A33`** (mới). Lá tre: xanh lá ngả vàng, HSL 110° / 41% / 34%. Gỉ đồng là 176° / 30% / 33%, ngả lam. Độ đậm gần chàm (41%), nên vẫn là màu khoáng phẳng như các màu kia.
  - Mã gợi ý `#4A8A3C` chỉ đạt 3.90:1 với chữ giấy, nên hạ độ sáng xuống `#3F7A33`.
  - Không thêm `la_tre_deep`: không có nút hay mảnh hai lớp nào màu xanh, nút chính vẫn đỏ son.
- `color.role.feedback_correct` → `{color.palette.la_tre}` (trước là `do_son`).
- `shadow.offset_correct`: lớp lệch 5,6 → `{color.palette.la_tre}`.
- `color.role.text_correct` → `{color.palette.la_tre}` (mới). Dùng cho chữ "Chính xác!", "Đúng rồi!" và từ điền đúng vào chỗ trống. Trước đây các chữ này dùng `text_accent`.
- `color.role.stamp_mark` → `{color.palette.do_son}` (mới). Triện đánh dấu không mang nghĩa đúng vẫn đỏ son, gồm "Đã xem", món đã vào mâm, ô đang chọn, "Mới!", "XONG". Cần tách vai này vì trong app `Seal` đang tô mọi triện bằng `feedbackCorrect`.
- Chỉ sửa `$description`, giá trị giữ nguyên:
  - `do_son`: bỏ "báo đúng", thêm "Không dùng để báo đúng (xem la_tre)";
  - `text_accent`: bỏ "Chính xác!";
  - `text_on_accent`: thêm lá tre vào danh sách nền.
- Không đổi:
  - `action_primary`, `link`, `text_accent`, `food_group.protein`, `age_group.discoverer` (đỏ son);
  - `feedback_wrong` (giấy lõm), `feedback_missed`.
- Tổng lá 176 → **179**: `color.palette` 19, `color.role` 27.

**Tương phản** (WCAG 2.1, tính từ hex; mù màu mô phỏng theo Machado 2009, mức nặng nhất)

| Cặp | Tỉ lệ | Ngưỡng | Kết luận |
| --- | --- | --- | --- |
| Chữ giấy `#FBF6EA` trên lá tre, ví dụ triện "ĐÚNG", nhãn "Đúng" 12pt, chỉ số "Đạm" 13pt đậm | **4.82** | 4.5 | đạt |
| Chữ lá tre trên giấy `#FBF6EA` ("Chính xác!") | **4.82** | 4.5 | đạt |
| Lá tre trên nền điệp `#F0E6CF` (ô tiến độ, triện; phần không phải chữ) | **4.19** | 3 | đạt; làm chữ thì chỉ cho chữ ≥ 18pt đậm |
| Lá tre trên ô lõm `#E6D9BC` | 3.71 | 3 | đạt cho phần không phải chữ; chữ chỉ ≥ 18pt đậm |
| Lá tre với giấy lõm `#E2D4B4` (ô đúng cạnh ô sai) | **3.54** | 3 | phân biệt bằng độ sáng |
| như trên, mô phỏng mù màu lục / mù màu đỏ / mù màu lam | **3.72 / 3.31 / 3.57** | 3 | vẫn phân biệt bằng độ sáng |
| Chữ giấy trên lá tre, mô phỏng mù màu lục / đỏ / lam | 4.99 / 4.56 / 4.89 | 4.5 | đạt |
| Lá tre với đỏ son (triện đúng, nút chính); mô phỏng mù màu lục | 1.22; 1.03 | — | mù màu lục thấy gần như cùng màu. Phân biệt bằng chữ "ĐÚNG", dấu tích và vị trí. Trước đây hai thứ này cùng một màu nên không kém đi |

Ma trận đủ 5 vai chữ × 10 nền và bảng mù màu ở `packages/design-tokens/README.md`, mục "Bảng tương phản".

**Canvas: chỗ đổi sang lá tre** (thay `#A93A27` bằng `#3F7A33`)

| Màn | Chỗ đổi |
| --- | --- |
| Quiz, Quiz iPad | 4 ô tiến độ đã xong; viền lệch và nhãn "Đúng" trên ô đúng (`st`, `markStyle`); triện "ĐÚNG"; chữ "Chính xác!" |
| Quiz bắt lỗi | 6 ô tiến độ đã xong (cả ô thứ 6 hiện khi đúng); viền lệch ô đúng; triện "ĐÚNG"; chữ "Chính xác!". Triện nhỏ trên ô chọn dùng hole `{{sealBg}}`: đỏ son khi đang chọn, lá tre khi đã kiểm tra và đúng |
| Khởi động | 2 ô câu đã xong (`DONE`, trước là `RED`); từ "air" điền vào chỗ trống; 2 triện "ĐÚNG"; "Đúng rồi!", "Chính xác!"; viền lệch và triện tích "Đáp án đúng" trên ô "Sai" |
| Học, Học iPad · Chơi, Chơi iPad | ô bước đã xong trên thanh 4 bước |
| Chơi, Chơi iPad | chỉ số nhóm chất đã đủ (`okStyle`) |
| Hồ sơ | ô bước thiết lập đã xong. Cùng thành phần ô tiến độ, nên đổi cho đồng bộ với app (`ProgressSquares.done`) |
| Mở khoá (cổng phụ huynh) | triện tích và chữ "Đúng rồi" khi trả lời đúng |
| Style-E-Tile | hàng phản hồi: triện "ĐÚNG" và "Đúng rồi!" |

Giữ đỏ son vì không mang nghĩa đúng:
- nút chính, nhãn giấy đỏ ("Chọn tất cả đáp án đúng", "Nhớ lại · từ Year 2"), link, chấm chip từ, nhóm đạm, hình minh hoạ;
- triện "Đã xem" ở Học, triện món trong mâm ở Chơi, triện ô đang chọn ở Chào mừng, Hồ sơ, Đăng ký;
- ô ngày đã học và thanh thử thách tuần ở Huy hiệu, Thưởng;
- "Đã nhớ" và triện "XONG" ở Từ vựng; "Mới!", "+40" ở Thưởng; triện Premium ở Góc phụ huynh.

Note `canvas.json`:
- `styleE`: "Đỏ son cho nút chính và phản hồi đúng" → đỏ son cho nút chính, lá tre `#3F7A33` cho phản hồi đúng.
- `discovererRules`: thêm một dòng về báo đúng, báo sai và triện đánh dấu.
- Script kiểm chồng lấn của SK-018 báo 0.

**File đã đổi**
- `packages/design-tokens/tokens.json`
- `packages/design-tokens/README.md`: số lá, bảng đối chiếu, màu không thành token, bảng tương phản, bảng mù màu
- `design/play-ui/project/`:
  - `canvas.json` (2 note);
  - `Discoverer-Quiz.dc.html`, `Discoverer-Quiz-iPad.dc.html`, `Discoverer-QuizMyth.dc.html`, `Discoverer-Warmup.dc.html`;
  - `Discoverer-Learn.dc.html`, `Discoverer-Learn-iPad.dc.html`, `Discoverer-Play.dc.html`, `Discoverer-Play-iPad.dc.html`;
  - `Discoverer-Profile.dc.html`, `Discoverer-Unlock.dc.html`, `Style-E-Tile.dc.html`
- Ticket này: mục này

**Kết quả kiểm** (29/10)
- [x] `python3 -m json.tool tokens.json` → exit 0.
- [x] Đếm bằng script: 179 lá = 179 dòng bảng đối chiếu.
- [x] Mã hex trong token đều có trên canvas: thiếu 0.
- [x] Mã hex trên 21 file Discoverer: 44 mã, mỗi mã là token hoặc có dòng ở bảng "Màu không thành token"; thiếu 0.
- [x] `npm run export:swift -- --out <scratchpad>` → 179 lá, 179 hằng, exit 0. Không ghi vào `apps/ios`.
- [ ] `npm test` trong repo: **8/10 pass**. Hai test fail vì `Tokens.swift` của app chưa xuất lại; ios-dev sẽ xuất:
  - `committed Tokens.swift is up to date`;
  - `CLI --check: exit 0 on the real file…`.

  Chạy cùng bộ test trên một bản sao repo có `Tokens.swift` vừa sinh: **10/10 pass**, `check:swift` khớp.
- `npm run check:swift` hiện báo đúng 8 tên:
  - lệch: `color.palette.do_son`, `color.role.text_on_accent`, `color.role.text_accent`, `color.role.feedback_correct`, `shadow.offset_correct`;
  - thiếu trong `Tokens.swift`: `color.palette.la_tre`, `color.role.text_correct`, `color.role.stamp_mark`.
- [x] Ảnh trước và sau (render headless Chrome, giảm chuyển động, như SK-018) nằm trong scratchpad của phiên. Chưa publish canvas, chưa commit.

**Việc cho ios-dev**
1. Chạy `cd packages/design-tokens && npm run export:swift`, rồi commit `Tokens.swift` cùng `tokens.json`. Sau đó `npm test` và `TokensExportTests` của SKKit pass lại.
2. Tự đổi sang lá tre sau khi xuất, không cần sửa code. Kiểm bằng mắt:
   - `ProgressSquares` `.done`: ô tiến độ đã xong ở Quiz, Khởi động, thanh 4 bước, bước thiết lập;
   - `PaperChoice` `.correct`: viền lệch `offsetCorrect` và nhãn "Đúng" (`PaperChoice.swift` dòng 137);
   - chỉ số nhóm chất ở `PlayStep` dòng 191.
3. Phải sửa code, nếu không sẽ sai:
   - **`Seal` tô mọi triện bằng `feedbackCorrect`** (`Seal.swift` dòng 83). Sau khi xuất, mọi triện sẽ thành xanh, kể cả triện không mang nghĩa đúng. Cần cho `Seal` một tham số tông, ví dụ `.correct` / `.mark`:
     - giữ `feedbackCorrect` cho `Seal("ĐÚNG")` (`LessonParts.swift` dòng 198);
     - dùng `Tokens.Role.stampMark` cho "Đã xem" (`LearnStep.swift` dòng 133), món trong mâm (`PlayStep.swift` dòng 250) và `ChosenSeal` (`ScreenParts.swift` dòng 84, dùng ở Chào mừng, Hồ sơ).
   - Chữ "Chính xác!" (`LessonParts.swift` dòng 205): `textAccent` → `textCorrect`.
   - Từ điền đúng vào chỗ trống (`QuestionViews.swift` dòng 220): `textAccent` → `textCorrect`. Canvas đặt từ này trên chip giấy sáng (4.82:1). App đang đặt trên `surfaceSunken`, chỉ được 3.71:1, đạt nhờ câu 19pt đậm. Nên làm chip giấy như canvas.
   - Giữ `textAccent` cho "Đang học" (Trang chủ, Chủ đề), chấm chip từ, chữ nhấn ở Thưởng. Giữ giấy vụn `doSon` ở Thưởng.
4. Màn gallery (`GalleryView`) có thể thêm ô màu `laTre`.

**Hình minh hoạ (SK-018, chưa đụng): lá tre có hợp làm "xanh lá tự nhiên" cho lá rau không**
- Về sắc thì hợp hơn gỉ đồng: lá tre ngả vàng, gần rau muống, lá chuối thật; gỉ đồng ngả lam nên rau trông như màu khoáng.
- Rủi ro 1: rau trên ô Quiz, ô Chơi có mảng lá tre lớn sẽ nằm cạnh viền lệch lá tre của ô đúng. Trẻ có thể đọc hình là dấu "đúng", nhất là trước khi bấm Kiểm tra.
- Rủi ro 2: lá tre khá tối (L 34%). Làm mảng chính thì rau nặng, thiếu chỗ sáng.
- Đề xuất nếu Duy muốn rau xanh lá:
  - lá tre chỉ làm lớp giữa hoặc lớp tối của lá;
  - lớp trên dùng một sắc sáng hơn, quanh `#6E9A4A`, chỉ trong hình, không thành token;
  - giữ gỉ đồng cho thế giới Explorer và chấm nhóm vitamin.
- Chờ Duy quyết cùng câu hỏi màu lá của SK-018.

**Chỗ chưa chắc, chờ Duy**
- Phạm vi "đã xong". Đã đổi sang lá tre: ô có dấu tích trong một lượt học hoặc thiết lập, và chỉ số nhóm chất đạt. Còn đỏ son: ô ngày đã học (đi cùng lửa chuỗi ngày), thanh thử thách tuần, "Đã nhớ" ở Từ vựng (bé tự đánh dấu). Nếu Duy muốn mọi chỗ "đã xong" đều xanh thì đổi thêm Huy hiệu, Thưởng, Từ vựng.
- Chưa đổi vì ngoài phạm vi Discoverer, các file này vẫn có triện "ĐÚNG" đỏ son:
  - `Explorer-Quiz.dc.html`, `Scientist-Quiz.dc.html`: bản phác 2 nhóm tuổi kia;
  - `Style-E-Quiz.dc.html`: vòng 2 khám phá style.
- `Style-E-Tile`: chưa thêm ô màu lá tre vào bảng 6 màu, vì khung 844 chỉ còn khoảng 54px.
- Thế giới Explorer nền gỉ đồng: lá tre trên gỉ đồng chỉ 1.12:1. Khi dựng Explorer, triện đúng phải nằm trên giấy sáng, không đặt thẳng trên nền gỉ đồng.
- Ngoài vùng của designer, các file sau vẫn ghi "đỏ son cho nút chính và báo đúng" hoặc liệt kê bảng màu chưa có lá tre. Phiên chính hoặc PM cập nhật:
  - `.claude/agents/designer.md` dòng 16;
  - `technical-plan.md` dòng 419.
