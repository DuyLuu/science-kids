# Khung một bài (TEMPLATE)

Khung chuẩn cho mỗi bài `content/<age_group>/<topic_slug>/<nn>-<lesson_slug>.md` và mỗi chủ đề `content/<age_group>/<topic_slug>/_topic.md`. Bài mẫu: `content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md` (chưa theo luật hình SK-033; mẫu phần hình là bài thử `content/discoverer/be-mat-trai-dat/01-dat-va-nuoc-tren-trai-dat.md`, chờ Duy duyệt). Tên trường theo SK-001 "Hợp đồng trường v1".

## A. Hướng dẫn cho biên tập

**Tạo bài mới**
1. Chép khung ở mục B vào file mới, ví dụ `content/discoverer/an-uong-lanh-manh/02-mam-com-can-bang.md`. `nn` là thứ tự bài, hai chữ số; phần sau `nn-` trùng `slug`.
2. Điền từ trên xuống. Không đổi, không thêm, không bỏ tên mục `##`. Mục không dùng (ví dụ Thưởng) thì giữ tiêu đề, để trống. Mọi dòng `id:` để trống (xem đoạn "id và key").
   - Máy bắt buộc mọi mục của khung, trừ các mục Ghi chú: `## Ghi chú cho hoạ sĩ`, `## Ghi chú cho dev` (bài) và `## Ghi chú` (chủ đề). Biên tập vẫn viết đủ các mục Ghi chú.
   - `## Câu hỏi lớn` của chủ đề phải có tiêu đề, phần dưới được để trống.
3. Kiểm bài bằng máy (`content-cli`, SK-027). Hai lệnh, chạy từ gốc repo:
   ```sh
   npm --prefix tools/content-cli run validate -- content/discoverer/an-uong-lanh-manh   # kiểm cả chủ đề, không ghi gì
   npm --prefix tools/content-cli run ids -- content/discoverer/an-uong-lanh-manh/02-mam-com-can-bang.md   # bài mới: điền id, chạy một lần
   ```
   - `validate` đọc thẳng file markdown. Máy kiểm cú pháp, rồi schema, rồi luật theo nhóm tuổi.
   - Mỗi lỗi in một dòng `<file>:<dòng> <JSON pointer> [<mã>] <thông báo>`. Số dòng là dòng thật trong file `.md`; thông báo gọi theo tên trong markdown và nói cách sửa.
   - Bảng mã lỗi và đường đi đầy đủ ở `tools/content-cli/README.md`, mục "Markdown: validate, import, ids".
   - **Cách làm hiện tại** (SK-027, quyết định 7): agent content-editor không chạy lệnh.
     1. Biên tập viết xong thì báo phiên chính.
     2. Phiên chính chạy `validate` và gửi lại các dòng lỗi.
     3. Biên tập sửa đúng các dòng đó. Lặp bước 2 và 3 tới khi `validate` báo 0 lỗi.
     4. Phiên chính chạy `ids`, `import`, sinh giọng (`tts --lang en`, rồi `tts --lang vi`) và `build`.
   - Cảnh báo (`md_needs_check`, `age_words_en`, `age_dok_order`…) không chặn, nhưng biên tập xem từng cái: sửa, hoặc ghi lý do giữ lại bằng một dòng `>`.
   - Biên tập viên là người thật thì tự chạy hai lệnh trên máy mình, rồi mở pull request. Cần Node `^22.18.0` hoặc `>= 23.6.0`, và chạy `npm install` một lần trong `tools/content-cli`.

**Cú pháp (máy đọc được)**
- Mỗi dòng một trường `tên: giá trị`. Tên trường viết liền, không dấu cách. Giá trị nằm trên một dòng, không cần ngoặc kép.
- Cặp song ngữ luôn là hai dòng: `<tên>.en:` rồi `<tên>.vi:`. Mục chỉ có một chuỗi (Tiêu đề, Mục tiêu, Câu hỏi lớn) thì viết `en:` và `vi:`.
- Hình luôn là ba dòng: `<tên>.brief:` (tả ảnh cần tìm, hay hình cần vẽ với nhãn `[hình vẽ]`; tiếng Việt, một dòng, cuối dòng là từ khoá tìm ảnh trừ hình vẽ; xem đoạn **Hình**), `<tên>.alt.en:`, `<tên>.alt.vi:`.
- Danh sách key viết trên một dòng, cách nhau bằng dấu phẩy: `term_keys: nutrient, protein`.
- Mỗi câu quiz, block, từ vựng, thẻ là một `### <key>`. Phần tử con là `#### <loại> <key>`, loại là `option`, `bank`, `item`, `bar` hoặc `group`.
- Dòng bắt đầu bằng `>` là ghi chú cho người duyệt; máy bỏ qua.

**id và key**
- Bài mới và misconception mới: để trống mọi dòng `id:`, ở frontmatter và ngay dưới mỗi `###`. Không tự đặt, không bịa UUID. Lấy bài khác làm điểm xuất phát thì xoá hết mã sau `id:`.
- Id trống không chặn việc kiểm. `validate` báo một dòng `md_id_missing` cho mỗi file, rồi vẫn kiểm hết phần còn lại.
- Khi bài đã hết các lỗi khác, lệnh `ids` (bước 3) điền UUID vào đúng các dòng `id:` còn trống. Lệnh không đụng chữ nào khác; chạy lần hai không đổi gì.
- `validate` và `import` không bao giờ sửa file. `import` chỉ ghi JSON khi không còn id trống.
- Đã có mã thì không sửa, không xoá, không chép sang bài khác. Id trùng một id khác trong `content/` thì máy báo `md_id_duplicate`, kèm chỗ có id kia. Cách sửa: xoá id ở chỗ mới (để trống), rồi chạy `ids`.
- Câu khởi động trỏ tới bài khác (`recall_from.lesson`) thì bài được trỏ tới phải đã có id.
- `key`: chữ thường không dấu, số và `_`; bắt đầu bằng chữ; tối đa bốn mươi ký tự; không trùng trong cả bài.
- Đặt key: câu quiz `q1`…`q6`; khởi động `w1`…`w3`; từ vựng là chính từ tiếng Anh (`carbohydrate`); key con = key cha + `_` + tên ngắn (`q1_orange`, `tray_rice`).
- Bài đã phát hành thì không đổi key.

