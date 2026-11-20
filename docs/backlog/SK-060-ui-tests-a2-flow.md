# SK-060 · UI test iOS theo luồng bài A2 (sửa 23 test fail ngày 19/11)

Trạng thái: review · Ngày: 2026-11-20 · Phụ trách: tester · Tester: tester
Nguồn: lượt chạy cả bộ UI test 19/11 trên iPhone 16 (27 pass, 23 fail, 6 skip); SK-043 (màn bài hướng A2), SK-044 (phản hồi đáp án), SK-047 (gợi ý, Tổng kết), SK-059 (kệ Chơi: chạm xem to, kéo để chọn)

## Mục tiêu
Tester giữ bộ UI test iOS khớp với app hiện tại, để một lượt chạy trên iPhone 16 xanh hoặc mỗi fail còn lại chỉ ra một lỗi thật đã ghi ở đây.

## Phạm vi / Ngoài phạm vi
Phạm vi: chỉ thư mục `apps/ios/ScienceKidsUITests/` và ticket này.
- `LessonUITests`, `AudioUITests`, `IPadLayoutUITests`, `SyncUITests` còn chạy luồng Discoverer trước SK-043: màn tiêu đề `lesson.title`, nút "Kiểm tra" cho mọi câu, `lesson.option.*`, `lesson.word.*`, `lesson.result.title`, "Thử lại" (`lesson.retry`), Học có `lesson.learn.seen` và chip nhóm, Thưởng ngay sau câu cuối.
- `OnboardingUITests`: số chủ đề và "chủ đề chưa viết" viết cứng (Explorer 13 chủ đề, chưa có bài; `new-weather` chưa viết), `lesson.title`; một lỗi tương phản ở tab Thẻ và Huy hiệu.
- `SK047FlowUITests.testClosingAtRecapKeepsTheLesson`: không thấy chủ đề `new-breathing` trên Trang chủ sau khi mở lại app.

Ngoài phạm vi: sửa code app (lỗi thật ghi ở mục "Lỗi app tìm thấy" để ios-dev làm).

## Tiêu chí nghiệm thu
- [x] Chạy cả bộ `ScienceKidsUITests` một lần trên iPhone 16 (máy `8620A918…` không còn; chạy trên `3E0435D8…`, 20/11): không còn fail vì identifier hay luồng cũ (3 fail còn lại đều là lỗi app, xem dưới).
- [x] Mỗi fail còn lại có dòng ở "Lỗi app tìm thấy" với bước tái hiện (lỗi 7, 8, 9 và ghi chú lỗi 4).
- [x] Không test nào bị xoá hay nới để che một lỗi thật; chỗ nào bỏ hẳn một kiểm tra vì màn đã đổi theo thiết kế thì ghi ở "Quyết định đã ghi".

## Đã làm (tester, 19/11)

Helper chung `A2Lesson` trong `LessonFixture.swift`, một chỗ cho identifier và thứ tự màn A2:
- Bài mở thẳng vào câu Khởi động 1 (mốc `lesson.progress`, không còn màn tiêu đề). `LessonFixture.open` mặc định chờ `lesson.progress`.
- Trả lời: `lesson.choice.*`, `lesson.bank.*`, `lesson.tf.*`; chạm là trả lời, chỉ chọn nhiều có nút "Xong" (`lesson.check`).
- Sai còn lượt: phiếu gấp `lesson.hint` (feedback hoặc gợi ý); không có "Thử lại", bé trả lời lại, thẻ đã thử không chạm được.
- Đúng hoặc hết lượt: tờ kết quả `lesson.result.explanation`, `lesson.result.xp` (câu Quiz đúng lần 1), mũi tên `lesson.result.next`.
- Học là sách tranh: `lesson.learn.page`, mũi tên `lesson.explorer.next` lật trang rồi sang Chơi.
- Sau câu Quiz cuối: Tổng kết 2 trang (`lesson.recap.next`, `lesson.recap.to_reward`) rồi Thưởng.
- Số câu đọc ở `lesson.progress`: "Câu 3 trên 6" (trước là `lesson.quiz.counter` "Câu 3/6"). Điểm ở Thưởng: "Đúng 6 trên 6 câu".

Theo từng file:
- `LessonUITests`: các helper dùng `A2Lesson`; 4/6 kiểm phiếu gợi ý (EN trong Song ngữ) và lời giải thích sai, không XP; đóng giữa bài kiểm từ đã thử của q2 còn "Chưa đúng"; audit Học trên trang 1 và trang "Từ mới" (bỏ hàm cuộn thẻ Từ mới lên trên thanh dưới, màn đó không còn); thêm audit Tổng kết; ô trống q2 sau lần sai được làm trống lại (A2), dấu của từ theo lượt.
- `AudioUITests`: ID lời đọc mới. Chạm đáp án đọc `answer.<câu>.<lượt>` (tên rồi lời mascot trong một câu); loa của phiếu là `retry.<câu>`; trang Học `learn.explore.<nhóm>`; nút "Gợi ý" đọc `hint.<câu>`; Tổng kết tự đọc `recap.*`; Thưởng chỉ còn loa `reward.card` (tên và fact, thẻ không lật nữa).
- `IPadLayoutUITests`: luồng mới; thẻ đáp án Quiz cao 136 trên iPhone, 200 trên iPad (`DiscovererMetrics`); ô kệ 96–132 trên iPhone (`PlayShelf.compactCell…`, SK-059), ≥124 trên iPad; "Từ mới" ≥ 56 kiểm trên trang cuối của sách; thêm khung giấy cho Tổng kết.
- `SyncUITests`: luồng mới, đi qua Tổng kết rồi Thưởng.
- `OnboardingUITests`: số chủ đề mỗi nhóm và chủ đề Discoverer đầu tiên chưa có bài đọc từ `content/syllabus.json`; Lớp 1 (Explorer có bài) không còn dòng "học thử Discoverer", Lớp 5 (Scientist) có; Explorer có thẻ "Học tiếp" khi syllabus có bài Explorer; bài mở kiểm bằng `lesson.progress`.
- `SK047FlowUITests`: thông báo fail của `openTopic` in màn đang hiện.

