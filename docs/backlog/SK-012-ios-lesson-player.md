# SK-012 · LessonPlayer iOS: chơi trọn bài 1 (Khởi động → Học → Chơi → Quiz → Thưởng)

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: ios-dev · Tester: tester
Nguồn: docs/ios-test-build.md mốc 1 việc I8 và bảng "Cắt gì để nhanh"; technical-plan.md B4.2 (registry block), B4.4 (thử lại, gợi ý, giải thích, dừng giữa bài), B7.1 (`LessonPlayer`, `MiniGames`, `QuizEngine`, `Rewards`), B7.5 (motion), B7.6 (`Lesson(warmup → learn → play → quiz → reward)`), B7.8 (VoiceOver); SK-002 (chữ bài 1, 7 lời nhắn mâm cơm); canvas Discoverer 8 Khởi động (`Discoverer-Warmup`), 9 Học (`-Learn`), 10 Chơi (`-Play`), 11 Quiz câu 5 (`-Quiz`), 12 Quiz câu 6 (`-QuizMyth`), 13 Thưởng (`-Reward`)

## Mục tiêu
Bé chơi trọn bài 1 trên simulator iPhone theo đúng 6 màn của canvas. Mọi chữ, đáp án và lời nhắn lấy từ JSON bài; điểm và sao do `LessonEngine` tính.

## Phạm vi
- Module `LessonPlayer`: chạy bài theo bước `warmup → learn → play → quiz → reward`, registry `type → view` cho block học, mini-game và dạng câu. Dạng không có renderer thì bỏ qua (SK-009).
- **Khởi động** (màn 8): 2 câu soạn sẵn của bài (w1 `fill_blank_bank`, w2 `true_false`). Không tính điểm. Nhãn trên màn theo SK-002.
- **Học** (màn 9): `explore_groups` (chạm từng nhóm, đổi câu và món ví dụ, bộ đếm tới 4/4, xong khi `all_seen`), `word_list` (4 từ `core`).
- **Chơi** (màn 10): `build_tray` mâm cơm.
  - Mâm `capacity` chỗ, chạm món để đặt vào hoặc bỏ ra.
  - Đạt khi đủ nhóm `required` và không có nhóm `limit`.
  - Đủ 7 lời nhắn như canvas: `start`, `full`, `balanced`, `has_limited`, `missing.<nhóm>`. Thứ tự xét `missing` theo `groups` (SK-009); ưu tiên lời nhắn theo quyết định 3 bên dưới.
  - Luật đạt và chọn lời nhắn là hàm thuần trong `LessonEngine`, có vector (xem Phụ thuộc).
- **Quiz** (màn 11, 12): 6 câu, đủ 4 dạng `single_choice`, `multi_choice`, `fill_blank_bank`, `true_false` (có `statement`, `speaker: na`, `labels`).
  - Luồng một câu: chọn → Kiểm tra → đúng thì giấy trượt lên báo đúng kèm `explanation_correct`.
  - Sai thì mẩu giấy gấp góc kèm `hint`, cho thử lại (`max_tries` = 2). Sai lần 2 thì hiện `explanation_wrong` và đáp án đúng.
  - Câu `multi_choice` có trạng thái Bỏ sót như canvas.
  - `true_false` không có `labels` (w2) dùng nhãn mặc định Đúng · Sai / True · False trong `Localizable.xcstrings`.
- **Thưởng** (màn 13): sao từ `computeStars`, XP từ engine (SK-010), giấy vụn `fall`, lật thẻ rau muống `flip` (tên, nhãn, "Em có biết?").
- **Chữ hai thứ tiếng:** dòng EN là chính, dòng VI bên dưới theo `language_mode` như canvas. Nút nghe có sẵn chỗ, chưa phát tiếng (SK-016).
- **Hình giữ chỗ:** 36 hình do app vẽ bằng một thành phần `PlaceholderArt` trong `DesignSystem`: mảnh giấy màu theo nhóm (`ColorToken`) cộng tên món. Nhãn VoiceOver lấy từ `alt`. `asset` có thật thì về sau thay bằng ảnh.
- **Dừng giữa bài** (B4.4):
  - mỗi lần vào bài tạo `attempt_id` (UUID v4);
  - lưu bước hiện tại và các câu đã trả lời vào file trên máy sau mỗi bước;
  - tắt app rồi mở lại thì vào đúng bước, giữ đáp án đã chấm;
  - attempt bỏ dở quá 7 ngày thì huỷ;
  - xong bài thì lưu kết quả (`score`, `max_score`, `stars`, `xp`, thời gian) vào lịch sử trên máy. SK-022 gửi lịch sử này lên server.
- Motion theo canvas: mỗi màn 1 lượt hiện, `stamp` khi chọn, `rise` khi báo kết quả, `fall` chỉ ở Thưởng. Tắt hết khi giảm chuyển động.
- Nguồn nội dung: fixture nhúng như SK-011, cho tới khi SK-016 chuyển sang gói.

## Ngoài phạm vi
- Âm thanh: SK-016. Bố cục iPad: SK-013.
- `order_sequence`, `picture_bar_chart`, `sentence_card` (bài 1 không dùng): chưa có renderer.
- Chọn câu khởi động theo lịch giãn cách. Ôn nhanh, siêu sao, Bộ thẻ, Huy hiệu, Từ vựng.

