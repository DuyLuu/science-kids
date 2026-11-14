# Oak · Living things and where they live (Year 2): khung từng lesson

- **Nguồn:** https://www.thenational.academy/teachers/programmes/science-primary-ks1/units/living-things-and-where-they-live/lessons cùng 7 trang lesson theo mẫu `.../living-things-and-where-they-live/lessons/<slug>`
- **Ngày lấy:** 14/11/2026
- **Dùng cho:** chủ đề Explorer #2 *Sinh vật sống ở đâu?* (7 bài app, tên bài theo `content/syllabus.json`)
- **Cách đọc:** mọi ý đều đã viết lại bằng lời mình, không chép nguyên văn Oak. Từ khoá giữ nguyên tiếng Anh như Oak dùng, kèm nghĩa tiếng Việt ngắn. Trang lesson không ghi tên các learning cycle. Video, worksheet, slide deck và "additional materials" chỉ có link tải, file này chưa đọc các tài liệu đó; phần "Hoạt động" vì thế dựa vào mẹo giáo viên và danh sách dụng cụ. Nhiều câu quiz dùng hình không có nhãn chữ. Những dòng "Quiz Oak" lấy ví dụ từ starter quiz và exit quiz trên trang, để biên tập biết Oak kiểm tra ý gì. Starter quiz của lesson 2–7 ôn lại lesson ngay trước; starter quiz lesson 1 ôn unit *Naming and grouping animals*.

## Thông tin unit

- **Mô tả:** phân biệt vật đang sống, đã chết và không sống; nơi sống (habitat) đáp ứng nhu cầu của cây và con vật ra sao. HS nhận biết, gọi tên cây và con vật ở các nơi sống khác nhau, dùng quan sát để phân loại và thu thập dữ liệu.
- **Vị trí:** unit 5 trên 6 của Science KS1 Year 2 (mạch Biology). Unit trước là *Introduction to food chains* (unit 4), unit sau theo nút "Next" là *Healthy me* (unit 6).
- **Nối tiếp:** phần "why this, why now" ghi unit này xây trên *Naming and grouping animals* và chuẩn bị cho *Living things and the environment* (sinh vật tương tác với môi trường, nơi sống thay đổi thì sinh vật sống sót ra sao). Nút "Next unit" lại dẫn tới *Healthy me*; giống unit Year 1, Oak không giải thích chỗ lệch.
- **Threads:** BQ01 Biology (sinh vật là gì, được tạo từ gì), BQ03 Biology (sinh vật sống cùng nhau trong môi trường thế nào).
- **Số lesson:** 7. Trang unit không đánh dấu lesson nào là non-statutory, nên coi cả 7 là bắt buộc (khớp `statutory: true` trong `content/syllabus.json`). Lesson 7 có nhãn chủ đề *Climate Change & Sustainability*; đó là nhãn, không phải dấu tuỳ chọn.

## Kiến thức nền

Theo trang unit, trước khi học HS cần:

- Đã khám phá thế giới tự nhiên, quan sát cây và con vật.
- Nhận ra điểm giống và khác giữa cây, con vật ở quanh mình.
- Hiểu cần tôn trọng và chăm sóc mọi sinh vật.
- Gọi tên được các loại cây dại và cây vườn quen thuộc, kể cả cây to.
- Gọi tên được các con vật quen thuộc, gồm cá, lưỡng cư, bò sát, chim, thú.

## Thứ tự lesson trên trang unit

| # | Lesson (EN) | Slug | Bắt buộc |
| --- | --- | --- | --- |
| 1 | Living or non-living | `living-or-non-living` | có |
| 2 | Living things and movement | `living-things-and-movement` | có |
| 3 | Alive, dead and never alive | `alive-dead-and-never-alive` | có |
| 4 | Animal habitats | `animal-habitats` | có |
| 5 | Plant habitats | `plant-habitats` | có |
| 6 | Plants and animals in microhabitats | `plants-and-animals-in-microhabitats` | có |
| 7 | Protecting microhabitats | `protecting-microhabitats` | có |

