# SK-058 · Explorer #9 "Núi, sông và biển" (Mountains, rivers and seas, 6 bài)

Trạng thái: review (19/11: soạn xong, tester 0 lỗi chặn; chờ Duy review, xem "Còn mở cho Duy" ở cuối) · Ngày: 2026-11-19 · Phụ trách: content-editor (soạn) · designer (ảnh) · dev (đổi tên bài trong danh mục nếu Duy sửa) · phiên chính chạy lệnh · Tester: tester
Nguồn: Duy 19/11 (cách (a), [SK-057](SK-057-explorer-catalog-earth-sky.md)); [docs/syllabus-review-2026-11-18.md](../syllabus-review-2026-11-18.md) mục 2 (nguyên tắc N, Explorer mức **thấy**: kể tên, nhận ra), 3.4, 4.1 (#9, 6 bài mới); `content/syllabus.json` (key `new-mountains-rivers-and-seas` sau SK-057); `content/TEMPLATE.md`, `content/rules.json` (`explorer.authoring`); chính sách hình (CC0, PD, CC BY; không AI); SK-031 (bản đồ bài 2 còn chờ duyệt pháp lý); SK-053 (khuôn gần nhất)

> **19/11: xong, chờ Duy review.** Duy chốt 6 bài và khuyến nghị 19/11 (mục "Duy chốt"); kết quả và việc còn mở ở hai mục cuối "Nghiệm thu (PM 19/11)" và "Còn mở cho Duy".

## Mục tiêu

Bé Explorer 5–7 tuổi nhìn ảnh phong cảnh mà gọi tên và nhận ra được núi, đồi, đồng bằng, sông, hồ, bãi biển, đảo, vịnh và hang động, kể được vài nơi ở Việt Nam (Fansipan, sông Hồng, Hạ Long, Phong Nha), và biết chỉ ra sông, ra biển, vào hang cùng người lớn.

## Phạm vi / Ngoài phạm vi

### Phạm vi

- Thư mục `content/explorer/nui-song-va-bien/`: `_topic.md` và 6 bài; file chọn ảnh `content/images/explorer/nui-song-va-bien/*.json`.
- `_topic.md`: `age_group: explorer`, `order: 9`, `strand: earth_sky`, `level` (content-editor chấm, tạm 1), `is_free: false`, `sensitive: false`, `ai_draft: true`, không `oak_unit_ref`. `prerequisites` gợi ý: `noi-song-tren-trai-dat`, `thoi-tiet-va-cac-mua`. Câu hỏi lớn gợi ý: "What does the land around us look like?" · "Mặt đất quanh em trông thế nào?".
- Thẻ thưởng: bộ mới (gợi ý `set: landforms`, "Landform cards" · "Thẻ cảnh đẹp"; ios-dev thêm khoá `collectible.set.landforms`).

**Danh sách 6 bài đề xuất** (từ bản rà mục 4.1; dự kiến, Duy chốt):

| # | Bài (EN · VI) | Ý chính dự kiến (mức **thấy**) | `stage` gợi ý |
| --- | --- | --- | --- |
| 1 | Land and sea · Đất liền và biển | Nhìn từ trên cao (máy bay, đỉnh đồi): mặt đất có chỗ cao, chỗ phẳng, chỗ có nước. Giới thiệu năm bài sau | `opener` |
| 2 | Mountains and hills · Núi và đồi | Núi cao, dốc; đồi thấp, tròn. Fansipan là núi cao nhất Việt Nam | `core` |
| 3 | Plains and rice fields · Đồng bằng và ruộng lúa | Đồng bằng là đất phẳng, rộng, thường gần sông; trên đồng bằng có ruộng lúa | `core` |
| 4 | Rivers and lakes · Sông và hồ | Sông dài, nước chảy; hồ có bờ bao quanh, nước đứng yên. Sông Hồng, sông Mê Kông; Hồ Gươm, hồ Ba Bể | `core` |
| 5 | Beaches, islands and bays · Bãi biển, đảo và vịnh | Bãi cát, bãi đá; đảo có nước bao quanh; vịnh là chỗ biển lượn vào đất liền. Vịnh Hạ Long có nhiều đảo đá | `core` |
| 6 | Caves · Hang động | Hang là khoảng trống lớn trong núi đá, tối và mát. Phong Nha, Sơn Đoòng | `review` (Khởi động ôn trộn bài 1–5) |

Đổi so với bản rà: bài 1 bỏ phần "Trái Đất nhìn từ trên cao" trong tên (lý do ở câu 1 dưới).

### Ngoài phạm vi

- Vì sao, thế nào: núi hình thành ra sao, phù sa bồi đắp, hang do nước bào mòn đá vôi, vòng tuần hoàn nước. Phần này để Discoverer #9, Scientist #3 (mức **biết**, **hiểu**).
- Núi lửa, động đất, châu lục, tên đại dương (Discoverer #1); thác nước, hẻm núi, nước ngầm (Discoverer #9); đá, đất (Discoverer #6); biển đảo Việt Nam và chủ quyền (Discoverer #8 bài 7).
- Đường đi của nước từ suối ra sông, ra biển (#10 bài 3); bài an toàn gần nước đầy đủ (#10 bài 6). *(19/11 lượt 2, [SK-061](SK-061-explorer-10-sky-day-and-night.md): Duy bỏ #10 *Nước quanh em*, ý nước để Discoverer #9; #11 thành #10 và không còn bài "Trái Đất là quả cầu", ý này lên Discoverer #7. Ranh giới của #9 giữ nguyên, content-editor sửa ghi chú trỏ số.)*
- Biển mặn, rạn san hô, biển sâu, con vật biển (đã dạy ở #4 bài 5); rừng ngập mặn, đầm lầy (#4 bài 4).
- Trái Đất là quả cầu, ảnh Trái Đất từ vũ trụ (#11 bài 6).
- Trồng lúa, cấy, gặt (Discoverer #11 bài 9 cây lúa).
- Tiếng vọng trong hang, dơi định vị bằng âm thanh (Discoverer #13).
- Bản đồ, quả địa cầu, ảnh vệ tinh (câu 2 dưới).

## Câu hỏi cho Duy

Mỗi dòng là một đề xuất PM; Duy nói "ok" hoặc sửa từng số.

1. **Ranh giới với #11 bài 6 (Trái Đất là quả cầu).** Bài 1 chỉ dùng ảnh chụp từ máy bay, flycam, đỉnh đồi; không ảnh Trái Đất từ vũ trụ, không nói Trái Đất tròn. Tên bài rút còn "Đất liền và biển".
2. **Ranh giới với #10 Nước quanh em.** Bài 4 chỉ dạy nhận ra sông (dài, nước chảy) và hồ (bờ bao quanh, nước đứng yên). Đường đi suối → sông → biển để #10 bài 3; mưa để #10 bài 2.
3. **Ranh giới với #4 bài 5 *Biển và đại dương*.** Bài 5 dạy hình dạng bờ biển (bãi, đảo, vịnh). Không làm lại "biển mặn", rạn san hô, con vật biển; con vật chỉ xuất hiện làm cảnh.
4. **Ranh giới với Discoverer.** Explorer dừng ở mức thấy: gọi tên, nhận ra, kể một nơi ở Việt Nam. Không câu "vì sao", không núi lửa, thác, hẻm núi, phù sa, cách hang hình thành. Xoắn ốc lên Discoverer #1, #8, #9 và Scientist #3.
5. **Không dùng bản đồ, vì pháp lý Hoàng Sa, Trường Sa.** Chỉ dùng ảnh phong cảnh: 0 bản đồ, 0 quả địa cầu, 0 ảnh vệ tinh vùng biển, 0 hình nét bờ biển Việt Nam. Chữ bé nghe không nêu Hoàng Sa, Trường Sa hay tên biển ("Biển Đông", "East Sea", "South China Sea"); để Discoverer #8 bài 7, sau khi duyệt pháp lý. Đảo lấy ví dụ đảo ven bờ: Cát Bà, Phú Quốc, Lý Sơn.
6. **Ảnh Hạ Long, Phong Nha, Sơn Đoòng chỉ dùng CC0, PD, CC BY.** Phần lớn ảnh trên Commons là BY-SA; ảnh Sơn Đoòng đẹp thường có bản quyền riêng. Tên một nơi chỉ vào chữ bé nghe khi có ảnh đúng nơi đó với giấy phép hợp lệ. Thiếu ảnh thì dùng ảnh hang hay vịnh chung, chữ nói "hang động", "vịnh" và bỏ tên nơi. Tên nơi bị bỏ được ghi ở `_topic.md`.
7. **An toàn ở sông, biển, hang.** Bài 4, 5, 6 mỗi bài có một câu trong ô Học: "Chỉ ra sông, ra biển, vào hang cùng người lớn". Câu này không thành câu quiz. Ảnh không có trẻ bơi một mình, lũ, tai nạn, người đuối nước. Bài an toàn gần nước đầy đủ là #10 bài 6.
8. **Bài 3 ruộng lúa và nguyên tắc N1 (tự nhiên là chính).** Giữ tên bài. Ý chính là đồng bằng, một địa hình tự nhiên; ruộng lúa chỉ là hình ảnh quen để bé nhận ra đồng bằng (theo N5: "bắt đầu từ cái trẻ thấy được"). Không dạy trồng lúa. Không lấy ruộng bậc thang làm ví dụ đồng bằng, vì ruộng bậc thang nằm trên núi, dễ làm bé lẫn.

## Tiêu chí nghiệm thu (PM chốt sau khi Duy trả lời 19/11; tick 19/11 kèm bằng chứng)

### content-editor
- [x] `_topic.md` đủ các mục như `lon-len/_topic.md`, gồm Ranh giới (câu 1–4), An toàn (câu 7), Quy ước hình (câu 5, 6), Còn mở. Tên 6 bài khớp `content/syllabus.json` từng chữ. — `validate` 0 lỗi; `_topic.md` có mục Pháp lý và tên nơi, Quy ước hình, Còn mở; tester rà chữ lượt 1–2.
- [x] Mỗi bài theo luật Explorer: Khởi động 2–3 câu DOK 1 có `recall_from`; Quiz 6 câu DOK 1·1·1·2·2·2; đúng một misconception ở câu 6, key không trùng các key Explorer đã có (grep `^misconception:` trong `content/explorer/`); chỉ `single_choice`, `true_false`, `order_sequence`; câu EN tối đa 8 từ; SK-044, SK-047 đạt. — tester rà chữ lượt 2: 3 lỗi chặn lượt 1 đóng cả ba, câu EN ≤ 8 từ (đếm theo từng câu); bảng `KeyPointPictures` 57/57 dòng khớp gói.
- [x] Grep chữ bé nghe (EN, VI): 0 kết quả "Hoàng Sa", "Trường Sa", "Biển Đông", "East Sea", "South China Sea", "bản đồ", "map", "globe", "quả địa cầu", "núi lửa", "volcano", "phù sa". — tester lượt 1–2 và rà ảnh lượt 2: 0 kết quả (thêm "Phong Nha", "icicle").
- [x] Mọi sự thật chưa chắc có dòng `> [CẦN KIỂM]` (ví dụ: độ cao Fansipan, "hang lớn nhất thế giới", số đảo Hạ Long). — `validate`: 7 cảnh báo `md_needs_check` (51 dòng); chờ người chuyên môn.

### designer
- [x] Mọi chỗ có hình có mục trong file chọn ảnh; 0 chỗ trống. Ảnh chỉ CC0, PD, PDM, CC BY có ghi công; 0 BY-SA, NC, ND; đã mở trang gốc kiểm. `images fetch` 0 lỗi. — tester rà ảnh lượt 3: 204/204 chỗ, 34 ảnh khác nhau, CC0 26 · PD 7 · PDM 1 · CC BY 14 (theo mục), 0 BY-SA/NC/ND; `images fetch` 0 lỗi, 0 lệch khung; ba ảnh Flickr mới tester mở trang gốc khớp.
- [x] 0 bản đồ, quả địa cầu, ảnh vệ tinh; ảnh có tên nơi đúng là nơi đó (khớp trang gốc). Không có cảnh nguy hiểm như ở câu 7. — tester rà ảnh lượt 1–3; tên nơi không chắc (động Phong Nha) đã bỏ, ghi ở `_topic.md` "Tên nơi đã bỏ".

### tester · phiên chính
- [x] Tester rà chữ và ảnh theo khuôn SK-053: 0 lỗi chặn. — rà chữ 2 lượt, rà ảnh 3 lượt; lượt cuối 0 lỗi chặn, 0 mục mới cần sửa.
- [x] `validate` 0 lỗi; `ids`; `images fetch`; `tts` EN, VI; `build`; `check-pack` OK; chơi trọn một bài trên iPhone 16. — `validate` 0 lỗi (7 cảnh báo); gói build lại, `check-pack` OK (16 chủ đề); content-cli 401/401; iOS 418/418 trên iPhone 16; chạy thử bài 1, 3, 5, 6 đạt (bài 6 tới màn Thưởng, bộ "Landform cards" 1/6).

## Phụ thuộc

- SK-057 (danh mục có key và 6 bài); Duy trả lời "Câu hỏi cho Duy".
- Nên mở sau khi Duy review SK-051, SK-053 (khuôn soạn Explorer mới nhất).

## Duy chốt (19/11)

- **Khuyến nghị 1 (bài 1):** sửa theo Duy — ngoài ảnh chụp từ máy bay, flycam, đỉnh đồi, **được vẽ thêm hình minh hoạ** (giấy cắt style E) để minh hoạ đất liền và biển. Vẫn giữ: không ảnh/hình Trái Đất từ vũ trụ, không quả cầu (để #11); không bản đồ, không hình bờ biển Việt Nam (khuyến nghị 5). Hình vẽ theo luật Explorer: trong một câu quiz và trên một kệ Chơi chỉ một kiểu (ảnh chụp hoặc hình vẽ); đáp án đúng không là hình vẽ duy nhất.
- Các khuyến nghị 2–8 và danh sách 6 bài: chờ Duy trả lời tiếp.
- **Duy 19/11 ("tiếp tục làm"):** khuyến nghị 2–8 và danh sách 6 bài chốt theo đề xuất PM (Duy chỉ sửa khuyến nghị 1). Trạng thái → in_progress. Phiên chính gắn `topic_id` và 6 `lesson_id` cho `new-mountains-rivers-and-seas` trong `content/syllabus.json`.

## Bản soạn content-editor (19/11) và quyết định phiên chính (auto, theo PM)

Đã soạn `content/explorer/nui-song-va-bien/` (`_topic.md` + 6 bài, `ai_draft: true`); phiên chính chạy `ids` (theo thứ tự) và `validate`: 0 lỗi, 7 cảnh báo `[CẦN KIỂM]`. 203 chỗ có hình, 30 ảnh mới, 4 hình vẽ (chỉ bài 1: `explore_above`, `q4_only_land`, `q4_land_sea`, `q4_only_water`), 0 hình ghép. Bộ thẻ `set: landforms`.

Quyết định cho các câu content-editor hỏi:
1. **Tên nơi:** khuyến nghị 6 chỉ áp cho tên nơi gắn với ảnh (ảnh phải đúng nơi, giấy phép hợp lệ; thiếu thì dùng câu dự phòng). Tên nơi chỉ ở lời ví dụ, không gắn ảnh (Cát Bà, Phú Quốc, Lý Sơn, Hồ Gươm, sông Hồng, Hà Nội) giữ được.
2. **Tên bộ thẻ:** "Landform cards" · "Thẻ núi sông".
3. **Ba misconception chưa có nguồn** (`land_all_flat`, `plain_is_one_field`, `caves_are_small`): giữ, để `[CẦN KIỂM]` cho người chuyên môn.
4. **Nhũ đá:** không tự đặt thuật ngữ. Từ EN dùng "stalactite" (VI "nhũ đá"), lời giải thích cho trẻ có thể tả "like an icicle made of rock"; tester xem có vượt luật từ theo tuổi không.
5. **Sơn Đoòng:** dùng thẻ dự phòng nếu không có ảnh hợp lệ.
6. **Ảnh ao q4 bài 4:** designer chọn theo phương án đã ghi.
7. **TEMPLATE (không dùng giấy cắt cho hình nội dung):** PM cập nhật cho khớp quyết định Duy 19/11 (hình vẽ được dùng khi Duy cho phép theo chủ đề).

## Rà chữ (tester 19/11)

> Lượt 1. Phạm vi: **chữ** của `_topic.md` và sáu bài trong `content/explorer/nui-song-va-bien/`, theo khuôn SK-053. Chưa kiểm: ảnh thật và giấy phép (chưa chọn xong), `images fetch`, `tts`, `build`, `check-pack`, chơi thử trên simulator. Đã chạy: `import` (0 lỗi, 7 cảnh báo `md_needs_check`) ra `content/.build/json`, rồi bốn script kiểm của tester trên JSON (`KeyPointPictures.match`, đếm từ EN theo từng câu, soi `feedback`/`hint`/hình, soi chữ cấm và chuỗi "Dùng lại hình").
>
> **Kết quả: 3 lỗi chặn (C1–C3), 12 mục nhỏ (n1–n12).**

### Đã kiểm bằng máy — đạt

- Danh mục: `new-mountains-rivers-and-seas` trong `content/syllabus.json` khớp từng chữ tên chủ đề và sáu tên bài; `topic_id` và sáu `lesson_id` khớp `id:` ở frontmatter; `level: 1` khớp `difficulty` 1-1-1-2-1 (sáu điểm).
- Sáu bài: DOK quiz đều `1·1·1·2·2·2`; đúng **một** câu `misconception` và luôn ở q6; sáu q6 đều `true_false` đáp án Sai; format đủ (bài 1, 3, 5 hai format; bài 2, 4, 6 ba format); số lựa chọn `single_choice` 2–3, `order_sequence` 3 thẻ.
- Sáu `explanation_correct` của q6 **đúng từng chữ** câu `correction` ở `_topic.md` (máy so). Sáu key misconception mới không trùng nhau, không trùng key Explorer đã có, mỗi key dùng một lần. Hai mươi bốn key từ vựng không trùng nhau và không trùng từ Explorer đã có. Sáu key thẻ `_card` chưa có ở Explorer.
- Khởi động: bài 1–5 hai câu, bài 6 ba câu; mọi câu DOK 1, chỉ `single_choice`/`true_false`, câu nào cũng có `recall_from.lesson` trỏ bài có thật.
- SK-044 / SK-047: 0 lựa chọn sai thiếu `feedback`; 0 lựa chọn đúng thừa `feedback`; mọi câu có `hint` và có hình; mọi lựa chọn, thẻ `order_sequence`, món Chơi, ô Học có hình; `true_false` nào cũng có `feedback` đúng phía; 0 câu có `labels`.
- Đúng/Sai: 26 câu — 12 Đúng, 14 Sai; bỏ sáu q6 thì 12/8; bài nào cũng có cả hai — khớp bảng `_topic.md`.
- Chữ cho trẻ: **mọi câu EN ≤ 8 từ** (đếm theo từng câu, cả `feedback`, `hint`, giải thích, ví dụ ô Học, lời nhắn Chơi, thẻ); `.en` không có dấu tiếng Việt; VI không có chữ số, không ký hiệu.
- Grep chữ bé nghe (EN và VI, bỏ dòng `>` và `brief`): **0 kết quả** "Hoàng Sa", "Trường Sa", "Biển Đông", "East Sea", "South China Sea", "Paracel", "Spratly", "bản đồ", "map", "globe", "quả địa cầu", "Earth", "Trái Đất", "núi lửa", "volcano", "phù sa", "silt", "ruộng bậc thang", "terrace", "thạch nhũ", "erosion", "bào mòn", "because"; **0 câu "vì sao", "why", "tại sao"**.
- Ranh giới: "salty" · "mặn" chỉ ở hai câu Khởi động (bài 1 w1, bài 4 w2) — đúng khuyến nghị 3; 0 "coral", "san hô", "mangrove", "ngập mặn"; 0 "trồng lúa", "cấy", "gặt", "harvest", "nông dân" — đúng khuyến nghị 8; 0 "lũ", "sóng thần".
- An toàn: câu "with a grown-up" · "cùng người lớn" đúng **ba chỗ**, cả ba là ví dụ ô Học (bài 4 ô River, bài 5 ô Sandy beach, bài 6 ô Cave); không chỗ nào thành câu Khởi động hay Quiz — đúng khuyến nghị 7.
- Loại hình: kệ Chơi sáu bài **toàn ảnh chụp**; bốn hình vẽ đúng bốn chỗ ở bài 1 (`explore_above` ở ô Học, q6, bài 2 w1; ba lựa chọn q4); câu q4 bài 1 là ba hình vẽ, không trộn ảnh; bài 2–6 không có hình vẽ.
- **Đáp án đúng không nổi bật:** chạy lại máy sau khi phân giải hết chuỗi "Dùng lại hình" — 0 câu có đáp án là ảnh mới duy nhất giữa các ảnh quen, 0 câu có đáp án là ảnh quen duy nhất giữa các ảnh mới.
- `alt` của lựa chọn đúng: 0 chỗ chứa chữ của câu hỏi (máy so từ). Kệ Chơi 6–8 món mỗi bài; mỗi món bẫy giống một nhóm bắt buộc; `has_limited` đúng với mọi món bẫy của từng bài.
- Ghép ý chính ↔ ô Học: chạy lại `KeyPointPictures.match` trên JSON — kết quả khớp **từng ô** với bảng "Ghép ý chính" ở `_topic.md` (18 ý, 6 ô không ghép đúng như bảng). Xem n1 cho chỗ ghép đúng máy nhưng lệch ý.
- `_topic.md` và bài: 17/18 câu ý chính khớp bảng Tổng quan (chỗ lệch: n3).

### Lỗi chặn (3)

**C1 · Bài 3: câu q3 bắt bé trả lời Đúng cho đúng cái ý mà q6 dạy là sai.**
`03-dong-bang-va-ruong-lua.md:382–383` q3 `prompt`: "Green rice fields cover the plains." · "Ruộng lúa xanh **phủ khắp** đồng bằng." (Đúng) — cùng chữ với câu chính ô Học `explore_rice` `03:152–153` và `explanation_wrong` `03:392–393`.
Ba câu sau, `03:461–462` q6 (`plain_is_one_field`): "A plain is just one big field." · "Đồng bằng chỉ là một cánh đồng to." (Sai), lý do ở `03:469–470` là "đồng bằng **còn có** làng, có phố".
Với bé 5–7, "ruộng lúa phủ khắp đồng bằng" và "đồng bằng chỉ là một cánh đồng to" là cùng một ý. Bé trả lời nhất quán theo q3 sẽ gật đầu ở q6 và **bị chấm sai**. VI còn mạnh hơn EN: "cover" thành "phủ khắp". Lặp lại ở `04-song-va-ho.md:54–55` w1 `explanation_correct`, nơi EN đã nhẹ ("Rice fields cover **many** plains.") nhưng VI vẫn "Ruộng lúa **phủ khắp** đồng bằng".
Tái hiện: bài 3 → Quiz → q3 chọn Đúng (được khen) → q6 chọn Đúng (bị báo sai).
Mong đợi: hai câu không đá nhau; q3 nói "trên đồng bằng có nhiều ruộng lúa".
Thực tế: q3 dạy ruộng phủ kín đồng bằng, q6 chấm sai chính ý đó.
Đề xuất (ba chỗ cùng một chữ): `prompt` và câu ô Học → "Many rice fields grow on the plains." · "Trên đồng bằng có nhiều ruộng lúa."; `explanation_wrong` `03:392–393` → "This is true. Plains have many rice fields." · "Câu này đúng. Đồng bằng có nhiều ruộng lúa."; `04:55` → "Đúng rồi! Nhiều đồng bằng có ruộng lúa." Cập nhật `_topic.md:274` (bảng Đúng/Sai). Đã tính lại `KeyPointPictures.match` với câu ô Học mới: kết quả ghép **không đổi** (vẫn 3 điểm, vẫn hoà với ô Villages and towns).

**C2 · Bài 3: cùng một ảnh là "đồng bằng" ở Quiz và là "ruộng lúa" ở Chơi — chính là quan niệm sai của bài.**
`03-dong-bang-va-ruong-lua.md:248–254` món `tray_plain`: `label` "Wide fields" · "Cánh đồng rộng", `group: tray_ricefields` (nhóm "Rice fields" · "Ruộng lúa"), hình là `Dùng lại hình explore_plain`.
`explore_plain` (`03:119`) là ảnh **toàn cảnh đồng bằng**, brief bắt buộc "vài cụm làng có mái nhà và cây xanh nằm giữa ruộng"; cũng chính ảnh đó là đáp án q1 "Which picture shows a plain?" (`03:338–344`), là hình của q5, q6, và `feedback_true` q6 (`03:473–474`) nói "Look, houses stand among these fields." · "Nhìn kìa, giữa ruộng còn có nhà cửa."
Tức là ở màn Chơi, app **chấm đúng** khi bé xếp ảnh-đồng-bằng-có-làng vào nhóm "Ruộng lúa"; ở màn Quiz, cùng ảnh đó lại là "đồng bằng", và những ngôi nhà trong ảnh là bằng chứng để bác bỏ "đồng bằng chỉ là một cánh đồng". Hai màn của **cùng một bài** dạy ngược nhau, đúng vào `plain_is_one_field`.
Tái hiện: bài 3 → Chơi → chọn "Cánh đồng rộng" + "Làng quê" + "Dòng sông" → `balanced` (ví dụ kiểm đầu tiên ở `03:557`) → Quiz q1 cùng ảnh đó là "đồng bằng".
Mong đợi: ảnh toàn cảnh đồng bằng không nằm trong nhóm "Ruộng lúa".
Thực tế: nằm trong, và là món đầu kệ.
Đề xuất: bỏ món `tray_plain` (kệ còn sáu món, vẫn trong khoảng 6–8), hoặc đổi hình của nó sang một ảnh ruộng lúa khác (không phải `explore_plain`) và đổi `label` thành "Rice fields" · "Ruộng lúa rộng". Sửa luôn `_topic.md:324` (bảng Chơi ghi "cánh đồng rộng") và ví dụ kiểm `03:557`.

**C3 · Bài 6 dùng thuật ngữ tự đặt "rock icicles", ngược quyết định 4 ở mục trên của ticket này.**
Quyết định 4 (`SK-058` dòng 92): "**không tự đặt thuật ngữ**. Từ EN dùng *stalactite* (VI *nhũ đá*), lời giải thích cho trẻ có thể tả *like an icicle made of rock*".
Bản soạn làm ngược: "rock icicles" là tên gọi chính ở 22 chỗ của bài 6 (`06:176–180` nhãn và câu ô Học, `06:417–427` q3, `06:442–443` nhãn lựa chọn đúng, `06:283–285` món Chơi, `06:614` thẻ dự phòng), và `_topic.md:177` còn ghi "**Không** *stalactite* trong chữ bé nghe (từ khó)", `_topic.md:393` đưa "stalactite" vào danh sách grep cấm.
Hai cái hại, không chỉ là lệch giấy tờ: (a) "icicle" (cột băng) là thứ trẻ Việt Nam chưa thấy bao giờ — giải thích cái lạ bằng một cái lạ hơn; (b) "rock icicles" không phải tên gọi có thật trong tiếng Anh, nên bé học xong sẽ không nhận ra từ này ở bất kỳ đâu khác, và Discoverer sau này phải dạy lại từ đầu.
Tái hiện: đọc bài 6, ô Học thứ ba và câu q3.
Mong đợi: hoặc dùng thuật ngữ thật, hoặc tả bằng chữ thường, không đặt tên mới.
Đề xuất (PM hoặc Duy chốt một, trước khi `tts`): **(a)** theo quyết định 4 — tên EN "stalactite" (như "chrysalis" đã chấp nhận ở SK-053), VI "nhũ đá", câu ô Học "Stalactites hang down from the cave roof.", thêm một ví dụ tả "like a stone icicle"; hoặc **(b)** không đặt tên, tả thẳng: "Long, pointy rocks hang from the roof." · "Những khối đá dài, nhọn rủ xuống từ trần hang", `label` ô "Rocks above" · "Đá trên trần". Dù chọn gì cũng phải sửa `_topic.md:177`, `:393`, `:423`, `:437` (mục Còn mở 4) cho khớp.

### Mục nhỏ (12)

**n1 · Bài 3, thẻ ôn ý chính ba chỉ có ruộng, không có làng.**
`03:29–30` ý 3 "Rice fields, villages and towns are on plains." ghép với ô `explore_rice` (`03:148–156`, ảnh một thửa ruộng lúa), vì hoà 3–3 với ô `explore_village` (`03:166–174`, ảnh "Houses among trees and fields") và máy chọn ô cùng thứ tự. Đây là ý mang nội dung sửa `plain_is_one_field`, mà thẻ ôn lại đúng hình "một cánh đồng". Đề xuất: đổi thứ tự hai ô (Villages and towns lên thứ ba, Rice fields xuống thứ tư) — lúc đó máy ghép ý 3 với ô Villages, và tính lại bảng ở `_topic.md:137`.

**n2 · "cool" dịch thành "mát lạnh", mạnh hơn EN và ngược chính câu `correction`.**
`02:30` ý chính ba, `02:169` nhãn ô, `02:172` câu ô Học, `02:457` q5 `explanation_wrong`, `02:495` q6 `explanation_wrong`, `06:81` w2 `explanation_wrong`, `_topic.md:118`. EN là "cool" (mát); `correction` ở `_topic.md:47` là "mát **hơn**" (so sánh). "Lên cao trên núi, không khí mát lạnh" nói tuyệt đối — không đúng với núi thấp miền Trung, miền Nam mùa hè, và lệch với câu bé nghe ở q6. Đề xuất: dùng "mát" hoặc "mát hơn" ở cả sáu chỗ.

**n3 · Bài 6 ý chính ba: bài và `_topic.md` nói hai kiểu.**
`06:31` "như một **căn phòng khổng lồ**" ‖ `_topic.md:122` "như một **hội trường lớn**" (EN cả hai là "like a big hall"). Chọn một; "căn phòng khổng lồ" còn trùng ý với "rất rộng" ngay trước đó.

**n4 · Bài 5 q5: lời giải thích gọi cái hồ trên màn hình là hòn đảo.**
`05:457–458` `explanation_wrong`: "This is false. That is an island." · "Câu này sai. Đó là hòn đảo." Hình của câu (`05:449–451`) là ảnh **hồ** ("Calm water ringed by trees"). "That" ý nói "đất có nước bao quanh", nhưng bé 5–7 nhìn màn hình sẽ hiểu "cái này là hòn đảo". Đề xuất: "This is false. A lake is the water." · "Câu này sai. Hồ là phần nước, còn đất ở quanh."

**n5 · 14 chỗ "Dùng lại hình" trỏ qua hai chặng, ngược quy ước hình số 14 của chính chủ đề.**
`01:141`, `01:256`, `01:343`, `01:400`, `01:539`; `02:286`, `02:354`, `02:431`, `02:474`; `03:86`, `03:154`, `03:260`, `03:384`, `03:499` đều trỏ `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho` `explore_fields`, mà mục đó cũng là "Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`". `_topic.md:204` yêu cầu "Mọi *Dùng lại hình* trỏ thẳng về mục có ảnh thật" (SK-053 đã kiểm toàn `content/`: 0 chỗ hai chặng). Từ khoá đã chép đúng của ảnh gốc nên designer không chọn nhầm; chỉ cần đổi 14 dòng sang `discoverer/khung-long/trai-dat-rat-lau-ve-truoc` `q2_rice` (hoặc PM cho phép giữ một chặng trung gian và sửa quy ước 14).

**n6 · Ảnh ruộng lúa gốc có "núi ở xa", mà ở đây nó là đáp án "đất bằng".**
Brief gốc `content/discoverer/khung-long/01-trai-dat-rat-lau-ve-truoc.md:476`: "Ruộng lúa xanh ở đồng bằng Việt Nam nhìn rộng, **núi ở xa**". Ảnh này là ô Flat land bài 1 (`01:141`), đáp án q3 "Which one is flat land?" (`01:400`) và thẻ "flat land" trong câu xếp cao → thấp bài 2 (`02:431`). Nhờ designer chọn hoặc crop sao cho không thấy núi rõ, nếu không bé dễ lẫn ngay ở câu phân biệt cao–thấp.

**n7 · VoiceOver: mười câu nhận tên có `label` của đáp án đúng trùng chữ câu hỏi.**
`01:q1` (sea), `01:q4` (land and sea), `02:q1` (mountain), `03:w1` (hill), `03:q1` (plain), `04:q1` (lake), `04:q5` (river), `05:q1` (island), `05:q3` (bay), `06:q1` (cave). Thẻ lựa chọn Explorer **không hiện chữ** (`ExplorerQuestionStep.swift:160–173`: chỉ ảnh; `label` chỉ vào `accessibilityLabel` và lời đọc sau khi chạm), nên bé nhìn không bị lộ — **không chặn**. Nhưng với VoiceOver, đọc hết ba thẻ là biết đáp án mà không cần hiểu ảnh. Đã có tiền lệ (ba chỗ ở `lon-len`, `thoi-tiet-va-cac-mua`, `chuoi-thuc-an`) nhưng ở chủ đề này dày gấp ba. Đề nghị PM và ios-dev chốt một lượt: câu nhận tên thì VoiceOver đọc `alt` (đã cố ý không chứa tên) thay cho `label`.

**n8 · Bài 2 q5: lựa chọn sai hơi nước đôi.**
`02:447–476` "Where would you need a warm coat?" · "Ở đâu em cần mặc áo ấm?" — hai lựa chọn là đỉnh núi (đúng) và ruộng lúa. Mùa đông miền Bắc, ở ruộng cũng phải mặc áo ấm. Ý chính ba là "mùa hè trên đó vẫn mát" (`02:180–181`), nên câu nên chốt mốc thời gian. Đề xuất: "Where is it cool even in summer?" · "Mùa hè, ở đâu vẫn mát?" (bảy từ EN).

**n9 · Hai chỗ VI thêm ý mà EN không có.**
`04:544–545` từ `boat`: "A small boat crosses the river." · "Con đò nhỏ **chở khách** qua sông."; `05:94–95` w2 `explanation_wrong`: "They crawl off into the sea." · "Rùa con bò ra biển **rồi bơi đi**." Không sai, chỉ lệch khuôn "EN và VI cùng nội dung".

**n10 · Nhãn "High land" · "Đất cao" lúc là nhóm đúng, lúc là nhóm bẫy.**
Bài 1 (`01:208–212`) và bài 6 (`06:257–261`) là nhóm **bắt buộc**; bài 3 (`03:241–246`) là nhóm **bẫy** (`do_son`). Đúng chủ ý đã ghi (`_topic.md:331`) và màu khác nhau, nhưng ba bài chơi liền nhau nên xin PM xác nhận một lượt, hoặc đổi nhãn bẫy bài 3 thành "Not on a plain" · "Không ở đồng bằng".

**n11 · Bài 6 q3: lựa chọn sai nằm ngoài hang.**
`06:430–438` lựa chọn sai là "mountain peak" (đỉnh núi) cho câu "What hangs from a cave roof?". Bé loại được mà không cần nhớ bài (đỉnh núi không ở trong hang). Ghi chú `06:428` đã giải thích vì sao không dùng ảnh dơi (nước đôi) — hợp lý; nếu muốn chặt hơn thì lấy một vật khác **trong hang** (nền hang, vách đá) làm lựa chọn sai.

**n12 · Khởi động thiếu mốc "khoảng một tuần".**
`_topic.md:304–316`: bài 2–5 chỉ có mốc "hôm trước" (w1) và mốc rất xa (w2 sang chủ đề khác). Bài 6 w2 cách bốn bài (≈ năm ngày nếu có một ngày nghỉ) là chỗ duy nhất chạm khoảng `warmup.week` (5–10 ngày). Giống mục nhỏ 4 của SK-053; không chặn, nhưng nếu muốn đủ ba mốc thì đổi một câu w2 của bài 4 hoặc 5 sang ôn bài 1, 2 của chính chủ đề.

### Các dòng `[CẦN KIỂM]` — đọc ở mức hợp lý với trẻ 5–7 (không thay người chuyên môn)

51 dòng (bài 1: 3, bài 2: 7, bài 3: 7, bài 4: 4, bài 5: 5, bài 6: 9, `_topic.md`: 16). Đọc thấy **hợp lý, không cần sửa**: Phan Xi Păng cao nhất Việt Nam, gần Sa Pa, mây phủ đỉnh, vài năm có tuyết; miền Bắc nhiều núi; chè trồng trên đồi; không khí trên núi cao mát hơn (xem n2 về cách nói); đồng bằng sông Hồng và sông Cửu Long nằm ven sông lớn; Hà Nội trên đồng bằng; lúa nước cần ruộng phẳng có nước; cò kiếm cá trên ruộng; sông Mê Kông rất dài, chảy qua nhiều nước; nước hồ "đứng yên" ở mức thấy; hồ Ba Bể gồm ba hồ nối nhau; Hồ Gươm, sông Hồng ở Hà Nội; cua trốn khe đá; đảo là đất có nước bao quanh, chân đảo liền đáy biển; nước trong vịnh lặng hơn ngoài khơi; vịnh Hạ Long "hơn một nghìn" đảo (khớp con số Discoverer đã dùng); Cát Bà, Phú Quốc, Lý Sơn là đảo; hang đá vôi, trong hang tối, mát, ẩm, nước nhỏ giọt từ trần; khối nhũ đá chạm nền là cột đá; không chạm vào nhũ đá; động Phong Nha có sông ngầm, thuyền vào được; Sơn Đoòng có rừng trong hố sụt; đường hầm do người đào; dơi ngủ trong hang; mũi đất có biển ba phía.
**Ba chỗ cần người chuyên môn để mắt:** (a) `02:184` + `_topic.md:49` "trên núi mát" — cách nói hiện tại nói quá, xem n2; (b) `_topic.md:40`, `:58`, `:84` ba quan niệm chưa có nguồn (`land_all_flat`, `plain_is_one_field`, `caves_are_small`) — quyết định 3 đã cho giữ, nhưng `plain_is_one_field` chỉ đứng vững nếu sửa C1; (c) `06:192` + `_topic.md:177` tên gọi nhũ đá — đã thành C3.
**Chỗ chưa đánh dấu mà nên có:** định nghĩa "A bay is sea curving into the land." (`05:172–173`) và "A lake has land all around it." (`04:122–123`) chưa có dòng `[CẦN KIỂM]` riêng; cả hai đều đúng ở mức thấy nên chỉ cần thêm vào danh sách "Tên gọi EN" ở `_topic.md:423` cho người chuyên môn đọc một lượt.

### Ranh giới, pháp lý, an toàn (tám khuyến nghị) — đạt

Kiểm bằng máy và đọc tay: 0 bản đồ, quả địa cầu, ảnh vệ tinh, hình nét bờ biển trong brief (mọi brief phong cảnh đều ghi rõ "không ảnh vệ tinh", "chỉ thấy một đoạn bờ"); 0 tên biển và tên quần đảo tranh chấp ở mọi lớp chữ, kể cả `alt` và `brief` (brief còn dặn người chọn ảnh loại tiêu đề có "Paracel", "Spratly"); 0 câu "vì sao"; không lặp #4 (biển mặn và đầm lầy chỉ ở Khởi động, 0 san hô, 0 rừng ngập mặn, con vật chỉ làm cảnh) và #11 (0 "Earth", "Trái Đất", 0 quả cầu, bốn hình vẽ bài 1 đều ghi "đường chân trời thẳng, không cong"); câu an toàn bài 4–6 đúng ba chỗ và không chỗ nào thành quiz; bài 3 không có chữ nào về trồng, cấy, gặt lúa, không "ruộng bậc thang" (brief `tray_hill` còn dặn designer kiểm). Bảy chỗ tên nơi gắn ảnh (`_topic.md:211–219`) đều có câu dự phòng viết sẵn ở dòng `>` ngay dưới chỗ đó — đã mở đọc từng chỗ: ô `explore_fansipan` (`02:164`), món `tray_fansipan` (`02:263`), q3 (`02:399`), từ `peak` (`02:547`), thẻ `fansipan_card` (`02:565`), thẻ `mekong_delta_card` (`03:542`), ô `explore_mekong` (`04:152`), món `tray_ba_be` (`04:268`), thẻ `ba_be_card` (`04:566`), món `tray_rock_islands` (`05:280`), ví dụ ba ô Bay (`05:184`), thẻ `ha_long_bay_card` (`05:560`), ví dụ hai ô `explore_big_cave` (`06:210`), thẻ `son_doong_card` (`06:613–614`, hai mức dự phòng). Mục "Tên nơi đã bỏ" (`_topic.md:222`) còn trống — designer điền sau khi chọn ảnh.

### Kết luận lượt 1

Không đạt tiêu chí "0 lỗi chặn": **3 lỗi chặn (C1, C2, C3)** và 12 mục nhỏ. Phần khung (DOK, misconception, format, số lựa chọn, `feedback`, `hint`, hình, loại hình, số từ EN, ranh giới, pháp lý, an toàn, danh mục, từ vựng, thẻ) **đạt hết**. C1 và C2 nằm gọn trong bài 3 và sửa được bằng năm dòng chữ cộng một món kệ; C3 cần PM hoặc Duy chốt tên gọi trước khi chạy `tts`. Sửa xong C1–C3 và n1–n4 thì rà lại chỉ cần đọc bài 3, bài 6 và bốn chỗ kia.

## Lượt sửa content-editor (19/11, sau rà chữ tester lượt 1)

Sửa C1–C3, n1–n6, n8–n12; n7 chỉ ghi chú (lỗi chung SK-054). C1: câu ô Rice fields, q3 bài 3 thành "Many rice fields grow on the plains." · "Trên đồng bằng có nhiều ruộng lúa."; sửa cả bài 4 w1. C2: bỏ món `tray_plain` bài 3, kệ còn sáu món. C3: theo quyết định 4, "rock icicles" → "stalactite" · "nhũ đá", lời tả "like long stone drips from the roof", thêm từ `extra` `stalactite`; key hình `explore_rock_icicles`, `tray_icicles`, `q3_icicles` giữ nguyên. Ngoài ra: bài 3 đổi chỗ hai ô cuối nên ý chính 3 ghép ô Villages and towns (n1); "mát lạnh" → "mát" (n2); n3, n4, n9 sửa chữ; 14 chỗ ruộng lúa trỏ thẳng `q2_rice` của Discoverer `khung-long/trai-dat-rat-lau-ve-truoc` (n5) và ghi chú crop không thấy núi (n6); bài 2 q5 → "Where is it cool even in summer?" (n8); nhãn bẫy bài 3 → "Not on a plain" (n10); bài 6 q3 lựa chọn sai → lối đi trong hang `q3_path` (n11); bài 5 thêm w3 ôn bài 1 (n12). Không ảnh mới; thẻ dự phòng `rock_icicles_card` → `stalactite_card`. Phiên chính chạy lại `ids` và `validate`.

## Rà chữ (tester 19/11, lượt 2)

> Phạm vi: kiểm C1–C3 và n1–n12 của lượt 1 đã đóng chưa, cộng những chỗ lượt sửa mới đụng vào. Chạy lại `import` (**0 lỗi, 7 cảnh báo `md_needs_check`**) rồi cả năm script của lượt 1 trên JSON mới: `chk.py`, `chk2.py`, `chk3.py`, `newold2.py`, `reuse.py`, `kpp2.py`. Không đụng `content/images` (designer đang chọn ảnh song song).
>
> **Kết quả: 0 lỗi chặn. Ba lỗi chặn C1–C3 đóng, mười một mục nhỏ đóng, n7 chuyển đúng chỗ (SK-054). Còn 3 mục nhỏ mới (n13–n15), không chặn.**

### Lỗi chặn — đóng cả ba

- **C1 đóng.** `03-dong-bang-va-ruong-lua.md:171–172` (ô Rice fields) và `:382–383` (q3) nay là "Many rice fields grow on the plains." · "Trên đồng bằng có nhiều ruộng lúa."; `explanation_wrong` `:390–391` theo; `04-song-va-ho.md:55` hết "phủ khắp". Grep "phủ khắp" trong chữ bé nghe: **0**. Câu q3 (Đúng) và q6 (Sai) không còn đá nhau: q3 nói "có nhiều ruộng lúa", q6 nói "không chỉ là một cánh đồng". `_topic.md:276` (bảng Đúng/Sai) đã sửa theo.
- **C2 đóng.** Món `tray_plain` đã bỏ; máy đếm kệ bài 3 còn **sáu món** (`tray_ricefields` 2, `tray_villages` 1, `tray_rivers` 1, bẫy 2) — vẫn trong khoảng 6–8. `explore_plain` không còn ở kệ, chỉ còn là ảnh của q1, q4, q5, q6, từ `plain`, `wide`. Ví dụ kiểm màn Chơi `03:551` và bảng Chơi `_topic.md:326` đã sửa.
- **C3 đóng.** "rock icicles" đã thành **"stalactite" · "nhũ đá"** đúng quyết định 4, ở cả bảy chỗ chữ bé nghe (`06:176`, `:179`, món kệ, q3 `explanation_wrong`, nhãn `q3_icicles`, từ `stalactite`, ví dụ từ); lời tả cho trẻ là ví dụ một "like long stone drips from the roof" · "như những giọt đá dài rủ từ trần hang"; thêm từ `extra` `stalactite` (bài 6 còn 5 từ, 2 `core` — đúng luật). Grep "icicle" trong chữ bé nghe: **0**. `_topic.md:178`, `:184`, `:220`, `:345`, `:397` (lỗi hay gặp 20 nay cấm "icicle", cho phép "stalactite"), `:424`, `:427`, `:441`, `:442` đã đồng bộ; thẻ dự phòng `rock_icicles_card` → `stalactite_card`. Ví dụ "some reach down to the floor" (chỗ dễ sai vì khối chạm nền là cột đá) đã bỏ — tốt hơn cả đề xuất của tester.

### Mục nhỏ lượt 1 — đóng 11, chuyển 1

- **n1 đóng.** Chạy lại `KeyPointPictures.match`: bài 3 ý 3 nay ghép ô **Villages and towns** (`alt` "Houses among trees and fields" — có cả nhà lẫn ruộng, đúng cả câu ý chính), ô Rice fields là ô không ghép. Năm bài kia không đổi. Bảng `_topic.md:137` và màu `03:546` đã sửa theo thứ tự ô mới.
- **n2 đóng.** "mát lạnh" → "mát" ở cả sáu chỗ (`02:30`, `:169`, `:172`, `:457` đổi lý do, `:495`; `06:81`), `_topic.md:118` theo. Grep "mát lạnh": **0**. EN "cool", VI "mát", `correction` "mát hơn" — ba lớp chữ nay cùng mức.
- **n3 đóng.** Máy so 18 câu ý chính với bảng Tổng quan `_topic.md`: **0 chỗ lệch** (bài 6 ý 3 nay "như một căn phòng lớn" ở cả hai nơi).
- **n4 đóng.** `05:457–458` nay "This is false. The lake is the water part." · "Câu này sai. Hồ là phần nước." Không còn gọi ảnh hồ trên màn là hòn đảo.
- **n5 đóng.** Chạy lại `reuse.py` trên cả `content/`: **0 chỗ trong `nui-song-va-bien` trỏ qua hai chặng** (14 dòng ruộng lúa nay trỏ thẳng `khung-long/trai-dat-rat-lau-ve-truoc` `q2_rice`, từ khoá giữ nguyên). `_topic.md:342`, `:384` đã sửa. *(Ghi cho PM: script tìm thấy 18 chỗ trỏ hai chặng ở sáu chủ đề khác — `thoi-tiet-va-cac-mua`, `cay-quanh-em`, `thoi-tiet-va-thien-tai`, `an-uong-lanh-manh`. Luật số 14 của chủ đề này chặt hơn phần còn lại của repo; PM cân nhắc một ticket dọn chung, không thuộc SK-058.)*
- **n6 đóng.** `01:151` có dòng dặn designer crop ảnh `q2_rice` không thấy núi ở mọi khung.
- **n7 chuyển đúng chỗ.** `_topic.md:431` ghi lại, ticket riêng **SK-054** đã có (trạng thái todo, pm → ios-dev). Máy vẫn đếm 10 câu có `label` đáp án trùng chữ câu hỏi — đúng như đã thống nhất, chủ đề này không tự sửa.
- **n8 đóng.** Bài 2 q5 nay "Where is it cool even in summer?" · "Mùa hè, ở đâu vẫn mát?" (7 từ EN), khớp ví dụ ba ô Cool up high; `explanation_wrong` đổi "It is cool." → "It is high." nên không lặp chữ câu hỏi. Xem n13 cho lời khen.
- **n9 đóng.** `04:545` "Con đò nhỏ qua sông."; `05:95` "Rùa con bò ra biển." — hết phần VI thừa.
- **n10 đóng.** Nhãn nhóm bẫy bài 3 → "Not on a plain" · "Không ở đồng bằng" (`03:245–246`), key giữ; `_topic.md:326`, `:333` theo. "High land" · "Đất cao" nay chỉ còn là nhóm bắt buộc (bài 1, 6).
- **n11 đóng.** Bài 6 q3 lựa chọn sai nay là `q3_path` (lối đi trong hang, dùng lại `explore_dark`), có `feedback` riêng; brief `explore_dark` (`06:163`) đã thêm ràng buộc **"không thấy nhũ đá rủ từ trần"** để ảnh lựa chọn sai không chứa đáp án. Hai lựa chọn đều ở trong hang nên bé phải nhớ bài, không loại trừ bằng bối cảnh.
- **n12 đóng.** Bài 5 thêm `w3` ôn bài 1 (cách bốn bài ≈ mốc `warmup.week`), đủ `recall_from`, hình, `hint`, `feedback_false`, DOK 1, `true_false` Đúng. Khởi động Explorer tối đa 3 câu — vẫn đúng luật. Bảng Khởi động `_topic.md` và bảng Đúng/Sai (nay **27 câu: 13 Đúng, 14 Sai**, máy đếm khớp) đã sửa.

### Chạy lại máy sau lượt sửa — đạt

- `import`: 0 lỗi, 7 cảnh báo `[CẦN KIỂM]` (không đổi).
- Khung sáu bài: DOK `1·1·1·2·2·2`, đúng một `misconception` ở q6, sáu q6 là `true_false` Sai, sáu `explanation_correct` **khớp từng chữ** `correction`; số lựa chọn 2–3; kệ 6–8 món; từ vựng 4–5 từ, 2–3 `core`.
- Mọi câu EN ≤ 8 từ (đếm theo từng câu); 0 chữ số và ký hiệu trong VI; 0 dấu tiếng Việt trong `.en`.
- `feedback`/`hint`/hình: 0 lựa chọn sai thiếu `feedback` (kể cả `q3_path` và bài 5 `w3` mới), 0 lựa chọn đúng thừa `feedback`, 0 câu thiếu `hint` hay hình, `true_false` đúng phía, 0 `labels`.
- Chữ cấm (danh sách cập nhật theo quy ước mới: thêm "icicle", bỏ "stalactite"): **0**; "vì sao", "why", "tại sao": **0**; "phủ khắp", "mát lạnh": **0**.
- `newold2.py`: 0 câu có đáp án là ảnh mới duy nhất hay ảnh quen duy nhất (kiểm lại sau khi đổi lựa chọn bài 6 q3 và bỏ món bài 3).
- `reuse.py`: 0 chỗ trỏ hai chặng; mọi "Dùng lại hình" trỏ tới key có thật.
- `kpp2.py`: 18 ý chính ghép đúng y bảng `_topic.md`.
- `alt` của lựa chọn đúng: 0 chỗ chứa chữ câu hỏi.

### Mục nhỏ mới (3, không chặn)

**n13 · Bài 2 q5: khen "mang áo ấm" cho một chỗ chỉ "mát" (trả lời câu hỏi của phiên chính).**
`02-nui-va-doi.md:454–455` `explanation_correct`: "Yes! Bring a warm coat up there." · "Đúng rồi! Lên đó nhớ mang áo ấm." sau câu hỏi "Mùa hè, ở đâu vẫn mát?".
**Không mở lại n2 và không sai khoa học:** n2 nói về chữ tả nhiệt độ ("mát lạnh" → "mát"), còn đây là một việc nên làm; trên đỉnh núi cao Việt Nam mùa hè (Phan Xi Păng, Sa Pa, Tà Xùa) mặc áo ấm là đúng, và chính ô Học đã dạy trước (`02:176–177` "bring a warm coat"), w2 đã bắc cầu.
Chỗ gợn còn lại, ở mức chữ: w2 dạy "áo khoác ấm" là đồ của ngày **lạnh** (`02:68`), nên trong cùng một bài bé nghe "trên đó **mát**" rồi "nhớ mang **áo ấm**" — mát và lạnh dùng chung một vật. Thêm nữa "áo ấm" xuất hiện bốn lần trong bài 2 (w2, ví dụ một ô Cool up high, q5 lời khen, q6 `feedback_true`).
Đề xuất (chọn một, đều giữ luật "lời khen thêm một ý"): (a) giữ nguyên, chấp nhận chuỗi mát → gió lạnh trên cao → áo ấm; (b) `02:454–455` → "Yes! The wind up there feels chilly." · "Đúng rồi! Trên đó gió thổi lạnh." (ý mới, nối thẳng với `hint` "mây ở ngay gần" và không đụng từ "áo ấm" lần thứ tư); (c) đổi ví dụ một ô Cool up high thành "take a jacket up there" để "áo ấm" chỉ còn gắn với "lạnh" ở w2, q6.

**n14 · Bài 4 w1: EN vẫn nói "cover", VI đã bỏ.**
`04-song-va-ho.md:54–55`: "Yes! Rice fields cover many plains." · "Đúng rồi! Nhiều đồng bằng có ruộng lúa." VI đã đúng; EN "cover many plains" vẫn hàm ý ruộng phủ kín những đồng bằng đó, lệch nghĩa với VI. Đề xuất: "Yes! Many plains have rice fields." (sáu từ).

**n15 · Hai dòng `>` còn nhắc việc đã làm xong.**
`05-bai-bien-dao-va-vinh.md:118` (dưới `w3`) và `:601` (Ghi chú cho dev) còn ghi "`id` để trống, chạy lại `ids`" trong khi `ids` đã chạy và `w3` đã có `id: 0478aa75-…`. Chỉ là chú thích tạm, dọn khi chốt bài.

### Kết luận lượt 2

**Đạt tiêu chí "0 lỗi chặn".** C1, C2, C3 đóng; n1–n6, n8–n12 đóng; n7 nằm đúng chỗ ở SK-054. Ba mục mới n13–n15 là chữ nhỏ, sửa hay không đều phát hành được — nếu sửa thì sửa trước `tts` để khỏi sinh lại giọng. Phần chữ của SK-058 **xong về phía tester**; còn lại trước khi nghiệm thu là việc chưa thuộc lượt này: ảnh và giấy phép (designer), `images fetch`, `tts` EN và VI, `build`, `check-pack`, chơi trọn một bài trên iPhone 16, và 51 dòng `[CẦN KIỂM]` chờ người chuyên môn.
- n13–n15 sửa xong (content-editor 19/11): bài 2 q5 `explanation_correct` "Yes! The wind up there feels chilly." · "Đúng rồi! Trên đó gió thổi lạnh."; bài 4 w1 EN "Yes! Many plains have rice fields."; xoá chú thích id cũ ở bài 5, 6.

## Ghi chú designer (19/11)

**Đã làm:**
- Sáu file chọn ảnh `content/images/explorer/nui-song-va-bien/{dat-lien-va-bien,nui-va-doi,dong-bang-va-ruong-lua,song-va-ho,bai-bien-dao-va-vinh,hang-dong}.json`: **204/204 chỗ có hình** (33 · 34 · 30 · 34 · 34 · 39), theo bản `.md` sau lượt sửa content-editor (bỏ `tray_plain`, thêm `q3_path`, `stalactite`, bài 5 w3, 14 chỗ ruộng lúa trỏ `q2_rice`). Đối chiếu key `.md` (đọc qua `checkMarkdown` + `imageRefs` của content-cli) với file chọn ảnh: **0 thiếu, 0 thừa**. Mọi `same_as` trỏ thẳng mục có ảnh thật (0 chuỗi hai chặng); hình Discoverer đều chép mục.
- **Ảnh mới: 26**, giấy phép **CC0 15, Public domain 2, PDM 1, CC BY 8** (2.0: 3, 3.0: 1, 3.0 us: 1, 4.0: 3). 0 BY-SA/NC/ND; `Restrictions` trống cả 26 (kiểm qua Commons API và `images fetch`). **Chép mục Discoverer: 6 ảnh** (đồi chè Mộc Châu `explore_high`; ruộng lúa `q2_rice` hai khung; sông Tràng An `explore_water`; biển khơi `tray_sea`; hồ `explore_lake`; `Ha_Long_Bay.jpg` `tray_rock_islands`). Dùng lại Explorer: hàng rào tre, bãi biển, ao, Nam Cực, đầm sen, áo khoác/áo cộc, lúa non, đống rơm, rùa con.
- **Hình vẽ giấy cắt: 4 hình, 5 file** ở `content/images/own/nui-song-va-bien/`: `dat-lien-va-bien.learn.explore.explore_above.jpg` (1024², toàn cảnh: núi nhọn gỉ đồng, đồi tròn, ruộng chia ô, sông uốn khúc ra biển, hồ có bờ, mái nhà đỏ son, bãi cát, biển sóng giấy, đảo nhỏ), `dat-lien-va-bien.q6.jpg` (cùng bản vẽ, khung 4:3, cho q6 và bài 2 w1), `dat-lien-va-bien.q4.{q4_only_land,q4_land_sea,q4_only_water}.jpg` (1024×410, khung 5:2, cùng trời, cùng mặt trời, cùng đường chân trời; chỉ phần đất/nước khác nhau). Không nét viền, không gradient, không chữ; chân trời thẳng, không quả cầu, không bản đồ, không la bàn; bờ biển là một đường cong đơn giản. Bóng `paperE` nướng sẵn. Bài 2 w1 trỏ `q6` (bản 4:3) thay vì `explore_above`. Script vẽ ở scratchpad phiên (`sk058/draw/gen.py`), không nằm trong repo.
- **Ruộng lúa (n6):** hai mục chép từ `q2_rice`, cả hai cắt bỏ dải núi xa: `learn.explore.explore_flat` (khung gần vuông, cho ô Học, kệ, câu Đúng/Sai, thẻ xếp) và `q1.q1_fields` (khung ~2:1, cho thẻ 5:2, 17:10 và thẻ từ). 14 chỗ của bài 1, 2, 3 trỏ vào một trong hai mục này.
- **Kết quả lệnh:** `node tools/content-cli/src/cli.ts images fetch content/images/explorer/nui-song-va-bien` (lượt cuối 19/11): **6 file chọn ảnh · 44 ảnh khác nhau · 0 lỗi · hình tự vẽ 5**; **0 dòng "Ảnh lệch khung", 0 dòng "Chưa kiểm tỉ lệ"**, 0 cảnh báo tác giả. `validate content/explorer/nui-song-va-bien`: 0 lỗi, 7 cảnh báo `[CẦN KIỂM]`. Chưa chạy `build`.

**Ảnh mang tên nơi (khuyến nghị 6) — cả bảy có ảnh đúng nơi, giấy phép hợp lệ; mục "Tên nơi đã bỏ" ở `_topic.md` giữ "không có":**

| Chỗ | Ảnh · nguồn · giấy phép | Trang gốc ghi |
| --- | --- | --- |
| Phan Xi Păng `explore_fansipan` | "Der Fansipan", Dr. Kathrin Dräger · Commons · CC0 | "Der Fansipan", "Von Sa Pa aus aufgenommen" |
| Sông Mê Kông `explore_mekong` | "Mekong River in Vietnam", Ganesh Dhamodkar · Commons · CC BY 4.0 | "Mekong River in Vietnam" |
| Hồ Ba Bể `tray_ba_be` (+ `ba_be_card`) | "Scenery at Ba Be Lake - Ba Be National Park - Vietnam - 03", Adam Jones · Flickr qua Openverse · CC BY 2.0 | tiêu đề như trên |
| ĐBSCL `mekong_delta_card` | "Canal in Mekong Delta - My Tho - Vietnam (15726848817)", Esin Üstün · Commons · CC BY 2.0 | kênh ở Mỹ Tho |
| Vịnh Hạ Long `tray_rock_islands` (+ thẻ) | `Ha_Long_Bay.jpg`, Ondřej Žváček · Commons · CC BY 2.5 (chép mục Discoverer) | "Ha Long Bay (Vietnam)" |
| Động Phong Nha `explore_big_cave` | "Dong Hoi Phong Nha grotten (51663)", Andre Hospers · Commons · CC BY 4.0 | "Dong Hoi Phong Nha grotten" (xem lệch số 9) |
| Hang Sơn Đoòng `son_doong_card` | "Son Doong Cave by Daniel Burka" · Commons · CC0 | "Bên trong Hang Sơn Đoòng … Quảng Bình" |

Thêm: `explore_cave` là cửa động Phong Nha (`Phongnhakebang2.jpg`, PD) nhưng chữ không nêu tên; `explore_dark` là lối đi có đèn trong hang Sửng Sốt (Hạ Long, CC0); `explore_cool` chụp từ đỉnh Phan Xi Păng (Flickr, PDM). 0 bản đồ, 0 quả địa cầu, 0 ảnh vệ tinh; 0 tiêu đề/mô tả có tên biển, "Paracel", "Spratly".

**Chỗ lệch brief, cần content-editor hoặc PM xem** (đổi chữ là việc của content-editor; ảnh giữ tới khi có quyết định):
1. **`explore_fansipan` bài 2** (Học, kệ, q3, từ `peak`, thẻ): dãy núi cao nhiều lớp **sương mờ dưới trời xanh, không có mây trắng quanh đỉnh**; trên đỉnh có vài công trình rất nhỏ, mờ (không đọc ra, không cáp treo). `alt` "Fansipan, high in the clouds" · "Phan Xi Păng cao vút trong mây" lệch → đề xuất "Fansipan, tall and misty" · "Phan Xi Păng cao vút, mờ sương". Ảnh Phan Xi Păng có mây hợp giấy phép đều có chùa, tượng hoặc người.
2. **`explore_water` bài 1** (dùng ở bài 1, 3, 4): sông Tràng An nhìn từ trên cao, ruộng hai bên **vàng xanh (lúa sắp chín)**, nhiều thuyền khách nhỏ; đã cắt bỏ phần lớn vách núi đá, góc trên còn một mẩu. `alt` "…through green fields" · "…qua ruộng xanh" đề xuất bỏ "xanh": "Water winding through rice fields" · "Dải nước uốn lượn qua ruộng lúa". Không tìm được ảnh flycam sông Việt Nam khác hợp giấy phép.
3. **`explore_plain` bài 3**: đồng bằng trồng lúa nhìn từ flycam ở **Bali, Indonesia** (CC0), có đường thẳng và hàng dừa; không có ảnh đồng bằng Việt Nam nhìn từ trên cao hợp giấy phép. Không ruộng bậc thang, không núi gần.
4. **`explore_village` bài 3** (Học, kệ, từ `village`): **làng Hahoe, Hàn Quốc** (CC0) nhìn từ trên cao, mái ngói/mái tranh kiểu Hàn giữa cây xanh, **không thấy ruộng**. Ảnh làng Việt Nam hợp giấy phép đều có núi sau lưng (lẫn với nhóm bẫy "Not on a plain") hoặc không ra làng. `alt` "Houses among trees and fields" · "Nhà cửa giữa cây xanh và ruộng" → đề xuất "Houses among the trees" · "Nhà cửa giữa cây xanh". PM có thể quyết vẽ hình này nếu muốn bối cảnh Việt Nam (bài 3 không có hình vẽ).
5. **`explore_by_river` bài 4** (Học, q3, từ `boat`): bờ sông cù lao An Bình (Vĩnh Long), **nhiều thuyền gỗ neo, nhà mái đỏ sau hàng cây**; nhà không phải nhà gỗ nổi bật. Chọn ảnh có thuyền vì từ `boat` dùng hình này (ảnh nhà sàn ven sông không có thuyền). `alt` "Wooden houses beside a river" · "Nhà gỗ bên bờ sông" → đề xuất "Boats and houses by a river" · "Thuyền và nhà bên bờ sông".
6. **`explore_river` bài 4**: sông chảy gợn sóng, thấy hai bờ cây thông (Yellowstone, Mỹ), trời xám; xa xa có **hơi nước bốc lên** từ bờ (nhỏ). Không có ảnh sông Việt Nam vừa rộng vừa thấy dòng chảy mà không có cầu, xe, người.
7. **`explore_rocky` bài 5**: Boulders Beach (Nam Phi), tảng đá tròn lớn sát mép nước, **nước lặng, ít bọt sóng**; `alt` "Big rocks where waves splash" hơi quá → đề xuất "Big round rocks by the sea" · "Tảng đá tròn lớn bên bờ biển". **Thẻ từ `wave` dùng ảnh riêng** (sóng xô vào tảng đá tung bọt, Heceta, CC0) thay vì dùng lại `explore_rocky`: brief thẻ từ ghi "Dùng lại hình `explore_rocky`" nên content-editor sửa brief và `alt` thẻ (đề xuất "A wave splashing on a rock" · "Con sóng xô vào tảng đá").
8. **`vocab.torch` bài 6**: đèn pin kim loại **đang bật (đầu đèn sáng xanh) trên nền sáng**, không phải chùm sáng trong bóng tối (ảnh chùm đèn trong tối hợp giấy phép đều có người hoặc nhãn hiệu; một ảnh đèn đặt trên bản đồ đã loại). `alt` "A torch shining in the dark" → đề xuất "A torch that is switched on" · "Chiếc đèn pin đang bật".
9. **`explore_big_cave`**: lòng hang rộng, lối đi gỗ, vài du khách rất nhỏ. Trang gốc chỉ ghi "Dong Hoi Phong Nha grotten" (loạt ảnh cùng tác giả có thuyền và sông trong hang, nên nhiều khả năng là động Phong Nha), nhưng không loại trừ hang Tiên Sơn cạnh đó. Ví dụ hai của ô nói "some caves have rivers inside" hoặc tên Phong Nha: ảnh này **không thấy sông**. Người duyệt xác nhận; nếu không chắc thì dùng câu dự phòng.
10. **`explore_cool`**: biển mây từ đỉnh Phan Xi Păng (Son Hoa Nguyen, Flickr, **PDM 1.0**), một đỉnh tối nhô giữa mây; góc trái dưới còn ngọn một cành cây mảnh.
11. **`tray_hill`**: đồi chè Long Cốc, **nhiều quả đồi tròn** (khung vuông lấy đồi giữa), không phải một quả đồi đứng riêng. `tray_grass_hills` là đồi cỏ thoai thoải (Unsplash, không rõ nước). Hai ảnh khác nhau rõ, cùng kiểu đồi.
12. **`tray_fishtank`**: bể kính cá cảnh ở cửa hàng, nhiều cá vàng (đỏ, trắng đỏ, đen), không thấy bể đặt trên kệ; vạch đen trên vách bể không phải chữ.
13. **`explore_dark`**: lối đi hang Sửng Sốt có hàng đèn vàng; đã cắt bỏ trần có nhũ đá (n11), mép phải còn vài khối đá trắng đứng (măng đá), không rủ từ trần.
14. **`cape_card`**: panorama Cape Schanck cắt vuông còn **525×521 px** (cache lấy bản 1280 px của Commons). Đủ cho thẻ, nhưng mềm hơn các thẻ khác; nếu ios-dev thấy mờ trên iPad thì đổi ảnh.
15. Ảnh nước ngoài khác (không cần sửa chữ): `tray_mountain` đỉnh núi đá trong mây (Unsplash), `tray_building` San Francisco, `tray_pool` bể bơi chụp từ trên cao, `explore_island` đảo Mokapu (Hawaii), `explore_bay` vịnh West Lulworth (Anh, người trên bãi rất nhỏ), `explore_rock_icicles` nhũ đá hang Rawhiti (New Zealand, ánh sáng tự nhiên). Cảnh Việt Nam có ở: Phan Xi Păng, biển mây, đồi chè, ruộng lúa, sông Tràng An, Mê Kông, kênh Mỹ Tho, cù lao An Bình, Ba Bể, Hạ Long, cửa động Phong Nha, Sửng Sốt, Phong Nha, Sơn Đoòng.

**Kiểm tay trước khi phát hành** (Flickr chỉ kiểm được qua Openverse; lượt này designer kiểm giấy phép qua Openverse API, **chưa mở trang Flickr**): đồi chè Long Cốc (CC0, https://www.flickr.com/photos/76025239@N02/54749671788), hồ Ba Bể (CC BY 2.0, https://www.flickr.com/photos/41000732@N04/48102341768), biển mây "cloud hunting" (PDM 1.0, https://www.flickr.com/photos/76025239@N02/54777169576).

**Ghi chú công cụ:** Wikimedia trả 429 ở `upload.wikimedia.org` cho ảnh gốc ≤ 1280 px ("Wuyi Mountains Sea of clouds 1", 1024 px) ba lượt liền nên đổi `explore_cool` sang ảnh Flickr; vẫn là việc của SK-056. `images search` cũng bị Commons trả 429 ở nhiều hình; ứng viên lấy bằng script tìm tay (Commons API + Openverse, có cache, ở scratchpad phiên `sk058/`).

## Sửa chữ theo ảnh designer chọn (content-editor 19/11)

Không đổi key; thẻ từ `wave` bài 5 có ảnh riêng. Chữ bé nghe đổi (chạy lại `tts`): bài 2 q3 `hint`, `feedback_false` (núi mờ sương), q2 `feedback_true` số nhiều; bài 3 q6 `feedback_true` "roads and trees", q2 `feedback_false` "rice fields"; bài 5 q1 `feedback` bãi đá; bài 6 ô Huge caves ví dụ hai bỏ tên Phong Nha ("people look tiny inside"), ô Stalactites ví dụ hai và q3 `explanation_correct` bỏ "lamp light", q2 `feedback_false` "lamps", w3 và q1 `feedback` đồi số nhiều. `alt`/brief đổi: `explore_fansipan`, `explore_water`, `explore_village`, `explore_by_river` ("A busy riverbank with houses", không chứa "boat" của câu q3), `explore_rocky`, `torch`, `explore_rock_icicles`, thẻ từ `wave`. Bài 2 w1 trỏ `q6` (hình vẽ 4:3). **Quyết định phiên chính:** `explore_big_cave` không chắc là động Phong Nha → bỏ tên Phong Nha (ghi ở "Tên nơi đã bỏ"); sáu nơi còn lại giữ tên.

## Rà ảnh (tester 19/11)

> Lượt 1 phần ảnh, làm như SK-053. Đã mở xem **49 ảnh khác nhau của gói** (`content/.build/pack`, chép ra tên đọc được rồi xem từng cái): 26 ảnh mới, 6 ảnh chép mục Discoverer, 5 file hình vẽ (4 hình, bản vuông và bản 4:3), 12 ảnh dùng lại trong và ngoài chủ đề. Sáu ảnh dùng lại từ chủ đề đã duyệt (áo khoác, áo cộc tay, đống rơm, đầm sen, rùa con, Nam Cực — trừ Nam Cực đã mở xem) chỉ đối chiếu `alt` và chỗ dùng. Có zoom vào chín chỗ nghi có chữ, logo hay mặt người. Chạy lại `kpp2.py` trên gói và đọc ảnh của ô được ghép. Ba ảnh Flickr đã **mở trang gốc** xác nhận giấy phép.
>
> **Kết quả: 1 lỗi chặn (B1), 15 mục nhỏ (c1–c15).**

### Đã kiểm bằng máy — đạt

- **204/204 chỗ có hình**, 0 chỗ trống; đối chiếu key `.md` ↔ file chọn ảnh: 0 thiếu, 0 thừa. Mọi `asset` trong gói đều có file thật (0 thiếu).
- **Giấy phép:** 34 mục ảnh thật — CC0 18, Public domain 3, PDM 1, CC BY 12 (2.0: 4, 2.5: 1, 3.0: 3, 3.0 us: 1, 4.0: 3). **0 BY-SA, 0 NC, 0 ND.** Mọi mục đủ `source`, `source_url`, `file_url`, `title`, `license_url`; mọi ảnh CC BY có `author`; 0 mục có `restrictions`.
- **`same_as`:** 165 mục, **0 mục hỏng, 0 mục trỏ hai chặng** (máy phân giải sang cả `content/images/` của chủ đề khác).
- **Một câu, một kệ, một loại hình:** máy so từng câu có nhiều lựa chọn và từng kệ Chơi theo `asset` — **0 chỗ trộn ảnh chụp với hình vẽ**. Câu q4 bài 1 là ba hình vẽ, không hình nào bé đã gặp. Hình vẽ chỉ nằm ở năm chỗ của bài 1 và câu w1 bài 2 (bản 4:3), đúng chốt của Duy.
- **Ghép ý chính (`kpp2.py` trên gói):** y hệt bảng `_topic.md`; bài 3 ý 3 nay ghép ô Villages and towns (đóng n1 lượt 2).
- **Chữ bé nghe:** 0 kết quả "Phong Nha" (đúng quyết định bỏ tên), 0 "bản đồ", "quả địa cầu", "Trái Đất", tên biển và quần đảo tranh chấp.
- **Không bản đồ, quả địa cầu, ảnh vệ tinh, hình nét bờ biển Việt Nam** trong cả 49 ảnh (đã mở xem từng cái). Ảnh chụp từ trên cao đều là một đoạn cảnh gần (một khúc sông, một vịnh, một hòn đảo, một vạt ruộng).
- **Ba ảnh Flickr — đã mở trang gốc, khớp cả ba:** đồi chè Long Cốc `flickr.com/photos/76025239@N02/54749671788` license id **9 = CC0**, tiêu đề "Long Coc tea hill… about 100 km from Hanoi"; hồ Ba Bể `…/41000732@N04/48102341768` license id **4 = CC BY 2.0**, tác giả Adam Jones, tiêu đề "Scenery at Ba Be Lake"; biển mây `…/76025239@N02/54777169576` license id **10 = PDM 1.0**, mô tả "Cloud hunting on Fansipan peak". Mục "Kiểm tay trước khi phát hành" của designer **đóng**.
- **Sáu ảnh mang tên nơi còn lại** khớp tên ở trang gốc: Phan Xi Păng ("Der Fansipan", chụp từ Sa Pa), sông Mê Kông, kênh Mỹ Tho, vịnh Hạ Long, hang Sơn Đoòng (ảnh Daniel Burka, đúng hố sụt có rừng), hồ Ba Bể. Tên động Phong Nha đã bỏ khỏi chữ bé nghe nên ảnh `explore_big_cave` không còn phải chứng minh địa điểm.
- **Hình vẽ:** bốn hình giấy cắt style E, không nét viền, không gradient, không chữ; chân trời **thẳng**, không quả cầu, không bản đồ, không la bàn; bờ biển là một đường cong đơn giản. Ba hình câu q4 cùng trời, cùng mặt trời, cùng đường chân trời, cùng khung 1024×410, chỉ khác phần đất và nước — đáp án không nổi bật.
- **Khung:** mô phỏng cắt giữa theo các tỉ lệ app dùng (vuông, 4:3, 5:2, 17:10, 2:1) cho những ảnh có chủ thể lệch tâm; chỉ một chỗ sát mép (c3).

### Lỗi chặn (1)

**B1 · Ảnh sông Mê Kông có chữ quảng cáo lớn trên mạn thuyền.**
`content/images/explorer/nui-song-va-bien/song-va-ho.json:31` mục `learn.explore.explore_mekong` (ảnh `Mekong_River_in_Vietnam.jpg`, CC BY 4.0) — chiếc thuyền ở giữa khung sơn chữ trắng **"DU LỊCH VIỆT NHẬT"** chạy gần hết mạn, cộng số hiệu "12" và một dòng đăng ký nhỏ ở mũi. Phóng to 4× đọc được rõ.
Trái Quy ước hình số 8 của chính chủ đề (`_topic.md:198`): "Không chữ, không logo trong mọi hình: không biển hiệu khu du lịch, không tên tàu, biển số". Đây vừa là chữ tiếng Việt trong hình (bé Explorer đang tập đọc), vừa là **tên một doanh nghiệp** — app không có quảng cáo bên thứ ba.
Tái hiện: bài 4 → Học → ô The Mekong (ảnh chiếm cả khung, 4:3).
Mong đợi: ảnh sông lớn không có chữ.
Thực tế: chữ quảng cáo là vật sáng nhất giữa khung.
Ai sửa: **designer**. Ba cách: (a) `crop` bỏ hẳn chiếc thuyền (còn sông rộng và phố bên kia bờ, nhưng mất ý "thuyền lớn đi lại trên sông" của ví dụ ba); (b) đổi sang ảnh sông Mê Kông khác hợp giấy phép, thuyền không chữ; (c) nếu không có ảnh nào đạt thì dùng **câu dự phòng đã viết sẵn** ở `04-song-va-ho.md:152` (ô thành "Big river" · "Sông lớn") và ghi "sông Mê Kông" vào mục "Tên nơi đã bỏ" ở `_topic.md:222`.

### Mục nhỏ (15)

**c1 · `explore_dark` (bài 6): hai biển báo đỏ và một biển trắng trong hang.** `hang-dong.json:39`. Quy ước 8 cấm "bảng chỉ đường trong hang". Biển không đọc được chữ (≈25 px) nhưng rõ là biển báo; ảnh còn nhiều lan can sắt, cột đèn, lối lát đá nên "hang tối" đọc ra hơi gượng. Ai sửa: **designer** — thêm `crop` lấy nửa trái (lối đi, vách đá, đèn) và bỏ phần giữa phải có biển.

**c2 · `explore_by_river` (bài 4): chữ sơn mờ trên mạn thuyền bên trái.** `song-va-ho.json:41`. Phóng to thấy một dòng chữ xanh và số đăng ký; ở cỡ thật không đọc được. Nhẹ hơn B1 nhiều nhưng cùng luật. Ai sửa: **designer** — `crop` bỏ thuyền trái (bố cục vẫn còn cầu, nhà, dãy thuyền phải).

**c3 · `explore_cave` (bài 6): biển nhỏ ở mép trái; cửa hang sát đáy khung khi cắt 5:2.** `hang-dong.json:23`. Mô phỏng khung 5:2 (thẻ ba lựa chọn câu q1) cho thấy cửa hang dính mép dưới, và tấm biển trắng viền đỏ ở mép trái vẫn còn. Ai sửa: **designer** — chỉnh `crop` dịch xuống và cắt bớt bên trái.

**c4 · `tray_sea` (bài 1): thấy dải núi mờ ở chân trời.** `dat-lien-va-bien.json:85`. Brief yêu cầu "biển rộng tới chân trời, **không thấy đất**" vì bài 4 phân biệt hồ với biển bằng "thấy bờ bên kia" (q1 `explanation_correct` "You can see the far bank", q2 `feedback_false`). Ảnh có bóng núi hai bên chân trời. Ai sửa: **designer** — `crop` bỏ dải chân trời (giữ mây và mặt nước), hoặc đổi ảnh biển khơi khác.

**c5 · Ảnh "bãi cát" dùng lại không ra bãi cát mịn.** `bai-bien-dao-va-vinh.json:23` `learn.explore.explore_sandy` (dùng lại `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien` `q3`, 8 chỗ: ô Học, kệ, q1, q4, từ `beach`, `sand`, w3, bài 6 q4). Ảnh là bãi **ướt lúc triều xuống**, cát sẫm, nhiều rong và đá lổn nhổn. Câu chính ô là "A sandy beach has soft, fine sand." và q4 hỏi "Where can you build a sandcastle?" — bé khó thấy "cát mềm, mịn" ở ảnh này. Cặp đối lập bãi cát ↔ bãi đá (luật Explorer số bảy) vì thế yếu. Ai sửa: **designer** (ảnh bãi cát khô, sáng, tốt nhất miền Trung) + **PM** duyệt thêm một ảnh mới ngoài danh sách 26.

**c6 · `explore_village` (bài 3) là làng Hàn Quốc, không có ruộng — mà nay là ảnh thẻ ôn ý chính ba.** `dong-bang-va-ruong-lua.json:33`. Sau khi đổi thứ tự hai ô (tester n1 lượt 2), `KeyPointPictures.match` ghép ý "Rice fields, villages and towns are on plains." · "Trên đồng bằng có ruộng lúa, làng xóm và phố xá." với ô này, nên thẻ Tổng kết của ý đó là **một làng nhà mái cong kiểu Hàn, không thấy ruộng, không thấy đồng bằng**. Ảnh cũng là hình của từ `village` và món "Làng quê". Ai sửa: **PM quyết** — (a) designer vẽ một hình làng Việt (bài 3 hiện không có hình vẽ, cần Duy cho phép như bài 1), (b) tìm tiếp ảnh làng Việt Nam hợp giấy phép, hay (c) giữ ảnh và đổi lại thứ tự ô (thì thẻ ôn lại là ruộng lúa, hỏng n1).

**c7 · `explore_plain` (bài 3): nửa trái có bờ thửa bậc nhẹ.** `dong-bang-va-ruong-lua.json:19` (ruộng Bali). Chủ đề cấm ruộng bậc thang ở mọi chỗ (`_topic.md:241`) vì bé dễ lẫn với núi, và q5 dạy "đồng bằng không dốc hơn đồi". Nửa phải (đường thẳng, ruộng phẳng, nhà) đúng ý hơn. Ai sửa: **designer** — `crop` lấy phần phải. **Kèm một việc cho content-editor:** dải trên của ảnh **có nhà rõ** (đã phóng to kiểm), nên lý do đổi `feedback_true` câu q6 sang "roads and trees" (`03:473–474`) không còn; câu cũ "Look, houses stand among these fields." là bằng chứng mạnh hơn cho `plain_is_one_field` — cân nhắc trả lại.

**c8 · `explore_river` (bài 4): sông ôn đới, trời xám, có tuyết và hơi nước.** `song-va-ho.json:11` (Yellowstone). Đây là ảnh "sông" chính của chủ đề (9 chỗ, trong đó có câu misconception q6 cần thấy nước chảy). Tuyết trên đồi lệch với #5 (tuyết chỉ có ở núi cao phía Bắc) và cột hơi nước dễ bị đọc là khói. Ai sửa: **designer/PM** — nếu có ảnh sông Việt Nam thấy gợn chảy thì đổi; không thì `crop` bỏ phần hơi nước bên phải.

**c9 · `explore_fansipan` (bài 2): đỉnh không nổi bật, mà ảnh lại minh hoạ từ `peak`.** `nui-va-doi.json:27`. Ảnh là một dãy núi dài mờ sương; thẻ từ `peak` ("The peak is the very top." · "Đỉnh núi là chỗ cao nhất.") khó chỉ ra "chỗ cao nhất". Ai sửa: **content-editor + designer** — cho thẻ từ `peak` dùng `tray_mountain` (đỉnh nhọn rõ), giữ `explore_fansipan` cho ô Học, kệ, q3, thẻ thưởng.

**c10 · `tray_fishtank` (bài 4): không thấy cái bể.** `song-va-ho.json:80`. Ảnh cận cảnh cá vàng trong nước xanh; món này là **bẫy** nhóm "Do người làm ra", bé phải nhận ra "bể cá" mới loại được. Ai sửa: **designer** — lấy khung rộng hơn (thấy thành bể, kệ) hoặc đổi ảnh.

**c11 · `cape_card` (bài 1): 525×521 px, mềm hơn mọi thẻ khác.** `dat-lien-va-bien.json:211`. Nguồn Commons là panorama rất lớn; cache lấy nhầm bản 1280 px rồi cắt vuông. Ai sửa: **designer** — lấy lại bản lớn (thẻ thưởng là màn ăn mừng, hiện to trên iPad).

**c12 · `q4_pond` (bài 4): `alt` nói "ở làng quê", ảnh là ao trong rừng ôn đới.** `song-va-ho.json:135` (dùng lại `goi-ten-va-nhom-dong-vat/ca-va-luong-cu` `q1`, `alt` "A pond in a village" · "Cái ao ở làng quê"). Phương án thay đã ghi sẵn ở brief (`04-song-va-ho.md:443`, ao sen Bình Quới của Discoverer) vừa hợp chữ, vừa hợp bối cảnh Việt Nam. Ai sửa: **designer** (ảnh) + **content-editor** (`alt` nếu đổi).

**c13 · Ví dụ một ô Rocky beach không khớp ảnh.** `05-bai-bien-dao-va-vinh.md:142–143` "waves splash white foam" · "sóng tung bọt trắng xoá", trong khi ảnh đã chọn (Boulders Beach) nước lặng, gần như không bọt; `alt` đã sửa nhưng ví dụ giữ nguyên. Thẻ từ `wave` nay có ảnh sóng riêng nên chỗ nói về bọt sóng đã có hình đúng. Ai sửa: **content-editor** — ví dụ một thành "waves wash between the rocks" · "sóng luồn giữa các tảng đá", hoặc đổi thứ tự ví dụ.

**c14 · `explore_big_cave` (bài 6): ảnh duy nhất lấy người làm chủ thể.** `hang-dong.json:65`. Khoảng chục du khách đứng trên lối gỗ giữa khung; phóng to 8× thì mặt vẫn nhoè (bản trong gói 1024×576) nên **đạt** luật "không nhận ra mặt", nhưng người chiếm phần giữa ảnh chứ không "bé xíu" như `alt`. Ai sửa: **designer** xác nhận bản gốc không rõ mặt hơn bản gói; nếu có ảnh lòng hang rộng mà người ở xa hơn thì tốt hơn.

**c15 · Hình vẽ `explore_above`/`q6`: sông vẽ chảy thẳng ra biển.** `content/images/own/nui-song-va-bien/dat-lien-va-bien.learn.explore.explore_above.jpg`. Đường đi của nước (suối → sông → biển) là nội dung #10 bài 3 (khuyến nghị 2). Chữ của bài không nói câu nào về việc đó nên **không chặn**; ghi để PM biết khi mở #10, và để designer không vẽ thêm mũi tên hay nhấn dòng chảy.

### Ghi chú thêm (không phải lỗi)

- Ô Học bài 1 có một hình vẽ đứng cạnh ba ảnh chụp; luật "một loại hình" áp cho **câu** và **kệ**, nên không vi phạm, nhưng màn Tổng kết bài 1 sẽ có một thẻ hình vẽ cạnh hai thẻ ảnh. Đúng chốt của Duy, chỉ nêu để không ai sửa nhầm.
- `tray_hill` (đồi chè Long Cốc) có luống chè chạy theo đường đồng mức, **không phải ruộng bậc thang** (không có bậc, không có ruộng nước) — đạt yêu cầu ở `03-dong-bang-va-ruong-lua.md:303`.
- `vocab.wave` (sóng xô vào đá) khá dữ so với giọng chung của bài nhưng không có người trong cảnh, đúng luật an toàn, và khớp đúng câu ví dụ "Big waves splash on the rocks."
- `son_doong_card` có một người đứng trên khối đá, chỉ là bóng nhỏ giữa cột nắng; đạt luật, và đúng cảnh hố sụt có rừng như `fact` nói.
- Ảnh nước ngoài chiếm 14/26 ảnh mới (Bali, Hàn Quốc, Hawaii, Anh, Nam Phi, Mỹ, New Zealand, Úc, San Francisco). Cảnh Việt Nam có ở 12 chỗ (Phan Xi Păng, biển mây, đồi chè, ruộng lúa, sông Tràng An, Mê Kông, kênh Mỹ Tho, cù lao An Bình, Ba Bể, Hạ Long, cửa động Phong Nha, Sửng Sốt, Sơn Đoòng). Quy ước 13 nói "bối cảnh Việt Nam **khi có ảnh hợp lệ**" nên không ai sai luật; c5, c6, c8 là ba chỗ đáng đổi nhất nếu PM muốn tăng tỉ lệ cảnh quen.

### Kết luận

Chặn phát hành **một** chỗ: B1 (chữ quảng cáo trên thuyền, ảnh sông Mê Kông). Sửa xong B1 thì phần ảnh đạt mức phát hành được; c1–c4 nên làm cùng lượt vì chỉ là `crop`; c5, c6 là hai chỗ ảnh hưởng tới việc học nhiều nhất (bãi cát và làng) nên PM chốt sớm. Chưa kiểm trong lượt này: `tts` nghe thử, `check-pack` sau khi đổi ảnh, và chơi thật trên iPhone 16 (ảnh sau khi crop thực tế trên máy).

## Quyết định sau rà ảnh (phiên chính 19/11, auto theo PM)

- **B1:** designer cắt bỏ thuyền có chữ ở `explore_mekong` hoặc đổi ảnh Mê Kông khác (giữ tên nơi nếu ảnh đúng nơi; không được thì dùng câu dự phòng và ghi "Tên nơi đã bỏ").
- **c5:** designer tìm ảnh bãi cát khô, mịn (thay ảnh bãi triều ướt) cho các chỗ "bãi cát" bài 5.
- **c6:** designer tìm ảnh làng Việt giữa ruộng lúa thay `explore_village` (ảnh chụp, cùng kiểu với các ô Học khác).
- **c1–c4, c8–c11, c14:** designer cắt khung / đổi ảnh theo đề xuất tester.
- **c7:** content-editor trả `feedback_true` q6 bài 3 về "houses stand among these fields". **c12, c13:** content-editor sửa chữ. Chữ theo ảnh mới (B1, c5, c6) content-editor sửa sau khi designer xong.
- **c15:** chấp nhận (hình toàn cảnh có sông ra biển chỉ là phong cảnh, chữ không dạy đường đi của nước).

## Ghi chú designer (19/11, lượt 2)

Sửa ảnh theo "Rà ảnh (tester 19/11)" và "Quyết định sau rà ảnh": B1, c1–c6, c8–c11, c14. Chỉ sửa sáu file `content/images/explorer/nui-song-va-bien/*.json`; **không đổi key nào trong `.md`** (204/204 chỗ, 0 thiếu, 0 thừa; 0 `same_as` hai chặng). Không sửa `content/explorer/**`, `apps/ios`, hình vẽ.

**Ảnh mới lượt 2 (7 ảnh; đã mở trang gốc 19/11, ảnh Flickr đọc giấy phép ngay trên trang):**

| Key (chỗ dùng) | Ảnh · nguồn · giấy phép | Tả ngắn (cho `alt`) |
| --- | --- | --- |
| `learn.explore.explore_mekong` bài 4 (B1) | "Vietnam 08 - 148 - life on the Mekong (3185100723)", McKay Savage · Commons · CC BY 2.0 | Sông Mê Kông nước nâu gợn sóng, một chiếc thuyền gỗ nhỏ có mui bạt chở củi, người chèo ở xa, bờ cây xanh và lục bình. Không chữ, không số. Trang gốc: "Life on the Mekong delta…". Giữ tên nơi. |
| `learn.explore.explore_sandy` bài 5 (c5; + kệ, q1, q4, w3, `vocab.beach`, `vocab.sand`; bài 6 `q4_beach`) | "Qui Nhon Beach", Nguyen Duc Loi · Flickr qua Openverse · CC BY 2.0 | Bãi cát trắng khô, mịn, cong theo mép nước xanh lặng, hàng dừa và đồi cây phía sau; vắng người, vài thanh gỗ trôi dạt. Quy Nhơn, Bình Định. |
| `learn.explore.explore_village` bài 3 (c6; + kệ, `vocab.village`) | "rice field", cosmicwindblown1 · Flickr qua Openverse · CC0 (trang ghi "Vietnam, Quang Ngai") | Nhà mái tôn đỏ, xanh nằm giữa luỹ tre, cây xanh, hàng dừa; phía trước là ruộng lúa xanh phẳng. Đã cắt bỏ dải núi mờ phía sau. Không người, không chữ. |
| `learn.explore.explore_river` bài 4 (c8; dùng ở bài 4, 5, 6) | "Song Lo @Nam TpHaGiang'2005", BacLuong · Commons · Public domain | Sông Lô (Hà Giang) nước nâu rộng, mặt nước gợn, chảy uốn quanh bờ tre xanh; khúc sông xa ở mép trái. Đã cắt bỏ phố và núi, còn một góc mái nhà rất nhỏ ở góc trên trái. |
| `tray.tray_sea` bài 1 (c4; dùng ở bài 1, 3, 4, 6) | "Avşa Adası horizon (Unsplash)", Shoot N' Design · Commons · CC0 | Biển khơi xanh gợn sóng tới chân trời thẳng, trời nhạt; không đất, không đảo, không thuyền. |
| `tray.tray_fishtank` bài 4 (c10) | "My fish tank", Lottie's pets & stuff · Flickr qua Openverse · CC0 | Trọn một bể cá kính có nắp đen trên mặt bàn gỗ, cây thuỷ sinh, đá, sỏi, ba con cá vàng. |
| `learn.explore.explore_big_cave` bài 6 (c14) | "Cueva Paraíso, Phong Nha, Vietnam (36277324796)", Edgardo W. Olivera · Commons · CC BY 2.0 | Lòng hang Thiên Đường rất rộng, cao, đầy khối đá vôi dưới đèn vàng ấm; lối đi gỗ ở góc dưới phải có vài người rất nhỏ. Tên nơi không vào chữ bé nghe. |

**Cắt khung, dùng lại (không ảnh mới):**
- **c1** `explore_dark`: chỉ lấy nửa trái (lối đi lát đá, hàng đèn, vách đá). Đã bỏ hai biển báo, lan can giữa khung và người ở xa. `vocab.dark` có mục cắt 2:1 riêng (550×281).
- **c2** `explore_by_river`: cắt bỏ thuyền bên trái có chữ sơn. Còn dãy thuyền gỗ, cầu, cây xanh, một nhà nhỏ ở mép phải; nhà mái đỏ và tháp chuông cũng ra ngoài khung. `vocab.boat` có mục cắt 2:1 riêng.
- **c3** `explore_cave`: cắt bỏ tấm biển ở mép trái, cửa hang nằm giữa dưới khung. `q1.q1_cave` có mục cắt 5:2 riêng (cửa hang không dính mép dưới), `vocab.cave` có mục cắt 2:1 riêng.
- **c9** `vocab.peak` (bài 2) trỏ `tray.tray_mountain` ở bài 1 (đỉnh nhọn rõ). `explore_fansipan` vẫn dùng cho ô Học, kệ, q3, thẻ thưởng.
- **c11** `cape_card`: nới khung, bản cache nay 794×521 (trước 521 px). Panorama gốc, Commons chỉ cho bản 1280 px, nên không lớn hơn được nếu giữ ảnh này.
- **Thẻ từ 2:1 có mục cắt riêng:** `vocab.beach` (`vocab.sand` trỏ vào), `vocab.village`, `vocab.boat`, `vocab.cave`, `vocab.dark`, cùng `vocab.wave` từ lượt 1. Các thẻ từ khác dùng ảnh ngang có tỉ lệ khung dưới 1,6.

**Sổ ảnh mới của chủ đề sau lượt 2: 29.** Giấy phép: CC0 16, PD 3, PDM 1, CC BY 9 (2.0: 6, 3.0: 1, 3.0 us: 1, 4.0: 1). So với lượt 1:
- thêm bãi cát Quy Nhơn, biển khơi Avşa, ảnh sóng Heceta (`vocab.wave`, từ lượt 1 nhưng chưa vào sổ);
- thay ảnh Mê Kông, sông, bể cá, làng, lòng hang;
- `tray_sea` không còn chép mục Discoverer, nên còn **5 ảnh chép mục Discoverer**.

Ảnh không còn dùng: Mê Kông có chữ quảng cáo, sông Yellowstone, bể cá cửa hàng, làng Hahoe, "Dong Hoi Phong Nha grotten (51663)", Open Ocean. Bài 1 w1 (ôn #4) vẫn dùng ảnh bãi biển của `oc-bach-tuoc-va-con-vat-bien`.

**Kết quả lệnh** `node tools/content-cli/src/cli.ts images fetch content/images/explorer/nui-song-va-bien` (lượt cuối 19/11): **6 file chọn ảnh · 51 ảnh khác nhau · 0 lỗi · hình tự vẽ 5**; **0 dòng "Ảnh lệch khung", 0 dòng "Chưa kiểm tỉ lệ"**, 0 cảnh báo tác giả. `fetch` in "Kiểm tay" cho ba ảnh Flickr mới; designer đã mở cả ba trang Flickr 19/11 và đọc trường license: Quy Nhơn = CC BY 2.0, Quảng Ngãi = CC0, bể cá = CC0. Ba ảnh Flickr lượt 1 cũng đọc lại trên trang: Long Cốc CC0, Ba Bể CC BY 2.0, biển mây PDM.

**Cần content-editor sửa chữ (ảnh đã đổi, key giữ):**
1. `explore_mekong` bài 4: ảnh là **một** thuyền gỗ nhỏ trên sông nâu, bờ bên kia gần. Đề xuất `alt` "A small boat on a brown river" · "Chiếc thuyền nhỏ trên dòng sông nước nâu". Ví dụ "big boats" (nếu có) nên đổi thành "boats". Tên Mê Kông giữ (ảnh đúng nơi).
2. Bãi cát bài 5 (ô Sandy beach, kệ, q1, q4, w3, từ `beach`, `sand`; bài 6 q4): `alt` cũ "A beach by the sea" · "Bãi biển vắng" vẫn đúng. Đề xuất cho rõ hơn: "Soft, pale sand by calm water" · "Bãi cát trắng mịn bên làn nước lặng". Brief các chỗ này bỏ "Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/…`", ghi ảnh mới của bài 5 (bài 6 q4 trỏ `explore_sandy` bài 5).
3. `explore_village` bài 3: `alt` "Houses among trees and fields" · "Nhà cửa giữa cây xanh và ruộng" nay đúng ảnh, giữ được. Ruộng chiếm nửa dưới khung, nhà là một dải ở giữa. Câu ví dụ "The village has a big banyan tree." không có cây đa trong ảnh; đề xuất "The village sits among the rice fields." · "Làng nằm giữa cánh đồng lúa".
4. `explore_river` bài 4: `alt` "A wide river with ripples" · "Dòng sông rộng gợn sóng" khớp ảnh. Nước **nâu** (phù sa; không đưa chữ "phù sa" vào). Câu nào nói "nước sông xanh" thì sửa.
5. `tray_fishtank`: `alt` "A glass tank with goldfish" khớp.
6. `explore_big_cave`: `alt` "A giant rock room with tiny people" nay khớp, người rất nhỏ ở góc dưới phải.
7. `vocab.peak` bài 2: brief đổi thành "Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`", `alt` theo `tray_mountain` ("A tall, steep peak" · "Đỉnh cao, sườn dốc đứng").
8. `_topic.md`: cập nhật mục "Ảnh mới" (29 ảnh mới, 5 ảnh chép mục Discoverer) và bảng Hình dùng chung. `tray_sea` không còn chép mục Discoverer; bãi cát bài 5 không còn mượn `goi-ten-va-nhom-dong-vat`.

**Còn lại, chỉ nêu:**
- `explore_village` (573×294) và `vocab.dark` (550×281) là ảnh nhỏ: Flickr qua Openverse chỉ cho bản 1024 px, và hang Sửng Sốt phải cắt mạnh để bỏ biển báo. Ảnh Học của làng là khung ngang khoảng 1,95:1; ở khung dọc trang Học iPhone, app có thể hiện cả ảnh thu nhỏ thay vì cắt, nên cần xem trên máy.
- `explore_by_river`: thuyền bên phải có một tấm biển vàng nhỏ, không đọc ra chữ ở cỡ thật.

## Sửa chữ theo ảnh lượt 2 (content-editor 19/11)

Không đổi key. Chữ bé nghe đổi (đã chạy lại `tts`): bài 3 q6 `feedback_true` trả về "Look, houses stand among these fields." (c7) và ví dụ từ `village` "The village sits among the rice fields."; bài 4 ô The Mekong ví dụ ba "boats sail up and down it"; bài 5 ô Rocky beach ví dụ một "waves wash between the rocks" (c13). `alt`, brief: `explore_mekong`; bãi cát bài 5 thành ảnh gốc mới `explore_sandy` (q4 `alt` riêng để không trùng "sandcastle"), bài 6 q4 trỏ theo; `explore_village`; `explore_by_river` "A busy riverbank by a bridge"; `q4_pond` "A small pond among trees" (c12); thẻ từ `peak` dùng `tray_mountain`. `_topic.md`: 29 ảnh mới, 5 ảnh chép mục Discoverer.

## Rà ảnh (tester 19/11, lượt 2)

> Kiểm B1 và c1–c14 đã đóng chưa, trên gói dựng lại (`content/.build/pack`, `topics/f8f76027…/700b9fe8e7b9`). Đã mở xem **7 ảnh mới** và **9 mục cắt lại hay cắt riêng** (`explore_dark`, `vocab.dark`, `explore_cave`, `q1_cave`, `vocab.cave`, `explore_by_river`, `vocab.boat`, `vocab.beach`, `cape_card`), cộng các khung cắt mô phỏng (2:1, 5:2, vuông). Zoom năm chỗ nghi có chữ, biển báo, mặt người. Mở trang Flickr của ba ảnh mới. Chạy lại `import` (0 lỗi, 7 cảnh báo `[CẦN KIỂM]`), `chk.py`, `chk2.py`, `chk3.py`, `newold2.py` biến thể theo `asset`, và `kpp2.py`/`kpp.py` trên gói.
>
> **Kết quả: 0 lỗi chặn. B1 đóng; c2–c6, c8–c14 đóng; c1 và c7 đóng một nửa; 6 mục nhỏ mới (d1–d6, không chặn).** Bảng test vector `KeyPointPictures`: **52 dòng cũ khớp từng dòng, thêm 5 dòng → 57**.

### B1 — đóng

`song-va-ho.json` `learn.explore.explore_mekong` nay là "life on the Mekong" (McKay Savage, CC BY 2.0): **một chiếc thuyền gỗ nhỏ có mui bạt**, người chèo nhìn từ sau (không thấy mặt), nước nâu, bờ cây và lục bình. Mở xem ở cỡ thật và zoom 4×: **0 chữ, 0 số, 0 logo**. `alt` "A small boat on a brown river" · "Chiếc thuyền nhỏ trên dòng sông nước nâu" khớp ảnh; ví dụ ba ô Học nay là "boats sail up and down it" (không còn "big boats") ✓.

### c1–c14

| Mục | Tình trạng | Kiểm bằng gì |
| --- | --- | --- |
| c1 `explore_dark` biển báo | **đóng một nửa** → d1 | Khung mới chỉ còn nửa trái: hai biển đỏ giữa khung và lan can đã ra ngoài, nhưng **còn một biển tròn đỏ trên cột** ở phần trên khung (≈20 px, không đọc được chữ). Mục cắt 2:1 `vocab.dark` **không** còn biển. |
| c2 `explore_by_river` chữ trên thuyền | đóng | Thuyền có chữ sơn đã ra ngoài khung; `alt` "A busy riverbank by a bridge" khớp và không chứa "boat" của câu q3. |
| c3 `explore_cave` biển mép trái, cửa hang sát đáy | đóng | Biển đã cắt; mục cắt riêng `q1.q1_cave` (5:2) có cửa hang nằm trọn, không dính mép dưới; `vocab.cave` (2:1) thấy cửa hang và dãy thuyền. |
| c4 `tray_sea` thấy đất ở chân trời | đóng | Ảnh mới (Avşa, CC0): biển tới chân trời thẳng, **0 đất, 0 đảo, 0 thuyền**. |
| c5 bãi cát | đóng | Ảnh mới Quy Nhơn (CC BY 2.0): **cát khô, mịn, sáng**, nước lặng, hàng dừa, vắng người; `alt` "Soft, pale sand by calm water" khớp. Câu q4 "xây lâu đài cát" nay có hình đỡ. Ảnh bãi biển cũ của `goi-ten-va-nhom-dong-vat` chỉ còn dùng ở bài 1 w1 (1 chỗ). |
| c6 `explore_village` | đóng | Ảnh mới Quảng Ngãi (CC0): **ruộng lúa xanh nửa dưới, dãy nhà mái tôn trong luỹ tre nửa trên**, không người, không chữ. `alt` "Houses among trees and fields" nay đúng, và **thẻ ôn ý chính ba bài 3** (ý "ruộng lúa, làng xóm và phố xá") có cả ruộng lẫn nhà — đúng điều n1 và c6 cần. |
| c7 ruộng bậc nhẹ ở `explore_plain` | **đóng một nửa** | Phần chữ xong: `feedback_true` q6 trả về "Look, houses stand among these fields." ✓ (ảnh có nhà rõ, đã zoom xác nhận). Phần ảnh **chưa**: mục `learn.explore.explore_plain` vẫn `crop: null`, nửa trái vẫn thấy bờ thửa bậc. Không chặn; để designer quyết. |
| c8 `explore_river` | đóng | Ảnh mới sông Lô (PD): nước nâu rộng, **gợn sóng rõ** (hợp câu misconception q6), bờ tre xanh; 0 tuyết, 0 hơi nước. |
| c9 thẻ từ `peak` | đóng | `vocab.peak` nay trỏ `tray_mountain` (đỉnh nhọn rõ); `tray_mountain` dùng 17 chỗ, `explore_fansipan` còn 4. |
| c10 `tray_fishtank` | đóng | Ảnh mới: trọn bể kính có nắp đen trên bàn gỗ, sỏi, cây, ba con cá vàng — nhìn ra ngay "do người làm ra". |
| c11 `cape_card` | đóng hết mức | 794×521 (trước 525×521); Commons chỉ phục vụ bản 1280 px của panorama này. Khung thẻ vuông cắt giữa vẫn đủ mũi đất. |
| c12 `q4_pond` | đóng (bằng chữ) | `alt` nay "A small pond among trees" · "Cái ao nhỏ giữa cây cối", hết chỗ nói "làng quê" trong khi ảnh là ao rừng. Ảnh ao sen Bình Quới không dùng — chấp nhận được. |
| c13 ví dụ "sóng tung bọt" | đóng | Ví dụ một ô Rocky beach nay "waves wash between the rocks" · "sóng luồn giữa các tảng đá", khớp ảnh nước lặng; bọt sóng vẫn có ở thẻ từ `wave`. |
| c14 `explore_big_cave` | đóng | Ảnh mới (hang Thiên Đường, CC BY 2.0): lòng hang rất cao rộng, khối đá vôi dưới đèn vàng ấm, lối đi gỗ ở góc dưới phải với **vài người rất nhỏ** — `alt` "A giant rock room with tiny people" nay đúng nghĩa. Tên nơi không vào chữ bé nghe. |
| c15 hình vẽ có sông ra biển | vẫn để nguyên | Chỉ là ghi chú cho PM khi mở #10; không ai phải sửa. |

### Đã kiểm lại bằng máy — đạt

- **204/204 chỗ có hình**; 41 mục ảnh thật trên **34 ảnh khác nhau**; `same_as`: 0 hỏng, 0 hai chặng; 0 `asset` thiếu file.
- **Giấy phép:** CC0 20, Public domain 6, PDM 1, CC BY 14 (2.0: 8, 2.5: 1, 3.0: 3, 3.0 us: 1, 4.0: 1) — tính theo mục, gồm cả mục cắt riêng. **0 BY-SA, 0 NC, 0 ND**; đủ `source`, `source_url`, `file_url`, `title`, `license_url`; mọi ảnh CC BY có `author`.
- **Ba ảnh Flickr mới — tester mở trang gốc, khớp cả ba:** Quy Nhơn `85675121@N04/7848767300` license id **4 = CC BY 2.0**, tiêu đề "Qui Nhon Beach"; Quảng Ngãi `191211375@N03/50694127107` id **9 = CC0**, tiêu đề "rice field | Vietnam, Quang Ngai"; bể cá `36943025@N07/3646757960` id **9 = CC0**, "My fish tank".
- **Một câu, một kệ, một loại hình:** 0 chỗ trộn ảnh chụp với hình vẽ; năm asset hình vẽ vẫn đúng năm chỗ của bài 1 (và w1 bài 2).
- **Chữ:** mọi câu EN ≤ 8 từ (đếm theo từng câu), VI không chữ số, ký hiệu; `.en` không dấu tiếng Việt; grep chữ cấm (gồm "Phong Nha", "icicle", "phủ khắp", "mát lạnh") **0 kết quả**.
- **Thẻ từ 2:1:** sáu thẻ có mục cắt riêng (`beach`, `village`, `boat`, `cave`, `dark`, `wave`). Mười thẻ còn lại dùng ảnh 1,33–1,50 nên khung 2:1 cắt 25–33 % chiều cao; mô phỏng hai thẻ chặt nhất (`bay`, `plain`) thì chủ thể vẫn nằm trong khung. `images fetch` cũng báo 0 "Ảnh lệch khung".

### Bảng test vector `KeyPointPictures` (việc 2)

Chạy lại bộ ghép ngoài Swift trên gói mới: **98 bài trong gói, 57 bài lệch khỏi 1-2-3**. So với `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/QuizWaveOneTests.swift`: **52 dòng cũ khớp từng dòng, 0 dòng lệch**, thiếu đúng 5 bài của *Núi, sông và biển*. Đã đọc từng ý chính với ô và **ảnh** ô đó rồi mới thêm:

| Bài | Ghép | Ý chính ↔ ô ↔ ảnh |
| --- | --- | --- |
| `dat-lien-va-bien` | `[1, 2, 4]` | ý1 → From up high (hình vẽ toàn cảnh) · ý2 → High land (đồi chè, núi, làng) · ý3 → Water on land (sông uốn qua ruộng). Ô Flat land không ghép |
| `nui-va-doi` | `[1, 2, 4]` | ý1 → Mountain (đỉnh dốc trong mây) · ý2 → Hill (đồi chè tròn) · ý3 → Cool up high (biển mây). Ô Fansipan không ghép |
| `song-va-ho` | `[1, 2, 4]` | ý1 → River (sông Lô gợn sóng) · ý2 → Lake (hồ lặng, thấy bờ) · ý3 → By the river (bờ sông có thuyền, cầu). Ô The Mekong không ghép |
| `bai-bien-dao-va-vinh` | `[1, 3, 4]` | ý1 → Sandy beach (bãi cát Quy Nhơn; hoà với ô Rocky beach, máy chọn ô cùng thứ tự nên thẻ ôn chỉ có cát — đã ghi ở `_topic.md`) · ý2 → Island · ý3 → Bay |
| `hang-dong` | `[1, 2, 4]` | ý1 → Cave (cửa hang) · ý2 → Dark and cool (lối đi trong hang) · ý3 → Huge caves (lòng hang rất rộng). Ô Stalactites không ghép |

`dong-bang-va-ruong-lua` ghép `[1, 2, 3]` sau khi content-editor đổi chỗ hai ô cuối, nên **không** vào bảng (đúng luật của bảng: chỉ ghi bài lệch). Bảng nay **57 dòng**, khớp số bài lệch của gói (`designerTableOnThePack` kiểm `moved == table.count`). `swiftc -parse apps/ios/Packages/SKKit/Tests/LessonPlayerTests/QuizWaveOneTests.swift` → **0 lỗi**. Chưa chạy `swift test` (cần toolchain của gói; `EmbeddedPack.isBuilt` mới quyết định test có chạy hay không).

### Mục nhỏ mới (6, không chặn)

**d1 · `explore_dark` còn một biển báo đỏ.** `hang-dong.json` `learn.explore.explore_dark`. Khung mới bỏ được hai biển giữa khung nhưng phần trên vẫn còn một biển tròn đỏ trên cột (≈20 px, không đọc ra chữ). Quy ước 8 cấm "bảng chỉ đường trong hang". Ai sửa: **designer** — cắt thêm ~130 px phía trên là hết, lối đi vẫn còn nguyên.

**d2 · Tên tác giả lệch trang gốc và lệch nhau.** (a) `explore_sandy`, `vocab.beach` (**CC BY 2.0**, bắt buộc ghi công đúng) ghi `author: "Nguyen Duc Loi"`, trang Flickr ghi **"Loi Nguyen Duc"**. (b) Hai ảnh cùng một tài khoản Flickr `76025239@N02` ghi hai tên khác nhau: `tray_hill` "Oliver Nguyễn", `explore_cool` "Son Hoa Nguyen" (trang trả realname "Oliver Nguyen"). PDM không bắt buộc ghi công nhưng màn "Nguồn hình" sẽ hiện một người thành hai. Ai sửa: **designer**.

**d3 · Ba ảnh nhỏ, trong đó một ảnh dùng ở tám chỗ.** `explore_sandy` 614×478 (ô Học, kệ, q1 khung 5:2, q4 17:10, w3 4:3, hai thẻ từ, bài 6 q4 vuông), `explore_village` 573×294, `vocab.dark` 550×281. Khung 5:2 của `explore_sandy` còn 614×246 rồi phóng lên thẻ — nhiều khả năng thấy mờ trên màn Retina. Ai sửa: **designer + ios-dev** xem trên iPhone 16 trước khi chốt; nếu mờ thì tìm bản lớn hơn (Flickr qua Openverse chỉ cho 1024 px).

**d4 · Ảnh bãi cát và ảnh vịnh cùng một kiểu bố cục.** `explore_sandy` (bờ cát cong, đồi cây, nước lặng, nhìn chếch từ trên) và `explore_bay` (bờ cong, mũi đất, nước lặng, nhìn từ vách đá) đứng ở hai ô Học liền nhau của bài 5. Không cùng một câu nên **không phạm** luật Explorer số bảy, nhưng "bãi cát" và "vịnh" là hai khái niệm bài này muốn tách. Ai sửa: **designer** cân nhắc cắt ảnh bãi cát gần hơn (thấy mặt cát, mép sóng) để hai ô khác nhau rõ.

**d5 · `explore_river` có dãy nhà phố ở góc trên trái.** Ghi chú designer nói "còn một góc mái nhà rất nhỏ"; thực tế là vài toà nhà nhiều tầng chạy dọc mép trên. Không chữ, không logo, **không phạm luật nào**, và khung vuông hay 4:3 cắt bớt phần này; chỉ ghi cho đúng hiện trạng.

**d6 · Máy báo nhầm, không phải lỗi:** ở bài 6 q1, đáp án `q1_cave` nay là **mục cắt riêng** nên mang mã `asset` khác `explore_cave`, và script "đáp án có phải ảnh mới duy nhất" báo đỏ. Thực tế bé nhìn đúng tấm ảnh cửa hang vừa gặp ở ô Học, chỉ khác khung. Ghi lại để lượt sau không bắt nhầm; script của tester đã sửa cách đọc.

### Kết luận lượt 2

**0 lỗi chặn.** B1 đóng; c2–c6, c8–c14 đóng; c1 và c7 còn một nửa (một biển báo trong hang, một nửa khung ruộng Bali) — cả hai chỉ là `crop`, không chặn. Sáu mục mới d1–d6 đều nhỏ, d3 là mục duy nhất cần xem trên máy thật. Phần ảnh của SK-058 **xong về phía tester** nếu PM chấp nhận c1, c7 ở mức hiện tại. Chưa kiểm: `tts` nghe thử, `check-pack` đã OK theo phiên chính, và chơi trọn một bài trên iPhone 16 (ảnh sau khi app cắt khung thật).

**Ghi chú designer (19/11, lượt 3):** d1 `explore_dark` cắt thêm phía trên (top 0,5), hết biển tròn đỏ. c7 `explore_plain` crop nửa phải (đường thẳng, ruộng phẳng, nhà), thêm mục 2:1 riêng `vocab.plain` (`vocab.wide` trỏ vào). d2 `author` theo tên thật trên trang Flickr: Quy Nhơn "Loi Nguyen Duc" (`explore_sandy`, `vocab.beach`); tài khoản `76025239@N02` "Oliver Nguyen" (`tray_hill`, `explore_cool`). `images fetch`: 52 ảnh, 0 lỗi, 0 lệch khung. Còn **4 dòng cảnh báo "tác giả trên Openverse"**: Openverse ghi username Flickr, không phải tên thật, nên giữ tên đúng trang thì không thể hết cảnh báo. Đề xuất dev cho `images fetch` chấp nhận tên thật Flickr, hoặc PM chọn ghi username để hết cảnh báo.

**Ghi chú designer (19/11, lượt 4, kệ Chơi hai nghĩa — Duy thấy trên máy):** đã rà cả sáu kệ, sửa 5 món; key giữ. `images fetch`: 54 ảnh, 0 lỗi, 0 lệch khung.
- `tray.tray_river` bài 3 (nhóm Sông) và bài 1 (nhóm Nơi có nước): ảnh sông Tràng An có cả ruộng lúa và núi đá, nên đổi sang trỏ `explore_river` (sông Lô, chỉ có nước và bờ tre).
- `tray.tray_hill` bài 3 (bẫy "Không ở đồng bằng"): đồi chè có luống giống ruộng, nên đổi sang trỏ `tray_grass_hills` bài 2 (đồi cỏ tròn).
- `tray.tray_village` bài 3: mục cắt riêng, lấy cụm mái nhà giữa cây. Dưới khung vẫn còn một dải ruộng lúa (ảnh không cho cắt sát hơn mà không lộ núi hay quá nhỏ; bản cache 338×202). Cần xem trên máy.
- `tray.tray_cave` bài 6: mục cắt riêng, bỏ dải sông và thuyền dưới cửa hang (nhóm Nơi có nước cùng kệ).
- Các món còn lại không thuộc hai nhóm. Bài 4 `tray_river_above` (ảnh Tràng An) giữ, vì kệ bài 4 không có nhóm ruộng hay núi.

Đề xuất content-editor:
- `tray_river` bài 1 và bài 3: `alt` → "A wide river with ripples" · "Dòng sông rộng gợn sóng"; brief → "Dùng lại hình `explore_river` ở bài `nui-song-va-bien/song-va-ho`".
- `tray_hill` bài 3: `alt` → "Soft, grassy slopes" · "Những quả đồi cỏ thoai thoải"; brief → dùng lại `tray_grass_hills` ở bài `nui-song-va-bien/nui-va-doi`.
- `tray_village`, `tray_cave`: giữ `alt`.

## Ghi chú ios-dev (19/11)

**Đã làm.**
- `ScienceKids/Resources/Localizable.xcstrings`: thêm khoá `collectible.set.landforms`, EN "Landform cards", VI "Thẻ núi sông".
- `ScienceKidsTests/InfoPlistTests.swift`: `collectibleSetNames` kiểm thêm `landforms`.
- `Packages/SKKit/Tests/LessonPlayerTests/PlayTrayPackTests.swift`: đếm lại số khay từ gói 19/11, được 98 khay (58 Explorer, 40 Discoverer). Trước đó là 92 / 52.

**Unit test (iPhone 16, một lần, bỏ UI test):** 418/418 pass. ScienceKidsTests 95, DesignSystemTests 59, ContentModelTests 28, LessonEngineTests 19, ContentKitTests 51, LessonPlayerTests 112 (có `PlayTrayPackTests` và `KeyPointPicturesTests` với bảng 57 dòng), AudioKitTests 14, ProfilesTests 22, SyncTests 18.

**Chạy thử (iPhone 16, "Cả hai").**
- **Bài 1:** hình vẽ toàn cảnh ở trang Học hiện đủ, nét. Ba hình vẽ ở q4 rõ, phân biệt được.
- **Bài 3:**
  - Ô Villages: ảnh 573×294 bị phóng khoảng 3,4 lần vào khung gần vuông, nhìn rõ là mềm, nhòe nhẹ. Không vỡ khối, nhưng kém nét hơn hẳn các ảnh khác. Nên thay ảnh lớn hơn.
  - Tổng kết trang 1: ba ý đứng cạnh ba ảnh, đúng.
- **Bài 5:**
  - Ô Sandy beach (614×478): hơi mềm nhưng chấp nhận được. Trong khung 5:2 của q1 và q4 ảnh này lấp đầy khung, nét.
  - Kệ Chơi: 6 thẻ, ba nhóm, chạy đúng.
- **Bài 6:** chạy hết tới màn Thưởng, ra thẻ "Hang Sơn Đoòng". Tab Cards có bộ "Landform cards" · *Núi, sông và biển*, 1/6, thẻ ở ô bài 6.
- **Bản đồ Explorer:** *Núi, sông và biển* có icon màu, ghi "Learning now · 1/6 lessons", không còn "Coming soon". *Nước quanh em*, *Bầu trời ngày và đêm* vẫn "Coming soon".

**Cho designer.** Ba ảnh hiện nguyên ảnh với nền giấy hai bên, không lấp khung. Đây là luật `PictureFit` có từ SK-043: ảnh quá dọc hoặc quá ngang so với khung thì hiện nguyên, không cắt thành dải. Ba chỗ:
- bài 3 q1: ảnh đồng bằng chụp từ trên cao, ảnh dọc, trong khung ngang;
- bài 5 q1: ảnh bãi đá, trong khung 5:2;
- bài 6 q4 `order_sequence`: ảnh núi, ảnh ngang, trong thẻ dọc.

Nếu muốn ảnh lấp khung thì cắt lại ảnh gần tỉ lệ khung.

**Ghi chú designer (19/11, lượt 5, theo chạy thử ios-dev):**
- **Ảnh hiện nguyên, không lấp khung (ba chỗ ios-dev báo):** đã thêm mục cắt gần tỉ lệ khung; key giữ.
  - bài 3 `q1.q1_plain`: cắt 5:2 (ruộng phẳng, đường, nhà mái ngói).
  - bài 5 `q1.q1_rocky`: cắt khoảng 2,5:1.
  - bài 6 `q4.q4_mountain`: cắt dọc khoảng 0,8:1 vào đỉnh núi.
- **Làm thêm cùng loại:** bài 2 thẻ `order_sequence` cũng dọc, nên `q4.q4_mountain` trỏ mục bài 6, và `q4.q4_hill` có mục cắt dọc riêng (đồi chè giữa khung, 461×576).
- `images fetch`: 58 ảnh khác nhau, 0 lỗi, 0 lệch khung, 0 "Chưa kiểm tỉ lệ".
- **`explore_village` chưa thay.**
  - Đã tìm thêm trên Commons (các danh mục Villages / Rice paddies in Vietnam, từ khoá tiếng Việt "cánh đồng lúa", "làng quê") và Openverse/Flickr. Ảnh hợp lệ đều thuộc một trong hai loại: có núi lớn sau làng (lẫn với bẫy "Không ở đồng bằng"), hoặc chỉ có ruộng, không có làng.
  - Ảnh Quảng Ngãi hiện tại: Flickr qua Openverse chỉ cho bản 1024 px; cắt bỏ núi thì còn 573×294.
  - Mức "≥ 1200 px cạnh ngắn" không đạt được với pipeline hiện tại: `images fetch` lấy bản Commons 1280 px và luôn thu ảnh về cạnh dài ≤ 1024 px.
  - **Cần PM/Duy chọn:** (a) giữ ảnh, chấp nhận mềm; (b) Duy cho phép một hình vẽ giấy cắt "làng giữa ruộng lúa" cho bài 3 (như bài 1); (c) dùng ảnh làng nước ngoài lớn hơn. Đề xuất (b).
- **`vocab.dark` (550×281) giữ:** mép phải là biển báo nên không nới được. Ở thẻ từ (~152 pt rộng, khoảng 456 px @3x) vẫn đủ.
- Không đổi ảnh nên không cần đổi `alt`.
- **Ảnh làng `explore_village` (phiên chính 19/11):** tạm giữ ảnh Quảng Ngãi 573×294 (hơi mềm, không vỡ). Hướng thay đề xuất cho Duy: hình vẽ giấy cắt "làng giữa ruộng lúa" cho bài 3 (cần Duy cho phép như bài 1).

## Rà ảnh (tester 19/11, lượt 3)

> Kiểm nhanh năm mục cắt mới của designer lượt 5 trên gói dựng lại (`topics/f8f76027…/81977f4f42bb`). Mở xem bốn ảnh cắt mới trong gói, mô phỏng khung app, chạy lại `kpp2.py`/`kpp.py` và các kiểm toàn vẹn. **0 lỗi chặn, 0 mục mới cần sửa.**

**Khung mới — đạt.** Tính `PictureFit.mode` (`ContentPicture.swift:188–205`, ngưỡng `maxCropRatio = 2.2`) cho **mọi** chỗ có hình của chủ đề, với khung app thật (thẻ ba lựa chọn 361×136 ≈ 2,65; hai lựa chọn 361×200 ≈ 1,80; thẻ xếp thứ tự 112×150 = 0,75; hình câu Đúng/Sai 361×250 ≈ 1,44; món Chơi và thẻ thưởng vuông; thẻ từ 2:1): **0 chỗ rơi vào `.fit`** — tức không còn chỗ nào hiện nguyên ảnh với nền giấy hai bên. Ba chỗ ios-dev báo nay là: bài 3 `q1_plain` 704×288 (2,44 trong khung 2,65 → r = 1,09), bài 5 `q1_rocky` 1024×414 (2,47 → r = 1,07), bài 6 và bài 2 `q4_mountain` 640×796 (0,80 trong khung 0,75 → r = 1,08); thêm bài 2 `q4_hill` 461×576 (0,80 → r = 1,07). Chỗ sát ngưỡng nhất còn lại là bài 5 q1 `q1_sandy` (r = 2,07) — vẫn lấp khung.

**Ảnh cắt mới — đọc đúng nội dung.** `q1_plain`: ruộng phẳng, đường thẳng có hàng dừa, cụm nhà mái ngói ở dải trên — đúng đáp án "Which picture shows a plain?", và khung hẹp này cắt bớt phần bờ thửa bậc ở nửa trái (c7 nhẹ đi, dù mục `explore_plain` vẫn chưa có `crop`). `q1_rocky`: tảng đá tròn lớn chiếm dải dưới, biển và chân trời ở trên — đúng "bãi đá". `q4_mountain`: đỉnh đá dốc trên biển mây, cao nhất trong ba thẻ ✓. `q4_hill`: đồi chè tròn, thấp ✓. Ba thẻ của bài 2 q4 (núi 0,80 · ruộng 1,21 · đồi 0,80) nay cùng lấp khung, nhìn đều nhau.

**Toàn vẹn — đạt.** 204/204 chỗ có hình; 48 mục ảnh thật (tăng vì các mục cắt riêng) trên **34 ảnh khác nhau** (không thêm ảnh mới); giấy phép CC0 26, PD 7, PDM 1, CC BY 14 — **0 BY-SA/NC/ND**, đủ nguồn, tác giả, `license_url`; `same_as` 0 hỏng, 0 hai chặng; 0 câu/kệ trộn ảnh với hình vẽ; `alt` các mục cắt giữ nguyên theo `.md`.

**Bảng test vector còn khớp.** Chạy lại trên gói mới: 98 bài, **57 bài lệch khỏi 1-2-3**; so với `QuizWaveOneTests.swift` (57 dòng): **0 dòng lệch, 0 dòng thiếu**. Cắt lại khung không đụng tới việc ghép ý chính (chỉ đổi khung ảnh, không đổi chữ ô Học).

**Ghi thêm, không phải lỗi.**
- `q1_rocky` cắt rộng hơn nên lọt **hai người rất nhỏ** đứng trên cát ở mép trái (≈10 px, không thấy mặt, không ai lội nước) — đạt luật an toàn và luật mặt người.
- Bài 5 q4 đáp án `q4_sandy` có `alt` riêng ("A quiet shore by calm water") nhưng **cùng mã ảnh** với ô Học và q1, nên vẫn là ảnh bé đã gặp; script kiểm "ảnh mới duy nhất" gom theo `alt` sẽ báo nhầm chỗ này, như d6 lượt 2.
- `explore_village` 573×294 giữ nguyên theo quyết định phiên chính; ios-dev đã đo mức phóng ≈ 3,4 lần ở ô Học. Chờ Duy chọn giữa giữ ảnh và vẽ hình giấy cắt cho bài 3.

**Kết luận:** phần ảnh của SK-058 **0 lỗi chặn**; còn mở đúng hai việc đã ghi: ảnh làng (chờ Duy) và hai mục `crop` tuỳ chọn (c1 biển báo trong hang, c7 nửa khung ruộng Bali).

## Nghiệm thu (PM 19/11)

Đủ 8/8 tiêu chí (tick kèm bằng chứng ở mục Tiêu chí). Trạng thái → **review**, chờ Duy review rồi commit.

- `validate` 0 lỗi, 7 cảnh báo `[CẦN KIỂM]`. Tester rà chữ 2 lượt, rà ảnh 3 lượt, lượt cuối 0 lỗi chặn.
- Gói build lại, `check-pack` OK (16 chủ đề). content-cli 401/401.
- iOS 418/418 trên iPhone 16, chạy trên gói **trước** lượt cắt khung cuối (designer lượt 5). Lượt sau chỉ đổi khung ảnh, không đổi chữ hay key. Tester kiểm lại trên gói mới: `PictureFit` 0 chỗ `.fit`, bảng `KeyPointPictures` 57/57.
- Chạy thử bài 1, 3, 5, 6 đạt; bộ thẻ "Landform cards" · "Thẻ núi sông".
- **Ghi chú PM về c1, c7:** tester lượt 3 vẫn ghi hai mục này là "crop tuỳ chọn". Nhưng file chọn ảnh hiện tại đã có `crop` do designer làm ở lượt 3: `hang-dong.json` `explore_dark` có `top: 0.5`; `dong-bang-va-ruong-lua.json` `explore_plain` có `left: 0.45`, lấy nửa phải. Vậy phần việc trong file đã xong; còn lại chỉ là Duy xem trên máy có ưng không.
- **Lưu ý vận hành (19/11):** ios-dev lỡ gửi 3 tap vào iPhone 16 Pro của Duy (máy Duy dùng test app khác); đã báo Duy. Luật từ nay: mọi lệnh simulator ghi rõ `device: iPhone 16`; brief cho ios-dev, tester phải nhắc luật này.

## Còn mở cho Duy

1. **`[CẦN KIỂM]` chuyên môn (51 dòng, 7 cảnh báo `validate`):** độ cao Fansipan, số đảo Hạ Long, "một trong những hang lớn nhất thế giới", ba misconception chưa có nguồn (`land_all_flat`, `plain_is_one_field`, `caves_are_small`). Chờ người chuyên môn, giống SK-048, SK-049, SK-050, SK-053.
2. **Ảnh làng bài 3 (`explore_village`, 573×294, phóng khoảng 3,4 lần, hơi mềm).** Ba lựa chọn:
   - (a) giữ ảnh, chấp nhận mềm;
   - (b) cho phép vẽ một hình giấy cắt "làng giữa ruộng lúa" cho bài 3, như bài 1;
   - (c) dùng ảnh làng nước ngoài lớn hơn.

   **PM đề xuất (b).** Ảnh Việt Nam hợp lệ đã tìm hết; (c) làm mất cảnh làng Việt mà bài cần. Nếu Duy chọn (b): designer vẽ, ô Học và kệ giữ đúng luật "một câu, một kệ, một kiểu hình". Kệ bài 3 hiện toàn ảnh chụp, nên `tray_village` giữ ảnh, chỉ ô Học đổi sang hình vẽ.
3. **c1, c7 (khung cắt):** file đã cắt (xem Nghiệm thu). Duy chỉ cần xem trên máy có ưng không.
4. **4 cảnh báo "tác giả trên Openverse".** Openverse ghi username Flickr; file chọn ảnh ghi tên thật trên trang Flickr. Tên thật đúng hơn cho ghi công CC BY, nên cảnh báo không tự hết. **PM đề xuất:** dev sửa `images fetch` để chấp nhận tên thật khi trang Flickr trả `realname` khớp, hoặc cho phép ghi một trường `author_verified`. Không đổi sang ghi username. Cần ticket dev nếu Duy ok (gộp được với SK-056).
5. **Nghe clip VI:** `content/.build/tts/sk058/`, nhất là tên nơi và từ khó đã ghi ở `_topic.md` mục "Đọc bằng máy": "Phan Xi Păng", "Sơn Đoòng", "Lý Sơn", "nhũ đá", "dốc đứng", "thoai thoải".
6. **Tên nơi đã bỏ:** chỉ bỏ động Phong Nha ở bài 6, ô Huge caves. Lý do: trang gốc của ảnh không chắc là động Phong Nha. Sáu nơi còn lại giữ tên vì có ảnh đúng nơi và giấy phép hợp lệ, trong đó có thẻ thưởng "Hang Sơn Đoòng". Duy xác nhận hoặc muốn bỏ thêm.

## Đề xuất cho vùng khác (PM ghi, chủ vùng làm)

- **`content/TEMPLATE.md` (content-editor; quyết định 7 của phiên chính):** TEMPLATE mục Hình (dòng 58, luật Duy 9/11) đang ghi "không dùng hình hoạt hình, giấy cắt cho hình nội dung". Câu này áp cho mọi nhóm tuổi, nên khác quyết định Duy 19/11. Đề xuất thêm ngay sau câu đó: "Hình nội dung Explorer mặc định là ảnh chụp. Hình vẽ giấy cắt style E chỉ được dùng khi Duy cho phép theo chủ đề, và phải ghi trong ticket cùng `_topic.md` mục Quy ước hình (ví dụ SK-058 bài 1, Duy 19/11). Luật đi kèm: trong một câu quiz và trên một kệ Chơi chỉ một kiểu hình; đáp án đúng không là hình vẽ duy nhất; không hình Trái Đất từ vũ trụ, bản đồ, bờ biển Việt Nam." content-editor sửa ở lượt dọn TEMPLATE kế tiếp.

## Việc theo sau (đề xuất ticket mới)

- **Dọn 18 chỗ "Dùng lại hình" trỏ hai chặng ở 6 chủ đề khác** (tester phát hiện khi rà SK-058). Ở các chỗ này, brief trỏ tới một mục mà mục đó lại trỏ tiếp sang mục khác. `same_as` vẫn chạy, nhưng luật 14 của khuôn mới yêu cầu mọi "Dùng lại hình" trỏ thẳng về mục có ảnh thật. Phụ trách: content-editor sửa brief trong `.md`, designer sửa `same_as` trong file chọn ảnh; tester kiểm bằng script soi "Dùng lại hình". Tiêu chí: 0 chỗ hai chặng trên toàn `content/explorer/`, `validate` 0 lỗi, `images fetch` 0 lỗi, gói build lại `check-pack` OK. PM mở ticket khi Duy ok (đề xuất id SK-060).
- **`images fetch` chấp nhận tên thật Flickr:** việc 4 ở trên (dev).
