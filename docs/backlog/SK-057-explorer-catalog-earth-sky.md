# SK-057 · Danh mục Explorer theo lộ trình 18/11: bỏ hai chủ đề vật liệu và *Em khoẻ mạnh*, thêm ba chủ đề Trái Đất và bầu trời

Trạng thái: review · Ngày: 2026-11-19 · Phụ trách: dev (danh mục, test content-cli/content-schema) · ios-dev (test đếm, chặng bản đồ, icon) · designer (3 icon, spec bản đồ) · content-editor (sửa `order` và ghi chú cũ) · phiên chính chạy lệnh · Tester: tester
Nguồn: Duy 19/11 (chọn **cách (a)** cho câu hỏi phạm vi của PM khi khép SK-053; xác nhận B1 "bỏ hết" đã chốt); [docs/syllabus-review-2026-11-18.md](../syllabus-review-2026-11-18.md) mục 3.1 (chủ đề bỏ), 4.1 (Explorer 11 chủ đề / 70 bài), 6 (B1); [SK-053](SK-053-explorer-8-life-cycles.md) "Còn mở cho Duy" mục 4, 5; `content/syllabus.json` (Explorer #8 `everyday-materials`, #9 `uses-of-everyday-materials`, #10 `new-life`, #11 `healthy-me`); `packages/content-schema/scripts/lib/syllabus.mjs` (luật key `new-`, `oak_lessons: []` cho chủ đề mới); `apps/ios/Packages/SKKit/Sources/ContentKit/JourneyProgress.swift` (`JourneySegment.of`: chặng = các chủ đề liền nhau cùng năm Oak); `design/play-ui/journey-roadmap-spec.md` mục 3, 8

> **Chốt 19/11.** Duy chốt cách (a): chỉ đổi **danh mục Explorer**. Lộ trình Discoverer, Scientist (bản rà mục 4.2–4.3) vẫn chờ Duy chốt, ticket này không đụng. Nội dung ba chủ đề mới soạn ở ticket riêng (#9: [SK-058](SK-058-explorer-9-mountains-rivers-seas.md); #10, #11 mở sau). Tên bài của ba chủ đề mới là **dự kiến, Duy chốt khi soạn**; đổi tên sau chỉ là sửa danh mục.

> **19/11 (lượt 2): Duy bỏ #10 *Nước quanh em*; *Bầu trời ngày và đêm* thành #10.** Làm ở [SK-061](SK-061-explorer-10-sky-day-and-night.md). Số đếm thành Explorer 10 / 64, cả app 43 / 375, bản đồ vẫn 6 chặng (`8..<10`). Số đếm ở ticket này giữ làm lịch sử.

## Mục tiêu

Danh mục `content/syllabus.json` và app khớp lộ trình Explorer Duy chốt 19/11: 11 chủ đề / 70 bài, *Lớn lên* là #8, ba chủ đề Trái Đất và bầu trời là #9–#11 (hiện "Chưa có nội dung" cho tới khi soạn); cả app 44 chủ đề / 381 bài.

## Phạm vi / Ngoài phạm vi

### Phạm vi

**1. Danh mục (dev).** Trong nhóm `explorer` của `content/syllabus.json`:
- Bỏ ba khối `everyday-materials` (7 bài), `uses-of-everyday-materials` (6 bài), `healthy-me` (7 bài). Cả ba chưa có `topic_id`, `lesson_id` nào, chưa có thư mục trong `content/explorer/`.
- `new-life` đổi `number: 10` → **8**. Mọi trường khác giữ (`title`, `source`, `level: 2`, 6 bài, id).
- Thêm ba khối, `number` 9, 10, 11, theo bảng dưới. Mỗi khối: `strand: earth_sky`, `source: {"kind": "new"}`; mỗi bài `oak_lessons: []`, `statutory: false`, **không** có `extension` (luật: chủ đề mới không dùng `extension`). Chưa có `topic_id`, `lesson_id`; phiên chính gắn sau `ids` khi soạn.
- `level` tạm (content-editor chấm lại khi soạn, theo `syllabus-progression.md` mục 3): #9 **1**, #10 **2**, #11 **2**.
- #1–#7 và nhóm Discoverer, Scientist không đổi một byte. `oak_years` của Explorer giữ `[1, 2]`. `syllabus_version` giữ như SK-051, SK-053.

| # | `key` | Tên EN · VI | `level` |
| --- | --- | --- | --- |
| 9 | `new-mountains-rivers-and-seas` | Mountains, rivers and seas · Núi, sông và biển | 1 |
| 10 | `new-water-around-us` | Water around us · Nước quanh em | 2 |
| 11 | `new-sky-day-and-night` | The sky by day and night · Bầu trời ngày và đêm | 2 |

**Bài dự kiến** (Duy chốt khi soạn; nguồn ý: bản rà mục 4.1; tên EN do PM đặt, ≤ 6 từ cho thẻ bản đồ):

| Chủ đề | # | Tên EN · VI |
| --- | --- | --- |
| #9 Núi, sông và biển | 1 | Land and sea · Đất liền và biển |
| | 2 | Mountains and hills · Núi và đồi |
| | 3 | Plains and rice fields · Đồng bằng và ruộng lúa |
| | 4 | Rivers and lakes · Sông và hồ |
| | 5 | Beaches, islands and bays · Bãi biển, đảo và vịnh |
| | 6 | Caves · Hang động |
| #10 Nước quanh em | 1 | Where is the water? · Nước ở đâu quanh em? |
| | 2 | Where does rain come from? · Mưa từ đâu ra? |
| | 3 | Water flows to the sea · Nước chảy từ suối ra sông, ra biển |
| | 4 | Float or sink? · Nổi hay chìm? |
| | 5 | Melting ice, boiling water · Nước đá tan, nước sôi bốc hơi |
| | 6 | Clean water, safe near water · Nước quý: giữ nước sạch, an toàn khi ở gần nước |
| #11 Bầu trời ngày và đêm | 1 | The Sun gives light and warmth · Mặt Trời cho ánh sáng và hơi ấm |
| | 2 | Day and night · Ngày và đêm |
| | 3 | Shadows change in the day · Bóng nắng đổi theo giờ trong ngày |
| | 4 | The Moon changes shape · Mặt Trăng đổi hình |
| | 5 | The stars · Các vì sao |
| | 6 | The Earth is a big ball · Trái Đất là một quả cầu lớn |

#9 bài 1 đổi tên so với bản rà ("Đất liền và biển: Trái Đất nhìn từ trên cao" → "Đất liền và biển"), để không lấn #11 bài 6 (xem SK-058). #11 bài 4 bỏ phần sau dấu hai chấm của bản rà ("trăng rằm, trăng lưỡi liềm") cho tên ngắn; ý vẫn giữ.

**Số đếm sau khi đổi:**

| | Chủ đề | Bài |
| --- | --- | --- |
| Explorer | 11 (6 unit Oak, 5 mới) | 72 − 20 + 18 = **70** |
| Discoverer | 17 | 155 |
| Scientist | 16 | 156 |
| **Cả app** | **44** (31 unit Oak, 13 mới: Explorer 5, Discoverer 5, Scientist 3) | **381** |

**2. Nội dung có sẵn (content-editor, chỉ ghi chú, không chữ bé nghe, không chạy lại `tts`):**
- `content/explorer/lon-len/_topic.md`: `order: 10` → `8`; dòng 115 bỏ câu "danh mục giữ #10 tới khi Duy chốt bỏ hai chủ đề vật liệu", ghi "Duy chốt 19/11, SK-057".
- Các ghi chú trỏ chủ đề cũ: `noi-song-tren-trai-dat/_topic.md:714` ("*Cây quanh em*, *Trồng cây* (#7, #11)" → "*Cây quanh em* (#7)", việc còn sót của SK-051), `:715` và `cay-quanh-em/_topic.md:433` ("#10 trong danh mục" → "#8"); `co-the-cua-em/_topic.md:757` và `co-the-cua-em/02-bo-phan-ben-ngoai-co-the.md:487` (*Em khoẻ mạnh* đã bỏ 19/11; ghi lại rằng app không có bài dạy đánh răng, câu q5 vẫn chỉ dùng đánh răng làm tình huống).
- Grep lại `Em khoẻ mạnh`, `Vật liệu quanh em`, `Vật liệu dùng làm gì`, `#10 trong danh mục` trong `content/explorer/`; chỉ còn ở dòng lịch sử có ngày.

**3. Icon (designer):**
- Vẽ ba icon mới `design/icons/topics/new-mountains-rivers-and-seas.svg`, `new-water-around-us.svg`, `new-sky-day-and-night.svg`, cùng khuôn 44 icon hiện có (giấy cắt, không nét viền). Gợi ý: núi, sông uốn, mép biển; giọt nước, gợn sóng; nửa Mặt Trời nửa trăng khuyết có sao. Ba icon phải khác rõ `new-weather-and-seasons`, `new-earth-surface`, `earth-sun-and-moon`, `new-water-air`.
- Chuyển `everyday-materials.svg`, `uses-of-everyday-materials.svg`, `healthy-me.svg` sang `design/icons/topics/_retired/` (như SK-050, SK-051).
- `design/play-ui/project/Topic-Icons.dc.html`: Explorer đánh lại #8–#11 (Lớn lên #8, ba icon mới #9–#11), vẫn 44 icon.
- `design/play-ui/journey-roadmap-spec.md`: mục 8 (danh sách icon, Explorer 11, tên EN), mục 3 (Explorer **6 chặng**, `stopRange` mới, xem mục 4 dưới).

**4. App (ios-dev), sau khi dev đổi danh mục và designer giao ba icon:**
- Test đếm và năm Oak:
  - `Packages/SKKit/Tests/ContentModelTests/SyllabusTests.swift:28` `[72, 155, 156]` → `[70, 155, 156]`; dòng 27 `[11, 17, 16]` giữ;
  - `SyllabusTests.swift:56` `oakYear` Explorer `[1, 2, 2, nil, nil, 1, 1, 1, 2, 2, 2]` → `[1, 2, 2, nil, nil, 1, 1, 2, nil, nil, nil]`, chú thích SK-057;
  - `Packages/SKKit/Tests/ContentKitTests/JourneyTests.swift:37` 383 → 381;
  - `JourneySegmentTests.swift:27–28`: `stopRange` → `[0..<1, 1..<3, 3..<5, 5..<7, 7..<8, 8..<11]`, `oakYear` → `[1, 2, nil, 1, 2, nil]`; sửa chú thích dòng 9–11, 23–26;
  - `ScienceKidsTests/JourneyMapAppTests.swift:75` `5 + 11 + 1` → `6 + 11 + 1`, chú thích dòng 41, 74; dòng 18 (44 chủ đề) giữ.
- **Chặng bản đồ.** Luật hiện hành (`JourneySegment.of`) gom chủ đề liền nhau cùng `oakYear`. Sau khi đổi, *Lớn lên* (Year 2) đứng một mình giữa *Cây quanh em* (Year 1) và ba chủ đề mới (`nil`), nên **có tạo chặng mới**: Explorer từ 5 thành **6 chặng**: 1 (Y1) · 2–3 (Y2) · 4–5 (mới) · 6–7 (Y1) · 8 (Y2, một chủ đề) · 9–11 (mới). Ticket này giữ luật, không đổi code; chỉ sửa test. Có nên giữ hay không là câu hỏi cho Duy ("Câu hỏi còn mở" mục 1).
- **Icon:** chạy `sh apps/ios/scripts/import-topic-icons.sh` sau khi designer giao; catalog có `Topic-new-mountains-rivers-and-seas`, `Topic-new-water-around-us`, `Topic-new-sky-day-and-night`, không còn ba imageset cũ. `ScienceKids/Common/Art.swift:63` icon mặc định của mạch `materials` đang là `everyday-materials` (sắp bỏ) → đổi sang `introduction-to-states-of-matter-and-changing-states` (chủ đề `materials` còn lại trong bản rà, Discoverer #10 *Nước đổi dạng*).
- Grep lại `383`, `72,`, `5 + 11`, `everyday-materials`, `healthy-me` trong `apps/ios` sau khi sửa.

### Ngoài phạm vi

- Soạn nội dung #9–#11 (SK-058 cho #9; #10, #11 mở sau khi Duy chốt bài).
- Lộ trình Discoverer, Scientist (bản rà mục 4.2–4.3): chủ đề bỏ, gộp, thêm ở hai nhóm đó; cờ nội dung nhạy cảm; đổi fixture `healthy-eating`; hai bài *Ăn uống lành mạnh* lưu kho. Chờ Duy chốt.
- Đổi luật chia chặng bản đồ (chỉ làm nếu Duy chọn khác ở "Câu hỏi còn mở" mục 1, ticket riêng).
- `syllabus-lessons.md` viết lại các mục Explorer (PM làm lượt sau; lượt này chỉ thêm ghi chú đầu file).
- Database, RPC, gói nội dung: danh mục chưa vào gói, không có bảng chủ đề ở server.

## Tiêu chí nghiệm thu

### dev
- [x] `content/syllabus.json` nhóm `explorer`: đúng 11 chủ đề theo thứ tự key `naming-and-grouping-animals`, `living-things-and-where-they-live`, `introduction-to-food-chains`, `new-habitats-around-the-world`, `new-weather-and-seasons`, `human-body-parts`, `identifying-plants-and-their-basic-parts`, `new-life`, `new-mountains-rivers-and-seas`, `new-water-around-us`, `new-sky-day-and-night`; `number` 1…11.
- [x] Ba khối mới đúng bảng "Phạm vi" (key, tên EN/VI từng chữ, `strand`, `level`, `source`, 6 bài mỗi khối, `oak_lessons: []`, `statutory: false`, không `extension`, không id).
- [x] #1–#7 và `new-life` (trừ `number`) không đổi; nhóm Discoverer, Scientist không đổi. Kiểm: diff chỉ chạm nhóm `explorer`; mọi `topic_id`, `lesson_id` cũ còn nguyên (đếm trước/sau bằng nhau).
- [x] Test đếm và chú thích: `tools/content-cli/test/syllabus.test.ts` dòng 95, 101, 109 ("44 chủ đề, 383 bài" → "44 chủ đề, 381 bài"); `tools/content-cli/src/markdown/syllabus.ts:51`; `tools/content-cli/README.md:348`; `packages/content-schema/test/syllabus.test.mjs:305–316` (Explorer `["explorer", 11, 70]`, tổng 381, chú thích SK-057). Fixture tổng hợp ở `syllabus.test.mjs:47` dùng `everyday-materials` làm ví dụ, giữ.
- [x] `node tools/content-cli/src/cli.ts validate content`: 0 lỗi, 0 cảnh báo `syllabus_*`, dòng tổng "3 nhóm, 44 chủ đề, 381 bài". `npm --prefix tools/content-cli test`, `npm --prefix packages/content-schema test` xanh.
- [x] Không đổi luật validator.

### content-editor
- [ ] `content/explorer/lon-len/_topic.md` có `order: 8`; các ghi chú ở "Phạm vi" mục 2 đã sửa; grep như mục 2 chỉ còn dòng lịch sử có ngày. `validate content/explorer` 0 lỗi.

### designer
- [x] Ba file icon mới có trong `design/icons/topics/`, đúng tên key; ba icon cũ ở `_retired/`; `design/icons/topics/*.svg` đúng 44 file và trùng 44 key của danh mục (kiểm bằng so danh sách).
- [x] Icon theo style E: không nét viền trên hình khối, màu từ token; nhìn khác rõ bốn icon gần nghĩa nêu ở "Phạm vi" mục 3.
- [x] `Topic-Icons.dc.html` và `journey-roadmap-spec.md` mục 3, 8 khớp danh mục mới (Explorer 11 icon, #8 Lớn lên, 6 chặng).

### ios-dev
- [ ] Các test ở "Phạm vi" mục 4 đã sửa; grep lại không còn số cũ (trừ `390` là bề rộng máy).
- [ ] `JourneyMapAppTests.everySyllabusTopicHasItsIcon` xanh: 44 chủ đề, chủ đề nào cũng dùng icon riêng; icon mặc định của mọi mạch có trong catalog.
- [ ] `ContentModelTests`, `ContentKitTests`, `ScienceKidsTests` xanh trên simulator **iPhone 16**, một máy, một lần (không iPhone 16 Pro).
- [ ] Chạy thử: Trang chủ Explorer hiện 6 chặng; chặng 5 chỉ có *Lớn lên* (6 bài, chơi được); chặng 6 có #9–#11 với icon mới, mỗi chủ đề 6 bài "Chưa có nội dung"; không còn *Vật liệu quanh em*, *Vật liệu dùng làm gì?*, *Em khoẻ mạnh*. Chụp một ảnh màn bản đồ gắn vào ticket.

### phiên chính
- [ ] Sau khi content-editor sửa `order`: `validate`, `build`, `check-pack` OK (gói đổi `order` của *Lớn lên*).

### tester
- [ ] Đếm máy từ `content/syllabus.json`: Explorer 11 / 70 (8 + 7 + 4 + 8 + 6 + 6 + 7 + 6 + 6 + 6 + 6); cả app 44 / 381; 31 chủ đề `kind: oak`, 13 `kind: new`; không slug Oak nào trùng.
- [ ] Chạy lại test content-cli, content-schema; đọc kết quả test iOS của ios-dev; kiểm ảnh màn bản đồ khớp 6 chặng.

### pm (đóng ticket)
- [ ] `syllabus.md` mục 0 (số đếm từ khi danh mục đổi), `prd.md`, `technical-plan.md`, `docs/backlog/README.md` chuyển từ "khi SK-057 xong" sang số hiện hành 44 / 381; ghi câu trả lời của Duy về chặng bản đồ.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc:**
- SK-053 (review) và SK-051 đang chờ Duy review, commit; cùng sửa `SyllabusTests`, `JourneyTests`, `JourneySegmentTests` và `content/syllabus.json`. Làm tiếp trên cây làm việc hiện tại, không hoàn tác thay đổi chưa commit của hai ticket đó.
- ios-dev chờ dev (danh mục) và designer (ba icon). dev, designer, content-editor làm song song.

**Quyết định đã ghi:**
1. *(Duy 19/11)* Cách (a): bỏ `everyday-materials`, `uses-of-everyday-materials`, `healthy-me`; thêm ba chủ đề Trái Đất và bầu trời; *Lớn lên* thành #8. Phạm vi chỉ Explorer.
2. *(Duy 18/11, xác nhận 19/11)* B1 "bỏ hết" đã chốt. Chỗ `syllabus.md` mục 8 và SK-053 ghi "chờ chốt" đã sửa 19/11.
3. *(PM)* Key ba chủ đề theo luật `new-` và tên EN ở `syllabus.md` mục 3. Thư mục nội dung đề xuất khi soạn: `nui-song-va-bien`, `nuoc-quanh-em`, `bau-troi-ngay-va-dem`.
4. *(PM, theo SK-053 "Còn mở cho Duy" mục 5, phương án a)* `new-life` giữ `level: 2` trong lượt đổi danh mục này; Mức chỉ để tham khảo.
5. *(PM)* `level` của ba chủ đề mới là tạm, content-editor chấm lại khi soạn; đổi thì dev sửa danh mục cùng lượt ghi id.
6. *(PM)* Icon mặc định của mạch `materials` chuyển sang `introduction-to-states-of-matter-and-changing-states`, vì chủ đề này còn trong bản rà (Discoverer #10).

**Câu hỏi còn mở (cho Duy):**
1. **Chặng bản đồ Explorer.** Theo luật hiện hành ra 6 chặng, chặng 5 chỉ có *Lớn lên*. Ba cách:
   - (A) giữ luật chia theo năm Oak, nhận 6 chặng. Không đổi code. Chặng 1 cũng chỉ có một chủ đề, nên một chặng một chủ đề không phải ca mới.
   - (B) Explorer chia đều, khoảng 3–4 chủ đề một chặng. Phải sửa `JourneySegment`, spec và nhãn cột mốc (bỏ "Year n").
   - (C) ghi chặng tay trong danh mục (trường mới). Phải đổi schema, validate, app.

   **PM đề xuất (A) ngay bây giờ.** Khi Duy chốt lộ trình Discoverer, Scientist thì xét lại cả luật chia chặng cho ba nhóm: Oak chỉ còn là kho tham khảo (nguyên tắc N3), nên "năm Oak" sẽ mất dần ý nghĩa. Câu này gắn với câu 4 "Tên chặng" còn mở ở `journey-roadmap-spec.md`.
2. **Tên 18 bài dự kiến** ở bảng "Phạm vi": Duy chốt theo từng chủ đề khi soạn (SK-058 cho #9). Không chặn ticket này.

## Ghi chú dev (19/11)

**Đã làm.** Duy chốt cách (a), chặng bản đồ phương án (A) (giữ luật `JourneySegment.of`, dev không đụng code app).
- `content/syllabus.json`: nhóm `explorer` bỏ `everyday-materials`, `uses-of-everyday-materials`, `healthy-me`; `new-life` `number` 10 → 8; thêm `new-mountains-rivers-and-seas` (#9, `level` 1), `new-water-around-us` (#10, `level` 2), `new-sky-day-and-night` (#11, `level` 2), `strand: earth_sky`, `source: {"kind": "new"}`, mỗi khối 6 bài `oak_lessons: []`, `statutory: false`, không `extension`, không `topic_id`/`lesson_id`. Thứ tự trường trong khối mới giống khối có sẵn (`key, number, title, strand, level, source, lessons`). Ghi lại bằng Python `json.dumps(ensure_ascii=False, indent=2) + "\n"` (file cũ round-trip đúng từng byte với cách ghi này), nên diff chỉ chạm nhóm `explorer`.
- Kiểm bằng máy so với bản trước khi sửa: `groups[1:]` (Discoverer, Scientist) bằng nhau; #1–#7 bằng nhau; `new-life` chỉ khác `number`; 107 `topic_id` + `lesson_id` trước và sau như nhau. Đếm: Explorer 11 / 70 (8+7+4+8+6+6+7+6+6+6+6), Discoverer 17 / 155, Scientist 16 / 156; 31 `kind: oak`, 13 `kind: new`, không `unit_slug` trùng.
- Số đếm 383 → 381: `tools/content-cli/test/syllabus.test.ts` (dòng 95, 101, 109), chú thích `tools/content-cli/src/markdown/syllabus.ts:51`, `tools/content-cli/README.md:348` (cùng lượt sửa số ví dụ "79 bài có lesson_id" → 92 cho khớp dòng tổng thật hôm nay); `packages/content-schema/test/syllabus.test.mjs` (Explorer `["explorer", 11, 70]`, tổng 381, thêm chú thích SK-057; giữ chú thích SK-051, SK-053 làm lịch sử). Fixture tổng hợp `syllabus.test.mjs:47` (`everyday-materials`) giữ như ticket ghi. Grep `383`, `11, 72`, `everyday-materials`, `healthy-me`, `growing-plants` trong `packages/`, `tools/`, `database/`, `scripts/`: chỉ còn fixture và chú thích lịch sử.
- Không đổi luật validator, schema, `syllabus_version`.

**Kết quả chạy (19/11):**
- `node tools/content-cli/src/cli.ts validate content`: exit 0, 0 lỗi, 0 cảnh báo `syllabus_*` (174 cảnh báo markdown có sẵn: `md_needs_check`, `image_*`, `age_words_en`); dòng tổng "syllabus content/syllabus.json (3 nhóm, 44 chủ đề, 381 bài; 92 bài có lesson_id)".
- `npm --prefix packages/content-schema test`: 163 pass, 0 fail. `npm --prefix tools/content-cli test`: 401 pass, 0 fail. `typecheck` cả hai gói: 0 lỗi.

**Cho ios-dev:** danh mục đã đổi; các test Swift ở "Phạm vi" mục 4 giờ sẽ đỏ cho tới khi ios-dev sửa. Không đổi RPC, định dạng gói, database.

## Ghi chú designer (19/11)

**Đã làm.**
- Ba icon mới, khung 64×64, cùng khuôn 44 icon (chỉ `path`, `circle`, `ellipse`, `g fill`, `fill-rule="evenodd"`; không stroke, filter, opacity, gradient, chữ; app thêm bóng `shadow.paper_1`):
  - `design/icons/topics/new-mountains-rivers-and-seas.svg`: hai đỉnh núi nhọn gỉ đồng (mặt sáng / mặt khuất), sông chàm uốn qua đồng lúa vàng hoè chảy ra góc biển, thuyền buồm đỏ son. Khác `new-earth-surface` (không núi lửa) và `living-things-and-the-environment` (núi nhọn, đồng lúa vàng, không cây, không mặt trời). Không bản đồ, không hình bờ biển thật.
  - `design/icons/topics/new-water-around-us.svg`: giọt nước chàm lớn rơi xuống mặt ao xanh nhạt, hai vòng gợn cắt rỗng, hai tia nước bắn lên, hai giọt mưa nhỏ. Khác `introduction-to-states-of-matter-and-changing-states` (không đá lạnh, hơi nước) và `new-water-air` (không sóng cuộn, gió).
  - `design/icons/topics/new-sky-day-and-night.svg`: bầu trời tròn cắt đôi thành hai mảnh, nửa ngày xanh nhạt có Mặt Trời tia nhọn, nửa đêm chàm có trăng khuyết vàng nhạt và sao, đồi gỉ đồng phía dưới. Khác `earth-sun-and-moon` (không quả địa cầu; nhìn từ mặt đất lên trời) và `new-weather-and-seasons` (không mây, hoa, lá).
- Ba icon cũ chuyển sang `design/icons/topics/_retired/`: `everyday-materials.svg`, `uses-of-everyday-materials.svg`, `healthy-me.svg`. Đã kiểm: ba key này chỉ có ở nhóm Explorer, Discoverer và Scientist không dùng. Chuyển bằng file (chưa stage), như `growing-plants` ở SK-051.
- `design/icons/topics/*.svg` còn đúng 44 file, so danh sách bằng máy với 44 `key` trong `content/syllabus.json` (sau khi dev đổi): trùng khớp.
- `design/play-ui/project/Topic-Icons.dc.html`: Explorer #8 Lớn lên, #9 Núi, sông và biển, #10 Nước quanh em, #11 Bầu trời ngày và đêm (vẫn 44 icon; lớp giấy có `filter="url(#paperE)"`, chi tiết không filter, như các thẻ khác); dòng phụ "11 chủ đề · 6 unit Oak Year 1–2, 5 chủ đề mới". Đã dựng thử bằng Chrome headless: vừa khung 1440×2050.
- `design/play-ui/journey-roadmap-spec.md`: mục 2 điểm 3 (đoạn chia chặng; spec không ghi chặng Explorer ở mục 3) Explorer 6 chặng, `stopRange` `[0..<1, 1..<3, 3..<5, 5..<7, 7..<8, 8..<11]`, `oakYear` `[1, 2, nil, 1, 2, nil]`; mục 8 dòng lịch sử, bảng Explorer 11 icon (tên VI + EN, mô tả hình, khác icon gần nghĩa nào), ghi chú màu của ba icon mới.

**Màu.** `new-mountains-rivers-and-seas` 4 màu giấy, `new-water-around-us` 2 màu giấy (`#CFDCD8`, `#9FBDB8` đã có trong danh sách màu tự nhiên của spec mục 8), `new-sky-day-and-night` 5 màu giấy (ghép ngày và đêm, như ngoại lệ `new-habitats-around-the-world`); trăng `#F0C873` là token `vang_hoe_light`. Không thêm màu mới ngoài bảng.

**Cho ios-dev:** chạy `sh apps/ios/scripts/import-topic-icons.sh`; designer không chạy, không sửa `apps/ios`.

**Còn chưa chắc.** Chưa thấy icon trên máy thật ở 40–44 pt cạnh các chặng; thuyền buồm và hai giọt bắn ở cỡ 40 khá nhỏ nhưng vẫn đọc được trong ảnh dựng thử. Canvas chưa publish.

## Ghi chú ios-dev (19/11)

**Đã làm.** Chặng bản đồ theo phương án (A): giữ `JourneySegment.of`, không đổi code chia chặng.
- Icon: chạy `sh apps/ios/scripts/import-topic-icons.sh` (44 icon). Thêm `Topic-new-mountains-rivers-and-seas`, `Topic-new-water-around-us`, `Topic-new-sky-day-and-night`. Xoá tay ba imageset cũ `Topic-everyday-materials`, `Topic-uses-of-everyday-materials`, `Topic-healthy-me`, vì script không tự xoá. Catalog còn đúng 44 imageset. Sau đó chạy `xcodegen generate`.
- `ScienceKids/Common/Art.swift`: icon mặc định của mạch `materials` đổi sang `introduction-to-states-of-matter-and-changing-states`.
- Test:
  - `SyllabusTests.swift`: số bài `[70, 155, 156]`; `oakYear` Explorer `[1, 2, 2, nil, nil, 1, 1, 2, nil, nil, nil]`.
  - `JourneyTests.swift`: tổng 381.
  - `JourneySegmentTests.swift`: `stopRange` `[0..<1, 1..<3, 3..<5, 5..<7, 7..<8, 8..<11]`, `oakYear` `[1, 2, nil, 1, 2, nil]`.
  - `JourneyMapAppTests.swift`: `6 + 11 + 1`; chú thích dòng 41, 74.
  - Grep lại `383`, `72,`, `5 + 11`, `everyday-materials`, `healthy-me` trong `apps/ios`: chỉ còn số 72 là vùng chạm và cỡ hình, không còn số đếm cũ.

**Kết quả (iPhone 16, một máy, một lần, bỏ UI test):** 418/418 pass.

| Bộ test | Kết quả |
| --- | --- |
| ScienceKidsTests | 95 pass |
| DesignSystemTests | 59 pass |
| ContentModelTests | 28 pass |
| LessonEngineTests | 19 pass |
| ContentKitTests | 51 pass |
| LessonPlayerTests | 112 pass |
| AudioKitTests | 14 pass |
| ProfilesTests | 22 pass |
| SyncTests | 18 pass |

**Chạy thử (iPhone 16, gói 19/11).** Trang chủ, chip Explorer:
- 11 chủ đề, 6 chặng: 1 · 2–3 · 4–5 · 6–7 (*Cơ thể của em*, *Cây quanh em*) · 8 (*Lớn lên*, một mình) · 9–11.
- Chặng 6 có *Núi, sông và biển*, *Nước quanh em*, *Bầu trời ngày và đêm* với icon mới, nhãn "Coming soon", icon ở dạng mờ như mọi chủ đề chưa có bài.
- Mở *Núi, sông và biển*: 6 bài đúng tên danh mục, bài nào cũng "Coming soon". Chạm vào một bài hiện "This lesson is on its way.", không crash, không khoá.
- Không còn *Vật liệu quanh em*, *Vật liệu dùng làm gì?*, *Em khoẻ mạnh*. Cờ đích ghi "11 topics".
- Tab Cards: bộ "Life cycle cards" · *Lớn lên* hiện 1/6, thẻ nằm đúng ô bài của nó.
- Không thấy lỗi.
- Ảnh chụp lưu tạm (scratchpad của phiên, không bền): `explorer-map-1..4.png`, `new-topic-mountains.png`, `new-topic-tap-lesson.png`, `cards-life-cycle.png`.

**Còn chưa chắc.**
- Chưa kiểm iPad (bản đồ cột bên) và iPhone 16e. Số chặng đã có unit test, nhưng chưa xem bằng mắt trên hai máy này.
- Icon mới mới xem ở cỡ hiển thị trên bản đồ của iPhone 16 (dạng "Coming soon", màu mờ). Chưa thấy bản màu đầy đủ, vì phải có bài mới hiện màu đủ.