## Từng lesson

### 1. Living or non-living (`living-or-non-living`)

- **Mục tiêu:** so sánh và xếp được mọi thứ thành hai nhóm: vật sống và vật không sống.
- **Ý chính:**
  - Thế giới gồm vật sống và vật không sống.
  - Vật sống thì đang sống, cần thức ăn, nước và không khí.
  - Vật không sống không cần thức ăn, nước, không khí vì nó không sống.
  - Có thể so sánh, xếp nhóm vật sống và không sống theo điểm giống, điểm khác.
  - Quiz Oak: starter ôn unit Year 1 (con vật ăn cả cây lẫn thịt là ăn tạp; người, mèo, voi đều là thú; cá phủ vảy; gọi tên cá sấu, tắc kè hoa, rắn, rùa cạn; lưỡng cư máu lạnh, sống cạn hoặc nước, đẻ trứng, không có lông vũ; hươu cao cổ, ếch, cá vàng không có lông vũ). Exit: con giun là vật sống (nĩa, ghế thì không); vịt đồ chơi không sống (cây táo, chim sẻ ngô xanh thì sống); ngoài không khí, vật sống cần thức ăn và nước (không cần đồ chơi, phòng ngủ); vật không sống thì không cần thức ăn, nước, không khí; tìm vật bị xếp sai trong hình phân loại của bạn Sam.
  - [CẦN KIỂM] Câu cuối exit quiz coi "lá rụng trên đất" bị đặt sai chỗ (đáp án: lá rụng và con ruồi). Nghĩa là ở lesson này lá rụng được tính là "không sống". Nhưng lesson 3 tách "đã chết" khỏi "chưa từng sống", và exit quiz lesson 3 không tính lá rụng là "vật không sống". Bài app nên tránh đưa vật đã chết (lá rụng, xương, vỏ ốc) vào câu hỏi hai nhóm sống / không sống; để dành cho bài 3.
- **Từ khoá:**
  - living: đang sống; vật sống lớn lên, sinh sản, cử động, ăn và thải chất bỏ đi (sống, vật sống)
  - alive: vật sống thì "đang sống" (còn sống)
  - non-living: không sống, không có đặc điểm nào của vật sống (vật không sống)
  - sort: xếp đồ vào các nhóm khác nhau (phân loại, sắp xếp)
- **Misconception:** cây không phải vật sống vì ta không thấy cây cử động. Oak sửa: đưa ví dụ về vật sống, trong đó có cây.
- **Hoạt động:** so sánh và xếp nhóm vật sống / không sống (cắt hình, xếp). Mẹo: mỗi HS mang tới một đồ vật hoặc ảnh từ nhà, cả lớp bàn xem nó có sống không. Slide 20 có câu hỏi chẩn đoán (diagnostic question). Dụng cụ: giấy, bút chì, kéo.
- **Lưu ý:** content guidance: cần đánh giá rủi ro dụng cụ (kéo); exploration of objects. Yêu cầu có người lớn giám sát (required).

### 2. Living things and movement (`living-things-and-movement`)

- **Mục tiêu:** mô tả được cử động là việc mà mọi vật sống đều làm.
- **Ý chính:**
  - Mọi thứ trên đời có thể xếp vào vật sống hoặc vật không sống.
  - Vật sống thì đang sống, cần thức ăn, nước và không khí.
  - Mọi vật sống có chung những hoạt động gọi là quá trình sống (life processes).
  - Vật sống tự cử động để đạt một mục đích (tới chỗ thức ăn, ánh sáng…); đó là một dấu hiệu của sự sống.
  - Quiz Oak: starter ôn lesson 1 (con thuyền không sống; cú đại bàng (eagle owl) sống; thế giới gồm vật sống và không sống; vật sống cần thức ăn, nước, không khí; câu "cái gì cử động cũng sống" là sai). Exit: cá đuối là vật sống, xe đồ chơi và điện thoại thì không; thanh sô-cô-la không sống, nhện và cây bồ công anh sống; tên chung cho các việc mọi vật sống đều làm là life processes; vật sống cần thức ăn, không khí, nước (không cần lửa, ti vi); trong các vật biết cử động, con chó và cây hướng dương là vật sống, diều và tàu hoả thì không.
