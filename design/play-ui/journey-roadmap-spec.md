# Bản đồ hành trình · spec cho ios-dev

Designer · 10/11/2026 · Nguồn: góp ý của Duy 10/11 ("phần road map xấu quá, phải nhìn như road map, mỗi đầu mục sẽ có 1 icon khác nhau"; "đã hoàn thành phần Khủng long… nhưng không có dấu hiệu gì là đã xong"), SK-030 (không khoá), model `JourneyStop` / `JourneyProgress` của ios-dev (10/11).

**Trạng thái: chờ Duy chọn A hoặc B** và trả lời mục 13. Canvas chưa publish. Màn `Discoverer-Home.dc.html` cũ (còn ổ khoá) giữ nguyên tới khi Duy chốt.

## 1. Artboard

| File (design/play-ui/project) | Khung | Nội dung |
| --- | --- | --- |
| `Discoverer-Home-Roadmap.dc.html` | 390×844, cuộn được | Phương án A · đường quanh co (đề xuất) |
| `Discoverer-Home-Roadmap-B.dc.html` | 390×844, cuộn được | Phương án B · đường mòn sát trái |
| `Discoverer-Home-Roadmap-Full.dc.html` | 390×3000 | A, cả trang cuộn, 17 chủ đề |
| `Discoverer-Home-Roadmap-B-Full.dc.html` | 390×2286 | B, cả trang cuộn |
| `Topic-Icons.dc.html` | 1440×2050 | 45 icon chủ đề, 6 trạng thái chặng, phương án màu triện |

Tình huống vẽ trên artboard (khớp nội dung thật hôm nay): chủ đề 1 Bề mặt Trái Đất đang học 3/5 (thẻ Học tiếp, bài 4 Núi lửa), chủ đề 2 Khủng long đã xong 5/5, chủ đề 9 Ăn uống lành mạnh chưa học 0/2 bài đã soạn, 14 chủ đề còn lại "Sắp có".

Phần trên bản đồ giữ như app hiện nay: header, thẻ Học tiếp, dòng "Hành trình Year 3 · 17 chủ đề · 2 đã bắt đầu", ba chip nhóm tuổi (SK-030). Thẻ Học tiếp đổi hình minh hoạ: đĩa `TopicPlate` giữ nguyên, ở giữa là icon chủ đề (mục 8) thay cho `TopicGlyph` theo mạch.

## 2. Dữ liệu

Đã có trong `JourneyStop`: `state` (`done`, `inProgress(done:total:)`, `notStarted`, `comingSoon`), `isCurrent`, `lessonStates`, `doneCount`, `playableCount`, `topic.key`, `topic.level`. Không cần thêm trạng thái.

Cần thêm:

1. **Năm Oak của chủ đề** để chia chặng: `Syllabus.TopicEntry.source.year` (`null` với chủ đề `new-…`). Đề xuất `JourneyTopic.oakYear: Int?`; chủ đề chỉ có trong nội dung (không có trong danh mục) lấy `nil`.
2. **Sao của chủ đề** (chỉ để hiện, không phải luật mới ở server): lấy từ `lessonStates` các bài `.done(stars:)`. Đề xuất: số sao = làm tròn xuống trung bình sao các bài đã soạn, 1–3 (chờ Duy, mục 13).
3. **Chặng** (tính trong app, thuần, dễ test): đi theo thứ tự hành trình, gom các chủ đề liền nhau có cùng `oakYear` (mọi `nil` liền nhau là một chặng). Đánh số 1…n. Mỗi chặng biết `doneCount` (số chủ đề `state == .done`) và tổng số chủ đề. Discoverer ra 3 chặng: 1–5 (chủ đề mới), 6–11 (Year 3), 12–17 (Year 4). Explorer: 1–6 (Year 1), 7–12 (Year 2). Scientist: 1–3 (mới), 4–9 (Year 5), 10–16 (Year 6).

## 3. Trạng thái một chặng

Kích thước cho A; B trong ngoặc. Bóng là token `shadow.*`, màu là `color.role.*` (bảng màu ở `packages/design-tokens/tokens.json`).

