# SK-004 · Bản iPad (regular width) cho 4 màn Discoverer: Trang chủ, Học, Chơi, Quiz

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: designer · Tester: tester
Nguồn: technical-plan.md B7.10 (chốt 28/10: iPad làm cùng iPhone), B7.5 (motion), B7.8 (trợ năng); `.claude/agents/designer.md` (luật style E, cách làm trên canvas); canvas `design/play-ui/project/Discoverer-Home`, `-Learn`, `-Play`, `-Quiz` (`.dc.html`) và `canvas.json`

## Mục tiêu
Designer dựng bản iPad regular width 834×1194 cho 4 màn Discoverer đại diện. Đây là spec trực quan để iOS dev dựng `LayoutMetrics` và `NavigationSplitView` từ sprint 1; các màn khác suy ra theo quy tắc B7.10. B7.10 yêu cầu xong trước sprint 2 (16/2/2027).

## Phạm vi
- **4 file mới** trong `design/play-ui/project/`: `Discoverer-Home-iPad.dc.html`, `Discoverer-Learn-iPad.dc.html`, `Discoverer-Play-iPad.dc.html`, `Discoverer-Quiz-iPad.dc.html`.
  - Chép khung từ bản phone tương ứng: head `support.js`, helmet font, bộ CSS motion, filter `paperE`, wrapper `z-index: 1`, script `Component extends DCLogic`.
  - Gốc là `width: 834px; height: 1194px`.
  - Chữ, dữ liệu và tương tác giữ như bản phone (cùng state, cùng lời nhắn); chỉ sắp lại bố cục.
- **Bố cục theo B7.10:**
  - *Trang chủ:* hai cột kiểu `NavigationSplitView`.
    - Cột trái là điều hướng và hành trình: 6 chủ đề Year 3 cùng 4 mục Hành trình · Thẻ · Huy hiệu · Từ vựng, thay cho dải tab dưới đáy của bản phone.
    - Cột phải là nội dung: lời chào, chuỗi ngày, sao, thẻ "Học tiếp".
  - *Học:* nội dung bài nằm trong khung giấy rộng tối đa 600pt, canh giữa; hai bên là nền điệp. 4 nhóm chất có thể xếp 4 cột hoặc 2×2 to hơn.
  - *Chơi:* mâm cơm và khay món rộng hơn bản phone; 8 món xếp lưới ít nhất 3 cột (gợi ý 4×2).
  - *Quiz câu 5:* 6 lựa chọn xếp lưới 3 cột × 2 hàng, thay cho 2 cột.
  - Chung cho cả 4 màn:
    - vùng chạm tối thiểu 56pt, không co lại;
    - cỡ chữ giữ như bản phone, không phóng to;
    - hình minh hoạ to hơn nhưng không vượt 1,5× bản phone;
    - không vẽ status bar giả.
- **`canvas.json`:**
  - Thêm 4 `boards`, mỗi board `w: 834`, `h: 1194`, `radius: 24`, `is_interactive: true`, cùng hàng `y: 6676`:

    | File | `x` | `title` |
    | --- | --- | --- |
    | `Discoverer-Home-iPad.dc.html` | 0 | Discoverer 4 · Trang chủ · iPad |
    | `Discoverer-Learn-iPad.dc.html` | 914 | Discoverer 9 · Học · iPad |
    | `Discoverer-Play-iPad.dc.html` | 1828 | Discoverer 10 · Chơi · iPad |
    | `Discoverer-Quiz-iPad.dc.html` | 2742 | Discoverer 11 · Quiz câu 5 · iPad |

  - Thêm note tiêu đề hàng `discovererIpadTitle`: `x: 0`, `y: 6426`, `kind: "title1"`, chữ "Discoverer · 4 iPad (regular width, 834×1194)". Note quy tắc `discovererIpadRules` ở `x: 3656`, `y: 6676`, `w: 400`, tóm tắt B7.10.
  - Thêm 4 tên file vào `order`, ngay sau `Discoverer-Parent.dc.html`.
  - **Dời cả khu Scientist xuống để không chồng lên hàng mới:**
    - `scientistTitle`: `y` 6426 → 8000;
    - `scientistRules` và 5 board `Scientist-*`: `y` 6676 → 8250.

    Chỉ đổi toạ độ, không đổi tên hay nội dung màn nào.

