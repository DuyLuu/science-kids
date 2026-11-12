# SK-036 · Soạn chủ đề Discoverer #3 "Hô hấp" (4 bài)

Trạng thái: review · Ngày: 2026-11-10 · Phụ trách: content-editor (soạn), designer (hình), main session chạy lệnh · Tester: tester
Nguồn: Duy 10/11 ("tiếp tục" các phần còn "Sắp có"); syllabus.md mục 8 (pilot); syllabus-lessons.md mục 3; `content/TEMPLATE.md`; chủ đề *Bề mặt Trái Đất* (SK-031) và *Khủng long* (SK-032) làm mẫu

## Mục tiêu
Chủ đề thứ ba của pilot có đủ 4 bài chơi được trong app, có hình, tiếng EN và VI.

## Phạm vi
- **content-editor:** `content/discoverer/ho-hap/_topic.md` (kế hoạch 4 bài, luật riêng, bảng đáp án Đúng/Sai) rồi soạn 4 bài:
  1. Vì sao ta phải thở? · Why we breathe
  2. Đường đi của không khí: mũi, khí quản, phổi · The journey of air
  3. Thở khi chạy nhảy · Breathing and exercise
  4. Giữ phổi khoẻ: khói bụi, khói thuốc, khẩu trang · Keeping lungs healthy
- **designer:** file chọn hình `content/images/discoverer/ho-hap/<bài>.json` theo SK-033 (ảnh nguồn miễn phí, hình vẽ khi không có ảnh, hình ghép cho cảnh khó).
- **main session:** `ids`, `validate`, `import`, `images fetch`, `tts` EN/VI, `build` đủ mọi chủ đề, `check-pack`, gắn id vào `content/syllabus.json`, cài lên iPhone.
- **tester:** rà chữ như SK-032.

## Ngoài phạm vi
- Duyệt chuyên môn y khoa (ghi `[CẦN KIỂM]`, chuyên gia duyệt sau).

## Tiêu chí nghiệm thu
- [ ] 4 bài theo TEMPLATE, `ai_draft: true`, `[CẦN KIỂM]` ở chỗ cần chuyên gia.
- [ ] Mọi câu Khởi động và Quiz, mọi lựa chọn, mọi thẻ từ, mọi món Chơi, ô Học, từ vựng, thẻ thưởng có `image.brief` + `alt` EN/VI; `brief` ghi loại hình (`[ảnh]`, `[hình vẽ]`, `[sơ đồ ghép ảnh]`) và từ khoá tìm ảnh tiếng Anh.
- [ ] Rút kinh nghiệm SK-031, SK-032, SK-033:
  - trong một câu, mọi lựa chọn cùng loại hình và cùng kiểu (cùng ảnh, cùng số ít/số nhiều), đáp án đúng không lộ bằng hình thức;
  - `hint` chỉ cách nghĩ, không nói đáp án;
  - vị trí đáp án đúng xáo trong từng bài, không theo chu kỳ; đáp án Đúng/Sai đổi qua lại;
  - lựa chọn sai phải có sức hút (nối với misconception), không quá yếu;
  - nhãn `limit` không gọi tên món bẫy; `messages.full` "Tap one to take it off" · "Chạm vào để bỏ ra"; nhãn câu 6 "Challenge: check Na's idea" · "Thử thách: kiểm tra ý của Na";
  - `alt` tả đặc điểm đồng đều giữa các lựa chọn;
  - hình không có người nhận ra mặt, logo, nhãn hiệu, chữ.
- [ ] Nội dung hợp 7–9 tuổi: không cảnh bệnh tật đáng sợ; khói thuốc nói nhẹ, không hình người hút thuốc rõ mặt; không lời khuyên y tế thay bác sĩ.
- [ ] `validate` 0 lỗi; `build` và `check-pack` OK; iPhone chơi được 4 bài, có tiếng và hình.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở
**Phụ thuộc:** SK-030, SK-033.

**Quyết định đã ghi:** slug thư mục `ho-hap` (main session 10/11).

**Câu hỏi còn mở**

## content-editor 10/11

Phạm vi: chỉ viết trong `content/discoverer/ho-hap/`. Không sửa `content/TEMPLATE.md`, file dùng chung hay thư mục `nao-bo-va-giac-quan/`. Không chạy lệnh. Mọi file `ai_draft: true`, mọi dòng `id:` để trống.

**File**
- `content/discoverer/ho-hap/_topic.md`: frontmatter (`order: 3`, `strand: humans_health`, `level: 3`, difficulty 3-1-2-2-2), sáu misconception, kế hoạch bốn bài, bảng Tên gọi, Quy ước hình, bảng Hình dùng chung, bảng Đáp án Đúng/Sai, bảng Vị trí đáp án đúng, luật khi soạn, bảng Khởi động, lời Na câu sáu, thẻ thưởng, An toàn, Để dành, Đề xuất, Còn mở.
- `01-vi-sao-ta-phai-tho.md` (`opener`), `02-duong-di-cua-khong-khi.md` (`core`), `03-tho-khi-chay-nhay.md` (`apply`), `04-giu-phoi-khoe.md` (`review`).

**Chạy `ids` theo thứ tự:** `_topic.md`, bài một, bài hai, bài ba, bài bốn (Khởi động bài hai, ba, bốn trỏ về bài trước trong chủ đề). Trỏ ra ngoài: bài một w2 → `khung-long/vi-sao-khung-long-bien-mat`, bài bốn w3 → `be-mat-trai-dat/nui-lua` (đều đã có id).

**Tóm tắt từng bài**

| Bài | Ba ý chính | Misconception (q6) | Câu 6, lời Na · đáp án |
| --- | --- | --- | --- |
| 1 Vì sao ta phải thở? | thở cả khi ngủ; người và con vật đều thở, cả cá; cơ thể lấy ô-xi từ không khí | `breathe_out_same_air` | "I breathe out the same air I breathe in." · Na chưa đúng (bằng chứng: kính lạnh mờ ở q5, cơ thể giữ lại ô-xi) |
| 2 Đường đi của không khí | vào qua mũi hoặc miệng; xuống khí quản; tới hai lá phổi trong lồng ngực | `air_goes_to_belly` (misconception chính) | "My belly moves out when I breathe in. But the air goes to my lungs." · Na nói đúng |
| 3 Thở khi chạy nhảy | chạy nhảy thì thở nhanh; nghỉ thì chậm lại; cơ bắp cần thêm ô-xi | `only_lungs_need_oxygen` | "My legs need more oxygen when I run. So I breathe faster." · Na nói đúng |
| 4 Giữ phổi khoẻ | bụi và khói hại phổi; khẩu trang giúp ngăn bụi; có bụi nhỏ tới mức không nhìn thấy | `clear_air_is_clean` | "The air looks clear today. So it has no dust." · Na chưa đúng |

- Hai misconception không gắn key: `fish_do_not_breathe` (bài một, bài ba w2), `smoke_only_hurts_smoker` (bài bốn: một ví dụ ở ô Khói, một món bẫy, không có câu hỏi).
- Mỗi bài: Học bốn ô `explore_groups` + `word_list` ba từ core; Chơi `build_tray` ba nhóm `required`, một nhóm `limit`, tám đến chín món; Quiz DOK 1·1·2·2·2·3, đủ bốn format app 0.1.0 hiện được (`single_choice`, `multi_choice`, `true_false`, `fill_blank_bank`); từ vựng bốn đến năm từ. Không dùng `order_sequence`, `picture_bar_chart` (biểu đồ cột bài ba là hình vẽ trong câu `single_choice`).
- Thẻ thưởng (bộ mới `set: breathing`): cá voi, con voi (vòi là mũi), "Busy lungs" (hơn hai mươi nghìn lần thở mỗi ngày), cây đa.

**Đáp án Đúng/Sai** (sáu Đúng, sáu Sai; câu sáu Sai, Đúng, Đúng, Sai)

| Bài | Câu | Đáp án |
| --- | --- | --- |
| 1 | w2 "Some kinds of animals lived on and still live today." | Đúng |
| 1 | q1 "We breathe even when we are asleep." | Đúng |
| 1 | q6 | Sai |
| 2 | w2 "The air you breathe out is warm and wet." | Đúng |
| 2 | q5 "When you breathe out, your lungs get bigger." | Sai |
| 2 | q6 | Đúng |
| 3 | w2 "Only animals on land need to breathe." | Sai |
| 3 | q5 "After a race, your breathing stays fast all day." | Sai |
| 3 | q6 | Đúng |
| 4 | w2 "When we breathe in, the air goes into our belly." | Sai |
| 4 | w3 "Volcanoes can throw ash high into the sky." | Đúng |
| 4 | q6 | Sai |

**Vị trí đáp án đúng** (theo thứ tự `####` trong file)
- Bài một: w1 thứ nhất; q2 thẻ thứ hai; q3 thứ nhất và thứ tư; q4 thứ ba; q5 thứ hai.
- Bài hai: w1 thứ ba; q1 thứ hai; q2 thẻ thứ hai và thứ tư; q3 thứ ba; q4 thứ nhất và thứ ba.
- Bài ba: w1 thứ hai; q1 thứ nhất; q2 thẻ thứ ba; q3 thứ hai và thứ ba; q4 thứ hai.
- Bài bốn: w1 thứ tư (bốn lựa chọn); q1 thứ hai; q2 thẻ thứ ba; q3 thứ hai và thứ tư; q4 thứ nhất; q5 thẻ thứ hai.
- Câu w1 của bốn bài ở bốn chỗ khác nhau; không bài nào theo chu kỳ.