**Chữ cho trẻ (syllabus-progression mục 8)**
- Số từ mỗi câu EN: Explorer ≤ 6–8, Discoverer ≤ 10, Scientist ≤ 12–15. Tính cả gợi ý, giải thích, lời nhắn.
- Số từ EN trên một màn: Explorer ≤ 15, Discoverer ≤ 30, Scientist ≤ 40–50.
- Mỗi câu một ý. Ngoài từ mới của bài, chỉ dùng từ trong danh sách Cambridge Starters/Movers hoặc từ đã học.
- Từ mới (`tier: core`) mỗi bài: Explorer 2–3, Discoverer 3–4, Scientist 4–5. Từ đọc thêm để `tier: extra`. Tổng 4–8 từ.
- Tiếng Việt là phụ đề và cũng được máy đọc thành tiếng: xưng "em", câu ngắn, số viết bằng chữ, không viết tắt, không ký hiệu (&, /, %, ·). Dấu "—" hạn chế; nếu giữ thì thêm dòng `>` nhắc nghe thử.
- Dùng ví dụ quen với trẻ Việt Nam: mâm cơm, rau muống, mùa mưa, ếch đồng.
- Không chép câu chữ, hình hay ví dụ của Oak; không nhắc tên Oak trong chữ cho trẻ (`oak_unit_ref` là trường nội bộ).

**Hình (SK-033)** *(nháp AI)*

Duy chốt 9/11: trẻ học chủ yếu bằng hình. Hình là ảnh chụp thật hoặc hình vẽ gần thực tế, từ nguồn miễn phí cho phép dùng thương mại. Không lấy hình AI từ nguồn ngoài; không dùng hình hoạt hình, giấy cắt cho hình nội dung. Nguồn và giấy phép được nhận: SK-033 mục "Giấy phép". Biên tập viết `brief` và `alt`; người chọn ảnh tìm ảnh và kiểm giấy phép.

Duy chốt 10/11: đồ vật, cảnh không có ảnh miễn phí hợp lệ thì designer vẽ minh hoạ gần thực tế (hình tự vẽ, credit "Science Kids", `changes: ["drawn"]`); cảnh khó thì designer ghép từ ảnh đã có (hình ghép). Hình không có chữ ở mọi nhóm tuổi, kể cả nhãn chữ song ngữ ở phần Học: tên gọi nằm ở câu, món ví dụ và từ vựng.
- **Chỗ phải có `image`** (mọi nhóm tuổi):
  - mọi câu Khởi động và Quiz, ở cấp câu (ba dòng `image.*` ngay sau `prompt.*`), kể cả câu đã có hình ở lựa chọn;
  - mọi `#### option` của `single_choice`, `multi_choice`; mọi `#### bank` của `fill_blank_bank`; mọi `#### item` của `build_tray`;
  - ô Học, từ vựng, thẻ thưởng vẫn có hình như trước; `#### item` của `order_sequence` và `#### bar` của `picture_bar_chart` cũng viết hình.
  - Máy: `validate` cảnh báo chỗ thiếu; Duy duyệt xong bài thử thì thành lỗi.
- **`brief`**: một dòng tiếng Việt tả ảnh cần tìm, đủ để người chọn ảnh loại ứng viên sai.
  - Mở đầu bằng loại hình trong ngoặc vuông: `[ảnh]` (ảnh chụp thật), `[tranh]` (hình vẽ gần thực tế lấy từ nguồn ngoài), `[ảnh hoặc tranh]`, `[bản đồ]`, `[hình vẽ]`, `[sơ đồ ghép ảnh]` (hai nhãn sau xem ngay dưới). Chủ đề được thêm loại riêng, ví dụ Khủng long: `[ảnh mô hình]`, `[tranh phục dựng]`.
  - **`[hình vẽ]`: hình tự vẽ** (Duy 10/11). Chỉ dùng khi không có ảnh miễn phí hợp lệ (đã tìm mà không có, hoặc ảnh có thì lộ mặt trẻ, có logo, sai giấy phép); không dùng để khỏi phải tìm ảnh. Designer vẽ minh hoạ gần thực tế, xuất JPEG; file chọn ảnh ghi mục `own` (`method: "drawn"`).
    - Nhãn phải đứng đầu brief, đúng chữ `[hình vẽ]` (máy cũng nhận `[hình tự vẽ]`, `[tự vẽ]`): `images search` dựa vào nhãn này để không tìm ảnh mà đề xuất mục `own`; `validate` không đòi dòng từ khoá.
    - Brief tả cần vẽ gì: vật, góc nhìn, nền, điều không được có. Ví dụ: "nền trơn, không có chữ, nhìn nghiêng". Không cần `Từ khoá tìm ảnh (EN)`; ô đã từng tìm ảnh thì giữ dòng từ khoá cũng được.
    - Ví dụ: `image.brief: [hình vẽ] Một cốc nước thuỷ tinh trên bàn gỗ, mặt nước gợn vòng tròn, hai bên cốc có vài nét rung nhỏ; vẽ gần ngang mặt bàn, nền trơn; không có người, không có nhãn hiệu, không có chữ.`
    - Có người trong hình: vẽ từ phía sau, chỉ thấy tay, hoặc mặt cúi, không vẽ nét mặt; như luật ảnh.
    - Khủng long và con vật đã tuyệt chủng vẫn theo Quy ước hình của chủ đề Khủng long (ảnh bộ xương, ảnh mô hình, tranh phục dựng khoa học). Chốt 10/11 nói về đồ vật, nên muốn tự vẽ một con khủng long thì hỏi PM trước, và hình phải qua người chuyên môn như tranh phục dựng.
  - **`[sơ đồ ghép ảnh]`: hình ghép.** Designer ghép từ nhiều ảnh đã có, hay dựng lại một sơ đồ có giấy phép rồi tô lại; file chọn ảnh ghi mục `composed`. Nhãn đứng đầu brief (máy nhận mọi nhãn có chữ "ghép"). Brief nêu từng phần: phần dùng lại ghi key trong backtick (`` `tray_eggshell` ``, `` `<slug bài>/<key>` `` hay "`<key>` ở bài `<slug chủ đề>/<slug bài>`"); phần cần tìm mới ghi ở `Từ khoá tìm ảnh (EN)` hoặc "Từ khoá cho <phần>: …". Chỉ đặt trong backtick những key thật sự là một phần của hình ghép, vì máy đề xuất mọi key trong backtick thành một phần.
  - Một ô chỉ có một nhãn. Brief "Dùng lại hình `<key>`" (đoạn **Dùng lại hình** bên dưới) không cần nhãn, dù hình gốc là hình tự vẽ hay hình ghép.
  - Rồi tới vật chính, cảnh, góc chụp (từ xa, từ trên cao, cận cảnh), nền; điều phải thấy và điều không được có, nhất là chỗ dễ lẫn sang lựa chọn khác ("không thấy sông hay hồ").
  - Không có người nhận ra mặt, nhất là trẻ em; nhân vật trong câu (Mai) chỉ thấy tay hoặc dáng ở xa. Không logo, nhãn hiệu, bao bì có thương hiệu, biển số, tên tàu.
  - Bối cảnh Việt Nam khi bài cần (ao làng, đồi chè, cánh đồng muối).
  - Kết thúc bằng `Từ khoá tìm ảnh (EN): …` trên cùng dòng (trừ brief `[hình vẽ]`, và brief `[sơ đồ ghép ảnh]` có mọi phần là hình dùng lại): ba đến sáu từ tiếng Anh viết như một câu tìm kiếm, cách nhau bằng dấu cách, từ chung nhất trước. Cụm gọi tên một vật (polar bear, Ha Long Bay) tính là một từ.
  - Ví dụ: `image.brief: [ảnh] Một cái ao nhỏ ở làng quê, mặt nước có lá sen, thấy bờ ao bao quanh; không có người, không có chữ. Từ khoá tìm ảnh (EN): pond village lotus leaves`
