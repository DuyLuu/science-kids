# Khung một bài (TEMPLATE)

Khung chuẩn cho mỗi bài `content/<age_group>/<topic_slug>/<nn>-<lesson_slug>.md` và mỗi chủ đề `content/<age_group>/<topic_slug>/_topic.md`. Bài mẫu: `content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md`. Tên trường theo SK-001 "Hợp đồng trường v1".

## A. Hướng dẫn cho biên tập

**Tạo bài mới**
1. Chép khung ở mục B vào file mới, ví dụ `content/discoverer/an-uong-lanh-manh/02-mam-com-can-bang.md`. `nn` là thứ tự bài, hai chữ số; phần sau `nn-` trùng `slug`.
2. Điền từ trên xuống. Không đổi, không thêm, không bỏ tên mục `##`. Mục không dùng (ví dụ Thưởng) thì giữ tiêu đề, để trống.
3. Xong thì mở pull request. Hiện `validate` chỉ kiểm file JSON và báo lỗi theo vị trí trong JSON (ví dụ `/quiz/1/sentence`), nên dev chép bài sang JSON rồi báo lại lỗi cho biên tập. Khi có `content-cli` (B8.0), máy kiểm thẳng file markdown và báo lỗi theo số dòng.

**Cú pháp (máy đọc được)**
- Mỗi dòng một trường `tên: giá trị`. Tên trường viết liền, không dấu cách. Giá trị nằm trên một dòng, không cần ngoặc kép.
- Cặp song ngữ luôn là hai dòng: `<tên>.en:` rồi `<tên>.vi:`. Mục chỉ có một chuỗi (Tiêu đề, Mục tiêu, Câu hỏi lớn) thì viết `en:` và `vi:`.
- Hình luôn là ba dòng: `<tên>.brief:` (gợi ý cho hoạ sĩ, tiếng Việt, một dòng: vật gì, bối cảnh Việt Nam), `<tên>.alt.en:`, `<tên>.alt.vi:`.
- Danh sách key viết trên một dòng, cách nhau bằng dấu phẩy: `term_keys: nutrient, protein`.
- Mỗi câu quiz, block, từ vựng, thẻ là một `### <key>`. Phần tử con là `#### <loại> <key>`, loại là `option`, `bank`, `item`, `bar` hoặc `group`.
- Dòng bắt đầu bằng `>` là ghi chú cho người duyệt; máy bỏ qua.

**id và key**
- Bài mới: `id:` để trống. Máy sinh mã và ghi ngược vào file. Trước khi có `content-cli`, dev sinh mã lúc chép sang JSON và ghi ở ticket; biên tập chép mã đó vào đúng dòng `id:`, như bài mẫu.
- Đã có mã thì không sửa, không xoá, không chép sang bài khác. Lấy bài mẫu làm điểm xuất phát thì xoá hết mã sau `id:`.
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

**Quiz (syllabus-progression mục 7; luật theo nhóm tuổi: SK-026)**

> Trạng thái phần sửa 1/11/2026: **nháp do AI soạn (content-editor), chưa duyệt** · Ticket: SK-026. Phần nháp gồm hai dòng gắn *(nháp AI)* ngay dưới đây, mục "Luật soạn câu Explorer", "Bảng luật theo nhóm tuổi" và dòng "Máy kiểm". Người duyệt xoá nhãn nháp sau khi duyệt.