**Đối chiếu tiêu chí "Rút kinh nghiệm SK-031, SK-032, SK-033"** (biên tập tự kiểm bằng mắt, chưa có máy)
- Mọi câu Khởi động và Quiz, lựa chọn, thẻ từ, món Chơi, ô Học, từ vựng, thẻ thưởng có `image.brief` + `alt` EN/VI. `brief` mới mở đầu bằng `[ảnh]` hoặc `[hình vẽ]` (chủ đề không có `[sơ đồ ghép ảnh]`); brief `[ảnh]` có "Từ khoá tìm ảnh (EN)"; brief dùng lại viết "Dùng lại hình `<key>`" hoặc "… ở bài `<chủ đề>/<bài>`", chép từ khoá của chỗ gốc khi gốc là ảnh.
- Trong một câu, các lựa chọn cùng loại hình (bộ phận cơ thể luôn là hình vẽ cùng nét; đồ vật, cảnh là ảnh chụp), cùng số, cùng kiểu nhãn; `alt` tả đồng đều (câu hỏi vị trí bài hai q1 dùng "tô màu phần cổ, ngực, bụng").
- `hint` chỉ chỗ cần nhớ hoặc cách nghĩ, không đọc lại lựa chọn, không nhắc chữ của nhãn đáp án (ô bài ba đặt tên "Thử đếm" để gợi ý q2 không lộ "lần thở").
- Lựa chọn sai nối với misconception hay liên tưởng có thật: bóng bay, chong chóng, quạt "có không khí"; dạ dày, thực quản; cờ vua "là thể thao"; hơi nồi cơm "trông như khói"; công viên ngày nhiều khói bụi.
- Nhãn `limit`: "Does not breathe", "Not on the air path", "Not moving much", "Not good for lungs" (VI dạng "Không …"), không gọi tên món bẫy; `has_limited` nói lý do. `messages.full` và nhãn câu sáu đúng chữ ticket.
- Không có người nhận ra mặt: ảnh có người chỉ là tay, chân, bóng ngược sáng, thợ lặn từ sau lưng; cảnh có trẻ là `[hình vẽ]` từ phía sau, không nét mặt. Không logo, nhãn hiệu, chữ, số (ghi rõ ở brief: số làn đường chạy, số ô lò cò, biển số xe).
- Mỗi câu EN tối đa mười từ (đếm tay, kể cả gợi ý, giải thích, lời nhắn, ví dụ ở Học).

**[CẦN KIỂM]** (chi tiết ở dòng `>` ngay dưới từng trường)
- *Tổng quát:* nội dung sách Tự nhiên và Xã hội lớp hai về cơ quan hô hấp (mũi, khí quản, phế quản, phổi; "vì sao nên thở bằng mũi"); cách viết "khí ô-xi" hay "oxygen"; có đưa tên "phế quản" vào chữ VI không; tên "thực quản".
- *Bài một:* cá, tôm thở bằng mang; "ô-xi cùng thức ăn cho năng lượng"; hơi thở ra ấm, ẩm, ít ô-xi hơn (số phần trăm chỉ ở ghi chú); bình của thợ lặn chứa không khí nén; cá voi thở qua lỗ trên đỉnh đầu.
- *Bài hai:* lông mũi và lớp nhầy giữ bụi; vòng sụn khí quản; phổi xốp "như bọt biển"; một cơ dưới phổi (cơ hoành) làm bụng phình ra; lá phổi trái nhỏ hơn; voi bơi giơ vòi lên để thở.
- *Bài ba:* phổi, tim, máu, cơ bắp (cách giản lược); nhịp thở chậm lại sau vài phút nghỉ; **"thấy khó thở thì báo ngay cho người lớn" cần chuyên môn y khoa duyệt**; tỉ lệ ba cột biểu đồ (ước khoảng hai mươi, hai mươi lăm, bốn mươi lần một phút, không ghi trên hình); sơ đồ mạch máu đỏ và xanh; "hơn hai mươi nghìn lần thở mỗi ngày".
- *Bài bốn:* khẩu trang "giúp ngăn" bụi, giặt hoặc thay; bụi mịn nhỏ hơn sợi tóc rất nhiều, lọt qua lông mũi; tro núi lửa như bụi; lau ẩm ít bụi hơn quét khô; khói rơm rạ, bếp than tổ ong, khói thuốc thụ động có hại; ngày nhiều khói bụi nên chơi trong nhà, đóng cửa sổ; hơi nồi cơm là hơi nước; cây nhả ô-xi, lá giữ bụi.

**Hình khó tìm, đề xuất** (designer xem Ghi chú cho hoạ sĩ của từng bài)
- Bộ phận bên trong cơ thể đã để `[hình vẽ]` từ đầu: bài hai gần như toàn hình tự vẽ (một sơ đồ đường thở gốc với mười bản tô màu, tám bộ phận vẽ riêng cho kệ Chơi, hai cảnh có trẻ); bài ba có biểu đồ cột bốn bản và sơ đồ mạch máu. Bài một có hai cảnh trẻ tự vẽ (ngủ trong màn, Mai cạnh cửa kính).
- Có thể phải chuyển sang `[hình vẽ]`:
  - bài bốn `q3_road` (đường đông xe máy: biển số, mặt người, biển hiệu); nếu vẽ thì cả bốn lựa chọn câu q3 vẽ theo;
  - bài bốn `explore_dust` (đường bụi mù; thay được bằng công trường từ xa);
  - bài một `explore_breath_out` (con vật thở ra hơi trắng sáng lạnh);
  - bài một q5 (ba ô cửa kính cùng khung: trong, mờ hơi nước, bụi). Khó có ba ảnh cùng khung; nếu vẽ thì vẽ cả ba.
- Ảnh cần cắt, xoá chi tiết: ô lò cò không số và đường chạy không số làn (bài ba; lò cò thay được bằng "nhảy bao bố"); logo quạt, bình khí, bóng, xe đạp; thẻ mang, vây, vảy cá (bài một q2) có thể cắt từ ảnh cá chép đã chọn của *Khủng long* nếu ảnh đủ nét.
- Ảnh thành phố mù bụi: ảnh Hà Nội trên Commons phần lớn CC BY-SA; dùng thành phố khác miễn không có chữ.
- **Hình trùng với *Não bộ và giác quan* (SK-037):** bên đó cũng tự vẽ mũi nhìn nghiêng cắt sát (`nao-dieu-khien-co-the/w1_nose`), tim, dạ dày. Đề xuất designer vẽ một lần và hai chủ đề dùng chung (bài hai chủ đề này: `tray_nose`, `tray_heart`, `tray_stomach`). Biên tập không sửa file của SK-037; PM hoặc biên tập bên đó quyết bên nào là hình gốc.

**Đề xuất cho người khác**
- **ios-dev:** thêm khoá `collectible.set.breathing` "Breathing cards" · "Thẻ hô hấp" (chưa có thì app hiện "Thẻ").
- **PM:** ghi `level` cho `new-breathing` (mười điểm, Mức 3; chín điểm, Mức 2 nếu chấm A = 2).
- **dev:** không cần sửa gì. Nếu giọng VI đọc "ô-xi" lạ thì thêm dòng vào `READINGS`.

**Còn chưa chắc**
- Món bẫy "Khói thuốc lá" và "Bếp than tổ ong" ở phần Chơi bài bốn: chờ Duy xem (thay được bằng "Đốt rác"). Câu hỏi không có câu nào về thuốc lá.
- Câu q6 bài ba (Na nói đúng) có thể dễ hơn mức DOK ba vì ô Cơ bắp vừa dạy đúng ý đó; tester xem có nên đổi sang lời Na sai ("Mình thở nhanh vì mình bị nóng") không. Nếu đổi thì phải đảo một câu Đúng khác sang Sai để giữ cân bằng.
- Biểu đồ cột bài ba q4: nhãn lựa chọn theo màu ("cột xanh dương"); cần xem trên máy ba màu đủ khác nhau và VoiceOver đọc được.
- Số từ trên một màn: Học khoảng hai mươi bảy tới hai mươi chín; vài câu Quiz khoảng ba mươi; màn Chơi khoảng năm mươi như các chủ đề trước (chờ PM chốt cách đếm).
- Câu "Em nghĩ sao?" (bài một, đề xuất schema v1.1 `think_first`) chỉ ở Ghi chú cho dev; bài bốn w2 hỏi lại dạng Đúng/Sai.
- Chưa chạy `validate`; phiên chính chạy rồi gửi lại dòng lỗi, biên tập sửa.

## Rà chữ (tester 10/11)

Phạm vi: đọc `_topic.md` và 4 bài (không sửa file nội dung; không chạy `ids`, `validate`, `tts`, `build`, `import`; không dùng simulator — một tester khác đang kiểm app). Chuẩn đối chiếu: `content/TEMPLATE.md`, `content/rules.json` (Discoverer), `syllabus-progression.md` mục 6–8, tiêu chí SK-036 (nhất là mục "Rút kinh nghiệm SK-031, SK-032, SK-033"), luật riêng trong `_topic.md`, và độ an toàn với trẻ 7–9 tuổi. Ngoài đọc tay, chạy 4 script kiểm cấu trúc trong scratchpad (không phải test sản phẩm): (1) từng câu — format, DOK, số lựa chọn, vị trí đáp án đúng, `answer`/`answers`, key misconception, số từ EN theo câu và theo màn; (2) mọi `Dùng lại hình` trỏ tới key có thật, có chép đúng từ khoá của chỗ gốc, và không trỏ qua một hình dùng lại khác; (3) mọi khối cần hình có `image.brief` + `alt` EN/VI, brief mới mở đầu bằng loại hình và có từ khoá EN; (4) loại hình của các lựa chọn trong một câu, nhãn `limit`, dấu phẩy ở nhãn nhóm, các chuỗi bắt buộc của ticket.