- **Hình không lộ đáp án:**
  - hình câu hỏi tả tình huống hoặc vật được hỏi, không tả sẵn đáp án hay bằng chứng của gợi ý: câu "Nước biển có vị ngọt" dùng ảnh biển, không dùng ảnh đống muối;
  - các lựa chọn cùng kiểu ảnh, không ảnh nào nổi bật hơn; không để đáp án đúng là hình vẽ duy nhất giữa các ảnh chụp (hay ảnh chụp duy nhất giữa các hình vẽ); câu hỏi nói về Việt Nam thì lựa chọn đúng không được là ảnh duy nhất trông như quê mình;
  - `alt` của câu hỏi không nói tên đáp án; ảnh không có chữ gọi tên đáp án.
- **Dùng lại hình:** cùng một vật thì dùng một ảnh. `brief` mở đầu bằng "Dùng lại hình `<key>`." (bài khác thì "Dùng lại hình `<key>` ở bài `<slug chủ đề>/<slug bài>`.", viết bài như `recall_from.lesson`), rồi chép nguyên phần từ khoá của chỗ gốc. `alt` chép của chỗ gốc, trừ khi phải sửa để khỏi lộ đáp án.
- **Bản đồ, quả địa cầu** (Duy chốt 9/11): hình thấy vùng Đông Nam Á chỉ dùng bản đồ chính thức của Việt Nam (nguồn nhà nước), có quần đảo Hoàng Sa, Trường Sa; không dùng bản đồ nước ngoài; thêm dòng `> [CẦN KIỂM]` để duyệt pháp lý. Mọi quả địa cầu, ảnh Trái Đất khác không thấy vùng Đông Nam Á, kể cả ở mép ảnh. Tên ảnh ở nguồn hiện ở màn "Nguồn hình", nên ảnh có Biển Đông, Hoàng Sa, Trường Sa thì người chọn ảnh kiểm tên gọi trước khi chọn.
- **Khó tìm ảnh thật** (hai vật hiếm khi cùng khung, vật hay có logo): ghi phương án thay trong `brief` hoặc một dòng `>`. Không đổi chữ trẻ đọc chỉ để dễ tìm ảnh.

**Quiz (syllabus-progression mục 7; luật theo nhóm tuổi: SK-026)**

> Trạng thái phần sửa 1/11/2026: **nháp do AI soạn (content-editor), chưa duyệt** · Ticket: SK-026. Phần nháp gồm hai dòng gắn *(nháp AI)* ngay dưới đây, mục "Luật soạn câu Explorer", "Bảng luật theo nhóm tuổi" và dòng "Máy kiểm". Người duyệt xoá nhãn nháp sau khi duyệt.

- Đúng 6 câu, xếp dễ → khó. Câu 1 luôn DOK 1.
- DOK 1: nhớ lại. DOK 2: so sánh, phân loại, áp dụng vào tình huống quen. DOK 3: suy luận bằng bằng chứng, tình huống mới, bắt lỗi một lời nói.
- Câu bắt misconception ghi `misconception: <key>`; key lấy từ `_topic.md`. Số câu như vậy theo nhóm tuổi ở bảng dưới. *(nháp AI)*
- Format được dùng, số lựa chọn, chỗ bắt buộc có hình, phân bổ DOK, số format khác nhau và số từ mỗi câu: theo "Bảng luật theo nhóm tuổi" dưới đây. Nhóm tuổi lấy theo `age_group` trong `_topic.md` của chủ đề. *(nháp AI)*
- Câu nào cũng đủ `prompt`, `hint`, `explanation_correct`, `explanation_wrong`, cả EN và VI. Gợi ý dẫn đường, không nói thẳng đáp án.
- Câu 6 có lời Na (`speaker: na`): `instruction` là "Challenge: check Na's idea" · "Thử thách: kiểm tra ý của Na"; `labels` là "Yes" · "Na đúng" và "No" · "Na chưa đúng". Nhãn trung tính vì Na có lúc nói đúng; không dùng "spot the mistake", vì nhãn đó báo trước Na sai.
- Khởi động 2–3 câu; câu nào cũng có `recall_from`.

**Phản hồi sau mỗi lần chọn (SK-044)** *(nháp AI, 13/11)*

Duy 13/11: chọn sai thì bé được giải thích để chọn lại; chọn đúng thì bé nghe thêm một ý để hiểu rõ. Cách app dùng bốn loại chữ (SK-044, mục Quyết định):
- **Chọn sai, còn lượt:** app đọc `feedback` của lựa chọn vừa chọn, rồi đọc `hint`. Lựa chọn không có `feedback` thì chỉ đọc `hint`.
- **Chọn sai, hết lượt:** app đọc `explanation_wrong`.
- **Chọn đúng:** app luôn đọc `explanation_correct`.

Bốn trường:
- **`feedback`** (mới, tuỳ chọn nhưng nên có): một câu cho **mỗi lựa chọn sai**, nói vì sao lựa chọn đó chưa đúng. Viết dưới khối `#### option` (cả `#### bank` của `fill_blank_bank`), hai dòng `feedback.en:` / `feedback.vi:`. Lựa chọn đúng không có `feedback`.
  - Câu `true_false`: viết ở cấp câu, cho phía bé chọn nhầm: câu đáp án Đúng viết `feedback_false.en/.vi` (bé chạm "Sai"); câu đáp án Sai viết `feedback_true.en/.vi` (bé chạm "Đúng"). Tên trường tạm, dev chốt ở SK-044.
  - `order_sequence`: chưa có `feedback` (chấm cả chuỗi); dùng `hint`.
  - Nói về **lựa chọn bé vừa chọn**, không nói đáp án đúng là gì, không gọi tên đáp án, không tả dấu hiệu chỉ đáp án mới có theo cách thay cho việc nghĩ.
  - Không chê, không nói "sai", "không đúng", "nhầm rồi"; không "Oops". Mở đầu bằng chính vật đó: "A bat has fur, not feathers." · "Con dơi có lông, không có lông vũ."
- **`hint`**: cách nghĩ để chọn lại (nhìn vào đâu, nhớ ô Học nào, so cái gì). Không nói đáp án, không đọc lại các lựa chọn. Vì app đọc `hint` ngay sau `feedback`, hai câu không lặp ý.
- **`explanation_correct`**: không chỉ "Yes!" · "Đúng rồi!"; luôn thêm **một ý** giải thích vì sao đúng hoặc một điều bé chưa biết. Câu `true_false` đáp án Sai: không mở đầu bằng "Yes!".
- **`explanation_wrong`**: nói tên đáp án và một lý do ngắn ("The answer is the hen. It has feathers.").

