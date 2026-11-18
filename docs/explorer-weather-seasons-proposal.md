# Đề xuất chủ đề Explorer mới: Thời tiết và các mùa

Trạng thái: **đã chốt 17/11** (Duy, qua phiên chính: "bật mode auto, không cần hỏi thêm" → sáu câu theo đề xuất PM) · Ngày: 17/11/2026 · Viết: pm · Ticket: [SK-050](backlog/SK-050-explorer-weather-and-seasons.md)
Nguồn: Duy 17/11 ("chủ đề thời tiết và sự chuyển đổi giữa các mùa, rồi các tháng trong năm thì gôm chung lại thành 1 topic kiểu generic. không cần quá phụ thuộc vào oak."); [syllabus.md](../syllabus.md) mục 1–3, 8; [syllabus-lessons.md](../syllabus-lessons.md) Explorer #5, #8; [syllabus-progression.md](../syllabus-progression.md) mục 3, 4, 6–8, 11; [syllabus-review-2026-11-13.md](syllabus-review-2026-11-13.md) câu D3, D4; `content/syllabus.json` (Explorer #5, #8); `content/TEMPLATE.md` (bảy luật Explorer, SK-044, SK-047); `content/rules.json` (`explorer.authoring`); `_topic.md` bốn chủ đề Explorer đã soạn; `content/discoverer/thoi-tiet-va-thien-tai/_topic.md` (SK-038); [explorer-habitats-proposal.md](explorer-habitats-proposal.md) và [SK-048](backlog/SK-048-explorer-habitats-around-the-world.md) (khuôn); `design/play-ui/journey-roadmap-spec.md`, SK-034 (chặng).

Tài liệu đã sửa 17/11: file này, SK-050, `docs/backlog/README.md`, ghi chú câu D4 ở `docs/syllabus-review-2026-11-13.md`, ghi chú ở `docs/explorer-habitats-proposal.md` mục 5. Explorer #6 *Cơ thể của em* đang soạn song song ở SK-049; chủ đề đó giữ số #6 sau khi đổi. **Chưa sửa** `syllabus.md`, `syllabus-lessons.md`, `syllabus-progression.md`, `prd.md`, `technical-plan.md` (ngoài phạm vi lượt này; làm cùng lượt dev đổi danh mục, SK-050 "Việc kéo theo"). Chưa đổi `content/syllabus.json`.

Tên bài EN/VI ở mục 4 là tên cho danh mục. Các câu EN/VI khác ở mục 4 là nháp của PM; content-editor viết lại theo luật Explorer. Muốn đổi tên bài thì báo PM để sửa danh mục cùng lúc.

## 0. Tóm tắt

- **Gộp hai unit Oak Year 1** đang ở Explorer #5 *Thu, đông và mùa khô* (5 bài) và #8 *Xuân, hè và mùa mưa* (5 bài) thành **một chủ đề mới, không bám Oak**: *Weather and seasons · Thời tiết và các mùa*. Thêm mười hai tháng trong năm.
- **6 bài**, thứ tự:
  1. Thời tiết hôm nay (`opener`)
  2. Mùa xuân và mùa hè (`core`, miền Bắc)
  3. Mùa thu và mùa đông (`core`, miền Bắc)
  4. Mùa mưa và mùa khô (`core`, miền Nam)
  5. Mười hai tháng (`apply`)
  6. Mùa lại về (`review`)