| Trạng thái | Khi nào (`JourneyStop`) | Đĩa | Mảnh lót / vòng | Icon | Dấu | Dòng trạng thái |
| --- | --- | --- | --- | --- | --- | --- |
| Đã xong | `state == .done` | 64 (56), `surface_paper` | `shadow.offset_correct` (mảnh lá tre lệch 5, 6) | 44 (40), đủ màu | Triện 28×28, `feedback_correct`, bo `radius.tag`, xoay −8°, góc dưới phải lệch ra (−9, −8), bóng `shadow.stamp`, dấu tích `PaperIcon.check` 17 màu `text_on_accent` | 3 sao 13pt (đầy `state_current`, rỗng `giay_lom_deep`), cách 2, rồi `home.journey.done` "Đã xong · 5/5 bài", `caption_s` đậm 700, màu **`text_primary`** |
| Đang học, thẻ Học tiếp | `isCurrent` | 80 (68), `surface_paper` | `shadow.offset_accent` (mảnh vàng hoè) + vòng bài (mục 4) | 48 (41) | Avatar của bé, mục 5 | `home.journey.learning` "Đang học · 3/5 bài", `caption_s` 700, `text_accent` |
| Đang học, chủ đề khác | `state == .inProgress`, không `isCurrent` | 64 (56), `surface_paper` | `shadow.paper_3` + vòng bài rộng 6, không mảnh lót | 40 (36) | không | `home.journey.learning`, `caption_s`, `text_secondary` |
| Chưa học | `state == .notStarted` | 64 (56), `surface_paper` | `shadow.paper_3` | 44 (40), đủ màu | không | `home.journey.level` "Mức 2 · 0/2 bài" hoặc `home.journey.new`, `caption_s`, `text_secondary` |
| Sắp có | `state == .comingSoon` | 64 (56), `surface_inactive` | `shadow.paper_2` | 44 (40), `.grayscale(1).opacity(0.42)` | không | `home.journey.soon` "Sắp có", `caption_s`, `text_secondary`; tên chủ đề cũng `text_secondary` |

Tên chủ đề: `typography.item_title` (Be Vietnam Pro 16/700), `text_primary` (Sắp có: `text_secondary`). Khoảng cách tên – dòng trạng thái: 2.

**Sửa so với bản đang chạy:** chữ "Đã xong" đang tô `text_correct` (lá tre). Lá tre trên nền điệp chỉ đạt 4,19:1, dưới mức 4,5:1 cho chữ 12pt. Đổi chữ sang `text_primary`; màu lá tre chỉ nằm ở triện và mảnh lót.

Không khoá: mọi chặng là một nút mở màn Chủ đề, kể cả Sắp có.

## 4. Vòng bài của chặng đang học

Vẽ trong khung vuông bằng đĩa (80 ở A). Mỗi bài **đã soạn** là một mảnh hình quạt khuyên (annular sector, tô kín, không stroke):

- bán kính ngoài = đĩa / 2, bán kính trong = ngoài − 7 (chặng "đang học, chủ đề khác": − 6);
- mảnh thứ i (0…n−1) chạy từ góc −90° + i·360°/n + 3,5° tới −90° + (i+1)·360°/n − 3,5° (khe 7° giữa hai mảnh), theo chiều kim đồng hồ từ đỉnh;
- màu theo `lessonStates`: `.done` → `feedback_correct`; bài `JourneyStop.next` → `state_current`; còn lại → `surface_inactive` (không bóng). Bài đang dở (`.inProgress`) cũng là `state_current` nếu nó là `next`;
- mảnh màu có bóng `shadow.paper_1`;
- n lớn (chủ đề tới 19 bài): giữ khe 7° tới n = 12; n > 12 thì khe 4°.

Ô vuông tiến độ ở thẻ Học tiếp dùng đúng ba màu này (đã như vậy ở `LessonSquares`).

## 5. Avatar "em đang ở đây"

Chỉ ở chặng `isCurrent`. Đĩa giấy 40, `surface_paper`, bóng `shadow.paper_2`, trong là `AvatarArt` 34 của hồ sơ. Đặt ở góc trên của đĩa chặng, phía mép màn: chặng bên trái lệch (−14, −30) so với góc trên trái của đĩa; chặng bên phải lệch (+14, −30) so với góc trên phải. Trang trí, ẩn với VoiceOver. Hiện bằng `motion.preset.pop` một lần trong lượt hiện.

## 6. Bố cục phương án A · đường quanh co