Theo nhóm tuổi:

| | Explorer 5–7 | Discoverer 7–9 | Scientist 9–11 |
| --- | --- | --- | --- |
| `feedback` | Một câu, tối đa 8 từ EN. Nói điều **nhìn thấy được** trong hình hoặc điều bé đã học bằng hình ("A crab has a hard shell." · "Con cua có vỏ cứng."). Giọng ấm. | Một đến hai câu, mỗi câu tối đa 10 từ. Nêu lý do. Không lộ đáp án. | Một đến hai câu, mỗi câu tối đa 15 từ (soạn nhắm 12). Được dùng thuật ngữ đã học. |
| `hint` | Một câu, tối đa 8 từ; chỉ vào điều nhìn thấy, hoặc nhắc tên ô Học khi điều cần biết không nhìn thấy được (main session chốt 12/11). | Một câu, tối đa 10 từ; chỉ chỗ cần nhớ hoặc cách nghĩ. | Một câu; có thể hỏi ngược để bé tự suy. |
| `explanation_correct` | "Yes!" cộng một câu ý thêm, mỗi câu tối đa 8 từ. | Một đến hai câu, tối đa 10 từ mỗi câu. | Một đến hai câu. |
| `explanation_wrong` | "The answer is …" cộng một câu lý do, mỗi câu tối đa 8 từ. | Như Explorer, tối đa 10 từ mỗi câu. | Như Discoverer, tối đa 15 từ. |

Ví dụ Explorer, câu "Which one is a bird?" (dơi, chuồn chuồn, chim cánh cụt; đáp án chim cánh cụt):
- `feedback` của dơi: "A bat has fur, not feathers." · "Con dơi có lông, không có lông vũ."
- `feedback` của chuồn chuồn: "A dragonfly has thin wings, no feathers." · "Chuồn chuồn có cánh mỏng, không có lông vũ."
- `hint`: "Look for feathers and a beak." · "Em tìm con có lông vũ và có mỏ nhé."
- `explanation_correct`: "Yes! A penguin is a bird. It swims." · "Đúng rồi! Chim cánh cụt là chim. Nó bơi, không bay."

**Luật soạn câu Explorer** *(nháp AI)*

Bé 5–7 tuổi phần lớn chưa đọc được, nên phải làm trọn Khởi động và Quiz chỉ bằng nghe và nhìn (SK-026, quyết định D2 và D4). Ở Explorer:
- app tự đọc câu hỏi khi mở câu;
- bé chạm một thẻ hình là trả lời luôn, không có nút "Kiểm tra";
- app không đọc tên các lựa chọn trước khi bé chọn; chạm xong mới đọc tên hình vừa chọn, rồi phản hồi;
- sai thì app tự đọc gợi ý; xong câu thì tự đọc giải thích.

Bảy luật dưới đây áp cho mọi câu Explorer, ở cả Khởi động và Quiz. Mỗi luật ghi ai kiểm: máy (`validate`, `build`) hay người duyệt. Ví dụ lấy từ chủ đề Explorer số 1 "Gọi tên và nhóm động vật", chỉ để minh hoạ luật, không phải câu của bài.

1. **Nghe và nhìn là đủ.** Chỉ nghe câu hỏi (`prompt`, `instruction`) và nhìn hình là chọn được đáp án. Không hỏi về tên, chữ cái hay cách viết của lựa chọn.
   - Kiểm (người duyệt): che hết chữ trên màn, kể cả phụ đề; đọc to `prompt.en`, nhìn các hình. Vẫn chọn đúng được thì đạt.
   - Đạt: `prompt.en: Which animal can fly?` · `prompt.vi: Con nào biết bay?` · ba thẻ hình: chim sẻ, con trâu, cá rô đồng.
   - Không đạt: `prompt.en: Which animal's name starts with "d"?` · ba thẻ hình: con vịt, con mèo, con trâu. Bé phải biết tên tiếng Anh và chữ cái, mà app chỉ đọc tên sau khi bé đã chọn.
2. **Lựa chọn nhận ra được chỉ bằng hình.** Mỗi lựa chọn và mỗi thẻ sắp thứ tự là hình của một vật cụ thể, vẽ được: một con vật, một bộ phận, một thức ăn. Mỗi hình một vật, nền đơn giản. Không lấy tên nhóm hay ý trừu tượng làm lựa chọn.
   - Kiểm: máy báo `age_image_required` khi lựa chọn hay thẻ thiếu `image`; người duyệt đọc `image.brief`, mỗi hình đúng một vật.
   - Đạt: `prompt.en: What does a buffalo eat?` · `prompt.vi: Con trâu ăn gì?` · ba thẻ hình: bó cỏ, con cá, miếng thịt.
   - Không đạt: `prompt.en: Which group is a hen in?` · ba lựa chọn "bird", "fish", "mammal". Tên nhóm không vẽ được thành một vật; bé phải đọc chữ hoặc nghe tên lựa chọn.
3. **Câu hỏi ngắn, để đọc to.** `prompt.en` tối đa 8 từ mỗi câu: một câu hỏi, một ý, vào thẳng câu hỏi. Cả màn (`prompt`, `instruction`, `statement` nếu có) tối đa 15 từ tiếng Anh. `prompt.vi` cũng ngắn, vì app đọc cả hai.
   - Kiểm: máy cảnh báo `age_words_en` khi một câu tiếng Anh quá 8 từ; người duyệt đếm số từ cả màn.
   - Đạt: `prompt.en: Which animal lives in water?` (5 từ) · `prompt.vi: Con nào sống dưới nước?`
   - Không đạt: `prompt.en: Look at all these animals and tap the one that lives in water.` (13 từ, hai việc trong một câu).
4. **Chữ chỉ ở câu hỏi và lời linh vật.** Thẻ lựa chọn, thẻ sắp thứ tự và hình không có chữ. Vẫn viết đủ `label.en` và `label.vi` cho mọi lựa chọn và mọi thẻ: đó là tên app đọc sau khi bé chọn, và là nhãn VoiceOver. `label` là tên ngắn của đúng vật trong hình, không phải lời dặn. `image.brief` ghi rõ "không có chữ".
   - Kiểm: người duyệt đọc `image.brief` và `label` (schema đã bắt buộc có `label`).
   - Đạt: `label.en: duck` · `label.vi: con vịt` · `image.brief: [ảnh] Một con vịt cỏ đứng trên bờ ao, nền đơn giản, không có chữ. Từ khoá tìm ảnh (EN): duck standing pond bank`.
   - Không đạt: `image.brief: Con vịt trên bờ ao, mũi tên chỉ vào cánh kèm chữ "wing · cánh"`. Từ 10/11 (Duy chốt) không nhóm tuổi nào ghi nhãn chữ trong hình; trước đây bài Discoverer được ghi (bài 1, câu w2).