**Tổng kết: chặn 0 · nên sửa 7 · nhỏ 14.**

### Đạt (đã kiểm, không có lỗi)
- Quiz 6 câu mỗi bài, DOK 1·1·2·2·2·3 (Discoverer 2·3·1), câu 1 DOK 1, đúng 1 câu misconception (q6) và key có thật trong `_topic.md`; mỗi bài đủ 4 format (`single_choice`, `multi_choice`, `true_false`, `fill_blank_bank`), không dùng `order_sequence` hay `picture_bar_chart`. `single_choice` 3 lựa chọn (bài bốn w1 có 4), `multi_choice` 4 lựa chọn. Khởi động 2–3 câu, DOK 1.
- Vị trí đáp án đúng khớp từng dòng bảng "Vị trí đáp án đúng" ở `_topic.md` (đã đối chiếu máy 16 câu một đáp án và 4 câu nhiều đáp án); trong một bài không câu nào theo chu kỳ.
- Đáp án Đúng/Sai khớp bảng `_topic.md`: 6 Đúng, 6 Sai; q6 là Sai, Đúng, Đúng, Sai; mỗi bài có cả Đúng lẫn Sai. Không câu đáp án Sai nào có `explanation_correct` mở đầu bằng "Yes!" · "Đúng rồi!"; `explanation_wrong` của câu Sai đều nói "This is false" · "Câu này sai" hoặc "Na is not right" · "Na chưa đúng", của câu Đúng đều nói "This is true" · "Na is right".
- 84 tham chiếu `Dùng lại hình` (46 trong bài, 38 ra bài khác, kể cả `khung-long/…` và `be-mat-trai-dat/nui-lua`) đều trỏ tới key có thật; từ khoá tìm ảnh chép đúng chỗ gốc ở cả 84 chỗ; `alt` của chỗ dùng lại khớp chỗ gốc trừ các chỗ cố ý đổi (bài hai q1, q3).
- Mọi câu Khởi động và Quiz, mọi `option`, `bank`, `item`, ô Học, từ vựng, thẻ thưởng đều có `image.brief` + `alt` EN và VI; mọi brief mới mở đầu bằng `[ảnh]` hoặc `[hình vẽ]`, brief `[ảnh]` đều có "Từ khoá tìm ảnh (EN)".
- Trong một câu, mọi lựa chọn cùng loại hình (đã kiểm máy, kể cả qua chuỗi dùng lại): bài hai q1, q2, q3, q4 và bài ba w1, q4 toàn hình vẽ; bài bốn q5 ba thẻ hình vẽ; các câu còn lại toàn ảnh chụp. Không câu nào có một hình vẽ lẻ giữa các ảnh chụp.
- Nhãn `limit` cả bốn bài dạng "Does not …"/"Not …" · "Không …", gọi tên loại, không gọi tên món bẫy; nhãn nhóm Học và Chơi không có dấu phẩy; `messages.full` và nhãn câu sáu đúng chữ ticket ở cả bốn bài.
- Số từ EN: chỉ một câu quá 10 từ trong cả chủ đề (bài hai q2, đúng cảnh báo `validate`, xem N7). Chuỗi VI không có chữ số, không có ký hiệu, không có dấu "—"; "20,000" chỉ ở EN.
- `word_list` ba từ core mỗi bài, mọi `term_keys` có khối từ vựng tương ứng. Tên gọi thống nhất với bảng Tên gọi; chữ cho trẻ không có "cơ hoành", "phế quản", "trachea", "oesophagus", "PM2.5", "khí các-bô-níc", "ung thư", "bao tử".
- An toàn 7–9 tuổi: không cảnh bệnh tật, không phổi đen, không bệnh viện, không người ho; khói thuốc chỉ ở một ví dụ ô Khói và một món bẫy, hình không có người hút, không có tay, không có bao thuốc; không câu nào rủ bé nín thở hay lặn; câu sức khoẻ duy nhất ("thấy khó thở thì báo ngay cho người lớn") đã có `[CẦN KIỂM, chuyên môn y khoa]`. Hình không có người rõ mặt, không logo, không chữ (đã ghi rõ trong brief, kể cả số làn đường chạy, số ô lò cò, biển số xe).
- Câu Khởi động ôn đúng chữ của bài gốc: bài một w2 khớp nguyên văn ô "Lived on" · "Sống sót" (`khung-long/05:230-231`) và gợi ý gọi đúng tên ô; bài hai w2 khớp ô Hơi thở ra; bài ba w1 khớp ô Mũi; bài bốn w3 khớp ý "tro là những mảnh đá rất nhỏ" của từ `ash` bài *Núi lửa*.

### Lỗi chặn
Không có.

### Nên sửa (7)

**N1. Bài hai q1: ba hình lựa chọn lộ đáp án, và `alt` không tả đúng hình.**
- `02-duong-di-cua-khong-khi.md:343` "Where are your lungs?" · "Phổi của em nằm ở đâu?"
- `02:369` lựa chọn đúng `q1_chest`: "Dùng lại hình `explore_lungs`." — đây đúng là hình bé vừa chạm ở ô Phổi, **tô hai lá phổi**. `02:361` `q1_neck` dùng lại `explore_windpipe` (tô khí quản), `02:377` `q1_belly` là bản **tô dạ dày**. Bé chỉ cần nhận ra "hình có hai lá phổi" là chọn đúng, không cần biết phổi nằm ở đâu.
- Kèm theo, `alt` nói khác hình: `02:362` "A body drawing with the neck part coloured" nhưng hình tô cả khí quản chạy xuống ngực; `02:370` "the chest part coloured" nhưng hình tô cơ quan. Trái chính `_topic.md` mục "Quy ước hình" 6 ("câu hỏi vị trí (bài hai q1) dùng `alt` 'tô màu phần cổ, ngực, bụng', không gọi tên bộ phận") và TEMPLATE mục A ("các lựa chọn cùng kiểu ảnh, không ảnh nào nổi bật hơn"; "ảnh không có chữ gọi tên đáp án").
- Đề xuất: ba bản mới **tô vùng cơ thể**, không tô cơ quan, cùng một màu phủ trong suốt, các cơ quan bên trong giữ màu nhạt như bản gốc — `q1_neck` phủ vùng cổ, `q1_chest` phủ vùng ngực, `q1_belly` phủ vùng bụng. Giữ nguyên `alt` EN và VI (đã đúng kiểu). Cập nhật "Bản tô màu cần vẽ (mười)" ở `02:662` thành mười hai bản.

**N2. Bài ba q6 chưa tới DOK 3 (trả lời câu hỏi của biên tập ở mục "Còn chưa chắc" 2).**
- `03-tho-khi-chay-nhay.md:554` lời Na: "My legs need more oxygen when I run. So I breathe faster."
- Ô Cơ bắp dạy đúng từng vế: `03:176` "blood takes oxygen to your legs" · "máu mang ô-xi tới chân em" và `03:178` "so you breathe faster" · "nên em thở nhanh hơn". Lời Na chỉ là hai ví dụ đó ghép lại, nên bé chỉ cần **nhận ra câu đã nghe** — mức DOK 1–2, không phải đánh giá. So với q6 bài hai (Na nói hai ý nghe như ngược nhau, bé phải hoà giải) và q6 bài một, bài bốn (bác bỏ một kết luận) thì bài ba nhẹ hơn hẳn.
- **Không nên** đổi sang "Mình thở nhanh vì mình bị nóng" (Na sai): nóng thật sự cũng làm thở nhanh hơn một chút (chó còn thở hổn hển để hạ nhiệt), nên đáp án "Na chưa đúng" không sạch về khoa học; lại phải đảo thêm một câu Đúng/Sai khác.
- Đề xuất A (rẻ nhất, không đụng hình, không đụng bảng Đúng/Sai): bỏ kết luận khỏi ô Học, để bé tự ghép ở q6. `03:178-179` đổi "so you breathe faster" · "nên em thở nhanh hơn" thành "your muscles use it to keep going" · "cơ bắp dùng ô-xi để chạy tiếp được". Ô vẫn dạy đủ (cơ bắp cần thêm ô-xi, máu mang tới chân); phần nhân quả "nên thở nhanh hơn" thành việc của q6. Ý chính ba giữ nguyên (ý chính chưa hiện cho bé).
- Đề xuất B (nếu muốn giữ nguyên ô Học): đưa lời Na sang bộ phận bài chưa dạy, giữ `answer: true` nên bảng Đáp án Đúng/Sai không đổi — "When I swim, my arms need more oxygen. So I breathe faster." · "Khi mình bơi, tay mình cần nhiều ô-xi hơn. Vì vậy mình thở nhanh hơn." Bé phải mở rộng từ "chân khi chạy" sang "cơ bắp nào đang làm việc" (đúng correction của `only_lungs_need_oxygen`). Phải đổi `image.brief` của q6 (`03:562` đang dùng lại `explore_faster`, cảnh đá bóng) và thêm một ảnh cảnh bơi không thấy mặt — tốn thêm một ảnh.