Bản đồ tràn hết bề rộng màn (W = 390 trên iPhone, không trừ lề 20 của khung). Toạ độ là tâm đĩa, đơn vị pt, gốc ở mép trên vùng bản đồ.

- Cột: chặng thứ k trên toàn bản đồ (đếm từ 0, không đếm cột mốc) nằm trái nếu k chẵn, phải nếu k lẻ. Trái x = 70, phải x = W − 70.
- Cột mốc và cờ đích nằm giữa: x = W / 2.
- Trục y: cột mốc chặng 1 ở y = 34. Chặng đầu sau cột mốc: +96. Giữa hai chặng: +124. Từ chặng cuối của một chặng lớn tới cột mốc kế: +104. Cờ đích: chặng cuối +110. Chiều cao vùng bản đồ: cờ +54.
- Dynamic Type: bước dọc giữa hai chặng = max(124, chiều cao hàng chữ cao hơn trong hai hàng + 46). Từ `accessibility1` trở lên dùng bố cục B (một bên, chữ rộng hơn).
- Chữ của chặng bên trái nằm bên phải đĩa, canh trái; chặng bên phải có chữ bên trái đĩa, **canh phải**. Khe đĩa – chữ 14. Bề rộng chữ: trái W − 20 − (x + r + 14); phải (x − r − 14) − 20. Với W = 390, đĩa 64: 254.
- Cả hàng (đĩa + chữ) là một `Button`, cao tối thiểu 64, `buttonStyle(.paperPress)`, định danh giữ `home.topic.<key>`.

**Con đường.** Một `Path` đi qua lần lượt các điểm: cột mốc 1, các chặng, cột mốc 2, …, cờ đích. Mỗi đoạn từ P0 = (x0, y0) tới P1 = (x1, y1) là một cubic có tiếp tuyến dọc ở hai đầu, nên đường rời đĩa và vào đĩa theo chiều thẳng đứng, không cắt qua chữ:

```swift
var road = Path()
road.move(to: points[0])
for (a, b) in zip(points, points.dropFirst()) {
    let dy = b.y - a.y
    road.addCurve(to: b,
                  control1: CGPoint(x: a.x, y: a.y + 0.52 * dy),
                  control2: CGPoint(x: b.x, y: b.y - 0.52 * dy))
}
// Dải giấy: một dải đặc rộng 24, không có viền.
road.stroke(Tokens.Role.surfacePaper, style: StrokeStyle(lineWidth: 24, lineCap: .round))
    .paperDropShadow(Tokens.Shadow.paper2)
```

Đây là dải giấy (stroke rộng tạo thành một băng đặc), không phải nét viền quanh hình. Canvas thêm mép rách bằng filter `paperE`; app bỏ mép rách, giữ bóng. Đường vẽ dưới cùng, đĩa và chữ đè lên. Màu đường **không** đổi theo tiến độ: không khoá nên bé có thể xong chặng 9 trước chặng 1, "đoạn đã đi" không có nghĩa.

Gợi ý dựng: một hàm thuần `JourneyMapGeometry.layout(items:width:rowHeights:) -> [CGPoint]` trả tâm từng mục; một `Layout` tuỳ biến đặt các hàng theo tâm đó, và `Path` của đường dùng cùng mảng điểm. Hàm thuần này test được bằng unit test (bước dọc, cột trái/phải, điểm cờ).

**Cột mốc (cột cây số).** Hình 34×46 tâm ở điểm của nó, chân chạm y + 17: thân giấy `surface_paper` (bo 2 ở đáy), mũ bán nguyệt `action_primary` (đỏ son) bán kính 14 và một dải 2 dưới nó, số chặng `typography.number` (Phudu 18/700, canvas vẽ 17/900) màu `text_primary` ở giữa thân, bóng đất là elip 30×7 `giay_lom_deep` dưới chân. Chữ bên phải, bắt đầu ở x = W/2 + 27: dòng 1 "Chặng 2" (`typography.number`), dòng 2 "Year 3 · 0/6 xong" (`caption_s` 700, `text_secondary`); chặng không có năm: "1/5 xong". Cả khối là header với VoiceOver.

