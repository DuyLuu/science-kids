# SK-035 · Ba tab Bộ thẻ, Từ vựng, Huy hiệu thay trang "Sắp có"

Trạng thái: review · Ngày: 2026-11-10 · Phụ trách: ios-dev · Tester: tester
Nguồn: Duy 10/11 ("t thấy nhiều phần còn đang coming soon. tiếp tục"); canvas `design/play-ui/project/Discoverer-Cards.dc.html`, `Discoverer-Words.dc.html`, `Discoverer-Badges.dc.html`; prd.md mục 3 (flashcard EN–VI, sao, streak, huy hiệu); syllabus-progression.md mục 4 (huy hiệu theo 6 mạch)

## Mục tiêu
Bé bấm tab Thẻ, Từ vựng hay Huy hiệu thì thấy trang thật làm từ bài đã học, không còn trang "Sắp có".

## Phạm vi
- **Bộ thẻ** theo canvas `Discoverer-Cards`:
  - mỗi chủ đề đã có bài là một bộ (khoá `collectible.set.*`);
  - mỗi bài một thẻ (`reward.collectible` của bài);
  - thẻ đã nhận hiện mặt trước, chạm để lật xem mặt sau "Em có biết?"; thẻ chưa nhận úp, có dấu "?";
  - đếm "đã có / tổng" và dòng "+N thẻ ở các chủ đề sau" cho các bài chưa soạn;
  - bé nhận thẻ đúng theo luật màn Thưởng hiện nay (không đặt luật mới).
- **Từ vựng** theo canvas `Discoverer-Words`:
  - mỗi bài bé đã học là một bộ thẻ ghi nhớ, lấy từ `vocab` trong gói;
  - thẻ lật EN ↔ nghĩa VI kèm câu ví dụ, phát giọng EN và VI có sẵn trong gói;
  - hai nút "Ôn lại" và "Đã nhớ", màn xong bộ;
  - trạng thái đã nhớ lưu theo hồ sơ con trên máy.
- **Huy hiệu** theo canvas `Discoverer-Badges`:
  - tổng sao (sao tốt nhất của từng bài);
  - chuỗi ngày và dải tuần T2–CN, đúng luật chuỗi ngày đang có (server chốt, app tính tạm);
  - "Câu hỏi lớn": mỗi mạch một huy hiệu, tiến độ là số chủ đề đã xong trên số chủ đề của mạch trong nhóm tuổi; chạm để xem chủ đề.
- Bố cục iPhone và iPad (cột nội dung như các tab khác), VoiceOver, giảm chuyển động, chữ từ design tokens.
- Chữ mới thêm vào `Localizable.xcstrings` có `comment`; content-editor duyệt sau.

