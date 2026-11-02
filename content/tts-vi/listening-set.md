# Bộ câu nghe thử giọng đọc tiếng Việt

Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt** · Ngày: 31/10/2026 · Ticket: SK-023
Nguồn: technical-plan.md B9 (Audio VI, chuẩn hoá chữ trước TTS), B18 #3; bài 1 `content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md`; canvas Discoverer-Quiz, Discoverer-Play, Discoverer-Reward; SK-014 (ô trống), SK-016 (thứ tự app đọc một câu hỏi).

Mục đích: dùng chung một bộ chữ cho mọi engine ứng viên trong B9 (VieNeu-TTS v3 Turbo, Google Chirp 3 HD, FPT.AI Ban Mai hoặc Azure HoaiMy, dự phòng Kokoro-Vietnamese). Duy và biên tập nghe mù rồi chấm theo phiếu ở phần C.

| Phần | Nội dung | Số mục |
| --- | --- | --- |
| A | Câu | 30 (17 từ bài 1, 13 tự soạn) |
| B | Từ đơn và cụm ngắn | 30 (18 từ bài 1, 12 tự soạn) |
| C | Cách sinh file mù, cách nghe, phiếu chấm | |
| D | Quy tắc "nghe xuôi" đề xuất cho `content/README.md` | |
| Cuối file | Chỗ chưa chắc · Đề xuất sửa bài 1 | |

## Cách đọc bảng

- **Chữ gốc:** chuỗi đưa vào engine.
  - Mục lấy từ bài 1: chép đúng từng ký tự như trong bài và trên canvas.
  - Mục tự soạn: giọng văn hướng tới trẻ, nhưng cố ý viết kiểu sách báo, có chữ số, ký hiệu, viết tắt, ngoặc và câu dài, để thử engine. Theo quy tắc hiện hành, biên tập sẽ không viết như vậy trong bài. A24, A25, A26 và A30 ở mức Scientist.
- **Bản đọc mong đợi:** cách người Việt đọc to đúng, viết toàn bằng chữ.
  - Người chấm nhìn bản này khi nghe.
  - Dev lấy bản này làm đích cho bộ chuẩn hoá chữ tiếng Việt.
  - Từ phiên âm viết có gạch nối theo kiểu sách giáo khoa (xăng-ti-mét) để người chấm dễ nhận ra từng tiếng.
- **Giọng miền:** bản đọc viết theo giọng Bắc. Chỗ giọng Nam đọc khác mà vẫn đúng (linh/lẻ, nghìn/ngàn, hỏi gần ngã) được ghi ở cột "Điểm cần nghe".

## Phần A · 30 câu