**N3. Bài ba q4 (biểu đồ cột): hai lỗi.**
- a) *Thứ tự cột gài bẫy ngoài ý muốn.* `03:485` "Mai counted her breaths after reading, walking and skipping. Which bar shows skipping?" · `03:486` "Mai đếm số lần thở sau khi đọc truyện, đi bộ và nhảy dây. Cột nào là lúc nhảy dây?" Câu kể ba việc theo thứ tự, mà `03:487` cố ý xếp cột **không** theo thứ tự đó (đỏ vừa, xanh cao nhất, vàng thấp nhất). Bé đọc biểu đồ theo đúng quy ước (cột thứ ba là việc thứ ba) sẽ chọn cột vàng và sai, dù cách nghĩ của bé hợp lý. Đây không phải misconception bài muốn sửa.
  - Đề xuất: bỏ thứ tự khỏi câu hỏi — "Mai counted her breaths after three different things." · "Mai đếm số lần thở sau ba việc khác nhau." rồi "Which bar shows skipping?" · "Cột nào là lúc nhảy dây?" (8 + 4 từ EN). Giữ ghi chú "Thứ tự cột không theo độ cao" ở brief.
- b) *Nhãn lựa chọn chỉ phân biệt bằng màu.* `03:504`, `03:512`, `03:520`: "yellow bar" · "cột vàng", "blue bar" · "cột xanh dương", "red bar" · "cột đỏ"; `alt` (`03:506`, `03:514`, `03:522`) cũng chỉ nói màu. Bé mù màu đỏ–lục (khoảng 1/12 bé trai) và bé dùng VoiceOver không có cách nào phân biệt. Hai màu dùng cho hai cột có độ sáng gần nhau: `do_son` `#A93A27` và `cham` `#2E4A6E` (`packages/design-tokens/tokens.json:13`, `:21`).
  - Đề xuất: nhãn theo vị trí **trong hình** — "the left bar" · "cột bên trái", "the middle bar" · "cột ở giữa", "the right bar" · "cột bên phải"; `alt` theo: "The chart with the middle bar marked" · "Biểu đồ, đánh dấu cột ở giữa". (TEMPLATE mục A.6 chỉ cấm nhắc vị trí *thẻ trên màn* — "the second card" — không cấm tả vị trí trong hình.) Tối thiểu thì giữ nhãn màu nhưng thêm vị trí vào `alt`.

**N4. Bài ba q2: câu điền từ chứa luôn gốc từ của đáp án.**
- `03:394` "To check your breathing, count your {1} for one minute." · `03:395` "Muốn biết em thở nhanh hay chậm, em đếm số {1} trong một phút." Đáp án là `breaths` · "lần thở" — cùng gốc với "breathing" · "thở" ngay trong câu. Biên tập đã cẩn thận đặt tên ô Học là "Thử đếm" và viết gợi ý không nhắc "lần thở" (`03:115`, `03:397-398`), nhưng chính câu điền lại nói ra.
- Đề xuất: "Before you skip, count your {1} for one minute." · "Trước khi nhảy dây, em đếm số {1} trong một phút." (9 từ EN). Vẫn đúng ô Thử đếm (ví dụ 1 và 2), và loại được hai thẻ sai một cách tự nhiên (chưa nhảy thì không có "lần nhảy"). Giữ nguyên gợi ý và hai câu giải thích.

**N5. Hai gợi ý nói thẳng bằng chứng hoặc đáp án (luật `_topic.md` mục "Khi soạn bốn bài", SK-032 N2).**
- `03:98-99` (w2): "Remember the fish in the first lesson." · "Em nhớ lại con cá ở bài đầu tiên nhé." Câu hỏi là "Only animals on land need to breathe." (đáp án Sai); nói "con cá" chính là nêu phản ví dụ, bé không còn gì để nghĩ.
  - Đề xuất: "Remember the Animals card in the first lesson." · "Em nhớ lại ô Con vật ở bài đầu tiên nhé." (đúng mẫu đã dùng ở `02:52-53`).
- `01-vi-sao-ta-phai-tho.md:478-479` (q4): "What do you need even when you sleep?" · "Em nghĩ xem thứ gì em cần cả khi đang ngủ." Câu trả lời của gợi ý là "không khí", mà nhãn đáp án là "air tank" · "bình khí".
  - Đề xuất: "You can save food for later. What cannot wait?" · "Thức ăn để lát nữa ăn cũng được. Thứ gì thì không đợi được?" (6 + 3 từ EN) — vẫn là cách nghĩ, không gọi tên lựa chọn.

**N6. Bài một, lời khen ở phần Chơi gọi con tôm là "cá".**
- `01:238-239` `messages.balanced`: "Great! They all breathe, even the fish in water." · "Tuyệt! Con nào cũng thở, cả con cá dưới nước." Nhóm "Sống dưới nước" có cá chép **và con tôm**; bé chọn tôm rồi nghe khen "cả con cá dưới nước" là sai sự thật, trong một chủ đề đang dạy phân loại con vật. Ghi chú `01:242` coi hai món là một là chưa đúng.
- Đề xuất: "Great! They all breathe, even under water." · "Tuyệt! Con nào cũng thở, cả con sống dưới nước." (7 từ EN).

**N7. Bài hai q2: câu EN 11 từ (đúng cảnh báo `validate`).**
- `02:391` "Air goes from your {1}, down your {2}, to your lungs." (`max_words_en` Discoverer là 10).
- Đề xuất: "Air goes in through your {1}, then down your {2}." · "Không khí đi vào qua {1}, rồi xuống {2}." (10 từ EN, giữ đúng thứ tự đường đi). Ý "tới phổi" đã có ở `explanation_correct` (`02:396` "Yes! Nose, then windpipe, then lungs.").

### Nhỏ (14)
- **n1. Vị trí đáp án nghiêng về chỗ thứ hai.** 16 câu một đáp án của cả chủ đề: chỗ thứ nhất 3, thứ hai 7, thứ ba 5, thứ tư 1 (SK-032 sau khi sửa là 10·9·8). Trong từng bài không có chu kỳ, nên không bắt buộc sửa; nếu xáo thì đổi vài câu (ví dụ `03` q4, `04` q1) sang chỗ thứ nhất hoặc thứ ba.
- **n2. Hai brief trỏ qua một hình dùng lại khác**, trái luật "luôn trỏ về hình gốc" (SK-032 n3): `03:391` (q2) và `03:629` (từ `breath`) ghi "Dùng lại hình `explore_count`", mà `03:188` `explore_count` lại là "Dùng lại hình `q1` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`". Đề xuất cả hai trỏ thẳng `khung-long/trai-dat-rat-lau-ve-truoc/q1`.
- **n3. Bài hai q6 là màn nhiều chữ EN nhất của cả bốn chủ đề.** `02:558` lời Na 15 từ; cả màn (`prompt` + `instruction` + `statement`) 22 từ, trong khi TEMPLATE mục A.3 đặt mức 15 và q6 của *Bề mặt Trái Đất*, *Khủng long*, *Não bộ* cao nhất là 19. Đề xuất rút: "My belly moves out, but the air goes to my lungs." · "Bụng mình phình ra, nhưng không khí thì đi vào phổi." (11 từ, cả màn 18).
- **n4. `messages.has_limited` bài hai thừa lời chạm.** `02:234-235` "Air does not go there. Tap it to take it off." — trùng ý `messages.full`; ba bài kia chỉ nói lý do (`01:240`, `03:230`, `04:264`). Đề xuất bỏ vế sau.
- **n5. `messages.start` bài bốn lệch kiểu giữa EN và VI.** `04:258-259` EN là ba mệnh lệnh ("Keep dust away, find fresh air, and move your body.") còn VI là "Em chọn một cách tránh bụi, một nơi không khí trong lành và một cách vận động nhé."; ba bài kia EN và VI song song ("Pick …" · "Em chọn …"). Đề xuất VI theo EN: "Em tránh bụi, tìm không khí trong lành và vận động nhé."
- **n6. Nhãn ba món `limit` bài bốn lệch kiểu.** `04:307` "Burning straw" · "Đốt rơm rạ" (việc) đứng cạnh `04:331` "Cigarette smoke" · "Khói thuốc lá" và `04:366` "Smoky coal stove" · "Bếp than tổ ong" (vật). Đề xuất cùng kiểu, ví dụ "Straw smoke" · "Khói rơm rạ" hoặc đổi hai món kia sang việc.
- **n7. Bài một q4, chữ VI "trong từng phút" không tự nhiên.** `01:474` "Dưới biển, thợ lặn cần thứ gì trong từng phút?" và `01:483`. Đề xuất "Dưới biển, thợ lặn lúc nào cũng cần thứ gì?" và "Thợ lặn lúc nào cũng cần không khí."
- **n8. Thẻ thưởng bài một, EN mờ hơn VI.** `01:646` "They breathe out through a hole on top." (trên đỉnh cái gì?) trong khi VI nói "một cái lỗ trên đỉnh đầu". Đề xuất EN "They breathe through a hole on their head." (8 từ).
- **n9. Bài hai q4 `explanation_wrong` không theo mẫu.** `02:491` "Your chest gets bigger, and your lungs fill with air." — các câu khác đều mở đầu "The answer(s) are …" (TEMPLATE mục A.6: `explanation_wrong` nói tên đáp án). Đề xuất "The answers are chest gets bigger and lungs fill." hoặc giữ nhưng thêm "The answers are …".
- **n10. Bài bốn q3, món bẫy dễ bị loại bằng kiểu ảnh.** `04:490` `q3_steam` là ảnh cận nồi cơm, ba lựa chọn kia là cảnh rộng; ghi chú hoạ sĩ `04:735` đã biết ("nồi cơm chụp gần là ngoại lệ"). Nên ghi thành yêu cầu bắt buộc cho người chọn ảnh: lấy cả góc bếp để bốn ô cùng cỡ cảnh, nếu không món bẫy mất sức hút.
- **n11. Khởi động bài hai và bài ba không có câu giãn cách tuần hay tháng.** `02:36` cả w1 và w2 đều ôn bài một (1 ngày); `03:38-39` w1 ôn bài hai, w2 ôn bài một. `syllabus-progression.md` mục 7 mong có thêm 1 câu ~1 tuần và 1 câu ~1 tháng. Theo tiền lệ SK-031, SK-032 (bài giữa cũng chỉ ôn trong chủ đề) thì chấp nhận được; nếu muốn đúng giãn cách thì thêm w3 cho bài ba, ôn *Khủng long* hoặc *Bề mặt Trái Đất*.
- **n12. `content/syllabus.json` `new-breathing.level` vẫn `null`** trong khi `_topic.md:7` ghi `level: 3`; hai chủ đề trước đã có `level`. Việc của PM, ticket đã ghi ở "Đề xuất cho người khác".
- **n13. Xác nhận trùng hình tự vẽ với SK-037** (biên tập đã nêu): mũi `ho-hap/duong-di-cua-khong-khi/tray_nose` (`02:273`) vs `nao-bo-va-giac-quan/nao-dieu-khien-co-the/w1_nose`; tim `tray_heart` (`02:297`) vs `nao-dieu-khien-co-the/q2_heart`; dạ dày `tray_stomach` (`02:281`) vs `nao-dieu-khien-co-the/q2_stomach`. Ba hình, hai chủ đề; PM hoặc designer chốt bên nào là gốc trước khi vẽ.
- **n14. Từ `oxygen` dùng ảnh bình khí.** `01:609` từ `oxygen` dùng lại `explore_oxygen` (thợ lặn mang bình khí), `04:461` thẻ `q2_oxygen` cũng vậy — trong khi bảng Tên gọi nói bình của thợ lặn chứa **không khí nén**, không phải ô-xi. Chữ đã cẩn thận ("air tank" · "bình khí") nhưng hình lại gắn "oxygen" với cái bình. Nếu có ảnh khác gợi ô-xi (bọt khí trong nước, cây xanh) thì nên đổi cho từ `oxygen`.

