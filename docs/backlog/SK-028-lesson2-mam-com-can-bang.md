# SK-028 · Bài 2 "Mâm cơm cân bằng" (Ăn uống lành mạnh), bài đầu tiên đi trọn đường markdown

Trạng thái: done (2/11: bài 2 đi trọn đường markdown → gói, `validate` 0 lỗi, `check-pack` OK; nội dung vẫn là nháp AI, chờ duyệt chuyên môn và Duy nghe) · Ngày: 2026-11-02 · Phụ trách: content-editor (soạn), phiên chính (chạy lệnh `content-cli` theo SK-027 quyết định 7) · Tester: tester
Nguồn: Duy 2/11 ("Giao luôn"); `_topic.md` của chủ đề (danh sách 5 bài theo canvas Discoverer-Topic); syllabus-progression.md mục 6 (bài 2: mô tả, so sánh, phân loại) và mục 7; `content/TEMPLATE.md`; `content/rules.json` (`authoring.discoverer`); SK-026 (luật theo tuổi); SK-027 (`validate`, `ids`, `import`)

## Mục tiêu
content-editor soạn bài 2 của chủ đề Ăn uống lành mạnh bằng markdown; phiên chính đưa bài qua `validate` → `ids` → `import` → `tts` EN/VI → `build`. Đây là lần chạy thật đầu tiên của đường markdown trước khi soạn hàng loạt từ 10/11.

## Phạm vi
- `content/discoverer/an-uong-lanh-manh/02-<slug>.md`; sửa `_topic.md` nếu bài cần misconception mới.
- content-editor sửa TEMPLATE mục A (bước 3, đoạn "id và key") và `content/README.md` theo lệnh mới của SK-027 và cách làm "phiên chính chạy hộ".
- Phiên chính chạy lệnh, chuyển dòng lỗi cho content-editor, lặp tới khi sạch; sinh clip và build gói vào thư mục tạm (không ghi đè `content/.build/pack` mà app đang nhúng).

## Ngoài phạm vi
- Nhúng gói mới vào app iOS, hình giấy cắt thật của bài 2 (designer, sau khi Duy duyệt đợt 1 của SK-018), duyệt chuyên môn dinh dưỡng.

## Tiêu chí nghiệm thu
- [ ] Bài theo TEMPLATE, đánh dấu `ai_draft: true`, chỗ cần chuyên gia xem có `[CẦN KIỂM]`.
- [ ] Quiz chỉ dùng format app 0.1.0 hiện được: `single_choice`, `multi_choice`, `true_false`, `fill_blank_bank`.
- [ ] `validate` thư mục chủ đề: 0 lỗi. Cảnh báo (nếu có) dán vào ticket, content-editor xem từng cái.
- [ ] `ids` điền đủ id; chạy lại `validate` vẫn 0 lỗi; `import` ra JSON bài 1 không đổi so với fixture.
- [ ] `tts --lang en` và `--lang vi` sinh đủ clip cho bài 2; bài 1 dùng lại cache 100%.
- [ ] `build` ra gói có cả hai bài, `check-pack.sh` OK.
- [ ] Tester rà bài 2 theo luật Discoverer và TEMPLATE (đọc chữ, không chỉ chạy máy).

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở
- Phụ thuộc: SK-027 (done 2/11), SK-026 (done GĐ 0).
- Câu hỏi còn mở: ghi khi soạn.

## Kết quả

### content-editor (2/11): soạn bài 2, sửa TEMPLATE và README

Trạng thái: nháp AI (`ai_draft: true`), chờ phiên chính chạy `validate`. Agent không chạy được lệnh nào, nên bài **chưa qua máy kiểm**. Tôi đã tự đếm số từ, số lựa chọn, DOK và key theo `rules.discoverer.authoring` và content-schema.

**File**
- Mới: `content/discoverer/an-uong-lanh-manh/02-mam-com-can-bang.md`. Mọi dòng `id:` để trống (frontmatter và 17 khối `###`).
- Sửa `content/discoverer/an-uong-lanh-manh/_topic.md`: thêm misconception `one_food_enough`, `id:` để trống, kèm `note`.
- Sửa `content/TEMPLATE.md`:
  - mục A: bước 2 (mục nào máy bắt buộc), bước 3 (lệnh `validate`, `ids` và cách làm "phiên chính chạy hộ"), đoạn "id và key";
  - theo bốn đề xuất cho content-editor ở SK-027: đoạn "Máy kiểm" (validate đọc markdown), cách viết `prerequisites`, mục D (đoạn mở đầu, dòng `id`, `tier`, `rarity`: máy không tự điền mặc định).
- Sửa `content/README.md`: thêm mục "Kiểm bài".

**Dàn ý bài 2** (`stage: core`, tám phút)
- Mục tiêu: "I can tell which meal is balanced." / "Em nhận ra được bữa ăn nào cân bằng."
- Ý chính:
  1. bữa cân bằng có nhiều nhóm;
  2. cơm, rau và quả là phần nhiều nhất;
  3. không món nào có đủ mọi chất.
- Khởi động: hai câu ôn bài một.
  - w1 `single_choice`: cơm, bánh mì, khoai lang thuộc nhóm nào.
  - w2 `true_false`: cơ thể cần một ít chất béo.
- Học: `explore_groups` ba nhóm theo lượng ("Phần nhiều nhất", "Phần ít hơn", "Chỉ một chút"), rồi `word_list` (balanced, meal, mix).
- Chơi: `build_tray`, mâm bốn chỗ, bốn nhóm bắt buộc (đạm, rau, quả, bột đường) và đồ ngọt là `limit`. Kệ có tám món, ba món mới.
  - Yêu cầu mới so với bài một: mỗi nhóm đúng một món; hai món cùng nhóm thì mâm không đạt.
  - Lý do vẫn dùng `build_tray`: ở Chơi, schema v1 và app 0.1.0 chỉ có block này.
- Quiz, sáu câu, bốn format:

  | Câu | Format | DOK | Nội dung |
  | --- | --- | --- | --- |
  | q1 | `single_choice` | 1 | bữa cân bằng có gì |
  | q2 | `fill_blank_bank` | 1 | cơm, rau và quả là phần {1} |
  | q3 | `single_choice` | 2 | so ba mâm, chọn mâm cân bằng |
  | q4 | `multi_choice` | 2 | bữa sáng xôi: món nào thêm nhóm mới |
  | q5 | `single_choice` | 2 | bát nhiều thịt: phần nào nên nhiều hơn |
  | q6 | `true_false` | 3 | Na: "Chỉ ăn rau là đủ", misconception `one_food_enough` |