| Mã | Chữ gốc | Bản đọc mong đợi | Nguồn | Điểm cần nghe |
| --- | --- | --- | --- | --- |
| A01 | Thức ăn cho ta những gì? | giống chữ gốc | bài 1 · tiêu đề `title.vi` | Câu hỏi có từ hỏi "gì". Cuối câu không được lên giọng kiểu tiếng Anh tới mức méo thanh huyền của "gì". "những" thanh ngã. |
| A02 | Em kể được các nhóm chất dinh dưỡng chính. | giống chữ gốc | bài 1 · mục tiêu `objective.vi` | Câu kể, xuống giọng ở cuối. "kể" hỏi, "được" nặng, "dưỡng" ngã. "Em" mở câu nghe thân thiện, không như ra lệnh. |
| A03 | Động vật, kể cả con người, cần thức ăn, nước và {1} để sống. | Động vật, kể cả con người, cần thức ăn, nước và… [ngừng gần một giây] …để sống. | bài 1 · khởi động w1 `sentence.vi` | Ô trống phải là một quãng ngừng, không được đọc thành "một", "ngoặc" hay "trống". Giọng lửng ở "và" như đang chờ bé điền. Đoạn "để sống" đọc riêng vẫn phải tự nhiên. Hai dấu phẩy chỉ ngắt nhẹ. |
| A04 | Cây dùng ánh nắng để làm thức ăn. Còn mình thì sao? | giống chữ gốc | bài 1 · khởi động w2 `hint.vi` | Có quãng ngừng rõ giữa hai câu. "Còn mình thì sao?" là câu gợi mở: giọng tò mò, nhẹ. "nắng" sắc, "mình" huyền. |
| A05 | Vitamin và chất khoáng giúp ta khoẻ mạnh. | Vi-ta-min và chất khoáng giúp ta khoẻ mạnh. | bài 1 · Học, nhóm `explore_vit` `sentence.vi` | Từ mượn đứng đầu câu: mong đợi ba tiếng kiểu Việt "vi-ta-min", không phải "vai-tơ-min" kiểu Anh. Chữ "khoẻ" viết kiểu dấu mới (dấu trên chữ e) vẫn phải ra thanh hỏi. |
| A06 | Mâm đầy rồi — chạm món trong mâm để bỏ ra. | Mâm đầy rồi, chạm món trong mâm để bỏ ra. | bài 1 · Chơi `messages.full.vi` (lời linh vật) | Dấu "—" phải thành quãng ngừng. Lỗi nếu đọc ra "gạch ngang" hoặc "trừ", hoặc đọc liền không ngừng. So bản thô với bản chuẩn hoá. "bỏ" hỏi. |
| A07 | Tuyệt! Mâm cơm cân bằng rồi. | giống chữ gốc | bài 1 · Chơi `messages.balanced.vi` (lời linh vật) | Câu cảm thán: "Tuyệt!" vui, có sức sống nhưng không hét. "Tuyệt" thanh nặng. Câu sau xuống giọng hài lòng. |
| A08 | Thêm một món giàu chất đạm nhé! | giống chữ gốc | bài 1 · Chơi `messages.missing.tray_protein.vi` (lời linh vật) | Lời nhắc thân thiện: "nhé!" phải mềm, không thành ra lệnh. "giàu" huyền, "đạm" nặng. |
| A09 | Món nào có nhiều vitamin? | Món nào có nhiều vi-ta-min? | bài 1 · Quiz q1 `prompt.vi` | Câu hỏi kết thúc bằng từ mượn: giọng hỏi không được biến "min" thành âm lạ. Từ hỏi "nào" nằm giữa câu. |
| A10 | Cơm giúp em chạy nhảy, vui chơi. Cơm cho em thứ gì? | giống chữ gốc | bài 1 · Quiz q2 `hint.vi` | Gợi ý nói thẳng với bé ("em"), nên giọng phải ấm. Có ngắt ở dấu phẩy. "nhảy" hỏi. Câu hỏi "thứ gì?" phải tự nhiên. |
| A11 | Nam bị trầy đầu gối. Chất nào giúp cơ thể Nam tự phục hồi? | giống chữ gốc | bài 1 · Quiz q4 `prompt.vi` | Tên "Nam" đọc như tên người, không bị nhấn lạ. "trầy" huyền, "gối" sắc, "phục hồi" là nặng rồi huyền. Câu hỏi có từ "nào". |
| A12 | Đáp án là khoai lang. Bún và khoai lang đều thuộc nhóm chất bột đường. | giống chữ gốc | bài 1 · Quiz q3 `explanation_wrong.vi` | Mọi lời giải thích khi sai đều mở bằng "Đáp án là…": giọng phải nhẹ, không như trách. "Bún" là một tiếng thanh sắc đứng đầu câu. Câu sau dài mười tiếng, đọc một hơi, không ngắt vụn. |
| A13 | Thử thách: bắt lỗi sai. Chất béo lúc nào cũng có hại. Na nói đúng không? | giống chữ gốc | bài 1 · Quiz q6. Câu ghép từ `instruction.vi`, `statement.vi` (lời Na) và `prompt.vi`, theo thứ tự app đọc (SK-016 mục 8). Trong bài, `instruction.vi` không có dấu chấm cuối. Dấu chấm sau "bắt lỗi sai" do người ghép thêm. | Dấu hai chấm sau "Thử thách" ngừng ngắn. Câu của Na đọc chắc chắn như câu khẳng định, để bé có cái mà bắt lỗi. "không?" cuối câu là câu hỏi có hay không. "Na" thanh ngang, không bị đánh vần. |
| A14 | Na chưa đúng. Ta cần một ít chất béo, nhưng không ăn quá nhiều. | giống chữ gốc | bài 1 · Quiz q6 `explanation_wrong.vi` | Sửa sai nhẹ nhàng. Chữ "không" không bị nhấn nặng. Có ngắt ở dấu phẩy trước "nhưng". |
| A15 | Chính xác! Cá, trứng và đậu phụ đều giàu chất đạm. | giống chữ gốc | bài 1 · lời khen "Chính xác!" (chữ giao diện trên canvas Discoverer-Quiz) ghép với Quiz q5 `explanation_correct.vi` | Lời khen vui và rõ. Câu liệt kê ba món: ngắt nhẹ sau "Cá", và tiếng "Cá" không bị nuốt. "phụ" nặng. |
| A16 | Gần đúng! Xem lại các ô được đánh dấu rồi thử lần nữa. | giống chữ gốc | bài 1 · chữ giao diện canvas Discoverer-Quiz (sai lần một ở câu chọn nhiều đáp án) | Giọng động viên, không chê. Tiếng "ô" chỉ có một nguyên âm, đứng giữa câu, phải nghe rõ. "thử" hỏi, "nữa" ngã. |
| A17 | Rau muống có nhiều vitamin và chất xơ — món rau quen thuộc trong mâm cơm Việt. | Rau muống có nhiều vi-ta-min và chất xơ, món rau quen thuộc trong mâm cơm Việt. | bài 1 · Thưởng, thẻ `rau_muong` `fact.vi` | Dấu "—" chấm như A06. "xơ" ngang, "Việt" nặng. Cuối câu xuống giọng. |
| A18 | Bộ xương của người lớn có 206 chiếc xương. | Bộ xương của người lớn có hai trăm linh sáu chiếc xương. | tự soạn · Discoverer chủ đề 2 Bộ xương và cơ bắp | Hàng chục là số không nên đọc "linh". Giọng Nam đọc "lẻ" cũng đúng. Lỗi nếu đọc "hai không sáu" hoặc "hai trăm sáu". |
| A19 | Tuần này, cây đậu của em cao 12 cm, cao hơn tuần trước 2,5 cm. | Tuần này, cây đậu của em cao mười hai xăng-ti-mét, cao hơn tuần trước hai phẩy năm xăng-ti-mét. | tự soạn · Discoverer chủ đề 5 Cây làm gì và cần gì (đo cây) | "12" đọc "mười hai", không đọc "một hai". "2,5" đọc "hai phẩy năm". Lỗi nếu đọc "hai, năm" (ngừng như dấu phẩy câu), "hai mươi lăm" hay "hai chấm năm". "cm" đọc "xăng-ti-mét", không đánh vần "xê em". |
| A20 | Nước có 3 thể: rắn, lỏng và khí. Nước sôi ở 100 °C và đóng băng ở 0 °C. | Nước có ba thể: rắn, lỏng và khí. Nước sôi ở một trăm độ xê và đóng băng ở không độ xê. | tự soạn · Discoverer chủ đề 11 Các thể của vật chất | "°C" đọc "độ xê". Lỗi nếu bỏ chữ "độ", đọc "C" kiểu Anh ("si") hoặc đọc "o xê". "0" đọc "không". Có ngừng ngắn ở dấu hai chấm trước phần liệt kê. "rắn" sắc, "lỏng" hỏi. Nhiệt độ sôi và đóng băng ở đây là ở áp suất thường, theo cách nói của sách giáo khoa. |
| A21 | Chai nước này chứa 1.000 ml, tức là 1 lít. Nước trong chai nặng khoảng 1 kg. | Chai nước này chứa một nghìn mi-li-lít, tức là một lít. Nước trong chai nặng khoảng một ki-lô-gam. | tự soạn · Discoverer chủ đề 11, Scientist chủ đề 11 (đo thể tích, khối lượng) | "1.000" dùng dấu chấm ngăn hàng nghìn, nên đọc "một nghìn". Giọng Nam đọc "một ngàn" cũng đúng. Lỗi nếu đọc "một chấm không không không" hoặc "một phẩy không". "ml" đọc "mi-li-lít", "kg" đọc "ki-lô-gam". Lỗi nếu đánh vần từng chữ cái. |
| A22 | Nước phủ khoảng 71% bề mặt Trái Đất, tức là gần 3/4. | Nước phủ khoảng bảy mươi mốt phần trăm bề mặt Trái Đất, tức là gần ba phần tư. | tự soạn · Scientist chủ đề 6 Trái Đất, Mặt Trời, Mặt Trăng; chủ đề 14 Biến đổi khí hậu | "71" đọc "bảy mươi mốt", không đọc "bảy mươi một". "%" đọc "phần trăm". "3/4" đọc "ba phần tư". Lỗi nặng nếu đọc thành ngày tháng ("ngày ba tháng tư") hoặc "ba gạch chéo bốn", "ba trên bốn". |
| A23 | Ở TP.HCM, mùa mưa thường kéo dài từ tháng 5 đến tháng 11. | Ở Thành phố Hồ Chí Minh, mùa mưa thường kéo dài từ tháng năm đến tháng mười một. | tự soạn · Explorer chủ đề 5 và 6 (mùa; bản địa hoá mùa mưa) | Viết tắt "TP.HCM": lỗi nếu đánh vần từng chữ cái. "tháng 11" đọc "tháng mười một", không đọc "mười mốt". |
| A24 | Năm 1835, Charles Darwin đến quần đảo Galápagos và quan sát những con rùa khổng lồ ở đó. | Năm một nghìn tám trăm ba mươi lăm, Sác-lơ Đác-uyn đến quần đảo Ga-la-pa-gốt và quan sát những con rùa khổng lồ ở đó. | tự soạn · Scientist chủ đề 13 Tiến hoá và di truyền | Năm đọc đủ như số đếm, có "ba mươi lăm". Lỗi nếu đọc "ba mươi năm" hoặc tách đôi kiểu Anh. Tên riêng đọc gần tiếng Anh hay đọc kiểu Việt như bản đọc đều đạt, miễn nghe ra tên. Lỗi nếu đánh vần, bỏ tên, hoặc đọc chữ "á" trong "Galápagos" thành một thanh sắc lạ tai. Có ngừng sau phần năm. |
| A25 | Khi quang hợp, cây dùng H₂O và CO₂ để làm ra thức ăn, rồi thải ra khí oxy. | Khi quang hợp, cây dùng hát hai ô và xê ô hai để làm ra thức ăn, rồi thải ra khí ô-xi. | tự soạn · Discoverer chủ đề 5; Scientist chủ đề 2 và 14 | Công thức có chữ số nhỏ (ký tự "₂"). Lỗi nếu bỏ chữ "hai", đọc "cô", "hô" hoặc đọc kiểu Anh. Ở trường Việt Nam, công thức đọc theo tên chữ cái: H là "hát", C là "xê", O là "ô". "oxy" đọc "ô-xi"; đọc "ốc-xi" cũng chấp nhận. "hợp" nặng. |
| A26 | Chất đạm còn gọi là protein, chất bột đường còn gọi là carbohydrate. | Chất đạm còn gọi là prô-tê-in, chất bột đường còn gọi là các-bô-hi-đrát. | tự soạn · Scientist chủ đề 3 Giữ gìn sức khoẻ | Từ mượn trong câu tiếng Việt: đọc kiểu Việt quen dùng hay gần tiếng Anh đều đạt, miễn trơn và nghe ra từ. Lỗi nếu đánh vần hoặc vỡ thành chuỗi âm vô nghĩa. Có ngắt ở dấu phẩy giữa hai vế. |
| A27 | Nòng nọc (con non của ếch) sống dưới nước và thở bằng mang. | Nòng nọc, con non của ếch, sống dưới nước và thở bằng mang. | tự soạn · Scientist chủ đề 1 Sinh sản ở động vật (ếch đồng) | Ngoặc đơn phải thành hai quãng ngừng, phần trong ngoặc hơi hạ giọng. Lỗi nếu đọc "mở ngoặc", "đóng ngoặc" hoặc đọc liền. "nọc" nặng, "ếch" sắc. |
| A28 | Từ mới: nutrient – chất dinh dưỡng. | Từ mới: nutrient, chất dinh dưỡng. | tự soạn · mẫu dòng từ mới song ngữ | Câu có từ tiếng Anh chen giữa. Ghi lại engine đọc "nutrient" thế nào: kiểu Anh, kiểu Việt ("nu-tri-ên") hay đánh vần. Gạch "–" phải thành quãng ngừng, không đọc "trừ". Kết quả câu này là căn cứ cho quy tắc D "không chèn tiếng Anh vào chuỗi VI". |
| A29 | Ồ, nam châm hút được chiếc đinh sắt! Còn chiếc thìa nhựa thì sao? | giống chữ gốc | tự soạn · Discoverer chủ đề 4 Lực và nam châm | Thán từ "Ồ" phải có vẻ ngạc nhiên, không đọc phẳng. Sau câu cảm thán là câu hỏi, nên giọng phải đổi giữa hai câu. "sắt" sắc, "thìa" huyền, "nhựa" nặng. |
| A30 | Nắng làm nước ở sông, hồ và biển bốc hơi, hơi nước bay lên cao, gặp lạnh thì thành những giọt nước nhỏ, tạo thành mây, rồi lại rơi xuống thành mưa. | giống chữ gốc | tự soạn · Discoverer chủ đề 11 (vòng tuần hoàn của nước). Câu cố ý dài hơn mức Discoverer. | Câu dài ba mươi hai tiếng, có năm dấu phẩy. Phải ngắt đúng ở dấu phẩy, không đọc một hơi, không ngắt giữa từ ghép ("bốc hơi", "giọt nước"). Giọng không đều đều suốt câu. Hai chữ "hơi" liền nhau ("bốc hơi, hơi nước") phải nghe rõ ranh giới. |

