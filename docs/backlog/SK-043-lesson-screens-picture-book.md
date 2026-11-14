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