Sửa thêm sau lượt chạy 1:
- `LessonUITests.testSevenTrayMessages`: khay rỗng in `prompt` của khối Chơi ("Build a balanced meal", A2 `play-start`), không còn `messages.start`; fixture đọc thêm `prompt`.
- `AudioUITests`: câu đúng/sai chỉ 1 lượt (`rules.json` `max_tries_by_format.true_false = 1`), chạm đúng đọc `answer.<câu>.1`; loa bong bóng Chơi tìm theo `lesson.play.message` (xem lỗi 5); phiếu gợi ý không có loa riêng (nút "Gợi ý" đã đọc), chỉ kiểm phiếu hiện.
- `AudioUITests.testBothPlaysEnglishThenVietnamesePerString`: theo SK-042 (Duy 13/11) "Cả hai" tự đọc và loa chính đọc EN; VI chỉ ở nút "VI". Kiểm EN, EN tự đọc; loa chính EN, EN; nút VI đọc VI, VI.
- `SK047FlowUITests.testClosingAtRecapKeepsTheLesson`: lần mở đầu chạy `-SKResetProfile`. Trước đó test `dat-va-nuoc-tren-trai-dat` của cùng lớp để lại một bài dở, app (đúng B7.6) mở lại bài đó khi khởi động thay vì Trang chủ.
- `SyncUITests.testProfileAndLessonReachTheServer`: phiên khách còn trong Keychain sau `-SKResetProfile` nên hồ sơ được "adopted" với lượt học của các lần chạy trước (server 9 sao, 10 lượt). Server trống: sao server = sao Thưởng như cũ; đã có lượt: sao server không giảm và tăng không quá số sao bài này.

## Kết quả chạy

Tất cả trên iPhone 16 `8620A918…`, 19/11.

| Lượt | Phạm vi | Pass | Fail | Skip |
| --- | --- | --- | --- | --- |
| Trước SK-060 | cả bộ | 27 | 23 | 6 |
| 1 | cả bộ `ScienceKidsUITests` | 41 | 9 | 6 |
| 2 | 9 test fail của lượt 1 | 4 | 5 | 0 |
| 3–6 | 2 test đi cả bài có âm thanh (EN, VI), sau từng lần sửa | lượt 6: 1 | 1 | 0 |

Lượt 6: `testEveryListenButtonAndWordSpeaksEnglish` pass (30 lần bấm loa, 37 từ, 16 lần tự đọc, 134 clip, 0 clip lỗi, không bao giờ 2 giọng cùng lúc). `testEveryListenButtonAndWordSpeaksVietnamese` fail ở Khởi động 1, xem lỗi 6; ở lượt 5 cùng bước này qua được (bài đi tới Quiz q1).
Lượt 5 bản EN dừng vì runner (`Mach error -308 server died`), không phải app.

Còn fail, mỗi cái là một lỗi app ở mục dưới:
- `LessonUITests.testEveryButtonIsAtLeast56ptAndLabelled` → lỗi 1.
- `LessonUITests.testAccessibilityAudit` → lỗi 2, 3.
- `OnboardingUITests.testCollectionTabsStartEmpty` → lỗi 4.
- `AudioUITests.testEveryListenButtonAndWordSpeaksVietnamese` → lỗi 6 (chập chờn).

6 skip giữ nguyên lý do cũ (cần biến môi trường hoặc máy khác: ảnh chụp, iPad).

## Kết quả chạy lại (20/11)

Một lượt, một máy: iPhone 16 `3E0435D8-0B03-460B-B11D-6C953E81D0EA` (iOS 18.3). Không mở máy nào khác; iPhone 16 Pro của Duy đang bật, không đụng tới. Máy đã `shutdown` sau khi chạy.

```sh
cd apps/ios && ./bootstrap.sh
TEST_RUNNER_SK_CONTRAST_SHOT_DIR=<scratchpad>/shots xcodebuild test \
  -project ScienceKids.xcodeproj -scheme ScienceKids \
  -destination 'platform=iOS Simulator,id=3E0435D8-0B03-460B-B11D-6C953E81D0EA' \
  -only-testing:ScienceKidsUITests
```

**57 test: 47 pass · 3 fail · 7 skip** (80 phút). `** TEST FAILED **` vì 3 fail dưới đây, mỗi cái là một lỗi app.
7 skip = 6 skip cũ (cần biến môi trường hoặc iPad) + `SK061SkyRunUITests.testSkyTopicRun` (chỉ chạy khi có `SK_SHOT_DIR`).

| Lỗi | Test | Kết quả |
| --- | --- | --- |
| 1 thẻ từ 42pt | `LessonUITests.testEveryButtonIsAtLeast56ptAndLabelled` | **đóng** phần thẻ `lesson.bank.*` (Khởi động 1, 2 và phiếu gợi ý qua hết); test vẫn **fail** ở màn Chơi vì một nút khác → lỗi 7 |
| 2 chữ trên màu nhóm | `LessonUITests.testAccessibilityAudit` | **đóng** ở sách Học (trang 1 và "Từ mới" sạch); Chơi **vẫn báo** contrast `'Carbohydrates'` → lỗi 9, có ảnh |
| 3 chỉ số trang | `LessonUITests.testAccessibilityAudit` | **đóng** ở Học (`lesson.learn.page` hết "vùng chạm quá nhỏ"); Tổng kết còn `lesson.recap.page` → lỗi 8 |
| 4 chữ sát thanh tab | `OnboardingUITests.testCollectionTabsStartEmpty` | **đo đạt**: cuộn hết tab Thẻ cách mép trên thanh tab **38,0 pt**, tab Huy hiệu **48,0 pt** (yêu cầu ≥ 16). Audit vẫn fail, xem ghi chú dưới |
| 5 id loa bong bóng Chơi | `AudioUITests` (6/6 pass) | **đóng** |
| 6 chạm đáp án không phát lời (VI) | `AudioUITests.testEveryListenButtonAndWordSpeaksVietnamese` | **pass** lượt này (510 s, không probe lỗi) — chập chờn, chưa tái hiện; không có dòng `requested`/`interrupted` để phân biệt (a)/(b) |