## Phần B · 30 từ đơn và cụm ngắn

| Mã | Chữ gốc | Bản đọc mong đợi | Nguồn | Điểm cần nghe |
| --- | --- | --- | --- | --- |
| B01 | chất dinh dưỡng | giống chữ gốc | bài 1 · từ vựng `nutrient` `term.vi` | Thanh ngã của "dưỡng" ở cuối cụm dễ bị đọc thành hỏi hoặc sắc. |
| B02 | chất bột đường | giống chữ gốc | bài 1 · từ vựng `carbohydrate` `term.vi`, nhãn nhóm Học | "bột" thanh nặng, tắc ở âm t cuối, không bị kéo dài. "đường" huyền. |
| B03 | chất đạm | giống chữ gốc | bài 1 · từ vựng `protein` `term.vi` | Cụm hai tiếng ngắn: "chất" sắc, "đạm" nặng. Phải rõ, không vội. |
| B04 | chất béo | giống chữ gốc | bài 1 · từ vựng `fat` `term.vi` | Hai thanh sắc liền nhau, không bị san phẳng thành thanh ngang. |
| B05 | vitamin | vi-ta-min | bài 1 · từ vựng `vitamin` `term.vi` | Từ mượn đứng một mình là chỗ engine hay đọc kiểu Anh. Mong đợi ba tiếng "vi-ta-min". So bản thô với bản chuẩn hoá. |
| B06 | chất khoáng | giống chữ gốc | bài 1 · nhãn nhóm Học `explore_vit` | "khoáng" thanh sắc, vần "oang". |
| B07 | chất xơ | giống chữ gốc | bài 1 · từ vựng `fibre` `term.vi` | Cụm ngắn kết thúc bằng thanh ngang: nghe xem có bị cụt hoặc lên giọng như câu hỏi không. |
| B08 | năng lượng | giống chữ gốc | bài 1 · từ vựng `energy` `term.vi` | Phân biệt rõ "n" với "l". "lượng" nặng. |
| B09 | khoẻ mạnh | giống chữ gốc | bài 1 · từ vựng `healthy` `term.vi` | Kiểu dấu mới, dấu đặt trên chữ e. So với bản dấu cũ "khỏe mạnh" (B09c): hai bản phải nghe như nhau. |
| B10 | Cơm | giống chữ gốc | bài 1 · Chơi, món `tray_rice` `label.vi` | Từ một tiếng thanh ngang: không bị cụt, không lên giọng như câu hỏi. |
| B11 | Bánh mì | giống chữ gốc | bài 1 · Chơi, món `tray_bread` `label.vi` | Thanh sắc rồi thanh huyền. "mì" ngắn và rõ. |
| B12 | Cá kho | giống chữ gốc | bài 1 · Chơi, món `tray_fish` `label.vi` | "kho" thanh ngang. Lỗi nếu nghe thành "khó". |
| B13 | Trứng | giống chữ gốc | bài 1 · Chơi, món `tray_egg` `label.vi` | Một tiếng thanh sắc, vần "ưng". Chữ "tr" đọc theo miền đều đúng. |
| B14 | Rau muống | giống chữ gốc | bài 1 · Chơi, món `tray_greens` `label.vi` | Chữ "r" đọc theo miền (giọng Bắc gần "d", giọng Nam rung) đều đúng. "muống" sắc. |
| B15 | Chuối | giống chữ gốc | bài 1 · Chơi, món `tray_banana` `label.vi` | Một tiếng, vần "uôi", thanh sắc. |
| B16 | Kẹo | giống chữ gốc | bài 1 · Chơi, món `tray_candy` `label.vi` | Một tiếng thanh nặng: ngắn, rơi xuống. Lỗi nếu nghe thành "kéo" hay "kẻo". |
| B17 | Nước ngọt | giống chữ gốc | bài 1 · Chơi, món `tray_soda` `label.vi` | Thanh sắc rồi thanh nặng. "ngọt" tắc ở âm t cuối. |
| B18 | sữa | giống chữ gốc | bài 1 · ví dụ của nhóm `explore_vit` | Thanh ngã đứng một mình, khó nhất trong sáu thanh. Lỗi nếu nghe thành "sửa" hay "sứa". Giọng Nam đọc ngã gần hỏi là bình thường. |
| B19 | la, là, lá, lả, lã, lạ | giống chữ gốc | tự soạn · đủ sáu thanh | Sáu tiếng chỉ khác nhau ở thanh (ngang, huyền, sắc, hỏi, ngã, nặng), nên mỗi tiếng phải nghe khác nhau rõ. Giọng Nam đọc "lả" gần "lã" là bình thường. |
| B20 | nghỉ ngơi, suy nghĩ | giống chữ gốc | tự soạn · cặp hỏi và ngã | "nghỉ" (hỏi) phải khác "nghĩ" (ngã); đây là cặp hay bị đọc lẫn. Giọng Nam đọc hai thanh này gần nhau là bình thường. |
| B21 | hoá học | giống chữ gốc | tự soạn · kiểu dấu mới, vần "oa" | So với bản dấu cũ "hóa học" (B21c). |
| B22 | thuỷ tinh | giống chữ gốc | tự soạn · Explorer chủ đề 7 Vật liệu quanh em; kiểu dấu mới, vần "uy" | So với bản dấu cũ "thủy tinh" (B22c). |
| B23 | oxy | ô-xi | tự soạn · Scientist chủ đề 9 Hệ tuần hoàn, chủ đề 14 | Từ mượn ba chữ cái. Lỗi nếu đánh vần từng chữ. Đọc "ốc-xi" cũng chấp nhận. |
| B24 | CO₂ | xê ô hai | tự soạn · Scientist chủ đề 14 Biến đổi khí hậu | Công thức đứng một mình, không có chữ "khí" đi trước: xem engine có nhận ra không. Có ký tự chữ số nhỏ "₂". |
| B25 | H₂O | hát hai ô | tự soạn · Discoverer chủ đề 11, Scientist chủ đề 11 | "H" đọc "hát" như ở trường. Lỗi nếu đọc "hắt", "ết" hoặc bỏ chữ "hai". |
| B26 | protein | prô-tê-in | tự soạn · Scientist chủ đề 3 | Từ mượn đứng một mình. Đọc gần tiếng Anh cũng chấp nhận. |
| B27 | carbohydrate | các-bô-hi-đrát | tự soạn · Scientist chủ đề 3 | Từ mượn dài nhất trong bộ. Đọc gần tiếng Anh cũng chấp nhận. Lỗi nếu đánh vần hoặc vỡ thành âm vô nghĩa. |
| B28 | Isaac Newton | Ai-dắc Niu-tơn | tự soạn · Scientist chủ đề 5 Lực và máy đơn giản | Tên riêng nước ngoài đứng một mình. Sách tiếng Việt quen viết "Niu-tơn". Đọc gần tiếng Anh cũng đạt. |
| B29 | 5–7 tuổi | năm đến bảy tuổi | tự soạn · nhãn nhóm tuổi Explorer trong app | Gạch nối khoảng số phải đọc thành "đến". Lỗi nếu đọc "trừ", "gạch" hoặc "năm bảy tuổi". |
| B30 | câu thứ 1, lần thứ 4 | câu thứ nhất, lần thứ tư | tự soạn · chữ giao diện quiz và ôn tập | Số thứ tự: 1 đọc "nhất", 4 đọc "tư". Lỗi nếu đọc "thứ một", "thứ bốn". |

