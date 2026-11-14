# SK-046 · Soạn chủ đề Explorer #2 Sinh vật sống ở đâu? (7 bài)

Trạng thái: review · Ngày: 2026-11-14 · Phụ trách: content-editor · Tester: tester
Nguồn: `docs/oak/living-things-and-where-they-live.md`, `content/syllabus.json` (Explorer số hai, key `living-things-and-where-they-live`), `content/TEMPLATE.md` (bảy luật Explorer, mục "Phản hồi sau mỗi lần chọn (SK-044)"), `content/rules.json` (`explorer.authoring`), `docs/backlog/SK-041-explorer-1-animals.md` (khuôn rà chữ), `docs/backlog/SK-044-answer-feedback.md`

> Ticket do tester tạo 14/11 để có chỗ ghi rà chữ; PM viết lại các mục Mục tiêu, Phạm vi, Tiêu chí nghiệm thu theo khuôn SK-041 và chép các dòng `[CẦN KIỂM]` của `_topic.md` vào đây.

## Mục tiêu

Bé Explorer 5–7 tuổi phân biệt được vật đang sống, đã chết, chưa từng sống và biết các con vật, cây sống ở đâu, kể cả những nơi sống nhỏ xíu quanh nhà.

## Phạm vi

`content/explorer/sinh-vat-song-o-dau/_topic.md` và bảy bài `01` … `07`. Ngoài phạm vi: ảnh thật (designer), `tts`, `build`, gói nội dung, màn app.

## Tiêu chí nghiệm thu

- [ ] `content-cli validate content/explorer/sinh-vat-song-o-dau` 0 lỗi (phiên chính chạy 14/11: 0 lỗi).
- [ ] Rà chữ tester: không còn mục "chặn", các mục "nên sửa" đã sửa hoặc có quyết định của PM.
- [ ] Hết các dòng `[CẦN KIỂM]` (người chuyên môn đọc) trước khi phát hành.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

- **PM:** `stage` bài 7 (`review` hay `apply`, `_topic.md:124`); `difficulty.prior_knowledge` 3 → 2 (`_topic.md:106`); `syllabus.md:114` còn ghi chủ đề này ở số mười một trong khi `content/syllabus.json` đã là số hai; dòng cho phụ huynh ở bài 3 (nói về "đã chết").
- **ios-dev:** khoá `collectible.set.living_things` ("Living things cards" · "Thẻ sinh vật"); chưa có thì app hiện tên chung "Thẻ".
- **designer:** ba mươi tư ảnh mới (danh sách ở Ghi chú cho hoạ sĩ từng bài).

## Rà chữ (tester 14/11)

Phạm vi: `content/explorer/sinh-vat-song-o-dau/_topic.md` và bảy bài; đọc đối chiếu `docs/oak/living-things-and-where-they-live.md` (mọi dòng `[CẦN KIỂM]`), `content/TEMPLATE.md`, `content/rules.json` (`explorer.authoring`), `content/syllabus.json`, `syllabus.md`, `docs/backlog/SK-044-answer-feedback.md`, `docs/backlog/SK-041-explorer-1-animals.md` (hai mục rà chữ 12/11 và 13/11), chủ đề trước `content/explorer/goi-ten-va-nhom-dong-vat/` và chủ đề kế `content/explorer/chuoi-thuc-an/`. Không sửa file nội dung, không chạy lệnh nội dung, không dùng simulator. `validate` do phiên chính chạy (0 lỗi), tester không chạy lại.

Script kiểm cấu trúc (không phải test sản phẩm) ở `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk046/`, chạy bằng `python3 -I`: năm script của SK-041 đổi thư mục (`check_struct.py`, `check_text.py`, `check_img.py`, `check_tf.py`, `check_hint.py`) cộng năm script mới — `check_fb.py` (luật SK-044, số từ **theo câu**, `order_sequence`, từ phủ định), `check_tables.py` (ảnh mới, vị trí đáp án, bảng Đúng/Sai, `recall_from`, màu nhóm, kệ Chơi, từ vựng), `check_shared.py` + `cmp_table.py` + `cmp_uses2.py` (bản đồ hình dùng lại, đối chiếu bảng "Hình dùng chung"), `screens.py` (số từ trên một màn), `fb_hint.py` (feedback có lặp ý hint không).

**Tổng kết: chặn 0 · nên sửa 5 · nhỏ 17.**

### Đạt (đã kiểm bằng máy, không có lỗi)

