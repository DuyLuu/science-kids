# SK-043 · Thiết kế lại màn Học, Chơi, Quiz theo hướng A "Sách tranh" (ít chữ, hình to)

Trạng thái: in_progress (thiết kế, chưa code) · Ngày: 2026-11-13 · Phụ trách: designer → ios-dev (sau khi Duy duyệt) · Tester: tester
Nguồn: Duy 13/11 ("màn hình game play hiện tại đang nhiều chữ và hình minh hoạ hơi nhỏ … design lại những dạng game play, những loại màn hình quiz chính để t review, chưa code"; chọn "A Sách tranh"); phương án ở `design/play-ui/options/lesson-less-text/`

## Quyết định
- Duy 13/11: chọn hướng A · Sách tranh (một màn một ý, ảnh lớn, chữ chỉ là phụ đề có loa).
- Mặc định main session (Duy đổi được): lời giải thích một câu, không mở đầu "Đúng rồi!"; hai trò mới (`sort_into_groups`, `hotspot_image`) để sau beta; chưa có trang "So sánh bốn nhóm"; iPad ngang giữ khung 600 cho tới khi Duy đồng ý đổi.

## Việc tiếp
- designer: hoàn thiện A cho mọi màn (iPhone + iPad, các trạng thái đúng/sai/hết lượt, Explorer đồng bộ), đưa Duy duyệt lần cuối.
- Sau khi Duy duyệt: ios-dev code (LearnStep trang lật, PlayStep kệ không nhãn, QuestionStep thẻ dọc/lưới 2×2, header gọn).

## designer · Explorer A
Ngày 13/11, designer, theo yêu cầu Duy: làm thử A trên chủ đề Explorer *Gọi tên và nhóm động vật* trước. Nội dung và ảnh thật của bài 4 `content/explorer/goi-ten-va-nhom-dong-vat/04-ca-va-luong-cu.md` (bài này có đủ các block và dạng câu); bốn bài khác của chủ đề dùng cùng các màn.

- **Trang thiết kế, có ghi chú từng màn và mục "Cho ios-dev":** `design/play-ui/options/lesson-less-text/Explorer-A.html`. Mở một khung riêng bằng `?shot=<id>`.
- **Ảnh tham chiếu:** `design/play-ui/options/lesson-less-text/img/` (ảnh thu nhỏ từ `content/.images`, mascot, gật/lắc chép từ Assets).
- **PNG** (phiên designer, ngoài repo): `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/shots/A-final-explorer-<id>.png`. Phiên chính chép vào repo nếu cần.

| Màn | id iPhone 390×844 | id iPad 834×1194 |
| --- | --- | --- |
| Học, trang nhóm (4 trang) | `learn-1` … `learn-4` | `ipad-learn` |
| Học, trang Từ mới | `learn-words` | |
| Chơi: mở đầu, giữa chừng, món bẫy, khay đạt | `play-start`, `play-mid`, `play-trap`, `play-done` | `ipad-play` |
| Quiz single_choice: đang hỏi, đúng, sai còn lượt, hết lượt | `q1-ask`, `q1-right`, `q1-retry`, `q1-out` | `ipad-q1` |
| Quiz true_false: đang hỏi, đúng, sai còn lượt | `q2-tf-ask`, `q2-tf-right`, `q2-tf-retry` | `ipad-q2-tf` |
| Quiz order_sequence: đang xếp, đúng | `q4-order-place`, `q4-order-right` | `ipad-q4-order` |
| Thưởng | `reward` | `ipad-reward` |

Id trong HTML có tiền tố `x-`; PNG là `A-final-explorer-<id>.png`.

**Tóm tắt cho ios-dev**
- **Học:** trang lật, mỗi `group` một trang, `word_list` là trang cuối.
  - Ảnh 322×392 bo 20, nhãn nhóm một chữ.
  - `sentence` nằm trong bong bóng, tự đọc khi trang mở; `examples` chỉ đọc, không in.
  - Trang mở là tính đã xem.
  - Nút "Trang trước" tròn 72 (không có ở trang 1) và mũi tên đỏ 72; vuốt cũng lật được.
- **Chơi:** kệ 3 cột ảnh lấp đầy ô (110×96), không chữ; khay 2 chỗ ảnh tròn 96.
  - Chip nhóm 72 giữ như SK-040; mũi tên chỉ khi đạt.
  - Món `limit`: ảnh trên khay nhạt, có góc giấy gấp, không in nhãn.
- **Quiz:** giữ khung D2 (SK-026).
  - Thẻ ảnh lấp đầy, cao 136; ô tiến độ không số; lời giải thích bỏ "Đúng rồi!".
  - `order_sequence`: dải 3 chỗ đánh số + 3 thẻ dưới, đủ 3 thì tự chấm.
  - `true_false`: ảnh câu hỏi + hai thẻ gật/lắc 170.
- **Thưởng:** ảnh thẻ thưởng làm sticker 250 có triện, sao, sổ sticker một hàng, giấy vụn. Không XP (D1).
- **iPad:** khung 600; quiz 3 thẻ một hàng; kệ 4 cột ô 150.
- **Không cần đổi schema.** Chuỗi app mới cần clip giọng: "Từ mới! Em chạm để nghe nhé."

**Còn mở cho Duy:** trang Học có cần nút "Trang trước" hay chỉ vuốt; số lượt của `true_false` Explorer (câu kỹ thuật SK-026).

## ios-dev 13/11

Làm theo `Explorer-A.html` và mục "designer · Explorer A" ở trên, áp cho các bài Explorer. Dùng gói `content/.build/pack` có sẵn trong app (ảnh và giọng thật), kiểm trên bài 3 và bài 2 của *Gọi tên và nhóm động vật*. Chưa commit.

**Đã làm**
- **Học** (`ExplorerLearnStep`, mới): sách tranh, mỗi `group` một trang, `word_list` là trang cuối.
  - Trên trang: bong bóng linh vật kèm nút loa tròn 72 (và nút VI ở chế độ Cả hai); dưới là ảnh lớn lấp đầy khung (tối đa 380, co lại khi câu dài), bo 20, lót mảnh giấy màu nhóm; nhãn nhóm cắt ở góc ảnh.
  - Thanh trang mỗi trang một ô theo màu nhóm, ô hiện tại dài. Nút "Trang trước" tròn 72 (không có ở trang 1) và mũi tên đỏ chỉ có hình.
  - Vuốt trái/phải cũng lật trang. Bật giảm chuyển động thì đổi trang bằng mờ dần, không trượt.
  - Trang mở là tự đọc: tên nhóm, câu, rồi các ví dụ; ví dụ không in ra màn. Mở trang là tính đã xem.
  - Trang Từ mới: bong bóng "Từ mới! Em chạm để nghe nhé." (khoá `lesson.explorer.learn.words_intro`, chưa có clip) và thẻ ảnh của từng từ; ở chế độ Cả hai, nút VI nằm dưới thẻ.
- **Chơi**:
  - Header chỉ có nút lùi và 4 ô bước; lời nhắn dùng bong bóng linh vật như Quiz.
  - Món đặt lên khay là ảnh tròn lấp đầy, không chữ. Món thuộc nhóm `limit` nhạt đi và có góc giấy gấp; không in nhãn "Không phải…".
  - Kệ 3 cột ô 96, chỉ có ảnh (iPad 4 cột ô 124). Chip nhóm 72 giữ như SK-040. Mũi tên chỉ hiện khi khay đạt.
- **Quiz Explorer** (vẫn khung D2):
  - Bong bóng mới: linh vật nhỏ 52, nút loa tròn 72 bên phải, nút VI dưới nút loa.
  - Thẻ ảnh lấp đầy, cao 136 với 3 lựa chọn, 200 với 2 lựa chọn; iPad một hàng thẻ cao 300.
  - Ẩn hình câu hỏi khi các lựa chọn đã có hình; `true_false` có ảnh câu hỏi lấp đầy, cao 250.
  - `order_sequence`: 3 chỗ trên một dải lõm, mỗi chỗ đánh số (chỗ trống hiện số mờ, chỗ đã đặt có thẻ số tối ở góc); đủ 3 thẻ thì tự chấm.
- **Thưởng**: sticker tròn 250 là ảnh thẻ thưởng lấp đầy, rồi sao; không XP.
- **Phần dùng chung** (`PictureBookParts.swift`): header gọn có tiêu đề (`CompactLessonHeader`, để dành cho Discoverer lượt sau), header Explorer, thanh trang, bong bóng lời của app.
- Chế độ "Cả hai" (EN tự đọc, nút VI) vẫn chạy trên mọi màn mới. Discoverer giữ nguyên.

**Chỗ lệch thiết kế**
- Khay ở màn Chơi vẫn là hình bầu dục cũ chứa ảnh tròn 96, chưa đổi sang dạng viên thuốc. Bài 3 có 3 nhóm và 3 chỗ nên kệ phải cuộn một ít trên iPhone 16 Pro.
- `order_sequence` chưa có mũi tên nhỏ giữa các chỗ. Hàng thẻ bên dưới hẹp hơn dải một chút.
- Lời giải thích vẫn mở đầu "Đúng rồi!"/"Yes!" như trong nội dung; app không tự cắt chữ, để chữ khớp với giọng đọc. Cần content-editor sửa nội dung.
- Ảnh cắt lệch tâm: con voọc (bài 1) và gà con (bài 3) bị cắt lệch khi thẻ hẹp hoặc thấp. App chưa đặt được tâm cắt riêng cho từng ảnh; cần ảnh cắt sát hơn hoặc một trường tiêu điểm trong nội dung (đề xuất cho dev/designer).
- Thưởng chưa có sổ sticker một hàng; triện chỉ hiện khi bé chạm dán sticker.
- Header Explorer dùng màu ô bước của token (lá tre có dấu tích), không phải đỏ son như ảnh thiết kế.

