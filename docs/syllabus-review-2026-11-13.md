# Rà syllabus 13/11/2026: bỏ *Ăn uống lành mạnh*, ưu tiên kiến thức chung

Trạng thái: **đề xuất, chờ Duy chốt.** Chưa sửa `syllabus.md`, `syllabus-lessons.md`, `content/syllabus.json` hay tài liệu nào khác.
Nguồn: Duy góp ý 13/11 ("phần ăn uống lành mạnh tham khảo ở đâu vậy? t thấy không cần thiết lắm. có thể bỏ luôn"; "review lại syllabus, ưu tiên những topic generics, kiến thức tổng quát"). Đối chiếu [syllabus.md](../syllabus.md) và [syllabus-lessons.md](../syllabus-lessons.md) bản Duy duyệt 9/11 (45 chủ đề, 384 bài).

Giữ nguyên các luật đã chốt:
- theo đúng thứ tự unit và lesson của Oak, 1 lesson = 1 bài; chỗ nào lệch Oak đều ghi **LỆCH** kèm lý do;
- chủ đề mới đứng đầu nhóm;
- app không khoá bài.

Không đề xuất sửa các chủ đề đã soạn: Discoverer #1–#6 (pilot, 38 bài) và Explorer #1 (6 bài).

## 1. *Ăn uống lành mạnh* lấy từ đâu

**Nguồn:** unit Oak Year 3 #4 [Healthy eating](https://www.thenational.academy/teachers/programmes/science-primary-ks2/units/healthy-eating/lessons), 12 lesson. Unit này dạy yêu cầu bắt buộc Year 3 trong chương trình quốc gia Anh: động vật và người cần đủ loại, đủ lượng chất dinh dưỡng, không tự làm ra thức ăn mà phải ăn.

**Bài nào bắt buộc:** chỉ 5/12 lesson.

| Lesson Oak | Bắt buộc | Nội dung |
| --- | --- | --- |
| 1. Making or finding food | ✓ | Cây tự làm thức ăn, động vật phải đi tìm |
| 2. Types of food · 4. Nutrition from food | ✓ | Nhóm chất: bột, đạm, béo, vitamin, chất xơ, nước |
| 3. Amounts of food | ✓ | Ăn bao nhiêu là đủ |
| 5–6. Fats in food (thí nghiệm) | — | Thử chất béo bằng giấy thấm |
| 7–8. Nutrient-rich meal | — | Lên thực đơn đủ chất |
| 9. Different diets for different people | ✓ | Chế độ ăn theo tuổi, sức khoẻ, tôn giáo |
| 10–12. Sustainable food, Local food, Food miles | — | Thực phẩm bền vững, đồ ăn địa phương, quãng đường vận chuyển thực phẩm (food miles) |

**Vì sao đã soạn 2 bài:**
- Bản 26/10 xếp theo độ khó, chủ đề này dễ nhất (Mức 2) nên đứng đầu Discoverer.
- Nó được chọn làm bài mẫu chuẩn chất lượng (SK-002, SK-028).
- Từ 9/11 nó là Discoverer #9, nằm ngoài pilot.
- 2 bài đã soạn là "Thức ăn cho ta những gì?" (lesson 2 + 4) và "Mâm cơm cân bằng" (lesson 7–8 + 3).

**Ý dinh dưỡng vẫn còn ở hai chủ đề khác** nếu bỏ chủ đề này:
- Explorer #12 *Em khoẻ mạnh* (Oak Y2): bài 4–6 về các loại thức ăn, ăn bao nhiêu, nhà khoa học thực phẩm.
- Scientist #12 *Giữ gìn sức khoẻ* (Oak Y6): bài 1 chế độ ăn cân bằng, bài 2–3 đạm bền vững và mycoprotein.

Trong mảng "Thực phẩm" của sách bách khoa, Explorer #12 vẫn giữ phần này.