- Thưởng: thẻ thanh long ("mọc trên một loại cây xương rồng").

**Chỗ `[CẦN KIỂM]`** (dòng trong file)
- `02-mam-com-can-bang.md`:
  - **dòng 104:** ba mức lượng (nhiều nhất, ít hơn, chỉ một chút) so với tháp dinh dưỡng của Viện Dinh dưỡng cho trẻ sáu đến mười một tuổi; quả có thuộc "phần nhiều nhất" không. Cùng ý này ở Ý chính hai, q2 và q5.
  - **dòng 141:** gộp dầu ăn với đường và muối vào "chỉ một chút" có làm trẻ hiểu thành chất béo có hại không.
  - **dòng 209:** coi quả tráng miệng là phần bắt buộc của mâm cân bằng.
  - **dòng 445:** câu q5 dùng chữ "nên" (cơm và rau nhiều hơn thịt).
- `_topic.md` dòng 46: cách nói "không có món nào có đủ mọi chất dinh dưỡng", đối chiếu sách Khoa học lớp bốn. Ý "trẻ hay nghĩ như vậy" chưa có nguồn.
- Không đánh dấu thẻ thanh long: thanh long là quả của một loài xương rồng, và Việt Nam trồng nhiều thanh long. Hai ý này biên tập chắc.

**Ảnh hưởng ra ngoài `content/`** (phiên chính và dev cần biết)
- Thêm misconception làm đổi `topic.json`. Ba test ở `tools/content-cli/test/markdown.test.ts` sẽ đỏ tới khi dev sinh lại fixture:
  - dòng 112: so `topic.json` với fixture;
  - dòng 127: so bản chép `_topic.md`;
  - dòng 143: chạy CLI `import`.
- File cần sinh lại: `packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/topic.json` và `tools/content-cli/test/fixtures/markdown/valid/discoverer/an-uong-lanh-manh/_topic.md`.
- JSON của bài một không đổi.
- Mỗi lần bài sau thêm misconception đều gặp lại chuyện này. Đề xuất PM: test chỉ so bài một, hoặc ghi vào quy trình "đổi `_topic.md` thì dev sinh lại fixture".
- Dòng 112 cũng kiểm cả thư mục chủ đề, nên sẽ đỏ tới khi bài 2 có id và `validate` sạch.

**Phương án B** (nếu Duy không muốn đổi `_topic.md` lúc này): giữ `all_fat_bad`, sửa hai câu.
- q6:
  - `misconception: all_fat_bad`
  - `statement.en: We need just a little oil. So no fat is even better.` / `statement.vi: Dầu ăn chỉ cần một chút. Vậy không ăn chất béo còn tốt hơn.`
  - `hint` như w2 hiện nay.
  - `explanation_correct.en: Just a little is not none. We need some fat.`
  - `explanation_wrong.en: Na is not right. Our body needs a little fat.`
- w2 đổi thành `Vegetables and fruit give us vitamins and minerals.` (`answer: true`), để không trùng q6.
- Ý chính ba vẫn nằm ở lời nhắn mâm đạt. Câu "chỉ ăn một món tốt là đủ" thì không còn được gắn mã misconception.

**Câu hỏi cho Duy**
1. Mâm cân bằng có bắt buộc quả tráng miệng không (bốn nhóm, quả tách khỏi rau)? Nếu không, Chơi quay về ba nhóm như bài một, và phải tìm yêu cầu mới khác.
2. Misconception mới `one_food_enough` hay phương án B (`all_fat_bad`)? Chọn misconception mới thì dev phải sinh lại fixture.
3. Tiêu đề EN: "A balanced meal" có được không?

**Đề xuất cho vùng khác** (biên tập không tự sửa)
- ios-dev:
  - App 0.1.0 không hiện `sentence_card` và `key_points` (`LessonSession.swift` dòng 115–122). Đề xuất hiện `sentence_card` trước đợt soạn từ 10/11.
  - Xác nhận mâm năm chỗ có vừa iPhone không: 382pt so với 350pt. Bài một đề xuất nhóm chất béo `neutral` ở bài 2; tôi chưa làm và chuyển sang bài ba, lý do ở Ghi chú cho dev của bài.
- PM: chốt cách đếm số từ EN của màn Chơi. Bài một khoảng 36 từ, bài 2 khoảng 39 từ, phần lớn là tên món có hình.
- Designer:
  - Nhóm Quả dùng `gi_dong` như nhóm Rau (chỉ có năm token).
  - Màn Học có ba ô nhóm.
  - Dòng điều kiện của màn Chơi có bốn nhóm.
  - Khi có hình thật, q3 và q5 có thể thành câu chọn hình.
- Bài một (không gấp, đổi thì phải sinh lại fixture): thẻ thưởng có `name.en: water spinach` viết thường, trong khi `name.vi: Rau muống` viết hoa. Đề xuất "Water spinach".

### Phiên chính chạy lệnh (2/11)

Thư mục tạm: `scratchpad/sk028/` (đường dẫn đầy đủ trong log của phiên). `content/.build/pack` mà app đang nhúng không đổi.

| Bước | Kết quả |
| --- | --- |
| `validate` lần 1 | 0 lỗi nội dung. 2 dòng `md_id_missing` (đúng ý: id để trống) và 3 cảnh báo `md_needs_check` |
| `ids` | 19 id mới: 18 ở bài 2 (frontmatter và 17 khối), 1 ở `_topic.md` (`one_food_enough`) |
| `validate` lần 2 | 0 lỗi · 3 cảnh báo `md_needs_check` (bài 1: 5 dòng, bài 2: 4 dòng, `_topic.md`: 2 dòng) |
| `import` | Ra 3 file JSON. `01-thuc-an-cho-ta-nhung-gi.json` trùng từng byte với fixture |
| `tts --lang en` | 244 chuỗi, 190 clip khác nhau: sinh mới 83, dùng lại 107 (bài 1 trúng cache 100%). 1 phút 1 s |
| `tts --lang vi` | 196 clip khác nhau: sinh mới 86, dùng lại 110. Tự kiểm bằng ASR: còn 5 clip bị đánh dấu, gồm 3 clip cũ của bài 1 và 2 clip mới của bài 2 (xem dưới). 9 phút 57 s |
| `build` | `content_version` `e6dac4f4bdeb`, chủ đề version `9887fcce9632`, 2 bài, 377 asset (en 181, vi 196), gói 9,2 MB. 3 cảnh báo `ai_draft` |
| `check-pack.sh` | OK: 378 file khớp manifest, không thừa, không thiếu |