**Test**
- Unit test (bỏ UI test), chạy 1 lần trên iPhone 16 Pro: TEST EXECUTE SUCCEEDED, mọi bộ qua. Có test mới `ExplorerTests.learnIsAPictureBook`. Hai chỉnh bố cục cuối (đổi lớp màu nền trang Học, chiều cao thẻ trên iPad) chỉ build lại, không chạy lại test.
- Chạy trên iPhone 16 Pro và iPad Pro 11-inch (M4), lần lượt từng máy, xong đã tắt cả hai.
- Ảnh trong `scratchpad/shots/A-explorer-*.png`.

## ios-dev 13/11 · ảnh lệch tỉ lệ (Duy test bài 1, con vẹt)
- `PictureFit.mode(image:box:)` (DesignSystem, `ContentPicture.swift`): nếu tỉ lệ ảnh và tỉ lệ khung chênh nhau quá 1,5 lần (ví dụ ảnh dọc trong thẻ ngang) thì hiện trọn ảnh, bo góc, đặt giữa trên nền giấy lõm của khung; nếu chênh ít hơn thì vẫn cắt lấp đầy như cũ.
  - Áp chung cho mọi ảnh nội dung vì mọi chỗ đều đi qua `ContentPicture`: thẻ lựa chọn, trang Học, kệ, khay, ảnh câu hỏi, ở cả Explorer và Discoverer.
  - Tỉ lệ ảnh lấy từ ảnh đã giải mã (cùng tỉ lệ với ảnh gốc), không đọc `width`/`height` trong manifest.
- Unit test `pictureFitCropsCloseShapesAndFitsFarOnes` (DesignSystemTests).
  - Lần chạy toàn bộ unit test đầu tiên có 1 test hỏng do tôi tính sai một ca trong chính test này: ảnh 4:3 trong khung 322×380 chênh 1,57 lần nên là fit, không phải fill.
  - Sửa ca đó rồi chạy lại riêng `DesignSystemTests`: 59 test qua. Các bộ khác đều qua ngay lần đầu.
- Chạy trên iPhone 16 Pro, xong đã tắt. Ảnh: `scratchpad/shots/A-explorer-crop-fix.png`, câu q5 bài 1, con vẹt giờ hiện trọn.
- **Cần Duy/designer xem:** thẻ quiz trên iPhone rất ngang (khoảng 2,5:1), nên với ngưỡng 1,5 thì gần như mọi ảnh 4:3 hoặc ảnh vuông trong thẻ quiz đều hiện trọn, hai bên là giấy. Ảnh lớn ở trang Học cũng ra trọn khi gặp ảnh ngang. Muốn giữ cắt lấp đầy cho ảnh ngang thông thường thì nâng ngưỡng lên khoảng 2,2, hoặc đổi tỉ lệ thẻ. Đây là một hằng số: `PictureFit.maxCropRatio`.
- **Main session chốt 13/11:** `PictureFit.maxCropRatio` = 2,2. Ảnh ngang thông thường (4:3 trong thẻ quiz) vẫn cắt lấp đầy; chỉ ảnh lệch hướng rõ (ảnh dọc trong thẻ ngang) mới hiện trọn. Đã sửa test cho khớp; `DesignSystemTests` 59 test qua, chạy 1 lần trên iPhone 16 Pro, đã tắt simulator.

## dev 13/11 · cảnh báo tỉ lệ ảnh

Duy 13/11: ảnh dọc trong thẻ đáp án ngang bị cắt còn thân con vật; muốn chọn ảnh đúng hướng với chỗ dùng. `tools/content-cli` giờ cảnh báo (không chặn build) khi ảnh lệch khung. Chưa commit.

**Đã làm**
- `build` và `images fetch` so kích thước ảnh đã xử lý (sau `crop`, lấy từ `content/.images/index.json`) với tỉ lệ khung của chỗ dùng.
  - Chỗ dùng suy từ JSON pointer: hình câu hỏi, thẻ lựa chọn (2 / 3 / từ 4 lựa chọn), thẻ xếp thứ tự, thẻ từ có hình (`fill_blank_bank`), trang Học (nhóm), món ở màn Chơi, thẻ từ vựng, sticker thưởng. Cả Khởi động lẫn Quiz.
  - Explorer bỏ qua hình câu hỏi khi mọi lựa chọn hoặc thẻ xếp đều có hình, vì app ẩn nó.
- Dòng cảnh báo nêu file bài, tên bài, khoá hình, chỗ dùng, kích thước và tỉ lệ ảnh, tỉ lệ khung, mức lệch, phần trăm ảnh mất nếu lấp khung. Kèm gợi ý `crop` cắt giữa đúng tỉ lệ khung, tính trên ảnh gốc và gộp với `crop` cũ, hoặc "chọn ảnh khác".
  - Ảnh `same_as` thì chỉ ra mục gốc. Hình ghép, hình tự vẽ thì nhắc sửa file.
- `build`: một dòng tổng `ảnh lệch khung (…): N hình · <chủ đề> n, …` rồi từng dòng, trong mục Cảnh báo.
- `images fetch`: cuối lượt chạy, kiểm các bài của file chọn ảnh vừa fetch, đọc markdown `content/<nhóm>/<chủ đề>/<nn>-<bài>.md`. Bài chưa qua content-schema thì in "Chưa kiểm tỉ lệ ảnh".
- **Bảng khung:** `tools/content-cli/image-slots.json`. `default` cho mọi nhóm tuổi, `age_groups` ghi đè; giá trị `"rộng:cao"`.
  - default (đề xuất của phiên chính): câu hỏi 4:3, thẻ 3 lựa chọn 3:1, 2 lựa chọn 2:1, từ 4 lựa chọn 1:1; thẻ xếp, thẻ từ có hình, trang Học, món Chơi, từ vựng, sticker đều 1:1.
  - Explorer, theo code iOS hiện tại trên iPhone (thẻ ~342×136 và ~342×200): 3 lựa chọn 5:2, 2 lựa chọn 17:10.
  - Discoverer, ước từ code (lưới quiz 3 cột, hình ~98×55 trên chữ): thẻ lựa chọn và thẻ từ có hình 16:9.
  - `max_factor` 2,2 khớp `PictureFit.maxCropRatio` phiên chính chốt: quá mức đó app thôi cắt, hiện cả ảnh thu nhỏ. Cảnh báo vì thế đúng là các ảnh sai hướng so với khung.
- **Designer:** chưa có bảng tỉ lệ khung trong ticket này. Khi có, sửa `image-slots.json` (README content-cli mục "Ảnh lệch khung"). iPad Explorer xếp 3 thẻ một hàng cao 300 (gần 2:3 dọc), ngược hướng với iPhone (5:2 ngang): một ảnh không vừa cả hai, chưa kiểm iPad.

**Kết quả trên nội dung hiện tại** (build mọi chủ đề vào thư mục tạm, không đụng `content/.build/pack`):

| Chủ đề | max_factor 2,2 (mặc định) | max_factor 1,5 |
| --- | --- | --- |
| goi-ten-va-nhom-dong-vat (Explorer) | 23 | 105 |
| be-mat-trai-dat | 7 | 33 |
| da-va-dat | 13 | 80 |
| ho-hap | 4 | 25 |
| khung-long | 11 | 53 |
| nao-bo-va-giac-quan | 0 | 11 |
| thoi-tiet-va-thien-tai | 0 | 6 |
| an-uong-lanh-manh | 0 | 0 |
| **Tổng** | **58** | **313** |

- Explorer, ngưỡng 2,2: 21 thẻ 3 lựa chọn, 2 món Chơi (`tray.tray_croc` bài 1 và 6, ảnh 2,67:1 trong ô 1:1).
  - Ảnh dọc: con vẹt `q5.q5_parakeet` (bài 1) và `w2.w2_parakeet` (bài 2), dơi `q5.q5_bat` (bài 2) và `q6.q6_bat` (bài 3), gà con `q3.q3_chick` (bài 4).
  - Còn lại là ảnh gần vuông trong thẻ 5:2: vịt, voọc, trâu, mèo con, thỏ, chim cánh cụt, voi, sen, mũ.
- Ngưỡng 1,5 thêm 82 ảnh Explorer, phần lớn là ảnh ngang 3:2 hoặc 4:3 trong thẻ 5:2 (lấp khung mất 40–47%). Thẻ 3 lựa chọn của Explorer rất ngang, nên gần như mọi ảnh chụp thường đều bị cắt. Có thể sửa bằng tỉ lệ thẻ (designer) thay vì đổi từng ảnh.

**File:** `tools/content-cli/image-slots.json` (mới), `src/images/aspect.ts` (mới), `src/images/aspect-report.ts` (mới), `src/build/command.ts`, `src/images/fetch.ts`, `src/cli.ts`, `README.md`, `test/aspect.test.ts` (mới), `test/build.test.ts`.

**Test:** `npm test` (content-cli) 376/376 qua. Lần chạy đầu có 1 test mới hỏng do kỳ vọng sai trong chính test, đã sửa; sau đó chạy lại riêng `aspect.test.ts` và `build.test.ts`, rồi chạy cả bộ thêm 1 lần cùng việc SK-041. `npm run typecheck` qua. `images fetch` thật chưa chạy vì nó gọi mạng; phần kiểm tỉ lệ của fetch đã chạy trên toàn bộ `content/images` bằng script, không gọi mạng, ra đúng số như build.

**Tester kiểm:**
- `build` mọi chủ đề ra 58 dòng "lệch ×" và vẫn exit 0.
- Đặt `crop` theo gợi ý cho `q5.q5_parakeet` bài 1, chạy `images fetch` rồi `build`: dòng đó mất.
- Sửa `image-slots.json` sai dạng: build dừng với lỗi nêu chỗ sai.