- **Cấu trúc quiz:** bảy bài, mỗi bài sáu câu, DOK 1·1·1·2·2·2 (Explorer `dok_mix` 3·3·0), câu một DOK 1, đúng một câu misconception ở q6. Bảy key misconception đều có thật trong `_topic.md`, mỗi key dùng đúng một lần, không key nào gắn ở Khởi động. `single_choice` hai hoặc ba lựa chọn, `order_sequence` đúng ba thẻ, không bài nào dùng format ngoài `explorer.quiz_formats`. Bài 1, 4, 7 hai format; bài 2, 3, 5, 6 ba format (≥ `min_formats` 2). Khởi động hai hoặc ba câu, DOK 1, câu nào cũng có `recall_from.kind: lesson`; mười bảy câu Khởi động trỏ đúng bài trong bảng `_topic.md:299-305`, mọi bài được trỏ đã có `id`.
- **SK-044:** đếm máy **không lựa chọn sai nào thiếu `feedback`**, không lựa chọn đúng nào có `feedback`, không cặp `.en/.vi` nào thiếu một nửa. Hai mươi hai câu `true_false` đều viết đúng phía bé chọn nhầm (`answer: false` → `feedback_true`; `answer: true` → `feedback_false`), không câu nào viết nhầm phía. Mọi `feedback` chỉ một câu, không câu nào quá tám từ EN. `feedback` không lặp ý `hint` (chỉ một chỗ chạm nhau nhẹ, xem n5).
- **Số từ:** đếm **theo từng câu** (như `age_words_en`), mọi chuỗi trẻ nghe (`prompt`, `instruction`, `hint`, `explanation_*`, `feedback*`, `sentence`, `examples`, `messages`, `example`, `fact`, `tag`) đều ≤ tám từ EN ở cả bảy bài. Một chỗ duy nhất quá tám là `_topic.md:46` `correction.en` — trường nội bộ, app không đọc. `prompt` + `instruction` + `statement` trên một màn câu hỏi: không màn nào quá mười lăm từ. Chuỗi `.en` không có dấu tiếng Việt; chuỗi `.vi` không có chữ số, ký hiệu, dấu "—".
- **`true_false` (22 câu):** không câu nào phủ định theo chữ ("not", "no", "never", "không", "chưa"), không câu nào có `labels`, câu nào cũng có `image` cấp câu; mười một câu đáp án Sai không câu nào có `explanation_correct` mở đầu "Yes!" · "Đúng rồi!"; mọi `explanation_wrong` đúng khuôn "This is false." · "Câu này sai." và "This is true." · "Câu này đúng.". Khớp **từng dòng** bảng `_topic.md:254-275`; tổng mười một Đúng · mười một Sai, bài nào cũng có cả hai.
- **Vị trí đáp án:** khớp đúng từng ô bảng `_topic.md:285-291`, cả bảy bài. Đếm máy ba mươi ba câu một đáp án: chỗ thứ nhất mười hai, thứ hai mười bốn, thứ ba bảy; riêng hai mươi ba câu ba lựa chọn: bảy · chín · bảy; mười câu hai lựa chọn — đúng từng con số ở `_topic.md:293`.
- **`order_sequence` (bốn câu):** `02:434` dây mướp → ốc sên → con cò; `03:382` lá xanh → lá vàng → lá khô; `05:411` đồi cát → rừng râm mát → ao; `06:483` dưới hòn đá → ao → biển. **Mỗi câu chỉ một thứ tự đúng** (so sánh tốc độ, vòng đời một chiếc lá, lượng nước, cỡ nơi sống — không có cách xếp thứ hai hợp lý); không câu nào thẻ trong file nằm sẵn đúng thứ tự; `hint` của cả bốn chỉ vào đầu dãy, không đọc lại thứ tự.
- **Hình:** không chỗ nào thiếu `image.brief` + `alt.en` + `alt.vi` (mọi lựa chọn, thẻ `order_sequence`, món kệ, câu Khởi động và Quiz, ô Học, từ vựng, thẻ thưởng). 239 chỗ "Dùng lại hình": mọi key có thật, không chỗ nào trỏ qua một hình dùng lại khác, từ khoá tìm ảnh chép đúng từng chữ của hình gốc; chỉ một chỗ `alt` khác gốc (`07:493-495`) và đó là chủ ý chống lộ đáp án, đã ghi ở `07:477`.
- **Bảng "Hình dùng chung" (`_topic.md:189-245`) đúng hết 55 dòng.** Đếm máy: đúng 55 hình được dùng từ hai chỗ trở lên trong chủ đề, khớp 1:1 với 55 dòng bảng; chín hình chỉ dùng một chỗ khớp đúng danh sách `_topic.md:248`. Đối chiếu từng ô "Dùng ở" (bài nào, key nào) không thấy dòng nào sai. Đếm máy **ba mươi tư ảnh mới**, chia 5 · 2 · 5 · 4 · 5 · 5 · 8 — đúng từng con số ở `_topic.md:247`.
- **Ảnh an toàn:** cả ba mươi tư brief ảnh mới đều ghi "không có chữ" (hay "không thấy chữ hay nhãn hiệu"); không brief nào có rết, bọ cạp, rắn (brief `06:140` loại tường minh); chữ bé nghe không có "rết", "bọ cạp" (hai từ này chỉ nằm ở dòng `>` cho người duyệt, `06:613`, `07:166`, `07:633`); không con vật chết, không bộ xương, không cảnh săn mồi, không thiên tai; lửa bài 7 là đống lá nhỏ, không có người trong khung; brief đồ chơi, dép, bình tưới, chai, rác, bình phun thuốc đều ghi "không có nhãn hiệu / không có logo".
- **Kệ Chơi:** khớp bảng `_topic.md:313-320` từng nhóm, từng món. Bài 2 tám món, sáu bài còn lại bảy món; bài 1, 3 hai chỗ (hai nhóm `required`), năm bài còn lại ba chỗ. **Nhóm `limit` của cả bảy bài đều `do_son`, và `do_son` không dùng cho bất kỳ nhóm `required` hay ô Học nào** (đúng kết luận SK-041 13/11 N1). Mỗi khối bốn màu khác nhau. `messages.full` đúng chữ chung ở cả bảy bài; `has_limited` nói lý do, không nhắc chạm; không nhãn nhóm nào có dấu phẩy. Ba ví dụ kiểm ở Ghi chú cho dev của mỗi bài tính tay theo `success_when: all_required_and_no_limit` ra đúng `balanced` · `has_limited` · `missing.*`.
- **Từ vựng:** bốn từ mỗi bài (bài 4 năm từ), hai từ `core` (bài 4 ba từ), `term_keys` của `word_list` khớp đúng danh sách `core` ở cả bảy bài.
- **Danh mục:** `topic_id` và bảy `lesson_id` khớp đúng `content/syllabus.json`; tên bài EN/VI khớp từng chữ; `oak_lessons`, `statutory: true` khớp bảy lesson Oak đúng thứ tự. Không `id` nào trùng trong cả `content/`.
- **Các `[CẦN KIỂM]` của sườn Oak đều đã xử đúng:** lá rụng là "đã chết" chứ không phải "không sống" (bài 1 không có vật đã chết; bài 3 dạy riêng); không vật gỗ, giấy, vải bông, da nào bị xếp vào "chưa từng sống" (chỉ nhựa, thuỷ tinh, đá, kim loại); không dùng hoa hướng dương; không có Bắc Cực, thông, vân sam; không coi cái ao là nơi sống nhỏ (bài 6 q5 để ao làm nơi sống "vừa"); không có lũ lụt trong mối đe doạ bài 7; không dùng câu quiz nhiều đáp án đúng kiểu hải cẩu, xương rồng.
- **"Cây cũng cử động" nói đúng mức 5–7:** ví dụ là ba chuyện nhìn thấy được (`02:150-155` tua cuốn dây mướp quấn giàn, cây non nghiêng về phía sáng, hoa nở buổi sáng) cộng cây trinh nữ cụp lá — đều là cử động thật của cây, không ví dụ nào sai. Bài cặp đôi đúng ý ngược ("cử động chưa chắc đã sống") ở ô Học `02:175-189` và câu q6.
- **Đang sống / đã chết / chưa từng sống dùng đúng nghĩa:** `03:129-144` ô "Dead" là lá khô, cành khô, vỏ sò rỗng, luôn kèm "đã từng sống"; `03:146-162` ô "Never alive" là đá, bi thuỷ tinh, chai nhựa, thìa kim loại, kèm câu "chưa bao giờ sống, nên không thể chết"; kệ Chơi và câu q5 tách đúng ba nhóm; q6 "A stone is dead." (Sai) bắt đúng `non_living_means_dead`.
- **Ranh giới với *Chuỗi thức ăn*:** chữ bé nghe không có "săn mồi", "gặm cỏ", "là thức ăn của", không có chuỗi nào, không có mũi tên; không dùng bốn chuỗi Việt Nam của chủ đề đó (lúa-chuột-rắn; cỏ-châu chấu-ếch; rong-tôm-cá-cò). Chỉ một chỗ nói gần tới quan hệ ăn — xem n2.
- **Luật Explorer 1–7:** đọc hết hai mươi ba câu ba lựa chọn và mười câu hai lựa chọn — không câu nào hỏi tên, chữ cái hay cách viết (luật 1); mọi lựa chọn và mọi thẻ là một vật hay một cảnh cụ thể, vẽ được (luật 2); mọi `brief` ghi "không có chữ" (luật 4); không câu nào có hai hình dễ lẫn (luật 7). Mọi câu `true_false` có hình của đúng vật được nói tới và là câu khẳng định (luật 5). `hint` không câu nào nhắc vị trí thẻ ("the second card") hay chữ trên màn (luật 6).