## Ghi chú cho dev: luật đọc rút từ bộ câu

Đây là đích cho bộ chuẩn hoá chữ tiếng Việt trong `content-cli` (B9). Cặp (chữ gốc, bản đọc mong đợi) của A18–A28 và B23–B30 dùng được làm ca unit test. Riêng tên riêng và từ mượn thì kiểm qua bảng phiên âm.

- **Unicode:** đưa chữ về dạng dựng sẵn NFC trước mọi bước, kể cả trước khi băm khoá cache. Chữ dán từ nơi khác có thể ở dạng tổ hợp NFD, nhìn giống nhau nhưng khác mã.
- **Theo miền của giọng được chốt:** giọng Bắc dùng "linh", "nghìn"; giọng Nam dùng "lẻ", "ngàn".
- **Số đếm:**
  - Số 1 sau "mươi" (21 đến 91) đọc "mốt". 11 vẫn là "mười một".
  - Số 5 sau "mười" hoặc "mươi" đọc "lăm" (15, 25, 35). 105 đọc "một trăm linh năm".
  - Số 4 sau "mươi" đọc "tư" hoặc "bốn" đều đúng. 14 đọc "mười bốn".
  - Hàng chục bằng không sau hàng trăm đọc "linh" (206). Hàng trăm bằng không trong số có hàng nghìn đọc "không trăm" (2026 là "hai nghìn không trăm hai mươi sáu").