## Ngoài phạm vi
- iPad ngang 1194×834: B7.10 cho bố cục theo size class chứ không theo góc xoay, nên ngang dùng cùng quy tắc. Có thể thêm 1 dòng trong note quy tắc, không cần dựng màn.
- Split View 1/3 (compact): dùng bố cục phone.
- 13 màn Discoverer còn lại, Explorer và Scientist trên iPad.
- `packages/design-tokens`, `LayoutMetrics` dạng số: làm khi dev bắt đầu sprint 1.
- Sửa chữ hoặc số liệu (XP, sao): giữ y như bản phone, xem câu hỏi mở.
- Publish canvas, commit.

## Tiêu chí nghiệm thu
- [ ] Có 4 file `*-iPad.dc.html`, mỗi file mở được trên canvas, gốc đúng 834×1194. Các file `.dc.html` đã có không bị sửa (`git diff --stat` chỉ có `canvas.json` và 4 file mới).
- [ ] `python3 -m json.tool canvas.json` chạy không lỗi.
  - 4 board đúng toạ độ, tiêu đề và kích thước ở bảng trên;
  - `order` có 4 file mới, ngay sau `Discoverer-Parent.dc.html`;
  - khu Scientist đã dời;
  - một script nhỏ kiểm không có hai hình chữ nhật board hay note nào chồng lên nhau. Dán output vào ticket.
- [ ] Trang chủ:
  - có 2 cột, cột trái có 6 chủ đề và 4 mục điều hướng;
  - không còn dải tab dưới đáy;
  - chạm "Bắt đầu bài 1" và các mục điều hướng có trạng thái bấm như bản phone.
- [ ] Học: khung giấy rộng ≤ 600px, canh giữa. Chạm từng nhóm đổi câu và món ví dụ; bộ đếm chạy tới 4/4 như bản phone.
- [ ] Chơi:
  - mâm 4 chỗ;
  - đạt khi đủ bột đường, đạm, rau & quả và không có đồ ngọt;
  - đủ 7 lời nhắn như bản phone;
  - lưới món ≥ 3 cột; mâm rộng hơn bản phone.
- [ ] Quiz: 6 lựa chọn ở lưới 3 cột. Có đủ các trạng thái Kiểm tra → Đúng / Chưa đúng / Bỏ sót, gợi ý, Thử lại như bản phone.
- [ ] Mọi nút và lựa chọn ≥ 56×56px, là `<button>` hoặc `<a href>` thật. Nút chỉ có icon thì có `aria-label`. Tương phản chữ ≥ 4.5:1.
- [ ] Đúng style E: không stroke trên hình khối, không gradient, không emoji, màu trong bảng style E, chữ Phudu và Be Vietnam Pro. Chiều sâu chỉ đến từ lớp giấy và bóng.
- [ ] Ở trạng thái dài nhất, nội dung của mỗi màn vừa 1194px, không bị cắt.
- [ ] Bật `prefers-reduced-motion` thì mọi animation tắt (dùng nguyên bộ CSS motion của bản phone, không viết bộ mới).
- [ ] Báo lại danh sách file đã đổi để Duy hoặc phiên chính publish. Không publish, không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- Không chờ ticket nào; chạy song song với SK-001, SK-002, SK-003.
- Nếu SK-002 đổi chữ trên các màn phone (ví dụ nhãn khởi động), cập nhật bản iPad ở ticket sau, không làm trong ticket này.

**Quyết định đã ghi**
- Style E đã chốt; đây là sắp lại bố cục theo B7.10, không phải hướng style mới, nên không cần dựng 2–4 hướng trước. Riêng Trang chủ, nếu designer thấy có 2 cách chia cột đáng cân nhắc, có thể dựng cả hai trong cùng file `Discoverer-Home-iPad.dc.html` (đổi qua một state) để Duy chọn. Việc này không chặn 3 màn còn lại.

