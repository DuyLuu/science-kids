# SK-038 · Soạn chủ đề Discoverer #5 "Thời tiết và thiên tai ở Việt Nam" (5 bài)

Trạng thái: review · Ngày: 2026-11-11 · Phụ trách: content-editor (soạn), designer (hình), main session chạy lệnh · Tester: tester
Nguồn: Duy 11/11 ("Giao tiếp"); syllabus.md mục 8 (pilot); syllabus-lessons.md mục 5; `content/TEMPLATE.md`; SK-031, SK-032, SK-036, SK-037 làm mẫu

## Mục tiêu
Chủ đề thứ năm của pilot có đủ 5 bài chơi được trong app, có hình, tiếng EN và VI.

## Phạm vi
- **content-editor:** `content/discoverer/thoi-tiet-va-thien-tai/_topic.md` rồi soạn 5 bài:
  1. Nắng, mưa, gió, mây · Kinds of weather
  2. Đo thời tiết: nhiệt kế, đo mưa, hướng gió · Measuring the weather
  3. Mùa mưa bão ở Việt Nam · Storm season in Vietnam
  4. Lũ lụt và hạn hán · Floods and droughts
  5. An toàn khi có bão lũ · Staying safe in storms and floods
- **designer, main session, tester:** như SK-036.

## Ngoài phạm vi
- Bản đồ Việt Nam (chờ Duy chốt cách dùng bản đồ nhà nước, xem SK-033 `explore_vietnam`).
- Duyệt chuyên môn khí tượng.

## Tiêu chí nghiệm thu
- [ ] Như SK-036 (TEMPLATE, hình mọi chỗ, `validate`, `build`, `check-pack`, chơi được trên iPhone).
- [ ] Rút kinh nghiệm SK-036, SK-037 ngoài các luật của SK-036:
  - thẻ đúng của câu `fill_blank_bank` xáo vị trí (app không xáo);
  - đáp án đúng không là hình duy nhất bé đã thấy ở màn Học trong khi lựa chọn sai là hình mới;
  - nhãn lựa chọn trong một câu cùng dạng câu, cùng số vế, cùng số ít/nhiều;
  - một kệ Chơi, một câu chỉ một loại hình; món bắt buộc chỉ vẽ được thì cả kệ vẽ;
  - hình dùng chung giữa các chủ đề ghi "Dùng lại hình `key` ở bài `chủ-đề/slug`", trỏ thẳng hình gốc;
  - chuỗi `.en` không có dấu tiếng Việt.