**Cờ đích.** Cột `nau_dat` 4×50, cờ đuôi nheo `action_primary` 30×20, núm `state_current`. Chữ bên phải ở x = W/2 + 45: "Về đích" + "17 chủ đề · 1 đã xong".

**Cảnh bên đường (tuỳ chọn, làm sau cũng được).** Dưới mỗi chặng (trừ chặng ngay trước một cột mốc), ở x = 44 (chặng trái) hoặc W − 44 (chặng phải), y = tâm + 74, đặt một mảnh cảnh nhỏ ~60×24 theo vòng: đồi, ao, bụi cây, ruộng. Chỉ dùng tông giấy lõm (`surface_inactive`, `surface_sunken`, `giay_lom_deep`; ao màu tự nhiên `#CFDCD8`), không có chữ, ẩn với VoiceOver. Mục đích: cho ra cảm giác bản đồ mà không giành mắt với các chặng. Nếu làm, xuất thành 4 SVG nhỏ từ `gen` của designer (xin designer).

## 7. Bố cục phương án B · đường mòn sát trái

- Đĩa 56 (chặng Học tiếp 68). Tâm x xen kẽ 52 / 66 để đường hơi lượn; cột mốc và cờ ở x = 59.
- Trục y: cột mốc 1 ở 26; chặng đầu +70; giữa hai chặng +86 (+94 nếu một trong hai là chặng Học tiếp); chặng cuối tới cột mốc kế +74; cờ +76; cao vùng bản đồ = cờ + 44.
- Chữ luôn bên phải, bắt đầu ở x = 104, rộng W − 124, canh trái. Cột mốc và cờ: chữ một dòng ở x = 104 ("Chặng 2" rồi "Year 3 · 0/6 xong" cùng hàng).
- Đường: như A, rộng 20, k = 0,5.
- Không có cảnh bên đường.

B gọn (vùng bản đồ khoảng 1720 pt cho 17 chủ đề, A khoảng 2430), tên dài đọc dễ hơn, hợp Dynamic Type lớn và thanh bên iPad; A ra dáng bản đồ hơn, đúng ý "phải nhìn như road map".

## 8. Icon chủ đề

**File.** `design/icons/topics/<key>.svg`, key theo `content/syllabus.json`. Khung 64×64, chỉ dùng `path`, `circle`, `ellipse`, `rect`, `g fill`, `transform` (rotate, translate), `fill-rule="evenodd"`. Không filter, không `opacity`, không text, không gradient, không clipPath, không `use`, không stroke, nên CoreSVG của Xcode và trình nhập VectorDrawable của Android đều đọc được. Mỗi file 2–4 màu giấy cộng chi tiết nhỏ (mắt, khe). Ba ngoại lệ có chủ đích: khối băng của `introduction-to-states-of-matter-and-changing-states` là 3 sắc của một mảnh; mắt và vân là chi tiết.

Màu ngoài bảng token (màu tự nhiên dịu, trộn từ token): `#D98A76` hồng (não, ruột; đỏ son 45% + giấy 55%), `#CFDCD8` băng/thuỷ tinh (giấy 70% + gỉ đồng 30%), `#9FBDB8`, `#7EA39E` (hai mặt khối băng), `#D9A066` da tay (đã có trên canvas: quả trứng), `#D7C8A5`, `#3D352B`, `#A26E28` (mặt khuất của đá và khối gỗ).

**Nhập vào app.**

1. Mỗi icon một image set trong `Assets.xcassets/Art/Topics/` (thư mục không bật Provides Namespace): `Topic-<key>.imageset/Topic-<key>.svg` + `Contents.json` như `ArtTopicBowl`:

   ```json
   {
     "images": [{ "filename": "Topic-new-dinosaurs.svg", "idiom": "universal" }],
     "info": { "author": "xcode", "version": 1 },
     "properties": { "preserves-vector-representation": true }
   }
   ```

   Trong Xcode: Attributes inspector → Resizing → **Preserve Vector Data** bật, Scales: **Single Scale**. Không cần PNG.
2. Chép bằng một vòng lặp, chạy lại khi designer sửa icon:

   ```sh
   for f in design/icons/topics/*.svg; do
     k=$(basename "$f" .svg); d="apps/ios/ScienceKids/Resources/Assets.xcassets/Art/Topics/Topic-$k.imageset"
     mkdir -p "$d" && cp "$f" "$d/Topic-$k.svg"
     printf '{\n  "images" : [ { "filename" : "Topic-%s.svg", "idiom" : "universal" } ],\n  "info" : { "author" : "xcode", "version" : 1 },\n  "properties" : { "preserves-vector-representation" : true }\n}\n' "$k" > "$d/Contents.json"
   done
   ```