## designer · Bảng tỉ lệ khung ảnh (chính thức, 13/11)
Sau khi Duy test trên iPhone (13/11): thẻ 3 lựa chọn cắt con vẹt chỉ còn phần thân. Bảng dưới là tỉ lệ khung app đặt ảnh vào, theo chỗ dùng.
- Mỗi khoá hình trong file chọn ảnh đặt `crop` đúng tỉ lệ khung của chỗ nó hiện. Một ảnh dùng ở nhiều khung khác tỉ lệ thì mỗi chỗ một mục có crop riêng; `same_as` chỉ giữ khi hai chỗ cùng khung và cùng crop.
- Dev chép cột "Tỉ lệ crop" vào `tools/content-cli/image-slots.json`.
- Kiểm tỉ lệ thì máy làm được, còn "con vật nằm trọn trong vùng an toàn" vẫn phải người duyệt trên trang review.

| Khung (`image-slots.json`) | Chỗ dùng (khoá hình) | Tỉ lệ crop (rộng:cao) | Khung app iPhone 390 (pt) | Khung app iPad, khung giấy 600 (pt) | Vùng an toàn: phần con vật phải nằm trọn |
| --- | --- | --- | --- | --- | --- |
| `question` | ảnh câu `wN`/`qN` (Explorer chỉ còn ở true_false; câu có thẻ hình thì ẩn) | 4:3 | 336 × 250 | 528 × 396 | 95% giữa |
| `choice_2` | `qN.<option>`, câu 2 lựa chọn | 17:10 | thẻ 342 × 200 (ảnh ≈ 326 × 184) | như iPhone, rộng 528 | 95% giữa; được cắt chút chân hay đuôi |
| `choice_3` | `qN.<option>`, câu 3 lựa chọn | 5:2 | thẻ 342 × 136 (ảnh ≈ 326 × 130) | đề xuất xếp dọc 544 × 218 (xem đề xuất 1) | 95% giữa; ảnh dọc (con vật đứng cao) phải đổi ảnh, không cắt được |
| `order_item` | `qN.<item>` của order_sequence | 1:1 | đề xuất ô đặt và thẻ dưới đều vuông, 3 cột ≈ 104 (xem đề xuất 2) | 3 cột ≈ 160 | 90% giữa |
| `learn_group` | `learn.explore.*` | 4:3 nếu con vật nằm ngang, 1:1 nếu đứng cao | đề xuất khung theo ảnh: ảnh rộng/cao ≥ 1,2 thì 4:3, còn lại 1:1 (xem đề xuất 3) | rộng 528, cùng quy tắc | 95% giữa |
| `tray_item` | `tray.*` | 1:1 | ô kệ 110 × 96 (đề xuất vuông 110 × 110), khay tròn 96 | ô 150 | con vật trong hình vuông giữa; khay tròn cắt góc, chấp nhận |
| `vocab` | `vocab.*` (thẻ Từ mới 2 cột) | 2:1 | ≈ 153 × 76 | ≈ 260 × 130 | 95% giữa |
| `reward` | `reward.*` (sticker tròn) | 1:1 | tròn 232 | tròn 320 | con vật trong vòng tròn nội tiếp (≈ 94% giữa) |
| `bank_item` | (Explorer không dùng) | 1:1 | — | — | — |

**Đề xuất cho ios-dev, kèm phần dev cập nhật `image-slots.json`**
1. **iPad, thẻ lựa chọn Explorer.** Ba thẻ một hàng 170 × 300 là khung dọc, lệch 4,4 lần so với crop 5:2, nên app sẽ hiện cả ảnh thu nhỏ giữa giấy (PictureFit). Đề xuất xếp dọc như iPhone (544 × 218, 3 thẻ vừa khung 600 × 1194). Cách này lệch D2 "một hàng trên iPad", cần Duy đồng ý; chưa đổi thì ảnh vẫn không bị cắt, chỉ nhỏ.
2. **order_sequence Explorer.** Hiện là thẻ dọc 5:2 ở dưới và ô đặt cao 128 ở trên, hai khung lệch nhau hơn 3 lần. Đề xuất cả ô đặt lẫn thẻ đều vuông, 3 cột, như mockup `Explorer-A.html#x-q4-order-place`. Crop `order_item` đã cắt 1:1.
3. **Trang Học.** Khung hiện co giãn cao 180–380, tức tỉ lệ khoảng 0,84–1,8. Đề xuất đặt khung theo tỉ lệ ảnh, kẹp ở 4:3 hoặc 1:1, để ảnh nằm ngang (cá chép, cá sấu) không bị cắt đuôi. Cho dev: `learn_group` giữ "1:1"; ảnh 4:3 lệch 1,33 lần, dưới ngưỡng 2,2, nên không báo.
4. **Thẻ Từ mới:** `vocab` đổi thành "2:1" cho Explorer, đúng khung 2 cột hiện có.
5. **Discoverer:** chưa rà trong lượt này. Bảng 16:9 trong `image-slots.json` vẫn là số ước từ code; designer xác nhận khi làm A cho Discoverer.

**Đã làm cho chủ đề Gọi tên và nhóm động vật (6 bài):**
- Rà 241 chỗ có hình trong 6 bài. Câu Explorer có thẻ hình thì app ẩn hình câu hỏi, nên 31 hình đó không rà. Còn 52 ảnh nguồn; mỗi ảnh đều đánh dấu vùng con vật trên lưới 10%, rồi tính `crop` theo khung của từng chỗ dùng.
- **114 mục ảnh** đặt crop mới.
- **65 mục `same_as` tách thành mục riêng có crop riêng**, vì cùng ảnh nhưng hiện ở khung khác tỉ lệ. Mục tách có ghi chú "Tách khỏi same_as …". Còn 21 `same_as` giữ nguyên vì cùng khung, cùng crop.
- **10 chỗ đổi sang 4 ảnh mới đúng hướng** (thẻ 5:2 không cắt được con vật trọn):

  | Ảnh mới | Thay ảnh cũ | Giấy phép, tác giả | Chỗ dùng |
  | --- | --- | --- | --- |
  | `File:Nón lá đồ chơi.jpg` | nón lá chụp từ trên, hình tròn | CC BY 2.0, terence from Singapore | bài 1 w1 |
  | `File:Hen 0001.jpg` | gà mái đứng cao | CC BY 2.5, Lilly M | thẻ 3 lựa chọn: bài 1 q2, bài 3 q3, bài 5 q3, bài 6 q4 |
  | `File:The Seychelles flying fox (Pteropus seychellensis).jpg` | dơi treo, ảnh dọc | CC BY 4.0, Yulia Kolosova | bài 2 q5 và từ `bat`, bài 3 q6 |
  | `File:In an ARS study, day-old chicks … (50637557478).jpg` | gà con, ảnh dọc | Public domain, USDA | bài 3 w1, bài 4 q3 |

  Ảnh cũ vẫn dùng ở khung vuông (ô kệ, sticker, thẻ thứ tự), nơi con vật vẫn nằm trọn.
- **Chấp nhận cắt nhẹ, không mất phần nhận diện:** móng chân, đầu đuôi, mép cánh ở khoảng 20 chỗ, ví dụ chân chim cánh cụt và gà con ở thẻ 5:2, đuôi cá chép ở ô kệ vuông.
- **Giữ đúng ý cũ ở hai chỗ:** từ `fin` vẫn cắt vào vây đuôi cá chép, không lấy chung crop với `gills`; ô thứ tự nòng nọc vẫn phóng một con.
- **Cỡ tối thiểu sau cắt** (để ảnh không vỡ ở màn @3x): trang Học và ảnh Đúng/Sai rộng ≥ 900 px, thẻ 5:2 ≥ 840, thẻ 17:10 ≥ 700, thẻ Từ mới và sticker ≥ 600, ô kệ và ô thứ tự ≥ 330. Con vật nhỏ trong ảnh thì giữ thêm bối cảnh, không phóng quá mức này. Dev có thể thêm cảnh báo theo các số này.
- **Kết quả `images fetch`** cho cả chủ đề (gồm cả bài 7–8, mục dưới): 192 ảnh, 0 lỗi, 0 cảnh báo lệch khung.
  - Đã xem lại từng ảnh đã xử lý theo đúng khung.
  - Trang duyệt cũ `content/.build/images/goi-ten-va-nhom-dong-vat/*/review.html` (12/11) chưa cập nhật theo crop mới. Bảng xem lại theo khung nằm ở phiên designer: `scratchpad/crop/verify.html`.
  - 11 dòng "Kiểm tay" là ảnh Openverse/Flickr cũ (không đổi trong lượt này): cần mở trang gốc xác nhận giấy phép trước khi phát hành, như trước.

**designer · Hình bài 7–8 (13/11)**
- File chọn ảnh mới:
  - `content/images/explorer/goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan.json` (39 khoá)
  - `content/images/explorer/goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien.json` (40 khoá)