Ba test fail:
- `LessonUITests.testEveryButtonIsAtLeast56ptAndLabelled` — `LessonUITests.swift:327`: `play: 'Nghe tiếng Việt' is 28.0 tall` → lỗi 7.
- `LessonUITests.testAccessibilityAudit` — `LessonUITests.swift:433`, 2 dòng: `audit[play]: Contrast failed · 48 'Carbohydrates' (257.3, 327.0, 110.7, 56.0)` (lỗi 9) và `audit[recap]: Hit area is too small · 1 'Trang 1 trên 2' (177.7, 725.0, 38.0, 10.0)` (lỗi 8).
- `OnboardingUITests.testCollectionTabsStartEmpty` — `OnboardingUITests.swift:301`, 3 dòng contrast, cả ba đều là chữ đang trượt **dưới** thanh tab ở vị trí cuộn đầu: Thẻ `'Khủng long và Trái Đất thời xa xưa'` (y 728,7–745,3), Huy hiệu `'0/4'` (y 745,2) và `'Năng lượng và lực làm gì?'` (y 769,3). Mép trên giấy của thanh tab đo được **y = 738**.

**Ghi chú lỗi 4 (cần quyết định).** Phần margin của ios-dev đúng: cuộn tới cuối, phần tử cuối dừng 38 pt (Thẻ) và 48 pt (Huy hiệu) trên mép giấy — không cần đổi sang `navStripHeight + s16`. Cái còn lại là đúng cảnh báo của ios-dev: audit chạy ở vị trí cuộn đầu, lúc đó hàng cuối vẫn trượt dưới tờ giấy đặc (đúng style E) nên audit đo nền giấy + bóng `drop_sheet_up` và báo contrast. Hai lối ra, cần PM/designer chốt vì "Quyết định đã ghi" cấm thêm ngoại lệ audit cho lỗi 2–4:
  (a) test: bỏ qua contrast của phần tử có `maxY > navStripHeight` (chữ bé không nhìn thấy vì bị giấy che) — hẹp, nhưng có thể che lỗi thật đúng dải đó;
  (b) app: nội dung nằm dưới thanh tab thì ẩn khỏi trợ năng (`accessibilityHidden` theo vị trí cuộn) — đúng hơn cho VoiceOver nhưng tốn công.
  Trước khi chốt, em để fail.

### Tester đã sửa trong `apps/ios/ScienceKidsUITests/` (20/11)
- `OnboardingUITests.bottomGapProblem` + gọi trong `testCollectionTabsStartEmpty`: cuộn tab Thẻ và Huy hiệu tới cuối (so khung tới khi đứng yên), lấy phần tử thấp nhất của trang (bỏ nút `tab.*` và nhãn thanh tab), đo khoảng cách tới mép trên giấy (`min(minY) của tab.* − navPadding.top 14`), in ra và báo lỗi nếu < 16; cuộn trả về đầu trang. Đây là phép đo ios-dev nhờ.
- `LessonUITests.saveContrastShot`: mỗi lỗi contrast còn lại của audit lưu ảnh phần tử + ảnh màn hình vào result bundle, và vào `SK_CONTRAST_SHOT_DIR` nếu có (biến riêng, không bật các test ảnh đang skip).

## Lỗi app tìm thấy

Cho ios-dev (lỗi 2, 4, 9 cần designer xem màu).

1. **Thẻ từ của câu điền chỗ trống cao 42pt (< 56pt).** Mở bài `thuc-an-cho-ta-nhung-gi` (Lớp 3) → Khởi động 1 (fill_blank, từ không có hình): mỗi thẻ `lesson.bank.*` ("air", "sweets"…) cao 42pt. Quy tắc nút ≥ 56pt (B7.8). `DiscovererQuestionStep.swift` khoảng dòng 645: thẻ chỉ có `padding(s8)` quanh chữ, không có `minHeight`. Đề xuất: `.frame(minHeight: ageGroup.touchTarget)`.
2. **Tương phản tên nhóm "Carbohydrates" không đạt** (audit `contrast failed`) trên trang 1 sách Học và lại ở Chơi (ô nhóm trên kệ): chữ (13, 133, 122×33) trên nền màu nhóm. Tái hiện: `LessonUITests.testAccessibilityAudit`. Cần designer chọn màu chữ/nền nhóm đạt 4.5:1.
3. **Chỉ số trang sách Học bị audit báo "vùng chạm quá nhỏ"**: phần tử `lesson.learn.page` ("Trang 1 trên 5", 116×15, kiểu Other) là phần tử VoiceOver gom từ chấm trang + "1/5" nhưng không phải nút. Đề xuất: thêm trait `.isStaticText` (hoặc `.updatesFrequently`) để không bị coi là điều khiển, hoặc cho khung cao ≥ 44.
4. **Tab Thẻ và Huy hiệu: chữ sát thanh tab dưới không đạt tương phản**: hồ sơ mới → tab "Thẻ": tên chủ đề cuối màn ("Khủng long và Trái Đất thời xa xưa", y≈729) và nhãn tab "Thẻ" (y=752); tab "Huy hiệu": "0/4" (y≈745), "Năng lượng và lực làm gì?" (y≈769), nhãn tab "Huy hiệu". Các chữ này nằm dưới/sát lớp mờ của thanh tab, audit đo nền mờ nên tương phản rớt. Đề xuất: thêm khoảng đệm dưới cuộn bằng chiều cao thanh tab, và kiểm màu nhãn tab đang chọn.
5. **Nút loa bong bóng Chơi mất id riêng** (nhẹ, không ảnh hưởng bé): `PlayStep.swift` đặt `.accessibilityIdentifier("lesson.play.message")` lên cả hàng, đè id `lesson.explorer.listen` của nút loa và `listen.vi.play.message` của nút VI trong `PlayBubbleRow`. Test hiện tìm loa theo `lesson.play.message`. Đề xuất: đặt id lên khung chữ thay vì cả hàng.
6. **Chập chờn: chạm đáp án đầu tiên không phát lời (giọng VI).** Hồ sơ giọng `vi` → bài `thuc-an-cho-ta-nhung-gi` → Khởi động 1 tự đọc câu hỏi, bấm loa câu hỏi (đọc hết), rồi chạm từ sai `lesson.bank.w1_toys`: không có `answer.w1.1` nào vang lên trong 10 s (probe: chỉ `question.w1` ×2, không clip lỗi). Lượt trước cùng bước đã đọc đúng. Chưa rõ chạm bị bỏ (thẻ chưa nhận chạm sau khi loa dừng) hay lời bị bỏ qua; ios-dev xem log `debug.audio` trong `ui6.xcresult` của tester hoặc chạy lại test để tái hiện.