3. `TopicGlyph` nhận thêm `key`: có asset `Topic-<key>` thì vẽ `Image("Topic-\(key)").resizable().scaledToFit()` với `.paperDropShadow(Tokens.Shadow.paper1)` (như `ArtTopicBowl`); không có (chủ đề chỉ có trong nội dung) thì giữ glyph theo mạch hiện nay. `TopicPlate` (thẻ Học tiếp, hero màn Chủ đề) dùng cùng icon, cỡ 0,53 × đĩa.
4. Icon luôn là trang trí (`accessibilityHidden`); hàng hoặc nút bao ngoài mang nhãn.

Về sau (GĐ 2) có thể chuyển icon vào content pack (`topic.icon`), nhưng hôm nay key danh mục đủ để tra, không cần đổi schema.

**Danh sách 45 icon** (đã vẽ đủ cả ba nhóm):

**Discoverer** (17)

| # | key = tên file | Chủ đề | Hình |
| --- | --- | --- | --- |
| 1 | `new-earth-surface` | Bề mặt Trái Đất: núi lửa, động đất, đại dương | núi lửa trên đảo giữa biển |
| 2 | `new-dinosaurs` | Khủng long và Trái Đất thời xa xưa | khủng long cổ dài |
| 3 | `new-breathing` | Hô hấp | hai lá phổi |
| 4 | `new-brain` | Não bộ và giác quan | não nhìn nghiêng |
| 5 | `new-weather` | Thời tiết và thiên tai ở Việt Nam | mây giông, sét, mưa |
| 6 | `rocks-and-soils` | Đá và đất | đá góc cạnh trên lớp đất |
| 7 | `introduction-to-the-human-skeleton-and-muscles` | Bộ xương và cơ bắp | xương + bắp cơ |
| 8 | `simple-forces-including-magnets` | Lực và nam châm | nam châm chữ U, tia lực |
| 9 | `healthy-eating` | Ăn uống lành mạnh | bát cơm và đôi đũa |
| 10 | `what-plants-do-and-what-they-need` | Cây làm gì và cần gì | cây trong chậu + nắng |
| 11 | `introduction-to-light-and-shadows` | Ánh sáng và bóng tối | nắng, người và cái bóng |
| 12 | `introduction-to-the-human-digestive-system` | Hệ tiêu hoá | thực quản, dạ dày, ruột |
| 13 | `introduction-to-states-of-matter-and-changing-states` | Các thể của vật chất | đá lạnh, giọt nước, hơi nước |
| 14 | `simple-electrical-circuits` | Mạch điện đơn giản | pin nối bóng đèn |
| 15 | `introduction-to-sound` | Âm thanh | trống trường + sóng âm |
| 16 | `living-things-and-the-environment` | Sinh vật và môi trường | đồi, sông, cây |
| 17 | `more-about-food-chains` | Chuỗi thức ăn nâng cao | cá lớn đuổi cá nhỏ |

**Explorer** (12)

| # | key = tên file | Chủ đề | Hình |
| --- | --- | --- | --- |
| 1 | `naming-and-grouping-animals` | Gọi tên và nhóm động vật | gà trống Đông Hồ |
| 2 | `seasonal-changes-autumn-and-winter` | Thu, đông và mùa khô | lá rơi mùa thu |
| 3 | `human-body-parts` | Cơ thể của em | bàn tay |
| 4 | `identifying-plants-and-their-basic-parts` | Cây quanh em | cây ăn quả |
| 5 | `seasonal-changes-spring-and-summer` | Xuân, hè và mùa mưa | ô che mưa, nắng sau mây |
| 6 | `everyday-materials` | Vật liệu quanh em | khối gỗ và lon kim loại |
| 7 | `uses-of-everyday-materials` | Vật liệu dùng làm gì? | ghế gỗ có nệm |
| 8 | `growing-plants` | Trồng cây | hạt nảy mầm trong đất, giọt nước |
| 9 | `new-life` | Sự sống mới | tổ chim, trứng, chim non |
| 10 | `introduction-to-food-chains` | Chuỗi thức ăn | sâu ăn lá |
| 11 | `living-things-and-where-they-live` | Sinh vật sống ở đâu? | ếch trên lá súng |
| 12 | `healthy-me` | Em khoẻ mạnh | răng và bàn chải |