- Mọi chỗ có crop đúng khung từ đầu (bảng trên); `same_as` chỉ khi cùng ảnh, cùng crop.
- **15 ảnh mới**, toàn Wikimedia Commons, kiểm giấy phép khi fetch:

  | Bài | Ảnh | Giấy phép, tác giả |
  | --- | --- | --- |
  | 7 | châu chấu (Differential grasshopper) | CC BY 2.0, Melissa McMasters |
  | 7 | nhện giăng tơ nhỏ (Red orb weaver), chụp vừa trên mạng tơ, không cận răng nanh | CC BY 4.0, Mayaluk |
  | 7 | cua nước ngọt (Potamonautidae) | CC BY 2.0, Brian Gratwicke |
  | 7 | cuốn chiếu (CSIRO) | CC BY 3.0 |
  | 7 | kiến vàng trên lá | CC BY 2.0, Rison Thumboor; chữ ký ở góc đã cắt bỏ |
  | 7 | bướm vua trên hoa cúc | CC BY 2.0, John Brighenti |
  | 7 | tổ kiến vàng kết lá (thẻ thưởng) | CC BY 4.0, Dr. Chinchu C. |
  | 8 | bạch tuộc (Octopus cyanea) bò trên cát dưới biển | CC BY 4.0, Pauline Walsh Jacobson; chữ ký đã cắt bỏ |
  | 8 | sao biển còn sống trên đá, Agate Beach | CC0 |
  | 8 | bọt biển ống (Aplysina archeri), thấy rõ lỗ | CC BY 4.0, Jay Brasher; chữ ký đã cắt bỏ |
  | 8 | sứa bờm sư tử ở vịnh Gullmarn | CC0 |
  | 8 | cá ngựa (Hippocampus guttulatus) ngoài tự nhiên | CC BY 2.0, prilfish |
  | 8 | ốc sên trên lá | CC BY 3.0, Lauren |
  | 8 | nhím biển Diadema trên đá, Flower Garden Banks | Public domain, NOAA |
  | 8 | bãi biển vắng (hình câu q3) | CC BY 2.0, Damian Gadal |

- **Dùng lại:**
  - Chép mục gốc Discoverer: `t_rex` (*Khủng long*) cho ô Xương sống và từ `backbone`; `tray_shrimp`, chim sẻ, cò của *Hô hấp*.
  - Ảnh có sẵn trong chủ đề: thỏ, ếch, cá chép, thằn lằn, cá vàng, trâu, cá heo, dơi đang bay.
  - Hình câu hỏi (vườn rào tre, ao, sân nhà vẽ) dùng `same_as`.
- **Cuốn chiếu ở khung vuông** (ô kệ, ô thứ tự) chỉ thấy nửa thân phía đầu, vẫn rõ hàng chân: con vật quá dài so với khung vuông.
- **Kiểm tay:** chưa có giấy phép nào cần kiểm tay (không ảnh Openverse/Flickr mới).

## Duy 14/11 · duyệt Discoverer A2, cho code
- Bộ thiết kế: design/play-ui/options/lesson-less-text/Discoverer-A2.html (41 màn, ngân sách chữ ghi trong trang).
- Duy duyệt cả 6 điểm: (1) chạm là trả lời (trừ multi_choice có nút "Xong", order_sequence tự chấm khi đủ); (2) lựa chọn không nhãn, tên hiện sau khi chấm, trừ khi ảnh không đủ; (3) true_false dùng thẻ gật/lắc + chữ "Đúng"/"Sai"; (4) sai còn lượt: mẩu giấy in một câu `feedback`, `hint` chỉ đọc; (5) "Cả hai" chỉ in EN, VI qua nút loa; (6) true_false và câu Na chỉ một lượt (áp cả Explorer).
- Việc: ios-dev code Discoverer theo A2; content-editor viết `feedback` (SK-044) cho 6 chủ đề Discoverer pilot và rút chữ về ngân sách A2; dev cập nhật `image-slots.json` (thẻ Discoverer ≈ 2,5:1, lưới 2×2 ≈ 0,8:1), chốt nối lựa chọn ↔ cột cho `picture_bar_chart`, và số lượt theo format.

## dev 14/11
Ba việc từ mục "Duy 14/11 · duyệt Discoverer A2". Không cần migration, không đổi RPC. Chưa commit.

### 1. Khung ảnh Discoverer theo A2 (`tools/content-cli/image-slots.json`)
Đo trên `Discoverer-A2.html` (iPhone 390; iPad khi có màn). Explorer giữ nguyên (bảng designer 13/11).

| Khung | Cũ (ước từ code) | Mới | Đo trên A2 |
| --- | --- | --- | --- |
| `choice_2`, `choice_3` | 16:9 | **5:2** | thẻ ngang, ảnh 333×128 (q1) đến 333×158 (w1) |
| `choice_4` (từ 4 lựa chọn) | 16:9 | **4:5** | lưới 2×2, ảnh 159×206; iPad 258×328 |
| `bank_item` (thẻ từ có hình) | 16:9 | **3:5** | ảnh 96×160 trên chữ (q2) |
| `learn_group` | 1:1 (mặc định) | 1:1 (ghi rõ) | trang Học 338×350; iPad 548×618 |
| `tray_item` | 1:1 (mặc định) | 1:1 (ghi rõ) | kệ 3×3, ô 101×91; iPad 120×144 |
| `vocab` | 1:1 (mặc định) | **4:3** | trang Từ mới, ảnh 150×116 |
| `question`, `order_item`, `reward` | 4:3, 1:1, 1:1 | không đổi | true_false 348×237, câu Na 348×196, thẻ xếp 99×142, thẻ thưởng 338×300: đều dưới ngưỡng 2,2 |

- Discoverer bật `hide_question_image_with_picture_choices`: A2 ẩn hình câu hỏi khi mọi lựa chọn đều có hình (chú thích màn q1). Luật ẩn giờ tính cả `fill_blank_bank` khi mọi thẻ từ có hình (màn q2 không có hình câu hỏi). Explorer không dùng `fill_blank_bank` nên không đổi gì.
- Thêm 3:5 và 5:3 vào bảng tỉ lệ quen thuộc trong dòng cảnh báo.

**Số cảnh báo lệch khung** (`max_factor` 2,2, mọi file chọn ảnh, ảnh trong `content/.images`; script tạm trong scratchpad gọi `selectionShapeWarnings`, cùng hàm `images fetch` dùng):

| Chủ đề | Trước | Sau | choice 3 | choice 4 | thẻ từ | món Chơi | từ vựng | hình câu hỏi | sticker |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| be-mat-trai-dat | 7 | **29** | 7 | 2 | 19 | 1 | 0 | 0 | 0 |
| da-va-dat | 13 | **60** | 13 | 2 | 40 | 2 | 2 | 1 | 0 |
| ho-hap | 4 | **18** | 5 | 0 | 13 | 0 | 0 | 0 | 0 |
| khung-long | 11 | **25** | 12 | 6 | 0 | 5 | 1 | 0 | 1 |
| nao-bo-va-giac-quan | 0 | **10** | 0 | 0 | 10 | 0 | 0 | 0 | 0 |
| thoi-tiet-va-thien-tai | 0 | **17** | 0 | 0 | 17 | 0 | 0 | 0 | 0 |
| an-uong-lanh-manh | 0 | 0 | | | | | | | |
| **Tổng Discoverer** | **35** | **159** | 37 | 10 | 99 | 8 | 3 | 1 | 1 |
| Explorer (3 chủ đề) | 0 | 0 | | | | | | | |

- an-uong-lanh-manh chưa có file chọn ảnh nên không có số. Ở ngưỡng 1,5, Discoverer có 811 cảnh báo (trước: 208).
- Phần lớn số tăng là **thẻ từ 3:5** (99). 80 trong số đó là ảnh 4:3, lệch ×2,22, vừa qua ngưỡng 2,2 (lấp khung mất khoảng 55%); còn lại là ảnh 3:2, 5:3. Thẻ 5:2 thêm 22 ảnh: ảnh gần vuông hoặc dọc, khung 16:9 cũ chưa báo.
- **Cần designer quyết** trước khi đặt lại crop: thẻ từ A2 có thật cao 160 không, khi bank có 4 thẻ hay khi chữ dài. Nếu khung ảnh thẻ từ là 2:3 thay vì 3:5, 80 ảnh 4:3 kia hết báo (lệch ×2); nếu là 1:1 thì gần như không còn dòng nào. Sửa một dòng `bank_item` trong `image-slots.json` là xong.
- iPad: câu multi_choice 3 lựa chọn xếp một hàng 3 cột (thẻ dọc) lệch với 5:2. PictureFit sẽ hiện cả ảnh, ảnh nhỏ, giống chỗ còn mở của Explorer iPad.

### 2. `picture_bar_chart`: nối lựa chọn ↔ cột theo vị trí
**Quyết định (dev, đơn giản nhất cho MVP, không đổi hình dạng schema):** `options[i]` là đáp án của `chart.bars[i]`.
- Giữ `options` vì engine chấm đã coi `picture_bar_chart` như `single_choice` theo `options[].key` (vector `item-scoring`, `ContentScoring`). Cột chỉ là phần vẽ.
- Nối bằng key thì không được: luật "key duy nhất trong bài" đã cấm option và bar cùng key.

**content-schema kiểm chéo** (`scripts/lib/refs.mjs` › `checkBarChart`, lỗi `schema` ở đúng dòng markdown):
- `options.length == chart.bars.length`;
- `options[i].label.en/.vi` trùng `chart.bars[i].label.en/.vi`, để bắt lỗi viết `#### option` khác thứ tự `#### bar`;
- lựa chọn không có `image` (hình đặt ở `chart.bars[i].image`);
- ít nhất một cột `value > 0`.

`content-cli` (age-rules): luật hình `choice_option` không còn tính `picture_bar_chart`, nên Discoverer không báo thiếu hình lựa chọn ở dạng này.