- **Mức 2** (9 điểm, 2-1-2-2-2), **mạch Trái Đất & bầu trời** (`earth_sky`), DOK 3·3·0 như mọi chủ đề Explorer.
- **Vị trí: Explorer #5**, ngay sau *Những nơi sống trên Trái Đất*. #6, #7 giữ số; *Vật liệu quanh em* trở đi lên một bậc (#8–#12).
- **Số đếm sau khi đổi:** Explorer 12 chủ đề / 79 bài; cả app **45 chủ đề / 390 bài** (35 unit Oak, 10 chủ đề mới). Bản đồ Explorer vẫn **5 chặng**; Chặng 3 có hai chủ đề mới (#4, #5).
- **Dạy cả hai miền** (bốn mùa miền Bắc, mùa mưa và mùa khô miền Nam), **chỉ dương lịch** (Tết là một mốc, không dạy âm lịch), tên mười hai tháng chỉ để nghe, không hỏi.
- Soạn ngay; không chen việc của pilot Discoverer (đã soạn xong, đang chờ duyệt).

## 1. Định vị

### 1.1 Nhóm Explorer (không đổi)

- 5–7 tuổi, chưa biết đọc. Audio EN và VI đọc mọi chữ, đáp án bằng hình, bài 5–7 phút, quiz 6 câu.
- Dạng câu: `single_choice` 2–3 lựa chọn, `true_false` bằng biểu tượng, `order_sequence` 3 thẻ. Khởi động chỉ `single_choice`, `true_false` (`content/rules.json`, `explorer.authoring`).
- Mỗi câu EN tối đa 8 từ; mỗi bài 2–3 từ mới `core`. Mọi câu hỏi, lựa chọn, thẻ có hình. Câu 6 là câu misconception bằng hình, DOK 2; ưu tiên `true_false` đáp án Sai để Tổng kết có thẻ "Ý sai → Ý đúng" (SK-047).

### 1.2 Mức (rubric [syllabus-progression.md](../syllabus-progression.md) mục 3)

| Tiêu chí | Điểm | Lý do |
| --- | --- | --- |
| A. Mức trừu tượng | 2 | Thời tiết nhìn thấy hằng ngày (1), nhưng mùa và tháng là thay đổi kéo dài nhiều tháng và quay vòng; bé không thấy trong một lần nhìn |
| B. Kiến thức nền | 1 | Chỉ cần trải nghiệm đời sống. Khởi động ôn #1, #2, #4 nhưng chủ đề không dựa vào chúng |
| C. Misconception | 2 | Có quan niệm sai, sửa được bằng ảnh và trải nghiệm: Mặt Trời "đi mất" khi trời nhiều mây; mùa đông có tuyết; nơi nào cũng bốn mùa; hết tháng Mười Hai là hết. Không dạy vì sao có mùa (quan niệm sai "cứng đầu" về khoảng cách tới Mặt Trời), nên không lên 3 |
| D. Tải từ vựng EN | 2 | 2–3 từ mới mỗi bài, dễ đọc: weather, sunny, rainy, season, spring, summer, autumn, winter, month, year. Tên mười hai tháng chỉ nghe, không là từ vựng. Nếu đưa tên tháng vào từ vựng thì D = 3, tổng 10, Mức 3 |
| E. Kỹ năng khoa học | 2 | Quan sát thay đổi theo thời gian; so sánh hai miền; sắp thứ tự mùa và các mốc trong năm |

**Tổng 9 → Mức 2.** Hai chủ đề cũ chấm 6 (Mức 1); điểm tăng vì thêm tháng và hai cách chia mùa. Chủ đề đứng sau ba chủ đề Mức 3 (#2–#4): lệch quy tắc "Mức không giảm", cùng chỗ lệch Duy đã chấp nhận 14/11 và 16/11.

### 1.3 Mạch

**Trái Đất & bầu trời** (`earth_sky`), như hai chủ đề cũ và Discoverer #5. Sau khi đổi, Explorer có đúng một chủ đề ở mạch này (bảng mạch [syllabus-progression.md](../syllabus-progression.md) mục 4: "Mùa ×2 (6)" thành "Thời tiết và các mùa (9)"). Không lấp chỗ trống "bầu trời ngày và đêm" của câu D3 (vẫn chờ Duy).

### 1.4 DOK và dạng câu

- Quiz DOK 1·1·1·2·2·2. Câu 1 DOK 1. Không DOK 3.
- DOK 1: "Trời mưa em mặc gì?"; "Hoa nào nở dịp Tết?".
- DOK 2: từ dấu hiệu suy ra mùa ("Lá bàng đỏ, mọi người mặc áo ấm: mùa nào?"); xếp ba mốc trong năm (Tết, nghỉ hè, khai giảng); bác một câu sai bằng điều đã học ("Mùa đông lúc nào cũng có tuyết.", Sai).
- `order_sequence` chỉ khi có đúng một thứ tự. Mùa và tháng là vòng lặp, nên câu hỏi phải **nêu thẻ đầu** ("Spring comes first. Put them in order.") và ba thẻ phải liền nhau trong vòng.

### 1.5 Vị trí và chặng bản đồ

Danh mục hiện tại: #1 *Gọi tên và nhóm động vật* (Y1), #2 *Sinh vật sống ở đâu?* (Y2), #3 *Chuỗi thức ăn* (Y2), #4 *Những nơi sống trên Trái Đất* (mới), #5 *Thu, đông và mùa khô* (Y1), #6 *Cơ thể của em* (Y1), #7 *Cây quanh em* (Y1), #8 *Xuân, hè và mùa mưa* (Y1), #9–#13. App chia chặng theo năm Oak; mọi chủ đề mới liền nhau thành một chặng (spec mục 2 ý 3; tên chặng "Chặng n", không ghi Year, SK-034).

| Phương án | Vị trí | Chặng Explorer | Được | Mất |
| --- | --- | --- | --- | --- |
| **A (chốt 17/11)** | **#5**, ngay sau *Những nơi sống trên Trái Đất* | **5 chặng:** Y1 (#1) · Y2 (#2–#3) · mới (#4–#5) · Y1 (#6–#8) · Y2 (#9–#12) | Nối thẳng #4 (nóng, lạnh, ướt, khô; bài 6 xavan đã giới thiệu mùa mưa, mùa khô). Giữ chỗ sớm của unit mùa cũ (Oak Y1 #2). Bản đồ không thêm chặng, không đổi code. Chỉ #9–#13 cũ đổi số | Lệch luật "chủ đề mới đứng đầu" (như #4); Mức 2 sau Mức 3 |
| B | #1, theo luật 9/11 | 6 chặng | Đúng luật; chủ đề dễ, đời thường | Đẩy chủ đề đã soạn, chủ đề gợi ý bắt đầu khi onboarding ([syllabus-progression.md](../syllabus-progression.md) mục 11) xuống #2; chủ đề đầu Explorer thành "Sắp có" tới khi soạn xong |
| C | Sau *Cây quanh em* (#7) | 7 chặng | Theo ý 13/11 (học cây rồi mới xem cây đổi theo mùa) | Cắt đôi chặng Year 1 hai lần; bản đồ vụn |
| D | Sau *Vật liệu quanh em* (#8) | 6 chặng | Phần Year 1 liền nhau | Thêm một chặng một chủ đề; xa #4 |

Với A, `oakYear` Explorer thành `[1, 2, 2, nil, nil, 1, 1, 1, 2, 2, 2, 2]`; chặng `stopRange` `[0..<1, 1..<3, 3..<5, 5..<8, 8..<12]`. Duy chốt 16/11 "Giữ chặng riêng" cho #4 (không gộp vào chặng Year 2); A giữ đúng ý đó: Chặng 3 chỉ có chủ đề mới.

### 1.6 Vì sao thành chủ đề mới (luật [syllabus.md](../syllabus.md) mục 2)

- **Duy yêu cầu 17/11**, nói rõ "không cần quá phụ thuộc vào oak". PM ghi câu này làm quyết định cho chủ đề này; luật "theo đúng thứ tự unit, lesson Oak; lệch thì ghi rõ và hỏi" vẫn giữ cho các chủ đề khác. Chỗ lệch ghi ở mục 2.2.
- **Sách bách khoa:** mảng Trái Đất có "Bốn mùa, Thời tiết" (syllabus.md mục 2).
- **CT GDPT 2018, Tự nhiên và Xã hội lớp 2:** có các mùa trong năm, thời tiết, thiên tai [CẦN KIỂM, chưa đối chiếu sách]. Tháng, năm, xem lịch ở Toán lớp 1–2 [CẦN KIỂM].
- **Chương trình Anh:** Science Year 1 bắt buộc "quan sát thay đổi qua bốn mùa; mô tả thời tiết theo mùa và độ dài ngày thay đổi ra sao" [CẦN KIỂM nguyên văn] (hai unit Oak dạy phần này). Tháng trong năm nằm ở môn Toán Year 1 [CẦN KIỂM].
- **Schema buộc chủ đề gộp là chủ đề mới:** một chủ đề Oak chỉ có một `unit_slug`; bài không có lesson Oak chỉ được là `extension` đứng cuối (`packages/content-schema/scripts/lib/syllabus.mjs`). Vậy chủ đề này là `source.kind: new`, key bắt đầu `new-`, mọi bài `oak_lessons: []`, `statutory: false`.

## 2. Liên hệ Oak

### 2.1 Lesson Oak dùng làm sườn một phần

Mười lesson Oak Year 1 (slug theo `content/syllabus.json`). Mục tiêu "I can…" của chúng có ở `content/.build/syllabus-vi.tsv`. **PM chưa đọc trang từng lesson** (Duy: không cần bám Oak); nội dung chi tiết, keyword và misconception của Oak ghi [CẦN KIỂM] dưới đây.

| Lesson Oak | Unit | Bài của chủ đề này | Dùng |
| --- | --- | --- | --- |
| `weather-in-autumn`, `weather-in-winter`, `weather-in-spring`, `weather-in-summer` | Y1 #2, #5 | Bài 1 (gộp), bài 2–3 (một ý mỗi mùa) | Mô tả thời tiết bằng từ đơn giản; thời tiết khác nhau theo mùa |
| `signs-of-spring`, `signs-of-summer` | Y1 #5 | Bài 2 | Dấu hiệu theo cây, hoa, quần áo; viết lại bằng dấu hiệu Việt Nam |
| `signs-of-autumn`, `signs-of-winter` | Y1 #2 | Bài 3 | Như trên |
| `day-length-in-summer` | Y1 #5 | Bài 2, một ý | "Mùa hè ngày dài, trời tối muộn" |
| `day-length-in-winter` | Y1 #2 | Bài 3, một ý | "Mùa đông ngày ngắn, trời tối sớm" |
| Không có | — | Bài 4 (mùa mưa, mùa khô), bài 5 (tháng), bài 6 (tổng kết) | Oak Science không có |

### 2.2 Chỗ lệch Oak (theo câu Duy 17/11, PM ghi; không hỏi lại)

1. **Bỏ hai unit Oak Year 1 khỏi danh mục** (`seasonal-changes-autumn-and-winter`, `seasonal-changes-spring-and-summer`), thay bằng một chủ đề mới. App còn giữ 35/38 unit Oak (bỏ *Materials* Y6 từ 9/11; gộp hai unit này 17/11). Phần bắt buộc của Year 1 (bốn mùa, thời tiết theo mùa, độ dài ngày) vẫn có ở bài 1–3, 6.
2. **Không theo luật 1 lesson = 1 bài:** 10 lesson Oak thành 3 bài (bài 1–3) cộng 3 bài ngoài Oak.
3. **Không theo thứ tự năm học Anh** (Oak học thu, đông trước vì năm học Anh mở vào mùa thu). Ta đi theo năm: xuân, hè, thu, đông.
4. **Bỏ bài riêng cho độ dài ngày** (`day-length-in-*`): còn một ý trong bài 2, bài 3. Không dạy vì sao ngày dài, ngắn (Scientist #6).
5. **Bỏ bài thời tiết riêng cho từng mùa** (`weather-in-*`): gộp thành bài 1 và một ý trong bài 2, 3.
6. **Bỏ dấu hiệu mùa chỉ đúng ở Anh:** tuyết, sương giá, băng trên đường, lá rụng hàng loạt vào mùa thu, hoa và chim nước Anh [CẦN KIỂM: đúng các dấu hiệu Oak dùng]. Thay bằng dấu hiệu Việt Nam (mục 3).
7. **Bỏ phần đo, ghi thời tiết trên lớp**, nếu Oak có [CẦN KIỂM]: đo thời tiết bằng dụng cụ thuộc Discoverer #5 bài 2.
8. **Thêm** mùa mưa, mùa khô miền Nam (bài 4), mười hai tháng (bài 5), bài tổng kết (bài 6).
9. **Không dùng misconception của Oak** vì chưa đọc trang; sáu key ở mục 4 do PM đề xuất. Nếu sau này đọc trang Oak thấy misconception hợp tuổi và hợp Việt Nam, content-editor được đổi (ghi lý do), như SK-048 bài 1, 2.
10. `oak_lessons: []` ở mọi bài (schema bắt buộc với chủ đề mới). Mười slug Oak ghi ở `_topic.md` mục Nguồn và ở `syllabus-lessons.md`.

## 3. Dạy mùa cho trẻ Việt Nam

**Hai cách chia, theo miền.** Miền Bắc có bốn mùa (xuân, hè, thu, đông); miền Nam có mùa mưa và mùa khô [CẦN KIỂM: mùa mưa khoảng tháng Năm tới tháng Mười Một]. Miền Trung có mùa mưa riêng (khoảng tháng Chín tới tháng Mười Hai [CẦN KIỂM]) và chịu bão; chủ đề không có bài riêng cho miền Trung, và không câu nào nói "cả nước có hai mùa" hay "cả nước có bốn mùa".

**Dạy cả hai cho mọi bé** (câu 4 = a). App không hỏi bé sống ở đâu (ràng buộc dữ liệu trẻ tối thiểu), nên không chia bài theo miền. Bé miền Nam học bốn mùa như học nơi khác; bé miền Bắc học mùa mưa, mùa khô cũng vậy. Hai cách chia đặt cạnh nhau là chỗ sửa quan niệm sai "nơi nào cũng có bốn mùa" (bài 4).

**Không ghép hai cách chia vào một bài.** Danh mục cũ ghép "thu, đông" với "mùa khô", "xuân, hè" với "mùa mưa" (tên bài như "Dấu hiệu mùa thu và cuối mùa mưa"). Ghép thế dễ làm bé hiểu thu là mùa khô, hè là mùa mưa ở mọi nơi. Tách theo miền thì rõ hơn: bài 2–3 miền Bắc, bài 4 miền Nam, bài 6 đặt hai bên cạnh nhau.

**Thứ tự miền Bắc trước.** Bốn mùa có trong bài hát, sách tranh, và là phần Oak; bài 4 cần bé đã biết bốn mùa để sửa "nơi nào cũng bốn mùa".

**Nói nơi chốn bằng lời, không bản đồ.** "Ở miền Bắc, như Hà Nội" · "Ở miền Nam, như Thành phố Hồ Chí Minh". Không bản đồ Việt Nam (luật bản đồ 9/11, cần bản đồ nhà nước; SK-048 câu 6 cũng bỏ bản đồ ở Explorer).

**Dấu hiệu Việt Nam cho từng mùa** (content-editor chọn, mỗi cái cần ảnh thật):

| Mùa | Dấu hiệu nhìn, nghe được | Ghi chú |
| --- | --- | --- |
| Xuân (miền Bắc) | hoa đào dịp Tết; lộc non; mưa phùn; trời ấm dần | Miền Nam Tết có hoa mai: chỉ nhắc ở bài 5 (Tết là mốc chung). Mưa phùn khó chụp, chỉ nói |
| Hè | hoa phượng đỏ; tiếng ve; nắng nóng; mưa rào; ngày dài | Phượng nở cả hai miền [CẦN KIỂM] |
| Thu (miền Bắc) | lá vàng; trời xanh, mát; hoa sữa; đèn ông sao dịp Trung thu | Trung thu chỉ là dấu hiệu, không nói ngày tháng âm lịch |
| Đông (miền Bắc) | lá bàng đỏ; áo khoác, khăn len; sương mù; trời tối sớm | Không tuyết (bài 3 sửa quan niệm sai này) |
| Mùa mưa (miền Nam) | mưa to buổi chiều rồi tạnh; mây đen; vũng nước; ruộng lúa xanh; mang áo mưa | Không bão, lũ (Discoverer #5) |
| Mùa khô (miền Nam) | nắng nhiều, ít mưa; ruộng đã gặt; tưới cây | Không gọi mùa khô là hạn hán (misconception `drought_is_one_hot_day` của Discoverer #5) |

**Tên gọi:** "mùa xuân, mùa hè, mùa thu, mùa đông" (chữ bé nghe dùng "mùa hè", không "mùa hạ"); "mùa mưa, mùa khô". EN: spring, summer, autumn (chính tả Anh, không "fall"), winter; rainy season, dry season.

**Không dạy vì sao có mùa** (trục nghiêng của Trái Đất, quan niệm sai "mùa hè vì gần Mặt Trời"): để dành Scientist #6.

## 4. Mười hai tháng cho bé chưa biết đọc

Trẻ thuộc thứ tự mùa sớm hơn thứ tự tháng; thứ tự mười hai tháng, nhất là đếm tiếp từ một tháng bất kỳ, thường vững sau 8 tuổi [CẦN KIỂM: các nghiên cứu của William Friedman về hiểu biết thời gian theo chu kỳ ở trẻ]. Vì vậy bài 5 **cho bé nghe tên tháng nhưng không hỏi tên tháng**; điều được hỏi là ba ý bé nghe, nhìn được:

1. **Một năm có mười hai tháng.** Ô Học "Twelve months": hình vẽ một vòng mười hai hạt tròn cùng màu, không chữ số (không có ảnh thật cho ý này; **PM đồng ý tự vẽ**). Ví dụ của ô là ba câu vè, mỗi câu bốn tên tháng: "January, February, March, April." · "Tháng Một, tháng Hai, tháng Ba, tháng Tư." (rồi May–August, September–December). App đọc EN rồi VI như mọi câu.
2. **Hết tháng Mười Hai lại đến tháng Một.** Năm quay vòng (câu misconception của bài).
3. **Năm nào cũng có các mốc bé biết:** Tết (đầu năm; hoa đào, hoa mai, bánh chưng), nghỉ hè (giữa năm; biển), khai giảng (tháng Chín; cặp sách, trống trường). Câu `order_sequence` xếp ba mốc này, câu hỏi nêu thẻ đầu ("Start at Tet. Put them in order.").

Không làm:
- không hỏi "tháng thứ mấy", "tháng nào có bao nhiêu ngày", không ảnh tờ lịch có chữ số (luật hình: không chữ, không chữ số);
- không bảng "xuân là tháng 2–4…": các nguồn chia khác nhau (dương lịch, âm lịch, khí tượng) [CẦN KIỂM]; chỉ gắn mốc với mùa khi chắc: Tết với mùa xuân, nghỉ hè với mùa hè;
- không âm lịch (câu 5 = a). Tết là mốc văn hoá: "Tết thường đến vào tháng Một hoặc tháng Hai" [CẦN KIỂM]. Lịch âm gắn với Mặt Trăng, để dành Scientist #6 hoặc chủ đề bầu trời của câu D3 nếu Duy chốt;
- không hỏi, không lưu tháng sinh của bé (dữ liệu trẻ); không lễ tôn giáo (Giáng sinh).

Từ vựng bài 5: `core` month, year; `extra` calendar, holiday. Tên tháng không vào `word_list` (TEMPLATE: tổng 4–8 từ mỗi bài).

Chữ VI tên tháng viết bằng chữ: "tháng Một", "tháng Tư", "tháng Mười Hai" [CẦN KIỂM: viết hoa tên tháng; "tháng Một" hay "tháng Giêng" cho dương lịch: dùng "tháng Một", vì "tháng Giêng" là tháng âm lịch]. Nghe thử giọng VI đọc "tháng Tư", "tháng Mười Một".

## 5. Sáu bài

Câu EN tối đa 8 từ (đã đếm). Từ khoá tìm ảnh theo bài học SK-048: truy vấn hai, ba từ hoặc tên khoa học; chưa kiểm Commons. Ảnh ghi "dùng lại" là key đã có: ảnh của Discoverer thì designer chép mục gốc (`same_as` không sang được nhóm tuổi khác, SK-048).

Khuôn mỗi bài (như bốn chủ đề Explorer đã soạn): Khởi động 2–3 câu DOK 1 (một câu ôn bài trước, một câu ôn chủ đề khác); Học một `explore_groups` 3–4 ô và một `word_list`; Chơi một `build_tray` (3 nhóm `required`, 1 nhóm `limit`); Quiz 6 câu; từ vựng 4–5 từ, 2–3 `core`; một thẻ thưởng `set: weather` (app đã có khoá `collectible.set.weather`); `est_minutes: 6`.

### Bài 1 · Thời tiết hôm nay · Weather today

| Mục | Nội dung |
| --- | --- |
| `stage` | `opener` |
| Lesson Oak | Gộp ý "mô tả thời tiết" của `weather-in-autumn`, `-winter`, `-spring`, `-summer` |
| Mục tiêu | I can say what the weather is like. · Em nói được hôm nay trời thế nào. |
| Ý chính 1 | The weather can be sunny, rainy or windy. · Trời có thể nắng, mưa hoặc có gió. |
| Ý chính 2 | Some days are hot. Some days are cold. · Có ngày trời nóng, có ngày trời lạnh. |
| Ý chính 3 | We dress for the weather. · Mình mặc quần áo hợp với thời tiết. |
| Học (4 ô) | Sunny · Trời nắng (đội nón, uống nước); Cloudy · Trời nhiều mây (Mặt Trời nấp sau mây: dạy trước ý đúng của câu 6); Rainy · Trời mưa (mặc áo mưa, che ô); Cold · Trời lạnh (mặc áo khoác) |
| Từ vựng | `core`: weather · thời tiết; sunny · trời nắng; rainy · trời mưa. `extra`: cloudy · trời nhiều mây; raincoat · áo mưa |
| Misconception | `sun_gone_when_cloudy`: "On cloudy days, the Sun goes away." · "Trời nhiều mây là Mặt Trời đi mất." Sửa: "The Sun is still there, behind the clouds." · "Mặt Trời vẫn ở đó, sau những đám mây." Nguồn: gần ý Vosniadou và Brewer (1994), trẻ nhỏ giải thích đêm bằng "mây che Mặt Trời" [CẦN KIỂM]; kinh nghiệm phổ thông. Phương án khác: `weather_same_all_day` ("Sáng nắng thì cả ngày nắng"; sửa: "Sáng nắng, chiều vẫn có thể mưa") |
| Quiz | `single_choice` (trời mưa mặc gì: áo mưa, áo khoác, nón), `true_false`. Câu 6 `true_false` đáp án Sai, hình trời nhiều mây có nắng hắt sau mây. Không `order_sequence` (nắng, mây, mưa có nhiều thứ tự đúng) |
| Khởi động | Một câu ôn *Những nơi sống trên Trái Đất* (nơi nóng, nơi lạnh; ví dụ bài 1 "The Arctic is icy and very cold.", Đúng). Một câu ôn *Gọi tên và nhóm động vật*, mốc một tháng, theo ghi chú `goi-ten-va-nhom-dong-vat/_topic.md:339` (ví dụ "Every bird can fly.", Sai) |
| Chơi | "Dress for the weather" · "Mặc gì cho hợp trời": ba nhóm nắng (nón lá), mưa (áo mưa), lạnh (áo khoác); nhóm `limit` dạng "Not …" · "Không …" gồm đồ không mặc ra ngoài trời (content-editor chọn) |
| Thẻ thưởng | Rainbow · Cầu vồng (thấy khi vừa mưa vừa có nắng [CẦN KIỂM]) |
| Ranh giới | Discoverer #5 bài 1 dạy "gió là không khí chuyển động", "mây là giọt nước", dụng cụ đo: không dạy ở đây. Không bão, sét. Không câu nào bảo bé nhìn Mặt Trời |

| Hình | Từ khoá tìm ảnh (EN) | Dùng lại | Ngờ khó |
| --- | --- | --- | --- |
| Mặt Trời trên trời xanh | — | `be-mat-trai-dat/nui-lua` `q3_sun` (Discoverer, chép mục) | — |
| Mưa to | — | `be-mat-trai-dat/nui-lua` `q1_rain` (Discoverer, chép mục) | — |
| Lúa nghiêng theo gió | — | `ho-hap/vi-sao-ta-phai-tho` `w1` (Discoverer, chép mục) | — |
| Trời nhiều mây | — | `thoi-tiet-va-thien-tai/nang-mua-gio-may` `explore_cloudy` (chép mục) | — |
| Nắng hắt sau đám mây | `crepuscular rays; sun behind clouds` | — | Vừa: phải thấy rõ có Mặt Trời sau mây |
| Nón lá | `conical hat; non la` | — | Vừa: tránh ảnh có mặt người |
| Áo mưa | `raincoat` | — | Vừa: không người, không nhãn hiệu |
| Áo khoác, khăn len | `winter coat; knitted scarf` | — | — |
| Cầu vồng | `rainbow field` | — | — |

### Bài 2 · Mùa xuân và mùa hè · Spring and summer

| Mục | Nội dung |
| --- | --- |
| `stage` | `core` |
| Lesson Oak | `signs-of-spring`, `signs-of-summer`; một ý của `day-length-in-summer`, `weather-in-spring`, `weather-in-summer` |
| Mục tiêu | I can name signs of spring and summer. · Em kể được dấu hiệu của mùa xuân và mùa hè. |
| Ý chính 1 | In the north, a year has four seasons. · Ở miền Bắc, một năm có bốn mùa. [CẦN KIỂM] |
| Ý chính 2 | Spring gets warmer. Peach trees bloom at Tet. · Mùa xuân trời ấm dần, hoa đào nở dịp Tết. [CẦN KIỂM] |
| Ý chính 3 | Summer is hot. Summer days are long. · Mùa hè nóng, ngày dài, trời tối muộn. [CẦN KIỂM] |
| Học (4 ô) | Four seasons · Bốn mùa (ảnh ghép bốn ô: hoa đào, hoa phượng, lá vàng, áo khoác); Spring · Mùa xuân (hoa đào; mưa phùn; trời ấm dần); New leaves · Lộc non (cây đâm chồi); Summer · Mùa hè (hoa phượng; tiếng ve; mưa rào; tối muộn) |
| Từ vựng | `core`: season · mùa; spring · mùa xuân; summer · mùa hè. `extra`: flower · bông hoa; cicada · con ve |
| Misconception | `flowers_only_in_spring`: "Flowers bloom only in spring." · "Hoa chỉ nở vào mùa xuân." Sửa: "Flame tree flowers bloom in summer." · "Hoa phượng nở vào mùa hè." Nguồn: PM; tranh, bài hát gắn hoa với mùa xuân [CẦN KIỂM]. Phương án khác: `summer_always_sunny` ("Mùa hè ngày nào cũng nắng"; sửa: "Mùa hè có nắng nóng và mưa rào") |
| Quiz | `single_choice` (hoa nào nở dịp Tết: hoa đào, hoa phượng, hoa sen; không đặt hoa mai cạnh hoa đào vì cũng nở dịp Tết), `true_false`. Câu 6 `true_false` đáp án Sai, hình hoa phượng |
| Khởi động | Ôn bài 1; ôn *Sinh vật sống ở đâu?* (cây cần nước, bài 5) hoặc *Những nơi sống trên Trái Đất* |
| Chơi | Ba nhóm: Tết (hoa đào, bánh chưng), ngày hè nóng (hoa phượng, con ve), lộc non; bẫy: áo khoác, khăn len (đồ mùa lạnh, đã học ở bài 1) |
| Thẻ thưởng | Flame tree · Cây phượng [CẦN KIỂM: tên EN "flame tree", "royal poinciana"] |
| Ranh giới | Không vì sao có mùa; không tên tháng (bài 5); không âm lịch. Không nói "mọi cây ra lá non mùa xuân" (cây thường xanh, rụng lá ở *Cây quanh em* bài 4) |

| Hình | Từ khoá tìm ảnh (EN) | Dùng lại | Ngờ khó |
| --- | --- | --- | --- |
| Cành hoa đào | `Prunus persica blossom; peach blossom Vietnam` | — | Vừa: chọn ảnh hoa đào Việt Nam, không cành mai |
| Lộc non trên cành | `new leaves buds; leaf buds spring` | — | — |
| Hoa phượng đỏ | `Delonix regia` | — | — |
| Con ve trên thân cây | `cicada tree bark` | — | — |
| Bánh chưng | `banh chung` | — | Vừa: kiểm giấy phép, không bao bì có chữ |
| Hoa sen (lựa chọn sai) | — | `sinh-vat-song-o-dau` hình hoa sen (content-editor tìm key) | — |
| Bốn mùa (ảnh ghép) | `[sơ đồ ghép ảnh]` từ hoa đào, hoa phượng, lá vàng (bài 3), áo khoác (bài 1) | — | Designer ghép |

### Bài 3 · Mùa thu và mùa đông · Autumn and winter

| Mục | Nội dung |
| --- | --- |
| `stage` | `core` |
| Lesson Oak | `signs-of-autumn`, `signs-of-winter`; một ý của `day-length-in-winter`, `weather-in-autumn`, `weather-in-winter` |
| Mục tiêu | I can name signs of autumn and winter. · Em kể được dấu hiệu của mùa thu và mùa đông. |
| Ý chính 1 | Autumn is cool. Some leaves turn yellow. · Mùa thu mát, có cây lá chuyển vàng. |
| Ý chính 2 | Winter is cold. We wear warm clothes. · Mùa đông lạnh, mình mặc áo ấm. |
| Ý chính 3 | Winter days are short. It gets dark early. · Mùa đông ngày ngắn, trời tối sớm. [CẦN KIỂM] |
| Học (4 ô) | Autumn · Mùa thu (lá vàng; trời xanh, mát; đèn ông sao); Winter · Mùa đông (áo khoác, khăn len; sương mù); Red leaves · Lá bàng đỏ; Short days · Ngày ngắn (phố lên đèn khi trời mới chiều) |
| Từ vựng | `core`: autumn · mùa thu; winter · mùa đông. `extra`: cool · mát; coat · áo khoác; scarf · khăn quàng |
| Misconception | `winter_means_snow`: "Winter always brings snow." · "Mùa đông lúc nào cũng có tuyết." Sửa: "Hanoi winters are cold, without snow." · "Mùa đông Hà Nội lạnh nhưng không có tuyết." Nguồn: tranh, phim, thiệp mùa đông có tuyết; mùa đông ở Anh (Oak `weather-in-winter`) có tuyết, băng [CẦN KIỂM, chưa đọc trang Oak]. [CẦN KIỂM: tuyết chỉ thỉnh thoảng có ở núi cao phía Bắc như Sa Pa, Mẫu Sơn]. Không dùng `all_trees_lose_leaves` (thuộc *Cây quanh em* bài 4) |
| Quiz | `single_choice` (dấu hiệu nào là mùa đông), `true_false`, `order_sequence` ba mùa liền nhau, câu hỏi nêu thẻ đầu: "Spring comes first. Put them in order." (hoa đào → hoa phượng → lá vàng; một thứ tự đúng). Câu 6 `true_false` đáp án Sai, hình phố mùa đông không tuyết |
| Khởi động | Ôn bài 2; ôn *Sinh vật sống ở đâu?* bài 3 (lá xanh, lá vàng, lá khô) để nối lá đổi màu |
| Chơi | "Get ready for winter" · "Chuẩn bị cho mùa đông": ba nhóm áo khoác, khăn len, chăn ấm; bẫy: nón lá, quạt (đồ mùa nóng) |
| Thẻ thưởng | Content-editor chọn: cây hoa sữa (nở mùa thu Hà Nội [CẦN KIỂM]) hoặc sương mù. Không dùng cây bàng (đã là thẻ của *Sinh vật sống ở đâu?* bài 3) |
| Ranh giới | Không vì sao ngày ngắn; không đồng hồ có số; không "gió mùa đông bắc" làm từ cần học (nói "gió lạnh"); không ảnh tuyết làm cảnh mùa đông Việt Nam. Trung thu chỉ là dấu hiệu, không nói ngày âm lịch |

| Hình | Từ khoá tìm ảnh (EN) | Dùng lại | Ngờ khó |
| --- | --- | --- | --- |
| Lá vàng trên cành | — | `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song` `q4_yellow` | — |
| Lá bàng đỏ | — | `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song` thẻ `almond_card` | — |
| Trời thu xanh, hàng cây | `blue sky trees autumn` | — | Vừa: tránh cảnh lá đỏ kiểu ôn đới |
| Đèn ông sao | `star lantern Vietnam` | — | Vừa: không trẻ nhận ra mặt |
| Sương mù mùa đông | `fog lake trees; Hanoi fog` | — | **Có**: ảnh Hà Nội có giấy phép mở ít; bỏ tên nơi nếu ảnh nơi khác |
| Phố mùa đông, người mặc áo ấm, không tuyết | `Hanoi winter street` | — | **Có**: người ở xa, không nhận mặt; có thể bỏ tên nơi |
| Phố lên đèn lúc chiều | `street lights dusk` | — | Vừa |
| Áo khoác, khăn len | — | bài 1 | — |
| Chăn bông | `quilt blanket` | — | — |
| Cây hoa sữa (thẻ) | `Alstonia scholaris` | — | — |

### Bài 4 · Mùa mưa và mùa khô · Rainy and dry seasons

| Mục | Nội dung |
| --- | --- |
| `stage` | `core` |
| Lesson Oak | Không có |
| Mục tiêu | I can tell the rainy season from the dry season. · Em phân biệt được mùa mưa và mùa khô. |
| Ý chính 1 | In the south, there are two seasons. · Ở miền Nam, một năm có hai mùa. [CẦN KIỂM] |
| Ý chính 2 | Rain often comes in the afternoon. · Mùa mưa hay có mưa to vào buổi chiều. [CẦN KIỂM] |
| Ý chính 3 | The dry season is sunny, with little rain. · Mùa khô nắng nhiều, ít mưa. |
| Học (4 ô) | Rainy season · Mùa mưa (mưa to rồi tạnh; mang áo mưa); Dark clouds · Mây đen (mây kéo tới buổi chiều); Dry season · Mùa khô (nắng; tưới cây); Green or dry fields · Đồng xanh, đồng khô (ruộng lúa xanh mùa mưa; ruộng đã gặt mùa khô) |
| Từ vựng | `core`: rainy season · mùa mưa; dry season · mùa khô. `extra`: puddle · vũng nước; shower · cơn mưa rào. `dry_season` là từ `extra` của #4 bài 6, nâng lên `core` ở đây (cố ý, ghi trong `_topic.md`) |
| Misconception | `four_seasons_everywhere`: "Every place has four seasons." · "Nơi nào cũng có bốn mùa." Sửa: "The south has rainy and dry seasons." · "Miền Nam có mùa mưa và mùa khô." Nguồn: bài hát, sách tranh "bốn mùa"; SGK dạy cả hai [CẦN KIỂM]. Phương án khác: `rains_all_day` ("Mùa mưa thì mưa cả ngày"; sửa: "Mưa thường đến buổi chiều, rồi tạnh") |
| Quiz | `single_choice` (mùa mưa mang gì), `true_false`, `order_sequence` "mây đen kéo tới → mưa to → vũng nước" chỉ khi ba ảnh tả rõ một cơn mưa (content-editor quyết). Câu 6 `true_false` đáp án Sai, hình ghép bốn mùa của bài 2 |
| Khởi động | Ôn bài 3; ôn *Những nơi sống trên Trái Đất* bài 6 ("In the dry season, the grass turns yellow.", Đúng) để nối xavan với miền Nam |
| Chơi | Ba nhóm: mùa mưa (áo mưa, ô), mùa khô (nón lá, bình tưới), ruộng (lúa xanh); bẫy: áo khoác, khăn len (mùa đông miền Bắc) |
| Thẻ thưởng | Content-editor chọn; gợi ý trái cây theo mùa (xoài chín cuối mùa khô [CẦN KIỂM]) |
| Ranh giới | Không bão, lũ, hạn hán, "mùa mưa bão" (Discoverer #5 bài 3, 4). Không gọi mùa khô là hạn hán. Không ảnh đất nứt nẻ (ảnh hạn hán của Discoverer #5). Không bài riêng miền Trung; không "cả nước có hai mùa" |

| Hình | Từ khoá tìm ảnh (EN) | Dùng lại | Ngờ khó |
| --- | --- | --- | --- |
| Mưa to trên phố | `tropical downpour; heavy rain street` | — | Vừa: người ở xa, không biển chữ |
| Mây đen buổi chiều | `cumulonimbus; dark rain clouds` | — | — |
| Vũng nước sau mưa | `puddle rain` | — | — |
| Ruộng lúa xanh | — | `khung-long/trai-dat-rat-lau-ve-truoc` `q2_rice` (Discoverer, chép mục) | — |
| Ruộng đã gặt | `rice stubble field` | — | Vừa |
| Nắng mùa khô, đường khô | `sunny dry road; dry season Vietnam` | — | Vừa: không đất nứt |
| Bình tưới cây | `watering can` | — | — |
| Áo mưa, ô, nón lá | — | bài 1 | — |
| Bốn mùa (ảnh ghép) | — | bài 2 | — |

### Bài 5 · Mười hai tháng · Twelve months

| Mục | Nội dung |
| --- | --- |
| `stage` | `apply` (gắn các mốc trong năm với mùa đã học) |
| Lesson Oak | Không có (tháng ở Toán Year 1 chương trình Anh [CẦN KIỂM]) |
| Mục tiêu | I can say that a year has twelve months. · Em biết một năm có mười hai tháng. |
| Ý chính 1 | A year has twelve months. · Một năm có mười hai tháng. |
| Ý chính 2 | After December, January comes again. · Hết tháng Mười Hai lại đến tháng Một. |
| Ý chính 3 | Every year has Tet and a summer holiday. · Năm nào cũng có Tết, có nghỉ hè. |
| Học (4 ô) | Twelve months · Mười hai tháng (vòng mười hai hạt; ba câu vè tên tháng); Tet · Tết (đầu năm; hoa đào, hoa mai, bánh chưng); Summer holiday · Nghỉ hè (biển); Back to school · Khai giảng (tháng Chín; cặp sách, trống trường) |
| Từ vựng | `core`: month · tháng; year · năm. `extra`: calendar · lịch; holiday · kỳ nghỉ. Tên tháng không vào `word_list` |
| Misconception | `months_stop_after_december`: "After December, the months stop." · "Hết tháng Mười Hai là hết tháng." Sửa: "After December, January comes again." · "Hết tháng Mười Hai lại đến tháng Một." Nguồn: trẻ dưới 8 tuổi còn khó hiểu thời gian quay vòng (Friedman) [CẦN KIỂM]. Phương án khác: `year_has_four_months` (lẫn mùa với tháng) |
| Quiz | `single_choice` (cái gì có vào mùa hè: biển nghỉ hè, hoa đào, áo khoác), `true_false` ("A year has twelve months.", Đúng; hình vòng tháng), `order_sequence` "Start at Tet. Put them in order." (Tết → nghỉ hè → khai giảng). Câu 6 `true_false` đáp án Sai, hình vòng tháng. Không câu nào hỏi tên tháng |
| Khởi động | Ôn bài 4; ôn bài 2 (hoa đào nở dịp Tết) |
| Chơi | Ba nhóm: Tết (bánh chưng, cành đào), nghỉ hè (xô xẻng cát, phao bơi), khai giảng (cặp sách); bẫy content-editor chọn |
| Thẻ thưởng | Bánh chưng hoặc cành đào ngày Tết |
| Ranh giới | Không âm lịch; không tháng sinh của bé; không Giáng sinh, lễ tôn giáo; không chữ số, tờ lịch trong hình; không bảng tháng theo mùa |

| Hình | Từ khoá tìm ảnh (EN) | Dùng lại | Ngờ khó |
| --- | --- | --- | --- |
| Vòng mười hai tháng | `[hình vẽ]`, PM đồng ý (không có ảnh thật) | — | Designer vẽ: mười hai hạt tròn cùng màu nối thành vòng, không chữ số |
| Cành đào, bánh chưng | — | bài 2 | — |
| Hoa mai | `Ochna integerrima` | — | — |
| Bãi biển vắng | — | `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien` `q3` | — |
| Xô xẻng cát, phao bơi | `sand bucket spade; swim ring` | — | Vừa: không nhãn hiệu |
| Cặp sách | `school backpack` | — | Vừa: không nhãn hiệu, chữ |
| Trống trường | `school drum Vietnam` | — | **Có**: hiếm ảnh mở; thay bằng cặp sách nếu không có |

### Bài 6 · Mùa lại về · Seasons come back

| Mục | Nội dung |
| --- | --- |
| `stage` | `review` |
| Lesson Oak | Không có lesson riêng; ứng với mục tiêu bắt buộc Year 1 "quan sát thay đổi qua bốn mùa" |
| Mục tiêu | I can say how the weather changes in a year. · Em kể được thời tiết đổi ra sao trong một năm. |
| Ý chính 1 | The weather changes with the seasons. · Thời tiết thay đổi theo mùa. |
| Ý chính 2 | The seasons come back every year. · Năm nào các mùa cũng quay lại. |
| Ý chính 3 | We dress to suit each season. · Mỗi mùa mình mặc cho hợp. |
| Học (4 ô) | North · Miền Bắc (ảnh ghép bốn mùa); South · Miền Nam (ảnh ghép mùa mưa, mùa khô); Clothes · Quần áo theo mùa; Again and again · Lại về (vòng mùa) |
| Từ vựng | `core`: change · thay đổi; warm · ấm. Content-editor đổi được nếu trùng từ các bài trước |
| Misconception | `same_weather_all_year`: "The weather is the same all year." · "Cả năm thời tiết đều như nhau." Sửa: "The weather changes with the seasons." · "Thời tiết thay đổi theo mùa." Nguồn: ý chính của hai unit Oak Year 1 (mục tiêu bắt buộc); kinh nghiệm phổ thông [CẦN KIỂM]. Phương án khác: `seasons_come_once` ("Mùa hè qua rồi không quay lại") |
| Quiz | `single_choice`, `true_false`, `order_sequence` (ba bộ áo từ ngày lạnh tới ngày nóng: áo khoác, áo dài tay, áo cộc tay; một thứ tự đúng). Câu 6 `true_false` đáp án Sai |
| Khởi động | Ôn trộn bài 1–5; một câu ôn *Gọi tên và nhóm động vật* hoặc *Những nơi sống trên Trái Đất* làm mốc khoảng một tháng |
| Chơi | Ghép đồ với mùa: mùa đông miền Bắc (áo khoác), mùa hè (nón lá, áo cộc tay), mùa mưa miền Nam (áo mưa); bẫy content-editor chọn |
| Thẻ thưởng | Content-editor chọn (một thứ chưa có thẻ) |
| Ranh giới | Không vì sao có mùa; không biến đổi khí hậu ("mùa đông ngày càng ấm", Scientist #16) |

Ảnh bài 6: dùng lại ảnh bài 1–5; ảnh mới chỉ cho bộ áo (áo dài tay, áo cộc tay: `long sleeve shirt; t-shirt`, không nhãn hiệu, không chữ).

## 6. Nối với chủ đề trước và sau

| Chủ đề | Nhóm, số | Dùng gì, để dành gì |
| --- | --- | --- |
| *Gọi tên và nhóm động vật* | Explorer #1 | Khởi động bài 1, bài 6 ôn một câu (mốc một tháng, theo `goi-ten-va-nhom-dong-vat/_topic.md:339`) |
| *Sinh vật sống ở đâu?* | Explorer #2 | Bài 3 ôn lá xanh, lá vàng, lá khô (bài 3 của #2); dùng lại ảnh lá vàng, lá bàng đỏ. Không dạy lại sống, chết |
| *Những nơi sống trên Trái Đất* | Explorer #4 | Bài 1 ôn nơi nóng, nơi lạnh; bài 4 ôn mùa mưa, mùa khô ở xavan (bài 6 của #4). Không dạy lại nơi sống |
| *Cây quanh em* | Explorer #7 | Học sau: cây rụng lá và cây thường xanh (bài 4), tên cây Việt Nam. Bài 2, 3 chỉ nói "có cây lá vàng", "có cây ra lộc" |
| *Thời tiết và thiên tai ở Việt Nam* | Discoverer #5 | Học sau: gió là không khí chuyển động, mây là giọt nước, dụng cụ đo, mùa mưa bão, lũ, hạn hán, an toàn. Không trùng key misconception (`trees_make_wind`, `clouds_are_smoke`, `feel_tells_temperature`, `calm_means_storm_over`, `flood_only_where_it_rains`, `drought_is_one_hot_day`, `shallow_floodwater_safe`). Dùng chung bộ thẻ `set: weather` |
| *Các thể của vật chất* | Discoverer #13 | Bay hơi, ngưng tụ, sương: để dành |
| *Sinh vật và môi trường* bài 8 | Discoverer #16 | Môi trường, sinh vật đổi theo mùa: để dành |
| *Trái Đất, Mặt Trời, Mặt Trăng* | Scientist #6 | Vì sao có mùa, ngày dài ngắn, Mặt Trăng và lịch âm: để dành |
| *Năng lượng và biến đổi khí hậu* | Scientist #16 | Để dành |
| Chủ đề "bầu trời ngày và đêm" (câu D3, chờ Duy) | — | Chủ đề này không dạy ngày và đêm; nếu D3 được chốt, PM xếp cạnh chủ đề này |

## 7. Quy ước chung

**Tên gọi** (content-editor chốt trong `_topic.md`)

| Khái niệm | EN | VI | Ghi chú |
| --- | --- | --- | --- |
| thời tiết | weather | thời tiết | Như Discoverer #5 |
| mùa | season | mùa | |
| bốn mùa | spring, summer, autumn, winter | mùa xuân, mùa hè, mùa thu, mùa đông | Chính tả Anh: autumn. Chữ bé nghe không dùng "mùa hạ" |
| mùa mưa, mùa khô | rainy season, dry season | mùa mưa, mùa khô | Như #4 bài 6 và Discoverer #5 |
| miền Bắc, miền Nam | the north, the south | miền Bắc, miền Nam | Kèm "như Hà Nội", "như Thành phố Hồ Chí Minh" khi cần. Không bản đồ |
| tháng, năm | month, year | tháng, năm | Tên tháng VI viết bằng chữ: tháng Một … tháng Mười Hai [CẦN KIỂM viết hoa] |
| Tết | Tet | Tết | Chuỗi `.en` không dấu: "Tet". Nghe thử giọng EN |
| khai giảng | back to school | khai giảng | |
| hoa đào, hoa mai, hoa phượng | peach blossom, (yellow) apricot blossom, flame tree | hoa đào, hoa mai, hoa phượng | [CẦN KIỂM tên EN hoa mai] |

**Hình**
- Ảnh thật CC0, PD, PDM, CC BY; không BY-SA, NC, ND; không AI, không Pinterest (SK-033). Không ảnh hợp lệ thì đổi món. Hình tự vẽ: chỉ vòng mười hai tháng (PM đồng ý ở đây); chỗ khác hỏi PM.
- Mọi câu hỏi, lựa chọn, thẻ, món Chơi có hình.
- Không chữ, không chữ số trong hình (tờ lịch, đồng hồ, nhiệt kế, biển phố, bao bì bánh).
- Người trong ảnh (phố mùa đông, bãi biển, khai giảng) ở xa, không nhận ra mặt; không trẻ em nhìn rõ mặt.
- Ảnh mang tên nơi (Hà Nội, Sa Pa) phải khớp trang gốc; không khớp thì bỏ tên nơi ở brief và `alt`.
- Không bản đồ, không quả địa cầu, không ảnh vệ tinh thấy Việt Nam.
- Hai cảnh trong một câu khác nhau rõ bằng mắt (luật Explorer số 7): không đặt hoa đào cạnh hoa mai, không đặt mùa khô miền Nam cạnh ảnh hạn hán.

**An toàn và nhạy cảm**
- Không bão, lũ, sét, thiên tai; không người gặp nạn.
- Không câu nào bảo bé nhìn Mặt Trời.
- Không lễ tôn giáo; Tết, Trung thu là lễ dân gian, chỉ dùng như mốc, dấu hiệu.
- Không hỏi, không lưu nơi ở, tháng sinh của bé.

## 8. Các bài cũ của #5 và #8

- **Bỏ khỏi danh mục cả hai chủ đề** (theo câu Duy 17/11 "gôm chung lại thành 1 topic"; PM ghi, không hỏi). Không mất công: hai chủ đề chưa soạn bài nào, chưa có `topic_id`, `lesson_id`, chưa có thư mục `content/explorer/…`, chưa có ảnh, audio.
- Mười slug lesson Oak ghi lại ở `_topic.md` mục Nguồn của chủ đề mới và ở `syllabus-lessons.md` (mục Explorer #5 mới, ghi "gộp từ hai unit Oak Y1 #2, #5").
- Tên bài VI đã bản địa hoá ở danh mục cũ ("Dấu hiệu mùa thu và cuối mùa mưa"…) không dùng lại (mục 3).
- Hai icon `seasonal-changes-autumn-and-winter` (lá rơi), `seasonal-changes-spring-and-summer` (ô che mưa, nắng sau mây) bỏ khỏi app; designer giữ file gốc nếu muốn dùng lại nét.
- Câu còn chờ Duy ở [syllabus.md](../syllabus.md) mục 8 ý 2 ("Tên VI hai chủ đề mùa") hết hiệu lực. Câu D4 ở [syllabus-review-2026-11-13.md](syllabus-review-2026-11-13.md) (PM khi đó đề xuất "không gộp") được trả lời: Duy chọn gộp, 17/11.

## 9. Quyết định (chốt 17/11; lựa chọn đầy đủ ở [SK-050](backlog/SK-050-explorer-weather-and-seasons.md))

Duy 17/11, qua phiên chính: "bật mode auto, không cần hỏi thêm". Sáu câu theo đề xuất PM.

| # | Câu hỏi | Đã chốt |
| --- | --- | --- |
| 1 | Tên chủ đề | A · *Weather and seasons · Thời tiết và các mùa*; key `new-weather-and-seasons`, slug `thoi-tiet-va-cac-mua` |
| 2 | Vị trí | A · Explorer #5, sau *Những nơi sống trên Trái Đất*; 5 chặng |
| 3 | Số bài | A · 6 bài (mục 5) |
| 4 | Mùa theo miền | a · Cả hai miền: bài 2–3 miền Bắc, bài 4 miền Nam |
| 5 | Lịch | a · Chỉ dương lịch; Tết là mốc; tên tháng chỉ nghe |
| 6 | Khi nào soạn | a · Soạn ngay |