- **Từ khoá:**
  - living thing: thứ đang sống, biết lớn lên, sinh sản, cử động, ăn và thải chất bỏ đi (vật sống)
  - life processes: những việc mọi vật sống đều làm (quá trình sống, hoạt động sống)
  - move: đổi chỗ, đi từ chỗ này sang chỗ khác (cử động, di chuyển)
  - alive: vật sống cử động, hô hấp, cảm nhận, lớn lên, sinh sản, thải chất bỏ đi và cần chất dinh dưỡng (còn sống)
- **Misconception:** cây không cử động vì ta không thấy; vậy cái gì cử động cũng là vật sống. Oak sửa: cây cử động rất chậm, ví dụ hoa hướng dương quay theo mặt trời trong ngày; đồ chơi lên dây cót hay chạy pin cũng cử động nhưng không sống.
  - [CẦN KIỂM] Ví dụ hướng dương: chỉ cây hướng dương còn non (nụ, chưa nở hẳn) quay theo mặt trời; hoa đã nở thường đứng yên, quay về hướng đông. Nếu dùng, nên viết "cây hướng dương non" hoặc chọn ví dụ khác (cây trinh nữ cụp lá, ngọn bầu bí leo theo giàn).
- **Hoạt động:** không có thí nghiệm. Mẹo: chiếu video tua nhanh (time-lapse) cảnh cây cử động để trẻ thấy cây có cử động, chỉ là quá chậm. Dụng cụ: không cần.
- **Lưu ý:** content guidance: exploration of objects. Khuyến nghị có người lớn giám sát. Tên bài app "Vật sống nào cũng cử động" khớp ý chính; cần cặp đôi với ý ngược "cử động chưa chắc đã sống".

### 3. Alive, dead and never alive (`alive-dead-and-never-alive`)

- **Mục tiêu:** so sánh và xếp được mọi thứ thành ba nhóm: đang sống, đã chết, chưa từng sống.
- **Ý chính:**
  - Vật sống là vật hiện đang sống, cần thức ăn, không khí, nước để sống tiếp.
  - Vật đã chết là vật từng sống nhưng nay không còn sống.
  - Vật không sống là vật chưa bao giờ sống.
  - Có thể so sánh và xếp mọi thứ vào ba nhóm: đang sống, đã chết, chưa từng sống.
  - Quiz Oak: starter ôn lesson 2 (xe đạp không sống, cây hoa hồng sống; cái gì cử động cũng sống là sai; xếp mọi thứ vào sống / không sống gọi là classification; vật sống cần nước, thức ăn, không khí; quả bóng và thang cuốn cử động nhưng không sống). Exit: vật sống thì đang sống; thỏ cần thức ăn, nước, không khí (không phải chuồng, đồ chơi, bạn bè); con vật chỉ còn bộ xương là con vật đã chết; voi đồ chơi là vật không sống; nhà khoa học xếp nhóm là gom những thứ giống nhau; tìm vật bị xếp sai giữa nhóm "đang sống" và "chưa từng sống" (đáp án: gấu bông và cây bồ công anh).
  - [CẦN KIỂM] Đáp án starter quiz câu "mọi thứ cử động đều sống" hiển thị lặp chữ "false, false" trên trang; đáp án đúng vẫn là "sai".
- **Từ khoá:**
  - alive: vật sống thì đang sống; chúng cử động, hô hấp, cảm nhận, lớn lên, sinh sản, thải chất bỏ đi, cần chất dinh dưỡng (đang sống)
  - dead: đã từng sống, nay không còn sống (đã chết)
  - never alive: chưa từng sống bao giờ, nên không gọi là sống hay chết được (chưa từng sống)
  - compare: xem cái gì giống, cái gì khác (so sánh)
  - group: gom những thứ giống nhau vào chung (xếp nhóm)