### Lỗi chặn (0)

Không có chỗ nào sai khoa học hay sai chữ trẻ nghe tới mức phải chặn `tts`. Năm mục dưới nên sửa trước khi designer đi tìm ba mươi tư ảnh mới và trước khi chạy `tts`.

### Nên sửa (5)

**N1. Bài 2 q6 nói cây trinh nữ "cử động chậm", trong khi chính bài vừa dạy ba lần rằng nó cử động nhanh.**
- `02-vat-song-nao-cung-cu-dong.md:509-510`: `explanation_correct.en: Yes! It moves slowly, but it is alive.` · `explanation_correct.vi: Đúng rồi! Cây trinh nữ cử động chậm, nhưng là vật sống.`
- Ba chỗ nói ngược, đều trong cùng bài, đều là chữ app đọc: `02:167-168` ví dụ của ô Học "lá cụp lại rất nhanh" · "the leaves fold up fast"; `02:380-381` `explanation_correct` của q2 "Its leaves fold up fast when touched."; `02:598-599` thẻ thưởng `tag` "A plant that moves fast" · "Cây cử động nhanh".
- Bé 5–7 tuổi nghe xong bốn câu này trong một lượt chơi sẽ không biết trinh nữ nhanh hay chậm. Câu q6 còn là câu misconception của bài (`moving_means_alive`), tức là câu phải nói rõ nhất.
- Câu q6 cũng không cần chữ "chậm": đáp án đúng vì cây **lớn lên và cần nước**, đúng như `hint` của chính câu (`02:507-508` "Which one grows and needs water?"). Bản EN còn mở đầu bằng "It" không có chủ ngữ, trong khi bản VI gọi tên cây.
- **Sửa:** `02:509-510` → `explanation_correct.en: Yes! A sensitive plant grows, so it is alive.` (tám từ) · `explanation_correct.vi: Đúng rồi! Cây trinh nữ lớn lên, nên là vật sống.` Giữ nguyên `explanation_wrong` (`02:511-512`) và ba chỗ "nhanh" ở trên.

**N2. Bài 7, ô Học "Look gently": câu chính rủ bé nhấc hòn đá mà không có người lớn trong câu.**
- `07-bao-ve-nhung-noi-song-nho.md:155-156`: `sentence.en: Look, then put the stone back.` · `sentence.vi: Em nhìn xong thì đặt hòn đá lại chỗ cũ.`
- `_topic.md:343` tự đặt luật: "không câu nào bảo bé tự lật đá, bắt con vật; **mọi lời rủ quan sát kèm 'đi cùng người lớn'**". `07:633` (Ghi chú cho dev) ghi lý do: dưới đá, đống lá có thể có rết, bọ cạp, rắn. Nhưng "đi cùng người lớn" chỉ nằm ở ví dụ một (`07:160-161`), còn `sentence` là câu app đọc trước và là câu bé nhớ; câu đó đã giả định bé nhấc đá lên rồi.
- Hai chỗ liên quan **không** cần sửa: `07:379-380` q2 dùng "We" · "mình" (việc chung, không sai bảo bé), và `06:24` ghi rõ lời dặn này thuộc bài 7 nên bài 6 đúng khi không có.
- **Sửa:** `07:155-156` → `sentence.en: Look with a grown-up, then put it back.` (tám từ) · `sentence.vi: Em nhìn cùng người lớn, rồi đặt hòn đá lại chỗ cũ.` Ví dụ một (`07:160-161` "go with a grown-up" · "đi cùng người lớn") khi đó đổi sang một ý khác, ví dụ `examples.1.en: lift the stone slowly` · `examples.1.vi: nhấc hòn đá thật nhẹ`.