5. **Đúng/Sai bằng biểu tượng.** Ở Explorer, app hiện hai thẻ biểu tượng, không có chữ Đúng/Sai. Vì vậy câu `true_false` luôn có `image` của cả câu, vẽ đúng vật được nói tới. `prompt` là một câu khẳng định ngắn về vật đó. Không dùng câu phủ định ("not", "không"): bé phải nghe kịp thêm chữ "không", và khi đáp án là Sai thì thành phủ định hai lần. Để trống `labels.*` *(đề xuất, chờ PM chốt)*, vì Explorer không hiện nhãn chữ.
   - Kiểm: máy báo `age_image_required` khi câu thiếu `image`; người duyệt kiểm câu phủ định và `labels`.
   - Đạt: `image.brief: [ảnh] Một con dơi đang bay lúc chập tối, nền trời đơn giản, không có chữ. Từ khoá tìm ảnh (EN): bat flying dusk sky` · `prompt.en: A bat is a bird.` · `prompt.vi: Con dơi là một loài chim.` · `answer: false`. Câu này cũng hợp làm câu misconception ở câu 6.
   - Không đạt: không có `image` · `prompt.en: A bat is not a bird.` · `answer: true`.
6. **Gợi ý và giải thích viết để app tự đọc.** App tự đọc `hint` khi bé chọn sai, và đọc `explanation_correct` hoặc `explanation_wrong` khi xong câu. Mỗi câu tối đa 8 từ, như câu hỏi. `hint` chỉ vào một điều nhìn thấy trong hình, không nói thẳng đáp án. Không nhắc tới chữ trên màn hay vị trí thẻ ("the second card", "the top one"), vì iPhone xếp thẻ dọc còn iPad xếp một hàng. `explanation_wrong` nói tên đáp án, vì app làm sáng thẻ đúng cùng lúc. Bản tiếng Việt viết để nghe: số bằng chữ, không ký hiệu, không viết tắt.
   - Kiểm: máy cảnh báo `age_words_en`; người duyệt đọc to từng câu.
   - Đạt, cho câu `Which one is a bird?` (ba thẻ: con gà mái, con mèo, cá rô đồng): `hint.en: Look for feathers and a beak.` · `hint.vi: Em tìm con có lông vũ và có mỏ nhé.` · `explanation_wrong.en: The answer is the hen. It has feathers.` · `explanation_wrong.vi: Đáp án là con gà. Gà có lông vũ.`
   - Không đạt: `hint.en: Read the words under the pictures.` · `explanation_wrong.en: Oops! Try the second card next time.`
7. **Không cần đọc nhãn mới phân biệt được.** Các lựa chọn trong một câu phải khác nhau rõ bằng mắt: khác hình dáng, khác nhóm. Không đặt hai hình gần giống nhau mà chỉ có tên là khác. Hỏi điều bé nhìn ra được (bộ phận, chỗ sống, thức ăn), không hỏi tên riêng của những loài trông giống nhau.
   - Kiểm (người duyệt): đặt các `image.brief` cạnh nhau, che `label`: vẫn chỉ ra được thẻ nào là vật nào.
   - Đạt: `prompt.en: Which one is a fish?` · `prompt.vi: Con nào là cá?` · ba thẻ hình: cá rô đồng, ếch đồng, con vịt.
   - Không đạt: `prompt.en: Which one is a carp?` · ba thẻ hình: cá chép, cá rô phi, cá trắm. Ba con cá trông gần giống nhau; chỉ đọc nhãn mới biết thẻ nào là cá chép.

**Bảng luật theo nhóm tuổi** *(nháp AI)*

Số lấy từ SK-026, mục "Đặc tả theo nhóm tuổi", chỉ với 6 format hiện có. Cột "Khoá" là khoá trong `content/rules.json`, ở `<nhóm>.authoring`, theo hình dạng gợi ý trong SK-026; dev đổi tên khoá thì sửa cột này.

| Luật | Khoá | Explorer 5–7 | Discoverer 7–9 | Scientist 9–11 |
| --- | --- | --- | --- | --- |
| Format ở Khởi động | `warmup_formats` | `single_choice` (chọn hình), `true_false` (biểu tượng) | `single_choice`, `multi_choice`, `true_false`, `fill_blank_bank` | `single_choice`, `multi_choice`, `true_false`, `fill_blank_bank` |
| Format ở Quiz | `quiz_formats` | `single_choice` (chọn hình), `true_false` (biểu tượng), `order_sequence` (sắp hình).<br>Không dùng `multi_choice`, `fill_blank_bank`, `picture_bar_chart` | Cả 6: `single_choice`, `multi_choice`, `true_false`, `fill_blank_bank`, `order_sequence`, `picture_bar_chart` | Cả 6, như Discoverer |
| Số lựa chọn hoặc số thẻ | `option_count` | `single_choice`: 2–3 lựa chọn<br>`order_sequence`: 3 thẻ | `single_choice`: 3–4 lựa chọn<br>`picture_bar_chart`: 3–4 lựa chọn<br>`multi_choice`: tối đa 6 lựa chọn<br>`order_sequence`: 3–5 thẻ | `single_choice`: 4 lựa chọn<br>`multi_choice`: tối đa 6 lựa chọn<br>`order_sequence`: 3–6 thẻ<br>`picture_bar_chart`: 4 lựa chọn |
| Bắt buộc có hình | `image_required` | Mọi `#### option` của `single_choice`.<br>Mọi `#### item` của `order_sequence`.<br>Câu `true_false` có `image` của cả câu.<br>Cộng luật hình SK-033 (đoạn **Hình**) | Theo đoạn **Hình** (SK-033); `rules.json` để trống, máy cảnh báo khi dev bật luật SK-033 | Như Discoverer |
| DOK 1·2·3 trong 6 câu Quiz | `dok_mix` | 3·3·0 | 2·3·1 | 1·3·2 |
| DOK của câu 1 | `first_item_dok` | 1 | 1 | 1 |
| Số câu misconception | `misconception_items` | Đúng 1, đặt ở câu 6, bằng hình | Đúng 1 | 1–2 |
| Số format khác nhau trong 6 câu Quiz, tối thiểu | `min_formats` | 2 | 3 | 3 |
| Số từ EN tối đa mỗi câu | `max_words_en` | 8 | 10 | 15 (soạn nhắm 12) |