- **Misconception:** vật không sống là vật đã chết. Oak sửa: dùng ví dụ cho thấy vật không sống là vật chưa từng sống.
- **Hoạt động:** xếp thẻ vào ba nhóm. Mẹo: làm bảng trưng bày của lớp chia ba nhóm, dùng suốt bài và cho HS thêm ví dụ mới vào từng nhóm. Dụng cụ: kéo, thẻ phân loại.
- **Lưu ý:** content guidance: depiction or discussion of sensitive content (bài nói về cái chết; có trẻ vừa mất người thân hoặc thú cưng). Khuyến nghị có người lớn giám sát. Bẫy hay gặp: đồ làm từ gỗ, giấy, bông, da (bàn gỗ, quyển vở, áo bông) là từ vật từng sống. Oak không bàn chuyện này, nhưng exit quiz lesson 1 xếp "cái ghế" là không sống. Bài app nên tránh đưa đồ gỗ, giấy vào nhóm "chưa từng sống"; chọn nhựa, kim loại, đá, thuỷ tinh cho chắc.

### 4. Animal habitats (`animal-habitats`)

- **Mục tiêu:** giải thích được vì sao các con vật khác nhau sống ở những nơi sống khác nhau.
- **Ý chính:**
  - Nơi sống (habitat) là chỗ một nhóm cây và con vật cùng sống.
  - Nơi sống cung cấp những gì cây, con vật cần để sống sót.
  - Phần lớn sinh vật sống ở nơi hợp với chúng.
  - Các con vật sống ở nơi khác nhau vì nhu cầu cơ bản của chúng khác nhau.
  - Quiz Oak: starter ôn lesson 3 (giun là vật sống; vật sống cần thức ăn, không khí, nước; sâu đồ chơi không sống; lá rụng là đã chết; xếp vật sống / không sống gọi là grouping; cốc và bọ rùa đồ chơi thuộc nhóm "chưa từng sống"). Exit: chỗ cây và con vật sống gọi là habitat; vật sống là vật đang sống; sinh vật sống ở nơi đáp ứng nhu cầu cơ bản của chúng; hải cẩu sống gần biển vì ăn sinh vật biển; sa mạc không hợp với hà mã vì hà mã cần ở trong nước nhiều để giữ da ướt; ghép con vật với nơi sống: cá hề với rạn san hô, sóc với rừng cây, gấu Bắc Cực với Bắc Cực, kỳ nhông (iguana) với rừng mưa.
  - [CẦN KIỂM] Câu hải cẩu chỉ nhận một đáp án "ăn sinh vật biển"; lựa chọn "bơi giỏi" cũng là lý do hợp lý nhưng bị tính sai. Nếu làm câu tương tự, đặt các lựa chọn sai thật rõ (thích tắm nắng, thích đèn hải đăng).
- **Từ khoá:**
  - animals: sinh vật tự di chuyển, ăn con vật khác hoặc ăn cây (động vật)
  - living: đang sống, biết lớn lên, sinh sản, cử động, ăn, thải chất bỏ đi (sống)
  - habitat: nơi một cây hay một con vật sống (nơi sống, môi trường sống)
  - suitable: đúng, phù hợp với một mục đích (phù hợp)
  - basic needs: những thứ sinh vật phải có mới sống được (nhu cầu cơ bản)
- **Misconception:** nơi sống của con vật chỉ là "cái nhà" của nó; nơi sống chỉ chia làm "nóng" và "lạnh". Oak sửa: dùng ví dụ và ảnh chụp nhiều nơi sống khác nhau.
- **Hoạt động:** không có thí nghiệm. Dụng cụ gồm phong bì ghi địa chỉ và mẫu bưu thiếp, nên có lẽ HS viết bưu thiếp kể về một nơi sống (suy từ dụng cụ, trang không mô tả). Mẹo: xem livestream nơi sống của con vật (tổ chim ưng biển, hang cáo, nơi sống dưới nước).
- **Lưu ý:** content guidance: exploration of objects. Khuyến nghị có người lớn giám sát. Từ "habitat" dịch "nhà" thì dễ đúng vào misconception; dùng "nơi sống" và nhấn mạnh nơi đó có đủ thức ăn, nước, chỗ trú.