| Phương án | Làm gì | Chênh số bài | Lệch Oak |
| --- | --- | --- | --- |
| **A. Bỏ hẳn** (khuyến nghị) | Xoá Discoverer #9 khỏi danh mục. Lưu 2 bài đã soạn vào kho, không hiện trong app | −10 | Bỏ 1 unit Oak; đây là unit thứ 2 bị bỏ, sau *Materials* Y6 |
| B. Gộp ngắn | Bỏ chủ đề; dùng lại bài "Thức ăn cho ta những gì?" làm bài mở đầu thêm cho *Hệ tiêu hoá* (Discoverer #12): ăn gì, rồi thức ăn đi đâu | −9 | Bỏ 1 unit Oak và thêm 1 bài ngoài Oak vào unit Y4 #1 |
| C. Giữ, làm sau | Dời xuống cuối Discoverer, soạn sau cùng | 0 | Đổi thứ tự (Y3 #4 xuống cuối) |

**Khuyến nghị A**, vì ba lý do:
1. Kiến thức dinh dưỡng đã có ở Explorer #12 và Scientist #12, nên trẻ không mất nền.
2. 7/12 lesson của unit này không bắt buộc, phần lớn là thí nghiệm trên lớp và đề tài bền vững kiểu Anh (food miles).
3. Duy đã nói có thể bỏ.

Phương án B giữ được công đã soạn nhưng thêm một chỗ lệch Oak cho một bài.

**Ảnh hưởng kỹ thuật của A:** các file sau đang dùng `healthy-eating` / `an-uong-lanh-manh`:
- 21 file trong `apps/ios`, chủ yếu là test và fixture; `Art.swift` dùng làm hình mặc định của mạch;
- `content/syllabus.json`;
- gói nội dung: gói hiện có 8 chủ đề, bỏ chủ đề này thì còn 7;
- technical-plan, nơi ghi "bài mẫu chuẩn chất lượng" và prompt soạn nháp.

Fixture của `content-cli` và `content-schema` là bản sao riêng, giữ lại được. Mốc nội dung pilot không bị ảnh hưởng. Cần một ticket nhỏ cho ios-dev và dev để đổi fixture test sang một bài pilot, kèm đổi bài mẫu chuẩn sang một bài pilot đã duyệt.

## 2. Rà ba nhóm: chủ đề chung và chủ đề hẹp

**Tiêu chí "chung":** kiến thức nền mà trẻ ở hầu hết chương trình đều học. Các mảng gồm:
- sinh vật: động vật, thực vật, môi trường sống, chuỗi thức ăn;
- cơ thể người;
- vật liệu và các thể của chất;
- Trái Đất và bầu trời, thời tiết;
- lực, ánh sáng, âm thanh, điện.

Đối chiếu với CT GDPT 2018, Cambridge Primary và NGSS (Mỹ).

**"Hẹp"** là một trong hai loại:
- unit gắn với lịch học hoặc đề tài riêng của Anh;
- unit lặp lại kiến thức đã có ở nhóm khác.

**Nhận xét chung:**
- Gần như mọi unit Oak đều thuộc loại "chung". Chủ đề hẹp rõ nhất là *Ăn uống lành mạnh*.
- Chỗ yếu lớn nhất là ở **Explorer**: nhóm này không có Trái Đất và bầu trời, cũng không có lực, ánh sáng, âm thanh. Trong khi đó NGSS dạy đẩy, kéo và thời tiết từ mẫu giáo, ánh sáng, âm thanh, Mặt Trời, Mặt Trăng và các vì sao từ lớp 1. CT VN lớp 1 có "bầu trời ban ngày, ban đêm" [CẦN KIỂM].
- Lọc theo nhãn "không bắt buộc" của Oak không cho ra danh sách bài hẹp. Ví dụ *The planets in our solar system* (Scientist #6) là bài không bắt buộc nhưng rất chung, trong khi *Electrical careers* (Scientist #11) là bài bắt buộc nhưng hẹp. Vì vậy đề xuất này không cắt bài lẻ (xem quyết định D6).
- App không khoá bài, nên thứ tự chủ đề chỉ quyết định hai việc: "bài tiếp theo" mà app gợi ý, và thứ tự soạn.

### 2.1 Explorer (5–7 tuổi): thêm 2 chủ đề chung, xếp hai chủ đề mùa liền nhau

| # mới | # cũ | Chủ đề | Nguồn | Bài | Ghi chú |
| --- | --- | --- | --- | --- | --- |
| 1 | — | **Bầu trời ngày và đêm** (Sky by day and night) | **Mới** | ~5 | Mặt Trời cho ánh sáng và hơi ấm; ngày và đêm; Mặt Trăng; các vì sao; không nhìn thẳng Mặt Trời. Theo CT VN lớp 1 [CẦN KIỂM] và NGSS 1-ESS1 |
| 2 | — | **Đẩy, kéo và âm thanh quanh em** (Pushes, pulls and sounds) | **Mới** | ~5 | Đẩy và kéo; nhanh và chậm; âm thanh quanh em; to và nhỏ; sáng và tối. Theo NGSS K-PS2, 1-PS4 và Cambridge Stage 1 [CẦN KIỂM]. Duy đã treo câu hỏi này ở syllabus-progression mục 12 |
| 3 | 1 | Gọi tên và nhóm động vật | Y1 #1 | 6 | Đã soạn, không đổi nội dung |
| 4 | 3 | Cơ thể của em | Y1 #3 | 6 | |
| 5 | 4 | Cây quanh em | Y1 #4 | 7 | |
| 6 | 2 | Thu, đông và mùa khô | Y1 #2 | 5 | **LỆCH:** dời từ sau *Động vật* xuống sau *Cây*. Xem lý do dưới bảng |
| 7 | 5 | Xuân, hè và mùa mưa | Y1 #5 | 5 | |
| 8–14 | 6–12 | Vật liệu quanh em → Em khoẻ mạnh | Y1 #6 → Y2 #6 | 44 | Giữ đúng thứ tự Oak |

**Lý do dời *Thu, đông và mùa khô*:** Oak đặt mùa thu ở #2 vì năm học ở Anh bắt đầu vào mùa thu. App không theo lịch năm học, và Việt Nam có mùa khác nhau theo miền, nên học trọn một năm liền mạch dễ hiểu hơn. Hai chủ đề chung về cơ thể và cây được lên trước.

Tổng: 14 chủ đề, **83 bài** (+10). Hai chủ đề mới đứng đầu theo luật 9/11. Nếu Duy muốn *Động vật* (đã soạn) vẫn là chủ đề đầu, xem D3.

### 2.2 Discoverer (7–9 tuổi): chỉ bỏ #9, còn lại giữ thứ tự Oak

| # mới | # cũ | Chủ đề | Nguồn | Bài | Ghi chú |
| --- | --- | --- | --- | --- | --- |
| 1–6 | 1–6 | Bề mặt Trái Đất → Đá và đất | 5 mới + Y3 #1 | 38 | Pilot, đã soạn, không đổi |
| 7 | 7 | Bộ xương và cơ bắp | Y3 #2 | 8 | Chung |
| 8 | 8 | Lực và nam châm | Y3 #3 | 11 | Chung |
| — | 9 | ~~Ăn uống lành mạnh~~ | Y3 #4 | ~~10~~ | **LỆCH:** bỏ (mục 1) |
| 9 | 10 | Cây làm gì và cần gì | Y3 #5 | 13 | Chung |
| 10 | 11 | Ánh sáng và bóng tối | Y3 #6 | 8 | Chung |
| 11 | 12 | Hệ tiêu hoá | Y4 #1 | 7 | Chung |
| 12 | 13 | Các thể của vật chất | Y4 #2 | 13 | Chung; nối với *Thời tiết* (#5) qua vòng tuần hoàn nước |
| 13 | 14 | Mạch điện đơn giản | Y4 #3 | 10 | Chung |
| 14 | 15 | Âm thanh | Y4 #4 | 11 | Chung |
| 15 | 16 | Sinh vật và môi trường | Y4 #5 | 17 | Chung, dài |
| 16 | 17 | Chuỗi thức ăn nâng cao | Y4 #6 | 9 | Phần đầu lặp ý của Explorer #10. Đã đứng cuối, giữ nguyên |

Tổng: 16 chủ đề, **145 bài** (−10). Các unit Oak Year 3–4 còn lại đều là kiến thức chung và có thứ tự nền hợp lý, nên tôi không đề xuất dời chủ đề nào.

### 2.3 Scientist (9–11 tuổi): kéo chủ đề vũ trụ lên, dời hai chủ đề hẹp xuống

| # mới | # cũ | Chủ đề | Nguồn | Bài | Ghi chú |
| --- | --- | --- | --- | --- | --- |
| 1 | 1 | Nước và không khí | Mới | 5 | Chung |
| 2 | 2 | Các vì sao và du hành vũ trụ | Mới | 5 | Chung |
| 3 | 6 | Trái Đất, Mặt Trời, Mặt Trăng | Y5 #3 | 12 | **LỆCH (mạnh):** kéo lên trước Y5 #1, #2. Lý do dưới bảng |
| 4 | 4 | Tính chất và biến đổi vật liệu | Y5 #1 | 19 | Chung |
| 5 | 5 | Lực và máy đơn giản | Y5 #2 | 10 | Chung |
| 6–9 | 7–10 | Sinh sản thực vật → Hệ tuần hoàn | Y5 #4 → Y6 #1 | 35 | Giữ thứ tự Oak |
| 10 | 12 | Giữ gìn sức khoẻ | Y6 #3 | 11 | Lên một bậc do *Mạch điện nâng cao* dời đi; đứng ngay sau *Hệ tuần hoàn* (nhịp tim) |
| 11 | 3 | Nấm | Mới | 4 | **LỆCH luật "chủ đề mới đứng đầu"** (không lệch Oak). Lý do dưới bảng |
| 12 | 13 | Phân loại sinh vật | Y6 #4 | 11 | |
| 13 | 14 | Tiến hoá và di truyền | Y6 #5 | 13 | |
| 14 | 15 | Ánh sáng truyền đi thế nào | Y6 #6 | 10 | |
| 15 | 11 | Mạch điện nâng cao | Y6 #2 | 13 | **LỆCH (nhẹ):** dời từ sau *Hệ tuần hoàn* xuống. Lý do dưới bảng |
| 16 | 16 | Năng lượng và biến đổi khí hậu | Y6 #8 | 8 | |

Lý do các chỗ lệch:
- **Trái Đất, Mặt Trời, Mặt Trăng (kéo lên #3):** đây là kiến thức chung nhất của nhóm, trẻ VN đã học ở lớp 3, và nó tạo thành một khối vũ trụ liền với *Các vì sao*. Trước khi chốt cần kiểm mục "Prior knowledge" trên trang Oak xem unit này có cần bài trọng lực của Y5 #2 không [CẦN KIỂM].
- **Nấm (dời xuống #11):** đây là chủ đề hẹp nhất trong 8 chủ đề mới. Đặt ngay trước *Phân loại sinh vật* (vi sinh vật, nấm men) thì liền mạch.
- **Mạch điện nâng cao (dời xuống #15):** chủ đề này hẹp, lặp phần lớn *Mạch điện đơn giản* (Discoverer #14) và có các bài kiểu Anh (ký hiệu mạch, nghề điện, cảm biến). Đặt ngay trước *Năng lượng* thì nối được ý điện bền vững.

Tổng: 16 chủ đề, **156 bài** (không đổi).

### 2.4 Tổng số bài và mốc GĐ 0

| Nhóm | 9/11 (chủ đề / bài) | Đề xuất (chủ đề / bài) | Hết nhóm (3 bài/tuần + tuần ôn) |
| --- | --- | --- | --- |
| Explorer | 12 / 73 | 14 / 83 | ~30 → ~35 tuần |
| Discoverer | 17 / 155 | 16 / 145 | ~65 → ~60 tuần |
| Scientist | 16 / 156 | 16 / 156 | ~65 tuần |
| **Tổng** | **45 / 384** | **46 / 384** | |

Ảnh hưởng tới mốc 16/1/2027:
- **Pilot không đổi:** 38 bài Discoverer #1–#6 đã soạn và đang review.
- **Bỏ #9:** gói còn 7 chủ đề. Việc kéo theo là đổi fixture test iOS và bài mẫu chuẩn, khoảng một ticket nhỏ, không nằm trên đường găng.
- **Hai chủ đề Explorer mới (~10 bài)** soạn sau GĐ 0, không đụng mốc.
- **Bản đồ Hành trình (SK-034):** bộ biểu tượng chủ đề từ 45 đổi thành 46, gồm bỏ 1 và vẽ thêm 2.

## 3. Quyết định cho Duy

| # | Câu hỏi | Lựa chọn | Đề xuất PM |
| --- | --- | --- | --- |
| D1 | *Ăn uống lành mạnh* (Discoverer #9) | A bỏ hẳn · B gộp 1 bài vào *Hệ tiêu hoá* · C giữ, dời cuối | **A.** 2 bài đã soạn được lưu kho, không xoá, và dùng làm fixture test cho tới khi đổi xong |
| D2 | Bài về ăn uống ở chủ đề khác: Explorer #12 bài 4–6, Scientist #12 bài 1–3 | a giữ cả · b bỏ Scientist #12 bài 2–3 (đạm bền vững, mycoprotein, không bắt buộc) · c bỏ hết | **a.** Đây là phần nhỏ trong unit sức khoẻ rộng hơn, và nếu bỏ D1 thì trước Scientist chỉ còn Explorer #12 dạy nhóm thức ăn |
| D3 | Thêm chủ đề chung cho Explorer | 2 chủ đề (bầu trời; đẩy, kéo, âm thanh) · chỉ 1 (bầu trời) · không thêm | **2 chủ đề, ~10 bài, soạn sau GĐ 0**, đặt đầu nhóm theo luật 9/11. Nếu muốn *Động vật* vẫn đứng đầu: đặt 2 chủ đề này ngay trước hai chủ đề mùa |
| D4 | Hai chủ đề mùa của Explorer | giữ thứ tự Oak · đứng liền nhau sau *Cơ thể*, *Cây* · gộp thành 1 chủ đề "Mùa và thời tiết" | **Đứng liền nhau, không gộp.** Giữ đủ 10 lesson Oak, chỉ lệch thứ tự. Tên VI hai chủ đề vẫn chờ Duy (syllabus.md mục 8 ý 2) |
| D5 | Thứ tự Scientist | chốt từng ý: (i) kéo *Trái Đất, Mặt Trời, Mặt Trăng* lên #3; (ii) dời *Nấm* xuống trước *Phân loại sinh vật*; (iii) dời *Mạch điện nâng cao* xuống #15 | **Đồng ý cả (i) và (ii); (iii) tuỳ Duy**, lợi ích nhỏ hơn |
| D6 | Cắt bài lẻ hẹp trong các unit Oak còn lại (food scientists, electrical careers, light pollution…) | không cắt, giữ 1:1 · cắt theo danh sách PM soạn | **Không cắt.** Giữ luật 1:1 Duy chốt 9/11; content-editor bản địa hoá ví dụ khi soạn |

Khi Duy chốt, pm sẽ:
- sửa `syllabus.md`, `syllabus-lessons.md`, `syllabus-progression.md` (đóng hai câu ở mục 12), `prd.md` và `technical-plan.md` (bài mẫu chuẩn, số bài);
- mở ticket cho từng agent:
  - dev: `content/syllabus.json` và `validate`;
  - ios-dev: fixture test, gói, `Art.swift`;
  - designer: biểu tượng chủ đề;
  - content-editor: lưu kho 2 bài, sau đó lên danh sách bài cho chủ đề Explorer mới.

## Duy chốt 14/11 (thứ tự Explorer)
Sau *Gọi tên và nhóm động vật*, hai chủ đề tiếp theo là *Sinh vật sống ở đâu?* (Oak Y2 `living-things-and-where-they-live`) rồi *Chuỗi thức ăn* (Oak Y2 `introduction-to-food-chains`). Đã đổi thứ tự trong `content/syllabus.json` (Explorer #2, #3; các chủ đề sau lùi một bậc). Lệch luật "Mức không giảm" (hai chủ đề Mức 3 đứng trước các chủ đề Mức 1–2) theo quyết định của Duy. PM cập nhật `syllabus.md`, `syllabus-lessons.md`. *(16/11: đã cập nhật cả hai file.)*

## Ghi chú 16/11 (câu D3, SK-048)
- Explorer đã có một chủ đề mới: *Những nơi sống trên Trái Đất*, đứng #4 sau *Chuỗi thức ăn*, 8 bài (Duy chốt 16/11, [SK-048](backlog/SK-048-explorer-habitats-around-the-world.md)). Chủ đề này không đứng đầu nhóm.
- Số đếm hiện hành: Explorer 13 chủ đề / 83 bài; cả app 46 chủ đề / 394 bài ([syllabus.md](../syllabus.md) mục 0, 3).
- Bảng mục 2.1 và 2.4 ở trên là thứ tự, số đếm trước 14/11. Con số "14 / 83" ở mục 2.4 là đề xuất D3 cũ (12 chủ đề + 2 chủ đề mới, 73 + 10 bài), chỉ trùng số bài với số hiện hành, không cùng nghĩa.
- D3 vẫn chờ Duy. Nếu Duy chốt D3, PM xếp hai chủ đề còn lại (bầu trời; đẩy, kéo và âm thanh) tính cả chủ đề #4 này, và đánh số từ thứ tự hiện hành ở `content/syllabus.json`.
