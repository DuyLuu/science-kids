# Đề xuất chủ đề Explorer mới: Những nơi sống trên Trái Đất

Trạng thái: **đã chốt 16/11** (Duy chốt chín câu, cả chín theo đề xuất PM) · Ngày: 16/11/2026 · Viết: pm · Ticket: [SK-048](backlog/SK-048-explorer-habitats-around-the-world.md)
Nguồn: Duy 16/11 (thêm vào Explorer một chủ đề về môi trường sống của động vật hoang dã: đồng cỏ savan châu Phi, đầm lầy, rừng rậm Amazon, sa mạc Sahara, Bắc Cực…); [syllabus.md](../syllabus.md) mục 1–3; [syllabus-progression.md](../syllabus-progression.md) mục 3, 4, 5.1, 6–8, 11; `content/syllabus.json`; [docs/oak/living-things-and-where-they-live.md](oak/living-things-and-where-they-live.md); [docs/oak/geography-y2-cold-and-hot-places.md](oak/geography-y2-cold-and-hot-places.md) (Oak Địa lý Year 2, đọc 16/11); `_topic.md` và các bài của ba chủ đề Explorer đã soạn; `content/TEMPLATE.md` (bảy luật Explorer, mục SK-044, SK-047); `content/rules.json` (`explorer.authoring`); [quiz-system-proposal.md](quiz-system-proposal.md); [syllabus-review-2026-11-13.md](syllabus-review-2026-11-13.md) (câu D3).

Duy chốt ngày 16/11 bằng nút "Theo đề xuất PM", hai lượt: câu 1–7, rồi câu 8, 9. Câu 8, 9 lộ ra khi PM ghi kết quả đọc Oak Geography KS1 (phiên chính đọc trang): Oak Year 2 Địa lý có bài riêng cho rừng mưa, sa mạc nóng, động vật Bắc Cực, động vật Nam Cực. Chủ đề vì thế có **8 bài**, học **nơi lạnh trước nơi nóng** như Oak.

Tài liệu đã sửa ngày 16/11: `syllabus.md`, `syllabus-lessons.md`, `syllabus-progression.md`, `prd.md`, `technical-plan.md`, `docs/syllabus-review-2026-11-13.md`. Chưa soạn bài, chưa giao content-editor (câu 7: soạn sau khi SK-045, SK-046 đóng rà chữ). Chưa thêm vào `content/syllabus.json`: chờ phiên SK-047 commit (SK-048 mục "Việc kéo theo"). Tên bài EN/VI ở mục 4 là tên dùng cho danh mục (đã ghi vào `syllabus-lessons.md`); content-editor muốn đổi thì báo PM để sửa danh mục cùng lúc. Các câu EN/VI khác ở mục 4 là nháp của PM; content-editor viết lại theo luật Explorer khi được giao.

## 0. Tóm tắt

- **Chủ đề mới đầu tiên của Explorer** (5–7 tuổi, chưa biết đọc): *Habitats around the world · Những nơi sống trên Trái Đất*.
- **Không có unit Oak Science tương ứng.** Oak Địa lý Year 2 có hai unit gần: *Cold places* và *Hot places*. Bốn lesson của chúng làm sườn một phần cho bài 1, 2, 3, 7 (mục 2.1).
- **8 bài**, thứ tự đã chốt:
  1. Bắc Cực (`opener`)
  2. Nam Cực
  3. Rừng mưa nhiệt đới
  4. Rừng ngập mặn và đầm lầy
  5. Biển và đại dương
  6. Đồng cỏ xavan
  7. Sa mạc (`apply`)
  8. Mỗi con vật một nơi sống (`review`)

  Bài 2–6 là `core`.
- **Mức 3** (11 điểm, 2-3-2-2-2), **mạch Sinh vật & môi trường**, DOK 3·3·0 như mọi chủ đề Explorer.
- **Vị trí: Explorer #4**, ngay sau *Chuỗi thức ăn*. Các chủ đề từ *Thu, đông và mùa khô* lùi một bậc (#5–#13).
- **Số đếm sau khi thêm:** Explorer 13 chủ đề / 83 bài; cả app 46 chủ đề / 394 bài.
- **Không dùng từ "thích nghi · adaptation"**, không dùng bản đồ, chưa làm bản Discoverer; soạn sau khi SK-045, SK-046 đóng rà chữ.
- **Chỗ lệch Oak** ở mục 2.2. **Câu hỏi cho Duy:** đã chốt hết (mục 8).

## 1. Định vị

### 1.1 Nhóm Explorer (đã chốt, không đổi)

- 5–7 tuổi, sườn Oak Year 1–2, chưa biết đọc ([syllabus.md](../syllabus.md) mục 1; [prd.md](../prd.md) dòng 34).
- Học bằng nghe và nhìn: audio EN và VI đọc mọi chữ, đáp án bằng hình, bài 5–7 phút, quiz 6 câu.
- Dạng câu Explorer: `single_choice` 2–3 lựa chọn, `true_false` bằng biểu tượng, `order_sequence` 3 thẻ (`content/rules.json`, `explorer.authoring`). Khởi động chỉ `single_choice` và `true_false`.
- Mỗi câu EN tối đa 8 từ. Mỗi bài 2–3 từ mới `core` ([syllabus-progression.md](../syllabus-progression.md) mục 8).
- Mọi câu hỏi, mọi lựa chọn, mọi thẻ có hình. Không có câu lời Na. Câu 6 là câu misconception bằng hình, DOK 2.
- Sau Quiz có bước Tổng kết (SK-047): câu 6 dạng `true_false` đáp án Sai thành thẻ "Ý sai → Ý đúng".

### 1.2 Mức (chấm theo [syllabus-progression.md](../syllabus-progression.md) mục 3)

| Tiêu chí | Điểm | Lý do |
| --- | --- | --- |
| A. Mức trừu tượng | 2 | Con vật và cảnh nhìn được qua ảnh. Nhưng nơi sống ở rất xa, bé không tự thấy; "nóng hay lạnh, mưa nhiều hay ít quanh năm" là ý gộp nhiều ngày. Không dùng bản đồ, xích đạo, nên chưa lên 3 |
| B. Kiến thức nền | 3 | Cần #1 *Gọi tên và nhóm động vật* (tên con vật, "động vật hoang dã") và #2 *Sinh vật sống ở đâu?* (nơi sống, nước mặn và nước ngọt, rừng ngập mặn, đồi cát không phải sa mạc). Dùng nhẹ #3 *Chuỗi thức ăn* (con vật ăn gì) |
| C. Misconception | 2 | Có quan niệm sai nhưng sửa được bằng ảnh: gấu trắng ăn chim cánh cụt; gấu trắng sống ở Nam Cực; bướu lạc đà chứa nước; sư tử sống trong rừng rậm; đầm lầy không có gì sống |
| D. Tải từ vựng EN | 2 | 2–3 từ mới mỗi bài, dễ đọc: Arctic, Antarctic, rainforest, swamp, ocean, savanna, desert. Tên loài để `extra` |
| E. Kỹ năng khoa học | 2 | So sánh nơi sống theo nóng, lạnh, ướt, khô; xếp thứ tự (khô tới ướt, nông tới sâu); ghép con vật với nơi sống |

**Tổng 11 → Mức 3**, bằng *Sinh vật sống ở đâu?* và *Chuỗi thức ăn* (cùng 11).

Nếu dạy "thích nghi" như một khái niệm: C lên 3 (trẻ hay nghĩ con vật tự đổi cơ thể vì cần; quan niệm sai này đã được nghiên cứu ghi nhận [CẦN KIỂM nguồn]), D lên 3 (adaptation là từ gốc Latin). Tổng 13 → Mức 4, vượt khung Explorer (Mức 1–3). Đây là một lý do để không dùng từ này (câu 5; Duy chốt không dùng, 16/11).

### 1.3 Mạch

**Sinh vật & môi trường** (`living_environment`), cùng mạch với #2 và #3. Chủ đề chạm cả mạch Trái Đất & bầu trời (nóng, lạnh, mưa, khô), nhưng trọng tâm là con vật sống ở đâu.

Chủ đề này không lấp hai chỗ trống đã ghi của Explorer: mạch Năng lượng & lực, và bầu trời ([syllabus-review-2026-11-13.md](syllabus-review-2026-11-13.md) câu D3, vẫn chờ Duy).

### 1.4 DOK và dạng câu

- Quiz DOK 1·1·1·2·2·2 (Explorer 3·3·0). Câu 1 DOK 1. Không có DOK 3.
- DOK 1, ví dụ: "Con nào sống ở sa mạc?" (nhớ lại ô Học).
- DOK 2, ví dụ:
  - từ một đặc điểm nhìn thấy suy ra nơi sống ("Con vật lông thật dày sống ở đâu?");
  - xếp nơi sống theo một trục (khô tới ướt);
  - bác một câu sai bằng điều đã học ("Gấu trắng sống ở Nam Cực.", Sai).
- Không hỏi "vì sao" cần lập luận bằng bằng chứng (đó là DOK 3).
- Mỗi bài ít nhất hai dạng câu. `order_sequence` chỉ dùng khi có đúng một thứ tự đúng (gợi ý ở từng bài, mục 4).

### 1.5 Vị trí trong lộ trình Explorer

`content/syllabus.json` hiện xếp Explorer: #1 *Gọi tên và nhóm động vật* (Oak Y1 #1), #2 *Sinh vật sống ở đâu?* (Y2 #5), #3 *Chuỗi thức ăn* (Y2 #4), rồi #4 trở đi theo Oak. Thứ tự #2, #3 là lệch Oak do Duy chốt 14/11 ([syllabus-review-2026-11-13.md](syllabus-review-2026-11-13.md) mục "Duy chốt 14/11").

| Phương án | Vị trí | Được | Mất |
| --- | --- | --- | --- |
| A | #1, theo luật 9/11 "chủ đề mới đứng đầu nhóm" | Đúng luật 9/11 | Chủ đề cần nền của #1, #2 mà lại đứng trước chúng; phải tự dạy lại "nơi sống", tên các nhóm con vật. Chủ đề #1 đang là Free, Mức 1 |
| B | #3, ngay sau *Sinh vật sống ở đâu?* | Nối thẳng bài 4 "Nơi sống của con vật" | Tách hai unit Oak Year 2 mà Duy vừa xếp liền nhau 14/11; *Chuỗi thức ăn* đã soạn lùi xuống #4 |
| **C (Duy chốt 16/11)** | **#4, ngay sau *Chuỗi thức ăn*** | Giữ nguyên cụm ba chủ đề Duy xếp 14/11; đủ nền (tên con vật, nơi sống, con vật ăn gì); Khởi động ôn được cả ba chủ đề; thành cụm bốn chủ đề về con vật liền nhau | Lệch luật "chủ đề mới đứng đầu"; *Thu, đông và mùa khô* và các chủ đề sau lùi một bậc |
| D | #13, cuối nhóm, như phần mở rộng sau các unit Oak (giống bài 7, 8 của #1) | Không đụng thứ tự phần còn lại | Cách #2 mười chủ đề, mất nối; Khởi động khó ôn lại "nơi sống" |