**Hai clip VI mới bị máy đánh dấu** (người cần nghe, có thể chỉ là máy nghe nhầm giọng miền Nam):
- `play/messages/missing/tray_protein` "Thêm một món giàu chất đạm…": máy nghe "giàu" thành "dầu". Bài 1 có cùng hiện tượng ở "Cá giàu chất đạm."
- `quiz/5/explanation_wrong` "Na chưa đúng…": máy nghe tên "Na" thành "Nà".

**File nghe thử:** `scratchpad/sk028/review/review-02.m4a` (EN, 19 clip, 59 s) và `review-02-vi.m4a` (VI: 5 clip bị đánh dấu đứng đầu, rồi các clip theo thứ tự bài).

**Còn chờ:**
- Duy trả lời 3 câu hỏi của content-editor ở trên.
- `npm test` của `tools/content-cli` sẽ đỏ ở 3 test so fixture `topic.json` (do `_topic.md` thêm misconception). Nếu Duy chọn misconception mới thì dev sinh lại fixture; nếu chọn phương án B thì content-editor xoá khối `one_food_enough` và test xanh lại.
- Tester rà bài 2 bằng cách đọc chữ.

### Duy chốt 3 câu hỏi (2/11, theo đề xuất)
1. Mâm cân bằng ở phần Chơi có 4 nhóm bắt buộc, gồm quả tráng miệng. Giữ như bản nháp; tỉ lệ vẫn `[CẦN KIỂM]` cho chuyên gia.
2. Câu 6 dùng misconception mới `one_food_enough`. Dev sinh lại fixture `topic.json` và bản chép `_topic.md` trong test của `content-cli`.
3. Tiêu đề EN "A balanced meal".

### Rà nội dung bài 2 (tester, 2/11)

Phạm vi: đọc chữ `02-mam-com-can-bang.md` và phần `one_food_enough` trong `_topic.md`, đối chiếu TEMPLATE mục A, bài 1, `rules.json`. Không nghe clip (chỉ đọc chữ), không chạy lại `validate`, không đụng simulator. Số dòng là của `02-mam-com-can-bang.md` trừ khi ghi khác.

**Tổng: 17 phát hiện = 2 lỗi nội dung · 7 nên sửa · 8 góp ý.**

#### Lỗi nội dung

**R1 · lỗi nội dung · dòng 359 (q3 `explanation_wrong.vi`)**
- Hiện tại: "Đáp án là **mâm cơm**, đậu phụ, cà rốt và chuối."
- Sai: lựa chọn đúng là "Cơm, đậu phụ, cà rốt, chuối". "Mâm cơm" ở đây đọc thành một món (cả cái mâm) và không khớp bản EN "The answer is rice, tofu, carrot and banana."
- Sửa: "Đáp án là cơm, đậu phụ, cà rốt và chuối. Mâm này có đủ các nhóm."

**R2 · lỗi nội dung · dòng 43–44 (w1 `hint`)**
- Hiện tại: "This group gives us energy to run and play." / "Nhóm này cho mình năng lượng để chạy nhảy, vui chơi."
- Sai: bài 1 dạy chất béo cũng "cho năng lượng" (bài 1 dòng 135–136, 515). Lựa chọn `w1_fat` cũng khớp gợi ý, nên gợi ý không phân biệt bột đường với chất béo và dẫn bé sang lựa chọn sai.
- Sửa: bỏ ý "năng lượng", chỉ trỏ về bài trước. VD "Think of the bowl of rice from the last lesson." / "Em nhớ lại bát cơm ở bài trước nhé." Giữ "năng lượng" ở `explanation_*` được, vì lúc đó đã chọn xong.

#### Nên sửa

**R3 · nên sửa · dòng 162–163, 175–190, 204–209 so với bài 1 dòng 190–197, 207–211 (nghĩa của "mâm cân bằng" đổi giữa hai bài)**
- Bài 1: "Cơm + cá + chuối" ra "Tuyệt! Mâm cơm cân bằng rồi" (chuối tính là rau hoặc quả). Bài 2: cùng ba món đó thiếu rau, không đạt.
- Phần Học bài 2 không nói bốn nhóm, nên bé chỉ biết "quả tách khỏi rau" khi xếp thử ở Chơi. Câu hỏi q1, q3, q4 ("nhóm khác nhau", "nhóm mới") phụ thuộc vào cách chia này.
- Sửa nhỏ: thêm một câu vào `messages.start` để báo đổi luật. VD EN "Fruit has its own place now. One food for each group." / VI "Giờ quả có chỗ riêng. Mỗi nhóm em chọn một món nhé." Nếu muốn thêm ở Học thì cần `sentence_card` (app 0.1.0 chưa hiện). PM xem nên ghi vào bài 1 rằng "cân bằng" là khái niệm mở rộng dần.

**R4 · nên sửa · dòng 26–27, 87–88, 179–180 (ý chính 3 chưa được dạy trước q6)**
- Ghi chú dòng 88 nói ý 3 nằm "ở lời nhắn mâm đạt". Lời nhắn đó là "Mỗi nhóm giúp cơ thể em theo một cách riêng", không nói "không món nào có đủ mọi chất".
- Kết quả: bé gặp ý 3 lần đầu ở `explanation_correct` của q6, tức sau khi đã bị hỏi.
- Sửa: lời nhắn `balanced` thêm ý đó. VD EN "Great! No one food has every nutrient. A mix does!" (10 từ) / VI "Tuyệt! Không món nào có đủ mọi chất. Cả mâm thì có!"

**R5 · nên sửa · dòng 467–473 (q6 lệch với `one_food_enough`)**
- Statement nói "chỉ ăn **rau**", nhưng rau là một nhóm, gồm nhiều món (rau muống, cải…). Misconception và giải thích lại nói "không có **món** nào đủ mọi chất". Bé có thể đáp "ăn đủ loại rau thì được" rồi vẫn trả lời sai đúng chỗ.
- Sửa: hoặc đổi statement sang một món cụ thể, VD "Water spinach is healthy. Eating only water spinach is enough." / "Rau muống rất tốt cho sức khoẻ. Chỉ ăn rau muống thôi là đủ." (rau muống có hình sẵn, dùng lại được); hoặc đổi giải thích thành "No single food or group has every nutrient." Phương án đầu sát misconception hơn.