### 5. Plant habitats (`plant-habitats`)

- **Mục tiêu:** giải thích được vì sao các loài cây khác nhau sống ở những nơi sống khác nhau.
- **Ý chính:**
  - Nơi sống là chỗ một nhóm cây và con vật cùng sống.
  - Nơi sống cung cấp những gì cây, con vật cần để sống sót.
  - Phần lớn sinh vật sống ở nơi hợp với chúng.
  - Các loài cây sống ở nơi khác nhau tuỳ nhu cầu cơ bản của chúng.
  - Quiz Oak: starter ôn lesson 4 (habitat là chỗ một nhóm cây và con vật sống, không phải "chỗ nóng" hay "nhà con vật xây"; không phải con nào cũng sống chung một nơi; nơi sống cho con vật những thứ cần để sống; gấu Bắc Cực sống ở Bắc Cực vì ăn hải cẩu sống dưới biển; đười ươi hợp với rừng mưa; ghép nòng nọc với ao, voi với xavan, lạc đà với sa mạc, cú lợn rừng (tawny owl) với rừng cây). Exit: chỗ cây, con vật sống gọi là habitat; phần lớn sinh vật hợp (suited/adapted) với nơi chúng sống; cây thường xuân (ivy) hợp với rừng cây; tảo bẹ (sea kelp) sống ở biển vì nơi đó đáp ứng nhu cầu của nó; vì sao xương rồng không sống ở rừng mưa; ghép anh túc Bắc Cực với Bắc Cực, thuỷ tiên vàng với rừng cây, xương rồng saguaro với sa mạc, tảo bẹ với biển.
  - [CẦN KIỂM] Câu xương rồng trên trang đánh dấu hai đáp án đúng: rừng mưa quá tối so với nhu cầu nắng của xương rồng, và rừng mưa có quá nhiều nước trong khi xương rồng cần ít nước. Ý "cần ít nước, nơi đó mưa nhiều" là lý do chính và an toàn; ý "rừng mưa quá tối" chỉ đúng ở tầng dưới tán. Nên dùng một đáp án.
- **Từ khoá:**
  - plant: sinh vật thường có rễ, thân, lá (cây, thực vật)
  - living thing: thứ đang sống, biết lớn lên, sinh sản, cử động, ăn, thải chất bỏ đi (vật sống)
  - habitat: nơi một cây hay một con vật sống (nơi sống)
  - suitable: đúng, phù hợp với một mục đích hay dịp nào đó (phù hợp)
  - basic needs: những thứ sinh vật phải có mới sống được (nhu cầu cơ bản)
- **Misconception:** nơi sống chỉ chia làm "nóng" và "lạnh"; cây không phải vật sống. Trang không có câu sửa riêng; Oak đưa nhiều nơi sống khác (dưới nước, sa mạc, đồng cỏ, xavan) và dựa vào định nghĩa "plant", "living thing".
- **Hoạt động:** không có thí nghiệm. Tra cứu qua sách khoa học, trang web về cây, phiếu thông tin (fact file); xếp thẻ cây theo ảnh nơi sống. Mẹo: xem livestream, video về nơi sống của cây (rừng cây, sa mạc, Bắc Cực). Dụng cụ: sách về nơi sống của cây, máy tra cứu, fact file, thẻ phân loại cây, ảnh nơi sống, kéo, giấy, bút chì.
- **Lưu ý:** content guidance: exploration of objects. Khuyến nghị có người lớn giám sát.

### 6. Plants and animals in microhabitats (`plants-and-animals-in-microhabitats`)