**N3. Bài 7 q1 và q3 là hai câu đối xứng, chọn đúng được bằng cảm tính "cái nào trông tốt", không cần ý của bài.**
- `07:329-372` q1 `prompt.en: Which one harms tiny animals?` — ba lựa chọn: luống hoa, **rác (đúng)**, đĩa nước. Rác là thứ xấu duy nhất.
- `07:394-438` q3 `prompt.en: What helps butterflies?` — ba lựa chọn: đốt lá khô, thuốc sâu, **luống hoa (đúng)**. Luống hoa là thứ tốt duy nhất.
- Hai câu liền nhau, cùng DOK 1, và chính luống hoa là lựa chọn sai ở q1 rồi thành đáp án ở q3. Bé Explorer chỉ nhìn hình: một bên là rác và lửa và bình thuốc, một bên là hoa và nước — loại bằng cảm giác là xong cả hai câu, không cần nhớ ô Học nào. Bài 7 là bài `review` nên hai trong sáu câu chạy không tải ý là nhiều.
- **Sửa:** giữ q1 (câu đó đúng vai "nhận ra mối đe doạ"), đổi **ba lựa chọn** của q3 thành ba việc tốt khác nhau, mỗi việc giúp một con khác nhau — đúng như ô Học `07:189-190` ("Flowers help butterflies. Water helps birds." · "Hoa giúp bướm. Nước giúp chim.") và ví dụ ba của ô "Wild corner" (`07:181-182` ống tre cho ong). Giữ `prompt` (`07:399-400` "What helps butterflies?" · "Cái gì giúp bướm?") và `hint` (`07:404-405`); thay `q3_fire` (`07:411-419`) bằng bó ống tre (dùng lại `tray_tubes`, `label.en: bamboo tubes` · `label.vi: bó ống tre`, `feedback.en: Bamboo tubes are a home for bees.` · `.vi: Bó ống tre là chỗ ở cho ong.`) và `q3_spray` (`07:421-429`) bằng đống cành khô (dùng lại `tray_sticks`, `label.en: pile of sticks` · `label.vi: đống cành khô`, `feedback.en: A pile of sticks hides millipedes and snails.` · `.vi: Đống cành khô là chỗ trốn của cuốn chiếu.`). Đáp án vẫn duy nhất vì ô Học ghép rõ từng việc với từng con (hoa đi với bướm, ống tre với ong, đống cành với con vật trốn), và bé phải nhớ ô Học thay vì chọn theo cảm giác. **Không lấy đĩa nước làm lựa chọn sai:** chính dòng `[CẦN KIỂM]` ở `07:287` ghi "đặt vài viên sỏi trong đĩa để **ong, bướm** đậu uống", nên đĩa nước cũng giúp bướm — đúng kiểu câu nhiều đáp án đúng mà sườn Oak đã cảnh báo (`docs/oak/living-things-and-where-they-live.md:107`). Ảnh lửa và bình phun thuốc vẫn vào bài ở kệ Chơi và từ `harm`, không mất ảnh nào; sửa kèm bảng Hình dùng chung `_topic.md:243`, `:245` (bỏ `q3_fire`, `q3_spray`), `:241` (thêm `q3_sticks` vào dòng `explore_wild_corner`) và thêm một dòng cho `tray_tubes` (nay dùng hai chỗ).

**N4. Bài 5, lời nhắn khi chọn món bẫy nói dương xỉ mọc ở "đất khô hơn", ngay sau khi ô Học dạy dương xỉ thích chỗ ẩm.**
- `05-noi-song-cua-cay.md:205-206`: `messages.has_limited.en: That plant grows on drier land.` · `.vi: Cây này mọc ở chỗ đất khô hơn.`
- Lời nhắn này dùng chung cho cả ba món bẫy. Với xương rồng (`05:246-252`) và tre (`05:287-293`) thì đúng; với dương xỉ (`05:263-269`) thì chọi thẳng vào ô Học bé vừa nghe: `05:165-166` "Ferns like shady, damp places." · "Dương xỉ thích chỗ râm và ẩm." và `05:336-337` `feedback` "A fern grows in damp shade." · "Dương xỉ mọc ở chỗ râm, ẩm." Biên tập đã biết đây là "bẫy khó nhất" (`05:188`), nhưng cái khó nên nằm ở việc nghĩ, không nằm ở hai câu ngược nhau trong cùng một bài.
- **Sửa:** `05:205-206` → `messages.has_limited.en: That plant does not stand in water.` (bảy từ) · `.vi: Cây này không mọc trong nước.` — khớp đúng nhãn nhóm `limit` (`05:233-234` "Not in water" · "Không mọc trong nước") và đúng cho cả ba món bẫy. Nhãn nhóm, `prompt` (`05:195-196`) và `messages.start` (`05:199-200`) không phải đổi.

**N5. Bài 7 q5: ảnh lựa chọn đúng là con giun **trên đất ẩm**, tức bằng chứng nhìn thấy cho đáp án.**
- `07:466-467` `prompt.en: Which one needs a dark, damp place?` · `prompt.vi: Con nào cần chỗ tối và ẩm?`; đáp án `q5_earthworm` (`07:489-495`) dùng lại ảnh `da-va-dat/the-nao-la-dat-tot` `earthworm`, brief gốc "giun đất trên đất ẩm" (ảnh thấy mặt đất sẫm, ẩm). Hai lựa chọn sai là bướm trên hoa nắng và chim sẻ trên cành sáng.
- Biên tập đã thấy một nửa vấn đề và rút gọn `alt` ("An earthworm" · "Con giun đất", ghi lý do ở `07:477`) để VoiceOver không đọc chữ "damp". Nhưng bản thân tấm ảnh vẫn nói đúng chữ của câu hỏi, mà bé Explorer trả lời bằng mắt chứ không bằng `alt`. Đây đúng là luật `_topic.md:181` ("ảnh lựa chọn không chứa đúng chữ của câu hỏi"), luật mà chính chủ đề đã áp cho bài 6 q4 (ảnh dế trên đất, không trên lá khô) và bài 7 q6 (không lấy bướm đậu trên hoa làm đáp án).
- **Sửa (chọn một):** (a) thêm một dòng vào Ghi chú cho hoạ sĩ `07:621-624`: riêng ô `q5_earthworm` cắt sát con giun, nền đất chỉ còn một dải mờ, không thấy rõ đất ướt — chủ đề đã cho phép cắt riêng từng khung (`_topic.md:174`); (b) đổi `prompt` sang một nhu cầu khác cũng nhìn thấy được, ví dụ `prompt.en: Which one hides away from the light?` · `prompt.vi: Con nào trốn chỗ có ánh sáng?` — nhưng khi đó phải xem lại q6 ngay sau (`07:513` "Which one likes to sit in the sun?") để hai câu không thành một cặp đúng/ngược. Tester nghiêng về (a): ít chữ đổi, giữ nguyên cặp q5 (tối, ẩm) — q6 (nắng) vốn là cách bài sửa `tiny_animals_same_place`.

### Nhỏ (17)

