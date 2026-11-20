# SK-054 · VoiceOver trên thẻ lựa chọn Explorer không được lộ đáp án

Trạng thái: todo · Ngày: 2026-11-19 · Phụ trách: pm (chốt cách làm) → ios-dev (app) · content-editor (rà `alt`/`label` nếu chọn phương án cần) · Tester: tester
Nguồn: SK-053, mục "Ghi chú content-editor (19/11, lượt 2)" (phát hiện) và "Rà ảnh (tester 19/11, lượt 2)" c11; `apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/ExplorerQuestionStep.swift:165, 173`; SK-040 (app chạy bài Explorer, "chưa VoiceOver thật"); SK-044, SK-047

## Mục tiêu

Bé dùng VoiceOver nghe được thẻ lựa chọn Explorer là hình gì, nhưng không nghe ra đáp án trước khi chọn. Như vậy câu hỏi vẫn là câu hỏi với mọi bé.

## Vấn đề

`ExplorerQuestionStep` dựng ảnh của thẻ lựa chọn bằng `ContentPicture(…, accessibilityLabel: nil)`, rồi gắn `.accessibilityLabel(Text(verbatim: mode.sentence(option.label)))`. Hệ quả:
- VoiceOver đọc `label` của lựa chọn, không bao giờ đọc `alt` của ảnh;
- `label` thường chứa đúng chữ phân biệt đáp án.

Ví dụ ở *Lớn lên*:
- bài 1 q5 "Which plant is old?": `label` "old tree" · "cây già", đứng giữa hai nhãn "young";
- bài 2 w2 "Which dog is old?": "old dog";
- bài 3 q5 "Which baby starts in an egg, too?": "baby sea turtles".

Content-editor đã viết `alt` riêng không lộ đáp án cho ba câu này, nhưng app chưa đọc `alt` ở thẻ lựa chọn. Lỗi này có ở cả repo, không riêng SK-053.

## Phương án (PM chốt trước khi ios-dev làm)

| | Cách làm | Được | Mất |
| --- | --- | --- | --- |
| A | Trước khi trả lời, VoiceOver đọc `alt` của ảnh lựa chọn. Sau khi trả lời (đúng, hoặc sai rồi hiện `feedback`) thì đọc `label`. | Bé biết hình gì mà không nghe đáp án. Dùng lại các `alt` đã viết. | Phải có luật: `alt` của lựa chọn không chứa chữ phân biệt đáp án. Cần rà `alt` cả Explorer; có thể thêm cảnh báo trong `validate`. |
| B | Trước khi trả lời, đọc "Lựa chọn một / hai / ba". | Dễ làm, không lộ đáp án. | Bé khiếm thị không biết hình là gì, nên câu hỏi vô nghĩa với bé. |
| C | Giữ đọc `label`, sửa `label` để không chứa chữ phân biệt (vd "old tree" thành "big tree"). | Không đổi app. | `label` còn hiện ở chỗ khác (Tổng kết, `feedback`) nên mất nghĩa. Phải sửa nội dung cả repo và chạy lại `tts`. |

**PM đề xuất A.** Lý do:
- giữ được nghĩa của `label` ở các chỗ khác;
- `alt` đã có cho 100% ảnh (luật SK-033);
- ba câu của SK-053 đã có `alt` đúng kiểu này.

## Phạm vi / Ngoài phạm vi

### Phạm vi (theo phương án A; nếu chọn khác thì PM sửa ticket)
- **ios-dev:**
  - Thẻ `single_choice` có hình của Explorer: trước khi trả lời, VoiceOver đọc `mode.sentence(alt)`; sau khi trả lời thì đọc `label` như hiện tại.
  - Kiểm thêm thẻ `order_sequence` và món kệ Chơi của Explorer xem có cùng kiểu lộ không; có thì làm cùng luật.
  - Kiểm `label` có được hiện thành chữ, hoặc được giọng app đọc to ở chế độ nghe, trước khi trả lời không. Nếu có thì đây là lỗi lớn hơn, báo PM ngay.
- **content-editor** (song song): rà `alt` của mọi lựa chọn và mọi thẻ xếp trong `content/explorer/**`; liệt kê và sửa các `alt` chứa chữ phân biệt đáp án. Tester SK-053 đã quét *Lớn lên*: 0 `alt` của lựa chọn đúng trùng chữ câu hỏi.
- **dev** (tuỳ chọn, PM quyết sau khi có kết quả rà): cảnh báo `validate` khi `alt` của lựa chọn đúng chứa từ có trong câu hỏi mà các lựa chọn sai không có.

### Ngoài phạm vi
- Discoverer, Scientist: bé đọc được chữ, `label` hiện trên thẻ là chủ ý.
- VoiceOver cho các màn khác (Học, Từ, Tổng kết); làm ở ticket VoiceOver chung khi có.
- Đổi `label` trong nội dung.

## Tiêu chí nghiệm thu
- [ ] PM ghi phương án đã chốt vào ticket. Phương án A được chốt thì các tiêu chí dưới áp dụng nguyên văn.
- [ ] Trên simulator iPhone 16, bật VoiceOver, mở *Lớn lên* bài 1 q5 rồi vuốt qua ba thẻ. Nghe được "Small green plants in the soil", "A big tree with many roots", "A tree with a thin trunk" (hoặc bản VI theo chế độ), **không** nghe "old tree". Chọn sai một thẻ, rồi vuốt lại thẻ đó: nghe `label` hoặc `feedback`.
- [ ] Làm tương tự với *Lớn lên* bài 2 w2 và bài 3 q5: trước khi trả lời không nghe "old dog", "baby sea turtles".
- [ ] Unit test cho hàm chọn chuỗi accessibility của thẻ (đang chờ trả lời → `alt`; đã trả lời → `label`), cả ba chế độ ngôn ngữ.
- [ ] Content-editor nộp danh sách `alt` lựa chọn đã rà (số câu, số `alt` đã sửa) cho toàn Explorer; `validate content` 0 lỗi.
- [ ] `ContentModelTests`, `ContentKitTests`, `LessonPlayerTests`, `ScienceKidsTests` xanh trên iPhone 16, một máy, một lượt.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc:** PM chốt phương án; SK-040 (màn Explorer). Không đụng các file đang có thay đổi chưa commit của phiên khác trong `apps/ios` khi chưa hỏi phiên chính.

**Câu hỏi còn mở:**
- Duy có muốn coi trẻ khiếm thị là người dùng mục tiêu của Explorer ở GĐ 0 không? Nếu không, ticket này hạ ưu tiên, nhưng vẫn nên làm trước khi lên store (Apple xét accessibility).
- Ở chế độ "cả hai" ngôn ngữ, VoiceOver đọc `alt` EN rồi VI như `mode.sentence` hiện tại, hay chỉ một thứ tiếng? PM đề xuất giữ đúng như `label` đang làm.