**Scientist** (16)

| # | key = tên file | Chủ đề | Hình |
| --- | --- | --- | --- |
| 1 | `new-water-air` | Nước và không khí | sóng nước + gió |
| 2 | `new-space` | Các vì sao và du hành vũ trụ | tên lửa |
| 3 | `new-fungi` | Nấm | nấm |
| 4 | `properties-changes-and-separating-materials` | Tính chất và biến đổi vật liệu | bình tam giác có bọt |
| 5 | `forces-including-simple-machines` | Lực và máy đơn giản | bánh răng |
| 6 | `earth-sun-and-moon` | Trái Đất, Mặt Trời, Mặt Trăng | Mặt Trời, Trái Đất, Mặt Trăng |
| 7 | `reproduction-and-life-cycles-plants` | Sinh sản ở thực vật | ong và hoa (thụ phấn) |
| 8 | `reproduction-and-life-cycles-animals` | Sinh sản ở động vật | bướm |
| 9 | `human-development` | Sự phát triển của con người | bé, thiếu niên, người lớn |
| 10 | `the-human-circulatory-system` | Hệ tuần hoàn | tim và mạch máu |
| 11 | `changing-circuits` | Mạch điện nâng cao | bóng sáng + công tắc |
| 12 | `keeping-healthy` | Giữ gìn sức khoẻ | tạ tay và quả táo |
| 13 | `why-we-group-and-classify-living-things` | Phân loại sinh vật | kính lúp soi bọ rùa |
| 14 | `evolution-and-inheritance` | Tiến hoá và di truyền | chuỗi xoắn ADN |
| 15 | `light-and-how-it-travels` | Ánh sáng truyền đi thế nào | đèn pin chiếu tia sáng thẳng |
| 16 | `climate-change-and-sustainability-non-statutory` | Năng lượng và biến đổi khí hậu | tua bin gió trên đồi, nắng |

## 9. Chuyển động

- Lượt hiện (`reveal(order:)`) cho những gì nằm trong màn đầu: header 0, thẻ 1, tiêu đề 2, chip 3, rồi các mục bản đồ theo thứ tự đọc (cột mốc, chặng). Độ trễ của bản đồ bắt đầu 140 ms, mỗi mục +70 ms, chặn ở 420 ms, nên xong trong khoảng 0,5 s. Mục ở dưới màn đầu hiện ngay khi cuộn tới, không chạy lại lượt hiện.
- Triện "Đã xong" đóng bằng `motion.preset.stamp` **chỉ lần đầu** Home thấy chủ đề đó đã xong (vừa học xong quay về); app nhớ tập key đã thấy xong. Các lần sau triện đứng yên. Canvas cho triện đóng mỗi lần mở để minh hoạ.
- Avatar: `pop` một lần.
- Không có chuyển động lặp trên bản đồ. Chuyển động lặp duy nhất của màn vẫn là `nudge` trên nút chơi của thẻ Học tiếp.
- Bấm một hàng: `press`.
- Bật giảm chuyển động: tắt hết, hiện trạng thái cuối.
- Không tự cuộn bản đồ khi mở Home (thẻ Học tiếp đã ở trên cùng).

## 10. Trợ năng

- Mỗi chặng một nút, nhãn = tên chủ đề + trạng thái, ví dụ "Khủng long và Trái Đất thời xa xưa. Đã xong, 5 trên 5 bài, 3 sao"; "Bề mặt Trái Đất: núi lửa, động đất, đại dương. Đang học, 3 trên 5 bài"; "Hô hấp. Sắp có".
- Cột mốc: `.isHeader`, nhãn "Chặng 2, Year 3, 0 trên 6 chủ đề xong", để VoiceOver nhảy theo heading.
- Đường, cảnh, avatar, icon, sao: ẩn.
- Thứ tự đọc từ trên xuống, không theo cột trái/phải: đặt các hàng trong cây view theo đúng thứ tự hành trình (hoặc `accessibilitySortPriority` giảm dần theo chỉ số).
- Tương phản: mọi chữ ≥ 4,5:1 trên nền điệp (chữ chính 13,8:1, chữ phụ 7,8:1, đỏ son 5,1:1). Không dùng lá tre cho chữ.
- Vùng chạm: cả hàng, cao ≥ 64 (A) / 56 (B); đĩa không nhỏ hơn 56.

