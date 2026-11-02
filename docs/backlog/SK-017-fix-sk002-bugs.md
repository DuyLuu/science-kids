# SK-017 · Sửa 3 lỗi tester tìm ở SK-002 và cập nhật fixture

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: content-editor → dev · Tester: tester
Nguồn: docs/ios-test-build.md mốc 1 việc N1; SK-002 mục "Kết quả kiểm (tester, 28/10)", lỗi 1–3, và bảng "UUID đã sinh"; SK-001 quyết định 12 và 18; technical-plan.md B4.2 (id cấp một lần, không đổi); canvas `Discoverer-Warmup.dc.html` (câu VI để ô trống)

## Mục tiêu
Content-editor sửa 3 lỗi của bài mẫu và khung markdown. Dev chép phần đổi sang fixture, để bài 1 trong app không lộ đáp án ở dòng tiếng Việt và id trong markdown khớp fixture trước khi có `content-cli`.

## Phạm vi
1. **Content-editor sửa `content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md`:**
   - w1 `sentence.vi` → "Động vật, kể cả con người, cần thức ăn, nước và {1} để sống." (hiện ở dòng 45).
   - q2 `sentence.vi` → "Chất bột đường cho ta {1}." (hiện ở dòng 337).
   - Chép 21 UUID của bảng "UUID đã sinh" (SK-002) vào đúng dòng `id:` của bài, gồm frontmatter và mọi `###`.
2. **Content-editor sửa `content/discoverer/an-uong-lanh-manh/_topic.md`:** chép 2 UUID (frontmatter, `### all_fat_bad`).
3. **Content-editor sửa `content/TEMPLATE.md`:**
   - ghi chú `sentence.vi` (khoảng dòng 267) đổi thành "tiếng Việt cũng để ô trống `{n}` ở đúng chỗ";
   - 3 mẫu hình chỉ có `image.brief` (`#### item` của `order_sequence`, `sentence_card`, `#### item` của `build_tray`; khoảng dòng 279, 317, 342) thêm `image.alt.en` và `image.alt.vi`.
4. **Dev cập nhật fixture** `packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json`: 2 `sentence.vi` như trên. UUID của fixture giữ nguyên, vì markdown chép theo fixture.
5. Content-editor có thể sửa luôn 4 góp ý của tester ở SK-002 (ghi chú số dòng ở TEMPLATE dòng 10, gợi ý q1 và q5, chữ hoa "Water spinach"). Không bắt buộc. Nếu đổi chữ EN thì dev chép sang fixture và báo SK-014 để sinh lại clip.

## Ngoài phạm vi
- Đổi DOK của q6 (góp ý 2 của tester): câu theo canvas Duy đã duyệt, chờ Duy.
- Sửa chữ trên canvas ("Vitamins & minerals", "Rau & quả"): việc của designer, ticket sau.

## Tiêu chí nghiệm thu
- [ ] `grep -c '^id:$' content/discoverer/an-uong-lanh-manh/*.md` → `0` cho cả hai file.
- [ ] Từng `id` trong markdown trùng `id` ở cùng vị trí trong fixture. Tester kiểm bằng parser của mình ở SK-002, dán output.
- [ ] `grep -n 'sentence.vi' content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md`: cả hai dòng có `{1}`, không còn "không khí" và "năng lượng" ở hai dòng đó.
- [ ] `content/TEMPLATE.md`: mọi mẫu có `image.brief` đều có đủ `image.alt.en` và `image.alt.vi` (`grep` đếm 3 loại dòng bằng nhau trong phần mẫu).
- [ ] `cd packages/content-schema && npm run validate` → exit 0; `npm test` → pass hết.
- [ ] Tester chạy lại so sánh markdown ↔ fixture của SK-002: khớp hết, kể cả `id`.
- [ ] Không sửa file ngoài `content/` (content-editor) và fixture bài 1 (dev). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- Không chờ ticket nào. Không chặn các ticket app.
- Không đổi chữ EN, nên clip của SK-014 vẫn dùng được. SK-015 nên build lại sau ticket này.
- Xong ticket này và tester kiểm lại thì SK-002 chuyển `done`.