**R6 · nên sửa · dòng 183–190 (`messages.missing.*` khi mâm đã đầy)**
- Mâm 4 chỗ và 4 nhóm bắt buộc, nên mọi mâm sai không có đồ ngọt đều có đủ 4 món, không còn chỗ trống. VD cơm, khoai lang, gà, rau muống: lời nhắn là "Thêm quả để tráng miệng nhé!" nhưng không thể thêm. Lời `full` chỉ hiện khi bé chạm thêm lần nữa (ghi chú dev dòng 587 đã biết).
- Bé hai món cùng nhóm không được nói là "trùng nhóm". Bài 1 còn dư một chỗ nên không gặp.
- Sửa: đổi `missing.*` thành câu đúng cả khi mâm đầy lẫn chưa đầy, không dùng "Thêm/Add". VD fruit: "Your tray needs fruit!" / "Mâm còn thiếu quả nhé!" (bài 1 đã dùng kiểu "Mâm còn thiếu rau hoặc quả!"). Nếu muốn nói "đổi món" thì cần luật app riêng (ios-dev/dev).

**R7 · nên sửa · dòng 101, 120, 138 so với bài 1 dòng 102, 118, 134 (màu ở màn Học)**
- Bài 1: bột đường `vang_hoe`, đạm `do_son`, chất béo `nau_dat`, rau quả `gi_dong`, đồ ngọt `cham`. Bài 2 Học: "Phần nhiều nhất" (có cơm) tô `gi_dong`; "Chỉ một chút" (dầu ăn, đường, muối) tô `cham`.
- Hậu quả: cơm xanh ở Học nhưng vàng ở Chơi; dầu ăn mang màu đồ ngọt, dễ củng cố "chất béo xấu như kẹo" (`all_fat_bad`), đúng điều bài này phải tránh.
- Sửa: không để cùng một màu mang hai nghĩa. Đề xuất cho designer: một token trung tính hoặc ba độ đậm nhạt của một màu cho ba ô "lượng". Nếu chưa có thì ít nhất bỏ `cham` khỏi ô dầu ăn. Chỗ này `color` nằm trong markdown (content-editor) nhưng token thuộc designer.

**R8 · nên sửa · dòng 434–435 (q5 trình bày bát của Bin như một lỗi)**
- "Bát cơm của Bin có rất nhiều thịt. Phần nào nên nhiều hơn?" ngầm nói bát của Bin sai. Bé nhà hay ăn nhiều thịt có thể thấy mình bị chê (yêu cầu mục 4: không làm trẻ xấu hổ về đồ ăn ở nhà). Ghi chú dòng 445 nói "câu không chê Bin" nhưng chữ "nên" chỉ vào bát của Bin.
- Sửa: đưa về mục tiêu của Bin. VD EN "Bin wants a balanced bowl. What should be bigger?" (8 từ) / VI "Bin muốn bát cơm cân bằng hơn. Phần nào nên nhiều hơn?" Hình giữ nguyên.

**R9 · nên sửa · dòng 392 (q4 `explanation_correct.vi`)**
- Hiện tại: "Chuối cho thêm **hoa quả**." EN: "Banana adds fruit." Cả bài dùng "quả" (nhãn nhóm, lời nhắn "Thêm quả…"); "hoa quả" lẻ loi và nghe như thêm món chứ không phải thêm nhóm.
- Sửa: "Chuối cho thêm nhóm quả." (và có thể "Trứng cho thêm nhóm chất đạm." cho đều, đã đúng bản EN).

#### Góp ý

**R10 · góp ý · dòng 78–79 (w2 `hint`), 480–481 (q6 `hint`)**
- w2: gợi ý gần như nêu thẳng "chất béo có ích" nên bé đoán đúng mà không cần nhớ "một ít". q6: "Can vegetables give us every nutrient?" là câu hỏi tu từ, đáp án đã nằm trong câu.
- Đề xuất q6: "Think about fish and eggs. Do vegetables give the same?" / "Em nghĩ tới cá và trứng. Rau có cho giống vậy không?" (sau khi sửa R5, đổi cho khớp). w2 giữ cũng được vì là câu ôn.

**R11 · góp ý · dòng 335–345 (q2 ngân hàng từ), 328–329 (hint)**
- "sweetest/ngọt nhất" là lựa chọn vô nghĩa; quả thì ngọt, nên "ngọt nhất" lại hơi có lý với "Cơm, rau và quả". Hint "more rice than oil or sugar" đã dẫn tới "biggest".
- Đề xuất đổi `sweetest` thành `tiny` / `bé xíu`. Hint để nguyên được.

**R12 · góp ý · dòng 511–517 (từ `mix`)**
- `term.vi: kết hợp` và ví dụ "Mình ăn kết hợp nhiều loại thức ăn." hơi gượng. Sách và truyền thông dinh dưỡng thường nói "ăn phối hợp nhiều loại thức ăn" (theo trí nhớ, chưa tra, nên thêm `[CẦN KIỂM]` nhỏ nếu đổi). Đề xuất `term.vi: phối hợp` và ví dụ "Mình ăn phối hợp nhiều loại thức ăn." Nhớ đổi đồng bộ ở dòng 299, 483, 485 nếu muốn nhất quán.

**R13 · góp ý · dòng 184 ("giàu chất đạm"), 485 ("Na chưa đúng")**
- Tôi chưa nghe clip, nên chỉ có ý kiến theo chữ.
- "giàu": hai clip bị đánh dấu đều do máy nghe giọng miền Nam. Bài 1 cũng có ("Cá giàu chất đạm", dòng 195, 552). Đừng sửa bài 2 trước khi có người nghe. Nếu nghe ra "dầu" thật, đổi ở cả hai bài: "Thêm một món có nhiều chất đạm, như đậu phụ hay thịt gà nhé!"
- "Na": tên nhân vật cố định cả app, và q6 bài 1 cũng "Na chưa đúng". Giữ "Na". Nếu nghe sai, chỉ đổi `explanation_wrong.vi` sang "Bạn Na chưa đúng." (có chữ "bạn" giúp giọng đọc hiểu là tên), còn nhãn nút giữ nguyên.

