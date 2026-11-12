# SK-039 · Soạn chủ đề Discoverer #6 "Đá và đất" (15 bài, theo Oak Y3 Rocks and soils)

Trạng thái: review · Ngày: 2026-11-11 · Phụ trách: content-editor (soạn), designer (hình), main session chạy lệnh · Tester: tester
Nguồn: Duy 11/11 ("Giao tiếp"); syllabus.md mục 8 (pilot); syllabus-lessons.md mục 6 (16 lesson Oak → 15 bài, đề xuất bản địa hoá đã duyệt 9/11); Oak unit [Rocks and soils](https://www.thenational.academy/teachers/programmes/science-primary-ks2/units/rocks-and-soils/lessons); sườn từng lesson ở `docs/oak/rocks-and-soils.md`

## Mục tiêu
Chủ đề cuối của pilot có đủ 15 bài theo đúng thứ tự Oak, chơi được trong app, có hình, tiếng EN và VI.

## Phạm vi
- **content-editor:**
  - bước 1: `content/discoverer/da-va-dat/_topic.md` (kế hoạch 15 bài, luật riêng, bảng Đúng/Sai, bảng vị trí đáp án, bảng hình dùng chung, bộ thẻ);
  - bước 2: 15 bài, chia ba người soạn song song (1–5, 6–10, 11–15) theo `_topic.md`.
- **designer, main session, tester:** như SK-036.

## Ngoài phạm vi
- Duyệt chuyên môn địa chất.

## Tiêu chí nghiệm thu
- [ ] Mỗi bài theo đúng lesson Oak trong `content/syllabus.json` (`oak_lessons`): mục tiêu, từ vựng, misconception lấy từ sườn Oak; kịch bản, ví dụ, hình tự làm. Bản địa hoá như syllabus-lessons.md (bài 6 đá vôi, đá ong, đá hoa cương trong nhà và đền chùa; bài 12 đất phù sa, đất đỏ bazan); bài 14 gộp lesson 14 và 15 của Oak. Lệch Oak chỗ nào thì ghi rõ trong `_topic.md`.
- [ ] Nối với chủ đề trước, không dạy lại: hoá thạch đã giới thiệu ở *Khủng long* (bài 3), núi lửa và đất đỏ ở *Bề mặt Trái Đất*; bài 8–10 nhắc lại và đi sâu hơn.
- [ ] Như SK-036 và các luật rút kinh nghiệm thêm ở SK-038.
- [ ] Bài 10 Mary Anning: không ảnh chân dung người thật nhận ra mặt trừ khi là tranh công có (PD); kể chuyện không bịa chi tiết lịch sử, chỗ chưa chắc ghi `[CẦN KIỂM]`.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở
**Phụ thuộc:** SK-030, SK-033, sườn Oak (`docs/oak/rocks-and-soils.md`).

**Quyết định đã ghi:** slug thư mục `da-va-dat` (main session 11/11).

**Câu hỏi còn mở**

## content-editor 11/11 · _topic

Phạm vi: bước 1, chỉ viết `content/discoverer/da-va-dat/_topic.md`. Không sửa `content/TEMPLATE.md`, file dùng chung hay `content/discoverer/thoi-tiet-va-thien-tai/`. Không chạy lệnh (chưa `validate`, chưa `ids`). `ai_draft: true`, mọi dòng `id:` để trống.

**File:** `content/discoverer/da-va-dat/_topic.md`
- Frontmatter: `order: 6`, `strand: earth_sky`, `level: 3`, difficulty 2-2-2-3-2 = mười một điểm (đúng syllabus-progression mục 5.2), `oak_unit_ref: rocks-and-soils`, `prerequisites: []`.
- Câu hỏi lớn: "What are rocks and soil made of? How do they change?" · "Đá và đất gồm những gì? Chúng thay đổi ra sao?"
- Mười bảy misconception: mười lăm key gắn câu q6 (mỗi bài một key), cộng `rocks_never_change` (câu "Em nghĩ sao?" bài 1, hỏi lại ở bài 15 w3) và `breaks_means_soft` (bài 4, không gắn key).
- Mục Ghi chú gồm: tổng quan mười lăm bài; kế hoạch từng bài (mục tiêu, ba ý chính EN và VI, bốn ô Học, từ vựng, q6, phần Chơi, thẻ, quiz gợi ý, chỗ lệch Oak, `[CẦN KIỂM]`); bảng từ vựng; bảng Tên gọi; bảng Đúng/Sai; bảng vị trí đáp án (có cột thẻ `fill_blank_bank`); bảng Khởi động; lời Na câu sáu; câu "Em nghĩ sao?"; Quy ước hình (Bộ mẫu đá, năm bộ hình vẽ dùng chung); bảng Hình dùng chung (gốc ở chủ đề khác và gốc trong chủ đề, key bắt buộc); mặc định phần Chơi; bộ thẻ `set: rocks`; An toàn; Thí nghiệm ở nhà; luật khi soạn; không lặp với chủ đề khác; để dành; mục "Cho ba người soạn" (phân công, thứ cố định, luật đặt key, chữ cố định, thứ tự sau khi soạn, bàn giao); đề xuất; còn mở.

**Kế hoạch mười lăm bài** (người soạn A: 1 tới 5, B: 6 tới 10, C: 11 tới 15)

| Bài | Oak | `stage` | Một dòng | q6 · Na |
| --- | --- | --- | --- | --- |
| 1 Làm quen với đá | 1 | opener | Đá là vật liệu có sẵn trong tự nhiên, đào lên ở mỏ đá; gạch, bê tông, nhựa đường do con người làm ra. Chơi: tìm ba thứ làm bằng đá. | `bricks_are_rocks` · Sai |
| 2 Nhìn kỹ các loại đá | 2 | core | Kính lúp; đá có hạt, có lỗ (từng là dung nham), có lớp; mỗi loại có tên riêng. Chơi: ba hòn đá trông khác nhau, bẫy bọt biển, khúc gỗ, đường phèn. | `rocks_all_look_same` · Đúng |
| 3 Đá nào cứng hơn? | 3 | core | Thử cào bằng móng tay, cán thìa inox; đá mềm, đá cứng; độ cứng là tính chất. Chơi: đá mềm, vừa, cứng. | `all_rocks_are_hard` · Sai |
| 4 Thang độ cứng Mohs | 4 | core | Đá gồm khoáng vật; nhà địa chất Mohs xếp khoáng vật theo độ cứng; đối chiếu kết quả; nặng không phải cứng, bát sứ cứng mà vẫn vỡ. Chơi: khoáng vật mềm, cứng, rất cứng. | `heavy_means_hard` · Đúng |
| 5 Đá nào thấm nước? | 5 | core | Nhỏ nước lên đá; sa thạch, đá phấn thấm; đá cẩm thạch, đá phiến không thấm; bọt khí. Chơi: dấu hiệu nước thấm vào đá (kệ hình vẽ). | `rocks_never_soak_water` · Sai |
| 6 Đá dùng làm gì? | 6 | apply | Đá vôi (vôi, xi măng), đá ong (làng cổ Đường Lâm), đá hoa cương (bậc thềm, mặt bếp), đá ở đình chùa; tính chất quyết định công dụng. Chơi: một đồ làm từ mỗi loại đá. | `any_rock_for_any_job` · Sai |
| 7 Đá bị bào mòn theo thời gian | 7 | core | Mưa, gió, nắng, rễ cây; phong hoá làm đá vỡ, xói mòn mang mảnh vụn đi; trồng cây, kè đá. Chơi: ba lực tự nhiên. | `weathering_is_erosion` · Đúng |
| 8 Hoá thạch hình thành thế nào? | 8 | core | Không chỉ khủng long; phần mềm phân huỷ, trầm tích vùi lấp, sức ép thành đá; dấu in. Chơi: hoá thạch con vật biển, cây, cá và côn trùng; bẫy cá khô, vỏ ốc mới, lá khô. | `only_dinosaurs_fossils` · Sai |
| 9 Nhiều cách tạo thành hoá thạch | 9 | core | Hổ phách từ nhựa cây; chất khoáng lấp đầy vỏ ốc, khúc gỗ; thân mềm hiếm thành hoá thạch; chỉ thứ từng sống mới thành hoá thạch. Chơi: ba cách; bẫy bình gốm cổ, đồng xu cổ, đèn dầu cổ. | `old_things_are_fossils` · Sai (trống đồng) |
| 10 Mary Anning | 10 | core | Săn hoá thạch ở vách đá ven biển; bộ xương bò sát biển; thời đó nhiều người không ghi công bà; ai cũng có thể săn hoá thạch. Chơi: tìm hoá thạch như nhà khoa học, bẫy việc không an toàn. | `women_did_no_science` · Đúng |
| 11 Đất gồm những gì? | 11 | core | Lọ đất lắng thành lớp; mảnh đá, không khí, nước; chất hữu cơ; đất hình thành rất chậm. Chơi: ba thứ tạo nên đất, bẫy rác nhựa. | `soil_was_always_there` · Sai |
| 12 Các loại đất ở Việt Nam | 12 | core | Đất phù sa (lúa), đất đỏ ba-dan (cà phê), đất cát (phi lao); sờ và nhìn. Chơi: tìm nơi có từng loại đất, bẫy sân xi măng, đường nhựa. | `all_soil_is_same` · Đúng |
| 13 Thế nào là đất tốt? | 13 | core | Đất tốt giữ nước, không khí, chất dinh dưỡng; giun đất; thời tiết khác khí hậu; quá ướt, quá khô. Chơi: ba cách giữ đất tốt. | `weather_is_climate` · Đúng |
| 14 Nước thấm qua đất nào nhanh hơn? | 14 + 15 | apply | Đổ nước qua đất cát, đất sét; thí nghiệm công bằng chỉ đổi một thứ; hạt to cho nước qua nhanh; biểu đồ cột trong câu `single_choice`. Chơi: dựng thí nghiệm công bằng (kệ hình vẽ). | `all_soil_drains_same` · Sai |
| 15 Nhà địa chất làm gì? | 16 | review | Đi thực địa, lấy mẫu; cảnh báo sạt lở, theo dõi núi lửa; đá Mặt Trăng, Sao Hoả. Ôn trộn. Chơi: ba việc của nhà địa chất, bẫy dự báo thời tiết. | `geologists_only_earth` · Đúng (hòn đá rơi từ vũ trụ) |

- Đúng/Sai cả chủ đề: mười lăm Đúng, mười lăm Sai; mỗi bài một Đúng một Sai; câu sáu không theo chu kỳ.
- Vị trí đáp án: sáu mươi lăm câu một đáp án chia 21 · 21 · 21 · 2 (chỗ thứ tư chỉ ở câu bốn lựa chọn); thẻ điền từ 5 · 5 · 5; câu nhiều đáp án có bốn câu ba đáp án.
- Khởi động ôn chủ đề trước: bài 1 w2 *Núi lửa*, bài 8 w2 *Khủng long* bài 3, bài 10 w3 *Khủng long* bài 2, bài 12 w3 *Núi lửa*; bài 13 w3 ôn *Thời tiết* chỉ khi chủ đề đó có id.
- Bộ thẻ mới `set: rocks`, mười lăm thẻ (key `*_card`).

**Chỗ lệch Oak** (chi tiết từng bài ở `_topic.md`)
- Bản địa hoá đã duyệt: bài 6 (đá vôi, đá ong, đá hoa cương, đình chùa), bài 12 (đất phù sa, đất đỏ ba-dan, đất cát), bài 14 gộp Oak 14 và 15.
- Misconception Oak bài 5 là lỗi tiếng Anh (permeable với permanent): thay bằng `rocks_never_soak_water`; cả chủ đề không dùng chữ "permanent".
- Oak dặn dùng đá thật, hoá thạch thật: app chỉ có ảnh, nên có Bộ mẫu đá và mục Thí nghiệm ở nhà.
- An toàn: thử cào bằng móng tay và cán thìa inox thay cho đinh; không búa, không axit, không giấm.
- Bỏ ví dụ có yếu tố bạo lực hay xa trẻ Việt Nam: mũi tên đá thời Đồ Đá, Stonehenge, cỏ dại làm nứt vỉa hè, sân bóng bầu dục; thay bằng cối đá, đình chùa, rễ cây đa, sân trường, ruộng lúa.
- Thang Mohs rút còn ba mức, sáu khoáng vật; Oak brittleness thành ví dụ bát sứ, không thành từ vựng.
- Oak bài 12: bốn loại đất (sandy, silt, clay, loam) thành ba loại đất Việt Nam; đất thịt chỉ là từ đọc thêm; kính hiển vi kỹ thuật số thành kính lúp.
- Oak bài 13: lũ, hạn chỉ nhắc (đã ở *Thời tiết* bài 4); con vật trong đất dùng giun đất thay cho con bét, bọ đuôi bật.
- Oak bài 16: không đưa Rosaly Lopes (sườn Oak đang `[CẦN KIỂM]`) và Charles Darwin; thêm việc của nhà địa chất ở Việt Nam (sạt lở, nước ngầm).
- Mọi bài: `order_sequence`, `picture_bar_chart` app chưa hiện nên dùng `single_choice`.

**[CẦN KIỂM]** (mỗi chỗ có dòng `>` hoặc ghi ở mục bài trong `_topic.md`)
- Tên gọi theo sách: "bùn mịn" (silt), "chất hữu cơ" hay "chất mùn", "sa thạch" hay "đá cát kết", "hoạt thạch" (talc), "cúc đá", "khoáng vật" và "chất khoáng" cho cùng chữ "mineral", "ba-dan" hay "bazan"; sách Khoa học lớp năm có bài về đất không.
- Khoa học: độ cứng từng loại đá so với móng tay, thìa inox; bậc Mohs của sáu khoáng vật, năm 1812; "đá tạo nên từ khoáng vật"; vết ướt loang rộng là dấu hiệu nước thấm vào đá; đá ong mới đào mềm, ra ngoài trời cứng dần; đá xanh ở đình chùa là đá vôi; thành nhà Hồ bằng đá vôi; nước mưa làm đá vôi mòn, tạo hang động; hoá thạch hơn mười nghìn năm; cúc đá; gỗ hoá đá (và gỗ hoá thạch ở Tây Nguyên, chưa đưa vào chữ cho trẻ); thứ tự lắng trong lọ đất; đất hình thành rất chậm; đất phù sa, đất đỏ ba-dan, đất cát và cây trồng hợp; giun đất; Đà Lạt mát gần như quanh năm; khí hậu thay đổi; ruộng lúa giữ nước nhờ lớp đất nhiều sét; việc của nhà địa chất; mẫu đá Mặt Trăng, xe tự hành Sao Hoả.
- Tiểu sử Mary Anning: năm sinh, mất, nơi sống; tìm bộ xương bò sát biển đầu tiên khoảng mười hai tuổi cùng anh trai; không được vào Hội Địa chất London; Bảo tàng Lịch sử Tự nhiên trưng bày; con chó tên Tray; ý "nhiều người không ghi công vì bà là phụ nữ, nhà nghèo".
- Mười lăm câu "Em có biết?" trên thẻ.
- An toàn: khuyến cáo vệ sinh khi trẻ cầm đất; quy định nhặt đá, hoá thạch ở di tích, khu bảo tồn.
- Đọc bằng máy: "Mohs", "Mary Anning" trong chuỗi VI cần dòng `READINGS`.

**Câu hỏi cần Duy hoặc PM quyết** (chi tiết ở mục "Còn mở" của `_topic.md`)
1. **Ba loại đá** (mác-ma, trầm tích, biến chất): Oak Year 3 không dạy, nhưng syllabus.md mục 2 và *Khủng long* `_topic.md` để dành ý này cho chủ đề *Đá và đất*. Đề xuất không đưa ba tên vào chữ cho trẻ; nói bằng lời thường ở bài 2 và bài 8. Có muốn một ô Học nêu tên ở bài 2 không?
2. **Tranh chân dung Mary Anning** (vẽ lúc bà còn sống, đã hết bản quyền): dùng ở ô Học bài 10 không?
3. **Chữ có thể nhạy cảm:** trống đồng làm vật "rất cổ nhưng không phải hoá thạch" (bài 9 q6); thẻ hồng ngọc (bài 4); thẻ cà phê (bài 12). Mỗi chỗ đã có cách thay.
4. **PM:** `prerequisites` giữ `[]` hay ghi `[be-mat-trai-dat, khung-long]`; tiêu đề EN bài 3, bài 5 dài theo Oak, giữ hay đổi sang câu hỏi; `rarity: rare` cho thẻ bài 15; Mức 3 (mười một điểm) giữ nguyên hay Mức 4 nếu chấm A hoặc B bằng ba.
5. **ios-dev:** khoá `collectible.set.rocks` "Rock and soil cards" · "Thẻ đá và đất". **dev:** dòng `READINGS` cho "Mohs", "Mary Anning".

**Lưu ý cho ba người soạn bước 2**
- Không sửa `_topic.md`; đề xuất đổi ghi vào SK-039, topic editor sửa và báo hai người kia.
- Key ở bảng Hình dùng chung là bắt buộc: bài phụ trách đặt đúng key, viết brief đầy đủ; bài dùng lại viết "Dùng lại hình `<key>` ở bài `da-va-dat/<slug>`." ngay, không chờ.
- Bài được ôn phải dạy đúng ý của câu ôn ở bảng Khởi động; câu `true_false` của Khởi động dùng đúng chữ EN trong bảng.
- Bàn giao: mục "## content-editor 11/11 · bài a–b" trong SK-039.

**Còn chưa chắc**
- Bảng Hình dùng chung đặt trước key cho khoảng bốn mươi hình. Người soạn có thể thấy một hình không hợp bài mình; khi đó báo topic editor, không tự đổi key.
- Bài 5 nhóm "Wet patch spreads" và mô hình phong hoá bằng đường phèn (Thí nghiệm ở nhà) cần chuyên môn xác nhận; nếu không đạt, nhóm thứ ba bài 5 đổi thành một dấu hiệu khác.
- Với *Thời tiết* (soạn song song): chưa đọc được `_topic.md` của chủ đề đó (chưa có file). Tên gọi "thời tiết", "khí hậu", ảnh ruộng ngập, đất nứt nẻ, sườn đồi sạt lở có thể trùng; phiên chính chốt bên nào là gốc.
- Chưa chạy `validate`. Mục Ghi chú dùng tiêu đề `###`, `####`; theo `tools/content-cli/src/markdown/syntax.ts`, mục Ghi chú được bỏ qua cả khối, nên không báo lỗi, nhưng phiên chính nên xác nhận khi chạy.

## Main session chốt 11/11 (mặc định, Duy đổi được)
- `_topic.md`: `ids` đã chạy, `validate` 0 lỗi.
- Ba loại đá (mác-ma, trầm tích, biến chất): theo đúng Oak Year 3, không đưa tên vào chữ cho trẻ, không thêm ô Học nêu tên; nói bằng lời thường như đề xuất. Ghi lệch so với `syllabus.md` mục 2 ở đây.
- Tranh chân dung Mary Anning (vẽ lúc bà còn sống, public domain): được dùng ở bài 10. Luật "không người nhận ra mặt" là để bảo vệ người đang sống trong ảnh chụp; chân dung lịch sử đã hết bản quyền không thuộc luật đó. Hỏi lại Duy khi báo cáo.
- Trống đồng (bài 9), thẻ hồng ngọc (bài 4), thẻ cà phê (bài 12): giữ.
- `prerequisites`: giữ `[]` như các chủ đề trước. Tiêu đề EN bài 3, 5 giữ theo Oak. Không dùng `rarity: rare` (app chưa có thẻ hiếm). `level: 3`.
- Hình trùng với *Thời tiết* (ruộng ngập, đất nứt nẻ, sạt lở): *Thời tiết* giữ hình gốc, *Đá và đất* dùng lại ("Dùng lại hình `key` ở bài `thoi-tiet-va-thien-tai/<slug>`") khi file *Thời tiết* đã có key.
- Việc kéo theo: ios-dev thêm `collectible.set.rocks`; dev thêm `READINGS` cho "Mohs", "Mary Anning". Gom vào lượt ios-dev/dev kế tiếp.

## Tạm dừng (main session 11/11, Duy: "tạm thời dừng hết")
- `_topic.md` xong, `validate` 0 lỗi, có id.
- Ba người soạn A (1–5), B (6–10), C (11–15) bị dừng giữa chừng: A đang viết bài 4, B đang rà máy bài 6–10, C đang viết bài 15. File bài trong `content/discoverer/da-va-dat/` có thể dở dang; lượt sau đọc lại từng file, soạn nốt, rồi main session chạy `ids` (thứ tự bài 1→15) và `validate`.
- Chưa: rà chữ của tester, hình, TTS, build gói, gắn id vào `content/syllabus.json`.

## content-editor B 11/11 · bài 6–10

Phạm vi: bước 2, người soạn B. Chỉ viết năm file bài dưới đây, không sửa `_topic.md`, `content/TEMPLATE.md`, bài của A, C. Không chạy lệnh; mọi dòng `id:` để trống, `ai_draft: true`. Đã rà máy bằng tìm chuỗi (không phải `validate`): chuỗi `.en` không có dấu tiếng Việt; chuỗi `.vi` không có chữ số, ký hiệu (trừ chỗ trống `{1}`); `[CẦN KIỂM]` chỉ ở dòng `>`; mọi chỗ có hình đủ `brief` + `alt` EN/VI; brief `[ảnh]`, `[tranh]` đều có từ khoá; số dòng `id:` khớp số `###`.

**File**
- `content/discoverer/da-va-dat/06-da-dung-lam-gi.md`
- `content/discoverer/da-va-dat/07-da-bi-bao-mon-theo-thoi-gian.md`
- `content/discoverer/da-va-dat/08-hoa-thach-hinh-thanh-the-nao.md`
- `content/discoverer/da-va-dat/09-nhieu-cach-tao-thanh-hoa-thach.md`
- `content/discoverer/da-va-dat/10-mary-anning-nguoi-san-hoa-thach.md`

**Mỗi bài một dòng**
- Bài 6 (`apply`): đá vôi (nghiền, nung làm xi măng, vôi), đá ong (mới đào mềm rồi cứng dần, Đường Lâm), đá hoa cương (cứng, không thấm), dùng đá từ xa xưa. q6 `any_rock_for_any_job`, Na "đá phấn lợp mái" (Sai). Chơi: một đồ làm từ mỗi loại đá (tường quét vôi, sân xi măng · tường, giếng đá ong · bậc thềm, mặt bàn bếp; bẫy bàn gỗ, hàng rào tre), kệ ảnh.
- Bài 7: lực tự nhiên làm đá thay đổi rất chậm (trả lời "Em nghĩ sao?" bài 1), phong hoá làm vỡ tại chỗ, xói mòn mang đi, cây và kè đá làm chậm. q6 `weathering_is_erosion`, Na "rễ cây làm nứt đá là phong hoá" (Đúng). Chơi: ba lực tự nhiên (nước · gió · cây; bẫy gầu máy xúc, cái đục đá), kệ ảnh.
- Bài 8: không chỉ khủng long, phần mềm phân huỷ, trầm tích vùi lấp và sức ép, dấu in. q6 `only_dinosaurs_fossils`, Na "ốc không phải khủng long nên không thành hoá thạch" (Sai). Chơi: con vật biển · cây cối · cá và côn trùng trong đá; bẫy vỏ ốc trên cát, cá khô, lá khô; kệ ảnh. Gốc bộ hình vẽ "Mặt cắt lòng đất" (bốn khung).
- Bài 9: hổ phách, chất khoáng lấp đầy, thân mềm hiếm thành hoá thạch, cổ sinh vật học (chỉ những gì từng sống). q6 `old_things_are_fossils`, Na "trống đồng rất cổ nên là hoá thạch" (Sai). Chơi: ba cách tạo thành hoá thạch; bẫy bình gốm cổ, đồng xu cổ, đèn dầu cổ; kệ ảnh.
- Bài 10: Mary sống ở nước Anh hơn hai trăm năm trước, tìm bộ xương bò sát biển, thời đó nhiều người không ghi tên bà, ai cũng săn hoá thạch được. q6 `women_did_no_science`, Na "Mary làm khoa học rất giỏi" (Đúng). Chơi: nhìn kỹ · ghi chép và vẽ · hỏi người hiểu biết; bẫy trèo vách đá, đứng sát chân vách, đập đá bằng búa; kệ hình vẽ.

**Đối chiếu bảng `_topic.md`** (khớp cả ba bảng)
- Đúng/Sai: bài 6 w2 Đúng, q6 Sai; bài 7 w2 Sai, q6 Đúng; bài 8 w2 Đúng, q6 Sai; bài 9 w2 Đúng, q6 Sai; bài 10 w2 Sai, q6 Đúng. Câu `true_false` Khởi động dùng đúng chữ EN của bảng.
- Vị trí đáp án (w1 · w3 · q1 · thẻ q2 · q3 · q4 · q5): bài 6: 3 · 1 · 3 · 1 · 3,4 · 2/4 · 2; bài 7: 1 · — · 3 · 3 · 1,2 · 2 · 2; bài 8: 1 · — · 2 · 1 · 2,3,4 · 2 · 3; bài 9: 3 · — · 1 · 2 · 1,3 · 3/4 · 2; bài 10: 2 · 1 · 3 · 1 · 2,4 · 3 · 1.
- Khởi động: đúng slug, đúng lựa chọn và thứ tự ở bảng. Bài được ôn sau (bài 7 w1, 8 w1, 9 w1, 10 w1, w2, 11 w1, w2) đã dạy đúng ý: xi măng từ đá vôi (ô Đá vôi bài 6), phong hoá làm đá vỡ, rễ cây làm nứt đá (ô Phong hoá bài 7), dấu in (ô Dấu in bài 8), hổ phách là nhựa cây cứng lại, bình gốm cổ không phải hoá thạch (bài 9), bộ xương bò sát biển (ô Bà tìm thấy gì bài 10).

**Chỗ lệch `_topic.md` và lý do** (đề xuất topic editor sửa bảng theo, hoặc báo lại để B sửa bài)
1. Bảng Hình dùng chung ghi `tray_ammonite` dùng ở "10 (ô Her finds)", nhưng ô Her finds bài 10 phải là `explore_finds` (bộ xương, hình gốc cho bài 11 w1). Sau rà chữ tester 11/11 (bài 9–15, N5) và hình designer 11/11: `explore_finds` làm hình câu q1; thẻ q2 nay là ba hình vẽ mới, bài 10 không còn dùng `tray_ammonite`. Đề xuất sửa bảng: `tray_ammonite` "9 (q2)"; `explore_finds` thêm "10 (hình câu q1)".
2. Bài 6 Chơi: nhóm Đá vôi là tường quét vôi, sân xi măng, không dùng "bậc đá xanh ở sân đình" (chưa chắc đá xanh là đá vôi; ảnh sân đình dễ có chữ Hán Nôm, cảnh thờ). Bẫy là bàn gỗ, hàng rào tre (giống mặt bàn bếp, tường làng); bỏ rổ tre, nón lá vì không giống nhóm nào.
3. Bài 6 Quiz: q5 không hỏi "vì sao không lát sân bằng đá phấn" (ba lựa chọn là ba lý do, khó có hình; q6 cũng hỏi đá phấn), mà hỏi "nhà Nam tự đẽo đá xây tường, đá nào hợp" (đá phấn · đá ong · đá ba-dan). q4 (mặt bàn bếp) có bốn lựa chọn hoạt thạch · đá hoa cương · đá bọt · thạch cao, câu hỏi "Which one" vì hai thứ là khoáng vật; không dùng đá cẩm thạch, đá phiến (ngoài đời cũng làm mặt bếp, câu sẽ có hai đáp án), không dùng sa thạch (đáp án w1, luật một hình một vai).
4. Bài 6 hình: ô Đá ong là ảnh mới `explore_laterite` (nhà cổ Đường Lâm); `laterite` (từ vựng, hình gốc) là cận cảnh mặt tường đá ong cắt sát, để đứng cạnh ảnh mẫu đá ở bài 6 q5 và bài 7 w1. Ô Đá hoa cương dùng lại `tray_steps` bài 1.
5. Bài 7 Chơi: bẫy là gầu máy xúc chụp gần và tay đục đá (bỏ máy khoan, xe chở đá vì hầu như ảnh nào cũng có logo, biển số), nên cả kệ vẫn là ảnh. Món cây thứ hai là "rễ cây làm nứt bậc đá", không phải "rễ cây mọc qua khe đá", để khác hình câu q6.
6. Bài 7 q4 (bãi đất mới ở cửa sông) dùng đúng ba hình mà bảng Hình dùng chung giao cho bài 8 w1 (`explore_erupt`, `explore_erosion`, `explore_weathering`); hai câu hỏi khác nhau nhưng cùng bộ hình, cách nhau một ngày. Topic editor xem có cần đổi một bên.
7. Bài 8 q5 vẫn cùng lôgic "vùi trong bùn thì dễ thành hoá thạch" với q5 *Khủng long* bài 3, nhưng đổi vật (vỏ sò), bối cảnh (ghềnh đá, lọ ở nhà, bãi triều), lựa chọn, như `_topic.md` dặn. q3 có ba đáp án, dùng ảnh sinh vật của *Khủng long* và khủng long đồ chơi làm bẫy.
8. Bài 9 q5 không hỏi "vì sao sứa hiếm thành hoá thạch" (lựa chọn là lý do, khó có hình), mà hỏi "con vật biển nào dễ để lại hoá thạch nhất" (sứa · cua · bạch tuộc). Ý chính ba nằm ở ô "Palaeontology" (`_topic.md` không ghi ô nào mang ý này).
9. Bài 10: câu gợi ý q4 ("vì sao bộ xương là bằng chứng quan trọng") chuyển thành q2 điền từ `evidence` (thẻ sai "photos", "models" bắt quan niệm cũ của *Khủng long*). q3 hỏi việc an toàn khi đi tìm hoá thạch (thêm "ra bãi đá khi nước đang lên" từ mục An toàn); q4 tình huống Lan thấy hình vỏ ốc trên đá (đáp án hỏi nhà khoa học); q5 bảo tàng · thuỷ cung · sở thú (suy từ "đã tuyệt chủng"). Câu w3 dùng nhãn tả bộ phận ("has flippers"…) thay tên con vật, vì "sea reptile" · "bò sát biển" trùng chữ "sea" · "biển" của câu hỏi; cách làm như w1 *Khủng long* bài 3. Ô "Not fair" là hình vẽ cuốn sổ cũ trang trống. Thẻ viết "a skeleton like this" · "một bộ xương như thế này" để vẫn đúng nếu ảnh không phải đúng mẫu vật của bà.
10. Bài 9 Chơi: món bẫy thứ ba là đèn dầu cổ (giống hổ phách). Đồng xu cổ (`tray_old_coin`, key theo bảng) hầu hết có chữ: brief yêu cầu chữ đã mòn, không đọc được ở cỡ ô.

**Cần người soạn A biết** (B trỏ key theo bảng Hình dùng chung và luật đặt key; bài của A chưa có file khi B soạn)
- Key của A mà B dùng, ngoài cột "Dùng lại ở" của bảng: `tray_talc` (bài 4, theo kế hoạch), `tray_mortar` (bài 1, theo kế hoạch), `explore_scratch` (bài 7 w2), `quarry` (bài 6 w3), `magnifying_glass` (bài 6 q1, bài 9 q3), `pumice`, `tray_gypsum` (bài 6 q4), `chalk` (bài 6 w2, q5), `tray_concrete` (bài 6 q3), `granite` (bài 6 q4, bài 7 w1, bài 9 q2), `tray_sandstone` (bài 7 q2), `tray_limestone`, `marble`, `tray_slate`, `tray_brick`, `tray_steps`. A cần đặt đúng các key này, đúng nội dung ở bảng.
- Brief "Dùng lại hình" trỏ bài 1 tới 5 chưa chép từ khoá; `alt` viết theo luật câu tính chất (chỉ màu, hình dáng). Topic editor chép từ khoá và đối chiếu `alt` khi rà chéo.
- Gợi ý gọi tên ô của A: bài 1 "Made by people" · "Do con người làm ra" (bài 6 w3), bài 3 "trò thử cào", bài 5 "trò thử nhỏ nước" (bài 6), bài 4 "Minerals" · "Khoáng vật" (bài 9 w2). A đổi tên ô thì báo để B sửa gợi ý.

**Đề xuất cho người khác**
- C (bài 12): món bẫy "sân xi măng" dùng lại `tray_cement_yard` ở bài `da-va-dat/da-dung-lam-gi` thay vì tìm ảnh mới.
- dev: dòng `READINGS` cho cả "Mary" đứng riêng (bài 10 có nhiều chuỗi VI chỉ viết "Mary"), ngoài "Mary Anning".
- designer: bộ "Mặt cắt lòng đất" có năm hình ở bài 8 (khung không, một, hai, bốn và hình đất nặn) và hai hình ở bài 9 (hổ phách, khúc gỗ); kệ bài 10 chín hình vẽ cùng hai hình vẽ mới ở q3, q4.

**[CẦN KIỂM] mới** (ngoài các mục đã có ở `_topic.md`; mỗi chỗ có dòng `>` trong bài)
- Bài 6: xi măng làm từ đá vôi (cùng đất sét) nghiền rồi nung; vôi quét tường từ đá vôi nung; tên "đá ong" do mặt rỗ như tổ ong; giếng làng ở Đường Lâm xây bằng đá ong; cổng làng Mông Phụ có đá ong không; đảo ở vịnh Hạ Long phần lớn là đá vôi; đá hoa cương gần như không thấm nước; bê tông có đá dăm và xi măng, sân xi măng láng vữa xi măng và cát; đá phấn để ngoài mưa nắng mau mòn, đá ba-dan khó đẽo bằng tay; nhà cổ Đường Lâm hàng trăm năm tuổi (thẻ).
- Bài 7: nắng ngày, đêm lạnh làm đá nứt; rãnh trên mặt đá vôi do nước mưa; gió mang cát mài đá thành hình lạ; suối vừa mài vừa mang sỏi đi (bài xếp vào xói mòn); sông để bùn cát lắng ở cửa sông thành bãi đất mới; chặt cây ven bờ, hút cát làm bờ sông dễ lở, kè đá và cây cỏ giữ bờ; sóng và mưa làm hoá thạch lộ ra ở vách đá (bài 10 q1).
- Bài 8: trầm tích chồng lớp, sức ép làm rắn thành đá, chỉ rất ít sinh vật thành hoá thạch; vỏ bị sóng đánh thường vỡ, vỏ cất trong nhà không thành hoá thạch; vỏ ốc sên trên cạn cũng có thể thành hoá thạch.
- Bài 9: sinh vật thân mềm rất hiếm khi thành hoá thạch; mai cua dễ thành hoá thạch hơn sứa, bạch tuộc; ảnh thềm cặn khoáng có hợp để minh hoạ "chất khoáng trong nước" không; ảnh vỏ ốc đúng là vỏ được chất khoáng lấp đầy.
- Bài 10: ý chính hai "khoa học chưa từng biết" là giản lược; tranh chân dung vẽ lúc bà còn sống, năm vẽ, đã hết bản quyền; quy định nhặt hoá thạch (bài 10 q4); cách đọc "me-ri a-ninh", "me-ri".

**Hình** (ảnh mới · hình tự vẽ): bài 6: mười lăm · một; bài 7: hai mươi mốt · không; bài 8: mười lăm · năm; bài 9: hai mươi · hai; bài 10: sáu (gồm tranh chân dung) · mười hai. Khó tìm, phương án thay đã ghi trong brief:
- giấy phép (nhiều ảnh CC BY-SA): làng cổ Đường Lâm (ô Học, giếng, cổng, cận cảnh tường), núi đá vôi Tràng An, thành nhà Hồ, động Phong Nha, trống đồng, bộ xương thằn lằn cá của Mary ở Bảo tàng Lịch sử Tự nhiên, vách đá ở thị trấn Lyme Regis;
- logo, chữ: gầu máy xúc, tàu hút cát, đồng xu cổ; nếu gầu máy xúc hay tay đục đá không có ảnh hợp lệ thì cả kệ bài 7 phải vẽ (báo B);
- nguồn: hổ phách không lấy Myanmar; rễ đa trùm tường đá ở Việt Nam.

**Còn mở**
- Duy xác nhận dùng tranh chân dung Mary Anning ở ô Học bài 10 (Main session đã cho dùng; brief có phương án thay bằng ảnh vách đá).
- Chưa chạy `validate`; chờ phiên chính chạy rồi gửi dòng lỗi.

## content-editor A 11/11 · bài 1–5

Phạm vi: bước 2, người soạn A. Chỉ viết năm file bài dưới đây; không sửa `_topic.md`, `content/TEMPLATE.md`, bài của B, C. Không chạy lệnh; mọi dòng `id:` để trống, `ai_draft: true`. Lượt trước bị dừng khi đang viết bài 4; lượt này đọc lại bài 1–3, viết bài 4, 5. Đã rà bằng tìm chuỗi (không phải `validate`): chuỗi `.en` không có dấu tiếng Việt; chuỗi `.vi` không có chữ số, ký hiệu, dấu "—" (trừ chỗ trống `{1}`); vị trí đáp án và đáp án Đúng/Sai của từng câu; mọi key mà bài 6–14 đang trỏ tới (`tray_talc`, `tray_mortar`, `explore_scratch`, `quarry`, `magnifying_glass`, `pumice`, `tray_gypsum`, `chalk`, `tray_concrete`, `granite`, `tray_sandstone`, `tray_limestone`, `marble`, `tray_slate`, `tray_brick`, `tray_steps`, `tray_road`) đều có trong bài 1–5.

**File**
- `content/discoverer/da-va-dat/01-lam-quen-voi-da.md`
- `content/discoverer/da-va-dat/02-nhin-ky-cac-loai-da.md`
- `content/discoverer/da-va-dat/03-da-nao-cung-hon.md`
- `content/discoverer/da-va-dat/04-thang-do-cung-mohs.md`
- `content/discoverer/da-va-dat/05-da-nao-tham-nuoc.md`

**Mỗi bài một dòng**
- Bài 1 (`opener`): đá quanh em, từ lòng đất (mỏ đá), vật liệu, do con người làm ra. q6 `bricks_are_rocks`, Na "gạch cứng như đá nên là đá" (Sai). Chơi: đá trong tự nhiên (đảo giữa biển, lòng suối) · trong nhà cửa (bậc thềm, tường rào) · đồ dùng (cối giã, cối xay); bẫy viên gạch, khối bê tông, mặt đường nhựa; kệ ảnh. Câu "Em nghĩ sao?" ghi ở Ghi chú cho dev.
- Bài 2: kính lúp, hạt, lỗ (từng là dung nham, nối *Núi lửa*), lớp; mỗi loại đá có tên. q6 `rocks_all_look_same`, Na "hai hòn cùng xám, một hòn có lỗ, là hai loại khác nhau" (Đúng). Chơi: hạt lấp lánh · có lỗ nhỏ · có từng lớp; bẫy bọt biển, khúc gỗ, đường phèn; kệ ảnh. Gốc năm ảnh Bộ mẫu đá.
- Bài 3: thử cào bằng móng tay rồi cán thìa inox, đá mềm, đá cứng, độ cứng là một tính chất. q6 `all_rocks_are_hard`, Na "đá phấn là đá nên rất cứng" (Sai). Chơi: móng tay cào xước được · chỉ thìa mới cào xước được · cào không xước; bẫy xà phòng, nến, cục tẩy; kệ ảnh. Gốc bộ hình vẽ "Bàn tay thử đá" (`explore_scratch`).
- Bài 4: đá gồm khoáng vật, ông Mohs xếp khoáng vật theo độ cứng, đối chiếu kết quả thử, nặng không phải cứng (bát sứ cứng mà vẫn vỡ). q6 `heavy_means_hard`, Na "hòn đá nặng mà móng tay cào xước được nên mềm" (Đúng). Chơi: khoáng vật mềm · cứng · rất cứng; bẫy đường phèn, bi thuỷ tinh, hạt cườm nhựa; kệ ảnh. Gốc hình vẽ "Thang Mohs".
- Bài 5: thử nhỏ nước, đá thấm nước (sa thạch, đá phấn), bọt khí nổi lên mãi (vài bọt rồi thôi chỉ là không khí bám ngoài), đá không thấm nước (đá cẩm thạch, đá phiến). q6 `rocks_never_soak_water`, Na "đá rắn chắc nên nước không bao giờ vào được" (Sai). Chơi: giọt nước biến mất · bọt khí nổi lên mãi · vết ướt loang rộng; bẫy giọt đọng tròn trên đá cẩm thạch, nước trượt khỏi đá phiến, chỉ hai bọt khí từ đá hoa cương; kệ hình vẽ.

**Đối chiếu bảng `_topic.md`** (khớp cả ba bảng)
- Đúng/Sai: bài 1 w2 Đúng, q6 Sai; bài 2 w2 Sai, q6 Đúng; bài 3 w2 Đúng, q6 Sai; bài 4 w2 Sai, q6 Đúng; bài 5 w2 Đúng, q6 Sai. Câu `true_false` Khởi động dùng đúng chữ EN của bảng; lời Na đúng chữ bảng "Câu sáu".
- Vị trí đáp án (w1 · q1 · thẻ q2 · q3 · q4 · q5): bài 1: 2 · 3 · 1 · 1,4 · 1 · 1; bài 2: 1 · 3 · 3 · 2,3 · 1 · 2; bài 3: 1 · 2 · 2 · 1,2,4 · 1 · 3; bài 4: 3 · 1 · 2 · 2,4 · 1 · 4/4; bài 5: 2 · 3 · 3 · 1,3 · 2 · 1.
- Khởi động: đúng slug, đúng lựa chọn, thứ tự và vị trí ở bảng. Bài được ôn sau đã dạy đúng ý: bê tông do con người làm ra, đá có sẵn trong tự nhiên, mỏ đá (bài 1); có loại đá có hạt nhìn thấy được, câu ô "Grains" khớp nguyên văn câu w2 bài 5 (bài 2); đá phấn mềm, móng tay không cào xước đá hoa cương (bài 3, ô "Soft rocks", "Hard rocks"); đá tạo nên từ khoáng vật, kim cương cứng nhất (bài 4); sa thạch thấm nước, "Some rocks let water soak in" (bài 5). Tên ô B và C trỏ tới giữ nguyên: "Made by people" · "Do con người làm ra", "Minerals" · "Khoáng vật", "Water test" · "Thử nhỏ nước".

**Chỗ lệch `_topic.md` và lý do** (ý chính, key, đáp án Na, từ core, thẻ, các bảng đều giữ; chỉ lệch ở quiz gợi ý, chữ nhãn và hình)
1. Bài 1 Quiz: câu "người ta lấy đá ở đâu" đặt ở q1 (DOK 1, xưởng gỗ · lò gạch · mỏ đá) thay vì q4; q4 là "thứ nào có sẵn trong tự nhiên" với ba vật nhỏ mới (hòn cuội · viên ngói · bi thuỷ tinh); q5 "vật liệu nào bền nhất cho bậc thềm ngoài nắng mưa" (đá · gỗ · tre), thay cho "vì sao bậc thềm làm bằng đá" (lựa chọn là lý do thì khó có hình). Câu q6 dùng ảnh tường gạch mới, không dùng lại `tray_brick`, vì `tray_brick` đã là lựa chọn sai ở q3 (`_topic.md` cho phép "ảnh tường gạch").
2. Bài 1 nhãn món Chơi và lựa chọn q3 chỉ gọi tên đồ vật, không có chữ "stone" · "đá" ("Cối giã", "Bậc thềm", "Tường rào"), để bé phải nhìn hình; `alt` các món đó cũng không có chữ "rock", "stone".
3. Bài 2 Quiz: q4 nhận ra đá phiến qua mô tả "tách thành tấm mỏng" (đá phiến · đá hoa cương hồng · đá phấn), q5 phân biệt đá thật với vật trông giống đá (đường phèn · hòn cuội · bọt biển), thay cho hai câu "so sánh hai hòn đá": lý do là luật một hình một vai (sáu mẫu đá của bài không đủ cho ba câu). q4 dùng trước ảnh `chalk` của bài 3 (một ảnh gốc cho mỗi loại đá). q1 dùng ảnh kính lúp mới, khác ảnh từ vựng (SK-037 N2).
4. Bài 2 nhãn món bẫy là "Sugar crystal" · "Cục đường phèn", không dùng "rock sugar", để nhóm "Not rocks" không có món mang chữ "rock".
5. Bài 3 nhãn nhóm Chơi thứ hai là "Only a spoon scratches it" · "Chỉ thìa mới cào xước được" (giữ ý), vì thìa cũng cào xước được đá mềm. Thạch cao gốc (`tray_gypsum`) là tinh thể trong (selenite), để khác đá phấn và để bài 4 dùng làm khoáng vật.
6. Bài 4 Quiz: q4 là câu chọn hàng xếp đúng thứ tự từ mềm tới cứng (ba hình ghép hoạt thạch, thạch anh, kim cương), thay câu `order_sequence`. q5 (bốn lựa chọn) hỏi "thứ nào cứng nhưng rơi thì vỡ" (gối · bóng cao su · cốc nhựa · bát sứ), thay cho "bát sứ vỡ có phải vì mềm" (lựa chọn là lý do, khó có hình); vẫn chạm `breaks_means_soft`, không gắn key. q3 có đá vôi nên hỏi "Which ones", không "Which minerals".
7. Bài 5 Quiz: q3 hỏi nhóm "keep water out" (đáp án đá cẩm thạch, đá phiến), để ảnh sa thạch (ảnh từ `sandstone` bé đã thấy ở Học) là lựa chọn sai chứ không là đáp án duy nhất bé đã thấy. q4, q5 đọc kết quả bằng hình của kệ Chơi. Câu w1 đổi chữ ("Which one is the hardest of the three?") để khác câu q1 bài 4.

**Đề xuất cho topic editor**
- Bảng Hình dùng chung, cột "Dùng lại ở", thêm theo bài thật: `quarry` (1: ô `explore_ground`, q1; 2: q4); `tray_slate` (3: q4; 5: q3); `tray_sandstone` (3: thẻ q2; 5: q3, q6); `pumice` (3: thẻ q2); `chalk` (2: q4; 5: q3); `marble` (5: q3); `tray_gypsum` (4: q3; 5: w1); `tray_limestone` (4: q3); `diamond`, `quartz`, `geologist` (5: w1). Gốc mới ngoài bảng, bài khác đang hoặc có thể dùng: bài 1 `tray_mortar`, `explore_around`, `w1` (bếp quê), `q4_pebble`, `q4_marble`; bài 2 `q1` (bàn bày nhiều hòn đá), `q1_magnifier`, `q1_torch`, `tray_pink_granite`; bài 3 `explore_properties`, `q2` (bàn tay trẻ), `q1_spoon`, `q5_none`; bài 4 `geologist` (bài 15 dùng cho từ `geologist`), `mineral`, `tray_talc`, `tray_ruby`, `explore_scale`.
- Bài 6 (B) câu q4: `alt` thạch cao "A milky white rock" · "Hòn đá trắng đục" không khớp ảnh gốc (thạch cao tinh thể trong, `alt` gốc "A clear rock" · "Hòn đá trong"). Đề xuất B đổi `alt`, không đổi ảnh gốc. Từ khoá các ảnh gốc của bài 1–5 nay đã có trong brief, chép sang các chỗ "Dùng lại hình" của B, C khi rà chéo.
- Nhóm "Wet patch spreads" (bài 5) vẫn chờ chuyên môn như mục Còn chưa chắc; nếu đổi thì sửa ô `explore_permeable` (ví dụ bốn), nhóm `tray_wet` và hai món của nhóm đó.

**[CẦN KIỂM] mới** (ngoài các mục đã có ở `_topic.md`; mỗi chỗ có dòng `>` trong bài)
- Bài 1: ngói nung từ đất sét; gỗ, tre để ngoài trời lâu ngày bị mục, bậc đá bền nhiều năm (q5).
- Bài 2: không phải đá nào có lỗ cũng từng là dung nham (ô "Holes" chỉ gọi tên đá bọt, đá ba-dan); đá phiến tách được thành tấm mỏng (q4); vân sọc của sa thạch là các lớp cát.
- Bài 3: thìa inox cào xước được đá vôi, đá cẩm thạch, đá phấn, không cào xước được đá ba-dan (q3); móng tay không cào xước được đá phiến (q4); thạch cao gọi là "đá mềm" ở bài này dù ảnh là tinh thể khoáng vật.
- Bài 4: hạt trong đá hoa cương là các khoáng vật khác nhau; móng tay khoảng bậc hai phẩy năm (cào xước thạch cao, không xước thạch anh); thạch anh tím cùng bậc thạch anh; đường phèn do con người kết tinh; cốc nhựa thường không vỡ khi rơi (q5); "Mohs" đọc "mốt".
- Bài 5: nước thấm vào khe rỗng đẩy không khí ra thành bọt; đá hoa cương gần như không thấm, vài bọt bám ngoài mặt (món bẫy); sa thạch gồm hạt cát gắn chặt (từ `sandstone`).

**Hình** (ảnh mới · hình tự vẽ · hình ghép): bài 1: hai mươi sáu · không · một; bài 2: mười bảy · không · một; bài 3: mười ba · năm · một; bài 4: mười ba · ba · ba; bài 5: hai · mười sáu · không. Bộ mẫu đá gốc: bài 2 (`granite`, `tray_pink_granite`, `pumice`, `tray_sandstone`, `tray_slate`), bài 3 (`chalk`, `marble`, `tray_gypsum`, `tray_limestone`), bài 4 (`tray_talc`, `tray_amethyst`, `tray_ruby`, `diamond`, `quartz`). Khó tìm, phương án thay ghi trong brief:
- giấy phép (ảnh Việt Nam hay là CC BY-SA): tường rào đá vùng núi đá phía Bắc, lò gạch, cối xay bột bằng đá, bơm tay giếng khoan (thay bằng ảnh nước khác, không chữ);
- mẫu vật: kim cương thô, hồng ngọc thô (Smithsonian, USGS; không ảnh trang sức), hoạt thạch dạng khối, đá phiến thấy rõ mép tách lớp, mẫu đá có vết xước (thẻ q2 bài 3; thay bằng hình ghép), bánh bò cắt ngang (thay bằng bánh nhiều lỗ khác);
- chữ, logo: cục tẩy, bánh xà phòng, đèn pin, thân bơm giếng.

**Còn mở**
- Chưa chạy `validate`, `ids`; chờ phiên chính chạy (bài 1 trước bài 2…, vì `recall_from.lesson` bài 2–5 trỏ bài trước) rồi gửi dòng lỗi.
- dev: `READINGS` cho "Mohs" ở bài 4 (tiêu đề, mục tiêu, ý chính, ô Học, lời nhắn Chơi, giải thích, từ vựng, thẻ) và bài 5 (câu w1).

## content-editor C 11/11 · bài 11–15

Phạm vi: bước 2, người soạn C. Chỉ viết năm file bài dưới đây; không sửa `_topic.md`, `content/TEMPLATE.md`, bài của A, B, thư mục *Thời tiết*. Không chạy lệnh; mọi dòng `id:` để trống, `ai_draft: true`. Đã rà bằng tìm chuỗi (không phải `validate`): chuỗi `.en` không có dấu tiếng Việt; chuỗi `.vi` không có chữ số, ký hiệu, dấu "—" (trừ chỗ trống `{1}`); `[CẦN KIỂM]` chỉ ở dòng `>`; vị trí đáp án và đáp án Đúng/Sai khớp bảng. Sau khi soạn, đã đọc file bài 1–4, 6–10 của A, B và chép từ khoá, `alt` của mọi hình dùng lại (bài 5 chưa có file).

**File**
- `content/discoverer/da-va-dat/11-dat-gom-nhung-gi.md`
- `content/discoverer/da-va-dat/12-cac-loai-dat-o-viet-nam.md`
- `content/discoverer/da-va-dat/13-the-nao-la-dat-tot.md`
- `content/discoverer/da-va-dat/14-nuoc-tham-qua-dat-nao-nhanh-hon.md`
- `content/discoverer/da-va-dat/15-nha-dia-chat-lam-gi.md`

**Mỗi bài một dòng**
- Bài 11: lọ đất lắng thành lớp; mảnh đá (sỏi, cát, bùn mịn, đất sét), khe hở chứa không khí và nước; chất hữu cơ từ lá, rễ, con vật nhỏ. q6 `soil_was_always_there`, Na "đất vườn nhà bà lâu đời như Trái Đất" (Sai). Chơi: mảnh đá · chất hữu cơ · nước; bẫy túi nhựa, chai nhựa, vỏ lon; kệ ảnh. Gốc bộ hình vẽ "Lọ đất".
- Bài 12: màu và cỡ hạt khác nhau; đất phù sa (sông bồi, lúa); đất đỏ ba-dan (đá núi lửa xưa, cà phê); đất cát (hạt to, phi lao). q6 `all_soil_is_same`, Na "đất ráp, mau khô là đất cát" (Đúng). Chơi: nơi có đất phù sa · đất đỏ · đất cát; bẫy sân xi măng, mặt đường nhựa, nền gạch; kệ ảnh.
- Bài 13: đất tốt giữ nước, không khí, chất dinh dưỡng; giun đất, lá mục, phân ủ; khí hậu là thời tiết qua nhiều năm; quá ướt, quá khô. q6 `weather_is_climate`, Na "hôm nay Đà Lạt nóng, khí hậu vẫn mát" (Đúng). Chơi: con vật trong đất · thức ăn cho đất · nước vừa đủ; bẫy đất khô nứt nẻ, vườn rau ngập nước, pin cũ; kệ ảnh.
- Bài 14 (`apply`): lập kế hoạch, giữ công bằng (chỉ đổi một thứ), kết quả (hạt to cho nước qua nhanh), làm lại cho chắc; biểu đồ cột trong câu `single_choice`. q6 `all_soil_drains_same`, Na "nước qua cát và sét nhanh như nhau" (Sai). Chơi: hai bên giống nhau · thứ được thay đổi · thứ cần đo; bẫy "một bên … hơn"; kệ hình vẽ. Gốc bộ "Thí nghiệm chai".
- Bài 15 (`review`): đi thực địa, lấy mẫu về thử, giữ an toàn (sườn đồi, núi lửa, nước ngầm), đá Mặt Trăng và Sao Hoả. q6 `geologists_only_earth`, Na "hòn đá rơi từ vũ trụ, nhà địa chất nghiên cứu được" (Đúng). Chơi: việc trên Trái Đất · giữ an toàn · ngoài vũ trụ; bẫy dự báo thời tiết, ngắm sao, trồng rau; kệ ảnh. Ôn trộn: w1 bài 14, w2 bài 7, w3 câu "Em nghĩ sao?" bài 1, q2 bài 4, q3 bài 3 và 5, q5 bài 11.

**Đối chiếu bảng `_topic.md`** (khớp cả ba bảng)
- Đúng/Sai: bài 11 w2 Đúng, q6 Sai; bài 12 w2 Sai, q6 Đúng; bài 13 w2 Sai, q6 Đúng; bài 14 w2 Đúng, q6 Sai; bài 15 w3 Sai, q6 Đúng. Câu `true_false` Khởi động dùng đúng chữ EN của bảng.
- Vị trí đáp án (w1 · w2/w3 một đáp án · q1 · thẻ q2 · q3 · q4 · q5): bài 11: 3 · — · 2 · 3 · 1,2,3 · 3 · 1; bài 12: 2 · w3 3 · 3 · 3 · 1,3,4 · 1/4 · 2; bài 13: 4/4 · w3 2 · 1 · 2 · 1,4 · 3 · 2; bài 14: 1 · — · 3 · 2 · 2,3 · 2 · 1; bài 15: 2 · w2 2 · 3 · 1 · 1,2 · 1/4 · 3.
- Khởi động: đúng slug, đúng ý và thứ tự lựa chọn của bảng (hai chỗ đổi chữ, mục dưới). Bài 13 có w3 (ôn *Thời tiết* bài hai `do-thoi-tiet`, ống đo mưa, đáp án chỗ thứ hai): lúc bàn giao bài đó đã có id. Bài được ôn sau đã dạy đúng ý: thứ tự lắng (bài 11, ô Lọ đất lắng, hình và câu q4), đất phù sa ở ruộng lúa đồng bằng (bài 12), giun đất (bài 13), đất cát cho nước qua nhanh nhất (bài 14).

**Chỗ lệch `_topic.md` và lý do** (đề xuất topic editor sửa bảng theo)
1. Bài 11, tên ô thứ tư "Air and water" thành "Tiny spaces" · "Khe hở nhỏ": câu q5 có đáp án "không khí" và gợi ý trỏ về ô này, tên ô không được chứa chữ của nhãn đáp án. Tương tự bài 13, ô thứ ba "Weather and climate" thành "One day or many years" · "Một ngày hay nhiều năm" (câu q2 đáp án "khí hậu").
2. Bài 11 q5, chuỗi VI dùng "bong bóng nhỏ" thay cho "bọt khí" (bảng Tên gọi): chữ "khí" lộ đáp án "không khí" khi bé nghe tiếng Việt.
3. Bài 12 w1, hình câu hỏi là `prediction` của bài 11 (lọ vừa lắc, chưa thấy lớp), không phải `explore_jar` như bảng Hình dùng chung: `explore_jar` vẽ sỏi dưới đáy, tức là đáp án. `explore_jar` vẫn dùng lại ở bài 15 câu q3.
4. Bài 12 w3, lựa chọn "đất ruộng lúa" dùng ảnh `alluvial_soil` (mặt ruộng đất phù sa chụp gần, gốc ở bài 12) thay cho `q2_rice` (cánh đồng chụp rộng, lệch khung với hai ảnh mặt đất chụp gần). `q2_rice` dùng ở bài 12 (Chơi, q3), bài 13 (w1), bài 15 (q4).
5. Bài 12 Quiz khác gợi ý: q1 hỏi cây giữ đất cát (phi lao); q2 điền "silt" với hai thẻ đá núi lửa (thẻ cát, sét sẽ thành hai đáp án vì sông cũng mang cát, sét); q3 cây hợp đất phù sa (đúng gợi ý); q4 bốn lựa chọn, vườn cà phê thì thấy đất nào (đúng gợi ý, thêm một bước); q5 so cỡ hạt đất cát với đất đỏ thay cho "đất nào mau khô nhất sau mưa", để ý "mau khô" còn là việc bé tự suy ra ở q6 (rút kinh nghiệm SK-036 N2). Nhãn món Chơi không chứa tên nhóm ("Freshly ploughed field", không "Red soil field").
6. Bài 13: ví dụ khí hậu ở ô Học là mùa đông lạnh miền Bắc, Đà Lạt chỉ ở q6 (lời Na là tình huống mới); con vật thứ hai ở kệ là kiến; món bẫy là vườn rau ngập (ruộng lúa vốn giữ nước có chủ ý, thẻ bài 14); q5 hỏi nắm đất nào là đất tốt, không hỏi "đất quá khô thì cây ra sao" (*Thời tiết* bài bốn đã dạy cây khô héo khi hạn).
7. Bài 13 `tray_cracked`: key giữ, nhưng bài 13 không còn là gốc: *Thời tiết* bài bốn đã dùng ảnh đất nứt nẻ `q2` của `be-mat-trai-dat/dong-dat-va-song-than`, nên món trỏ thẳng hình gốc đó.
8. Bài 14: q2 "A fair test changes {1}." (không có chữ "only" để câu khỏi tự nói đáp án); q3 thử "đất nào giữ nước tốt nhất" (bốn lựa chọn ứng ba nhóm Chơi); biểu đồ q4 là lượng nước hứng trong một phút (cao hơn là nhanh hơn), không phải thời gian; `explore_setup` không vẽ đồng hồ (để làm hình câu hỏi q1). Q5 là gợi ý "sân trường đọng nước" (giữ).
9. Bài 15 w2: giữ ý (phong hoá), lựa chọn và vị trí, nhưng chữ câu hỏi đổi từ "rễ cây làm nứt đá" thành "mưa và nắng nóng làm đá nứt dần": lựa chọn đúng dùng lại `explore_weathering` (rễ cây trùm tường đá), nên nếu câu hỏi nói "rễ cây" bé chỉ cần tìm hình có rễ.
10. Bài 15 q5 ôn bài 11 (lớp đất gần mặt sẫm màu, có rễ, chất hữu cơ). Biên tập đã bỏ ý "thấy đất đỏ trên đồi thì xưa có núi lửa": đất đỏ vàng ở đồi núi Việt Nam phần lớn không có từ đá núi lửa, câu sẽ sai khoa học.
11. Bài 15 hình: ô Giữ an toàn là ảnh trạm đo ở núi lửa (ảnh sườn đồi ở kệ Chơi và là đáp án q4, nên không để nó là ảnh duy nhất bé thấy ở Học); món "Quan sát vách đá" dùng lại ảnh `geologist` của bài 4 (cùng cảnh nhà địa chất từ phía sau trước vách đá), không tìm ảnh mới; ô Đi thực địa dùng `magnifying_glass` đúng bảng.
12. Bài 12 Chơi: sân xi măng dùng lại `tray_cement_yard` của bài 6 theo đề xuất của B; nhãn "Cement yard" · "Sân xi măng" như bài 6.

**Hình nối với *Thời tiết*** (đã đọc lại thư mục `thoi-tiet-va-thien-tai/` sau khi soạn, bài một tới năm)
- Đã nối: bài 13 ô Quá ướt hay quá khô dùng lại `explore_seasons` ở bài `thoi-tiet-va-thien-tai/lu-lut-va-han-han`; bài 13 w3 dùng ba hình `explore_thermometer`, `explore_rain_gauge`, `explore_windsock` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`; bài 13 q2 (hình câu hỏi) dùng lại `explore_rain_gauge`; bài 14 q1 dùng lại `explore_thermometer` (designer cắt sát cho cùng khung, ghi dưới lựa chọn).
- Đất nứt nẻ: không nối qua *Thời tiết*, trỏ thẳng hình gốc `q2` ở bài `be-mat-trai-dat/dong-dat-va-song-than` (*Thời tiết* cũng dùng lại hình đó).
- **Chờ nối (chưa có key phù hợp ở *Thời tiết*):**
  - bài 13 `tray_flooded` (vườn rau ngập nước): *Thời tiết* bài bốn chỉ có cánh đồng, ruộng lúa ngập (`explore_flood` ảnh, `tray_fields` hình vẽ). Phiên chính chốt: giữ ảnh riêng, hay đổi món thành "Flooded field" · "Ruộng ngập nước" và dùng lại `explore_flood`.
  - bài 15 `tray_slope` (sườn đồi có vết sạt lở cũ, chụp xa): *Thời tiết* bài một tới năm không có ảnh sạt lở. Bài 15 tạm là gốc; nếu *Thời tiết* thêm ảnh này thì đổi brief sang "Dùng lại hình".

**[CẦN KIỂM] mới** (ngoài các mục đã có ở `_topic.md`; mỗi chỗ có dòng `>` trong bài)
- Bài 11: thời gian chờ lọ đất lắng; chất hữu cơ làm đất sẫm màu; rễ cây cần không khí và nước; bong bóng khi đổ nước vào đất khô là không khí bị đẩy ra; một thìa đất tốt có nhiều sinh vật hơn số người trên Trái Đất (thẻ).
- Bài 12: màu đất phù sa (nâu xám); đất đỏ ba-dan tơi xốp, nhiều sét, hạt mịn hơn đất cát; rễ phi lao giữ cát; dưa hấu trồng trên cát ven biển; rau màu trên bãi bồi; hồ tiêu trên đất đỏ ba-dan; đất thịt là hỗn hợp cát, bùn mịn, sét, chất hữu cơ; Tây Nguyên là vùng trồng cà phê lớn nhất (thẻ); khuyến cáo vệ sinh khi cầm đất.
- Bài 13: đất tốt có nhiều sinh vật nhỏ; miền Bắc có mùa đông lạnh; khí hậu đang thay đổi dần; đất ngập lâu thì rễ thiếu không khí, giun khó sống; kiến làm đất tơi; rãnh thoát nước giúp đất không úng; pin cũ làm hại đất; phủ rơm giữ ẩm; đất thiếu giun dễ bị nén chặt; Việt Nam có mùa mưa hằng năm.
- Bài 14: đất sét giữ nước lâu, mặt còn đọng nước; tỉ lệ ba cột biểu đồ; trộn cát giúp sân đất thoát nước; ruộng lúa giữ nước nhờ lớp đất nhiều sét (thẻ).
- Bài 15: mưa và nắng nóng làm đá nứt là phong hoá; mưa lớn kéo dài làm sườn đồi dốc dễ sạt lở; lớp đất mặt sẫm màu, sâu hơn là đất nhạt, đá vụn rồi đá liền khối; nhà địa chất nghiên cứu đá rơi từ vũ trụ.

**Hình** (ảnh mới · hình tự vẽ · hình ghép): bài 11: mười tám · bảy · một; bài 12: mười một · tám · không (sửa theo tester n7); bài 13: mười ba · năm · không; bài 14: ba · hai mươi hai · không; bài 15: mười · hai · không. Khó tìm, phương án thay đã ghi trong brief:
- giấy phép (ảnh Việt Nam nhiều CC BY-SA): đồi cà phê Tây Nguyên, rừng phi lao ven biển miền Trung, cánh đồng sương mù mùa đông miền Bắc, đồi thông Đà Lạt; được lấy cảnh tương tự ở nơi khác, chữ của bài không nói ảnh chụp ở đâu;
- chữ, logo: vỏ lon (bài 11), pin cũ (bài 13; không có ảnh hợp lệ thì cả kệ bài 13 vẽ), xe tự hành Sao Hoả, mẫu đá Mặt Trăng, hòn đá rơi từ vũ trụ trong bảo tàng (không biển tên), khay mẫu đá (không nhãn);
- người: chỉ ảnh `geologist` của bài 4 (từ phía sau) có người; ảnh đó là hình câu hỏi bài 15 q1 (đáp án búa địa chất), nên khi chọn ảnh tránh thấy rõ búa;
- thiên nhiên dữ dội: sườn đồi sạt lở chụp rất xa, không nhà đổ, không người (USGS);
- bộ hình vẽ: "Lọ đất" (bài 11, bảy hình), "Thí nghiệm chai" (bài 14, hai mươi hai hình), nắm đất trong tay đeo găng (bài 12 q4 bốn hình, bài 13 q5 hai hình), mặt cắt đất (bài 13 q4 ba hình), "Bàn tay thử đá" thêm hai hình (bài 15 q3).

**Đề xuất cho người khác**
- Topic editor (bảng Hình dùng chung, bảng Khởi động): `explore_jar` bỏ "12 (hình câu w1)", giữ "15 (q3)"; `q2_rice` sửa thành 12 (Chơi, q3), 13 (w1), 15 (q4); `tray_cracked` ghi "dùng lại `q2` của `be-mat-trai-dat/dong-dat-va-song-than`", không còn gốc ở bài 13; `geologist` bài 4 thêm "15 (món Chơi, hình câu q1, từ geologist)"; thêm các hình gốc mới của bài 11 tới 13 mà bài sau dùng: `prediction`, `silt`, `tray_sand`, `tray_watering`, `explore_organic`, `q6` (bài 11), `alluvial_soil`, `q4_dark` (bài 12), `explore_healthy` (bài 13); bảng Khởi động bài 15 w2 chữ mới; bảng Tên gọi ghi "bong bóng" ở bài 11 q5.
- Người A: ảnh `geologist` (bài 4) tránh thấy rõ búa (lý do trên). Bài 5 nếu có hình vẽ "nhỏ nước lên đá" (bộ "Bàn tay thử đá") thì báo key, bài 15 `q3_water` đổi sang "Dùng lại hình".
- dev: `READINGS` "Mary Anning" còn ở chuỗi VI bài 11 w1. Bài 15 chuỗi VI không có "Mohs" (q2 nói "thang độ cứng").
- designer: nhiệt kế của *Thời tiết* bài hai cắt sát cho câu q1 bài 14 (ba dụng cụ trên nền kem), ghi `changes`.

**Còn chưa chắc**
- Bài 14 q6: ô Kết quả nói luật cỡ hạt, không viết "đất sét chậm", nhưng hình ô đó cho thấy hai cốc khác nhau; q6 có thể chỉ ở mức DOK 2. Nếu tester thấy nhẹ: giữ key và đáp án Sai, đổi lời Na sang cặp đất bài chưa làm (ví dụ "Garden soil and sandy soil drain at the same speed."), đổi hình câu hỏi.
- Bài 11 w1: ba ảnh lựa chọn khác khung (khủng long đồ chơi trên bàn, đồng xu chụp gần, bộ xương trong bảo tàng) vì đều là hình gốc của bài khác; designer xem có cần đặt cùng nền.
- Bài 15 w3: gợi ý trỏ ô "Natural forces" · "Lực tự nhiên" của bài 7 (đã đối chiếu file); B đổi tên ô thì sửa theo.
- Chưa chạy `validate`; chờ phiên chính chạy rồi gửi dòng lỗi.

## Rà chữ bài 1–8 (tester 11/11)

Phạm vi: `content/discoverer/da-va-dat/_topic.md` và tám bài `01-` tới `08-`; đọc đối chiếu `be-mat-trai-dat/`, `khung-long/`, `ho-hap/`, `nao-bo-va-giac-quan/` ở những chỗ chủ đề này trỏ tới, và bài 9–15 ở những chỗ nối với bài 1–8 (hình dùng chung, Khởi động). Một tester khác rà bài 9–15. Không sửa file nội dung, không chạy `tts`/`build`/`import`/`ids`, không dùng simulator. `validate` do phiên chính chạy (0 lỗi), không chạy lại.

Chuẩn đối chiếu: `content/TEMPLATE.md`, `content/rules.json` (`discoverer.authoring`), mọi bảng và luật riêng trong `_topic.md`, sườn Oak `docs/oak/rocks-and-soils.md` (bài app 1–8 = Oak 1–8), các lỗi tester đã bắt ở SK-036, SK-037, SK-038, an toàn với trẻ bảy tới chín tuổi, độ đúng khoa học địa chất ở mức phổ thông. Ngoài đọc tay, chạy bảy script kiểm cấu trúc trong scratchpad (`sk039a/`, không phải test sản phẩm): (1) format, DOK, số lựa chọn, vị trí đáp án, key misconception, số từ EN, chỗ thiếu hình; (2) mọi "Dùng lại hình" — key có thật, không trỏ qua chỗ dùng lại khác, từ khoá và `alt` chép đúng gốc; (3) nguồn hình từng lựa chọn; (4) loại hình thật sau khi lần hết chuỗi dùng lại; (5) chữ `.en`/`.vi`, `messages.full`, nhãn `limit`, dấu phẩy nhãn nhóm, từ vựng, luật Đúng/Sai; (6) gợi ý nhắc chữ nhãn đáp án, độ dài nhãn đúng so với nhãn sai; (7) vai của từng hình trong một bài, và vai của lựa chọn so với món kệ Chơi.

**Tổng kết: chặn 0 · nên sửa 6 · nhỏ 13.**

### Đạt (đã kiểm bằng máy, không có lỗi)
- **Đúng sườn Oak từng bài:** bài 1–8 khớp Oak lesson 1–8 (mục tiêu, ý chính, từ khoá, misconception); mọi chỗ lệch đều nằm trong danh sách đã duyệt ở `_topic.md` (đinh → móng tay và cán thìa inox; mũi tên đá, Stonehenge → cối đá, đình chùa, thành đá vôi; thang mười bậc rút còn ba mức; `order_sequence` → `single_choice`; "permeable/permanent" → `rocks_never_soak_water`).
- Quiz sáu câu mỗi bài, DOK 1·1·2·2·2·3 (Discoverer 2·3·1), câu một DOK 1, đúng một câu misconception mỗi bài ở q6; tám key đều có ở mục `## Misconceptions`, không key nào gắn ở Khởi động. Mỗi bài đủ bốn format; không `order_sequence`, không `picture_bar_chart`. Khởi động hai câu (bài 6 ba câu), DOK 1, câu nào cũng có `recall_from`.
- **Vị trí đáp án khớp đúng từng ô bảng "Vị trí đáp án đúng"** (`_topic.md:611-637`), kể cả cột thẻ `fill_blank_bank`: 1: 2·3·1·1,4·1·1; 2: 1·3·3·2,3·1·2; 3: 1·2·2·1,2,4·1·3; 4: 3·1·2·2,4·1·4/4; 5: 2·3·3·1,3·2·1; 6: 3·w3 1·3·1·3,4·2/4·2; 7: 1·3·3·1,2·2·2; 8: 1·2·1·2,3,4·2·3.
- Đúng/Sai khớp bảng `_topic.md:571-608`: tám Đúng, tám Sai, mỗi bài một Đúng một Sai; câu sáu Sai · Đúng · Sai · Đúng · Sai · Sai · Đúng · Sai. Mười sáu câu `true_false` dùng **đúng nguyên văn chữ EN** của bảng. Không câu đáp án Sai nào mở đầu `explanation_correct` bằng "Yes!" · "Đúng rồi!"; mọi `explanation_wrong` đúng khuôn. Ba câu q6 có chữ phủ định (bài 5 "never", bài 7 "not", bài 8 "cannot") là đúng chữ bảng "Câu sáu, lời Na", không tính lỗi.
- **370 chỗ có hình, không chỗ nào thiếu** `image.brief` + `alt.en` + `alt.vi`. **213 chỗ "Dùng lại hình": mọi key có thật** (kể cả 26 hình của bốn chủ đề khác), không chỗ nào trỏ qua một chỗ dùng lại khác.
- **Một câu một loại hình, một kệ một loại hình:** lần hết chuỗi dùng lại thì 49 câu có lựa chọn và cả tám kệ Chơi đều thuần một loại (bài 3 q5 và cả kệ bài 5 là hình vẽ; bài 4 q4 là ba hình ghép; còn lại ảnh chụp).
- **Không hình nào mang hai vai trái nhau trong một bài**, và không hai câu nào trong một bài dùng chung một hình **lựa chọn** (máy lần hết chuỗi dùng lại rồi so vai).
- Tám kệ Chơi: ba nhóm `required` mỗi nhóm hai món, một nhóm `limit` hai tới ba món, tám tới chín món, ba màu `required` khác nhau, `limit` luôn `nau_dat`. `messages.full` đúng chữ chung; tám nhãn `limit` đều dạng "Not …" · "Không …" và không gọi tên món bẫy; không nhãn nhóm nào ở Học hay Chơi có dấu phẩy.
- Số từ EN: chỉ một câu quá mười từ (`08:629`, đúng cảnh báo phiên chính đã chạy — xem n1). Chuỗi `.en` không có dấu tiếng Việt; chuỗi `.vi` không có chữ số hay ký hiệu (tám chỗ máy báo đều là `{1}` của câu điền từ).
- Từ vựng: bốn tới năm từ mỗi bài, đúng ba `core`, `term_keys` khớp. **Luật gating từ vựng đúng:** bài 1–3 không có "mineral", "geologist"; bài 1–4 không có "permeable", "thấm nước"; bài 1–6 không có "weathering", "erosion", "phong hoá", "xói mòn"; bài 1–7 không có "sediment", "trầm tích". Một `term.vi` có dấu phẩy (`03:610` "vết xước, cào xước") đã có dòng `>` nhắc nghe thử.
- Sáu mươi mốt dòng `[CẦN KIỂM]` đều nằm ở dòng `>` hoặc gạch đầu dòng ghi chú, không dòng nào lọt vào giá trị trẻ đọc.
- **An toàn:** không đinh, dao, axit, giấm ở bất cứ đâu; búa chỉ xuất hiện trong tay thợ đá người lớn (`07:320-327`) và kèm dòng `>` "không mời bé dùng"; thí nghiệm nước dùng cốc nhựa (`05:163`, `05:173`); ô thử cào có ví dụ "do it with a grown-up" (`03:134`); không cảnh người bị nạn, nhà sập, lũ ngập; bờ sông lở chụp xa, không người; đình chùa chỉ chụp phần đá, không cảnh thờ, không chữ Hán Nôm; hình phân huỷ chỉ vẽ vỏ rỗng, không vẽ xác con vật.
- **Khoa học phổ thông đúng ở các chỗ chính:** móng tay cào xước đá phấn, thạch cao, không xước thạch anh, đá phiến; cán thìa inox cào xước đá vôi, đá cẩm thạch, đá phấn, không xước đá hoa cương, đá ba-dan (bài 3 q3, bài 4 q3 đều đúng); bậc Mohs của sáu khoáng vật trong brief hình `explore_scale` đúng (hoạt thạch 1, thạch cao 2, thạch anh 7, hồng ngọc 9, kim cương 10), "hơn hai trăm năm trước" đúng với 1812; sa thạch, đá phấn thấm — đá cẩm thạch, đá phiến, đá hoa cương không thấm; đá vôi nghiền và nung làm xi măng; đá ong mới đào mềm rồi cứng dần; phong hoá (rễ cây, mưa làm mòn đá vôi, nóng lạnh) tách bạch với xói mòn (gió thổi cát, suối cuốn sỏi) đúng ở bài 7 q3; thứ tự hình thành hoá thạch (phân huỷ → trầm tích → sức ép) đúng ở bài 8 q4.
- Ba người soạn dùng **thuật ngữ thống nhất theo bảng Tên gọi**: không "đá hoa" cho marble, không "permanent", không "độ thấm", không "áp lực", không "biến thành đá", không "man-made", không tên ba loại đá (mác-ma, trầm tích, biến chất), không "petrified", "brittle"; "ba-dan" viết thống nhất.

### Lỗi chặn (0)
Không có chỗ nào phải dừng. Mục N1 nên chốt **trước khi designer vẽ bộ "Bàn tay thử đá"** (bài 5 có mười sáu hình vẽ), vì sửa nó có thể thêm ba hình.

### Nên sửa (6)

**N1. Lựa chọn của câu lấy nguyên vai từ kệ Chơi, nên bé trả lời bằng trí nhớ trò chơi** (cùng kiểu lỗi SK-038 N2). Nặng nhất là **bài 5 q4** (`05-da-nao-tham-nuoc.md:472-512`, người soạn A): cả ba lựa chọn là món của kệ, đáp án `q4_gone` là món **bắt buộc** của nhóm "Giọt nước biến mất", hai lựa chọn sai `q4_round`, `q4_runoff` là đúng hai món **bẫy** của nhóm `limit` "Không phải nước thấm vào". Bé vừa chơi xong, nhớ "giọt tròn và nước trượt là hai món bị loại", nên chạm món còn lại mà không cần đọc câu.
- Đề xuất: vẽ ba hình mới đúng tình huống của câu (hình câu hỏi `05:479` đã là ba hòn đá khô xếp hàng — ba lựa chọn là ba hòn đó **sau khi nhỏ giọt**, đánh dấu một hòn), giữ ba nhãn. Nếu muốn ít việc vẽ hơn: giữ `q4_gone`, `q4_round`, đổi `q4_runoff` thành một hình mới chưa gặp ("giọt nước đọng tròn trên đá hoa cương"), để vai không còn chia đôi theo ranh giới bắt buộc · bẫy.
- Hai chỗ cùng kiểu, nhẹ hơn, sửa được bằng một lựa chọn: **bài 8 q1** (`08:334-374`, người soạn B) — ba lựa chọn đều là món kệ, đáp án là món bắt buộc, hai lựa chọn sai là hai món bẫy; là câu DOK 1 nên chấp nhận được, nhưng nếu đổi thì thay `q1_dried_fish` bằng một ảnh mới ("vỏ ốc mới trên kệ bếp"). **Bài 6 q3** (`06:465-517`, B) — hai lựa chọn sai là đúng hai món bẫy của kệ ("Không làm từ đá"), hai đáp án là một món bắt buộc cộng một ảnh của bài 1; đổi `q3_fence` sang một đồ mới không phải món bẫy (ví dụ "chiếc rổ nhựa") là đủ.

**N2. Bài 6 q4: `alt` của thạch cao tả sai chính tấm ảnh đang dùng** (`06-da-dung-lam-gi.md:568-570`, B).
- Hiện có: `image.brief: Dùng lại hình tray_gypsum ở bài da-va-dat/da-nao-cung-hon.` · `alt.en: A milky white rock` · `alt.vi: Hòn đá trắng đục`.
- Ảnh gốc (`03-da-nao-cung-hon.md:285-288`) là **tinh thể selenite trong**, `alt` gốc "A clear rock" · "Hòn đá trong"; bài 4 và bài 5 w1 cũng đọc "Hòn đá trong". VoiceOver sẽ tả sai ảnh, và ba bài đọc cùng một ảnh theo hai cách trái nhau.
- Sửa: `06:569-570` → `image.alt.en: A clear rock` · `image.alt.vi: Hòn đá trong` (đúng đề xuất của người soạn A). Nếu chuyên môn muốn mẫu thạch cao trắng đục thì phải đổi ảnh gốc ở `03:285`, kéo theo bài 3 q4, bài 4 (món Chơi, q3), bài 5 w1.

**N3. Mười bốn chỗ ở bài 6, 7 sửa `alt` của hình dùng lại mà không có dòng `>` giải thích** (trái `_topic.md:734-739` mục 10: "`alt` chép của chỗ gốc, trừ khi phải sửa để khỏi lộ đáp án, ghi lý do bằng dòng `>`"). Người soạn B đã báo trước là chưa đối chiếu được (lúc soạn chưa có file của A); đây là danh sách đầy đủ để topic editor chép một lượt:
- Đáng sửa về nội dung, không chỉ về chữ: `06:560-562` `pumice` "A light grey rock with holes" · "Hòn đá xám nhạt có nhiều lỗ" (gốc "A pale grey rock" · "Hòn đá màu xám nhạt") — câu q4 đang hỏi đá nào hợp làm mặt bàn bếp, "có nhiều lỗ" chính là lý do loại nó, trái luật "`alt` chỉ tả màu và hình dáng" (`_topic.md:725`); `07:400-402` `tray_sandstone` "A rock with layers" · "Hòn đá có nhiều lớp" (gốc "A yellow-brown rock") — hợp nghĩa thẻ "layer" nhưng phải có dòng `>` như A đã làm ở `03:421`.
- Chỉ khác chữ, nên thống nhất về `alt` gốc: `06:73` `tray_slate`; `06:95` và `06:596` `chalk`; `06:116` `quarry`; `06:213`, `06:329`, `06:461`, `06:657` `tray_steps` (bốn chỗ, "Grey stone front steps" · "Bậc thềm đá xám" so với gốc "Grey steps at a door" · "Bậc thềm màu xám trước cửa"); `06:515` `tray_concrete`; `06:552` và `07:82` `granite`; `06:668` và `07:65` `tray_limestone`; `07:95` `explore_scratch`.
- Bốn chỗ còn lại ở bài 6, 7 đã có dòng `>` (laterite ×3, explore_erupt) — giữ nguyên.

**N4. Hai mươi hai chỗ "Dùng lại hình" ở bài 6 (mười tám) và bài 7 (bốn) chưa chép "Từ khoá tìm ảnh (EN)" của gốc** (trái `_topic.md:734` và `_topic.md:738`). Dòng: `06:65, 73, 81, 95, 116, 132, 213, 329, 387, 461, 515, 544, 552, 560, 568, 596, 657, 668`; `07:65, 82, 95, 400`. Bài 1–5 và bài 8 cũng có chỗ không có từ khoá nhưng đều trỏ hình vẽ hay sơ đồ ghép (đúng luật, hình vẽ không cần từ khoá) — đã kiểm từng chỗ.

**N5. Bài 4, kệ Chơi: `alt` chia đôi đúng theo nhóm "Mềm", nên bé nghe VoiceOver xếp được mà không cần biết khoáng vật nào mềm** (`04-thang-do-cung-mohs.md`, A). Bốn món nhóm "Cứng" và "Rất cứng" đọc là "crystal" · "tinh thể" (`04:264-265` hồng ngọc, `04:289-290` thạch anh tím, `04:313-314` kim cương, `04:329-330` thạch anh), còn đúng hai món nhóm "Mềm" đọc là "rock" · "hòn đá" (`04:280-281` hoạt thạch "A pale rock" · "Hòn đá màu nhạt", `04:297-298` thạch cao "A clear rock" · "Hòn đá trong").
- Đề xuất: cho sáu món một khuôn chung không gọi tên nhóm và không gọi "khoáng vật" (nhóm `limit` là "Không phải khoáng vật"), ví dụ hoạt thạch `alt.en: A pale cream block` · `alt.vi: Khối màu trắng ngà`; thạch cao `alt.en: A clear block` · `alt.vi: Khối trong` (không dùng "cục" để khỏi trùng `alt` của đường phèn "A clear lump" · "Một cục trong suốt"). Sửa thì sửa cả chỗ dùng lại: `04:458-459` (q3 hoạt thạch), `04:474-475` (q3 thạch cao), `05:66-67` (w1 thạch cao), `06:545-546` (q4 hoạt thạch) và N2 ở trên.

**N6. "Thạch cao" là "đá mềm" ở bài 3 nhưng là "khoáng vật" ở bài 4, dùng chung một tấm ảnh, trong hai trò chơi có nhóm `limit` trái nhau.** Bài 3: món `tray_gypsum` nằm trong kệ "Tìm ba hòn đá", nhóm loại là "Không phải đá" (`03:250-253`), ô Học gọi thẳng là đá mềm (`03:138-152`). Bài 4: cùng ảnh đó là món của kệ "Tìm ba khoáng vật", nhóm loại là "Không phải khoáng vật" (`04:253-257`), và ô "Minerals" lấy thạch cao làm ví dụ khoáng vật (`04:133-134`). Người soạn A đã ghi `[CẦN KIỂM]` ở `03:220`.
- Về chuyên môn thì cả hai cách gọi đều có lý (thạch cao là khoáng vật, cũng có đá thạch cao), nhưng với trẻ bảy tới chín tuổi, đúng một ngày sau khi xếp thạch cao vào "đá" thì phải xếp nó vào "khoáng vật" và bên cạnh là nhóm "Không phải khoáng vật" — dễ thành câu hỏi "vậy nó là đá hay khoáng vật".
- Đề xuất (chọn một, cần topic editor và chuyên môn chốt): (a) bài 4 thêm nửa câu vào ô "Minerals" hoặc `explanation` rằng "có khoáng vật tự nó cũng là một loại đá"; (b) bài 3 đổi món nhóm mềm thứ hai từ thạch cao sang một mẫu đá vôi mềm hay đá phấn thứ hai, nhường thạch cao hẳn cho bài 4; (c) giữ nguyên và ghi vào `_topic.md` mục Tên gọi là cố ý. Tester không tự chọn vì đụng bảng Hình dùng chung và bốn bài.

### Nhỏ (13)
- **n1. `08-hoa-thach-hinh-thanh-the-nao.md:629` câu ví dụ EN mười một từ** (đúng cảnh báo `validate`): "A fossil can be a shell, a leaf or a fish." Đề xuất "A fossil can be a shell, leaf or fish." (chín từ), `example.vi` giữ nguyên.
- **n2. Năm câu DOK 2 thật ra chỉ là nhớ lại ô Học, vì gợi ý trỏ về đúng ô có liệt kê sẵn đáp án:** `02:423-435` q3 (ô "Holes" ví dụ một, hai đúng là "pumice", "basalt"); `02:471-487` q4 (ô "Layers" ví dụ hai là nguyên văn câu hỏi "slate that splits into thin sheets"); `03:477-494` q4 (gợi ý trỏ ô "Đá mềm", mà đáp án `q4_gypsum` **chính là tấm ảnh của ô đó**); `05:419-437` q3 (ô "Impermeable" ví dụ một, hai đúng là "marble", "slate"); `08:419-437` q3 (ô "Not just dinosaurs"). Không chặn vì bé vẫn phải nhìn hình để ghép tên với mẫu, và `_topic.md:883` cho phép gợi ý trỏ ô Học. Đề xuất nhẹ: ở mỗi câu đổi gợi ý sang cách nghĩ thay vì tên ô (ví dụ `03:487-488` → "Think which rock scratched most easily in the game." · "Em nhớ lại hòn đá nào dễ xước nhất trong trò chơi nhé."), hoặc đổi một đáp án sang mẫu đá chưa được gọi tên trong ô.
- **n3. Bài 1 q3 cùng kiểu với n2:** hai đáp án đúng `q3_mortar`, `q3_mill` là nguyên văn ví dụ hai và bốn của ô "Rock around us" ("a stone mortar", "a stone hand mill"), gợi ý `01:430-431` trỏ thẳng ô đó. Đề xuất đổi gợi ý sang "Think what each one is made from." · "Em nghĩ xem mỗi thứ làm bằng gì nhé."
- **n4. Bài 6 q4 hỏi lại đúng ví dụ đã cho:** "kitchen worktops" là ví dụ hai của ô "Granite" (`06:218-219`) và là món kệ `tray_worktop`. Câu vẫn chạy (bé phải ghép hai tính chất), nhưng nếu muốn DOK 2 thật thì đổi sang một việc mới chưa nêu trong bài (ví dụ "tấm đá kê bên giếng nước, ngày nào cũng ướt và bị cọ").
- **n5. Bài 8 q4, nhãn VI của đáp án ngắn hơn hẳn hai nhãn sai** (`08:493-510`): "phần thân mềm phân huỷ" (năm tiếng) so với "các lớp đè lên ép thành đá" và "người săn hoá thạch tìm thấy nó" (bảy tiếng). Bản EN cân (4 · 5 · 5). Đề xuất kéo dài đáp án: "phần thân mềm của nó phân huỷ" · `label.en: its soft body decays away`.
- **n6. Ảnh `tray_concrete` nói hai điều nghe trái nhau ở hai bài:** bài 1 là món bẫy của nhóm "Không phải đá tự nhiên" (`01:286-292`), bài 6 q3 là **đáp án đúng** cho "Những thứ nào có đá ở bên trong?" (`06:511-517`). Người soạn B đã lường trước và giải thích ở dòng `>`, nhưng chữ trẻ đọc thì không nhắc lại. Đề xuất thêm vế đối chiếu vào `06:479-482`: `explanation_correct.vi: Đúng rồi! Xi măng và bê tông do người làm ra, nhưng bên trong có đá nghiền nhỏ.` · `explanation_correct.en: Yes! People make concrete, but it has crushed rock inside.`
- **n7. Cốc thuỷ tinh ở hai chỗ nói về thử nước, trong khi mục An toàn dặn cốc nhựa** (`_topic.md:850`): `05:341-343` dùng `w1_water` của *Hô hấp* ("A glass of water" · "Cốc nước") làm **hình câu hỏi** cho "Em dùng gì để nhỏ nước lên hòn đá?"; `03:370-376` cũng dùng ảnh đó làm lựa chọn sai. Hình vẽ của chính bài 5 thì đúng (cốc nhựa trong). Đề xuất bài 5 q1 đổi hình câu hỏi sang một ảnh hòn đá khô trên khay, hoặc ghi vào `changes` rằng cốc trong hình là cốc nhựa.
- **n8. Khởi động bài 2–5 chỉ ôn trong vòng ba ngày**, không có mốc "một tuần" hay "một tháng" (bài 2: hai câu đều ôn bài 1; bài 4: hai câu đều ôn bài 3). Cả chủ đề vẫn đủ ba mốc nhờ bài 1, 6, 8, 9, 10, 12, 15, và bảng Khởi động ở `_topic.md` đã chốt như vậy, nên chỉ ghi nhận cho PM: nếu muốn mỗi bài có ít nhất hai mốc khác nhau thì bài 4 w2 đổi sang ôn bài 1 hoặc *Núi lửa*.
- **n9. Hình `laterite` là cận cảnh mảng tường, nhưng `alt` ở hai câu gọi là "hòn đá"** (`06:604-607` q5, `07:73-76` w1), trong khi hai lựa chọn còn lại của cùng câu là ảnh mẫu đá cầm tay. Brief gốc (`06:680`) đã dặn cắt sát; designer phải cắt đúng, nếu không thì ba lựa chọn khác khung, và `alt` phải đổi theo ảnh thật.
- **n10. Hai ảnh "cốc nước" khác nhau cho cùng một ý:** `06:50-52` dùng `q4` của `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` ("A glass full of water"), `05:341` dùng `w1_water` của `ho-hap/vi-sao-ta-phai-tho` ("A glass of water"). Không sai, nhưng nếu gom về một ảnh thì đỡ một lần chọn ảnh.
- **n11. Bảng "Hình dùng chung" (`_topic.md:741-808`) thiếu các chỗ dùng lại mới ở bài 6, 7** ngoài danh sách B đã gửi: `tray_steps` (6: thẻ q2, từ `suitable`), `marble` (6 w1), `tray_slate` (6 w1), `tray_limestone` (6: từ `limestone`), `explore_erupt` (7 q4), `tray_rock_print` của *Khủng long* (7: thẻ q2), `explore_scratch` (7 w2), `tray_stream` (7: món Chơi, 7 q3, 8: hình câu w1), `tray_sandstone` (7: thẻ q2), `tray_shell` của *Núi lửa* (8 q1), `q2_museum`, `q1_mud`, `q4` của *Khủng long* (8: hình câu hỏi w2, q1, q2), `q2_rice`, `q6`, `tray_fern`, `tray_dragonfly`, `q1_fish` của *Khủng long* (8 q3).
- **n12. Ba chỗ ở bài 9 trỏ hình gốc của bài 1–2 nhưng chưa khớp gốc** (chỗ nối bài 1–8 với 9–15; tester bài 9–15 có thể báo trùng): `09:404` `granite` (`alt` "A grey speckled rock" · "Hòn đá xám có đốm" so với gốc "A grey rock" · "Hòn đá màu xám", thiếu từ khoá); `09:431` `magnifying_glass` (thiếu từ khoá); `09:454` `tray_mortar` (`alt` "A stone mortar" · "Cái cối đá" so với gốc "A grey mortar and pestle" · "Cối và chày màu xám", thiếu từ khoá). Hai mươi tám chỗ còn lại mà bài 9–15 trỏ vào hình gốc bài 1–8 đều khớp từng chữ.
- **n13. Bài 15 w2 (ôn bài 7): chữ câu hỏi và hình đáp án lệch nhau.** `15:61-62` hỏi "Rain and hot sun slowly crack a rock. What is this called?" nhưng lựa chọn đúng "weathering" dùng `explore_weathering` (rễ cây đa trùm tường đá, `15:88`). Nội dung vẫn đúng (bài 7 ô "Natural forces" và ô "Weathering" có dạy "hot days, cold nights", "heat and cold crack rock"), chỉ là hình không minh hoạ đúng câu, trong khi hai lựa chọn kia minh hoạ đúng chữ của chúng. Đề xuất người soạn C đổi lựa chọn đúng sang `tray_rain_limestone` của bài 7 (mặt đá vôi có rãnh do nước mưa) — khớp chữ "mưa", vẫn không phải ảnh bé đoán được bằng chữ "rễ cây".

### Nối với bài 9–15 (đã kiểm)
- **Hình:** ba mươi mốt chỗ ở bài 9–15 trỏ vào hình gốc của bài 1–8 (`quarry`, `tray_road`, `magnifying_glass`, `granite`, `tray_mortar`, `geologist`, `explore_scratch`, `laterite`, `explore_weathering`, `explore_erosion`, `tray_leaf_fossil`, `tray_dry_leaf`, `tray_ammonite`…). Mọi key đều có thật, không chỗ nào trỏ qua một chỗ dùng lại khác; chỉ ba chỗ lệch `alt`/từ khoá (n12). Các hình gốc mà bảng giao cho bài 1–8 đều có đúng key, đúng nội dung và đúng loại hình.
- **Khởi động:** bài 9 w1 (dấu in), bài 9 w2 ("Rocks are made of minerals."), bài 11 w2 ("Weathering breaks rock into small pieces."), bài 13 w1 (`quarry` làm lựa chọn sai), bài 14 w2 ("Some rocks let water soak in."), bài 15 w1, w2, w3 ("Rocks stay the same forever.") — mọi ý đều đã được bài 1–8 dạy đúng chỗ: ô "Imprint" bài 8, ô "Minerals" bài 4, ô "Weathering" bài 7, ô "Permeable" bài 5, ô "Natural forces" bài 7 (trả lời câu "Em nghĩ sao?" của bài 1). Chữ EN của các câu `true_false` khớp bảng Đúng/Sai. Riêng bài 15 w2 xem n13.
- Tên ô mà bài 9–15 trỏ tới vẫn đúng tên thật trong bài 1–8: "Made by people" · "Do con người làm ra" (bài 1), "Minerals" · "Khoáng vật" (bài 4), "Water test" · "Thử nhỏ nước" (bài 5), "Natural forces" · "Lực tự nhiên" (bài 7).

### Chưa kiểm
- **Hình thật:** mới có `brief`, chưa có ảnh nào được chọn, chưa có hình vẽ nào. Khoảng một trăm ba mươi ảnh cần tìm và ba mươi hình tự vẽ của bài 1–8 đều chưa có, nên chưa kiểm được "không có chữ", "không có logo, biển số", "không cảnh thờ cúng", độ giống nhau về nền và khung trong một câu. Nhóm khó nhất: Bộ mẫu đá mười bốn mẫu cùng nền, ảnh làng cổ Đường Lâm, thành nhà Hồ, động Phong Nha, núi đá vôi Tràng An (phần lớn ảnh Việt Nam trên Commons là CC BY-SA), gầu máy xúc và tay đục đá không logo.
- **Giọng đọc:** không chạy `tts` trong lượt này. Cần nghe: mười sáu chuỗi VI có "Mohs" (bài 4 có mười bốn, bài 5 có hai) — dev chưa thêm `READINGS`; EN "Mohs' scale", "permeable"/"impermeable" (hai từ gần giống), "amethyst", "quartz", "laterite", "sediment", "ammonite", "Duong Lam", "Ha Long Bay"; tiêu đề EN bài 3, bài 5 có dấu hai chấm; ba nhãn có dấu phẩy ở bài 4 q4; `term.vi` "vết xước, cào xước".
- **Hiển thị trên máy:** không dùng simulator trong lượt này. Còn lại: dòng điều kiện tám màn Chơi (dài nhất là bài 5 "Cần đủ Giọt nước biến mất, Bọt khí nổi lên mãi, Vết ướt loang rộng · Không phải nước thấm vào"); nhãn dài ở bài 5 ("Giọt nước biến mất trên sa thạch", "Bọt khí cứ nổi lên từ sa thạch") và bài 4 q4 (ba tên ngăn bằng dấu phẩy); ba bản hình chỉ khác nhau số vết xước (bài 3 q5) và số bọt khí (bài 5 q5) có đủ khác nhau trên iPhone bề rộng nhỏ nhất không; vùng chạm; VoiceOver đọc `alt`.
- **Chuyên môn địa chất:** sáu mươi mốt dòng `[CẦN KIỂM]` vẫn còn (nằm ngoài phạm vi ticket). Hai chỗ tester thấy cần chuyên môn chốt trước khi vẽ: "vết ướt loang rộng" là dấu hiệu nước thấm (bài 5, cả một nhóm kệ và hai món phụ thuộc) và cách gọi thạch cao ở N6.

## Rà chữ bài 9–15 (tester 11/11)

Phạm vi: đọc `_topic.md` và bảy bài `09-` tới `15-` của `content/discoverer/da-va-dat/`; đọc đối chiếu bài 1–8 của chủ đề này và `khung-long/`, `be-mat-trai-dat/`, `thoi-tiet-va-thien-tai/`, `ho-hap/`, `nao-bo-va-giac-quan/` ở mọi chỗ bài 9–15 trỏ tới; sườn Oak `docs/oak/rocks-and-soils.md` lesson 9–16. Một tester khác rà `_topic.md` và bài 1–8. Không sửa file nội dung, không chạy `tts`/`build`/`import`/`ids`, không dùng simulator. `validate` và `ids` do phiên chính chạy (0 lỗi), không chạy lại.

Chuẩn đối chiếu: `content/TEMPLATE.md`, `content/rules.json`, tiêu chí SK-039, luật riêng trong `_topic.md` (Quy ước hình, Khi soạn, An toàn, các bảng), mọi lỗi tester đã bắt ở SK-036, SK-037, SK-038, và độ đúng khoa học ở mức phổ thông. Ngoài đọc tay, chạy bảy script kiểm cấu trúc trong scratchpad (không phải test sản phẩm): cấu trúc câu · số từ EN · chỗ thiếu hình; mọi "Dùng lại hình"; nguồn hình từng lựa chọn; loại hình thật của từng câu và kệ; chuỗi `.en`/`.vi`; Đúng/Sai; gợi ý trùng chữ nhãn đáp án; vai của từng hình trong một bài; cấu trúc kệ Chơi; màu nhóm; số ảnh so với Ghi chú cho hoạ sĩ.

**Tổng kết: chặn 0 · nên sửa 6 · nhỏ 14.** N1 và N2 nên sửa trước khi chạy TTS (đổi chữ trẻ nghe).

### Đạt (đã kiểm bằng máy, không có lỗi)
- **Sườn Oak:** bài 9 = Oak 9, 10 = Oak 10, 11 = Oak 11, 12 = Oak 12, 13 = Oak 13, 14 = Oak 14 + 15, 15 = Oak 16. Mọi ý chính, từ khoá, misconception của Oak đều có chỗ trong bài; các chỗ lệch đều nằm trong danh sách đã duyệt ở `_topic.md` (ba loại đất Việt Nam, giun đất và kiến thay con bét, không Rosaly Lopes, không Charles Darwin, `order_sequence` thành `single_choice`).
- Quiz sáu câu mỗi bài, DOK 1·1·2·2·2·3 (Discoverer 2·3·1), câu một DOK 1, đúng một câu misconception ở q6; bảy key đều có ở mục `## Misconceptions` của `_topic.md`, không key nào gắn ở Khởi động. Mỗi bài đủ bốn format, không `order_sequence`, không `picture_bar_chart`. `single_choice` ba hoặc bốn lựa chọn, `multi_choice` bốn, `fill_blank_bank` ba thẻ. Khởi động hai tới ba câu, DOK 1, câu nào cũng có `recall_from`; năm bài ngoài chủ đề được trỏ tới đều đã có `id` (kể cả `thoi-tiet-va-thien-tai/do-thoi-tiet` cho câu w3 tuỳ chọn bài 13).
- **Vị trí đáp án khớp đúng từng ô của bảng "Vị trí đáp án đúng"** (`_topic.md:611-638`), cả cột thẻ `fill_blank_bank` và các ô "/4": bài 9 (3 · 1 · 2 · 1,3 · 3/4 · 2), 10 (2 · w3 1 · 3 · 1 · 2,4 · 3 · 1), 11 (3 · 2 · 3 · 1,2,3 · 3 · 1), 12 (2 · w3 3 · 3 · 3 · 1,3,4 · 1/4 · 2), 13 (4/4 · w3 2 · 1 · 2 · 1,4 · 3 · 2), 14 (1 · 3 · 2 · 2,3 · 2 · 1), 15 (2 · w2 2 · 3 · 1 · 1,2 · 1/4 · 3).
- Đúng/Sai khớp bảng `_topic.md:571-610`: bảy Đúng, bảy Sai; q6 theo thứ tự Sai · Đúng · Sai · Đúng · Đúng · Sai · Đúng. Câu `true_false` của Khởi động dùng đúng chữ EN của bảng. Không câu đáp án Sai nào mở đầu `explanation_correct` bằng "Yes!" · "Đúng rồi!"; `explanation_wrong` đúng khuôn. Không câu Đúng/Sai nào ở bài 9–15 có "not", "cannot", "never".
- **340 chỗ có hình trong bảy bài, không chỗ nào thiếu** `image.brief` + `alt.en` + `alt.vi`. Số ảnh mới đếm bằng máy khớp mục bàn giao: bài 10 (5 ảnh + 1 tranh · 12 vẽ), 11 (18 · 7 · 1 ghép), 13 (13 · 5), 14 (3 · 22), 15 (10 · 2). Hai chỗ lệch ở chính Ghi chú cho hoạ sĩ: n6, n7.
- **200 chỗ "Dùng lại hình": mọi key có thật** (kể cả 34 hình gốc của năm chủ đề khác), không chỗ nào trỏ qua một hình dùng lại khác, không chỗ nào trỏ sai bài. Từ khoá và `alt` chép đúng từng chữ của hình gốc, trừ ba chỗ thiếu từ khoá và hai chỗ sửa `alt` không ghi lý do (n1, n2); năm chỗ sửa `alt` còn lại đều có dòng `>` nêu lý do đúng luật (`_topic.md:738`): bài 10 w3 (ba nhãn tả bộ phận, chép đúng `alt` đã sửa ở `khung-long/03` w1 — đã đối chiếu từng chữ), bài 12 w3_sandy, bài 12 `tray_red_soil`, bài 15 w1_sandy.
- **Một câu một loại hình, một kệ một loại hình:** lần hết chuỗi dùng lại thì 46 câu có lựa chọn và bảy kệ Chơi đều thuần một loại (bảng dưới). Không hình vẽ nào lạc giữa ảnh chụp hay ngược lại.
- Bảy kệ Chơi đều đúng mặc định `_topic.md:812-821`: `capacity: 3`, `success_when: all_required_and_no_limit`, ba nhóm `required` mỗi nhóm hai món, một nhóm `limit` ba món, chín món; `messages.missing.*` khớp đúng ba nhóm `required`; `messages.full` đúng chữ chung; nhãn `limit` đều dạng "Not …" · "Không …" và không gọi tên món bẫy; không nhãn nhóm nào ở Học hay Chơi có dấu phẩy; bốn màu khác nhau mỗi khối, `nau_dat` cho nhóm `limit`.
- Từ vựng: bốn tới năm từ mỗi bài, đúng ba `core`, `term_keys` khớp ba từ `core`, khớp bảng `_topic.md:485-505`.
- Không câu EN nào quá mười từ (tính theo câu, kể cả `hint`, `explanation`, `examples`, `label`, `fact`, `messages`); một `alt` mười một từ (n13). Chuỗi `.en` không có dấu tiếng Việt ("Da Lat", "Mekong Delta", "Central Highlands", "Lyme Regis" đều viết không dấu). Chuỗi `.vi` không có chữ số, ký hiệu, dấu "—" (bảy chỗ máy báo đều là `{1}` của câu điền từ).
- **Bài được ôn dạy đúng ý của câu ôn**, đã mở từng file nguồn: `da-va-dat/05:141` ("A permeable rock lets water soak in.", chính bài 5 ghi chú là chỗ bài 14 w2 ôn), `07:145` ("Weathering breaks rock into smaller pieces…"), `07:123-127` (ô "Natural forces": mưa, gió, nắng nóng, rễ cây — đủ cho bài 15 w2), `be-mat-trai-dat/04:202` ("red soil from lava rock" cho bài 12 w3), `khung-long/02:532` ("swam with flippers" cho bài 10 w3), `thoi-tiet-va-thien-tai/02` (ống đo mưa cho bài 13 w3, bài đó đã có `id`).
- **Không lặp với chủ đề khác** đúng `_topic.md:891-902`: bài 13 chỉ nhắc lũ, hạn ở một ô, không dạy nguyên nhân; bài 15 không dạy an toàn khi mưa bão; dự báo thời tiết là món bẫy bài 15; không bài nào dùng chữ "tiến hoá", "tổ tiên", "thiên thạch", "nấm", "vi khuẩn", "hoà tan", "permanent"; bài 9, 10 không dạy lại xương hoá đá, dấu chân, trứng của *Khủng long* bài 3.
- **An toàn:** đeo găng và rửa tay có ở bài 12 (ô "Feel and look"), bài 14 (ô "Do it better"), ảnh `soil` bài 11; mọi ảnh cầm đất đều có găng tay; cảnh sạt lở chụp rất xa, không nhà đổ, không người, không xe; búa địa chất luôn kèm "chỉ người lớn dùng" (bài 15 ô Học, câu q1, từ `rock_hammer`); ba món bẫy "Not safe" bài 10 vẽ nhẹ, không ngã, không máu; không nêu tên hay năm một trận thiên tai có thật; không chê vùng nào; không nói giá tiền đá quý. Bài 10 kể phân biệt đối xử như chuyện thời đó rồi kết bằng hai ví dụ hôm nay.
- Không `id` nào trống, không `id` nào trùng trong cả `content/`.
- Bài 14 là bài thí nghiệm công bằng và chữ đúng: chỉ đổi một thứ, giữ nguyên lượng đất và lượng nước, đo thời gian hoặc lượng nước, làm lại để kiểm; ba món bẫy đều là "một bên … hơn". **Biểu đồ cột bài 14 q4 đúng rút kinh nghiệm SK-036 N3:** ba cột cùng một màu, nhãn gọi theo vị trí ("the left bar" · "cột bên trái"), đánh dấu bằng vầng sáng không phải màu, câu hỏi không kể tên ba loại đất theo thứ tự, cột là lượng nước trong một phút nên "cao hơn" khớp "nhanh hơn".

| Bài | Loại hình của các lựa chọn |
| --- | --- |
| 9 | tất cả ảnh chụp |
| 10 | w3 tranh phục dựng · q3, q4 và kệ Chơi hình vẽ · w1, q1, q2, q5 ảnh |
| 11 | q4 hình vẽ · còn lại ảnh |
| 12 | q4, q5 hình vẽ · còn lại ảnh |
| 13 | w3, q4, q5 hình vẽ · còn lại ảnh |
| 14 | q5 ảnh · còn lại hình vẽ (kể cả kệ) |
| 15 | q3 hình vẽ · còn lại ảnh |

### Nên sửa (6)

**N1. Bài 15 q2: "đá phấn" đứng làm một lựa chọn khoáng vật, trái đúng chữ bài 3 đã dạy.** (người C)
- `15-nha-dia-chat-lam-gi.md:445-446` `sentence.en: The hardest mineral of all is {1}.` · `sentence.vi: Khoáng vật cứng nhất là {1}.` Ba thẻ: `q2_diamond` (đúng), `q2_quartz`, **`q2_chalk`** (`15:472-477` "chalk" · "đá phấn").
- Bài 3 dạy nguyên văn `03-da-nao-cung-hon.md:635-636` "Chalk is a soft, white rock." · "Đá phấn là loại đá trắng và mềm."; bài 4 dạy "đá gồm khoáng vật". Đặt đá phấn vào danh sách khoáng vật xoá đúng ranh giới mà hai bài trước vừa dựng, và `explanation_wrong` (`15:452-453`) chỉ nói "Đáp án là kim cương", không sửa lại.
- Đề xuất (không cần ảnh mới, `tray_talc` đã có ở bài 4 và đã được bài 6 dùng lại):
  ```
  #### bank q2_talc
  label.en: talc
  label.vi: hoạt thạch
  image.brief: Dùng lại hình `tray_talc` ở bài `da-va-dat/thang-do-cung-mohs`. Từ khoá tìm ảnh (EN): talc mineral sample
  image.alt.en: A pale rock
  image.alt.vi: Hòn đá màu nhạt
  ```
  Khi đó ba thẻ là ba khoáng vật của chính thang Mohs bài 4 (hoạt thạch mềm nhất · thạch anh · kim cương cứng nhất), ôn đúng ý, sức hút còn mạnh hơn, vị trí thẻ đúng giữ nguyên (kim cương chỗ thứ nhất). Sửa ghi chú `15:454` theo ("Hoạt thạch có sức hút với bé nhớ nhầm bậc thang"). Nếu biên tập muốn giữ đá phấn thì phải đổi câu thành "The hardest of these is {1}." · "Thứ cứng nhất trong ba thứ này là {1}." và nói rõ đá phấn là đá ở `explanation_wrong`.

**N2. Bài 14 q6 chỉ ở mức DOK 2, đúng như người C ngờ.** (trả lời "Còn chưa chắc" của C)
- `14-nuoc-tham-qua-dat-nao-nhanh-hon.md:572-573` Na nói "Water goes through sand and clay at the same speed." Nhưng hôm nay bé đã gặp đúng cặp đất cát – đất sét ba lần: ô "Results" (`14:163`, hình vẽ cho thấy cốc bên trái nhiều nước, cốc bên phải ít), câu q4 giải thích "Sandy soil let the most water through" (`14:485-486`), và hình câu hỏi của chính q6 là `explore_setup` — hai chai cát và sét. Bé chỉ cần nhớ hình, không phải áp ý vào tình huống mới; `_topic.md:688` đòi câu sáu phải là vật hay cảnh mới.
- Đề xuất (giữ key `all_soil_drains_same`, giữ đáp án Sai, giữ vị trí):
  ```
  statement.en: Water goes through garden soil as fast as sand.
  statement.vi: Nước thấm qua đất vườn nhanh bằng đất cát.
  image.brief: Dùng lại hình `tray_garden_sand`.
  image.alt.en: A pile of garden soil and a pile of sandy soil
  image.alt.vi: Một đống đất vườn và một đống đất cát
  explanation_correct.en: Sand has the biggest grains. Water rushes through it.
  explanation_correct.vi: Đất cát hạt to nhất nên nước chảy qua nhanh hơn.
  explanation_wrong.en: Na is not right. Water goes faster through sand.
  explanation_wrong.vi: Na chưa đúng. Nước thấm qua đất cát nhanh hơn.
  ```
  Cặp đất vườn – đất cát có ở kệ Chơi (`tray_garden_sand`, nhóm "Thứ được thay đổi") nhưng bài chưa nói bên nào nhanh hơn, nên bé phải nối "đất vườn có hạt nhỏ và chất hữu cơ" (bài 11) với luật cỡ hạt. Thêm dòng `> [CẦN KIỂM] Đất vườn nhiều hạt nhỏ và chất hữu cơ nên cho nước qua chậm hơn đất cát.` Sửa kèm hai dòng ở `14:589-590`.
- Sửa như trên còn gỡ luôn n8 (ba câu dùng chung một hình câu hỏi).

**N3. Bài 10 q3: hỏi đúng tiêu chí của nhóm bẫy, dùng đúng ba hình của kệ Chơi, gợi ý còn gọi tên nhóm bẫy.** (người B)
- `10-mary-anning-nguoi-san-hoa-thach.md:473` "Which ones are safe on a fossil hunt?" · "Những việc nào an toàn khi đi tìm hoá thạch?" Ba trong bốn lựa chọn là món kệ Chơi, giữ nguyên vai: `q3_pebbles` (`tray_pebbles`, nhóm bắt buộc) đúng, `q3_museum` (`tray_museum`, nhóm bắt buộc) đúng, `q3_cliff_base` (`tray_cliff_base`, nhóm `limit` "Không an toàn") sai. Gợi ý `10:480-481` "Remember the Not safe group in today's game." · "Em nhớ lại nhóm Không an toàn ở trò chơi hôm nay nhé."
- Bé vừa chơi xong kệ "Không an toàn" nên chỉ cần nhớ lại trò chơi; chỉ `q3_tide` là tình huống mới. Cùng loại lỗi SK-038 N2, lần này đi từ màn Chơi sang câu DOK 2.
- Đề xuất: (a) gợi ý trỏ ô Học thay vì nhóm bẫy — `hint.en: Remember the Fossil hunters today picture.` · `hint.vi: Em nhớ lại ô Người săn hoá thạch hôm nay nhé.`; (b) đổi `q3_cliff_base` thành một việc không an toàn **chưa có ở kệ**, cùng nét, giữ chỗ thứ ba: `q3_alone` `label.en: go to the cliffs alone` · `label.vi: đi ra vách đá một mình` (hình vẽ mới: bạn nhỏ vẽ từ phía sau đi một mình dọc bãi biển vắng, vách đá ở xa, không có người lớn). Kệ bài 10 đã là mười hai hình vẽ, thêm một hình cùng bộ. Khi đó hai lựa chọn sai đều là tình huống mới, hai đáp án đúng vẫn ở chỗ hai và chỗ tư.
- Nếu không muốn thêm hình thì ít nhất sửa gợi ý (a).

**N4. Bài 9 q3: lôgic và hai hình y hệt nhóm bẫy vừa chơi.** (người B)
- `09-nhieu-cach-tao-thanh-hoa-thach.md:427-428` "Which ones came from something once alive?" · "Những thứ nào có từ một sinh vật từng sống?" — đúng tiêu chí của nhóm `limit` "Not from living things" · "Không phải từ sinh vật" (`09:253-255`). `q3_amber` và `q3_shell` là hai món bắt buộc, `q3_pot` là món bẫy, cùng vai như trong trò chơi; chỉ `q3_mortar` là vật mới.
- Đề xuất: đổi `q3_pot` (chỗ thứ tư, giữ "sai") sang một vật do con người làm **chưa có ở kệ**, dùng lại ảnh đã có nên không tốn ảnh mới:
  ```
  #### option q3_brick
  correct: false
  label.en: a clay brick
  label.vi: viên gạch
  image.brief: Dùng lại hình `tray_brick` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): red clay brick close up
  image.alt.en: A red brick
  image.alt.vi: Viên gạch đỏ
  ```
  (chép đúng từ khoá và `alt` của bài 1 khi sửa). Hai lựa chọn sai thành hai vật ngoài kệ, nối luôn `bricks_are_rocks` của bài 1; `explanation_wrong` (`09:438-439`) không phải đổi. Sửa ghi chú `09:440` theo.

**N5. Bài 10 q2: thẻ đúng là hình duy nhất của bài hôm nay, hai thẻ sai là ảnh mới và ảnh của chủ đề khác.** (người B)
- `10:447-452` `q2_evidence` dùng lại `explore_finds` — ảnh ô Học "Her finds", đồng thời là ảnh của từ `discover` và của thẻ thưởng, tức là tấm ảnh bé thấy bốn lần trong bài. `q2_photos` (`10:457`) là ảnh mới, `q2_models` là ảnh *Khủng long* bài 1 (hơn một tháng trước). Trái luật `_topic.md:727` ("không để đáp án là ảnh duy nhất bé đã thấy ở Học khi lựa chọn sai là ảnh mới"); chính ghi chú `10:445` đã viết ra điều này như một điều cố ý.
- Đề xuất (đổi chỗ hai tấm, không thêm ảnh): hình câu hỏi q1 (`10:389`, đang là `tray_ammonite`) đổi thành `Dùng lại hình `explore_finds`.` — vẫn là "thứ bà tìm thấy", không phải nơi bà tìm, nên không lộ đáp án "vách đá ven biển"; rồi `q2_evidence` dùng `Dùng lại hình `tray_ammonite` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao`.` (`alt` "A spiral shell in rock" · "Vỏ xoắn trong đá"). Khi đó thẻ đúng là ảnh của bài 8, không còn là ảnh ô Học hôm nay. Kèm theo: mục "Chỗ lệch" số 1 của người B phải sửa lại thành `tray_ammonite` "9 (q2); 10 (thẻ q2)".
- Bài 13 q2 cũng cùng kiểu nhưng nhẹ hơn (`13:477-482`, thẻ đúng `q2_climate` là ảnh ô Học hôm nay, hai thẻ sai là ảnh *Núi lửa*, trong đó `q1_rain` vừa làm hình câu hỏi w3 ngay trước đó) — không cần sửa nếu N5 được sửa, nhưng nên ghi nhận.

**N6. Bài 12, thẻ thưởng gắn tên vùng trong khi ảnh có thể chụp ở nước khác.** (người C)
- `12-cac-loai-dat-o-viet-nam.md:734-737` thẻ `coffee_card`: `tag.en: Central Highlands` · `tag.vi: Tây Nguyên`, `fact` "Red soil in the Central Highlands suits coffee very well." Ảnh thẻ dùng lại `tray_coffee`, mà brief của ảnh đó (`12:325`) cho phép "không có ảnh Việt Nam hợp giấy phép thì lấy vườn cà phê trên đất đỏ ở nước khác".
- Thẻ thưởng là nơi bé đọc kỹ nhất, và SK-033 đã từng phải sửa lời ở *Núi lửa* đúng vì lý do này (ảnh `tray_red_soil` chụp ở Brasil). Ô Học và câu q4 không vướng vì chữ nằm ở ví dụ, không gắn vào ảnh.
- Đề xuất: giữ `name`, đổi `tag` thành "Coffee on red soil" đã có ở `name` nên dùng `tag.en: Red soil farms` · `tag.vi: Vườn trên đất đỏ`, và `fact.vi` giữ nguyên (chữ nói về Tây Nguyên nói chung, không nói ảnh). Hoặc giữ nguyên thẻ và bắt buộc ảnh `tray_coffee` phải là ảnh chụp ở Việt Nam (ghi vào file chọn ảnh). Người chọn ảnh quyết trước khi tìm ảnh.

### Nhỏ (14)
- **n1. Bài 9 `09:404-406`:** dùng lại `granite` của bài 2 nhưng đổi `alt` ("A grey speckled rock" · "Hòn đá xám có đốm"; gốc "A grey rock" · "Hòn đá màu xám") mà không có dòng `>` nêu lý do, trái `_topic.md:738`. Đề xuất chép đúng `alt` gốc (câu q2 không hỏi về hạt nên không cần sửa), hoặc thêm dòng `>` giải thích.
- **n2. Bài 9 `09:454-456`:** dùng lại `tray_mortar` của bài 1, `alt` đổi thành "A stone mortar" · "Cái cối đá" (gốc "A grey mortar and pestle" · "Cối và chày màu xám"), dòng `>` ngay dưới chỉ nói về key chứ không nói về `alt`. Đề xuất chép `alt` gốc; bản sửa còn bỏ mất cái chày trong khi ảnh vẫn có.
- **n3. Bài 9 thiếu từ khoá ở ba chỗ "Dùng lại hình"** (`09:404` `granite`, `09:431` `magnifying_glass`, `09:454` `tray_mortar`) — người B đã báo, topic editor chép khi rà chéo. Bài 10 tới 15 không còn chỗ nào thiếu.
- **n4. Bài 9 q5 lặp đúng khuôn câu của bài 8 q5, hai ngày liền:** `09:532` "Which sea animal is most likely to leave a fossil?" so với `08-hoa-thach-hinh-thanh-the-nao.md:520` "Which shell is most likely to become a fossil?" và `khung-long/03-hoa-thach-ke-chuyen-khung-long.md:590` "Which bone is most likely to become a fossil?". Lôgic khác nhau (phần cứng còn lại, so với bùn phủ sớm) nên không phải lặp ý, chỉ lặp khuôn. Đề xuất đổi chữ bài 9: "Which sea animal leaves a fossil more often?" · "Con vật biển nào thường để lại hoá thạch hơn?"
- **n5. Bài 10, tranh chân dung Mary có chiếc búa trong tay, cùng bài có món bẫy "Đập đá bằng búa".** `10:171` brief tả "tay cầm búa nhỏ"; `10:369-375` món `tray_hammer` thuộc nhóm "Không an toàn". Bé có thể hỏi vì sao Mary được cầm búa. `alt` không nhắc búa nên VoiceOver không vướng; đề xuất thêm vào brief "cắt khung sao cho chiếc búa không nổi bật" và thêm một dòng `>` nhắc designer, hoặc để bài 15 trả lời (bài 15 q1 đã nói "chỉ người lớn mới dùng búa này").
- **n6. Bài 9, Ghi chú cho hoạ sĩ đếm nhầm:** `09:669` ghi "**Ảnh cần tìm (mười tám)**" nhưng danh sách ngay dưới cộng lại là hai mươi (`09:676` tự ghi "là hai mươi ảnh mới"), và máy đếm đúng hai mươi `[ảnh]` mới. Sửa "mười tám" thành "hai mươi".
- **n7. Bài 12, Ghi chú cho hoạ sĩ đếm nhầm:** `12:746` ghi "**Ảnh cần tìm (mười)**" nhưng danh sách là năm + bốn + hai = mười một, máy cũng đếm mười một `[ảnh]` mới. Sửa thành "mười một" (và sửa dòng "bài 12: mười · tám · không" ở mục bàn giao của người C).
- **n8. Bài 14 dùng một hình làm hình câu hỏi cho ba câu:** `explore_setup` ở q1 (`14:342`), q3 (`14:430`) và q6 (`14:580`), cộng thêm ô Học và câu w1 bài 15. Sửa N2 là còn hai câu; giữ q1 và q3 dùng chung được vì mọi hình vẽ khác của bài đều là bằng chứng của một đáp án.
- **n9. Bài 11 chỉ có hai hình câu hỏi cho năm câu Quiz:** `prediction` ở q1 (`11:351`) và q4 (`11:490`), `soil` ở q2 (`11:393`) và q3 (`11:437`). Đề xuất đổi hình câu hỏi q3 sang `tray_rotting_twig` (món kệ Chơi, không làm lựa chọn ở câu nào) để bốn màn không giống nhau.
- **n10. Bài 11 q4, gợi ý chép nguyên ví dụ của ô Học:** `11:493-494` "Remember: heavy bits sink first." · "Em nhớ nhé: hạt nặng chìm xuống trước." đúng là ví dụ ba của ô Lọ đất lắng (`11:139-140`), và ba nhãn chỉ khác nhau ở lớp dưới đáy, nên gợi ý gần như trả lời hộ. Đề xuất "hint.en: Remember the sizes in the Bits of rock picture." · "hint.vi: Em nhớ lại cỡ hạt ở ô Mảnh đá nhé." (gợi ý q1 đã dùng ô Lọ đất lắng).
- **n11. Bài 13 q3, gợi ý gọi tên hai trong ba nhóm Chơi nhưng một đáp án đúng không thuộc nhóm nào trong hai nhóm đó:** `13:504-505` "Think about food for soil and just enough water." trong khi hai đáp án đúng là "phủ rơm lên mặt đất" và "trồng thêm cây"; "nước vừa đủ" chỉ ứng với một lựa chọn **sai** (tưới cả ngày). Đề xuất "hint.en: Which ones give the soil cover and food?" · "hint.vi: Việc nào vừa che chở vừa nuôi đất nhé?"
- **n12. Bài 14 w1, ảnh con muỗi khác khung hẳn hai ảnh kia:** `14:82-84` dùng lại `explore_to_brain` của *Não bộ* bài hai — con muỗi đậu **trên cánh tay người**, trong khi giun đất và sâu xanh đều chụp trên đất, trên lá. Ghi chú `14:60` nói ba ảnh cùng kiểu, thực tế không. Đề xuất ghi vào brief cho designer cắt sát con muỗi rồi đặt lên nền kem (ghi `changes`), hoặc tìm ảnh muỗi đậu trên lá.
- **n13. Bài 14 `14:302` `alt.en` mười một từ:** "A pile of garden soil and a pile of sandy soil". Đề xuất "A pile of garden soil and one of sand" (chín từ); nếu sửa N2 thì `alt` này còn được đọc ở màn q6 nữa.
- **n14. Bài 15 q5, ảnh mỏ đá lọt giữa hai ảnh chụp gần:** `15:605-611` lựa chọn "solid rock" · "đá liền khối" dùng lại `quarry` (vách mỏ đá cắt bậc, chụp rộng), hai lựa chọn kia là `tray_stones` và `explore_organic` chụp gần. Ghi chú `15:628` nhận ra chỗ lệch nhưng vẫn giữ. Đề xuất dùng lại `tray_limestone` hoặc `marble` của bài 3 (mẫu đá chụp gần, chưa có vai nào trong bài 15) và đổi nhãn thành "a block of rock" · "khối đá liền".

### Câu nhỏ khác, không tính là lỗi
- Bài 12 q5 `12:595-596`: bản EN hỏi chung ("What does the sandy soil have?"), bản VI hỏi thẳng vào cỡ hạt ("Đất cát có hạt thế nào?"). Ba nhãn đều nói về hạt nên cả hai bản chạy được; nếu muốn khớp thì EN đổi thành "What are the sandy soil's grains like?".
- Bài 12 w3 `12:154-155`: `alt` của lựa chọn đúng (`w3_red`, "Red soil in a field" · "Đất đỏ trên ruộng") trùng đúng nhãn của chính nó, trong khi hai lựa chọn kia đã sửa `alt` để không gọi tên loại đất (`12:139`). Không lộ đáp án (câu hỏi về nguồn gốc núi lửa) nhưng ba `alt` không cùng một cách tả.
- Bài 10, 12, 13 đều có **hai câu Khởi động cùng ôn bài liền trước** (bài 9, bài 11, bài 12), nên ba bài này không có mốc "khoảng một tuần" — đúng bảng Khởi động `_topic.md:639-665`, tức là chuyện của bảng chứ không phải của người soạn; cùng loại ghi nhận với SK-038 n10. Nếu PM muốn đủ ba mốc thì đổi w2 bài 12 hoặc bài 13 sang một bài cách năm tới chín bài.
- Bài 13 ô "Một ngày hay nhiều năm" nói "climate is slowly changing" · "khí hậu đang thay đổi dần" mà không nói chiều thay đổi; Oak 13 nói rõ Trái Đất đang nóng lên. `_topic.md:857` chốt "không doạ, không con số", nên tester không đề nghị sửa, chỉ ghi để PM biết chỗ lệch Oak này chưa có trong danh sách "Chỗ lệch Oak".
- Bài 15 q3 `15:485-486` có ba câu liền trong một `prompt` ("Is this rock hard? Does it soak up water? Which tests can tell?"). Vẫn dưới mười từ mỗi câu và cần đủ ý để loại "thử cân", nên giữ; nhờ ios-dev xem màn này trên iPhone hẹp.

### Trả lời các mục "Còn chưa chắc" của người soạn
1. **Bài 14 q6 (người C):** đồng ý, xem N2 — giữ key và đáp án Sai, đổi lời Na sang cặp đất vườn – đất cát và đổi hình câu hỏi.
2. **Bài 11 w1 ba ảnh khác khung (người C):** nên đặt cùng nền. Ba ảnh (`khung-long/q6` khủng long đồ chơi trên bàn, `tray_old_coin` chụp gần, `explore_finds` bộ xương trong bảo tàng) khác hẳn nhau về nền và cỡ; đề nghị designer tách nền hai ảnh vật nhỏ, đặt lên nền kem và ghi `changes`, giữ nguyên ba hình gốc. Đây là màn đầu tiên của bài nên lệch khung thấy rất rõ.
3. **Bài 15 w3 gợi ý trỏ ô "Natural forces" (người C):** đã đối chiếu `07-da-bi-bao-mon-theo-thoi-gian.md:123-127`, tên ô đúng, nội dung đúng (mưa, gió, nắng nóng, rễ cây) — không phải sửa.
4. **Bài 13 `tray_flooded` (chờ phiên chính chốt):** tester nghiêng về giữ ảnh riêng "vườn rau ngập nước" như người C viết. *Thời tiết* bài bốn chỉ có cánh đồng và ruộng lúa ngập, mà ruộng lúa vốn giữ nước có chủ ý (đúng thẻ thưởng bài 14), nên dùng ảnh ruộng ngập làm món "không tốt cho đất" sẽ dạy ngược.
5. **Bài 15 `tray_slope` (chờ phiên chính chốt):** đã đọc cả năm bài *Thời tiết*, không bài nào có ảnh sạt lở (chỉ `_topic.md:328` của bên đó ghi sạt lở là phần chưa dạy). Bài 15 giữ làm hình gốc.
6. **Người B, bảng Hình dùng chung `tray_ammonite`:** đồng ý sửa như người B đề nghị; nếu nhận N5 thì dòng đó thành "9 (q2); 10 (thẻ q2)" và `explore_finds` thêm "10 (hình câu q1)".

### Việc kéo theo cho topic editor (bảng Hình dùng chung chưa có các dòng này)
Bài 9–15 còn dùng lại mười sáu hình chưa có trong bảng: `ha_long` (11 w2; 15 w2), `q1_ice` (9 q1; 10 w1), `q4` và `q2_museum` của *Hoá thạch kể chuyện khủng long* (9 w1, 9 q2), `q5` của *Vì sao khủng long biến mất* (9 q2), `tray_shore_rocks` (10 q3), `q2_ferns`, `q5`, `tray_longneck` của *Trái Đất rất lâu về trước* (10 q1, q2, q5), `q2_zoo` (10 q5), `w1_balloon`, `w1_water` của *Hô hấp* bài một (11 q5), `explore_to_brain` của *Não bộ* bài hai (14 w1), `q1_rain` và `q3_sun` của *Núi lửa* (13 w3, q2; 15 q4), `tray_pond` (15 q4), `q1` của *Núi lửa* (12 w3), `tray_dry_leaf` (11 q3), `q1_cliffs` (11 w1), `explore_thermometer` (14 q1), `explore_seasons`, `explore_rain_gauge`, `explore_windsock` của *Thời tiết* (13), `q2` của *Động đất và sóng thần* (13 `tray_cracked`). Phần lớn người C đã liệt kê ở mục bàn giao; bổ sung nốt khi rà chéo.

### Việc cần theo dõi khi làm hình
- **Bài 15 q1 phụ thuộc ảnh của bài 4:** hình câu hỏi là `geologist`, đáp án là búa địa chất. Nếu ảnh `geologist` thấy rõ búa thì câu lộ đáp án; `15:318` đã ghi phương án thay (đổi hình câu hỏi sang `explore_samples`). Người chọn ảnh phải chốt chỗ này trước.
- **Bài 13 kệ Chơi** phụ thuộc một ảnh pin cũ không thấy nhãn hiệu; không tìm được thì cả chín món phải vẽ (`13:758`), kéo theo cả ảnh dùng lại (giun đất, lá mục, bình tưới, đất nứt nẻ).
- **Bài 14 q1** cần designer cắt sát nhiệt kế của *Thời tiết* bài hai cho cùng khung với hai hình vẽ kia (`14:360`).

## content-editor B 11/11 · sửa theo tester

Phạm vi: bài 6–10, theo hai mục "Rà chữ bài 1–8" và "Rà chữ bài 9–15" (tester 11/11). Không đổi dòng `id:`, không chạy lệnh, không sửa bài của A, C. Đã rà lại bằng tìm chuỗi: chuỗi `.en` không có dấu tiếng Việt; `[CẦN KIỂM]` chỉ ở dòng `>`; mọi brief "Dùng lại hình" trỏ bài 1–5 đều đã có từ khoá của gốc, trừ `explore_scratch` (gốc là hình vẽ, không có từ khoá); key cũ (`q1_dried_fish`, `q3_fence`, `q3_pot`, `q3_cliff_base`) chỉ còn trong dòng `>` ghi lý do.

**Đã sửa**
- **N2 (bài 1–8):** bài 6 q4 thạch cao: `alt` về gốc "A clear rock" · "Hòn đá trong"; brief trỏ thẳng `tray_gypsum` ở bài `da-va-dat/thang-do-cung-mohs`. Phụ thuộc A: bài 4 phải thành hình gốc của `tray_gypsum` (brief `[ảnh]` riêng) khi A đổi món thạch cao ở bài 3 (N6). Chưa thì brief này đang trỏ qua một chỗ dùng lại.
- **N3:** chép đúng `alt` gốc ở mười tám chỗ dùng lại hình bài 1–4 (bài 6: `tray_slate`, `tray_sandstone`, `chalk` ×2, `quarry`, `tray_steps` ×4, `tray_concrete`, `granite`, `pumice`, `tray_gypsum`, `tray_limestone`; bài 7: `tray_limestone`, `granite`, `explore_scratch`). Giữ `alt` khác gốc, có dòng `>` ghi lý do: bài 7 thẻ `layer` ("A rock with layers").
- **N4:** thêm "Từ khoá tìm ảnh (EN)" của gốc vào hai mươi mốt chỗ (bài 6 mười tám, bài 7 ba). Chỗ thứ hai mươi hai tester đếm (`07` `explore_scratch`) trỏ hình vẽ, gốc không có từ khoá; đã ghi dòng `>`.
- **N1 nhẹ (bài 1–8):**
  - bài 8 q1: `q1_dried_fish` (món bẫy) đổi thành `q1_mud_print` "leaf print in wet mud" · "dấu lá trên bùn ướt" (ảnh mới). Không dùng "vỏ ốc mới trên kệ bếp" như tester gợi ý, vì câu đã có một vỏ ốc; dấu lá trên bùn ướt là bẫy mạnh hơn (dấu in còn mới, chưa hoá đá).
  - bài 6 q3: `q3_fence` đổi thành `q3_basket` "plastic basket" · "rổ nhựa" (ảnh mới).
- **N3 (bài 9–15), bài 10 q3:** gợi ý trỏ ô "Fossil hunters today"; `q3_cliff_base` đổi thành `q3_alone` "go to the cliffs alone" · "đi ra vách đá một mình" (hình vẽ mới cùng bộ kệ).
- **N4 (bài 9–15), bài 9 q3:** `q3_pot` đổi thành `q3_brick` "clay brick" · "viên gạch", dùng lại `tray_brick` bài 1 (`alt`, từ khoá chép gốc).
- **N5 (bài 9–15), bài 10:**
  - hình câu q1 đổi sang `explore_finds`;
  - thẻ đúng q2 đổi sang `tray_ammonite` của bài 8;
  - mục "Chỗ lệch" số 1 ở phần bàn giao bài 6–10 đã sửa theo.
- **Mục nhỏ (bài 1–8):**
  - n1: bài 8 ví dụ của từ `fossil` còn chín từ ("A fossil can be a shell, leaf or fish.");
  - n2: bài 8 q3 gợi ý đổi sang cách nghĩ ("Think beyond dinosaurs. What else lived long ago?");
  - n4: bài 6 q4 đổi việc từ mặt bàn bếp sang "bậc đá cạnh giếng", hình câu hỏi đổi thành gàu nước;
  - n5: bài 8 q4 nhãn đáp án kéo dài ("its soft body decays away" · "phần thân mềm của nó phân huỷ");
  - n6: bài 6 q3 giải thích khi đúng nói cả hai vế (do con người làm ra, bên trong có đá nghiền nhỏ);
  - n9: `alt` ảnh `laterite` ở bài 6 q5, bài 7 w1 nói "mặt đá", không nói "hòn đá";
  - n12: bài 9, xem n1–n3 bên dưới.
- **Mục nhỏ (bài 9–15):**
  - n1, n2, n3: bài 9 `granite`, `tray_mortar` chép `alt` gốc; thêm từ khoá ở ba chỗ;
  - n4: bài 9 q5 đổi khuôn câu ("Which sea animal leaves fossils most often?" · "Con vật biển nào thường để lại hoá thạch nhất?");
  - n5: bài 10 brief tranh chân dung dặn cắt khung để chiếc búa không nổi bật, thêm dòng `>`;
  - n6: bài 9 số đếm ảnh sửa thành hai mươi.
- Ghi chú cho hoạ sĩ và cho dev của năm bài đã sửa theo (số ảnh, danh sách dùng lại, số từ trên màn).

**Không sửa, lý do**
- n10 (hai ảnh cốc nước khác nhau ở bài 5 và bài 6): để topic editor gom khi rà chéo; bài 6 w1 vẫn trỏ cốc nước của *Đất và nước trên Trái Đất*.
- n11 (bảng Hình dùng chung thiếu dòng): việc của topic editor.
- Bài 10 q4 vẫn có một món bẫy của kệ (`tray_hammer`) làm lựa chọn sai; tester không nêu, giữ nguyên.
- Bài 10 q3: gợi ý mới trỏ ô "Fossil hunters today", mà hình của ô này là `tray_pebbles`, cũng là hình một đáp án của câu. Tester đã đề xuất đúng gợi ý này nên giữ; ghi lại để tester xem lượt sau.

**Phụ thuộc người A:** `tray_gypsum` ở bài 4 (N2 ở trên); nếu A đổi `alt` sáu món kệ bài 4 theo tester N5, chép lại `alt` của `tray_talc`, `tray_gypsum` ở bài 6 q4 (đã ghi dòng `>`).

**Ảnh, hình mới sau sửa:** bài 6 thêm một ảnh (rổ nhựa; ảnh vòi nước đổi thành ảnh gàu nước, số không đổi), mười sáu ảnh; bài 8 thêm một ảnh (dấu lá trên bùn), mười sáu ảnh; bài 10 thêm một hình vẽ (`q3_alone`), mười ba hình vẽ.

### Hình đổi sau rà chữ (B)

| Bài | Chỗ (key) | Đổi gì | Lý do |
| --- | --- | --- | --- |
| 6 | w1 `w1_slate`, `w1_sandstone`; w2 (hình câu `chalk`); w3 (hình câu `quarry`); ô `explore_granite`; món `tray_steps`; q1 (hình câu `magnifying_glass`); thẻ q2 `q2_granite`; q3 `q3_concrete`; q4 `q4_talc`, `q4_granite`, `q4_pumice`; q5 `q5_chalk`; từ `suitable`, `limestone` | Thêm từ khoá gốc; `alt` chép gốc ở những chỗ đã khác gốc | Tester N3, N4 |
| 6 | w1 `w1_marble`, w3 `w3_brick` | Thêm từ khoá gốc (`alt` đã khớp gốc) | Tester N4 |
| 6 | q4 `q4_gypsum` | Brief trỏ `tray_gypsum` ở bài `da-va-dat/thang-do-cung-mohs` (trước: bài `da-nao-cung-hon`); `alt` "A clear rock" · "Hòn đá trong" | Tester N2, N6 |
| 6 | q5 `q5_laterite` | `alt` "Red-brown stone with many holes" · "Mặt đá nâu đỏ có nhiều lỗ" | Tester n9 |
| 6 | q3: `q3_fence` → `q3_basket` | Key mới, ảnh mới (rổ nhựa) | Tester N1 |
| 6 | món `tray_bamboo_fence` | Bỏ câu "Câu q3 dùng lại ảnh này" trong brief | Theo đổi q3 |
| 6 | hình câu q4 | Brief và `alt` đổi: gàu đầy nước (trước: vòi nước chảy vào bồn rửa); key không đổi | Tester n4 |
| 7 | w1 `w1_limestone`, `w1_granite`; w2 (`explore_scratch`); thẻ q2 `q2_layer` | Thêm từ khoá gốc (trừ `explore_scratch`); `alt` chép gốc (trừ `q2_layer`, giữ có dòng `>`) | Tester N3, N4 |
| 7 | w1 `w1_laterite` | `alt` "Red-brown stone with many holes" · "Mặt đá nâu đỏ có nhiều lỗ" | Tester n9 |
| 8 | q1: `q1_dried_fish` → `q1_mud_print` | Key mới, ảnh mới (dấu lá trên bùn ướt) | Tester N1 |
| 8 | món `tray_dried_fish` | Bỏ câu "Câu q1 dùng lại ảnh này" trong brief | Theo đổi q1 |
| 9 | thẻ q2 `q2_rocks` (`granite`); hình câu q3 (`magnifying_glass`); q3 `q3_mortar` | Thêm từ khoá gốc; `alt` chép gốc | Tester n1, n2, n3 (bài 9–15) |
| 9 | q3: `q3_pot` → `q3_brick` | Key mới, dùng lại `tray_brick` ở bài `da-va-dat/lam-quen-voi-da` | Tester N4 (bài 9–15) |
| 9 | món `tray_old_pot` | Bỏ câu "câu q3 dùng lại ảnh này" trong brief | Theo đổi q3 |
| 10 | hình câu q1 | Dùng lại `explore_finds` (trước: `tray_ammonite` bài 8) | Tester N5 |
| 10 | thẻ q2 `q2_evidence` | Dùng lại `tray_ammonite` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao` (trước: `explore_finds`) | Tester N5 |
| 10 | ô `explore_finds` | Brief: danh sách chỗ dùng lại đổi theo (hình câu q1 thay thẻ q2) | Theo N5 |
| 10 | q3: `q3_cliff_base` → `q3_alone` | Key mới, hình vẽ mới (bạn nhỏ đi một mình ra vách đá) | Tester N3 (bài 9–15) |
| 10 | món `tray_cliff_base` | Bỏ câu "Câu q3 dùng lại hình này" trong brief | Theo đổi q3 |
| 10 | ô `explore_mary` | Brief thêm: cắt khung để chiếc búa không nổi bật | Tester n5 (bài 9–15) |
| 6 | q4 `q4_talc`, `q4_gypsum` | `alt` chép gốc mới của bài bốn: "A pale cream piece" · "Mẩu màu trắng ngà"; "A clear piece" · "Mẩu trong suốt" | A sửa bài bốn theo tester N5, N6 (gốc `tray_gypsum` nay ở bài bốn) |
| 6 | tám món kệ Chơi; hình câu q2, q4, q5; `q3_basket`; `q3_concrete` | `[ảnh]` → `[hình vẽ]`; `tray_laterite_wall`, `tray_steps`, `q3_concrete` đổi từ "Dùng lại" thành `[hình vẽ]` riêng; `tray_steps` (kệ) `alt` "Grey stone front steps" · "Bậc thềm đá xám" | File chọn ảnh designer 11/11 (`own`) |
| 6 | `w1_marble`; `w3_brick`; ô `explore_granite`, thẻ `q2_granite`, từ `suitable` (`tray_steps` bài một) | `alt` theo bảng designer: "A white sparkly rock" · "Hòn đá trắng lấp lánh"; "Red bricks in a stack" · "Mấy viên gạch xếp chồng"; "Stone steps with a handrail" · "Bậc đá có tay vịn" | Khớp ảnh thật; A sửa `alt` gốc ở bài một, ba theo cùng chữ |
| 6 | `q1_*`, `q3_table`, `q3_cement`, từ `cement` | Bỏ từ khoá trong brief "Dùng lại" (gốc nay là hình vẽ) | Theo đổi loại hình |
| 7 | ô `explore_forces`; tám món kệ; `q5_cut`, `q5_bank`, `q5_dig` | `[ảnh]` → `[hình vẽ]`; `tray_banyan`, `tray_stream` đổi từ "Dùng lại" thành `[hình vẽ]` riêng | File chọn ảnh designer 11/11 (`own`) |
| 7 | `q3_stream` | "Dùng lại hình `tray_stream`." trong bài (trước: trỏ *Đất và nước trên Trái Đất*) | `same_as` của file chọn ảnh |
| 7 | ô `explore_erosion` (và q4, từ `erosion`, bài 8 w1) | `alt` "A river with a worn bank" · "Dòng sông có bờ bị lở"; brief tả đúng ảnh (sông Cowpasture) | Khớp ảnh; C chép `alt` mới ở bài 12, 15 |
| 7 | hình câu q5; q6 | q5 brief thêm "có tuyết"; q6 `alt` "Tree roots over a big rock" · "Rễ cây trùm lên tảng đá lớn", brief và ghi chú theo ảnh | Bảng designer |
| 8 | `q1_shell`, `q1_insect`, `q1_mud_print`; `q5_waves`, `q5_jar`, `q5_mud` | `[hình vẽ]`; `q1_shell`, `q1_insect` đổi từ "Dùng lại" thành hình vẽ riêng | File chọn ảnh designer 11/11 |
| 8 | `tray_dried_fish` | Brief: cá khô bổ đôi trên tấm ni lông | Khớp ảnh |
| 9 | `w1_pressed_leaf` | Brief lá ép trên giấy trắng; `alt` "A pressed leaf" · "Chiếc lá ép khô"; **nhãn** "leaf pressed flat" · "lá ép khô" | Ảnh không có sách |
| 9 | `q1_glass`; `amber` (và `q1_amber`, bài 10 hình câu w1) | `alt` "Pieces of sea glass" · "Mấy mảnh thuỷ tinh biển"; "Pieces of amber" · "Mấy mẩu hổ phách" | Khớp ảnh |
| 9 | `tray_old_pot`, `tray_old_lamp`, `tray_stone_shell`; `q3_brick` | Brief theo ảnh (bình gốm xám, đèn bão gỉ, vỏ ốc trên lòng bàn tay); `q3_brick` `alt` "Red bricks in a stack" · "Mấy viên gạch xếp chồng" | Bảng designer |
| 10 | ô `explore_mary` (và hình câu q2) | `alt` "A painting of Mary Anning" · "Tranh vẽ Mary Anning"; brief: cắt ngang ngực, búa và chó ngoài khung | Bảng designer |
| 10 | ô `explore_finds` | `[ảnh]` → `[sơ đồ ghép ảnh]`; brief: bộ xương *Leptopterygius*, không phải mẫu của Mary, đã xoá nhãn | `composed` trong file chọn ảnh |
| 10 | thẻ `q2_evidence`, `q2_photos`, `q2_models` | `[hình vẽ]` mới (trước: dùng lại `tray_ammonite`, ảnh mới, dùng lại `tray_longneck`); `q2_models` `alt` "A long-necked dinosaur model" · "Mô hình khủng long cổ dài" | Không có ảnh xấp ảnh cũ không người |
| 10 | `q1_cliffs` | Brief: Golden Cap nhìn từ Charmouth, cạnh Lyme Regis | Khớp ảnh |

## content-editor B 11/11 · theo hình

Áp hai bảng đề xuất của designer (bài 1–7, bài 8–15) vào bài 6–10 và đối chiếu năm file chọn ảnh: mọi mục `own` là `[hình vẽ]`, `composed` là `[sơ đồ ghép ảnh]`, `same_as` là "Dùng lại hình" trỏ đúng chỗ; số brief từng loại khớp file chọn ảnh ở cả năm bài. Không đổi `id:`, không chạy lệnh. Chi tiết ở bảng "Hình đổi sau rà chữ (B)" ngay trên.
- **Chữ trẻ nghe đổi (một chỗ):** bài 9 w1, nhãn lựa chọn `w1_pressed_leaf` từ "leaf pressed in a book" · "lá ép khô trong sách" thành "leaf pressed flat" · "lá ép khô" (cần sinh lại hai clip). Các chỗ khác chỉ đổi brief, `alt` (VoiceOver), không đổi chữ TTS.
- **Người khác cần làm theo:** A sửa `alt` gốc `marble`, `tray_brick`, `tray_steps` đúng chữ trong bảng designer (bài 6, 9 đã chép trước, có dòng `>`); C chép `alt` mới của `explore_erosion` ở bài 12, 15.
- **Giữ, chưa đổi:** `tray_amber_spider` (đang được thay ảnh, brief giữ); `alt` ảnh nhựa cây `resin` vẫn ghi "pine tree" (ảnh designer là nhựa trên vỏ cây, không rõ cây thông; bảng không nêu, nhờ designer xác nhận); bài 8 q5 và bài 10 q2 có hình câu hỏi là ảnh, tranh trong khi lựa chọn là hình vẽ (designer chọn, ghi để tester xem).


## content-editor A 11/11 · sửa theo tester

Phạm vi: bài 1–5, theo mục "Rà chữ bài 1–8 (tester 11/11)": N1, N5, N6 (main session chốt: bài 3 nói về đá, bài 4 nói về khoáng vật) và các mục nhỏ của A (n2, n3, n7); thêm hai việc C nhờ ở mục bàn giao bài 11–15. Không đổi dòng `id:` nào. Không thêm, không bỏ khối `###`: mọi thay đổi nằm ở `####` (lựa chọn, món), brief, `alt` và chữ, nên không có id mới. Không chạy lệnh; mỗi chỗ sửa có dòng `> Rà chữ tester 11/11 (mã)` trong bài. Đã rà bằng tìm chuỗi: không còn chỗ nào trong bài 1–5 trỏ `tray_gypsum` ở bài 3 hay `w1_water` của *Hô hấp*; vị trí đáp án và Đúng/Sai không đổi.

**Đã sửa**
- **N1 (bài 5 q4):** ba lựa chọn không còn dùng lại món kệ Chơi. Nay là ba hình vẽ mới của chính tình huống câu hỏi: ba hòn đá trong hình câu hỏi (cẩm thạch, sa thạch, đá phiến) sau khi nhỏ giọt, mỗi hình khoanh một hòn (trái, giữa, phải). Ba hình giống hệt nhau trừ vòng khoanh. Giữ key `q4_round`, `q4_gone`, `q4_runoff`, giữ ba nhãn, đáp án vẫn ở chỗ thứ hai. Ba món kệ bỏ câu "Câu q4 dùng lại hình này" trong brief.
- **N5 (bài 4):** sáu khoáng vật dùng một khuôn `alt` chung "A <màu> piece" · "Mẩu <màu>", không gọi "rock", "crystal", "mineral": hoạt thạch "A pale cream piece" · "Mẩu màu trắng ngà"; thạch cao "A clear piece" · "Mẩu trong suốt"; thạch anh "A white piece" · "Mẩu màu trắng"; thạch anh tím "A purple piece" · "Mẩu màu tím"; hồng ngọc "A red piece" · "Mẩu màu đỏ"; kim cương "A small clear piece" · "Mẩu nhỏ trong suốt". Đã sửa cả chỗ dùng lại trong bài 4 (món, q1, q3, từ `diamond`, `quartz`, thẻ `ruby_card`) và bài 5 w1.
- **N6:**
  - Bài 3 bỏ hẳn thạch cao. Đá mềm thứ hai là **đá xà phòng** (soapstone, steatit): một loại đá thật, rất mềm, móng tay cào xước được, gồm chủ yếu là hoạt thạch.
    - Món `tray_soapstone` mới thay `tray_gypsum`.
    - Ô "Soft rocks": ví dụ hai thành "soapstone" · "đá xà phòng", hình ô đổi sang ảnh `chalk`.
    - Câu q4: đáp án `q4_soapstone` thay `q4_gypsum`.
    - Món bẫy bánh xà phòng đổi thành cục đất nặn (`tray_play_dough`), để trong một kệ không có cả "đá xà phòng" lẫn "bánh xà phòng".
  - Bài 4 thành gốc của ảnh tinh thể thạch cao `tray_gypsum` (cùng ảnh, cùng key, cùng từ khoá, brief `[ảnh]` đầy đủ); thạch cao chỉ còn vai khoáng vật.
    - Ô "Minerals": ví dụ bốn đổi thành "soapstone is made mostly of talc" · "đá xà phòng gồm chủ yếu là hoạt thạch", để nối đá của bài 3 với khoáng vật của bài 4.
    - Câu w2: giải thích đổi "chalk and gypsum" thành "chalk and soapstone".
    - Hình câu q6: tảng đá to đổi từ thạch cao sang đá xà phòng.
  - Bài 5 w1 trỏ `tray_gypsum` về bài 4.
- **n2:**
  - Bài 2: ô "Layers" ví dụ hai đổi thành "dark grey slate" · "đá phiến xám sẫm"; q4 hỏi điều nhìn thấy ("Nam's rock is made of thin, flat sheets."), gợi ý "Look closely at the edge of each rock.".
  - Bài 3 q4: gợi ý theo đề xuất của tester ("Think which rock scratched most easily in the game.").
  - Bài 5 q3: gợi ý "Think about the water test on each rock.".
  - Bài 2 q3 giữ, có dòng `>` ghi lý do: gợi ý đã là cách nhìn, không trỏ tên ô.
- **n3 (bài 1 q3):** gợi ý theo đề xuất "Think what each one is made from.".
- **n7:**
  - Bài 3 q1: lựa chọn sai đổi từ cốc thuỷ tinh của *Hô hấp* sang ảnh mới cốc nhựa trong đựng nước (`q1_water`); nhãn "glass of water" thành "cup of water".
  - Bài 5 q1: hình câu hỏi dùng lại ảnh `q1_water` đó.
- **Việc C nhờ:**
  - Brief ảnh `geologist` (bài 4) thêm "không thấy rõ búa địa chất" và ghi chỗ bài 15 dùng lại.
  - Hình vẽ "nhỏ nước lên đá" của bài 5 là `explore_water` ở bài `da-va-dat/da-nao-tham-nuoc`, `alt` "A dropper over a rock" · "Ống nhỏ giọt phía trên hòn đá". Bài 15 `q3_water` có thể "Dùng lại hình" này (C sửa).

**Chữ trẻ đọc hoặc nghe đã đổi**
- Bài 1 q3: `hint`.
- Bài 2: ô "Layers" ví dụ hai; q4 `prompt`, `hint`.
- Bài 3:
  - ô "Soft rocks" ví dụ hai;
  - món mới "Soapstone" · "Đá xà phòng" và "Play dough" · "Cục đất nặn" (bỏ "Soap" · "Bánh xà phòng", "Gypsum" · "Thạch cao");
  - q1 nhãn "cup of water";
  - q4 nhãn đáp án, `hint`, hai câu giải thích.
- Bài 4: w2 giải thích khi đúng; ô "Minerals" ví dụ bốn.
- Bài 5: q3 `hint`.
- `alt` (VoiceOver đọc): sáu khoáng vật ở bài 4 và bài 5 w1, `alt` mới của các hình đổi ở bảng dưới.

**Việc của người khác**
- **B, bài 6 q4:** chép `alt` mới của bài 4. `tray_talc`: "A pale cream piece" · "Mẩu màu trắng ngà" (đang "A pale rock" · "Hòn đá màu nhạt"). `tray_gypsum`: "A clear piece" · "Mẩu trong suốt" (đang "A clear rock" · "Hòn đá trong"). Brief của B đã trỏ đúng bài 4. Nếu B muốn giữ chữ "rock" cho cùng khuôn với đá hoa cương, đá bọt trong câu đó thì ghi dòng `>`.
- **C, bài 15:** dòng 463–479 chép `alt` mới: `diamond` "A small clear piece" · "Mẩu nhỏ trong suốt"; `quartz` "A white piece" · "Mẩu màu trắng"; `tray_talc` "A pale cream piece" · "Mẩu màu trắng ngà". Bài 15 `q3_water`: xem "Việc C nhờ" ở trên. Bài 11 q5 còn dùng cốc thuỷ tinh `w1_water` của *Hô hấp*; nếu muốn gom (tester n10) thì dùng lại `q1_water` ở bài `da-va-dat/da-nao-cung-hon`.
- **Topic editor, `_topic.md`:**
  - Kế hoạch bài 3: Chơi nhóm mềm là `chalk`, `tray_soapstone`; bẫy là đất nặn, nến, tẩy. Câu "Ví dụ quiz của Oak (… đá xà phòng …) không dùng" sửa thành "không dùng đồ trang trí bằng đá xà phòng".
  - Kế hoạch bài 4: `tray_gypsum` là gốc ở bài 4.
  - Bảng Hình dùng chung: dòng "3 · `tray_gypsum`" thành "4 · `tray_gypsum`" (dùng lại ở 5 w1, 6 q4); thêm "3 · `tray_soapstone`", "3 · `q1_water`" (dùng lại ở 5 q1).
  - Bảng Tên gọi, tên đá: thêm "soapstone · đá xà phòng" ([CẦN KIỂM]; không dùng "đá tan").
  - Bộ hình vẽ "Bàn tay thử đá": bài 5 thêm ba hình lựa chọn q4; bài 4 hình q6 là đá xà phòng.

**[CẦN KIỂM] mới**
- Đá xà phòng là đá, gồm chủ yếu là hoạt thạch, rất mềm (khoảng bậc một tới hai), móng tay cào xước được; tên tiếng Việt "đá xà phòng" (có sách gọi "steatit").
- Đất nặn mềm, móng tay ấn lõm được (món bẫy bài 3).

### Hình đổi sau rà chữ (A)

Designer bài 1–7 xem bảng này trước khi vẽ bộ "Bàn tay thử đá". Bộ đó nay chốt hai mươi sáu hình, như liệt kê dưới đây.
- Bài 3 (năm hình, không đổi): `explore_scratch` (gốc của bộ), hình câu q5 và ba lựa chọn `q5_two`, `q5_one`, `q5_none`.
- Bài 4 (hai hình): `explore_heavy` không đổi; hình câu q6 đổi.
- Bài 5 (mười chín hình): bốn ô Học, chín món Chơi, hình câu q4, hình câu q5 và `q5_none` không đổi; ba lựa chọn q4 là hình mới.
- Hình "Thang Mohs" (`explore_scale`, bài 4) chỉ đổi chữ brief.

| Bài | Chỗ (key) | Đổi gì | Việc cho designer | Lý do |
| --- | --- | --- | --- | --- |
| 2 | món `tray_slate` (gốc) | Brief thêm: mép tách lớp phải thấy rõ (câu q4 hỏi bé nhìn ra "nhiều tấm mỏng") | Chọn ảnh chụp chéo thấy mép; không đổi key, `alt` | n2 |
| 3 | món `tray_gypsum` | Bỏ khỏi bài 3 | Chuyển mục ảnh tinh thể thạch cao trong file chọn ảnh sang bài 4 (cùng ảnh) | N6 |
| 3 | món `tray_soapstone` (gốc mới, Bộ mẫu đá) | Ảnh mới: mẫu đá xà phòng xám xanh, bóng như sáp; `alt` "A grey-green rock" · "Hòn đá màu xám xanh" | Tìm ảnh mới (James St. John, USGS, Smithsonian); không lấy đồ chạm khắc | N6 |
| 3 | ô `explore_soft` | Dùng lại `chalk` (trước: `tray_gypsum`); `alt` "A white rock" · "Hòn đá màu trắng" | Không tìm mới | N6, n2 |
| 3 | món `tray_soap` → `tray_play_dough` | Key mới, ảnh mới: cục đất nặn xám vo tròn như hòn đá; `alt` "A grey lump of play dough" · "Cục đất nặn màu xám" | Bỏ ảnh bánh xà phòng; tìm ảnh đất nặn không nhãn hiệu | N6 |
| 3 | q4 `q4_gypsum` → `q4_soapstone` | Dùng lại `tray_soapstone` | Không tìm mới | N6 |
| 3 | q1 `q1_water` (gốc mới) | Ảnh mới: cốc nhựa trong đựng nước (trước: dùng lại `w1_water` của *Hô hấp*); `alt` "A plastic cup of water" · "Cốc nhựa đựng nước" | Tìm ảnh mới, không vạch số, không nhãn | n7 |
| 4 | món `tray_gypsum` (nay là gốc) | Brief `[ảnh]` đầy đủ, cùng ảnh, cùng từ khoá như gốc cũ ở bài 3; `alt` "A clear piece" · "Mẩu trong suốt" | Ghi ảnh này dưới bài 4 trong file chọn ảnh | N6, N5 |
| 4 | `alt` của `tray_talc`, `tray_quartz`/`quartz`, `tray_amethyst`, `tray_ruby`, `tray_diamond`/`diamond`; lựa chọn q1, q3; thẻ `ruby_card` | `alt` theo khuôn "A <màu> piece" · "Mẩu <màu>" | Không đổi ảnh | N5 |
| 4 | ô `explore_scale` | Brief chỉ đổi chữ: sáu khoáng vật vẽ theo ảnh của bài 4 (thạch cao nay ở bài 4) | Không đổi hình | N6 |
| 4 | hình câu q6 | Tảng đá to đổi từ thạch cao trắng ngà sang đá xà phòng xám xanh, mặt mịn như sáp (vẽ theo ảnh `tray_soapstone`); `alt` không đổi | Vẽ theo brief mới | N6 |
| 4 | từ `geologist` (gốc) | Brief thêm: không thấy rõ búa địa chất; bài 15 dùng lại (món Chơi, hình câu q1, từ `geologist`) | Chọn ảnh không thấy rõ búa | Việc C nhờ |
| 5 | q4 `q4_round`, `q4_gone`, `q4_runoff` | Ba hình vẽ mới (trước: dùng lại `tray_marble_drop`, `tray_drop_sandstone`, `tray_slate_runoff`): cùng khay ba hòn đá của hình câu hỏi q4 sau khi nhỏ giọt, vòng tròn vàng hoe nét dày khoanh hòn trái, giữa, phải; `alt` "The left rock, with a round drop on top" · "Hòn bên trái, giọt nước đọng tròn trên mặt"; "The middle rock, with only a damp spot" · "Hòn ở giữa, chỉ còn một chấm ẩm"; "The right rock, with water running off" · "Hòn bên phải, nước trượt xuống khay" | Vẽ thêm ba hình; vòng khoanh phải thấy rõ trên iPhone hẹp nhất | N1 |
| 5 | món `tray_marble_drop`, `tray_drop_sandstone`, `tray_slate_runoff` | Bỏ câu "Câu q4 dùng lại hình này" trong brief | Không đổi hình | N1 |
| 5 | hình câu q1 | Dùng lại `q1_water` ở bài `da-va-dat/da-nao-cung-hon` (trước: `w1_water` của *Hô hấp*) | Không tìm mới | n7 |
| 5 | w1 `w1_gypsum`, `w1_diamond`, `w1_quartz` | `w1_gypsum` trỏ `tray_gypsum` ở bài 4; ba `alt` theo khuôn mới | Không đổi ảnh | N5, N6 |

Số hình sau sửa (ảnh mới · hình tự vẽ · hình ghép): bài 3: mười bốn · năm · một; bài 4: mười bốn · ba · ba; bài 5: hai · mười chín · không. Bài 1, 2 không đổi số.

## content-editor C 11/11 · sửa theo tester

Phạm vi: bài 11–15, theo mục "Rà chữ bài 9–15 (tester 11/11)" (N1, N2, N6 và các mục nhỏ của bài 11–15) và mục "Rà chữ bài 1–8" n13 (bài 15 w2). Thêm hai việc người A báo: chép `alt` mới của khoáng vật bài 4, dùng lại hình nhỏ nước `explore_water` của bài 5. Không đổi dòng `id:` nào, không thêm hay bỏ khối `###` (mọi chỗ đổi nằm ở `####`, chữ, brief, `alt`). Không chạy lệnh. Mỗi chỗ sửa có dòng `> Rà chữ tester 11/11 (mã)` trong bài. Đã rà lại bằng tìm chuỗi: chuỗi `.en` không có dấu tiếng Việt; `[CẦN KIỂM]` chỉ ở dòng `>`; key cũ `q2_chalk` chỉ còn trong dòng `>` ghi lý do; vị trí đáp án và đáp án Đúng/Sai không đổi.

**Đã sửa**
- **N1 (bài 15 q2):** thẻ `q2_chalk` (đá phấn) đổi thành `q2_talc` "talc" · "hoạt thạch", dùng lại `tray_talc` của bài 4, đúng đề xuất. Ba thẻ nay là ba khoáng vật của thang Mohs; kim cương vẫn ở chỗ thứ nhất. Ghi chú câu sửa theo.
- **N2 (bài 14 q6):** lời Na mới "Water goes through garden soil as fast as sand." · "Nước thấm qua đất vườn nhanh bằng đất cát."; hình câu hỏi dùng lại `tray_garden_sand`; hai câu giải thích như tester chép sẵn; thêm dòng `[CẦN KIỂM]`. Giữ key `all_soil_drains_same`, giữ đáp án Sai. Ghi chú câu, ghi chú ô Học, brief `explore_setup` (bỏ "q6" khỏi danh sách dùng lại) và số từ màn q6 sửa theo. Kéo theo gỡ n8: `explore_setup` còn làm hình câu hỏi ở q1, q3.
- **N6 (bài 12, thẻ `coffee_card`):** chọn đổi `tag`, không bắt buộc ảnh chụp ở Việt Nam. `tag` "Central Highlands" · "Tây Nguyên" thành "Red soil farms" · "Vườn trên đất đỏ"; `name`, `fact` giữ. Lý do: ảnh Tây Nguyên hợp giấy phép rất hiếm (như `tray_red_soil` của *Núi lửa* chụp ở Brasil); buộc ảnh Việt Nam thì người chọn ảnh dễ bị kẹt. `fact` nói chung về đất đỏ ở Tây Nguyên, không nói ảnh chụp ở đâu.
- **Bài 15 w2 (rà bài 1–8, n13):** lựa chọn đúng đổi từ `explore_weathering` sang `tray_rain_limestone` của bài 7. Câu hỏi đổi theo hình: "Rain slowly wears down a rock where it is. What is this called?" · "Nước mưa làm đá mòn dần ngay tại chỗ. Hiện tượng này gọi là gì?". Giải thích khi sai đổi theo. Ý (phong hoá), thứ tự lựa chọn và chỗ đáp án giữ.
- **Mục nhỏ bài 11–15:**
  - n7: bài 12 số ảnh cần tìm "mười" thành "mười một" (cả dòng đếm ở mục bàn giao bài 11–15).
  - n9: bài 11 q3, hình câu hỏi đổi từ `soil` sang `tray_rotting_twig`.
  - n10: bài 11 q4, gợi ý đổi thành "Remember the sizes in the Bits of rock picture." · "Em nhớ lại cỡ hạt ở ô Mảnh đá nhé.".
  - n11: bài 13 q3, gợi ý đổi thành "Which ones give the soil cover and food?" · "Việc nào vừa che chở vừa nuôi đất nhé?".
  - n12: bài 14 w1, ảnh muỗi giữ, thêm dòng `>` dặn designer cắt sát con muỗi cho cùng khung hai ảnh kia (ghi `changes`).
  - n13: bài 14 `alt.en` của `tray_garden_sand` rút còn chín từ ("A pile of garden soil and one of sand"), chép sang hình câu q6.
  - n14: bài 15 q5, lựa chọn "solid rock" đổi ảnh từ `quarry` sang `tray_limestone` của bài 3 (mẫu đá chụp gần). Nhãn giữ "solid rock" · "đá liền khối", không đổi thành "a block of rock" như tester gợi ý, để ba nhãn cùng dạng không có mạo từ.
  - Câu nhỏ khác: bài 12 q5 `prompt.en` khớp bản VI ("What are the sandy soil's grains like?"). Bài 12 w3 `alt` của lựa chọn đúng đổi thành "A deep red field" · "Mặt ruộng màu đỏ sẫm" (có dòng `>`), cùng cách tả màu như hai lựa chọn kia.
  - Trả lời "Còn chưa chắc" 2: bài 11 w1 thêm dòng `>` dặn designer tách nền hai ảnh vật nhỏ, đặt nền kem.
- **Việc người A báo:**
  - bài 15 q2 chép `alt` mới của bài 4: `diamond` "A small clear piece" · "Mẩu nhỏ trong suốt", `quartz` "A white piece" · "Mẩu màu trắng", `tray_talc` "A pale cream piece" · "Mẩu màu trắng ngà";
  - bài 15 `q3_water` dùng lại `explore_water` ở bài `da-va-dat/da-nao-tham-nuoc`, không vẽ mới;
  - bài 11 q5 `q5_water` đổi từ cốc thuỷ tinh `w1_water` của *Hô hấp* sang cốc nhựa `q1_water` của bài 3; nhãn giữ "water" · "nước". Brief `q5_soap` bỏ câu "dùng lại ảnh bánh xà phòng bài 3" (bài 3 đã bỏ món này).
- Ghi chú cho hoạ sĩ, cho dev của bài 11, 12, 14, 15 sửa theo (danh sách dùng lại, số hình, số từ màn).

**Không sửa, lý do**
- Bài 13 q2 (tester ghi cùng kiểu N5, nhẹ hơn, không bắt buộc sửa): giữ. Thẻ đúng `q2_climate` là ảnh ô Học, nhưng thẻ sai "weather" là chính misconception nên vẫn có sức hút.
- Bài 15 q3 có ba câu ngắn trong `prompt`: giữ như tester đề nghị; ios-dev xem màn này trên iPhone hẹp.
- Bài 13 "khí hậu đang thay đổi dần" không nói chiều thay đổi: giữ theo `_topic.md` ("không doạ, không con số"); PM ghi vào "Chỗ lệch Oak" nếu cần.

**Chữ trẻ đọc hoặc nghe đã đổi** (cần sinh lại giọng nếu đã chạy TTS)
- Bài 11: q4 `hint`.
- Bài 12:
  - q5 `prompt.en`;
  - thẻ `coffee_card` `tag`.
- Bài 13: q3 `hint`.
- Bài 14: q6 `statement`, hai câu giải thích.
- Bài 15:
  - w2 `prompt`, `explanation_wrong`;
  - q2 thẻ "talc" · "hoạt thạch" thay "chalk" · "đá phấn".
- `alt` (VoiceOver đọc): các dòng ở bảng dưới.

### Hình đổi sau rà chữ (C)

| Bài | Chỗ (key) | Đổi gì | Việc cho designer | Lý do |
| --- | --- | --- | --- | --- |
| 11 | w1 `w1_toy`, `w1_coin` | Không đổi brief, `alt`; thêm dòng `>` | Tách nền hai ảnh vật nhỏ, đặt nền kem cho cùng khung ảnh bộ xương; ghi `changes` | Trả lời "Còn chưa chắc" 2 |
| 11 | hình câu q3 | Dùng lại `tray_rotting_twig` (trước: `soil`); `alt` "A rotting twig on the ground" · "Cành cây mục trên mặt đất" | Không tìm mới | n9 |
| 11 | q5 `q5_water` | Dùng lại `q1_water` ở bài `da-va-dat/da-nao-cung-hon` (trước: `w1_water` của *Hô hấp*); `alt` "A plastic cup of water" · "Cốc nhựa đựng nước" | Không tìm mới | Đề xuất A, tester n10 (bài 1–8) |
| 11 | q5 `q5_soap` | Brief bỏ câu "nếu bài 3 có ảnh bánh xà phòng thì dùng lại" | Ảnh mới như cũ | Bài 3 bỏ món bánh xà phòng |
| 12 | w3 `w3_red` | `alt` "A deep red field" · "Mặt ruộng màu đỏ sẫm" (trước: chép gốc "Red soil in a field" · "Đất đỏ trên ruộng") | Không đổi ảnh | Câu nhỏ khác |
| 12 | thẻ `coffee_card` | Không đổi hình; `tag` đổi (chữ) | Ảnh `tray_coffee` vẫn được lấy ở nước khác | N6 |
| 12 | Ghi chú cho hoạ sĩ | "Ảnh cần tìm" mười một (trước ghi nhầm mười) | Không đổi | n7 |
| 14 | w1 `w1_mosquito` | Không đổi brief, `alt`; thêm dòng `>` | Cắt sát con muỗi cho cùng cỡ con vật trong khung với giun, sâu; ghi `changes`. Không cắt được thì báo biên tập đổi ảnh muỗi trên lá | n12 |
| 14 | ô `explore_setup` (gốc) | Brief bỏ "q6" khỏi danh sách dùng lại | Không đổi hình | N2 |
| 14 | món `tray_garden_sand` | `alt.en` "A pile of garden soil and one of sand" (trước: mười một từ); brief thêm "câu q6 dùng lại" | Không đổi hình | n13, N2 |
| 14 | hình câu q6 | Dùng lại `tray_garden_sand` (trước: `explore_setup`) | Không vẽ mới | N2 |
| 15 | w2 `w2_weathering` | Dùng lại `tray_rain_limestone` ở bài `da-va-dat/da-bi-bao-mon-theo-thoi-gian` (trước: `explore_weathering`); `alt` "Grey rock with deep grooves" · "Mặt đá xám có nhiều rãnh sâu" | Không tìm mới | n13 (bài 1–8) |
| 15 | q2 `q2_chalk` → `q2_talc` | Key mới; dùng lại `tray_talc` ở bài `da-va-dat/thang-do-cung-mohs`; `alt` "A pale cream piece" · "Mẩu màu trắng ngà" | Không tìm mới | N1 |
| 15 | q2 `q2_diamond`, `q2_quartz` | `alt` theo khuôn mới của bài 4: "A small clear piece" · "Mẩu nhỏ trong suốt"; "A white piece" · "Mẩu màu trắng" | Không đổi ảnh | Người A, N5 (bài 1–8) |
| 15 | q3 `q3_water` | Dùng lại `explore_water` ở bài `da-va-dat/da-nao-tham-nuoc` (trước: hình vẽ mới); `alt` "A dropper over a rock" · "Ống nhỏ giọt phía trên hòn đá" | Bỏ một hình vẽ mới | Người A báo key |
| 15 | q5 `q5_rock` | Dùng lại `tray_limestone` ở bài `da-va-dat/da-nao-cung-hon` (trước: `quarry`); `alt` "A pale grey rock" · "Hòn đá màu xám nhạt" | Không tìm mới | n14 |

Số hình sau sửa (ảnh mới · hình tự vẽ · hình ghép): bài 11: mười tám · bảy · một (không đổi); bài 12: mười một · tám · không; bài 13: mười ba · năm · không (không đổi); bài 14: ba · hai mươi hai · không (không đổi); bài 15: mười · một · không (bớt một hình vẽ).

**Việc kéo theo cho topic editor:** bảng Hình dùng chung thêm các chỗ dùng lại mới: `tray_rain_limestone` bài 7 (15 w2, thay `explore_weathering`), `tray_talc` bài 4 (15 q2), `tray_limestone` bài 3 (15 q5), `explore_water` bài 5 (15 q3), `q1_water` bài 3 (11 q5), `tray_rotting_twig` bài 11 (hình câu q3 cùng bài). Bỏ "15 (w2)" khỏi dòng `explore_weathering`, bỏ "15 (nếu cần)" ở dòng `quarry`. Câu sáu bài 14 ở mục "Câu sáu, lời Na" sửa theo lời Na mới, hình `tray_garden_sand`.

## designer 11/11 · hình bài 8–15

Theo SK-033 ("Hợp đồng ảnh", "Hình ghép", "Hình tự vẽ"), cách làm SK-036, SK-037, SK-038 và hai bảng "Hình đổi sau rà chữ (B)", "(C)". Đã dựng lại khoá từ `.md` mới nhất (sau sửa theo tester) bằng `images search --cache-only --out <scratchpad>`. Chờ Duy duyệt; chưa build, chưa commit. Không sửa `.md`.

**File**
- File chọn ảnh: `content/images/discoverer/da-va-dat/{hoa-thach-hinh-thanh-the-nao,nhieu-cach-tao-thanh-hoa-thach,mary-anning-nguoi-san-hoa-thach,dat-gom-nhung-gi,cac-loai-dat-o-viet-nam,the-nao-la-dat-tot,nuoc-tham-qua-dat-nao-nhanh-hon,nha-dia-chat-lam-gi}.json`. Kiểm offline bằng `SelectionSet`: 386 khoá, 0 lỗi, mọi `same_as` (kể cả sang bài 1–7) tìm được; mỗi câu và mỗi kệ một loại hình (kiểm bằng script).
- Hình tự vẽ: `content/images/own/da-va-dat/b08-…` tới `b15-…`, 105 file JPEG 1024×768, sRGB, không chữ, không số, không nét mặt; trẻ vẽ từ phía sau.
- Hình ghép (`content/images/composed/da-va-dat/`): `b10-explore_finds.jpg` (bộ xương thằn lằn cá CC0, xoá nhãn, số hiệu bằng vân đá bên cạnh), `b11-explore_rock_bits.jpg` (bốn hình vẽ sỏi, cát, bùn mịn, đất sét, lưới 2×2), `b11-w1_toy.jpg`, `b11-w1_coin.jpg` (tách nền ảnh khủng long đồ chơi, đồng xu, đặt nền kem như tester dặn), `b14-q1_thermometer.jpg` (cắt nhiệt kế vẽ của *Thời tiết* lên nền kem).
- Trang duyệt (ngoài git): `content/.build/images/da-va-dat/b8-15/index.html`, `<bài>.html` (mỗi hàng: đầy đủ, ô lưới 2:1, ô vuông), `own-sheet.html` (lưới 105 hình vẽ, 5 hình ghép).

**Số hình** (386 khoá, **0 chỗ trống**)

| Bài | Ảnh nguồn | Tự vẽ | Ghép | Dùng lại |
| --- | --- | --- | --- | --- |
| 8 Hoá thạch hình thành | 12 | 11 | 0 | 23 |
| 9 Nhiều cách tạo hoá thạch | 20 | 2 | 0 | 24 |
| 10 Mary Anning | 4 | 16 | 1 | 28 |
| 11 Đất gồm những gì | 4 | 25 | 3 | 14 |
| 12 Các loại đất | 11 | 9 | 0 | 31 |
| 13 Thế nào là đất tốt | 3 | 17 | 0 | 31 |
| 14 Nước thấm qua đất | 3 | 23 | 1 | 19 |
| 15 Nhà địa chất | 12 | 2 | 0 | 37 |
| Cộng | 69 | 105 | 5 | 207 |

- Giấy phép 69 mục ảnh (và 1 ảnh thành phần hình ghép): CC0 23, Public domain 16, CC BY 2.0 12, CC BY 4.0 11, CC BY 3.0 6, CC BY 3.0 US 1, CC BY 2.5 1. Tất cả từ Wikimedia Commons (gồm NASA, USGS, NPS, USDA, USFWS); `images fetch` kiểm lại ở nguồn. Không BY-SA, NC, ND, AI, Pinterest. Ảnh CC0/PD đổi tên trung tính khi tên gốc lạ; ảnh CC BY giữ tên gốc.
- Không Openverse nào vào file chọn ảnh (Openverse trả 504 và 0 kết quả hôm nay).

**Quyết định**
- **Vẽ cả kệ, cả câu** khi một món chỉ vẽ được (Commons 11/11 không có ảnh hợp lệ, không người, không chữ):
  - bài 11: kệ Chơi (cành mục, vỏ lon, chai không nhãn), q1, q3 (lá khô, vỏ chuối, rễ), thẻ q2 (đất sét), q5 (cốc nước bài 3 là hình vẽ nên vẽ thêm bóng bay, xà phòng), từ `clay`, thẻ thìa đất;
  - bài 13: kệ Chơi (pin cũ, rãnh thoát nước, vườn rau ngập), q1, q3 (mặt đất quét trơ), q6 đồi thông (ảnh Đà Lạt là BY-SA);
  - bài 10: ba thẻ q2 (xấp ảnh cũ trên Commons đều có người);
  - bài 8: q1 (dấu lá trên bùn ướt), ba lựa chọn q5; bài 12 q4 (cành cà phê chỉ quả xanh); bài 14 q5 (sân đất đọng nước); bài 15 `explore_samples` (khay mẫu có nhãn chữ).
- Bài 13 `tray_watering`, `tray_rotting_leaves`, `q1_stones` trỏ về hình vẽ của kệ bài 11 (đúng brief). Bài 14 q5 dùng ba hình vẽ đất bài 11.
- **Giữ nhóm cùng kiểu khi hình gốc bài khác lệch kiểu:** bài 12 `tray_cement` ảnh riêng (sân xi măng bài 6 là hình vẽ); bài 15 `w2_weathering` ảnh riêng mặt đá vôi rãnh sâu (`tray_rain_limestone` bài 7 là hình vẽ, hai lựa chọn kia là ảnh); bài 15 `tray_rock_layers` ảnh vách đá nhiều lớp (`geologist` bài 4 là hình vẽ, kệ bài 15 toàn ảnh); bài 15 `q1_watering`, `q5_stones` ảnh riêng; bài 15 w1 dùng ba hình nắm đất của bài 12 (`q4_grey`, `q4_pale`, `q4_dark`) vì đất sét chỉ có hình vẽ.
- Bài 10: tranh Mary Anning (public domain, khoảng 1842) cắt ngang ngực, búa và chú chó nằm ngoài khung (búa ngang hông, chó ở chân tranh: không giữ chó mà bỏ búa được). Bộ xương là *Leptopterygius* ở Bảo tàng Lịch sử Tự nhiên Luân Đôn, tìm ở Street, Somerset (cùng tầng đá kỷ Jura sớm), không phải mẫu của bà. Vách đá q1 là Golden Cap nhìn từ Charmouth, cạnh Lyme Regis (CC BY 2.0), cắt bỏ bãi có người.
- Bài 14 `w1_mosquito`: cùng ảnh CDC của *Não bộ*, mục ảnh có `crop` cắt sát con muỗi (không cần hình ghép). Bài 15 `tray_forecast` dùng lại `weather_box` của *Thời tiết*.
- Hổ phách: côn trùng (`tray_amber_insect`), kiến (thẻ), các mẩu (`amber`), nhện (`tray_amber_spider`) đều ghi Baltic trên trang gốc. Nhện đổi sang "Jumping spider in Baltic amber" (CC0) theo phiên chính chốt 11/11 (ảnh cũ không ghi xuất xứ).

**Đề xuất cho content-editor** (designer không sửa `.md`)

| Bài · key | Đề xuất |
| --- | --- |
| 8 `q1_shell`, `q1_insect` | "Dùng lại …" → `[hình vẽ]` vỏ ốc xoắn trên cát; dấu chuồn chuồn trên đá kem. `q1_mud_print`, `q5_waves`, `q5_jar`, `q5_mud`: `[ảnh]` → `[hình vẽ]` |
| 8 `tray_dried_fish` | brief: cá khô bổ đôi trên tấm ni lông, chụp từ trên xuống (không nia) |
| 9 `w1_pressed_leaf` | brief: lá ép phẳng trên giấy trắng; alt "A pressed leaf" · "Chiếc lá ép khô" |
| 9 `q1_glass` | alt "Pieces of sea glass" · "Mấy mảnh thuỷ tinh biển" (ảnh xanh lá, trắng) |
| 9 `amber` (cả hình câu w1 bài 10) | alt "Pieces of amber" · "Mấy mẩu hổ phách" (nhiều màu) |
| 9 `tray_old_pot`, `tray_old_lamp`, `tray_stone_shell` | brief theo ảnh: bình gốm xám nền trắng; đèn bão dầu hoả cũ gỉ; vỏ ốc hoá đá trên lòng bàn tay |
| 10 `explore_mary` (cả q2) | alt "A painting of Mary Anning" · "Tranh vẽ Mary Anning" (chó ngoài khung) |
| 10 `q2_evidence`, `q2_photos`, `q2_models` | `[hình vẽ]`: hòn đá có vỏ xoắn; xấp ảnh phong cảnh cũ; mô hình khủng long cổ dài xanh lá |
| 11 kệ Chơi (9 món), `q3_leaf`, `q3_peel`, `q3_root`, `q2_silt`, `q2_organic`, `q5_air`, `q5_soap`, `clay`, `spoon_soil_card` | `[ảnh]` / "Dùng lại …" → `[hình vẽ]`; `q2_silt`, `q2_organic` là hình riêng (ảnh `silt`, `explore_organic` giữ cho từ vựng, ô Học) |
| 11 `explore_rock_bits` | brief: lưới hai hàng, hai cột bốn hình vẽ (ô Học hiện ô vuông, hàng ngang bị cắt) |
| 11 `soil` (cả các chỗ dùng lại) | alt "Garden soil in a hand" · "Nắm đất vườn trong lòng bàn tay" (không có ảnh hợp lệ tay đeo găng) |
| 11 `q6` | brief: luống cải trên đất nâu (không hàng rào tre, không phải Việt Nam) |
| 12 `q6` | alt "A handful of soil in a hand" · "Nắm đất trong lòng bàn tay" |
| 12 `tray_orchard` (cả `q3_fruit`) | alt "Rows of fruit trees" · "Vườn cây ăn trái" (không có mương) |
| 12 `tray_watermelon` (cả `q1_watermelon`) | alt "A watermelon growing in a field" · "Quả dưa hấu mọc trên ruộng" |
| 12 `tray_tiles` | alt "A floor of red bricks" · "Nền gạch đỏ" |
| 12 `tray_cement` | brief: ảnh riêng mặt sân xi măng, không dùng lại `tray_cement_yard` (hình vẽ) |
| 12 `q4` | `[ảnh]` → `[hình vẽ]` |
| 13 kệ Chơi (`tray_earthworm`, `tray_compost`, `tray_cracked`, `tray_ants`, `tray_flooded`, `tray_ditch`, `tray_batteries`), `q3_*`, `q6` | `[ảnh]` / "Dùng lại …" → `[hình vẽ]` (ảnh giun đất giữ cho từ, ô Học, thẻ) |
| 14 `q1_thermometer` | brief: hình ghép cắt nhiệt kế từ `explore_thermometer` *Thời tiết* |
| 14 `q5` | `[ảnh]` → `[hình vẽ]`; `q5_silt` trỏ `q2_silt` bài 11 |
| 14 `paddy_card` | alt "Rice terraces in the hills" · "Ruộng lúa bậc thang" (ảnh Sơn La) |
| 15 `w1_clay`, `w1_sandy`, `w1_garden` | trỏ `q4_grey`, `q4_pale`, `q4_dark` bài 12; alt chép gốc ("A handful of grey smooth soil" · "Nắm đất xám mịn"…) |
| 15 `w2_weathering` | brief: ảnh riêng mặt đá vôi rãnh sâu (alt giữ) |
| 15 `tray_rock_layers` | brief ảnh vách đá nhiều lớp; alt "Layered rock in a sea cliff" · "Vách đá nhiều lớp ven biển" |
| 15 `tray_forecast` | "Dùng lại `weather_box` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`"; alt chép gốc "A white weather box on legs" |
| 15 `q1_watering` | alt "A watering can" · "Bình tưới nước" (ảnh không rót nước); `q5_stones` ảnh riêng, alt giữ |
| 15 `explore_samples` | `[ảnh]` → `[hình vẽ]` |
| 15 `q6` | brief: nền sáng (thiên thạch sắt Sikhote-Alin) |

**`images fetch` (lượt cuối, tám file của bài 8–15, sau khi designer bài 1–7 xong, không chạy song song):** 115 ảnh khác nhau (gồm hình gốc bài 1–7 và chủ đề khác) · 115 hình tự vẽ · 12 hình ghép · **0 lỗi**, 0 chờ ghép, exit 0. Trang duyệt dựng lại sau lượt này: mọi hàng có hình.
- Commons trả 429 tổng 25 lần (16 khi tìm và tải thumbnail, 9 khi fetch), đều qua sau lượt chờ đầu, trừ một lượt tìm bị 429 ba lần liên tiếp thì dừng mạng, vẽ trước rồi chạy lại với nhịp 4 s.
- Openverse: 9 lượt (8 tìm, 1 thử), đã cộng vào `content/.build/images/.cache/openverse-usage.json` (nay 36).

**Còn mở, chưa chắc**
- `content/.images/index.json` từng bị ghi đè khi hai designer chạy `images fetch` cùng lúc; lượt cuối ở trên đã khôi phục đủ mục của bài 8–15.
- Hình gốc ở bài 1–7 mà bài 8–15 dùng lại đã có kiểu (ảnh/hình vẽ) khớp nhóm, trừ ba chỗ ở trên tôi đã thay bằng ảnh riêng. Nếu designer bài 1–7 đổi kiểu hình gốc (`explore_erosion`, `explore_weathering` bài 7; `quarry`, `tray_brick` bài 1; `granite` bài 2) thì chạy lại script kiểm nhóm.
- Tranh Mary cắt ngang ngực (bỏ búa và chó): phiên chính giữ 11/11.
- Ảnh nhỏ, hơi mềm trên iPad: `sandy_soil` 800×460, `tray_watermelon` sau cắt khoảng 1024×600, `tray_soil_core` sau cắt khoảng 717×358, `q1_cliffs` dải hẹp 2,5:1.
- Hình vẽ vẽ nhanh, nên xem trên máy: túi nhựa, vỏ chuối, bình tưới, nước đổ vào phễu (bài 14), cuốn sổ, bảo tàng (bài 10).

## designer 11/11 · hình bài 1–7

Theo SK-033 ("Hợp đồng ảnh", "Hình ghép", "Hình tự vẽ"), cách làm của SK-036, SK-037, SK-038, Quy ước hình và bảng Hình dùng chung ở `_topic.md`, hai bảng "Hình đổi sau rà chữ (A)", "(B)" ở trên (đã đọc lại `.md` mới nhất, dựng lại khoá bằng `images search --cache-only --out <scratchpad>`, không đụng `candidates.json` trong repo). Bài 8–15 do designer khác làm; các key gốc bài 8–15 trỏ tới đều có trong file chọn ảnh của bài 1–7. Chờ Duy duyệt; chưa build, chưa commit.

**File**
- File chọn ảnh: `content/images/discoverer/da-va-dat/{lam-quen-voi-da,nhin-ky-cac-loai-da,da-nao-cung-hon,thang-do-cung-mohs,da-nao-tham-nuoc,da-dung-lam-gi,da-bi-bao-mon-theo-thoi-gian}.json`. `SelectionSet` kiểm offline: 321 mục, 0 lỗi, mọi `same_as` tìm được, mọi file `own` có thật; mỗi câu, mỗi kệ một loại hình (script).
- Hình tự vẽ: `content/images/own/da-va-dat/b01-…` tới `b07-…` (91 file, JPEG 1024×768, sRGB, không metadata, không chữ, không số, không nét mặt người).
- Hình ghép: `content/images/composed/da-va-dat/b02-…` tới `b04-…` (23 file).
- Trang duyệt (ngoài git): `content/.build/images/da-va-dat/index-b1-7.html` và `<bài>/review.html` (mỗi hàng ba ô: đầy đủ, ô lưới 2:1, ô vuông). Đặt tên `index-b1-7.html` để không đè trang của designer bài 8–15.

**Số hình** (324 khoá, 3 chỗ trống)

| Bài | Ảnh nguồn mới | Tự vẽ | Ghép | Dùng lại (`same_as`) | Trống |
| --- | --- | --- | --- | --- | --- |
| 1 Làm quen với đá | 11 | 16 | 0 | 19 | 0 |
| 2 Nhìn kỹ các loại đá | 3 | 10 | 6 | 27 | 0 |
| 3 Đá nào cứng hơn? | 2 | 10 | 7 | 26 | 1 (`tray_play_dough`) |
| 4 Thang độ cứng Mohs | 1 | 8 | 10 | 26 | 2 (`tray_bead`, `q2_plastic`) |
| 5 Đá nào thấm nước? | 0 | 21 | 0 | 25 | 0 |
| 6 Đá dùng làm gì? | 6 | 14 | 0 | 29 | 0 |
| 7 Đá bị bào mòn theo thời gian | 11 | 12 | 0 | 21 | 0 |
| Cộng | 34 | 91 | 23 | 173 | 3 |

- Giấy phép ảnh nguồn (kể cả ảnh thành phần của hình ghép): 51 ảnh nguồn mới (50 file, một ảnh đá vôi cắt hai vùng): CC0 14, Public domain 9, CC BY 2.0 20, CC BY 2.5 2, CC BY 3.0 1, CC BY 4.0 5; cộng 12 ảnh dùng lại của chủ đề khác đã có trong cache. Không có BY-SA, NC, ND, ảnh AI, Pinterest, Rawpixel. Nguồn: Wikimedia Commons, một ảnh Openverse/Flickr (chồng gạch, CC BY 2.0, đã mở trang Flickr kiểm tay: CC BY 2.0, tác giả marc falardeau, tên "BRICKS").
- Ảnh Việt Nam: Tràng An (CC BY 4.0), nhà tường đá ong và cận cảnh tường đá ong (một ảnh khu Đường Lâm, Sơn Tây, phạm vi công cộng), cổng Đông thành nhà Hồ (phạm vi công cộng), cổng làng Mông Phụ (CC BY 2.0, cắt bỏ dấu nước chữ), lò gạch bên sông Hậu (phạm vi công cộng), động Phong Nha (CC BY 4.0). Đã loại mọi ảnh Việt Nam CC BY-SA.

**Quyết định**
- **Mạng:** Commons trả HTTP 429 quá ba lần ở ba lượt (11/11, cùng lúc designer bài 8–15 cũng tìm và tải). Theo lời dặn, mỗi lần dừng gọi mạng và vẽ trước, rồi mới gọi lại thật thưa (một lượt tìm mỗi 10–15 giây, ảnh nhỏ mỗi 5–6 giây). Vì vậy nhiều đồ vật thường ngày được vẽ thay vì tìm tiếp; khi vẽ một lựa chọn thì vẽ cả câu, khi vẽ một món thì vẽ cả kệ (Quy ước hình mục hai).
- **Bộ mẫu đá:** mọi mẫu đá, khoáng vật mới đều là hình ghép một phần: tách mẫu khỏi nền ảnh gốc (đen, xanh, xám), đặt giữa nền trắng ngà `#F7F6F4` có bóng mềm, cùng tông với ảnh đá ba-dan `tray_dark_rock` của *Núi lửa* (nền trắng của James St. John), để mọi mẫu trong một câu, một kệ cùng nền. Ba loại không có ảnh mẫu cầm tay hợp lệ (đá hoa cương xám, sa thạch có lớp, đá xà phòng) dùng ảnh cận cảnh mặt đá của James St. John, cắt theo hình một hòn đá, thêm sáng tối nhẹ. Credit ghi "Ghép" và tên ảnh gốc, giấy phép theo ảnh gốc (CC BY thì vẫn là CC BY).
- **Kệ Chơi vẽ cả kệ:** bài 6 (tám món: không có ảnh hợp lệ tường quét vôi, sân xi măng, bàn gỗ, mặt bàn bếp đá hoa cương, hàng rào tre), bài 7 (tám món: chỉ có ảnh gầu máy xúc rỗng, không có tay đục đá; Ghi chú cho hoạ sĩ bài bảy đã dặn khi đó vẽ cả kệ), bài 5 (theo brief). Kệ bài 1, 2, 3, 4 vẫn là ảnh.
- **Câu vẽ cả câu** (lựa chọn hoặc thẻ đều là hình vẽ): bài 1 w1, q2, q4, q5 và hình q6; bài 2 q1, q2 và ô `explore_look`; bài 3 w1, q1 và hình q2; bài 4 q5; bài 5 q1; bài 6 q1, q3; bài 7 q1, q3, q5.
- **Bài 5:** bộ "Bàn tay thử đá" vẽ đủ mười chín hình theo bảng (A), gồm ba lựa chọn q4 mới (cùng khay ba hòn đá sau khi nhỏ giọt, vòng vàng hoe nét dày khoanh trái, giữa, phải). Bài 3 năm hình, bài 4 `explore_heavy` và hình q6 (đá xà phòng xám xanh) như bảng (A).

**Đề xuất cho content-editor** (designer không sửa `.md`; chữ trẻ nghe không đổi trừ chỗ ghi "nhãn")

*Nhãn `[ảnh]` → `[hình vẽ]`* (nội dung tả giữ, chỉ đổi "chụp" thành "vẽ"; bỏ câu dự phòng đã hết nghĩa):
- bài 1: `w1`, `w1_cup`, `w1_chair`, `w1_basin`, `explore_materials` (`[sơ đồ ghép ảnh]` → `[hình vẽ]`: ghế, chậu, cối vẽ cạnh nhau), `q2_materials`, `q2_tools`, `q2_plants`, `q4`, `q4_pebble`, `q4_tile`, `q4_marble`, `q5_rock`, `q5_wood`, `q5_bamboo`, `q6`;
- bài 2: `explore_look`, `q1`, `q1_torch`, `q1_mirror`, `q1_magnifier`, `magnifying_glass` (từ vựng), `q2_holes`, `q2_grains`, thẻ `pumice_card`; `q2_layers` đổi từ "Dùng lại `layer`" thành `[hình vẽ]` (hai đĩa bánh lớp hồng, xanh);
- bài 3: `w1_binoculars`, `w1_sunglasses`, `q1_spoon`, `q1_water`, `q2` (bàn tay bạn nhỏ);
- bài 4: `q5_pillow`, `q5_ball`, `q5_cup`, `q5_bowl`, `geologist` (từ vựng: người lớn nhìn từ phía sau, mũ bảo hộ vàng, ba lô, giơ kính lúp soi vách đá nhiều lớp; không có búa);
- bài 5: `q1_dropper`, thẻ `groundwater_card`;
- bài 6: tám món kệ (`tray_white_wall`, `tray_laterite_wall`, `tray_steps`, `tray_wood_table`, `tray_cement_yard`, `tray_laterite_well`, `tray_worktop`, `tray_bamboo_fence`; hai món `tray_laterite_wall`, `tray_steps` đổi từ "Dùng lại" thành `[hình vẽ]`), `q3_basket`, `q3_concrete` (đổi từ "Dùng lại `tray_concrete`"), hình câu `q2`, `q4`, `q5`;
- bài 7: `explore_forces`, tám món kệ (`tray_banyan`, `tray_stream` đổi từ "Dùng lại" thành `[hình vẽ]`), `q5_cut`, `q5_bank`, `q5_dig`; `q3_stream` "Dùng lại hình `tray_stream`." (trong bài).

*Brief đổi chỗ trỏ:*
- bài 2 `q5_pebble`: "Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`." (hòn cuội của bài 1 nay là hình vẽ; câu này toàn ảnh); `alt` "A smooth stone" · "Hòn đá cuội".
- bài 4 `tray_glass_marble`: `[ảnh]` riêng (viên bi thuỷ tinh sẫm có vân vàng, CC0), không trỏ `q4_marble` bài 1 (nay là hình vẽ).
- bài 4 `mineral`: `[sơ đồ ghép ảnh]` ba mẫu của bài (thạch anh trắng, thạch anh tím, hồng ngọc) đặt cạnh nhau; brief cũ "một tinh thể trong, một khối vàng, một khối xanh lục" không có ảnh nhóm khoáng vật không nhãn.

*Sửa `alt` (và brief) cho khớp ảnh:*

| Bài · key (và chỗ dùng lại) | `alt` hiện tại | Đề xuất | Lý do |
| --- | --- | --- | --- |
| 1 `explore_around` (`tray_wall`, `q1`, bài 2 `w1`) | An old wall beside a path · Bức tường rào cũ bên lối đi | An old wall in the grass · Bức tường rào cũ giữa bãi cỏ | Ảnh tường đá xếp khô giữa bãi cỏ (CC0), không có lối đi, không phải Việt Nam |
| 1 `explore_made` (`q1_kiln`) | A brick kiln with stacks of red bricks · Lò gạch với những chồng gạch đỏ | Brick kilns by a river · Những lò gạch bên sông | Ảnh lò gạch bên sông Hậu (PD), không thấy rõ chồng gạch |
| 1 `tray_brick` (`q3_brick`, bài 6 `w3_brick`, bài 9 `q3_brick`) | A red brick · Viên gạch đỏ | Red bricks in a stack · Mấy viên gạch xếp chồng | Không có ảnh một viên gạch đơn hợp lệ; ảnh chồng gạch (CC BY 2.0) |
| 1 `tray_steps` (`q3`, bài 6 `explore_granite`, `q2_granite`, `suitable`) | Grey steps at a door · Bậc thềm màu xám trước cửa | Stone steps with a handrail · Bậc đá có tay vịn | Ảnh bậc đá hoa cương hồng xám ngoài trời (CC0); không có ảnh bậc thềm trước cửa hợp lệ |
| 1 `q3_board` | A round cutting board · Cái thớt tròn | A wooden cutting board · Cái thớt gỗ | Thớt chữ nhật có cán (CC0) |
| 1 `tray_concrete` | (giữ) | (giữ) | Ghi chú: khối bê tông rỗng có ba lỗ; nếu sợ lẫn với "đá có lỗ" bài 2 thì cần ảnh khác |
| 2 `tray_sponge` (`q5_sponge`) | A yellow sponge · Miếng bọt biển màu vàng | A kitchen sponge · Miếng bọt biển rửa bát | Ảnh bọt biển xanh, hồng (CC BY 2.0) |
| 2 `tray_log` | A cut log · Khúc gỗ đã cưa | Cut logs · Những khúc gỗ đã cưa | Ảnh mặt cắt nhiều khúc gỗ xếp chồng (CC0) |
| 2 `tray_rock_sugar` (`q5_sugar`, bài 4 món, thẻ `q2_sugar`) | A clear lump · Một cục trong suốt | Clear lumps · Mấy cục trong suốt | Ảnh cận cảnh nhiều cục đường phèn trắng trong |
| 3 `marble` (`tray_marble`, `q3_marble`, bài 5 `q3_marble`, bài 6 `w1_marble`) | A white rock with grey lines · Hòn đá trắng có vân xám | A white sparkly rock · Hòn đá trắng lấp lánh | Mẫu cẩm thạch (Murphy Marble) trắng hạt lấp lánh, không có vân xám rõ; hình vẽ bài 5 vẫn có vân xám |
| 3 `tray_eraser` | (giữ) | (giữ) | Brief "cục tẩy trắng" → "cục tẩy hồng" |
| 7 `explore_erosion` (`q4_erosion`, `erosion`, bài 8, 12, 15) | A muddy river with a worn bank · Dòng sông đục có bờ bị lở | A river with a worn bank · Dòng sông có bờ bị lở | Ảnh sông Cowpasture nước xanh đục, bờ lở ở xa (PD) |
| 7 `q5` | (giữ) | (giữ) | Ảnh bờ đất lở có rễ lộ ra, có tuyết (PD); brief thêm "có tuyết" |
| 7 `q6` | Tree roots in a cracked rock · Rễ cây trong hòn đá bị nứt | Tree roots over a big rock · Rễ cây trùm lên tảng đá lớn | Ảnh rễ cây trùm, len vào tảng đá (PD), không thấy rõ hai mảnh tách đôi |

*Brief khác:* bài 1 `explore_materials` từ ghép ảnh sang hình vẽ; bài 6 Ghi chú cho hoạ sĩ ("gần như cả bài là ảnh chụp") và bài 7 ("cả bài là ảnh chụp") viết lại theo loại hình mới.

**Còn trống** (không ghi mục trong file chọn ảnh; app vẽ hình giữ chỗ)
- Bài 3 `tray_play_dough` (cục đất nặn xám): Commons, Openverse 11/11 chỉ có ảnh đất nặn có trẻ lộ mặt hoặc nặn thành hình. Không vẽ, vì kệ bài 3 là ảnh mẫu đá (và `tray_limestone` là ảnh gốc cho bài 4, 6, 7). Hướng: (1) nhóm tự chụp một cục đất nặn xám trên nền trắng; (2) biên tập đổi món bẫy sang thứ mềm có ảnh CC0 dễ tìm, ví dụ "Tofu" · "Miếng đậu phụ" (đổi nhãn, phải sinh lại clip).
- Bài 4 `tray_bead` và thẻ `q2_plastic` (hạt cườm nhựa đỏ): chỉ có ảnh chuỗi hạt nhựa trên bàn tối (Flickr) hoặc hạt thuỷ tinh La Mã có thước "CM". Hướng: (1) tự chụp; (2) đổi món thành "Glass bead" · "Hạt cườm thuỷ tinh" dùng ảnh hạt thuỷ tinh La Mã (CC BY 2.0, cắt bỏ thước), thẻ q2 đổi "plastic" thành "glass" (đổi nhãn, sinh lại clip).

**Ảnh hưởng tới bài 8–15** (designer bài 8–15 và biên tập C xem)
- Hình gốc nay là hình vẽ (trước là `[ảnh]`): `magnifying_glass`, `geologist`, `tray_rain_limestone`, `tray_cement_yard`, `q1_water`. Designer bài 8–15 đã xử lý ba chỗ lệch kiểu (mục của họ ở trên: bài 12 `tray_cement`, bài 15 `w2_weathering`, kệ bài 15 dùng ảnh riêng); các chỗ còn lại là hình câu hay ô Học nên không trộn.
- Hình gốc đổi từ ảnh thường sang hình ghép một phần (vẫn là ảnh, giấy phép theo ảnh gốc): `granite`, `pumice`, `tray_sandstone`, `tray_slate`, `tray_pink_granite` (bài 2), `chalk`, `marble`, `tray_limestone`, `tray_soapstone` (bài 3), `tray_talc`, `tray_gypsum`, `tray_ruby`, `tray_amethyst`, `diamond`, `quartz`, `mineral` (bài 4). `explore_erosion`, `explore_weathering`, `quarry`, `tray_brick` vẫn là ảnh thường. Script kiểm nhóm của tôi coi hình ghép từ ảnh là ảnh.
- `alt` đổi theo bảng trên kéo theo bài 8 w1, bài 12, bài 15 (`explore_erosion`), bài 9 q3 (`tray_brick`).

**`images fetch`** (một tiến trình cho cả bảy file, lượt cuối): `7 file chọn ảnh · 63 ảnh khác nhau · 3 tải mới · 60 đã có · **0 lỗi**`; hình tự vẽ 91; hình ghép 23, 0 chờ ghép. Lượt đầu có hai lần HTTP 429 (lệnh tự chờ Retry-After rồi tải được). Dòng "Kiểm tay" của ảnh Flickr chồng gạch: đã mở trang Flickr, đúng CC BY 2.0, tác giả marc falardeau.
- **Cảnh báo cho phiên chính:** hai designer chạy `images fetch` cùng lúc thì `content/.images/index.json` bị ghi đè (mỗi tiến trình đọc index lúc đầu, ghi lại cả file): lượt đầu của tôi mất mục của hồng ngọc, thạch anh tím, thạch anh, kim cương (file ảnh vẫn còn), lượt hai phải tải lại ba ảnh. Trước khi `build`, nên chạy một lượt `images fetch content/images/discoverer/da-va-dat` duy nhất (không chạy song song) để chắc index đủ.
- **Openverse:** phần bài 1–7 dùng 29 lượt (9 qua `images search --out`, 18 qua script tìm thẳng, 1 lượt 504 tính vào hạn mức, 1 lượt kiểm chi tiết khi fetch). Đã cộng 28 lượt chạy ngoài bộ đếm vào `content/.build/images/.cache/openverse-usage.json` (36 → 64).
- **Commons 429:** ba lượt chạm quá ba lần Retry-After (lượt tìm đầu, lượt tìm hai, lượt tìm ba); mỗi lần dừng gọi mạng, vẽ trước, đợi rồi mới gọi lại thật thưa.

**Chưa chắc**
- Hình vẽ nhanh, nên xem trên máy: bàn tay (giữ đá phấn, cầm ống nhỏ giọt, bàn tay trên bàn) còn thô; gầu máy xúc, tay đục đá bài 7; nhà địa chất nhìn từ sau (bài 4, cũng là hình bài 15).
- Bộ mẫu đá ghép: ba mẫu "cắt theo hình hòn đá" từ ảnh cận cảnh (đá hoa cương xám, sa thạch, đá xà phòng) và hai mẫu đá vôi cắt từ vùng nhỏ của ảnh nhiều hòn (khoảng 220 px, phóng lên nên hơi mềm); đá phiến là ảnh khối đá cắt sát mép, không có viền đá đầy đủ; đá hoa cương hồng còn một mảng nền xám nhỏ bên trái; thạch anh có bóng đen sẵn trong ảnh gốc. Nếu Duy muốn ảnh mẫu cầm tay thật, cần tìm tiếp khi Commons mở (James St. John còn nhiều ảnh).
- Ảnh cần xem lại khi duyệt: vết nứt đá (bài 7 `crack`, có vài đốm trắng trên mặt đá), cây đa (bài 7 q2, có bồn cây tròn và nhà ở xa), lò gạch (bài 1, đã cắt bỏ bóng người ở xa), đống đá dăm (bài 6 q3, đã cắt nửa trên có người), gỗ xếp ở xưởng (bài 1 q1, đầu gỗ có vệt sơn đỏ, không phải chữ).
- Ảnh phạm vi công cộng do người chụp tự phát hành trên Commons (nhà tường đá ong Đường Lâm, cổng thành nhà Hồ, lò gạch sông Hậu): `images fetch` kiểm thấy nhãn Public domain ở trang gốc; nên mở trang gốc xem lại lý do PD trước khi phát hành.
- Kệ bài 6 và bài 7 nay toàn hình vẽ; nếu Duy muốn ảnh chụp thì cần đủ cả tám món mỗi kệ, không thay lẻ.

## content-editor A 11/11 · theo hình

Đã áp bảng đề xuất của designer (mục "designer 11/11 · hình bài 1–7") vào bài 1–5 và đối chiếu năm file chọn ảnh `content/images/discoverer/da-va-dat/{lam-quen-voi-da,nhin-ky-cac-loai-da,da-nao-cung-hon,thang-do-cung-mohs,da-nao-tham-nuoc}.json`:
- mục `own` có brief `[hình vẽ]`;
- mục `composed` có brief `[sơ đồ ghép ảnh]`; trong brief ghép, chỉ key là phần của hình ghép mới để trong backtick, các chỗ khác viết tên thường;
- mục `same_as` có brief "Dùng lại hình" trỏ đúng chỗ;
- mọi brief còn `[ảnh]` đều ứng với một ảnh nguồn trong file chọn ảnh, trừ món mới `tray_tofu` (còn chờ ảnh).

Không đổi dòng `id:` nào. Không thêm khối `###`; key mới chỉ là món, thẻ (`####`). Không chạy lệnh. Mỗi chỗ đổi có dòng `>` "Theo hình designer 11/11" hoặc "Main session 11/11".

**Ba chỗ trống, đã đổi món**
- **Bài 3 `tray_play_dough` → `tray_tofu`** "Tofu" · "Miếng đậu phụ", theo main session. Brief `[ảnh]` mới: miếng đậu phụ trắng hình khối, tách nền đặt trên nền trắng ngà như kệ. Đậu phụ mềm, trắng như đá phấn nên có sức hút; `messages.has_limited` "That is soft, but it is not a rock." vẫn đúng.
- **Bài 4 `tray_bead` → `tray_candle`** "Candle" · "Cây nến", dùng lại ảnh `tray_candle` ở bài `da-va-dat/da-nao-cung-hon`.
  - Không lấy "hạt cườm thuỷ tinh" designer gợi ý, vì kệ đã có viên bi thuỷ tinh: hai món bẫy cùng là thuỷ tinh, trùng ý.
  - Cây nến có sẵn ảnh, cùng kiểu kệ (tách nền, nền trắng ngà). Nến trắng, mềm như sáp, giống hoạt thạch của nhóm Mềm, nên mỗi món bẫy giống một nhóm: đường phèn giống thạch anh, bi thuỷ tinh giống kim cương, nến giống hoạt thạch.
  - Nến do con người làm ra, nên `has_limited` "People make that. It is not a mineral." vẫn đúng. Không cần tìm ảnh mới.
- **Bài 4 `q2_plastic` → `q2_glass`** "glass" · "thuỷ tinh", dùng lại ảnh `tray_glass_marble`. Câu "Rocks are made of {1}." nay có ba thẻ sugar · minerals · glass; thẻ đúng vẫn ở chỗ thứ hai.

### Hình đổi (A, lượt 2)

| Bài | Chỗ (key) | Đổi gì | Việc cho designer |
| --- | --- | --- | --- |
| 1 | `w1`, `w1_cup`, `w1_chair`, `w1_basin`, `q2_materials`, `q2_tools`, `q2_plants`, `q4`, `q4_pebble`, `q4_tile`, `q4_marble`, `q5_rock`, `q5_wood`, `q5_bamboo`, `q6` | Nhãn `[ảnh]` → `[hình vẽ]` ("chụp" → "vẽ"); bỏ câu "bài hai, bài bốn dùng lại" ở `q4_pebble`, `q4_marble` | Không (đã vẽ) |
| 1 | ô `explore_materials` | `[sơ đồ ghép ảnh]` → `[hình vẽ]` (ghế, chậu, cối vẽ cạnh nhau) | Không |
| 1 | ô `explore_around` (và `tray_wall`, `q1`, bài 2 `w1`) | Brief theo ảnh (tường đá xếp khô giữa bãi cỏ); `alt` "An old wall in the grass" · "Bức tường rào cũ giữa bãi cỏ" | Không |
| 1 | ô `explore_made` (và `q1_kiln`) | Brief theo ảnh (lò gạch bên sông Hậu); `alt` "Brick kilns by a river" · "Những lò gạch bên sông" | Không |
| 1 | món `tray_brick` (và `q3_brick`) | `alt` "Red bricks in a stack" · "Mấy viên gạch xếp chồng"; nhãn đổi (bảng chữ dưới) | Không |
| 1 | món `tray_steps` (và hình câu `q3`) | Brief theo ảnh (bậc đá hoa cương có tay vịn); `alt` đúng chữ designer "Stone steps with a handrail" · "Bậc đá có tay vịn" | Không |
| 1 | `q3_board` | Brief theo ảnh (thớt chữ nhật có cán); `alt` "A cutting board with a handle" · "Cái thớt có cán" (không ghi "wooden" vì câu hỏi là "làm bằng gì") | Không |
| 1 | món `tray_mortar` | Brief theo ảnh (cối đá trong bảo tàng); bỏ "ô `explore_materials` dùng lại" | Không |
| 2 | `explore_look`, `q1`, `q1_torch`, `q1_mirror`, `q1_magnifier`, `q2_holes`, `q2_grains`, từ `magnifying_glass`, thẻ `pumice_card` | `[ảnh]` → `[hình vẽ]` | Không |
| 2 | thẻ `q2_layers` | "Dùng lại `layer`" → `[hình vẽ]` (hai đĩa bánh lớp hồng, xanh); `alt` "Layered cakes on plates" · "Bánh nhiều lớp trên đĩa" | Không |
| 2 | `granite`, `pumice`, `tray_sandstone`, `tray_slate`, `tray_pink_granite` | `[ảnh]` → `[sơ đồ ghép ảnh]` (mẫu tách nền, nền trắng ngà; ba mẫu cắt từ ảnh cận cảnh); `alt` giữ | Không |
| 2 | món `tray_sponge` (và `q5_sponge`) | Brief theo ảnh; `alt` "A kitchen sponge" · "Miếng bọt biển rửa bát" | Không |
| 2 | món `tray_log` | `alt` "Cut logs" · "Những khúc gỗ đã cưa" | Không |
| 2 | món `tray_rock_sugar` (và `q5_sugar`; bài 4 món, thẻ `q2_sugar` "Lumps of sugar" · "Mấy cục đường phèn") | `alt` "Clear lumps" · "Mấy cục trong suốt" | Không |
| 2 | `q5_pebble` | "Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`" (trước: `q4_pebble` bài 1); `alt` "A smooth stone" · "Hòn đá cuội" | Cắt sát hòn cuội để nền cát không làm lựa chọn này nổi bật giữa hai ảnh nền trơn |
| 3 | `w1_binoculars`, `w1_sunglasses`, `q1_spoon`, `q1_water`, hình câu `q2` | `[ảnh]` → `[hình vẽ]` | Không |
| 3 | `chalk`, `marble`, `tray_limestone`, `tray_soapstone`, `tray_candle`, thẻ `q2_scratch` | `[ảnh]` → `[sơ đồ ghép ảnh]` | Không |
| 3 | `marble` (và `tray_marble`, `q3_marble`; bài 5 `q3_marble`) | `alt` "A white sparkly rock" · "Hòn đá trắng lấp lánh"; câu ví dụ đổi (bảng chữ dưới) | Không |
| 3 | món `tray_eraser` | Brief "trắng" → "hồng" | Không |
| 3 | món `tray_play_dough` → `tray_tofu` | Key mới, `[ảnh]` mới; `alt` "A white block of tofu" · "Miếng đậu phụ trắng" | **Tìm ảnh** đậu phụ (CC0 hay PD, không bao bì), tách nền, nền trắng ngà; thêm mục `tray.tray_tofu` |
| 4 | `tray_talc`, `tray_gypsum`, `tray_amethyst`, `tray_ruby`, `diamond`, `quartz` | `[ảnh]` → `[sơ đồ ghép ảnh]`; `alt` giữ khuôn "A <màu> piece" | Không |
| 4 | từ `mineral` (và thẻ `q2_minerals`) | `[sơ đồ ghép ảnh]` ba mẫu `quartz`, `tray_amethyst`, `tray_ruby`; câu ví dụ đổi | Không |
| 4 | món `tray_glass_marble` | `[ảnh]` riêng (bi thuỷ tinh sẫm vân vàng, CC0), không trỏ `q4_marble` bài 1 | Không |
| 4 | món `tray_bead` → `tray_candle` | Key mới, "Dùng lại hình `tray_candle` ở bài `da-va-dat/da-nao-cung-hon`"; `alt` "A white candle" · "Cây nến trắng" | Thêm mục `tray.tray_candle`: `same_as` `tray_candle`, `lesson` `da-va-dat/da-nao-cung-hon`; bỏ chỗ trống `tray_bead` |
| 4 | thẻ `q2_plastic` → `q2_glass` | Key mới, "Dùng lại hình `tray_glass_marble`."; `alt` "A glass marble" · "Viên bi thuỷ tinh" | Thêm mục `q2.q2_glass`: `same_as` `tray.tray_glass_marble`; bỏ chỗ trống `q2_plastic` |
| 4 | `q5_pillow`, `q5_ball`, `q5_cup`, `q5_bowl`, từ `geologist` | `[ảnh]` → `[hình vẽ]` (`geologist`: người lớn từ phía sau, mũ vàng, ba lô, kính lúp, không có búa) | Không |
| 5 | `q1_dropper`, thẻ `groundwater_card` | `[ảnh]` → `[hình vẽ]` | Không |
| 5 | `q3_marble` | `alt` theo gốc mới "A white sparkly rock" · "Hòn đá trắng lấp lánh" | Không |

**Chữ trẻ đọc hoặc nghe đã đổi** (cần sinh lại clip)
- Bài 1:
  - món `tray_brick`: "Brick" · "Viên gạch" → "Stack of bricks" · "Chồng gạch";
  - lựa chọn `q3_brick`: "brick" · "viên gạch" → "stack of bricks" · "chồng gạch".
- Bài 3:
  - món mới "Tofu" · "Miếng đậu phụ" (bỏ "Play dough" · "Cục đất nặn");
  - từ `marble` câu ví dụ: "Marble is white with grey lines." · "Đá cẩm thạch màu trắng, có vân xám." → "This marble is white and sparkly." · "Hòn đá cẩm thạch này trắng và lấp lánh."
- Bài 4:
  - món mới "Candle" · "Cây nến" (bỏ "Plastic bead" · "Hạt cườm nhựa");
  - thẻ q2 mới "glass" · "thuỷ tinh" (bỏ "plastic" · "nhựa");
  - từ `mineral` câu ví dụ: "Quartz and gypsum are minerals." · "Thạch anh và thạch cao là khoáng vật." → "Quartz, amethyst and ruby are minerals." · "Thạch anh, thạch anh tím và hồng ngọc là khoáng vật."
- VoiceOver (`alt`, không sinh clip): các `alt` đổi trong bảng trên.

**Việc của người khác**
- **B:** `alt` gốc `marble`, `tray_brick`, `tray_steps` nay đúng chữ bảng designer, khớp chỗ bài 6, bài 9 đã chép. `tray_rock_sugar` không dùng ở bài 6–10.
- **C:** bài 15 chép `alt` khoáng vật theo khuôn "piece" (đã ghi ở mục "sửa theo tester"); bài 12 món bẫy `tray_road` không đổi.
- **Topic editor:** bài 3 bẫy là đậu phụ, nến, tẩy; bài 4 bẫy là đường phèn, bi thuỷ tinh, nến (cây nến dùng chung hai bài); thêm vào bảng Hình dùng chung "3 · `tray_candle`" (dùng lại ở 4) và "4 · `tray_glass_marble`" (thẻ q2).

## content-editor C 11/11 · theo hình designer (bài 11–15)

Áp bảng "Đề xuất cho content-editor" của "designer 11/11 · hình bài 8–15" và đối chiếu từng khoá với file chọn ảnh (`own` thành `[hình vẽ]`, `composed` thành `[sơ đồ ghép ảnh]`, `same_as` thành "Dùng lại hình …" đúng chỗ). Số brief sau sửa (ảnh · hình vẽ · ghép · dùng lại) khớp đúng bảng số hình của designer: bài 11: 4 · 25 · 3 · 14; bài 12: 11 · 9 · 0 · 31; bài 13: 3 · 17 · 0 · 31; bài 14: 3 · 23 · 1 · 19; bài 15: 12 · 2 · 0 · 37. Không đổi dòng `id:`, không chạy lệnh. Mỗi chỗ đổi có dòng `>` "Theo hình designer làm 11/11" trong bài; Ghi chú cho hoạ sĩ của năm bài viết lại theo loại hình mới.

**Đã đổi**
- Bài 11:
  - kệ Chơi chín món, câu q3 (lá khô, vỏ chuối, rễ), thẻ q2 (bùn mịn, chất hữu cơ là hình vẽ riêng), câu q5 (bóng bay, xà phòng), từ `clay`, thẻ `spoon_soil_card`: sang `[hình vẽ]`;
  - `w1_toy`, `w1_coin`: hình ghép tách nền; `explore_rock_bits`: lưới hai hàng hai cột, thành phần bùn mịn là `q2_silt`;
  - `soil`: `alt` "Garden soil in a hand" · "Nắm đất vườn trong lòng bàn tay" (tay không găng), chép vào mọi chỗ dùng lại ở bài 11, 12, 13, 15;
  - `silt`: brief, `alt` theo ảnh (bùn ở lòng hồ cũ): "Smooth grey silt" · "Lớp bùn mịn màu xám"; `q6`: luống cải, không bắt buộc ảnh Việt Nam.
- Bài 12:
  - `tray_cement`: ảnh riêng mặt sân xi măng, bỏ "Dùng lại `tray_cement_yard`";
  - `q4` (cành cà phê): `[hình vẽ]`;
  - `alt` mới: `q6` "A handful of soil in a hand" · "Nắm đất trong lòng bàn tay"; `tray_orchard`, `q3_fruit` "Rows of fruit trees" · "Vườn cây ăn trái"; `tray_watermelon`, `q1_watermelon` "A watermelon growing in a field" · "Quả dưa hấu mọc trên ruộng"; `tray_tiles` "A floor of red bricks" · "Nền gạch đỏ"; `explore_alluvial`, hình câu q3 chép `alt` mới của `explore_erosion` (B sửa).
- Bài 13: kệ Chơi bảy món riêng (kể cả giun đất, đất nứt nẻ: vẽ riêng, không dùng ảnh), câu q3 bốn lựa chọn, câu q6 đồi thông: sang `[hình vẽ]`; `explore_climate`: brief theo ảnh (Bangladesh).
- Bài 14: `q1_thermometer`: `[sơ đồ ghép ảnh]`; hình câu q5: `[hình vẽ]`; `q5_silt`: dùng lại `q2_silt` bài 11; `w1_mosquito`: `[ảnh]` (ảnh CDC cắt sát, mục ảnh riêng trong file chọn ảnh); `paddy_card`: ruộng bậc thang Sơn La, `alt` "Rice terraces in the hills" · "Ruộng lúa bậc thang".
- Bài 15:
  - `w1_clay`, `w1_sandy`, `w1_garden`: dùng lại `q4_grey`, `q4_pale`, `q4_dark` bài 12. `alt` chỉ giữ màu ("A handful of grey soil" · "Nắm đất màu xám"…), không chép nguyên gốc vì gốc tả cỡ hạt, mà câu hỏi về độ thấm (Quy ước hình mục năm; có dòng `>`);
  - `w2_weathering`, `tray_rock_layers`, `q1_watering`, `q5_stones`: ảnh riêng; `w2_erosion` chép `alt` mới của bài 7;
  - `tray_forecast`: dùng lại `weather_box` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`, `alt` chép gốc;
  - `explore_samples`: `[hình vẽ]`; `tray_soil_core`, từ `geology`: `alt` "Long tubes of soil in a tray" · "Những ống mẫu đất dài trong khay"; `q6`: nền sáng, `alt` "A dark rock with many dents" · "Hòn đá sẫm màu có nhiều vết lõm" (ảnh không chụp trong bảo tàng).

**Chữ trẻ nghe đã đổi** (cần sinh lại clip nếu đã chạy TTS)
- Bài 12 món Chơi: "Riverside orchard" · "Vườn cây ăn trái ven sông" thành "Fruit orchard" · "Vườn cây ăn trái" (ảnh không thấy sông).
- Bài 15 món Chơi: "Studying a rock face" · "Quan sát vách đá" thành "Studying rock layers" · "Xem các lớp đá" (ảnh vách đá nhiều lớp, không có người).
- Còn lại chỉ là `alt` (VoiceOver đọc), liệt kê ở trên.

**Cần Duy xem:** ảnh `soil` và ảnh câu q6 bài 12 là tay không đeo găng (không có ảnh hợp lệ), trong khi mục An toàn dặn cầm đất thì đeo găng; chữ bài 12, 14 vẫn dặn đeo găng.

## Tạm dừng lần 2 (main session 11/11, Duy: "hết usage rồi, tạm dừng đi")
- Chữ 15 bài: đã sửa theo hai tester; `validate` 0 lỗi trước lượt khớp hình.
- Hình: hai designer xong (bài 1–7: 3 ô trống đổi món; bài 8–15: 0 trống, hổ phách đã thay ảnh Baltic CC0).
- Khớp brief/alt theo hình: B (6–10) và C (11–15) xong. A (1–5) bị dừng ở bước rà cuối: lượt sau đọc mục "## content-editor A …" trong ticket và bài 1–5, làm nốt (bảng designer bài 1–7, đổi món `tray_play_dough` → đậu phụ và hạt cườm nhựa bài 4, sửa `alt` gốc `marble`, `tray_brick`, `tray_steps`).
- Sau đó: designer gắn ảnh cho món mới của A; main session chạy `ids`, `validate`, một lượt `images fetch content/images/discoverer/da-va-dat` (không chạy song song), TTS `da-va-dat` (bị dừng giữa chừng, chạy lại tiếp được), build gói 7 chủ đề, `check-pack`, Release, cài iPhone.
- Chờ Duy: hai ảnh tay cầm đất không đeo găng (`soil`, bài 12 q6) trong khi chữ dặn đeo găng.

## designer 12/11 · hình bài 1–7 theo bảng (A, lượt 2)
- Bài 3 `tray.tray_tofu`: hình ghép một phần `b03-tray.tray_tofu.jpg`. Lấy một ô của tấm đậu phụ lớn trong ảnh "Northern tofu" (CC0, Commons, không có chữ), bo góc, đặt trên nền trắng ngà như các mẫu đá của kệ. Ảnh "Soft tofu" bị loại vì miếng đậu có in chữ Hán.
- Bài 4: `tray.tray_candle` trỏ `tray_candle` của bài 3, `q2.q2_glass` trỏ `tray.tray_glass_marble`. Đã bỏ `tray_bead` và `q2_plastic`.
- Bài 2 `q5_pebble`: hình ghép riêng `b02-q5.q5_pebble.jpg`, cắt hòn cuội của *Hô hấp* (`w1_stone`, CC0) theo viền, bỏ nền cát, đặt trên nền trắng ngà.
- `images fetch content/images/discoverer/da-va-dat` (cả chủ đề, một tiến trình, không ai chạy song song): 15 file · 158 ảnh · 201 hình tự vẽ · 31 hình ghép · 0 chờ ghép · **0 lỗi**. Bài 1–7 không còn chỗ trống (324 khoá). Thêm 2 lượt tìm Commons, không có 429; không dùng Openverse.