- **Năm:** đọc như số đếm (1835 là "một nghìn tám trăm ba mươi lăm").
- **Dấu trong số:** dấu chấm ngăn hàng nghìn (1.000), dấu phẩy thập phân (2,5 là "hai phẩy năm"). Gặp số viết kiểu Anh ("1,000", "2.5") thì cảnh báo, không tự đoán.
- **Số thứ tự và tháng:** thứ 1 đọc "thứ nhất", thứ 4 đọc "thứ tư", các số khác giữ nguyên số đếm. Tháng 4 đọc "tháng tư".
- **Phân số và gạch chéo:** "a/b" không có đơn vị đi kèm thì cảnh báo, không tự đoán, vì "3/4" cũng có thể là ngày. Bộ chuẩn hoá chỉ đổi khi đã có luật cho đúng dạng đó.
- **Khoảng số:** "5–7" (gạch giữa hai số) đọc "năm đến bảy".
- **Đơn vị:** cm là xăng-ti-mét, mm là mi-li-mét, m là mét, km là ki-lô-mét, g là gam, kg là ki-lô-gam, ml là mi-li-lít, l là lít, °C là độ xê, % là phần trăm.
- **Dấu câu đọc ra tiếng:**
  - Gạch "—" hoặc "–" giữa hai chữ đổi thành dấu phẩy.
  - "(…)" đổi thành ", …,".
  - Ô trống `{1}` xử lý như SK-014 quyết định 6.
- **Bảng phiên âm** (đề xuất một bảng nhỏ, biên tập bổ sung theo từng bài):
  - Công thức: CO₂ là xê ô hai, H₂O là hát hai ô, O₂ là ô hai.
  - Từ mượn: oxy là ô-xi; vitamin là vi-ta-min (chỉ thêm nếu giọng được chọn đọc sai).
  - Tên riêng: Darwin là Đác-uyn, Newton là Niu-tơn.
  - Viết tắt: TP.HCM là Thành phố Hồ Chí Minh.
  - Chuỗi chữ in hoa liền nhau không có trong bảng thì cảnh báo.
- **Kiểu bỏ dấu:** nếu B09c, B21c, B22c cho thấy giọng được chọn đọc kiểu dấu cũ (khỏe, hóa, thủy) tốt hơn, CLI đổi sang kiểu cũ trước khi sinh. Biên tập vẫn viết kiểu mới như bài 1.

## Phần C · Cách nghe và phiếu chấm

### C1. Sinh file mù (người sinh file làm; người này không chấm)

1. Mỗi **cấu hình** gồm một engine, một giọng và tốc độ mặc định.
   - Engine nào có cả giọng Bắc và giọng Nam thì nên lấy mỗi miền một giọng.
   - Nên dừng ở khoảng sáu cấu hình. Mỗi cấu hình có tám mươi lăm clip, khoảng năm phút audio. Với sáu cấu hình, mỗi người chấm mất khoảng hai đến ba giờ, nên chia làm hai buổi.
2. Mỗi mục sinh một **bản thô** từ chữ gốc.
3. **Bản chuẩn hoá** (hậu tố `n`) sinh từ bản đọc mong đợi; gạch nối thay bằng dấu cách. Với giọng Nam, dùng "lẻ" và "ngàn". Chỉ sinh cho các mục sau:
   - A06, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28;
   - B05, B23, B24, B25, B26, B27, B28, B29, B30.
4. **Bản dấu cũ** (hậu tố `c`): B09 "khỏe mạnh", B21 "hóa học", B22 "thủy tinh".
5. **Cách sinh:**
   - A03 sinh theo cách của SK-014 quyết định 6: tách câu tại ô trống, phần trước kết thúc bằng "…", quãng ngừng khoảng 0,8 giây.
   - A13, A15, A16 sinh thành một chuỗi, dù trong app đó là hai hoặc ba chuỗi riêng.
   - Không dùng SSML, không chỉnh ngữ điệu bằng tay. Đây là phép thử engine đúng như nó sẽ chạy trong `content-cli`.
6. **Định dạng:** xuất M4A AAC mono khoảng 64 kbps như B9, để người chấm nghe đúng thứ bé sẽ nghe. Cân âm lượng mọi clip về cùng một mức, để engine to tiếng hơn không được lợi. Xoá metadata.
7. **Tên mù:**
   - Mỗi cấu hình nhận một chữ cái ngẫu nhiên: X, Y, Z, W, V, U.
   - Tên file là `<chữ cái>-<mã>.m4a`, ví dụ `X-A01.m4a`, `X-A22n.m4a`, `X-B09c.m4a`.
   - Trên phiếu và trong danh sách phát, ghi theo dạng "Engine X – A01".
   - Tên file, tên thư mục và metadata không được chứa tên engine, tên giọng hay thông tin model.
8. **Khoá:** ghi bảng chữ cái tương ứng engine, giọng, phiên bản model, tốc độ và ngày sinh vào một file riêng, nằm ngoài thư mục nghe. Duy và biên tập không mở file này cho tới khi cả hai đã nộp phiếu.
9. **Danh sách phát** xếp theo mã: một mã nghe liền mọi engine. Thứ tự engine xáo lại ở mỗi mã, để người nghe so trực tiếp và không quen kiểu "X luôn phát đầu".

Ví dụ thư mục nghe (nằm trong `content/.build/`, ngoài git):

```
content/.build/tts-vi-test/
  X/  X-A01.m4a … X-A30.m4a, X-A06n.m4a …, X-B01.m4a … X-B30n.m4a, X-B09c.m4a, X-B21c.m4a, X-B22c.m4a
  Y/  …
  playlist-A01.m3u   Engine Z – A01, Engine X – A01, Engine Y – A01, …
```