- **Mục tiêu:** nhận biết và gọi tên được cây, con vật sống ở những nơi sống nhỏ (microhabitat).
- **Ý chính:**
  - Nơi sống là chỗ một nhóm cây và con vật cùng sống.
  - Nơi sống cung cấp những gì cây, con vật cần để sống sót.
  - Nơi sống nhỏ (microhabitat) là một khoảng nhỏ hơn, nơi cây hoặc con vật sống.
  - Vũng nước trên đá ven biển (rock pool) và khúc gỗ mục là ví dụ nơi sống nhỏ.
  - Ở nơi sống nhỏ ta gặp những cây và con vật nhỏ hơn.
  - Quiz Oak: starter ôn lesson 5 (sinh vật sống ở các habitat khác nhau; sông đáp ứng nhu cầu của hoa súng; cây phù hợp với Bắc Cực là cây vân sam (spruce), không phải xương rồng hay cây cọ; nhu cầu cơ bản của cây là nước, ánh sáng, độ ấm; ghép dương xỉ với rừng cây, xương rồng tai thỏ (prickly pear) với sa mạc, rong biển với biển, cây thông với Bắc Cực). Exit: rừng cây là một habitat; "survive" nghĩa là sống tiếp; vũng đá, dưới khúc gỗ, trên chiếc lá đều là microhabitat; sa mạc không phải microhabitat; giun và cỏ có thể gặp ở microhabitat, cá sấu và cây sồi thì không.
  - [CẦN KIỂM] Starter quiz câu đúng/sai "sinh vật không thể hợp với nơi chúng sống": trang ghi đáp án "đúng", trong khi lesson 5 dạy điều ngược lại. Đáp án đúng phải là "sai"; trang có lỗi.
  - [CẦN KIỂM] Starter quiz coi cây vân sam, cây thông hợp với "Bắc Cực". Rừng vân sam, thông mọc ở vùng lạnh phương Bắc gần Bắc Cực, không mọc trên đồng rêu Bắc Cực thật sự (ở đó gần như không có cây to). Không nên đưa vào app.
  - [CẦN KIỂM] Exit quiz tính "cái ao" là microhabitat. Nhiều tài liệu coi ao là một habitat nhỏ; ranh giới mơ hồ. Ví dụ an toàn hơn cho trẻ: dưới hòn đá, khúc gỗ mục, đống lá, vũng nước trên đá.
- **Từ khoá:**
  - plant: sinh vật thường có rễ, thân, lá (cây, thực vật)
  - animal: sinh vật tự di chuyển, ăn con vật khác hoặc ăn cây (động vật)
  - habitat: nơi một cây hay một con vật sống (nơi sống)
  - microhabitat: nơi sống rất nhỏ, như khoảng dưới một gốc cây, một khúc gỗ hay một vũng đá (nơi sống nhỏ, "nơi sống tí hon")
  - minibeast: con vật rất nhỏ, như côn trùng hay nhện (con vật nhỏ xíu, "sâu bọ"; tiếng Việt chưa có từ đúng nghĩa, cân nhắc "các con vật bé tí")
- **Misconception:** nơi sống nào cũng là microhabitat; con vật nhỏ xíu nào cũng là côn trùng. Oak sửa: giải thích rõ microhabitat là gì và khác các nơi sống lớn (biển, rừng, Bắc Cực, sa mạc) ra sao; đưa ví dụ minibeast cả côn trùng lẫn không phải côn trùng (nhện, giun, ốc sên…).
- **Hoạt động:** đi tìm, quan sát nơi sống nhỏ quanh trường (hoặc xem video, livestream vũng đá ven biển); ghi tên cây, con vật tìm thấy. Mẹo: dùng kính lúp cho quan sát kỹ; nhắc HS trả con vật về đúng chỗ đã bắt. Dụng cụ: kính lúp (nếu có), bút chì, giấy.
- **Lưu ý:** content guidance: exploration of objects. Khuyến nghị có người lớn giám sát. Lời mascot nên nhắc "nhìn thôi, không bắt, lật đá xong đặt lại".