### Chưa kiểm
- Ảnh thật: `content/images/discoverer/ho-hap/` chưa có (designer chưa làm), mới đọc `brief`. Các hình khó (đường đông xe, đường bụi mù, thành phố mù bụi, bếp than tổ ong, ô lò cò không số) chưa biết có ảnh hợp giấy phép không.
- Giọng đọc EN/VI ("oxygen", "windpipe", "nostril", "shuttlecock", "hopscotch", "20,000", "ô-xi", dấu hai chấm trong tiêu đề bài hai và bài bốn).
- Hiển thị trên máy: dòng điều kiện phần Chơi bài hai và bài bốn trên iPhone hẹp nhất, nhãn dài ("stomach fills with air", "Lau bụi bằng khăn ẩm", "Không khí trong lành"), ba màu biểu đồ q4 bài ba, VoiceOver đọc `alt`. Không dùng simulator phiên này.
- Chuyên môn: mọi dòng `[CẦN KIỂM]`, nhất là ví dụ "thấy khó thở thì báo ngay cho người lớn" (`03:159-161`) và các khuyến cáo khói bụi, khẩu trang ở bài bốn.
- Quyết định của Duy còn mở: món bẫy "Khói thuốc lá" và "Bếp than tổ ong" (`_topic.md` mục "Còn mở" 2).

## content-editor 10/11 · sửa theo tester

Phạm vi: chỉ sửa năm file trong `content/discoverer/ho-hap/`. Không đổi `slug`, không đổi hay xoá dòng `id:` nào (`ids` đã chạy). Có đổi key ở một câu (bài ba q4, ba lựa chọn). Mỗi chỗ sửa có dòng `>` "Rà chữ tester 10/11 (…)" ngay trong bài. Không chạy lệnh; main session chạy `validate`.

**Nên sửa (7): đã sửa cả bảy**
- **N1** (bài hai q1): ba lựa chọn nay là ba hình tự vẽ mới, tô **vùng cơ thể** (cổ, ngực, bụng) bằng cùng một lớp màu vàng hoe trong suốt; mọi cơ quan bên trong giữ màu nhạt, không tô riêng cơ quan nào. Hai lựa chọn cổ và ngực không còn dùng lại `explore_windpipe`, `explore_lungs`. `alt` giữ. Ghi chú hoạ sĩ: mười một bản tô màu (bốn ô Học, ba vùng q1, bốn bản q4), cộng bản gốc nhạt.
- **N2** (bài ba, phương án A): ví dụ bốn ô Cơ bắp đổi từ "so you breathe faster" · "nên em thở nhanh hơn" thành "your muscles use it to keep going" · "cơ bắp dùng ô-xi để hoạt động tiếp". Lời Na q6, đáp án Đúng, bảng Đúng/Sai giữ nguyên.
  - Lệch đề xuất một chữ: VI tester đề xuất "để chạy tiếp được". Tôi viết "để hoạt động tiếp", vì nói cơ bắp "chạy" nghe lạ.
- **N3** (bài ba q4):
  - Câu hỏi: "Mai counted her breaths after three different things. Which bar shows skipping?" · "Mai đếm số lần thở sau ba việc khác nhau. Cột nào là lúc nhảy dây?"
  - Biểu đồ vẽ lại. Ba cột cùng một màu chàm: trái cao nhất, giữa thấp nhất, phải cao vừa.
  - Nhãn theo vị trí trong hình: "left bar" · "cột bên trái", "middle bar" · "cột ở giữa", "right bar" · "cột bên phải". Key đổi thành `q4_left`, `q4_middle`, `q4_right`.
  - Cột cao nhất chuyển sang trái, nên đáp án là lựa chọn thứ nhất (gộp với n1).
  - Câu mới không cho bé biết hai việc kia là gì, nên tôi sửa thêm hai chỗ:
    - gợi ý: "Does skipping make you breathe a little or a lot?" · "Nhảy dây làm em thở ít hay thở nhiều?";
    - giải thích khi đúng nói hai việc kia: "Yes! Skipping has the tallest bar. The others were reading and walking." · "Đúng rồi! Nhảy dây có cột cao nhất. Hai việc kia là đọc truyện và đi bộ."
- **N4** (bài ba q2): câu điền đổi thành "Before you skip, count your {1} for one minute." · "Trước khi nhảy dây, em đếm số {1} trong một phút."
- **N5:**
  - bài ba w2, gợi ý: "Remember the Animals card in the first lesson." · "Em nhớ lại ô Con vật ở bài đầu tiên nhé.";
  - bài một q4, gợi ý: "You can save food for later. What cannot wait?" · "Thức ăn để lát nữa ăn cũng được. Thứ gì thì không đợi được?".
- **N6** (bài một, `balanced`): "Great! They all breathe, even under water." · "Tuyệt! Con nào cũng thở, cả con sống dưới nước."
- **N7** (bài hai q2): dùng câu tester đề xuất: "Air goes in through your {1}, then down your {2}." · "Không khí đi vào qua {1}, rồi xuống {2}." (mười từ).

**Nhỏ (14)**
- **n1, sửa:** ba câu đổi chỗ đáp án:
  - bài một q2: thẻ "gills" lên chỗ thứ nhất;
  - bài ba q4: thứ nhất (như N3);
  - bài bốn q1: khẩu trang xuống chỗ thứ ba.
  - Cả chủ đề giờ là: chỗ thứ nhất năm câu, thứ hai bốn, thứ ba sáu, thứ tư một. Chỉ đổi thứ tự khối, không đổi chữ hay hình.