### C2. Cách nghe

- **Lượt 1** nghe bằng tai nghe, nhìn bản đọc mong đợi.
  - Nghe đủ phần A, phần B, bản `n` và bản `c`.
  - Ghi lỗi theo mã vào bảng C5.
  - Chấm các tiêu chí 1, 2a, 2b, 3, 4 và 6.
- **Lượt 2** nghe bằng loa ngoài của iPhone và không nhìn chữ.
  - Âm lượng khoảng một nửa. Cầm máy cách mặt chừng một cánh tay như bé cầm, trong phòng có tiếng ồn bình thường.
  - Chỉ nghe A01–A17 (chữ thật của bài 1).
  - Chấm tiêu chí 5 và 7.
- Hai người chấm độc lập, không bàn với nhau trước khi nộp phiếu.
- **Không chấm là lỗi:** nét riêng của miền, như giọng Nam đọc hỏi gần ngã, "lẻ", "ngàn", hay cách đọc "r", "gi", "v". Một giọng lẫn nét của hai miền thì ghi lỗi M.
- **Tuỳ chọn, Duy quyết:** nếu bố mẹ đồng ý, cho một hai bé bảy đến chín tuổi nghe A07, A08 và A15 của hai cấu hình đứng đầu rồi hỏi "Em thích giọng nào?". Không ghi âm bé, không lưu tên bé.

### C3. Thang điểm

Điểm chung: 5 là như người đọc chuẩn, không lỗi. 4 là có vài chỗ hơi lạ nhưng không sai nghĩa. 3 là có lỗi rõ ở vài mục, vẫn hiểu được. 2 là lỗi nhiều, trẻ dễ hiểu sai. 1 là không dùng được.

| # | Tiêu chí | Nghe ở | 5 | 3 | 1 |
| --- | --- | --- | --- | --- | --- |
| 1 | Đúng dấu thanh | Mọi mục, kỹ nhất ở B10–B22 | Không sai thanh nào | Sai thanh ở hai đến bốn mục, vẫn hiểu | Sai nhiều, đổi nghĩa ("kẹo" thành "kéo") |
| 2a | Đúng số và đơn vị, bản thô | A18–A25, B29, B30 (bản thô) | Mọi số và đơn vị đúng như bản đọc | Đúng phần lớn, sai một hai dạng | Sai phần lớn |
| 2b | Đúng số và đơn vị, bản chuẩn hoá | Các mục ở mục 2a, bản `n` | Như 2a | Như 2a | Như 2a |
| 3 | Từ đơn nghe tự nhiên | Phần B | Như người đọc từ trên thẻ | Vài từ bị cụt hoặc lên giọng lạ | Nhiều từ méo, cụt |
| 4 | Ngữ điệu hỏi và cảm thán | A01, A04, A07–A11, A13, A15, A16, A29 | Câu hỏi nghe ra hỏi, lời khen nghe ra khen | Đúng khoảng một nửa | Mọi câu đọc như câu kể |
| 5 | Hợp tai trẻ năm đến mười một tuổi: thân thiện, không đều đều | Lượt 2, A01–A17 | Ấm, có sức sống, như cô giáo kể chuyện | Dễ nghe nhưng hơi đều, giống đọc tin | Đều đều, lạnh, như máy |
| 6 | Tốc độ | Mọi mục | Vừa để bé bảy tuổi vừa nghe vừa dò theo chữ | Hơi nhanh hoặc hơi chậm | Quá nhanh, hoặc chậm lê thê |
| 7 | Rõ khi nghe trên loa điện thoại | Lượt 2 | Nghe rõ mọi tiếng | Phải nghe lại vài câu | Rè, nhỏ, các tiếng lẫn vào nhau |

Tiêu chí 6 dưới 4 thì ghi "nhanh" hoặc "chậm" vào ô ghi chú. Khi chấm tiêu chí 5 và 6, nghĩ tới bé Explorer năm đến bảy tuổi: các bé chưa đọc được chữ nên nghe tiếng Việt toàn bộ bài.

### C4. Phiếu tổng (mỗi người chấm một phiếu)

Người chấm: ________ · Ngày: ________ · Tai nghe: ________ · Điện thoại: ________

| Engine | Giọng miền (Bắc, Trung, Nam) | Nữ hay nam | 1 Thanh | 2a Số, bản thô | 2b Số, bản chuẩn hoá | 3 Từ đơn | 4 Hỏi, cảm thán | 5 Hợp tai trẻ | 6 Tốc độ | 7 Rõ trên loa | Ghi chú chung |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| X | | | | | | | | | | | |
| Y | | | | | | | | | | | |
| Z | | | | | | | | | | | |
| W | | | | | | | | | | | |
| V | | | | | | | | | | | |
| U | | | | | | | | | | | |

### C5. Lỗi theo mã câu

Mã lỗi:

| Mã | Nghĩa | Ví dụ |
| --- | --- | --- |
| T | Sai dấu thanh | "kẹo" nghe thành "kéo" |
| S | Sai số, đơn vị, ngày tháng | "3/4" đọc thành "ngày ba tháng tư" |
| K | Đọc ra ký hiệu hoặc dấu câu | "—" đọc thành "gạch ngang"; "(" đọc thành "mở ngoặc" |
| V | Đánh vần, hoặc đọc sai viết tắt, công thức | "TP.HCM" bị đánh vần từng chữ cái |
| E | Từ tiếng Anh, từ mượn, tên riêng khó nhận ra | "Darwin" vỡ thành âm lạ |
| N | Ngắt sai | Không ngừng ở dấu phẩy; ngừng giữa "bốc hơi" |
| H | Ngữ điệu hỏi hoặc cảm thán sai | "Na nói đúng không?" đọc như câu kể |
| B | Bỏ hoặc thêm chữ | Bỏ chữ "hai" trong "CO₂" |
| R | Tiếng rè, méo, giọng máy, hụt hơi, cụt cuối | |
| M | Một giọng lẫn nét của hai miền | Giọng Bắc nhưng vài từ ra thanh giọng Nam |

Cách ghi:
- Ô để trống nghĩa là đạt.
- Ô có lỗi thì ghi mã lỗi kèm vài chữ.
- Mục có bản chuẩn hoá hoặc bản dấu cũ thì ghi cả hai, ví dụ ô A22 của Engine X: `thô: S, 3/4 thành ngày ba tháng tư · n: đạt`.

Muốn tiện thì chép bảng sang bảng tính.