### 7. Protecting microhabitats (`protecting-microhabitats`)

- **Mục tiêu:** tìm được cách giúp cây và con vật sống an toàn ở các nơi sống nhỏ.
- **Ý chính:**
  - Nơi sống nhỏ là một khoảng nhỏ, nơi cây hoặc con vật sống.
  - Một số nơi sống nhỏ đang bị đe doạ vì có người không chăm lo cho Trái Đất.
  - Một khu vườn thân thiện với thiên nhiên hoang dã (wildlife-friendly garden) giúp cây và con vật sống an toàn trong nơi sống nhỏ.
  - Quiz Oak: starter ôn lesson 6 (rừng cây là habitat, con ếch và cái đĩa thì không; lạc đà sống ở sa mạc; hoa giọt tuyết (snowdrop) sống ở rừng cây; khoảng nhỏ nơi sinh vật sống gọi là microhabitat; đống gỗ và vũng đá là microhabitat, cánh đồng và rừng mưa thì không; sư tử quá to để sống trong microhabitat). Exit: microhabitat là khoảng nhỏ nơi cây và con vật sống; cây chết (thân gỗ mục) là microhabitat; microhabitat bị đe doạ vì có người không chăm lo cho Trái Đất; lũ lụt và rác là mối đe doạ, giun và rêu thì không; vườn thân thiện có nhiều nơi sống nhỏ để thu hút sinh vật; trong vườn đó có khách sạn côn trùng (bug hotel) và hộp tổ chim.
  - [CẦN KIỂM] Exit quiz tính "lũ lụt" là mối đe doạ, cạnh ý chính "do người không chăm lo cho Trái Đất". Lũ lụt phần lớn là thiên tai, không do trẻ gây ra; ghép hai ý dễ làm trẻ hiểu lũ là lỗi của người. Nếu dùng, tách "mối đe doạ do con người" (rác, đốt lá, phun thuốc sâu, đổ bê tông) khỏi "thiên tai".
- **Từ khoá:**
  - microhabitat: nơi sống rất nhỏ, như dưới một gốc cây, một khúc gỗ hay một vũng đá (nơi sống nhỏ)
  - minibeast: con vật rất nhỏ, như côn trùng hay nhện (con vật nhỏ xíu)
  - threat: khả năng một điều xấu hay nguy hiểm xảy ra (mối đe doạ)
  - protect: giữ cho thứ gì đó khỏi bị hại (bảo vệ)
  - wildlife-friendly garden: khu vườn thu hút sinh vật hoang dã như bướm, chim, con vật nhỏ (vườn thân thiện với thiên nhiên)
- **Misconception:** con vật nhỏ xíu nào cũng là côn trùng; con vật nhỏ nào cũng cần cùng một điều kiện (ẩm và tối). Oak sửa (cho ý thứ hai): đưa ví dụ nơi sống nhỏ có điều kiện khác nhau: sáng, tối, ướt.
- **Hoạt động:** bàn cách bảo vệ nơi sống nhỏ, thiết kế hoặc làm nơi sống nhỏ (khách sạn côn trùng, hộp tổ chim) nếu có vật liệu. Mẹo: nhiều tổ chức có tài liệu miễn phí về đa dạng sinh học trong sân trường. Dụng cụ: bút chì, bút mực, giấy, vật liệu làm nơi sống nhỏ nếu cần.
- **Lưu ý:** content guidance: depiction or discussion of violence or suffering (nơi sống bị phá, sinh vật chết); exploration of objects. Yêu cầu có người lớn giám sát (required). Nhãn *Climate Change & Sustainability*. Với trẻ từng trải qua lũ, tránh hình ảnh thiên tai nặng nề; nhấn vào việc trẻ làm được.

## Đối chiếu với 7 bài app

Tên bài app lấy từ `content/syllabus.json` (group `explorer`, key `living-things-and-where-they-live`). Khớp 1:1 theo thứ tự và slug; cả 7 bài `statutory: true`, khớp trang Oak.