- Đúng 6 câu, xếp dễ → khó. Câu 1 luôn DOK 1.
- DOK 1: nhớ lại. DOK 2: so sánh, phân loại, áp dụng vào tình huống quen. DOK 3: suy luận bằng bằng chứng, tình huống mới, bắt lỗi một lời nói.
- Câu bắt misconception ghi `misconception: <key>`; key lấy từ `_topic.md`. Số câu như vậy theo nhóm tuổi ở bảng dưới. *(nháp AI)*
- Format được dùng, số lựa chọn, chỗ bắt buộc có hình, phân bổ DOK, số format khác nhau và số từ mỗi câu: theo "Bảng luật theo nhóm tuổi" dưới đây. Nhóm tuổi lấy theo `age_group` trong `_topic.md` của chủ đề. *(nháp AI)*
- Câu nào cũng đủ `prompt`, `hint`, `explanation_correct`, `explanation_wrong`, cả EN và VI. Gợi ý dẫn đường, không nói thẳng đáp án.
- Khởi động 2–3 câu; câu nào cũng có `recall_from`.

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
   - Đạt: `label.en: duck` · `label.vi: con vịt` · `image.brief: Một con vịt cỏ đứng trên bờ ao, nền trơn, không có chữ`.
   - Không đạt: `image.brief: Con vịt trên bờ ao, mũi tên chỉ vào cánh kèm chữ "wing · cánh"`. Bài Discoverer được ghi nhãn trong hình (bài 1, câu w2); bài Explorer thì không.
5. **Đúng/Sai bằng biểu tượng.** Ở Explorer, app hiện hai thẻ biểu tượng, không có chữ Đúng/Sai. Vì vậy câu `true_false` luôn có `image` của cả câu, vẽ đúng vật được nói tới. `prompt` là một câu khẳng định ngắn về vật đó. Không dùng câu phủ định ("not", "không"): bé phải nghe kịp thêm chữ "không", và khi đáp án là Sai thì thành phủ định hai lần. Để trống `labels.*` *(đề xuất, chờ PM chốt)*, vì Explorer không hiện nhãn chữ.
   - Kiểm: máy báo `age_image_required` khi câu thiếu `image`; người duyệt kiểm câu phủ định và `labels`.
   - Đạt: `image.brief: Một con dơi đang bay lúc chập tối, nền trơn, không có chữ` · `prompt.en: A bat is a bird.` · `prompt.vi: Con dơi là một loài chim.` · `answer: false`. Câu này cũng hợp làm câu misconception ở câu 6.
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
| Bắt buộc có hình | `image_required` | Mọi `#### option` của `single_choice`.<br>Mọi `#### item` của `order_sequence`.<br>Câu `true_false` có `image` của cả câu | Không bắt buộc | Không bắt buộc |
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

**Máy kiểm (GĐ 0)** *(nháp AI)*: `content-cli validate` và `content-cli build` đọc `<nhóm>.authoring` trong `content/rules.json`, rồi kiểm bảng trên ở file JSON của bài, theo `age_group` của chủ đề. Lỗi báo theo mã `age_*` (bảng mã ở SK-026, mục "Phạm vi theo agent › GĐ 0 › dev"); có lỗi thì `build` dừng, không ra gói. `age_words_en` và `age_dok_order` chỉ là cảnh báo, không chặn `build`, nhưng biên tập vẫn sửa, trừ khi ghi lý do giữ lại bằng dòng `>`. `build` còn báo `format_not_rendered` khi bài dùng format mà bản app chưa hiện được: bản 0.1.0 chưa hiện `order_sequence` và `picture_bar_chart`. Bảy luật Explorer ở trên phần lớn do người duyệt kiểm; máy chỉ bắt thiếu hình, sai số lựa chọn, sai format và câu quá dài.

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
image.brief: …
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
image.brief: …
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
image.brief: …
image.alt.en: …
image.alt.vi: …

## Ghi chú cho hoạ sĩ

Chữ tự do: phong cách, hình cần vẽ, đề xuất sửa màn.

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

Giá trị cho phép: `age_group` = `explorer` · `discoverer` · `scientist`. `strand` = `plants_animals` · `living_environment` · `humans_health` · `materials` · `energy_forces` · `earth_sky`. `level` 1–5. Mỗi ô `difficulty` 1–3 (rubric syllabus-progression mục 3, thứ tự A-B-C-D-E). `prerequisites` là danh sách slug chủ đề tiên quyết. `stage` = `opener` · `core` · `apply` · `review`.