| Mã | X | Y | Z | W | V | U |
| --- | --- | --- | --- | --- | --- | --- |
| A01 | | | | | | |
| A02 | | | | | | |
| A03 | | | | | | |
| A04 | | | | | | |
| A05 | | | | | | |
| A06 | | | | | | |
| A07 | | | | | | |
| A08 | | | | | | |
| A09 | | | | | | |
| A10 | | | | | | |
| A11 | | | | | | |
| A12 | | | | | | |
| A13 | | | | | | |
| A14 | | | | | | |
| A15 | | | | | | |
| A16 | | | | | | |
| A17 | | | | | | |
| A18 | | | | | | |
| A19 | | | | | | |
| A20 | | | | | | |
| A21 | | | | | | |
| A22 | | | | | | |
| A23 | | | | | | |
| A24 | | | | | | |
| A25 | | | | | | |
| A26 | | | | | | |
| A27 | | | | | | |
| A28 | | | | | | |
| A29 | | | | | | |
| A30 | | | | | | |
| B01 | | | | | | |
| B02 | | | | | | |
| B03 | | | | | | |
| B04 | | | | | | |
| B05 | | | | | | |
| B06 | | | | | | |
| B07 | | | | | | |
| B08 | | | | | | |
| B09 | | | | | | |
| B10 | | | | | | |
| B11 | | | | | | |
| B12 | | | | | | |
| B13 | | | | | | |
| B14 | | | | | | |
| B15 | | | | | | |
| B16 | | | | | | |
| B17 | | | | | | |
| B18 | | | | | | |
| B19 | | | | | | |
| B20 | | | | | | |
| B21 | | | | | | |
| B22 | | | | | | |
| B23 | | | | | | |
| B24 | | | | | | |
| B25 | | | | | | |
| B26 | | | | | | |
| B27 | | | | | | |
| B28 | | | | | | |
| B29 | | | | | | |
| B30 | | | | | | |

### C6. Mở khoá và tổng hợp (đề xuất, Duy chốt)