**R14 · góp ý · dòng 434–435, 382–383 (tên riêng "Bin", "Lan")**
- Bản EN: "Bin" đọc ra như chữ bin (thùng rác) với giọng Anh. Đây là tên bạn nhỏ, nhưng bé nghe EN trước dễ ngờ. Nếu đổi: "Bo" hoặc "Bình"/"Binh" tuỳ giọng đọc. "Lan" không vấn đề. Chỉ là cảnh báo, chưa nghe thử.

**R15 · góp ý · dòng 171–222 (số từ EN màn Chơi)**
- Khoảng 39 từ so với giới hạn 30 từ một màn (bài 1 khoảng 36, cũng vượt). Phần lớn là tên món. Biên tập đã chuyển PM. Tôi ghi lại vì sau R3, R6 lời nhắn dài hơn thì thêm vài từ nữa.

**R16 · góp ý · `[CẦN KIỂM]` còn thiếu**
- q6 (dòng 482) và ý chính 3 (dòng 26): khẳng định "không có món nào đủ mọi chất" chỉ có `[CẦN KIỂM]` ở `_topic.md` dòng 46. Theo TEMPLATE, đánh dấu ngay dưới trường dùng. Thêm một dòng `> [CẦN KIỂM]` dưới q6 hoặc ghi "xem `_topic.md`".
- `_topic.md` dòng 44: "không có món ăn nào có đủ mọi chất" đúng cho trẻ lớn, nhưng sữa mẹ với trẻ sơ sinh là ngoại lệ; không ảnh hưởng nhóm 7–9, chỉ để chuyên gia biết.
- Dòng 162, 177–190: quy tắc "bữa nào cũng có quả" (kể cả "Thêm quả để tráng miệng") có thể làm bé nhà không có quả mỗi bữa thấy mâm nhà mình "chưa cân bằng". Đã có `[CẦN KIỂM]` dòng 209 về dinh dưỡng; thêm góc "không làm xấu hổ": lời nhắn nên nói về mâm trò chơi, không nói về bữa thật.

**R17 · góp ý · dòng 198–208 (màu nhóm Rau và Quả giống nhau)**
- Hai chip `gi_dong` đứng cạnh nhau trên cùng một màn, bé không phân biệt bằng màu được. Biên tập và designer đã biết (chỉ có năm token). Ghi lại để khỏi bị coi là lỗi khi thử trên máy.

#### Đã kiểm, không có lỗi

- Đáp án: w1 (carb), w2 (true), q1 (nhóm khác nhau), q2 (biggest), q3 (cơm, đậu phụ, cà rốt, chuối; hai mâm sai đều thiếu đúng một nhóm), q4 (trứng, chuối; bánh mì và bún cùng nhóm với xôi), q5 (cơm và rau), q6 (false). Mỗi câu đúng một cách hiểu; đã thử từng lựa chọn sai, không có lựa chọn nào đúng ngầm.
- Phân loại món ở Chơi: cơm, khoai lang = bột đường; gà, đậu phụ = đạm; rau muống = rau; thanh long, chuối = quả; bánh kem = đồ ngọt. Không món gây tranh cãi. Có 8 cách xếp đạt (2×2×1×2); mọi mâm có bánh kem rơi vào lời `has_limited`.
- Khớp bài 1: tên nhóm (Chất đạm, Chất bột đường, Chất béo), cách gọi, màu ở Chơi, câu w2 nhắc lại "một ít chất béo" đúng bài 1. Không có chỗ nào dạy chất béo là xấu. Thanh long thật sự là quả của một loài xương rồng; Việt Nam là nước trồng và xuất khẩu nhiều.
- EN và VI: cùng nghĩa ở mọi chuỗi tôi đối chiếu (khác duy nhất: R1 và q4 prompt EN bỏ "breakfast" nhưng `alt` có). Không dùng "—". Dấu và chính tả đúng; "khoẻ" theo kiểu bài 1.
- DOK 1·1·2·2·2·3; câu 1 DOK 1; đúng một misconception; bốn format; vị trí đáp án đã trộn; mọi hình có `alt`.

**Chưa kiểm:** nghe clip (người cần nghe hai clip bị đánh dấu); hiển thị trên máy (chip bốn nhóm, lưới ba ô); chạy lại `validate` sau khi sửa R1–R17.

#### Kết luận

Bài **đạt để content-editor sửa nhỏ**, không cần soạn lại phần nào. Làm theo thứ tự: R1 và R2 (chữ sai thật) → R3, R4, R5, R6, R8 (đổi vài chuỗi, không đổi cấu trúc) → R9 → phần còn lại tuỳ chọn. R7 cần designer; R6 nếu muốn "đổi món" thì cần ios-dev. Sau khi sửa, phiên chính chạy lại `validate`, `tts` (chỉ clip đổi) và `build`; sửa R12 hoặc R13 sẽ làm đổi nhiều clip VI.

### dev (2/11): sinh lại fixture

Lý do: `_topic.md` có thêm misconception `one_food_enough`, nên 3 test của `content-cli` đỏ (270/273). Không sửa `content/`, `apps/`. Không commit.

**Đã làm**
1. **`packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/topic.json` sinh lại bằng `import`, không chép tay** (SK-027 quyết định 2).
   - Lệnh: `npm run import -- ../../content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md --out <scratch>/sk028/json`, gồm topic và bài 1. Exit 0, 0 lỗi.
   - So với fixture cũ, chỉ khác một chỗ: thêm object `misconceptions[1]` (`e8da090c-…`, `one_food_enough`). Fixture nay trùng từng byte đầu ra `import`.
   - `01-thuc-an-cho-ta-nhung-gi.json`: `cmp` trùng fixture, không đổi.
2. **`packages/content-schema/fixtures/invalid/*.json` (19 file) sinh lại** bằng `node scripts/make-invalid-fixtures.mjs`, theo README của content-schema ("sau khi sửa bài mẫu… chạy để sinh lại").
   - `uuid-bad-format.json` là file duy nhất dựa trên topic, nên phải sinh lại.
   - 18 file dựa trên bài 1 vốn đã cũ từ trước: sinh từ bài 1 trước lần đổi `{1}` trong `sentence.vi` và lần đổi thứ tự nhóm mâm. Nay mỗi file lại đúng là "bài mẫu hiện tại + một đột biến".
   - Đột biến, pointer và `test/invalid-fixtures.json` không đổi: chạy script trên bản chép trong scratchpad thì file này ra trùng từng byte.