**Câu hỏi còn mở**
- B7.10 ghi "khung giấy tối đa ~600pt" cho nội dung bài, đồng thời ghi "mini-game và quiz tận dụng chiều ngang", mà không nói Chơi và Quiz có được vượt khung 600pt không. Dựng trong khung 600pt trước. Nếu lưới 3 cột với ô ≥ 56pt và chữ món ăn không vừa, dựng thêm bản rộng tới khoảng 760pt và ghi lại để Duy chọn.
- Số XP trên canvas lệch B4.4: Chơi "+20 XP" trong khi `xp_game_complete` là 10. Giữ như bản phone cho tới khi Duy chốt B18 #13.

## Bàn giao designer (28/10)

**File:** 4 file mới `design/play-ui/project/Discoverer-{Home,Learn,Play,Quiz}-iPad.dc.html` và `canvas.json` (thêm 4 board, 4 mục `order`, note `discovererIpadTitle` và `discovererIpadRules`, dời khu Scientist). Không sửa file `.dc.html` nào đã có. Chưa render: các chiều cao dưới đây là ước tính từ CSS.

**Cách làm:** head, bộ CSS motion và helmet font chép nguyên từ file phone (diff dòng 1–42 trừ `<title>` bằng 0). Chữ, `href`, `aria-label`, số nút và số class `e-*` khớp bản phone. Script `DCLogic` của Học, Chơi, Quiz giống hệt bản phone, chỉ đổi `$preview` thành 834×1194.

| Màn | Bố trí iPad | Trạng thái dài nhất (ước tính) |
| --- | --- | --- |
| Trang chủ | Tweak `layout`. **A** (mặc định, theo ticket): thanh bên giấy 340pt, mép phải xé, gồm 4 mục điều hướng và 6 chủ đề zigzag 0/20/40; cột phải có lời chào, chuỗi ngày, sao và thẻ Học tiếp (hình 104 → 140). **B**: thanh bên 250pt chỉ có 4 mục; cột phải có lời chào, Học tiếp và 6 chủ đề zigzag 0/66/132. | A ≈ 800px (thanh bên), B ≈ 815px |
| Học | Khung giấy 600pt canh giữa, là một tờ điệp có bóng hai bên; nhóm chất giữ 2×2, ô cao 64; đĩa hình 76 → 110 | ≈ 920px |
| Chơi | Khung 600pt; mâm lá chuối 544×160, 4 chỗ 70 → 96; khay 4×2, ô 96 → 124, hình ×1,45; linh vật 64 → 88 | ≈ 905px |
| Quiz câu 5 | Khung 600pt; lưới 3×2, ô 104 → 150, hình ×1,45; tờ báo Đúng trượt lên phủ hết bề rộng khung | ≈ 940px (gợi ý mở + báo Đúng) |

**Vùng chạm:** nâng 2 chỗ mà bản phone đang dưới 56: nút Từ mới (48) và chip chuỗi ngày/sao ở Trang chủ (44). Bản phone vẫn còn hai lỗi này, ngoài phạm vi ticket.

**Kiểm chồng lấn** (`python3 overlap.py design/play-ui/project/canvas.json`). Tiêu đề tính rộng `maxW`, cao 80. Note tính khoảng 7,5px mỗi ký tự, mỗi dòng 24px.

```
rects: 63 (43 boards, 20 notes)
overlaps: 0
   Scientist-Home.dc.html         x     0..390   y  8250..9094
   Discoverer-Parent.dc.html      x  1410..1800  y  5452..6296
   Discoverer-Home-iPad.dc.html   x     0..834   y  6676..7870
   Discoverer-Quiz-iPad.dc.html   x  2742..3576  y  6676..7870
   scientistTitle                 x     0..2270  y  8000..8080
   scientistRules                 x  2390..2790  y  8250..8570
   discovererIpadTitle            x     0..3576  y  6426..6506
   discovererIpadRules            x  3656..4056  y  6676..7332
```

<details><summary>overlap.py</summary>