- **n1. Nhãn EN và VI của một lựa chọn không cùng vật** (`01-vat-song-hay-khong-song.md:400-401`): `label.en: water` · `label.vi: cốc nước`, ảnh là một cốc nước trên bàn. `label` là tên app đọc sau khi bé chạm và là nhãn VoiceOver, nên hai bản nên cùng một vật. Đề xuất `label.en: a glass of water` (ảnh và `alt` `01:403-404` đã là "A glass of water"); đáp án vẫn là "nước" trong `explanation_*`.
- **n2. Bài 4 nói thẳng "ếch ăn côn trùng" ở hai chỗ, trùng ý cốt lõi của *Chuỗi thức ăn***: `04-noi-song-cua-con-vat.md:534-535` `explanation_wrong` "Ponds have bugs for frogs." · "Ở ao có côn trùng cho ếch ăn." và `04:536-537` `feedback_false` "A pond has small bugs for a frog." · "Ao có côn trùng nhỏ cho ếch ăn." Chủ đề kế có đúng ý này làm bài học: `content/explorer/chuoi-thuc-an/02-chuoi-thuc-an-la-gi.md:134-135` ô Học "A frog eats grasshoppers." · "Ếch ăn châu chấu." và `:379-380` câu q3 "What is food for a frog?" đáp án con châu chấu. `_topic.md:350` đã ghi là chấp nhận; câu misconception `habitat_is_a_home` chỉ cần ý "ao có thức ăn" là đủ. Nếu muốn sạch ranh giới: `04:534` → "This is true. A pond has food for frogs." · "Câu này đúng. Ở ao có thức ăn cho ếch."; `04:536` → "A pond gives a frog food and water." · "Ao cho ếch thức ăn và nước." Ví dụ ô Học `04:162-163` ("tiny bugs to eat" · "côn trùng nhỏ để ăn") giữ nguyên, vì đó là nói nơi sống **có** gì.
- **n3. Bài 2 q2 là câu phủ định trá hình** (`02:372-373`): `prompt.en: A sensitive plant stays still when touched.` · `prompt.vi: Chạm vào cây trinh nữ, cây vẫn đứng yên.`, `answer: false`. Theo chữ thì không vi phạm luật Explorer số năm (không có "not", "không"), nhưng lý do của luật vẫn đúng: bé phải bác một câu "đứng yên" để ra ý "cụp lại". Ảnh lá đang xoè lại đẩy nhẹ bé về phía "Đúng". Tester **không bắt sửa** (viết lại dạng khẳng định mà đáp án vẫn Sai thì ảnh thành bằng chứng, hỏng hơn), chỉ ghi lại để người duyệt nghe thử bản VI.
- **n4. Hai câu `single_choice` hỏi theo chiều phủ định** (`01:412-413` "Which one is non-living?" · "Cái nào là vật không sống?"; `03:341-342` "Which one was never alive?" · "Cái nào chưa từng sống?"). Luật Explorer số năm chỉ cấm ở `true_false`, và hai ý này không viết khẳng định được, nên giữ. Như SK-041 13/11 n13: ghi một dòng vào Ghi chú cho dev của hai bài để ios-dev cho đọc chậm, nhấn "không" · "non-living", "chưa từng" · "never".
- **n5. `feedback` và `hint` gần lặp ý ở bài 1 q1** (`01:314-315` "A ball does not eat or drink." · "Quả bóng không ăn, không uống." rồi `01:305-306` `hint` "Which one eats and drinks?" · "Em tìm cái nào biết ăn, biết uống nhé."). App đọc liền hai câu. Không sai (câu sau đổi hướng nhìn), chỉ nghe hơi thừa; cùng kiểu ở `01:332-333` với dép. Đề xuất đổi `hint` bài 1 q1 sang một dấu hiệu khác, ví dụ "Which one grows bigger each day?" · "Em tìm cái nào mỗi ngày một lớn nhé."
- **n6. Từ vựng `vine` không khớp cách gọi của cả bài** (`02:582-583` `term.vi: dây leo`), trong khi mọi `label` và ví dụ dùng "dây mướp" (`02:419`, `02:470`, `02:585`, `03:71`) và `_topic.md:166` cũng ghi "dây mướp". Chọn một; đề xuất `term.vi: dây mướp` cho khớp hình (ảnh là ngọn dây mướp có tua cuốn).
- **n7. Ba ô Học bài 3 mở đầu bản EN bằng đại từ không có chủ ngữ** (`03:116` "It is living now. It can grow.", `03:133` "It was alive once. Now it is not.", `03:150` "It was never alive. It cannot die."), trong khi bản VI có "Vật này". Bé Explorer nghe EN trước (SK-042). Đề xuất gọi tên vật trong hình ở câu đầu mỗi ô: "This green leaf is living now. It grows." / "This leaf was alive once. Now it is not." / "This stone was never alive. It cannot die." (mỗi câu ≤ tám từ).
- **n8. Thẻ thưởng bài 6 dùng cách nói "boy cricket"** (`06:602` `fact.en: A boy cricket sings by rubbing its wings.`): bản VI "Dế đực" đúng, bản EN nghe lạ với người bản ngữ. Giữ hay đổi là việc của người duyệt EN; nếu đổi, "Only boy crickets sing. They rub their wings." (năm và năm từ) giữ được ý `[CẦN KIỂM]` ở `06:607` (chỉ con đực kêu).
- **n9. Bài 1 dùng hai nhãn cho cùng một ý trong một bài:** ô Học `01:163-164` "Non-living things" · "Vật không sống" và nhóm Chơi `01:227-228` "Not alive" · "Không sống". Bé Explorer nghe, không đọc, nên hai cụm khác nhau cho cùng một nhóm dễ làm chùng ý. Đề xuất nhóm Chơi đổi về "Non-living" · "Vật không sống"; các bài sau không vướng (bài 3 có lý do riêng ghi ở `03:216`).
- **n10. Bài 6 w1 tự nhận ảnh gợi đáp án** (`06:75`): ảnh xương rồng thấy cát, mà câu hỏi là "Which plant likes dry, sunny sand?". Biên tập ghi lý do chấp nhận (DOK 1 nhớ lại, ảnh sen cũng thấy nước ao) — tester đồng ý giữ, ghi lại cho đủ.
- **n11. Bài 7 w2 là câu ôn yếu** (`07:83-84` "People make plastic bottles." · "Chai nhựa do con người làm ra.", Đúng): bé trả lời đúng mà chưa cần nhớ ý "chưa từng sống" của bài 3; chỉ `explanation_correct` (`07:91-92`) mới nối lại được. Đề xuất một câu bắt đúng ý hơn, vẫn khẳng định, vẫn Đúng: "A plastic bottle was made in a factory." (bảy từ) · "Chai nhựa được làm ra trong nhà máy." — hoặc để nguyên nếu PM thấy mốc giãn cách quan trọng hơn độ khó.
- **n12. Bài 3 q1 gần như cho không điểm** (`03:280-314`): hai lựa chọn, một lá xanh trên cành và một lá khô nâu dưới đất, `hint` (`03:290-291`) lại bảo "nhìn màu của từng chiếc lá". DOK 1 mở đầu nên chấp nhận; ghi lại vì đây là câu duy nhất của chủ đề mà `hint` gần như gọi tên đáp án.
- **n13. Bài 2 q3 gợi sẵn một phần đáp án của q4** (`02:402-403` `explanation_wrong` "The answer is the vine. It climbs slowly." rồi `02:439` q4 "Tap from slowest to fastest." với dây mướp đứng đầu). Chỉ bé trả lời sai q3 mới nghe câu đó; chấp nhận, ghi lại như SK-044 đã ghi các chỗ lộ nhẹ.
- **n14. Màn Học quá mười lăm từ EN nếu đếm cả ví dụ:** đếm máy hai mươi tám ô Học, `label` + `sentence` + ba đến bốn `examples` cho ra mười tám đến hai mươi sáu từ EN, trong khi TEMPLATE mục "Chữ cho trẻ" ghi Explorer ≤ mười lăm từ một màn. Chủ đề trước cũng vậy và đã qua hai lượt rà, nên tester **không bắt sửa**; đề xuất PM chốt cách đếm cho màn `explore_groups` (bé chạm từng ô, không nghe hết một lượt) rồi ghi vào TEMPLATE.
- **n15. `syllabus.md:114` còn ghi chủ đề này ở số mười một** ("| 11 | Sinh vật sống ở đâu? | … | 7 (7) | 3 |") trong khi `content/syllabus.json` đã là số hai. Biên tập đã ghi ở `_topic.md:368`; việc của PM, giống n2 của SK-041 13/11.
- **n16. Ba việc chờ người khác, biên tập đã liệt kê đủ ở `_topic.md:366-377`:** `stage` bài 7 (`review` hay `apply`), `difficulty.prior_knowledge` 3 → 2, khoá `collectible.set.living_things`, và dòng cho phụ huynh ở bài 3. Tester không có ý kiến khác; riêng `stage` bài 7, bài này có bốn ô Học mới và hai từ `core` mới nên giống hệt trường hợp bài 8 chủ đề trước (SK-041 13/11 n5) — nếu PM đã chọn `core` cho bài đó thì nên nhất quán.
- **n17. `check_img.py` báo "ALT LỆCH" ở `07:493-495`** (`alt` "An earthworm" · "Con giun đất" so với gốc "An earthworm on damp soil" · "Con giun đất trên đất ẩm"). **Không phải lỗi**: đây là ngoại lệ "sửa `alt` để khỏi lộ đáp án" của TEMPLATE, biên tập ghi lý do ở `07:477` và `_topic.md:181`. Ghi lại để lượt rà sau khỏi báo trùng.