- Khoảng "2–3" tính cả hai đầu. "Đúng 1" là không hơn, không kém.
- Số lựa chọn và chỗ bắt buộc có hình áp cho cả Khởi động và Quiz. DOK, số câu misconception và số format chỉ tính 6 câu Quiz.
- `true_false` luôn có đúng 2 lựa chọn (schema), nên bảng không ghi số này.
- Người duyệt kiểm, máy chưa kiểm: câu misconception của Explorer đặt ở câu 6; số từ trên một màn (mục "Chữ cho trẻ" ở trên).
- Chưa có luật theo tuổi, chỉ có giới hạn của schema: số lựa chọn tối thiểu của `multi_choice` (schema: 2), số từ trong ngân hàng `fill_blank_bank`, số cột của `picture_bar_chart`.
- Hai ô của Scientist chốt theo đề xuất của content-editor (phiên chính, 1/11): `picture_bar_chart` 4 lựa chọn; số từ mỗi câu tối đa 15, soạn nhắm 12. Khớp `authoring` trong `content/rules.json`.
- Format của GĐ 2 (`sort_into_groups`, `fill_blank_free`, `evidence_choice`) chưa có trong schema nên chưa vào bảng.

**Máy kiểm (GĐ 0)** *(nháp AI)*: `content-cli validate` và `content-cli build` đọc `<nhóm>.authoring` trong `content/rules.json`, rồi kiểm bảng trên ở từng bài (`validate` đọc thẳng markdown, bước 3 ở trên; `build` đọc JSON), theo `age_group` của chủ đề. Lỗi báo theo mã `age_*` (bảng mã ở SK-026, mục "Phạm vi theo agent › GĐ 0 › dev"); có lỗi thì `build` dừng, không ra gói. `age_words_en` và `age_dok_order` chỉ là cảnh báo, không chặn `build`, nhưng biên tập vẫn sửa, trừ khi ghi lý do giữ lại bằng dòng `>`. `build` còn báo `format_not_rendered` khi bài dùng format mà bản app chưa hiện được: bản 0.1.0 chưa hiện `order_sequence` và `picture_bar_chart`. Bảy luật Explorer ở trên phần lớn do người duyệt kiểm; máy chỉ bắt thiếu hình, sai số lựa chọn, sai format và câu quá dài.

**[CẦN KIỂM]**
- Số liệu hay khẳng định khoa học chưa chắc: thêm dòng `> [CẦN KIỂM] <điều cần kiểm>` ngay dưới trường đó và chép sang ticket. Trường nằm trong frontmatter thì ghi dòng đó ở mục Ghi chú.
- Không bao giờ viết `[CẦN KIỂM]` trong giá trị (trẻ sẽ thấy). Bài còn `[CẦN KIỂM]` thì chưa phát hành.

**`ai_draft`**
- `true` khi AI viết bản nháp hoặc viết lại phần lớn bài.
- Chỉ Duy hoặc người duyệt chuyên môn đổi sang `false`, sau khi đã đọc duyệt cả bài.
- Biên tập tự viết từ đầu thì để `false`.

## B. Khung bài

Chép nguyên khối dưới đây. Dấu `…` là chỗ điền. Mẫu theo từng `format` và từng block nằm ở mục C.

````markdown
---
id:
topic: <slug chủ đề, trùng tên thư mục>
slug: <slug bài>
order: 1
stage: opener
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: …
vi: …

## Mục tiêu
en: I can …
vi: Em …

## Ý chính
1.en: …
1.vi: …
2.en: …
2.vi: …
3.en: …
3.vi: …

## Khởi động

### w1
id:
format: true_false
version: 1
dok: 1
recall_from.kind: prior_knowledge
recall_from.note.en: …
recall_from.note.vi: …
prompt.en: …
prompt.vi: …
image.brief: [ảnh] … Từ khoá tìm ảnh (EN): …
image.alt.en: …
image.alt.vi: …
answer: false
hint.en: …
hint.vi: …
explanation_correct.en: …
explanation_correct.vi: …
explanation_wrong.en: …
explanation_wrong.vi: …

## Học

### explore
id:
type: explore_groups
version: 1
…

## Chơi

> Mô tả ngắn mini-game cho người duyệt.

### tray
id:
type: build_tray
version: 1
…

## Quiz

### q1
id:
format: single_choice
version: 1
dok: 1
prompt.en: …
prompt.vi: …
image.brief: [ảnh] … Từ khoá tìm ảnh (EN): …
image.alt.en: …
image.alt.vi: …
hint.en: …
hint.vi: …
explanation_correct.en: …
explanation_correct.vi: …
explanation_wrong.en: …
explanation_wrong.vi: …

#### option q1_…
correct: true
label.en: …
label.vi: …
image.brief: [ảnh] … Từ khoá tìm ảnh (EN): …
image.alt.en: …
image.alt.vi: …

> … q2 đến q6, mỗi câu một `###`

## Từ vựng

### …
id:
tier: core
term.en: …
term.vi: …
example.en: …
example.vi: …
image.brief: [ảnh] … Từ khoá tìm ảnh (EN): …
image.alt.en: …
image.alt.vi: …

## Thưởng

### …
id:
set: food
rarity: common
name.en: …
name.vi: …
tag.en: …
tag.vi: …
fact.en: …
fact.vi: …
image.brief: [ảnh] … Từ khoá tìm ảnh (EN): …
image.alt.en: …
image.alt.vi: …

## Ghi chú cho hoạ sĩ

Chữ tự do: ảnh cần tìm, hình dùng lại, chỗ khó tìm ảnh thật và phương án thay, đề xuất sửa màn.

## Ghi chú cho dev

Chữ tự do: block type, asset cần, chỗ lệch canvas, đề xuất schema.
````

Khung `_topic.md`:

````markdown
---
id:
slug: <slug chủ đề, trùng tên thư mục>
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
is_free: false
oak_unit_ref: …
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: …
vi: …

## Câu hỏi lớn
en: …
vi: …

## Misconceptions

### <key>
id:
statement.en: …
statement.vi: …
correction.en: …
correction.vi: …
note: …

## Ghi chú

Chữ tự do cho người duyệt và dev.
````

Giá trị cho phép: `age_group` = `explorer` · `discoverer` · `scientist`. `strand` = `plants_animals` · `living_environment` · `humans_health` · `materials` · `energy_forces` · `earth_sky`. `level` 1–5. Mỗi ô `difficulty` 1–3 (rubric syllabus-progression mục 3, thứ tự A-B-C-D-E). `prerequisites` là danh sách slug chủ đề tiên quyết, viết trên một dòng: `prerequisites: []` hoặc `prerequisites: [slug-a, slug-b]` (không viết dạng `- slug` nhiều dòng). `stage` = `opener` · `core` · `apply` · `review`.

## C. Mẫu theo `format` và block

Chỉ ghi phần riêng; phần chung của câu quiz (`id`, `format`, `version`, `dok`, `prompt`, `image` của câu, `hint`, `explanation_*`) như q1 ở mục B. Mỗi `####` con có đủ các dòng ghi dưới nó.

````markdown
### qx
format: single_choice            (multi_choice: y hệt, nhiều option có correct: true)
#### option qx_a
correct: true
label.en: …
label.vi: …
image.brief: [ảnh] … Từ khoá tìm ảnh (EN): …   (bắt buộc, đoạn Hình ở mục A)
image.alt.en: …
image.alt.vi: …
#### option qx_b
correct: false
feedback.en: …                   (SK-044: vì sao lựa chọn này chưa đúng; chỉ lựa chọn sai)
feedback.vi: …
label.en: …
label.vi: …
image.brief: …
image.alt.en: …
image.alt.vi: …