- [ ] Không có bản đồ Việt Nam; cảnh bão lũ không người bị thương, không xác, không nhà sập đổ gây sợ; an toàn nói bằng việc bé làm được (nghe người lớn, tránh xa nước lũ, dây điện).
- [ ] Nối với *Bề mặt Trái Đất* (động đất, sóng thần đã học) và *Hô hấp*/*Não bộ* khi hợp; không lặp ý.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở
**Phụ thuộc:** SK-030, SK-033.

**Quyết định đã ghi:** slug thư mục `thoi-tiet-va-thien-tai` (main session 11/11).

**Câu hỏi còn mở**

## content-editor 11/11

Phạm vi: chỉ viết trong `content/discoverer/thoi-tiet-va-thien-tai/`. Không sửa `content/TEMPLATE.md`, file dùng chung, thư mục chủ đề khác (kể cả `da-va-dat/` đang soạn song song). Không chạy lệnh: chưa chạy `validate`, `ids`. Mọi file `ai_draft: true`, mọi dòng `id:` để trống.

**File**
- `content/discoverer/thoi-tiet-va-thien-tai/_topic.md`: frontmatter (`order: 5`, `strand: earth_sky`, `level: 2`, difficulty 2-1-2-2-2 = chín điểm), bảy misconception, kế hoạch năm bài, "không lặp ý" với năm chủ đề khác, bảng Tên gọi, Quy ước hình (chín mục), bảng Hình dùng chung, bảng Đúng/Sai, bảng Vị trí đáp án (có cột thẻ `fill_blank_bank`), luật khi soạn, bảng Khởi động, câu "Em nghĩ sao?", lời Na năm câu sáu, thẻ thưởng `set: weather`, An toàn, Để dành, Đề xuất, Còn mở.
- `01-nang-mua-gio-may.md` (`opener`), `02-do-thoi-tiet.md` (`core`), `03-mua-mua-bao.md` (`core`), `04-lu-lut-va-han-han.md` (`apply`), `05-an-toan-khi-co-bao-lu.md` (`review`).

**Chạy `ids` theo thứ tự:** `_topic.md`, bài một, bài hai, bài ba, bài bốn, bài năm. Khởi động trỏ bài trước trong chủ đề: bài hai w1 → bài một; bài ba w1 → bài hai, w3 → bài một; bài bốn w1 → bài ba, w3 → bài một; bài năm w1, w2 → bài bốn. Trỏ ra ngoài (đều đã có id): bài một w2 → `ho-hap/vi-sao-ta-phai-tho`; bài hai w2 → `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`; bài ba w2 và bài năm w3 → `be-mat-trai-dat/dong-dat-va-song-than`; bài bốn w2 → `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`.

**Tóm tắt từng bài**

| Bài | Ba ý chính | Misconception (q6) | Câu 6, lời Na · đáp án |
| --- | --- | --- | --- |
| 1 Nắng, mưa, gió, mây | ngoài trời có nắng, mưa, gió, mây; gió là không khí đang chuyển động; mây là giọt nước li ti | `trees_make_wind` | "The trees are waving. They are making the wind." · Na chưa đúng |
| 2 Đo thời tiết | nhiệt kế đo không khí nóng lạnh; ống đo mưa đo mưa nhiều ít; cảm giác thay đổi nên dùng dụng cụ | `feel_tells_temperature` | "I just ran, so I feel hot. The air got hotter!" · Na chưa đúng |
| 3 Mùa mưa bão | bão mang gió rất mạnh, mưa rất to; nhiều bão từ biển vào trong mùa mưa; người dự báo theo dõi, báo trước | `calm_means_storm_over` | "The wind suddenly stopped. I will still stay inside." · Na nói đúng |
| 4 Lũ lụt và hạn hán | lũ là nước tràn chỗ thường ngày khô; hạn hán là mưa quá ít trong thời gian dài; mưa ở nơi xa làm sông ở đây dâng lũ | `flood_only_where_it_rains` (misconception chính) | "It is sunny here. But the river can still flood." · Na nói đúng |
| 5 An toàn khi có bão lũ | trước bão nghe người lớn và tin tức; trong bão ở trong nhà, tránh cửa kính; tránh nước lũ và dây điện đứt | `shallow_floodwater_safe` | "The flood water is only ankle-deep. So I can play in it." · Na chưa đúng |

- Hai misconception không gắn key: `clouds_are_smoke` (bài một: ý ba, câu q2 với thẻ khói, bông), `drought_is_one_hot_day` (bài bốn: ý hai, câu q2 với thẻ nắng).
- Mỗi bài: Học bốn ô `explore_groups` + `word_list` ba từ core; Chơi `build_tray` ba nhóm `required`, một nhóm `limit`, tám đến chín món; Quiz DOK 1·1·2·2·2·3, đủ bốn format app 0.1.0 hiện được; từ vựng năm từ (ba core, hai extra). Không dùng `order_sequence`, `picture_bar_chart` (ba ống đo mưa ở bài hai, phong cảnh đánh dấu chỗ ở bài bốn là hình vẽ trong câu `single_choice`, nhãn theo vị trí hoặc tên chỗ, không theo màu).
- Phần Chơi: bài một tìm dấu hiệu nắng, mưa, gió (bẫy quạt bàn, vòi sen, đèn bàn: "thời tiết là ở ngoài trời"); bài hai bộ đồ đo thời tiết (bẫy phích, ô, quạt: "không dùng để đo"); bài ba bão mang tới gì (bẫy dung nham, mặt đất rung lắc của *Bề mặt Trái Đất*, nắng chói); bài bốn lũ, hạn, trữ nước (bẫy vòi chảy mãi, ống rò, xịt nước ra đường); bài năm việc an toàn trước, trong, sau bão (bẫy trú dưới gốc cây to, đứng cạnh cửa kính, lội nước lũ).
- Thẻ thưởng (bộ mới `set: weather`): đám mây trắng khổng lồ, lều khí tượng, bão được đánh số, mùa nước nổi, túi đồ phòng bão.
- Câu "Em nghĩ sao?" (`think_first`, ở Ghi chú cho dev bài một): "It is sunny here. Can the river flood?"; bài bốn dạy ở q6, bài năm hỏi lại ở w2 (Sai).

**Đáp án Đúng/Sai** (tám Đúng, tám Sai; câu sáu Sai, Sai, Đúng, Đúng, Sai; mỗi bài có cả hai)

| Bài | Câu | Đáp án |
| --- | --- | --- |
| 1 | q5 "A kite needs wind to fly high." | Đúng |
| 1 | q6 | Sai |
| 2 | w2 "Nerves carry a message from your skin to your brain." | Đúng |
| 2 | q5 "A rain gauge works well under a big tree." | Sai |
| 2 | q6 | Sai |
| 3 | w2 "An earthquake under the sea can make a tsunami." | Đúng |
| 3 | w3 "Trees make the wind by waving their branches." | Sai |
| 3 | q5 "A blue sky today means tomorrow will be sunny, too." | Sai |
| 3 | q6 | Đúng |
| 4 | w3 "Rain is water that falls from clouds." | Đúng |
| 4 | q5 "A lake full of water is a flood." | Sai |
| 4 | q6 | Đúng |
| 5 | w2 "A river can only flood when it rains right here." | Sai |
| 5 | w3 "In an earthquake, stay away from windows." | Đúng |
| 5 | q5 "Storm wind is air that moves very fast." | Đúng |
| 5 | q6 | Sai |

Mọi câu Đúng/Sai viết dạng khẳng định, không có "not", "cannot". Hai câu sáu Na nói đúng khác kiểu (bài ba Na thận trọng; bài bốn Na lập luận từ dấu hiệu).

**Vị trí đáp án đúng** (theo thứ tự `####` trong file)

| Bài | `single_choice` | `multi_choice` | Thẻ đúng `fill_blank_bank` |
| --- | --- | --- | --- |
| 1 | w1 2, w2 3, q1 1, q4 1 | q3: 1, 3 | q2: 3 |
| 2 | w1 3, q1 2, q4 3 | q3: 2, 4 | q2: 1 |
| 3 | w1 1, q1 2, q4 3 | q3: 1, 2 | q2: 2 |
| 4 | w2 3, q1 2, q4 1 | q3: 3, 4 | w1: 1; q2: 3 |
| 5 | w1 2, q1 1, q4 2 | q3: 2, 3 | q2: 3 |

Mười sáu câu một đáp án: 5 · 6 · 5. Sáu thẻ đúng: 2 · 1 · 3. Gộp: 7 · 7 · 8. Không bài nào theo chu kỳ; năm câu nhiều đáp án ở năm cặp khác nhau.

**Đối chiếu tiêu chí SK-038** (biên tập tự kiểm bằng mắt và bằng grep, chưa có `validate`)
- Hình mọi chỗ: 221 khối có hình, mỗi khối đủ `image.brief` + `alt.en` + `alt.vi`; 22 brief `[ảnh]` đều có "Từ khoá tìm ảnh (EN)"; một brief `[sơ đồ ghép ảnh]` (bài bốn `explore_seasons`); còn lại `[hình vẽ]` hoặc "Dùng lại hình …".
- Thẻ đúng `fill_blank_bank` xáo vị trí (bảng trên, có cột thẻ trong `_topic.md`).
- Đáp án đúng không là hình duy nhất bé đã thấy ở màn Học trong khi lựa chọn sai là hình mới: mỗi câu dùng hình ô Học thì có ít nhất một lựa chọn sai cũng đã gặp (ví dụ bài một q4 ba ảnh ô Học; bài bốn q1 ảnh lũ và ảnh hạn của ô Học; bài hai q1 nhiệt kế ô Học, phích và quạt của phần Chơi). Ngoại lệ cần xem: mục "Còn chưa chắc" 3.
- Nhãn trong một câu cùng dạng, cùng số vế, cùng số ít hay nhiều (bài ba q4 ba nhãn hai vế "mưa, cây"; bài ba q3 bốn nhãn hai chữ; bài một q1 ba nhãn tính từ + danh từ số ít).
- Một câu, một kệ một loại hình; món chỉ vẽ được thì cả câu, cả kệ vẽ (dụng cụ đo có chữ số trên vạch chia nên vẽ; cảnh có trẻ ở bài năm vẽ; kệ bài hai vẽ lại quạt bàn thay ảnh của bài một). Ghi ở Quy ước hình mục hai và Ghi chú cho hoạ sĩ từng bài.
- Hình dùng chung trỏ thẳng hình gốc (kể cả cánh diều trỏ `ho-hap/vi-sao-ta-phai-tho`, không qua bài một); đã đối chiếu với file chọn ảnh của *Bề mặt Trái Đất*, *Khủng long*, *Hô hấp*, *Não bộ*: mọi key được trỏ tới đều có.
- Chuỗi `.en` không có dấu tiếng Việt (grep 0 kết quả): "Tet", "banh chung", "Mekong Delta".
- Không có bản đồ Việt Nam: ảnh vệ tinh cơn bão chỉ có mây và biển (dùng lại ảnh Nam Đại Tây Dương của *Khủng long*); màn hình ti vi, mắt bão, tranh "Mưa ở nơi xa" không có đất liền hay tên nơi chốn.
- Cảnh bão lũ không người bị thương, không xác, không nhà sập: nhà cửa luôn nguyên vẹn, cửa đóng; không ai trong nước sâu; dây điện đứt không tia lửa, không ai chạm. An toàn là việc bé làm được (nghe người lớn và tin, cất đồ vào nhà, đèn pin, ở trong nhà, tránh cửa kính, tránh nước lũ, tránh dây điện, báo người lớn).
- Nối chủ đề khác qua Khởi động, không lặp ý: *Bề mặt Trái Đất* (bài ba w2 sóng thần do động đất, không do bão; bài năm w3 tránh cửa kính khi động đất, mở sang bão; bài bốn w2 dòng sông), *Hô hấp* (bài một w2 hà hơi vào kính lạnh, nối sang "mây là giọt nước"; bài hai q6 dùng ảnh chạy chơi), *Não bộ* (bài hai w2 da gửi tin về não, nối sang cảm giác nóng lạnh).
- Mỗi câu EN tối đa mười từ (kiểm cả gợi ý, giải thích, lời nhắn, ví dụ, nhãn, thẻ thưởng; câu hai vế tách hai câu).
- Hint không nói đáp án, không nhắc chữ nhãn đáp án kể cả chữ VI (bài ba q1 gọi ô bằng ảnh, không gọi tên ô "Mùa mưa bão" vì đáp án là "mùa mưa"); `has_limited` nói lý do, không nhắc chạm; nhãn `limit` dạng "Not …" · "Không …"; nhãn nhóm không có dấu phẩy; `messages.full` và nhãn câu sáu đúng chữ chung.
- Ô Học không chứa sẵn kết luận của câu sáu (rút kinh nghiệm SK-036 N2): ô Mắt bão không nói "ở yên trong nhà"; ô Mưa ở nơi xa không vẽ làng nắng; ô Cảm giác không có ví dụ chạy; ô Nước lũ không nói "kể cả khi nông".

**[CẦN KIỂM]** (chi tiết ở dòng `>` ngay dưới từng trường; không có trong giá trị)
- *Tổng quát:* CT GDPT 2018 Tự nhiên và Xã hội lớp hai về thời tiết, thiên tai; Piaget và ý "cây làm ra gió"; tên "ống đo mưa", "ống gió", "bão lớn" (typhoon); mùa mưa, mùa khô ở miền Bắc; mọi lời khuyên an toàn theo cơ quan phòng chống thiên tai Việt Nam.
- *Bài một:* mây là giọt nước (mây cao là băng); lớp mờ trên kính là giọt nước; Mặt Trời sưởi mặt đất rồi không khí; diều cần gió (chạy kéo cũng tạo luồng gió); hôm nắng phơi áo mau khô nhất; đám mây nặng bằng một trăm con voi.
- *Bài hai:* nhiệt kế đo không khí đặt trong bóng râm, chất lỏng đỏ, đơn vị độ; ống đo mưa thành thẳng, đặt chỗ trống, ống chai nhựa; đuôi ống gió chỉ xuôi gió; tắm mát xong thấy mát dù không khí không đổi; tán cây làm đo sai; chạy xong không khí không nóng lên; lều khí tượng.
- *Bài ba:* mùa bão (tháng, miền), bão hình thành trên biển ấm; cơ quan dự báo, vệ tinh, ra-đa; bão gây sóng lớn, nước dâng, không gây sóng thần; mắt bão và gió đổi hướng; loa phát thanh báo bão; dịp Tết rơi vào mùa khô; cách đánh số bão ở Việt Nam.
- *Bài bốn:* lũ hạ lưu khi trời nắng; hạn hán, nước mặn lấn vào sông (chỉ ở ghi chú); chỗ trũng ven sông ngập trước; một vùng gặp cả lũ và hạn trong năm; mùa nước nổi (tháng, phù sa, "nhà nông mong").
- *Bài năm:* ba lời khuyên ý chính; không trú dưới gốc cây to; nước lũ chảy xiết, mang mầm bệnh, mười lăm xăng-ti-mét nước chảy đã làm ngã (chỉ ở ghi chú); dây điện đứt và vũng nước gần đó; phòng phía trong, không ra ban công; gió bão đẩy mạnh vào cây, mái nhà; danh sách túi đồ phòng bão.

**Hình** (designer xem Ghi chú cho hoạ sĩ của từng bài)
- Ảnh cần tìm mới: hai mươi hai (bài một mười chín, bài hai một, bài bốn hai). Hình tự vẽ mới: khoảng bảy mươi hai (bài một 1, bài hai 16, bài ba 16, bài bốn 19, bài năm 20). Hình ghép: một. Phần còn lại dùng lại hình của chủ đề khác hoặc trong chủ đề.
- Khó tìm, đã ghi phương án:
  - bài một: thóc phơi trên sân không người; đèn bàn, quạt, vòi sen hay có logo; ớt phơi trên nia; nếu một món kệ Chơi hay một lựa chọn q1, q2, q3 phải vẽ thì vẽ cả kệ, cả câu;
  - bài bốn: ảnh lũ không người (`explore_flood`); nếu phải vẽ thì vẽ cả ba lựa chọn q1; ảnh mùa nước nổi;
  - bài hai: lều khí tượng (thẻ thưởng), nhiều ảnh PD nhưng hay có biển chữ.
- Hình tự vẽ dùng chung giữa các bài (vẽ một lần): dụng cụ đo của bài hai (dùng lại ở bài ba), ti vi dự báo và cảnh bão của bài ba (dùng lại ở bài bốn, năm), chum, vòi nước, ống rò của bài bốn (dùng lại ở bài năm).

**Đề xuất cho người khác**
- **ios-dev:** khoá `collectible.set.weather` "Weather cards" · "Thẻ thời tiết" (chưa có thì app hiện "Thẻ"). Nếu Duy muốn dùng `set: earth` có sẵn thì biên tập đổi năm dòng `set:`.
- **PM:** ghi `level` cho `new-weather` (chín điểm, Mức 2; mười điểm, Mức 3 nếu chấm A = 3 hoặc D = 3); bốn chủ đề trước đều Mức 3, xem lại quy tắc "Mức không giảm".
- **dev:** không cần sửa gì. Nghe thử giọng EN "thermometer", "gauge", "windsock", "drought", "typhoon", "TV".

**Còn chưa chắc**
1. **Mức** 2 hay 3 (trên).
2. **Bộ thẻ** `weather` mới hay dùng chung `earth`.
3. **Bài một q3 và bài năm q3:** mỗi câu có một đáp án đúng là hình của phần Chơi (thóc phơi; cất đồ vào nhà), ba hình kia mới. Luật SK-038 nói về màn Học nên biên tập giữ; nếu tester thấy vẫn là gợi ý bằng hình, bài một đổi "rice in the yard" thành "firewood in the yard" · "củi để ngoài sân" (ảnh mới), bài năm vẽ riêng hình "cất đồ vào nhà" khác góc.
4. **Bài hai q2:** câu "A windsock shows which way the {1} blows." có chữ "blows" nên dễ; hai thẻ sai (mưa, nắng) yếu. Giữ vì là câu DOK một, ôn ba kiểu thời tiết; tester xem.
5. **Kệ lệch:** bài hai 1-2-2, bài ba 2-2-1, bài năm 2-1-2 (cố ý, như *Não bộ* bài hai).
6. **Bài năm phần Chơi** chia theo trước, trong, sau bão: "Ở yên trong nhà" cũng đúng trước và sau bão, nhưng app chỉ cho mỗi món một nhóm. Nhờ tester xem trên máy bé có thấy lạ không.
7. **Số từ EN màn Học** khoảng ba mươi mốt đến ba mươi lăm (như các chủ đề trước; bài năm cao nhất vì mục tiêu mười từ).
8. **Giông sét, sạt lở đất** chưa dạy (mục Còn mở ở `_topic.md`).
9. **Vai của hình dụng cụ đo** (bài hai, ba): một dụng cụ đúng ở nhóm của nó và là lựa chọn sai khi câu hỏi hỏi dụng cụ khác. Biên tập hiểu đó không phải "hai vai trái nhau" (cùng một ý "đo mưa"); vẫn tránh dùng ống đo mưa làm lựa chọn sai trong bài hai.
10. Chưa chạy `validate`; phiên chính chạy rồi gửi lại dòng lỗi, biên tập sửa.

## Rà chữ (tester 11/11)

Phạm vi: đọc `_topic.md` và năm bài của `content/discoverer/thoi-tiet-va-thien-tai/`; đọc đối chiếu `content/discoverer/be-mat-trai-dat/`, `ho-hap/`, `nao-bo-va-giac-quan/`, `khung-long/` ở những chỗ chủ đề này trỏ tới. Không sửa file nội dung, không chạy `tts`/`build`/`import`/`ids`, không dùng simulator, không rà `da-va-dat/`. `validate` do phiên chính chạy (0 lỗi), không chạy lại.

Chuẩn đối chiếu: `content/TEMPLATE.md`, `content/rules.json` (`discoverer.authoring`), tiêu chí SK-038 và SK-036, luật riêng trong `_topic.md`, mọi lỗi tester đã bắt ở SK-036 và SK-037, an toàn với trẻ bảy tới chín tuổi, và độ đúng khoa học ở mức phổ thông. Ngoài đọc tay, chạy sáu script kiểm cấu trúc trong scratchpad (không phải test sản phẩm): (1) mỗi câu — format, DOK, số lựa chọn, vị trí đáp án, key misconception, số từ EN mỗi câu, chỗ thiếu hình; (2) mọi `Dùng lại hình` — key có thật, từ khoá và `alt` chép đúng của gốc, không trỏ qua một hình dùng lại khác; (3) nguồn hình từng lựa chọn (mới · Học · Chơi · bài khác) để tìm chỗ đáp án lộ bằng hình; (4) loại hình thật của từng lựa chọn sau khi lần hết chuỗi dùng lại, theo câu và theo kệ; (5) chữ `.en` có dấu tiếng Việt, chữ `.vi` có chữ số hay ký hiệu, `messages.full`, nhãn `limit`, dấu phẩy ở nhãn nhóm, số từ vựng, luật Đúng/Sai; (6) gợi ý có nhắc chữ của nhãn đáp án, và độ dài nhãn đúng so với nhãn sai.

**Tổng kết: chặn 1 · nên sửa 8 · nhỏ 16.**

### Đạt (đã kiểm bằng máy, không có lỗi)
- Quiz sáu câu mỗi bài, DOK 1·1·2·2·2·3 (Discoverer 2·3·1), câu một DOK 1, đúng một câu misconception mỗi bài ở q6, năm key đều có thật trong `_topic.md` và không key nào gắn ở Khởi động. Mỗi bài đủ bốn format; không dùng `order_sequence`, `picture_bar_chart`. `single_choice` ba lựa chọn, `multi_choice` bốn, `fill_blank_bank` ba thẻ. Khởi động hai tới ba câu, DOK một, câu nào cũng có `recall_from`; bốn bài ngoài chủ đề được trỏ tới đều đã có `id`.
- **Vị trí đáp án khớp đúng từng ô của bảng "Vị trí đáp án đúng"** (`_topic.md:253-257`), kể cả cột thẻ `fill_blank_bank` — đây là chỗ SK-037 bị lọt. Đếm máy: mười sáu câu một đáp án 5 · 6 · 5, sáu thẻ đúng 2 · 1 · 3, gộp 7 · 7 · 8; năm câu `multi_choice` ở năm cặp khác nhau; không bài nào theo chu kỳ.
- Đúng/Sai khớp bảng `_topic.md:230-245`: tám Đúng, tám Sai, câu sáu Sai · Sai · Đúng · Đúng · Sai, mỗi bài có cả hai. Không câu đáp án Sai nào có `explanation_correct` mở đầu "Yes!" · "Đúng rồi!"; mọi `explanation_wrong` đúng khuôn "This is false"/"is not right" và "This is true"/"is right"; không câu Đúng/Sai nào có "not", "cannot", "never".
- **221 chỗ có hình, không chỗ nào thiếu** `image.brief` + `alt.en` + `alt.vi`. Đếm máy đúng con số biên tập ghi: 22 `[ảnh]` (19 · 1 · 0 · 2 · 0), 72 `[hình vẽ]` (1 · 16 · 16 · 19 · 20), một `[sơ đồ ghép ảnh]`, 126 "Dùng lại hình".
- **126 chỗ "Dùng lại hình": không chỗ nào sai.** Mọi key có thật (kể cả 31 hình của bốn chủ đề khác), không chỗ nào trỏ qua một hình dùng lại khác, từ khoá và `alt.en`, `alt.vi` chép đúng từng chữ của hình gốc. Đây là chỗ SK-037 có bốn lỗi.
- **Một câu một loại hình, một kệ một loại hình:** lần hết chuỗi dùng lại thì 27 câu có lựa chọn và năm kệ Chơi đều thuần một loại (xem bảng dưới). Không chỗ nào có một hình vẽ lạc giữa ảnh chụp hay ngược lại.
- Không hình nào mang hai vai trái nhau trong một bài; không hai câu nào trong một bài dùng chung một hình **lựa chọn**.
- Không câu EN nào quá mười từ (kiểm cả `hint`, `explanation`, `examples`, `label`, `fact`, `messages`). Chuỗi `.en` không có dấu tiếng Việt ("Tet", "banh chung", "Mekong" đều viết không dấu). Chuỗi `.vi` không có chữ số, ký hiệu, dấu "—" (sáu chỗ máy báo đều là `{1}` của câu điền từ, đúng cú pháp).
- `messages.full` đúng chữ chung ở cả năm bài; năm nhãn `limit` đều dạng "Not …"/"Does not …" · "Không …" và không gọi tên món bẫy; `has_limited` nói lý do, không nhắc chạm; nhắc thiếu nhóm đều "You still need…" · "Em còn thiếu…"; không nhãn nhóm nào ở Học hay Chơi có dấu phẩy.
- Từ vựng: năm từ mỗi bài, đúng ba `core`, `term_keys` khớp ba từ `core`. Màu nhóm: bốn màu khác nhau trong mỗi khối, `do_son` cho nhóm `limit` (dùng `do_son` ở một ô Học là nếp chung của mọi chủ đề, không phải lỗi).
- Năm câu Khởi động trích lại chữ của bài khác đều **khớp từng chữ** với nguồn: `nao-bo-va-giac-quan/02:163`, `be-mat-trai-dat/05:36`, `be-mat-trai-dat/05:262`, `trees_make_wind`, `flood_only_where_it_rains`.
- Không `id` nào trống, không `id` nào trùng trong cả `content/`. Bảy `term.vi` có dấu phẩy đều có dòng `>` nhắc nghe thử (`cloud`, `shadow`, `storm`, `calm`, `store`, `warning`, `danger`) — chỗ SK-037 n16 bị sót.
- **An toàn:** không chỗ nào có người bị thương, xác, nhà sập, mái tốc, cây đổ đè nhà, xe bị cuốn, người trong nước sâu, tia lửa điện; không chữ "chết", "cuốn trôi", "điện giật"; không nêu tên hay năm của một trận bão lũ có thật; không chê vùng nào. Không bản đồ Việt Nam ở bất kỳ brief nào (ảnh vệ tinh là ảnh Nam Đại Tây Dương của *Khủng long*, màn hình ti vi và tranh "Mưa ở nơi xa" đều ghi rõ "không có bản đồ, không có tên nơi chốn"). Lời khuyên an toàn đều là việc bé làm được, không giao việc của người lớn.
- Không lặp ý: grep cả năm bài không có "phong hoá", "xói mòn", "bay hơi", "ngưng tụ", "vòng tuần hoàn", "biến đổi khí hậu", "cháy rừng", "sét". Chữ "phù sa" chỉ xuất hiện một lần, ở thẻ thưởng bài bốn, đúng như `_topic.md:136` ghi.

| Bài | Loại hình của các lựa chọn |
| --- | --- |
| 1 | w1, w2 hình vẽ · kệ Chơi, q1, q2, q3, q4 ảnh |
| 2 | w1, q2 ảnh · kệ Chơi, q1, q3, q4 hình vẽ |
| 3 | tất cả hình vẽ |
| 4 | w1, w2, q1, q2 ảnh · kệ Chơi, q3, q4 hình vẽ |
| 5 | tất cả hình vẽ |

### Lỗi chặn (1)

**C1. Bài hai: hai dòng dành cho hoạ sĩ tả sai chiều của ống gió, và tự mâu thuẫn.**
- `02-do-thoi-tiet.md:179`: `> [CẦN KIỂM] Tên "ống gió" (windsock); đuôi ống gió chỉ về phía gió thổi tới (xuôi gió).` — "phía gió thổi tới" là phía **ngược** gió, "xuôi gió" là phía gió thổi **đi**; một câu nói hai chiều ngược nhau.
- `02-do-thoi-tiet.md:660` (Ghi chú cho hoạ sĩ): `- Ống gió: sọc đỏ trắng, căng phồng; đuôi chỉ về phía gió thổi tới, cỏ nghiêng cùng phía.` — vẽ đúng chữ này thì đuôi ống gió và ngọn cỏ chỉ về hai hướng ngược nhau, không thể có thật. Ngọn cỏ luôn ngả xuôi gió; miệng ống gió hứng gió (quay về phía gió thổi tới), đuôi chỉ xuôi gió.
- Chữ trẻ đọc thì **đúng**: `02:173-174` "its tail points the way the wind goes" · "đuôi ống gió chỉ theo hướng gió thổi"; `brief` của ô cũng đúng (`02:168` "căng phồng và chỉ về một phía; cỏ trên bãi cũng nghiêng cùng phía"). Nên đây là lỗi ở hai dòng hướng dẫn, không phải ở bài học.
- **Vì sao chặn:** `explore_windsock` là hình gốc của năm chỗ (`tray_windsock`, `q2` hình câu hỏi, `q3_windsock`, `w1_windsock` bài ba, từ `windsock`); vẽ sai một lần là sai cả năm chỗ, và cả ba câu hỏi về hướng gió (bài hai q2, q3; bài ba w1) đều dựa vào hình đó. Designer đọc "Ghi chú cho hoạ sĩ" trước khi vẽ, nên phải chốt trước.
- **Sửa:**
  - `02:179` → `> [CẦN KIỂM] Tên "ống gió" (windsock); miệng ống quay về phía gió thổi tới, đuôi ống chỉ xuôi theo chiều gió thổi đi. Chữ cho trẻ không dùng hướng Đông, Tây, Nam, Bắc.`
  - `02:660` → `  - Ống gió: sọc đỏ trắng, căng phồng; miệng ống hứng gió, đuôi chỉ xuôi theo chiều gió, cỏ trên bãi ngả cùng phía với đuôi.`
  - Kiểm luôn hai hình cùng ý: `tray_ribbon` (`02:320` "dải ruy băng đỏ dài đang bay căng về một phía") và `q3_flag` (`02:471`) — hai brief này không nói chiều nên không sai, nhưng nên thêm "bay xuôi cùng phía với đuôi ống gió" để ba hình cùng một chiều gió.

### Nên sửa (8)

**N1. Bài bốn q4: gợi ý nói thẳng đáp án.**
- `04-lu-lut-va-han-han.md:536-537` `hint.en: Water always runs down to lower places.` · `hint.vi: Nước luôn chảy xuống chỗ thấp hơn.` Đáp án là `q4_low` (`04:547-548`) `label.en: the low field` · `label.vi: ruộng trũng ven sông`; hai lựa chọn sai là "the high road", "the hilltop".
- Gợi ý vừa phát biểu nguyên tắc vừa dùng đúng chữ "low/lower" của nhãn đáp án, nên bé chỉ cần đọc ba nhãn là xong, không cần nhìn ba bản hình phong cảnh mà bài đã dựng riêng cho câu này. Trái luật ở `_topic.md:268` ("không nhắc đúng chữ của nhãn đáp án, kể cả chữ VI").
- Đề xuất: `hint.en: Remember the Rain far away card.` · `hint.vi: Em nhớ lại ô Mưa ở nơi xa nhé.` — nhưng chữ này đã dùng ở q6 (`04:610-611`), nên đổi q4 thành: `hint.en: Look where the river water will go first.` · `hint.vi: Em nhìn xem nước sông sẽ tràn tới đâu trước nhé.` (chỉ vào hình, không nói "thấp").

**N2. Bài ba q2: ba thẻ giữ đúng vai của chính chúng ở phần Chơi, nên bé trả lời bằng trí nhớ trò chơi.**
- `03-mua-mua-bao.md:427-446`. Thẻ đúng `q2_wind` dùng lại `tray_bend` — món **bắt buộc** của nhóm "Gió mạnh" (`03:291-294`). Hai thẻ sai `q2_shake`, `q2_sun` là đúng hai món **bẫy** của nhóm `limit` "Không do bão gây ra" (`03:324`, `03:340`).
- Bé vừa chơi xong màn Chơi, nhớ "cốc nước rung và mặt trời là hai thứ bị loại", nên chạm thẻ còn lại mà không cần đọc câu. Ghi chú của chính câu (`03:425`) đã viết "Ba thẻ là hình vẽ của phần Chơi, cùng vai" như một điều cố ý; tester thấy đây là lộ đáp án, cùng loại lỗi SK-037 N2 nhưng đi từ màn Chơi thay vì màn Học.
- Đề xuất: giữ `q2_wind`, đổi một trong hai thẻ sai sang một món **đúng** của kệ để vai không còn chia đôi theo ranh giới bắt buộc · bẫy. Ví dụ thay `q2_sun` bằng `q2_clouds` "clouds" · "mây" dùng lại `tray_dark` — nhưng `tray_dark` đang là hình câu hỏi của q2, nên đổi hình câu hỏi sang `explore_storm` (`03:155`, làng ven biển trong bão; ô Bão chính là ô gợi ý trỏ tới) và dùng `tray_dark` làm thẻ sai. Khi đó câu đọc "A storm brings strong clouds and heavy rain." — sai rõ về văn phạm lẫn nghĩa, vẫn là bẫy thật vì mây đen đúng là thứ bão mang tới.
- Nếu biên tập muốn giữ nguyên ba thẻ thì ít nhất đổi hình câu hỏi (xem trên) và ghi vào Ghi chú cho dev là chỗ cần nhờ người kiểm trên máy.

**N3. Bài ba q3: hai nhãn VI của hai đáp án đúng dài hơn hẳn hai nhãn sai.**
- `03:473` "bản tin dự báo trên ti vi" (sáu tiếng) và `03:481` "loa phát thanh của làng" (năm tiếng) đều **đúng**; `03:489` "nhiệt kế ở nhà" và `03:497` "cái ô đang mở" (bốn tiếng) đều **sai**.
- Ghi chú ngay dưới (`03:501`) viết "Bốn nhãn cùng dạng hai chữ, cụm danh từ số ít, để hai đáp án không nổi bật bằng độ dài" — đúng với bản EN ("TV forecast", "village loudspeaker", "home thermometer", "open umbrella"), **không đúng với bản VI**, mà bản VI mới là chữ trẻ Việt đọc và nghe.
- Đề xuất: `q3_tv` "bản tin trên ti vi"; `q3_speaker` "loa phát thanh làng"; giữ hai nhãn sai. Bốn nhãn thành bốn tiếng, cùng dạng cụm danh từ. Sửa `03:465` `explanation_wrong.vi` theo ("Đáp án là bản tin trên ti vi và loa phát thanh làng."). Nếu muốn giữ "loa phát thanh của làng" đúng bảng Tên gọi (`_topic.md:160`) thì kéo dài hai nhãn sai: "nhiệt kế treo ở nhà", "cái ô đang mở sẵn".

**N4. Bài năm nói "high, dry ground", trái bảng Tên gọi của chính chủ đề.**
- `05-an-toan-khi-co-bao-lu.md:204-205` `examples.4.en: stay on high, dry ground` · `examples.4.vi: em ở chỗ cao và khô ráo`.
- `_topic.md:169` chốt: "chỗ cao, chỗ khô ráo | **dry ground** | chỗ khô ráo | **Không dùng 'high ground' ở bài năm**, để khỏi lẫn với lời khuyên sóng thần của *Bề mặt Trái Đất*." Mà `high ground` · `chỗ cao` đúng là một từ vựng `core` của `be-mat-trai-dat/05-dong-dat-va-song-than.md:758-761` ("If the sea pulls far back, go to high ground.").
- Món kệ tương ứng lại viết đúng luật: `05:340-341` "Stay on dry ground" · "Đứng ở chỗ khô ráo". Nên hiện có hai cách nói cho một việc trong cùng một bài.
- Đề xuất: `examples.4.en: stay on dry ground` · `examples.4.vi: em đứng ở chỗ khô ráo`, khớp món kệ. Nếu chuyên môn muốn giữ ý "lên chỗ cao" cho lũ (lời khuyên thật của phòng chống thiên tai) thì phải sửa ngược bảng Tên gọi `_topic.md:169` và nói rõ khác nhau thế nào với sóng thần — việc này cần Duy hoặc chuyên môn chốt, không tự đổi.

**N5. Bài hai q2: câu điền từ chỉ còn đúng một thẻ hợp văn phạm** (trả lời "Còn chưa chắc" 4 — tester thấy nên sửa).
- `02:390-391` `sentence.en: A windsock shows which way the {1} blows.` · `sentence.vi: Ống gió cho biết {1} thổi về hướng nào.` Ba thẻ: `q2_wind` "wind" (đúng), `q2_rain` "rain", `q2_sun` "sun".
- "blows" · "thổi" chỉ đi được với "wind" · "gió"; "rain blows", "sun blows" · "mưa thổi", "nắng thổi" sai hẳn văn phạm, nên bé không cần biết ống gió là gì. Thêm nữa câu là câu ô Học chép lại gần nguyên (`02:166` "A windsock shows which way the wind is blowing.") và hình câu hỏi chính là ống gió.
- Đề xuất giữ nguyên ba thẻ (ba ảnh thời tiết của bài một, ôn lại ba kiểu thời tiết đúng ý biên tập) nhưng đổi câu để cả ba thẻ đều đọc xuôi: `sentence.en: A windsock tells us about the {1}.` · `sentence.vi: Ống gió cho mình biết về {1}.` Khi đó "the rain", "the sun" · "mưa", "nắng" đều hợp văn phạm, bé phải nhớ ống gió dùng để làm gì. Sửa `02:397-398` `explanation_wrong` theo ("The answer is wind. A windsock fills with wind." giữ nguyên là được).
- Không đổi chỗ trống sang tên dụng cụ, vì bài ba w1 (`03:49`) đã hỏi đúng kiểu đó rồi.

**N6. Bài năm q4: gợi ý liệt kê đủ ba tiêu chí, và hình câu hỏi là bằng chứng của gợi ý.**
- `05:509-510` `hint.en: Think of the wind, the rain and the glass.` · `hint.vi: Em nghĩ tới gió, mưa và cửa kính nhé.` Ba lựa chọn: ban công (dính gió và mưa), cạnh cửa kính lớn (dính kính), phòng giữa nhà (không dính gì). Gợi ý loại hộ cả hai lựa chọn sai, câu thành bài tập gạch bỏ.
- Hình câu hỏi (`05:506`) dùng lại `mua-mua-bao/tray_window` "Nước mưa chảy trên cửa kính" — đúng là "cái kính" mà gợi ý nhắc, trái `_topic.md:191` ("hình câu hỏi tả tình huống, không tả … bằng chứng của gợi ý").
- Đề xuất: `hint.en: Remember the Stay inside card.` · `hint.vi: Em nhớ lại ô Ở trong nhà nhé.` (tên ô không trùng chữ nào của nhãn đáp án "in a middle room" · "trong căn phòng ở giữa nhà"); hình câu hỏi đổi sang `mua-mua-bao/q4_storm` "Sân nhà lúc có bão" — vẫn là tình huống "bão đã tới" mà không nói gì về kính.

**N7. Bài ba q1: gợi ý trỏ đúng tấm hình đang hiện ở câu hỏi, và hai lựa chọn sai thật ra là một.**
- `03:369-373`: hình câu hỏi là `khung-long/q1_storm` (cơn bão nhìn từ vũ trụ); `hint.en: Remember the picture of a storm from space.` · `hint.vi: Em nhớ lại ảnh cơn bão chụp từ vũ trụ nhé.` Bé chọn sai, app đọc gợi ý, bé nhìn lên thì thấy đúng tấm ảnh đó — gợi ý không thêm gì, mà ảnh vũ trụ cũng không cho biết mùa nào.
- Ba lựa chọn: "the dry season" · "mùa khô", "the rainy season" · "mùa mưa" (đúng), "the Tet holiday" · "dịp Tết". Dòng `[CẦN KIỂM]` của chính câu (`03:379`) ghi "Dịp Tết rơi vào mùa khô ở cả ba miền", tức hai lựa chọn sai là **cùng một đáp án**; câu thực chất chỉ còn hai lựa chọn. "Dịp Tết" cũng không cùng loại với hai lựa chọn kia (một dịp lễ đứng cạnh hai mùa).
- Đề xuất: đổi hình câu hỏi sang `explore_storm` (`03:155`, làng ven biển trong bão — cảnh có bão, không nói mùa); gợi ý `hint.en: Remember when the rivers and fields fill up.` · `hint.vi: Em nhớ lại lúc nào sông ngòi, đồng ruộng đầy nước nhé.` Nếu Duy muốn giữ cành đào, bánh chưng (hình đẹp, gần trẻ Việt) thì đổi lựa chọn "mùa khô" sang một mốc khác hẳn, ví dụ "the cold days" · "những ngày rét", để ba lựa chọn là ba thời điểm khác nhau.

**N8. Bài bốn w1: thẻ "city" dùng ảnh thành phố mù bụi, chạm đúng ý mà chủ đề đã hẹn không nhắc.**
- `04:79-84`: `label.en: city` · `label.vi: thành phố`, nhưng `image.brief` dùng lại `ho-hap/giu-phoi-khoe/explore_tiny_dust` và `alt` chép của gốc: `A hazy city` · `Thành phố mù bụi`. VoiceOver và phụ đề đọc "Thành phố mù bụi" trong một câu về bão.
- `_topic.md:134` chốt với *Hô hấp*: "Không nói khói bụi, khẩu trang." Thẻ này đưa đúng ảnh ô khói bụi của *Hô hấp* vào bài.
- Thêm: ba nhãn không cùng số — `sea`, `city` số ít, `mountains` số nhiều (`04:71-74`), trái `_topic.md:194`.
- Đề xuất: bỏ `w1_city`, thay bằng `w1_lake` "lake" · "hồ nước" dùng lại `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` `tray_lake` (`alt` "A calm lake with trees" · "Hồ nước có hàng cây"), và đổi `w1_mountains` thành `w1_mountain` "mountain" · "núi". Ba thẻ thành biển · núi · hồ: cùng là nơi chốn của bài *Đất và nước trên Trái Đất*, cùng số ít, cùng ảnh chụp, hai thẻ sai vẫn là hai nơi có nước nên vẫn có sức hút. Thứ tự giữ nguyên để thẻ đúng vẫn ở chỗ thứ nhất.

### Nhỏ (16)
- **n1. Bài hai q2 gợi ý đếm nhầm ô** (`02:393-394`): "Remember the four cards about tools." · "Em nhớ lại bốn ô về dụng cụ đo nhé." — ô thứ tư là "Our feelings" · "Cảm giác của mình", không phải dụng cụ. Đề xuất "Remember the three tool cards." · "Em nhớ lại ba ô về dụng cụ đo nhé."
- **n2. Bốn câu nữa có nhãn đáp án dài hoặc ngắn hơn hẳn nhãn sai** (ngoài N3): bài một q1 VI (`01:389` "chiếc áo bay phấp phới" năm tiếng, hai nhãn sai ba và bốn tiếng); bài hai q1 EN (`02:366` "thermometer" là nhãn một từ duy nhất, hai nhãn sai "hot water flask", "desk fan"); bài ba w1 (`03:64` "windsock" · "ống gió" ngắn nhất ở cả hai thứ tiếng); bài năm q4 VI (`05:529` "trong căn phòng ở giữa nhà" sáu tiếng, hai nhãn sai ba và bốn tiếng). Mỗi chỗ chênh ít nên không chặn, nhưng cùng một kiểu: đề xuất bài một q1 kéo dài hai nhãn sai ("mặt đường ướt nước mưa", "mặt ao phẳng như gương"); bài hai q1 đổi `q1_thermometer` thành "wall thermometer" · "nhiệt kế treo tường" (đúng hình, và khớp cách gọi "home thermometer" ở bài ba q3); bài năm q4 rút `q4_middle` thành "trong phòng giữa nhà".
- **n3. Bài hai q3 bốn nhãn bốn khuôn khác nhau** (`02:443-473`): "umbrella", "windsock" (danh từ trơn), "wall clock" (hai từ), "flag on a boat" (bốn từ, có giới từ). Không lộ đáp án vì khuôn trộn đều giữa đúng và sai, nhưng trái `_topic.md:194`. Đề xuất "an umbrella", "a windsock", "a wall clock", "a flag on a boat" hoặc gọn hơn: "umbrella", "windsock", "wall clock", "boat flag".
- **n4. Bài năm "các chú thợ điện"** (`05:225`): nơi khác trong chủ đề dùng "các cô chú" (`03:213` "các cô chú dự báo thời tiết"). Đề xuất "đợi các cô chú thợ điện tới sửa".
- **n5. Bài một ô "Trời nắng" ví dụ bốn là lời khuyên, ba ví dụ kia là dấu hiệu** (`01:164-165` "wear a hat outside" · "ra ngoài nhớ đội mũ"). Cùng kiểu lỗi SK-037 n17; thêm nữa bé vừa gặp "mũ vải" ở câu w1 với vai lựa chọn **sai**. Đề xuất đổi sang một dấu hiệu nữa, ví dụ "the yard feels warm" · "mặt sân nóng ran".
- **n6. Bài một q6 bản VI thêm một vế EN không có** (`01:596-597`): EN "Na is not right. The wind moves the trees." · VI "Na chưa đúng. Gió làm cây lay động, không phải cây làm ra gió." Vế "không phải cây làm ra gió" chỉ có ở VI. Đề xuất bỏ vế đó, hoặc thêm vào EN ("The wind moves the trees, not the other way." chín từ).
- **n7. Bài ba dùng một hình làm hình câu hỏi cho ba câu liền** (`03:457` `q3`, rồi `03:510` q4 và `03:554` q5 đều "Dùng lại hình `q3`"), trong khi ba lựa chọn của q4 lại là ba bản của chính khoảng sân đó. Bốn màn liên tiếp gần như cùng một bức hình. Đề xuất q5 đổi sang `explore_forecast` (câu q5 nói về dự báo, gợi ý cũng trỏ ô Dự báo).
- **n8. Bài bốn q3 ghi `dok: 2` nhưng hai nhãn đúng gần như chép ví dụ ô Học** (`04:511` "rivers get low" so với `04:198` "ponds and rivers get low"; `04:519` "crops dry up" so với `04:202` "plants and crops dry up"), và gợi ý (`04:485`) còn trỏ thẳng "the Drought card's examples". Câu chạy được, chỉ là nhớ lại chứ không phải phân loại. Đề xuất đổi hai nhãn đúng sang hai cảnh khác của hạn hán chưa có ở ô Học (ví dụ "wells run dry" · "giếng cạn nước", "the grass turns brown" · "cỏ úa vàng"), hoặc hạ xuống `dok: 1` thì phải xếp lại thứ tự câu.
- **n9. Bài năm q2 hai thẻ sai quá yếu** (`05:424-436`): "birds" · "tiếng chim hót" và "music" · "nhạc" không liên quan gì tới chuẩn bị trước bão, và câu là câu ô Học chép nguyên (`05:153`). Đề xuất đổi "music" thành "neighbours" · "lời hàng xóm" hoặc "the loudspeaker" · "loa phát thanh" (bẫy thật: loa cũng là nguồn tin, nhưng câu ô Học nói "tin tức"); nếu đổi thì dùng lại `mua-mua-bao/q3_speaker` cho đúng một vật một hình.
- **n10. Bài năm có hai câu Khởi động cùng trỏ bài bốn** (`05:49` và `05:93`), nên cả bài chỉ có mốc một ngày × hai và một tháng × một, không có mốc "khoảng một tuần" — bài ôn lại là bài thưa mốc nhất. Bảng Khởi động `_topic.md:285` cũng là dòng duy nhất **không ghi mốc giãn cách** cho w2. Đề xuất giữ w2 (câu "Em nghĩ sao?" phải hỏi lại) và đổi w1 sang ôn bài hai (`thoi-tiet-va-thien-tai/do-thoi-tiet`, lúc đó cách khoảng một tuần), ví dụ hỏi lại ống đo mưa; rồi ghi mốc cho cả hai dòng trong bảng.
- **n11. Bảng "Hình dùng chung" thiếu một chỗ** (`_topic.md:221`): dòng `nang-mua-gio-may/explore_cloudy` … ghi "1 (trong bài); 2 (câu w1); 3 (câu w3)" nhưng `explore_cloudy` còn là hình câu hỏi của bài bốn w2 (`04:95`). Đã đối chiếu máy toàn bộ bảng, 23 dòng còn lại đều đúng.
- **n12. Bài một q3 gợi ý gần như phân loại hộ** (`01:466-467`): "What will rain make wet? What needs water?" · "Mưa sẽ làm ướt thứ gì? Thứ gì lại cần nước?" Vế hai chỉ thẳng hai lựa chọn sai (chum, chậu cây). Đề xuất giữ vế một, bỏ vế hai, thêm "Think what must stay dry." · "Em nghĩ xem thứ gì phải giữ khô nhé." — vẫn dẫn đường mà không chia sẵn hai nhóm.
- **n13. Bài hai, chữ VI lủng củng** (`02:138`): "mình đọc nhiệt độ theo độ". Đề xuất "nhiệt độ đo bằng đơn vị độ" hoặc "mình đọc xem được bao nhiêu độ".
- **n14. `objective.en` bài năm mười một từ** (`05:19` "I can say how to stay safe in storms and floods."), đúng cảnh báo phiên chính đã chạy. Mục tiêu có hiện ở đầu bài nên vẫn là chữ bé thấy; cả năm bài cũng là năm màn Học khoảng 31–35 từ EN, quá mức "một màn ≤ 30 từ" của `TEMPLATE.md` (trả lời "Còn chưa chắc" 7). Đề xuất rút `05:19-20` thành "I can stay safe in storms and floods." (tám từ) · "Em biết giữ an toàn khi có bão lũ." — màn Học bài năm xuống còn khoảng ba mươi ba. Việc chốt ngưỡng "một màn" cho cả repo là của PM, không sửa trong ticket này.
- **n15. Màn Học trộn loại hình ở hai bài** (luật "một loại hình" của `_topic.md:180` chỉ nói về câu và kệ, nên không tính là lỗi): bài ba có một ảnh chụp (`explore_season`) giữa ba hình vẽ; bài bốn có hai ảnh, một hình vẽ và một hình ghép. Bốn ô hiện cùng lúc thành lưới nên designer xem thử đặt cạnh nhau có lệch không, rồi báo lại.
- **n16. Hai câu "đọc hình" không trả lời được bằng VoiceOver.** Bài hai q4 (`02:481-485`) hỏi ống nào nhiều nước nhất, nhưng `alt` của hình câu hỏi chỉ là "Three rain gauges in a row" · "Ba ống đo mưa xếp thành hàng" — không có chiều cao nước, mà chiều cao nước là toàn bộ thông tin của câu; ba `alt` lựa chọn (`02:500`, `02:508`, `02:516`) chỉ nói ống nào được đánh dấu. Bài bốn q4 (`04:534-535`) đỡ hơn vì `alt` có "a low field and a high road". Viết chiều cao nước vào `alt` thì lộ đáp án, nên không sửa được bằng chữ ở đây: đề xuất ghi vào ticket cho PM và ios-dev (có cần một trường mô tả dài cho hình câu hỏi, hay hai câu kiểu này chấp nhận là câu chỉ làm được bằng mắt).

- **Ghi nhận thêm cho N2:** bản VI của bài ba q2 đọc với hai thẻ sai là "Bão mang tới rung lắc rất mạnh…" và "Bão mang tới nắng rất mạnh…" — "nắng rất mạnh" không phải tiếng Việt tự nhiên (thường nói "nắng gắt"), nên bản VI cũng tự loại hai thẻ sai như bản EN ở N5. Sửa N2 thì sửa luôn chỗ này.

### Trả lời các mục "Còn chưa chắc" của biên tập
- **3. Bài một q3 và bài năm q3, đáp án đúng là hình đã gặp ở phần Chơi:** **giữ nguyên, không cần đổi.** Hai câu đều là `multi_choice` hai đáp án, và chỉ **một** trong hai đáp án là hình của kệ (`01:479` `tray_rice`; `05:479` `tray_bring_in`); đáp án còn lại và cả hai lựa chọn sai đều là hình mới, nên bé không thể trả lời trọn câu chỉ bằng "cái đã thấy". Thêm nữa vai ở kệ khác vai ở câu (thóc phơi ở kệ là "dấu hiệu của nắng", ở q3 là "thứ phải cất vào nhà"). Không cần đổi sang "củi để ngoài sân", cũng không cần vẽ lại cảnh cất đồ. Chỗ thật sự lộ là bài ba q2 (N2) và bài năm q1, vì ở đó **cả ba** lựa chọn đều của kệ và giữ nguyên vai.
  - Kèm theo, bài năm q1 (`05:379-401`): đáp án `q1_inside` là món **bắt buộc** của kệ, `q1_tree` là món **bẫy** của kệ, chỉ `q1_river` là mới. Không chặn (bé vẫn phải loại "bên bờ sông"), nhưng nếu sửa N2 thì sửa luôn cho đồng bộ: đổi `q1_tree` sang một chỗ mới chưa gặp (ví dụ "under the shop awning" · "dưới mái hiên quán"), giữ "dưới gốc cây to" cho kệ.
- **4. Bài hai q2 dễ:** đồng ý, xem **N5**.
- **5. Kệ lệch số món (1-2-2, 2-2-1, 2-1-2):** **chấp nhận.** Ba kệ vẫn đủ ba nhóm `required`, ba chỗ, tám món, và đều có ít nhất hai cách xếp đạt. Đã có tiền lệ *Não bộ* bài hai (kệ 2-2-1, nhóm một món). Nhớ ghi rõ "cố ý" ở Ghi chú cho dev — bài hai (`02:671`) và bài năm (`05:695`) đã ghi, bài ba (`03:696`) chỉ ghi "2-2-1 món" mà không nói cố ý; thêm chữ "cố ý" cho đồng bộ.
- **6. Món "Ở yên trong nhà" đúng ở nhiều nhóm (bài năm):** **chạy được, không cần đổi.** Mỗi món chỉ thuộc một nhóm, và "Ở yên trong nhà" là món **duy nhất** của nhóm "Trong bão", nên không có cách xếp nào làm bé kẹt: nếu bé chạm ba món Trước bão và Trong bão rồi, lời nhắn sẽ là `missing.tray_after` "Em còn thiếu một việc cho lúc bão đã qua." — đúng và đủ để bé sửa. Rủi ro còn lại chỉ là cảm giác, nên để lại cho lượt kiểm trên máy (mục "Chưa kiểm").
- **9. Vai của hình dụng cụ đo:** đồng ý với biên tập. Máy đã kiểm: **không hình nào mang hai vai trái nhau trong cùng một bài.** Nhiệt kế đúng ở bài hai q1 và sai ở bài ba q3, nhưng là hai bài khác nhau và hai câu hỏi khác nhau ("thứ nào đo được không khí nóng lạnh" so với "nhà Nam biết tin bão bằng cách nào"), không phải cùng một ý. Ống đo mưa đúng như biên tập ghi: không làm lựa chọn ở câu nào trong bài hai.
- **1, 2, 8:** Mức của chủ đề, bộ thẻ `weather` hay `earth`, và việc có dạy giông sét, sạt lở đất — thuộc PM và Duy, tester không có ý kiến kỹ thuật nào chặn.

### Chưa kiểm
- **Hình thật:** mới có `brief`, chưa có ảnh nào được chọn, chưa có hình vẽ nào. Hai mươi hai ảnh cần tìm (nhất là `explore_flood` lũ không người, `tray_rice` thóc phơi không người, `q3_chillies` ớt trên nia, ảnh mùa nước nổi, lều khí tượng không biển chữ) và 72 hình tự vẽ đều chưa có để kiểm "không có chữ", "không có bản đồ", "không gây sợ" trên hình thật.
- **Giọng đọc:** EN "thermometer", "gauge", "windsock", "drought", "typhoon", "TV", "ankle-deep", "100"; VI "ti vi", "ghi-ta", dấu hai chấm ở tiêu đề bài hai, mọi `term.vi` có dấu phẩy. Không chạy `tts` trong lượt này.
- **Hiển thị trên máy:** không dùng simulator trong lượt này. Còn lại cho lượt sau: dòng điều kiện năm màn Chơi (dài nhất là bài hai "Cần đủ Nóng hay lạnh, Mưa nhiều hay ít, Hướng gió · Không dùng để đo"); ba bản hình đánh dấu một ống ở bài hai q4 và một chỗ ở bài bốn q4 có đủ khác nhau trên iPhone bề rộng nhỏ nhất không; nhãn dài ("Ống đo mưa làm từ chai", "Dải ruy băng buộc trên que", "Shelter under a big tree", "trong căn phòng ở giữa nhà"); nhóm một món ở ba kệ; vùng chạm; VoiceOver đọc `alt`.
- **Chuyên môn khí tượng và phòng chống thiên tai:** mọi dòng `[CẦN KIỂM]` vẫn còn (mùa bão theo miền, mắt bão, cách đánh số bão, mùa nước nổi, lều khí tượng, đám mây nặng bằng một trăm con voi, danh sách túi đồ phòng bão, và nhất là bốn lời khuyên an toàn ở bài năm). Ngoài phạm vi SK-038 ("Duyệt chuyên môn khí tượng" nằm ở mục Ngoài phạm vi), nhưng N4 cần chuyên môn mới chốt được.

## Câu hỏi mở cho PM/ios-dev (main session 11/11)
- Câu đọc hình (bài 2 q4, bài 4 q4; cùng kiểu *Hô hấp* bài 3 q4 biểu đồ cột): `alt` không nói được chiều cao nước/cột mà không lộ đáp án, nên người dùng VoiceOver không làm được câu. Cần một cách chung: ví dụ `alt` nêu số đo từng ống/cột ("ống bên trái đầy một nửa…") khi câu hỏi là so sánh, hoặc đánh dấu câu "chỉ nhìn" và bỏ qua khi VoiceOver bật. Chưa chặn bản thử.

## content-editor 11/11 · sửa theo tester

Phạm vi: chỉ sửa sáu file trong `content/discoverer/thoi-tiet-va-thien-tai/`. Không đổi, không xoá dòng `id:` nào; không thêm khối `###` mới. Có đổi key ở lựa chọn, thẻ từ (không có `id`). Mỗi chỗ sửa có dòng `>` "Rà chữ tester 11/11 (mã)" ngay trong bài. Không chạy lệnh; phiên chính chạy `validate`.

**Chặn (1/1)**
- **C1, bài hai:** sửa hai dòng hướng dẫn về ống gió. Dòng `>` dưới ô Hướng gió nay viết "miệng ống quay về phía gió thổi tới, đuôi ống chỉ xuôi theo chiều gió thổi đi". Ghi chú cho hoạ sĩ nay viết "miệng ống hứng gió, đuôi chỉ xuôi theo chiều gió, cỏ trên bãi ngả cùng phía với đuôi". Thêm như tester gợi ý: brief `tray_ribbon` và `q3_flag` ghi rõ bay xuôi gió, cùng phía với đuôi ống gió; Ghi chú cho hoạ sĩ có dòng "ba hình có gió cùng một chiều". Chữ trẻ đọc vốn đúng, không đổi.

**Nên sửa (8/8)**
- **N1, bài bốn q4:** gợi ý đổi theo đề xuất của tester: "Look where the river water will go first." · "Em nhìn xem nước sông sẽ tràn tới đâu trước nhé."
- **N2, bài ba q2 (lệch đề xuất):**
  - Câu mới: "In a storm, {1} can bend the trees low." · "Khi có bão, {1} có thể làm cây nghiêng rạp."
  - Ba thẻ là ba món **bắt buộc** của kệ: mưa (`q2_rain`), gió (`q2_wind`, đáp án, vẫn thẻ thứ hai), mây (`q2_clouds`). Bão đều mang tới cả ba, nên bé không loại được thẻ nào theo trí nhớ trò chơi; chỉ gió làm cây nghiêng rạp.
  - Thẻ gió dùng hình lá bay, không dùng hình cây nghiêng rạp (hình đó vẽ đúng chữ của câu). Hình câu hỏi đổi sang cơn bão nhìn từ vũ trụ.
  - Vì sao lệch: đề xuất của tester (thay "nắng" bằng "mây", giữ câu cũ) sẽ cho bản VI "mây rất mạnh", không tự nhiên, tức lại tự loại thẻ như "nắng rất mạnh". Câu mới đọc xuôi với cả ba thẻ ở hai thứ tiếng.
  - [CẦN KIỂM] mưa to có làm cây nghiêng rạp không (ghi chú trong bài).
- **N3, bài ba q3:** hai nhãn VI đúng rút còn "bản tin trên ti vi", "loa phát thanh làng". Bốn nhãn nay cùng bốn tiếng. Hai `explanation` VI sửa theo. Bảng Tên gọi ở `_topic.md` đổi "loa phát thanh của làng" thành "loa phát thanh làng".
- **N4, bài năm ô Nước lũ (giữ bảng Tên gọi, sửa ví dụ):** ví dụ bốn đổi thành "stay on dry ground" · "em đứng ở chỗ khô ráo", khớp món kệ "Stay on dry ground".
  - Lý do không đổi ngược bảng: "lên chỗ cao" khi lũ là lời khuyên đúng, nhưng là việc sơ tán do người lớn quyết. Việc bé tự làm được là đứng ở chỗ khô ráo, tránh xa nước. "Chỗ cao" (high ground) để riêng cho lời khuyên sóng thần của *Bề mặt Trái Đất*, để bé khỏi lẫn hai tình huống.
  - Bảng Tên gọi ghi rõ lý do và thêm [CẦN KIỂM] với chuyên môn phòng chống thiên tai.
- **N5, bài hai q2:** theo đề xuất của tester. Câu mới "A windsock tells us about the {1}." · "Ống gió cho mình biết về {1}."; giữ ba thẻ. Gợi ý sửa luôn theo n1 (ba ô dụng cụ).
- **N6, bài năm q4:** theo đề xuất của tester. Gợi ý "Remember the Stay inside card." · "Em nhớ lại ô Ở trong nhà nhé."; hình câu hỏi đổi sang `q4_storm` của bài ba ("Sân nhà lúc có bão").
- **N7, bài ba q1:**
  - Hình câu hỏi đổi sang cảnh làng ven biển trong bão (`explore_storm`). Gợi ý theo đề xuất: "Remember when the rivers and fields fill up." · "Em nhớ lại lúc nào sông ngòi, đồng ruộng đầy nước nhé."
  - Lựa chọn "the Tet holiday" · "dịp Tết" đổi thành "the whole year" · "quanh năm" (key `q1_whole_year`), hình cùng cánh đồng vẽ thành bốn dải theo các quãng trong năm. Lựa chọn mới bắt ý sai "bão tới lúc nào cũng được", khác lý do với "mùa khô".
  - Không dùng "những ngày rét" vì cũng trùng mùa khô ở miền Bắc.
  - [CẦN KIỂM]: tháng một tới tháng tư rất ít bão.
- **N8, bài bốn w1 (lệch đề xuất một chỗ):** bỏ thẻ "city" (ảnh thành phố mù bụi của *Hô hấp*); "mountains" đổi thành "mountain". Thẻ thứ ba là "forest" · "rừng" (ảnh `tray_forest` của *Đất và nước trên Trái Đất*), không phải "lake" như tester đề xuất. Lý do: ảnh hồ đã là lựa chọn sai ở w2 cùng bài ("Which one is a river?"); dùng thêm ở w1 thành hai câu chung một hình cùng vai (`_topic.md`, Quy ước hình mục bảy). Ba thẻ vẫn cùng số ít, cùng ảnh nơi chốn; thẻ đúng vẫn ở chỗ thứ nhất.

**Nhỏ (16)**
- **n1, sửa:** bài hai q2 gợi ý "Remember the three tool cards." · "Em nhớ lại ba ô về dụng cụ đo nhé."
- **n2, sửa cả bốn chỗ:**
  - bài một q1: hai nhãn VI sai thành "mặt đường ướt nước mưa", "mặt ao phẳng như gương";
  - bài hai q1: "wall thermometer" · "nhiệt kế treo tường";
  - bài ba w1: "wall clock" · "đồng hồ treo tường" thành "clock" · "đồng hồ", để "windsock" · "ống gió" không còn là nhãn ngắn nhất duy nhất;
  - bài năm q4: "trong phòng giữa nhà".
- **n3, sửa:** bài hai q3 bốn nhãn EN "umbrella", "windsock", "wall clock", "boat flag". Nhãn VI giữ.
- **n4, sửa:** "đợi các cô chú thợ điện tới sửa".
- **n5, sửa:** bài một ô Trời nắng, ví dụ bốn thành "the ground gets hot" · "mặt sân nóng lên".
- **n6, sửa:** bài một q6, bỏ vế "không phải cây làm ra gió" ở bản VI.
- **n7, sửa nhưng lệch đề xuất:** bài ba q5, hình câu hỏi đổi sang ảnh bầu trời xanh `w1_sky` (đúng tình huống "hôm nay trời xanh"). Không dùng `explore_forecast` như tester gợi ý, vì ảnh ti vi dự báo chính là bằng chứng mà gợi ý "ô Dự báo" trỏ tới.
- **n8, sửa:** bài bốn q3, hai đáp án đổi thành hai cảnh hạn hán ô Học chưa nói: "wells run dry" · "giếng cạn nước", "fields turn brown" · "đồng cỏ úa vàng". Gợi ý đổi thành "Think what too little rain does." · "Em nghĩ xem mưa quá ít thì sẽ ra sao nhé.". Giữ `dok: 2` và thứ tự câu.
- **n9, sửa nhưng lệch đề xuất:** bài năm q2, hai thẻ sai đổi thành "wind" · "tiếng gió" (hình lá bay của bài ba) và "frogs" · "tiếng ếch kêu" (hình vẽ mới). Đây là hai "dấu hiệu báo mưa" quen ở làng quê, có sức hút, nhưng không cho biết bão ở xa sẽ đi về đâu. Không lấy "loa phát thanh" vì loa làng cũng đưa tin bão (đáp án đúng ở bài ba q3), câu sẽ có hai đáp án; không lấy "lời hàng xóm" vì nghe hàng xóm cũng không sai.
- **n10, sửa:** bài năm w1 ôn bài hai (khoảng một tuần): "Which tool measures how much rain falls?"; ba lựa chọn nhiệt kế treo tường, ống đo mưa (đáp án, chỗ thứ hai), ống gió. Giải thích khi đúng bắc cầu sang ý chính một ("Rain measurements help forecasters warn us early."). Giữ `id` và key `w1`; nếu phiên chính muốn `id` mới thì xoá dòng `id:` của w1 rồi chạy `ids`. Bảng Khởi động ở `_topic.md` ghi mốc cho cả ba dòng bài năm.
- **n11, sửa:** bảng Hình dùng chung ghi thêm bài bốn w2 cho `explore_cloudy`; cả bảng cập nhật theo các chỗ đổi hình ở dưới.
- **n12, sửa:** bài một q3 gợi ý "What will rain make wet? Think what must stay dry." · "Mưa sẽ làm ướt thứ gì? Em nghĩ xem thứ gì phải giữ khô nhé."
- **n13, sửa:** bài hai, "nhiệt độ đo bằng đơn vị độ".
- **n14, sửa:** mục tiêu bài năm "I can stay safe in storms and floods." · "Em biết giữ an toàn khi có bão lũ." (tám từ); bảng kế hoạch ở `_topic.md` sửa theo. Ngưỡng "một màn ≤ 30 từ" để PM chốt.
- **n15, không sửa chữ:** màn Học trộn ảnh và hình vẽ ở bài ba, bài bốn là việc của designer (xem bốn ô đặt cạnh nhau rồi báo).
- **n16, giữ:** câu đọc hình bài hai q4, bài bốn q4; phiên chính đã ghi thành câu hỏi mở cho PM và ios-dev (mục trên).
- **"Còn chưa chắc" 3, bài năm q1 (không sửa):** tester gợi ý đổi `q1_tree` sang một chỗ mới chưa gặp. Nếu vậy, cả hai lựa chọn sai đều mới, còn đáp án `q1_inside` là hình ô Học, tức đáp án thành hình duy nhất bé đã thấy (tiêu chí SK-038). Giữ một lựa chọn sai đã gặp (cây to) và một lựa chọn mới (bờ sông).
- **"Còn chưa chắc" 5:** Ghi chú cho dev bài ba thêm chữ "cố ý" cho kệ 2-2-1.

**Vị trí đáp án và Đúng/Sai:** không đổi (đáp án mọi câu vẫn ở chỗ cũ; tám Đúng, tám Sai). Bảng ở `_topic.md` vẫn đúng.

### Hình đổi sau rà chữ

Khoá hình theo cú pháp file chọn ảnh (Khởi động, Quiz, Chơi không tiền tố; Học, Từ vựng, Thưởng có tiền tố).

| Bài | Key hình | Đổi gì |
| --- | --- | --- |
| 2 `do-thoi-tiet` | `learn.explore.explore_windsock` | Brief không đổi. Ghi chú hoạ sĩ sửa chiều (C1): miệng ống hứng gió, đuôi và ngọn cỏ cùng ngả xuôi gió. Danh sách chỗ dùng lại thêm câu q2, câu w1 bài năm. |
| 2 | `tray.tray_ribbon` | Brief thêm: dải ruy băng bay xuôi gió, cùng phía với đuôi ống gió và ngọn cỏ. Alt giữ. |
| 2 | `q3.q3_flag` | Brief thêm: lá cờ bay xuôi gió như đuôi ống gió, mặt nước gợn cùng chiều. Alt giữ. Nhãn EN đổi "boat flag" (không phải hình). |
| 2 | `learn.explore.explore_thermometer`, `learn.explore.explore_rain_gauge` | Brief chỉ thêm "câu w1 bài năm dùng lại". Hình không đổi. |
| 3 `mua-mua-bao` | `q1` | `same_as` đổi: trước `q1_storm` ở `khung-long/vi-sao-khung-long-bien-mat`, nay `learn.explore.explore_storm` (trong bài). Alt "A seaside village in a storm" · "Làng ven biển trong cơn bão". |
| 3 | `q1.q1_tet` | **Bỏ** (cành đào và bánh chưng). |
| 3 | `q1.q1_whole_year` | **Key mới**, hình tự vẽ: cùng cánh đồng của `q1_dry`, `q1_rainy`, vẽ thành bốn dải dọc (lúa mới cấy, lúa xanh dưới mưa, lúa chín, ruộng khô sau gặt), không chữ, không số. Alt "The same field through the year" · "Cánh đồng ấy qua các mùa trong năm". |
| 3 | `q2` | `same_as` đổi: trước `tray.tray_dark`, nay `q1_storm` ở `khung-long/vi-sao-khung-long-bien-mat`. Alt "A big storm seen from space" · "Cơn bão lớn nhìn từ vũ trụ". |
| 3 | `q2.q2_shake`, `q2.q2_sun` | **Bỏ.** |
| 3 | `q2.q2_rain` | **Key mới**, `same_as` `q1.q1_rain` ở `be-mat-trai-dat/dong-dat-va-song-than` (cùng hình món kệ `tray_pour`). Alt "Heavy rain" · "Mưa to". |
| 3 | `q2.q2_wind` | `same_as` đổi: trước `tray.tray_bend`, nay `tray.tray_leaves`. Alt "Leaves flying in the wind" · "Lá bay trong gió". |
| 3 | `q2.q2_clouds` | **Key mới**, `same_as` `tray.tray_dark`. Alt "Dark clouds over the rice fields" · "Mây đen kéo tới trên cánh đồng lúa". |
| 3 | `q5` | `same_as` đổi: trước `q3`, nay `w1.w1_sky` ở `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Alt "A blue sky" · "Bầu trời xanh". |
| 3 | `tray.tray_bend`, `tray.tray_dark`, `tray.tray_leaves`, `tray.tray_window`, `q3`, `q4.q4_storm`, `learn.explore.explore_storm` | Brief chỉ sửa danh sách chỗ dùng lại. Hình không đổi. |
| 4 `lu-lut-va-han-han` | `w1.w1_city` | **Bỏ** (ảnh thành phố mù bụi của *Hô hấp*). |
| 4 | `w1.w1_mountains` | **Key đổi** thành `w1.w1_mountain`. Vẫn `same_as` `tray.tray_mountain` ở `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`, hình và alt không đổi. |
| 4 | `w1.w1_forest` | **Key mới**, `same_as` `tray.tray_forest` ở `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Alt "A green forest" · "Khu rừng xanh". |
| 4 | `q3.q3_rivers`, `q3.q3_crops` | **Bỏ** (sông cạn, luống ngô héo). |
| 4 | `q3.q3_wells` | **Key mới**, hình tự vẽ: giếng làng xây gạch nhìn chéo từ trên, gần cạn nước, gầu và dây bên thành giếng, trời nắng. Alt "A well with almost no water" · "Cái giếng gần cạn nước". |
| 4 | `q3.q3_fields` | **Key mới**, hình tự vẽ: đồng cỏ rộng khô úa vàng nâu, không vết nứt (khác ruộng nứt nẻ của kệ). Alt "Brown, dry grassy fields" · "Đồng cỏ khô úa vàng". |
| 4 | `tray.tray_tap`, `tray.tray_jar`, `tray.tray_leak` | Brief bỏ câu "câu w1 bài năm dùng lại". Hình không đổi. |
| 5 `an-toan-khi-co-bao-lu` | `w1` | `same_as` đổi: trước `q2` ở `be-mat-trai-dat/dong-dat-va-song-than`, nay `q1.q1_rain` ở `be-mat-trai-dat/nui-lua`. Alt "Heavy rain falling" · "Mưa to đang rơi". |
| 5 | `w1.w1_tap`, `w1.w1_jar`, `w1.w1_leak` | **Bỏ.** |
| 5 | `w1.w1_thermometer`, `w1.w1_rain_gauge`, `w1.w1_windsock` | **Key mới**, `same_as` `learn.explore.explore_thermometer`, `learn.explore.explore_rain_gauge`, `learn.explore.explore_windsock` ở `thoi-tiet-va-thien-tai/do-thoi-tiet`. Alt chép gốc. |
| 5 | `q2.q2_birds`, `q2.q2_music` | **Bỏ** (chim sẻ hót, đàn ghi-ta). |
| 5 | `q2.q2_wind` | **Key mới**, `same_as` `tray.tray_leaves` ở `thoi-tiet-va-thien-tai/mua-mua-bao`. Alt "Leaves flying in the wind" · "Lá bay trong gió". |
| 5 | `q2.q2_frogs` | **Key mới**, hình tự vẽ: ếch đồng ngồi trên bờ ruộng, túi kêu phồng, ruộng lúa và trời âm u phía sau, cùng nét với chiếc đài. Alt "A frog croaking by a rice field" · "Con ếch đang kêu bên bờ ruộng". |
| 5 | `q4` | `same_as` đổi: trước `tray.tray_window` ở `thoi-tiet-va-thien-tai/mua-mua-bao`, nay `q4.q4_storm` cùng bài đó. Alt "The yard in a storm" · "Sân nhà lúc có bão". |

Số hình sau sửa: ảnh cần tìm vẫn hai mươi hai; hình tự vẽ mới bảy mươi mốt (bài ba vẫn mười sáu, bài bốn vẫn mười chín, bài năm mười chín); một hình ghép.

### Chữ trẻ nghe đã đổi (cần sinh lại clip; EN và VI trừ khi ghi khác)

| Bài | Trường |
| --- | --- |
| 1 `nang-mua-gio-may` | `learn.explore.explore_sunny` ví dụ bốn; nhãn `q1_road`, `q1_pond` (chỉ VI); `q3.hint`; `q6.explanation_wrong` (chỉ VI) |
| 2 `do-thoi-tiet` | `learn.explore.explore_thermometer` ví dụ bốn (chỉ VI); nhãn `q1_thermometer`; `q2.sentence`, `q2.hint`; nhãn `q3_flag` (chỉ EN) |
| 3 `mua-mua-bao` | nhãn `w1_clock`; `q1.hint`; nhãn mới `q1_whole_year` (bỏ clip `q1_tet`); `q2.sentence`, `q2.explanation_correct`, `q2.explanation_wrong`; nhãn mới `q2_rain`, `q2_clouds` (bỏ clip `q2_shake`, `q2_sun`; nhãn `q2_wind` không đổi); nhãn `q3_tv`, `q3_speaker`, `q3.explanation_correct`, `q3.explanation_wrong` (chỉ VI) |
| 4 `lu-lut-va-han-han` | nhãn mới `w1_mountain`, `w1_forest` (bỏ clip `w1_mountains`, `w1_city`); `q3.hint`, `q3.explanation_correct`, `q3.explanation_wrong`; nhãn mới `q3_wells`, `q3_fields` (bỏ clip `q3_rivers`, `q3_crops`); `q4.hint` |
| 5 `an-toan-khi-co-bao-lu` | `objective`; w1 cả câu (`prompt`, `hint`, hai `explanation`, nhãn mới `w1_thermometer`, `w1_rain_gauge`, `w1_windsock`; bỏ clip `w1_tap`, `w1_jar`, `w1_leak`); `learn.explore.explore_flood_water` ví dụ bốn; `learn.explore.explore_power` ví dụ bốn (chỉ VI); nhãn mới `q2_wind`, `q2_frogs` (bỏ clip `q2_birds`, `q2_music`); `q4.hint`; nhãn `q4_middle` (chỉ VI) |

Không phải clip: mọi `brief`, `alt`, dòng `>`, Ghi chú, và các bảng ở `_topic.md` (Tên gọi, Hình dùng chung, Khởi động, kế hoạch bài năm).

**Còn chưa chắc**
- **Ba chỗ lệch đề xuất của tester (N2, N8, n7, n9):** đã ghi lý do ở trên và ngay trong bài. Tester xem lại ở lượt sau.
- **Bài ba q2:** thẻ mưa và mây là món đúng của kệ nhưng là thẻ sai ở câu này. Cùng kiểu với đề xuất của tester (thẻ mây dùng lại `tray_dark`); ý khác nhau ("bão mang mưa" đúng, "mưa làm cây nghiêng rạp" sai), không phải hai vai trái nhau cho cùng một ý.
- **Bài năm q2:** "tiếng gió", "tiếng ếch kêu" là dấu hiệu dân gian. Giải thích chỉ nói tin tức cho biết bão đi về đâu, không chê kinh nghiệm dân gian. [CẦN KIỂM] ở bài.

## Tạm dừng (main session 11/11, Duy: "tạm thời dừng hết")
- Chữ: đã sửa theo tester, `validate` 0 lỗi, id đã gắn vào `content/syllabus.json`.
- Hình: designer bị dừng giữa chừng (đang vẽ cảnh sân, ruộng bài 3). File chọn ảnh và hình tự vẽ trong `content/images/discoverer/thoi-tiet-va-thien-tai/`, `content/images/own/thoi-tiet-va-thien-tai/` có thể chưa đủ; lượt sau kiểm lại với bảng "Hình đổi sau rà chữ" và việc cắt cá đồ chơi của SK-036.
- Chưa: `images fetch`, TTS, build gói.

## designer 11/11 · hình

Theo SK-033 ("Hợp đồng ảnh", "Hình ghép", "Hình tự vẽ"), cách làm của SK-036, SK-037 và bảng "Hình đổi sau rà chữ" ở trên. Đã kiểm lại sau lượt "Tạm dừng": đủ 90 hình tự vẽ, 5 file chọn ảnh đủ 221 khoá, khớp bài `.md` mới nhất (dựng lại khoá bằng `images search --cache-only --out <scratchpad>`, không đụng `candidates.json` trong repo). Chờ Duy duyệt; chưa build, chưa commit.

**File**
- File chọn ảnh: `content/images/discoverer/thoi-tiet-va-thien-tai/{nang-mua-gio-may,do-thoi-tiet,mua-mua-bao,lu-lut-va-han-han,an-toan-khi-co-bao-lu}.json`. `SelectionSet` kiểm offline: 221 mục, 0 lỗi, mọi `same_as` tìm được, mọi file `own` có thật; mỗi câu và mỗi kệ chỉ một loại hình (kiểm bằng script).
- Hình tự vẽ: `content/images/own/thoi-tiet-va-thien-tai/`, 90 file JPEG 1024×768, sRGB, không metadata, không chữ, không số, không nét mặt.
- Hình ghép: `content/images/composed/thoi-tiet-va-thien-tai/lu-lut-va-han-han.learn.explore.explore_seasons.jpg` (trái ô Lũ, phải ruộng nứt nẻ của kệ, đều là hình vẽ; giấy phép "Science Kids").
- Trang duyệt (ngoài git): `content/.build/images/thoi-tiet-va-thien-tai/index.html`, `<bài>/review.html` (mỗi hàng ba ô: đầy đủ, ô lưới 2:1, ô vuông), `own-sheet.html` (lưới 90 hình tự vẽ và hình ghép).
- Đã xoá ba hình vẽ của khoá bị bỏ: `mua-mua-bao.q1.q1_tet`, `lu-lut-va-han-han.q3.q3_rivers`, `q3_crops`.

**Số hình** (221 khoá, **0 chỗ trống**)

| Bài | Ảnh nguồn mới | Tự vẽ | Ghép | Dùng lại |
| --- | --- | --- | --- | --- |
| 1 Nắng, mưa, gió, mây | 1 | 19 | 0 | 26 |
| 2 Đo thời tiết | 1 | 15 | 0 | 26 |
| 3 Mùa mưa bão | 0 | 16 | 0 | 27 |
| 4 Lũ lụt và hạn hán | 0 | 21 | 1 | 25 |
| 5 An toàn khi có bão lũ | 0 | 19 | 0 | 24 |
| Cộng | 2 | 90 | 1 | 128 |

- Ảnh nguồn mới: `learn.explore.explore_cloudy` bài một (CC BY 2.0, kewl, Openverse/Flickr; đã mở trang Flickr kiểm tay: CC BY 2.0, đúng tên) và `reward.weather_box` bài hai (CC0 1.0, Commons, cắt bỏ toà nhà, đổi tên trung tính "A white weather box on legs").
- Ảnh dùng lại của chủ đề khác vẫn như brief (Mặt Trời, mưa, lúa trước gió, biển, núi, rừng, hồ, ao, sông, cơn bão từ vũ trụ, lớp học, đất nứt).
- Brief tính 22 ảnh cần tìm; chỉ 2 dùng được. Lý do ở mục Quyết định.

**Quyết định**
- **Bài một vẽ cả kệ Chơi (9 món) và cả câu q1, q2, q3 (lựa chọn), hình câu q4.** Commons và Openverse (11/11) không có ảnh hợp giấy phép mà không người, không nhãn hiệu cho: đèn bàn đang sáng, áo bay trên dây phơi, khói mái bếp, bông gòn, chum ngoài sân, chậu cây, áo ướt trên móc. Ảnh dùng được lẻ (vòi sen PD, lá đọng mưa, cây dừa trước gió, thóc phơi cắt bỏ người) bị bỏ vì kệ phải cùng một loại hình.
  - Quạt bàn của kệ dùng lại quạt vẽ của bài hai; diều vẽ mới (diều hình chim, hai dải ruy băng hồng), `q5` dùng lại diều này (một vật một hình trong bài).
  - Hình câu q3 dùng lại `tray_dark` bài ba (mây đen trên cánh đồng, làng xa).
- **Bài bốn vẽ `explore_flood`** và vì thế cả câu q1. Ảnh lũ Việt Nam trên Commons hoặc có biển chữ, hoặc là ảnh bão Ketsana 2009 có người chết (tên trận bão nằm trong tên ảnh CC BY, phải giữ), trái Quy ước hình mục bốn. `q1_cracked` dùng lại `tray_cracked`, `q1_green` dùng lại ruộng lúa vẽ của *Hô hấp*. Hình ghép `explore_seasons` ghép hai hình vẽ.
- **Thẻ thưởng `floating_season` vẽ**: ảnh mùa nước nổi chỉ có ảnh vệ tinh thấy đất liền (gần bản đồ) hoặc ảnh Biển Hồ Campuchia có người.
- **Đồng hồ treo tường** (bài hai `q3_clock`, bài ba `w1_clock`) dùng lại hình vẽ `tray_clock` của *Não bộ* (mặt chỉ có vạch), cả hai trỏ thẳng hình gốc.
- **Ống gió** (theo nhắn của phiên chính): miệng ống ở cột hứng gió, đuôi chỉ sang phải; cỏ trong hình, dải ruy băng, lá cờ thuyền, tre và cây ở bờ sông cùng ngả sang phải.
- Bài ba, bốn, năm vẽ theo brief; các cảnh dùng chung vẽ một lần: một khoảng sân năm kiểu thời tiết (q3, q4 ba bản, q6 nhìn qua cửa kính), một cánh đồng ba mùa và bản bốn dải `q1_whole_year`, một phong cảnh núi, sông, ruộng trũng, đường đắp cao, đồi (ô Mưa ở nơi xa, q4 và ba bản đánh dấu bằng vầng sáng vàng nhạt), một con ngõ nước chảy và nước nông.

**Đề xuất cho content-editor** (designer không sửa `.md`; alt giữ nguyên trừ chỗ ghi)

| Bài · key | Hiện tại | Đề xuất |
| --- | --- | --- |
| 1 `tray_puddle`, `tray_shadow`, `tray_shower`, `tray_wet_leaf`, `tray_lamp`, `tray_rice`, `tray_bending`, `q1_shirt`, `q1_road`, `q1_pond`, `q2_smoke`, `q2_cotton`, `q2_water`, `q3_jar`, `q3_chillies`, `q3_plants`, `q4` | `[ảnh]` | `[hình vẽ]`, nội dung tả giữ (hình vẽ đúng brief; `tray_bending` là hàng dừa) |
| 1 `tray_fan` | Dùng lại `q3_fan` ở `ho-hap/vi-sao-ta-phai-tho` | "Dùng lại hình `tray_fan` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`." |
| 1 `tray_kite` | Dùng lại `tray_kite` ở `ho-hap/vi-sao-ta-phai-tho` | "[hình vẽ] Diều hình chim màu vàng có hai dải ruy băng hồng, bay cao giữa trời xanh có mây." |
| 1 `q5` | Dùng lại `tray_kite` ở `ho-hap/...` | "Dùng lại hình `tray_kite`." (trong bài) |
| 1 `q3` | `[ảnh]` mây đen trên làng | "Dùng lại hình `tray_dark` ở bài `thoi-tiet-va-thien-tai/mua-mua-bao`."; alt "Dark clouds over the rice fields" · "Mây đen kéo tới trên cánh đồng lúa" |
| 1 Ghi chú cho hoạ sĩ | "ảnh chụp thật cho mọi cảnh…" | kệ Chơi, q1, q2, q3 và hình q4 là hình vẽ |
| 2 `w1_kite` | Dùng lại `tray_kite` ở `ho-hap/...` | "Dùng lại hình `tray_kite` ở bài `thoi-tiet-va-thien-tai/nang-mua-gio-may`." |
| 2 `q3_clock` | `[hình vẽ]` | "Dùng lại hình `tray_clock` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`." |
| 3 `w1_clock` | Dùng lại `q3_clock` ở `.../do-thoi-tiet` | "Dùng lại hình `tray_clock` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`." |
| 4 `explore_flood` | `[ảnh]` | `[hình vẽ]` (cánh đồng, đường làng ngập nước đục; hàng cây, cọc rào đứng trong nước; nhà xa nguyên vẹn; trời xám); bỏ câu "nếu chỉ có ảnh có người…" |
| 4 `q1_cracked` | Dùng lại `q2` ở `be-mat-trai-dat/dong-dat-va-song-than` | "Dùng lại hình `tray_cracked`."; alt "A dry, cracked rice field" · "Thửa ruộng khô nứt nẻ" |
| 4 `q1_green` | Dùng lại `q2_rice` ở `khung-long/trai-dat-rat-lau-ve-truoc` | "Dùng lại hình `tray_rice` ở bài `ho-hap/giu-phoi-khoe`." (alt giữ) |
| 4 `explore_seasons` | phải là ảnh `q2` ở `be-mat-trai-dat/...` | phải là hình `tray_cracked` của kệ; hai nửa đều hình vẽ |
| 4 `reward.floating_season` | `[ảnh]` | `[hình vẽ]` đồng ngập mênh mông, hai hàng cây nhô lên, xuồng nhỏ ở xa, trời trong |

`vocab.crop` (ảnh lúa *Khủng long*), `vocab.drought` và ô `explore_drought` (ảnh đất nứt) giữ ảnh chụp, vì không nằm trong câu nào phải toàn hình vẽ.

**`images fetch content/images/discoverer/thoi-tiet-va-thien-tai`** (lượt cuối): 5 file chọn ảnh · 18 ảnh khác nhau (2 mới, 16 dùng lại đã có) · 1 hình ghép · **0 lỗi**. Hình tự vẽ xử lý tại máy. Còn một dòng "Kiểm tay" cho ảnh mây Flickr (đã kiểm, ở trên). Commons không trả 429 lượt nào trong lượt tìm hôm nay (khoảng 40 lượt API, giãn 2,5 s).
- Openverse: designer dùng 3 lượt (2 tìm, 1 kiểm chi tiết khi fetch); tổng hôm nay 25/190. Đã sửa `content/.build/images/.cache/openverse-usage.json` thành 25, vì 2 lượt chạy ngoài bộ đếm của repo.

**`tray_toy_fish` (*Hô hấp*, SK-036): không đạt, chưa ghi vào `vi-sao-ta-phai-tho.json`.**
- Ảnh "Fishing without water--or fish!" (PD, 6000×4000): con cá nhựa xanh treo ở đầu cần, vùng cắt không có người (còn mẩu đầu cần vàng và sợi dây).
- Nhưng `images fetch` chỉ tải bản 1280 px của Commons (dev 10/11), nên vùng cắt còn khoảng 140×200 px. Ô kệ trên iPhone cần khoảng 480×300 px: hình phóng 3 lần, nhoè, lệch hẳn với tám ảnh nét trên kệ. Bản thử: scratchpad phiên chính `sk038/toyfish/fish_crop.jpg`.
- Hướng còn lại (chờ main session hoặc Duy): (1) dev cho fetch tải bản lớn hơn cho mục có `crop` nhỏ; (2) đổi món như đề xuất trước: "Vỏ ốc biển" (dùng lại `tray_shell` *Núi lửa*) hoặc "Chiếc thuyền giấy".

**Chưa chắc**
- Hình vẽ nhanh, nên xem trên máy: vũng nước (mép rõ như cái hồ), sân thóc, phối cảnh con ngõ ngập (bài năm), giếng gần cạn nhìn từ trên. Trẻ trong hình chỉ cao khoảng 60 pt trong ô lưới.
- Ảnh lều khí tượng sau khi cắt chỉ 602×691 px (thẻ thưởng); ảnh mây 1024×684.
- Bài một chỉ còn một ảnh chụp mới; nếu Duy muốn kệ Chơi bài một là ảnh chụp thì phải tìm đủ chín món, khó nhất là đèn bàn đang sáng không logo.
- Bài một q3: đáp án `q3_rice` vẫn là hình của kệ Chơi (nay là hình vẽ), như "Còn chưa chắc" 3 của biên tập.

## content-editor 11/11 · theo hình

Đã áp đủ bảng "Đề xuất cho content-editor" ở mục designer trên. Không chạy lệnh; không đổi dòng `id:` nào; không thêm, bớt khoá hình.

- **Đối chiếu 5 file chọn ảnh:** mục `own` khớp brief `[hình vẽ]` từng bài (19 · 15 · 16 · 21 · 19, cộng 90). Còn đúng 2 brief `[ảnh]`, là 2 ảnh nguồn mới (bài một `explore_cloudy`, bài hai `reward.weather_box`). Một `[sơ đồ ghép ảnh]` (bài bốn `explore_seasons`, hai nửa là hình vẽ `explore_flood` và `tray_cracked`). Các dòng "Dùng lại hình" trỏ đúng `same_as`: bài một `tray_fan` → bài hai; `q5` → `tray_kite` (trong bài); `q3` → `mua-mua-bao/tray_dark`; bài hai `w1_kite` → bài một `tray_kite`; bài hai `q3_clock`, bài ba `w1_clock` → `nao-bo-va-giac-quan/nao-dieu-khien-co-the/tray_clock`; bài bốn `q1_cracked` → `tray_cracked`, `q1_green` → `ho-hap/giu-phoi-khoe/tray_rice`.
- **Alt đổi (hai chỗ):** bài một hình câu `q3` "Dark clouds over the rice fields" · "Mây đen kéo tới trên cánh đồng lúa"; bài bốn `q1_cracked` "A dry, cracked rice field" · "Thửa ruộng khô nứt nẻ". VoiceOver đọc alt mới; không phải clip TTS.
- **Ghi chú cho hoạ sĩ** bài một, hai, ba, bốn viết lại theo loại hình mới (số hình tự vẽ, ảnh nguồn mới, danh sách dùng lại). Ghi chú `>` ở các câu có hình đổi sửa theo ("ảnh" → "hình vẽ").
- **`_topic.md`:** Quy ước hình mục hai (bài một, bài bốn theo hình designer), mục tám (ví dụ diều, ruộng lúa); bảng Hình dùng chung (bỏ dòng diều, quạt của *Hô hấp*; thêm `ho-hap/giu-phoi-khoe tray_rice`, `nao-bo-va-giac-quan/nao-dieu-khien-co-the tray_clock`; sửa dòng *Động đất*, *Khủng long*, bài hai, bài ba theo chỗ dùng mới).
- **Chữ trẻ nghe:** không đổi câu nào (nhãn, câu hỏi, gợi ý, giải thích, câu ví dụ giữ nguyên). Không cần sinh lại clip.
- **Bài năm:** không phải sửa (đã khớp file chọn ảnh).
- **Còn chưa chắc:** bài một q4 vẫn là ba ảnh chụp ô Học (nắng, mưa của *Núi lửa*, mây mới), còn hình câu q4 là hình vẽ; đúng luật "một loại hình cho các lựa chọn", nhưng nhờ tester nhìn trên máy xem có lệch mắt không.