### Chưa kiểm

- Không chạy `validate`, `ids`, `import`, `tts`, `build`; phiên chính đã chạy `validate` 14/11 (0 lỗi) và tester không chạy lại.
- Không kiểm ảnh: chủ đề chưa có file chọn ảnh (`content/images/explorer/sinh-vat-song-o-dau/` chưa có), nên chưa kiểm được giấy phép, khung 5:2 và 17:10, ảnh rừng đước và xương rồng trên đồi cát Việt Nam có nguồn hợp lệ hay không, ảnh dưới hòn đá có con vật nhỏ mà không có rết hay bọ cạp hay không.
- Không dùng simulator: màn Explorer thật (chip nhóm có chữ, renderer `order_sequence`, số từ trên một màn Chơi, bong bóng mascot đọc `feedback` rồi `hint`) vẫn thuộc SK-040 và SK-044.
- Không nghe thử giọng đọc các từ khó: "microhabitat", "mangrove", "mudskipper", "sensitive plant", "Indian almond tree", "water hyacinth", "habitat", "millipede", "firefly".
- Không đối chiếu sách Tự nhiên và Xã hội (CT GDPT 2018) để chốt từ tiếng Việt cho "microhabitat" (`_topic.md:376`).
- Hai mươi tư dòng `> [CẦN KIỂM]` trong bảy bài và `_topic.md` tester chỉ đọc ở mức hợp lý với trẻ 5–7, không thay cho người chuyên môn: tốc độ lớn của măng tre, lá trinh nữ khép ban đêm, tua cuốn chậm hơn ốc sên, lá bàng đỏ trước khi rụng, vỏ sò rỗng, cá thòi lòi chống vây ngực, cua còng đào hang, chuồn chuồn tính là con vật của ao, cá heo sông Mê Kông, xương rồng trữ nước trong thân, lúa nương trên đất khô, rễ đước giữ bùn, lá sen không thấm nước, bọ cánh cứng dưới vỏ cây, dế đực kêu, giun thở qua da, thằn lằn phơi nắng, ong đơn độc làm tổ trong ống tre, đom đóm phát sáng cuối bụng. Không chỗ nào tester thấy sai.

## content-editor 14/11 · sửa theo tester

Không chạy lệnh. Không đổi dòng `id:` nào; không thêm, không xoá khối có id (chỉ đổi `#### option` của bài 7 q3). Trước đó đã đổi key món `tray_flowers` → `tray_flower_bed` ở bài 7 (lỗi `validate` key trùng với nhóm cùng tên).

**Đã sửa cả năm mục nên sửa**
- **N1** bài 2 q6: `explanation_correct` → "Yes! A sensitive plant grows, so it is alive." · "Đúng rồi! Cây trinh nữ lớn lên, nên là vật sống."
- **N2** bài 7 ô "Look gently": `sentence` → "Look with a grown-up, then put it back." · "Em nhìn cùng người lớn, rồi đặt hòn đá lại chỗ cũ."; ví dụ một → "a grown-up lifts the stone slowly" · "người lớn nhấc hòn đá thật nhẹ". Ví dụ để người lớn nhấc đá, không để bé nhấc.
- **N3** bài 7 q3: hai lựa chọn sai đổi thành bó ống tre (`q3_tubes`, dùng lại `tray_tubes`) và đống cành khô (`q3_sticks`, dùng lại `explore_wild_corner`; không trỏ `tray_sticks` vì món đó cũng là hình dùng lại). Feedback đúng như tester đề xuất (VI ống cành thêm "ốc sên" cho khớp EN). Giữ `prompt`, `hint`, đáp án luống hoa ở chỗ thứ ba. Bảng Hình dùng chung sửa theo.
- **N4** bài 5: `messages.has_limited` → "That plant does not grow in water." · "Cây này không mọc trong nước." (dùng "grow" thay "stand" của đề xuất, cho khớp nhãn nhóm và lệnh).
- **N5** chọn (a): bài 7 thêm dòng `>` dưới `q5_earthworm` và dòng Ghi chú cho hoạ sĩ: cắt sát con giun, nền đất chỉ còn dải mờ, mục riêng có `crop` riêng.