**Quyết định đã ghi**
1. Bước 1–3 do content-editor làm, bước 4 do dev, theo đúng vùng sửa ở CLAUDE.md.

**Câu hỏi còn mở**
- Không có.

## Kết quả (content-editor, 28/10)

Bước 1, 2, 3 xong. Bước 5 chỉ làm góp ý 1 (không đụng EN); góp ý 3 và 4 cần đổi EN nên ghi thành đề xuất bên dưới. Không đổi chuỗi `en` nào. Không sửa fixture, `packages/`, `docs/backlog/README.md`. Còn bước 4 (dev chép 2 `sentence.vi` sang fixture), nên ticket giữ `in_progress`.

**Đã sửa**

| File | Dòng | Sửa gì |
| --- | --- | --- |
| `content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md` | 45 | w1 `sentence.vi: Động vật, kể cả con người, cần thức ăn, nước và {1} để sống.` |
| như trên | 337 | q2 `sentence.vi: Chất bột đường cho ta {1}.` |
| như trên | 2, 34, 67, 92, 165, 178, 292, 330, 359, 400, 433, 498, 525, 536, 547, 558, 569, 580, 591, 602, 615 | 21 dòng `id:` điền UUID theo bảng "UUID đã sinh" của SK-002 |
| `content/discoverer/an-uong-lanh-manh/_topic.md` | 2, 33 | 2 dòng `id:` (frontmatter, `### all_fat_bad`) |
| `content/TEMPLATE.md` | 268 | Mẫu `fill_blank_bank`: `sentence.vi` có ví dụ "Động vật cần thức ăn, nước và {1} để sống." và ghi chú "tiếng Việt cũng để ô trống `{n}` ở đúng chỗ, để phụ đề không lộ đáp án" |
| như trên | 436 | Bảng D, dòng `fill_blank_bank`: ô trống "trong `en`, và ở đúng chỗ đó trong `vi`" |
| như trên | 280–282, 320–322, 347–349 | Thêm `image.alt.en` + `image.alt.vi` cho `#### item` của `order_sequence`, `sentence_card`, `#### item` của `build_tray`; ghi chú "image.* không bắt buộc" chuyển lên dòng `brief` |
| như trên | 10 | Góp ý 1: hiện `validate` chỉ kiểm JSON, báo lỗi theo vị trí trong JSON; số dòng markdown chỉ có khi có `content-cli` |
| như trên | 21–22, 367 | Đi kèm việc điền UUID: "Bài mới: `id:` để trống"; trước khi có `content-cli`, dev sinh mã lúc chép sang JSON, biên tập chép vào; đã có mã thì không sửa, không xoá; lấy bài mẫu làm điểm xuất phát thì xoá hết mã sau `id:` (bài mẫu giờ có mã, chép nguyên sẽ trùng) |

Số dòng TEMPLATE ở trên là sau khi sửa. Dòng 21 cũ tách thành 21–22, nên các dòng sau lệch một so với số tester ghi ở SK-002.

**Kết quả lệnh của tiêu chí nghiệm thu (phần content-editor)**

1. `grep -c '^id:$' content/discoverer/an-uong-lanh-manh/*.md` → đạt
   ```
   content/discoverer/an-uong-lanh-manh/_topic.md:0
   content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md:0
   ```
2. `grep -n 'sentence.vi' content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md` → đạt. Dòng 45 và 337 có `{1}`, không còn "không khí", "năng lượng". Dòng 104–152 là câu của `explore_groups` (phần Học), không phải câu điền từ, giữ nguyên.
   ```
   45:sentence.vi: Động vật, kể cả con người, cần thức ăn, nước và {1} để sống.
   104:sentence.vi: Chất bột đường cho ta năng lượng.
   120:sentence.vi: Chất đạm giúp cơ thể lớn lên và tự phục hồi.
   136:sentence.vi: Chất béo cho năng lượng và giữ ấm cơ thể.
   152:sentence.vi: Vitamin và chất khoáng giúp ta khoẻ mạnh.
   337:sentence.vi: Chất bột đường cho ta {1}.
   ```