```python
import json
import math
import sys

d = json.load(open(sys.argv[1], encoding='utf-8'))
R = []
for k, b in d['boards'].items():
    R.append(('board', k, b['x'], b['y'], b['w'], b['h']))
for k, n in d['notes'].items():
    if n.get('kind') == 'title1':
        w, h = n.get('maxW', 1200), 80          # tiêu đề: rộng tối đa maxW, cao ~80
    else:
        w = n['w']
        per = max(1, int((w - 32) / 7.5))       # note size m: ~7.5px/ký tự, dòng 24px, đệm 32px
        lines = sum(max(1, math.ceil(len(p) / per)) for p in n['text'].split('\n'))
        h = 32 + 24 * lines
    R.append(('note', k, n['x'], n['y'], w, h))

hits = []
for i in range(len(R)):
    for j in range(i + 1, len(R)):
        a, b = R[i], R[j]
        if a[2] < b[2] + b[4] and b[2] < a[2] + a[4] and a[3] < b[3] + b[5] and b[3] < a[3] + a[5]:
            hits.append((a[1], b[1]))
print('rects: %d (%d boards, %d notes)' % (len(R), len(d['boards']), len(d['notes'])))
print('overlaps: %d' % len(hits))
for a, b in hits:
    print('  ', a, '<->', b)
for r in R:
    if r[1].startswith(('Discoverer-Parent', 'Discoverer-Home-iPad', 'Discoverer-Quiz-iPad', 'Scientist-Home', 'discovererIpad', 'scientist')):
        print('   %-30s x %5d..%-5d y %5d..%d' % (r[1], r[2], r[2] + r[4], r[3], r[3] + r[5]))
```
</details>

**Chưa chắc / cần Duy hoặc pm**
- Trang chủ A để trống khoảng 880px ở nửa dưới cột phải, vì nội dung phone chỉ có lời chào và thẻ Học tiếp. B cân hơn và gần `NavigationSplitView` chuẩn hơn (thanh bên thay dải tab). Duy chọn A hoặc B.
- Nhãn mục điều hướng trên thanh bên dùng 16px, cỡ chữ của hàng danh sách trên phone, chứ không giữ 12px của dải tab. Cần Duy xác nhận như vậy không trái luật "giữ cỡ chữ phone".
- Bản phone đã có Quiz 3 cột và Chơi 4 cột, nên câu "thay cho 2 cột" trong ticket không khớp. Bản iPad giữ số cột và cho ô to hơn. Mọi thứ vừa khung 600pt nên không dựng bản rộng 760pt.
- Link giữ đúng như bản phone, nên các link vẫn trỏ về màn phone, kể cả Học → Chơi → Quiz. Nếu muốn bấm qua được chuỗi iPad thì đổi 5 `href`.
- Đề xuất cho pm: B7.10 đang xếp Slide Over vào nhóm regular, trong khi Slide Over luôn là compact. Split View 1/2 trên iPad 11" cũng thường là compact. Nên ghi "theo size class hệ thống báo" như note trên canvas.


## Kết quả kiểm (tester, 28/10)

**Kết luận:** đạt mọi phần kiểm tĩnh. Không có lỗi chặn, không có lỗi; có 3 góp ý. Tester không render, không mở trình duyệt. Chiều cao trạng thái dài nhất, tương tác bấm và tắt animation thật trên canvas chưa kiểm.

**Đạt**
- `git diff --stat -- design/` chỉ có `canvas.json`; 4 file iPad là file mới. Không file `.dc.html` cũ nào bị sửa.
- Head trước `</helmet>` giống bản phone ở cả 4 màn (trừ `<title>`). Vì vậy bộ CSS motion và khối `prefers-reduced-motion` y nguyên bản phone.
- Script `DCLogic` của Học, Chơi, Quiz giống phone, chỉ khác `$preview` 834×1194. Gốc của cả 4 màn là 834×1194.
- **`{{key}}`:** mọi chỗ là tra cứu đơn, không có biểu thức. Gốc nào cũng có trong `renderVals`, hoặc là biến vòng lặp `sc-for` có đủ trường trong script: `g.pick/selected/ring/color/en/vi/seen`, `f`, `t.name/color/remove`, `m.label/ok/style`.
  - Số chỗ: Home 4, Học 26, Chơi 51, Quiz 57.
  - Không có khoá thừa.
