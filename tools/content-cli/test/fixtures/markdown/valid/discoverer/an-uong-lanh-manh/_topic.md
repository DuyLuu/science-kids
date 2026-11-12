---
id: d3a514ef-02cd-4386-a358-f01e425a10f8
slug: an-uong-lanh-manh
age_group: discoverer
order: 1
strand: humans_health
level: 2
difficulty:
  abstraction: 1
  prior_knowledge: 2
  misconception: 2
  vocabulary: 3
  science_skill: 1
prerequisites: []
is_free: true
oak_unit_ref: healthy-eating
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Healthy eating
vi: Ăn uống lành mạnh

## Câu hỏi lớn
en: What should we eat to stay healthy?
vi: Ta cần ăn gì để khoẻ mạnh?

## Misconceptions

### all_fat_bad
id: 93c51bb0-1d45-45df-99c5-a0397967fe10
statement.en: All fat is bad for you.
statement.vi: Chất béo lúc nào cũng có hại.
correction.en: Our body needs some fat for energy, to keep warm and to take in some vitamins. The problem is eating too much of it.
correction.vi: Cơ thể cần một lượng chất béo vừa đủ để có năng lượng, giữ ấm và hấp thu một số vitamin. Chỉ ăn quá nhiều chất béo mới không tốt.
note: Trẻ hay nghe "đồ béo không tốt" rồi khái quát thành mọi chất béo đều có hại. Sửa ở bài một (nhóm chất béo trong phần Học và câu sáu của Quiz) và quay lại ở bài ba "Ăn uống bao nhiêu là vừa?".

### one_food_enough
id: e8da090c-a354-461d-b506-90c7bd9f5b3b
statement.en: If a food is healthy, eating only that food is enough.
statement.vi: Món nào tốt cho sức khoẻ thì chỉ ăn mỗi món đó là đủ.
correction.en: No single food has every nutrient our body needs. A balanced meal mixes foods from different groups.
correction.vi: Không có món ăn nào có đủ mọi chất dinh dưỡng cơ thể cần. Bữa ăn cân bằng kết hợp thức ăn của nhiều nhóm khác nhau.
> [CẦN KIỂM] Đối chiếu cách nói "không có món nào có đủ mọi chất dinh dưỡng" với tài liệu của Viện Dinh dưỡng và sách Khoa học lớp bốn (ý "ăn phối hợp nhiều loại thức ăn"). Ý "trẻ hay nghĩ như vậy" là biên tập viết theo kinh nghiệm phổ thông, chưa có nguồn nghiên cứu.
note: Trẻ hay chia đồ ăn thành món tốt và món không tốt, rồi nghĩ chỉ ăn mỗi món tốt (chỉ ăn rau, chỉ ăn quả) là đủ. Sửa ở bài hai "Mâm cơm cân bằng" (Chơi: mâm bốn nhóm; câu sáu của Quiz). Thêm ngày 2/11 cho SK-028, nháp AI.

### meal_needs_meat
id: cb21a2f8-1ac6-4e16-87c1-3d659c51c14a
statement.en: A meal needs meat or fish to be balanced.
statement.vi: Bữa ăn phải có thịt hoặc cá mới cân bằng.
correction.en: Tofu, beans and eggs give us protein too. A meal with tofu instead of meat or fish can still be balanced.
correction.vi: Đậu phụ, các loại đậu và trứng cũng cho ta chất đạm. Bữa ăn có đậu phụ thay cho thịt hay cá vẫn có thể cân bằng.
> [CẦN KIỂM] Ý "trẻ hay nghĩ như vậy" là biên tập viết theo kinh nghiệm phổ thông, chưa có nguồn nghiên cứu. Cách sửa chỉ nói về một bữa ăn và về món nào có chất đạm, không nói cả chế độ ăn chay có đủ chất hay không. Nếu bài bốn cần câu kiểu "ăn chay vẫn đủ chất" (ăn chay lâu ngày, ăn chay không trứng sữa, trẻ đang lớn) thì chuyên gia dinh dưỡng xác nhận cách nói trước.
note: Trẻ hay coi chất đạm là thịt và cá, nên nghĩ bữa chay hay bữa không có thịt là thiếu chất, rồi cho rằng bạn ăn khác mình là ăn sai. Dự kiến sửa ở bài bốn "Mỗi người ăn một kiểu" (câu misconception của Quiz; phần Chơi có thể là xếp mâm cân bằng không có thịt, cá), nối lại đậu phụ trong nhóm chất đạm ở bài một và mâm bốn nhóm ở bài hai. Thêm ngày 8/11 khi đổi kế hoạch bài, nháp AI; chưa câu nào dùng key này.