## C. Mẫu theo `format` và block

Chỉ ghi phần riêng; phần chung của câu quiz (`id`, `format`, `version`, `dok`, `prompt`, `hint`, `explanation_*`) như q1 ở mục B. Mỗi `####` con có đủ các dòng ghi dưới nó.

````markdown
### qx
format: single_choice            (multi_choice: y hệt, nhiều option có correct: true)
#### option qx_a
correct: true
label.en: …
label.vi: …
image.brief: …                   (image.* không bắt buộc với option)
image.alt.en: …
image.alt.vi: …

### qx
format: true_false
answer: false
statement.en: …                  (không bắt buộc: lời nhân vật)
statement.vi: …
speaker: na                      (không bắt buộc)
labels.true.en: …                (không bắt buộc: thay nhãn Đúng/Sai mặc định)
labels.true.vi: …
labels.false.en: …
labels.false.vi: …

### qx
format: fill_blank_bank
sentence.en: Animals need food, water and {1} to live.
sentence.vi: Động vật cần thức ăn, nước và {1} để sống.   (tiếng Việt cũng để ô trống `{n}` ở đúng chỗ, để phụ đề không lộ đáp án)
answers: qx_air                  (phần tử thứ nhất là đáp án ô {1}, thứ hai cho ô {2}…)
#### bank qx_air
label.en: air
label.vi: không khí

### qx
format: order_sequence
answer: qx_seed, qx_sprout, qx_plant   (thứ tự đúng)
#### item qx_seed
label.en: …
label.vi: …
image.brief: …                   (image.* không bắt buộc với item)
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
messages.start.en: …   messages.full.*   messages.balanced.*   messages.has_limited.*
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
image.brief: …                   (image.* không bắt buộc với item)
image.alt.en: …
image.alt.vi: …
````

(Ghi chú trong ngoặc ở mục C chỉ để giải thích, không chép vào bài. Mỗi `messages.*` viết thành hai dòng `.en` và `.vi` riêng.)

## D. Bảng ánh xạ markdown → trường SK-001

"Máy" là `content-cli` (B8.0); trước khi có CLI, dev chép tay sang fixture JSON. `[n]` là số thứ tự trong danh sách.

**Kiểu chung**

| Chỗ trong markdown | Trường SK-001 | Ghi chú |
| --- | --- | --- |
| `<tên>.en:` + `<tên>.vi:` | `Text` / `Spoken` `{ en, vi }` | Cả hai không rỗng |
| (không viết) | `Spoken.audio.en`, `Spoken.audio.vi` | Máy điền khi chạy `tts` |
| `<tên>.brief:` | `Image.brief` | Bỏ đi khi đóng gói |
| `<tên>.alt.en:` + `<tên>.alt.vi:` | `Image.alt` | Bắt buộc khi có hình |
| (không viết) | `Image.asset` | Máy điền khi chạy `assets` |
| `id:` (bài mới để trống) | `id` (`Uuid`) | Máy sinh, ghi ngược vào file; đã có thì không đổi |
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
| `fill_blank_bank` | `sentence.*` (ô trống `{1}`, `{2}` trong `en`, và ở đúng chỗ đó trong `vi`) · `answers: k1, k2` · mỗi `#### bank <key>`: `label.*` | `sentence` · `answers[]` · `bank[]`: `key` · `label` |
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
| `tier:` | `tier` (`core` · `extra`, mặc định `core`) |

**Collectible** (dưới `## Thưởng`)

| Chỗ trong markdown | Trường SK-001 |
| --- | --- |
| `id:` · `### <key>` | `id` · `key` |
| `set:` | `set` (key của bộ thẻ, ví dụ `food`) |
| `name.*` · `tag.*` · `fact.*` | `name` · `tag?` · `fact` ("Em có biết?") |
| `image.*` | `image` (bắt buộc) |
| `rarity:` | `rarity` (`common` · `rare`, mặc định `common`) |