Nếu Duy chốt cả câu D3 (hai chủ đề Explorer mới khác: bầu trời; đẩy, kéo và âm thanh), PM xếp vị trí hai chủ đề đó, tính cả chủ đề này ở #4.

**Kiểm lại với Oak Địa lý (16/11): giữ #4, không đặt #1.**
- Bốn lesson Oak dùng làm sườn đều ở Year 2 Địa lý. Đặt #1 là đưa nội dung Year 2 lên đầu nhóm, trước unit Year 1 *Naming and grouping animals*: càng xa Oak hơn.
- Ở #4, chủ đề đứng sau hai unit Science Year 2 (#2, #3), đúng năm học của bốn lesson Địa lý.
- Còn một chỗ hở. Oak Địa lý *Cold places* coi mùa và thời tiết là kiến thức đã có (Year 1 Địa lý *Seasons*). Ở app, hai chủ đề mùa của Explorer đứng sau #4. Cách bù: không dạy mùa ở bài 1, 2 (vùng cực); bài 6 (xavan) tự giới thiệu mùa mưa, mùa khô bằng câu đơn giản (mục 2.2 ý 6, mục 5).

### 1.6 Vì sao thêm chủ đề này (luật 3 ở [syllabus.md](../syllabus.md) mục 2)

Luật 3: thêm chủ đề khi có trong sách bách khoa hoặc CT VN, Oak tiểu học không có, và hợp tuổi.

- **Sách bách khoa (9/11):** không có mục riêng về nơi sống. Gần nhất là mảng Động vật (có vú, chim, bò sát, lưỡng cư, cá) và mảng Trái Đất (Hành tinh xanh, Lục địa, Đại dương).
- **CT GDPT 2018, Tự nhiên và Xã hội lớp 2:** có "môi trường sống của thực vật và động vật", phân loại theo trên cạn, dưới nước, và bảo vệ môi trường sống [CẦN KIỂM, chưa đối chiếu sách]. Chủ đề này rộng hơn: nơi sống khắp Trái Đất.
- **NGSS:** K-ESS3-1 (nhu cầu của con vật và nơi chúng sống); 2-LS4-1 (so sánh sự đa dạng của sinh vật ở các nơi sống khác nhau) [CẦN KIỂM].
- **Chương trình Anh:** vùng nóng, vùng lạnh của thế giới nằm ở môn Địa lý KS1. Đã kiểm qua Oak ngày 16/11: Year 2 Địa lý có unit *Cold places* và *Hot places* ([oak/geography-y2-cold-and-hot-places.md](oak/geography-y2-cold-and-hot-places.md)). Oak Science tiểu học không có unit riêng. Ở KS2, Oak Địa lý Year 3 có unit *Climate zones* (chưa đọc; có xavan hay không [CẦN KIỂM]).
- **Hợp tuổi:** làm được bằng ảnh và giọng đọc; con vật ở xa là chủ đề bé 5–7 tuổi rất thích.

## 2. Liên hệ Oak

### 2.1 Unit và lesson Oak liên quan

| Unit, lesson Oak | Năm | Trong app | Liên hệ với chủ đề này |
| --- | --- | --- | --- |
| *Naming and grouping animals*, lesson 1 (thú cưng, động vật hoang dã) và 2–4 (các nhóm) | Y1 #1 | Explorer #1 | Nền: tên con vật, "động vật hoang dã" |
| *Living things and where they live*, lesson 4 *Animal habitats*, lesson 5 *Plant habitats* | Y2 #5 | Explorer #2 bài 4, 5 | Nền: "habitat", nơi sống cho thức ăn, nước, chỗ trú. Quiz Oak dùng Bắc Cực, sa mạc, rừng mưa, xavan, rạn san hô làm ví dụ ghép, nhưng không dạy thành bài ([oak/living-things-and-where-they-live.md](oak/living-things-and-where-they-live.md) dòng 106, 126) |
| Cùng unit, lesson 6, 7 (nơi sống nhỏ) | Y2 #5 | Explorer #2 bài 6, 7 | Đối lập: nơi sống nhỏ xíu và nơi sống rất lớn |
| *Introduction to food chains* | Y2 #4 | Explorer #3 | Dùng nhẹ: con vật ăn gì |
| *Living things and the environment*, lesson 8 (môi trường và mùa), 9–10 (thời tiết cực đoan), 11 (phá rừng), 13 (động vật gặp nguy), 16 (khu bảo tồn) | Y4 #5 | Discoverer #16 bài 8–17 | Học sau: môi trường đổi theo mùa, mối đe doạ, bảo tồn |
| *Evolution and inheritance*, lesson 8 (thích nghi ở động vật), 10–11 (thích nghi ở thực vật), 12 (chọn lọc tự nhiên) | Y6 #5 | Scientist #14 bài 8, 10–12 | Học sau: thích nghi |

**Oak Địa lý** (đọc 16/11; khung từng lesson, ý dùng, ý bỏ ở [oak/geography-y2-cold-and-hot-places.md](oak/geography-y2-cold-and-hot-places.md)). App không theo Oak Địa lý; bảng này chỉ để biết phần nào của chủ đề đã có trong chương trình Anh cùng năm.

| Unit, lesson Oak Địa lý | Năm | Bài của chủ đề này | Liên hệ |
| --- | --- | --- | --- |
| *Cold places*, lesson 5 `arctic-wildlife` | Y2 unit 3 | Bài 1 · Bắc Cực | Sườn: gấu trắng, tuần lộc, hải mã, cáo Bắc Cực; đặc điểm giúp giữ ấm; misconception "gấu trắng ăn chim cánh cụt". Bỏ ngủ đông, biến đổi khí hậu |
| *Cold places*, lesson 6 `antarctic-wildlife` | Y2 unit 3 | Bài 2 · Nam Cực | Sườn: con vật kiếm ăn ở biển; chim cánh cụt chỉ ở nửa phía nam; chim cánh cụt hoàng đế đứng sát nhau cho ấm; misconception "gấu trắng sống ở Nam Cực" |
| *Hot places*, lesson 2 `tropical-rainforests-climate-and-location` | Y2 unit 4 | Bài 3 · Rừng mưa nhiệt đới | Sườn một phần: nóng, ẩm, mưa nhiều; A-ma-dôn lớn nhất; rất nhiều loài; con lười, khỉ rú, ếch phi tiêu độc. Bỏ xích đạo, bản đồ, misconception "thời tiết và khí hậu" |
| *Hot places*, lesson 3 `hot-deserts-climate-and-location` | Y2 unit 4 | Bài 7 · Sa mạc | Sườn một phần: Xa-ha-ra lớn nhất, ở châu Phi; ngày rất nóng, rất ít mưa. Lesson không nêu con vật; phần con người, biến đổi khí hậu, xương rồng không dùng |
| *Cold places*, lesson 1–4, 7–8; *Hot places*, lesson 1, 4 | Y2 unit 3, 4 | Không dùng | Định vị bằng bản đồ, quả địa cầu; con người ở vùng cực, Hiệp ước Nam Cực; chuyến đi tới nơi nóng |
| *Continents and oceans* | Y1 unit 3 | Bài 5 · Biển (gián tiếp) | Đại dương ở mức vị trí trên bản đồ (chưa đọc từng bài); không làm sườn |
| Không có | KS1 | Bài 4 · Đất ngập nước; bài 6 · Xavan | KS1 Địa lý không có xavan, đầm lầy, rừng ngập mặn |

### 2.2 Chỗ lệch Oak