3. **`tools/content-cli/test/fixtures/markdown/valid/discoverer/an-uong-lanh-manh/_topic.md`** chép lại từ `content/`, nay trùng từng byte. Bài 1 không đổi.
4. **`tools/content-cli/test/markdown.test.ts`**: test chỉ còn gắn với `_topic.md` và bài 1.
   - Test A1 và test `import` (spawn) chạy trên bản chép riêng `_topic.md` + `01-…md` lấy từ `content/`; test spawn kiểm thư mục ra chỉ có `topic.json` và `01-….json`. Ý nghĩa A1 giữ nguyên: bài 1 trong `content/` ra trùng từng byte hai fixture.
   - Test README chạy `validate` trên file bài 1 từ gốc repo, thay cho cả thư mục chủ đề.
   - Test D5 (cả `content/` dưới 2 s) chỉ đo giờ: chấp nhận exit 0 hoặc 1, vì một bài đang soạn có thể còn lỗi.
   - Hai chỗ ghi cứng dòng `[CẦN KIỂM]` của `_topic.md`: 43 thành 46. `_topic.md` nay có 2 dòng (46, 52).
5. **`tools/content-cli/README.md`** (mục Markdown, đoạn Fixture): thêm quy trình "đổi `_topic.md` hoặc bài 1 thì dev sinh lại fixture", gồm năm lệnh, và nhắc báo ios-dev.

**Có thêm bài 2 vào fixture và bản chép test không: không.**
- Fixture `packages/content-schema` là dữ liệu test của schema. Thêm bài 2 (`ai_draft: true`, đang rà R1–R13) thì mỗi lần sửa bài 2 lại đỏ test, đúng điều cần tránh.
- Các ca lỗi B1/B4 của SK-027 viết trên bài 1; bài 2 trong bản chép sẽ chen thêm cảnh báo và số dòng không liên quan.
- Bài 2 đã được máy kiểm khi phiên chính chạy `validate`/`import`/`build`; kiểm cả kho để CI làm sau.
- Kết quả: bài 3, 4, 5… thêm vào `content/` không làm đỏ test, trừ khi đổi `_topic.md` hoặc bài 1. Còn một ràng buộc nhỏ: test README chạy trên `content/`, nên bài khác chép trùng id của bài 1 sẽ làm nó báo `md_id_duplicate`. Đây là lỗi nội dung thật.

**Kết quả test**
- `tools/content-cli` `npm test`: **273 pass, 0 fail**.
- `packages/content-schema` `npm test`: **97 pass, 1 fail**. Test đỏ: `test/refs.test.mjs` dòng 45–48, "misconception keys are unique within the topic".
  - Test chép `misconceptions[0]`, thêm vào cuối, rồi ghi cứng pointer `/misconceptions/1/key`. Topic nay có 2 misconception nên bản trùng nằm ở chỉ số 2.
  - Lỗi do test giả định topic chỉ có 1 misconception, không phải do fixture sai. Máy vẫn bắt đúng key trùng, chỉ khác chỉ số.
  - **Chưa sửa:** file nằm ngoài vùng được giao (`packages/content-schema/test/`).
  - Sửa đề xuất, một dòng: `only(…, \`/misconceptions/${topic.misconceptions.length - 1}/key\`)`. Đã thử trên bản chép package trong scratchpad, cùng fixture mới: **98 pass, 0 fail**.
  - Cần phiên chính hoặc Duy cho phép thì dev sửa.
  - **Đã sửa sau khi phiên chính đồng ý (2/11):** `packages/content-schema/test/refs.test.mjs` dòng 47, pointer nay là `` `/misconceptions/${topic.misconceptions.length - 1}/key` ``. `packages/content-schema` `npm test`: **98 pass, 0 fail**. `ContentModelTests.swift` dòng 117 do ios-dev sửa.

**App iOS có dùng fixture này** (chỉ grep, không sửa `apps/`). Cần ios-dev biết:
- `apps/ios/Packages/SKKit/Tests/ContentModelTests/ContentModelTests.swift` dòng 117: `#expect(topic.misconceptions.map(\.key) == ["all_fat_bad"])` **sẽ đỏ**. Giá trị mới là `["all_fat_bad", "one_food_enough"]`. ios-dev sửa dòng này.
- Cùng file, `invalidFixturesNeverCrash` (dòng 335) đọc mọi file `fixtures/invalid/`. Đột biến và pointer không đổi, nên kỳ vọng không đổi; chưa chạy được test Swift (không simulator).
- Đọc cả `topic.json` nhưng chỉ kiểm giá trị không đổi (id, title, question, level, lessons): `ContentLibraryTests.swift` (`loadsTheFixtures`, `leavesOutWhatItCannotShow`), `ContentPackTests.swift` (gói tự dựng từ fixture), `OnboardingTests.swift` (`fixturesAreBundled`, `packMatchesTheFixtures`, so bài 1).
- App nhúng `packages/content-schema/fixtures/valid` làm nội dung dự phòng (`project.yml` dòng 50). Topic dự phòng nay có 2 misconception; app chỉ giải mã thêm một phần tử.

**File đã đổi:** `packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/topic.json`, `packages/content-schema/fixtures/invalid/*.json` (19), `tools/content-cli/test/fixtures/markdown/valid/discoverer/an-uong-lanh-manh/_topic.md`, `tools/content-cli/test/markdown.test.ts`, `tools/content-cli/README.md`. `tools/content-cli/tts-vi/variants.json` đang có thay đổi chưa commit nhưng không do lần này (có lẽ từ lần chạy `tts --lang vi` của phiên chính).

### content-editor sửa theo rà (2/11)

Chỉ sửa `content/discoverer/an-uong-lanh-manh/02-mam-com-can-bang.md`.
- Không đổi, không thêm, không xoá dòng `id:` nào: vẫn 18 dòng. Không có khối mới, **không cần chạy `ids`**.
- Không sửa `_topic.md` và bài 1.
- Một key con đổi tên: `#### bank q2_sweetest` thành `q2_smaller`. Ngân hàng từ không có id, bài chưa phát hành.
- Chưa chạy lại `validate`. Câu EN nào đổi chữ, tôi đã đếm lại số từ: mọi câu tối đa 10 từ; mọi màn Khởi động và Quiz tối đa 30 từ (q6 là 30). DOK, số lựa chọn và format không đổi.

Số dòng trong bảng là dòng **sau khi sửa**.