7. **Nút "VI" của bong bóng Chơi cao 28pt (< 56pt).** Hồ sơ Song ngữ → bài `thuc-an-cho-ta-nhung-gi` → bước Chơi: nút `listen.vi.play.message` ("Nghe tiếng Việt") là 56 × 28 trên iPhone (72 × 36 ở bố cục rộng). Tái hiện: `LessonUITests.testEveryButtonIsAtLeast56ptAndLabelled`, `play: 'Nghe tiếng Việt' is 28.0 tall`. `PlayParts.swift` dòng 51 và 57 (`PlayLayout … vi: CGSize(width: 56, height: 28)`) và dòng ~145 (`.frame(width: layout.vi.width, height: layout.vi.height)`): không có sàn vùng chạm. Bản dùng chung `SecondVoiceButton` (`LessonSpeech.swift` dòng ~390) làm đúng: khung hiển thị nhỏ nhưng bọc `.frame(minWidth: ageGroup.touchTarget, minHeight: ageGroup.touchTarget)` + `.contentShape(Rectangle())`. Đề xuất: bọc nút VI của `PlayBubbleRow` y như vậy (giữ hình 56 × 28, vùng chạm 56 × 56). Lượt 19/11 chưa thấy vì test dừng sớm ở lỗi 1.
8. **Chỉ số trang Tổng kết bị audit báo "vùng chạm quá nhỏ"** — như lỗi 3 nhưng ở `RecapStep`: `lesson.recap.page` ("Trang 1 trên 2", 38 × 10, kiểu Other). `RecapPageBar` (`RecapStep.swift` dòng 788–804) không có `.accessibilityAddTraits(.isStaticText)` mà `PageBar` đã thêm. Tái hiện: `LessonUITests.testAccessibilityAudit`, dòng `audit[recap]`.
9. **Chip nhóm ở Chơi: tên nhóm ngắt giữa từ và audit contrast vẫn báo.** Tái hiện: `LessonUITests.testAccessibilityAudit`, `audit[play]: Contrast failed · 48 'Carbohydrates' (257.3, 327.0, 110.7, 56.0)`; cùng chỗ, `'Vegetables and fruit'` bị `Text clipped`. Ảnh (theo yêu cầu designer 20/11, cũng nằm trong result bundle của lượt chạy):
   - phần tử: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/931ba545-9527-406d-9b10-046d41a12137/scratchpad/shots/contrast-play-Carbohydrates.png`
   - cả màn: `…/scratchpad/shots/contrast-play-Carbohydrates-screen.png`
   Ảnh cho thấy chip đã là **chữ than tre trên giấy** (đúng sửa của lỗi 2, không còn giấy trên vàng hoè), nhưng chữ tràn sát mép phải và **xuống dòng giữa từ: "Carbohydr / ates"** — trái luật nhãn SK-047 (`WordFitText`: một từ một dòng, không ngắt giữa từ). Hai việc cho ios-dev/designer: (a) chip nhóm Chơi (`PlayStep.explorerChip`) dùng `WordFitText` / bề rộng ở `LabelWidths` như các nhãn khác; (b) xem lại vì sao audit vẫn báo contrast cho đúng chip này trong khi than tre trên giấy là 15,89:1 — nghi do chữ bị cắt ở mép chip nên mẫu đo lẫn nền ngoài chip. Lượt này audit không in bộ màu nên không đối chiếu được với `(13,133,122)` của lượt 19/11.

## Ghi chú designer (lỗi 2, 4)

Tỉ lệ WCAG 2.1 tính bằng script từ mã hex (designer 20/11). Ngưỡng 4.5:1.

**Lỗi 2: chữ trên màu nhóm.** Nguyên nhân: `PaperTag(.cut(fill:))` luôn tô chữ `Role.textOnAccent` (giấy). Nhóm "Carbohydrates" màu `vang_hoe`: giấy trên vàng hoè chỉ 2.02:1. Canvas (`options/lesson-less-text/Explorer-A.html`, `Discoverer-A2.html`) vốn vẽ chữ than tre trên vàng hoè; app lệch canvas.
- Token mới `color.role.text_on_content.<ColorToken>` → Swift `Tokens.Role.TextOnContent.*` (đã xuất, `npm run check:swift` khớp):

  | Màu nội dung | Chữ | Tỉ lệ |
  | --- | --- | --- |
  | `vang_hoe` `#E2A52A` | `than_tre` `#1E1B18` | 7.88 |
  | `do_son` `#A93A27` | `giay` `#FBF6EA` | 5.86 |
  | `gi_dong` `#3B6E6A` | `giay` | 5.37 |
  | `cham` `#2E4A6E` | `giay` | 8.39 |
  | `nau_dat` `#8A5E3B` | `giay` | 5.20 |
  | tên lạ (fallback `surface_inactive`) | `text_primary` | 11.68 |

  Năm màu trên là toàn bộ màu `color` có trong `content/` (grep 20/11).
- Áp vào: (1) `ColorToken` thêm `var textColor` cạnh `var color` (`LessonParts.swift`) trả `Tokens.Role.TextOnContent.*`; (2) `PaperTag.Style.cut` nhận thêm màu chữ (`cut(fill:, text: = Tokens.Role.textOnAccent, eyebrow:)`), hai chỗ `ExplorerLearnStep.swift` dòng 139 và 242 truyền `group.color.textColor`; (3) chip nhóm Chơi `PlayStep.explorerChip`: dấu tích trên chấm nhóm dùng `group.color.textColor` thay `textOnAccent` (tích giấy trên chấm vàng hoè 2.02:1, dưới mức 3:1 cho icon). Chữ tên nhóm trên chip đã đạt: than tre trên giấy 15.89, giấy trên lá tre 4.82; nếu audit Chơi vẫn báo sau sửa (1)–(3) thì gửi lại ảnh chụp phần tử, màu đo `(13,133,122)` không thuộc bảng màu style E nên có thể là mẫu đo lúc chip đang hiện dần.
- `WorldCard` (Hồ sơ) dùng màu thế giới gỉ đồng, đỏ son, chàm với chữ giấy: đều đạt, không đổi.

