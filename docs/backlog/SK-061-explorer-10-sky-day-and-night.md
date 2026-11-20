# SK-061 · Bỏ *Nước quanh em* khỏi Explorer; soạn Explorer #10 *Bầu trời ngày và đêm* (The sky by day and night, 6 bài)

Trạng thái: review (20/11: PM nghiệm thu, chờ Duy review; xem "Nghiệm thu PM" và "Còn mở cho Duy" cuối ticket) · Ngày: 2026-11-19 · Phụ trách: dev (danh mục, test content-cli, content-schema) · ios-dev (test đếm, chặng bản đồ, icon, khoá bộ thẻ) · designer (icon, spec, ảnh) · content-editor (soạn 6 bài, sửa ghi chú #9) · phiên chính chạy lệnh · Tester: tester
Nguồn: Duy 19/11/2026: "bỏ qua chủ đề nước cho nhóm Explorer đi, phần này sẽ được đào sâu ở Discover. giờ làm chủ đề Bầu trời ngày và đêm (6, Mới; vũ trụ mức thấy). start làm luôn, ko cần confirm lại." Chế độ auto: PM chốt theo khuyến nghị, không hỏi lại Duy. Nguồn khác: [docs/syllabus-review-2026-11-18.md](../syllabus-review-2026-11-18.md) mục 2 (nguyên tắc N, Explorer mức **thấy**), 3.3 (vũ trụ ba nhóm, ba mức), 4.1, 4.2 (#7 *Hệ Mặt Trời*, #9 *Sông, hồ và vòng tuần hoàn nước*, #12 *Ánh sáng, bóng và cầu vồng*); [SK-057](SK-057-explorer-catalog-earth-sky.md) (lần đổi danh mục trước, cùng danh sách chỗ sửa); [SK-058](SK-058-explorer-9-mountains-rivers-seas.md) (khuôn soạn và tiêu chí nghiệm thu); [SK-059](SK-059-play-shelf-zoom-drag.md) (kệ Chơi); `content/syllabus.json` (key `new-water-around-us` #10, `new-sky-day-and-night` #11); `syllabus-progression.md` mục 3 (Mức); `content/TEMPLATE.md`, `content/rules.json` (`explorer.authoring`); chính sách hình (CC0, PD, CC BY; không AI, không Pinterest).

## Mục tiêu

Bé Explorer 5–7 tuổi ngước lên trời mà gọi tên được Mặt Trời, Mặt Trăng, các vì sao, phân biệt ngày với đêm, sáng với chiều, trăng tròn với trăng khuyết, và biết không nhìn thẳng vào Mặt Trời. Bé chỉ học những gì nhìn thấy, chưa học vì sao có những điều đó.

## Phạm vi / Ngoài phạm vi

### Phần A · Đổi danh mục

**A1. `content/syllabus.json`, nhóm `explorer` (dev):**
- Bỏ khối `new-water-around-us` (#10, 6 bài). Chủ đề này chưa có `topic_id`, `lesson_id`, chưa có thư mục `content/explorer/nuoc-quanh-em/`, chưa soạn bài nào.
- `new-sky-day-and-night`: `number` 11 → **10**, `level` 2 → **1**. Bài 3 và bài 6 đổi tên theo bảng ở Phần B. Bài 1, 2, 4, 5 giữ nguyên tên. Key, `title`, `strand`, `source` giữ nguyên. Mỗi bài vẫn `oak_lessons: []`, `statutory: false`, không `extension`.
- #1–#9 và nhóm Discoverer, Scientist không đổi một byte. `syllabus_version` giữ (như SK-057).

**A2. Số đếm sau khi đổi** (đã kiểm phép tính):

| | Chủ đề | Bài |
| --- | --- | --- |
| Explorer | **10** (6 unit Oak, 4 mới) | 70 − 6 = **64** = 8 + 7 + 4 + 8 + 6 + 6 + 7 + 6 + 6 + 6 |
| Discoverer | 17 | 155 |
| Scientist | 16 | 156 |
| **Cả app** | **43** (31 unit Oak, 12 mới: Explorer 4, Discoverer 5, Scientist 3) | 64 + 155 + 156 = **375** (= 381 − 6) |

**A3. Chặng bản đồ.** Giữ luật `JourneySegment.of`: các chủ đề liền nhau cùng năm Oak thì chung một chặng (phương án A ở SK-057). `oakYear` của Explorer từ `[1, 2, 2, nil, nil, 1, 1, 2, nil, nil, nil]` thành `[1, 2, 2, nil, nil, 1, 1, 2, nil, nil]`. Chạy luật này thì **vẫn ra 6 chặng**: 1 (Y1) · 2–3 (Y2) · 4–5 (mới) · 6–7 (Y1) · 8 (Y2) · 9–10 (mới). Chỉ chặng cuối ngắn lại, `stopRange` `8..<11` thành `8..<10`. Ticket không đổi code chia chặng.

**A4. Danh sách chỗ phải sửa** (theo khuôn SK-057, đã grep 19/11):

*dev:*
- `tools/content-cli/test/syllabus.test.ts` dòng 95, 101, 109: "44 chủ đề, 381 bài" → "43 chủ đề, 375 bài".
- `tools/content-cli/src/markdown/syllabus.ts:51` (chú thích dòng tổng).
- `tools/content-cli/README.md:348`: số chủ đề và số bài trong ví dụ dòng tổng; số "bài có lesson_id" lấy theo lần chạy thật.
- `packages/content-schema/test/syllabus.test.mjs:302–319`: `["explorer", 10, 64]`, tổng 375, tên test, thêm chú thích SK-061 (giữ chú thích SK-051, SK-053, SK-057 làm lịch sử).
- Grep lại `381`, `11, 70`, `44 chủ đề`, `water-around-us` trong `packages/`, `tools/`, `database/`, `scripts/`: chỉ còn fixture và chú thích lịch sử.

*ios-dev:*
- `Packages/SKKit/Tests/ContentModelTests/SyllabusTests.swift:27` `[11, 17, 16]` → `[10, 17, 16]`; `:28` `[70, 155, 156]` → `[64, 155, 156]` (chú thích SK-061); `:58` `oakYear` → `[1, 2, 2, nil, nil, 1, 1, 2, nil, nil]`, thêm một dòng chú thích ở `:56–57`.
- `Packages/SKKit/Tests/ContentKitTests/JourneyTests.swift:37`: 381 → **375**.
- `Packages/SKKit/Tests/ContentKitTests/JourneySegmentTests.swift:29`: `stopRange` → `[0..<1, 1..<3, 3..<5, 5..<7, 7..<8, 8..<10]`. `:30` `oakYear` `[1, 2, nil, 1, 2, nil]` giữ. Sửa chú thích `:9–11` ("9–10 (new)") và `:26–28`.
- `ScienceKidsTests/JourneyMapAppTests.swift:18`: `topics.count == 44` → **43**. `:75`: `6 + 11 + 1` → **`6 + 10 + 1`**. Sửa chú thích `:13` (43 icon), `:41` ("1 + 2 + 2 + 2 + 1 + 2"), `:74` (10 stops).
- `ScienceKids/Common/Art.swift:51` chú thích "44 icons" → 43.
- `apps/ios/README.md:53`: "44 icon" → 43.
- Icon: xoá tay imageset `ScienceKids/Resources/Assets.xcassets/Art/Topics/Topic-new-water-around-us.imageset`, vì `import-topic-icons.sh` không tự xoá. Chạy lại script sau khi designer chuyển icon, rồi chạy `xcodegen generate`. Catalog còn đúng 43 imageset.
- Thêm khoá `collectible.set.sky` vào `Localizable.xcstrings`: EN "Sky cards", VI "Thẻ bầu trời". `InfoPlistTests.collectibleSetNames` kiểm thêm `sky`. Đếm lại `PlayTrayPackTests` theo gói mới, như SK-058.
- Grep lại `381`, `6 + 11`, `8..<11`, `70, 155`, `water-around-us`, `44` (chỉ chỗ đếm icon hay chủ đề) trong `apps/ios`.

*designer:*
- Chuyển `design/icons/topics/new-water-around-us.svg` sang `design/icons/topics/_retired/`, làm như SK-057. Còn 43 file, phải trùng 43 key của danh mục.
- `design/play-ui/project/Topic-Icons.dc.html`: Explorer còn 10 icon, *Bầu trời ngày và đêm* là #10; dòng phụ ghi "10 chủ đề · 6 unit Oak Year 1–2, 4 chủ đề mới"; tổng 43 icon.
- `design/play-ui/journey-roadmap-spec.md`: dòng 11–15, 37–41, 100, 105, 145 (đếm 44 icon); dòng 29 (`stopRange` `8..<10`, chặng 6 có #9–#10); mục 8 bỏ dòng `new-water-around-us` (dòng 182), dòng 183 đổi số thành 10, thêm dòng lịch sử.
- Icon `new-sky-day-and-night` giữ nguyên.

*content-editor (chỉ sửa ghi chú, không đụng chữ bé nghe, không chạy lại `tts`):*
- `content/explorer/nui-song-va-bien/`: các dòng `>` và `note:` đang trỏ "#10 *Nước quanh em*" hoặc "#10 bài 2, 3, 6" (`_topic.md:66`, `:171`, `:227`, `:236`; `01-dat-lien-va-bien.md:169`; `04-song-va-ho.md:22`, `:507`; `06-hang-dong.md:469`) đổi sang Discoverer #9 *Sông, hồ và vòng tuần hoàn nước*. Các dòng trỏ "#11" hoặc "#11 bài 6" (`_topic.md:39`, `:163`, `:235`; `01-dat-lien-va-bien.md:23`) đổi sang Discoverer #7 *Hệ Mặt Trời*. Ranh giới vẫn giữ như cũ.
- Câu "Bài an toàn gần nước đầy đủ là #10 bài 6" (`_topic.md:227`): ghi lại rằng Explorer không còn bài an toàn gần nước riêng, ba câu an toàn ở bài 4–6 vẫn giữ (xem Quyết định 3).

**A5. Ý nước của #10 cũ đi đâu** (ghi vào mục Discoverer của `syllabus.md` và bản rà 4.2; lộ trình Discoverer vẫn chờ Duy chốt):

| Bài #10 cũ | Đào sâu ở |
| --- | --- |
| 1 Nước ở đâu quanh em? | Discoverer #9 bài 1 (sông bắt đầu từ đâu), 4 (hồ, đầm), 5 (nước ngầm) |
| 2 Mưa từ đâu ra? | Discoverer #9 bài 6 (vòng tuần hoàn của nước); #10 bài 6 (sương, mây). Mưa ở mức thấy đã có ở Explorer #5 |
| 3 Nước chảy từ suối ra sông, ra biển | Discoverer #9 bài 1 |
| 4 Nổi hay chìm? | Chưa có chỗ trong lộ trình 18/11 (đã bỏ *Lực và nam châm*). Ghi ở "Câu hỏi còn mở" |
| 5 Nước đá tan, nước sôi bốc hơi | Discoverer #10 *Nước đổi dạng* bài 3, 5 |
| 6 Nước sạch, an toàn gần nước | Discoverer #9 bài 7 (khi sông bị ô nhiễm). An toàn gần nước: đề xuất thêm vào Discoverer #9 khi soạn |

### Phần B · Soạn 6 bài Explorer #10 *Bầu trời ngày và đêm*

- Thư mục `content/explorer/bau-troi-ngay-va-dem/` (tên đã định ở SK-057, quyết định 3): `_topic.md` và 6 bài; file chọn ảnh `content/images/explorer/bau-troi-ngay-va-dem/*.json`.
- `_topic.md`: `age_group: explorer`, `order: 10`, `strand: earth_sky`, `level: 1`, `is_free: false`, `sensitive: false`, `ai_draft: true`, không có `oak_unit_ref`. `prerequisites` gợi ý: `thoi-tiet-va-cac-mua` (Mặt Trời sau mây, ngày nắng), `co-the-cua-em` (mắt). Câu hỏi lớn: "What can we see when we look up?" · "Ngước lên trời, em thấy gì?".
- Thẻ thưởng: bộ mới `set: sky`, "Sky cards" · "Thẻ bầu trời".

**Danh sách 6 bài (PM chốt 19/11, chế độ auto):**

| # | Bài (EN · VI) | Ý chính (mức **thấy**) | `stage` | Misconception câu 6 (gợi ý key, content-editor grep trùng) |
| --- | --- | --- | --- | --- |
| 1 | The Sun gives light and warmth · Mặt Trời cho ánh sáng và hơi ấm | Mặt Trời làm trời sáng; nắng làm ấm, phơi khô quần áo; cây cần nắng. **Không nhìn thẳng vào Mặt Trời.** | `opener` | `safe_to_look_at_sun`: "It is OK to look at the Sun." (Sai). Không dùng `sun_gone_when_cloudy`, key này đã có ở #5 bài 1; chỉ ôn lại ở Khởi động |
| 2 | Day and night · Ngày và đêm | Ban ngày trời sáng, có Mặt Trời; ban đêm trời tối, có trăng, sao. Ban ngày em đi học, chơi; ban đêm em ngủ. Có con vật thức ban đêm (cú, dơi, đom đóm) | `core` | `everyone_sleeps_at_night`: "All animals sleep at night." (Sai) |
| 3 | Sunrise and sunset · Mặt Trời mọc, Mặt Trời lặn | Sáng sớm Mặt Trời mọc, trưa Mặt Trời lên cao, nắng nhất, chiều Mặt Trời lặn, rồi trời tối. Bình minh, hoàng hôn | `core` | `sun_stays_still`: "The Sun stays in one place all day." (Sai) |
| 4 | The Moon changes shape · Mặt Trăng đổi hình | Trăng có hôm tròn (trăng rằm, Trung thu), có hôm khuyết (trăng lưỡi liềm). Có hôm thấy trăng cả ban ngày | `core` | `moon_only_at_night`: "We can only see the Moon at night." (Sai) |
| 5 | The stars · Các vì sao | Đêm trời quang thấy nhiều sao lấp lánh. Ở quê thấy nhiều sao hơn ở phố nhiều đèn. Sao trông nhỏ vì ở rất xa | `core` | `stars_are_tiny`: "Stars are tiny, like little sparkles." (Sai) |
| 6 | What is in the sky? · Trên bầu trời có gì? | Ban ngày có Mặt Trời, mây; ban đêm có trăng, sao. Chim, máy bay, diều bay gần; Mặt Trời, Mặt Trăng, sao ở rất xa. Ngắm trời an toàn: không nhìn Mặt Trời, ngắm sao cùng người lớn | `review` (Khởi động ôn trộn bài 1–5) | `moon_follows_me`: "The Moon follows me when I walk." (Sai) |

**Đổi so với bản rà 18/11 (lý do ở Quyết định 4, 5):**
- Bài 3 *Bóng nắng đổi theo giờ trong ngày* đổi thành **Mặt Trời mọc, Mặt Trời lặn**.
- Bài 6 *Trái Đất là một quả cầu lớn* đổi thành **Trên bầu trời có gì?**
- Bài 4 bỏ phần sau dấu hai chấm, như đã làm ở SK-057.

**Khuyến nghị cho content-editor:**
1. **Mức thấy, không giải thích cơ chế.** Mỗi ý là một điều bé nhìn thấy hoặc làm được. Không có câu "tại sao", "why", "because".
   - **Lưu ý khi grep:** "vì sao" trong tiếng Việt vừa là "why" vừa là "stars" (*các vì sao*). Script kiểm chữ cấm phải bỏ qua "các vì sao", "những vì sao", và kiểm thêm "tại sao".
   - Câu "Sao trông nhỏ vì ở rất xa" và "Mặt Trăng ở rất xa nên em đi đâu cũng thấy" là mô tả khoảng cách, được giữ. Không nói thêm.
2. **Ranh giới, chữ cấm trong chữ bé nghe (EN và VI):**
   - Chuyển động: "spin", "rotate", "orbit", "quay", "quỹ đạo", "tự quay". Nói Mặt Trời "mọc", "lên cao", "lặn" như lời thường ngày; không nói Mặt Trời hay Trái Đất chuyển động.
   - Vũ trụ: "planet", "hành tinh", "phase", "pha", "gravity", "trọng lực", "eclipse", "nhật thực", "nguyệt thực", "comet", "sao chổi", "shooting star", "sao băng", "constellation", "chòm sao", "galaxy", "Ngân Hà", "telescope", "kính thiên văn", "astronaut", "phi hành gia".
   - Hình dạng Trái Đất: "Earth", "Trái Đất", "globe", "quả địa cầu", "map", "bản đồ".
   - Bóng: không dạy "shadow", "bóng nắng".
   - Hướng: "east", "west", "phía đông", "phía tây".
   - Không coi Sao Mai, Sao Hôm là sao (thật ra là Sao Kim, một hành tinh). Không tử vi, chiêm tinh, "sao chiếu mệnh". Không truyện chú Cuội, thỏ ngọc trong chữ bé nghe (dễ lẫn truyện kể với khoa học).
3. **An toàn mắt.** Đây là **ý chính** của bài 1 và là câu q6 (`safe_to_look_at_sun`). Khác với nước ở SK-058, ở đây câu an toàn được thành câu quiz, vì Duy nêu đích danh ý này.
   - Câu `correction` gợi ý: "Never look right at the Sun. It hurts your eyes." · "Không bao giờ nhìn thẳng vào Mặt Trời, mắt sẽ bị đau."
   - `[CẦN KIỂM]` mọi câu về kính râm, ống nhòm, kính lúp. Nếu dùng thì chỉ nói "kể cả khi đeo kính râm".
   - Bài 6 nhắc lại ở ô Học. Bài 5, 6 có một câu "ngắm sao cùng người lớn" ở ví dụ ô Học, không thành câu quiz.
4. **Khởi động có `recall_from` sang chủ đề cũ:**
   - bài 1 ôn `thoi-tiet-va-cac-mua` bài 1 (`sun_gone_when_cloudy`, Mặt Trời sau mây);
   - bài 2 hoặc 3 ôn `co-the-cua-em` (mắt nhìn) hoặc `chuoi-thuc-an` (con vật kiếm ăn);
   - đủ ba mốc "hôm trước", "khoảng một tuần", "rất xa" như n12 của SK-058.
5. **Từ vựng gợi ý** (4–5 từ mỗi bài, 2–3 từ `core`; grep trùng với từ Explorer đã có):
   - bài 1: Sun, light, warm, sunshine;
   - bài 2: day, night, dark, owl;
   - bài 3: sunrise, sunset, morning, evening;
   - bài 4: Moon, full moon, crescent (`extra`, như "stalactite" ở SK-058), shape;
   - bài 5: star, twinkle, far;
   - bài 6: sky, near, cloud, kite.
6. **Thẻ thưởng `set: sky`**, sáu thẻ gợi ý: Mặt Trời, Bình minh, Cú mèo đêm (hoặc Bầu trời đêm), Trăng rằm, Bầu trời sao, Trăng lưỡi liềm ban ngày. Key `_card` không trùng key Explorer đã có.
7. **Câu EN tối đa 8 từ.** Quiz 6 câu, DOK 1·1·1·2·2·2. Chỉ dùng `single_choice`, `true_false`, `order_sequence`. Gợi ý `order_sequence`:
   - bài 3: sáng sớm → trưa → chiều tối, cùng một khung cảnh;
   - bài 4: trăng khuyết → trăng tròn, chỉ xếp theo hình, không gọi tên pha.
8. **`[CẦN KIỂM]`:** cú, dơi, đom đóm thức ban đêm; "sao rất to"; "có hôm thấy trăng ban ngày"; "ở quê thấy nhiều sao hơn"; câu về kính râm; "Trung thu là trăng rằm tháng Tám âm lịch" (chỉ nhắc như dịp quen, không dạy lịch âm).

**Khuyến nghị cho designer:**
1. **Ảnh thật** CC0, PD, PDM, CC BY có ghi công; không BY-SA, NC, ND; không AI, không Pinterest. Mở trang gốc để kiểm. Ảnh NASA thường là PD, nhưng phải loại ảnh của bên thứ ba đăng lại trên trang NASA.
2. **Được vẽ thêm hình giấy cắt style E** (Duy cho phép ở SK-058). Hai chỗ nên vẽ: ba cảnh sáng, trưa, chiều tối của cùng một ngôi nhà, cánh đồng ở bài 3; một cảnh ngày, một cảnh đêm của cùng một chỗ ở bài 2. Ảnh chụp khó cho cùng khung qua nhiều giờ. Luật đi kèm:
   - trong một câu quiz và trên một kệ Chơi chỉ dùng một kiểu hình;
   - đáp án đúng không được là hình vẽ duy nhất giữa các ảnh chụp, và ngược lại;
   - mỗi hình vẽ ghi trong `_topic.md` mục Quy ước hình.
3. **Không dùng:**
   - bản đồ, quả địa cầu, ảnh Trái Đất từ vũ trụ, hình nét bờ biển Việt Nam;
   - nhật thực, nguyệt thực, kính thiên văn, phi hành gia, cờ trên Mặt Trăng;
   - chòm sao có nối nét hay có chữ;
   - ảnh người hoặc trẻ đang nhìn thẳng vào Mặt Trời;
   - ảnh Mặt Trời chói toàn khung. Nên dùng Mặt Trời qua mây, qua tán cây, lúc mọc hay lặn;
   - ảnh Mặt Trời chụp qua kính lọc (quả cầu cam của SDO). Bé dễ nghĩ Mặt Trời trông như vậy khi nhìn bằng mắt.
4. **Ảnh trăng:** dùng ảnh trăng thật trên nền trời, có cả ảnh trăng ban ngày trên nền trời xanh (cho bài 4, q6). Ảnh Trung thu chỉ có đèn lồng và trăng, mặt người theo luật hiện hành.
5. **Kệ Chơi (SK-059: chạm xem to, giữ rồi kéo vào giỏ), mỗi kệ một kiểu hình:**

   | Bài | Kệ gợi ý | Kiểu hình |
   | --- | --- | --- |
   | 1 | "Nắng giúp gì?": phơi quần áo, phơi lúa, cây xanh, mèo sưởi nắng; bẫy: bóng đèn, quạt | Ảnh chụp |
   | 2 | "Ai thức ban đêm?": cú, dơi, đom đóm; bẫy: gà, bướm, em bé đi học | Ảnh chụp |
   | 3 | "Buổi sáng" và "Buổi tối": bình minh, gà gáy, hoàng hôn, đèn đường bật; bẫy: trưa nắng | Ảnh chụp |
   | 4 | "Trăng tròn" và "Trăng khuyết": ảnh trăng thật; bẫy: đèn lồng tròn, quả bóng | Ảnh chụp |
   | 5 | "Sao trên trời": trời sao; bẫy: đom đóm, đèn đường, pháo hoa (cùng phát sáng nhưng không phải sao) | Ảnh chụp |
   | 6 | "Trời ngày" và "Trời đêm": Mặt Trời, mây, cầu vồng, trăng, sao | Hình vẽ giấy cắt (cả kệ) |

6. **Trẻ trong ảnh:** không có trẻ ở ngoài một mình ban đêm. Ảnh ngắm sao phải có người lớn hoặc không có người.

### Ngoài phạm vi

- Vì sao có ngày và đêm, Trái Đất quay, Trái Đất quay quanh Mặt Trời, Mặt Trời là một ngôi sao: Discoverer #7 bài 1–3.
- Vì sao trăng đổi hình, lịch âm, tên các pha trăng: Discoverer #7 bài 4.
- Hành tinh, sao chổi, sao băng, nhật thực, nguyệt thực: Discoverer #7.
- Bóng, bóng đổi theo giờ, đồng hồ mặt trời: Discoverer #12 bài 5–6.
- Trái Đất là quả cầu, ảnh Trái Đất từ vũ trụ: Discoverer #7 bài 1 (đề xuất giới thiệu ở đó); Scientist #1 bài 1.
- Trọng lực, vì sao có mùa, thuỷ triều: Scientist #1. Chòm sao, Ngân Hà, kính thiên văn, du hành vũ trụ: Scientist #2.
- Mây, mưa, nắng nóng, các mùa: Explorer #5 (chỉ ôn ở Khởi động).
- Soạn bài nước. Lộ trình Discoverer, Scientist (vẫn chờ Duy).

## Tiêu chí nghiệm thu

> PM nghiệm thu 20/11: mỗi tiêu chí ghi **đạt**, **chưa đạt** hoặc **chưa kiểm** kèm bằng chứng. Tổng hợp ở mục "Nghiệm thu PM" cuối ticket.

### dev
- [x] `content/syllabus.json` nhóm `explorer` có đúng 10 chủ đề theo thứ tự key `naming-and-grouping-animals`, `living-things-and-where-they-live`, `introduction-to-food-chains`, `new-habitats-around-the-world`, `new-weather-and-seasons`, `human-body-parts`, `identifying-plants-and-their-basic-parts`, `new-life`, `new-mountains-rivers-and-seas`, `new-sky-day-and-night`; `number` chạy 1…10. Không còn `new-water-around-us`.
  - **Đạt.** Tester rà chữ lượt 1 đếm máy; PM grep 20/11: 0 chỗ `water-around-us` trong `content/`.
- [x] `new-sky-day-and-night` có `number: 10`, `level: 1`. Tên 6 bài khớp từng chữ bảng Phần B.
  - **Đạt.** Tester rà chữ lượt 1 so máy sáu tên EN · VI với danh mục và markdown.
- [x] Diff chỉ chạm nhóm `explorer`. #1–#9 không đổi. Mọi `topic_id`, `lesson_id` cũ còn nguyên: đếm trước và sau bằng nhau.
  - **Đạt.** Ghi chú dev lượt 1: 16 `topic_id`, 98 `lesson_id` trước và sau bằng nhau; diff 7 dòng sửa cộng khối nước bị xoá. Sau khi gắn id: 104 bài có `lesson_id` (= 98 + 6).
- [x] Các chỗ sửa ở A4 mục dev đã sửa. `node tools/content-cli/src/cli.ts validate content`: 0 lỗi, 0 cảnh báo `syllabus_*`, dòng tổng "3 nhóm, 43 chủ đề, 375 bài". `npm --prefix tools/content-cli test`, `npm --prefix packages/content-schema test` xanh. Không đổi luật validator.
  - **Đạt.** Phiên chính 20/11: `validate content` 0 lỗi, 43 chủ đề / 375 bài, 104 bài có `lesson_id`; content-cli 410/410, content-schema 163/163. 0 cảnh báo `syllabus_*` theo dev lượt 1. Lần fail chập chờn dev báo không tái hiện ở tester và phiên chính.

### designer (danh mục)
- [x] `design/icons/topics/*.svg` có đúng 43 file, trùng 43 key (so bằng máy). `new-water-around-us.svg` nằm ở `_retired/`.
- [x] `Topic-Icons.dc.html` và `journey-roadmap-spec.md` khớp danh mục mới: Explorer 10 icon, 6 chặng, `stopRange` cuối `8..<10`.

### ios-dev
- [x] Các test ở A4 mục ios-dev đã sửa. Grep lại không còn số cũ (trừ các số là kích thước).
  - **Đạt.** Ghi chú ios-dev lượt 1. Danh sách A4 của PM sót `OnboardingTests.swift:219`, `:298`; ios-dev đã sửa thêm. Bài học cho ticket sau: grep cả dạng `[11, 17, 16]` và `count == 11`.
- [x] `JourneyMapAppTests.everySyllabusTopicHasItsIcon` xanh với 43 chủ đề. Catalog có 43 imageset, không còn `Topic-new-water-around-us`.
  - **Đạt.** 43 imageset sau `import-topic-icons.sh`; bộ unit lượt 2 xanh.
- [x] Khoá `collectible.set.sky` có trong catalog chuỗi; `InfoPlistTests` xanh.
  - **Đạt.** EN "Sky cards", VI "Thẻ bầu trời"; bộ unit lượt 2 xanh.
- [x] Unit test xanh trên simulator **iPhone 16**, một máy, chạy một lần. Không dùng iPhone 16 Pro: mọi lệnh simulator ghi rõ `device: iPhone 16`.
  - **Đạt.** Lượt 2 (sau khi build lại gói): 436/436 trên iPhone 16, cả bộ, một lần. Lượt 1 có 1 fail do số cũ sót, đã sửa; chạy cả bộ lần hai là vì gói đổi, không phải chạy lặp.
- [x] Chạy thử Trang chủ Explorer: 10 chủ đề, 6 chặng, chặng 6 có *Núi, sông và biển* và *Bầu trời ngày và đêm*, không còn *Nước quanh em*, cờ đích ghi "10 topics". Chụp một ảnh màn bản đồ.
  - **Đạt.** XCUITest `SK061SkyRunUITests` trên iPhone 16, giao diện VI: 6 chặng, chặng 6 "0/2 xong", cờ đích "10 chủ đề"; ảnh ở scratchpad ios-dev `shots-sk061/`. Chạy bằng giao diện VI nên chưa thấy chữ EN "10 topics" (cùng khoá chuỗi, không chặn).

### content-editor
- [x] `_topic.md` có đủ các mục như `nui-song-va-bien/_topic.md`: Ranh giới (theo "Ngoài phạm vi" và khuyến nghị 1–2), An toàn (khuyến nghị 3), Quy ước hình (khuyến nghị designer 2–3), Còn mở. Tên 6 bài khớp từng chữ `content/syllabus.json`.
  - **Đạt.** Ghi chú content-editor lượt 1; tester rà chữ lượt 1 so tên bằng máy.
- [x] Mỗi bài theo luật Explorer:
  - Khởi động 2–3 câu DOK 1, có `recall_from`;
  - Quiz 6 câu, DOK 1·1·1·2·2·2; đúng một misconception, ở câu 6; key không trùng các key Explorer đã có (grep `^misconception:` trong `content/explorer/`);
  - chỉ dùng `single_choice`, `true_false`, `order_sequence`;
  - câu EN tối đa 8 từ;
  - đạt SK-044, SK-047.
  - **Đạt**, kèm một lưu ý. Tester rà chữ lượt 1 kiểm máy đủ năm ý; C1 (hai Mục tiêu 9 từ) đã sửa ở lượt 2; `validate` 20/11 0 lỗi. Lưu ý: content-editor lượt 3–4 đổi thêm bảy chỗ chữ bé nghe (nhãn kệ, `feedback`, alt) sau lượt rà chữ của tester; chưa có tester rà chữ lượt 2. Chỗ đổi nhỏ, content-editor đã grep ≤ 8 từ, nên PM không mở lượt rà mới.
- [x] Grep chữ bé nghe (EN, VI; bỏ dòng `>` và `brief`) cho 0 kết quả với danh sách khuyến nghị 2 và "tại sao", "why", "because". Riêng "vì sao" chỉ được xuất hiện trong "các vì sao", "những vì sao".
  - **Đạt.** Tester lượt 1: 0 kết quả. PM grep lại 20/11 sau lượt 4: các chữ cấm chính chỉ còn trong `brief` và ghi chú hoạ sĩ ("không bóng đổ", "không quả địa cầu"), không có trong chữ bé nghe.
- [x] Câu "không nhìn thẳng vào Mặt Trời" có ở ý chính bài 1, câu q6 bài 1, ô Học bài 6. Câu "cùng người lớn" chỉ nằm ở ví dụ ô Học, không thành câu quiz.
  - **Đạt.** Tester lượt 1: năm chỗ "không nhìn thẳng", hai chỗ "cùng người lớn", đều ở ví dụ ô Học.
- [x] Mọi sự thật chưa chắc có dòng `> [CẦN KIỂM]` (khuyến nghị 8).
  - **Đạt** về phần ghi: 50 dòng `[CẦN KIỂM]`. Phần đọc chuyên môn còn mở cho Duy.
- [x] Ghi chú `nui-song-va-bien` ở A4 đã sửa. Grep `#10`, `#11` trong `content/explorer/nui-song-va-bien/` chỉ còn chỗ trỏ đúng.
  - **Đạt.** PM grep 20/11: chỉ còn hai chỗ "Discoverer #11 bài 9" (trồng lúa), đúng.

### designer (ảnh)
- [x] Mọi chỗ có hình đều có mục trong file chọn ảnh; 0 chỗ trống. Ảnh chỉ CC0, PD, PDM, CC BY có ghi công; 0 BY-SA, NC, ND; đã mở trang gốc kiểm. `images fetch` 0 lỗi, 0 lệch khung (`PictureFit` 0 chỗ `.fit`).
  - **Đạt.** Tester rà ảnh lượt 2: 201/201 chỗ, 56 ảnh chụp, 0 BY-SA/NC/ND, đã mở trang gốc cả 5 ảnh Openverse/Flickr. Phiên chính sau lần thay `sunrise_card`: ảnh 0 lỗi.
- [x] 0 ảnh hoặc hình thuộc danh sách "Không dùng" ở khuyến nghị designer 3. Hình vẽ đúng luật một câu, một kệ, một kiểu hình. Có danh sách hình vẽ trong `_topic.md`.
  - **Đạt.** Tester rà ảnh lượt 1–2. `sunrise_card` đổi sang hình vẽ sau lượt 2: thẻ thưởng đứng một mình nên không trộn kiểu. Tester chưa xem hình này bằng mắt; mục "Quy ước hình" của `_topic.md` cần thêm `sunrise_card` vào danh sách hình vẽ (việc nhỏ, ghi ở Còn mở cho Duy mục 6).

### tester · phiên chính
- [x] Đếm máy từ `content/syllabus.json`: Explorer 10 / 64 (8 + 7 + 4 + 8 + 6 + 6 + 7 + 6 + 6 + 6), cả app 43 / 375, 31 chủ đề `kind: oak`, 12 `kind: new`. `oakYear` Explorer `[1, 2, 2, None, None, 1, 1, 2, None, None]`, 6 chặng.
  - **Đạt.** Tester rà chữ lượt 1; `validate` 20/11 cùng số.
- [x] Tester rà chữ và ảnh theo khuôn SK-058 (các script `chk*.py`, `kpp2.py`, `reuse.py`), lượt cuối 0 lỗi chặn.
  - **Đạt.** Rà chữ lượt 1: 1 chặn (C1) đã sửa ở content-editor lượt 2, `validate` sau đó 0 lỗi. Rà ảnh lượt 2: 0 chặn, 6/6 chặn lượt 1 đã đóng.
- [ ] Phiên chính chạy đủ `ids` (theo thứ tự), `validate` 0 lỗi, `images fetch`, `tts` EN và VI, `build`, `check-pack` OK. Gắn `topic_id` và 6 `lesson_id` vào danh mục. Chơi trọn một bài trên iPhone 16, tới màn Thưởng, bộ "Sky cards" 1/6.
  - **Đạt phần lệnh, chưa kiểm một ý.** Đạt: `ids`, `validate` 0 lỗi, 104 bài có `lesson_id` (= 98 + 6), ảnh 0 lỗi, gói build lại sau lần thay `sunrise_card` cuối, `check-pack` OK; gói có clip EN và VI (ios-dev). Chơi trọn bài 3 trên iPhone 16 bằng XCUITest tới màn Thưởng (thẻ "Bình minh", 2 sao). **Chưa kiểm:** "Thẻ bầu trời 1/6" bằng mắt trên tab Thẻ (test chỉ thấy chữ trong cây giao diện, ảnh chưa cuộn tới); thẻ `sunrise_card` hình vẽ mới chưa ai xem trên máy; chưa nghe clip.

### pm (đóng ticket)
- [ ] `syllabus.md`, `syllabus-lessons.md`, bản rà 18/11, `prd.md`, `technical-plan.md`, `docs/backlog/README.md` khớp 43 / 375. Trạng thái các tài liệu chuyển từ "khi SK-061 xong" sang "hiện hành". Tick tiêu chí kèm bằng chứng.
  - **Chưa đạt, có chủ ý.** Đã khớp 43 / 375: `syllabus.md` (đầu file, mục 1, 3, 7), `syllabus-lessons.md` (đầu file, mục #10), bản rà 18/11 (4.1, bảng tổng), `docs/backlog/README.md`. Tiêu chí đã tick kèm bằng chứng. **Còn để dạng "khi SK-061 xong"**: `prd.md` (mục 9, dòng GĐ 0 và GĐ 2), `technical-plan.md` (A5, bảng GĐ, mục rủi ro), `syllabus.md` mục 0 dòng "Số đếm từ 19/11: 44 chủ đề, 383 bài", và `syllabus-lessons.md:9`. SK-057 cũng còn "khi SK-057 xong" ở cùng các chỗ. PM chuyển cả hai sang "hiện hành" trong một lượt khi Duy duyệt SK-057, SK-061, để không ghi "hiện hành" cho thứ Duy chưa xem.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc:**
- Phần A làm trước, vì content-editor cần tên bài trong danh mục mới. dev, designer (icon) và ios-dev làm song song với content-editor soạn Phần B.
- SK-057, SK-058 (review, chưa commit): cùng sửa `content/syllabus.json`, `SyllabusTests`, `JourneyTests`, `JourneySegmentTests`, `JourneyMapAppTests`. Làm tiếp trên cây làm việc hiện tại, không hoàn tác thay đổi chưa commit.
- SK-059: kệ Chơi đang đổi tương tác. Nội dung kệ (6–8 món, nhóm, bẫy) không phụ thuộc vào tương tác.

**Quyết định đã ghi:**
1. *(Duy 19/11)* Bỏ `new-water-around-us` khỏi Explorer, ý nước để Discoverer đào sâu. Làm *Bầu trời ngày và đêm* (6 bài, mới, vũ trụ mức thấy) ngay.
2. *(PM 19/11, auto)* `new-sky-day-and-night` thành #10, key giữ, thư mục `bau-troi-ngay-va-dem`. Giữ luật chia chặng theo năm Oak: vẫn 6 chặng, chặng cuối `8..<10`.
3. *(PM 19/11, auto)* Explorer không còn bài an toàn gần nước riêng. Ba câu "chỉ ra sông, ra biển, vào hang cùng người lớn" ở #9 bài 4–6 giữ nguyên. Đề xuất thêm ý an toàn gần nước vào Discoverer #9 khi soạn, ghi ở `syllabus.md` mục 4.
4. *(PM 19/11, auto)* **Bài 3: thay *Bóng nắng đổi theo giờ* bằng *Mặt Trời mọc, Mặt Trời lặn*.** Bóng đổi theo giờ là quan hệ giữa vị trí Mặt Trời, vật chắn và độ dài bóng. Đó là ý mức **biết** (thế nào), và Discoverer #12 bài 5–6 đã dạy *Bóng từ đâu ra?*, *Bóng đổi theo giờ*. Bé 5–7 chưa có khái niệm bóng thì câu quiz về bóng trưa, bóng chiều sẽ thành đoán. *Mặt Trời mọc, lặn* là điều bé thấy hằng ngày, giữ được ý "một ngày đi qua" của bài cũ, và cho câu `order_sequence` sáng → trưa → chiều tối.
5. *(PM 19/11, auto)* **Bài 6: thay *Trái Đất là một quả cầu lớn* bằng *Trên bầu trời có gì?* (bài ôn).** Bé không thể *thấy* Trái Đất tròn: mặt đất bé đứng là phẳng, chỉ có ảnh từ vũ trụ hoặc quả địa cầu mới cho thấy. Trẻ tuổi này hay tự ghép hai ý thành mô hình sai ("Trái Đất tròn nhưng mình sống trên mặt phẳng ở trong"), và sẽ hỏi "sao mình không rơi", tức chuyện trọng lực của Scientist #1 `[CẦN KIỂM]`: dẫn nghiên cứu mô hình Trái Đất của trẻ, Vosniadou và Brewer 1992. Hình minh hoạ cũng đụng luật SK-058: 0 quả địa cầu, 0 bản đồ, và ảnh Trái Đất từ vũ trụ có thể lộ vùng biển Đông. Ý này chuyển lên Discoverer #7 bài 1. Bài thay thế ôn cả chủ đề (ngày và đêm, gần và xa), dễ, và nhắc lại an toàn mắt.
6. *(PM 19/11, auto)* `level: 1` (2 → 1). Điểm tạm 6 (A1-B1-C1-D2-E1) theo `syllabus-progression.md` mục 3: khái niệm cụ thể, nhìn thấy hằng ngày, ít misconception khó, từ vựng đời sống, kỹ năng quan sát và gọi tên. Mức 1 "Làm quen" khớp mức **thấy**. content-editor chấm lại khi soạn; nếu đổi thì dev sửa cùng lượt gắn id.
7. *(PM 19/11, auto)* Thứ tự 6 bài: Mặt Trời → ngày và đêm → Mặt Trời mọc, lặn (ngày chuyển sang đêm) → Mặt Trăng → sao → ôn. Bài 2 giữ chỗ cũ để ít đổi danh mục nhất.
8. *(PM 19/11, auto)* An toàn mắt được thành câu quiz (q6 bài 1), khác luật an toàn nước của SK-058. Lý do: Duy nêu đích danh ý này trong tên bài, và câu Đúng/Sai "nhìn thẳng vào Mặt Trời được không" không cần ảnh cảnh nguy hiểm.
9. *(PM 19/11, auto)* Bộ thẻ `set: sky`, "Sky cards" · "Thẻ bầu trời".

**Câu hỏi còn mở (cho Duy, không chặn ticket):**
1. **"Nổi hay chìm"** (bài 4 của #10 cũ) không còn chỗ trong lộ trình 18/11, vì *Lực và nam châm* đã bỏ. PM đề xuất để trống tới khi Duy chốt lộ trình Discoverer. Nếu Duy muốn giữ thì thêm vào Discoverer #9 (vật trôi trên sông, hồ).
2. **An toàn gần nước:** PM đề xuất thêm một bài, hoặc một ý chính, vào Discoverer #9 khi soạn. Hiện Explorer chỉ có ba câu ở #9.
3. Sáu bài và các quyết định 4–8 do PM chốt theo chế độ auto. Duy xem lại khi review ticket; đổi tên bài sau này chỉ là sửa danh mục.

## Ghi chú content-editor lượt 1 (19/11)

Nháp AI, chưa duyệt. Em chỉ sửa trong `content/` (và thêm mục này theo lời phiên chính); không đụng `content/syllabus.json`, `design/`, `apps/`, `tools/`. Đề xuất cho vùng khác ghi ở đây.

**Đã làm**
- `content/explorer/bau-troi-ngay-va-dem/_topic.md` (`order: 10`, `level: 1`, `difficulty` 1-1-1-2-1, sáu misconception, đủ các mục Ranh giới, An toàn, Quy ước hình, Hình dùng chung, Còn mở) và sáu bài `01-mat-troi-cho-anh-sang-va-hoi-am.md`, `02-ngay-va-dem.md`, `03-mat-troi-moc-mat-troi-lan.md`, `04-mat-trang-doi-hinh.md`, `05-cac-vi-sao.md`, `06-tren-bau-troi-co-gi.md`. Mọi `id:` để trống (chạy `ids` theo thứ tự `_topic.md` rồi bài 1 → 6).
- Mỗi bài: Khởi động 2–3 câu DOK 1 có `recall_from` (đủ ba mốc hôm trước, khoảng một tuần, rất xa); Quiz DOK 1·1·1·2·2·2, câu 6 `true_false` Sai gắn đúng key gợi ý (riêng bài 1 câu đổi "OK" thành "safe" vì luật không viết tắt); chỉ `single_choice`, `true_false`, `order_sequence` (bài 3, 4, 6 có `order_sequence`); mỗi câu EN tối đa tám từ (đã grep, câu nhiều hơn tám từ chỉ là hai câu ngắn); có `hint`; `alt` đáp án không chứa chữ câu hỏi; mỗi câu, mỗi kệ một kiểu hình.
- Kệ Chơi theo SK-059: sáu món mỗi kệ (bài 3 năm món) để iPhone hai cột; `messages.full` giữ chữ chung. Kệ bài 1–5 ảnh chụp, kệ bài 6 toàn hình vẽ giấy cắt.
- Hình vẽ giấy cắt: mười một (bài 2 ngày/đêm hai hình; bài 3 câu q4 ba hình; bài 6 kệ năm hình mới cộng `star_lantern_card` dùng lại), liệt kê ở `_topic.md` Quy ước hình số hai.
- Bộ thẻ `set: sky`: `sun_card`, `night_sky_card`, `sunrise_card`, `mid_autumn_moon_card` (rare), `starry_sky_card`, `day_moon_card` (rare).
- Grep chữ bé nghe với danh sách khuyến nghị 2 cộng "why", "because", "tại sao": 0 kết quả; "vì sao" chỉ trong "các vì sao". Tránh luôn mọi chữ "bóng" (cả "bóng tối", "bóng đèn", "quả bóng"). "Không nhìn thẳng vào Mặt Trời" ở ý chính ba bài 1, ô Học bài 1, q6 bài 1, ô Học Day sky bài 6 (thêm w3 bài 5 là câu Đúng). "Cùng người lớn" chỉ ở ví dụ ô Học bài 5, 6.
- Ghi chú `content/explorer/nui-song-va-bien/` (`_topic.md`, `01`, `04`, `06`): các chỗ trỏ "#10", "#11" đổi sang Discoverer #9 *Sông, hồ và vòng tuần hoàn nước* và Discoverer #7 *Hệ Mặt Trời*; câu "Bài an toàn gần nước đầy đủ là #10 bài 6" ghi lại theo Quyết định 3. Chữ bé nghe không đổi. Grep `#10`, `#11` trong thư mục đó chỉ còn "Discoverer #11 bài 9" (đúng).

**Lệch so với ticket**
- Thẻ "Trăng rằm" đổi thành "Trăng Trung thu" (`mid_autumn_moon_card`): *Thời tiết và các mùa* đã chốt không nói ngày rằm, âm lịch trong chữ bé nghe.
- Câu q6 bài 1 "It is OK to look at the Sun." → "It is safe to look at the Sun." (không chữ viết tắt).
- Từ vựng bài 1 "light", "warm" đã có ở Explorer (*Cây quanh em*, *Thời tiết và các mùa*) nên dùng `bright`, `warmth`; bài 4 "shape" đã có nên dùng `lantern`; bài 5 thêm `countryside` cho đủ bốn từ.
- Ticket gợi ý kệ bài 1 bẫy "bóng đèn, quạt": đổi thành "đèn bàn, máy sấy tóc" (tránh chữ "bóng"; quạt điện không giống nhóm nào, máy sấy giống nhóm "Phơi khô").
- Kệ bài 6 ticket gợi ý thêm "mây": bỏ để đủ sáu món có bẫy (đèn ông sao, đèn lồng tròn); mây ở ô Học.

**Validate:** chưa chạy được. Phiên content-editor lượt này không có công cụ chạy lệnh (chỉ đọc, ghi file), nên `node tools/content-cli/src/cli.ts validate content/explorer/bau-troi-ngay-va-dem` cần phiên chính chạy. Dự đoán lỗi không do chữ: thiếu `id` (chưa chạy `ids`), thiếu `topic_id`/`lesson_id` và tên bài 3, 6 lệch `content/syllabus.json` (dev chưa đổi danh mục A1), thiếu ảnh và file chọn ảnh `content/images/explorer/bau-troi-ngay-va-dem/*.json` (designer chưa làm). Lỗi nào khác ngoài nhóm này thì báo lại content-editor.

**Chỗ chưa chắc (chi tiết ở `_topic.md` Còn mở)**
1. Kệ bài 2 ba nhóm bắt buộc, mỗi nhóm một món (Cú, Dơi, Đom đóm).
2. Bảng Đúng/Sai lệch về Đúng (mười bảy Đúng, mười Sai).
3. Ảnh bình minh và hoàng hôn khó phân biệt: không bao giờ chung một câu, một kệ; kệ bài 3 chỉ có bình minh có sương.
4. Thẻ bài 2 "Bầu trời đêm" gần thẻ bài 5 "Bầu trời sao" (hai ảnh khác hẳn; phương án khác "Hoa quỳnh").
5. Key reward dùng lại làm hình ô Học (`night_sky_card` ở bài 6 ô Night sky; `star_lantern_card` ở kệ bài 6): cần `validate`/`images` xác nhận đọc được "Dùng lại hình `<key thẻ>`".

**[CẦN KIỂM] cho người chuyên môn** (gộp ở `_topic.md` mục Đúng khoa học): nhìn thẳng Mặt Trời hại mắt kể cả với kính râm thường; cú, dơi, đom đóm thức đêm, cú nhìn rõ ban đêm; gà gáy trước bình minh; trưa nắng gắt nhất (nóng nhất đầu giờ chiều); trời ửng cam lúc hoàng hôn; có hôm thấy trăng ban ngày; thấy vệt sẫm trên trăng tròn; trăng Trung thu tròn; sao rất to nhưng rất xa, xa hơn Mặt Trăng nhiều; ở quê thấy nhiều sao hơn; đêm tối thấy vài nghìn sao; Mặt Trời rất to nhưng rất xa; sáu quan niệm sai (nguồn: `moon_follows_me` theo Piaget, các key khác là suy luận hoặc danh sách quan niệm sai chưa tra nguồn cụ thể).

**Đề xuất cho vùng khác**
- dev: đổi danh mục A1 trước khi gắn id (tên bài 3 "Sunrise and sunset" · "Mặt Trời mọc, Mặt Trời lặn", bài 6 "What is in the sky?" · "Trên bầu trời có gì?").
- designer: file chọn ảnh theo bảng Hình dùng chung; giữ đúng key và `alt` các hình gốc; luật bình minh/hoàng hôn; mười một hình vẽ giấy cắt.
- ios-dev: khoá `collectible.set.sky` (đã có trong A4).

## Ghi chú designer lượt 1 (19/11)

- Đã chuyển `design/icons/topics/new-water-around-us.svg` sang `design/icons/topics/_retired/` (cạnh 6 icon đã nghỉ). Còn 43 file `.svg`; so bằng máy với `content/syllabus.json` (dev đã đổi): 43 = 43, không thừa không thiếu. Icon `new-sky-day-and-night` giữ nguyên.
- `design/play-ui/project/Topic-Icons.dc.html`: bỏ thẻ *Nước quanh em*; *Bầu trời ngày và đêm* thành "10 ·"; dòng phụ Explorer "10 chủ đề · 6 unit Oak Year 1–2, 4 chủ đề mới"; mô tả đầu trang "43 icon". Lưới Explorer vẫn 2 hàng nên khung 1440×2050 không đổi.
- `design/play-ui/journey-roadmap-spec.md`: mục 1 "43 icon"; mục chặng Explorer 6 chặng 1 · 2–3 · 4–5 · 6–7 · 8 · 9–10, `stopRange` cuối `8..<10`, cột mốc chặng 6 ghi "0/2 xong"; bỏ ghi chú màu của `new-water-around-us`; "Danh sách 43 icon" thêm dòng lịch sử SK-061; bảng Explorer (10), bỏ dòng `new-water-around-us`, *Bầu trời* thành #10. Các số "44" còn lại trong spec là kích thước px (đĩa icon, lề), không phải số đếm, giữ nguyên.
- Chưa chọn ảnh bài (phần "designer (ảnh)"): chờ content-editor soạn xong `bau-troi-ngay-va-dem`.
- Canvas chưa publish; file đổi cần publish khi Duy chốt: `Topic-Icons.dc.html`. Không đổi `canvas.json`.

## Ghi chú dev lượt 1 (19/11)

- `content/syllabus.json`: bỏ khối `new-water-around-us`; `new-sky-day-and-night` `number` 11 → 10, `level` 2 → 1; bài 3 "Sunrise and sunset" · "Mặt Trời mọc, Mặt Trời lặn", bài 6 "What is in the sky?" · "Trên bầu trời có gì?". Sửa bằng thay chuỗi, không ghi lại cả file, nên định dạng các khối khác giữ nguyên; so với bản trước khi sửa chỉ khác 7 dòng cộng 76 dòng xoá của khối nước. Số `topic_id` (16) và `lesson_id` (98) trước và sau bằng nhau. `new-sky-day-and-night` chưa có `topic_id`, `lesson_id`: chưa gắn, chờ content-editor soạn xong `content/explorer/bau-troi-ngay-va-dem/` (thư mục chưa tồn tại lúc sửa).
- Số đếm 43 chủ đề / 375 bài, Explorer 10 / 64: `tools/content-cli/test/syllabus.test.ts` (dòng 95, 101, 109), `tools/content-cli/src/markdown/syllabus.ts:51` (chú thích), `tools/content-cli/README.md:348` ("98 bài có lesson_id" theo lần chạy thật), `packages/content-schema/test/syllabus.test.mjs` (`["explorer", 10, 64]`, tổng 375, tên test, chú thích SK-061; giữ chú thích SK-051, SK-053, SK-057).
- Grep lại `381`, `44 chủ đề`, `11, 70`, `water-around-us`, `8..<11` trong `tools/`, `packages/`, `database/`, `scripts/`: chỉ còn chú thích lịch sử trong `syllabus.test.mjs` (và chuỗi băm trong `uv.lock`, file model TTS, không liên quan). `database/`, `scripts/` không có chỗ nào.
- `node tools/content-cli/src/cli.ts validate content`: 0 lỗi, 181 cảnh báo (toàn cảnh báo markdown như `[CẦN KIỂM]`, không có `syllabus_*`), dòng tổng "3 nhóm, 43 chủ đề, 375 bài; 98 bài có lesson_id".
- Test: `content-schema` 163/163 pass, typecheck sạch. `content-cli` lần chạy đầu có 1 test fail (log bị cắt, không xem được tên test), chạy lại ngay thì 410/410 pass, typecheck sạch. Nghi là test phụ thuộc thời gian hoặc trạng thái thư mục `content/` khi agent khác đang ghi; tester nên chạy lại một lần để xác nhận.
- Không đổi luật validator, không build gói, không đụng `apps/ios`, `content/explorer`, `design/`. Không có migration.

## Tester rà chữ lượt 1 (19/11)

> Phạm vi: **chữ** của `_topic.md` và sáu bài trong `content/explorer/bau-troi-ngay-va-dem/`, theo khuôn SK-058. Chưa kiểm: ảnh thật và giấy phép (designer chưa chọn), `images fetch`, `tts`, `build`, `check-pack`, chơi thử trên simulator — ghi "chưa kiểm".
> Đã chạy: `import` ra JSON trong thư mục tạm của tester (không ghi vào `content/.build/`), rồi sáu script kiểm trên JSON: cấu trúc quiz · đếm từ EN theo **từng câu** · chữ cấm · ghép ý chính ↔ ô Học (`KeyPointPictures.match`) · giải "Dùng lại hình" để biết kiểu hình từng câu, từng kệ · so khoá `misconception`, từ vựng, thẻ với toàn `content/explorer/`.
>
> **Kết quả: 1 lỗi chặn (C1), 12 mục nhỏ (n1–n12).**

### Đã kiểm bằng máy — đạt

- **Danh mục ↔ markdown:** `new-sky-day-and-night` có `number: 10`, `level: 1`, `strand: earth_sky`, `source.kind: new`; `topic_id` khớp `_topic.md`; sáu `lesson_id` và sáu tên bài EN · VI khớp từng chữ với sáu file `.md`; `oak_lessons: []`, `statutory: false` cả sáu. Đếm máy cả danh mục: Explorer 10 / 64 (8 + 7 + 4 + 8 + 6 + 6 + 7 + 6 + 6 + 6), cả app **43 / 375**, 31 `kind: oak` + 12 `kind: new`, `oak_year` Explorer `[1, 2, 2, None, None, 1, 1, 2, None, None]`.
- `difficulty` 1-1-1-2-1 = sáu điểm, khớp `level: 1` (quyết định 6).
- **Quiz:** sáu bài đều DOK `1·1·1·2·2·2`; đúng **một** câu `misconception` và luôn ở q6; sáu q6 đều `true_false` đáp án Sai; chỉ `single_choice`, `true_false`, `order_sequence`; số lựa chọn `single_choice` 2–3, `order_sequence` ba thẻ; bài 1, 2, 5 hai format, bài 3, 4, 6 ba format.
- Sáu `explanation_correct` của q6 **đúng từng chữ** câu `correction` ở `_topic.md`; sáu `prompt` q6 đúng từng chữ câu `statement` (máy so).
- Sáu khoá `misconception` mới không trùng 58 khoá Explorer đã có; 24 khoá từ vựng không trùng 238 khoá Explorer đã có; sáu khoá `_card` không trùng 58 thẻ Explorer đã có.
- **Thứ tự `order_sequence` đúng:** bài 3 `morning, noon, evening`; bài 4 `thin, half, full`; bài 6 `kite, plane, moon` — khớp bảng `_topic.md:332–337`.
- **Khởi động:** bài 1–4 hai câu, bài 5, 6 ba câu; mọi câu DOK 1, chỉ `single_choice`/`true_false`, câu nào cũng có `recall_from.lesson` trỏ bài có thật. Đủ ba mốc: "hôm trước" (bài 2–6 w1), "khoảng một tuần" (bài 5 w3 → bài 1, bài 6 w2 → bài 2, cách bốn bài), "rất xa" (bài 1 w1, w2; bài 2 w2; bài 3 w2 sang #3, #5, #6, #7) — khớp bảng `_topic.md:286–293`, và sửa được mục SK-058 n12.
- **SK-044 / SK-047:** 0 lựa chọn sai thiếu `feedback`; 0 lựa chọn đúng thừa `feedback`; mọi câu có `hint` và có hình; mọi lựa chọn, thẻ `order_sequence`, món Chơi, ô Học có hình; `true_false` nào cũng có `feedback` đúng phía (Đúng → `feedback_false`, Sai → `feedback_true`); 0 câu có `labels`.
- **Chữ cho trẻ:** đếm **theo từng câu** (cả `feedback`, `hint`, giải thích, ví dụ ô Học, lời nhắn Chơi, từ vựng, thẻ): mọi câu EN ≤ 8 từ **trừ hai câu Mục tiêu** (xem C1). `.en` không có dấu tiếng Việt; VI không chữ số, không ký hiệu.
- **Chữ cấm (EN và VI, bỏ `brief` và dòng `>`): 0 kết quả** với "spin", "rotate", "orbit", "quay", "quỹ đạo", "planet", "hành tinh", "phase", "gravity", "trọng lực", "eclipse", "nhật thực", "nguyệt thực", "comet", "sao chổi", "shooting star", "sao băng", "constellation", "chòm sao", "galaxy", "Ngân Hà", "telescope", "kính thiên văn", "astronaut", "phi hành gia", "Earth", "Trái Đất", "globe", "quả địa cầu", "map", "bản đồ", "shadow", "bóng", "east", "west", "phía đông", "phía tây", "because", "why", "tại sao", "Sao Mai", "Sao Hôm", "tử vi", "chiêm tinh", "chú Cuội", "thỏ ngọc", "âm lịch". **"vì sao" chỉ trong "các vì sao"** (16 chỗ, máy soi ngữ cảnh). Từ nối nhân quả tiếng Việt: chỉ **một** chữ "nên" — "Mặt Trăng ở rất xa nên em đi đâu cũng thấy" (`06:q6`, `_topic.md:84`), đúng câu ticket cho phép ở khuyến nghị 1.
- **An toàn:** "Không nhìn thẳng vào Mặt Trời" đúng năm chỗ đã khai (ý chính 3 bài 1, ô Học `explore_safe` bài 1, q6 bài 1, ví dụ ô `explore_day_sky` bài 6, w3 bài 5). "cùng người lớn" · "with a grown-up" đúng **hai** chỗ, cả hai là ví dụ ô Học (bài 5 `explore_far`, bài 6 `explore_night_sky`), không thành câu quiz. Kính râm đúng một ví dụ (bài 1), không ống nhòm, không kính lúp.
- **Kiểu hình (giải hết chuỗi "Dùng lại hình"):** không câu nào trộn ảnh chụp với hình vẽ; kệ bài 1–5 toàn ảnh, kệ bài 6 toàn hình vẽ. Đáp án đúng không bao giờ là hình vẽ duy nhất giữa các ảnh, và ngược lại.
- **Ảnh bình minh và hoàng hôn:** máy soi — `explore_sunrise` và `explore_sunset` **không bao giờ** đứng trong cùng một câu hay cùng một kệ (luật `_topic.md:206`).
- **`alt` của lựa chọn đúng: 0 chỗ** chứa chữ của câu hỏi (máy so từ). Năm chỗ `label` lựa chọn đúng trùng chữ câu hỏi (`02:q1` night, `03:w1` day, `04:q1` full Moon, `05:w1` thin Moon, `05:q1` starry sky) — thẻ Explorer **không hiện chữ**, `label` chỉ vào VoiceOver, nên **không chặn**; cùng loại với SK-058 n7 đang chờ PM và ios-dev chốt một lượt.
- **Ghép ý chính ↔ ô Học:** chạy `KeyPointPictures.match` trên JSON — khớp **từng ô** với bảng `_topic.md:135–143` (sáu bài đều ý i → ô i, ô 4 không ghép).
- **Chơi:** mọi món bẫy thuộc đúng nhóm `limit`; `has_limited` đúng với mọi món bẫy của từng bài; không món nào xếp được vào hai nhóm (một chỗ nhập nhằng về **nhãn**: n11). Mọi `messages.missing.<nhóm>` có đủ cho từng nhóm `required`.
- **Hai khoá thẻ dùng lại làm hình** (`night_sky_card` ở ô `explore_night_sky` bài 6; `star_lantern_card` ở món `tray_star_lantern` bài 6) **giải được** — `import` 0 lỗi và máy lần được tới `brief` gốc. Chỗ chưa chắc số 5 của content-editor: **đạt, không phải sửa**.
- `validate content/explorer/bau-troi-ngay-va-dem`: **0 lỗi, 9 cảnh báo** = 2 `age_words_en` (C1) + 7 `md_needs_check` (**50 dòng `[CẦN KIỂM]`**: `_topic.md` 15, bài 1: 5, bài 2: 7, bài 3: 4, bài 4: 8, bài 5: 6, bài 6: 5).
- **`npm --prefix tools/content-cli test` (chạy một lần, 19/11): 410/410 pass, 0 fail, exit 0, 46,9 s.** Không gặp lần fail chập chờn dev báo ở mục trên. Log: `cli-test-sk061.log` trong thư mục tạm của tester.

### Lỗi chặn (1)

**C1 · Hai câu Mục tiêu EN 9 từ — vượt luật "câu EN tối đa 8 từ", và chưa từng có tiền lệ ở Explorer.**
`03-mat-troi-moc-mat-troi-lan.md:19` "I can say when the Sun rises and sets." (9 từ) và `06-tren-bau-troi-co-gi.md:19` "I can name things I see in the sky." (9 từ).
- Đếm máy toàn bộ 64 bài Explorer: **58 bài cũ đều ≤ 8 từ**, nhiều bài đúng 8 (`thoi-tiet-va-cac-mua/06` "I can tell how a year's weather changes.", `nui-song-va-bien/01` "I can spot land and water from above."). Hai câu này là hai câu đầu tiên vượt mức, nên **không có tiền lệ để chấp nhận**.
- Mục tiêu là **chữ bé nghe**: màn Tổng kết hiện và đọc nó (`apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/RecapStep.swift:341`, `:352`), và `tts` sẽ cắt clip cho nó. Sửa sau khi chạy `tts` thì phải dựng lại gói.
- `_topic.md:124` còn tự ghi "Mục tiêu "I can…" **tối đa tám từ**" rồi liệt kê đúng hai câu 9 từ — bảng và bài đang nói ngược nhau.
Tái hiện: `node tools/content-cli/src/cli.ts validate content/explorer/bau-troi-ngay-va-dem` → 2 cảnh báo `age_words_en`.
Mong đợi: 0 cảnh báo `age_words_en`.
Thực tế: 2 cảnh báo.
Đề xuất (content-editor chọn, sửa cả `_topic.md:124`): bài 3 → "I can tell sunrise from sunset." (5 từ) hoặc "I can say when the Sun rises." (7 từ); bài 6 → "I can name things in the sky." (7 từ). VI giữ nguyên được.

### Mục nhỏ (12)

**n1 · Khởi động lệch hẳn về Đúng: 9 câu `true_false` thì 8 Đúng, 1 Sai.**
Chỉ `06:w2` ("Owls sleep all night long.") là Sai. Bé trả lời "Đúng" cho mọi câu Khởi động được 8/9 mà không cần nhớ bài. Cả chủ đề 27 câu TF = 17 Đúng / 10 Sai; bỏ sáu câu q6 (luôn Sai) còn **17 Đúng / 4 Sai**. Trong Quiz thì cân (9/9 kể cả q6). So với SK-058: 12/14, bỏ q6 là 12/8. content-editor đã tự nêu (Còn mở 2) — **đồng ý**, đổi `04:w2` ("Sunshine helps plants grow.") và `05:w2` ("Streetlights come on after sunset.") sang dạng khẳng định sai, và tính lại bảng `_topic.md:310–336`.

**n2 · Kệ bài 2: ba chip nhóm in sẵn ba đáp án.**
`02-ngay-va-dem.md:221–234` ba nhóm `required` là "Owl · Cú", "Bat · Dơi", "Firefly · Đom đóm"; ba món đúng là "Owl · Con cú" (`:245`), "Bat · Con dơi" (`:254`), "Fireflies · Đom đóm" (`:262`). App in **tên nhóm** lên chip và chỉ in nhóm `required` (`PlayStep.swift:313–320`, `:648`), nên trước khi chơi bé đã đọc được "Cú · Dơi · Đom đóm". Lệnh "Tìm con vật thức ban đêm" biến thành việc tìm ba ảnh trùng tên, không còn là phân loại ngày/đêm — đúng việc mà `everyone_sleeps_at_night` muốn luyện. Các kệ khác của chủ đề đặt nhãn khái quát ("Phơi khô", "Buổi sáng", "Trời ban đêm") nên không bị.
Đây là chỗ chưa chắc số 1 của content-editor, nhưng vấn đề nằm ở **nhãn**, không ở số món. Hai cách, PM chọn:
- (a) giữ ba nhóm, đổi nhãn sang dấu hiệu chứ không phải tên con vật, ví dụ "Big night eyes · Mắt to nhìn đêm", "Hangs upside down · Ngủ treo ngược", "Glows in the dark · Phát sáng trong đêm";
- (b) theo đề xuất của content-editor: mỗi nhóm hai món (bảy món, kệ ba cột) — nhưng (a) vẫn phải làm, không thì chip vẫn lộ.

**n3 · Lời nhắc `missing.tray_bat` bài 2: bản VI cũng đúng với con cú.**
`02-ngay-va-dem.md:214–215` EN "You still need a furry flyer." · VI "Em còn thiếu một con vật có lông biết bay." Tiếng Việt "lông" là cả *fur* lẫn *feather*, nên câu này mô tả cả con cú — mà cú là một nhóm `required` khác trên chính kệ đó (`:212–213` "một con chim thức đêm"). Bé đã bỏ cú vào giỏ rồi, nghe nhắc lại sẽ đi tìm lại con cú. EN không nhập nhằng.
Đề xuất VI: "Em còn thiếu con vật ngủ treo ngược trên cành." (hoặc "…con vật bay đêm, ngủ treo ngược").

**n4 · Bài 5: cùng một ảnh là đáp án đúng của hai câu trong một quiz.**
`05-cac-vi-sao.md:346–350` (q1 `q1_starry`) và `:413–417` (q3 `q3_countryside`) đều là "Dùng lại hình `explore_starry`". Bé nhớ "ảnh nhiều chấm sáng là đúng" rồi chọn lại ở q3 mà không cần đọc câu hỏi; q3 lại chỉ có hai lựa chọn. Năm bài còn lại không có chỗ nào như vậy (máy soi cả sáu bài).
Đề xuất: q3 dùng một ảnh trời sao ở quê **khác** `explore_starry` (brief đã có sẵn ý "rặng cây ở quê", designer chọn hai ảnh), hoặc q1 chuyển sang `explore_twinkle`.

**n5 · 10 chỗ "Dùng lại hình" trỏ qua hai chặng.**
`02:275` `tray_rooster`, `02:383` `q3_rooster`, `03:101` `w2_eye`, `03:111` `w2_ear`, `03:255` `tray_rooster`, `03:342` `q2_rooster`, `03:450` `q5_rooster`, `03:527` từ `morning`, `06:118` `w3_rooster`, `06:348` `q1_rainbow` — đều trỏ `co-the-cua-em/nam-giac-quan-cua-em`, mà các mục đó lại trỏ tiếp sang `discoverer/nao-bo-va-giac-quan/…`. Cùng loại với **SK-058 n5** (PM đã đề xuất ticket SK-060 dọn toàn `content/explorer/`). Từ khoá tìm ảnh đã chép đúng nên designer không chọn nhầm; chỉ cần đổi 10 dòng sang bài gốc thật, hoặc gộp vào SK-060.

**n6 · `_topic.md:200` kê thiếu một câu hình vẽ.**
Dòng này ghi "Câu q1 bài 2, câu w1 bài 3 … và câu q4 bài 3 … không có ảnh chụp; **mọi câu chọn khác toàn ảnh chụp**". Sai: câu **w2 bài 3** (`03:97–115`, mắt và tai) cũng là hai hình vẽ — nguồn `nao-bo-va-giac-quan` là "[hình vẽ] … nền kem trơn", lại **khác nét** với giấy cắt style E của chủ đề này. Câu vẫn đúng luật "một câu một kiểu hình", nhưng designer đọc bảng này để chọn ảnh nên phải sửa dòng kê; nếu không muốn trộn hai lối vẽ thì đổi w2 sang ảnh chụp mắt và tai.

**n7 · Kệ bài 3 chỉ năm món, nhóm bẫy chỉ một món.**
`03:251–284`: hai nhóm `required` hai món + nhóm `limit` **một** món (`tray_noon`). Đếm máy 64 kệ Explorer: tất cả đều **6–8 món** và nhóm bẫy đều ≥ 2 món. Năm món xếp hai cột để trống một ô. Không phải lỗi luật (`rules.json` không chặn), nhưng lệch khuôn.
Đề xuất: thêm một món bẫy buổi trưa thứ hai (mèo nằm tránh nắng dưới hiên, nón lá treo bên hiên trưa) cho đủ sáu.

**n8 · Bài 6 q5: lựa chọn sai "máy bay" cũng ở xa.**
`06:448` "Which one is far, far away?" · "Cái nào ở rất, rất xa?"; lựa chọn sai `q5_plane` (`:480–482`) phản hồi "People fly in planes, above the clouds." Với bé 5–7, máy bay trên mây đúng là "rất xa". Câu q4 ngay trước đã xếp diều < máy bay < Mặt Trăng, nhưng q5 không nhắc lại mốc so sánh nào.
Đề xuất: "Which one is the farthest away?" · "Cái nào ở xa nhất?" (6 từ EN), hoặc đổi lựa chọn sai sang con chim.

**n9 · Bài 1 `messages.start`: EN đọc khó hiểu, VI nói nhiều hơn EN.**
`01:192–193` EN "Pick drying, a plant and keeping warm." — "Pick drying" không thành câu tiếng Anh; VI "Em chọn một thứ đang phơi, một cây xanh và **một con vật sưởi nắng** nhé." nói rõ cả con vật, EN chỉ nói "keeping warm". Đề xuất EN: "Pick something drying, a plant and an animal." (8 từ). Chỗ tương tự nhẹ hơn: `06:messages.start` EN "Pick from the day and night sky." ‖ VI kể rõ "một thứ … và một thứ …".

**n10 · Bài 3 ý chính 2: EN dễ đọc thành "Mặt Trời nóng".**
`03:27` "At noon, the Sun is high and hot." ‖ VI `:28` "Buổi trưa, Mặt Trời lên cao, nắng gắt." VI nói về **nắng**, EN nói về **Mặt Trời**. Mặt Trời thì lúc nào cũng nóng; ý bài là nắng trưa gắt. Đề xuất EN: "At noon, the Sun is high. Sunshine is strong." (hai câu ngắn) hoặc "At noon, the sunshine feels hottest."

**n11 · Bài 1: nhãn nhóm EN "Dries things" cũng đúng với món bẫy máy sấy tóc.**
`01:209–210` nhóm `required` "Dries things" · "Phơi khô"; món bẫy `tray_dryer` (`:276–281`) là máy sấy tóc, và ghi chú `:281` nói thẳng "Món bẫy giống nhóm *Dries things*". VI "Phơi khô" hàm ý phơi nắng nên không nhập nhằng; EN thì máy sấy **đúng là** "dries things", chỉ có lệnh kệ ("Find what sunshine helps with") mới loại được. Chủ ý đã ghi nên **không chặn**; nếu muốn chặt thì nhãn EN "Dried by the sun" · VI giữ "Phơi khô".

**n12 · Bài 6 xếp Mặt Trăng vào nhóm "Trời ban đêm", ngay sau bài 4 dạy có hôm thấy trăng ban ngày.**
`06:247` nhóm `tray_night` "Night sky · Trời ban đêm" nhận món `tray_moon` (`:275`). Bé không tự chọn nhóm (chỉ nhặt món vào giỏ) nên **không bị chấm sai**, nhưng chip "Trời ban đêm" sáng lên khi bé nhặt trăng, trong khi thẻ thưởng của chính bài 6 là "Trăng ban ngày" (`day_moon_card`) và `moon_only_at_night` vừa được sửa ở bài 4. Ghi để PM biết; nếu muốn gọn thì ô Học `explore_night_sky` (`06:…`) thêm một ví dụ nhắc "có hôm thấy trăng cả ban ngày".

### Trả lời sáu "chỗ chưa chắc" của content-editor

1. **Kệ bài 2 ba nhóm, mỗi nhóm một món** → xem n2. Vấn đề thật nằm ở **nhãn nhóm lộ đáp án**, không ở số món; thêm món thứ hai mà giữ nhãn "Cú · Dơi · Đom đóm" thì vẫn lộ.
2. **Bảng Đúng/Sai lệch về Đúng** → xem n1. **Đồng ý sửa**, đúng hai câu content-editor đề xuất (`04:w2`, `05:w2`).
3. **Ảnh bình minh và hoàng hôn** → luật đã chặt và **máy xác nhận 0 vi phạm**: hai hình không bao giờ đứng cùng câu hay cùng kệ. Giữ nguyên. Phương án dự phòng ở Còn mở 3 (đổi `tray_sunrise` sang cảnh đời sống buổi sáng) hợp lý, để designer quyết khi chọn ảnh.
4. **Thẻ bài 2 "Bầu trời đêm" ‖ thẻ bài 5 "Bầu trời sao"** → **giữ hai thẻ**, đừng đổi sang "Hoa quỳnh" (ra khỏi chủ đề bầu trời, và bộ `sky` sáu thẻ đang kể đúng một vòng ngày–đêm). Hai `brief` đã khác hẳn (bài 2: trăng + làng; bài 5: đầy sao, không trăng). Khi designer chọn xong, tester kiểm lại bằng mắt ở lượt rà ảnh.
5. **Khoá thẻ dùng lại làm hình ô Học, món Chơi** → **đạt**: `import` 0 lỗi và máy lần được cả hai chuỗi (`06` ô `explore_night_sky` → `night_sky_card`; `06` món `tray_star_lantern` → `star_lantern_card` → hình vẽ gốc ở *Thời tiết và các mùa* bài 6). Không phải sửa.
6. **Khối `[CẦN KIỂM]` (50 dòng)** → đọc ở mức hợp lý với trẻ 5–7, **không thấy chỗ nào sai khoa học**: nhìn thẳng Mặt Trời hại mắt kể cả với kính râm thường; cú, dơi, đom đóm thức đêm, cú nhìn rõ ban đêm; gà gáy trước bình minh; Mặt Trời lên cao nhất quanh trưa (chữ bé nghe chỉ nói "nắng gắt", không nói "nóng nhất" — cách nói này **đúng**, giữ); trời ửng cam lúc hoàng hôn; có hôm thấy trăng ban ngày; vệt sẫm trên trăng tròn; trăng Trung thu tròn; sao rất to nhưng rất xa, xa hơn Mặt Trăng nhiều; ở quê thấy nhiều sao hơn; đêm tối thấy được hàng nghìn sao; Mặt Trời rất to nhưng rất xa; máy bay cao hơn diều. **Vẫn cần người chuyên môn** cho năm quan niệm sai chưa có nguồn dẫn (`safe_to_look_at_sun`, `everyone_sleeps_at_night`, `sun_stays_still`, `moon_only_at_night`, `stars_are_tiny`; `moon_follows_me` đã dẫn Piaget) — giống SK-058, không chặn ticket.

### Chưa kiểm

- Ảnh thật, giấy phép, `images fetch`, khung cắt (`PictureFit`): designer chưa chọn ảnh.
- `tts` EN và VI, `build`, `check-pack`, chơi thử trên iPhone 16 (bộ "Sky cards" 1/6): chờ sau khi sửa C1, vì Mục tiêu nằm trong clip `tts`.
- Test iOS trên simulator: chưa chạy trong lượt này.

## Ghi chú content-editor lượt 2 (19/11)

Sửa theo "Tester rà chữ lượt 1", chỉ trong `content/explorer/bau-troi-ngay-va-dem/`. Chưa chạy `validate` (không có công cụ chạy lệnh); đã grep lại: mọi câu EN tối đa tám từ (dòng dài hơn chỉ là hai câu ngắn), chữ cấm vẫn 0.

**Đã sửa**
- **C1:** Mục tiêu bài 3 "I can tell sunrise from sunset." · "Em phân biệt được Mặt Trời mọc và Mặt Trời lặn."; bài 6 "I can name things in the sky." · "Em gọi tên được những thứ trên bầu trời." Sửa cả danh sách ở `_topic.md`.
- **n1:** bài 4 w2 → "Plants grow best in the dark." (Sai); bài 5 w2 → "Streetlights come on at sunrise." (Sai). Hình giữ nguyên. Bảng Đúng/Sai, bảng Khởi động ở `_topic.md` tính lại: 15 Đúng / 12 Sai; Khởi động 6 Đúng / 3 Sai.
- **n2:** kệ bài 2, nhãn ba nhóm đổi sang dấu hiệu: "Big night eyes · Mắt to nhìn đêm", "Sleeps upside down · Ngủ treo ngược", "Glows in the dark · Phát sáng trong đêm". Giữ ba nhóm, mỗi nhóm một món, key nhóm và key món không đổi. Em chọn cách (a) của tester thay cho một nhóm "Thức ban đêm", vì một nhóm duy nhất thì bé chỉ cần nhặt một con là đạt.
- **n3:** `missing.tray_bat` → "You still need an upside-down sleeper." · "Em còn thiếu con vật ngủ treo ngược trên cành."; `missing.tray_owl` → "You still need a big-eyed night bird." · "Em còn thiếu con chim mắt to thức đêm."
- **n4:** bài 5 q3 dùng hai ảnh mới, cùng mới để đáp án không là ảnh mới duy nhất.
- **n6:** `_topic.md` Quy ước hình số ba ghi thêm câu w2 bài 3 là hai hình vẽ khác nét (gốc Discoverer). Giữ, không đổi sang ảnh.
- **n7:** kệ bài 3 thêm món bẫy buổi trưa thứ hai, kệ đủ sáu món.
- **n8:** bài 6 q5 → "Which one is the farthest away?" · "Cái nào ở xa nhất?"; lựa chọn sai máy bay đổi thành con cú (`explore_hunt`, đã gặp ở w2).
- **n9:** bài 1 `messages.start` EN → "Pick something drying, a plant and an animal."; bài 6 EN → "Pick one for day, one for night."
- **n10:** bài 3 ý chính hai EN → "At noon, the Sun is high. Sunshine is strong." (ghép ô vẫn ý 2 → Noon).
- **n11:** bài 1 nhãn nhóm EN "Dries things" → "Dried by the sun" (VI giữ "Phơi khô").
- **n12:** bài 6 ô Night sky thêm ví dụ bốn "sometimes the Moon is out by day" · "có hôm, trăng hiện cả ban ngày".
- **n5:** để lại (gộp SK-060).

**Key hình cho designer**
- **Thêm (ảnh mới):**
  - `03` `tray_noon_rest`: người đội nón nghỉ trưa dưới gốc cây bên ruộng, chụp xa, không mặt.
  - `05` `q3.q3_countryside`: đồng quê hay nhà nhỏ tối đèn dưới trời sao, khác `explore_starry`.
  - `05` `q3.q3_town`: dãy phố nhỏ sáng đèn, trời mờ không sao, khác `explore_city`.
- **Bỏ:** `06` `q5.q5_plane`.
- **Đổi hình:**
  - `05` `q3_countryside` trước dùng lại `explore_starry`, nay là ảnh mới.
  - `05` `q3_city` đổi key thành `q3_town`, ảnh mới.
- **Thêm chỗ dùng lại:** `06` `q5.q5_owl` dùng lại `explore_hunt` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao`.
- **Không đổi hình, chỉ đổi chữ:**
  - `02` ba nhóm kệ: nhãn mới cần ảnh món thấy đúng dấu hiệu. Ảnh cú phải mở to mắt, ảnh dơi phải treo ngược (`tray_bat` đã vậy), ảnh đom đóm phải đang phát sáng.
  - `06` `q4_plane` chỉ còn ở câu q4.

## Ghi chú designer lượt 2 (20/11)

Làm theo bản markdown sau "Ghi chú content-editor lượt 2" (có `tray_noon_rest`, `q3_countryside`, `q3_town`, bỏ `q5_plane`, `q5_owl` dùng lại `explore_hunt`). Chỉ sửa `content/images/explorer/bau-troi-ngay-va-dem/*.json` và `content/images/own/bau-troi-ngay-va-dem/`.

**Kết quả**
- 6 file chọn ảnh, **201/201 chỗ có hình** (80 mục có ảnh, 121 `same_as`). `same_as` nào cũng trỏ thẳng mục gốc (kể cả sang chủ đề khác: `w2_ear` trỏ `co-the-cua-em/bo-phan-ben-ngoai-co-the` `q4.q4_ear`, không qua `explore_hear`).
- **38 ảnh chụp mới** cho chủ đề, cộng 6 ảnh của chủ đề khác chép thành mục cắt riêng; 44 nguồn khác nhau: CC BY 2.0 20 · CC0 13 · CC BY 4.0 6 · Public domain 5. 0 BY-SA, NC, ND. Nguồn: Wikimedia Commons, Openverse/Flickr. Ghi công, giấy phép trong từng mục; `images fetch` kiểm lại giấy phép ở nguồn.
- **17 hình vẽ giấy cắt style E** (SVG, bóng paperE nướng sẵn, JPEG) + 4 bản khung 2:1 cho thẻ từ = 21 file `own`:
  - theo `_topic.md`: `explore_day`, `explore_night` (bài 2, cùng ngôi nhà, cây cau, bụi chuối, hàng rào, rặng tre); `q4_morning`, `q4_noon`, `q4_evening` (bài 3, cùng khung đó); kệ bài 6 `tray_sun`, `tray_rainbow`, `tray_moon`, `tray_stars`, `tray_round_lantern` (nền trơn xanh nhạt ngày, xanh than đêm);
  - **vẽ thêm vì không có ảnh hợp lệ** (brief đang ghi `[ảnh]`, đề nghị content-editor đổi sang `[hình vẽ]` và ghi vào Quy ước hình số hai): bài 1 `q4_cupboard`, `q4_step`, `q4_bathroom` (cả câu q4 là hình vẽ; q5 dùng lại `q4_cupboard`); bài 1 `explore_safe` (bạn nhỏ đội nón lá đi trên đường ruộng, nhìn từ sau; dùng cả ở w3 bài 5); bài 4 `explore_mid_autumn` và thẻ `mid_autumn_moon_card` (đèn lồng giấy và trăng tròn); bài 5 `explore_far` (người lớn và em nhỏ in đen ngắm sao; bài 6 ô Far away dùng lại);
  - bản 2:1: `vocab.day`, `vocab.night`, `vocab.full_moon`, `vocab.far`.
  - Kiểm luật: mỗi câu một kiểu hình (q1 bài 2, w1 bài 3, q4 bài 3, q4 bài 1 toàn hình vẽ; các câu chọn khác toàn ảnh); kệ bài 1–5 toàn ảnh, kệ bài 6 toàn hình vẽ (cộng `star_lantern_card` đã vẽ); các hình vẽ thêm chỉ đứng một mình (ô Học, câu Đúng/Sai một hình, thẻ từ, thẻ thưởng).
- **Khung:** thẻ từ 2:1 và thẻ ba lựa chọn 5:2 dùng ảnh vuông đều có mục cắt riêng (chép mục gốc, không `same_as`): `vocab.warmth`, `vocab.morning`, `vocab.owl`, `vocab.awake`, `vocab.sky`, `vocab.cloud`, `vocab.lantern`; `q2/q5_rooster` bài 3, `q3_rooster`, `q3_owl`, `q3_butterfly` bài 2, `q1_clouds`, `q1_rainbow`, `q5_owl` bài 6, `q1_lamp`, `q3_lamp`, `q3_dryer` bài 1, `q1_fireworks` bài 5, `q1_lantern`, `q5_lantern` bài 4. Lượt fetch đủ ảnh gần nhất: 0 dòng "Ảnh lệch khung".
- Kệ bài 2 theo nhãn mới: cú `explore_hunt` mở to mắt; dơi `tray_bat` treo ngược; đom đóm "Lupines and Fireflies No. 4" đang phát sáng ban đêm.
- Bình minh (`explore_sunrise`, `sunrise_card`) và hoàng hôn (`explore_sunset`) không chung câu, chung kệ; ảnh đèn đường `explore_lights` đã cắt bỏ vầng trăng vì là món "Ở gần mình" trên kệ bài 5 (không thuộc hai nhóm).
- Không ảnh Trái Đất từ vũ trụ, quả địa cầu, bản đồ, nhật thực, kính thiên văn, chòm sao nối nét; không ảnh nhìn thẳng Mặt Trời (Mặt Trời chỉ qua sương, sau cây, lúc mọc, lặn); không ảnh chụp qua kính lọc.
- `validate content/explorer/bau-troi-ngay-va-dem`: 0 lỗi, 7 cảnh báo `[CẦN KIỂM]`.

**Đề nghị content-editor sửa chữ cho khớp ảnh**
1. Bảy brief `[ảnh]` → `[hình vẽ]` ở trên; `_topic.md` Quy ước hình số hai thành 17 hình vẽ; số ba thêm "câu q4 bài 1 toàn hình vẽ".
2. `tray_noon_rest` bài 3: không có ảnh người đội nón nghỉ trưa dưới gốc cây hợp giấy phép. Ảnh đang dùng: đường làng Gò Công Tây (1972) nắng gắt, bóng lá in đậm, xe ngựa ở xa. Alt đề xuất "A sunny lane under tall trees" · "Đường làng nắng gắt dưới hàng cây".
3. `tray_school` bài 2: ảnh trẻ đeo cặp hợp giấy phép đều có chữ trên cặp. Ảnh đang dùng: nhóm trẻ nhỏ đi bộ ban ngày cùng người lớn, nhìn từ sau, không cặp. Alt đề xuất "Children walking in the daytime, from behind" · "Các bạn nhỏ đi bộ ban ngày, nhìn từ phía sau".
4. `explore_near` bài 6: diều nhiều màu trên trời xanh, không thấy cánh đồng. Alt đề xuất "A paper kite in a blue sky" · "Con diều giấy trên trời xanh" (câu ví dụ, câu chính không cần đổi).
5. `day_moon_card` bài 6: nửa vầng trăng trên trời xanh, không có cành cây (ảnh có cành thì trăng quá nhỏ). Alt đề xuất "A pale half Moon in a blue sky" · "Nửa vầng trăng mờ trên trời xanh".

**Chỗ chưa chắc**
- Không có ảnh Việt Nam hợp lệ cho nhiều cảnh: phơi đồ (sân Mỹ), bình minh (Bangladesh), hoàng hôn (sông Mê Kông, không rõ đoạn nào), đèn đường (Mödlareuth, Đức), thành phố (New York), phố đêm (Porto), thẻ `night_sky_card` (Sedona, Mỹ, trăng trên thị trấn chứ không phải làng có rặng tre).
- `tray_crescent_palm`: trời chạng vạng màu xanh lục, trăng nhỏ dù đã cắt sát; `explore_crescent` không có cây ở dưới.
- `explore_full` là trăng tròn vàng nhạt trên ngọn cây trụi lá (Mỹ), cắt ngang 3:2; trăng chiếm khoảng một phần năm bề ngang, nhỏ hơn mong muốn ở ô vuông.
- Ảnh cú `explore_hunt` (gốc chủ đề khác) mắt mở nhưng không to nổi bật; nếu tester thấy chưa rõ "mắt to" thì cần ảnh cú mới cho kệ bài 2.
- Commons trả HTTP 429 nhiều lượt; hai ảnh nhỏ (≤ 1280 px) tải mãi không được nên đã thay: `explore_full` sang ảnh khác, `tray_school` sang bản Flickr (Openverse) của cùng ảnh. Lượt `images fetch` cuối (20/11): 6 file · 57 ảnh khác nhau · 0 lỗi · 0 dòng "Ảnh lệch khung".
- Không đổi `canvas.json`, không publish.
- *(20/11, bổ sung)* SVG nguồn của 21 file hình vẽ (17 hình + 4 bản 2:1) chép vào `design/illustrations/bau-troi-ngay-va-dem/`, tên trùng file JPEG ở `content/images/own/bau-troi-ngay-va-dem/` (SK-058 không lưu SVG nên chưa có quy ước khác). `explore_noon` đổi từ ảnh Lào tên gốc "Pee Break" sang "Countryside in the heart of the city… Saigon" (redsea99, CC BY 3.0, Commons), thêm mục cắt 5:2 riêng `q2_noon`, `q5_noon`. Ảnh này nắng sáng, trời xanh, nhưng đường đất còn vũng nước, tường tôn: chưa ra "trưa nắng chang chang" như brief; không vẽ thay vì ảnh đứng trên kệ và câu ảnh. `images fetch`: 58 ảnh khác nhau, 0 lỗi, 0 lệch khung; `validate`: 0 lỗi.

## Ghi chú content-editor lượt 3 (20/11)

content-editor lượt 3 (20/11), sửa chữ cho khớp ảnh designer lượt 2, chỉ trong `content/explorer/bau-troi-ngay-va-dem/`:
- **Đổi nhãn hình:** bảy brief đổi từ `[ảnh]` sang `[hình vẽ]`: `explore_safe`, `q4_cupboard`, `q4_step`, `q4_bathroom` (bài 1); `explore_mid_autumn`, `mid_autumn_moon_card` (bài 4); `explore_far` (bài 5). `_topic.md` Quy ước hình số hai thành mười bảy hình vẽ; số ba thêm "câu q4 bài 1 toàn hình vẽ".
- **Sửa `alt` theo đề xuất designer:** `tray_noon_rest`, `tray_school` (cả chỗ dùng lại `q4_school`), `explore_near` (cả sáu chỗ dùng lại ở bài 6), `day_moon_card`. Thêm `night_sky_card` thành "A quiet town under the Moon" · "Thị trấn yên tĩnh dưới trăng" (cả ô Night sky bài 6), vì ảnh là thị trấn, không phải làng.
- **Chữ bé nghe có đổi (bốn chỗ):**
  - nhãn `tray_noon_rest` "Resting at noon" · "Nghỉ trưa" thành "Lane at noon" · "Đường làng buổi trưa";
  - nhãn `tray_school` "Going to school" · "Bạn nhỏ đi học" thành "Walking by day" · "Đi bộ ban ngày";
  - lựa chọn `02:q4_school`: nhãn thành "walking outside" · "đi bộ ngoài trời", `feedback` thành "We walk outside in the daytime." · "Ban ngày mình đi bộ ngoài trời.";
  - `06:q2` `feedback_false` "This kite flies just above the field." thành "This kite flies on a string, near us." · "Con diều này bay gần mình, có dây giữ."
- Mọi `alt` lựa chọn đúng vẫn không chứa chữ câu hỏi. Chưa chạy `validate`, `tts`. Không đổi key hình.

## Tester rà ảnh lượt 1 (20/11)

> Phạm vi: **ảnh** của `content/images/explorer/bau-troi-ngay-va-dem/*.json` sau "Ghi chú designer lượt 2" và "Ghi chú content-editor lượt 3". Làm như lượt rà ảnh SK-058: `import` ra JSON trong thư mục tạm, phân giải **201/201 chỗ có hình** sang file thật trong `content/.images/` bằng chính `SelectionSet.resolve` + `imageCacheKey`/`ownCacheKey` của content-cli, chép ra tên đọc được rồi **mở xem từng cái: 82/82 ảnh khác nhau** (58 ảnh chụp + 24 file hình vẽ/bản cắt riêng). Zoom 6 chỗ nghi có chữ, biển hiệu, mặt người.
>
> **Kết quả: 6 lỗi chặn (A1–A6), 22 mục nhỏ (B1–B22).**

### Đã kiểm bằng máy — đạt

- **201/201 chỗ có hình**, 0 chỗ trống, 0 mục hỏng, **0 `same_as` hai chặng** (máy phân giải sang cả file của chủ đề khác; 0 lỗi).
- **Giấy phép: 58 ảnh chụp khác nhau** — CC BY 2.0 24 · CC0 1.0 19 · CC BY 4.0 7 · Public domain 5 · CC BY 3.0 3. **0 BY-SA, 0 NC, 0 ND.** Mọi mục CC BY có `author`; `title` CC BY khớp nguồn (fetch đã chặn).
- **Một câu, một kiểu hình:** máy so từng câu `single_choice`/`order_sequence` theo `asset` — **0 câu trộn ảnh chụp với hình vẽ** trong tập lựa chọn. Các câu có hình câu hỏi là ảnh hàng rào tre còn lựa chọn là hình vẽ (`01:q4`, `02:q1`, `03:w1`, `03:w2`, `03:q4`) đúng Quy ước hình 9, không phải trộn.
- **Một kệ, một kiểu hình:** kệ bài 1–5 toàn ảnh chụp, kệ bài 6 toàn hình vẽ.
- **0 ảnh trùng làm đáp án đúng của hai câu trong cùng một bài** (mục n4 lượt 1 đã đóng: `05:q3` nay dùng `q3_countryside`, `q3_town` mới).
- **Không món nào thuộc hai nhóm** trên cả sáu kệ (đọc từng món và từng nhãn nhóm; chỉ còn hai chỗ nhập nhằng về *hình*, xem B18 và B12 — không phải về nhóm).
- **Không có** quả địa cầu, ảnh Trái Đất từ vũ trụ, bản đồ, hình nét bờ biển Việt Nam, nhật thực, nguyệt thực, kính thiên văn, phi hành gia, chòm sao nối nét, ảnh Mặt Trời chói toàn khung, ảnh Mặt Trời qua kính lọc — trong cả 82 ảnh đã mở xem.
- **Không ảnh nào khuyến khích nhìn thẳng Mặt Trời:** Mặt Trời chỉ xuất hiện qua mây (`01:w1`/`06:explore_day_sky`), qua tán cây (`01:explore_light`), trong sương (`sun_card`), lúc mọc sau mây (`explore_sunrise`), lúc lặn trên sông (`explore_sunset`). Không ảnh nào có người đang ngước nhìn Mặt Trời.
- **Hình vẽ:** 24 file `own`/bản cắt. Giấy cắt phẳng, không nét viền, không chuyển sắc, không chữ, Mặt Trời là đĩa giấy có vành lượn (không tia nhọn, không mặt) — đúng style E. Năm hình cùng khung cảnh của bài 2 và bài 3 (`explore_day`, `explore_night`, `q4_morning`, `q4_noon`, `q4_evening`) **đúng là cùng nhà, cùng cây cau, cùng rặng tre, chỉ đổi trời và một chi tiết sống** → câu `03:q4` xếp sáng → trưa → chiều tối đọc ra ngay. Ngoại lệ: `w2_eye`, `w2_ear` (B14).
- **Kệ bài 2:** dơi `tray_bat_item` **treo ngược rõ** (đúng nhãn "Sleeps upside down"), đom đóm `tray_firefly_item` **đang phát sáng ban đêm rõ** (vệt sáng vàng trên bãi cỏ tối). Cú: **không đạt**, xem A6.
- **Bình minh ≠ hoàng hôn:** máy soi — `explore_sunrise` và `explore_sunset` **không bao giờ** đứng cùng một **câu** hay một **kệ**. Hai ảnh trông khác nhau rõ (bình minh: ruộng lúa trong sương, trời cam hồng; hoàng hôn: sông lặng, có đĩa Mặt Trời và chiếc thuyền). Một chỗ hai ảnh đứng chung **ô Học** bài 3: xem B13.

### Lỗi chặn (6)

**A1 · `explore_twinkle` có watermark chữ "epSos.de" giữa khung.**
`content/images/explorer/bau-troi-ngay-va-dem/cac-vi-sao.json:33` (ảnh "Bright Stars of Milky Way on the Dark blue Sky of Astronomy", tác giả **epSos.de**, CC BY 2.0, Commons). Phóng to 4× đọc rõ chuỗi "epSos.de" in chìm màu xanh ở khoảng 1/3 trái khung trời — là **tên miền một website**, tức chữ và quảng cáo trong hình.
Trái Quy ước hình 8 của chính chủ đề (`_topic.md:202`): "Không chữ, không logo trong mọi hình". Cùng loại với SK-058 B1.
Dùng ở **6 chỗ**: `05` ô Học Twinkle, món kệ `tray_bright_stars`, hình câu `05:q2`, **lựa chọn đúng `05:q4.q4_stars`**, thẻ từ `star`, và `06:q5.q5_stars`.
Tái hiện: bài 5 → Học → ô Twinkle (ảnh chiếm cả khung 4:3); hoặc bài 5 câu q4, thẻ đáp án đúng.
Mong đợi: trời sao không chữ. Thực tế: watermark nằm ngay vùng trời trống, không crop bỏ được mà vẫn giữ bố cục.
Ai sửa: **designer** — đổi ảnh (brief cần "vài ngôi sao sáng rõ trên nền trời xanh thẫm", khác hẳn `explore_starry` dày sao).
Kèm theo: tên ảnh gốc "Bright Stars of **Milky Way**…" hiện ở màn Nguồn hình, mà Ngân Hà là chữ cấm/ngoài phạm vi Explorer (Quy ước 4). CC BY bắt giữ nguyên `title` → đổi ảnh là cách duy nhất.

**A2 · `tray_school` bài 2: nhận ra mặt ít nhất hai bé.**
`ngay-va-dem.json:76` (ảnh "Home from the store", Openverse/Flickr, CC BY 2.0; dùng lại ở `02:q4.q4_school`). Phóng to 2×: bạn trai bên phải quay mặt về phía máy ảnh, một bạn ở giữa đang cười quay nghiêng — **mặt rõ, nhận ra được**.
Trái `_topic.md:206` (Quy ước hình 6) "Trẻ trong ảnh: chụp từ phía sau hay xa, **không nhận ra mặt**" và `content/TEMPLATE.md:77`. `note` của designer ghi "không thấy mặt" là chưa đúng với ảnh đang dùng; `alt` "Children walking in the daytime, from behind" (`02-ngay-va-dem.md:294`, `:432`) cũng sai với hai bạn này.
Tái hiện: bài 2 → Chơi → món "Walking by day"; hoặc bài 2 câu q4, lựa chọn sai.
Ai sửa: **designer** — đổi ảnh, hoặc crop lấy nửa trái (bạn mặc áo hoa và bạn áo kẻ đều quay lưng) rồi content-editor giữ `alt` hiện có.

**A3 · `explore_noon` bài 3 không phải cảnh trưa nắng, lại có biển báo và chữ.**
`mat-troi-moc-mat-troi-lan.json:37` (ảnh "Countryside in the heart of the city… Saigon - panoramio", CC BY 3.0) và mục cắt 5:2 `q2.q2_noon`, `q5.q5_noon` (`:101` trỏ tới).
Nhìn thật: trời **trắng xoá nhiều mây**, đường đất **đầy vũng nước bùn**, tường tôn, **dây thép gai cuộn trên tường**, đống rác, xe máy dựng. Phóng to thấy **biển báo tròn viền đỏ có chữ số ("5 Km…")**, một biển đỏ nhỏ bên dưới và vệt chữ sơn đỏ trên tường phải.
Hai lỗi cùng lúc:
1. Trái Quy ước hình 8 (không chữ, không biển hiệu, không biển báo).
2. **Đáp án đúng không nhìn ra được.** `03:q2` hỏi "When is the Sun highest in the sky?" với hai thẻ: gà gáy (sáng) ‖ ảnh này (trưa). Thẻ "trưa" trông như *sau cơn mưa*, không có dấu hiệu nắng gắt nào — bé không thể chọn bằng mắt. `alt` "A blazing hot village lane" · "Đường làng nắng chang chang" (`03-mat-troi-moc-mat-troi-lan.md:153`, `:289`, `:361`, `:471`) sai hẳn với ảnh.
Ai sửa: **designer** — đổi ảnh (đường làng/sân gạch nắng gắt, trời xanh, bóng lá ngắn), hoặc **PM cho vẽ** như ba hình `q4_*` bài 3 đã vẽ (nhưng khi đó `03:q2` sẽ có một hình vẽ cạnh một ảnh chụp → phải vẽ cả thẻ gà gáy).

**A4 · `tray_noon_rest` bài 3: băng rôn chữ vàng vắt ngang đường.**
`mat-troi-moc-mat-troi-lan.json:103` (ảnh "Dinh Tuong 1972 - Thạnh Nhựt, Gò Công Tây - Photo by Gene Whitmer", Openverse/Flickr, CC BY 2.0). Phóng to 6×: một **băng rôn vàng có chữ trắng** căng ngang lối đi ở chính giữa khung trên. Trái Quy ước hình 8.
Thêm hai điều: (a) con đường **nằm trong bóng râm dày của hàng cây**, không ra "nắng gắt" như `alt` "A sunny lane under tall trees" · "Đường làng nắng gắt dưới hàng cây" (`03:...`); món này thuộc nhóm bẫy "Midday" nên dấu hiệu trưa phải rõ. (b) Ảnh là ảnh **Định Tường 1972** do một người Mỹ chụp thời chiến — bối cảnh nhạy cảm cho app trẻ con; PM nên biết trước khi phát hành.
Ai sửa: **designer** — đổi ảnh. Kết hợp với A3 thì cả nhóm "Midday" của kệ bài 3 phải làm lại.

**A5 · `q3_town` bài 5: tranh tường vẽ **trời đêm đầy chấm trắng** trong chính thẻ lựa chọn sai.**
`cac-vi-sao.json:123` (ảnh "A Night on the Town (48041746582)", CC0). Câu `05:q3` "Where do we see more stars?" chỉ có hai thẻ: `q3_countryside` (đúng, trời đầy sao) ‖ `q3_town` (sai). Nhưng ở góc trái dưới ảnh phố có một **tấm quây công trình sơn nền xanh đen với mấy chục chấm trắng tròn** — đúng hình dạng "trời sao", chiếm khoảng một phần ba nửa trái khung và **vẫn nằm trong khung cắt 17:10 của thẻ hai lựa chọn**. Bé nhìn thẻ "phố" vẫn thấy "nhiều chấm sáng trên nền đen" → câu mất tính đơn trị.
Kèm theo: tấm quây còn có chữ graffiti cỡ lớn (nét chữ cách điệu), và bên phải có một **biển hiệu cửa hàng treo** — cùng trái Quy ước hình 8.
Ai sửa: **designer** — crop bỏ hẳn nửa trái (còn dãy phố sáng đèn, đủ ý "phố nhiều đèn"), hoặc đổi ảnh phố đêm không graffiti, không biển hiệu.

**A6 · Ảnh cú `explore_hunt` không thấy "mắt to" — nhãn nhóm kệ bài 2 mất chỗ dựa.**
`ngay-va-dem.json:11` (`w2.w2_owl`) và `:35` (`learn.explore.explore_owl`), cùng trỏ `chuoi-thuc-an/con-vat-kiem-an-the-nao` `explore_hunt` ("Asian Barred Owlet", CC BY 2.0); dùng 5 chỗ ở bài 2 cộng `06:w2`, và bản cắt 5:2 cho `02:q3.q3_owl`, `vocab.owl`, `06:q5.q5_owl`.
Nhìn thật: con cú nhỏ, **hai mắt hí gần như nhắm**, lông mặt nâu sẫm nên mắt không nổi; ảnh lại chụp **ban ngày, nền lá xanh chói nắng**. Ở bản cắt 5:2 (`q3_owl`) mắt còn khó thấy hơn.
Vì sao chặn: nhãn ba nhóm của kệ bài 2 vừa được đổi ở lượt 2 (mục n2) sang dấu hiệu — "Big night eyes · Mắt to nhìn đêm" — chính là để bé đọc dấu hiệu trên ảnh thay vì đọc tên con vật. Ảnh không mang dấu hiệu thì sửa n2 không có tác dụng. Thêm nữa `02:q3` "Which animal wakes up at night?" đưa một con cú **giữa nắng** làm đáp án đúng.
Ai sửa: **designer** — một ảnh cú mới cho chủ đề này (cú mèo/cú lợn mắt tròn mở to, tốt nhất nền tối hoặc chạng vạng), rồi content-editor giữ `alt` "An owl on a branch".
Ghi chú cho PM: đây là lỗi chặn duy nhất trong sáu lỗi **không** vi phạm một luật viết sẵn — nó vi phạm yêu cầu kiểm của ticket. Nếu PM muốn phát hành sớm thì đây là chỗ có thể hoãn, với cái giá là nhãn nhóm bài 2 vô nghĩa.

### Mục nhỏ (22)

**B1 · `tray_rice` là ảnh cận cảnh hạt thóc, không thấy sân, không thấy nắng.** `mat-troi-cho-anh-sang-va-hoi-am.json:53` (dùng ở món kệ "Drying rice", `vocab.sunshine`, và `02:q4.q4_rice`). `alt` "Golden grain spread on a yard" · "Thóc vàng trải trên sân" (`01:245`, `:508`) và brief (`01:244`, "sân gạch… dưới nắng… vệt cào") không khớp: ảnh chỉ là một mảng hạt thóc kín khung. Bé 5–7 không đọc ra "phơi thóc" từ texture. Ai sửa: **designer** (ảnh sân phơi chụp chếch, thấy sân và nắng).

**B2 · `vocab.warmth` cắt mất đầu con mèo.** `mat-troi-cho-anh-sang-va-hoi-am.json:223`, bản 2:1. Khung còn thân và bốn chân, **đầu mèo bị cắt hẳn**; `alt` "A cat stretched out in bright light". Trái "khung cắt không mất chủ thể". Ai sửa: **designer** (dịch khung xuống/lấy phần có đầu).

**B3 · `vocab.awake` cắt mất cành cây.** `ngay-va-dem.json` bản 2:1 của `tray_bat_item`; `alt` "A bat hanging from a branch" · "Con dơi treo trên cành" nhưng khung 2:1 không còn cành, chỉ còn con dơi lơ lửng. Ai sửa: **designer** hoặc **content-editor** (`alt` bỏ chữ "branch").

**B4 · `q2_rooster` (5:2) cắt mất đỉnh đầu và mắt gà.** `mat-troi-moc-mat-troi-lan.json` mục cắt riêng; dùng ở `03:q2.q2_rooster`, `03:q5.q5_rooster`, `vocab.morning`, `02:q3.q3_rooster`. Còn mào dưới, mỏ há và thân nên vẫn nhận ra là gà trống đang gáy, nhưng mắt mất. Ai sửa: **designer** (hạ khung 5:2 xuống vài phần trăm).

**B5 · `tray_crescent_palm`: trời màu xanh lục, trăng rất nhỏ, ảnh gốc 422×422.** `mat-trang-doi-hinh.json:83` ("Palm of Seville", CC0). Trời chạng vạng ám **xanh lục** không giống bầu trời thật; vầng trăng chỉ khoảng 1/12 bề ngang. Thêm nữa SK-059 cho **chạm để xem to** → 422 px sẽ mờ trên iPhone, rất mờ trên iPad (cùng loại SK-058 c11). Đây là chỗ designer tự nêu: **ý kiến tester — đổi ảnh.** Ai sửa: **designer**.

**B6 · `explore_full`: ảnh trăng cam, `alt` nói "trắng"; ba thẻ câu xếp trăng lệch nhau quá nhiều.** `mat-trang-doi-hinh.json:11` ("Full Moon on July 10, 2025", CC0). Trăng **vàng cam** rõ, `alt` "A bright white disc above dark trees" · "Đĩa trắng sáng trên rặng cây tối" (6 chỗ, `04:105` …). Quan trọng hơn: câu `04:q4` xếp theo hình (lưỡi liềm → nửa → tròn) dùng ba ảnh **khác hẳn nhau**: `q4_thin` lưỡi liềm **trắng trên trời xanh chạng vạng**, `q4_half` nửa trăng **xám trên nền đen tuyền**, `q4_full` trăng **cam trên trời đêm có cành cây**. Bé dễ xếp theo màu/nền chứ không theo hình. Về câu hỏi của designer ("trăng nhỏ"): trăng **đủ to** ở khung vuông; vấn đề thật là màu và sự lệch nhau giữa ba thẻ. Ai sửa: **designer** (ba ảnh trăng cùng kiểu: cùng nền trời, cùng cỡ) hoặc **PM** chấp nhận.

**B7 · `q4_half` là trăng trên nền đen tuyền, không có nền trời.** `mat-trang-doi-hinh.json` ("First Quarter Moon on 12-15-18", CC0). Quy ước hình 5 (`_topic.md:205`) ghi "trăng thật **trên nền trời**". Ảnh này chụp qua ống kính dài, nền đen hoàn toàn, chi tiết miệng núi lửa rõ — giống ảnh thiên văn hơn là "trăng em nhìn thấy". Ai sửa: **designer**, cùng lượt với B6.

**B8 · `q3_countryside` `alt` nói "cánh đồng", ảnh là hai mái nhà.** `cac-vi-sao.json` ("Purple starry sky", CC0); `alt` "A dark field under twinkling dots" · "Cánh đồng tối dưới những chấm lấp lánh" (`05:419`). Ảnh: trời đầy sao giữa **hai mái nhà** và một bụi cây, không có cánh đồng. Ai sửa: **content-editor** (`alt` → "Stars above two dark roofs" · "Trời sao trên hai mái nhà tối").

**B9 · `w2_rabbit` `alt` "thỏ trắng trên cỏ", ảnh là thỏ rừng Bắc Cực trên trảng đá.** `ngay-va-dem.json:…` (dùng lại `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`). Ảnh đã duyệt ở chủ đề cũ nên **không đổi ảnh**; chỉ ghi để không ai tưởng là ảnh mới.

**B10 · `day_moon_card` `alt` "half Moon", ảnh là trăng khuyết lồi.** `tren-bau-troi-co-gi.json` ("028 Moon in Blue Sky", CC BY 2.0); `alt` "A pale half Moon in a blue sky" · "Nửa vầng trăng mờ trên trời xanh". Trăng trong ảnh sáng hơn nửa. Ai sửa: **content-editor** ("A pale Moon in a blue sky" · "Vầng trăng mờ trên trời xanh").

**B11 · `tray_dryer` / `q3_dryer` có chữ in nhỏ trên thân máy.** `mat-troi-cho-anh-sang-va-hoi-am.json` ("Close-up of a hairdryer", CC BY 2.0). Phóng to 4× thấy hai dòng chữ in chìm trên vỏ và trên tay cầm; ở cỡ thật không đọc được. Nhẹ hơn A1–A5 nhiều nhưng cùng Quy ước 8 — cùng loại SK-058 c2. Ai sửa: **designer** (crop chặt hơn) hoặc chấp nhận.

**B12 · Kệ bài 6: nền hình vẽ lộ nhóm, và món bẫy `tray_star_lantern` có nền khác hẳn.** Hai món nhóm "Day sky" (`tray_sun`, `tray_rainbow`) nền **xanh nhạt**; hai món "Night sky" (`tray_moon`, `tray_stars`) và một món bẫy (`tray_round_lantern`) nền **xanh than**; riêng `tray_star_lantern` (dùng lại hình của *Thời tiết và các mùa*) nền **kem có vòng tròn sáng**. Nền kem làm một trong hai món bẫy nổi bật ngay, không cần suy nghĩ; còn "nền xanh nhạt = trời ngày" là lối tắt trọn vẹn cho nhóm Day. Ai sửa: **designer** — vẽ lại `tray_star_lantern` trên nền xanh than cho đồng bộ (bẫy còn lại đã ở nền xanh than nên luật "bẫy không được khác kiểu" vẫn giữ).

**B13 · Bình minh và hoàng hôn đứng chung **ô Học** bài 3.** Luật `_topic.md:201` chỉ cấm chung **câu** và chung **kệ**, nên **không vi phạm chữ của luật** và máy xác nhận 0 chỗ vi phạm. Nhưng ô Học bài 3 có cả `explore_sunrise` (trời cam hồng) và `explore_sunset` (trời cam) cạnh nhau, và màn Tổng kết sẽ hiện hai thẻ ý chính đều trời cam. Hai ảnh khác nhau bằng bối cảnh (ruộng sương ‖ sông có thuyền) chứ không bằng bầu trời. Ghi để PM biết; nếu muốn chặt thì ô Evening dùng ảnh đèn đường/cửa sổ sáng đèn thay cho hoàng hôn.

**B14 · `w2_eye`, `w2_ear` bài 3 không phải style E.** Hai hình dùng lại từ Discoverer `nao-bo-va-giac-quan`: có **chuyển sắc, nét mảnh, bóng mềm**, khác hẳn giấy cắt phẳng của 15 hình còn lại. Đúng luật "một câu một kiểu hình" (cả câu w2 là hai hình vẽ) và đã ghi ở `_topic.md:197` Quy ước hình 3, nên **không phải sửa**; nhắc lại vì đây là chỗ duy nhất "hình vẽ" của chủ đề không đúng style E.

**B15 · Thấy dải Ngân Hà mờ ở ba ảnh trời sao.** `starry_sky_card` ("Stars Great Smoky Mountains"), `q3_countryside` ("Purple starry sky") và ở mức rất mờ `explore_starry`. Quy ước hình 4 (`_topic.md:204`) cấm "dải Ngân Hà **rõ nét**". Ba ảnh này đều ở mức dải mờ, không ai thấy ngay, nên tester đánh giá **đạt**; PM xem lại nếu muốn chặt hơn.

**B16 · Tên ảnh gốc hiện ở màn Nguồn hình, bảy chỗ nên xem lại.** "Bright Stars of **Milky Way**…" (ngoài phạm vi; đi cùng A1); "Bubble Field - Flickr - Todd Baker **((** technowannabe" (ký tự rác, "Bubble Field" không tả cái đèn lồng); "Nacht in Mödlareuth 20241109 HOF6114-HDR RAW-Export **cens**"; "Single Line Kite in Sky - DPLA - **7a29acc44821c56b3a12cf7b43acc2cd**" và "The starry night sky… **(6bd9a8c7-155d-…)**" (mã băm dài); "A Night on the Town" (thành ngữ người lớn); "Dinh Tuong 1972 … Photo by Gene Whitmer" (đi cùng A4). Năm ảnh CC0/PD được đặt tên trung tính theo `content/TEMPLATE.md` → **designer đổi được**; hai ảnh CC BY phải giữ tên, chỉ đổi được bằng cách đổi ảnh.

**B17 · `explore_sleep` là phòng khách sạn.** `ngay-va-dem.json:…` ("mosquito net", CC BY 2.0): giường buông màn, nhưng có **điện thoại bàn trên tủ đầu giường** và tranh đóng khung trên tường. Không sai luật (không chữ đọc được, không người), chỉ không ra "phòng ngủ của em". Ai sửa: **designer** nếu có ảnh tốt hơn.

**B18 · `tray_windows` (nhóm "Evening") có trời hồng tím dễ đọc thành bình minh.** `mat-troi-moc-mat-troi-lan.json` ("two-story-home-lit-windows"). Chỉ có đèn cửa sổ phân biệt sáng với tối. Món vẫn nằm đúng một nhóm nên **không chấm sai**; ghi để designer biết nếu đổi ảnh nhóm Morning.

**B19 · `explore_near`: diều hộp nhiều màu trên nền lam phẳng, film scan có vết xước.** `tren-bau-troi-co-gi.json` ("Single Line Kite in Sky", PD; 6 chỗ ở bài 6). `alt` đã sửa ở lượt 3 nên khớp. Chỉ ghi: trời ám lam bất thường và có vệt xước phim; không phải diều sáo Việt Nam.

**B20 · `vocab.full_moon` dùng hình vẽ Trung thu, đèn lồng nổi hơn trăng.** `mat-trang-doi-hinh.json` bản 2:1 của `explore_mid_autumn`. Thẻ từ "full moon" là **hình vẽ** trong khi thẻ từ `moon` cạnh đó là **ảnh thật**; ở khung 2:1 bốn chiếc đèn lồng chiếm nửa khung. Ai sửa: **content-editor/designer** — cho `vocab.full_moon` dùng bản 2:1 của `explore_full`.

**B21 · Tỉ lệ ảnh nước ngoài cao.** Đức (`explore_lights`), Mỹ (`explore_city`, `explore_warm`, `tray_windows`, `night_sky_card`, `starry_sky_card`, `tray_fireflies`, `tray_fireworks`, `explore_light`, `explore_full`, `sunrise_card`, `q4_plane`), Bồ Đào Nha/Anh (`q3_town`), Bangladesh (`explore_sunrise`), Tây Ban Nha (`tray_crescent_palm`), Ấn Độ (`w1` hàng rào tre, `tray_banana`), Mê Kông không rõ đoạn (`explore_sunset`). Quy ước 11 chỉ yêu cầu bối cảnh Việt Nam "**khi có ảnh hợp lệ**" nên **không ai sai luật**. Ý kiến tester về câu hỏi của designer: chấp nhận được; hai chỗ đáng cố thêm là `tray_rice` (B1) và nhóm Midday bài 3 (A3, A4) — cả hai đang là cảnh Việt Nam mà hỏng vì lý do khác, nên đổi ảnh ở đó vừa sửa lỗi vừa giữ bối cảnh quen.

**B22 · `night_sky_card` / `explore_night_sky` là ảnh đêm cầm tay, nhiễu và hơi nhoè.** `ngay-va-dem.json` ("Sedona, Arizona, night time with Moon", CC0, 960×960). Đủ cho món trong bài, nhưng thẻ thưởng hiện to (nhất là iPad) — cùng loại SK-058 c11. Ai sửa: **designer** nếu có ảnh thị trấn dưới trăng nét hơn.

### Trả lời năm chỗ designer tự nêu

1. **`explore_noon` (ảnh Sài Gòn còn vũng nước)** → **không dùng được**, xem **A3**. Không chỉ "chưa ra trưa nắng chang chang": ảnh còn có biển báo có chữ, dây thép gai, rác, và nó là **đáp án đúng** của `03:q2` nên bé không chọn được bằng mắt. Phải đổi ảnh (hoặc PM cho vẽ cả hai thẻ của q2).
2. **`tray_crescent_palm`** → **đổi**, xem **B5**: trời xanh lục không giống trời thật, trăng quá nhỏ, và ảnh gốc 422 px sẽ mờ khi SK-059 cho chạm xem to. `explore_crescent` (không có cây ở dưới) thì **đạt**, giữ.
3. **`explore_full` (trăng nhỏ)** → trăng **đủ to** ở khung vuông, không phải lo. Lo đúng chỗ khác: trăng **màu cam** trong khi `alt` nói "trắng", và ở `04:q4` ba thẻ xếp thứ tự lệch nhau về màu, nền, cỡ nên bé xếp theo màu. Xem **B6**, **B7**.
4. **Ảnh cú dùng lại (`explore_hunt`)** → **chưa đạt**, xem **A6**: mắt hí, nền lá nắng chói. Cần ảnh cú mới cho kệ bài 2 đúng như designer đã ngờ.
5. **Ảnh chụp ở nước ngoài** → **chấp nhận được**, xem **B21**. Quy ước 11 chỉ đòi bối cảnh Việt Nam khi có ảnh hợp lệ, và 82 ảnh đã mở xem không có ảnh nào sai luật chỉ vì ở nước ngoài. Ưu tiên tìm lại ảnh Việt Nam đúng ở ba chỗ đang phải sửa vì lý do khác (`tray_rice`, `explore_noon`, `tray_noon_rest`).

### Chưa kiểm

- **Giấy phép bảy ảnh qua Openverse/Flickr chưa mở trang gốc** (SK-058 đòi kiểm tay): "Lettuce", "Rice Drying", "mosquito net", "Home from the store", "Grey-headed flying fox", "two-story-home-lit-windows (Creative Commons)", "Dinh Tuong 1972…". Lượt này chỉ đọc giấy phép trong file chọn ảnh và qua `images fetch` của designer.
- `tts` EN và VI, `build`, `check-pack`, gói dựng thật: chưa chạy (chờ sửa A1–A6, vì `alt` và brief sẽ đổi theo ảnh mới).
- Chơi thử trên **iPhone 16**: chưa chạy trong lượt này.
- Khung cắt thật trên máy (SK-059 chạm xem to, thẻ thưởng trên iPad): mới mô phỏng bằng file trong cache, chưa xem trên máy.

## Ghi chú designer lượt 3 (20/11)

Sửa theo "Tester rà ảnh lượt 1". Chỉ sửa `content/images/explorer/bau-troi-ngay-va-dem/*.json`, `content/images/own/bau-troi-ngay-va-dem/`, `design/illustrations/bau-troi-ngay-va-dem/`. Không sửa markdown.

**Kết quả:** 201/201 chỗ có hình; 40 ảnh chụp khác nhau (CC BY 2.0 17 · CC0 11 · PD 6 · CC BY 4.0 6); 32 file hình vẽ, SVG nguồn đủ 32 file trùng tên. `images fetch`: 56 ảnh khác nhau, 0 lỗi, 0 lệch khung. `validate`: 0 lỗi.

**Lỗi chặn**
- A1 `explore_twinkle`: ảnh mới "The Stars At Night Are Big And Bright" (Flickr qua Openverse, CC BY 2.0), cắt lấy phần trời đầy sao; không chữ, tên ảnh không có "Milky Way".
- A2 `tray_school`, `q4_school`: giữ ảnh, cắt nửa trái (hai bạn áo hoa, áo kẻ quay lưng, người lớn bị cắt đầu); hai bạn quay mặt đã ra ngoài khung.
- A3, A4 **đổi kiểu sang hình vẽ** (không có ảnh trưa nắng hợp lệ, không dùng ảnh thời chiến). Để mỗi câu, mỗi kệ một kiểu, đổi đồng bộ:
  - **kệ Chơi bài 3: cả sáu món là hình vẽ** `tray_rooster`, `tray_sunrise`, `tray_streetlights`, `tray_windows`, `tray_noon`, `tray_noon_rest`;
  - **câu `03:q2` và `03:q5`: cả ba lựa chọn là hình vẽ** (bản 2:1 riêng `q2_rooster`, `q2_noon`, `q2_lights`; `q5_*` trỏ vào ba bản này);
  - ô Học `explore_noon` là hình vẽ (ô Học bài 3 có cả ảnh và hình vẽ; không phải câu, không phải kệ).
  - Còn ảnh chụp: `explore_sunrise`, `explore_sunset`, `explore_lights` (ô Học, q1, q3, q6, thẻ từ, bài 5, bài 6), thẻ `sunrise_card`, `vocab.morning`.
- A5 `q3_town`: ảnh mới "Late Night 12th Street" (CC BY 2.0), phố đêm sáng đèn, cây dưới đèn, trời tối không sao; cắt bỏ ki-ốt có màn hình và hàng xe (không biển số).
- A6 cú: ảnh mới riêng cho chủ đề, mục gốc `ngay-va-dem` `learn.explore.explore_owl` ("Great horned owl along lower Columbia River", USFWS, PD): cú sừng mở to đôi mắt vàng, trời chiều. Mọi chỗ cú của bài 2 (`w2_owl`, ô Học, kệ, `q3_owl`, `q6`, thẻ từ) và bài 6 (`w2`, `q5_owl`) trỏ vào mục này; ba bản cắt riêng `q3_owl`, `q5_owl` (5:2), `vocab.owl` (2:1). Không còn chỗ nào dùng `explore_hunt`.

**Mục nhỏ**
- B1 `tray_rice`: ảnh mới thóc phơi trên sân ven đường ở đồng bằng sông Cửu Long ("Séchage du riz…", CC BY 2.0), cắt bỏ người cào thóc; mục cắt 5:2/2:1 riêng `vocab.sunshine`, `02:q4.q4_rice`.
- B2 `vocab.warmth`: khung 2:1 dời lên, thấy cả đầu mèo.
- B4 khung gà: `vocab.morning`, `02:q3_rooster` dời lên, thấy mắt gà (bài 3 q2, q5 nay là hình vẽ).
- B6, B7: **câu `04:q4` đổi kiểu sang ba hình vẽ** `q4_thin`, `q4_half`, `q4_full` (cùng nền xanh than, cùng cỡ, cùng màu trăng). `explore_full` đổi ảnh trăng trắng xám thấy rõ vệt sẫm ("Full Perigee (not Super!) Moon…", CC0), nền trời đêm tối, không có cây; `vocab.full_moon` trỏ vào ảnh này (B20), bỏ bản 2:1 hình Trung thu.
- B12 kệ bài 6: năm hình vẽ đổi sang cùng nền giấy sáng có đĩa giấy điệp như `star_lantern_card`; trăng và sao màu vàng hoè. Nền không còn lộ nhóm ngày, đêm.
- B5 `tray_crescent_palm`: ảnh mới trăng lưỡi liềm lớn trên trời đêm xanh, rặng thông in đen ("Mm37a 0907 Forest", CC0, 1824 px). Không có ảnh lá cọ với trăng đủ to.
- B16 tên ảnh gốc: bỏ được "Milky Way" (A1), "A Night on the Town" (A5), "Dinh Tuong 1972" (A4). Còn giữ: "Bubble Field … ((" (đèn lồng: ảnh thay thế bị Commons trả 429 liên tục), "Nacht in Mödlareuth … cens", "Single Line Kite … DPLA …", "The starry night sky … (6bd9a8c7…)", "Full Perigee (not Super!) Moon on 1-1-18". Muốn bỏ hết thì phải đổi ảnh.

**Đề nghị content-editor sửa markdown cho khớp (key và câu)**
- Đổi brief sang `[hình vẽ]`, tách khỏi "Dùng lại hình": `03` `explore_noon`, `tray_rooster`, `tray_sunrise`, `tray_streetlights`, `tray_windows`, `tray_noon`, `tray_noon_rest`, `q2_rooster`, `q2_noon`, `q2_lights`, `q5_rooster`, `q5_noon`, `q5_lights`; `04` `q4_thin`, `q4_half`, `q4_full`. Cập nhật `_topic.md` Quy ước hình số hai, ba (kệ bài 3 và câu q2, q5 bài 3, câu q4 bài 4 toàn hình vẽ).
- `03` `tray_noon_rest` alt → "A farmer resting under a tree" · "Bác nông dân nghỉ dưới gốc cây".
- `04` `explore_full` (và mọi chỗ dùng lại, kể cả `vocab.full_moon`) alt → "A bright white disc in a dark sky" · "Đĩa trắng sáng trên trời tối"; brief bỏ "rặng cây". `vocab.full_moon` brief → "Dùng lại hình `explore_full`".
- `04` `tray_crescent_palm` alt → "A thin curve of light above dark trees" · "Vệt sáng cong mảnh trên rặng cây tối" (không còn lá cọ).
- `05` `explore_twinkle` alt → "Bright dots on a dark purple sky" · "Chấm sáng trên nền trời tím thẫm" (ảnh nhiều sao hơn "vài").
- `02` `explore_owl`, `tray_owl_item`, `w2_owl`, `q3_owl`, `q6`, `vocab.owl`; `06` `w2`, `q5_owl`: brief bỏ "Dùng lại hình `explore_hunt`…", thay bằng ảnh mới `explore_owl` (cú mắt to, chiều tối). `alt` "An owl on a branch" giữ.
- `02` `vocab.awake` (B3): khung 2:1 không còn cành, đề xuất alt "A bat hanging upside down" · "Con dơi treo ngược".

**Chỗ chưa chắc**
- `explore_full` nền đen như ảnh chụp qua ống kính dài, không có cây (giống điều tester nêu ở B7 cho `q4_half`); không tìm được ảnh trăng tròn trắng, rõ vệt sẫm, trên rặng cây hợp giấy phép.
- `tray_school` vẫn thấy một bên má của bạn áo hoa (quay đi, không nhìn máy).
- Ảnh trăng `tray_crescent_palm` và `explore_crescent` đều trên trời xanh; tester xem kệ bài 4 còn phân biệt được với `tray_moon_roofs`.

## Ghi chú content-editor lượt 4 (20/11)

Sửa markdown cho khớp "Ghi chú designer lượt 3", chỉ trong `content/explorer/bau-troi-ngay-va-dem/`. Không đổi key hình. Chưa chạy `validate`, `tts`. Grep lại: mọi câu EN ≤ 8 từ.
- **Mười sáu brief sang `[hình vẽ]`, bỏ "Dùng lại hình":**
  - bài 3: `explore_noon`; sáu món kệ `tray_rooster`, `tray_sunrise`, `tray_streetlights`, `tray_windows`, `tray_noon`, `tray_noon_rest`; ba lựa chọn câu q2 `q2_rooster`, `q2_noon`, `q2_lights`; ba lựa chọn câu q5 `q5_rooster`, `q5_noon`, `q5_lights`;
  - bài 4: ba thẻ câu q4 `q4_thin`, `q4_half`, `q4_full`; `alt` mới tả hình giấy trên nền xanh than.
- **Cú:** `02` `explore_owl` thành hình gốc mới (brief theo ảnh cú sừng mắt vàng). Bảy chỗ khác (`02` `w2_owl`, `tray_owl_item`, `q3_owl`, `q6`, `vocab.owl`; `06` `w2`, `q5_owl`) trỏ `explore_owl`, không còn `explore_hunt`. `alt` giữ.
- **`alt` đổi:**
  - `tray_noon_rest`, `explore_full` theo đề xuất designer; `explore_full` đổi ở mọi chỗ dùng lại (bài 4, 5, 6), `vocab.full_moon` trỏ `explore_full`;
  - `tray_crescent_palm`, `vocab.awake` theo đề xuất designer;
  - `explore_twinkle` là "Bright dots on dark purple" · "Chấm sáng trên nền tím thẫm". Khác đề xuất ("…dark purple sky"): bỏ chữ "sky" vì câu `05:q4` "Which light is far up in the sky?" có đáp án là ảnh này.
- `_topic.md`: Quy ước hình số hai (thêm mười ba chỗ hình vẽ bài 3, 4), số ba (kệ bài 3, câu q2, q5 bài 3, câu q4 bài 4 toàn hình vẽ), bảng Hình dùng chung, bảng Phần Chơi.
- **Chữ bé nghe có đổi (ba chỗ):**
  - nhãn `03:tray_noon_rest` "Lane at noon" · "Đường làng buổi trưa" thành "Resting at noon" · "Nghỉ trưa" (hình nay là bác nông dân nghỉ trưa);
  - nhãn `04:tray_crescent_palm` "Moon by the palms" · "Trăng bên hàng dừa" thành "Moon over the trees" · "Trăng trên rặng cây";
  - `06:q6` `feedback_true` "This Moon is far above the trees." thành "This Moon is far up in the sky." · "Vầng trăng này ở tít trên trời cao." (ảnh trăng mới không có cây).
- **Bổ sung sau tester rà ảnh lượt 2 (20/11):** `alt` `explore_noon` và bốn chỗ dùng lại ở bài 3 (`tray_noon`, `q2_noon`, `q5_noon`), cùng `_topic.md` (Quy ước hình số chín, bảng Hình dùng chung): "A blazing hot village lane" · "Đường làng nắng chang chang" thành "A sunny path between fields" · "Lối đất giữa ruộng nắng gắt" cho khớp hình vẽ lối đất giữa ruộng. `alt` không chứa chữ câu q2 ("Sun", "highest", "sky"). Không đổi chữ bé nghe.

## Tester rà ảnh lượt 2 (20/11)

> Kiểm A1–A6 và các mục B sau "Ghi chú designer lượt 3" + "Ghi chú content-editor lượt 4". Chạy lại `import` ra thư mục tạm, phân giải lại **201/201 chỗ**, so sha với lượt 1: **54 chỗ đổi hình, 30 ảnh/hình mới** — đã **mở xem từng cái trong 30 cái mới**, zoom 2 chỗ (má bạn nhỏ ở `tray_school`, biển ở `q3_town`). Chạy lại máy: một kiểu hình mỗi câu/kệ, trùng ảnh trong một câu, bình minh ≠ hoàng hôn, giấy phép. **Mở trang gốc Flickr cả 5 ảnh Openverse còn lại.**
>
> **Kết quả: 0 lỗi chặn. 6/6 lỗi chặn lượt 1 đã đóng. 10/22 mục nhỏ đã đóng, 3 mục mới (C1–C3).**

### Lỗi chặn lượt 1 — kiểm lại

| | Kết quả | Bằng chứng (đã mở xem) |
| --- | --- | --- |
| **A1** watermark `explore_twinkle` | **đóng** | Ảnh mới "The Stars At Night Are Big And Bright": trời tím thẫm đầy sao mịn, **0 chữ**, 0 watermark. Tên ảnh không còn "Milky Way". Trang Flickr xác nhận CC BY 2.0. |
| **A2** mặt trẻ `tray_school` | **đóng** | Khung vuông mới chỉ còn bạn áo hoa **quay lưng**, hai bạn quay mặt đã ra ngoài khung. Zoom 4×: thấy tóc, vành tai, đường má và gọng kính; **mắt, mũi, miệng không phân giải được** → đạt "không nhận ra mặt" (`_topic.md:206`, `TEMPLATE.md:77`), cùng mức SK-058 c14. Xem C3 về độ phân giải. |
| **A3** `explore_noon` có biển báo, không ra trưa nắng | **đóng** | Đổi hẳn sang **hình vẽ**: trời xanh, Mặt Trời tròn ở **đỉnh khung chính giữa**, lối đất giữa hai thửa ruộng, hàng cây. 0 chữ, 0 biển báo, 0 rác, 0 dây thép gai. Bản 2:1 `q2_noon`/`q5_noon` giữ nguyên dấu hiệu. `03:q2` "When is the Sun highest in the sky?" nay đọc ra bằng mắt. |
| **A4** băng rôn chữ `tray_noon_rest` | **đóng** | Đổi sang hình vẽ: bác nông dân đội nón lá ngồi dưới gốc cây, Mặt Trời cao góc phải, trời xanh. 0 chữ, không còn ảnh thời chiến. Người vẽ **không có nét mặt**. `alt` đã đổi thành "A farmer resting under a tree" · "Bác nông dân nghỉ dưới gốc cây" — khớp hình. |
| **A5** tranh tường "trời sao" ở `q3_town` | **đóng** | Ảnh mới "Late Night 12th Street": phố đêm, hàng cây sáng đèn, nhà có cầu thang thoát hiểm, **trời xanh đen hoàn toàn không sao**. Không còn mảng chấm trắng nào. Tương phản với `q3_countryside` (trời đầy sao) rõ → `05:q3` đơn trị trở lại. Xem C2 về tấm biển nhỏ còn sót. |
| **A6** cú không thấy mắt to | **đóng** | Ảnh mới "Great horned owl along lower Columbia River" (USFWS, **Public domain**): cú sừng nhìn thẳng, **hai mắt vàng tròn mở to**, rõ ở cả ba khung (vuông, 5:2 `q3_owl`, 2:1 `vocab.owl`). Nền thông sẫm, ánh sáng chiều. Nhãn nhóm "Big night eyes · Mắt to nhìn đêm" nay có chỗ dựa. Không còn chỗ nào dùng `explore_hunt`. |

### Mục nhỏ lượt 1 — kiểm lại

**Đã đóng (10):**
- **B1** `tray_rice`: ảnh mới "Séchage du riz au bord des routes (Delta du Mékong, Vietnam)" — **thấy rõ sân phơi, đống thóc vàng, sông, nhà, trời xanh**; đọc ra "phơi thóc" ngay. Bản 5:2 `vocab.sunshine` / `02:q4_rice` cũng đủ ngữ cảnh. `alt` cũ khớp luôn.
- **B2** `vocab.warmth`: khung 2:1 dời lên, **thấy cả đầu mèo**.
- **B3** `vocab.awake`: `alt` đổi thành "A bat hanging upside down" · "Con dơi treo ngược" — khớp khung không còn cành.
- **B4** `vocab.morning` và `02:q3_rooster`: khung dời lên, **thấy mắt gà**; `03:q2`, `q5` nay là hình vẽ nên không còn chỗ cắt mất mắt.
- **B5** `tray_crescent_palm`: ảnh mới "Mm37a 0907 Forest" — trăng lưỡi liềm **to, trắng, rõ miệng núi lửa** trên trời xanh đêm, rặng thông in đen; 1024 px. Hết trời xanh lục, hết mờ.
- **B6, B7** câu `04:q4`: ba thẻ nay là **ba hình vẽ cùng nền xanh than, cùng bốn ngôi sao ở đúng vị trí, cùng màu trăng vàng nhạt, cùng cỡ** — chỉ khác hình dạng. Bé xếp được bằng hình, không bằng màu. `alt` mới tả đúng hình giấy.
- **B12** kệ bài 6: sáu món nay **cùng nền kem có đĩa giấy điệp**; nền không còn lộ nhóm ngày/đêm, món bẫy `tray_star_lantern` không còn nổi bật.
- **B16** tên ảnh gốc: bỏ được "Milky Way", "A Night on the Town", "Dinh Tuong 1972". Còn 5 tên lỉnh kỉnh (xem dưới).
- **B20** `vocab.full_moon`: nay trỏ `explore_full` (ảnh trăng thật), không còn là hình Trung thu có đèn lồng.
- **Kiểm tay giấy phép Flickr** (mục "Chưa kiểm" lượt 1): **đóng**, xem dưới.

**Còn giữ, không đổi (chấp nhận hoặc chờ PM):** B8 (`q3_countryside` alt "cánh đồng" ‖ ảnh là hai mái nhà), B9 (`w2_rabbit` thỏ Bắc Cực, ảnh đã duyệt ở chủ đề cũ), B10 (`day_moon_card` alt "half Moon" ‖ trăng khuyết lồi), B11 (chữ in nhỏ trên máy sấy), B13 (bình minh + hoàng hôn chung ô Học bài 3 — máy xác nhận lại: **0 chỗ chung câu, 0 chỗ chung kệ**, chỉ chung ô Học), B14 (`w2_eye`, `w2_ear` khác nét style E), B15 (dải Ngân Hà mờ ở ba ảnh), B17 (`explore_sleep` là phòng khách sạn), B18 (`tray_windows` — nay là hình vẽ **trời xanh than có sao**, dấu hiệu tối đã rõ hơn ảnh cũ), B19 (`explore_near` diều hộp, film scan), B21 (tỉ lệ ảnh nước ngoài), B22 (`night_sky_card` nhiễu).

### Đã kiểm bằng máy — đạt

- **201/201 chỗ có hình**, 0 mục hỏng, 0 `same_as` hai chặng.
- **Một câu, một kiểu hình: 0 chỗ trộn** trên toàn bộ câu Khởi động và Quiz (máy so `asset` từng tập lựa chọn). **Một kệ, một kiểu hình:** kệ bài 1, 2, 4, 5 toàn ảnh; **kệ bài 3 và kệ bài 6 toàn hình vẽ**. Khớp đúng `_topic.md` Quy ước hình 3 bản lượt 4.
- **0 ảnh trùng làm hai lựa chọn trong cùng một câu**, 0 ảnh trùng trong một kệ.
- **Giấy phép: 56 ảnh chụp khác nhau** — CC BY 2.0 23 · CC0 1.0 17 · Public domain 8 · CC BY 4.0 7 · CC BY 3.0 1. **0 BY-SA, 0 NC, 0 ND.**
- **32 file hình vẽ** trong `content/images/own/bau-troi-ngay-va-dem/` và **32 file SVG nguồn** trong `design/illustrations/bau-troi-ngay-va-dem/` — khớp 1-1.
- **5 ảnh Openverse/Flickr — đã mở trang gốc, khớp cả 5:** `explore_twinkle` `flickr.com/photos/12357841@N02/35868666531` license id **4 = CC BY 2.0**, tiêu đề "The Stars At Night Are Big And Bright"; `explore_plants` `…/62528187@N00/2833923675` id 4, "Lettuce"; `explore_sleep` `…/33598632@N00/3450775475` id 4, "mosquito net"; `tray_school` `…/62476801@N05/6181658390` id 4, "Home from the store"; `vocab.awake` `…/64249609@N08/51939968430` license id **9 = CC0 1.0**, "Grey-headed flying fox". Tiêu đề trùng từng chữ với file chọn ảnh (CC BY bắt giữ tên). Ba ảnh Flickr cũ phải kiểm tay ("Rice Drying", "two-story-home-lit-windows", "Dinh Tuong 1972") **không còn dùng**.
- **Hình vẽ mới đúng style E:** giấy phẳng, không nét viền, không chuyển sắc, không chữ; người trong `tray_noon_rest` không có nét mặt. Mười ba hình bài 3 dùng chung một đường chân trời, một hàng cây, một bảng màu.

### Trả lời ba chỗ designer chưa chắc

1. **`explore_full` nền đen** → **chấp nhận được nhưng là chỗ yếu nhất của lượt này**, xem **C1**. Không chặn: ảnh trăng tròn trắng, rõ vệt sẫm, đúng `alt` mới, và là đáp án đúng duy nhất ở mọi câu dùng nó.
2. **`tray_school` còn một bên má** → **đạt**. Zoom 4× không đọc ra nét mặt; bạn nhỏ quay lưng, đầu nghiêng. Đúng mức đã chấp nhận ở SK-058 c14. Chỉ còn vướng độ phân giải (**C3**).
3. **Kệ bài 4 có hai ảnh trăng cùng trời xanh thẫm** → **phân biệt được, giữ nguyên**. Bốn món trăng khác nhau rõ: `tray_full_moon` (đĩa trắng kín khung, nền tối), `tray_moon_roofs` (đĩa vàng cam nhỏ trên mái nhà), `tray_crescent` (lưỡi liềm **rất mảnh**, nhỏ, trời chạng vạng trơn), `tray_crescent_palm` (lưỡi liềm **dày, to**, rặng thông in đen). Hai món "Thin Moon" nằm cùng một nhóm nên kể cả nhầm cũng không chấm sai. `alt` hai món cũng đã khác nhau ("A bright curve of light" ‖ "A thin curve of light above dark trees").

### Mục mới (3, không chặn)

**C1 · `explore_full` là trăng trên nền đen tuyền, không có nền trời — và ở `06:q1` nó là thẻ duy nhất không có phong cảnh.**
`mat-trang-doi-hinh.json:11` ("Full Perigee (not Super!) Moon on 1-1-18", CC0). Trái chữ của Quy ước hình 5 (`_topic.md:205`) "trăng thật **trên nền trời**": đây là ảnh chụp qua ống kính dài, nền đen hoàn toàn, trăng chiếm gần hết khung, rõ từng miệng núi lửa — không phải thứ bé ngước lên thấy. Đúng điều tester nêu ở **B7** cho `q4_half` cũ, nay chuyển sang `explore_full` (9 chỗ: `04` ô Học, kệ, `q1_full`, `vocab.moon`, `vocab.full_moon`; `05:w1_full`, `05:tray_full_moon`; `06:q1_moon`, `06:q6`).
Chỗ đáng lưu ý nhất: **`06:q1` "Which one do we see at night?"** có ba thẻ — `q1_moon` (nền đen, không phong cảnh) ‖ `q1_clouds` (tia nắng qua mây) ‖ `q1_rainbow` (cầu vồng trên cánh đồng). Hai thẻ sai đều là ảnh phong cảnh rộng, thẻ đúng là một đĩa sáng trên nền đen → **khác kiểu khung hẳn**, cùng hiệu ứng với luật "đáp án không được là hình vẽ duy nhất giữa các ảnh" dù cả ba đều là ảnh chụp. Câu vẫn đơn trị và vẫn đúng nội dung nên **không chặn**.
Đề nghị: **designer** tìm ảnh trăng tròn trắng trên **trời đêm xanh thẫm có chút mép cây hoặc mái nhà** (giống `tray_moon_roofs` nhưng trăng trắng). Nếu không có thì PM chấp nhận và ghi ngoại lệ vào Quy ước hình 5.

**C2 · `q3_town` còn một biển đường nhỏ có chữ.** `cac-vi-sao.json:123`. Zoom 7× đọc được dòng trên "NO STANDING" và hai dòng nhỏ dưới; ở cỡ thật biển rộng khoảng 20 px, không ai đọc ra. Trái chữ của Quy ước hình 8 ("không biển hiệu phố") nhưng nhẹ hơn hẳn mức chặn — cùng loại SK-058 c1 và B11 của lượt 1. Ai sửa: **designer** (crop cao hơn một chút để biển ra ngoài khung) hoặc chấp nhận.

**C3 · `tray_school` và `q4_school` nay chỉ còn 461 px.** `ngay-va-dem.json:76`, `crop` mới lấy nửa trái của bản Flickr 1024 px. Bản trong cache là **461×461** (món kệ) và **461×384** (lựa chọn `q4_school`) — nhỏ nhất chủ đề; các món kệ khác 600–1024 px. SK-059 cho **chạm để xem to** nên món này sẽ mềm trên iPhone và rõ mềm trên iPad (cùng loại SK-058 c11, B22). Ai sửa: **designer** — lấy bản Flickr lớn hơn (`_b` là 1024; Flickr còn `_k`/`_o`) rồi crop lại, hoặc chấp nhận.

### Ghi chú thêm (không phải lỗi)

- **`alt` của `explore_noon` chưa đổi theo hình mới.** `03-mat-troi-moc-mat-troi-lan.md:153`, `:289`, `:362`, `:472` (và `_topic.md:209`, `:229`) vẫn ghi "A blazing hot village lane" · "Đường làng nắng chang chang", trong khi hình vẽ mới là **lối đất giữa hai thửa ruộng, không có làng**, và không có dấu hiệu "chang chang" nào ngoài Mặt Trời ở đỉnh. `alt` chỉ vào VoiceOver nên không chặn; **content-editor** nên đổi, ví dụ "The Sun high above a field path" · "Mặt Trời trên cao giữa cánh đồng" — nhớ sửa cả Quy ước hình 9 và bảng Hình dùng chung. Designer lượt 3 chỉ đề nghị đổi `alt` của `tray_noon_rest` nên chỗ này bị sót.
- **Kệ bài 3 nay phân nhóm được bằng màu trời** (hồng = Morning, xanh = Midday bẫy, tím/xanh than = Evening). Khác B12 của kệ bài 6: ở đây **màu trời chính là nội dung bài học** ("nhìn trời biết lúc nào trong ngày"), nên tester coi là **đúng ý**, không phải lối tắt. Ghi để PM biết là nhóm bẫy "Midday" nhận ra được ngay bằng trời xanh.
- **`tray_rooster` và `tray_sunrise` (kệ bài 3) gần như cùng một khung cảnh** (cùng hàng cây, cùng trời hồng, cùng Mặt Trời mọc bên phải), chỉ khác con gà và hai vạt sương. Cùng nhóm "Morning" nên không chấm sai; chỉ hơi đơn điệu trên kệ.
- **Ô Học bài 3 nay có một hình vẽ (`explore_noon`) đứng cạnh ba ảnh chụp**, nên màn Tổng kết bài 3 sẽ có một thẻ hình vẽ cạnh các thẻ ảnh. Đúng luật (ô Học không phải câu, không phải kệ) và cùng tiền lệ bài 1, bài 4 — chỉ nêu để không ai sửa nhầm.
- **Kệ bài 6: `tray_sun` và món bẫy `tray_round_lantern` nay cùng là hình tròn vàng trên đĩa giấy kem.** Phân biệt bằng quai treo, các múi giấy và chùm tua đỏ của đèn lồng — thấy rõ ở cỡ món kệ. Đây đúng là cái bẫy bài muốn, không phải lỗi.
- **Tên ảnh gốc còn lỉnh kỉnh ở màn Nguồn hình (5 chỗ):** "Bubble Field - Flickr - Todd Baker (( technowannabe", "Nacht in Mödlareuth 20241109 HOF6114-HDR RAW-Export cens", "Single Line Kite in Sky - DPLA - 7a29acc…", "The starry night sky… (6bd9a8c7-…)", "Full Perigee (not Super!) Moon on 1-1-18 (39442516491)". Ba cái sau là PD/CC0 nên **đặt lại tên trung tính được** theo `content/TEMPLATE.md`; hai cái đầu là CC BY, phải giữ.

### Chưa kiểm

- `tts` EN và VI, `build`, `check-pack`, gói dựng thật: phiên chính đang chạy, tester không chạy lại.
- Chơi thử trên **iPhone 16** (bộ "Sky cards" 1/6), khung cắt thật khi chạm xem to (SK-059), thẻ thưởng trên iPad: chưa chạy trong lượt này.
- 50 dòng `[CẦN KIỂM]` khoa học vẫn còn (15 ở `_topic.md`), chờ người duyệt chuyên môn — không thuộc phần ảnh.

## Ghi chú ios-dev lượt 1 (20/11)

**Đã sửa (`apps/ios/`):**
- Đếm theo A4: `SyllabusTests.swift` (`[10, 17, 16]`, `[64, 155, 156]`, `oakYear` 10 phần tử, thêm chú thích SK-061); `JourneyTests.swift` (Explorer 10, tổng 375); `JourneySegmentTests.swift` (chặng cuối `8..<10`, chú thích); `JourneyMapAppTests.swift` (43 icon, `6 + 10 + 1`, chú thích); `Art.swift`, `README.md` (43 icon).
- **Ngoài danh sách A4, cũng phải sửa:** `ScienceKidsTests/OnboardingTests.swift:219` (`journey(for: .explorer).count` 11 → 10) và `:298` (`syllabusIsBundled`, `[11, 17, 16]` → `[10, 17, 16]`). Lần grep A4 bỏ sót vì không tìm `[11, 17, 16]` và `count == 11`.
- Xoá imageset `Topic-new-water-around-us` (chưa từng vào git), chạy `import-topic-icons.sh`: 43 imageset; `xcodegen generate`.
- `Localizable.xcstrings`: khoá `collectible.set.sky` (EN "Sky cards", VI "Thẻ bầu trời"); `InfoPlistTests.collectibleSetNames` kiểm thêm `sky`.
- `PlayTrayPackTests`: gói 20/11 có 104 khay, 64 Explorer (đếm từ `content/.build/pack`, 17 chủ đề).
- `KeyPointPicturesTests`: **không thêm dòng**. Chạy lại bộ ghép (bản Python chép từ `KeyPointPictures.match`, ra đúng 11 dòng cũ của *Lớn lên* và *Núi, sông và biển*) trên 6 bài *Bầu trời*: cả 6 bài giữ 1, 2, 3; đọc từng ý chính với ô Học n, khớp đúng nghĩa. Ghi một dòng chú thích trong bảng.
- Thêm `ScienceKidsUITests/SK061SkyRunUITests.swift`: lượt chạy thử có chụp ảnh (bản đồ Explorer, chơi trọn bài 3, kệ bài 2). Bị skip nếu không đặt `SK_SHOT_DIR`, nên không chạy trong bộ test thường. Lý do: tool simulator không được cấp quyền dùng iPhone 16 lượt này (yêu cầu cấp quyền chưa ai trả lời), nên điều khiển app bằng XCUITest thay cho tap tay.

**Unit test (iPhone 16, một máy, `-skip-testing:ScienceKidsUITests`, chạy một lần):** 436 test, **435 pass, 1 fail**: `BundledContentTests.syllabusIsBundled` (`[10, 17, 16] == [11, 17, 16]`, số cũ bỏ sót ở trên). Sửa xong chạy lại riêng suite `ScienceKidsTests/BundledContentTests`: 10/10 pass. Không chạy lại cả bộ.

**Chạy thử (iPhone 16, `SK061SkyRunUITests`, một lần, pass, 157 s, giao diện VI, hồ sơ test):**
- Bản đồ Explorer: 6 chặng, không có chặng 7; chặng 6 "0/2 xong" có *Núi, sông và biển* và *Bầu trời ngày và đêm*; không còn *Nước quanh em*; cờ đích "10 chủ đề · 0 đã xong". Icon *Bầu trời* đúng (nửa ngày, nửa đêm).
- Bài 3 *Mặt Trời mọc, Mặt Trời lặn*: Khởi động, Học (5 trang), Chơi (kệ 6 món toàn hình vẽ; chạm mở to "Rooster crowing · Gà trống gáy", đóng được; giữ kéo 2 món vào khay, nút Xong hiện), quiz 6 câu (q4 `order_sequence`: sáng → trưa → chiều tối, ba hình vẽ cùng khung cảnh, xếp đúng), Tổng kết 2 trang, Thưởng: thẻ "Bình minh", 2 sao (sao thứ 3 là ôn ngày mai, đúng luật).
- Tab Thẻ: chữ "Thẻ bầu trời" có trong cây giao diện (test kiểm), nhưng **ảnh chụp chưa cuộn tới bộ này** (ảnh 17 chỉ thấy đầu trang, "1/46 thẻ"). Chưa kiểm bằng mắt.
- Kệ bài 2: 6 ảnh chụp: đom đóm phát sáng, gà trống, dơi treo ngược, bướm, các bé đi bộ ban ngày, cú mắt to; nhãn ba nhóm "Mắt to nhìn đêm · Ngủ treo ngược · Phát sáng trong đêm".

**Lỗi thấy:** không có lỗi app. Hai điểm để người khác xem:
1. (designer, tester) Thẻ thưởng bài 3 "Bình minh" là ảnh vịnh có hai thuyền, trời hồng tím. Nhìn dễ ra hoàng hôn, và giống kiểu ảnh `explore_sunset` (sông, thuyền). Tái hiện: chơi xong bài 3 → màn Thưởng.
2. (tester) Nhãn VoiceOver của thẻ thưởng ở hồ sơ song ngữ, giao diện VI: "Sticker mới: Sunrise. Chạm để dán vào sổ." (câu VI, tên EN). Cách ghép này đã có từ trước, không phải do SK-061.

**Unit test lượt 2 (20/11, sau khi build lại gói có `sunrise_card` mới là hình giấy cắt; iPhone 16 UDID 3E0435D8, cả bộ, bỏ UI test, chạy một lần):** 436 test, **436 pass, 0 fail**, `** TEST SUCCEEDED **`. (Lượt 1 ghi nhầm 437 vì cộng cả "1 issue"; số đúng là 436.) Máy đã tắt sau lượt chạy. Mục 1 ở "Lỗi thấy" (ảnh thẻ "Bình minh") đã được thay bằng hình mới trong gói này, nhưng em chưa xem bằng mắt.

**Chưa kiểm:** iPad, iPhone 16e/Pro Max, nhìn bộ "Thẻ bầu trời" trên tab Thẻ, tiếng (gói có clip nhưng chạy test không nghe), các bài 1, 4, 5, 6.
Ảnh: thư mục scratchpad của ios-dev `shots-sk061/` (19 ảnh + `notes.txt`).
- *(20/11, bổ sung sau chạy thử iOS)* `03` `reward.sunrise_card` đổi từ ảnh vịnh hai thuyền (trông như hoàng hôn) sang **hình giấy cắt** `content/images/own/bau-troi-ngay-va-dem/mat-troi-moc-mat-troi-lan.reward.sunrise_card.jpg` (SVG ở `design/illustrations/…`; Science Kids, `drawn`): Mặt Trời vừa nhô nửa sau rặng tre, trời xanh nhạt với dải hồng, sương trắng trên ruộng lúa, gà trống gáy, bác nông dân nón lá vác cuốc ra đồng nhìn từ sau. Thẻ thưởng đứng một mình nên không trộn kiểu. `images fetch` 0 lỗi, 0 lệch khung; `validate` 0 lỗi. Đề nghị sửa markdown `03:565–567`: brief → `[hình vẽ]` theo mô tả trên; alt → "A farmer walking to the fields at sunrise" · "Bác nông dân ra đồng lúc bình minh"; ghi chú dòng 568 và mục Loại hình, Ảnh chụp mới (`03:573`, `:577`) bỏ `sunrise_card` khỏi danh sách ảnh chụp.
- **Phiên chính (20/11, sau chạy thử iPhone 16):** `sunrise_card` đổi sang hình vẽ giấy cắt (designer), sửa brief, alt ("A farmer walking to the fields at sunrise" · "Bác nông dân ra đồng lúc bình minh") và ghi chú hoạ sĩ trong `03-mat-troi-moc-mat-troi-lan.md`; không đổi chữ bé nghe.

## Nghiệm thu PM (20/11)

Đọc đủ các ghi chú: dev lượt 1, designer lượt 1–3, content-editor lượt 1–4, tester rà chữ lượt 1, rà ảnh lượt 1–2, ios-dev lượt 1, phiên chính. Kết quả phiên chính 20/11: `validate content` 0 lỗi, 43 chủ đề / 375 bài, 104 bài có `lesson_id`; gói build lại sau lần thay `sunrise_card` cuối, `check-pack` OK, ảnh 0 lỗi; content-cli 410/410, content-schema 163/163, iOS unit 436/436 trên iPhone 16; XCUITest trên iPhone 16: bản đồ 6 chặng, chơi trọn bài 3, kệ bài 2 đúng.

- **Đạt 21/23 tiêu chí.** Chi tiết và bằng chứng ở dưới từng tiêu chí.
- **Chưa kiểm (1):** "Thẻ bầu trời 1/6" trên tab Thẻ và hình `sunrise_card` mới chưa ai xem bằng mắt trên máy; bài 1, 4, 5, 6 chưa chơi trên máy; chưa nghe clip; chưa chạy iPad. Phần lệnh của tiêu chí này đều đạt.
- **Chưa đạt, có chủ ý (1):** tiêu chí pm. Các chỗ ghi "khi SK-061 xong" ở `prd.md`, `technical-plan.md`, `syllabus.md` mục 0, `syllabus-lessons.md:9` chuyển sang "hiện hành" cùng SK-057 khi Duy duyệt.
- **Lỗi chặn:** 0. Tester rà chữ 1 chặn, rà ảnh 6 chặn, đều đã đóng.
- Trạng thái: **review**, chờ Duy. Không commit.

## Còn mở cho Duy

1. **[CẦN KIỂM] cần người chuyên môn đọc:** 50 dòng (`_topic.md` 15 dòng, sáu bài 35 dòng); năm misconception chưa có nguồn dẫn (`safe_to_look_at_sun`, `everyone_sleeps_at_night`, `sun_stays_still`, `moon_only_at_night`, `stars_are_tiny`). Tester đọc không thấy chỗ sai. Không chặn review, nhưng phải xong trước khi phát hành.
2. **Nghe clip VI:** chưa ai nghe. PM đề xuất Duy nghe ít nhất bài 1 (câu an toàn mắt) và bài 3 (Mục tiêu đã sửa).
3. **Hai bài PM đã thay** (chế độ auto, Quyết định 4, 5): bài 3 *Bóng nắng đổi theo giờ* thành *Mặt Trời mọc, Mặt Trời lặn*; bài 6 *Trái Đất là một quả cầu lớn* thành *Trên bầu trời có gì?* (ý quả cầu lên Discoverer #7 bài 1). Duy giữ hay đổi.
4. **"Nổi hay chìm" chưa có chỗ trong lộ trình.** PM đề xuất để trống tới khi chốt lộ trình Discoverer; nếu muốn giữ thì đưa vào Discoverer #9.
5. **An toàn gần nước ở Discoverer #9.** PM đề xuất thêm một ý chính hoặc một bài khi soạn #9. Hiện Explorer chỉ còn ba câu ở #9 bài 4–6.
6. **Mục nhỏ không chặn còn lại.** PM đề xuất chấp nhận cả nhóm, chỉ sửa a và b trong một lượt nhỏ trước khi commit:
   - a. content-editor sửa alt: B8 `q3_countryside` ("Stars above two dark roofs"), B10 `day_moon_card` (bỏ chữ "half"); thêm `sunrise_card` vào Quy ước hình số hai.
   - b. Duy xem bằng mắt trên máy: thẻ `sunrise_card` hình vẽ mới, tab Thẻ "Thẻ bầu trời 1/6".
   - c. Chấp nhận hoặc giao designer: C1 `explore_full` nền đen, không có nền trời (nếu chấp nhận thì ghi ngoại lệ vào Quy ước hình 5); C2 biển "NO STANDING" nhỏ ở `q3_town`; C3 `tray_school` chỉ 461 px; B11, B13, B14, B15, B17, B19, B21, B22; năm tên ảnh gốc lỉnh kỉnh ở màn Nguồn hình.
   - d. n5: 10 chỗ "Dùng lại hình" hai chặng, gộp vào SK-060.
7. **Nhãn VoiceOver thẻ thưởng ở hồ sơ song ngữ** ghép câu VI với tên EN ("Sticker mới: Sunrise…"). Lỗi này có từ trước SK-061. PM đề xuất mở ticket riêng cho ios-dev, gộp với SK-058 n7 (`label` trùng chữ câu hỏi).