**Nhỏ đã sửa**
- n1 bài 1 q3: `label.en` → "glass of water" (không mạo từ, như mọi nhãn khác).
- n2 bài 4 q6: `explanation_wrong` → "This is true. A pond has food for frogs." · "Câu này đúng. Ở ao có thức ăn cho ếch."; `feedback_false` → "A pond gives a frog food and water." · "Ao cho ếch thức ăn và nước." Không còn chỗ nào nói "ếch ăn côn trùng"; ví dụ ô Học "tiny bugs to eat" giữ (nói ao có gì). Sửa kèm ghi chú bài 4 và mục Ranh giới ở `_topic.md`.
- n3 bài 2 q2 (phủ định trá hình), sửa dù tester không bắt: câu mới "A sensitive plant folds up when touched." · "Chạm vào cây trinh nữ, lá cây cụp lại." (Đúng; ảnh lá đang xoè nên không làm bằng chứng). Để bài 2 vẫn có một câu Sai, q5 đổi từ "A snail is slow, but it is alive." (Đúng) sang "A plant moves faster than a snail." · "Cây cử động nhanh hơn ốc sên." (Sai, hình dây mướp, DOK 2); q4 `explanation_correct` đổi sang "Yes! The egret is the fastest one here." để không nói trước đáp án q5. Tổng Đúng/Sai cả chủ đề vẫn mười một · mười một.
- n4 bài 1, bài 3: thêm dòng đề xuất ios-dev đọc chậm, nhấn "non-living" · "không", "never" · "chưa từng" ở Ghi chú cho dev.
- n5 bài 1 q1: `hint` → "Which one grows bigger each day?" · "Em tìm cái nào mỗi ngày một lớn nhé."
- n6 bài 2 từ `vine`: `term.vi` → "dây mướp".
- n7 bài 3 ba ô Học: "This green leaf is living now. It can grow." · "Chiếc lá xanh này đang sống. Lá còn lớn lên được."; "This leaf was alive once. Now it is not." · "Chiếc lá này đã từng sống. …"; "This stone was never alive. It cannot die." · "Hòn đá này chưa bao giờ sống, nên không thể chết."
- n8 bài 6 thẻ: `fact` → "Only boy crickets sing. They rub their wings." · "Chỉ dế đực mới kêu. Dế đực cọ hai cánh vào nhau."
- n9 bài 1 nhóm Chơi `tray_not` → "Non-living" · "Vật không sống" (khớp ô Học). Cùng lý do, bài 2 nhóm Chơi VI → "Không phải vật sống" (khớp ô Học "Not alive" · "Không phải vật sống" của bài 2).
- n11 bài 7 w2 → "A plastic bottle was made in a factory." · "Chai nhựa được làm ra trong nhà máy." (Đúng); `feedback_false` → "A bottle never grew like a plant." · "Cái chai chưa bao giờ lớn lên như cái cây."

**Nhỏ không sửa:** n10, n12, n13, n17 (tester đồng ý giữ hoặc chỉ ghi lại); n14, n15, n16 (việc của PM; đã liệt kê ở `_topic.md`, mục Đề xuất và Còn mở).

**Chữ trẻ nghe đổi** (cần sinh lại giọng nếu đã chạy `tts`): bài 1 q1 `hint`, q3 nhãn, nhóm Chơi `tray_not`; bài 2 q2 (cả câu), q4 `explanation_correct`, q5 (cả câu), q6 `explanation_correct`, từ `vine` VI, nhóm Chơi `tray_not` VI; bài 3 ba `sentence` ô Học; bài 4 q6 `explanation_wrong`, `feedback_false`; bài 5 `messages.has_limited`; bài 6 thẻ `fact`; bài 7 w2 (cả câu), ô "Look gently" `sentence` và ví dụ một, q3 hai lựa chọn sai.

**Cập nhật kèm `_topic.md`:** bảng Đúng/Sai (bài 2 q2, q5; bài 7 w2), bảng Khởi động (bài 7 w2), bảng Phần Chơi (nhãn bài 1, 2), bảng Hình dùng chung (`tray_snail`, `explore_slow_plants`, `explore_wild_corner`, `tray_fire`; bỏ dòng `tray_spray`, thêm dòng `tray_tubes`), mục Ranh giới.

## Hình đổi sau rà chữ

| Bài · chỗ | Trước | Sau | Ghi chú cho designer |
| --- | --- | --- | --- |
| 7 `items.tray_flowers` (món Chơi luống hoa) | khoá `tray_flowers` | khoá `tray_flower_bed` | Cùng ảnh, chỉ đổi khoá; q1, q3 trỏ `tray_flower_bed` |
| 7 q3 lựa chọn | `q3_fire` (dùng lại `tray_fire`) | `q3_tubes`, dùng lại `tray_tubes`; `alt` "A bundle of bamboo tubes" · "Bó ống tre" | Thẻ 5:2, cắt bó ống nằm ngang |
| 7 q3 lựa chọn | `q3_spray` (dùng lại `tray_spray`) | `q3_sticks`, dùng lại `explore_wild_corner`; `alt` "A pile of sticks in a garden" · "Đống cành khô trong góc vườn" | Thẻ 5:2 |
| 7 `tray_fire`, `tray_spray` | dùng ở kệ Chơi và câu q3 | chỉ còn kệ Chơi (lửa còn từ `harm`) | Không mất ảnh nào |
| 7 q5 `q5_earthworm` | dùng lại `earthworm` (*Đá và đất*) | giữ ảnh, thêm yêu cầu cắt sát con giun, nền đất chỉ còn dải mờ | Mục riêng có `crop` riêng, không `same_as` |
| 2 q2 (hình câu hỏi) | trinh nữ lá xoè, câu Sai | giữ ảnh, câu Đúng | Không đổi ảnh |
| 2 q5 (hình câu hỏi) | dùng lại `tray_snail` (ốc sên) | dùng lại `explore_slow_plants` (dây mướp); `alt` "A vine curling around a stick" · "Ngọn dây leo quấn quanh thanh tre" | Khung câu hỏi 4:3 |