**Lỗi 4: chữ sát thanh tab.** Thanh tab là giấy sáng đặc, không mờ; chữ rớt tương phản vì (a) phần tử cuộn nằm dưới mép xé (cao tới 6pt) và bóng `drop_sheet_up` (lệch -3, mờ 4: phủ khoảng 7pt phía trên mép), và (b) trên iOS 26 `ScrollView` tự thêm lớp mờ cạnh dưới (scroll edge effect) dưới `safeAreaInset`. Nền điệp dưới bóng ≈ `#CFC0A7`: than tre 9.59 đạt, nhưng chữ phụ 5.39, gỉ đồng 3.24, đỏ son 3.54, còn qua lớp mờ thì không đo được.
- Chiều cao thanh tab trên iPhone = `navPadding.top` 14 + `navItemMinHeight` 58 + `navPadding.bottom` 8 = **80pt** (cộng vùng home indicator, đã nằm trong safe area). Đề xuất thêm `PaperMetrics.navStripHeight = 80` để không ghi số trần.
- Vùng cuộn của `CollectionPage` (tab Thẻ, Huy hiệu, Từ vựng): khi cuộn tới cuối, phần tử cuối dừng cách mép trên thanh tab ít nhất `Tokens.Space.s16` (lớn hơn 6pt mép xé + 7pt bóng). Nếu `safeAreaInset` của `HomeScreen` đã đẩy nội dung lên 80pt thì chỉ thêm `.contentMargins(.bottom, Tokens.Space.s16, for: .scrollContent)`; nếu inset không tới `ScrollView` (kiểm bằng frame phần tử cuối ở hồ sơ mới) thì margin là `navStripHeight + s16` = 96.
- Tắt lớp mờ cạnh dưới: `if #available(iOS 26, *) { .scrollEdgeEffectHidden(true, for: .bottom) }` trên `ScrollView` của `PaperFrame(scrolls: true)` (style E không có gradient hay mờ; nội dung trượt dưới tờ giấy đặc như mép trên đã làm với dải điệp).
- Nhãn tab, đo trên `surface_paper`: đang chọn `text_primary` 15.89, chưa chọn `text_secondary` 8.93, icon than tre trên chip vàng hoè 7.88. Đều đạt, **không đổi màu**. Chip vàng hoè so với giấy chỉ 2.02 nhưng tab đang chọn còn có trait `.isSelected`, bóng `paper_2` và chữ đậm màu hơn, nên không chỉ dựa vào màu.

File designer đã đổi: `packages/design-tokens/tokens.json` (thêm `color.role.text_on_content`), `packages/design-tokens/README.md` (bảng tương phản), `apps/ios/Packages/SKKit/Sources/DesignSystem/Generated/Tokens.swift` (sinh bằng `npm run export:swift`). Canvas không đổi.

## Ghi chú ios-dev (lỗi 1–6, 20/11)

Phạm vi lượt này: lỗi 1, 3, 5, 6, rồi lỗi 2 và 4 theo spec designer. Chưa chạy UI test (tester chạy cả bộ).