3. TEMPLATE, đếm dòng mẫu: `grep -c '^image\.brief:'` / `'^image\.alt\.en:'` / `'^image\.alt\.vi:'` → `8 / 8 / 8`, đạt. Tám chỗ: option q1 (mục B), từ vựng, thẻ thưởng, option (mục C), item `order_sequence`, group `explore_groups`, `sentence_card`, item `build_tray`. Mỗi `brief` có hai dòng `alt` ngay dưới.
4. Không đổi chuỗi EN: đọc mọi dòng `….en:` / `en:` trong markdown, so với mọi giá trị `en` trong fixture → bài 164/164, topic 4/4 có trong fixture, 0 lệch. Clip TTS của SK-014 vẫn dùng được.
5. `npm run validate`, `npm test`: chưa chạy, vì fixture chưa đổi; dev chạy sau bước 4.

**Đối chiếu UUID markdown ↔ fixture** (đọc fixture, không sửa)

Cách kiểm: lấy dòng `id:` theo thứ tự trong markdown, kèm key của `###` gần nhất; lấy `id` theo thứ tự xuất hiện trong JSON, kèm `key` cùng object; so hai danh sách bằng `diff`. Kết quả: topic 2/2, bài 21/21, cùng thứ tự, `diff` rỗng. Bảng UUID của SK-002 cũng trùng fixture.

| File markdown | Chỗ | `id` trong markdown | Fixture | Khớp |
| --- | --- | --- | --- | --- |
| `_topic.md` | frontmatter | `d3a514ef-02cd-4386-a358-f01e425a10f8` | `topic.json` gốc | có |
| `_topic.md` | `### all_fat_bad` | `93c51bb0-1d45-45df-99c5-a0397967fe10` | `misconceptions[0]` | có |
| bài 1 | frontmatter | `4b11eb40-9a47-4e5e-b4b5-bea60264ded3` | gốc | có |
| bài 1 | `### w1` | `8c88f06a-e6dc-4c85-8da8-3d41913f3f03` | `warmup[0]` | có |
| bài 1 | `### w2` | `fd376a92-d053-4447-a292-979c91698c9b` | `warmup[1]` | có |
| bài 1 | `### explore` | `3a560eb7-9c22-43d6-a271-16e027e99c50` | `learn[0]` | có |
| bài 1 | `### new_words` | `c233cec2-d80d-4957-b9a0-1fcd96eb8ab8` | `learn[1]` | có |
| bài 1 | `### tray` | `bd0706ad-2c42-4e59-a6ee-66c1feac9ff7` | `play` | có |
| bài 1 | `### q1` | `1462983f-bd03-44ee-a91b-65b4ee731e51` | `quiz[0]` | có |
| bài 1 | `### q2` | `aeb7debc-28ed-4fd8-a192-8a9e5a581455` | `quiz[1]` | có |
| bài 1 | `### q3` | `b06b6e26-f1b1-412e-b110-78e00e3d510f` | `quiz[2]` | có |
| bài 1 | `### q4` | `00bb56f5-6adc-4d54-b48a-5bbbbae20eab` | `quiz[3]` | có |
| bài 1 | `### q5` | `59dd3f4a-3967-436a-aec9-4048d8bb501c` | `quiz[4]` | có |
| bài 1 | `### q6` | `9efe4b78-71d1-4398-b9f8-e4e9e1c250d4` | `quiz[5]` | có |
| bài 1 | `### nutrient` | `6656ad65-b2dd-4f06-808c-fe1d1995e085` | `vocab[0]` | có |
| bài 1 | `### carbohydrate` | `728f378a-1bee-4106-ba15-612d17927b73` | `vocab[1]` | có |
| bài 1 | `### protein` | `8477b4f7-9605-457b-9a21-1bc5832484a0` | `vocab[2]` | có |
| bài 1 | `### fat` | `ee8c53bc-21cd-419e-a0d5-ef087d093f64` | `vocab[3]` | có |
| bài 1 | `### vitamin` | `cfa86593-542f-4519-bdc2-00bfe1cb6018` | `vocab[4]` | có |
| bài 1 | `### fibre` | `59b5cb47-2f15-49c1-8358-71ac83e735a1` | `vocab[5]` | có |
| bài 1 | `### energy` | `4b314313-1ed2-47a5-8147-75b6e175efb2` | `vocab[6]` | có |
| bài 1 | `### healthy` | `0cac2335-c9b2-4136-b724-ecff59a95f80` | `vocab[7]` | có |
| bài 1 | `### rau_muong` | `43376993-bf69-49cc-bb35-837581f0cc1a` | `reward.collectible` | có |