## Tiêu chí nghiệm thu
- [ ] **UI test luồng vàng** (XCUITest, iPhone 16): từ Trang chủ vào bài 1, trả lời đúng hết ở lần đầu, xếp mâm đạt, tới Thưởng. Màn Thưởng hiện điểm 6/6, ⭐⭐, XP bằng kết quả của engine. Test xanh, dán log.
- [ ] **UI test 4/6:** sai q3 và q5 cả hai lần thử → điểm 4/6, ⭐ (ngưỡng mặc định 5/6). Có hiện gợi ý sau lần sai đầu và giải thích sau lần sai thứ hai.
- [ ] Kết quả `score`, `stars`, `xp` trên màn Thưởng trùng với gọi thẳng `scoreLesson` và `computeStars` cùng input (unit test của LessonPlayer).
- [ ] **Mâm cơm:** vector `build-tray` (tester, xem Phụ thuộc) pass trong `LessonEngineTests`. Trên app, thử tay đủ 7 lời nhắn; ghi lại các bước tái hiện từng lời.
- [ ] **Dừng giữa bài:** vào bài, làm tới quiz câu 3, `xcrun simctl terminate` rồi mở lại → vào đúng câu 3, câu 1–2 giữ kết quả. Test tay hoặc UI test.
- [ ] Ảnh chụp đủ 6 màn trên iPhone 16 và iPhone 16e (trạng thái dài nhất), đặt cạnh canvas. Không có chữ bị cắt.
- [ ] VoiceOver: mọi lựa chọn đọc nhãn EN của nội dung, hình đọc `alt`. Accessibility Inspector không báo lỗi trên 6 màn.
- [ ] Bật Reduce Motion → không có animation, bài vẫn chơi được trọn.
- [ ] Không có chữ của bài nằm trong code Swift: tìm một số câu EN của bài trong `apps/ios` bằng `grep` → không thấy.
- [ ] `xcodebuild test` xanh trên iPhone 16 và iPad Pro 11-inch (M4).
- [ ] Không sửa file ngoài `apps/ios/` (trừ ghi chú trong ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- SK-008, SK-009, SK-010.
- **Vector mâm cơm:** SK-003 để `build_tray` ngoài phạm vi. Tester viết `packages/content-schema/test-vectors/build-tray.json` theo luật `success_when` của SK-001, 7 lời nhắn của SK-002 và logic trên `Discoverer-Play.dc.html`. Việc này chạy song song với SK-009 và SK-010, phải xong trước tiêu chí mâm cơm ở trên. Tester ghi kết quả vào ticket này.
- SK-013 (iPad), SK-016 (âm thanh), SK-019 (kiểm luồng vàng) chờ ticket này.

**Quyết định đã ghi** (PM đề xuất 28/10)
1. Khởi động dùng nguyên 2 câu soạn sẵn của bài, như canvas (quyết định 1 của SK-002). Chọn câu theo lịch giãn cách làm khi có server.
2. Lịch sử làm bài lưu file JSON trên máy, chưa thêm GRDB (như SK-011).
3. **Luật mâm cơm (Duy chốt 29/10, trả lời 3 câu T1–T3 của tester):**
   - **T3 · Thứ tự nhắc nhóm thiếu theo canvas: đạm → rau và quả → bột đường.** Luật engine giữ nguyên "theo thứ tự `groups`" (nội dung là dữ liệu, không khoá thứ tự trong code). Phiên chính đã đảo `groups` của bài 1 thành `tray_protein`, `tray_veg`, `tray_carb`, `tray_sweet` ở cả `content/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.md` và fixture. Hệ quả: hàng nhãn nhóm trên màn Chơi (vẽ theo `groups`) đọc Đạm · Rau và quả · Bột đường, khác canvas (Bột đường · Đạm · Rau & quả); designer sửa canvas cho khớp khi rảnh.
   - **T1 · "Mâm đầy rồi" chỉ hiện khi bé chạm thêm món lúc mâm đã đủ `capacity`** (như canvas, giữ nguyên vector).
   - **T2 · Mâm đạt thì "Tuyệt!" thắng.** Thứ tự ưu tiên mới: `balanced` (khi `success`) > `full` > `has_limited` > `start` (mâm trống) > `missing.<nhóm>`. Khác canvas dòng 251–257 ở chỗ `full` không còn che `balanced`.

**Câu hỏi còn mở**
- ~~Thứ tự ưu tiên lời nhắn khi mâm vừa đầy vừa có đồ ngọt~~ Đã chốt, xem quyết định 3.
- XP trên màn Thưởng: giữ theo B4.4 hay ẩn (SK-010, câu hỏi mở)?

## Vector mâm cơm (tester)

_Cập nhật 28/10. Trạng thái ticket giữ nguyên._

### Cập nhật 29/10 (luật Duy chốt)

Luật: T1 giữ nguyên; T2 đổi thành `balanced` > `full` > `has_limited` > `start` > `missing.<nhóm>`; T3 engine vẫn xét `missing` theo `groups`, nội dung đảo `groups` bài 1 thành `tray_protein`, `tray_veg`, `tray_carb`, `tray_sweet` (fixture đã sửa). Bộ vector từ 33 lên 39 case (tổng 7 bộ: 162 lên 168). Không sửa 6 file vector khác.

**Case đổi:**
- Block bài 1 ("A", mọi case dùng) đổi thứ tự `groups` cho khớp fixture. Hệ quả cho `expected.missing` chỉ ở các case thiếu từ 2 nhóm: 001 và 023 (mâm trống: `[protein, veg, carb]`), 012 (kẹo: `[protein, veg, carb]`), 009 (cá kho: `[veg, carb]`, message `missing.tray_veg`, trước là `missing.tray_carb`), 010 (rau muống: `[protein, carb]`, message `missing.tray_protein`, trước là `missing.tray_carb`). Các case còn lại của bài 1 không đổi kết quả.
- 018: mâm cân bằng 4/4, chạm kẹo bị từ chối. Cờ `full` vẫn true, `message` đổi từ `full` sang `balanced` (T2 mới: `balanced` thắng `full`).
- 027: block 3 chỗ, mâm đầy và cân bằng, chạm chuối bị từ chối. `message` đổi từ `full` sang `balanced`, cùng lý do.
- 009, 010, 017: từ `proposed` sang `confirmed` (T3, quyết định 3 của Duy 29/10). 017 không đổi `expected` (block tự đặt đã theo `groups`), chỉ đổi mô tả.
- 004, 012, 014, 019, 020, 021, 022, 028: từ `proposed` sang `confirmed` vì T1 và T2 đã chốt; `expected` không đổi (trừ `missing` của 012, đã nêu ở trên). 012 và 014 vẫn `has_limited` > `missing` vì luật mới giữ thứ tự đó. 019 vẫn `full` vì mâm chưa đạt.
- 029 đến 033 (T4, dữ liệu hỏng) vẫn `proposed`: chỉ tester đề xuất, chưa có quyết định của Duy.
- `check-vectors`: bất biến "`full` true thì message luôn `full`" bỏ; thay bằng "success thì message luôn `balanced`", "`full` cần cờ `full` và chưa success", "chưa success mà cờ `full` bật thì message `full`". Bảng tình huống bắt buộc thêm 3 dòng (balanced thắng full; full thắng has_limited và missing; thứ tự `missing` theo `groups` với block tự đặt) và bỏ 018 khỏi dòng "đủ 7 lời nhắn" (thay bằng 019 cho `full`). Danh sách `decision` hợp lệ giữ nguyên, nhưng chỉ còn `SK-012/T4` được dùng.

**Case thêm (034 đến 039, đều `confirmed`):**
- 034: block tự đặt `carb, protein, veg`, mâm chỉ có cá kho: `missing.carb` (khoá canvas ra `missing.veg`).
- 035: block tự đặt `veg, carb, protein`, mâm chỉ có cơm: `missing.veg` (khoá canvas ra `missing.protein`).
- 036: block `carb, protein, veg`, dựng mâm bằng chạm rồi bỏ ra (rau muống, cá kho, bỏ rau muống): `missing` tính lại từ mâm cuối, vẫn theo `groups`.
- 037: mâm đầy, đạt (cơm, bánh mì, cá kho, rau muống), chạm trứng bị từ chối: `full` true, `message` `balanced`.
- 038: mâm đầy, chưa đạt, có đồ ngọt (cơm, cá kho, kẹo, nước ngọt), chạm rau muống bị từ chối: `message` `full` (thắng `has_limited` và `missing`).
- 039: mâm đầy, đạt, bị từ chối rồi bỏ một món: cờ `full` tắt, `balanced`.
Cùng với 017, ba case tự đặt 017, 034, 035 cho ba nhóm đầu khác nhau (veg, carb, veg) và đều khác đáp án khoá canvas, nên bản cài Swift khoá cứng đạm → rau quả → bột đường vẫn qua mọi case bài 1 nhưng đỏ ở 017, 034, 035, 036.

**Kết quả chạy 29/10** (trong `packages/content-schema`, cả ba exit 0):
```
node test-vectors/tools/check-vectors.mjs
  Số case ≥ tối thiểu ... build-tray 39/20
  Block bài 1 khớp fixture                   31 case; lời nhắn missing có đúng 3 nhóm required
  Tình huống bắt buộc của ticket             63/63; ...
OK: 7 file vector, 168 case, không có lỗi hình dạng hay nhất quán

node test-vectors/tools/run-reference.mjs
build-tray         39/39 khớp
OK: 168/168 case khớp bản cài tham chiếu
OK: 159 case không ghim pass_threshold đều cho cùng kết quả ở 4/6 và 5/6

npm test
ℹ tests 98 · pass 98 · fail 0
```
Lần chạy đầu sau khi đổi vector, công cụ bắt đúng 2 chỗ tôi sót (023 còn `missing` theo thứ tự cũ; điều kiện tình huống bắt buộc viết sai); đã sửa, chạy lại ra kết quả trên.

**Đột biến** (trên bản sao `buildTray` ở scratchpad, mỗi lần một lỗi, `run-reference`): 8/8 bị bắt.
- Khoá cứng thứ tự canvas (đạm, rau, bột): đỏ 017 034 035 036.
- Khoá cứng thứ tự cũ (bột, đạm, rau): đỏ 001 009 010 012 016 017 023 035.
- `full` thắng `balanced` (luật cũ): đỏ 018 027 037.
- `has_limited` sau `missing`: đỏ 012 014.
- `full` bật khi mâm vừa đủ chỗ: đỏ 022 028.
- `full` thua `has_limited`: đỏ 038. `full` thua `missing`: đỏ 019 021 038.
- Cờ `full` về false khi success: đỏ 018 027 037.

**Còn chưa chắc:** (1) 022 và 028 là hai case duy nhất bắt lỗi "`full` bật khi vừa đủ chỗ" (case đầy chỉ qua `tray` ban đầu, không qua chạm, thì không bắt được lỗi này vì cờ chỉ bật khi chạm); (2) vector chỉ kiểm `message` và cờ `full`, không kiểm màn hình có hiện cả "Tuyệt!" lẫn hiệu ứng từ chối món khi `full` true và `success` true; ios-dev nên quyết ở màn (đề xuất: chỉ dùng `message`); (3) T4 vẫn là đề xuất của tester.


**File:** `packages/content-schema/test-vectors/build-tray.json`, bộ thứ 7 của SK-003. Hàm `build_tray(block, tray, taps) -> {tray, full, missing, has_limited, success, message} | {error}`; chỉ chạy ở app (Swift, Kotlin sau này), không có phía server. Dev đọc, không sửa; thấy case sai thì ghi vào ticket này.

**Hợp đồng hàm** (để `LessonEngine` cài đúng một kiểu):
- `block` là phần luật của `build_tray`: `capacity`, `groups[].key/role`, `items[].key/group`. `tray` là mâm lúc bắt đầu (key món theo thứ tự đặt). `taps` là chuỗi key món bé chạm. `taps` rỗng thì hàm chỉ đánh giá mâm có sẵn.
- `message` là khoá lời nhắn, không phải chữ: `start`, `full`, `balanced`, `has_limited`, `missing.<key nhóm>`. App tra chữ EN/VI từ `messages` của block.
- Bản cài tham chiếu: `buildTray` trong `test-vectors/tools/reference-engine.mjs` (khoảng 25 dòng, dùng làm đối chiếu khi cài Swift).

**Quyết định tạm của tester (SK-012; Duy chốt; case liên quan để `proposed`)**
- **T1 · `full` là cờ tạm.** Theo canvas (`Discoverer-Play.dc.html` dòng 259–261): `full` bật khi chạm món chưa có trong mâm lúc mâm đã đủ `capacity` (mâm giữ nguyên); tắt ở lần chạm kế tiếp làm đổi mâm (đặt hoặc bỏ món). Mâm vừa đầy mà bé chưa chạm thêm thì chưa phải `full`; lời nhắn lúc đó vẫn theo `balanced`/`missing`. Case: 004, 018–022, 027, 028.
- **T2 · Thứ tự ưu tiên lời nhắn:** ~~`full` > `balanced` > `has_limited`~~ (đã đổi 29/10, xem mục cập nhật: `balanced` > `full` > `has_limited`) > (mâm trống → `start`) > `missing.<nhóm>`. Lấy theo canvas (dòng 251–257). Trả lời câu hỏi mở "vừa đầy vừa có đồ ngọt": nếu mâm vừa bị từ chối món thì hiện `full`; nếu chưa chạm thêm thì hiện `has_limited`. Case: 012, 014, 018, 019.
- **T3 · Thứ tự xét `missing`:** theo thứ tự `groups` của block (SK-009 quyết định 1). **Lệch canvas:** canvas xét đạm → rau và quả → bột đường, còn `groups` của bài 1 là bột đường, đạm, rau và quả. Hai nguồn cho kết quả khác nhau ở mâm chỉ có cá kho (canvas: thiếu rau; `groups`: thiếu bột đường) và mâm chỉ có rau (canvas: thiếu đạm; `groups`: thiếu bột đường). Case: 009, 010, 017. _(29/10: Duy chốt theo canvas; engine vẫn theo `groups`, `groups` của bài 1 đã đảo thành đạm, rau quả, bột đường. Xem mục cập nhật.)_
- **T4 · Dữ liệu hỏng trả lỗi, không đoán:** món không thuộc block (ở mâm khởi đầu hoặc chuỗi chạm) → `{error: "unknown_item"}`; mâm khởi đầu có món trùng hoặc quá `capacity` → `{error: "invalid_tray"}`. Mâm theo chạm không bao giờ có món trùng vì chạm lại món đang có là bỏ ra. Case: 029–033.

**Phủ:** mâm trống; mâm hợp lệ (4 món đủ chỗ, 3 món thừa chỗ, bộ món khác); thiếu từng nhóm bắt buộc (carb, protein, veg); hai món cùng nhóm; chỉ có đồ ngọt; đủ nhóm nhưng có đồ ngọt; nhóm `neutral`; vượt `capacity` (4 chỗ, 3 chỗ, 5 chỗ); full rồi bỏ món, full rồi thoát; chạm bỏ món, thứ tự giữ nguyên; món lạ; mâm trùng; mâm quá chỗ; đủ 7 lời nhắn. Block bài 1 trong vector được `check-vectors` đối chiếu với fixture, nên đổi nhóm hay món của bài 1 mà quên vector thì đỏ.

**Case theo trạng thái (cập nhật 29/10):** 39 case: 34 `confirmed`, 5 `proposed` (chỉ T4, case 029–033). T1, T2, T3 đã được Duy chốt nên case của chúng chuyển `confirmed` (bỏ `decision`). `confirmed` là luật có sẵn ở ticket, SK-001 (`success_when`), SK-002, SK-009 hay quyết định 3 của Duy.

**Cách chạy** (từ `packages/content-schema`):
```sh
node test-vectors/tools/check-vectors.mjs
node test-vectors/tools/run-reference.mjs
```
Kết quả chạy 28/10 (cả hai exit 0):
```
check-vectors (SK-003)
  Đủ 9 file của bảng Phạm vi                 9/9
  Đúng vector.schema.json                    7/7 file (mini-json-schema và Ajv 2020 cùng kết luận)
  Số case ≥ tối thiểu                        ... · build-tray 33/20
  decision có trong ticket                   16 mã: ... 12/T1, 12/T2, 12/T3, 12/T4
  expected tự nhất quán                      162 case
  Block bài 1 khớp fixture                   28 case; lời nhắn missing có đúng 3 nhóm required
  Tình huống bắt buộc của ticket             61/61
OK: 7 file vector, 162 case, không có lỗi hình dạng hay nhất quán

run-reference:  item-scoring 33/33 · lesson-score 11/11 · stars 27/27 · streak 18/18 · local-date 13/13 · warmup-selection 27/27 · build-tray 33/33
OK: 162/162 case khớp bản cài tham chiếu
OK: 153 case không ghim pass_threshold đều cho cùng kết quả ở 4/6 và 5/6
```
Sáu bộ cũ giữ nguyên số case (129) và vẫn khớp 100%; không sửa file vector cũ nào.

**Đột biến trên bản sao của `buildTray`** (mỗi lần một lỗi, chạy `run-reference` trên bản sao thư mục): 15/15 bị bắt, ít nhất 1 case đỏ mỗi lần.
- `full` bật khi `>` thay vì `>=`: đỏ 018 019 020 021 022 027. Không tắt `full` khi bỏ món: 020. `full` suy từ độ dài mâm: 004 013 022 028. `full` thua `balanced`: 018 027.
- `has_limited` xếp sau `missing`: 012 014. Thứ tự `missing` theo canvas thay vì `groups`: 001 009 010 012 017 023. Bỏ ưu tiên `start` khi mâm trống: 001 023.
- `neutral` tính như `limit`: 015 016. Bỏ điều kiện "không có đồ ngọt" của `success`: 013 028. `capacity` cố định 4: 027 028.
- Không báo món lạ: 029 030 031. Không báo mâm trùng: 032. Không báo quá `capacity`: 033.
- Thêm món lên đầu mâm thay vì cuối: 022 024 025 026 028. Chạm món có sẵn không bỏ ra: 020 022 023 025 026.
- Kiểm cả công cụ: sửa `expected.success` của 003 → `check-vectors` bắt 3 lỗi và `run-reference` bắt 1; đổi nhóm của một món trong fixture bài 1 → `check-vectors` báo block bài 1 lệch (28 case); xoá `decision` của case `proposed` → báo thiếu.

**File đã sửa ngoài `build-tray.json`:** `test-vectors/vector.schema.json` (thêm suite, `TrayBlock`, `BuildTrayInput/Result/Error`), `tools/check-vectors.mjs` (bộ mới, bất biến của `build-tray`, đối chiếu fixture, `KNOWN_DECISIONS` có `SK-012/T1–T4` đọc từ ticket này), `tools/reference-engine.mjs` (`buildTray`), `tools/run-reference.mjs`, `README.md`.

**Với ios-dev:** `LessonEngineTests` thêm một `@Test` có tham số đọc `build-tray.json` như các bộ khác (harness của SK-010 đã đọc theo `suite`). Hàm `buildTray(block:tray:taps:)` nên nằm ở `LessonEngine`; dùng `messages` của block để tra chữ từ `message`. Cài `missing` và lời nhắn thiếu theo thứ tự `groups` của block, không khoá cứng đạm → rau quả → bột đường (Duy chốt 29/10): các case 034, 035, 036 dùng block tự đặt có `groups` thứ tự khác để bắt lỗi khoá cứng. Thứ tự ưu tiên lời nhắn: `balanced` > `full` > `has_limited` > `start` > `missing.<nhóm>`; khi mâm vừa bị từ chối món mà đã đạt thì cờ `full` vẫn true nhưng `message` là `balanced`.

**Câu hỏi cho Duy (chốt trước khi cài app)**
> **Duy trả lời 29/10:** T3 theo canvas, T1 theo canvas, T2 `balanced` thắng `full`. Xem quyết định 3 ở trên.

1. **T3, quan trọng nhất:** thứ tự nhắc nhóm thiếu theo `groups` (bột đường → đạm → rau quả) hay theo canvas (đạm → rau quả → bột đường)? Nếu chọn canvas thì content-editor đảo thứ tự `groups` của bài 1 (bột đường vẫn nên đứng đầu trên mâm?) hoặc đề xuất thêm trường thứ tự cho schema v1.1; designer cũng nên xem lại thứ tự hiển thị nhóm trên canvas. Đến khi chốt, case 009, 010, 017 giữ `proposed` và theo ticket (SK-009).
2. **T1:** "mâm đầy" chỉ hiện khi bé chạm thêm món vào mâm đã đủ chỗ (như canvas), hay hiện ngay khi mâm vừa đủ chỗ? Bản canvas làm cách đầu; cách sau sẽ làm mâm cân bằng 4/4 không bao giờ hiện lời "Tuyệt!".
3. **T2:** khi `full` đang bật mà mâm đã cân bằng (case 018), lời nhắn là "Mâm đầy rồi" thay vì "Tuyệt!". Giữ như canvas, hay để `balanced` thắng `full` khi `success`?
4. Không phải câu hỏi: canvas hiện nút "Mâm cân bằng! Làm quiz" khi mâm `success` (dòng 218–224), bé bấm mới sang quiz; bước Chơi không tự kết thúc. Nút phụ thuộc `success`, không phụ thuộc `full`. Vector không kiểm phần này, chỉ ghi để ios-dev khỏi tự quyết lại.

## Kết quả (ios-dev)

_29/10 · ios-dev. Trạng thái chuyển `review`. Chưa commit._

### Đã làm
- **`LessonEngine`:** hàm thuần `buildTray(block:tray:taps:) -> Result<TrayState, TrayError>` (`BuildTray.swift`) theo hợp đồng ở mục "Vector mâm cơm". `missing` theo thứ tự `groups` của block, không khoá thứ tự trong code. Lời nhắn theo quyết định 3: `balanced` (khi `success`) > `full` > `has_limited` > `start` > `missing.<nhóm>`. `LessonEngineTests` đọc `build-tray.json` bằng harness của SK-010.
- **`LessonPlayer`** (SKKit):
  - `LessonSession` (`@Observable`, `@MainActor`) chạy các bước `warmup → learn → play → quiz → reward`. Mọi phép chấm gọi engine: `scoreItem`, `scoreLesson`, `computeStars`, `computeXP`, `buildTray`.
  - `LessonRules` đọc `content/rules.json` theo nhóm tuổi; app nhúng file này qua `project.yml`.
  - `AttemptStore` lưu tiến độ và lịch sử.
  - Các view: `LessonPlayerView` (chọn màn theo bước), `QuestionStep` (Khởi động và Quiz), `LearnStep`, `PlayStep`, `RewardStep`, cùng các phần dùng chung trong `LessonParts` và `QuestionViews`.
  - Câu có `format` chưa có renderer và game lạ bị lọc khỏi bài, không crash; có unit test cho cả hai.
- **`DesignSystem`:** `PlaceholderArt` (mảnh giấy màu theo nhóm), `TornSheet` (tờ giấy xé báo kết quả). Thêm vài hằng số vào `PaperMetrics`.
- **App:**
  - route `.lesson` mở `LessonPlayerView`; xoá `LessonPlaceholderScreen`;
  - `ContentText.swift` chuyển vào `LessonPlayer/Language.swift`;
  - `AppModel` mở lại bài bị cắt ngang;
  - `Localizable.xcstrings` có 157 chuỗi EN + VI;
  - hình người nói `ArtSpeakerNa` tách từ canvas QuizMyth bằng `scripts/extract-canvas-art.py`;
  - `README.md` thêm mục "Bài học (SK-012)".
- **Test:**
  - `LessonSessionTests`: 22 unit test;
  - `LessonUITests`: 9 UI test;
  - `LessonFixture.swift`: UI test đọc đáp án, lời nhắn, XP và ngưỡng từ fixture bài 1 và `content/rules.json`, nên test không chép chữ của bài.

**File chính** (đều trong `apps/ios/`):
- `Packages/SKKit/Sources/LessonEngine/BuildTray.swift`
- `Packages/SKKit/Sources/LessonPlayer/`: `LessonSession.swift`, `AttemptStore.swift`, `LessonRules.swift`, `ContentScoring.swift`, `Language.swift`, `LessonPlayerView.swift`, `Views/*.swift`
- `Packages/SKKit/Sources/DesignSystem/Components/PlaceholderArt.swift`
- `ScienceKids/Home/MainFlow.swift`, `ScienceKids/App/AppModel.swift`, `ScienceKids/Content/BundledContent.swift`
- `ScienceKidsUITests/LessonUITests.swift`, `ScienceKidsUITests/LessonFixture.swift`
- `Packages/SKKit/Tests/LessonPlayerTests/LessonSessionTests.swift`
- `Packages/SKKit/Tests/LessonEngineTests/VectorHarness.swift`, `Packages/SKKit/Tests/LessonEngineTests/VectorTests.swift`
- Phụ: `ScienceKids/Debug/GalleryView.swift` (chữ mẫu không còn là chữ bài), comment trong `DesignSystem/Components/PaperTag.swift`, `ContentModel/VocabAndReward.swift`, `ContentModel/SentenceSegment.swift`, `project.yml` (nhúng `content/rules.json`), `scripts/extract-canvas-art.py`, `README.md`

### Mặc định tạm (phiên chính giao) và quyết định của ios-dev
1. **XP hiện trên Thưởng**, như canvas và B4.4. Ngưỡng đạt lấy từ `rules` (5/6). Đây là mặc định tạm, Duy chốt ở câu hỏi 1 bên dưới.
2. **Mâm cơm:**
   - mỗi lần chạm, view gọi `buildTray(block, tray: mâm hiện tại, taps: [món])`; chữ lấy từ `messages` theo `message`;
   - mâm đã đạt mà bé chạm món thứ 5: món bị từ chối nằm yên trên kệ, lời nhắn vẫn "Tuyệt!", không rung (trả lời ý "còn chưa chắc (2)" của tester);
   - nút "Làm quiz" chỉ hiện khi `success`; chưa đạt thì hiện thanh yêu cầu là một nút bị khoá thật, ghép từ nhãn nhóm trong nội dung;
   - XP game chỉ cộng khi rời màn Chơi lúc mâm đạt.
3. **Khởi động:**
   - chạm đáp án là trả lời, vì canvas không có nút Kiểm tra;
   - sai lần 1 thì hiện mẩu giấy gợi ý và bé chạm đáp án khác;
   - số lần thử theo `max_tries`; không tính điểm.
4. **Quiz:**
   - chọn → Kiểm tra;
   - sai lần 1: đánh dấu lựa chọn sai, mẩu giấy gấp góc chứa `hint`, nút Thử lại; câu `multi_choice` giữ lại các lựa chọn cũ;
   - sai lần 2: tờ kết quả với `explanation_wrong`, đáp án đúng được đánh dấu (Bỏ sót cho `multi_choice`, Đáp án cho câu chọn một);
   - nút "Gợi ý" chỉ hiện trước khi trả lời, bấm vào thì ghi `hint_used`;
   - đúng ở lần 2 thì không có điểm và XP (engine quyết).
5. **Ngôn ngữ:**
   - tên, nhãn lựa chọn và gợi ý theo luật tên: Song ngữ hiện VI trước, như canvas;
   - câu, giải thích và lời nhắn theo luật câu: EN trước, VI dưới;
   - `en_first` ẩn dòng VI; chip "VI" trên header bật lại.
6. **VoiceOver:**
   - lựa chọn đọc nhãn EN của nội dung (đúng tiêu chí);
   - món trên kệ đọc "Rice, Cơm"; món trong mâm đọc "Bỏ … khỏi mâm";
   - hình đọc `alt`; thanh đo nhóm gộp nhãn và giá trị.
7. **Dừng giữa bài:**
   - mỗi lượt có `attempt_id` UUID v4;
   - tiến độ ghi vào `Application Support/lessons/in_progress/<lesson_id>.json` sau mỗi lần trả lời và mỗi lần đổi bước;
   - **app bị tắt** giữa bài: mở lại thì vào thẳng bài, đúng bước, giữ các câu đã chấm;
   - **bé bấm nút đóng hoặc quay lại** (dừng chủ động): lần sau mở app ở Trang chủ, vào bài thì tiếp đúng câu;
   - quá 7 ngày không đụng thì file bị xoá khi đọc, bài làm lại từ đầu;
   - xong bài thì thêm bản ghi vào `lessons/history.json` theo dạng `lesson_attempts` + `answers` (B5) và xoá file đang làm dở. Bản ghi có `stars`, `local_date`, `duration_s`; `content_version` để `null` cho tới SK-016.
8. **Sao:** `computeStars` chạy trên lịch sử trên máy của hồ sơ cộng lượt này. `local_date` tính theo `timezone` của hồ sơ.
9. **Học:** nhóm đầu mở sẵn và tính là đã xem, như canvas. Nút sang Chơi bị khoá kèm dòng "Chạm hết các nhóm để mở phần chơi." cho tới khi xem đủ (`all_seen`).
10. **Chơi:** header có nút về Học và chip XP `+xp_game_complete` (lấy từ `rules`).
11. **Nút nghe:** ẩn hết cho tới SK-016, để không có nút bấm mà không phát gì.
12. **Thưởng:**
    - hai ô: điểm và XP;
    - dòng gợi ý cách lấy sao tiếp theo, tính từ `rules` (`pass_threshold`, `mastery_gap_days`);
    - giấy vụn `fall` 10 mảnh theo vị trí canvas, nằm sau chữ;
    - thẻ rau muống lật `flip`, mặt sau "Em có biết?" lấy từ `fact`;
    - "Xem bộ thẻ" mở tab Bộ thẻ (đang là màn "sắp có"), "Về hành trình" về Trang chủ.

### Tiêu chí nghiệm thu
Log và ảnh nằm ở scratchpad của phiên. Đường dẫn đầy đủ có trong báo cáo gửi phiên chính.

- [x] **UI test luồng vàng** (`testGoldenPathAllRight`): pass trên iPhone 16 và iPad Pro 11. Log: `golden path reward: score '6/6, câu đúng', stars 'Được 2 trên 3 sao', xp '+90, XP'`. 90 = 6 × `xp_per_correct` 10 + `xp_game_complete` 10 + `xp_lesson_complete` 20; test tính số này từ `content/rules.json`, khớp `computeXP`.
- [x] **UI test 4/6** (`testFourOfSixOneStar`): pass trên iPhone 16 và iPad. Log:
  ```
  q3 try 1 wrong → hint 'Gần đúng!, Bún làm từ gạo. Gạo thuộc nhóm chất nào?'
  q3 try 2 wrong → 'The answer is sweet potato. Both are carbohydrates.'
  q5 try 1 wrong → hint 'Gần đúng!, Chất đạm giúp cơ thể lớn lên. Thường có trong cá, thịt, trứng và các loại đậu.'
  q5 try 2 wrong → 'The protein foods are fish, eggs and tofu.'
  4/6 reward: score '4/6, câu đúng', stars 'Được 1 trên 3 sao', xp '+70, XP'
  ```
- [x] **Thưởng trùng engine:** unit test `rewardMatchesTheEngineAllRight` (6/6, 2 sao, XP 90) và `rewardMatchesTheEngineFourOfSix` (4/6, 1 sao, XP 70). Hai test so `LessonSession.summary` với kết quả gọi thẳng `scoreLesson`, `computeStars`, `computeXP` cùng input. Cùng file còn `secondPassNextDayGivesThreeStars` và `rightOnSecondTryEarnsNothing`.
- [x] **Mâm cơm:**
  - vector: `vectors build-tray: 39/39 pass · confirmed 34/34 · proposed 5/5` trên iPhone 16 và iPad; `vectors all: 110/110`;
  - trên app, `testSevenTrayMessages` đi qua 11 bước và gặp đủ 7 lời nhắn; ba bước cuối kiểm luật T2 (mâm đạt và đầy, món thứ 5 bị từ chối vẫn ra "Tuyệt!").
  - **Bước tái hiện bằng tay** (vào bài 1, qua Khởi động và Học, tới màn Chơi):

    | # | Thao tác (mâm sau thao tác) | Lời nhắn |
    | --- | --- | --- |
    | 1 | vừa vào màn (mâm trống) | `start` · Chọn món cho mâm cơm khoẻ mạnh nhé. |
    | 2 | chạm Cơm (cơm) | `missing.tray_protein` · Thêm một món giàu chất đạm nhé! |
    | 3 | chạm Cá kho (cơm, cá kho) | `missing.tray_veg` · Mâm còn thiếu rau hoặc quả! |
    | 4 | chạm Rau muống (3/4) | `balanced` · Tuyệt! Mâm cơm cân bằng rồi. Nút "Làm quiz" hiện. |
    | 5 | chạm Kẹo (4/4) | `has_limited` · Kẹo và nước ngọt chỉ nên ăn ít thôi. |
    | 6 | chạm Trứng, bị từ chối (vẫn 4/4) | `full` · Mâm đầy rồi — chạm món trong mâm để bỏ ra. |
    | 7 | chạm Cơm trong mâm để bỏ ra (cá kho, rau muống, kẹo) | `has_limited` |
    | 8 | chạm Kẹo để bỏ ra (cá kho, rau muống) | `missing.tray_carb` · Thêm cơm hoặc bánh mì nhé! |
    | 9 | chạm Cơm, rồi Bánh mì (4/4, đạt) | `balanced` |
    | 10 | chạm Trứng, bị từ chối | vẫn `balanced` "Tuyệt!" (T2), Trứng nằm yên trên kệ |
- [x] **Dừng giữa bài:**
  - `testCutOffAtQuestion3ResumesThere`: làm tới quiz câu 3, `app.terminate()`, mở lại. Log `relaunch → 'Câu 3/6'`; làm tiếp tới hết ra 6/6, tức câu 1–2 giữ kết quả. Pass trên iPhone 16 và iPad.
  - `testCloseButtonKeepsTheAttempt`: bấm đóng ở câu 2 sau một lần sai, rồi tắt và mở app. App mở ở Trang chủ; vào bài thì về đúng "Câu 2/6", gợi ý và nút Thử lại vẫn còn.
  - Unit: `resumesAtTheSameQuestionWithItsTries`, `attemptOlderThanSevenDaysStartsOver`, `finishingWritesTheHistoryOnceAndClearsTheProgress`, `brokenProgressFileIsDropped`.
- [x] **Ảnh 6 màn** (cả trạng thái dài nhất: sai lần 1, đúng lần 2, mâm có đồ ngọt, mặt sau thẻ, cuộn tới cuối) trên iPhone 16, iPhone 16e và iPad Pro 11, cùng ảnh đặt cạnh canvas cho 6 màn ở hai cỡ iPhone. Không thấy chữ bị cắt. Trên màn Chơi, hàng kệ thứ hai cuộn xuống dưới thanh yêu cầu ở cả hai iPhone; đó là nội dung cuộn, không phải chữ bị cắt.
- [x] **VoiceOver và audit:**
  - `testAccessibilityAudit` chạy `performAccessibilityAudit` (contrast, element detection, hit region, mô tả, trait, chữ bị cắt, Dynamic Type) trên 6 màn; pass trên iPhone 16 và iPad;
  - cho qua có lý do: (a) contrast của câu có ô trống "?": audit lấy mẫu cả nền lõm điệp thẫm của ô trống, chữ trên giấy là than tre (≥ 7:1); (b) chữ "fish" bị cắt khi chữ rất lớn, cùng phát hiện với gallery SK-008; (c) "Dynamic Type partially unsupported", vì trần chữ của B7.8;
  - `testEveryButtonIsAtLeast56ptAndLabelled`: mọi nút ở 20 trạng thái ≥ 56 × 56pt và có nhãn; pass trên iPhone 16, iPad và 16e;
  - chưa mở Accessibility Inspector bằng tay; audit của XCTest là cùng bộ kiểm.
- [x] **Reduce Motion:**
  - mọi UI test bài học trừ `testScreenshots` chạy với cờ giảm chuyển động của app (`-SKReduceMotion YES`) và đi trọn bài;
  - với công tắc hệ thống: `testGoldenPathWithSystemReduceMotion` chạy trên iPhone 16e với `ReduceMotionEnabled` = 1 (đặt bằng `simctl`; chạy xong trả về 0). Test pass, ra 6/6, 2 sao, +90. Log motion có 172 dòng "skip …: reduce motion" (lay 104, stamp 29, pop 11, fall 10, rise 8, slide 8, nudge 2) và 0 dòng "start".
- [x] **Không có chữ bài trong Swift:** quét 181 chuỗi EN/VI (từ 12 ký tự) của fixture bài 1 trong `apps/ios/ScienceKids` và `apps/ios/Packages/SKKit/Sources`. Chỉ 4 chuỗi trúng, đều là comment trong `DesignSystem/Generated/Tokens.swift` (sinh từ `tokens.json`, xem đề xuất). Mẫu chữ trong comment và gallery debug đã thay bằng chữ không thuộc bài.
- [x] **`xcodebuild test`:**
  - unit xanh trên iPhone 16 và iPad Pro 11, 157 test mỗi máy: app 40, DesignSystem 35, ContentModel 20, Profiles 20, LessonPlayer 22, LessonEngine 14, ContentKit 5, AudioKit 1;
  - UI:
    - **lượt 1** (trước khi sửa vị trí giấy vụn): iPhone 16 chạy cả target UI, 26 test, 2 skip, 1 lỗi (`GalleryUITests/testAccessibilityAuditEverySection`: "Audit failed to complete in time"); iPad Pro 11 chạy cả target UI, 26 test, 2 skip, 0 lỗi; iPhone 16e chạy `testScreenshots` và `testEveryButtonIsAtLeast56ptAndLabelled`, pass;
    - **lượt 2** (code cuối): iPhone 16 chạy cả target UI, gồm LessonUITests 8 pass + 1 skip và OnboardingUITests 10/10; lỗi gallery còn đó. iPad chạy LessonUITests, 8 pass + 1 skip. iPhone 16e chạy `testScreenshots` (pass) và test Reduce Motion hệ thống (pass);
    - **lỗi gallery:** do tôi đổi chữ mẫu của gallery debug. Chia đôi bằng cách chạy riêng test này 6 lần: chữ cũ thì pass; chỉ đổi chip hoặc nhãn thì pass; chỉ đổi dòng chữ mẫu của thẻ (ngắn hơn) thì lỗi. Dòng ngắn làm audit của mục kế tiếp không xong kịp, có lẽ vì audit đổi cỡ chữ làm vùng cuộn xê dịch. Đã thay bằng chữ không thuộc bài, dài bằng chữ cũ, và ghi chú ngay chỗ đó;
    - **lượt 3** (code cuối): `GalleryUITests` trên iPhone 16 và iPad, 5 pass + 2 skip, 0 lỗi; audit pass (114s và 134s);
    - skip đều có lý do: test Reduce Motion hệ thống chỉ chạy khi bật công tắc; ảnh gallery chỉ chụp khi có thư mục ảnh.
- [x] Chỉ sửa trong `apps/ios/` và mục này của ticket. Không commit.

### Khác canvas
- **Có chủ ý (quyết định 3):** hàng nhãn nhóm trên màn Chơi đọc Đạm · Rau và quả · Bột đường, vì vẽ theo `groups`; canvas ghi Bột đường · Đạm · Rau & quả. Khi mâm đầy mà đã đạt, lời nhắn là `balanced`, khác canvas dòng 251–257.
- **Hình:** mọi hình món và nhóm là `PlaceholderArt` (mảnh giấy màu), chưa có SVG giấy cắt (SK-018). Lựa chọn quiz không gắn với nhóm nên mảnh giấy dùng màu trung tính.
- **Nút nghe:** chưa có (SK-016).
- **Khởi động:** canvas có hàng hình "food + water + ?" và (câu 2) chip "plant · cây". Nội dung schema v1 không có các phần này nên app không vẽ. Nhãn nhớ lại dùng "Nhớ lại · điều em đã biết" theo SK-002, canvas ghi "Nhớ lại · từ Year 2".
- **Học:**
  - nút "Chơi thôi →" thay cho "Chơi: Xếp mâm cơm", vì tên game nằm trong `prompt` của block, không có tên ngắn;
  - nút bị khoá kèm dòng chú thích cho tới khi xem đủ 4 nhóm.
- **Chơi:**
  - chip `+10 XP` lấy từ `rules.xp_game_complete`, canvas ghi `+20`;
  - thanh yêu cầu ghép từ nhãn nhóm ("Cần đủ Đạm, Rau và quả, Bột đường · Đồ ngọt: nên ăn ít"), canvas viết câu tự do;
  - khay mâm cao hơn canvas một chút.
- **Quiz:**
  - nút "Gợi ý" chưa có hình bóng đèn, vì DesignSystem chưa có icon này;
  - sau lần sai đầu, câu `multi_choice` chưa hiện Bỏ sót: Bỏ sót chỉ hiện khi đã hết lượt, để không lộ đáp án trước lần thử 2;
  - bộ đếm EN là "Q n/6".
- **Thưởng:**
  - chưa có ô chuỗi ngày và "thử thách tuần", vì cần streak và Sync (SK-022);
  - chưa có số thẻ của bộ ("3/24"), vì nội dung chưa có tổng số thẻ của bộ;
  - thêm dòng gợi ý sao kế tiếp;
  - trên iPhone 16e và iPad, nhãn "Vitamin và chất khoáng" của thẻ xuống hai dòng, vẫn nằm trong thẻ.
- **iPad:** bố cục iPhone canh giữa (`phoneColumnOnRegular`); hai cột để SK-013.

### Đề xuất và ghi chú cho người khác
- **dev / PM:**
  - (1) manifest hoặc schema thêm `lesson_count` cho chủ đề; app đang tạm đếm bằng bảng trong `BundledContent`, có `TODO(SK-015/SK-016)`;
  - (2) schema v1.1 có thể thêm phần minh hoạ cho câu khởi động (hàng "food + water + ?") và tổng số thẻ của bộ sưu tập, nếu Duy muốn giống canvas;
  - (3) `Tokens.swift` sinh từ `tokens.json` có comment trích chữ của bài ("Chất bột đường", "Vitamin và chất khoáng", "Chọn tất cả đáp án đúng"). Đó là comment, không hiện lên màn, nhưng làm phép grep "không có chữ của bài trong Swift" có 4 dòng trúng. Đề xuất designer bỏ chữ bài khỏi `description` của token, hoặc tester loại `Generated/` khỏi phép grep.
- **designer:** thiếu icon bóng đèn cho nút "Gợi ý". Canvas Chơi ghi `+20 XP` trong khi `rules` cho `+10`.
- **tester:**
  - phép grep chữ bài chỉ quét code app và `SKKit/Sources`, không quét test (theo mặc định tạm);
  - lỗi T4 (`unknown_item`, `invalid_tray`) không xảy ra được trong app, vì mâm chỉ dựng bằng chạm món của block; engine vẫn trả lỗi đúng theo vector;
  - kiểm thêm bằng tay: VoiceOver đọc 6 màn trên máy thật, và Dynamic Type lớn nhất ở Thưởng.

### Câu hỏi cho Duy
1. XP trên màn Thưởng: giữ (đang làm theo B4.4 và canvas) hay ẩn?
2. App bị tắt giữa bài thì mở lại vào thẳng bài. Còn khi bé tự bấm thoát, app mở ở Trang chủ và bài chờ ở đó. Giữ hai cách này hay luôn mở ở Trang chủ?
3. Hàng hình minh hoạ của câu khởi động ("food + water + ?") có cần ở bản chạy thử không? Nếu cần, dev thêm trường vào schema v1.1 và content-editor điền.

## Nghiệm thu (tester, 29/10)

Chạy trên bản sao `snapshot-sk011-012/apps/ios`. Máy: **iPhone 16 Pro** thay iPhone 16, **iPad Pro 13-inch (M4)** thay iPad Pro 11-inch. Viết tắt `T/` = `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/tester-sk011-012/`.

### Test đã chạy
| Lệnh | iPhone 16 Pro | iPad Pro 13 (M4) |
| --- | --- | --- |
| Unit `-skip-testing:ScienceKidsUITests` | 157 pass, 0 fail (LessonPlayer 22, LessonEngine 14, app 40, ...). TEST SUCCEEDED | 157 pass, 0 fail |
| Vector (in từ log unit) | `build-tray: 39/39 pass · confirmed 34/34 · proposed 5/5`; `all: 110/110` | như trái |
| `LessonUITests` (9 test; `T/ui-iphone16pro.log`, `T/ui-ipad13.log`) | 8 pass + 1 skip, 0 fail | 7 pass + 1 skip + **1 fail** lần đầu (xem lỗi L1); chạy lại riêng `testAccessibilityAudit`: pass (`T/ui-ipad13-audit-rerun.log`) |
Test skip: `testGoldenPathWithSystemReduceMotion` (chỉ chạy khi simulator bật Reduce Motion). Số test khớp báo cáo (Lesson 9, Onboarding 10, unit 157). Hai simulator chạy song song khi đo lần đầu.

### Tiêu chí
| # | Kết quả | Bằng chứng |
| --- | --- | --- |
| 1 Luồng vàng 6/6, 2 sao, XP engine | Đạt | `testGoldenPathAllRight` pass cả hai máy. |
| 2 UI test 4/6, gợi ý lần 1, giải thích lần 2 | Đạt | `testFourOfSixOneStar` pass cả hai máy. |
| 3 Thưởng trùng `scoreLesson`/`computeStars` | Đạt | `LessonSessionTests` 22/22. Đọc `LessonSession.finish()` (LessonSession.swift:287-344): điểm, XP, sao đều gọi `scoreItem`, `scoreLesson`, `computeXP`, `computeStars`; `RewardStep` chỉ in `summary`. |
| 4 Mâm cơm: vector pass + 7 lời nhắn | Đạt (7 lời bằng UI test, không thử tay) | `BuildTray.swift` đối chiếu từng dòng với `buildTray` trong `reference-engine.mjs:186-208`: cùng thứ tự (balanced > full > has_limited > start > missing theo `groups`), cùng kiểm lỗi, không khoá thứ tự nhóm. Harness (`VectorHarness.swift:131`) đọc toàn bộ `cases` của `build-tray.json` (không lọc), 39/39. `testSevenTrayMessages` pass cả hai máy. |
| 5 Dừng giữa bài (câu 3) | Đạt | `testCutOffAtQuestion3ResumesThere` và `testCloseButtonKeepsTheAttempt` pass cả hai máy; unit `attemptOlderThanSevenDaysStartsOver` pass. |
| 6 Ảnh 6 màn iPhone 16 + 16e cạnh canvas | **Không kiểm đủ** | Có ảnh 6 màn iPhone 16 Pro (`T/shots-phone/`) và iPad 13 (`T/shots-pad/`), kể cả trạng thái sai lần 1, mâm có đồ ngọt, Thưởng. Đã xem tay 5 ảnh (Home, Topic, Chơi, Quiz q5, Thưởng): không thấy chữ bị cắt. Không có 16e; chưa đặt cạnh canvas. |
| 7 VoiceOver + Accessibility Inspector | Đạt một phần | `testAccessibilityAudit` (7 loại) pass iPhone 16 Pro; iPad 13: fail 1 lần, pass lần chạy lại (L1). Nút ≥ 56pt, có nhãn: pass cả hai máy. Audit "cho qua" mọi cảnh báo "Dynamic Type partially unsupported" và contrast ô trống (có lý do, có in log). VoiceOver thật: Duy kiểm tay. |
| 8 Reduce Motion | Đạt một phần | Cờ app `-SKReduceMotion`: các test bài học chạy trọn bài. Quét code: mọi `.animation`, `TimelineView`, `rotation3DEffect` đều nằm trong `DesignSystem/Motion` qua `MotionPolicy`; app và LessonPlayer không có `withAnimation`/`.transition` trần. Công tắc hệ thống: test skip trong lượt của tôi, không bật. |
| 9 Không có chữ bài trong Swift | Đạt | Script `T/grep.py` lấy chuỗi `{en,vi}` từ fixture bài 1 (95 EN + 86 VI, tổng 181 chuỗi ≥ 12 ký tự), `grep -rlF --include='*.swift'` trên `apps/ios/ScienceKids` và `Packages/SKKit/Sources`: 181 chuỗi, chỉ 4 trúng, đều trong `DesignSystem/Generated/Tokens.swift` (comment). Mẫu ngẫu nhiên 50 chuỗi: cùng kết quả. Hạ ngưỡng xuống ≥ 5 ký tự: thêm từ chung ("protein", "vitamin", "bánh mì", "chuối", "trứng", "Từ mới"...) trong `Debug/GalleryView.swift` (màn debug) và comment `ContentModel/Blocks.swift:152`, không có trong UI người dùng. |
| 10 `xcodebuild test` xanh | Đạt trên máy thay thế, kèm 1 lần đỏ khi chạy song song | Bảng trên. |
| 11 Không sửa ngoài apps/ios, không commit | Không kiểm được | Như SK-011 #9. |

Tổng 11 tiêu chí: 7 đạt (1, 2, 3, 4, 5, 9, 10), 2 đạt một phần (7, 8: phần tự động đạt, phần người thật chưa), 1 không kiểm đủ (6), 1 không kiểm được (11), 0 không đạt.

### Review code (đọc diff)
- `attempt_id`: `AttemptProgress.init` dùng `UUID()` (v4), sinh một lần khi vào bài; lần làm lại sau khi xong là UUID mới; `AttemptStore.append` loại trùng theo id. Đạt.
- Huỷ sau 7 ngày: tính từ `updatedAt` (lần ghi cuối), không phải `startedAt`; xoá khi đọc. Hợp ý "bỏ dở quá 7 ngày".
- `max_tries` 2: `status(of:)` dựa `scoreItem` và `rules.scoring.maxTries`, view không tự đếm. Thử sau khi câu xong bị bỏ qua. Đạt.
- `multi_choice` Bỏ sót: `AnswerDisplay.final` (QuestionViews.swift:50-56) đánh `.missed` cho đáp án đúng chưa chọn; sau lần sai đầu chỉ đánh dấu các lựa chọn đã chọn (không lộ đáp án). Đạt; `testScreenshots` chụp được.
- Điểm: view chỉ in `summary`. Duy nhất chỗ view tự suy: QuestionStep.swift:151 (xem L4).

### Lỗi
Không có lỗi chặn.
- **L1 · Nên sửa (test không ổn định):** `LessonUITests.testAccessibilityAudit` trên iPad Pro 13 lần đầu fail ở `LessonUITests.swift:66` ("no button lesson.tf.false"): sau audit ở Khởi động, bấm "Tiếp" thì câu 2 (true_false) không hiện trong 5 giây. Tái hiện: chạy `-only-testing:ScienceKidsUITests/OnboardingUITests -only-testing:ScienceKidsUITests/LessonUITests` trên iPad Pro 13 (M4) trong lúc iPhone 16 Pro cũng đang chạy test; chạy lại riêng test này thì pass (112s), iPhone 16 Pro cả hai lần pass. Chưa rõ do máy tải hay lỗi app (câu 2 không hiện sau audit đổi cỡ chữ). Đề nghị ios-dev chạy lặp trên iPad 13 một mình và thêm log màn hiện tại khi chờ quá hạn.
- **L2 · Nhỏ:** `AttemptStore.history()` (AttemptStore.swift, hàm `history`) trả `[]` khi file hỏng, rồi `append` ghi đè: mất toàn bộ lịch sử và sao tính lại từ đầu. Nên đổi tên file hỏng thành `.bak` thay vì ghi đè.
- **L3 · Nhỏ (hình):** ảnh `T/shots-phone/iphone-16-pro-11-quiz-q5-wrong.png`: nhãn "CHƯA ĐÚNG" che nửa hình món "rice". Ghi cho designer/ios-dev.
- **L4 · Nhỏ:** QuestionStep.swift:151 tự quyết hiện "+XP" khi `correct && firstTry`, dùng `rules.xp.perCorrect`, thay vì lấy từ `scoreItem.points`. Hiện trùng luật D1 (chỉ lần 1 có điểm), nhưng nếu luật đổi thì màn Quiz và màn Thưởng lệch.
- **L5 · Nhỏ:** `DesignSystem/Generated/Tokens.swift` có chữ bài trong comment (4 chuỗi, như ios-dev đã báo). Đề xuất bỏ khỏi `description` của token hoặc loại `Generated/` khỏi phép grep.
- **L6 · Nhỏ (nội dung):** gợi ý q5 ("Thường có trong cá, thịt, trứng và các loại đậu") gần như đọc ra đáp án; thuộc content-editor.
- **L7 · Nhỏ (test):** audit cho qua mọi "Dynamic Type partially unsupported" và mọi contrast ở ô trống, nên test này không bắt hồi quy về hai loại đó.
- **L8 · Nhỏ:** thanh yêu cầu ở màn Chơi xuống dòng giữa "Đồ / ngọt: nên ăn ít" (ảnh `iphone-16-pro-10-play-sweets.png`).

### Duy kiểm tay
1. VoiceOver máy thật, đi hết 6 màn bài 1: mỗi lựa chọn đọc nhãn EN, hình món đọc `alt`, thanh nhóm ở màn Chơi, ô trống "?" ở câu điền, thẻ lật ở Thưởng.
2. Bật Cài đặt > Trợ năng > Chuyển động > Giảm chuyển động, chơi trọn bài: không giấy vụn rơi, thẻ lật không xoay, mọi thứ vẫn bấm được.
3. Chơi mâm cơm bằng tay: chạm Cơm → Cá kho → Rau muống → Kẹo → Trứng (bị từ chối) → bỏ lần lượt; kiểm 7 lời nhắn đúng bảng ở Kết quả (ios-dev).
4. Dừng giữa bài: vào bài, làm tới câu 3, vuốt tắt app; mở lại phải ra câu 3. Rồi bấm nút X ở câu 2: mở app ra Trang chủ, vào bài thì về câu 2 (xác nhận cách hai hành vi này theo câu hỏi 2 của ios-dev).
5. Cảm nhận bé: độ khó đọc chữ lớn nhất ở Thưởng (Dynamic Type), nút ≥ 56pt có dễ chạm với ngón trẻ 7–9 tuổi, giấy vụn rơi có gây rối.
6. Đặt ảnh 6 màn cạnh canvas `Discoverer-Warmup/Learn/Play/Quiz/QuizMyth/Reward` trên iPhone 16 và 16e (tôi chưa làm).

### Đã sửa ở SK-022 (ios-dev, 29/10)
- **L2:** `AttemptStore.history()` gặp `history.json` hỏng thì đổi tên file thành `history.json.corrupt-<giờ UTC>` (có log) rồi trả `[]`. Lần `append` sau ghi file mới, bản hỏng vẫn còn.
- Test `LessonSessionTests.brokenHistoryIsKeptAside`.
- Hàng đợi gửi server (`sync/queue.json`) giữ bản riêng của từng attempt, nên attempt đã vào hàng đợi vẫn lên server dù lịch sử hỏng. Attempt chưa kịp vào hàng đợi thì chỉ còn trong bản `.corrupt-`, phải xử lý tay.
- Chi tiết ở SK-022 "Kết quả (ios-dev)".

**Đã sửa ở SK-013 (ios-dev, 29/10):** L1, L3, L4, L8. Chi tiết ở SK-013 "Kết quả (ios-dev)". L1 có thêm chẩn đoán, đã pass 1 lần trên iPad Pro 11 nhưng chưa chạy lặp trên iPad 13. L3 chưa có ảnh mới.