**JSON cho ios-dev** (trong gói, sau build; `brief` đã bỏ):
```json
{
  "id": "…", "key": "q4", "format": "picture_bar_chart", "version": 2, "dok": 2,
  "prompt": { "en": "Which bar is sand?", "vi": "Cột nào là đất cát?", "audio": { "en": "…", "vi": "…" } },
  "image": { "alt": { "en": "A handful of sand", "vi": "Một nắm đất cát" }, "asset": "…" },
  "hint": { … }, "explanation_correct": { … }, "explanation_wrong": { … },
  "chart": {
    "title": { … },
    "unit": { … },
    "bars": [
      { "key": "q4_bar_clay",   "label": { "en": "clay soil",   "vi": "đất sét",  "audio": { … } }, "value": 5 },
      { "key": "q4_bar_garden", "label": { "en": "garden soil", "vi": "đất vườn", "audio": { … } }, "value": 8 },
      { "key": "q4_bar_sand",   "label": { "en": "sand",        "vi": "đất cát",  "audio": { … } }, "value": 3, "image": { "alt": { … }, "asset": "…" } }
    ]
  },
  "options": [
    { "key": "q4_clay",   "label": { "en": "clay soil",   "vi": "đất sét"  }, "correct": false, "feedback": { … } },
    { "key": "q4_garden", "label": { "en": "garden soil", "vi": "đất vườn" }, "correct": false },
    { "key": "q4_sand",   "label": { "en": "sand",        "vi": "đất cát"  }, "correct": true }
  ]
}
```
- `title`, `unit`, `image` của câu và của cột, `feedback` đều tuỳ chọn. Số trong ví dụ chỉ để minh hoạ.
- **Cách vẽ:**
  - Vẽ `bars` theo thứ tự mảng, từ trái sang phải. Cao cột ∝ `value / max(value)`.
  - Mỗi cột là một nút. Chạm cột i = chọn `options[i]`: lưu `selected: options[i].key` và chấm như `single_choice`.
  - Tên hiện sau khi chấm (`.ntag`) là `bars[i].label`, bằng `options[i].label`.
  - Sai còn lượt: mẩu giấy in `options[i].feedback`.
  - `bars[i].image` (nếu có) vẽ dưới chân cột.
  - Hình câu hỏi là ô 64 cạnh câu hỏi (màn `chart-ask`). Lựa chọn không có hình nên app không ẩn hình câu hỏi.
- Số cột: schema 2–6. Luật Discoverer `option_count.picture_bar_chart` [3, 4] nay cũng là số cột.
- `FORMAT_FIRST_APP_VERSION.picture_bar_chart` vẫn `null`. Khi ios-dev có renderer, dev sửa bảng này (`src/validate/format-renderers.ts`) cùng bản app.

**Đề xuất cho content-editor** (`content/TEMPLATE.md` dòng ~461, vùng của content-editor nên dev không sửa): ví dụ `picture_bar_chart` ghi rõ "`#### option` thứ i là đáp án của `#### bar` thứ i: cùng số, cùng thứ tự, cùng `label.en`/`label.vi`; hình viết ở `#### bar`, `#### option` không có `image.*`". Hiện chưa bài nào dùng format này nên validate vẫn 0 lỗi.

### 3. Số lượt theo format: `max_tries_by_format`
- **Khoá:** `rules.<nhóm>.max_tries_by_format`, kiểu `{ "<format>": số ≥ 1 }`, tuỳ chọn.
  - Số lượt của một câu = `max_tries_by_format[format]` nếu có, không thì `max_tries`. Áp cả Khởi động lẫn Quiz.
  - Câu Na luôn là `true_false` (`speaker` chỉ có ở TrueFalse), nên khoá theo format đã gồm câu Na.
- **`content/rules.json`:** `"max_tries_by_format": { "true_false": 1 }` ở cả ba nhóm.
  - Duy duyệt cho Explorer và Discoverer. Scientist dev thêm luôn vì cùng lý do (hai phía, lời sai gần như nói đáp án), và app iOS đã mặc định `true_false: 1` khi thiếu khoá; để Scientist trống thì app và luật lệch nhau. Duy muốn Scientist 2 lượt thì xoá dòng đó và ios-dev bỏ mặc định.
- **Đã làm:**
  - `schema/rules.schema.json`: khoá format phải có thật, giá trị ≥ 1, không rỗng.
  - `test/rules.test.ts`: khoá này nằm ngoài `default_rules` của vector, kiểm giá trị riêng.
  - README content-cli.
  - `build` chép nguyên `rules.json` vào `manifest.rules`, nên gói build lại là có khoá.
- **ios-dev:** đọc `max_tries_by_format` của nhóm. `LessonRules.swift` (bản chưa commit) đã đọc đúng tên và kiểu này, và có `scoring(forFormat:)`.
  - Gói mới có khoá ở mọi nhóm, nên `defaultMaxTriesByFormat` chỉ còn dùng cho gói cũ.
  - App cũ (0.1.0) bỏ qua khoá và vẫn cho 2 lượt: đúng thứ tự phát hành.
- **Server:** không cần migration, không đổi RPC.
  - Server không chấm số lượt. `submit_attempts` giữ `points`/`correct` của app; `quiz_answers.tries` chỉ kiểm 1–10.
  - `rules_for` chỉ dùng cho sao và chuỗi ngày. Hàng `app_config.rules.*` trên staging chưa có khoá; `publish` (chưa có) sẽ chép, và không hàm nào đọc khoá này.
- **Đề xuất cho tester** (vector là vùng của tester, dev không sửa):
  1. `test-vectors/vector.schema.json`: thêm vào `Rules.properties` và `RulesOverride.properties`:
     `"max_tries_by_format": { "type": "object", "minProperties": 1, "propertyNames": { "enum": ["single_choice","multi_choice","true_false","fill_blank_bank","order_sequence","picture_bar_chart"] }, "additionalProperties": { "$ref": "#/$defs/RuleMaxTries" } }`.
     Không thêm vào `default_rules` (khoá tuỳ chọn). Nếu tester muốn `default_rules` giống `rules.json` thì thêm `{ "true_false": 1 }` vào cả 7 file, rồi bỏ `max_tries_by_format` khỏi ngoại lệ trong `content-cli/test/rules.test.ts` (báo dev).
  2. `tools/reference-engine.mjs` › `scoreItem`: `const maxTries = rules.max_tries_by_format?.[item.format] ?? rules.max_tries; if (tries.length > maxTries) return { error: 'too_many_tries' };`.
  3. Case mới cho `item-scoring.json`, mỗi case có `"rules": { "max_tries_by_format": { "true_false": 1 } }`, `"decision": "SK-043/6"`:
     - 034 · true_false `answer: false`, tries `[{value: true}]` → `{ points: 0, try_results: [false], final_correct: false, tries_used: 1 }`.
     - 035 · true_false `answer: false`, tries `[{value: true}, {value: false}]` → `{ error: "too_many_tries" }`.
     - 036 · true_false `answer: true`, tries `[{value: true}]` → `{ points: 1, try_results: [true], final_correct: true, tries_used: 1 }`.
     - 037 · single_choice (fish đúng), tries `[{selected: "rice"}, {selected: "fish"}]` → `{ points: 0, try_results: [false, true], final_correct: true, tries_used: 2 }`: format không có trong bảng thì theo `max_tries` 2.
     - 038 · `"rules": { "max_tries": 1, "max_tries_by_format": { "single_choice": 3 } }`, single_choice tries rice, banana, fish → `{ points: 0, try_results: [false, false, true], final_correct: true, tries_used: 3 }`: bảng theo format thắng `max_tries`, kể cả khi lớn hơn.
  4. Engine Swift (ios-dev) chạy cùng vector: `scoreItem` cần nhận `rules.scoring(forFormat:)`, không phải `rules.scoring`.

### File đã đổi
- `tools/content-cli/image-slots.json`, `src/images/aspect.ts`, `src/validate/age-rules.ts`, `schema/rules.schema.json`, `README.md`
- `tools/content-cli/test/aspect.test.ts`, `test/build.test.ts` (khung 16:9 → 5:2 trong một kỳ vọng), `test/markdown.test.ts` (fixture biểu đồ đủ 3 cột, bỏ hình lựa chọn; thêm ca sai thứ tự), `test/rules.test.ts`
- `packages/content-schema/scripts/lib/refs.mjs`, `src/quiz-item.ts` (chú thích), `README.md`, `test/refs.test.mjs`
- `content/rules.json`

### Kiểm
- `packages/content-schema`: `npm test` 160/160 qua.
- `tools/content-cli`:
  - `npm test` lần 1: 387 qua, 1 hỏng. `build.test.ts` còn kỳ vọng khung 16:9 cũ; đã sửa kỳ vọng.
  - Lần 2: 388/388 qua. `npm run typecheck` qua.
- `validate -- content`: 69 file, **0 lỗi**, 143 cảnh báo.

### Tester kiểm
- Một bài Discoverer có câu `fill_blank_bank` ảnh ngang: `build` báo "thẻ từ có hình … khung 3:5 dọc".
- Câu Discoverer mà mọi lựa chọn có hình: không còn dòng "hình câu hỏi".
- Viết một câu `picture_bar_chart` với `#### option` khác thứ tự `#### bar`: `validate` báo `[schema]` ở dòng `label.en`/`label.vi` của lựa chọn.
  - Thêm `image.*` dưới `#### option`: báo ở dòng hình đó.
  - Bớt một `#### option`: báo ở `/options`.
- Trong bản sao `content/rules.json`, đặt `max_tries_by_format: { "true_flase": 1 }`: `build` dừng, lỗi chỉ `/explorer/max_tries_by_format`.
- Gói build lại: `manifest.rules.<nhóm>.max_tries_by_format` có ở cả ba nhóm.

## ios-dev 14/11 · Discoverer A2

Đã code bài Discoverer theo `Discoverer-A2.html` và 6 điểm Duy duyệt. Explorer A giữ nguyên, trừ hai thay đổi chung (true_false một lượt; hết lượt thì đọc feedback trước). Chưa commit.