- **n2, sửa:** bài ba q2 và từ `breath` trỏ thẳng hình gốc `q1` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`.
- **n3, sửa nhưng lệch đề xuất:** câu tester đề xuất mười một từ, quá luật mười từ một câu, nên tôi rút còn chín từ: "My belly moves out, but air fills my lungs." VI theo đề xuất: "Bụng mình phình ra, nhưng không khí thì đi vào phổi." Cả màn q6 còn mười sáu từ (trước hai mươi hai).
- **n4, sửa:** `has_limited` bài hai còn "Air does not go there." · "Không khí không đi tới đó."
- **n5, sửa:** `start` bài bốn, VI: "Em tránh bụi, tìm không khí trong lành và vận động nhé."
- **n6, sửa một phần:**
  - "Burning straw" · "Đốt rơm rạ" đổi thành "Straw smoke" · "Khói rơm rạ".
  - "Smoky coal stove" · "Bếp than tổ ong" giữ nguyên chữ theo lệnh "giữ nguyên hai món bẫy tới khi Duy trả lời". Khi Duy giữ món này, tôi đề xuất đổi thành "Coal stove smoke" · "Khói bếp than" để ba nhãn cùng dạng.
- **n7, sửa:** bài một q4, VI câu hỏi: "Dưới biển, thợ lặn lúc nào cũng cần thứ gì?"; giải thích khi sai: "Thợ lặn lúc nào cũng cần không khí." EN giữ "every minute".
- **n8, sửa nhưng lệch đề xuất:** "They breathe through a hole on top of their head." (mười từ). Tôi giữ "on top of" để khớp VI "trên đỉnh đầu".
- **n9, sửa:** "The answers are chest gets bigger and lungs fill." · "Đáp án là lồng ngực to ra và phổi đầy không khí."
- **n10, sửa:** brief `q3_steam` ghi bắt buộc chụp rộng cả góc bếp, cùng cỡ cảnh với ba lựa chọn kia; từ khoá đổi theo.
- **n11, không sửa.** Lý do:
  - SK-031 và SK-032 cũng chỉ ôn trong chủ đề ở các bài giữa;
  - bài bốn đã có câu ôn khoảng một tháng (w3, *Núi lửa*);
  - thêm w3 cho bài ba là thêm một câu, hình và clip, mà không có ý *Khủng long* hay *Bề mặt Trái Đất* nào nối tự nhiên với chạy nhảy;
  - thêm câu Đúng/Sai sẽ làm lệch bảng sáu Đúng, sáu Sai.
- **n12, main session đã làm:** `_topic.md` ghi đã gắn `level: 3`.
- **n13, ghi theo chốt:** dưới `tray_nose`, `tray_heart`, `tray_stomach` (bài hai) có dòng `>` "Hình gốc dùng chung với *Não bộ và giác quan*". Ghi chú hoạ sĩ bài hai và bảng Hình dùng chung ở `_topic.md` đã ghi. Brief không đổi.
- **n14, sửa:**
  - từ `oxygen` (bài một) có ảnh riêng: bể cá có máy sục khí. Người Việt hay gọi là "máy sủi ô-xi", nối với ý cá thở ô-xi trong nước;
  - thẻ `q2_oxygen` bài bốn dùng lại ảnh này;
  - ô Khí ô-xi ở phần Học vẫn giữ ảnh thợ lặn, vì ví dụ của ô nói "divers take air under the sea".
  - [CẦN KIỂM] máy sục khí làm nước có thêm ô-xi hoà tan.

**`_topic.md` đã sửa theo:**
- lời Na bài hai (mục "Câu sáu" và note của `air_goes_to_belly`);
- bảng Vị trí đáp án đúng, kèm dòng đếm vị trí;
- bảng Hình dùng chung: từ `oxygen`; bỏ q1 khỏi dòng `explore_*`; thêm dòng dùng chung với SK-037;
- Quy ước hình mục sáu: tô vùng, không tô cơ quan; nhãn không chỉ phân biệt bằng màu;
- kế hoạch bài bốn: "khói rơm rạ";
- mục Mức và Đề xuất cho PM.

**Chữ trẻ nghe đã đổi (cần sinh lại clip EN/VI):**

| Bài | Trường | Tiếng |
| --- | --- | --- |
| 1 `vi-sao-ta-phai-tho` | `tray.messages.balanced` | EN, VI |
| 1 | `q4.prompt` | VI |
| 1 | `q4.hint` | EN, VI |
| 1 | `q4.explanation_wrong` | VI |
| 1 | `reward.whale.fact` | EN |
| 2 `duong-di-cua-khong-khi` | `tray.messages.has_limited` | EN, VI |
| 2 | `q2.sentence` | EN, VI |
| 2 | `q4.explanation_wrong` | EN, VI |
| 2 | `q6.statement` | EN, VI |
| 3 `tho-khi-chay-nhay` | `w2.hint` | EN, VI |
| 3 | `learn.explore.explore_muscles` ví dụ bốn | EN, VI |
| 3 | `q2.sentence` | EN, VI |
| 3 | `q4.prompt`, `q4.hint`, `q4.explanation_correct`, `q4.explanation_wrong` | EN, VI |
| 3 | nhãn `q4_left`, `q4_middle`, `q4_right` (key mới; clip của `q4_yellow`, `q4_blue`, `q4_red` bỏ) | EN, VI |
| 4 `giu-phoi-khoe` | `tray.messages.start` | VI |
| 4 | nhãn `tray.tray_straw` | EN, VI |

Đổi thứ tự lựa chọn (bài một q2, bài bốn q1) và đổi `alt`, `brief` không sinh lại clip.

**Còn chưa chắc**
- Bài ba q4: câu hỏi không nói hai việc kia, nên bé phải ngầm hiểu nhảy dây là việc mạnh nhất trong ba việc. Gợi ý và giải thích khi đúng đỡ chỗ này. Nếu tester thấy chưa đủ, thêm "and two quiet things" vào câu hỏi (vẫn dưới mười từ), không kể thứ tự.
- Bài hai q6 sau khi rút gọn bỏ vế "khi mình hít vào"; bối cảnh nằm ở hình gấu bông nhấp nhô. Tester xem câu còn đủ rõ là DOK ba không.
- n6: nhãn "Bếp than tổ ong" còn lệch kiểu, chờ Duy.

### Hình đổi sau rà chữ

Khoá hình theo cú pháp file chọn ảnh (SK-033: Khởi động, Quiz, Chơi không tiền tố; Học, Từ vựng, Thưởng có tiền tố).

| Bài | Key hình | Đổi gì |
| --- | --- | --- |
| 1 `vi-sao-ta-phai-tho` | `vocab.oxygen` | **Ảnh mới** `[ảnh]`: bể cá có máy sục khí, chuỗi bọt khí nổi lên, vài con cá, cây thuỷ sinh, chụp ngang mặt kính; từ khoá "aquarium air stone bubbles fish". Trước dùng lại `explore_oxygen` (thợ lặn). `alt` mới: "Bubbles from an air pump in a fish tank" · "Bọt khí từ máy sục khí trong bể cá". |
| 4 `giu-phoi-khoe` | `q2.q2_oxygen` | `same_as` đổi: dùng lại `vocab.oxygen` bài một (trước `explore_oxygen`). `alt` mới như trên. |
| 2 `duong-di-cua-khong-khi` | `q1.q1_neck` | **Hình tự vẽ mới**: sơ đồ đường thở gốc, phủ lớp vàng hoe trong suốt lên vùng cổ (dưới cằm tới xương đòn), cơ quan giữ nhạt. Trước dùng lại `explore_windpipe`. `alt` giữ. |
| 2 | `q1.q1_chest` | **Hình tự vẽ mới**: như trên, vùng ngực (xương đòn tới hết xương sườn). Trước dùng lại `explore_lungs`. `alt` giữ. |
| 2 | `q1.q1_belly` | **Vẽ lại**: như trên, vùng bụng (dưới xương sườn tới thắt lưng), thay bản tô dạ dày. `alt` giữ. |
| 2 | `tray.tray_nose`, `tray.tray_heart`, `tray.tray_stomach` | Brief không đổi. Ghi chú: hình gốc dùng chung, *Não bộ và giác quan* dùng lại (n13). |
| 3 `tho-khi-chay-nhay` | `q4` | **Vẽ lại**: ba cột cùng màu chàm; trái cao nhất, giữa thấp nhất, phải cao vừa (trước ba màu, cột giữa cao nhất). `alt` mới: "A bar chart with three bars" · "Biểu đồ có ba cột". |
| 3 | `q4.q4_yellow`, `q4.q4_blue`, `q4.q4_red` | **Bỏ** (key xoá). |
| 3 | `q4.q4_left`, `q4.q4_middle`, `q4.q4_right` | **Key mới**, hình tự vẽ: cùng biểu đồ q4, cột tương ứng giữ màu chàm đậm, hai cột kia xám nhạt. `alt`: "The chart with the left/middle/right bar marked" · "Biểu đồ, đánh dấu cột bên trái / ở giữa / bên phải" (mỗi ô một câu). |
| 3 | `q2` | `same_as` trỏ thẳng `q1` ở bài `khung-long/trai-dat-rat-lau-ve-truoc` (trước qua `explore_count`). Cùng ảnh đồng hồ cát. |
| 3 | `vocab.breath` | Như `q2`. |
| 4 | `q3.q3_steam` | Brief đổi: **bắt buộc** chụp rộng cả góc bếp, cùng cỡ cảnh với ba lựa chọn kia; từ khoá mới "kitchen stove pot steam rising". `alt` giữ. |
| 1 | `q2.q2_gills`, `q2.q2_fins`, `q2.q2_scales` | Không đổi hình; chỉ đổi thứ tự (mang lên đầu). |
| 4 | `q1.q1_hat`, `q1.q1_raincoat`, `q1.q1_mask` | Không đổi hình; chỉ đổi thứ tự (khẩu trang xuống cuối). |

## designer 10/11 · hình

Theo SK-033 ("Hợp đồng ảnh", hình ghép, hình tự vẽ) và mục "Hình đổi sau rà chữ" ở trên. Đã đọc lại bốn file `.md` sau lượt sửa của biên tập.

**File**
- File chọn ảnh: `content/images/discoverer/ho-hap/{vi-sao-ta-phai-tho,duong-di-cua-khong-khi,tho-khi-chay-nhay,giu-phoi-khoe}.json`. `SelectionSet` kiểm offline: 175 mục, 0 lỗi, mọi `same_as` tìm được, mọi file `own` có thật.
- Hình tự vẽ: `content/images/own/ho-hap/*.jpg`, 69 file, JPEG 1024×768, sRGB, không metadata. Mỗi file khai `own` một lần; chỗ khác dùng `same_as`.
- Trang duyệt (ngoài git): `content/.build/images/ho-hap/review.html` (mục lục), `content/.build/images/ho-hap/<bài>/review.html`, `content/.build/images/ho-hap/own-sheet.html` (lưới 69 hình tự vẽ).
- Script ở scratchpad phiên chính, thư mục `sk036/`: `draw/*.mjs` (vẽ), `gen_sel.py` (sinh file chọn ảnh), `check_sel.mts`, `review.py` (dựng trang duyệt; chạy lại sau fetch để trang lấy ảnh từ cache).

**Số hình** (176 khoá)

| Bài | Tự vẽ (mục `own`) | Ảnh nguồn mới | Dùng lại (`same_as`) | Chưa có |
| --- | --- | --- | --- | --- |
| 1 Vì sao ta phải thở? | 9 | 19 | 13 | 1 |
| 2 Đường đi của không khí | 21 | 1 | 21 | 0 |
| 3 Thở khi chạy nhảy | 23 | 1 | 19 | 0 |
| 4 Giữ phổi khoẻ | 16 | 3 | 29 | 0 |
| Cộng | 69 | 24 | 82 | 1 |

- Sau khi tính cả dùng lại: 123 khoá ra hình tự vẽ, 52 khoá ra ảnh chụp.
- 24 mục ảnh mới, đều trên Wikimedia Commons, không có ảnh Openverse nên không cần kiểm tay:
  - theo giấy phép: Public domain 11, CC0 1.0 6, CC BY 2.0 4, CC BY 3.0 2, CC BY 4.0 1;
  - 20 nguồn mới, cộng 4 vùng cắt mới từ 2 ảnh đã có: diều CC0 của `trai-dat-rat-lau-ve-truoc` (bỏ người thả diều), cá chép PD của `khung-long-la-gi` (mang, vây đuôi, vảy, ba thẻ cùng cỡ).
- Dùng lại từ chủ đề khác: cá chép, mèo, gà, trâu, ếch, voi, bộ xương T. rex, đồng hồ cát, cốc nước, ao sen, núi lửa.

**Quyết định**
- **Vẽ cả bộ khi một lựa chọn phải vẽ.** Commons không có ảnh hợp lệ cho dây nhảy, quả cầu đá, quyển truyện úp, gối chăn trên chiếu, bàn tay đặt lên ngực. Các ảnh có được thì đều có người lộ mặt, nhãn hiệu hoặc chữ. Dây nhảy là đáp án hay món đúng ở năm chỗ, nên vẽ trọn:
  - bài ba: kệ Chơi chín món, q1, q2 (ba thẻ), q3 (bốn lựa chọn), ô Nghỉ ngơi, ô Cơ bắp, sân trường (q1, q3);
  - bài bốn: kệ Chơi chín món (cả điếu thuốc và ruộng lúa), w1 (bốn lựa chọn), q1 (mũ, áo mưa, khẩu trang cùng một kiểu bàn gỗ), q2 (bụi, khói, bể cá), q3 (như brief `q3_road` đã dặn), q4, q6;
  - bài một: bàn tay trên ngực (ô Học, từ `chest`, w2 bài hai, thẻ q2 bài ba), trâu thở ra hơi trắng, sân nhà làng quê (q3), bể cá sục khí (`vocab.oxygen`, `q2_oxygen` bài bốn), ba ô cửa kính q5.
- Học và câu hỏi được trộn ảnh với hình vẽ (ví dụ ô Bụi mịn là ảnh, ba ô kia là hình vẽ), vì luật cùng kiểu chỉ áp cho các lựa chọn trong một câu và các món trên một kệ.
- **Hình gốc dùng chung với *Não bộ và giác quan* (SK-037):** `nose-side.jpg` (mũi nghiêng, cắt từ dưới mắt tới môi trên), `heart.jpg` (tim thật nhìn từ trước, có động mạch chủ, động mạch phổi, tĩnh mạch chủ), `stomach.jpg` (dạ dày hồng cam, đoạn thực quản ở trên).
  - Bên kia dùng `{ "same_as": "tray_nose" | "tray_heart" | "tray_stomach", "lesson": "ho-hap/duong-di-cua-khong-khi" }`.
  - Cả bốn bài *Não bộ* phải trỏ thẳng về `ho-hap/duong-di-cua-khong-khi`. Không trỏ qua `nao-dieu-khien-co-the/w1_nose`, vì `same_as` chỉ được sang bài khác một bước (README content-cli). Cách viết nghiêng `nose-side` còn có `mouth-side.jpg` nếu bên đó cần.
- **Theo mục "Hình đổi sau rà chữ":**
  - bài hai q1: ba bản phủ cùng một lớp vàng hoe trong suốt lên vùng cổ, vùng ngực, vùng bụng; cơ quan giữ nhạt;
  - bài ba q4: ba cột cùng màu chàm, tỉ lệ 40 · 20 · 25 theo ghi chú [CẦN KIỂM]; mỗi bản lựa chọn giữ một cột chàm đậm, hai cột kia xám;
  - bài ba `q2`, `vocab.breath`: trỏ thẳng đồng hồ cát;
  - `q2_oxygen` bài bốn: dùng lại `vocab.oxygen` bài một;
  - `vocab.oxygen`, `q3.q3_steam`: đã chạy `images search --key … --sources commons`; ứng viên không dùng được (ảnh New York, tranh cũ, người có mặt), nên vẽ. Bếp vẽ rộng cả góc bếp, cùng cỡ cảnh với ba lựa chọn kia.
- **Ảnh ứng viên bị loại:**
  - thợ lặn có chữ «SAIPAN» trên đồ;
  - đôi chân chạy đi giày ba sọc;
  - van bình lặn khắc «3000»;
  - ảnh trẻ chơi trên bãi biển có dòng chữ bản quyền in trong ảnh (không xoá chữ của tác giả, chọn ảnh PD khác);
  - võng có người nằm;
  - cầu thang có tờ giấy dán;
  - xe đạp cạnh hình graffiti;
  - mọi ảnh đường phố, nồi cơm, đá cầu có mặt người.
- `images search --key` ghi đè `candidates.json/html` của bài chỉ còn một hình. Đã dựng lại đủ trang bằng `--cache-only`, không gọi mạng.

**Còn trống**
- Bài một `tray.tray_toy_fish` (cá đồ chơi bằng nhựa, món bẫy). Commons không có ảnh hợp giấy phép mà không có người hoặc nhãn hiệu; Openverse hết hạn mức. Không vẽ, vì món bẫy này sẽ thành hình vẽ duy nhất giữa tám ảnh chụp. Hai hướng, chờ biên tập hoặc Duy:
  - (1) tìm trên Openverse khi có hạn mức ("rubber fish toy", "plastic bath toy fish") rồi kiểm tay trang gốc;
  - (2) đổi món thành «A paper boat» · «Chiếc thuyền giấy» (ở dưới nước nhưng không biết thở, ảnh CC0 dễ có).

**Đề xuất đổi chữ cho content-editor** (alt theo hình đã chọn)

| Bài · key | Chữ cũ | Chữ mới |
| --- | --- | --- |
| 1 `w1.w1_stone` | "A grey stone" · "Hòn đá xám" | "A smooth stone" · "Hòn đá cuội" (ảnh hòn cuội vàng nâu trên cát, CC0) |
| 1 `tray.tray_egret` | "An egret flying over a rice field" · "Con cò bay trên ruộng lúa" | "An egret flying over the grass" · "Con cò bay trên bãi cỏ" |
| 1 `q2` | "Fish swimming in a pond" | "A fish swimming in a pond" (một con cá koi nhìn từ trên; VI giữ) |
| 1 `q4.q4_tank` | "A diver's air tank" | "Air tanks for diving" (ảnh hai bình; VI giữ) |
| 2 `w1` | "A village pond" · "Cái ao làng" | "A pond with big leaves" · "Cái ao có lá to"; brief "Dùng lại hình `tray_pond` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`." |
| 3 `learn.explore.explore_faster` (cả `q6`, `vocab.exercise`) | "Children playing football at sunset" · "Các bạn nhỏ đá bóng lúc hoàng hôn" | "Children playing at sunset" · "Các bạn nhỏ chơi đùa lúc hoàng hôn" (ảnh NARA, PD) |

- **Nhãn brief `[ảnh]` → `[hình vẽ]`** (alt giữ nguyên; brief tả đúng hình đã vẽ có ở cột Đề xuất của trang duyệt):
  - bài một: `explore_in_out`, `explore_breath_out`, `q3`, `q5_clear`, `q5_foggy`, `q5_dusty`, `vocab.oxygen`;
  - bài ba: `explore_rest`, `explore_muscles`, chín món `tray.*`, `q1`, `q1_sleeping`, `q2_steps`, `q3_hammock`, `q3_stairs`, `q3_bike`, `q3_chess`;
  - bài bốn: `w1_walking`, `explore_dust`, `explore_smoke`, `explore_mask`, `tray_park`, `tray_cigarette`, `tray_cloth`, `tray_coal`, `q1_hat`, `q1_raincoat`, `q3_steam`, `q3_road`, `q3_building`, `q4_inside`, `q6`.
- **Brief đổi nội dung:**
  - bài một `tray_kite`: diều hình chim có dải ruy băng hồng (cắt từ ảnh CC0 của *Khủng long*), không phải diều thoi;
  - bài bốn `tray_rice`: "[hình vẽ] Ruộng lúa xanh rộng dưới trời có mây", không dùng lại `q2_rice`, để kệ Chơi cùng kiểu.
- Ghi chú cho hoạ sĩ bài bốn ("Kệ Chơi: chín món đều là ảnh chụp") nên sửa thành "chín món đều là hình vẽ".

**`images fetch`: chưa chạy.** Commons trả HTTP 429 cho máy này (một phần do khoảng 130 lượt tìm thêm của designer hôm nay), nên phiên chính dặn chờ. Khi Commons mở lại:
- chạy `node tools/content-cli/src/cli.ts images fetch content/images/discoverer/ho-hap` từ gốc repo;
- 24 mục ảnh sẽ gọi Commons để kiểm giấy phép và tải bản 1280 px;
- 69 hình tự vẽ xử lý tại máy;
- ảnh dùng lại đã có trong `content/.images/`;
- sau đó chạy lại `review.py` để trang duyệt hiện ảnh từ cache thay cho bản xem từ Commons.

**Chưa chắc**
- Ảnh nhỏ: bình lặn 500×667, thợ lặn 579×870, cá voi 800×533, hòn cuội 640×480, quạt 714×1062. Đủ cho ô lựa chọn trên iPhone, sẽ mềm trên iPad.
- Hai ảnh EPA Documerica năm 1972 (thành phố mù khói ở Mỹ, trẻ chơi lúc hoàng hôn) màu phim cũ. Đã cắt bỏ viền phim.
- Cần chuyên môn xem:
  - sơ đồ đường thở: thực quản vẽ lệch sang phải khí quản để thấy được, dạ dày dưới phổi trái;
  - tim: quy ước mạch đỏ và xanh;
  - sơ đồ mạch máu `vocab.blood`: rất giản lược;
  - tỉ lệ ba cột biểu đồ.
- Kệ Chơi bài ba và bài bốn chuyển hẳn sang hình vẽ. Nếu Duy muốn ảnh chụp thì cần tìm cả chín món mỗi kệ (dây nhảy là món khó nhất), không thay lẻ từng món.
- Món "Khói thuốc lá" và "Bếp than tổ ong" vẫn chờ Duy (Còn mở ở `_topic.md`). Hình vẽ không có người, không tay, không nhãn hiệu.

## content-editor 10/11 · theo hình

Áp đề xuất chữ của mục "designer 10/11 · hình" vào bốn bài. Chỉ đổi `brief`, `alt` và ghi chú; **không đổi chữ trẻ nghe** (nhãn, câu hỏi, gợi ý, giải thích, lời nhắn), nên không phải sinh lại clip nào. Không đổi key hay `id:`. Không chạy lệnh.

**`alt` đổi theo bảng của designer:**
- bài một:
  - `w1_stone`: "A smooth stone" · "Hòn đá cuội"; brief đổi theo ảnh (cuội vàng nâu trên cát);
  - `tray_egret`: "An egret flying over the grass" · "Con cò bay trên bãi cỏ"; brief đổi;
  - `q2`: EN "A fish swimming in a pond", VI giữ; brief đổi (một con cá koi nhìn từ trên);
  - `q4_tank`: EN "Air tanks for diving", VI giữ; brief đổi (hai bình). Nhãn "air tank" · "bình khí" giữ số ít như hai lựa chọn kia.
- bài hai `w1`: brief "Dùng lại hình `tray_pond` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`." (chép từ khoá gốc); `alt` "A pond with big leaves" · "Cái ao có lá to".
- bài ba `explore_faster`, `q6`, `vocab.exercise`: "Children playing at sunset" · "Các bạn nhỏ chơi đùa lúc hoàng hôn"; brief gốc bỏ chữ "đá bóng", từ khoá chép lại ở hai chỗ dùng lại.

**Nhãn `[ảnh]` đổi thành `[hình vẽ]`** (bốn mươi chỗ, đúng danh sách của designer):
- bài một bảy chỗ: `explore_in_out`, `explore_breath_out`, câu hỏi `q3`, `q5_clear`, `q5_foggy`, `q5_dusty`, `vocab.oxygen`;
- bài ba mười tám chỗ: `explore_rest`, `explore_muscles`, chín món `tray.*`, câu hỏi `q1`, `q1_sleeping`, `q2_steps`, `q3_hammock`, `q3_stairs`, `q3_bike`, `q3_chess`;
- bài bốn mười lăm chỗ: `w1_walking`, `explore_dust`, `explore_smoke`, `explore_mask`, `tray_park`, `tray_cigarette`, `tray_cloth`, `tray_coal`, `q1_hat`, `q1_raincoat`, `q3_steam`, `q3_road`, `q3_building`, `q4_inside`, `q6`.
- Nội dung tả giữ nguyên. Chỉ đổi "chụp" thành "vẽ" hay "nhìn", và bỏ các câu dự phòng đã hết nghĩa ("không có ảnh hợp lệ thì…", "cắt bỏ hoặc chọn ảnh khác", "designer xoá số").
- Dòng "Từ khoá tìm ảnh (EN)" giữ lại: TEMPLATE mục A cho phép ô đã từng tìm ảnh giữ dòng này. Hơn nữa các chỗ dùng lại đang chép từ khoá của chỗ gốc.

**Brief đổi nội dung:**
- bài một `tray_kite`: diều hình chim có dải ruy băng hồng, cắt từ ảnh CC0 bạn nhỏ thả diều của *Khủng long*, bỏ người thả diều; từ khoá chép từ ảnh gốc.
  - `alt` đổi thêm (ngoài bảng): "A bird-shaped kite in the sky" · "Cánh diều hình con chim trên trời".
  - Diều hình chim làm món bẫy mạnh hơn cho nhóm "Biết bay". Nhãn "Kite" · "Cánh diều" giữ.
- bài bốn `tray_rice`: "[hình vẽ] Ruộng lúa xanh rộng dưới trời có mây…", không dùng lại `q2_rice`, để kệ Chơi cùng kiểu.

**Ghi chú đã sửa theo:**
- Ghi chú cho hoạ sĩ bài một, ba, bốn có dòng "Theo hình designer làm 10/11". Kệ Chơi bài ba và bài bốn ghi là "chín món đều là hình vẽ".
- Ghi chú q5 bài một: cả câu cùng là hình vẽ.
- Ghi chú lò cò bài ba: không cần thay bằng "Nhảy bao bố".
- `_topic.md`: Quy ước hình mục hai có dòng "vẽ cả bộ khi một lựa chọn phải vẽ"; bảng Hình dùng chung thay dòng `q2_rice` bằng `tray_pond`.

**`tray_toy_fish` (bài một, món bẫy): giữ nguyên, đề xuất thứ tự thay nếu Openverse không có ảnh**
- Thuyền giấy làm yếu bẫy:
  - cá đồ chơi hấp dẫn vì trông như con cá;
  - thuyền giấy chỉ giống nhóm "Sống dưới nước" ở chỗ nổi trên nước;
  - bé bảy tuổi biết ngay thuyền giấy không phải con vật.
- **Đề xuất một: "Seashell" · "Vỏ ốc biển"**, dùng lại ảnh có sẵn `tray_shell` ở bài `be-mat-trai-dat/nui-lua` ("A seashell on the sand" · "Vỏ ốc biển trên cát", ảnh chụp, hợp kệ toàn ảnh chụp, không phải tìm).
  - Lý do: vỏ ốc đến từ biển và trông như một con vật, nên có sức hút. Lời nhắn `has_limited` ("That one does not breathe. It is not alive.") vẫn đúng với vỏ ốc rỗng.
  - Rủi ro: bé có thể nghĩ "vỏ ốc từng là của con ốc sống". Hình chọn vỏ rỗng trên cát khô, không thấy con ốc.
- **Đề xuất hai:** thuyền giấy, như main session nêu, nếu Duy thấy vỏ ốc dễ gây tranh cãi.
- Đổi món nào cũng đổi nhãn trẻ nghe (`tray.tray_toy_fish` → key mới hay nhãn mới), nên phải sinh lại clip EN/VI của nhãn đó. Ghi chú Chơi bài một cũng phải sửa: câu "cá đồ chơi ở dưới nước như cá thật".

## `tray_toy_fish` (main session 11/11)
- Openverse (hạn mức mới) và Commons tìm lại "plastic toy fish floating water": không có ảnh dùng thẳng được.
- Ứng viên khả dĩ: [Fishing without water--or fish!](https://commons.wikimedia.org/wiki/File:Fishing_without_water--or_fish!_(7adb24ac-5192-41b5-9ed5-8888e1b074c4).JPG) (Public domain, 6000×4000): cắt riêng con cá nhựa xanh treo ở đầu cần câu, bỏ hết người. Vùng cắt khoảng 350×550 px.
- Việc của designer ở lượt hình kế tiếp: thử vùng cắt; không đạt thì chọn giữa "Vỏ ốc biển" (dùng lại `tray_shell` *Núi lửa*, đề xuất của content-editor) và "Chiếc thuyền giấy", báo main session.
- **Chốt 11/11 (main session):** cắt cá từ ảnh PD chỉ còn khoảng 140×200 px, nhoè trên iPhone (designer thử ở SK-038). Đổi món bẫy thành "Seashell" · "Vỏ ốc biển", key `tray_shell`, dùng lại ảnh `tray_shell` của `be-mat-trai-dat/nui-lua`. `validate` 0 lỗi, `images fetch` 0 lỗi. Nhãn mới cần sinh clip EN/VI.