Tiêu chí "tester kiểm bằng parser của mình" vẫn chờ tester chạy.

**Việc cho dev (bước 4)**
- Fixture bài 1: `warmup[0].sentence.vi` → "Động vật, kể cả con người, cần thức ăn, nước và {1} để sống."; `quiz[1].sentence.vi` → "Chất bột đường cho ta {1}.". UUID giữ nguyên.

**Đề xuất còn lại (cần đổi EN, hoãn đợt này)**

Đổi EN thì dev chép sang fixture và báo SK-014 sinh lại clip. Chờ Duy hoặc PM chọn đợt.

1. **Góp ý 3, q1 gợi ý nói gần thẳng đáp án** (dòng 298–299; "rau và quả" chỉ trỏ vào một lựa chọn là quả cam). Đề xuất:
   - `hint.en: Which food was in the vitamins group?` (bảy từ)
   - `hint.vi: Nhớ lại nhóm vitamin ở phần Học. Món nào có trong nhóm đó?`
   - Câu q1 là DOK 1 (nhớ lại), nên gợi ý trỏ về phần Học thay vì nêu loại món.
2. **Góp ý 3, q5 gợi ý nêu cả ba đáp án** (dòng 441–442: cá, trứng, đậu). Đề xuất đưa quy tắc phân loại để bé tự áp dụng (DOK 2):
   - `hint.en: Protein helps us grow. Look for animal foods and beans.` (mười từ)
   - `hint.vi: Chất đạm giúp cơ thể lớn lên. Em tìm món từ động vật và món làm từ đậu.`
   - Chữ VI hiện tại lấy từ canvas Discoverer-Quiz, nên đổi thì designer sửa canvas theo.
   - Không sửa riêng VI của q1 và q5: VI là phụ đề của câu EN, sửa một bên thì hai dòng lệch nghĩa.
3. **Góp ý 4, chữ hoa tên thẻ** (dòng 618): `name.en: water spinach` → `name.en: Water spinach`, cho khớp `name.vi: Rau muống` và nhãn món `tray_greens` "Water spinach".
4. **Góp ý 2 (DOK của q6):** ngoài phạm vi, chờ Duy; không đụng.

## Kết quả (dev, bước 4 · phiên chính 28/10)
- Fixture `packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json`: đổi đúng 2 dòng, `diff` với bản trước chỉ ra dòng 67 (`warmup[0].sentence.vi` → "Động vật, kể cả con người, cần thức ăn, nước và {1} để sống.") và dòng 597 (`quiz[1].sentence.vi` → "Chất bột đường cho ta {1}."). UUID và mọi chuỗi `en` giữ nguyên. Câu "Chất bột đường cho ta năng lượng." ở phần Học (`learn[0].groups[0].sentence.vi`) giữ nguyên, vì đó không phải câu điền từ.
- `npm run validate`: OK 2 file hợp lệ; `npm test`: 98/98 pass.
- Chạy lại `content-cli tts`: 107 clip dùng lại, sinh mới 0. Build lại gói `content/.build/pack` (bản chủ đề mới `6119e7784d85`), `check-pack.sh`: OK; gói có đúng hai câu mới.
- Còn lại: tester chạy parser so markdown ↔ fixture của SK-002 (tiêu chí 2 và 6).