## designer 14/11 · ảnh

Đã làm: bảy file chọn ảnh `content/images/explorer/sinh-vat-song-o-dau/*.json`, **273 / 273** chỗ có hình. `images fetch content/images/explorer/sinh-vat-song-o-dau`: 0 lỗi, **0 cảnh báo tỉ lệ**, không bài nào "Chưa kiểm tỉ lệ". Không sửa `.md`. Nhịp Commons ≥ 4,5 s (lượt tìm và lượt fetch); không có 429 trong lượt fetch.

- **Ảnh mới (34):** toàn ảnh chụp, CC0 6, Public domain 1, PDM 1, CC BY 26 (2.0/2.5/3.0/4.0, ghi công). Bảy ảnh Flickr qua Openverse (đom đóm, ống tre, đĩa nước, kiến trên vỏ cây, xương rồng trên cát, xương rồng trong chậu, cây non) đã mở trang gốc, trường giấy phép khớp. Mỗi ảnh cắt riêng theo khung (5:2, 17:10, 4:3, 1:1, 2:1).
- **Dùng lại:** ảnh của *Gọi tên và nhóm động vật* trỏ thẳng tới mục có crop đúng khung; ảnh Discoverer chép nguyên mục gốc (cốc nước của *Hô hấp* chép từ gốc thật `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` `q4`). Mười bảy chỗ dùng lại sai hướng khung có mục riêng với crop riêng: bóng bay 5:2 (bóng nằm trọn giữa trời xanh), quả bóng 5:2, rừng 5:2, sen vuông, chuồn chuồn vuông, bướm 5:2, giun thẻ từ 2:1, và **bài 7 `q5_earthworm` cắt sát con giun** (nền đất chỉ còn dải mỏng, theo N5).
- **Hai ảnh gốc dọc chưa thật hợp thẻ 5:2:** chai nước (`q3_bottle` bài 3) và cốc nước (`q3_water` bài 1). Đã cắt ngang nhất mà còn gần trọn vật (lệch dưới 2,2 nên không cảnh báo), nhưng app vẫn cắt tiếp cho đầy thẻ, nên mất nắp hoặc đáy. Nếu thấy khó nhận ra trên máy: đổi sang ảnh chai, cốc đặt nằm ngang.

**Đổi so với brief (đề xuất biên tập sửa `brief`/`alt` trong `.md`):**

| Bài · chỗ | Brief | Ảnh thật | Đề xuất |
| --- | --- | --- | --- |
| 1 `explore_plants` | hàng rau non trên luống | một cây non mới nhú trên đất | `alt` "A young plant in the soil" · "Cây non mọc trên đất" |
| 1 `q1_sandals` | dép nhựa xanh trên nền gạch | đôi dép tông da nâu trên mặt bàn | `alt` "A pair of flip-flops" · "Đôi dép tông" |
| 1 `bamboo_card` | bụi tre làng có măng | bụi tre gai trong công viên, không thấy măng | Bỏ "măng" ở brief |
| 2 `explore_slow_plants` | dây mướp quấn thanh tre | tua cuốn dây chanh leo quấn sợi dây giàn | `alt` "A vine curling around a wire" · "Ngọn dây leo quấn quanh sợi dây" |
| 3 `tray_stick` | một cành khô nằm trên đất | cành bạch dương khô gãy nằm trên đất, cùng đợt chụp với ảnh đống cành bài 7 (khác khung) | Giữ chữ |
| 3 `q4_yellow` | lá vàng còn trên cành | cành có lá ngả vàng (đã cắt bỏ phần có tuyết) | Giữ |
| 4 `explore_mangrove` | rừng đước Cần Giờ lúc nước ròng | rễ đước chằng chịt trên bùn (Indonesia) | Giữ chữ; brief bỏ "Cần Giờ" |
| 4 `vocab.mudskipper` | cá thòi lòi trên bãi bùn | cá thòi lòi trên mỏm đá bùn ven nước | `alt` "A mudskipper by the water" · "Cá thòi lòi bên mép nước" |
| 5 `explore_dry_plants` | xương rồng trên đồi cát Ninh Thuận | bụi xương rồng tai thỏ trên đất cát sỏi (Mỹ) | Bỏ "Ninh Thuận" ở ghi chú (như brief dặn) |
| 6 `explore_stone` | đất ẩm dưới hòn đá vừa nhấc, thấy mép đá | mọt ẩm (bọ ba đuôi đất) trên đất ẩm, không thấy mép đá; không có ảnh hợp lệ thấy mép đá | `alt` "Woodlice on damp soil" · "Con mọt ẩm trên đất ẩm"; câu ô Học nói "dưới hòn đá" vẫn đúng |
| 6 `explore_wall` | tường gạch cũ có rêu, dương xỉ | mảng tường gạch cũ phủ rêu, không có dương xỉ | Bỏ "dương xỉ" ở brief |
| 7 `explore_wild_corner` | góc vườn có đống cành khô | đống cành khô trên nền cây xanh ở bìa rừng | Giữ |
| 7 `tray_water_dish` | đĩa sành có sỏi | đĩa nước nông trên bãi cỏ, hai con chim chìa vôi đến uống | `alt` "Birds at a dish of water" · "Chim uống nước ở đĩa nước" |
| 7 `tray_tubes`, `q3_tubes` | bó ống tre ở góc vườn | ống tre trong hộp gỗ cho ong, đã cắt bỏ biển chữ; ảnh nhỏ (thẻ 5:2 khoảng 409 × 164 px) | Giữ; xem trên máy |
| 7 `tray_spray` | bình phun nhựa bơm tay | bình phun đeo vai kiểu cũ bằng đồng, không nhãn | `alt` "An old garden sprayer" · "Bình phun thuốc kiểu cũ" |
| 7 `tray_fire` | đống lá nhỏ đang cháy | đống lá đang cháy bốc khói trong vườn (đã cắt bỏ góc nhà) | Giữ |