## 11. iPad (regular width)

Chưa dựng artboard; ghi chú ở canvas (`discovererRoadmapIpad`).

- Giữ khung Trang chủ iPad bố cục A (thanh bên `layout.home_sidebar_a` 340 + cột nội dung).
- Nếu Duy chọn **A**: bản đồ chuyển sang cột nội dung, dưới thẻ Học tiếp (phần dưới cột này hiện đang trống). Bề rộng bản đồ tối đa 600 canh giữa; chặng trái x = 70, phải x = W − 70; chữ rộng tối đa 300. Thanh bên giữ 4 tab và thêm danh sách các chặng ("Chặng 1 · 1/5 xong"…); chạm một chặng thì cuộn bản đồ tới cột mốc đó.
- Nếu Duy chọn **B**: đường mòn vừa đúng thanh bên 340, giữ hành trình trong thanh bên như hiện nay, chỉ đổi cách vẽ.
- Vùng chạm không co. Split View hẹp (compact) dùng bố cục iPhone.

## 12. Chuỗi mới cần thêm

ios-dev thêm vào `Localizable.xcstrings`; content-editor xem câu chữ.

| Key đề xuất | VI | EN |
| --- | --- | --- |
| `home.journey.segment %lld` | Chặng %lld | Stage %lld |
| `home.journey.segment_done %lld %lld` | %1$lld/%2$lld xong | %1$lld/%2$lld done |
| `home.journey.segment_year_done %lld %lld %lld` | Year %1$lld · %2$lld/%3$lld xong | Year %1$lld · %2$lld/%3$lld done |
| `home.journey.segment_a11y …` | Chặng %1$lld, Year %2$lld, %3$lld trên %4$lld chủ đề xong | Stage %1$lld, Year %2$lld, %3$lld of %4$lld topics done |
| `home.journey.finish` | Về đích | Finish |
| `home.journey.finish_detail %lld %lld` | %1$lld chủ đề · %2$lld đã xong | %1$lld topics · %2$lld done |
| `home.journey.stars_a11y %lld` | %lld sao | %lld stars |

## 13. Câu hỏi cho Duy

1. **A hay B?** Designer đề xuất A (ra dáng bản đồ, đúng góp ý), B dự phòng cho chữ lớn và thanh bên iPad.
2. **Màu "Đã xong".** Đề xuất lá tre (mảnh lót + triện có tích), như ô bài đã xong ios-dev làm 10/11: trên bản đồ đỏ son đã mang nghĩa "học tiếp / bấm vào đây" (chữ Đang học, nút chơi), triện đỏ son ở chặng xong sẽ tranh với chặng đang học. Phương án đỏ son (như lịch chuỗi ngày, đúng luật cũ "đỏ son cho triện đánh dấu") vẽ ở `Topic-Icons`. Nếu chọn lá tre, đề xuất thêm vai token `color.role.state_done → la_tre` để luật "lá tre chỉ để báo đúng" mở rộng có tên.
3. **Sao của chủ đề.** Ba sao theo trung bình làm tròn xuống (đề xuất, dễ nhìn), hay ghi tổng "14/15 sao", hay bỏ sao ở hành trình.
4. **Tên chặng.** "Chặng n" + năm Oak (Year 3, Year 4) như đang vẽ, hay bỏ chữ Year (bé Year 3 thấy "Year 4" có thể thắc mắc), hay chia đều 5 chủ đề một chặng.
5. **Cảnh bên đường** (đồi, ao, ruộng): giữ hay bỏ.
6. **Màu tự nhiên ngoài token** trong icon (hồng của não và ruột, xanh băng, da tay): chấp nhận hay ép về token (não sẽ thành vàng nhạt, khó nhận ra).
7. Tên chủ đề 1 dài nên thẻ Học tiếp cao 3 dòng (đã ghi ở SK-031: tên đang chờ Duy chốt).