| Mã | Quyết định | Dòng | Đã làm, hoặc lý do |
| --- | --- | --- | --- |
| R1 | Sửa | 365 | q3 `explanation_wrong.vi`: "Đáp án là cơm, đậu phụ, cà rốt và chuối. Mâm này có đủ các nhóm." |
| R2 | Sửa | 43–44 | w1 `hint` theo đề xuất của tester: "Think of the bowl of rice from the last lesson." / "Em nhớ lại bát cơm ở bài trước nhé." Ý "năng lượng" chỉ còn ở phần giải thích. |
| R3 | Sửa | 176–178 | `messages.start`: "Now fruit has its own group. Pick one food for each group." / "Giờ quả có nhóm riêng. Mỗi nhóm em chọn một món nhé." Thêm dòng `>` nói rõ luật đổi so với bài một. Ý "cân bằng mở rộng dần" ở bài một: chuyển PM. |
| R4 | Sửa | 181–183 | `messages.balanced`: "Great! No single food has every nutrient. So we eat a mix." / "Tuyệt! Không món nào có đủ mọi chất dinh dưỡng. Vì vậy mình ăn phối hợp nhiều món." Không dùng câu "Cả mâm thì có!" tester gợi ý, vì nói quá: một mâm bốn món chưa chắc có đủ mọi chất. Sửa ghi chú ở dòng 88. |
| R5 | Sửa | 479–480, 492–493 | Na nói về một món cụ thể: "Water spinach is healthy. Eating only water spinach is enough." / "Rau muống rất tốt cho sức khoẻ. Chỉ ăn rau muống thôi là đủ." `explanation_wrong`: "Na is not right. Water spinach is great, but not enough." / "Na chưa đúng. Rau muống rất tốt, nhưng chỉ ăn rau muống thì chưa đủ." |
| R6 | Sửa | 186–194 | Bốn lời nhắn `missing.*` thành "Your tray needs …" / "Mâm còn thiếu …", đúng cả khi mâm đầy lẫn chưa đầy. Lời nhắn riêng cho "hai món cùng nhóm" cần khoá `messages` mới và luật engine mới: chuyển dev và ios-dev, ghi ở Ghi chú cho dev (không gấp). |
| R7 | Sửa một phần, phần còn lại chuyển designer | 138–139 | Ô "Chỉ một chút" đổi `cham` thành `nau_dat` (màu chất béo ở bài một), để dầu ăn không mang màu đồ ngọt. Dùng màu có sẵn, không làm sai nghĩa. Cơm ở Học mang màu xanh còn ở Chơi mang màu vàng: chưa sửa được bằng token hiện có. Đề xuất designer một token trung tính hoặc ba độ đậm nhạt cho ba ô "lượng" (Ghi chú cho hoạ sĩ). |
| R8 | Sửa | 440–441, 452 | q5 nói theo mục tiêu của bạn nhỏ: "Nam wants a more balanced bowl. Which part should be bigger?" / "Nam muốn bát cơm cân bằng hơn. Phần nào nên nhiều hơn?" Hình giữ nguyên, không vẽ người. Ở app 0.1.0 hình là hình giữ chỗ, nhưng câu vẫn trả lời được. Màn có 29 từ. |
| R9 | Sửa | 398 | q4 `explanation_correct.vi`: "Trứng cho thêm nhóm chất đạm. Chuối cho thêm nhóm quả." EN giữ. |
| R10 | Sửa q6, giữ w2 | 487–488 | q6 `hint`: "Think about fish and rice. Does water spinach give the same?" / "Em nghĩ tới cá và cơm. Rau muống có cho mình giống vậy không?" w2 giữ (câu ôn). Gợi ý thay cho w2 là "nhớ thử thách của Na" sẽ thêm một chữ "Na" vào clip tiếng Việt, đúng chỗ đang chờ nghe ở R13. |
| R11 | Sửa | 339–353 | Ngân hàng q2: `smaller` / "ít hơn" thay `sweetest` / "ngọt nhất". Không chọn "tiny", vì nó trùng nghĩa với "smallest", hai lựa chọn sai sẽ giống nhau. Ba từ bây giờ ứng với ba ô ở phần Học. Key đổi `q2_sweetest` thành `q2_smaller`; `answers: q2_biggest` không đổi. |
| R12 | Sửa | 524–527, 303, 490, 182 | `mix`: `term.vi: phối hợp`, ví dụ "Mình ăn phối hợp nhiều loại thức ăn." Đổi đồng bộ ở q1 và q6 (`explanation_correct.vi`) và lời nhắn mâm đạt. Thêm `[CẦN KIỂM]` ở dòng 527 (theo trí nhớ, chưa tra). `correction.vi` của `one_food_enough` trong `_topic.md` còn chữ "kết hợp": xem đề xuất dưới bảng. |
| R13 | Giữ | 187, 493 | Giữ "giàu" và "Na" tới khi Duy nghe clip. Lời nhắn đạm vẫn có chữ "giàu" ("Mâm còn thiếu một món giàu chất đạm…"). |
| R14 | Sửa | 440–442, 452 | "Bin" đổi thành "Nam" (bạn Nam ở bài một, giọng EN đọc rõ). Đổi cả tên trong `image.brief` và Ghi chú cho hoạ sĩ. |
| R15 | Chuyển PM | Ghi chú cho dev | Màn Chơi nay khoảng 43 từ EN; lời nhắn `start` dài nhất (13 từ). PM chốt cách đếm màn Chơi. |
| R16 | Sửa | 491, 213 | Thêm `[CẦN KIỂM]` dưới q6 (dòng 491), trỏ `_topic.md`, ghi cả Ý chính ba và `messages.balanced`. Thêm góc "không làm xấu hổ" vào `[CẦN KIỂM]` dòng 213: lời nhắn chỉ nói về mâm của trò chơi. Ý sữa mẹ là ngoại lệ thuộc `_topic.md`: xem đề xuất dưới bảng. |
| R17 | Giữ, chuyển designer | 204–212, Ghi chú cho hoạ sĩ | Nhóm Rau và Quả cùng `gi_dong`. Chỉ còn `nau_dat` hoặc `cham` mà hai màu này mang nghĩa chất béo, đồ ngọt, nên không đổi. Ghi chú cho hoạ sĩ đã ghi R17. |