## Ngoài phạm vi
- Đồng bộ thẻ và từ đã nhớ lên Supabase (cần bảng mới; tách ticket dev khi Duy muốn).
- Thử thách tuần và thẻ hiếm (technical-plan B18 #13 đề xuất lùi GĐ 2; gói chưa có thẻ hiếm). Khối này ẩn.
- XP.
- Lặp lại ngắt quãng (SRS) cho từ vựng; "Ôn lại sau 1 ngày" chỉ là đưa từ chưa nhớ lên đầu lần sau.

## Tiêu chí nghiệm thu
- [ ] Hồ sơ mới chưa học bài nào: ba tab có trạng thái trống mời học bài đầu, không còn chữ "Sắp có"/"Coming soon" ở ba tab.
- [ ] Học xong một bài có thẻ (ví dụ Khủng long bài 1) → tab Thẻ hiện thẻ đó mặt trước; chạm → lật thấy mặt sau; số đếm tăng 1.
- [ ] Mở tab Từ vựng sau bài đó → có bộ từ của bài, lật được, nghe được EN và VI; bấm "Đã nhớ" hết → màn xong bộ; mở lại app vẫn giữ số từ đã nhớ.
- [ ] Tab Huy hiệu: tổng sao bằng tổng sao tốt nhất các bài; chuỗi ngày khớp số đang hiện ở Trang chủ (nếu có); mạch của chủ đề vừa xong tăng tiến độ.
- [ ] Đổi sang hồ sơ con khác → ba tab hiện dữ liệu của hồ sơ đó.
- [ ] iPad: ba tab nằm trong cột nội dung, không vỡ bố cục.
- [ ] VoiceOver đọc được thẻ (tên, đã nhận hay chưa), nút lật, nút "Đã nhớ"; giảm chuyển động thì lật không xoay.
- [ ] Unit test cho phần tính (thẻ đã nhận, tổng sao, tiến độ mạch, từ đã nhớ) chạy qua; test một lần trên iPhone 16 Pro rồi tắt simulator.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở
**Phụ thuộc:** SK-030 (danh mục), SK-033 (hình thẻ và từ), SK-034 (Trang chủ).

**Quyết định đã ghi (main session 10/11, mặc định, Duy đổi được):**
- Huy hiệu theo 6 mạch (đề xuất của syllabus-progression.md mục 4), thay 6 "Câu hỏi lớn" Year 3 cũ trên canvas. Tên câu hỏi của từng mạch do ios-dev đặt nháp, content-editor duyệt.
- Thử thách tuần ẩn cho đến khi có thẻ hiếm.
- Dữ liệu thẻ và từ đã nhớ chỉ lưu trên máy ở bản thử.

**Câu hỏi còn mở (cho Duy):**
- Giữ thử thách tuần ẩn, hay hiện "Xong 3 bài trong tuần" không kèm phần thưởng?

## ios-dev 10/11

**Đã làm:** ba trang `CardsTab`, `WordsTab`, `BadgesTab` thay `ComingSoonPage`; trên iPhone là trang giấy cuộn, trên iPad nằm trong cột nội dung (tối đa 600, canh giữa như bản đồ). Phần tính thuần nằm ở `ContentKit` (`CardCollection`, `WordDecks`, `WordReview`, `StrandBadge`). Phần của app: `StreakWeek`, `WordMemoryStore`. Bộ từ của một bài mở thành màn riêng (route `.words(lessonID:)`).

**Quyết định (mặc định, đổi được):**
- **Thẻ:** mỗi chủ đề có bài kèm thẻ là một bộ. Tên bộ lấy từ `collectible.set.<set>` của thẻ đầu, khoá lạ thì về "Thẻ". Bộ của nhóm tuổi bé đứng trước, theo thứ tự hành trình. Bộ của nhóm khác chỉ hiện khi đã nhận ít nhất một thẻ, để thẻ đã nhận không bao giờ biến mất.
- Thẻ nhận khi bài "xong" (`LessonProgressSnapshot.isDone`, ≥ 1 sao), cùng luật với màn Thưởng: bài xong nào cũng hiện thẻ.
- Chip "x/y thẻ": y chỉ đếm thẻ của các bài đã soạn. "+N thẻ ở các bài sau" là ô cuối mỗi bộ, đếm bài chưa soạn của chủ đề đó. Dòng "+M thẻ ở các chủ đề sau" dưới cùng đếm bài của các chủ đề trong nhóm tuổi chưa soạn bài nào.
- **Bỏ khỏi canvas:** chip lọc nhóm chất (một bộ bây giờ là một chủ đề), "Thẻ hiếm", dấu "MỚI" (phải lưu thêm "đã xem"; chưa có trong phạm vi).
- Thẻ mở ra phủ cả màn (`fullScreenCover`), không có trượt hệ thống. Thẻ hiện bằng `pop`, lật bằng `flip`; giảm chuyển động thì cả hai tắt. Nút nghe đọc mặt đang hiện, giống màn Thưởng.
- **Từ vựng:** mỗi bài đã xong và có `vocab` là một bộ. Thẻ đã nhớ lưu theo `VocabTerm.id`, tại `Application Support/words/<child id>.json`; hai bài trùng id từ thì nhớ chung. Mỗi lần bấm "Đã nhớ" hay "Ôn lại" là ghi ngay. "Ôn lại" xoá từ khỏi danh sách đã nhớ.
- Một lượt ôn đưa từ chưa nhớ lên trước (theo thứ tự trong bài), rồi mới đến từ đã nhớ. Không có SRS. Màn xong ghi "Lần sau, n từ cần ôn sẽ lên trước", không ghi "sau 1 ngày" như canvas, vì app không chờ ngày nào.
- "Đã nhớ x/n" là số từ đã nhớ của cả bộ, tính cả các lần trước, không phải số của lượt này. Vì vậy mở lại app vẫn thấy đúng số.
- **Giọng đọc:** nút nghe ở mặt trước chỉ phát clip EN của từ, dù `voice_mode` là gì: phát nghĩa VI thì lộ mặt sau. Mặt sau phát từ và câu ví dụ theo `voice_mode` (both: EN rồi VI). Thiếu clip thì nút ẩn.
- **Chữ:** từ tiếng Anh và nghĩa trên thẻ dùng Be Vietnam Pro 700, cỡ của `title_xl` và `title_l`, không dùng Phudu như canvas. Phudu chỉ có chữ hoa nên "fern" sẽ hiện thành "FERN"; bé học từ cần thấy đúng chính tả.
- Nút nghe và nút lật đặt dưới thẻ chứ không nằm trên mặt thẻ: thẻ đã là nút lật, không lồng nút trong nút.
- Hai mặt thẻ (Thẻ và Từ vựng) đo nội dung của mặt cao hơn rồi lấy chiều cao đó cho cả hai mặt (`readingHeight`), nên cỡ chữ lớn không làm vỡ thẻ.
- **Huy hiệu:** tổng sao và chuỗi ngày lấy từ `HomeProgress`, cùng nguồn với chip Trang chủ: máy tính tạm, server chốt khi hết hàng đợi. Dải tuần T2–CN (`StreakWeek`) đọc ngày học từ lịch sử và ngày nghỉ từ `computeStreak`. Khi server là nguồn: ngày nghỉ lấy `rest_days` của server; mọi ngày từ `chain_start` đến hôm qua mà không phải ngày nghỉ được tính là đã học; `studied_today` cho hôm nay. Không đặt luật mới.
- Mỗi mạch có chủ đề trong nhóm tuổi của hồ sơ là một huy hiệu, thứ tự theo `Topic.Strand.known`; Explorer không có mạch Năng lượng & lực nên có 5. "Xong" là trạng thái "Đã xong" của chủ đề trên hành trình. Vòng huy hiệu có mỗi chủ đề một mảnh; mảnh của chủ đề xong tô vàng hoè.
- Huy hiệu khác canvas một chỗ: tâm huy hiệu là giấy trắng mang icon mạch (`TopicIcon.strandIcons`), không phải đĩa đỏ son. Icon giấy cắt nhiều màu đặt trên đỏ son thì khó nhìn.
- Thử thách tuần vẫn ẩn.
- Hồ sơ mới chưa có bài xong: cả ba tab hiện thẻ "Bắt đầu nào" với nút "Học bài đầu tiên", nút này mở bài đầu chưa xong của nhóm tuổi.
- **Chuỗi giao diện mới** (EN + VI, có `comment`; content-editor duyệt) nằm dưới `cards.*`, `words.*`, `badges.*`, `collection.empty.*` và `strand.<mạch>.question|name`. Đã xoá 8 khoá `soon.*`. Câu hỏi của từng mạch là bản nháp:
  - plants_animals: "Cây và con vật sống thế nào?"
  - living_environment: "Sinh vật sống cùng nhau ra sao?"
  - humans_health: "Cơ thể ta cần gì?"
  - materials: "Mọi thứ làm bằng gì?"
  - energy_forces: "Lực và năng lượng làm được gì?"
  - earth_sky: "Trái Đất và bầu trời có gì?"
  - Ba câu dài xuống 3 dòng ở ô huy hiệu iPhone; nên rút ngắn.

**Kiểm (iPhone 16 Pro, một lần):** 349/349 test qua: 348 unit test của 9 bundle, cộng `OnboardingUITests/testCollectionTabsStartEmpty`. Xem thật trên simulator với lịch sử 5 bài: thẻ nhận đúng, lật đúng; bộ từ lật được, "Đã nhớ" và "Ôn lại" chạy đúng, có màn xong; tắt app mở lại vẫn giữ 4/5 từ; 11 sao và chuỗi 5 ngày khớp Trang chủ. Riêng đổi kiểu chữ của từ trên thẻ và của chú thích huy hiệu làm sau lượt test; chỉ build và chụp lại để xem.

**Chưa kiểm:**
- iPad: một simulator theo luật. `IPadLayoutUITests` đã sửa sang `cards.title` nhưng chưa chạy.
- VoiceOver thật và bật Reduce Motion trên máy.
- Âm thanh: simulator không phát clip.
- Đổi hồ sơ con: app chưa có màn đổi hồ sơ. Dữ liệu ba tab đã tách theo `child_id`, và unit test `tabsFollowTheChild` kiểm hai hồ sơ.

**Đề xuất ngoài vùng ios-dev:**
- designer: token cho các số đo trong `CollectionMetrics` (thẻ 136, thẻ mở 300 × 400, huy hiệu 68, ô ngày 36); một vai chữ "từ vựng lớn" bằng Be Vietnam Pro thay cho Phudu.
- content-editor: duyệt chuỗi `strand.*.question` và chữ của ba tab.
- dev: bảng Supabase cho từ đã nhớ và thẻ đã xem khi Duy muốn đồng bộ (ngoài phạm vi ticket này).

## content-editor 10/11 · duyệt chữ app

Phạm vi: chuỗi của ba tab (`cards.*`, `words.*`, `badges.*`, `collection.empty.*`, `strand.*`) và 10 chuỗi bản đồ của SK-034. Đã xem ảnh `app-tab-cards`, `app-tab-words`, `app-tab-words-deck`, `app-tab-badges`, `app-roadmap-discoverer-top`, `app-roadmap-discoverer-map`. Đây là bản đề xuất nháp (AI); Duy hoặc PM duyệt rồi ios-dev mới áp. "(giữ)" nghĩa là giữ nguyên chữ hiện có.

| Khoá | EN hiện tại | VI hiện tại | EN đề xuất | VI đề xuất | Lý do |
| --- | --- | --- | --- | --- | --- |
| `strand.plants_animals.question` | How do plants and animals live? | Cây và con vật sống thế nào? | How do animals and plants live? | (giữ) | VI đã vừa 2 dòng trong ảnh ("Cây và con vật / sống thế nào?") và không tách từ. Với EN, dòng hai "and animals live?" gần dài bằng "Lực và năng lượng", mà chuỗi này đã tràn. Vì vậy câu EN dễ ra 3 dòng. Đổi thứ tự để dòng hai ngắn hơn ("and plants live?"). Câu khớp với Khủng long (con vật thời xưa sống ra sao) và Cây làm gì và cần gì. |
| `strand.living_environment.question` | How do living things live together? | Sinh vật sống cùng nhau ra sao? | Who lives where? | Ai sống ở đâu? | Câu cũ ra 3 dòng trong ảnh. Câu mới có 14 ký tự. Nó khớp với Sinh vật và môi trường (nơi sống) và Chuỗi thức ăn nâng cao (các loài sống chung một nơi). Không dùng "Sinh vật sống ở đâu?" vì câu đó trùng tên chủ đề Explorer số 11, nên ô chú thích sẽ lặp chữ. |
| `strand.energy_forces.question` | What can forces and energy do? | Lực và năng lượng làm được gì? | What do energy and forces do? | Năng lượng và lực làm gì? | Câu cũ ra 3 dòng trong ảnh và tách "năng / lượng" sang hai dòng. Câu mới ngắt thành "Năng lượng và / lực làm gì?", không tách từ ghép, và theo đúng thứ tự tên mạch. Câu dài 25 ký tự, nhưng dòng dài nhất chỉ 13 ký tự, ngắn hơn "Cây và con vật" (14) đang vừa. Bỏ chữ "được" vì có nó thì dòng hai sát mép. |
| `strand.earth_sky.question` | What is on Earth and in the sky? | Trái Đất và bầu trời có gì? | What is above and below us? | Có gì trên trời, dưới đất? | Câu VI cũ tách "bầu / trời"; câu EN cũ có 32 ký tự, dễ ra 3 dòng. Câu mới ngắt ở dấu phẩy: "Có gì trên trời, / dưới đất?". Dòng một hẹp hơn "Cơ thể ta cần gì?" đang vừa một dòng. Câu khớp cả ba chủ đề Discoverer: thời tiết và thiên tai ở trên trời; núi lửa, động đất, đá và đất ở dưới đất. Câu cũng hợp Explorer (mùa) và Scientist (vì sao, Mặt Trăng). |
| `badges.empty` | Finish a lesson to get your first stars and start a streak. | Học xong một bài để có sao đầu tiên và bắt đầu chuỗi ngày. | Finish a lesson to get your first stars. Your streak starts that day. | Học xong một bài để có sao đầu tiên. Chuỗi ngày của em bắt đầu từ hôm đó. | Tách thành hai câu, mỗi câu một ý. Câu EN cũ 12 từ, quá giới hạn 10 từ. |
| `badges.week.rest_rule %lld` | one: Each week has %lld rest day: your streak keeps going. · other: Each week has %lld rest days: your streak keeps going. | Mỗi tuần có %lld ngày nghỉ, chuỗi không bị mất. | one: You can rest %lld day a week and keep your streak. · other: You can rest %lld days a week and keep your streak. | Mỗi tuần, em được nghỉ %lld ngày mà không mất chuỗi. | Câu cũ đọc như thể tuần có sẵn một ngày nghỉ cố định. Luật trong technical-plan (mục Chuỗi ngày) là mỗi tuần được bỏ một ngày bất kỳ mà không đứt chuỗi. Câu mới nói đúng việc bé được làm. |
| `badges.badge.started_a11y %lld %lld` (khoá mới) | (khoá mới) | (khoá mới) | Learning, %1$lld of %2$lld topics done | Đang học, đã xong %1$lld trên %2$lld chủ đề | Nhãn VoiceOver của ô huy hiệu đang ghép chữ hiển thị "Đang học · 0/2 chủ đề". VoiceOver có thể đọc "1/2" thành phân số hoặc ngày tháng. SK-034 cũng tách khoá `_a11y` như vậy. |
| `badges.badge.done_a11y %lld` (khoá mới) | (khoá mới) | (khoá mới) | one: Done, %lld topic · other: Done, %lld topics | Đã xong, %lld chủ đề | Cùng lý do với khoá trên: bỏ dấu "·" khỏi câu đọc. |
| `cards.subtitle` | Tap a card you have to see its back | (giữ) | Tap one of your cards to see its back | (giữ) | Câu EN cũ dễ bị đọc nhầm thành "you have to see" (em phải xem). |
| `words.again` | Practise again | (giữ) | Not yet | (giữ) | "Not yet" đi cặp với "I know it" nên nghĩa rõ hơn. Nút phụ hẹp: chữ VI "ÔN LẠI" chỉ rộng khoảng 80 điểm, còn "PRACTISE AGAIN" viết hoa dài gấp đôi, dễ xuống dòng. |
| `words.hint` | Tap the card to turn it | Chạm thẻ để lật | Tap to turn the card | Chạm để lật thẻ | Hai màn có cùng một thao tác thì nên dùng cùng một câu. Câu mới giống `cards.detail.hint` và nhãn `cards.detail.front_a11y`. |
| `words.listen.example` | Listen to the meaning and the example | Nghe nghĩa và câu ví dụ | Listen to the word and the example | Nghe từ và câu ví dụ | Nút này phát từ và câu ví dụ theo `voice_mode`. Khi giọng chỉ là tiếng Anh, app không phát nghĩa tiếng Việt, nên chữ "nghĩa" sai ở chế độ đó. |
| `words.done.body %lld %lld` | You remember %1$lld of %2$lld words. | Em đã nhớ %1$lld/%2$lld từ. | (giữ) | Em đã nhớ %1$lld trên %2$lld từ. | Ô xong bộ được gộp lại cho VoiceOver đọc, và "4/5" có thể bị đọc thành "4 tháng 5". Câu mới cũng khớp với chữ "of" của EN. |
| `words.empty` | Finish a lesson and its new words become a set of cards to practise. | (giữ) | Finish a lesson. Its new words become cards to practise. | (giữ) | Câu EN cũ dồn 13 từ vào một câu. Tách thành hai câu ngắn. |
| `words.progress_a11y %lld %lld %lld` | %1$lld words remembered. Word %2$lld of %3$lld | (giữ) | Remembered: %1$lld. Word %2$lld of %3$lld | (giữ) | Câu EN cũ ra "1 words remembered". Câu mới không cần dạng số nhiều và giữ thứ tự placeholder. |
| `home.journey.segment_a11y %lld %lld %lld` | (giữ) | Chặng %1$lld, %2$lld trên %3$lld chủ đề xong | (giữ) | Chặng %1$lld, đã xong %2$lld trên %3$lld chủ đề | SK-034. Câu cũ nghe thành "Chặng một, một trên năm chủ đề xong": hai số liền nhau, khó tách. Đặt "đã xong" trước số, giống mẫu của `done_a11y`. |
| `home.journey.learning_a11y %lld %lld` | Learning now, %1$lld of %2$lld lessons | Đang học, %1$lld trên %2$lld bài | Learning now, %1$lld of %2$lld lessons done | Đang học, đã xong %1$lld trên %2$lld bài | SK-034. Câu mới nói rõ số đầu là số bài đã xong; số sau chỉ đếm bài đã soạn. |
| `home.journey.level_a11y %lld %lld %lld` | Level %1$lld, %2$lld of %3$lld lessons | Mức %1$lld, %2$lld trên %3$lld bài | Level %1$lld, %2$lld of %3$lld lessons done | Mức %1$lld, đã xong %2$lld trên %3$lld bài | SK-034. Cùng lý do; nghe "Mức 1, 0 trên 5 bài" thì chưa rõ số 0 là gì. |
| `home.journey.new_a11y %lld %lld` | New topic, %1$lld of %2$lld lessons | Chủ đề mới, %1$lld trên %2$lld bài | New topic, %1$lld of %2$lld lessons done | Chủ đề mới, đã xong %1$lld trên %2$lld bài | SK-034. Cùng lý do. |

**Cách tôi kiểm độ dài câu hỏi mạch:**
- Tôi không chạy app; số dòng chỉ là ước lượng từ `app-tab-badges.png`.
- Một dòng trong ô chứa được "Cơ thể ta cần gì?" (17 ký tự), nhưng không chứa được "Lực và năng lượng" (cũng 17 ký tự, nhưng chữ rộng hơn).
- Với mỗi câu đề xuất, tôi ngắt dòng như SwiftUI ngắt và so bề rộng từng dòng với hai mốc trên.
- Cần ios-dev chụp lại tab Huy hiệu một lần, ở cả VI và EN, trên iPhone 16 Pro. Nếu còn câu nào ra 3 dòng hoặc tách từ ghép thì báo tôi để rút tiếp.

**Đã cân nhắc nhưng giữ nguyên:**
- `strand.humans_health.question` "Cơ thể ta cần gì?" vừa một dòng và khớp Hô hấp, Ăn uống lành mạnh, Hệ tiêu hoá. Tôi không đổi "ta" thành "em": chữ "em" rộng hơn, câu có thể làm chữ "gì?" rớt xuống dòng một mình.
- `strand.materials.question` "Mọi thứ làm bằng gì?" vừa hai dòng và hợp cả ba nhóm tuổi.
- `strand.other.*` là nhãn dự phòng, giữ nguyên.
- `cards.empty` ("Mỗi bài học xong cho em một thẻ") đúng khi bài nào cũng có thẻ, và hiện các bài đã soạn đều có. Nếu sau này có bài không kèm thẻ thì phải sửa câu này.
- Mọi khoá còn lại đọc ổn: giọng đúng, không hứa thử thách tuần, thẻ hiếm hay "sau 1 ngày".

**Việc ở code (đề xuất cho ios-dev, không thuộc khoá):**
1. Trong `BadgeButton` và `BadgeCaption`, nhãn VoiceOver dùng hai khoá `_a11y` mới thay cho `BadgeStatus.text`.
2. Dòng đếm của mỗi bộ thẻ ("Đã có 2/5") đặt nhãn VoiceOver bằng khoá có sẵn `cards.count_a11y`, để VoiceOver không đọc "2/5".
3. Trong `words.card.front_a11y` và `words.meaning`, từ tiếng Anh nằm giữa câu tiếng Việt, nên giọng VoiceOver Việt sẽ đọc sai, ví dụ "reptile". Gợi ý: đặt ngôn ngữ đọc tiếng Anh cho riêng phần từ (`accessibilitySpeechLanguage` trên AttributedString).
4. Comment trong xcstrings:
   - `strand.*.question` vẫn ghi "Draft", vì bản này cũng là nháp và đang chờ Duy duyệt.
   - Comment của `words.done.next` nhắc nút "Practise again"; đổi theo tên nút mới.

Đã đọc 106 khoá: SK-035 có 96, SK-034 có 10. Đề xuất đổi 17 khoá có sẵn (SK-035: 13, SK-034: 4) và thêm 2 khoá mới. Các placeholder giữ đúng số lượng và thứ tự.

## content-editor 10/11 · lượt 2

Duyệt 5 khoá mới của ios-dev và xem ảnh `app-tab-badges-2.png`, `app-tab-badges-2-en.png`. Đây vẫn là bản nháp (AI), chờ Duy hoặc PM duyệt. "(giữ)" nghĩa là giữ nguyên.

**Câu hỏi 6 mạch:** đạt. Ở cả VI và EN, mỗi câu chỉ một hoặc hai dòng và không tách từ ghép. Dòng luật ngày nghỉ vừa một dòng ở cả hai thứ tiếng.

| Khoá | EN hiện tại | VI hiện tại | EN đề xuất | VI đề xuất | Lý do |
| --- | --- | --- | --- | --- | --- |
| `cards.later_topics %lld` | one: %lld more topic is on its way, with its own cards. · other: %lld more topics are on their way, each with its own cards. | Còn %lld chủ đề đang soạn, mỗi chủ đề sẽ có bộ thẻ riêng. | one: %lld more topic is coming soon. · other: %lld more topics are coming soon. | Còn %lld chủ đề nữa sắp có. | Câu cũ hứa "mỗi chủ đề sẽ có bộ thẻ riêng", trong khi tester mục 14 đã chỉ ra bài có thể không kèm thẻ. Câu cũ còn ghép hai ý vào một câu. "Sắp có / Coming soon" là chữ Hành trình đang dùng cho đúng các chủ đề này. Riêng trường hợp chủ đề đã có bài mà chưa có thẻ thì chữ "sắp có" lệch một chút; hiện chưa có chủ đề nào như vậy. |
| `cards.more %lld` | one: +%lld card · other: +%lld cards | +%lld thẻ | one: +%lld lesson · other: +%lld lessons | +%lld bài | Số trên ô này là số bài chưa soạn, không phải số thẻ. Bài có thể không kèm thẻ, nên ghi "thẻ" là hứa quá. Chỉ đổi danh từ, không đổi cách đếm. ios-dev cần xem "+3 LESSONS" có vừa ô 136 điểm không. |
| `cards.more.caption` | in later lessons | ở các bài sau | coming soon | sắp có | Đi với dòng trên thành "+3 bài / sắp có". Dùng cùng chữ với `cards.later_topics` và Hành trình. |
| `cards.more_a11y %lld` (khoá có sẵn, đổi theo) | one: %lld more card in later lessons · other: %lld more cards in later lessons | Thêm %lld thẻ ở các bài sau | one: %lld more lesson coming soon · other: %lld more lessons coming soon | Còn %lld bài nữa sắp có | Nhãn VoiceOver phải đọc khớp với chữ hiện trên ô. |
| `words.save_failed` | That one was not saved. Try it again next time. | (giữ) | This word was not saved. Try it again next time. | (giữ) | "That one" mơ hồ với trẻ. "This word" nói rõ là từ nào và khớp với "từ này" của VI. |
| `topic.words.note` | Finish a lesson of this topic to get its word cards. | (giữ) | Finish a lesson in this topic to get word cards. | (giữ) | "its word cards" nghe như được cả bộ từ của chủ đề, trong khi học xong một bài chỉ mở thẻ từ của bài đó. "in this topic" cũng tự nhiên hơn "of this topic". |

**Ghi chú cho ios-dev (không phải khoá):** ở ảnh EN, ô chú thích huy hiệu vẫn hiện tên chủ đề bằng tiếng Việt ("Khủng long và Trái Đất thời xa xưa…"). Nếu đó là do chế độ ngôn ngữ của hồ sơ thì đúng ý; nếu không thì nên xem lại.

Lượt 2: đọc 5 khoá mới, cộng `cards.more_a11y` để đối chiếu. Đề xuất đổi cả 5 khoá mới và 1 khoá có sẵn đi kèm (`cards.more_a11y`). Placeholder giữ đúng số lượng và thứ tự.

## tester 10/11

Đọc diff + chạy máy. Không chạy lại 348 unit test của ios-dev. Luật một simulator: iPad bật trước, tắt rồi mới bật iPhone; cuối buổi tắt hết (`xcrun simctl list devices booted` rỗng).

### Lệnh đã chạy và kết quả

| # | Lệnh | Máy | Kết quả |
| --- | --- | --- | --- |
| 1 | `xcodebuild test … -only-testing:ScienceKidsUITests/IPadLayoutUITests` | iPad Pro 11-inch (M4) `AAE7F637` | **FAIL 2/3.** `testHomeTouchTargetsBothWays` pass (mọi nút Trang chủ ≥ 56 ở dọc và ngang). `testScreensAndScreenshots` fail tại `IPadLayoutUITests.swift:85`, `testRotationKeepsTheQuizState` fail tại `:63`, cùng một lỗi `no button lesson.word.w1_air`. Không chạy lại. Log: `scratchpad/ipad-test.log` |
| 2 | Test tạm của tester `testCollectionTabShots` (chơi bài qua màn Chủ đề) | iPad Pro 11-inch (M4) | **PASS.** 3 ảnh tab ở `scratchpad/shots/ipad-tab-{cards,words,badges}.png` |
| 3 | Test tạm của tester `testCollectionTabsAccessibilityAudit` (`performAccessibilityAudit` 7 loại + liệt kê nhãn/kích thước nút) | iPhone 16 Pro `14DF158D` | **FAIL** do 3 lỗi contrast + 1 text clipped (xem mục lỗi). Log: `scratchpad/iphone-audit2.log` |

Test tạm `apps/ios/ScienceKidsUITests/TesterCollectionTempUITests.swift` **đã xoá** và `./bootstrap.sh` đã chạy lại; repo không còn file nào của tester.

Ghi chú về lệnh: `TEST_RUNNER_SK_SCREENSHOT_DIR` phải là **biến môi trường của tiến trình xcodebuild**, truyền như build setting (`xcodebuild … TEST_RUNNER_X=Y`) thì runner không nhận (lần 1 không ra ảnh nào). README mục "Build và test" nên ghi rõ.

### Tiêu chí nghiệm thu

| Tiêu chí | Kết quả |
| --- | --- |
| Hồ sơ mới: ba tab trống, không còn "Sắp có" | **Đạt** (đọc code + `OnboardingUITests.testCollectionTabsStartEmpty` của ios-dev; không còn khoá `soon.*` trong `Localizable.xcstrings`) |
| Học xong bài có thẻ → tab Thẻ hiện thẻ, lật được, số đếm tăng | **Đạt.** Trên iPad sau bài "Thức ăn cho ta những gì?": chip "1/12 thẻ", bộ "Thẻ thực phẩm · Đã có 1/2", thẻ "Rau muống". Mở thẻ: nhãn "Thẻ Rau muống. Chạm để lật thẻ", nút "Đóng thẻ" 56×56 |
| Tab Từ vựng: bộ từ của bài, lật được, "Đã nhớ" → màn xong, mở lại vẫn giữ | **Đạt một phần.** Lật và hai nút chạy đúng trên máy; "mở lại app vẫn giữ" chỉ có unit test `markedWordsSurviveARelaunch` phủ, tester chưa kiểm tay. Nghe EN/VI: **chưa kiểm** (simulator không phát clip) |
| Tổng sao bằng tổng sao tốt nhất; chuỗi ngày khớp Trang chủ; mạch của chủ đề vừa xong tăng | **Đạt.** `BadgesTab` lấy `app.homeProgress(for:)` — đúng nguồn với chip Trang chủ (`HomeScreen.swift:368`). Trên máy: "2 sao" (bài được 2 sao), "Chuỗi 1 ngày", T3 = hôm nay có tick. Mạch Con người và sức khoẻ chuyển sang "Đang học · 0/5" sau bài đó |
| Đổi hồ sơ con | **Chưa kiểm được**: app chưa có màn đổi hồ sơ. Unit test `tabsFollowTheChild` phủ phần tính |
| iPad: ba tab trong cột nội dung, không vỡ bố cục | **Đạt.** Cửa sổ 834 rộng, `cards.title`/`words.title`/`badges.title` đều ở x = 372 (> 340 = mép sidebar); không tràn, không chồng |
| VoiceOver đọc được thẻ, nút lật, nút "Đã nhớ"; giảm chuyển động tắt animation | **Đạt phần nhãn** (xem bảng nhãn dưới). Reduce Motion: chỉ chạy bằng cờ `-SKReduceMotion` (lật không kẹt, không chờ); **chưa kiểm** bằng setting thật của máy và VoiceOver thật |
| Unit test phần tính chạy qua, một lần trên iPhone 16 Pro | **Nhận theo báo cáo ios-dev** (349/349). Tester không chạy lại |

Nhãn và vùng chạm đọc được từ máy (iPhone 16 Pro, hồ sơ Song ngữ, Lớp 3 → ngưỡng 56):

- `cards.detail.close` "Đóng thẻ" 56×56 · `cards.detail.card` "Thẻ Rau muống. Chạm để lật thẻ" 300×400 · `listen.cards.card` "Nghe tên thẻ" 55×56
- `words.deck.2.healthy-eating` "Bộ từ bài 2: Thức ăn cho ta những gì?. Đã nhớ 0 trên 8 từ" 362×76 · `words.card` "Thẻ từ nutrient. Chạm để lật xem nghĩa" 362×319 → sau khi lật "Nghĩa: chất dinh dưỡng. Chạm để lật lại" · `words.again` "Ôn lại" 82×56 · `words.known` "Đã nhớ" 267×65
- 6 ô huy hiệu 116×98…132, ví dụ "Cơ thể ta cần gì?. Đang học · 0/5 chủ đề"
- `badges.week` "Tuần này: thứ Hai không học; Hôm nay, thứ Ba đã học; thứ Tư chưa tới; …" · `badges.stars` "Tổng cộng 2 sao"
- Mọi nút đều có nhãn, không nút nào rỗng.

### Lỗi

**Lỗi chặn:** không có trong code SK-035.

**Nên sửa**

1. **`IPadLayoutUITests` fail 2/3 — bộ UI test đã lạc hậu so với nội dung mới** (ios-dev).
   `IPadLayoutUITests.swift:85` và `:63` gọi `tap(app, "home.start_lesson")` rồi trả lời theo `LessonFixture` (bài `01-thuc-an-cho-ta-nhung-gi.json`). Từ SK-031/SK-032, chủ đề Discoverer #1 `new-earth-surface` đã có 5 bài, nên "Học tiếp" mở "Đất và nước trên Trái Đất", không còn là bài của fixture → `no button lesson.word.w1_air`.
   Tái hiện: `xcodebuild test -only-testing:ScienceKidsUITests/IPadLayoutUITests -destination 'platform=iOS Simulator,name=iPad Pro 11-inch (M4)'`.
   Mong đợi: 3/3 pass. Thực tế: 2 fail.
   Cùng giả định đó còn ở `LessonUITests`, `AudioUITests` và `OnboardingUITests.testTopicListsEveryLessonNoneLocked` (dòng "SK-030: the first written lesson is lesson 2") — **chưa chạy**, nhưng gần như chắc cũng fail. Gợi ý: cho fixture/test đi qua màn Chủ đề (`home.topic.healthy-eating` → `topic.lesson.2`) như test tạm của tester đã làm, hoặc đổi `LessonFixture` sang bài mà "Học tiếp" thật sự mở.

2. **Audit trợ năng: 5/6 ô huy hiệu "Chưa bắt đầu" trượt contrast** (`BadgesTab.swift:270–274`, `BadgesTab.swift:290–315`).
   Tái hiện: iPhone 16 Pro, học xong một bài, mở tab Huy hiệu, `performAccessibilityAudit(for: .contrast)`.
   Mong đợi: không có finding. Thực tế: `Contrast failed` cho "Cây và con vật sống thế nào?", "Sinh vật sống cùng nhau ra sao?", "Mọi thứ làm bằng gì?", "Lực và năng lượng làm được gì?", "Trái Đất và bầu trời có gì?". Ô đã bắt đầu ("Cơ thể ta cần gì?") **không** trượt.
   Không phải do màu chữ: chữ phụ `#4E4336` trên diệp `#F0E6CF` = 7.76:1. Nghi phần hình trong ô: `TopicGlyph(muted: true)` (xám + 42% đục) trên giấy lõm và vòng mảnh `giayLomDeep`. Cần designer chốt độ đậm của trạng thái "chưa bắt đầu".

3. **Audit trợ năng: chữ "hôm nay" dưới ô ngày bị cắt** (`BadgesTab.swift:135–139`).
   iPhone 16 Pro, tab Huy hiệu: `Text clipped · 'hôm nay' (82.3, 235.3, 44.3, 13.3)`. Ô ngày rộng 44pt, chữ phải co bằng `minimumScaleFactor`. Trên iPad không thấy. Gợi ý: rút còn "nay", hoặc cho chữ tràn ra ngoài ô ngày.

4. **Ghi từ đã nhớ: cache cập nhật trước khi ghi file, ghi lỗi chỉ log** (`AppModel.swift:410–418`).
   `knownWordsCache[profile.id] = next; wordsVersion += 1` chạy trước `try words?.save(...)`. Nếu `save` ném lỗi (đĩa đầy, quyền), màn hình vẫn hiện "Đã nhớ 5/8" nhưng mở lại app còn 4/8, bé không được báo gì.
   Gợi ý: ghi trước, cập nhật cache sau; hoặc giữ cache nhưng đánh dấu "chưa ghi được" và thử lại.

5. **Dải tuần khi server là nguồn vẫn giữ ngày học của máy** (`StreakWeek.swift:64–76`).
   `studied` khởi tạo từ lịch sử máy rồi mới cộng chuỗi của server; chỉ `rest` bị thay. Ticket ghi "mọi ngày từ `chain_start` đến hôm qua mà không phải ngày nghỉ được tính là đã học" — tức server quyết, nhưng code không xoá ngày của máy. Hậu quả: khi server cắt chuỗi (ví dụ lệch múi giờ) chip Trang chủ hiện "Chuỗi 1 ngày" còn dải tuần vẫn tô đỏ son 3 ngày; `studied_today = false` cũng bị lịch sử máy ghi đè. Test hiện có không phủ (`weekStripFromDeviceAndServer` truyền `history: []`).
   Gợi ý: khi `queued == 0 && server hợp lệ` thì `studied` dựng lại hoàn toàn từ `streak`.

6. **"Đã xong" của chủ đề chỉ tính bài đã soạn → tiến độ mạch và số thẻ đi lùi khi soạn thêm bài** (`JourneyProgress.swift`, `JourneyStop.init`; `StrandBadges.swift:26`).
   Hôm nay "Ăn uống lành mạnh" có 2/10 bài được soạn; học xong 2 bài là chủ đề "Đã xong" và huy hiệu Con người và sức khoẻ lên 1/5. Khi soạn thêm bài 3, chủ đề trở lại "Đang học" và huy hiệu tụt về 0/5 — bé mất tiến độ đã có. Tương tự mẫu số "x/12 thẻ" tăng dần.
   Đây là quyết định sản phẩm (PM/Duy), không phải lỗi code: cần chốt "xong" theo bài đã soạn hay theo số bài của danh mục, và xử lý khi nội dung lớn lên.

7. **"Bỏ lỡ" và "chưa tới" trong dải tuần nhìn giống hệt nhau** (`BadgesTab.swift:176–184`).
   `missed` = `surfaceInactive` + `sunkenS`, `upcoming` = `surfaceSunken` + `sunkenS`. Trên ảnh `ipad-tab-badges.png`, T2 (bỏ lỡ) và T4–CN (chưa tới) không phân biệt được bằng mắt; chỉ VoiceOver nói khác nhau. Cần designer cho "bỏ lỡ" một dấu riêng (hoặc bỏ hẳn trạng thái này).

**Nhỏ**

8. `CardsTab.swift:136` — định danh `cards.card.<collectible.key>` không duy nhất: hai bài dùng chung một thẻ sẽ tạo hai phần tử cùng id (chính `CardSlot` đã chú thích "two lessons never share a slot, even with the same card"). Dùng `lessonId` cho id.
9. `CardsTab.swift:369` và `WordsTab.swift:251` — `alt` luôn lấy `.en`, kể cả hồ sơ Tiếng Việt trước. Giống quy ước đang có ở `LessonParts.swift:52`, nên sửa cả cụm chứ không riêng SK-035.
10. `WordsTab.swift:181` — `accessibilityValue` của thẻ từ luôn nối `example.en + " " + example.vi`, không theo `language_mode`.
11. Chuỗi `cards.more`: VI "thẻ ở các bài sau" có chữ "thẻ", EN "in later lessons" không có → ô "+8" ở bản EN đọc thiếu danh từ.
12. `StrandBadges.swift:41` chỉ duyệt `Topic.Strand.known`, nên chủ đề thuộc mạch lạ không có huy hiệu và không được đếm ở đâu; hai khoá `strand.other.question|name` không bao giờ hiện. Nên hoặc bỏ hai khoá, hoặc gộp mạch lạ vào một huy hiệu "Khoa học".
13. `CardCollection.swift:64–70, 78–86` — chủ đề đã soạn bài nhưng không bài nào có thẻ thì vừa không thành bộ, vừa không được đếm vào "+N thẻ ở các chủ đề sau" (bộ lọc là "không có bài nào đã soạn"): thẻ tương lai của chủ đề đó biến mất khỏi mọi con số.
14. `CardCollection.swift:68–69` và `84` đếm **mọi** bài chưa soạn là một thẻ tương lai. Ảnh iPad hiện "+135 thẻ ở các chủ đề sau"; nếu có bài không kèm `reward.collectible` thì con số này hứa quá tay (content-editor cũng đã ghi lo ngại tương tự cho `cards.empty`).
15. `TopicScreen` chip "Từ vựng chủ đề · n từ" mở tab Từ vựng, mà tab chỉ liệt kê bài **đã xong** → bé bấm từ một chủ đề chưa học sẽ thấy trang trống. Hoặc đổi đích, hoặc đổi chữ.
16. Đọc đĩa trên main thread mỗi lần vẽ: `AppModel.lessonProgress` (`:290–296`), `homeProgress` (`:332`), `streakWeek` (`:387`) đều gọi `attempts.history(now:)`, mà `AttemptStore.history` (`AttemptStore.swift:271`) decode lại `history.json` mỗi lần. Thân `BadgesTab` gọi 4 lần (`homeProgress`, `strandBadges`, `lessonProgress` cho `anyDone`, `streakWeek`) cộng 2 lần quét thư mục `in_progress`. Chưa thấy giật ở 1 bản ghi, nhưng lịch sử lớn dần theo từng bài.
17. Chữ "Em có biết?" của mặt sau thẻ vẫn nằm trong cây trợ năng khi thẻ đang úp (`CardsTab.swift:351–361`): audit báo `Contrast failed` cho "Rau muống có nhiều vitamin và chất xơ…" lúc thẻ chưa lật (chữ đang `opacity 0`). VoiceOver không đọc nó, nhưng audit sẽ còn đỏ.
18. Mặt thẻ nhỏ trên lưới: lớp lót chàm (`cardBackingInsets` −2/−3/−5, nghiêng 1,6°) hiện ra như một nét viền quanh thẻ (xem `ipad-tab-cards.png`), hơi nghịch với style E "không nét viền trên hình khối". Designer xem lại độ lệch/độ nghiêng cho cỡ 136pt.
19. `listen.*` trong thẻ mở và trong bộ từ đo được 55×56 (nút đóng cùng màn đo 56×56). `PaperIconButton` đặt `ageGroup.touchTarget` = 56 nên nhiều khả năng chỉ là làm tròn bố cục (các test khác của repo dùng ngưỡng 55,5); ios-dev kiểm lại một lượt cho chắc.
20. Contrast trượt ở tab đang chọn ("Thẻ", "Huy hiệu", "Từ vựng" ở thanh dưới) là finding **cũ**, đã nằm trong `OnboardingUITests.contrastAllowed["home"]`; không phải lỗi mới của SK-035.

### Đã kiểm và đạt (không có lỗi)

- Luật nhận thẻ **đúng luật màn Thưởng**: `RewardStep.swift:76` hiện thẻ cho mọi bài tới được màn Thưởng, `CardSlot.isEarned` dùng `LessonProgressSnapshot.isDone` (≥ 1 sao) — cùng một luật, không đặt luật mới.
- Không hard-code chủ đề trong `apps/ios/ScienceKids/Collection/`: bộ thẻ theo `JourneyTopic`, huy hiệu theo `Topic.Strand`, tên bộ qua `CollectibleSetName.key(for:)` có đường lui `collectible.set_generic`.
- Không hard-code màu: không có `Color(...)`, hằng hex hay màu hệ thống trong `Collection/*.swift`; mọi màu qua `Tokens.Role`/`Tokens.Palette`. Không có `stroke`/`border` nào.
- 96 khoá mới đều có đủ `en` + `vi` và `comment`; 8 khoá `soon.*` đã bị xoá; không khoá nào bị dùng mà thiếu trong catalog.
- Kho từ đã nhớ tách theo `child_id`: một file mỗi hồ sơ, ghi `.atomic`, `child_id` lặp lại trong file nên file đổi tên không đọc nhầm, file hỏng → đọc rỗng + log (`WordMemoryStore.swift:37–55`); `-SKResetProfile` xoá cả thư mục `words/`.
- Không secret, không SDK bên thứ ba, không đọc `Config/Local.xcconfig`.

## ios-dev 10/11 · lượt 2

**Chữ (content-editor 10/11):**
- Đã áp đủ 17 khoá (13 của SK-035, 4 của SK-034) và thêm 2 khoá `badges.badge.started_a11y`, `badges.badge.done_a11y`.
- Comment đã sửa:
  - `strand.*.question`: vẫn ghi nháp, chờ Duy/PM duyệt.
  - `words.done.next`: đổi tên nút thành "Not yet".
  - Các khoá "x/n bài": nay đếm mọi bài của danh mục (xem mục "Đã xong" bên dưới).
- Phần code của content-editor:
  - Ô huy hiệu và chú thích huy hiệu đọc bằng hai khoá `_a11y` mới.
  - Dòng "Đã có 2/5" của mỗi bộ thẻ đọc bằng `cards.count_a11y`.
  - Từ tiếng Anh trong câu VoiceOver tiếng Việt được đánh dấu ngôn ngữ EN (`SpeechText`). SwiftUI không có thuộc tính này, nên chuỗi mang khoá `accessibilitySpeechLanguage` của UIKit cùng `languageIdentifier`. Chưa nghe thử bằng VoiceOver thật.

**Bộ thẻ mới:** `collectible.set.breathing` "Breathing cards" · "Thẻ hô hấp" và `collectible.set.body` "Body cards" · "Thẻ cơ thể".

**Tester "nên sửa":**
1. UI test mở bài fixture qua màn Chủ đề (`LessonFixture.open(in:)`). Vị trí bài (`healthy-eating`, bài 2) đọc từ `content/syllabus.json`, không viết cứng trong test.
   - Đã sửa: LessonUITests, AudioUITests, IPadLayoutUITests, SyncUITests (SyncUITests chưa chạy, vì nó ghi lên staging).
   - `testTopicListsEveryLessonNoneLocked` đọc tên bài trên thẻ "Học tiếp" rồi kiểm nút mở đúng bài đó, nên test không còn phụ thuộc nội dung.
   - `testTouchTargets` chỉ còn kiểm nhãn bắt đầu bằng "Bắt đầu bài".
   - `testCloseButtonKeepsTheAttempt`: bấm đóng bài thì quay về màn Chủ đề, rồi mới về Trang chủ.
2. Huy hiệu "Chưa bắt đầu" có icon mạch đủ màu, tâm giấy, không còn xám mờ 42%. Trạng thái nhận ra qua đĩa giấy lõm, vòng xám và việc không có nhãn "x/n". Chữ câu hỏi của mọi ô đều `text_primary`.
   - **Chưa đạt:** audit vẫn báo `Contrast failed` cho cả 6 ô của hồ sơ mới (xem mục Kiểm).
   - Phần tử bị báo là chữ câu hỏi, nhưng khung của nó trùm cả nút 117×99…116. Có lẽ audit lấy mẫu cả đĩa huy hiệu.
   - Ô "đang học" (đĩa giấy và nhãn đỏ son "0/n") đã qua audit ở lượt của tester.
   - Đề xuất cho designer/Duy: cho ô chưa bắt đầu cũng dùng đĩa giấy và hiện nhãn "0/n", hoặc chốt một kiểu khác. Tôi chưa đổi thêm vì không được chạy lại.
3. Chữ "hôm nay" và "nghỉ" giữ đúng bề rộng của chữ, tràn ra ngoài cột ngày thay vì bị cắt.
4. `AppModel.mark` ghi file trước, rồi mới cập nhật cache. Ghi lỗi thì giữ số cũ, trả `false`; màn bộ từ hiện `words.save_failed` và lượt ôn vẫn đi tiếp.
5. Dải tuần: khi server là nguồn, ngày đã học lấy hoàn toàn từ server (chuỗi, ngày nghỉ, `studied_today`). Ngày trước `chain_start` hiện là bỏ lỡ.
6. "Đã xong" (mặc định của main session): một chủ đề xong khi bé xong **mọi bài của chủ đề trong danh mục**, kể cả bài chưa soạn. Áp cho `JourneyStop`, nên cả bản đồ Hành trình, màn Chủ đề, thẻ Học tiếp và huy hiệu mạch đều theo luật này.
   - "x/n bài" lấy n là số bài của danh mục (`JourneyStop.lessonCount`), để không có chủ đề "Đang học · 2/2". Các ô vuông vẫn chỉ vẽ bài đã soạn.
   - Hiện "Ăn uống lành mạnh" (2/10 bài đã soạn) sẽ hiện "Đang học · 2/10" khi bé học xong cả hai bài.
   - "Học tiếp" vẫn bỏ qua chủ đề không còn bài đã soạn nào để học. Thẻ "Đã học hết" vẫn nghĩa là xong mọi bài đã soạn.
7. Ngày bỏ lỡ có thêm một vạch ngang, khác ô "chưa tới" (trống) bằng hình chứ không chỉ bằng màu.

**Tester "nhỏ":**
- **Đã sửa:**
  - #8: id thẻ là `cards.card.<topic>.<bài>`.
  - #9 trong ba tab: `alt` theo ngôn ngữ tên của hồ sơ.
  - #10: giá trị VoiceOver của thẻ từ là câu ví dụ theo `language_mode`.
  - #11: ô cuối bộ là "+N thẻ" / "+N cards" (có số nhiều EN) và dòng "ở các bài sau".
  - #12: mạch lạ gom vào một huy hiệu "Khoa học" (`StrandBadge.otherStrand`).
  - #13 và #14: dòng cuối tab Thẻ đếm số chủ đề, không đếm thẻ: "Còn N chủ đề đang soạn, mỗi chủ đề sẽ có bộ thẻ riêng". Gồm cả chủ đề đã soạn mà chưa có thẻ nhưng còn bài chưa soạn.
  - #15: chip "Từ vựng chủ đề" chỉ mở tab khi chủ đề đã có bộ từ. Chưa có thì hiện ghi chú `topic.words.note` (VoiceOver cũng đọc).
  - #16: lịch sử và bài đang học được đọc một lần cho mỗi `progressVersion`.
  - #17: mặt thẻ đang úp không còn chữ nào sau khi lật xong.
- **Bỏ qua:**
  - #9 trong các màn bài học (`LessonParts.swift`, 6 chỗ gọi): cùng cụm đó nhưng thuộc SK-012/SK-033 và có test riêng. Đề xuất một ticket nhỏ.
  - #18: lớp lót chàm trông như viền là việc của designer.
  - #19: `PaperIconButton` có khung cố định 56×56; 55 có lẽ do làm tròn toạ độ.
  - #20: lỗi cũ.

**Chữ mới cần content-editor duyệt:** `cards.more %lld`, `cards.more.caption`, `cards.later_topics %lld` (đổi nghĩa), `words.save_failed`, `topic.words.note`.

**Kiểm** (mỗi bộ chạy một lần, một simulator một lúc, xong đều tắt):
- **iPhone 16 Pro `14DF158D`**, `xcodebuild test-without-building … -only-testing:ScienceKidsTests -only-testing:ContentKitTests -only-testing:ScienceKidsUITests/LessonUITests -only-testing:ScienceKidsUITests/AudioUITests -only-testing:ScienceKidsUITests/OnboardingUITests`, tổng **FAIL**:
  - ContentKitTests: 51/51 qua.
  - ScienceKidsTests: 85 qua, **1 fail**. `InfoPlistTests.roadmapStringsFillIn` vẫn so 4 câu VI cũ của SK-034 (`segment_a11y`, `learning_a11y`, `level_a11y`, `new_a11y`). Tôi đã sửa test theo chữ mới của content-editor nhưng **chưa chạy lại**.
  - AudioUITests: 6/6 qua.
  - LessonUITests: 8 qua, 2 skip (Reduce Motion của máy, ảnh chụp).
  - OnboardingUITests: 9 qua, 1 skip, **1 fail**. `testCollectionTabsStartEmpty` fail ở audit mới của tab Huy hiệu: 6 × `Contrast failed` (mục #2). "hôm nay" không còn bị cắt (không có `textClipped`). Tab Thẻ và tab Từ vựng chỉ còn finding cũ của tab đang chọn, đã cho phép.
- **iPad Pro 11-inch (M4) `AAE7F637`**, `-only-testing:ScienceKidsUITests/IPadLayoutUITests`: **3/3 qua** (lượt tester trước là 2 fail).
- **Ảnh** (iPhone, hồ sơ có 5 bài xong): `scratchpad/shots/app-tab-badges-2.png` (VI) và `app-tab-badges-2-en.png` (EN). Mọi câu hỏi mạch vừa ≤ 2 dòng ở cả hai ngôn ngữ, không tách từ ghép; "hôm nay" và "today" hiện đủ.

**Còn chưa chắc:**
- Chưa nghe bằng VoiceOver thật xem việc đánh dấu ngôn ngữ đọc có tác dụng không.
- Reduce Motion của máy, iPhone 16e, iPad ngang ở tab Huy hiệu: chưa kiểm.
- SyncUITests chưa chạy.

## ios-dev 10/11 · lượt 3

**Đã đổi:**
- **Ô huy hiệu "Chưa bắt đầu"** (main session chốt theo đề xuất lượt 2): dùng đĩa giấy và nhãn đỏ son "0/n" như ô đang học, chỉ khác là không có cung tiến độ. Audit contrast của tab Huy hiệu nay qua (xem mục Kiểm).
- **Chữ (content-editor 10/11 · lượt 2):**

  | Khoá | VI | EN |
  | --- | --- | --- |
  | `cards.later_topics %lld` | "Còn %lld chủ đề nữa sắp có." | "… topic(s) … coming soon." |
  | `cards.more %lld` | "+%lld bài" | "+%lld lesson(s)" |
  | `cards.more.caption` | "sắp có" | "coming soon" |
  | `cards.more_a11y %lld` | "Còn %lld bài nữa sắp có" | |
  | `words.save_failed` | | "This word…" |
  | `topic.words.note` | | "…in this topic to get word cards." |

  - Comment của các khoá `cards.*` trên đã sửa: ô cuối đếm bài, không đếm thẻ.
  - "+N LESSONS" xuống hai dòng, vừa ô 136 điểm, không bị cắt (`app-tab-cards-3-en.png`). Ô đổi từ một dòng sang hai dòng, vẫn co chữ khi cần. Bản VI "+8 BÀI" vừa một dòng.
- **Tên chủ đề tiếng Việt trong ảnh EN** (ghi chú của content-editor): giữ nguyên. Hồ sơ chụp ảnh dùng chế độ Song ngữ, mà ở chế độ này tên luôn hiện tiếng Việt (`LanguageMode.nameLanguage` = vi), giống Hành trình và tab Thẻ. Hồ sơ Tiếng Anh trước sẽ thấy tên tiếng Anh.

**Kiểm:**
- iPhone 16 Pro `14DF158D`, chạy một lần: `xcodebuild test-without-building … -only-testing:ScienceKidsTests -only-testing:ScienceKidsUITests/OnboardingUITests/testCollectionTabsStartEmpty`.
  - ScienceKidsTests: **86/86 qua**, gồm `InfoPlistTests.roadmapStringsFillIn` đã sửa.
  - `testCollectionTabsStartEmpty`: **qua**. Audit của cả ba tab chỉ còn finding cũ của tab đang chọn, đã cho phép.
  - Không đụng ContentKit nên không chạy ContentKitTests.
- Ảnh: `scratchpad/shots/app-tab-badges-3.png` (VI), `app-tab-cards-3.png` (VI), `app-tab-cards-3-en.png` (EN, để xem ô "+8 LESSONS").
- Simulator đã tắt.