- **Lỗi 1 (thẻ từ 42pt):** `DiscovererQuestionStep.bankCards`: thẻ `lesson.bank.*` thêm `.frame(maxWidth: .infinity, minHeight: ageGroup.touchTarget)` (56 Discoverer, không co trên iPad).
- **Lỗi 2 (chữ trên màu nhóm):** `ColorToken.textColor` (`LessonParts.swift`) trả `Tokens.Role.TextOnContent.*`, tên lạ → `textPrimary`. `PaperTag.Style.cut(fill:text:eyebrow:)`, `text` mặc định `textOnAccent` (các chỗ khác không đổi). Hai tag nhóm ở `ExplorerLearnStep` (dòng 139, 242) truyền `group.color.textColor`; dấu tích trên chấm nhóm ở chip Chơi (`PlayStep.explorerChip`) dùng `group.color.textColor`. Màu đo `(13,133,122)` của audit Chơi chưa đối chiếu được; tester gửi lại ảnh phần tử nếu còn báo.
- **Lỗi 3 (chỉ số trang):** `PageBar` (`PictureBookParts.swift`) thêm trait `.isStaticText` cho phần tử `lesson.learn.page`. Chưa kiểm bằng audit (UI test).
- **Lỗi 4 (chữ sát thanh tab):** `PaperMetrics.navStripHeight` = `navPadding.top + navItemMinHeight + navPadding.bottom` = 80. Theo code, `safeAreaInset` của `HomeScreen` có tới `ScrollView` của `PaperFrame` (ScrollView không bỏ qua safe area, chỉ nền mới bỏ qua), nên `CollectionPage` chỉ thêm `.contentMargins(.bottom, Tokens.Space.s16, for: .scrollContent)`, không phải 96. Chưa đo frame phần tử cuối trên máy: tester đo khi chạy UI test (cuộn hết tab Thẻ và Huy hiệu ở hồ sơ mới, phần tử cuối có `maxY` ≤ mép trên thanh tab − 16). Nếu không đạt thì đổi margin thành `navStripHeight + s16`. `PaperFrame(scrolls: true)` gọi `hidingBottomScrollEdgeEffect()`: `scrollEdgeEffectHidden(true, for: .bottom)` khi iOS 26, bọc trong `#if compiler(>=6.2)` vì SDK của Xcode 16.3 chưa có API này; build bằng Xcode 16.3 thì modifier không làm gì. Lưu ý: audit chạy ở vị trí cuộn đầu (chưa cuộn tới cuối) thì chữ đang trượt dưới thanh tab vẫn có thể bị đo; lúc đó cần xem lại cách audit chứ margin không giải quyết được.
- **Lỗi 5 (id bong bóng Chơi):** `PlayBubbleRow` nhận `bubbleIdentifier` (mặc định `lesson.explorer.bubble`), đặt lên khung chữ. Chơi truyền `lesson.play.message` cho lời nhắn và `lesson.play.hint` cho gợi ý; bỏ id đặt trên cả hàng. Loa giữ `lesson.explorer.listen`, nút VI giữ `listen.vi.play.message`. `AudioUITests`: hai chỗ bấm loa bong bóng đổi sang `lesson.explorer.listen`. Các test khác chờ `lesson.play.message` vẫn tìm thấy (giờ là nút bong bóng, `label` là câu nhắn nên `LessonUITests.testSevenTrayMessages` vẫn so được).
- **Lỗi 6 (chạm đáp án không phát lời):** chưa tìm ra nguyên nhân chắc chắn.
  - Bằng chứng từ `ui6.xcresult` (scratchpad tester): chạm `lesson.bank.w1_toys` lúc t=28.04s, khoảng lúc `question.w1` (lần bấm loa ở t=24.2s) đọc xong. Probe sau 10s: `speaking -`, `sounded` chỉ có 2 lần `question.w1`, `finished` 1, `failed` rỗng. Nếu `answer()` có gọi `speech.play` với utterance khác rỗng thì phải có một trong các dấu vết: `sounded` có `answer.w1.1`, `failed` có clip, `speaking` còn `answer.w1.1` (đang tải), hoặc id nằm trong `interrupted`. Ba dấu vết đầu đều không có. Dấu vết thứ tư không xem được vì thông báo lỗi của test không in `interrupted` và `requested`. Video quay màn trong xcresult dừng trước lúc chạm (ảnh cuối vẫn là w1 chưa trả lời), nên không biết thẻ có đổi trạng thái hay không.
  - Đã loại trừ: `LessonSession.submit` không có điều kiện thời gian hay ngẫu nhiên (vector chấm thuần). Màn câu hỏi Discoverer không đọc `speech.speaking`, nên lúc loa dừng màn không vẽ lại, bố cục không xê dịch. `isEditing` chỉ phụ thuộc `naming` và trạng thái câu. Thẻ chỉ `.disabled` khi đã thử.
  - Giả thuyết còn lại: (a) chạm bị bỏ trước khi tới `Button`, chưa rõ cơ chế, cần `requested` để xác nhận; (b) một lệnh `play`/`autoplay` với utterance rỗng chen vào, vì `SpeechPlayer.start` gọi `interrupt()` trước khi kiểm rỗng. Chưa tìm thấy chỗ nào gọi như vậy trên màn này.
  - Lỗi thật đã sửa, cùng thời điểm "loa vừa dừng": `AVClipBackend` giữ player theo `ObjectIdentifier`. Delegate báo hết clip được chuyển về main actor sau một nhịp. Nếu trong nhịp đó bé chạm và lời đáp đã được tải sẵn, player cũ đã bị giải phóng và player mới có thể nằm đúng địa chỉ cũ. Khi đó "ended" đến muộn xoá player mới (lời câm giữa chừng) và gọi `onFinish` của nó. Sửa bằng `ClipSlots`: lời báo muộn mang chính object player (giữ sống tới lúc báo) và chỉ kết thúc ô nào giữ đúng object đó. `onFinish` được gọi sau khi cập nhật ô, vì gọi bên trong làm app crash (truy cập đồng thời, bắt được ở lượt unit test đầu). Lỗi này cho dấu vết khác với probe của tester (`sounded` sẽ có `answer.w1.1`), nên có thể không phải lỗi tester gặp.
  - Để lần sau phân biệt được: thông báo probe trong `AudioUITests` in thêm `requested` và `interrupted`. Nếu fail lại mà `requested` không tăng thì chạm bị bỏ (giả thuyết a). Nếu `requested` tăng và `answer.w1.1` nằm trong `interrupted` thì có lệnh khác chen vào (giả thuyết b).
  - Unit test: `ClipSlotsTests` (3 test: báo hết một lần; báo muộn của player đã dừng không động tới player mới; `onFinish` chạy được lệnh phát clip kế).
- **Test vector token:** `TokensExportTests` đếm 184 lá (thêm 5 `role.text_on_content.*` của designer); trước đó cố định 179 nên fail ở lượt chạy đầu.

Kết quả unit test, `device: iPhone 16` (`3E0435D8…`, iOS 18.3; máy `8620A918…` của tester không còn trong danh sách simulator), `-skip-testing:ScienceKidsUITests`:
- Lượt 1: 1 fail `TokensExportTests` (179 ≠ 184); app host crash "Fatal access conflict" ở `ClipSlots.ended`, do chính lần sửa lỗi 6 gây ra. Đã sửa cả hai.
- Lượt 2, sau khi sửa: `** TEST EXECUTE SUCCEEDED **`, 9 bundle, 439 test pass (95 + 61 + 28 + 19 + 51 + 125 + 20 + 22 + 18), 0 fail. Chạy lại vì lượt 1 làm lộ lỗi do chính em gây ra, không phải chạy lặp chờ qua.
- iPhone 16 đã tắt sau khi chạy; không động tới iPhone 16 Pro.

Tester cần kiểm (UI test, cả bộ): lỗi 1 `testEveryButtonIsAtLeast56ptAndLabelled`; lỗi 2 và 3 `testAccessibilityAudit`; lỗi 4 `OnboardingUITests.testCollectionTabsStartEmpty` và đo phần tử cuối như trên; lỗi 5 `AudioUITests` (loa bong bóng); lỗi 6 `testEveryListenButtonAndWordSpeaksVietnamese`, nếu còn fail thì gửi dòng probe có `requested` và `interrupted`.

## Ghi chú ios-dev (lỗi 7–9 và lỗi 4 cách a, 20/11)

- **Lỗi 7:** nút "VI" trong `PlayBubbleRow` (`PlayParts.swift`) giữ hình 56 × 28, thêm vùng chạm `.frame(minWidth: ageGroup.touchTarget, minHeight: ageGroup.touchTarget, alignment: .top)` + `.contentShape(Rectangle())`, giống `SecondVoiceButton`. Canh trên để hình vẫn nằm sát dưới loa.
- **Lỗi 8:** `RecapPageBar` (`RecapStep.swift`) thêm `.accessibilityAddTraits(.isStaticText)`.
- **Lỗi 9:** chip nhóm Chơi khi chia đều 3 cột (`PlayStep.explorerChip`, `even`) dùng `WordFitText` (`maxLines: 2`, `fixedBox: false`, canh trái, bề rộng đo theo khung). Không còn ngắt giữa từ: "Vegetables / and fruit" xuống dòng ở dấu cách, "Carbohydrates" ở một dòng và thu nhỏ cho vừa. Chip không chia đều giữ `Text` một dòng như cũ.
- **Lỗi 4 (cách a):** `OnboardingUITests.auditProblems` bỏ qua lỗi tương phản của phần tử trang có `maxY` thấp hơn mép trên giấy của thanh tab (`minY` của nút `tab.*` − 14). Chỉ áp cho loại contrast, không áp cho nút `tab.*` hay nhãn tab. Mỗi phần tử bỏ qua đều in một dòng `under the tab strip … not seen`.