## Ghi chú

- `oak_unit_ref` là trường nội bộ, không bao giờ hiện cho trẻ. Từ 8/11/2026 ghi slug unit trên trang Oak (`healthy-eating`) thay cho tên unit "Y3 Healthy eating", để tra ngược: https://www.thenational.academy/teachers/programmes/science-primary-ks2/units/healthy-eating/lessons (PM đọc ngày 8/11, syllabus-progression mục 13). Schema chỉ yêu cầu chuỗi không rỗng (`NonEmptyString` trong `packages/content-schema/src/topic.ts`) và `content-cli` đọc nguyên chuỗi, nên đổi giá trị không cần sửa schema hay parser.
- `difficulty` theo syllabus-progression mục 5.2: 9 điểm (A-B-C-D-E = 1-2-2-3-1), Mức 2.
- `prerequisites` để trống vì đây là chủ đề đầu tiên và miễn phí của Discoverer. Kiến thức nền (nhu cầu sống, cây tự làm thức ăn) đi qua câu khởi động `prior_knowledge` của bài một.

**Kế hoạch năm bài** (Duy chốt 8/11/2026 sau khi đối chiếu với Oak, syllabus-progression mục 13.3)

- Bài 1 và 2 đã soạn, đang chạy trong app; giữ nguyên. Bài 3 đến 5 chưa soạn.
- So với kế hoạch cũ: bài 3 nay là bài về lượng ăn uống, gộp cả bài 4 cũ "Nước và chất xơ"; bài 4 mới, cho lesson bắt buộc còn thiếu; bài 5 giữ, kiêm tổng kết.
- Tên bài 3, 4, tên tiếng Anh bài 5 và mục tiêu bài 3 đến 5 là **nháp AI, chưa duyệt**. Canvas Discoverer-Topic đổi tên hai thẻ bài 3, 4 theo bảng này.

| Bài app (`stage`) | Mục tiêu "I can…" | Lesson Oak | Bắt buộc |
| --- | --- | --- | --- |
| 1 · What does food give us? · Thức ăn cho ta những gì? (`opener`) | I can name the main nutrients in food. · Em kể được các nhóm chất dinh dưỡng chính. | Types of food · Nutrition from food (các nhóm chất và việc của chúng) | có · có |
| 2 · A balanced meal · Mâm cơm cân bằng (`core`) | I can tell which meal is balanced. · Em nhận ra được bữa ăn nào cân bằng. | Amounts of food (tỉ lệ trong một bữa) · Nutrient-rich meal (2 lesson) | có · không |
| 3 · How much should we eat? · Ăn uống bao nhiêu là vừa? (`core`) | I can tell how much to eat and drink. · Em biết ăn uống bao nhiêu là vừa. | Amounts of food · Nutrition from food (phần chất xơ và nước) · Fats in food (2 lesson, phần chất béo) | có · có · không |
| 4 · We all eat differently · Mỗi người ăn một kiểu (`apply`) | I can ask kindly about what my friends eat. · Em biết hỏi han nhẹ nhàng về món bạn ăn. | Different diets for different people | có |
| 5 · What do animals eat? · Động vật ăn gì? (`review`) | I can say where animals get their food. · Em nói được động vật lấy thức ăn từ đâu. | Making or finding food (bài 1 đã chạm ở câu khởi động w2) | có |
| chưa có bài | | Sustainable sources of food · Local food · Food miles | không · không · không |