1. Cả hai người chấm nộp phiếu xong mới mở file khoá.
2. Với từng cấu hình, lấy trung bình điểm của hai người cho mỗi tiêu chí, và đếm lỗi theo từng mã lỗi.
3. **Loại** cấu hình rơi vào một trong các trường hợp sau:
   - tiêu chí 1 hoặc tiêu chí 3 trung bình dưới 4 (B18 #3: VieNeu được chọn nếu đạt ở từ đơn);
   - tiêu chí 2b dưới 4;
   - có lỗi R ở hơn ba mục.
4. Các cấu hình còn lại xếp theo tiêu chí 5 và 7, vì trẻ nghe trên điện thoại. Sau đó mới xét chi phí và giấy phép theo B9.
5. Tiêu chí 2a không dùng để loại, vì CLI sẽ chuẩn hoá chữ trước khi sinh. Điểm 2a chỉ cho biết engine có đỡ được khi bộ chuẩn hoá bỏ sót hay không.
6. Ghi kết quả và phiếu vào SK-023.

## Phần D · Quy tắc "nghe xuôi" cho chữ tiếng Việt (đề xuất)

Đề xuất để sau này đưa vào `content/README.md`; lần này chưa sửa README. Chữ VI vừa hiện làm phụ đề vừa được máy đọc thành tiếng, nên phải viết sao cho người đọc to không phải đoán. Mã trong ngoặc là mục kiểm chứng quy tắc trong bộ câu này.

**Số**
- Số trong câu viết bằng chữ: "ba nhóm chất", "hai lần". Đây là luật hiện hành.
- Phân số viết bằng chữ: "một nửa", "ba phần tư". Không viết "1/2", "3/4", vì máy dễ đọc thành ngày tháng. (A22)
- Số thứ tự và tháng viết bằng chữ: "thứ nhất", "thứ tư", "tháng tư", "tháng mười một". (A23, B30)
- Khoảng số viết "từ năm đến bảy tuổi", không viết "5–7 tuổi". (B29)
- **Đề xuất, chờ PM và Duy chốt sau test:** với bài có đo đạc, số đo kèm đơn vị và năm được viết bằng chữ số theo chuẩn Việt Nam.
  - Cách viết: dấu chấm ngăn hàng nghìn (1.000), dấu phẩy thập phân (2,5), một dấu cách trước đơn vị (12 cm, 100 °C).
  - Điều kiện: CLI đã có luật chuẩn hoá và unit test cho đúng dạng đó. Dạng nào chưa có luật thì vẫn viết bằng chữ.
  - Lý do: ở trường, bé học đo đạc bằng chữ số, và "hai phẩy năm xăng-ti-mét" trên màn vừa dài vừa khó đọc. (A18–A22, A24)

**Ký hiệu, viết tắt, công thức**
- Không dùng ký hiệu trong chữ được đọc: &, /, %, ·, +, =, ~, →. Thay bằng chữ: "và", "phần trăm", "khoảng".
- Không viết tắt. Viết đủ "Thành phố Hồ Chí Minh", "ví dụ". Không dùng "v.v.". (A23)
- Trong chữ VI, gọi chất bằng tên ("khí các-bô-níc", "khí ô-xi", "nước"), không viết công thức "CO₂", "H₂O". (A25, B23–B25)

**Dấu câu**
- Không dùng gạch ngang "—" hay "–" trong chuỗi VI. Cần ngừng thì dùng dấu phẩy, dấu hai chấm, hoặc tách thành hai câu. (A06, A17, A28)
- Không dùng ngoặc đơn. Viết phần giải thích thành một vế giữa hai dấu phẩy, hoặc dùng "tức là", "còn gọi là". (A27)
- Không dùng dấu chấm phẩy và dấu ba chấm. Dấu ba chấm để dành cho ô trống; CLI tự thêm. (A03)
- Câu trọn vẹn, kể cả câu hướng dẫn, kết thúc bằng ".", "?" hoặc "!", để giọng xuống hay lên đúng chỗ. Nhãn một hai từ (tên món, tên nhóm) không cần dấu.

**Câu**
- Câu hỏi phải có từ hỏi hoặc tiểu từ hỏi: gì, nào, không, thì sao. Không viết câu kể rồi thêm dấu "?" (như "Cá giàu chất đạm?"), vì máy dễ đọc thành câu kể. (A01, A09, A13)
- Lời khen, lời reo đứng riêng thành một câu ngắn ("Tuyệt!", "Chính xác!"); câu giải thích theo sau. (A07, A15, A16)
- Câu cho Discoverer dài tối đa khoảng hai mươi tiếng và ba dấu phẩy. Dài hơn thì tách câu. Mức này là đề xuất, chỉnh lại sau khi nghe A30.

**Từ mượn, tiếng Anh, tên riêng**
- Có từ Việt thì dùng từ Việt: "chất đạm", "chất bột đường", không dùng "protein", "carbohydrate". Từ mượn đã quen như "vitamin" thì giữ. (A26, B05, B26, B27)
- Không chèn từ tiếng Anh vào chuỗi VI. Từ tiếng Anh nằm ở chuỗi EN và do giọng EN đọc. Dòng kiểu "Từ mới: nutrient, chất dinh dưỡng" do app ghép từ clip EN và clip VI. (A28)
- Tên riêng nước ngoài giữ nguyên chữ gốc trên màn. Biên tập ghi cách đọc vào một dòng `>` của bài (ví dụ "Darwin đọc là Đác-uyn") để dev đưa vào bảng phiên âm của CLI. (A24, B28)

**Chính tả**
- Mọi bài dùng một kiểu bỏ dấu: kiểu mới như bài 1 (khoẻ, hoá, thuỷ). Nếu giọng được chọn đọc kiểu cũ tốt hơn, CLI tự đổi trước khi sinh; biên tập không sửa tay. (B09, B21, B22)

## Chỗ chưa chắc

- **Cách đọc từ mượn và tên riêng:** bản đọc của các từ sau là cách biên tập đề xuất, chưa đối chiếu nguồn chuẩn:
  - prô-tê-in, các-bô-hi-đrát, ô-xi;
  - Sác-lơ Đác-uyn, Ga-la-pa-gốt, Ai-dắc Niu-tơn.
  - Vì vậy phiếu chấm chấp nhận cả cách đọc gần tiếng Anh, miễn nghe ra từ. Duy và biên tập chốt khi nghe.
- [CẦN KIỂM] Sách giáo khoa Khoa học tiểu học hiện hành viết tên khí là "ô-xi", "các-bô-níc" hay "oxygen", "carbon dioxide"? Cần biết để chữ trong app khớp với chữ ở trường.
- **Chữ giao diện:** A15 và A16 ghép lời khen và lời động viên trên canvas. Chưa rõ app có đọc to chữ giao diện không (B7.9). Nếu không đọc, hai câu này vẫn có ích để thử giọng khen.
- **Số trong chữ VI:** luật hiện hành là "số viết bằng chữ". Đề xuất cho phép chữ số ở số đo (phần D) cần PM và Duy chốt.
- **Giọng miền, quyết định của Duy:** bài 1 dùng từ miền Bắc (bát, lạc, đậu phụ). Chọn giọng Nam thì giọng và từ ngữ lệch nhau. Các lựa chọn:
  - (a) giọng Bắc, giữ từ ngữ như hiện tại;
  - (b) giọng Nam, giữ từ miền Bắc và chấp nhận lệch;
  - (c) hai giọng cho phụ huynh chọn: audio gấp đôi, và có thể phải có chữ theo từng miền.
- **Số liệu khoa học** trong câu tự soạn, theo biên tập nhớ là đúng nên không gắn [CẦN KIỂM]: 206 xương ở người lớn; nước phủ khoảng 71% bề mặt Trái Đất; Darwin tới Galápagos năm 1835; mùa mưa Nam Bộ từ tháng năm đến tháng mười một; nước sôi ở 100 °C và đóng băng ở 0 °C ở áp suất thường; một lít nước nặng khoảng một ki-lô-gam. Riêng số đo cây đậu ở A19 là ví dụ minh hoạ, không phải số liệu.

## Đề xuất sửa bài 1

Chưa sửa bài; PM quyết. Số dòng tính theo file `01-thuc-an-cho-ta-nhung-gi.md` hiện tại.

1. **`messages.full.vi`** (Chơi, dòng 188)
   - Hiện tại: "Mâm đầy rồi — chạm món trong mâm để bỏ ra."
   - Đề xuất: "Mâm đầy rồi. Chạm món trong mâm để bỏ ra."
   - Lý do: quy tắc D về gạch ngang. Câu tách đôi đọc tự nhiên với mọi engine, nên không cần chờ test (kiểm lại bằng A06).
   - Kéo theo: xoá dòng `>` nhắc nghe thử ở dòng 189. Canvas Discoverer-Play và Discoverer-Play-iPad có chữ này, designer sửa theo. Chữ EN không đổi.
2. **`fact.vi` của thẻ `rau_muong`** (Thưởng, dòng 623)
   - Hiện tại: "Rau muống có nhiều vitamin và chất xơ — món rau quen thuộc trong mâm cơm Việt."
   - Đề xuất: "Rau muống có nhiều vitamin và chất xơ. Đây là món rau quen thuộc trong mâm cơm Việt."
   - Lý do: như mục 1 (kiểm bằng A17).
   - Kéo theo: xoá dòng `>` ở dòng 624. Canvas Discoverer-Reward có chữ này. Dòng [CẦN KIỂM] về lượng chất xơ giữ nguyên.
3. **`instruction.vi` của q5** (Quiz, dòng 440), ưu tiên thấp
   - Hiện tại: "Chọn tất cả đáp án đúng"
   - Đề xuất: "Chọn tất cả đáp án đúng."
   - Lý do: đây là một câu trọn vẹn, chữ EN cũng có dấu chấm, và có dấu chấm thì giọng xuống đúng ở cuối câu.
   - Lưu ý: canvas Discoverer-Quiz hiện chữ này không có dấu chấm. Vì mỗi chuỗi `Spoken` vừa hiện vừa đọc, chữ trên màn sẽ đổi theo.
4. **Chưa đổi chữ, chờ kết quả nghe:**
   - "vitamin" (A05, A09, A17, B05): nếu giọng được chọn đọc kiểu Anh, thêm "vitamin → vi-ta-min" vào bảng phiên âm của CLI, không sửa bài.
   - Kiểu dấu "khoẻ" (B09): nếu giọng được chọn đọc kiểu cũ tốt hơn, CLI đổi kiểu dấu, không sửa bài.
   - Ô trống của w1 (A03): nếu đoạn "để sống." đọc rời nghe cụt, đổi `sentence.vi` để ô trống nằm cuối câu: "Để sống, động vật, kể cả con người, cần thức ăn, nước và {1}." Chữ EN giữ nguyên. Schema chỉ bắt buộc ô trống trong `en`; ô trống trong `vi` là tuỳ chọn và không ràng buộc vị trí (`packages/content-schema/README.md`, quy tắc `fill_blank_bank`).