1. **Thêm chủ đề mới vào Explorer.** Oak Science Year 1–2 không có unit này. Duy yêu cầu và chốt ngày 16/11. [syllabus.md](../syllabus.md) mục 3 đã sửa 16/11: Explorer có 12 unit Oak và 1 chủ đề mới.
2. **Vị trí không đứng đầu nhóm** (Duy chốt C, 16/11). Lệch luật 9/11 "chủ đề mới đứng đầu", không lệch thêm thứ tự Oak Science (Explorer đã đảo #2, #3 từ 14/11).
3. **Lấy nội dung Oak Địa lý vào một chủ đề Khoa học, thêm vài nơi Oak KS1 không dạy** (viết lại 16/11; bản trước ghi "đi trước Oak", sai một phần):
   - Nơi sống ở xa thành bài riêng: **không đi trước Oak.** Oak Science Y2 chỉ dùng chúng làm ví dụ trong quiz, nhưng Oak Địa lý Y2 có lesson riêng cho rừng mưa, sa mạc nóng, động vật Bắc Cực, động vật Nam Cực (mục 2.1). Cùng năm học, khác môn.
   - Đầm lầy, rừng ngập mặn, xavan: **ngoài Oak KS1** (cả Science lẫn Địa lý). Xavan có thể ở Oak Địa lý Year 3 *Climate zones* [CẦN KIỂM].
   - Biển sâu, rạn san hô: Oak Science tiểu học không có bài riêng [CẦN KIỂM]; Oak Địa lý Y1 *Continents and oceans* chỉ nói đại dương ở mức vị trí trên bản đồ.
   - Đặc điểm cơ thể giúp con vật sống ở nơi lạnh, nơi khô: **cách nói của Oak Địa lý Y2** ("đặc điểm giúp" gấu trắng, chim cánh cụt sống ở nơi lạnh). Khái niệm "thích nghi" Oak Science dạy ở Y6; Oak Địa lý Y2 chỉ dùng chữ "adapt" cho con người. Ta không dùng chữ này (câu 5 = a).
   - Mùa mưa, mùa khô ở xavan: Oak Science dạy môi trường đổi theo mùa ở Y4 lesson 8. Oak Địa lý Y2 có ý mùa ảnh hưởng con vật vùng cực, nhưng ta không dạy (ý 6).
4. **Dùng lại loài có trong quiz Oak** (gấu trắng với Bắc Cực, lạc đà với sa mạc, cá hề với rạn san hô, voi với xavan, đười ươi và kỳ nhông với rừng mưa, hà mã không hợp sa mạc). Đây là ví dụ kinh điển, khó tránh trong chủ đề này. PM đề xuất: dùng được ở Học, Chơi và trong câu khác dạng; **không làm lại câu ghép con vật với nơi sống y như quiz Oak**. Hai chủ đề trước đã tránh hẳn các loài này; Duy đổi được.
5. **Không có lesson Oak Science:** `source.kind: new`, mỗi bài `oak_lessons: []`, `statutory: false`. Trường `oak_lessons` trong `content/syllabus.json` chỉ ghi lesson Science, nên bốn lesson Oak Địa lý không vào trường này; chúng ghi ở `_topic.md` mục Nguồn và ở [oak/geography-y2-cold-and-hot-places.md](oak/geography-y2-cold-and-hot-places.md) (sườn một phần cho bài 1, 2, 3, 7). Mục tiêu "I can…" tự viết; ở bài có lesson Oak Địa lý thì dựa vào mục tiêu của Oak. PM quyết 16/11.
6. **Ở Anh, phần này thuộc môn Địa lý** (đã kiểm 16/11: Oak Địa lý Y2 unit 3 *Cold places*, unit 4 *Hot places*).

   **Theo Oak (Duy chốt 16/11):**
   - Bắc Cực và Nam Cực là hai bài riêng, như lesson 5 `arctic-wildlife` và lesson 6 `antarctic-wildlife` (câu 8 = b).
   - Học nơi lạnh trước nơi nóng, như unit 3 *Cold places* trước unit 4 *Hot places* (câu 9 = b). Thứ tự trong từng unit giữ: Bắc Cực rồi Nam Cực; rừng mưa rồi sa mạc.
   - Còn một chỗ khác Oak về thứ tự: ba bài ngoài Oak (đất ngập nước, biển, xavan) đứng giữa rừng mưa và sa mạc, theo trục ướt tới khô. Thứ tự tương đối của bốn lesson Oak không đổi.

   **Lệch Oak Địa lý, PM chỉ ghi lại, không hỏi lại** (Duy đã chốt hoặc ranh giới đã có):
   - Bỏ các lesson định vị bằng bản đồ, quả địa cầu (unit 3 lesson 1–4, unit 4 lesson 1): Duy chốt câu 6 = a.
   - Bỏ biến đổi khí hậu, gấu trắng bị đe doạ, "sa mạc đang rộng ra": thuộc Discoverer #16; Explorer không nói "sắp tuyệt chủng".
   - Không dùng ý "gấu trắng ngủ đông" của lesson `arctic-wildlife`: không chính xác (thường chỉ gấu cái mang thai vào hang [CẦN KIỂM]). Không đặt "ngủ đông" vào lựa chọn đúng của câu "điều gì giúp giữ ấm".
   - Không theo câu quiz Oak "cây ở sa mạc là xương rồng": ranh giới của chủ đề là không đặt xương rồng ở Xa-ha-ra (xương rồng mọc tự nhiên ở châu Mỹ [CẦN KIỂM]).
   - Bỏ phần con người: người sống ở vùng cực, Hiệp ước Nam Cực (unit 3 lesson 7, 8); người sống ở Xa-ha-ra, người Tuareg, misconception "không ai sống được ở Xa-ha-ra" (unit 4 lesson 3); chuyến đi tới nơi nóng (unit 4 lesson 4). Chủ đề nói về động vật hoang dã.
   - Không dạy mùa ở bài 1, 2 (băng theo tháng, chim cánh cụt tới và đi theo mùa), vì hai chủ đề mùa của Explorer đứng sau #4. Chỉ giữ ý nhìn được bằng ảnh: chim cánh cụt hoàng đế đứng sát nhau cho ấm.
   - Bỏ misconception Oak của bài rừng mưa ("thời tiết và khí hậu là một"): quá trừu tượng; Explorer không dạy từ "khí hậu". Không dùng con số (24 °C, 2,5 triệu người, tháng băng nhiều nhất).

## 3. Cách chia bài

- **Một bài, một nơi sống.** Bài Explorer 5–7 phút, quiz 6 câu; dồn hai nơi vào một bài thì mỗi nơi chỉ còn hai ô Học, bé 5 tuổi khó nhớ. Bắc Cực và Nam Cực là hai bài, như Oak (câu 8 = b).
- **Gộp rừng ngập mặn và đầm lầy thành một bài "nơi đất ngập nước".** Cả hai là đất ngập nước, có bùn. #2 bài 4, 5 đã dạy rừng ngập mặn và cá thòi lòi, nên tách riêng một bài rừng ngập mặn sẽ lặp nhiều. Gộp lại thì có một ý mới rõ: nước mặn ở rừng ngập mặn, nước ngọt ở đầm lầy (nối ý mặn, ngọt của #2 bài 4).
- **Giữ bài biển** dù #1 bài 8 và #2 bài 4 đã có con vật biển. Bài này nói về **các vùng khác nhau của biển** (bãi nông, rạn san hô, biển khơi, biển sâu), ý mới. Phương án B bỏ bài này; Duy chọn A (16/11), nên giữ.
- **Có bài tổng kết** đặt các nơi cạnh nhau theo nóng, lạnh, ướt, khô. Đây là chỗ sửa quan niệm sai chung "con vật nào cũng sống được ở bất cứ đâu", cặp đôi với `plants_grow_anywhere` của #2 bài 5.
- **Thứ tự (Duy chốt 16/11, câu 9 = b):** nơi lạnh trước nơi nóng như Oak: Bắc Cực → Nam Cực → rừng mưa → đất ngập nước → biển → xavan → sa mạc → tổng kết. Phần nơi nóng đi từ ướt tới khô. Ý "mở đầu bằng nơi gần nhà" ([oak/living-things-and-where-they-live.md](oak/living-things-and-where-they-live.md) dòng 201) đã có ở #2 *Sinh vật sống ở đâu?*. Học gấu trắng, chim cánh cụt trước thì các bài sau dùng chúng làm bẫy và câu so sánh.

| Phương án | Số bài | Cách chia | Đánh giá |
| --- | --- | --- | --- |
| A | 7 | Sáu nơi sống (rừng ngập mặn gộp với đầm lầy, Bắc Cực gộp với Nam Cực) và một bài tổng kết | Duy chọn ở câu 1 (16/11); sau đó tách vùng cực ở câu 8 |
| B | 6 | Như A, bỏ bài Biển | Ít lặp với #1 bài 8, #2 bài 4; mất biển sâu, rạn san hô Việt Nam |
| C | 5 | Rừng mưa; Đất ngập nước; Xavan và sa mạc; Vùng cực; Tổng kết có biển | Bài "xavan và sa mạc" quá tải cho bé 5–7 tuổi; không đề xuất |
| D | 8 | Như A, tách rừng ngập mặn và đầm lầy thành hai bài | Bài rừng ngập mặn lặp #2 bài 4, 5; không đề xuất |
| **A + tách vùng cực (Duy chốt 16/11, câu 8 = b)** | **8** | Như A, tách Bắc Cực và Nam Cực thành hai bài theo Oak Địa lý Y2 lesson 5, 6 | Đúng Oak và đúng "một bài một nơi"; mỗi bài có sẵn misconception của Oak; đủ ảnh (mục 7) |

**Khuôn mỗi bài** (như ba chủ đề Explorer đã soạn):
- Khởi động 2–3 câu DOK 1.
  - Bài 1 (Bắc Cực): một câu ôn ý chung "nơi sống" của #2 bài 4 (nơi sống cho con vật thức ăn, nước, chỗ trú; ý này không riêng nơi nào) và một câu ôn #1.
  - Từ bài 2: ôn bài trước và một chủ đề trước. Bài 3 (rừng mưa) nên ôn "rừng" (forest) của #2 bài 4, để nối rừng với rừng mưa.
- Học: một `explore_groups` 3–4 ô, một `word_list`.
- Chơi: một `build_tray`; món bẫy là con vật của nơi khác mà bé đã học.
- Quiz 6 câu. Từ vựng 4–5 từ, trong đó 2–3 từ `core`.
- Một thẻ thưởng, dùng lại bộ `set: animals`. `est_minutes: 6`.
- Ước 50–65 ảnh mới cho cả chủ đề; dùng lại được khoảng 15–18 ảnh đã có (mục 4, mục 7).

## 4. Tám bài

Thứ tự và số bài theo chín câu Duy chốt 16/11. Tên bài EN/VI ở tiêu đề mỗi bài là tên dùng cho danh mục. Câu EN và VI khác là nháp để hình dung; mỗi câu EN đã giữ tối đa 8 từ. Từ khoá tìm ảnh viết theo `content/TEMPLATE.md` (từ chung nhất trước; nhiều truy vấn cách nhau bằng `;`). Cột "Ngờ khó" của bài 3–8 là phán đoán của PM trước khi kiểm; bài 1, 2 viết sau khi kiểm. Kết quả kiểm Commons ngày 16/11 ở mục 7; chỗ nào khác cột này thì theo mục 7.

### Bài 1 · Bắc Cực · The Arctic

| Mục | Nội dung |
| --- | --- |
| `stage` | `opener` |
| Lesson Oak | Địa lý Y2 unit 3 *Cold places* lesson 5 `arctic-wildlife`. Dùng: gấu trắng, tuần lộc, hải mã, cáo Bắc Cực (từ khoá Oak); đặc điểm giúp giữ ấm; gấu trắng tìm thức ăn trên băng biển; Bắc Cực không có chim cánh cụt; misconception của Oak. Bỏ: "ngủ đông"; biến đổi khí hậu, gấu trắng bị đe doạ; băng theo tháng |
| Mục tiêu | I can name animals of the Arctic. · Em kể được con vật sống ở Bắc Cực. |
| Ý chính 1 | The Arctic is icy and very cold. · Bắc Cực rất lạnh, đầy băng tuyết. |
| Ý chính 2 | Thick fur keeps Arctic animals warm. · Lông dày giữ ấm cho con vật Bắc Cực. [CẦN KIỂM: lông trắng, lớp mỡ] |
| Ý chính 3 | Polar bears find food on the sea ice. · Gấu trắng tìm thức ăn trên băng biển. |
| Từ vựng | `core`: Arctic · Bắc Cực; ice · băng. `extra`: polar bear · gấu trắng; walrus · hải mã; reindeer · tuần lộc |
| Loài | Gấu trắng (dùng lại `tray_arctic`), cáo Bắc Cực, hải mã, tuần lộc (từ khoá Oak; chọn ảnh không người, không dây cương [CẦN KIỂM: hoang dã hay do người chăn]), cú tuyết |
| Misconception (Oak) | `polar_bears_eat_penguins`: "Polar bears eat penguins." · "Gấu trắng ăn chim cánh cụt." Sửa: "No penguins live in the Arctic." · "Ở Bắc Cực không có chim cánh cụt." Hai ảnh riêng, không cảnh săn mồi |
| Quiz | `single_choice` và `true_false`. Câu 6 `true_false` (Sai), hợp thẻ "Ý sai → Ý đúng" ở Tổng kết. Câu DOK 2 gợi ý: từ lông dày suy ra nơi lạnh; đặc điểm nào giữ ấm (dùng ý của quiz Oak, viết câu và lựa chọn khác) |
| Khởi động | Một câu ôn ý chung "nơi sống" của *Sinh vật sống ở đâu?* bài 4; một câu ôn *Gọi tên và nhóm động vật* (động vật hoang dã, hoặc chim cánh cụt là chim) |
| Chơi | Chọn ba con vật Bắc Cực. Bẫy: chim cánh cụt (đã gặp ở #1 bài 3; đúng ý misconception) và một con vật nơi nóng bé đã học ở #1–#3 (voọc, cá thòi lòi) |
| Thẻ thưởng | Gấu trắng |
| Ranh giới | Không "ngủ đông", không biến đổi khí hậu, không băng tan. Băng biển là "sea ice", khớp Discoverer #1 bài 2 (Bắc Cực là biển đóng băng); không nói Bắc Cực là đất liền |

| Hình | Từ khoá tìm ảnh (EN) | Dùng lại | Ngờ khó |
| --- | --- | --- | --- |
| Gấu trắng trên băng trôi | — | `be-mat-trai-dat/cac-chau-luc-va-dai-duong` `tray_arctic` | Vừa: Commons 9 ảnh, đã có ảnh dùng lại |
| Băng tuyết Bắc Cực | `Arctic sea ice snow` | — | — |
| Cáo Bắc Cực lông trắng | `Arctic fox Vulpes lagopus winter` | — | — |
| Hải mã trên băng | `walrus ice Odobenus` | — | — |
| Tuần lộc trên tuyết | `reindeer Rangifer tundra` | — | Vừa: 7 ảnh; tránh ảnh có người, dây cương |
| Cú tuyết | `snowy owl Bubo scandiacus` | — | — |
| Chim cánh cụt (bẫy) | — | `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` `tray_penguin` hoặc `tray_antarctica` | — (designer kiểm loài) |

### Bài 2 · Nam Cực · The Antarctic

| Mục | Nội dung |
| --- | --- |
| `stage` | `core` |
| Lesson Oak | Địa lý Y2 unit 3 *Cold places* lesson 6 `antarctic-wildlife`. Dùng: con vật Nam Cực kiếm ăn ở biển; chim cánh cụt chỉ ở nửa phía nam; chim cánh cụt hoàng đế đứng sát nhau cho ấm; misconception của Oak. Bỏ: chim cánh cụt tới và đi theo mùa; từ "breeding", "species", "survive" |
| Mục tiêu | I can name animals of the Antarctic. · Em kể được con vật sống ở Nam Cực. |
| Ý chính 1 | Antarctic animals find food in the sea. · Con vật ở Nam Cực tìm thức ăn dưới biển. [CẦN KIỂM] |
| Ý chính 2 | Penguins live only in the south. · Chim cánh cụt chỉ sống ở nửa phía nam Trái Đất. [CẦN KIỂM: chim cánh cụt Galápagos] |
| Ý chính 3 | Emperor penguins huddle to keep warm. · Chim cánh cụt hoàng đế đứng sát nhau cho ấm. [CẦN KIỂM] |
| Từ vựng | `core`: Antarctic · Nam Cực; huddle · đứng sát nhau. `extra`: emperor penguin · chim cánh cụt hoàng đế; seal · hải cẩu |
| Loài | Chim cánh cụt hoàng đế, chim cánh cụt Adélie, chim cánh cụt Gentoo (dùng lại `tray_antarctica`, chụp ở đảo Danco), hải cẩu Weddell. Tuỳ chọn: cá voi lưng gù (dùng lại; [CẦN KIỂM: kiếm ăn ở biển Nam Cực mùa hè]) |
| Misconception (Oak) | `polar_bears_in_antarctic`: "Polar bears live in the Antarctic." · "Gấu trắng sống ở Nam Cực." Sửa: "Polar bears live only in the Arctic." · "Gấu trắng chỉ sống ở Bắc Cực." Hai misconception của bài 1, 2 sửa cùng một nhầm lẫn từ hai phía, nên bé gặp ý "gấu trắng và chim cánh cụt ở hai đầu Trái Đất" hai lần |
| Quiz | `single_choice` và `true_false`. Câu 6 `true_false` (Sai). Có thể so sánh với bài 1 ("Con nào sống ở Nam Cực?": chim cánh cụt, gấu trắng, cáo Bắc Cực) |
| Khởi động | Ôn bài 1 (gấu trắng sống ở Bắc Cực) và một câu *Gọi tên và nhóm động vật* (chim cánh cụt là chim, biết bơi) |
| Chơi | Chọn ba con vật Nam Cực. Bẫy: gấu trắng (bài 1; đúng ý misconception) và cáo Bắc Cực (bài 1) hoặc một con vật nơi nóng bé đã học |
| Thẻ thưởng | Chim cánh cụt hoàng đế |
| Ranh giới | Không dạy vòng đời (chim bố ấp trứng chỉ là ảnh hoặc một câu ở ô Học, nếu dùng; vòng đời ở *Sự sống mới*). Châu Nam Cực là đất phủ băng (Discoverer #1 bài 2); không nói ngược |

| Hình | Từ khoá tìm ảnh (EN) | Dùng lại | Ngờ khó |
| --- | --- | --- | --- |
| Chim cánh cụt trên đất phủ băng | — | `be-mat-trai-dat/cac-chau-luc-va-dai-duong` `tray_antarctica` (chim cánh cụt Gentoo, đảo Danco) | — |
| Chim cánh cụt hoàng đế | `emperor penguin Antarctica` | Không dùng `chim-va-bo-sat` `tray_penguin` nếu loài trong ảnh sống ở bờ biển ấm (designer kiểm loài) | — |
| Đàn chim cánh cụt hoàng đế đứng sát nhau | `emperor penguin huddle` | — | Vừa: chưa kiểm riêng truy vấn này |
| Chim cánh cụt Adélie | `Adelie penguin Pygoscelis adeliae` | — | — |
| Hải cẩu Weddell trên băng | `Weddell seal Antarctica` | — | — |
| Gấu trắng (bẫy) | — | `tray_arctic` hoặc ảnh của bài 1 | — |
| Cá voi lưng gù (tuỳ chọn) | — | `ho-hap/vi-sao-ta-phai-tho` `whale` hoặc `tray_pacific` | — |

### Bài 3 · Rừng mưa nhiệt đới · Rainforests

| Mục | Nội dung |
| --- | --- |
| `stage` | `core` |
| Lesson Oak | Địa lý Y2 unit 4 *Hot places* lesson 2 `tropical-rainforests-climate-and-location` (sườn một phần; ý dùng, ý bỏ ở [oak/geography-y2-cold-and-hot-places.md](oak/geography-y2-cold-and-hot-places.md)). Dùng: nóng, ẩm, mưa nhiều; A-ma-dôn là rừng mưa lớn nhất; rất nhiều loài; ba con vật của quiz Oak. Bỏ: xích đạo, bản đồ, mốc 24 °C |
| Mục tiêu | I can say what a rainforest is like. · Em nói được rừng mưa nhiệt đới như thế nào. |
| Ý chính 1 | A rainforest is hot and very rainy. · Rừng mưa nhiệt đới nóng và mưa rất nhiều. |
| Ý chính 2 | Vietnam has rainforests. The Amazon is huge. · Việt Nam có rừng mưa nhiệt đới. Rừng A-ma-dôn rất rộng. [CẦN KIỂM: Cúc Phương, Cát Tiên được xếp là rừng mưa nhiệt đới] (Oak: A-ma-dôn là rừng mưa lớn nhất) |
| Ý chính 3 | Many animals live high in the trees. · Nhiều con vật sống trên cây cao. |
| Từ vựng | `core`: rainforest · rừng mưa nhiệt đới; treetop · ngọn cây. `extra`: sloth · con lười; hornbill · chim hồng hoàng; gibbon · con vượn |
| Loài | Việt Nam: voọc chà vá chân nâu (dùng lại ảnh), vượn đen má vàng [CẦN KIỂM: có ở Cát Tiên], chim hồng hoàng [CẦN KIỂM: phân bố ở Việt Nam]. A-ma-dôn: con lười, khỉ rú, ếch phi tiêu độc (ba con có trong quiz Oak; [CẦN KIỂM tên VI]), vẹt đuôi dài đỏ, báo đốm (tuỳ chọn, chỉ ảnh nằm nghỉ). Chuối, xoài, dứa (Oak nhắc ở lesson này) tuỳ chọn ở ô Học làm cầu nối với Việt Nam, không vào quiz |
| Misconception | `forest_animals_on_ground`: "Forest animals all live on the ground." · "Con vật trong rừng đều sống dưới đất." Sửa: "Many rainforest animals live up in trees." · "Nhiều con vật rừng mưa sống trên cây cao." Giữ key này, không dùng misconception của Oak ("thời tiết và khí hậu là một", quá trừu tượng). Ba con vật của quiz Oak sống ở ba tầng khác nhau (ếch phi tiêu độc ở tầng đất [CẦN KIỂM]; lười, khỉ rú trên cây), hợp để dạy ý này |
| Quiz | `single_choice` và `true_false`. Câu 6 `single_choice`: con nào sống trên ngọn cây (một con trên cây, hai con dưới đất). Không `order_sequence` (tầng rừng có con đi lại nhiều tầng, dễ có hai thứ tự đúng) |
| Khởi động | Ôn bài 2 và một câu *Sinh vật sống ở đâu?* bài 4 về "rừng" (forest), để nối rừng với rừng mưa |
| Chơi | Chọn ba con vật rừng mưa: một con leo trèo, một con bay, một con dưới đất. Bẫy: gấu trắng (bài 1), chim cánh cụt (bài 2), hoặc vật nuôi trong chuồng (trâu, gà) đã học ở #1 |
| Thẻ thưởng | Chim hồng hoàng (loài Việt Nam) |
| Ranh giới | #2 bài 4 đã có "rừng" (forest): bài này phải nói rõ rừng mưa nóng, mưa nhiều, nhiều tầng cây |

| Hình | Từ khoá tìm ảnh (EN) | Dùng lại | Ngờ khó |
| --- | --- | --- | --- |
| Rừng mưa Việt Nam, ảnh ngang thấy tán nhiều tầng (Cúc Phương hoặc Cát Tiên) | `rainforest Cuc Phuong Vietnam; tropical forest Cat Tien` | — | **Có**: ảnh rừng Việt Nam trên Commons nhiều BY-SA. Thay bằng rừng mưa Đông Nam Á khác, brief bỏ tên nơi |
| Rừng A-ma-dôn từ trên cao, có sông uốn khúc | `Amazon rainforest aerial river` | — | — |
| Mưa trong rừng, lá ướt | `rainforest rain leaves` | — | Vừa: phải nhận ra là rừng |
| Voọc chà vá chân nâu | — | `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `explore_wild` | — |
| Vượn đen má vàng trên cây | `gibbon Nomascus gabriellae; yellow-cheeked gibbon tree` | — | **Có**: phần lớn ảnh ở sở thú |
| Chim hồng hoàng đậu trên cành | `great hornbill Buceros bicornis` | — | Vừa: nhiều ảnh sở thú, thấy lưới |
| Con lười treo trên cành | `sloth Bradypus hanging tree` | — | — |
| Khỉ rú trên cây | `howler monkey Alouatta` | — | — (mục 7: 17 ảnh) |
| Ếch phi tiêu độc trên lá rụng | `poison dart frog Dendrobates` | — | — (mục 7: 21 ảnh; tránh ảnh bể nuôi) |
| Vẹt đuôi dài đỏ | `scarlet macaw Ara macao wild` | — | — |
| Báo đốm nằm nghỉ (tuỳ chọn) | `jaguar Panthera onca resting` | — | Vừa: tránh sở thú, cảnh săn mồi |

### Bài 4 · Rừng ngập mặn và đầm lầy · Mangroves and swamps

| Mục | Nội dung |
| --- | --- |
| `stage` | `core` |
| Mục tiêu | I can name animals of wet, muddy places. · Em kể được con vật sống ở nơi đất ngập nước. |
| Ý chính 1 | Some land is wet and muddy. · Có nơi đất ngập nước và đầy bùn. |
| Ý chính 2 | Mangrove water is salty. Swamp water is fresh. · Nước ở rừng ngập mặn thì mặn. Nước ở đầm lầy thì ngọt. [CẦN KIỂM: nước lợ ở rừng ngập mặn; đầm lầy Tràm Chim là nước ngọt] |
| Ý chính 3 | Crabs, fish and birds find food there. · Cua, cá và chim tìm được thức ăn ở đó. |
| Từ vựng | `core`: swamp · đầm lầy; mud · bùn. `extra`: mangrove · rừng ngập mặn (đã có ở #2 bài 4); crane · con sếu; fiddler crab · con còng |
| Loài | Cá thòi lòi (dùng lại), con còng [CẦN KIỂM tên VI: còng hay cáy], khỉ đuôi dài ở Cần Giờ [CẦN KIỂM], sếu đầu đỏ ở Tràm Chim [CẦN KIỂM: số sếu về Tràm Chim giảm mạnh, có năm không về], con cò (dùng lại), cá sấu Xiêm ở Bàu Sấu, Cát Tiên (dùng lại; [CẦN KIỂM]) |
| Misconception | `swamps_have_no_life`: "Nothing lives in a muddy swamp." · "Đầm lầy lầy lội, chẳng có gì sống." Sửa: "Swamps are full of birds, fish and plants." · "Đầm lầy có rất nhiều chim, cá và cây." Phương án khác: `mangrove_water_fresh` (nước rừng ngập mặn là nước ngọt) |
| Quiz | `single_choice` và `true_false`. Câu 6 `true_false` khẳng định, ví dụ "Many birds live in swamps." (Đúng) |
| Chơi | Chọn ba con vật của nơi ngập nước: một con cá, một con cua, một con chim. Bẫy: cá heo (biển khơi), voọc (bài 3), chim hồng hoàng (bài 3) |
| Thẻ thưởng | Sếu đầu đỏ (loài Việt Nam) |
| Ranh giới | #2 bài 4, 5 đã dạy rừng đước, cá thòi lòi nhảy trên bùn, rễ đước giữ bùn: chỉ dùng lại ở Khởi động và ví dụ, không làm ý chính |

| Hình | Từ khoá tìm ảnh (EN) | Dùng lại | Ngờ khó |
| --- | --- | --- | --- |
| Rừng đước lúc nước ròng | — | `sinh-vat-song-o-dau/noi-song-cua-con-vat` `explore_mangrove` (ảnh chụp ở Indonesia) | — |
| Rừng ngập mặn Việt Nam lúc nước lớn ngập rễ | `mangrove Can Gio Vietnam; mangrove high tide roots` | — | **Có**: ảnh Việt Nam có giấy phép mở hiếm |
| Đầm lầy nước ngọt có sen, súng, cỏ năng (Tràm Chim hoặc Láng Sen) | `wetland Tram Chim Vietnam; freshwater marsh lotus` | — | **Có**: thay bằng đầm lầy nước ngọt châu Á khác, brief bỏ tên nơi |
| Cá thòi lòi | — | `noi-song-cua-con-vat` `mudskipper` | — |
| Con còng càng to trên bùn | `fiddler crab Uca mud` | — | — |
| Khỉ đuôi dài trên rễ đước | `long-tailed macaque mangrove Macaca fascicularis` | — | Vừa: tránh ảnh có du khách, người cho khỉ ăn |
| Sếu đầu đỏ trên đồng ngập nước | `sarus crane Antigone antigone wetland` | — | Vừa: ảnh ở Việt Nam hiếm; ảnh Ấn Độ, Campuchia dùng được nếu brief bỏ tên nơi |
| Cá sấu Xiêm | — | `khung-long/khung-long-la-gi` `q1_reptiles` | — |
| Con cò | — | `ho-hap/vi-sao-ta-phai-tho` `tray_egret` | — |

### Bài 5 · Biển và đại dương · Oceans

| Mục | Nội dung |
| --- | --- |
| `stage` | `core` |
| Mục tiêu | I can name reef and deep-sea animals. · Em kể được con vật ở rạn san hô và biển sâu. |
| Ý chính 1 | The ocean is huge and salty. · Đại dương rất rộng và nước mặn. |
| Ý chính 2 | Coral reefs are warm and full of fish. · Rạn san hô ấm và có rất nhiều cá. |
| Ý chính 3 | The deep sea is dark and cold. · Biển sâu tối và lạnh. [CẦN KIỂM] |
| Từ vựng | `core`: ocean · đại dương; coral reef · rạn san hô. `extra`: deep sea · biển sâu; whale · cá voi; sea turtle · rùa biển |
| Loài | Việt Nam: rùa biển xanh ở Côn Đảo [CẦN KIỂM], cá hề trong hải quỳ ở Nha Trang [CẦN KIỂM], bò biển ở Côn Đảo (tuỳ chọn) [CẦN KIỂM]. Biển khơi: cá voi lưng gù (có cá voi ở biển Việt Nam [CẦN KIỂM]). Biển sâu: sứa phát sáng (mục 7: không dùng cá lồng đèn) |
| Misconception | `sea_same_everywhere`: "The sea is the same everywhere." · "Biển chỗ nào cũng giống nhau." Sửa: "Reefs are bright. The deep sea is dark." · "Rạn san hô sáng. Biển sâu thì tối." Phương án khác: `coral_is_a_rock` (san hô là đá; thật ra do những con vật nhỏ xíu tạo nên [CẦN KIỂM]) |
| Quiz | `single_choice`, `true_false`, `order_sequence` ba cảnh "từ nông tới sâu": bãi biển, rạn san hô, biển sâu (một thứ tự đúng) |
| Chơi | Chọn ba con vật biển: một con ở rạn san hô, một con ở biển khơi, một con ở biển sâu. Bẫy: cá chép, ếch (nước ngọt, đã học ở #1, #2). Không dùng chim cánh cụt, hải cẩu làm bẫy (chúng kiếm ăn ở biển, bài 2) |
| Thẻ thưởng | Rùa biển (loài Việt Nam) |
| Ranh giới | Không làm lại "cá heo là cá" (#1 bài 4, key `water_animals_are_fish`), "sao biển là cá" (#1 bài 8), "biển nước mặn, ao nước ngọt" (#2 bài 4) |

| Hình | Từ khoá tìm ảnh (EN) | Dùng lại | Ngờ khó |
| --- | --- | --- | --- |
| Rạn san hô | — | `ho-hap/vi-sao-ta-phai-tho` `q4` | — |
| Rạn san hô Việt Nam (Nha Trang, Côn Đảo) | `coral reef Nha Trang Vietnam; coral reef Con Dao` | — | **Có**: ảnh dưới nước ở Việt Nam có giấy phép mở hiếm |
| Bãi biển nông | — | `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien` `q3` (bãi biển vắng) | — |
| Biển khơi xanh thẫm | — | `be-mat-trai-dat/cac-chau-luc-va-dai-duong` `tray_pacific` hoặc `tray_atlantic` | — |
| Biển sâu tối | `deep sea dark NOAA Okeanos` | — | Vừa: tối mà vẫn nhận ra là biển |
| Rùa biển xanh đang bơi | `green sea turtle Chelonia mydas swimming` | — | — |
| Cá hề trong hải quỳ | `clownfish anemone Amphiprion` | — | — |
| Cá voi lưng gù | — | `tray_pacific` hoặc `ho-hap/vi-sao-ta-phai-tho` `whale` | — |
| Cá lồng đèn biển sâu | `anglerfish deep sea NOAA` | — | **Có**: ảnh con sống hiếm, nhiều ảnh mẫu chết (không dùng), trông đáng sợ. Thay: `deep sea jellyfish NOAA` |
| Bò biển (tuỳ chọn) | `dugong Dugong dugon seagrass` | — | Vừa |

### Bài 6 · Đồng cỏ xavan · Savannas

| Mục | Nội dung |
| --- | --- |
| `stage` | `core` |
| Mục tiêu | I can say what a savanna is like. · Em nói được đồng cỏ xavan như thế nào. |
| Ý chính 1 | A savanna is hot, with tall grass. · Đồng cỏ xavan nóng, cỏ cao, ít cây. |
| Ý chính 2 | It has rainy and dry seasons. · Ở đó có mùa mưa và mùa khô. (Tự giới thiệu mùa mưa, mùa khô vì hai chủ đề mùa đứng sau; có thể nói "giống miền Nam Việt Nam" [CẦN KIỂM]) |
| Ý chính 3 | Big herds walk far to find water. · Những đàn thú lớn đi rất xa để tìm nước. [CẦN KIỂM: đàn linh dương đầu bò, ngựa vằn di cư theo mưa] |
| Từ vựng | `core`: savanna · đồng cỏ xavan; herd · đàn. `extra`: zebra · ngựa vằn; giraffe · hươu cao cổ; dry season · mùa khô |
| Loài | Ngựa vằn, hươu cao cổ, voi châu Phi, sư tử (chỉ ảnh nằm nghỉ), linh dương đầu bò. Việt Nam không có xavan kiểu châu Phi [CẦN KIỂM: trảng cỏ, rừng khộp Tây Nguyên khác xavan] |
| Misconception | `lions_live_in_jungle`: "Lions live in the rainforest." · "Sư tử sống trong rừng rậm." Sửa: "Lions live on the grassy savanna." · "Sư tử sống ở đồng cỏ xavan." [CẦN KIỂM: sư tử châu Phi sống ở xavan, đồng cỏ, rừng thưa, không ở rừng mưa rậm; trẻ Việt Nam quen câu "sư tử là chúa tể rừng xanh"] |
| Quiz | `single_choice`, `true_false`, `order_sequence` "từ thấp tới cao": ngựa vằn, voi, hươu cao cổ [CẦN KIỂM chiều cao]. Ba thẻ cắt cùng cỡ con vật trong khung, để bé dựa vào hiểu biết. Không xếp vòng mùa (vòng lặp có nhiều thứ tự đúng) |
| Chơi | Chọn ba con vật xavan: có sọc, cổ dài, có vòi. Bẫy: con lười (bài 3), rùa biển (bài 5), sếu đầu đỏ (bài 4) hoặc gấu trắng (bài 1). Không dùng voi châu Á làm bẫy (dễ lẫn với voi châu Phi, luật Explorer số 7) |
| Thẻ thưởng | Hươu cao cổ |
| Ranh giới | Không cảnh săn mồi (*Chuỗi thức ăn nâng cao*, Discoverer #17). Nói "ngựa vằn ăn cỏ" được (ôn #3), không vẽ chuỗi |

| Hình | Từ khoá tìm ảnh (EN) | Dùng lại | Ngờ khó |
| --- | --- | --- | --- |
| Đồng cỏ xavan có cây keo tán rộng | `savanna Serengeti acacia` | Hoặc `be-mat-trai-dat/cac-chau-luc-va-dai-duong` `tray_africa` (hươu cao cổ, Nairobi) | — |
| Xavan mùa khô, cỏ vàng | `savanna dry season grass` | — | Vừa: cần cặp ảnh mùa khô, mùa mưa cùng kiểu khung |
| Xavan mùa mưa, cỏ xanh | `savanna rainy season green grass` | — | Vừa |
| Đàn ngựa vằn | `zebra herd savanna` | Không dùng `khung-long` `q2_zoo` (sở thú) | — |
| Hươu cao cổ ăn lá cây keo | `giraffe eating acacia leaves` | — | — |
| Voi châu Phi | `African bush elephant savanna` | Không dùng `dong-vat-co-vu` `explore_big_small` (voi châu Á) | — |
| Sư tử nằm nghỉ trên cỏ | `lion resting savanna grass` | — | Vừa: tránh ảnh có con mồi |
| Đàn linh dương đầu bò | `wildebeest migration herd` | — | Vừa: tránh cảnh qua sông, cá sấu |
| Vũng nước có thú đến uống | `waterhole savanna animals drinking` | — | — |

### Bài 7 · Sa mạc · Deserts

| Mục | Nội dung |
| --- | --- |
| `stage` | `apply` (so sánh với bài 3, bài 6 theo khô, ướt; với bài 1, 2 theo nóng, lạnh) |
| Lesson Oak | Địa lý Y2 unit 4 *Hot places* lesson 3 `hot-deserts-climate-and-location` (sườn một phần). Dùng: Xa-ha-ra là sa mạc nóng lớn nhất, ở châu Phi; ban ngày rất nóng, rất ít mưa; ít sự sống (nói "ít", không nói "không có"). Bỏ: con người, người Tuareg; "sa mạc đang rộng ra" (biến đổi khí hậu); câu quiz "cây ở sa mạc là xương rồng"; con số 2,5 triệu người. Lesson Oak không nêu tên con vật nào, nên loài dưới đây do PM chọn |
| Mục tiêu | I can say how animals live in deserts. · Em biết con vật sống ở sa mạc ra sao. |
| Ý chính 1 | A desert is very dry. Rain is rare. · Sa mạc rất khô, hiếm khi có mưa. |
| Ý chính 2 | Days are hot. Nights can be cold. · Ban ngày nóng, ban đêm có thể lạnh. [CẦN KIỂM: chênh lệch ngày, đêm ở Xa-ha-ra] |
| Ý chính 3 | Some animals hide from the sun all day. · Có con vật trốn nắng suốt ban ngày. [CẦN KIỂM: cáo fennec, chuột nhảy ở trong hang ban ngày, ra ngoài ban đêm] |
| Từ vựng | `core`: desert · sa mạc; camel · lạc đà. `extra`: hump · bướu; oasis · ốc đảo; fennec fox · cáo fennec |
| Loài | Lạc đà một bướu (**phần lớn do người nuôi, không gọi là động vật hoang dã** [CẦN KIỂM]), cáo fennec, chuột nhảy sa mạc, thằn lằn đuôi gai hoặc bọ cạp (mục 7: bỏ linh dương Dorcas); cây chà là ở ốc đảo. Không đưa xương rồng vào Xa-ha-ra (xương rồng mọc tự nhiên ở châu Mỹ [CẦN KIỂM]) |
| Misconception | `camel_hump_water`: "A camel keeps water in its hump." · "Lạc đà chứa nước trong cái bướu." Sửa: "The hump stores fat, not water." · "Bướu lạc đà chứa mỡ, không chứa nước." [CẦN KIỂM]. Phương án khác: `deserts_always_hot`; `deserts_only_sand` (phần lớn Xa-ha-ra là đá, sỏi [CẦN KIỂM]). Misconception của Oak ("không ai sống được ở Xa-ha-ra") nói về con người, nên không dùng. Bản gần Oak nhất cho con vật là `nothing_lives_in_desert` ("Không con vật nào sống ở sa mạc"), nhưng trùng kiểu với `swamps_have_no_life` của bài 4; content-editor chọn một trong hai bài dùng kiểu này |
| Quiz | `single_choice`, `true_false`, `order_sequence` "từ khô tới ướt": sa mạc, đồng cỏ xavan, rừng mưa (ôn bài 3, bài 6) |
| Chơi | Chọn ba con vật sa mạc. Bẫy là con đã học ở bài trước: gấu trắng (bài 1; bẫy rõ nhất, nóng với lạnh), hươu cao cổ (bài 6), cá thòi lòi (bài 4), con lười (bài 3) |
| Thẻ thưởng | Cáo fennec (tai to [CẦN KIỂM: giúp toả nhiệt]) |
| Ranh giới | #2 đã dạy "đồi cát Mũi Né, Ninh Thuận không phải sa mạc": không dùng ảnh đồi cát Việt Nam làm sa mạc |

| Hình | Từ khoá tìm ảnh (EN) | Dùng lại | Ngờ khó |
| --- | --- | --- | --- |
| Đồi cát Xa-ha-ra | `Sahara desert sand dunes; Erg Chebbi dunes` | Không dùng `noi-song-cua-con-vat` `q4_dunes` (đồi cát Việt Nam) | — |
| Sa mạc đá, sỏi ở Xa-ha-ra | `Sahara rocky desert hamada` | — | Vừa |
| Ốc đảo có cây chà là | `oasis date palms Sahara` | — | — |
| Sa mạc lúc đêm | `desert night dunes moon` | — | Vừa: ảnh tối khó nhìn trên thẻ nhỏ |
| Lạc đà một bướu trên cát | `dromedary camel Sahara dunes` | — | Vừa: phần lớn ảnh có người, yên cương |
| Cáo fennec | `fennec fox Vulpes zerda` | — | Vừa: nhiều ảnh sở thú |
| Chuột nhảy sa mạc | `jerboa desert` | — | **Có**: ảnh hoang dã có giấy phép mở hiếm |
| Thằn lằn đuôi gai | `Uromastyx lizard desert` | — | — |
| Bọ cạp (thay linh dương Dorcas) | `scorpion desert` | — | — (mục 7: 32 ảnh) |

### Bài 8 · Mỗi con vật một nơi sống · Every animal has its place

| Mục | Nội dung |
| --- | --- |
| `stage` | `review` |
| Mục tiêu | I can match animals to places on Earth. · Em ghép được con vật với nơi sống trên Trái Đất. |
| Ý chính 1 | Earth has hot, cold, wet and dry places. · Trái Đất có nơi nóng, nơi lạnh, nơi ướt, nơi khô. |
| Ý chính 2 | Animals have bodies that help them live there. · Cơ thể con vật giúp nó sống được ở nơi đó. (Nói "giúp", không nói con vật "thay đổi để") |
| Ý chính 3 | Wild animals need their own wild places. · Động vật hoang dã cần nơi sống hoang dã của chúng. |
| Từ vựng | `core`: Earth · Trái Đất; world · thế giới. Không có `adaptation · thích nghi` (Duy chốt câu 5 = a, 16/11) |
| Loài | Dùng lại các bài trước: gấu trắng, chim cánh cụt, con lười, cá thòi lòi, rùa biển, ngựa vằn, lạc đà |
| Misconception | `animals_live_anywhere`: "Any animal can live anywhere." · "Con vật nào cũng sống được ở bất cứ đâu." Sửa: "A polar bear is too hot in a desert." · "Gấu trắng ở sa mạc sẽ quá nóng." Cặp đôi với `plants_grow_anywhere` của #2 bài 5 |
| Quiz | `single_choice`, `true_false`, `order_sequence` "từ ít nước tới nhiều nước": sa mạc, đầm lầy, đại dương. Câu 6 `true_false` (Sai) |
| Chơi | Ghép ba con vật với ba nơi: nóng và khô, lạnh, ướt. Bẫy: vật nuôi trong chuồng |
| Khởi động | Ôn trộn bài 1–7 và một câu #2 bài 5 (`plants_grow_anywhere`) làm mốc giãn cách khoảng một tháng |
| Thẻ thưởng | content-editor chọn (một loài chưa có thẻ) |
| Ranh giới | Không nói phá rừng, động vật nguy cấp, khu bảo tồn (Discoverer #16 bài 11, 13, 16). Chỉ dừng ở "động vật hoang dã cần nơi sống của chúng" |

| Hình | Từ khoá tìm ảnh (EN) | Dùng lại | Ngờ khó |
| --- | --- | --- | --- |
| Mọi hình con vật và cảnh | — | Bài 1–7 | — |
| Trái Đất nhìn từ vũ trụ | — | — | Không dùng: Duy chốt câu 6 = a (không bản đồ, không ảnh Trái Đất từ vũ trụ) |

### Phương án đã bỏ: một bài Bắc Cực và Nam Cực

Bản 7 bài (câu 1, 16/11) gộp hai vùng cực vào một bài *The Arctic and the Antarctic · Bắc Cực và Nam Cực*, đứng thứ 6, sau sa mạc. Misconception gộp là `polar_bears_meet_penguins` ("Gấu trắng và chim cánh cụt sống cùng một nơi"). Duy chốt tách theo Oak (câu 8 = b) và đưa vùng cực lên đầu (câu 9 = b), nên bỏ bản này. Key `polar_bears_meet_penguins` không dùng. Ý chính, loài và ảnh của bản gộp đã chia vào bài 1, 2.

## 5. Nối với chủ đề trước và sau

Số chủ đề theo danh mục sau khi chèn chủ đề này ở Explorer #4.

| Chủ đề | Nhóm, số | Chủ đề này dùng gì, để dành gì |
| --- | --- | --- |
| *Gọi tên và nhóm động vật* | Explorer #1 | Dùng tên con vật, các nhóm (cá, chim, thú…), "động vật hoang dã"; ảnh voọc, cá sấu, cá heo, chim cánh cụt. Chim cánh cụt (#1 bài 3) là bẫy ở bài 1 và nền cho bài 2. Khởi động bài 1, 2 ôn #1. Không lặp key `water_animals_are_fish`, `all_birds_fly`, `starfish_is_fish` |
| *Sinh vật sống ở đâu?* | Explorer #2 | Dùng "habitat · nơi sống" (bài 4, từ `core`), nơi sống cho thức ăn, nước, chỗ trú; nước mặn, nước ngọt; rừng, rừng ngập mặn, cá thòi lòi; đồi cát không phải sa mạc. Khởi động bài 1 ôn ý chung "nơi sống" của bài 4; bài 3 ôn "rừng". Không dạy lại "nơi sống là gì", nơi sống nhỏ |
| *Chuỗi thức ăn* | Explorer #3 | Dùng nhẹ "con vật ăn gì". Không vẽ chuỗi, không mũi tên, không cảnh săn mồi (kể cả câu "gấu trắng ăn chim cánh cụt" ở bài 1: chỉ nói bằng lời và hai ảnh riêng) |
| *Thu, đông và mùa khô*; *Xuân, hè và mùa mưa* | Explorer #5, #8 | Đứng sau chủ đề này. Bài 1, 2 không dạy mùa; bài 6 (xavan) nói mùa mưa, mùa khô bằng câu đơn giản; không dạy mùa ở Việt Nam. *(17/11: hai chủ đề này gộp thành *Thời tiết và các mùa*, Explorer #5, ngay sau chủ đề này; bài 4 của nó ôn bài 6 xavan. [SK-050](backlog/SK-050-explorer-weather-and-seasons.md).)* |
| *Cây quanh em*, *Trồng cây* | Explorer #7, #11 | Cây chỉ làm cảnh (keo, chà là, đước); không dạy bộ phận cây |
| *Sự sống mới* | Explorer #12 | Vòng đời học sau. Bài 2 nếu có ảnh chim bố ấp trứng thì không dạy vòng đời |
| *Bề mặt Trái Đất* bài 2 (châu lục, đại dương) | Discoverer #1 | Học sau: châu lục, đại dương, bản đồ. Explorer gọi "châu Phi" như tên một nơi, không dạy châu lục. Bắc Cực là biển đóng băng, châu Nam Cực là đất phủ băng: bài 1, 2 không nói ngược. Dùng lại ảnh `tray_africa`, `tray_arctic`, `tray_antarctica`, `tray_pacific` |
| *Thời tiết và thiên tai ở Việt Nam* | Discoverer #5 | Học sau. Explorer không dùng "khí hậu", "thời tiết" làm từ cần học |
| *Sinh vật và môi trường* bài 8–17 | Discoverer #16 | Học sau: môi trường đổi theo mùa, lũ, cháy rừng, phá rừng, động vật gặp nguy, vườn quốc gia, trồng lại rừng; cả biến đổi khí hậu và gấu trắng bị đe doạ của Oak Địa lý |
| *Chuỗi thức ăn nâng cao* | Discoverer #17 | Kẻ săn mồi, con mồi: không dùng |
| *Tiến hoá và di truyền* bài 8, 10–12 | Scientist #14 | Thích nghi: để dành (câu 5 = a, Duy chốt 16/11) |

## 6. Quy ước chung cho cả chủ đề

**Tên gọi** (content-editor chốt trong `_topic.md`)

| Khái niệm | EN | VI | Ghi chú |
| --- | --- | --- | --- |
| nơi sống | habitat | nơi sống | Như #2. Chữ cho bé không dùng "nhà", "môi trường sống" (tên chủ đề Duy chốt 16/11 cũng dùng "nơi sống") |
| động vật hoang dã | wild animal | động vật hoang dã | Như #1: tự tìm thức ăn, nước, chỗ ở. Lạc đà phần lớn do người nuôi, không gọi là hoang dã |
| rừng mưa nhiệt đới | rainforest | rừng mưa nhiệt đới; rừng mưa (từ lần thứ hai) | Khác "rừng" (forest) của #2. [CẦN KIỂM] sách giáo khoa dùng "rừng nhiệt đới", "rừng rậm nhiệt đới" hay "rừng mưa nhiệt đới" |
| rừng ngập mặn · đầm lầy | mangrove · swamp | rừng ngập mặn · đầm lầy | "wetland · vùng đất ngập nước" chỉ làm từ `extra` nếu cần |
| biển · đại dương · rạn san hô · biển sâu | sea · ocean · coral reef · deep sea | biển · đại dương · rạn san hô · biển sâu | |
| đồng cỏ xavan | savanna | đồng cỏ xavan | [CẦN KIỂM] viết "xavan", "xa van" hay "savan" |
| sa mạc · ốc đảo | desert · oasis | sa mạc · ốc đảo | |
| Bắc Cực · Nam Cực | Arctic · Antarctic | Bắc Cực · Nam Cực | Discoverer #1 gọi lục địa là "châu Nam Cực" |
| băng biển | sea ice | băng biển | Bài 1. Không gọi Bắc Cực là "đất" |
| tên nơi | Amazon · Sahara · Africa | A-ma-dôn · Xa-ha-ra · châu Phi | [CẦN KIỂM] cách viết; nghe thử giọng VI đọc. Chuỗi `.en` không dấu |
| nóng · lạnh · ướt · khô | hot · cold · wet · dry | nóng · lạnh · ướt, mưa nhiều · khô | Không dùng "khí hậu · climate" làm từ cần học |
| thích nghi | adaptation | thích nghi | Không dùng (Duy chốt câu 5 = a, 16/11). Oak Địa lý Y2 cũng chỉ dùng "adapt" cho con người; với con vật nói "đặc điểm giúp" |

**Hình**
- Ảnh chụp thật, nguồn CC0, PD, PDM, CC BY; loại BY-SA, NC, ND; không AI từ nguồn ngoài, không Pinterest ([SK-033](backlog/SK-033-real-images.md), `tools/content-cli/README.md` mục "Ảnh: images search…"). Không có ảnh hợp lệ thì đổi món; tự vẽ chỉ khi PM đồng ý.
- **Ảnh đúng nơi:** ảnh mang tên một nơi (Xa-ha-ra, A-ma-dôn, Cần Giờ, Tràm Chim…) phải có địa điểm khớp ở trang gốc; không khớp thì brief và `alt` bỏ tên nơi.
- **Con vật hoang dã thật:** không thấy chuồng, lưới, hàng rào sở thú, người, xe safari, thuyền du lịch, vòng đeo cổ nghiên cứu, yên cương, dây cương (lạc đà, tuần lộc).
- **Không bản đồ, không quả địa cầu, không ảnh Trái Đất từ vũ trụ** (Duy chốt câu 6 = a, 16/11).
- Thẻ ba lựa chọn khung 5:2: cảnh nơi sống chụp rộng, ngang; con vật đứng cao (hươu cao cổ) chụp xa.
- Hai cảnh trong cùng một câu phải khác nhau rõ bằng mắt (luật Explorer số 7): không đặt đồi cát Xa-ha-ra cạnh đồi cát Việt Nam, không đặt voi châu Á cạnh voi châu Phi.

**An toàn và nhạy cảm**
- Không cảnh săn mồi, con mồi, máu, xác. Sư tử, gấu trắng, cá sấu, báo đốm chỉ nằm nghỉ hoặc đi; không há miệng nhe nanh. Không câu nào rủ bé lại gần con vật nguy hiểm.
- Không người cho thú hoang ăn (khỉ Cần Giờ hay bị du khách cho ăn).
- Không thiên tai, cháy rừng, băng tan dữ dội. Không nói "sắp tuyệt chủng" ở Explorer.
- Biển sâu: chọn con vật không đáng sợ.

**Không dùng** (ngoài các chỗ đã nêu ở từng bài): câu ghép con vật với nơi sống y như quiz Oak (mục 2.2 ý 4); các chuỗi thức ăn của #3; key misconception của ba chủ đề trước; key `polar_bears_meet_penguins` của bản gộp đã bỏ.

## 7. Khả thi ảnh (phiên chính kiểm 16/11)

**Cách kiểm.** Một script tạm gọi đúng hàm tìm và luật giấy phép của `content-cli images search` (`tools/content-cli/src/images/sources.ts`, `license.ts`). Chỉ tìm Wikimedia Commons, lấy 40 kết quả đầu mỗi truy vấn, tổng 177 truy vấn cho khoảng 85 cảnh và loài, gồm mọi từ khoá ở mục 4. Một ảnh "qua luật" khi: CC0, PD, PDM hoặc CC BY; cạnh dài từ 600 px; ghi được tác giả. Chưa tìm Openverse (hạn mức 200 lượt/ngày dùng chung). Chưa mở từng trang gốc.

Số đếm chỉ là mức trần, vì nhiều kết quả lạc đề: tượng hươu cao cổ, đồ quân sự khi tìm "desert night", hoá thạch khi tìm "jerboa". Bảng dưới đã xem tên các ảnh đứng đầu rồi mới xếp loại. **Mục này thay cột "Ngờ khó" ở mục 4.**

**Kết luận.** Cả tám bài làm được bằng ảnh thật, không phải bỏ nơi sống nào. Rủi ro dồn vào hai nhóm. Một là vài loài châu Phi nổi tiếng: trên Commons, ảnh của chúng phần lớn là BY-SA. Hai là ảnh mang tên một nơi ở Việt Nam.

**Vùng cực, dùng cho câu 8 (số của hai lượt kiểm ngày 16/11).**
- Bắc Cực: cáo Bắc Cực 25–26, hải mã 12–27, tuần lộc 7, cú tuyết 17, gấu trắng 9, hải cẩu Greenland 31.
- Nam Cực: chim cánh cụt hoàng đế 12, Adélie 18, hải cẩu Weddell 25.
- Tách thành hai bài vẫn đủ ảnh.
- Hai số khác nhau là do truy vấn, không phải do Commons trả kết quả lúc có lúc không. Ví dụ hải mã: `walrus` ra 12 ảnh, `walrus ice Odobenus` ra 27, phần lớn là ảnh công hữu (PD) của cơ quan Mỹ.
- Số 31 ở lượt đầu là truy vấn `harp seal`, tức hải cẩu Greenland, loài sống ở Bắc Cực. Bài Nam Cực dùng hải cẩu Weddell.

| Mức | Cảnh, loài (số ảnh qua luật / 40) |
| --- | --- |
| **Dễ** (từ 10 ảnh đúng chủ đề) | **Cảnh:** rừng A-ma-dôn 29 · tán rừng mưa 18 · rừng Cúc Phương 31 (truy vấn `Cuc Phuong`) · rừng Cát Tiên 15 · rễ đước 23 · rừng ngập mặn Việt Nam 30 (`mangrove Vietnam`) · đầm lầy 26 (`swamp forest`) · Everglades 24 · Pantanal 26 · cồn cát Xa-ha-ra 28 · ốc đảo 21 · sa mạc đá 32 · băng Bắc Cực 36 · đài nguyên 18 · châu Nam Cực 31 · rạn san hô 27 (phần lớn ảnh NOAA, phạm vi công cộng) · xavan mùa khô 11–22 · Trái Đất từ vũ trụ 39 (NASA). **Loài:** sư tử 27 (`lion savanna`) · linh dương đầu bò 28 · tê giác trắng 21 · con lười 18 · ếch phi tiêu độc 21 · vẹt đuôi dài đỏ 15 · khỉ rú 17 · voọc chà vá chân nâu 28 · voọc mông trắng 13 · đười ươi 11 · cá thòi lòi 13 · cò trắng 11 · cá sấu Xiêm 15 · chuột lang nước 22 · rái cá 11 · sếu đầu đỏ 13 (`sarus crane wetland`) · lạc đà một bướu 13 · cáo fennec 13–17 · bọ cạp 32 · thằn lằn sa mạc 28 · cáo Bắc Cực 25 · hải mã 27 · hải cẩu Weddell 25 · cú tuyết 17 · chim cánh cụt hoàng đế 10–12 · chim cánh cụt Adélie 18 · cá voi trắng 21 · rùa biển xanh 16 · cá hề 20 (`clownfish anemone`) · cá heo, cá mập, sứa, sao biển 14–30 · cá voi lưng gù 38 (`humpback whale NOAA`; bỏ ảnh biển báo, ảnh có người) |
| **Vừa** (5–9, chọn kỹ) | hươu cao cổ (13 nhưng nhiều tượng, ảnh sở thú; chỉ 1 ảnh "ăn lá keo") · báo săn 13 (nhiều ảnh sở thú) · gấu Bắc Cực 9 (có sẵn `tray_arctic`) · vượn đen má vàng 9 (CC BY từ iNaturalist; kiểm ảnh hoang dã hay trại cứu hộ) · chim hồng hoàng 5 (Ấn Độ, Nepal) · báo đốm 7 (chỉ khi tìm `Panthera onca`) · khỉ đuôi dài (nhiều, nhưng lẫn mẫu bảo tàng, ảnh có người) · Cần Giờ 5 ("Rừng Sác", "CangioBioReserve") · Tràm Chim 7 · con còng 9 · bò biển 6 · tuần lộc 7 · núi băng trôi 6 · gò mối 5 · sứa biển sâu 6 (NOAA) |
| **Khó** (tối đa 4) | **ngựa vằn** 4 (ba ảnh CC BY 2.5 ở Botswana, một ảnh CC0 đàn ngựa vằn dưới cây keo ở Serengeti) · **voi châu Phi** 2 (một CC0 ở Masai Mara, một CC BY 2.0 ở Zambia) · linh dương Dorcas 0 (40/40 là BY-SA) · báo đốm khi tìm `jaguar` 0 · chuột nhảy 1 ảnh con sống (còn lại là tượng, tranh, hoá thạch) · rạn san hô Việt Nam (Nha Trang 2, Côn Đảo 0) · Cà Mau (`Ca Mau mangrove` 0; dùng được "Mudflats in Dat Mui" CC BY 4.0, "Mui Ca Mau 005" PD) · sa mạc lúc đêm 0 · xavan mùa mưa 2 · vũng nước có thú uống 0 · biển sâu tối 2 · cá lồng đèn biển sâu 1 |

**Ảnh theo bài** (đánh số đã chốt 16/11; đếm từ bảng hình ở mục 4, chưa tính ảnh từ vựng, món Chơi và thẻ thưởng):

| Bài | Ảnh mới (ước) | Dùng lại | Chỗ khó hay vừa |
| --- | --- | --- | --- |
| 1 · Bắc Cực | 5: băng Bắc Cực, cáo Bắc Cực, hải mã, tuần lộc, cú tuyết | `tray_arctic` (gấu trắng); chim cánh cụt làm bẫy | Vừa: gấu trắng 9 (đã có ảnh dùng lại), tuần lộc 7 |
| 2 · Nam Cực | 4: chim cánh cụt hoàng đế, đàn đứng sát nhau, Adélie, hải cẩu Weddell | `tray_antarctica` (Gentoo); gấu trắng làm bẫy; cá voi (tuỳ chọn) | Ảnh đàn chim cánh cụt hoàng đế đứng sát nhau chưa kiểm riêng |
| 3 · Rừng mưa | 9: rừng mưa Việt Nam, A-ma-dôn, mưa trong rừng, vượn đen má vàng, hồng hoàng, lười, khỉ rú, ếch phi tiêu độc, vẹt (báo đốm tuỳ chọn) | voọc chà vá chân nâu | Vừa: hồng hoàng 5, vượn 9, báo đốm 7 |
| 4 · Đất ngập nước | 5: rừng ngập mặn Việt Nam, đầm lầy nước ngọt, còng, khỉ đuôi dài, sếu đầu đỏ | rừng đước, cá thòi lòi, cá sấu Xiêm, cò | Vừa: Cần Giờ 5, Tràm Chim 7, còng 9 |
| 5 · Biển | 4: rạn san hô (ảnh NOAA thay ảnh Việt Nam), biển sâu, rùa biển xanh, cá hề (bò biển tuỳ chọn) | rạn san hô, bãi biển, biển khơi, cá voi lưng gù | Khó: biển sâu tối 2; rạn san hô Việt Nam (bỏ tên nơi); không dùng cá lồng đèn |
| 6 · Xavan | 9: xavan, mùa khô, mùa mưa, ngựa vằn, hươu cao cổ, voi châu Phi, sư tử, linh dương đầu bò, vũng nước | `tray_africa` (tuỳ chọn) | Khó: ngựa vằn 4, voi châu Phi 2, xavan mùa mưa 2, vũng nước 0 |
| 7 · Sa mạc | 8: đồi cát, sa mạc đá, ốc đảo, sa mạc lúc đêm, lạc đà, cáo fennec, chuột nhảy, thằn lằn hoặc bọ cạp | — | Khó: sa mạc lúc đêm 0, chuột nhảy 1; bỏ linh dương Dorcas |
| 8 · Tổng kết | 0 | ảnh bài 1–7 | — |

Tổng khoảng 44 ảnh cảnh và loài mới, cộng ảnh từ vựng, món Chơi, thẻ thưởng: ước 50–65 ảnh mới cho cả chủ đề.

**Sửa mục 4 theo kết quả** (content-editor và designer theo mục này khi soạn):
1. **Truy vấn ngắn.** Commons trả về ảnh có đủ mọi từ trong truy vấn, nên cụm năm, sáu từ ở mục 4 thường chỉ ra 0–3 ảnh. Ví dụ: `lion resting savanna grass` ra 0, `lion savanna` ra 27. `images search` có thử lại với ba từ đầu, nhưng ba từ đầu chưa chắc là ba từ tốt nhất. Brief nên ghi truy vấn hai, ba từ hoặc tên khoa học (`Pygathrix nemaeus`, `Nomascus gabriellae`, `Panthera onca`). Ảnh iNaturalist trên Commons (CC BY 4.0) là nguồn tốt cho loài Việt Nam.
2. **Rừng Cúc Phương, Cát Tiên không khó** như mục 4 đoán: tìm `Cuc Phuong`, `Cat Tien`.
3. **Ngựa vằn, voi châu Phi khó**, dù mục 4 ghi dễ. Vẫn giữ được, vì có 2–4 ảnh hợp lệ. Nhưng mỗi loài chỉ đủ một, hai chỗ, nên dùng lại một ảnh cho nhiều chỗ (`same_as`), hoặc tìm thêm Openverse (Flickr CC BY). Không cần cả ảnh đàn lẫn ảnh một con.
4. **Bỏ linh dương Dorcas.** Thay bằng bọ cạp hoặc thằn lằn (dễ). Ảnh không chụp ở Xa-ha-ra thì brief và `alt` bỏ tên nơi.
5. **Chuột nhảy** chỉ có một ảnh con sống: dùng ở ô Học, không đặt vào lựa chọn quiz.
6. **Rạn san hô Việt Nam:** bỏ tên nơi, dùng ảnh rạn san hô NOAA. Muốn có ảnh Việt Nam thì Duy tự chụp hoặc xin ảnh.
7. **Sa mạc lúc đêm, cặp xavan mùa khô và mùa mưa, vũng nước:** không làm câu hỏi dựa vào các ảnh này. Ý "ban đêm lạnh" nói bằng lời ở ô Học. Với cặp mùa, thử thêm `Serengeti green season`, `Masai Mara` và Openverse; không có thì bỏ cặp ảnh mùa.
8. **Biển sâu:** dùng `deep sea jellyfish NOAA` hoặc ảnh tàu Okeanos Explorer (PD). Không dùng cá lồng đèn.
9. **Ý trừu tượng** (nóng, lạnh, ướt, khô) ở bài 8 và Chơi: ghép từ ảnh cảnh đã chọn ở bài 1–7. Hình tự vẽ chỉ khi PM đồng ý (mục 6).

**Lưu ý khi chọn ảnh.** Hà mã, cáo fennec, báo săn, hồng hoàng có nhiều ảnh trong chuồng. Khỉ đuôi dài, lạc đà và tuần lộc hay có người trong ảnh. Ảnh iNaturalist thường chụp gần, nền rối, nên kiểm trong khung thẻ 5:2.

## 8. Quyết định của Duy (đã chốt hết 16/11; lựa chọn đầy đủ ở [SK-048](backlog/SK-048-explorer-habitats-around-the-world.md))

**Câu 1–9: đã chốt 16/11.** Duy bấm "Theo đề xuất PM" hai lượt: câu 1–7, rồi câu 8, 9. Không còn câu nào chờ Duy.

| # | Câu hỏi | Đề xuất PM | Duy 16/11 |
| --- | --- | --- | --- |
| 1 | Số bài và cách gộp | **7 bài** (phương án A ở mục 3) | A, đã chốt; câu 8 tách vùng cực nên thành 8 bài |
| 2 | Có làm bản Discoverer không | **Chưa làm**; Discoverer gặp lại ý này ở #1 bài 2 và #16 | a, đã chốt |
| 3 | Vị trí trong Explorer | **#4**, sau *Chuỗi thức ăn* | C, đã chốt |
| 4 | Tên chủ đề EN/VI | **Habitats around the world · Những nơi sống trên Trái Đất** | A, đã chốt |
| 5 | Dùng từ "thích nghi · adaptation" ở tuổi 5–7 | **Không dùng**; nói bằng điều nhìn thấy ("lông dày giữ ấm") | a, đã chốt |
| 6 | Bản đồ, quả địa cầu | **Không dùng** ở Explorer | a, đã chốt |
| 7 | Khi nào soạn | Sau khi SK-045, SK-046 đóng rà chữ; không chen việc pilot; xếp cùng câu D3 | a, đã chốt |
| 8 | Bắc Cực và Nam Cực: một bài hay hai bài (Oak Địa lý) | **Tách** theo Oak Y2 lesson 5, 6: 8 bài | b, đã chốt |
| 9 | Thứ tự bài trong chủ đề (Oak Địa lý) | **Lạnh trước nóng** theo Oak: vùng cực lên đầu, năm bài còn lại giữ thứ tự | b, đã chốt |