- **Link và `aria-label`:** Học, Chơi, Quiz khớp bản phone (theo multiset). Trang chủ có đúng gấp đôi, vì file chứa cả bố cục A và B; mỗi bố cục khớp bản phone.
- **Vùng chạm:** mọi nút và lựa chọn là `<button>` hoặc `<a href>`, không có phần tử bấm được nào khác. Không cái nào dưới 56px theo style.
  - Chỗ không ghi chiều rộng đều có `min-height` ≥ 56 và rộng theo chữ, hoặc chứa medallion 56×56: mục điều hướng 58, chủ đề, chip Từ mới 56, Gợi ý 56.
  - Nút chỉ có icon đều có `aria-label`.
- **Style E:**
  - Không có `border` (chỉ `border: none` để reset nút), không `outline`, không nét đứt, không gradient, không emoji.
  - `stroke` chỉ có trong icon nhỏ (dấu tích, loa, dấu đóng), giống phone.
  - Font chỉ có Be Vietnam Pro và Phudu. Không có màu hex nào ngoài bộ màu của bản phone. Không có status bar giả.
- **Bố cục:**
  - Học, Chơi, Quiz nằm trong khung `width: 600px; margin: 0 auto`.
  - Lưới Chơi `repeat(4, …)`, lưới Quiz `repeat(3, …)`, lưới nhóm chất của Học 2×2.
  - Thanh bên Trang chủ 340px (A) hoặc 250px (B), không còn dải tab đáy.
- **Tương phản:** kiểm tĩnh các cặp chữ/nền ghi trong style, không có cặp nào dưới 4.5:1. Một cặp máy báo (chữ than tre trên nền chàm ở món trong mâm) là báo nhầm: chữ nằm trên đĩa giấy `#FBF6EA` bên trong.
- **`canvas.json`:**
  - `python3 -m json.tool` chạy không lỗi.
  - So với HEAD chỉ có: thêm 4 board và 2 note đúng bảng (x 0/914/1828/2742, y 6676, 834×1194, radius 24, `is_interactive`); thêm 4 mục `order` ngay sau `Discoverer-Parent.dc.html`, thứ tự cũ giữ nguyên; dời 5 board Scientist và `scientistRules` từ y 6676 sang 8250, `scientistTitle` từ 6426 sang 8000.
  - Script chồng lấn riêng của tester: 63 hình chữ nhật (43 board, 20 note), **0 chồng nhau**, cả với ước tính note của designer lẫn ước tính dè dặt hơn (9px mỗi ký tự, dòng 28px, tiêu đề cao 110). Chỉ tính board (toạ độ chính xác): 0 chồng nhau. Hàng iPad cách hàng trên và hàng Scientist 380px, như các hàng khác.

**Góp ý**
1. Bản iPad còn chữ cũ, giống bản phone: "Vitamins & minerals" (`Discoverer-Learn-iPad.dc.html:193`) và "Rau & quả" (`Discoverer-Play-iPad.dc.html:282`). SK-002 đã đổi thành "Vitamins, minerals" và "Rau và quả". Ticket ghi việc này để ticket sau; tester ghi lại để không quên, sửa cùng 2 màn phone.
2. Màu nhóm chất béo `#8A5E3B` không có trong bảng style E. Màu này dùng ở `Discoverer-Learn-iPad.dc.html:192` và trong hình ở Học:142, Chơi:196, Quiz:135, kế thừa từ phone. Đã là câu hỏi mở ở SK-001 (`ColorToken`).
3. Trang chủ iPad đang giữ cả bố cục A và B, nên mỗi link và mỗi `aria-label` có hai bản. Khi Duy chọn xong, xoá bố cục còn lại trước khi giao dev, để `LayoutMetrics` không dựng theo cả hai.