### qx
format: true_false
answer: false
instruction.en: Challenge: check Na's idea   (câu 6 có lời Na, mọi chủ đề)
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: …                  (không bắt buộc: lời nhân vật)
statement.vi: …
speaker: na                      (không bắt buộc)
labels.true.en: …                (không bắt buộc: thay nhãn Đúng/Sai mặc định)
labels.true.vi: …
labels.false.en: …
labels.false.vi: …
feedback_true.en: …              (SK-044, tên tạm: khi bé chạm Đúng mà đáp án là Sai)
feedback_true.vi: …
feedback_false.en: …             (khi bé chạm Sai mà đáp án là Đúng; chỉ viết phía bé có thể chọn nhầm)
feedback_false.vi: …

### qx
format: fill_blank_bank
sentence.en: Animals need food, water and {1} to live.
sentence.vi: Động vật cần thức ăn, nước và {1} để sống.   (tiếng Việt cũng để ô trống `{n}` ở đúng chỗ, để phụ đề không lộ đáp án)
answers: qx_air                  (phần tử thứ nhất là đáp án ô {1}, thứ hai cho ô {2}…)
#### bank qx_air
label.en: air
label.vi: không khí
image.brief: [ảnh] Bọt khí nổi trong cốc nước trong, chụp cận, nền trơn, không có chữ. Từ khoá tìm ảnh (EN): air bubbles water glass   (bắt buộc, mỗi thẻ từ một hình)
image.alt.en: Air bubbles in a glass of water
image.alt.vi: Bọt khí trong cốc nước

### qx
format: order_sequence
answer: qx_seed, qx_sprout, qx_plant   (thứ tự đúng)
#### item qx_seed
label.en: …
label.vi: …
image.brief: …                   (viết hình cho mọi item; Explorer bắt buộc)
image.alt.en: …
image.alt.vi: …

### qx
format: picture_bar_chart
chart.title.en: …                (không bắt buộc)
chart.title.vi: …
chart.unit.en: …                 (không bắt buộc)
chart.unit.vi: …
#### bar qx_bar_mango
label.en: …
label.vi: …
value: 7
#### option qx_mango             (như single_choice)
correct: true
label.en: …
label.vi: …

### explore
type: explore_groups
prompt.en: …
prompt.vi: …
complete_when: all_seen
#### group explore_carb           (2–6 nhóm)
label.en: …
label.vi: …
color: vang_hoe                  (do_son · vang_hoe · gi_dong · cham · nau_dat)
sentence.en: …
sentence.vi: …
image.brief: …
image.alt.en: …
image.alt.vi: …
examples.1.en: …                 (1–4 món, đánh số 1, 2, 3, 4)
examples.1.vi: …

### card
type: sentence_card
text.en: …
text.vi: …
image.brief: …                   (image.* không bắt buộc)
image.alt.en: …
image.alt.vi: …

### new_words
type: word_list
title.en: New words              (không bắt buộc)
title.vi: Từ mới
term_keys: nutrient, carbohydrate

### tray
type: build_tray
prompt.en: …
prompt.vi: …
capacity: 4
success_when: all_required_and_no_limit
messages.start.en: …   messages.balanced.*   messages.has_limited.*
messages.full.en: No more room! Tap one to take it off.   (chữ chung mọi bài, khớp nhãn "tap one to take it off · chạm vào để bỏ ra" của app; lời nhắn không gọi tên vật chứa: tray, mâm, khay)
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.missing.<key nhóm required>.en: …
#### group tray_carb
label.en: …
label.vi: …
color: vang_hoe
role: required                   (required · limit · neutral)
#### item tray_rice
label.en: …
label.vi: …
group: tray_carb
image.brief: [ảnh] … Từ khoá tìm ảnh (EN): …   (bắt buộc)
image.alt.en: …
image.alt.vi: …
````

(Ghi chú trong ngoặc ở mục C chỉ để giải thích, không chép vào bài. Mỗi `messages.*` viết thành hai dòng `.en` và `.vi` riêng.)

## D. Bảng ánh xạ markdown → trường SK-001

"Máy" là lệnh `import` của `content-cli` (SK-027): đọc markdown, ghi JSON schema v1 vào `content/.build/json/`. JSON là sản phẩm dẫn xuất, không sửa tay. Máy chỉ ghi `kind` và `schema_version`, không tự điền giá trị mặc định. `[n]` là số thứ tự trong danh sách.

**Kiểu chung**

| Chỗ trong markdown | Trường SK-001 | Ghi chú |
| --- | --- | --- |
| `<tên>.en:` + `<tên>.vi:` | `Text` / `Spoken` `{ en, vi }` | Cả hai không rỗng |
| (không viết) | `Spoken.audio.en`, `Spoken.audio.vi` | Máy điền khi chạy `tts` |
| `<tên>.brief:` | `Image.brief` | Bỏ đi khi đóng gói |
| `<tên>.alt.en:` + `<tên>.alt.vi:` | `Image.alt` | Bắt buộc khi có hình |
| (không viết) | `Image.asset` | Máy điền khi chạy `assets` |
| `id:` (bài mới để trống) | `id` (`Uuid`) | Lệnh `ids` sinh và ghi vào file; đã có thì không đổi |
| tên sau `###` / sau `#### <loại>` | `key` (`Key`) | Duy nhất trong bài |
| `color:` | `ColorToken` | `do_son` · `vang_hoe` · `gi_dong` · `cham` · `nau_dat` |
| `true` / `false`, số nguyên | boolean, number | Viết thường, không ngoặc kép |
| dòng `> …`, mục Ghi chú | (không có) | Máy bỏ qua |

**Topic** (`_topic.md`)

| Chỗ trong markdown | Trường SK-001 |
| --- | --- |
| tên file `_topic.md` | `kind: "topic"` |
| (máy ghi) | `schema_version` = 1 |
| frontmatter `id` · `slug` · `age_group` · `order` · `strand` · `level` · `is_free` · `oak_unit_ref` · `sensitive` · `archived` · `ai_draft` | trường cùng tên |
| frontmatter `difficulty.abstraction` · `.prior_knowledge` · `.misconception` · `.vocabulary` · `.science_skill` | `difficulty.*` cùng tên |
| frontmatter `prerequisites` (danh sách slug) | `prerequisite_topic_ids` (máy đổi slug → `id` của topic đó) |
| `## Tiêu đề` → `en:` / `vi:` | `title` |
| `## Câu hỏi lớn` → `en:` / `vi:` | `question` |
| `## Misconceptions` → mỗi `### <key>` | `misconceptions[]` |

**Misconception** (dưới `## Misconceptions`)

