# SK-049 · Soạn chủ đề Explorer #6 Cơ thể của em (6 bài, Oak Y1 Human body parts)

Trạng thái: review · Ngày: 2026-11-17 · Phụ trách: content-editor (soạn) · designer (ảnh) · phiên chính chạy lệnh · Tester: tester
Nguồn: Duy 17/11 (dán ý chính lesson 3, 4 của Oak; "thêm 1 chủ đề về human body cho explorer… body parts và những senses"; rồi "bật mode auto làm luôn, ko cần hỏi gì thêm"); [docs/oak/human-body-parts.md](../oak/human-body-parts.md) (sườn Oak đủ 6 lesson, đọc 17/11); `content/syllabus.json` (Explorer #6, key `human-body-parts`); `syllabus.md` mục 3; `syllabus-lessons.md` Explorer #6; `content/TEMPLATE.md` (bảy luật Explorer, mục SK-044, SK-047); `content/rules.json` (`explorer.authoring`); SK-041, SK-045, SK-046, SK-048 (khuôn soạn, rà chữ, ảnh); SK-033 (ảnh)

## Mục tiêu

Bé Explorer 5–7 tuổi biết con người là một loài động vật, gọi tên được bộ phận bên ngoài và vài bộ phận bên trong cơ thể kèm việc của chúng, và nối được năm giác quan với mắt, tai, mũi, lưỡi, da, chỉ bằng nghe và nhìn.

## Phạm vi / Ngoài phạm vi

### Phạm vi
- Chủ đề **đã có trong danh mục** là Explorer #6 *Human body parts · Cơ thể của em* (6 bài, chưa soạn). Không thêm chủ đề mới, không đổi số đếm (vẫn 46 chủ đề, 394 bài; Explorer 13 / 83).
  > **Ghi chú 17/11 (pm):** số đếm "46 / 394, Explorer 13 / 83" đổi theo [SK-050](SK-050-explorer-weather-and-seasons.md): danh mục nay 45 chủ đề, 390 bài; Explorer 12 / 79. Chủ đề này vẫn là #6, key `human-body-parts`, `order: 6` không đổi; ticket này vẫn không đổi số đếm. Test iOS ghi cứng số đếm sửa một lượt chung với SK-050.
- `content/explorer/co-the-cua-em/`: `_topic.md` và 6 bài, đúng 6 lesson Oak theo thứ tự, không gộp, không bỏ:

  | # | Bài (EN · VI, khớp `content/syllabus.json`) | Lesson Oak | `stage` | Misconception (key) |
  | --- | --- | --- | --- | --- |
  | 1 | Humans are animals · Con người cũng là động vật | `humans-are-animals` | `opener` | `humans_not_animals` (Oak lesson 1) |
  | 2 | Body parts on the outside · Bộ phận bên ngoài cơ thể | `body-parts-on-the-outside` | `core` | `body_is_one_part` (Oak lesson 2) |
  | 3 | Body parts on the inside · Bộ phận bên trong cơ thể | `body-parts-on-the-inside` | `core` | `body_parts_only_outside` (exit quiz Oak lesson 3; misconception của trang trùng lesson 2) |
  | 4 | Body parts for our senses · Năm giác quan của em | `body-parts-for-our-senses` | `core` | `touch_only_hands` (Oak lesson 4) |
  | 5 | More about sight, smell and sound · Nhìn, ngửi và nghe | `more-about-sight-smell-and-sound` | `apply` | `senses_not_for_safety` (Oak lesson 5) |
  | 6 | More about taste and touch · Nếm và sờ | `more-about-taste-and-touch` | `review` | `one_sense_at_a_time` (Oak lesson 6, ý thứ hai; ý thứ nhất đã dùng ở bài 4) |

  Content-editor được đổi tên key cho gọn hơn, giữ ý; ghi lý do trong `_topic.md`.
- File chọn ảnh `content/images/explorer/co-the-cua-em/*.json` (designer).
- Phiên chính chạy `validate`, `ids`, `images fetch`, `tts` EN + VI, `build`, `check-pack`; một lần chạy thử trên iPhone 16.

### Ngoài phạm vi
- Dây thần kinh, "giác quan gửi tin về não", nếm cần mũi (`taste_only_tongue`): thuộc Discoverer #4 *Não bộ và giác quan*.
- Thở ra thở vào, đường đi của không khí: thuộc Discoverer #3 *Hô hấp*. Ở bài 3 phổi chỉ có "giúp em thở".
- Xương, cơ, khung xương: Oak để unit sau (Year 3). Ăn uống, giữ vệ sinh, vận động: Explorer #13 *Em khoẻ mạnh*.
- Từ "organ · cơ quan", "máu nóng · warm-blooded", "đẻ con" như luật của thú.
- Dạng câu mới, màn app mới, khoá bộ thẻ mới.

## Quyết định đã ghi

Duy 17/11 cho chạy auto, không hỏi thêm; phiên chính chốt các điểm dưới theo tài liệu sẵn có. Duy xem lại khi review.

1. **Soạn đúng Explorer #6 có sẵn, không thêm chủ đề mới.** Hai lesson Duy dán là lesson 3, 4 của unit Oak *Human body parts*, unit đã nằm trong danh mục ở #6. Thêm chủ đề riêng sẽ trùng.
2. **Đủ 6 bài theo Oak** (luật "follow Oak đúng nghĩa"): body parts và senses là cùng một unit; Oak dạy cả "con người là động vật" (bài 1) và hai bài luyện giác quan (bài 5, 6).
3. **Slug** `co-the-cua-em`. `prerequisites: [goi-ten-va-nhom-dong-vat]` (thú, cấu tạo con vật). `level: 1`, `strand: humans_health` như danh mục.
4. **Thẻ thưởng dùng lại bộ `set: body`** của Discoverer #4 (khoá đã đề xuất ở đó: "Body cards" · "Thẻ cơ thể"). Không làm thẻ trùng với thẻ đã có của bộ này (Brain, Nerves, Tongue).
5. **Hình bộ phận bên trong (tim, phổi, dạ dày, não) và hình dáng người có bộ phận bên trong:** PM đồng ý designer tự vẽ hình gần thực tế (`changes: ["drawn"]`, credit "Science Kids") khi không có ảnh hay hình vẽ khoa học PD/CC0/CC BY không chữ, vì ảnh nội tạng thật không hợp trẻ 5–7 tuổi. Không ảnh nội tạng thật, không ảnh mổ, không X-quang.
6. **Ảnh người:** không mặt nhận ra được (SK-033). Dùng ảnh cận (bàn tay, bàn chân, tai, mắt, mũi, lưỡi khi ăn kem…), ảnh người từ sau lưng hay xa, hoặc hình vẽ. Không vùng kín, không người cởi trần, không đồ bơi. Bộ phận ngoài chỉ gồm: đầu, tóc, mặt, mắt, tai, mũi, miệng, cổ, vai, cánh tay, khuỷu tay, bàn tay, ngón tay, bụng, lưng, đầu gối, chân, mắt cá chân, bàn chân, ngón chân.
7. **"Vẽ và dán nhãn" của Oak** thành chỉ hình, chọn hình, nối hình; không bắt bé đọc nhãn chữ (luật Explorer 1).

## Tiêu chí nghiệm thu

### content-editor
- [x] `_topic.md`: `age_group: explorer`, `order: 6`, `strand: humans_health`, `level: 1`, `difficulty` chấm theo `syllabus-progression.md` (bản cũ 1-1-1-1-1, chấm lại nếu cần, có lý do), `prerequisites: [goi-ten-va-nhom-dong-vat]`, `is_free: false`, `ai_draft: true`. Có các mục như các chủ đề Explorer trước: Nguồn, Tên gọi thống nhất, Quy ước hình, Khung Quiz, Hình dùng chung, Đúng/Sai, Vị trí đáp án, Khởi động, Chơi, Thẻ thưởng, An toàn và nhạy cảm, Để dành cho chủ đề khác, Lệch so với sườn, Còn mở.
- [x] Đúng 6 bài, đúng thứ tự, `stage` và key ở bảng "Phạm vi"; tên bài EN/VI khớp `content/syllabus.json` từng chữ; `oak_lessons` đúng slug.
- [x] Mỗi bài theo luật Explorer (`content/rules.json` `explorer.authoring`, TEMPLATE bảy luật): Khởi động 2–3 câu DOK 1 có `recall_from`; Quiz 6 câu DOK 1·1·1·2·2·2; một câu misconception ở câu 6; chỉ `single_choice` (2–3 lựa chọn), `true_false`, `order_sequence` (3 thẻ); mỗi bài ít nhất hai dạng; mỗi câu EN ≤ 8 từ; `true_false` là câu khẳng định, không `labels`.
- [x] Khởi động bài 1 ôn *Gọi tên và nhóm động vật* (thú, cấu tạo con vật). Ít nhất một bài sau ôn một chủ đề cách xa (Explorer #2 hoặc #3).
- [x] SK-044: mọi lựa chọn sai có `feedback` một câu ≤ 8 từ EN, nói về chính vật bé chọn, không gọi tên đáp án. SK-047: `hint`, `feedback` không nhắc vị trí thẻ; `explanation_correct` câu đáp án Sai đứng một mình được.
- [x] Mỗi `order_sequence` có đúng một thứ tự đúng (ví dụ hợp: từ đầu xuống chân; đường thức ăn miệng → dạ dày; không dùng thứ tự gây tranh cãi).
- [x] Từ vựng 4–5 từ mỗi bài, 2–3 từ `core`, khớp `word_list.term_keys`. Grep "organ", "cơ quan", "warm-blooded", "máu nóng" trong chữ bé nghe: 0.
- [x] Ranh giới: không chép câu, lựa chọn của quiz Oak (dùng ý, viết lại); không dây thần kinh, không "tin gửi về não", không "mũi giúp nếm"; không "bản đồ lưỡi"; không "người chỉ có năm giác quan"; phổi chỉ "giúp thở".
- [x] An toàn: không nếm, ngửi, sờ đồ lạ; chỉ nếm thứ người lớn cho; tình huống nguy hiểm ở bài 5 chỉ là khói, mùi khét, còi xe, đèn đỏ, không cháy nhà, tai nạn, người bị thương; không đồ nóng đang dùng (nồi sôi, bàn là, lửa).
- [x] Mọi sự thật chưa chắc có dòng `> [CẦN KIỂM]` ngay dưới; "Ghi chú cho hoạ sĩ" mỗi bài liệt kê ảnh mới, ảnh dùng lại, hình cần vẽ.

### designer
- [x] Mọi chỗ có hình có mục trong file chọn ảnh; 0 chỗ trống.
- [x] Ảnh nguồn ngoài chỉ CC0, PD, PDM hoặc CC BY có ghi công; 0 BY-SA, NC, ND hay không rõ giấy phép; đã mở trang gốc. `images fetch content/images/explorer/co-the-cua-em` 0 lỗi, 0 cảnh báo tỉ lệ.
- [x] Không mặt người nhận ra được, không chữ, không logo; theo quyết định 5, 6.

### tester
- [x] Rà chữ theo khuôn SK-041, SK-046: 0 mục chặn; mục "nên sửa" đã sửa hoặc có quyết định.
- [x] Đọc mọi dòng `[CẦN KIỂM]` ở mức hợp lý với trẻ 5–7 tuổi (không thay người chuyên môn).

### phiên chính
- [x] `validate content/explorer/co-the-cua-em` 0 lỗi; `ids` theo thứ tự `_topic.md`, rồi bài 1 tới bài 6.
- [x] `images fetch` 0 lỗi; `tts` EN và VI (ghi số clip VI bị đánh dấu chờ Duy nghe); `build`; `check-pack` OK; `npm --prefix tools/content-cli test` xanh.
- [x] Một bài chơi trọn Khởi động → Học → Chơi → Quiz → Tổng kết → Thưởng trên simulator iPhone 16, một máy, một lần (không dùng iPhone 16 Pro).

### pm (đóng ticket)
- [ ] Người chuyên môn đọc hết các dòng `[CẦN KIỂM]` trước khi phát hành.
- [x] Dòng SK-049 ở `docs/backlog/README.md`.

## Phụ thuộc · Câu hỏi còn mở

- SK-040, SK-044, SK-047 (app chạy bài Explorer, phản hồi, xáo lựa chọn, Tổng kết).
- Thay đổi chưa commit của phiên khác trong cây làm việc (`tools/content-cli/image-slots.json`, `test/aspect.test.ts`, file chọn ảnh của #2, #3, SK-043): không đụng.
- Còn mở cho Duy khi review: các quyết định 1–7 ở trên.

## Rà chữ (tester 17/11)

Phạm vi: `content/explorer/co-the-cua-em/_topic.md` và sáu bài `01-con-nguoi-cung-la-dong-vat.md` … `06-nem-va-so.md`. Đọc đối chiếu ticket này (tiêu chí content-editor, quyết định 1–7, ranh giới, an toàn), `docs/oak/human-body-parts.md` (cả 9 dòng `[CẦN KIỂM]`), `content/TEMPLATE.md` (bảy luật Explorer, mục SK-044, SK-047), `content/rules.json` (`explorer.authoring`), `content/syllabus.json`, `content/discoverer/ho-hap/`, `content/discoverer/nao-bo-va-giac-quan/`, `content/explorer/goi-ten-va-nhom-dong-vat/`. Không sửa file nội dung, không chạy lệnh có ghi file, không dùng simulator.

Chạy lại `validate` (lệnh chỉ đọc): **7 file · nhóm explorer · 0 lỗi · 7 cảnh báo**, cả 7 là `md_needs_check` (26 + 29 dòng `[CẦN KIỂM]`).

Script kiểm cấu trúc (không phải test sản phẩm) ở `/private/tmp/claude-501/-Users-buiduyluu--claude-spares-spare-pFaA1L/cf95261a-e7e5-4d51-becb-193da0be1b28/scratchpad/sk049/`, chạy bằng `python3 -I`: `parse.py`, `check_struct.py` (dạng câu, DOK, số lựa chọn, kệ Chơi, từ vựng, thẻ), `check_text.py` (số từ EN theo câu, cặp en/vi, `true_false`, SK-044, SK-047, chữ cấm, "tay" đứng một mình), `check_table.py` (đối chiếu từng ô bảng Khung Quiz · Đáp án Đúng/Sai · Vị trí đáp án · Khởi động của `_topic.md` với bài), `check_img.py` + `check_table2.py` (205 chỗ "Dùng lại hình", `alt` và truy vấn đầu, bảng Hình dùng chung hai chiều), `check_kind.py` (một câu một loại hình), `check_meta.py` (id, syllabus, misconception, từ vựng), `check_more.py` + `check_new.py` + `check_fb.py` + `check_warm.py` (ví dụ kiểm màn Chơi, câu trùng, feedback, trùng câu với chủ đề khác).

**Tổng kết: chặn 0 · nên sửa 5 · nhỏ 12.**

### Đạt (đã kiểm bằng máy, không có lỗi)

- **Danh mục:** `topic_id` và sáu `lesson_id` khớp đúng `id:` của bảy file; tên bài EN/VI khớp `content/syllabus.json` **từng chữ**; `oak_lessons` đúng sáu slug Oak, `statutory: true` cả sáu, `number: 6`, `strand: humans_health`, `level: 1`, `source.kind: oak`. Không `id` nào trùng trong cả `content/` (quét toàn bộ), không khối nào thiếu `id`.
- **Cấu trúc:** sáu bài, mỗi bài sáu câu Quiz, DOK 1·1·1·2·2·2, đúng một câu misconception ở q6, không key nào gắn ở Khởi động. Khởi động hai câu (bài 1–5) và ba câu (bài 6), DOK 1, câu nào cũng có `recall_from.kind: lesson`; `single_choice` ở Khởi động luôn hai lựa chọn. Bài 1, 5, 6 hai format; bài 2, 3, 4 ba format (`order_sequence` đúng ba thẻ). `build_tray` cả sáu bài: `capacity: 3`, `success_when: all_required_and_no_limit`, ba nhóm `required`, một nhóm `limit` màu `do_son`, kệ bảy hoặc tám món, không nhóm `required` nào dùng `do_son`, key món khác key nhóm, bốn màu khác nhau ở cả Học lẫn Chơi, nhãn nhóm không có dấu phẩy.
- **Đối chiếu `_topic.md` với bài:** 49 `prompt.en` và 49 `prompt.vi` của Khởi động và Quiz **khớp từng chữ** bảng Khung Quiz (`_topic.md:479-580`) — 0 lệch; DOK từng câu khớp. 21 câu `true_false` khớp từng dòng bảng Đáp án Đúng/Sai (`_topic.md:582-606`): **13 Đúng · 8 Sai**, bài nào cũng có cả hai. Thứ tự `#### option` và chỗ đáp án đúng khớp đúng bảng `_topic.md:611-624`; đếm máy 18 câu ba lựa chọn (chỗ 1: 6, chỗ 2: 6, chỗ 3: 6) và 7 câu hai lựa chọn (chỗ 1: 4, chỗ 2: 3) — đúng từng con số ở `_topic.md:624`. 13 câu Khởi động trỏ đúng bài ở bảng `_topic.md:637-646`; bài nào cũng có thật và đã có `id`. 57 cụm "ví dụ bắt buộc" của mục Ô Học đều có trong bài.
- **SK-044:** không lựa chọn sai nào thiếu `feedback`, không lựa chọn đúng nào có `feedback`, không cặp `.en/.vi` nào thiếu một nửa (quét toàn file). Mọi `feedback` một câu, không câu nào quá tám từ EN, câu nào cũng nói về chính vật bé vừa chạm và **không câu nào gọi tên đáp án đúng** (máy bắt 5 chỗ, đọc lại đều là từ chung: "con", "bàn", "light"/"đèn", "bread" khi cả hai lựa chọn đều là bánh mì).
- **SK-047:** không `hint`, `feedback`, `explanation` nào nhắc vị trí thẻ (quét "first/second/left/right/last", "thẻ đầu", "bên trái", "đầu tiên", "cuối cùng"; một chỗ máy bắt là `03:449` "where food goes in first", nói về thứ tự thức ăn, không phải vị trí thẻ, và đúng khuôn "một đầu dải" ở `_topic.md:634`). Tám `explanation_correct` của câu đáp án Sai đều **đứng một mình được**, không "Yes!" · "Đúng rồi!", không "This is false." · "Câu này sai.". Không `hint` nào trùng ba từ liên tiếp với `prompt` hay với `explanation_correct`/`feedback` của chính câu đó.
- **Số từ và chữ:** đếm **theo từng câu**, mọi chuỗi trẻ nghe (`prompt`, `hint`, `explanation_*`, `feedback*`, `sentence`, `examples`, `example`, `messages`, `label`, `tag`, `fact`, `title`, `term`, `name`) **không câu EN nào quá tám từ** ở cả sáu bài. Chuỗi `.en` không có dấu tiếng Việt; chuỗi `.vi` không có chữ số, không ký hiệu. Ba `image.alt.en` dài hơn tám từ (`03:138`, `04:567`, `05:512`) là **chép đúng gốc và không sai luật**: `alt` không phải Spoken, không vào TTS (`tools/content-cli/src/spoken.ts:3`), chỉ là nhãn VoiceOver.
- **Hình:** 0 chỗ có hình mà thiếu `image.brief`, `image.alt.en` hay `image.alt.vi`. **205 chỗ "Dùng lại hình": mọi key có thật**, không chỗ nào trỏ qua một hình đã là hình dùng lại, truy vấn đầu chép đúng gốc ở cả 205 chỗ. Đúng 5 chỗ `alt` khác gốc, cả 5 nằm trong bảng "`alt` riêng" `_topic.md:469-475` (`w1_buffalo` ở `01:92`, `01:116`, `01:262`; `q2` mây trắng ở `04:309`; `explore_taste` bát phở ở `06:518`).
- **Bảng "Hình dùng chung" đúng hai chiều:** 59 hình của chủ đề khác trong bảng `_topic.md:407-467` khớp **đúng 59** chỗ dùng thật — 0 thừa, 0 thiếu. Đếm máy hình mới: bài 1 hai ảnh + một hình vẽ, bài 2 năm hình vẽ, bài 3 hai hình vẽ, bài 4 ba ảnh, bài 5 bốn ảnh, bài 6 sáu ảnh = **15 ảnh, 8 hình vẽ**, đúng từng con số ở `_topic.md:477`.
- **Một câu, một kệ, một loại hình:** phân loại máy theo brief gốc (ảnh hay hình vẽ), **0 câu và 0 kệ trộn hai loại**; bài 1, 4, 5, 6 cả kệ ảnh, bài 2, 3 cả kệ hình vẽ — đúng `_topic.md:252`.
- **Misconception:** sáu key khai báo ở `_topic.md` đều được dùng **đúng một lần**, đúng bài, đúng câu q6; không key nào khai báo mà bỏ không; **không trùng key** với ba chủ đề Explorer đã soạn.
- **`true_false`:** 21 câu đều là câu khẳng định (chỗ máy bắt duy nhất là `01:360` "không khí", từ ghép chứ không phải phủ định), không câu nào có `labels`, câu nào cũng có `image`, `explanation_wrong` đúng khuôn "This is false." · "Câu này sai." và "This is true." · "Câu này đúng.", phản hồi đặt đúng phía bé chọn nhầm (`answer: false` → `feedback_true`; `answer: true` → `feedback_false`) — **0 câu sai phía**.
- **`order_sequence` (ba câu):** `02:439` tai → đầu gối → bàn chân; `03:448` quả chuối → miệng → dạ dày; `04:502` mắt → mũi → lưỡi. Mỗi câu chỉ một thứ tự đúng; cả ba câu thẻ trong file **không** nằm sẵn đúng thứ tự; khớp bảng `_topic.md:628-632`.
- **Từ vựng:** 26 từ, bốn hoặc năm từ mỗi bài, hai hoặc ba từ `core`; `word_list.term_keys` khớp **đúng** danh sách `core` ở cả sáu bài và khớp bảng `_topic.md:353-360`. Không từ nào trùng giữa sáu bài; chỉ `mammal` (bài 1, `extra`) trùng chủ đề Explorer #1, cố ý và đã ghi.
- **Kệ Chơi:** khớp bảng `_topic.md:652-720` từng nhóm, từng món, từng nhãn. **24/24 ví dụ** ở "Màn Chơi, ví dụ để kiểm" (Ghi chú cho dev sáu bài) tính lại theo `success_when: all_required_and_no_limit` ra đúng `balanced` · `has_limited` · `missing.*`. `messages.full` đúng chữ chung ở cả sáu bài; `messages.has_limited` đúng với **mọi** món bẫy của bài đó (đọc tay từng món).
- **Chữ cấm và ranh giới:** grep trong mọi giá trị trẻ nghe ra **0 kết quả** cho "organ", "cơ quan", "nội tạng", "warm-blooded", "máu nóng", "đẻ con", "thú" trơn, "thần kinh", "nerve", "điều khiển", "tin gửi về não", "mũi giúp nếm", "bản đồ lưỡi", "umami", "thị giác/thính giác/khứu giác/vị giác/xúc giác", "khớp", "joint", "xương sườn", "ruột", "hít vào/thở ra", "ô-xi", "dị ứng". ("cơ quan" chỉ còn ở một ghi chú cho hoạ sĩ `03:627` tả bộ hình của *Hô hấp* và một dòng `[CẦN KIỂM]` `06:612`; "nóng" chỉ ở `01:318` "a hot day" của gợi ý uống nước, không phải ví dụ sờ.) Phổi chỉ "giúp em thở"; bộ não chỉ "giúp suy nghĩ, ghi nhớ"; dạ dày "chứa và trộn đều", không "nghiền nhỏ".
- **Không chép Oak:** so 49 `prompt.en` của chủ đề với 760 `prompt.en` của mọi bài đã có trong `content/` — không câu nào giống trên 80%. Không có câu "chọn ảnh có người", "cánh tay hay cánh hay vây", "mắt cá chân có phải bộ phận", "bàn tay giúp vẽ", "nghe chim hót – nhìn tranh – ăn táo – sờ đá trơn – ngửi hoa", "bịt mắt cho tay vào hộp"; không dùng ví dụ cánh tay chạm kim loại lạnh; không bài hát "Head, shoulders, knees and toes".
- **Khởi động theo giãn cách:** bài 1 hai câu ôn *Gọi tên và nhóm động vật* (bài 2 và bài 5); bài 2–6 mỗi bài một câu ôn bài ngay trước; bài 4, 5, 6 có câu ôn bài cách ba bài; hai câu ôn chủ đề cách xa là `03:84` (*Sinh vật sống ở đâu?*) và `06:107` (*Chuỗi thức ăn*) — đúng tiêu chí nghiệm thu.
- **An toàn:** không câu nào rủ bé nếm, ngửi, sờ đồ lạ; lời về nếm luôn kèm người lớn (`04:177`, `06:203`, `06:198`); bẫy kệ bài 6 dạy "không phải đồ ăn thì không cho vào miệng"; nguy hiểm bài 5 chỉ là khói rơm rạ ở xa, bánh mì cháy đã nguội, còi xe cứu thương (chỉ dàn đèn, brief cấm chữ thập đỏ), đèn đỏ; không cháy nhà, tai nạn, người bị thương, bệnh viện, dao, thuốc; không đồ nóng trong ví dụ sờ; không đếm ngón tay, ngón chân; không câu "ai cũng có…".
- **Các dòng `[CẦN KIỂM]` (55 dòng: 26 ở `_topic.md`, 29 ở sáu bài) tester đọc hết, ở mức 5–7 tuổi không thấy chỗ nào sai rõ:** động vật có vú có lông hoặc tóc và bú sữa mẹ; chó đẻ con; tóc dài thêm mỗi ngày; dấu vân tay riêng kể cả sinh đôi cùng trứng; khuỷu tay, đầu gối "giúp co"; đứng thẳng thì tai trên đầu gối trên bàn chân; tim giữa lồng ngực hơi lệch trái, giữa hai lá phổi, to cỡ nắm tay của chính mình; dạ dày trộn thức ăn, tiêu hoá còn ở ruột non; bụng sôi khi đói; da cảm nhận khắp cơ thể; mắt trên mũi trên miệng; chớp mắt làm sạch và giữ ẩm mắt; mùi đất sau mưa; mũi nhận ra hàng nghìn mùi; gai vỏ mít tù; xoài xanh chua; bản đồ lưỡi là sai. Ba chỗ cần người chuyên môn chốt chứ không phải tester: "năm giác quan chính" (`04:28`, Còn mở 8), tên vùng miền hoa nhài / mướp đắng / xà phòng (`04:161`, `06:153`, `06:210`, Còn mở 5), và "đèn xanh được đi" (`05:400`, xem N1). Một chỗ tester thấy cách diễn đạt đã yếu đi khi bỏ chữ "cơ quan": xem N5.
- **Hai câu hỏi còn mở của ticket tester không chốt:** `difficulty` 2-2-2-2-1 với `level: 1` (Còn mở 1) và `est_minutes: 6` cho hai bài năm ô Học (Còn mở 3) — PM quyết.

### Lỗi chặn (0)

Không có mục chặn. Không câu nào dạy sai, không câu nào phá luật cứng của `content/rules.json` hay TEMPLATE, không chỗ nào lộ đáp án qua hình hay `alt`.

### Nên sửa (5)

**N1. Bài 5 q3: phản hồi đèn xanh bảo bé "được đi", là lời khuyên đi đường duy nhất trong chủ đề không kèm người lớn.**
- `05-nhin-ngui-va-nghe.md:393-394` `feedback.en: A green light means you can go.` · `feedback.vi: Đèn xanh báo em được đi.`
- Ticket (mục An toàn, tiêu chí content-editor) chốt hành động trong bài 5 luôn là "tránh xa", "báo người lớn", "tránh đường", "dừng lại chờ". "Được đi" là một hành động ngoài danh sách, lại là hành động qua đường. Chính người viết đã thấy chỗ này và để `> [CẦN KIỂM]` ngay dưới (`05:400`: "trẻ năm tới bảy tuổi qua đường cùng người lớn (bài không dạy luật qua đường)"), nhưng chữ bé nghe thì vẫn nguyên.
- Cả chủ đề chỗ khác đều nhắc người lớn: `05:515-516` (gợi ý q6 "crossing the street with a grown-up"), `05:206-207` (`balanced` "Now tell a grown-up").
- **Sửa:** `05:393-394` → `feedback.en: You cross with a grown-up on green.` · `feedback.vi: Đèn xanh, em qua đường cùng người lớn.` (EN bảy từ). Giữ nguyên `explanation_correct`, `explanation_wrong` của q3. Nếu sửa thì dòng `[CẦN KIỂM]` `05:400` chỉ còn phần "bài không dạy luật qua đường", người chuyên môn đọc nhanh hơn.

**N2. Bài 4 q5 bảo bé xếp ba bộ phận "trên khuôn mặt", mà một thẻ là cái lưỡi — lưỡi không ở trên mặt, và chính `explanation_correct` của câu nói thế.**
- `04-nam-giac-quan-cua-em.md:497-498` `prompt.en: Order from top to bottom on your face.` · `prompt.vi: Xếp từ trên xuống dưới trên khuôn mặt em.`
- Ba thẻ: `q5_eye` mắt, `q5_nose` mũi, `q5_tongue` lưỡi (`04:512-531`). `04:505-506` `explanation_correct`: "Yes! Your tongue is inside your mouth." · "Đúng rồi! Lưỡi nằm trong miệng em." Câu giải thích tự nói thẻ thứ ba **không** nằm trên mặt mà nằm trong miệng.
- Dòng `[CẦN KIỂM]` `04:510` cũng phải viết vòng ("mũi ở trên miệng (lưỡi nằm trong miệng)") mới đúng, tức là người viết đã phải nói khác câu hỏi.
- **Sửa (ưu tiên a):** (a) đổi `04:497-498` → `prompt.en: Order from top to bottom on your head.` · `prompt.vi: Xếp từ trên xuống dưới trên đầu em.` — mắt, mũi, lưỡi đều ở trên đầu, thứ tự đúng không đổi, hợp bảng Tên gọi ("trên đầu" cho bộ phận bên ngoài, `_topic.md:178`); sửa kèm `_topic.md:538` và `_topic.md:632`, và `[CẦN KIỂM]` `04:510` thành "Trên đầu, mắt ở trên mũi, mũi ở trên miệng". (b) giữ "on your face" và đổi thẻ `q5_tongue` thành `q5_mouth` (hình `tray_mouth` của *Hô hấp* đã dùng ở `02:415` và `03:475`, cùng bộ hình vẽ) — đúng chữ hơn nhưng mất một giác quan khỏi câu, nên (a) tốt hơn cho bài giác quan.

**N3. Bài 3 ô Heart dạy "tim đập nhanh hơn khi chạy" — đúng đúng ý mà Discoverer *Hô hấp* bài 3 đã dạy, và chủ đề này chốt mỗi bộ phận bên trong chỉ "tên + một việc".**
- `03-bo-phan-ben-trong-co-the.md:144-145` `examples.3.en: it beats fast when you run` · `examples.3.vi: khi em chạy, tim đập nhanh hơn`.
- Trùng gần như từng chữ với `content/discoverer/ho-hap/03-tho-khi-chay-nhay.md:148-149` (`examples.4`: "your heart beats faster, too" · "tim em cũng đập nhanh hơn") và với câu ví dụ của từ `heart` ở `ho-hap/03-tho-khi-chay-nhay.md:660` ("Your heart beats faster when you run."). Bài *Hô hấp* đó còn ghi rõ chỗ này để dành cho *Hệ tuần hoàn* (`:150`).
- Ticket mục Ngoài phạm vi và `_topic.md:752` để "thở nhanh khi chạy" cho *Hô hấp*; `_topic.md:139` chốt "mỗi bộ phận chỉ tên + một việc". Ví dụ 1 và 2 của ô (`03:140-143`) đã đủ một việc; ví dụ 3 mở thêm một ý của chủ đề khác.
- **Sửa:** `03:144-145` → `examples.3.en: blood goes to your arms and legs` · `examples.3.vi: máu chảy tới cánh tay và chân em` (tám từ EN, bám đúng việc "bơm máu", khớp hình `blood` đang dùng ở ô này và `alt` của nó, và **không** nhắc "ngực" nên không làm hỏng DOK 2 của q5). Sửa kèm cột "Ví dụ bắt buộc" ở `_topic.md:315` nếu muốn giữ ví dụ này là bản chốt.

**N4. Bài 3 q5 (DOK 2): gợi ý trỏ thẳng tới câu vừa dạy có chứa đúng đáp án, nên câu hỏi tụt về nhớ lại.**
- `03-bo-phan-ben-trong-co-the.md:489-490` `hint.en: Think about where your lungs are.` · `hint.vi: Em nghĩ xem phổi nằm ở đâu nhé.` Câu hỏi là "Where can you feel your heart beat?" với ba lựa chọn đầu · bụng · **ngực**.
- Ví dụ bắt buộc của ô Lungs ngay trước đó (`03:159-160`) là "two lungs in your chest" · "hai lá phổi trong lồng ngực": bé chỉ cần nhớ câu đó là đọc ra nhãn lựa chọn "ngực". Trái "Lỗi hay gặp" số 5 của chính chủ đề (`_topic.md:273`: gợi ý không gần như nói đáp án).
- **Sửa:** `03:489-490` → `hint.en: Think where the drawing shows your heart.` · `hint.vi: Em nghĩ xem hình vẽ cho thấy tim ở chỗ nào nhé.` (trỏ tới bằng chứng là hình ô Inside you, không chứa chữ "ngực", không trùng ba từ với `prompt`). Nếu muốn giữ hướng "suy từ phổi" thì ít nhất bỏ chữ chỉ chỗ: `hint.en: Your heart sits between two other parts.`

**N5. Thẻ thưởng bài 6 nói "da là bộ phận lớn nhất của cơ thể" — câu đúng với chữ "cơ quan", không chắc đúng với chữ "bộ phận" mà chủ đề bắt dùng.**
- `06-nem-va-so.md:610-611` `fact.en: Skin is the biggest part of your body.` · `fact.vi: Da là bộ phận lớn nhất của cơ thể em.`; `06:612` `[CẦN KIỂM]` đã ghi đúng vấn đề: "Da là cơ quan lớn nhất cơ thể người… chữ cho bé nói 'bộ phận', không nói 'cơ quan'".
- Với bé vừa học bài 2 (chân, cánh tay, lưng là "bộ phận"), câu này dễ bị phản biện bằng chính bài 2: chân to hơn da chứ. Sự thật nằm ở nghĩa "organ", mà "organ · cơ quan" là chữ cấm của chủ đề (SK-049 ngoài phạm vi) — nên giữ câu này là giữ một khẳng định không kiểm được bằng lời bé đang có.
- **Sửa:** `06:610-611` → `fact.en: Your skin covers you from head to toe.` · `fact.vi: Da bao phủ em từ đầu đến chân.` (đúng chắc, bảy từ EN, dùng lại đúng cụm "head to toe" · "từ đầu đến chân" của bài 2 q4, hợp hình thẻ là đôi bàn chân trần, và bỏ được một dòng `[CẦN KIỂM]`). Sửa kèm `_topic.md:734` và `_topic.md:816-817`. Nếu muốn giữ ý "lớn nhất" thì phải để người chuyên môn chốt cách nói cho trẻ.

### Nhỏ (12)

**n1. Hai `alt.vi` để "tay" đứng một mình** — `02-bo-phan-ben-ngoai-co-the.md:121` "Đôi tay đang ghép tranh", `04-nam-giac-quan-cua-em.md:601` "Đôi tay hứng dòng nước" (người viết đã nêu ở `02:128` và `04:602`). Cả hai **chép đúng gốc** theo Quy ước hình số 11, và `alt` **không vào TTS** (`tools/content-cli/src/spoken.ts:3`: "image alt… are not Spoken"), nên đây chỉ là nhãn VoiceOver, không phải clip máy đọc. Nếu phiên chính muốn thống nhất với bảng Tên gọi (`_topic.md:194`): đổi `02:121` → "Đôi bàn tay đang ghép tranh", `04:601` → "Đôi bàn tay hứng dòng nước", và thêm hai dòng vào bảng "`alt` riêng" `_topic.md:469-475`. Chỗ thứ ba `03:139` "các đường máu chạy tới tay chân" là cụm quen "tay chân", để nguyên được.

**n2. Bài 5: ba nhóm `required` mỗi nhóm đúng một món, nên kệ chỉ có ba món đúng trên bảy** (`05:218-240` nhóm, `05:242-298` món; bảng `_topic.md:702-707`). Năm bài kia đều có ít nhất một nhóm hai món, bé có chỗ chọn; ở bài 5 màn Chơi thành "nhặt ba món không phải bẫy". Tester **không** đề xuất thêm dấu hiệu nguy hiểm mới (ranh giới an toàn của ticket đã hẹp: chỉ khói, mùi khét, còi, đèn đỏ). Hai cách gọn: (a) để nguyên và ghi một dòng lý do ở `_topic.md:709` ("kệ này cố ý mỗi giác quan đúng một dấu hiệu"); (b) thêm khói rơm rạ `explore_smoke` (*Hô hấp*, đã dùng ở ô Keep safe `05:169`) làm món thứ hai của nhóm Smell — nhưng khi đó kệ có tám món và hai món Ngửi đều đúng, nên (a) đơn giản hơn.

**n3. Cùng một hình gà trống, hai bài đặt nhãn lệch nhau về nghĩa** — `04:261-262` "Rooster crowing" · "Tiếng gà gáy" (đúng cặp) nhưng `05:276-277` "Rooster" · "Gà gáy" (EN là con vật, VI là tiếng kêu), trái "Lỗi hay gặp" số 7 (`_topic.md:275`). Sửa `05:276` → `label.en: Rooster crowing` hoặc `05:277` → `label.vi: Gà trống`; sửa kèm `_topic.md:707`.

**n4. Câu EN lặp nguyên văn giữa hai chỗ bé nghe gần nhau:** `03:353` (feedback q1_stomach) = `03:384` (explanation_correct q2) "Your stomach holds the food you eat."; `04:429` (feedback q3_tongue) = `04:457` (explanation_correct q4) "Your tongue tastes sweet and sour."; `04:505` (explanation_correct q5) ≈ `04:575` (ví dụ từ `tongue`) "Your tongue is inside your mouth."; và giữa hai bài liền nhau: `03:339` = `04:56` "The answer is the brain. It is inside your head.", `04:391` = `05:54` "Yes! Your nose smells lemongrass, too." Không phá luật nào, nhưng đổi một trong hai câu sẽ bớt cảm giác đọc lại băng.

**n5. Bài 1 `q3_frog` nói về "da" của con vật** — `01:405-406` `feedback.en: A frog has smooth, wet skin.` · `feedback.vi: Con ếch có da trơn và ướt.` Bảng Tên gọi `_topic.md:219` chốt "chỉ da người" (theo `[CẦN KIỂM]` `docs/oak/human-body-parts.md:126`). Ở đây "da" chỉ dùng để phân biệt với lông nên không sai khoa học; nếu muốn giữ luật chặt thì đổi thành `feedback.en: A frog feels smooth and wet.` · `feedback.vi: Con ếch sờ vào thấy trơn và ướt.` (nhưng câu này lại chạm ý "sờ" của bài 6). Tester nghiêng về giữ nguyên và nới một chữ ở `_topic.md:219`: "chỉ da người **khi dạy giác quan**".

**n6. Bài 6 `q1_sugar`: VI ngắn hơn EN một ý** — `06:364-365` `feedback.en: Sugar tastes sweet on your tongue.` · `feedback.vi: Đường có vị ngọt.` Thêm cho khớp: "Đường có vị ngọt trên lưỡi em."

**n7. Hai câu EN dùng dấu hai chấm giữa câu hỏi** — `05:415` "Which smell means: find a grown-up?" và `06:47` "A burning smell means: find a grown-up." Máy đọc sẽ ngắt giữa câu và câu hỏi EN nghe gãy. Đề xuất `05:415` → "Which smell means you need a grown-up?" (bảy từ) và `06:47` → "A burning smell means you need a grown-up." Bản VI đã không có dấu hai chấm nên không đổi. Nếu đổi thì sửa kèm `_topic.md:552`, `_topic.md:562`, `_topic.md:602`.

**n8. "squint" khó với bé 5–7 học tiếng Anh** — `06:346-347` `hint.en: Think of the juice that makes you squint.` Người viết đã liệt kê ở Ghi chú cho dev (`06:641`). Nếu muốn nhẹ hơn: `hint.en: Think of the juice in a lemonade.` · `hint.vi: Em nghĩ tới thứ nước pha trong nước chanh nhé.`

**n9. Bài 1: nhãn VI của nhóm và của món trùng nhau** — `01:236` nhóm `tray_people` "Con người" và `01:281` món `tray_person` "Con người" (EN khác nhau: People · Person). Trên màn Chơi hai thẻ sẽ đọc giống hệt nhau. Theo bảng Tên gọi `_topic.md:179` nhãn món là "Person · Con người", nên nếu đổi thì đổi nhóm: `01:236` → "Nhóm con người" hoặc "Người".

**n10. Bài 3 dùng ba lần cùng một khuôn câu hỏi** — `03:47` "Which part helps you bend your leg?", `03:330` "Which part helps you think?", `03:397` "Which part helps you breathe?". Đúng chữ đã dạy và dễ nghe, nhưng ba câu trong một bài nghe như một. Có thể đổi `03:397` thành "Which part fills up when you breathe?" — cần kiểm lại ranh giới *Hô hấp* trước khi dùng, nên tester chỉ nêu.

**n11. `do_son` vừa là màu một ô Học vừa là màu nhóm bẫy trong cùng một bài** — bài 3 (`03:134` ô Heart và `03:260` nhóm "Ở bên ngoài") và bài 4 (`04:183` ô Touch và `04:257` nhóm "Chỉ nhìn thấy"), trong khi bài 5 cố ý tránh đúng chuyện này (`05:103`, `05:166`). `_topic.md:349` đã ghi lý do (năm ô cần năm màu, hai màn khác nhau) nên không sai, chỉ là hai cách xử khác nhau trong một chủ đề: PM xác nhận một lần cho gọn.

**n12. Một câu mô tả trong `_topic.md` nói quá** — `_topic.md:608` "Không câu nào có 'not', 'no', 'never', 'không', 'chưa'" nhưng `01:360` có "không khí" (từ ghép, không phải phủ định). Sửa câu mô tả thành "không câu nào có… 'không' đứng làm phủ định (riêng 'không khí' là từ ghép)" để lượt rà sau không báo nhầm.

**Đã sửa (content-editor 18/11)**

Không đổi `id:`, key hình, đáp án hay thứ tự `#### option`/`#### item`. Không đổi `image.brief` hay `image.alt` nào. Dòng ghi theo số dòng sau khi sửa.

- **N1** `05-nhin-ngui-va-nghe.md:393-394` → "You cross with a grown-up on green." · "Đèn xanh, em qua đường cùng người lớn."; `[CẦN KIỂM]` `05:400` → "Bài không dạy luật qua đường; phản hồi chỉ nói em qua đường cùng người lớn khi đèn xanh." Kèm `_topic.md:745` (An toàn, thêm "qua đường cùng người lớn" chỉ ở phản hồi này), `_topic.md:808-809` (Đúng khoa học bài 5, thêm dòng và `[CẦN KIỂM]`).
- **N2** (cách a) `04-nam-giac-quan-cua-em.md:497-498` → "Order from top to bottom on your head." · "Xếp từ trên xuống dưới trên đầu em."; `04:504` hint VI → "Em nghĩ xem mắt nằm ở đâu trên đầu nhé."; `04:509` ghi chú; `[CẦN KIỂM]` `04:510` → "Trên đầu, mắt ở trên mũi, mũi ở trên miệng." Kèm `_topic.md:538`. `_topic.md:632` không cần sửa (thẻ và thứ tự không đổi).
- **N3** `03-bo-phan-ben-trong-co-the.md:144-145` → "blood goes to your arms and legs" · "máu chảy tới cánh tay và chân em"; ghi chú `03:146`; `[CẦN KIỂM]` `03:148` bỏ "đập nhanh hơn khi chạy nhảy". Kèm `_topic.md:206` (dòng blood), `_topic.md:315` (ví dụ bắt buộc ô Heart), `_topic.md:743` (An toàn, "máu" chỉ ở ô Heart), `_topic.md:790` (Đúng khoa học).
- **N4** `03:489-490` → "Think where the drawing shows your heart." · "Em nghĩ xem hình vẽ cho thấy tim ở chỗ nào nhé."; ghi chú `03:495`.
- **N5** `06-nem-va-so.md:610-611` → "Your skin covers you from head to toe." · "Da bao phủ em từ đầu đến chân."; `[CẦN KIỂM]` `06:612` bỏ, thay bằng dòng `>` ghi lý do. Kèm `_topic.md:735` (bảng Thẻ thưởng), `_topic.md:738` (trừ `skin_card` khỏi luật "mỗi fact có `[CẦN KIỂM]`"), `_topic.md:819` (Đúng khoa học bài 6, bỏ `[CẦN KIỂM]`).
- **n1** giữ nguyên (`alt` không vào TTS).
- **n2** giữ kệ; thêm dòng lý do `_topic.md:710`.
- **n3** `05:276` `label.en` → "Rooster crowing" (VI giữ "Gà gáy"). Kèm `_topic.md:707`.
- **n4** sửa cả năm cặp, không đổi đáp án: `03:339` → "The answer is the brain. Your brain helps you think." · "Đáp án là bộ não. Bộ não giúp em suy nghĩ."; `03:384-385` → "Yes! Food goes down into your stomach." · "Đúng rồi! Thức ăn đi xuống dạ dày em."; `04:429-430` → "Your tongue tastes the food you eat." · "Lưỡi nếm vị những món em ăn."; `04:505-506` → "Yes! Your eyes sit above your nose." · "Đúng rồi! Mắt nằm phía trên mũi em."; `05:54-55` → "Yes! Your nose smells ripe mangoes, too." · "Đúng rồi! Mũi còn ngửi được mùi xoài chín."
- **n5** giữ chữ bé nghe; nới `_topic.md:219` thành "chỉ da người khi dạy giác quan", ghi lý do giữ `q3_frog`.
- **n6** `06:365` → "Đường có vị ngọt trên lưỡi em."
- **n7** `05:415` → "Which smell means you need a grown-up?"; `06:47` → "A burning smell means you need a grown-up."; thêm chỗ thứ ba cùng lỗi tester chưa liệt kê: `05:462` → "Which sound means move out of the way?" (tám từ). VI cả ba giữ. Kèm `_topic.md:552`, `:553`, `:562`, `:602`, và `:579` (Chữ cần dạy: "grown-up", vì "find a grown-up" chưa từng được dạy).
- **n8** `06:346-347` → "Think of a fruit you squeeze on pho." · "Em nghĩ tới thứ quả vắt vào bát phở nhé." (không dùng đề xuất "lemonade" · "nước chanh" vì chữ VI chứa luôn đáp án "chanh"); `06:641` danh sách từ: "squint" → "squeeze".
- **n9** `01:236` nhóm `tray_people` VI → "Loài người" (thêm dòng `>` `01:239`); kèm `01:587`, `_topic.md:662`.
- **n10** `03:397-398` → "Which part do you breathe with?" · "Em thở bằng bộ phận nào?" (đổi khuôn câu, không chạm ý *Hô hấp*). Kèm `_topic.md:521`.
- **n11** giữ.
- **n12** `_topic.md:608` → "… 'chưa', hay 'không' đứng làm phủ định (riêng 'không khí' ở bài 1 câu q2 là từ ghép)".

Chuỗi trẻ nghe đã đổi (cần tạo lại clip TTS):
- Bài 1: `tray_people` `label.vi`.
- Bài 3: ô Heart `examples.3.en/.vi`; q1 `explanation_wrong.en/.vi`; q2 `explanation_correct.en/.vi`; q3 `prompt.en/.vi`; q5 `hint.en/.vi`.
- Bài 4: q3 `q3_tongue` `feedback.en/.vi`; q5 `prompt.en/.vi`, `hint.vi`, `explanation_correct.en/.vi`.
- Bài 5: w1 `explanation_correct.en/.vi`; `tray_rooster` `label.en`; q3 `q3_green` `feedback.en/.vi`; q4 `prompt.en`; q5 `prompt.en`.
- Bài 6: w1 `prompt.en`; q1 `hint.en/.vi`; q1 `q1_sugar` `feedback.vi`; `skin_card` `fact.en/.vi`.

Chưa chạy `validate` (lượt này không có Bash): phiên chính chạy `node tools/content-cli/src/cli.ts validate content/explorer/co-the-cua-em`. Số dòng `[CẦN KIỂM]`: `_topic.md` vẫn 26 (bỏ một ở bài 6, thêm một ở bài 5), sáu bài còn 28.

## Ảnh (designer 17/11)

Đã làm: sáu file chọn ảnh `content/images/explorer/co-the-cua-em/*.json`; tám hình tự vẽ mới và 36 bản khung rộng của hình vẽ ở `content/images/own/co-the-cua-em/`; bốn hình ghép ở `content/images/composed/co-the-cua-em/`. Không sửa `.md`, không sửa file chọn ảnh của chủ đề khác.

**Số chỗ có ảnh (mọi chỗ đều có mục, 0 chỗ trống):** bài 1: 35 · bài 2: 39 · bài 3: 40 · bài 4: 40 · bài 5: 37 · bài 6: 37 (tổng 228). Danh sách khoá lấy từ `images search` (candidates.json); sau lượt sửa chữ 18/11 của content-editor không đổi key hay brief.

**Cách dùng lại:**
- Hình câu hỏi bị ẩn (hàng rào tre `w1`): `same_as` sang `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`.
- Trong chủ đề: mỗi cặp (hình, khung) có một mục đầy đủ ở chỗ dùng đầu tiên; chỗ sau dùng `same_as` (cùng bài) hoặc `same_as` + `lesson: co-the-cua-em/<bài>`.
- Hình của *Hô hấp*, *Não bộ và giác quan*, *Khủng long* (Discoverer): chép mục gốc (`same_as` không sang nhóm tuổi khác), cùng file, cùng `title`; ảnh chụp thì đặt `crop` theo khung Explorer. Ảnh của Explorer #1, #2, #3: chép mục, dùng lại crop đã có trong cache khi khung khớp.
- Hình vẽ 1024×768 ở khung rộng (5:2, 17:10, 2:1): bản riêng `content/images/own/co-the-cua-em/<tên>.<5x2|17x10|2x1>.jpg`. Vật trên nền kem (tim, phổi, dạ dày, não, bàn tay, bàn chân, khuôn người, khuỷu tay, đầu gối, cơ thể): bỏ bớt nền trống trên dưới, đệm nền kem hai bên, không cắt mất bộ phận. Hình kín khung (mắt, tai, mũi, miệng, lưỡi, đầu ngón tay, khói rơm, mái tóc): cắt dải giữa quanh bộ phận.
- Hình ghép mới: `five-senses-2x1.jpg` (năm ô của `explore_five` xếp một hàng, thẻ từ `sense`), `five-senses-4x3.jpg` (bài 5 q6), `stool-5x2.jpg`, `stool-17x10.jpg` (ghế đẩu đệm khung; ảnh ghế cao bị cắt mất mặt ghế ở khung rộng).

**Ảnh mới: 15.** CC0 8 (bàn tay gắp mì, bàn tay xoa mèo, bàn chân trần trên cỏ, bát đường, khóm sả, bánh mì que, mướp đắng, hạt muối) · Public domain 1 (xà phòng) · CC BY 2.0 3 (bánh mì cháy, đèn xanh, đá viên) · CC BY 3.0 2 (quả mít, xoài xanh) · CC BY 4.0 1 (nóc xe Chữ thập đỏ có đèn và còi). Không BY-SA, NC, ND. Nguồn: Wikimedia Commons 14, Openverse/Rawpixel 1. Đã mở trang gốc (Commons qua API và trang file) từng ảnh; trang rawpixel chặn tải bằng script (HTTP 403), Openverse ghi CC0 1.0: **người duyệt mở trang rawpixel trên trình duyệt xác nhận CC0** (dòng "Kiểm tay" của `fetch`). Ghế đẩu (Openverse/Flickr, chép từ Explorer #1) cũng có dòng "Kiểm tay" như bên đó.

**Hình tự vẽ mới: 8** (SVG, xuất JPEG 1024×768, credit Science Kids, `changes: ["drawn"]`, không chữ, không nét mặt): `hair-back.jpg` (đầu và vai từ phía sau, tóc đen ngắn, áo trơn), `elbow.jpg` (cánh tay co ở khuỷu, áo cộc tay), `knee.jpg` (chân co ở gối, quần soóc), `bend.jpg` (khuôn người nhìn nghiêng như `q1` của *Não bộ và giác quan*, bước lên bậc, khuỷu tay và đầu gối tô vàng nghệ), `glove.jpg` (găng tay len đỏ son), `sandals.jpg` (đôi dép quai hậu nhìn từ trên), `body-inside.jpg` (bạn nhỏ nhìn thẳng, áo và quần soóc nhạt, thấy não, hai lá phổi, tim giữa ngực lệch trái cơ thể, dạ dày bụng trên bên trái; không ruột, gan, xương, mạch), `body-stomach.jpg` (ghép từ ba bản tô của sơ đồ đường thở *Hô hấp*: chỉ thực quản và dạ dày tô nâu đất, phổi, khí quản, mũi nhạt). Nền phẳng như bộ giác quan; hai hình cơ thể nền chuyển như bộ cơ quan *Hô hấp*.

**Món không có ảnh đúng brief (đã chọn ảnh gần nhất; đề xuất content-editor sửa `brief`/`alt`):**

| Bài · chỗ | Brief / `alt` hiện tại | Ảnh thật | Đề xuất |
| --- | --- | --- | --- |
| 1 `explore_humans` (kéo theo `tray_person`, q2, từ `human`) | đôi bàn tay bạn nhỏ bưng bát cơm, cầm đũa · "Hands holding a bowl of rice" | bàn tay người lớn cầm đũa gắp mì từ bát đen (rawpixel, CC0); không thấy mặt | `alt` "A hand eating noodles with chopsticks" · "Bàn tay cầm đũa gắp mì"; q2 `hint` "Look at what this hand is holding." · "Em nhìn xem bàn tay đang cầm gì nhé." Commons, Openverse không có ảnh hợp lệ bàn tay bưng bát cơm (ảnh có bát cơm đều không có tay, ảnh có tay ăn cơm đều lộ mặt). Nếu PM muốn đúng bát cơm: vẽ, nhưng kệ bài 1 là kệ ảnh |
| 4 `explore_touch` (bài 6 q5, thẻ `skin_card`) | bàn chân trần một bạn nhỏ | bàn chân trần người lớn trên cỏ, thấy gan bàn chân, gấu quần soóc (Central Park, CC0) | brief bỏ "một bạn nhỏ"; `alt` giữ |
| 4 `tray_lemongrass` | bó sả tươi trên bàn | một khóm sả trồng trên đất | `alt` giữ ("Fresh lemongrass") |
| 5 `explore_bread` (kéo theo `tray_bread`, q2, q4, bài 6 q1) | bánh mì Việt Nam nguyên ổ | bánh mì que kiểu Pháp trong tiệm, nền mờ; Commons chỉ có bánh mì Việt Nam đã kẹp nhân | brief bỏ "Việt Nam"; `alt` giữ |
| 5 `tray_siren` (q5, từ `siren`) | dàn đèn còi trên nóc xe cứu thương, đèn đang sáng | nóc xe Hội Chữ thập đỏ Áo (đội chó tìm kiếm), hai dàn đèn xanh và bốn còi hơi; đèn không sáng; crop bỏ chữ, dải đỏ | brief bỏ "đèn đang sáng"; `alt` giữ |
| 5 `q3_green` | cùng bộ với ảnh đèn đỏ `q3` | đèn xanh đang sáng lúc đêm, crop chỉ một ngọn | không cùng bộ (ảnh đèn đỏ là ảnh NARA 1970s); `alt` giữ |
| 6 `tray_salt` | bát muối hột | đống hạt muối to chụp gần, không thấy bát | `alt` "Coarse salt" · "Muối hột" |
| 6 `q4_bitter_melon` | nguyên quả | hai quả nằm ngang, crop lấy quả trên, đầu phải chạm mép ảnh | giữ |

**Kiểm tay đã làm:** xem lại mọi khung đã xử lý trong cache (tờ duyệt từng bài, khung cắt như app): không mặt người nhận ra được, không chữ, không logo, không biểu tượng chữ thập, không đồ nóng, không vùng kín. Bát phở `q6` bài 6 là ảnh gốc của *Não bộ và giác quan* (không nồi, không bếp). `w1_buffalo` (ô Needs bài 1): ảnh "Water buffalo drinking at a stream", con trâu đứng dưới suối, đầu cúi sát mặt nước; khớp ví dụ "a buffalo drinks from a stream".

**`images fetch content/images/explorer/co-the-cua-em`:** lần cuối (18/11 sáng): 6 file · 87 ảnh khác nhau · 81 đã có · **6 lỗi, đều HTTP 429** của `upload.wikimedia.org` · hình tự vẽ 66/66 · hình ghép 4/4 · **0 cảnh báo tỉ lệ**, không dòng "Chưa kiểm tỉ lệ". Sáu lỗi là hai ảnh tải bản gốc (≤ 1280 px): bàn chân trần trên cỏ (bài 4 `explore_touch`, từ `skin`; bài 6 q5, `skin_card`) và hoa nhài (dùng lại của *Não bộ và giác quan*: bài 4 `tray_jasmine`, bài 5 `tray_jasmine`, q4, từ `smell`). Lỗi do giới hạn tốc độ: phiên khác chạy `images fetch` chủ đề *Thời tiết và các mùa* cùng lúc nên hai tiến trình cùng bị chặn. Mục chọn ảnh đã đúng; **phiên chính chạy lại `images fetch content/images/explorer/co-the-cua-em` khi không còn tiến trình `images fetch` nào khác** (chỉ còn hai ảnh phải tải).
- Lưu ý cho phiên chính: lúc 00:57 designer dừng nhầm cả tiến trình `images fetch` của *Thời tiết và các mùa* (lệnh `pkill` theo mẫu chung); log của phiên đó dừng giữa chừng, nên chạy lại fetch chủ đề đó. Hai tiến trình fetch chạy song song còn ghi đè `content/.images/index.json` của nhau (nhiều ảnh phải tải lại); đề xuất dev: khoá file hoặc gộp khi ghi index.

## Chạy thử iOS (ios-dev 18/11)

**Đã chạy:** `xcodebuild build` scheme `ScienceKids`, Debug, `-destination 'generic/platform=iOS Simulator'`, DerivedData riêng trong scratchpad → `** BUILD SUCCEEDED **`; build phase "Embed content pack" nhúng `content/.build/pack` (13 chủ đề). Cài và mở trên **một** simulator iPhone 16 (iOS 18.4), `-SKSyncOff YES -SKAssumeVoiceOver YES` (tắt tự phát để màn không đứng chờ clip, như README); xong thì `simctl shutdown`. Không đụng iPhone 16 Pro. Không chạy `xcodebuild test` (ticket không đổi code iOS). Không sửa gì trong `apps/ios`.
- Log app: `pack opened: content_version 72565fa82281, 13 topic(s), 0 rejected, 17279 asset(s)`; không có log bỏ block hay quiz lạ.

**Bài 1 "Con người cũng là động vật", chơi trọn:** Bản đồ Explorer (Chặng 4, icon bàn tay, "Level 1 · 0/6 lessons") → màn chủ đề (6 bài, câu hỏi lớn EN/VI) → Khởi động 2 câu (gật/lắc chó mẹ đẻ trứng; chọn voi) → Học 5 ô (Cần để sống, Xếp nhóm, Động vật có vú, Con người, Từ mới `human`/`feature`) → Chơi khay (thử cá chép: "That one has no hair or fur." hiện đúng; mèo + mì + trâu: ba nhóm xanh, "Great! They are all mammals, like you.") → Quiz 6 câu (q3 chọn ếch trước: góc gấp + gợi ý, chọn lại thỏ được) → Tổng kết 2 trang (thẻ Ý sai → Ý đúng, thẻ từ, "I can say why…") → Thưởng (thẻ "TÓC", 2 sao, "Review tomorrow for the 3rd star") → về bản đồ "Learning now · 1/6 lessons".
- Hình: mọi ô có ảnh, không ô trống. Chữ: không tràn, không cắt ở cỡ chữ mặc định.
- Audio: bấm loa EN và nút VI ở màn chủ đề, loa từ `human`: log CoreAudio có `client starting … play` rồi `stopping` sau 3,5–5 s (clip AAC phát hết). Lần thử 9/11 trong README nói simulator báo `didNotStart`; lần này phát được. Tự phát không kiểm (đã tắt bằng cờ).

**Bài 4 "Năm giác quan của em", lướt màn Học:** Khởi động 2 câu (phổi/não; chó và người) → Học 6 ô: mắt, tai, mũi, lưỡi (hình vẽ), **"SỜ" là ảnh bàn chân trần trên cỏ** (ảnh đã tải về, không còn ô trống từ lỗi 429), ô Từ mới có `sense` là **hình ghép năm giác quan** (mắt, tai, mũi, lưỡi, bàn tay) và `skin` là ảnh bàn chân. Không chơi tiếp Chơi/Quiz.

**Lỗi chặn:** không có.

**Điều thấy trên máy (không phải lỗi app, để PM/designer quyết):**
1. Ảnh `explore_humans` (bàn tay gắp mì) ở khung tròn của khay và thẻ từ 2:1 `human`: phần thấy được chủ yếu là bát mì, bàn tay chỉ lấp ló ở mép. Trẻ dễ đọc thành "mì" chứ không phải "con người", nhất là ô tròn trong khay (bước tái hiện: bài 1 → Chơi → chọn ảnh thứ ba hàng trên → nhìn ô thứ hai trong khay). Đề xuất designer: crop lệch về phía bàn tay cho khung tròn và 2:1, hoặc đổi ảnh.
2. Hình ghép năm giác quan ở thẻ từ `sense` (khung 2:1): dải năm ô nằm giữa, mỗi ô chỉ khoảng 28 pt, nền trống trên dưới. Nhìn được nhưng nhỏ; nếu muốn to hơn thì ghép 2 hàng hoặc 2:1 sát khung.
3. Quiz bài 1 q4 ảnh gà mái: khung 2,8:1 cắt mất đầu gà ở mép trên (ảnh `q4_hen`). Nhỏ, nhận ra được.
4. Khi mở app không có cờ `-SKAssumeVoiceOver`, app khôi phục một bài Discoverer đang dở và lần chạm đầu vào nút Quay lại không ăn (chạm lần hai thì ăn). Không tái hiện lại để khỏi chạy lặp; có thể chỉ là độ trễ của công cụ chạm. Ghi để tester để ý.

**Ảnh chụp (iPhone 16):** thư mục `/private/tmp/claude-501/-Users-buiduyluu--claude-spares-spare-pFaA1L/cf95261a-e7e5-4d51-becb-193da0be1b28/scratchpad/sk049/` (scratchpad, có thể bị dọn): `01-map`, `02-topic`, `03-warmup`, `04-learn-1`, `05-learn-4-human`, `06-learn-5-vocab`, `07-play-trap`, `08-play-done`, `09-quiz-1`, `10-quiz-3-wrong`, `11-recap-1`, `12-recap-2`, `13-reward`, `20…25-l4-learn-1…6`.

**Chưa kiểm:** iPad, iPhone 16e, 16 Pro Max; tự phát audio theo `voice_mode`; bài 2, 3, 5, 6; Chơi/Quiz/Tổng kết/Thưởng của bài 4; VoiceOver thật.

## Chạy lệnh (phiên chính 18/11)
- `images fetch content/images/explorer/co-the-cua-em`: 87 ảnh, 0 lỗi (hai ảnh bàn chân trần và hoa nhài phải chờ Commons hết HTTP 429); hình tự vẽ 66, hình ghép 4. Fetch cùng lúc lấy lại file hoa nhài cho *Não bộ và giác quan* (index có mục nhưng file trong `content/.images` đã mất).
- Sửa chữ theo designer: bài 1 `explore_humans` alt "A hand eating noodles with chopsticks" · "Bàn tay cầm đũa gắp mì", hint q2 "Look at what this hand is holding." · "Em nhìn xem bàn tay đang cầm gì nhé."; bài 6 `tray_salt` alt "Coarse salt" · "Muối hột".
- `tts` EN và VI: 0 lỗi, cảnh báo chuẩn hoá 0. **5 clip VI bị đánh dấu chờ Duy nghe** (máy nghe: "lồng ngực" → "lòng ngực", "muối mặn" → "múi mặn", "đá cuội" → "đá cùi", "múi mít" → "muối mít", "nải chuối" → "đại chuối"); báo cáo `content/.audio/report-co-the-cua-em-01_02_03_04_05_06-vi.json`.
- `build --require-assets` riêng chủ đề: 580 audio EN, 608 audio VI, 156 ảnh; `check-pack` OK. Gói chung `content/.build/pack` 13 chủ đề; `check-pack` OK (1546 ảnh, 0 lỗi). `npm --prefix tools/content-cli test` 399/399.

## Còn mở sau chạy thử
1. ~~**Ảnh `explore_humans` (nhóm "Loài người" ở khay bài 1, thẻ từ `human`) đọc như "mì" hơn là "người"**: ô tròn và thẻ chỉ thấy bát mì. Cần ảnh khác hoặc hình vẽ đôi bàn tay; ít nhất crop lệch về bàn tay. Designer xử lý.~~ Đã làm 18/11: ảnh bạn nhỏ nhìn từ sau (Annie Spratt, CC0), alt và hint q2 đã sửa.
2. ~~Quiz bài 1 câu 4: ảnh gà mái mất đầu ở mép trên; chỉnh crop.~~ Đã chỉnh crop 18/11.
3. ~~Thẻ `sense` (2:1): năm ô giác quan nhỏ (~28pt), xem lại bố cục hình ghép.~~ Đã ghép lại hai hàng, khoảng 32pt mỗi ô.
4. ~~Ảnh bàn tay gắp mì (rawpixel) chưa xác nhận trang gốc.~~ Không còn dùng ảnh này.
5. Lần chạm đầu nút Quay lại khi app khôi phục bài dở có thể không ăn; tester để ý (chưa tái hiện).
6. `fetch` chạy song song ghi đè `content/.images/index.json`: đề xuất dev khoá file hoặc gộp khi ghi.

## Ảnh thay (designer 18/11)
Xử lý mục 1–3 của "Còn mở sau chạy thử". Chỉ sửa `content/images/**`; chữ trong `.md` để phiên chính sửa theo đề xuất dưới.

**1. `explore_humans` đổi ảnh (Duy duyệt thay ảnh bát mì).** Ảnh mới: "Boy exploring the wilderness", Annie Spratt (Unsplash 2015), **CC0 1.0**, Wikimedia Commons, https://commons.wikimedia.org/wiki/File:Boy_exploring_the_wilderness_(Unsplash).jpg (đã mở trang gốc: template `{{Unsplash}}`, ảnh đăng trước 6/2017 nên là CC0; `images fetch` kiểm lại giấy phép ở nguồn, OK). Một bạn nhỏ tóc vàng nhạt, áo khoác nhung vàng nghệ vá khuỷu đỏ, đứng giữa bãi thạch nam, nhìn từ phía sau: thấy rõ đầu, tóc, vai; không thấy mặt, không chữ, không logo. Hợp ý "con người có tóc" của bài.
- Bốn chỗ dùng, mỗi chỗ một `crop` riêng (bỏ `same_as` của `tray_person` để cắt sát hơn cho ô tròn): ô Học `learn.explore.explore_humans` 1:1 (854×853, cả người từ đầu tới gấu áo); món khay `tray.tray_person` 1:1 cắt sát (683×682: đầu ở giữa phía trên, vai và áo lấp nửa dưới); `q2` 4:3 (1024×768); thẻ từ `vocab.human` 2:1 (1024×512, từ đỉnh đầu tới giữa áo).
- Đã xem file trong `content/.images` ở cỡ máy: ô tròn 70 pt và thẻ 152×76 pt đều đọc ra ngay là một bạn nhỏ nhìn từ sau. Ảnh không dùng ở khung 5:2 hay 17:10 trong bài này (không phải hình lựa chọn), nên không cắt bản cho hai khung đó.
- Đã tìm và loại: chuyên mục Commons "Standing/Walking children seen from behind" (nhiều ảnh lộ mặt, cảnh đường phố, có chữ); ảnh bé trai đứng ở rào chắn Baliuag (CC0, áo thun + quần soóc, rất hợp bộ hình vẽ) nhưng nền xe bán tải, biển chữ, áo xám lẫn mặt đường khi thu nhỏ; ảnh bé gái tóc vàng giữa lá thông (CC BY 2.0) tương phản thấp. Không cần hình vẽ (hướng b).
- Lưu ý: thẻ `hair` (hình vẽ đầu và vai bạn nhỏ từ sau) cùng bố cục với ảnh mới. Hai thẻ khác chất liệu (vẽ / ảnh) và ở chỗ khác nhau (`hair` là từ extra và thẻ Thưởng), nên giữ; nếu Duy thấy trùng thì đổi `hair` sau.

**Đề xuất sửa chữ (phiên chính sửa `01-con-nguoi-cung-la-dong-vat.md` và bảng ở `_topic.md`):**
- `explore_humans`, `tray_person`, `q2`: `image.alt.en: A child seen from behind` · `image.alt.vi: Một bạn nhỏ nhìn từ phía sau`.
- `explore_humans` `image.brief`: `[ảnh] Một bạn nhỏ nhìn từ phía sau, thấy rõ đầu, tóc, vai và áo; không thấy mặt; nền thiên nhiên đơn giản; không chữ, không logo. Ảnh ngang, người ở giữa (dùng ở ô Học 1:1, món Chơi vuông và ô tròn, hình câu q2 khung 4:3, thẻ từ 2:1). Từ khoá tìm ảnh (EN): child seen from behind; boy back view hair`. Brief của `tray_person` và `q2` đổi từ khoá thành `child seen from behind`.
- `q2` hint (bỏ "bàn tay đang cầm gì" vì ảnh không còn bàn tay): `hint.en: Think: do you eat and drink?` (6 từ) · `hint.vi: Em nghĩ xem: em có ăn, uống không?`. Ghi chú cuối `q2` "Hình là bát cơm bé vừa xem" → "Hình là bạn nhỏ bé vừa xem ở ô People".
- `_topic.md` bảng hình mới dòng `explore_humans`: alt như trên; bảng ô Học dòng `explore_humans` giữ ví dụ "we eat and drink every day" (không phụ thuộc ảnh).

**2. Quiz bài 1 q4 gà mái.** `q4.q4_hen` crop cũ `{0, 0.2333, 1, 0.5333}` mất đầu. Crop mới `{"left": 0, "top": 0.1, "width": 1, "height": 0.4762}` (2,8:1 đúng khung thẻ đo trên iPhone 16; trong ngưỡng của khung kiểm 5:2): thấy đủ mào, mắt, mỏ, cả khi app cắt thêm cho khung 2,5:1. File cache `6ee35ac0d7d6…` 1024×366, đã xem.

**3. Thẻ từ `sense` (2:1).** Ghép lại `content/images/composed/co-the-cua-em/five-senses-2x1.jpg`: hai hàng (mắt, tai, mũi / lưỡi, bàn tay) thay một hàng năm ô; mỗi ô 214 px trên 1024 (cũ ~176), cắt sát hơn từng hình vẽ nên bộ phận trong ô to hơn ~1,4 lần (iPhone 16: ô ~32 pt thay vì ~26–28 pt). Cùng năm hình vẽ, cùng nền kem `rgb(250,246,234)`, góc bo và bóng như bản cũ. Lề trên dưới 34 px để Pro Max (khung ~2,3:1) không cắt vào ô. Bản 4:3 (`five-senses-4x3.jpg`, câu q6 bài 5) không đổi.

**Kết quả `images fetch content/images/explorer/co-the-cua-em`:** 6 file, 88 ảnh, 0 lỗi, 0 cảnh báo tỉ lệ; hình tự vẽ 66, hình ghép 4. Cần chạy lại `build` để gói nhận ảnh mới (và `tts` cho hint q2 sau khi sửa chữ).

**Mục còn mở 4 (trang gốc rawpixel):** hết liên quan, ảnh bát mì không còn dùng.

## Sau khi thay ảnh (phiên chính 18/11)
- `01-con-nguoi-cung-la-dong-vat.md`: brief, alt (`explore_humans`, `tray_person`, q2, từ `human`) thành "A child seen from behind" · "Một bạn nhỏ nhìn từ phía sau"; hint q2 "Think: do you eat and drink?" · "Em nghĩ xem: em có ăn, uống không?"; `_topic.md` bảng ảnh mới cập nhật.
- `validate` 0 lỗi; `import`, `tts` EN và VI (câu hint mới không bị đánh dấu; vẫn 5 clip VI chờ Duy nghe); `build --require-assets` 157 ảnh, `check-pack` OK; gói chung 13 chủ đề, 1547 ảnh, `check-pack` OK. Chưa chạy lại simulator (ảnh đã kiểm trên file cache ở cỡ máy).