Kết quả, `device: iPhone 16` (`3E0435D8…`, iOS 18.3), mỗi lệnh chạy một lần; máy đã tắt sau khi chạy, không đụng iPhone 16 Pro:
- Unit test (`-skip-testing:ScienceKidsUITests`): `** TEST EXECUTE SUCCEEDED **`, 9 bundle, 439 pass, 0 fail.
- 3 UI test: **2 pass, 1 fail**.
  - `LessonUITests.testEveryButtonIsAtLeast56ptAndLabelled`: **pass**. Lỗi 7 đóng.
  - `OnboardingUITests.testCollectionTabsStartEmpty`: **pass**. Khoảng hở khi cuộn hết: Thẻ 38,0 pt, Huy hiệu 48,0 pt. Bốn chữ bị bỏ qua vì nằm dưới thanh tab: "Khủng long và Trái Đất thời xa xưa", "0/4", "Năng lượng và lực làm gì?", "Có gì trên trời, dưới đất?" (y ≥ 738).
  - `LessonUITests.testAccessibilityAudit`: **fail** ở `LessonUITests.swift:433`, 2 dòng `audit[play]`. `audit[recap]` không còn "vùng chạm quá nhỏ", nên lỗi 8 đóng. Ảnh: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/931ba545-9527-406d-9b10-046d41a12137/scratchpad/shots2/`.
    - `Contrast failed · 'VI' (317, 203, 56 × 56)`: lỗi mới do sửa lỗi 7. Khung trợ năng giờ là 56 × 56, gồm hình giấy 56 × 28 và nền điệp phía dưới. Audit có vẻ so hai màu chiếm nhiều nhất trong khung, tức giấy với điệp, chứ không so chữ chàm với giấy (8,39:1). `SecondVoiceButton` (Học, Khởi động) cũng bọc vùng chạm 56 × 56 nhưng không bị báo, có lẽ vì hình giấy của nó chiếm phần lớn khung.
    - `Contrast failed · 'Carbohydrates' (257, 355, 110,7 × 56)`: chữ đã đúng (than tre trên giấy, không ngắt từ). Phần tử audit đo là cả chip, gồm chấm vàng hoè trên giấy (2,02:1). Chip "Protein" (chấm đỏ son) và "Vegetables and fruit" (chấm gỉ đồng) không bị báo. Đây là cùng cặp "vàng hoè trên giấy" mà `OnboardingUITests.contrastAllowed` (SK-011) đã cho qua ở Trang chủ.

**Cần chốt (PM hoặc designer), em chưa sửa tiếp:**
- 'VI':
  - (a) designer cho phần giấy của nút phủ cả vùng chạm, ví dụ 56 × 56 hoặc cao 44 trở lên. Hình nút đổi;
  - (b) test cho qua contrast của nút `listen.vi.*` khi hình giấy đạt tương phản. Cần ghi vào "Quyết định đã ghi" vì mục đó cấm thêm ngoại lệ.
- 'Carbohydrates':
  - (a) designer đổi chấm vàng hoè, ví dụ thêm vòng than tre, hoặc cho chấm là trang trí;
  - (b) thêm 'vàng hoè trên giấy' vào danh sách cho qua của `LessonUITests` cho chip nhóm, như SK-011.
- Ghi chú cho designer: "Carbohydrates" một dòng thu nhỏ khá nhiều trong chip 110 pt (xem ảnh màn). Nếu muốn chữ to hơn thì cần chip rộng hơn hoặc dot nhỏ hơn.

### Chạy lại `testAccessibilityAudit` sau cách (b) (ios-dev, 20/11)

`device: iPhone 16` (`3E0435D8…`), một lần; máy đã tắt sau khi chạy, không đụng iPhone 16 Pro. Kết quả: **fail** ở `LessonUITests.swift:433` với một dòng mới: `audit[play]: Dynamic Type font sizes are unsupported · 'Vegetables and fruit'` (110,7 × 56).
- Hai ngoại lệ mới áp đúng như ý: log in `allowed (SK-060: VI touch area larger than its paper chip): 'VI'` và `allowed (SK-060: vàng hoè dot on giấy, as SK-011): 'Carbohydrates'`.
- Nguyên nhân dòng mới, do sửa lỗi 9: chip nhóm dùng `WordFitText` với `fixedBox: false`. Ở mỗi cỡ chữ, `WordFitText` lại thu nhỏ chữ cho vừa bề rộng chip, nên chữ không lớn theo Dynamic Type và audit báo "unsupported". Các thẻ từ `lesson.bank.*` cũng dùng `WordFitText` nhưng với `fixedBox: true`, nên audit chỉ báo "partially" (đã được cho qua).
- Đã sửa, **chưa chạy lại**: chip đổi sang `fixedBox: true` như thẻ từ (`PlayStep.explorerChip`). Build đạt. Cần thêm **một lần** chạy `LessonUITests/testAccessibilityAudit` để xác nhận. Dòng trạng thái đầu ticket đã ghi `review` từ trước lượt này; em giữ nguyên và không đánh dấu thêm tiêu chí nào cho tới khi lần chạy đó pass.

### Chạy xác nhận `fixedBox: true` (ios-dev, 20/11)

`device: iPhone 16` (`3E0435D8…`), một lần, chỉ `LessonUITests/testAccessibilityAudit` (không có unit test nào cho `PlayStep`); máy đã tắt, không đụng iPhone 16 Pro. Kết quả: **fail**, cùng dòng như lần trước, `LessonUITests.swift:433`: `audit[play]: Dynamic Type font sizes are unsupported · 'Vegetables and fruit'` (110,7 × 56). 'VI' và 'Carbohydrates' vẫn được cho qua đúng như ý. Đổi `fixedBox` không có tác dụng. Ticket về `in_progress`; theo chỉ đạo, em dừng, không sửa tiếp.

Nhận định, chưa kiểm: "Vegetables and fruit" đã chiếm đủ 2 dòng ở cỡ chữ mặc định. Khi audit tăng cỡ chữ, `WordFit` vẫn thu chữ về cho vừa 2 dòng trong chip 110 pt, nên cỡ chữ vẽ ra không đổi và audit báo "unsupported". "Protein" và "Carbohydrates" không bị báo, có lẽ vì ở cỡ mặc định chúng còn chỗ để lớn lên. Hướng có thể chọn:
- (a) chip nhóm được cao thêm khi cỡ chữ lớn (bỏ thu nhỏ, cho thêm dòng);
- (b) cho qua "Dynamic Type unsupported" của chip `lesson.meter.*`, như các nhãn thẻ đã có trần cỡ chữ (B7.8);
- (c) designer đổi bố cục chip, ví dụ dot nhỏ hơn hoặc chip rộng hơn.

Cần phiên chính hoặc designer chốt.

### Chạy xác nhận sau ngoại lệ Dynamic Type (ios-dev, 20/11)

`device: iPhone 16` (`3E0435D8…`), một lần, chỉ `LessonUITests/testAccessibilityAudit`; máy đã tắt, không đụng iPhone 16 Pro. Kết quả: **pass** (`** TEST EXECUTE SUCCEEDED **`, 152 s). Ba phần tử được cho qua, mỗi cái đúng một lần trên màn `play`, có in log:
- 'VI': contrast;
- 'Carbohydrates': contrast;
- 'Vegetables and fruit': Dynamic Type, theo B7.8.

Fixture có thêm `trayGroupLabels` (tên nhóm khay EN/VI). Ticket trở lại `review`.

## Quyết định đã ghi
- Lỗi audit "Dynamic Type font sizes are unsupported" của chip nhóm Chơi (phiên chính chốt 20/11, cách b): `LessonUITests` cho qua lỗi này cho chip `lesson.meter.*` trên màn `play`. Nếu audit không trả id thì so nhãn với tên nhóm của khay trong fixture (EN và VI). Mỗi lần cho qua in log `allowed (SK-060: group chip, Dynamic Type capped (B7.8))`. Lý do: `technical-plan.md` B7.8 quy định Dynamic Type có giới hạn trên để không vỡ bố cục giấy. Tên nhóm hai dòng ("Vegetables and fruit") đã đầy chip 110 pt nên `WordFit` giữ nguyên cỡ chữ vẽ ra. Chỉ áp cho loại lỗi Dynamic Type đó và đúng các chip này. Chip giữ `fixedBox: true`.
- Lỗi audit 'VI' ở Chơi (phiên chính chốt 20/11, cách b): `LessonUITests` cho qua lỗi contrast của nút `listen.vi.*` trên màn Chơi. Lý do: vùng chạm 56 × 56 lớn hơn hình giấy 56 × 28, nên audit so giấy với nền điệp; chữ chàm trên giấy đạt 8,39:1. Ngoại lệ chỉ áp cho loại contrast, chỉ màn `play`, chỉ phần tử đó (theo id `listen.vi.*`; audit trả phần tử chữ không có id thì so đúng nhãn "VI"), và in log `allowed (SK-060 …)`.
- Lỗi audit 'Carbohydrates' ở Chơi (phiên chính chốt 20/11, cách b): cho qua lỗi contrast của chip nhóm "Carbohydrates" (`lesson.meter.*`). Lý do: audit đo chấm vàng hoè trên giấy (2,02:1), cùng cặp màu SK-011 đã cho qua ở Trang chủ; tên nhóm là than tre trên giấy 15,89:1. Phạm vi như trên: contrast, màn `play`, đúng nhãn đó, có in log.
- Lỗi 4 (phiên chính chốt 20/11, cách a): audit tab Thẻ, Huy hiệu, Từ vựng bỏ qua lỗi tương phản của phần tử trang nằm dưới mép trên giấy của thanh tab (chữ đang trượt dưới tờ giấy đặc, bé không thấy). Chỉ áp cho contrast, không áp cho nhãn tab; khoảng hở khi cuộn hết vẫn đo riêng (≥ 16 pt). App không đổi.
- Không còn so tên bài ở thẻ "Học tiếp" với tiêu đề bài: màn tiêu đề bỏ từ SK-043, chỉ kiểm thẻ mở được một bài.
- Bỏ kiểm "Chơi chỉ mở khi xem hết nhóm" (nút Học bị tắt): sách tranh tự đánh dấu nhóm khi lật trang, nút sang Chơi chỉ hiện ở trang cuối.
- Bỏ bấm loa phiếu gợi ý trong `AudioUITests`: SK-047 `h-sc-open` không có loa chính trên phiếu (nút "Gợi ý" đọc gợi ý; vẫn kiểm lời `hint.<câu>` vang lên).
- "Cả hai" không còn đọc EN→VI liền nhau (SK-042, Duy 13/11); test đổi kỳ vọng, vẫn kiểm VI phát được qua nút "VI".
- Sync: kiểm "sao server = sao Thưởng" chỉ khi server chưa có lượt nào của hồ sơ; không xoá phiên khách trong Keychain (ngoài vùng test, giống cài lại app).
- Không thêm ngoại lệ audit cho lỗi 2–4: chúng còn fail để ios-dev/designer xử lý.

## Phụ thuộc · Câu hỏi còn mở
- Mở cho designer, không chặn ticket: xem lại bố cục chip nhóm Chơi (chấm nhỏ hơn hoặc chip rộng hơn) để tên nhóm hai dòng còn chỗ lớn lên theo Dynamic Type (hiện audit được cho qua theo B7.8).
- Mở cho designer, không chặn ticket: "Carbohydrates" một dòng bị thu nhỏ nhiều trong chip nhóm Chơi rộng 110 pt (ảnh `…/scratchpad/shots2/contrast-play-Carbohydrates-screen.png`). Muốn chữ to hơn thì cần chip rộng hơn, chấm nhỏ hơn, hoặc nhãn ngắn hơn.
- Phụ thuộc gói nội dung đã build (`content/.build/pack`).