**Đề xuất sửa `_topic.md`** (không tự sửa, vì dev đang sinh lại fixture từ file này). Gộp vào lần đổi `_topic.md` sau:
- `one_food_enough`, `correction.vi`: "kết hợp" thành "phối hợp", cho khớp bài 2 (R12).
- `one_food_enough`, thêm vào dòng `[CẦN KIỂM]` (dòng 46): "Ngoại lệ: sữa mẹ với trẻ sơ sinh; không ảnh hưởng nhóm bảy đến chín tuổi" (R16).
- `one_food_enough`, `note`: thêm "lời nhắn mâm đạt" vào chỗ sửa ("Sửa ở bài hai: lời nhắn mâm đạt, mâm bốn nhóm, câu sáu").

**Clip cần sinh lại:**
- EN: w1 `hint`; `messages.start`, `messages.balanced`, bốn `messages.missing.*`; bank q2 `smaller`; q5 `prompt`; q6 `statement`, `hint`, `explanation_wrong`.
- VI: các chuỗi trên, cộng w1 `hint`, q1 `explanation_correct`, q3 `explanation_wrong`, q4 `explanation_correct`, q6 `explanation_correct`, từ `mix` (`term`, `example`).
- R12 và R16 thêm hai dòng `[CẦN KIỂM]`: cảnh báo `md_needs_check` của bài 2 nay liệt kê 6 dòng (104, 142, 213, 451, 491, 527).

### ios-dev (2/11): test theo fixture mới

- **Đã sửa:** `apps/ios/Packages/SKKit/Tests/ContentModelTests/ContentModelTests.swift` dòng 117 (`topicValues`). Giá trị chờ đổi từ `["all_fat_bad"]` thành `["all_fat_bad", "one_food_enough"]`. Không sửa code app, gói nhúng hay file nào khác.
- **Đã rà:** không test iOS nào khác đếm misconception hay ghi cứng chỉ số trong `topic.json`. `ContentLibraryTests`, `ContentPackTests` và `OnboardingTests` chỉ chép nguyên file hoặc đọc id, slug, title. `invalidFixturesNeverCrash` chờ `uuid-bad-format.json` báo lỗi ở `/misconceptions/0/id`. Id hỏng vẫn nằm ở phần tử 0 nên dòng này không đổi.
- **Cách chạy:** không dùng được `swift test` trên macOS, vì SKKit chỉ khai `.iOS(.v17)` và DesignSystem dùng UIKit. Đã chạy một lần trên iPhone 16 Pro đang bật sẵn, không boot hay tắt máy nào:
  ```
  xcodebuild test -project ScienceKids.xcodeproj -scheme ScienceKids \
    -destination 'id=14DF158D-5ED6-49CF-80A5-7519B0D594F5' \
    -derivedDataPath <scratchpad>/sk028-ios/dd \
    -only-testing:ContentModelTests -only-testing:ContentKitTests
  ```
  **Kết quả:** `ContentModelTests` 20 pass, 0 fail. `ContentKitTests` 18 pass, 0 fail. `** TEST SUCCEEDED **`. Build nhúng gói hiện có ở `content/.build/pack` (212 file, chưa có bài 2).
- **Lỗi build có sẵn, không do lần này, chưa sửa:** khi build vào DerivedData mặc định, build phase "Embed content pack" báo đỏ: `Sandbox: cp deny(1) file-write-create …/ScienceKids.app/pack/catalog`. Nguyên nhân là `ENABLE_USER_SCRIPT_SANDBOXING: YES` chỉ cho script ghi đúng đường dẫn output đã khai (`…/ScienceKids.app/pack`, luật `literal`), không cho ghi vào thư mục con. Hai lần chạy đầu không có `-derivedDataPath` nên dừng ở bước build, chưa chạy test nào. Khi đặt `-derivedDataPath` trong `/tmp` như SK-026 thì build qua. Chưa xác minh vì sao. Xcode IDE dùng chung DerivedData mặc định nên nhiều khả năng cũng gặp lỗi này, nhưng chưa kiểm. Đề xuất cho ios-dev ở ticket sau: đặt `ENABLE_USER_SCRIPT_SANDBOXING: NO` riêng cho target `ScienceKids` trong `project.yml` và ghi chú lý do.

### Phiên chính chạy lại sau khi sửa (2/11)
- `validate`: 0 lỗi, 3 cảnh báo `md_needs_check` (bài 2 nay có 6 dòng: 104, 142, 213, 451, 491, 527). Không có khối mới nên không chạy `ids`.
- `import`: `topic.json` và bài 1 trùng từng byte với fixture mới.
- `tts --lang en`: 190 clip khác nhau, sinh mới 12. `tts --lang vi`: 196 clip khác nhau, sinh mới 18. Hai clip VI mới bị đánh dấu ở lần trước đã đổi chữ nên không còn. Còn đánh dấu 3 clip cũ của bài 1 ("làm" nghe thành "là", "trầy" nghe thành "chày", "giàu" nghe thành "dầu"), chờ Duy nghe như trước.
- `build`: `content_version` `9b0ee28d5bbb`, chủ đề version `aa1e7d8cb35d`, 2 bài, gói 9,3 MB. `check-pack.sh` OK.
- Test: `content-cli` 273/273, `content-schema` 98/98, iOS `ContentModelTests` 20/20 và `ContentKitTests` 18/18.

### Kết luận (phiên chính, 2/11)
Đóng ticket cho mục tiêu "bài đầu tiên đi trọn đường markdown". Bản sửa theo rà R1–R17 chưa được tester đọc lại; đọc lại cùng đợt duyệt chuyên môn.

**Còn mở, không chặn soạn bài 3–5:**
- Duyệt chuyên môn 6 dòng `[CẦN KIỂM]` của bài 2 và 2 dòng của `_topic.md`.
- Duy nghe `review-02.m4a` và `review-02-vi.m4a` mới.
- Designer: token màu trung tính cho ba ô "lượng" ở Học (R7), màu riêng cho nhóm Quả (R17).
- PM: cách đếm số từ EN trên màn Chơi (R15, khoảng 43 từ).
- dev và ios-dev: lời nhắn riêng cho "hai món cùng nhóm" ở `build_tray` cần luật app mới (R6).
- `_topic.md`: 3 đề xuất chữ của content-editor; sửa thì dev sinh lại fixture theo README.
- Nhúng gói 2 bài vào app: chưa làm.
- ~~Lỗi build có sẵn khi dùng DerivedData mặc định (`ENABLE_USER_SCRIPT_SANDBOXING`), ios-dev ghi ở trên.~~ Đã sửa 2/11: target `ScienceKids` tắt sandbox script, chi tiết ở cuối [SK-016](SK-016-ios-audio-content-kit.md).