- Phủ đủ 5/5 lesson bắt buộc và 9/12 lesson Oak; ba lesson còn lại là bền vững, không bắt buộc.
- Tên lesson Oak viết gọn như syllabus-progression mục 13.3, chỉ dùng nội bộ; không chép câu chữ Oak vào bài.
- `stage` theo syllabus-progression mục 6: bài 3 giải thích vì sao lượng ăn uống quan trọng; bài 4 là bài áp chót, vận dụng mâm cân bằng vào bữa của người ăn khác mình; bài 5 vừa dạy ý mới vừa ôn trộn cả chủ đề.
- Từ tiếng Anh trong tên và mục tiêu mới: should, much đã gặp ở câu hỏi lớn và bài 1, 2; drink, friends, animals là từ Starters quen. Hai từ cần đối chiếu danh sách Cambridge Starters, Movers (theo trí nhớ của biên tập): differently, kindly (dạng -ly của different, kind).

**Khi soạn bài 3 đến 5** (nháp AI)

- Bài 3: đồ ngọt, đồ béo chỉ ăn một chút; rau (chất xơ) và nước cần đủ mỗi ngày.
  - Quay lại `all_fat_bad`: ăn ít chất béo, không phải bỏ hẳn.
  - Nói lượng bằng "nhiều", "một chút", "vừa đủ". Con số (số cốc nước, số gam đường mỗi ngày) chỉ đưa vào khi chuyên môn đã xác nhận.
  - Xét đề xuất nhóm chất béo `role: neutral` ở mâm năm chỗ, chuyển từ bài 2 (Ghi chú cho dev của bài 2).
  - Không gây xấu hổ về cân nặng hay vóc dáng, như bài 2.
- Bài 4: mỗi người ăn một kiểu vì sức khoẻ (dị ứng thức ăn), vì niềm tin hay nếp riêng của gia đình (ví dụ nhà bạn ăn chay ngày rằm), hoặc vì lựa chọn của mỗi người. Misconception dự kiến: `meal_needs_meat`.
  - Tôn giáo nói trung tính: không gắn một kiểu ăn với một tôn giáo, dân tộc hay vùng miền; không nói kiểu ăn nào đúng hơn kiểu nào.
  - Ăn chay ở Việt Nam có nhiều kiểu (có người ăn trứng, sữa, có người không), nên mâm chay ví dụ dùng đậu phụ và không nói người ăn chay ăn gì cụ thể.
  - Dị ứng phải có ý an toàn: món mình bị dị ứng thì không ăn, không tự thử; không ép bạn ăn thử; thấy khó chịu sau khi ăn thì nói ngay với người lớn; hỏi bạn trước khi mời bạn ăn. Mọi câu nói về dấu hiệu dị ứng và cách xử trí phải có dòng cần kiểm trong bài, để chuyên gia y tế xác nhận.
  - Không đưa ăn kiêng để giảm cân vào bài (chạm vóc dáng).
  - Hỏi han tôn trọng: hỏi nhẹ nhàng, nghe câu trả lời, không chê món của bạn. Bối cảnh gần trẻ: bữa trưa bán trú, liên hoan lớp.
  - Quiz vẫn kiểm cả lý do ăn khác nhau, không chỉ cách hỏi.
  - Chơi: có thể dùng `build_tray` xếp mâm cân bằng cho bạn không ăn thịt, hay cho bạn dị ứng tôm (món đó vào nhóm `limit`).
- Bài 5: ý mới là cây tự làm ra thức ăn, còn động vật, kể cả con người, phải ăn cây hoặc con vật khác.
  - Ôn trộn bài 1 đến 4; câu misconception chọn một trong ba key của chủ đề.
  - Hỏi lại câu "Em nghĩ sao?" đề xuất ở bài 1 (Ghi chú cho dev của bài 1, câu hỏi mở 2).
  - Có thể thêm một câu về món ăn địa phương thay cho ba lesson bền vững (syllabus-progression mục 13.3).