| Bài app | Tên bài app (VI) | Lesson Oak | Bắt buộc (Oak) |
| --- | --- | --- | --- |
| 1 | Vật sống hay không sống? | 1. Living or non-living | có |
| 2 | Vật sống nào cũng cử động | 2. Living things and movement | có |
| 3 | Đang sống, đã chết, chưa từng sống | 3. Alive, dead and never alive | có |
| 4 | Nơi sống của con vật | 4. Animal habitats | có |
| 5 | Nơi sống của cây | 5. Plant habitats | có |
| 6 | Những nơi sống nhỏ xíu | 6. Plants and animals in microhabitats | có |
| 7 | Bảo vệ những nơi sống nhỏ | 7. Protecting microhabitats | có |

Chỗ lệch với catalog:

- **Thứ tự unit:** catalog đặt chủ đề này là Explorer #2 và *Introduction to food chains* là #3. Ở Oak Year 2, *Introduction to food chains* là unit 4, unit này là unit 5 (trang unit ghi unit trước là food chains). `source.unit_index` trong catalog (5 và 4) đúng với Oak, chỉ số `number` của chủ đề thì đảo. Cần Duy quyết: giữ thứ tự app (sinh vật và nơi sống trước, chuỗi thức ăn sau, hợp logic "biết nơi sống rồi mới xét ai ăn ai") hay theo đúng Oak.
- **Nhóm tuổi:** unit này là Year 2, chủ đề #1 là Year 1; catalog ghi `level: 3`. Không phải lỗi, chỉ ghi lại.

## Bản địa hoá Việt Nam

- **Nơi sống quen với trẻ Việt:** ruộng lúa, ao làng, sông, rừng ngập mặn (Cần Giờ, Cà Mau), rừng nhiệt đới (Cúc Phương, Cát Tiên), núi đá vôi, biển và rạn san hô (Nha Trang, Côn Đảo), vườn nhà, công viên. Bắc Cực và sa mạc vẫn dùng được như ví dụ "xa", nhưng nên mở đầu bằng nơi sống gần nhà. Đồi cát Mũi Né, Ninh Thuận không phải sa mạc thật; nếu dùng thì gọi "đồi cát".
- **Con vật theo nơi sống:** ruộng lúa có ếch, cua đồng, ốc, cò, chuột đồng; ao có cá rô, cá chép, nòng nọc; rừng ngập mặn có cá thòi lòi, còng, khỉ; rừng có voọc, khỉ, chim; biển có cá hề, rùa biển, sao biển; vườn có chim sẻ, sóc, thằn lằn.
- **Cây theo nơi sống:** sen, súng, bèo ở ao; đước, bần ở rừng ngập mặn; lúa ở ruộng; xương rồng ở đồi cát nắng; dương xỉ, rêu ở chỗ râm ẩm; rong biển ở biển.
- **Nơi sống nhỏ:** dưới chậu cây, dưới viên gạch, khe tường, gốc cây, đống lá khô, bụi chuối, khúc gỗ mục, hốc đá ven biển. Con vật nhỏ xíu: kiến, giun đất, cuốn chiếu, ốc sên, nhện, dế, bọ rùa. Tránh khuyến khích trẻ lật đá ở nơi có rết, bọ cạp, rắn; lời mascot nên có "rủ người lớn đi cùng".
- **Đang sống / đã chết / chưa từng sống:** lá rụng, vỏ ốc, xương cá là "đã chết"; đồ nhựa, chén sứ, viên bi, đồ kim loại là "chưa từng sống". Tránh đồ gỗ, giấy, vải bông (xem lưu ý lesson 3).
- **Bảo vệ nơi sống nhỏ:** không xả rác, không đốt lá khô ngoài vườn, giữ một góc vườn um tùm, đặt chậu nước cho chim, làm nhà côn trùng bằng ống tre, trồng cây có hoa cho bướm. Tránh nói lũ lụt miền Trung là lỗi của con người.