| Chỗ trong markdown | Trường SK-001 |
| --- | --- |
| `id:` · `### <key>` | `id` · `key` (duy nhất trong chủ đề) |
| `statement.en/.vi` | `statement` (`Text`) |
| `correction.en/.vi` | `correction` (`Text`) |
| `note:` | `note` (nội bộ, một dòng) |

**Lesson** (`<nn>-<slug>.md`)

| Chỗ trong markdown | Trường SK-001 |
| --- | --- |
| tên file `<nn>-<slug>.md` | `kind: "lesson"` |
| (máy ghi) | `schema_version` = 1 |
| frontmatter `id` · `slug` · `order` · `stage` · `est_minutes` · `sensitive` · `archived` · `ai_draft` | trường cùng tên |
| frontmatter `topic` (slug) | `topic_id` (máy lấy `id` trong `_topic.md` cùng thư mục) |
| `## Tiêu đề` → `en:` / `vi:` | `title` |
| `## Mục tiêu` → `en:` / `vi:` | `objective` |
| `## Ý chính` → `1.en` … `3.vi` | `key_points[0..2]` (đúng 3) |
| `## Khởi động` → mỗi `###` | `warmup[]` (0–3 QuizItem) |
| `## Học` → mỗi `###` | `learn[]` (≥ 1 block, theo thứ tự trong file) |
| `## Chơi` → một `###` | `play` (đúng 1 block) |
| `## Quiz` → mỗi `###` | `quiz[]` (đúng 6) |
| `## Từ vựng` → mỗi `###` | `vocab[]` (4–8) |
| `## Thưởng` → `###` (0 hoặc 1) | `reward.collectible` (trống thì `reward: {}`) |
| `## Ghi chú cho hoạ sĩ`, `## Ghi chú cho dev` | (không có) |

**QuizItem, phần chung** (dưới `## Khởi động` và `## Quiz`)

| Chỗ trong markdown | Trường SK-001 |
| --- | --- |
| `id:` · `### <key>` | `id` · `key` |
| `format:` · `version:` · `dok:` | `format` · `version` · `dok` |
| `prompt.*` · `instruction.*` · `hint.*` | `prompt` · `instruction?` · `hint` |
| `image.brief` · `image.alt.*` | `image?` |
| `explanation_correct.*` · `explanation_wrong.*` | `explanation_correct` · `explanation_wrong` |
| `misconception: <key>` | `misconception_id` (máy đổi key → `id` của misconception trong `_topic.md`) |
| (không viết) | `p_correct` (điền sau beta) |
| `recall_from.kind:` | `recall_from.kind` (bắt buộc ở Khởi động, cấm ở Quiz) |
| `recall_from.note.en/.vi` | `recall_from.note` (khi kind = `prior_knowledge`) |
| `recall_from.lesson: <slug chủ đề>/<slug bài>` | `recall_from.lesson_id` (khi kind = `lesson`; máy đổi sang `id`) |

**QuizItem, theo `format`**

| `format` | Chỗ trong markdown | Trường SK-001 |
| --- | --- | --- |
| `single_choice` | mỗi `#### option <key>`: `correct:` · `label.*` · `image.*` | `options[]`: `key` · `correct` · `label` · `image?` (đúng 1 `correct: true`) |
| `multi_choice` | như `single_choice` | `options[]` (≥ 1 đúng, ≥ 1 sai) |
| `true_false` | `answer:` · `statement.*` · `speaker:` · `labels.true.*` · `labels.false.*` | `answer` · `statement?` · `speaker?` · `labels?.true` · `labels?.false` |
| `fill_blank_bank` | `sentence.*` (ô trống `{1}`, `{2}` trong `en`, và ở đúng chỗ đó trong `vi`) · `answers: k1, k2` · mỗi `#### bank <key>`: `label.*` · `image.*` | `sentence` · `answers[]` · `bank[]`: `key` · `label` · `image?` |
| `order_sequence` | mỗi `#### item <key>`: `label.*` · `image.*` · `answer: k1, k2, k3` | `items[]`: `key` · `label` · `image?` · `answer[]` |
| `picture_bar_chart` | `chart.title.*` · `chart.unit.*` · mỗi `#### bar <key>`: `label.*` · `image.*` · `value:` · và các `#### option` | `chart.title?` · `chart.unit?` · `chart.bars[]`: `key` · `label` · `image?` · `value` · `options[]` |

**Block, phần chung** (dưới `## Học` và `## Chơi`)

| Chỗ trong markdown | Trường SK-001 |
| --- | --- |
| `id:` · `### <key>` | `id` · `key` |
| `type:` · `version:` · `min_app_version:` | `type` · `version` · `min_app_version?` |

**Block, theo `type`**

| `type` | Chỗ trong markdown | Trường SK-001 |
| --- | --- | --- |
| `explore_groups` | `prompt.*` · `complete_when:` · mỗi `#### group <key>`: `label.*` · `color:` · `sentence.*` · `image.*` · `examples.<n>.*` | `prompt` · `complete_when` · `groups[]`: `key` · `label` · `color` · `sentence` · `image?` · `examples[n-1]` |
| `sentence_card` | `text.*` · `image.*` | `text` · `image?` |
| `word_list` | `title.*` · `term_keys: k1, k2` | `title?` · `term_keys[]` (key trong `## Từ vựng`) |
| `build_tray` | `prompt.*` · `capacity:` · `success_when:` · `messages.start.*` · `messages.full.*` · `messages.balanced.*` · `messages.has_limited.*` · `messages.missing.<key nhóm>.*` · mỗi `#### group <key>`: `label.*` · `color:` · `role:` · mỗi `#### item <key>`: `label.*` · `group:` · `image.*` | `prompt` · `capacity` · `success_when` · `messages.start` · `.full` · `.balanced` · `.has_limited` · `.missing.<key nhóm>` · `groups[]`: `key` · `label` · `color` · `role` · `items[]`: `key` · `label` · `group` · `image?` |

**VocabTerm** (dưới `## Từ vựng`)

| Chỗ trong markdown | Trường SK-001 |
| --- | --- |
| `id:` · `### <key>` | `id` · `key` |
| `term.en` (từ tiếng Anh) · `term.vi` (nghĩa) | `term` |
| `example.*` | `example` |
| `image.*` | `image?` |
| `tier:` | `tier` (`core` · `extra`; để trống thì JSON không có trường này, app hiểu là `core`) |

**Collectible** (dưới `## Thưởng`)

| Chỗ trong markdown | Trường SK-001 |
| --- | --- |
| `id:` · `### <key>` | `id` · `key` |
| `set:` | `set` (key của bộ thẻ, ví dụ `food`) |
| `name.*` · `tag.*` · `fact.*` | `name` · `tag?` · `fact` ("Em có biết?") |
| `image.*` | `image` (bắt buộc) |
| `rarity:` | `rarity` (`common` · `rare`; để trống thì JSON không có trường này, app hiểu là `common`) |