**Đã làm**
- **Điều hướng** (`LessonPlayerView`): Discoverer dùng màn sách tranh (Học, Chơi chung với Explorer), cỡ 56 / bo 12 / có XP, và hai màn mới `DiscovererQuestionStep`, `RewardStep` A2. Màn Discoverer cũ (`QuestionStep`, `LearnStep`) không còn được gọi; để lại vì còn test cũ dùng, dọn sau.
- **Header không chữ:** nút lùi/thoát và ô bước/ô câu (ô xong lá tre có dấu tích). Discoverer bỏ công tắc "VI".
- **"Cả hai":** chỉ in chữ tiếng Anh (`mode.sentence`, kể cả nhãn nhóm, chip, tên thẻ); tiếng Việt qua nút "VI" cạnh loa.
- **Khởi động và Quiz** (`Views/DiscovererQuestionStep.swift`, mới):
  - Câu hỏi một dòng chữ, loa tự đọc khi mở; `instruction` chỉ đọc, không in. Khởi động có nhãn "Nhớ lại".
  - Chạm là trả lời: single_choice, true_false, câu Na, fill_blank_bank. App đọc tên thẻ rồi chấm, nhịp 0,9 s như Explorer.
  - Thẻ ảnh không nhãn; sau khi chấm, tên đáp án dán lên thẻ. Lựa chọn không có ảnh thì in tên.
  - iPhone: tối đa 3 thẻ một cột; 4 thẻ trở lên hoặc multi_choice dùng lưới 2×2. iPad: 3 thẻ một hàng (cao 200), lưới 2×2 cao 330.
  - multi_choice: ô vuông ở góc thẻ, nút "Xong" chỉ có mũi tên (VoiceOver đọc "Xong, kiểm tra"). Sai còn lượt: chỉ thẻ sai bong góc, thẻ đúng giữ dấu chọn.
  - true_false: thẻ gật/lắc kèm một chữ (nhãn `labels` của nội dung, không có thì "Đúng"/"Sai" theo ngôn ngữ câu). Câu Na: ảnh, mặt Na, bong bóng, loa.
  - fill_blank_bank: câu có ô trống trên giấy; thẻ từ gồm ảnh và chữ to. Một ô trống thì chạm là chấm; nhiều ô thì điền đủ rồi chấm.
  - order_sequence: dùng `ExplorerOrderSequence`; Discoverer nay có trình hiển thị cho dạng này.
  - Sai còn lượt: thẻ lõm, góc bong có mũi tên vòng. Mẩu giấy gấp góc (mascot) in `feedback`, không có thì in `hint`; loa đọc feedback rồi hint.
  - Đúng hoặc hết lượt: tấm giấy có triện ĐÚNG (hết lượt thì mascot), câu giải thích, loa, "+10" khi có XP, nút mũi tên.
- **Học:** trang lật như Explorer, câu nằm dưới ảnh trên giấy riêng kèm loa; ví dụ chỉ đọc (schema v1 chưa có ảnh cho ví dụ). Trang "Từ mới": từ EN chữ to, nghĩa VI ở dưới (chế độ English chỉ in EN), ảnh, loa.
- **Chơi:** kệ ảnh không chữ, khay ảnh tròn, món `limit` mờ có góc gấp, chip nhóm cao 56, mũi tên chỉ hiện khi khay đạt. Bong bóng lúc mở in `prompt` của khay; giọng đọc prompt rồi `messages.start`.
- **Thưởng:** "Giỏi lắm!", sao, hai ô số (biểu tượng + số; nhãn chỉ cho VoiceOver), thẻ mới (ảnh, tên, một câu fact, loa), nút bộ thẻ (hình) và mũi tên.
- **Luật lượt:** `LessonRules` đọc `max_tries_by_format` (dev đã thêm vào `content/rules.json`, `true_false: 1`); thiếu khoá thì app mặc định `true_false: 1`. Áp cho cả Explorer.
- **Hết lượt** (SK-044, main session 14/11): đọc và in `feedback` của lựa chọn vừa chạm rồi `explanation_wrong` (`LessonSession.resultLines`), ở Explorer lẫn Discoverer.
- **Chuỗi mới** (EN + VI): `lesson.warmup.tag`, `lesson.multi.done`, `lesson.learn.words_tag`, `lesson.reward.praise`, `lesson.reward.score_a11y`, `lesson.reward.new_card`.

**Chưa làm**
- `picture_bar_chart`: chưa vẽ, chờ dev chốt cách nối lựa chọn với cột; câu dạng này vẫn bị bỏ qua.
- Ô "ngày liền" ở Thưởng: màn bài chưa biết chuỗi ngày.
- Ngoại lệ "ảnh không đủ thì dán nhãn từ đầu" (`q1-ask`): nội dung chưa có cờ đánh dấu, nên chỉ in tên khi lựa chọn không có ảnh.

**Kết quả chạy (iPhone 16 Pro)**
- `build-for-testing`: thành công.
- Toàn bộ unit test (bỏ UI test): 3 test fail, đều không liên quan: `JourneyMapAppTests.mapItemsOfEachGroup`, `SyllabusTests.oakYearOfEachTopic`, `JourneySegmentTests.stagesOfTheSyllabus`. Ba test này đọc thứ tự chủ đề Explorer trong `content/syllabus.json` đã đổi, cần cập nhật theo syllabus mới.
- Sau lần sửa cuối, chạy riêng `LessonPlayerTests`: 75/75 pass. Có test mới: `trueFalseHasOneTry` (Explorer + Discoverer); test feedback được mở rộng cho ca hết lượt.
- UI test chưa chạy và chắc chắn hỏng vì luồng đổi (không còn "Kiểm tra", "Thử lại", "lesson.learn.next"…); tester cần viết lại.

**Ảnh** (gói nhúng có ảnh và giọng thật, bài *Nhìn kỹ các loại đá*, chế độ "Cả hai"), trong scratchpad `shots/D-app-*.png`: `w1-ask`, `w1-retry`, `w1-right`, `w2-ask`, `w2-out` (true_false một lượt), `learn-1`, `learn-2-bilingual`, `play-trap`, `play-done`, `q1-ask`, `q1-retry`, `q1-right`, `q2-fill-ask`, `q2-fill-retry`, `q2-fill-right`, `q3-multi-select`, `q3-multi-retry`, `q3-multi-right`, `q4-right-xp`, `q6-na-ask`, `q6-na-right`, `reward`, `ipad-w1` (iPad Pro 11 M4).
- Các ảnh iPhone chụp trước ba sửa cuối: nhãn tên trên thẻ đổi sang mẩu giấy, chip nhóm in EN ở "Cả hai", feedback trước `explanation_wrong`.
- Chưa chụp trang "Từ mới" và order_sequence (bài 02 không có). Chưa kiểm iPhone 16e, iPad ngang, Split View.

**Việc còn mở (cho designer/PM)**
- Trên iPhone, câu hỏi kèm loa và nút "VI" xếp dọc cao khoảng 120 pt. Với 3 thẻ, tấm kết quả che thẻ cuối, bé phải cuộn mới thấy tên đáp án. Hướng xử lý: thẻ thấp hơn, hoặc đặt nút "VI" ngang hàng với loa.
- Ảnh vuông hoặc dọc trong thẻ ngang vẫn hiện nguyên ảnh, không cắt (giới hạn cắt 2,2 đặt ngày 13/11), nên thẻ có viền trống. Phụ thuộc bảng tỉ lệ `image-slots.json` của dev.

**Tester cần kiểm**
1. Bài Discoverer có `feedback`: sai còn lượt → mẩu giấy in feedback, loa đọc feedback rồi hint.
2. true_false chọn nhầm → hết lượt ngay; nghe và thấy `feedback_true` hoặc `feedback_false` rồi `explanation_wrong`.
3. multi_choice: "Xong" mờ khi chưa chọn; sai thì chỉ thẻ sai bong góc.
4. "Cả hai" không in câu tiếng Việt; nút "VI" phát bản VI.
5. Explorer *Gọi tên và nhóm động vật* vẫn chơi như cũ, true_false một lượt.
6. Viết lại UI test cho luồng A2.

### ios-dev 14/11 · lượt 2

Chưa commit.

**Đã làm**
- **3 test syllabus:** sửa cho khớp thứ tự Explorer mới (Duy 14/11: chủ đề #2 và #3 là Year 2, xếp lên đầu): `SyllabusTests.oakYearOfEachTopic`, `JourneySegmentTests.stagesOfTheSyllabus`, `JourneyMapAppTests.mapItemsOfEachGroup`. Hệ quả: hành trình Explorer giờ có 4 chặng xen kẽ năm (1, 2, 1, 2). PM xem có muốn như vậy không.
- **`picture_bar_chart` (Discoverer):**
  - Cột giấy chàm, cao theo `value / max`, xếp theo thứ tự `bars`. Chạm cột i là chọn `options[i]` và chấm như `single_choice`.
  - Sau khi chấm, tên `bars[i].label` hiện dưới cột đúng. Cột chọn sai lõm, có góc bong. Hết lượt thì nền vàng hoè nhạt nằm sau cột đáp án.
  - Ảnh câu hỏi nhỏ (cao 120) hiện phía trên. VoiceOver đọc từng cột: tên, giá trị, đơn vị.
- **Tấm kết quả không còn che thẻ cuối:** sau mỗi lần thử, màn tự cuộn. Sai còn lượt thì cuộn tới mẩu giấy; xong thì cuộn tới đáy hàng thẻ, nên thẻ có tên đáp án luôn nằm trên tấm kết quả. Dòng câu hỏi giữ nguyên.
- **Hai lỗi layout thấy khi chụp:**
  - Thẻ xếp thứ tự tràn ô khi ảnh là hình giữ chỗ: ảnh giờ không rộng hơn ô.
  - Trang "Từ mới": "MAGNIFYING GLASS" bị ngắt giữa chữ. Đã đổi sang ảnh 4:3 và chữ `titleS`, tối đa 2 dòng, tự thu nhỏ. Bản sửa này chưa chụp lại.

**Kết quả chạy (iPhone 16 Pro, một lần)**
- `LessonPlayerTests`: 75 pass.
- `ScienceKidsTests`: 89 pass.
- `SyllabusTests`: 6 pass. `JourneySegmentTests`: 4 pass.

**Ảnh** (scratchpad `shots/D-app2-*.png`)
- Chụp bằng một bản sao bài 02 trong scratchpad, mở qua `-SKContentFolder`, nên chỉ có hình giữ chỗ. Bản sao này có thêm `feedback`, q4 đổi thành biểu đồ, q5 đổi thành xếp thứ tự, và tắt Chơi.
- Danh sách: `w1-right-name-label`, `w2-feedback-then-explanation`, `q1-right-last-card-visible`, `chart-ask`, `chart-retry`, `chart-right`, `order-ask`, `order-place`, `order-retry` (đã sửa tràn ô), `order-right`, `learn-words-before-wrap-fix` (chụp trước khi sửa ngắt chữ).

### dev 14/11 · bảng format → bản app (sau ios-dev lượt 2)
- `tools/content-cli/src/validate/format-renderers.ts`: ở cột Discoverer (Scientist dùng chung), `order_sequence` và `picture_bar_chart` đổi từ `null` sang `0.1.0`, vì chưa có bản nào phát hành. Cột Explorer không đổi. Đã sửa README content-cli.
- **Test:**
  - `test/age-rules.test.ts`, `test/build.test.ts`: ca `format_not_rendered` giờ dùng `--min-app-version 0.0.9`.
  - Nhánh "chưa bản app nào" (null) kiểm bằng cột Explorer, với luật cho phép `multi_choice` và `fill_blank_bank`.
- **Kết quả:**
  - `npm test` content-cli: lần 1 hỏng 3 ca (cách kiểm cũ), đã sửa; lần 2 qua 388/388. Typecheck qua.
  - `validate -- content`: 0 lỗi, 140 cảnh báo (trước 143), không còn `format_not_rendered` (da-va-dat/08, 14).

## designer 14/11 · khung thẻ từ chốt 1:1, cắt lại ảnh 6 chủ đề Discoverer

### Khung thẻ từ (`bank_item`): **1:1**, không phải 3:5
- A2 vẽ thẻ từ cao 210 (ảnh 104×172, gần 3:5). ios-dev code thẻ thấp hơn: `DiscovererMetrics.bankPicture` cao 96, rộng bằng cột. Trên iPhone 390, 3 thẻ một hàng thì ảnh khoảng 86×96 (≈ 0,9:1); 2 thẻ thì khoảng 142×96 (≈ 1,5:1); iPad 4 cột cũng gần vuông. Bản code là bản chạy, nên designer chốt theo code.
- Lý do giữ thẻ thấp: màn câu hỏi Discoverer đã chật (ios-dev ghi: câu, loa và nút VI cao khoảng 120 pt, tấm kết quả che thẻ cuối). Thẻ 3:5 cao 160 sẽ đẩy bàn phím từ xuống thêm khoảng 64 pt. Ảnh Discoverer phần lớn là 4:3: vào khung 3:5 thì mất 55% ảnh, vào khung 1:1 chỉ mất 25%.
- **Cho dev:** sửa một dòng trong `tools/content-cli/image-slots.json`, `age_groups.discoverer.ratios.bank_item`, từ `"3:5"` thành `"1:1"`. Sửa luôn câu "Thẻ từ có hình … ≈ 3:5" trong `note` của discoverer: ảnh khoảng 86×96 khi 3 thẻ, 142×96 khi 2 thẻ, tức ≈ 1:1. Đổi xong thì 98 cảnh báo thẻ từ còn lại hết (đã kiểm bằng bảng tạm, xem dưới).
- **Cho ios-dev (tuỳ chọn):** chú thích `bankPicture` đang ghi "picture `4 : 3`". Muốn khung ổn định ở mọi số thẻ thì cho ô ảnh vuông (`aspectRatio(1, contentMode: .fill)`, rộng bằng cột), không cố định cao 96. Không bắt buộc, vì lệch hiện tại ≤ ×1,5.

### Cắt lại ảnh (file chọn ảnh `content/images/discoverer/<chủ đề>/*.json`)
Nếu `bank_item` đổi sang 1:1, còn 61 cảnh báo không phải thẻ từ, rơi vào 48 ảnh nguồn. Cách xử lý:
- **`crop` mới** cho ảnh không dùng ở chỗ khác. Khung đặt vào vật chính, không cắt giữa máy móc.
- **Mục ảnh riêng, cùng `file_url`, có `crop` riêng** cho ảnh dùng chung mà các chỗ dùng cần khung khác nhau. Đây là quy ước sẵn có: "chỗ dùng lại có cắt riêng ghi thành mục ảnh riêng". Các chỗ dùng khác giữ nguyên crop cũ.
- **Hình ghép một phần** (`composed`, `content/images/composed/<chủ đề>/<bài>.<khoá>.jpg`) cho vật đứng riêng mà cắt thì mất hình dạng: tranh khủng long trên nền trắng, cá, răng, lá ép, hòn đá vũ trụ, quả bóng. Ảnh gốc được đặt giữa khung đúng tỉ lệ, phần đệm cùng màu nền ảnh. Quả bóng thì phần đệm kéo dài nền tối của chính ảnh. Không vẽ thêm vật, không đổi vật chính. Quả bóng (CC0) xoá chữ in trên bóng và chữ trên khung xe phía sau, theo brief "không chữ". Hai tranh CC0 xoá ký hiệu tác giả ở góc.
- Mọi mục đổi có `note` "A2 14/11 (designer, SK-043): …" ghi crop cũ hoặc mục cũ.

| Chủ đề | Crop mới | Mục ảnh riêng (cắt riêng) | Hình ghép | Trỏ lại `same_as` |
| --- | --- | --- | --- | --- |
| be-mat-trai-dat | 7 | 1 | 1 | 0 |
| da-va-dat | 4 | 8 | 2 | 3 |
| ho-hap | 4 | 1 | 0 | 2 |
| khung-long | 9 | 6 | 7 | 5 |
| nao-bo-va-giac-quan, thoi-tiet-va-thien-tai | 0 | 0 | 0 | 0 |

nao-bo-va-giac-quan (10) và thoi-tiet-va-thien-tai (17) chỉ có cảnh báo thẻ từ, nên hết khi `bank_item` thành 1:1.

### Kết quả kiểm
- **Commons trả 429 bốn lần lúc tải ảnh gốc để xem khung.** Mức chặn là quá 3 lần, nên designer **dừng gọi mạng**.
- `images fetch` đã chạy từng chủ đề, lần lượt, qua một wrapper chặn mọi lời gọi mạng. Kết quả:
  - Hình tự vẽ và hình ghép mới đã vào cache: 3 hình tự vẽ, 10 hình ghép.
  - 0 lỗi nào khác.
  - Còn **42 ảnh tải về (60 chỗ dùng)** có `crop` mới, chưa tải được vì không gọi mạng: be-mat-trai-dat 9, da-va-dat 15, ho-hap 5, khung-long 13.
- **Cảnh báo tỉ lệ, cùng hàm `selectionShapeWarnings` mà `images fetch` dùng:**
  - Ảnh đã có trong cache, bảng hiện tại (`bank_item` 3:5): **98**, đều là thẻ từ.
  - Ảnh đã có trong cache, `bank_item` 1:1: **0**.
  - Thêm cả 60 chỗ chờ tải, kích thước dự đoán từ cỡ ảnh nguồn nhân `crop` (cách `process.ts` cắt), `bank_item` 1:1: **0**.
- **Việc còn lại (phiên chính hoặc dev, khi Commons hết chặn):** sửa dòng `bank_item`, rồi chạy `images fetch` cho từng chủ đề. Giãn nhịp như cũ, mỗi lúc một tiến trình. Kỳ vọng: 0 lỗi, 0 cảnh báo tỉ lệ.
- **Cần nhìn lại sau khi tải**, vì khung đặt mà chưa thấy vùng mới của ảnh gốc:
  - `khung-long/vi-sao-khung-long-bien-mat` `q3.q3_croc`: khung mở lên trên vùng crop cũ.
  - `khung-long/trai-dat-rat-lau-ve-truoc` `w1.w1_buffalo`: tính từ ảnh đã cắt, nên chắc đúng.
  - `khung-long/khung-long-la-gi` `w1.w1_mammoths`: chỉ thấy một con, ảnh nhỏ (rộng 449 px).
- **Nên thay ảnh khi có mạng**, đã đạt khung nhưng còn yếu:
  - `tray_flat_teeth`: ảnh hàm răng phẳng nhỏ (346 px), là ô của một hình khoa học.
  - `q3_croc`: cá sấu lẫn vào nền, ảnh nhỏ sau khi cắt.
  - `w1_ball`: bóng đỏ một màu, brief muốn bóng nhiều màu, không chữ. Chữ đã xoá trong hình ghép.
- Main session 14/11: đặt `discoverer.ratios.bank_item` = "1:1" trong tools/content-cli/image-slots.json theo chốt của designer (thẻ từ vuông theo code ios-dev).

## dev + designer 16/11 · thẻ từ Explorer 2:1, cắt lại ảnh chủ đề #1–#3

Việc kéo theo từ SK-048 (mục "designer 16/11 · ảnh bài 2–8" và "phiên chính 16/11"). Bảng Explorer 13/11 chỉ ghi `choice_3`, `choice_2`. Thẻ từ (`vocab`) rơi về `default` 1:1, nên `fetch` và `build` không kiểm được ảnh vuông mà app cắt giữa. Không sửa `.md`.

### Luật (dev)
- `tools/content-cli/image-slots.json`: `age_groups.explorer.ratios.vocab` = `"2:1"`. `note` của explorer ghi số đo ô ảnh thẻ từ, đo từ code `wordsPage` của `ExplorerLearnStep`: lưới 2 cột, ảnh lấp ngang ô, cao 76 (`sheetArt`), iPad cao × 1,5.

  | Máy | Ô ảnh | Tỉ lệ |
  | --- | --- | --- |
  | iPhone 16 | 152×76 | 2:1 (khớp ảnh chụp máy) |
  | Máy rộng 375 | ~143×76 | 1,9:1 |
  | Pro Max | ~176×76 | 2,3:1 |
  | iPad | ~247×114 | 2,2:1 |

- **Lưu ý trong `note`:** ảnh vuông trong khung 2:1 lệch ×2, vẫn dưới `max_factor` 2,2, nên `fetch`/`build` không cảnh báo. Thẻ từ ảnh vuông phải kiểm tay.
- `tools/content-cli/test/aspect.test.ts`: test "image-slots.json thật" kiểm thêm explorer `vocab` = 2. `npm test` **399/399**.

### Kiểm thẻ từ (designer)
Cách kiểm:
- Script ở scratchpad dựng lại cách app hiện **mọi** thẻ từ: lấy ảnh đã xử lý trong cache, lấp khung 2:1, cắt giữa, làm tối phần bị cắt. Đã xem từng thẻ.
- Chạy thêm `selectionShapeWarnings` (hàm `images fetch` dùng) với `max_factor` 1,05.

| Chủ đề | Thẻ từ | Đã đúng 2:1 | Lệch dưới ngưỡng, giữ | Sửa |
| --- | --- | --- | --- | --- |
| goi-ten-va-nhom-dong-vat | 37 | 37 (crop có từ trước, đủ phần chính) | 0 | 0 |
| sinh-vat-song-o-dau | 29 | 20 | 6 | 3 |
| chuoi-thuc-an | 16 | 11 | 4 | 1 |

**Lệch dưới ngưỡng, giữ (cắt giữa vẫn đủ ý):**
- sinh-vat-song-o-dau: `air` ×1,5, `dead` ×1,5, `never_alive` ×1,5, `habitat` ×1,5, `shade` ×1,2, `garden` ×1,14.
- chuoi-thuc-an:
  - `field` ×1,5;
  - ba hình ghép: `food_chain` ×2, `arrow` ×1,5, `role` ×2. Cả chuỗi vòng tròn và mũi tên nằm trọn trong dải giữa.

**Sửa: bốn thẻ, mỗi thẻ có `crop` 2:1 riêng.** Mỗi mục có `note`. Đã quét `same_as`: không chỗ dùng nào khác trỏ tới bốn mục này, nên các chỗ dùng khác không đổi.

| Bài · thẻ | Trước | Sau |
| --- | --- | --- |
| `sinh-vat-song-o-dau/vat-song-hay-khong-song` `vocab.non_living` | Ảnh dọc 888×1024, lệch ×2,31, quá 2,2, nên app không cắt mà hiện ảnh nhỏ giữa giấy | Crop `{0.071, 0.187, 0.532, 0.4}`, ảnh 681×340: cả quả bóng, to giữa khung, xe đạp phía sau |
| `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song` `vocab.plastic` | Ảnh dọc 768×1024, ×2,67, hiện ảnh nhỏ | Crop `{0, 0.08, 1, 0.375}`, 1024×512: nắp, vai chai và mực nước, như crop 5:2 `q4_bottle` của Discoverer |
| `sinh-vat-song-o-dau/noi-song-cua-con-vat` `vocab.forest` | Ảnh dọc 877×1024, ×2,34, hiện ảnh nhỏ | Crop `{0, 0.286, 1, 0.428}`, 1000×500: tán rừng xanh có vài cây hoa tím |
| `chuoi-thuc-an/con-vat-kiem-an-the-nao` `vocab.feed` | `same_as` crop Học `explore_fed`, ảnh 576×605, ×2,1. Cắt giữa chỉ còn đầu ngón tay | Mục riêng, cùng ảnh, crop `{0.515, 0.245, 0.485, 0.3233}`, 621×310: hai bàn tay đưa thức ăn và đầu hai con gà mái. Mép trái dừng ở x 0,515 nên không thấy mặt người. `explore_fed` giữ nguyên |

(Crop ghi theo thứ tự left, top, width, height.)

### Lệnh và kết quả
- **`images fetch`** từng thư mục, lần lượt, bảng mới:

  | Chủ đề | File | Ảnh | Tải mới | Lỗi | Cảnh báo tỉ lệ |
  | --- | --- | --- | --- | --- | --- |
  | sinh-vat-song-o-dau | 7 | 160 | 3 | 0 | 0 |
  | chuoi-thuc-an | 4 | 72 | 1 | 0 | 0 |
  | goi-ten-va-nhom-dong-vat | 8 | 192 | 0 | 0 | 0 |

- **Nhịp gọi Commons:** preload giãn mọi lời gọi `*.wikimedia.org` ≥ 5 s trong một tiến trình. Có 8 lượt gọi, cộng 2 lượt tải ảnh gốc để xem khung (cách nhau 5 s); 0 lần 429. **Sót một chỗ:** preload không giữ nhịp qua tiến trình, nên lượt đầu của tiến trình 2 chỉ cách lượt cuối của tiến trình 1 khoảng 1 s. Lần sau nghỉ ≥ 5 s giữa hai tiến trình.
- **`max_factor` 1,05:** thẻ từ còn lệch ở sinh-vat-song-o-dau 6, chuoi-thuc-an 4, đúng các thẻ "giữ" ở trên; goi-ten-va-nhom-dong-vat 0. noi-song-tren-trai-dat còn 25 thẻ vuông; SK-048 đã kiểm, không thuộc việc này.
- **Trước build:** `import` lại `content/explorer` và `content/discoverer` ra scratchpad, đối chiếu với `content/.build/tts` (bỏ `audio`): 78 file, 0 khác. Đầu ra `tts` là bản hiện tại.
- **`build` 11 chủ đề** (4 Explorer + 7 Discoverer) từ `content/.build/tts` vào `content/.build/pack`:
  - exit 0; `content_version` `78e094863536`.
  - Hai chủ đề đổi version: sinh-vat-song-o-dau `66db53d2c142` → `11dadf18899c`, chuoi-thuc-an `ecf52a33df0d` → `4d50dfe6e841`. 9 chủ đề còn lại giữ version.
  - 1329 ảnh (thêm 4). **0 cảnh báo lệch khung.** Cảnh báo còn lại có từ trước: 2 `age_words_en` Discoverer, `image_missing` ở an-uong-lanh-manh.
  - Bốn thẻ từ trong gói trỏ đúng asset mới.
- **`check-pack.sh content/.build/pack`: OK**, exit 0. 14953 asset; 1329 ảnh kiểm JPEG, metadata, kích thước, credit, giấy phép: lỗi 0.
- **Simulator (17/11):** iPhone 16, Debug, gói `78e094863536` nhúng (14965 file), mở bằng `-SKOpenLesson`. Trang "Từ mới" bài vat-song-hay-khong-song: thẻ `non_living` hiện cả quả bóng, to, lấp khung 2:1. Ba thẻ còn lại chỉ xem bằng ảnh dựng lại.

### Ba khung của một ảnh thẻ từ (thấy khi xem simulator 17/11)
Một ảnh thẻ từ Explorer hiện ở ba chỗ, mỗi chỗ một khung:

| Chỗ | Thẻ nào | Khung (iPhone 16) |
| --- | --- | --- |
| Học, trang "Từ mới" (`wordsPage`) | Chỉ từ trong `word_list` | 152×76, 2:1 |
| Tổng kết, hàng từ mới (`explorerWordRow`) | Chỉ từ trong `word_list` | 140×92, ~1,5:1 |
| Tab Từ vựng (`WordsTab`, `.square`) | Mọi `vocab` của bài đã xong | 136×136, 1:1 |

- `plastic` và `feed` không nằm trong `word_list` của bài, nên không lên trang "Từ mới" lẫn Tổng kết; chỉ hiện vuông ở tab Từ vựng.
- Đã dựng lại bốn ảnh mới ở cả ba khung:
  - `non_living`, `forest`, `plastic`: đủ ý ở cả ba khung.
  - `feed`: khung vuông chỉ còn một con gà ăn trên một bàn tay; vẫn hiểu là "cho ăn".
- Luật `vocab` 2:1 vì thế chỉ đúng cho từ trong `word_list`. Từ ngoài `word_list` đáng kiểm theo 1:1.

### Còn mở
- **`max_factor` 2,2 dùng chung cho mọi khung:** ảnh vuông trong thẻ từ 2:1 (×2) không bao giờ bị cảnh báo; lệch ×1,5 cũng vậy. Muốn máy tự bắt thì cần ngưỡng cảnh báo theo khung, ví dụ `vocab` 1,6. Ngưỡng này phải tách khỏi mốc 2,2 (`PictureFit.maxCropRatio`), là mốc app chuyển sang hiện ảnh nhỏ. Dev đề xuất, PM chốt.
- **Quả bóng còn chữ "Baden" và nhãn trắng trên bóng.** Crop cũ cũng thấy, không phải lỗi mới. Brief gốc `w1_ball` muốn bóng không chữ; Discoverer đã xoá chữ trong hình ghép riêng, Explorer chưa.
- **iPad (~2,2:1)** chỉ tính từ code, chưa kiểm trên máy.
- **Khung theo chỗ hiện:** `image-slots.json` chỉ có một `vocab` cho mọi thẻ từ. Có hai cách, PM chốt:
  - Tách thành từ trong `word_list` (2:1) và từ ngoài `word_list` (1:1).
  - Giữ một khung, rồi kiểm tay khung vuông của tab Từ vựng.
