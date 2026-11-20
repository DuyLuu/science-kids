# Science Kids — PRD

> Bản copy để review từ artifact (https://claude.ai/artifact/LvMccnKLBikQZFfJYuX2fe).
> **File này là nguồn review chính — sửa trực tiếp ở đây; khi plan chốt sẽ publish lại artifact.**
> Syllabus chi tiết: [syllabus.md](syllabus.md), danh sách từng bài [syllabus-lessons.md](syllabus-lessons.md), danh mục app đọc `content/syllabus.json` · Wireframes: [design/wireframes/](design/wireframes/) và https://claude.ai/artifact/1sqc8tNvXN5h14zfLpyXZZ
> Cập nhật: 28/10/2026 (thêm mục 6 · Tài khoản phụ huynh và hồ sơ con); 1/11/2026 (mục 3: quiz của bé 5–7 làm được bằng nghe và nhìn, không hiện điểm; Duy chốt SK-026); 9/11/2026 (Duy duyệt syllabus mới: 45 chủ đề, 384 bài, chủ đề mới đứng đầu rồi unit Oak theo thứ tự Oak, không khoá bài, gói trả phí tạm tắt; sửa mục 1, 4, 5, 6, 7, 8, 9, 11. Phạm vi pilot GĐ 0: Duy chốt 6 chủ đề đầu Discoverer, 38 bài); 16/11/2026 (thêm chủ đề Explorer #4 *Những nơi sống trên Trái Đất*, 8 bài, Duy chốt, SK-048; danh mục nay 46 chủ đề, 394 bài; sửa mục 1, 9, 11); 16/11/2026 (Quiz Đợt 1, SK-047: thêm bước Tổng kết bài sau quiz và nút gợi ý; sửa mục 5); 17/11/2026 (gộp hai chủ đề mùa của Explorer thành chủ đề mới #5 *Thời tiết và các mùa*, 6 bài, Duy yêu cầu và chốt, SK-050; danh mục nay 45 chủ đề, 390 bài; sửa mục 1, 9, 11); 19/11/2026 (số đếm sau SK-051 *Cây quanh em* và SK-053 *Lớn lên*, Duy chốt 18/11: danh mục nay 44 chủ đề, 383 bài; sửa mục 1, 9, 11); 19/11/2026 (Duy chốt lộ trình Explorer theo cách (a), SK-057: bỏ hai chủ đề vật liệu và *Em khoẻ mạnh*, thêm ba chủ đề Trái Đất và bầu trời; khi danh mục đổi: 44 chủ đề, 381 bài; sửa mục 1, 9, 11); 19/11/2026 (Duy bỏ *Nước quanh em* khỏi Explorer, ý nước để Discoverer đào sâu; *Bầu trời ngày và đêm* thành #10, SK-061; khi danh mục đổi: 43 chủ đề, 375 bài; sửa mục 1, 9, 11)

## 1. Tổng quan & quyết định đã chốt

**Science Kids** — app học khoa học song ngữ (Anh–Việt) cho trẻ 5–11 tuổi. Syllabus bám khung primary science của Oak National Academy (UK); **toàn bộ nội dung, hình ảnh, thiết kế tự làm riêng**.

Quyết định đã chốt (21/10/2026):
- Nền tảng: **iOS native (Swift/SwiftUI) + Android native (Kotlin/Jetpack Compose)** — không React Native.
- Thứ tự (28/10/2026): **iOS làm trước, universal iPhone + iPad ngay từ đầu**; Android bắt đầu khi iOS vào beta. Backend chốt Supabase.
- Thị trường: **cả hai** — phụ huynh VN đại trà + trường quốc tế/song ngữ/trung tâm tiếng Anh (chỉ khác chế độ ngôn ngữ mặc định).
- Giá: **freemium unlock**, mở khoá bằng subscription tháng hoặc năm. **Đổi 9/11/2026:** gói trả phí vẫn có trong sản phẩm nhưng **tạm tắt**; bản build để test mở toàn bộ; chủ đề miễn phí của mỗi nhóm chọn sau, khi bật lại (trước đó: chủ đề đầu mỗi nhóm tuổi free).
- Syllabus (Duy duyệt 9/11/2026, thay bản 26/10 xếp theo độ khó; thêm một chủ đề 16/11/2026; gộp hai chủ đề mùa 17/11/2026): giữ 3 nhóm tuổi; trong mỗi nhóm, chủ đề mới (từ sách bách khoa thiếu nhi và CT GDPT 2018) đứng đầu, rồi các unit Oak đúng thứ tự trên trang Oak. Explorer có ba chỗ lệch Duy chốt: *Sinh vật sống ở đâu?*, *Chuỗi thức ăn* lên #2, #3 (14/11); chủ đề mới *Những nơi sống trên Trái Đất* ở #4, không đứng đầu (16/11); chủ đề mới *Thời tiết và các mùa* ở #5, gộp hai unit Oak Year 1 *Seasonal changes* (17/11, SK-050). 1 bài app = 1 lesson Oak, riêng thí nghiệm plan/do/review gộp thành 1 bài (trừ chủ đề gộp 17/11). **45 chủ đề, 390 bài** (từ 17/11/2026; 35 unit Oak và 10 chủ đề mới): Explorer 12 chủ đề / 79 bài, Discoverer 17 / 155, Scientist 16 / 156; bỏ unit Oak *Materials* (Year 6). 390 là số đếm từ danh mục `content/syllabus.json`: 384 bài duyệt 9/11, cộng 2 bài mở rộng của Explorer #1 mà các bản trước chưa cộng, cộng 8 bài của *Những nơi sống trên Trái Đất*, trừ 10 bài của hai chủ đề mùa, cộng 6 bài của *Thời tiết và các mùa* (384 + 2 + 8 − 10 + 6 = 390). Bản 16/11 là 46 chủ đề, 394 bài. **Từ 19/11/2026: 44 chủ đề, 383 bài** (34 unit Oak, 10 chủ đề mới): Explorer 11 / 72, Discoverer 17 / 155, Scientist 16 / 156. Hai lần đổi, Duy chốt 18/11: SK-051 gộp unit Oak *Growing plants* vào *Cây quanh em* (390 − 8 = 382); SK-053 đổi *Sự sống mới* thành *Lớn lên*, 5 bài thành 6 (382 + 1 = 383). **Duy chốt 19/11/2026 (cách (a), SK-057, danh mục đang đổi):** Explorer bỏ ba unit Oak *Everyday materials*, *Uses of everyday materials*, *Healthy me* (20 bài chưa soạn), thêm ba chủ đề mới *Núi, sông và biển*, *Nước quanh em*, *Bầu trời ngày và đêm* (18 bài); khi xong là **44 chủ đề, 381 bài** (31 unit Oak, 13 chủ đề mới): Explorer 11 / 70, Discoverer 17 / 155, Scientist 16 / 156. **Duy chốt 19/11/2026 (lượt 2, SK-061):** bỏ *Nước quanh em* (6 bài chưa soạn; ý nước để Discoverer #9 đào sâu), *Bầu trời ngày và đêm* thành #10; khi danh mục đổi là **43 chủ đề, 375 bài** (31 unit Oak, 12 chủ đề mới): Explorer 10 / 64, Discoverer 17 / 155, Scientist 16 / 156. Lộ trình mới cho Discoverer, Scientist (bản rà 18/11) còn chờ Duy chốt. **Không khoá bài:** mọi chủ đề, mọi bài mở; app gợi ý bài tiếp theo. Chi tiết ở [syllabus.md](syllabus.md) mục 0–6.
- Ngôn ngữ: EN là chính; VI là phụ đề và giải thích. **Giọng đọc có cả tiếng Anh và tiếng Việt** (đổi 28/10/2026, trước đó chỉ TTS tiếng Anh): bé 5–7 chưa đọc được chữ tiếng Việt nên phụ đề VI cũng phải nghe được. Giọng đọc là lựa chọn lúc bắt đầu: chỉ EN, chỉ VI, hoặc cả hai.
- Oak: **chỉ tham khảo sườn** (chủ đề, thứ tự, mục tiêu, từ vựng, misconception). Ví dụ phần animals: lấy sườn cách nhóm động vật; hình ảnh, thiết kế, nội dung làm riêng. Có 10 chủ đề ngoài Oak Science, tự dựng sườn (Explorer 2, Discoverer 5, Scientist 3): 8 chủ đề từ 9/11/2026, *Những nơi sống trên Trái Đất* từ 16/11/2026 (Explorer #4, sườn một phần từ Oak Địa lý Year 2) và *Thời tiết và các mùa* từ 17/11/2026 (Explorer #5, gộp hai unit Oak Year 1 *Seasonal changes*; Duy: "không cần quá phụ thuộc vào oak"). Khi SK-057 xong (Duy chốt 19/11/2026) là 13 chủ đề: thêm Explorer #9–#11 (Trái Đất và bầu trời), Explorer có 5.

## 2. Phân tích Oak National Academy (tóm tắt)

- 38 units / ~390 lessons, Year 1–6 (KS1: Y1–2, KS2: Y3–6); 15 threads "Big Questions" xuyên suốt 6 năm.
- Mỗi lesson rất nhất quán: outcome "I can…", 5 key points, 5 keywords + định nghĩa, 1 misconception, starter + exit quiz (6 câu mỗi quiz: MCQ, true/false, multi-select, điền từ, câu hình), video + transcript, slide theo learning cycles (giảng → check → luyện → feedback).
- Open API miễn phí (open-api.thenational.academy, xin key qua form) — có bulk download JSON, hữu ích để tra cứu sườn nhanh.
- Giấy phép OGL v3.0 (Collection 2) cho phép dịch/dùng thương mại kèm ghi công; vì ta chỉ tham khảo sườn nên rủi ro giấy phép ≈ 0. Không dùng tên/logo Oak trong marketing.

Nguồn: https://www.thenational.academy/teachers/programmes/science-primary/units · https://open-api.thenational.academy (khảo sát 21/10/2026)

## 3. Người dùng mục tiêu & personas

| Persona | Mô tả | Nhu cầu chính | Hàm ý thiết kế |
| --- | --- | --- | --- |
| Bé 5–7 (Explorer) | Chưa đọc thạo, chú ý ngắn | Xem – nghe – chạm, bài 5–7 phút | Audio EN và VI đọc mọi thứ, đáp án bằng hình, ít chữ, nút to. Làm được quiz chỉ bằng nghe và nhìn: lựa chọn, Đúng/Sai và nút không có chữ. Không hiện điểm số hay XP; thưởng bằng sao và sticker (1/11/2026, SK-026) |
| Bé 7–9 (Discoverer) — **pilot** | Đọc tốt, thích thi đua | Quiz, điểm, huy hiệu, streak | Gamification, flashcard EN–VI, thử thách tuần |
| Bé 9–11 (Scientist) | Tư duy trừu tượng hơn | Thử thách, thí nghiệm | Đọc hiểu EN dài hơn, câu hỏi mở |
| Phụ huynh | Bận, muốn con học có định hướng | Theo dõi tiến độ, kiểm soát thời gian | Dashboard + PIN, báo cáo tuần, giới hạn phiên học |
| Giáo viên/trung tâm (GĐ 3) | Dạy song ngữ, cần giáo cụ | Giao bài, xem điểm cả lớp | Chế độ lớp học, không nằm trong MVP |

Trẻ dưới 13 tuổi → chuẩn COPPA/GDPR-K: không quảng cáo hành vi, đăng ký qua phụ huynh, dữ liệu tối thiểu.

## 4. Mô hình nội dung & song ngữ

Nguyên tắc: Oak cho **cái sườn** — chủ đề, thứ tự, mục tiêu, từ vựng, misconception; app tự làm **phần ruột** — kịch bản, hình ảnh, animation, câu quiz. Tiếng Anh là ngôn ngữ chính; tiếng Việt là phụ đề/giải thích dạng text. Mỗi bản ghi lưu song song `en` và `vi`.

| Cấp | Tham khảo từ Oak | Tự làm riêng trong app |
| --- | --- | --- |
| Chương trình | Khung Year 1–6, 15 Big Questions, thứ tự unit | Gom thành 3 nhóm tuổi: 5–7, 7–9, 9–11; chủ đề mới đứng đầu mỗi nhóm, rồi unit Oak theo thứ tự Oak (9/11/2026) |
| Chủ đề (unit) | Tên chủ đề, thứ tự lesson, prior knowledge, "why this why now" | Tên VI, mô tả, icon. Từ 9/11/2026: 1 bài app = 1 lesson Oak, riêng thí nghiệm plan/do/review gộp 1 bài, nên mỗi chủ đề có 4–19 bài (thay mức rút gọn 4–8 bài/chủ đề, ~201 bài, của bản 26/10) |
| Bài học | Mục tiêu "I can…", 5 key points, 5 keywords, 1 misconception | Kịch bản, lời thoại EN + phụ đề VI, hình/animation |
| Quiz | Cấu trúc 6 câu + các dạng câu hỏi | Toàn bộ câu chữ và hình đáp án |
| Media | Cách giảng trong video mẫu (tham khảo) | Hình minh hoạ, animation, audio EN và VI tự sản xuất |

Pipeline sản xuất: chốt syllabus ([syllabus.md](syllabus.md)) → Claude API draft kịch bản EN theo template, biên tập viên sửa → phụ đề VI + hình riêng → markdown trong repo + CLI publish ở MVP (CMS ở GĐ 2, đổi 28/10/2026) → QA → publish (draft → reviewed → published).

3 chế độ ngôn ngữ: Song ngữ (EN + phụ đề VI — mặc định VN đại trà) · EN-first (trường quốc tế/trung tâm) · VI-first (mới bắt đầu). **Giọng đọc là một lựa chọn lúc bắt đầu** (bố mẹ chọn khi thiết lập, đổi được trong Góc phụ huynh): chỉ tiếng Anh · chỉ tiếng Việt · cả hai (EN đọc trước, VI đọc theo sau). Mặc định gợi ý theo chế độ ngôn ngữ: Song ngữ → cả hai, EN-first → chỉ EN, VI-first → cả hai; với bé 5–7 gợi ý cả hai vì bé chưa đọc được chữ.

## 5. Tính năng cốt lõi

| Tính năng | Mô tả | Giai đoạn |
| --- | --- | --- |
| Onboarding chọn tuổi + ngôn ngữ | Map Year 1–6 sang độ tuổi/lớp VN; 3 chế độ ngôn ngữ | MVP |
| Hành trình học (9/11/2026) | Trang chủ hiện đủ chủ đề của nhóm theo thứ tự syllabus, màn chủ đề hiện đủ bài. Không khoá bài: app gợi ý bài tiếp theo và đánh dấu bài đã học; bài chưa soạn hiện tên và báo chưa có nội dung | MVP |
| Vòng lặp bài học | Khởi động (ôn bài cũ) → nội dung → exit quiz 6 câu → Tổng kết bài → phần thưởng. Tổng kết (16/11/2026, SK-047): 2 màn, bé xem lại 3 ý chính, ý sai → ý đúng, từ mới và mục tiêu "I can…"; không chấm, bỏ qua được; có bản cho bé 5–7 (Explorer) và bé 7–9 (Discoverer). Bé 7–9 có nút gợi ý ở mỗi câu, mở được cả trước khi trả lời mà vẫn được điểm; bé 5–7 không có nút, nghe gợi ý sau lần sai | MVP |
| Quiz engine | MCQ, true/false, multi-select, điền từ, câu hình; giải thích sau mỗi câu | MVP |
| Media bài học | MVP: hình minh hoạ tĩnh + audio EN và VI; animation đầy đủ ở GĐ 2 | MVP |
| Flashcards từ vựng EN–VI | Sinh từ keywords mỗi bài; nghe được cả từ EN lẫn nghĩa VI | MVP |
| Tài khoản phụ huynh + hồ sơ con | Free dùng chế độ khách, 1 hồ sơ con; Premium cần tài khoản phụ huynh, nhiều hồ sơ con (mục 6) | MVP |
| Freemium unlock | Mở khoá bằng subs tháng/năm, cần đăng ký tài khoản phụ huynh trước khi trả tiền. **Tạm tắt từ 9/11/2026:** bản test mở toàn bộ, không có cổng trả phí; chủ đề miễn phí chọn sau (trước đó: chủ đề đầu mỗi nhóm free) | MVP; thời điểm bật lại chờ Duy |
| Gamification | Sao, streak, huy hiệu theo Big Questions | MVP |
| Góc phụ huynh | PIN, báo cáo tuần, giới hạn thời gian, quản lý hồ sơ con và subscription | MVP |
| Ôn tập ngắt quãng | Spaced repetition từ dữ liệu quiz | GĐ 2 |
| Chế độ offline | Tải chủ đề về máy | GĐ 2 |
| Lớp học giáo viên/trung tâm | Giao bài, xem điểm cả lớp | GĐ 3 |
| Thí nghiệm tại nhà | Checklist dụng cụ + hướng dẫn an toàn | GĐ 3 |

Gamification thưởng cho nỗ lực và đều đặn, không xếp hạng so sánh giữa trẻ, không loot box.

## 6. Tài khoản phụ huynh và hồ sơ con

Ghi chú 28/10/2026 để implement. Bốn quy tắc đã chốt:

- **Một gia đình có 1 tài khoản phụ huynh và nhiều hồ sơ con**, vì một nhà có thể có nhiều trẻ. Hồ sơ con không có email, mật khẩu hay đăng nhập riêng; trẻ chọn hồ sơ của mình khi mở app.
- **Gói free chạy ở chế độ khách (guest):** không cần đăng ký, tạo được **1 hồ sơ con**.
- **Hồ sơ con thứ 2 trở đi chỉ dành cho Premium.**
- **Muốn mở khoá nội dung Premium thì phải đăng ký tài khoản phụ huynh** trước khi thanh toán.

**9/11/2026:** gói trả phí tạm tắt (mục 1). Bốn quy tắc trên giữ nguyên để dùng khi bật lại. Trong lúc tắt, mọi nội dung mở cho mọi hồ sơ, không có cổng trả phí. Có giữ giới hạn 1 hồ sơ cho khách trong lúc tắt hay không: còn mở (cuối mục).

| | Khách (free) | Premium |
| --- | --- | --- |
| Tài khoản phụ huynh | Chưa có | Bắt buộc |
| Số hồ sơ con | 1 | Nhiều (số tối đa còn mở) |
| Nội dung | Chủ đề miễn phí: chọn sau (9/11/2026; trước đó là chủ đề đầu mỗi nhóm). Trong lúc gói trả phí tạm tắt: toàn bộ | Toàn bộ |
| Tiến độ | Lưu theo thiết bị | Theo tài khoản, đồng bộ nhiều máy |

Luồng chính:

1. Cài app → bố mẹ chọn chế độ ngôn ngữ và tạo hồ sơ con đầu tiên → bé học ngay ở chế độ khách.
2. Bé chạm nội dung Premium, hoặc bố mẹ chạm "Thêm hồ sơ con" → cổng phụ huynh → đăng ký tài khoản phụ huynh → chọn gói → thanh toán qua App Store / Google Play. (Chỉ khi gói trả phí bật; từ 9/11/2026 đang tạm tắt.)
3. Hồ sơ con và toàn bộ tiến độ đã có ở chế độ khách chuyển nguyên sang tài khoản vừa đăng ký, không mất gì.
4. Có Premium thì thêm hồ sơ con thứ 2, thứ 3… trong Góc phụ huynh. Mỗi hồ sơ có nhóm tuổi, chế độ ngôn ngữ và tiến độ riêng.

Thiết kế (canvas UI/UX học mà chơi, https://claude.ai/artifact/MLvDKD33FWJ7aTMS7XX3Zk): Discoverer màn 3 Chọn hồ sơ, màn 6 Nhờ bố mẹ mở khoá, màn 7 Đăng ký phụ huynh, màn 17 Góc phụ huynh (tab Hồ sơ và gói). Màn 3 và 17 có tweak Gói free / premium.

Gợi ý kỹ thuật (Supabase):

- Chế độ khách dùng anonymous sign-in của Supabase Auth. Khi bố mẹ đăng ký, liên kết email / Apple / Google vào chính user đó để giữ nguyên `user_id`, nhờ vậy dữ liệu tự chuyển sang mà không phải copy.
- Bảng `child_profiles`: `id`, `owner_id` (auth user, khách hoặc phụ huynh), `display_name`, `avatar`, `grade`, `age_group`, `language_mode`, `created_at`, `archived_at`. Mọi bảng tiến độ (bài, quiz, thẻ, từ vựng, chuỗi ngày) khoá theo `child_profile_id`, không theo `owner_id`.
- Quyền Premium (`entitlements`) gắn với tài khoản phụ huynh, không gắn với thiết bị, để gói mua trên iOS vẫn dùng được trên Android sau khi đăng nhập. Biên lai App Store / Google Play xác minh ở server.
- Giới hạn số hồ sơ kiểm tra ở server (RLS cùng hàm tạo hồ sơ), không chỉ ở app: không có Premium thì tối đa 1 hồ sơ đang hoạt động.

Còn phải quyết:

- [ ] Số hồ sơ con tối đa của gói Premium.
- [ ] Hết hạn Premium khi đang có từ 2 hồ sơ: giữ dữ liệu, nhưng hồ sơ nào còn được học? Đề xuất: bố mẹ chọn 1 hồ sơ học tiếp, các hồ sơ khác chỉ xem được, gia hạn thì mở lại.
- [ ] Có mức "đã đăng ký nhưng không Premium" hay không (gặp khi hết hạn gói, hoặc bố mẹ muốn đồng bộ nhiều máy mà chưa trả tiền). Hiện mô hình chỉ có 2 mức.
- [ ] Cách đăng nhập của phụ huynh: email + mã OTP, Apple, Google. Theo quy định App Store (mục 4.8), nếu có đăng nhập Google thì phải có thêm một lựa chọn bảo vệ quyền riêng tư tương đương, thường là Sign in with Apple.
- [ ] PIN Góc phụ huynh ở chế độ khách: đặt PIN lưu trên máy ngay lúc thiết lập, hay chỉ dùng câu đố cho người lớn đến khi đăng ký?
- [ ] Lúc nào nhắc bố mẹ đăng ký để giữ tiến độ ở chế độ khách (đổi máy hoặc xoá app là mất).
- [ ] (9/11/2026) Gói trả phí tạm tắt tới khi nào: chỉ bản test, hết beta, hay tới khi lên store? Trong lúc tắt có giữ giới hạn 1 hồ sơ cho khách không? Giữ thì gia đình nhiều con chưa có cách tạo hồ sơ thứ 2, vì đường duy nhất là mua Premium.

## 7. Kiến trúc kỹ thuật

Luồng nội dung một chiều: **Oak API (tham khảo syllabus) → Thiết kế syllabus → Soạn & duyệt nội dung (markdown + CLI ở MVP, CMS ở GĐ 2) → Supabase → App iOS + App Android + Góc phụ huynh (web)**. App chỉ đọc bản đã duyệt.

- Stack: iOS native (Swift/SwiftUI) + Android native (Kotlin/Jetpack Compose); backend Supabase (Postgres, Auth, Storage); CMS Next.js ở GĐ 2 (28/10/2026: MVP dùng markdown + CLI).
- Nội dung đóng gói JSON theo schema thống nhất để iOS và Android render giống nhau, không hard-code bài học trong app.
- Danh mục syllabus (9/11/2026): `content/syllabus.json` liệt kê mọi chủ đề, mọi bài của 3 nhóm theo đúng thứ tự đã duyệt, kể cả bài chưa soạn, kèm mã lesson Oak. App đọc danh mục để hiện đủ hành trình; chỉ bài đã soạn mới có nội dung để tải. Bản test đọc file này từ bundle; về sau danh mục đi cùng gói nội dung (technical-plan B4.1, B4.3).
- Claude API hỗ trợ biên tập viên draft kịch bản + câu quiz nháp (không dùng output thẳng cho trẻ).
- TTS cho cả tiếng Anh và tiếng Việt (câu hỏi, câu học, từ vựng, lời mascot); sinh lúc publish, không sinh trên máy bé.

## 8. Wireframes & định hướng thiết kế

7 màn hình (mobile 390×844), file nguồn tại [design/wireframes/](design/wireframes/), xem trực tiếp tại canvas: https://claude.ai/artifact/1sqc8tNvXN5h14zfLpyXZZ (bấm Play để click theo luồng).

| Màn hình | Vai trò chính |
| --- | --- |
| 1 · Onboarding | Chọn chế độ ngôn ngữ + độ tuổi |
| 2 · Trang chủ | Thẻ "Học tiếp", chủ đề theo nhóm, Big Questions, streak |
| 3 · Chủ đề | Danh sách bài: xong / đang học / chưa học / chưa có nội dung. 9/11/2026 bỏ trạng thái khoá; wireframe và canvas chưa sửa |
| 4 · Bài học | Stepper 4 bước, media, mục tiêu "I can…", key points, keywords EN–VI |
| 5 · Quiz | 6 câu, đáp án bằng hình, nút đọc to, gợi ý từ misconception |
| 6 · Huy hiệu & tiến độ | Sao, streak, tiến độ Big Questions, ôn tập tuần |
| 7 · Góc phụ huynh | PIN, báo cáo tuần, giới hạn giờ, gói Premium |

Visual: nền sáng, font Nunito, bo góc lớn, 1 accent xanh, nút chạm ≥ 44px.

## 9. Roadmap

| Giai đoạn | Thời gian | Nội dung | Gate |
| --- | --- | --- | --- |
| **GĐ 0 · Thiết kế nội dung** | T11/2026–T1/2027 (~8 tuần) | Syllabus 3 nhóm (Duy duyệt 9/11/2026: 45 chủ đề, 384 bài; từ 16/11/2026: 46 chủ đề, 394 bài; từ 17/11/2026: 45 chủ đề, 390 bài; từ 19/11/2026: 44 chủ đề, 383 bài; khi SK-057 xong: 44 chủ đề, 381 bài; khi SK-061 xong: 43 chủ đề, 375 bài); soạn nội dung pilot Discoverer (6 chủ đề đầu, 38 bài; Duy chốt 9/11, xem dưới); schema + CLI publish (CMS lùi GĐ 2) | Nội dung pilot sẵn sàng (16/1/2027, giữ theo kế hoạch, chưa xác nhận lại) |
| **GĐ 1 · MVP 2 app native** | T1–T4/2027 | Vòng lặp bài học + quiz, gamification, góc phụ huynh | Beta 50 gia đình đạt |
| **GĐ 2 · Mở rộng** | T4–T7/2027 | Đủ 3 nhóm tuổi, Year 1–6 (từ 9/11/2026 là 384 bài, bản 26/10 khoảng 201 bài; từ 16/11/2026 là 394 bài; từ 17/11/2026 là 390 bài; từ 19/11/2026 là 383 bài, khi SK-057 xong là 381 bài, khi SK-061 xong là 375 bài), ôn ngắt quãng, offline, animation đầy đủ, CMS Next.js | Lên App Store / CH Play |

MVP chỉ soạn nội dung cho 1 nhóm tuổi (pilot Discoverer, 7–9 tuổi) nhưng chạy song song 2 app native — phần tốn nhất là sản xuất nội dung, nên GĐ 0 dồn toàn lực vào syllabus + nội dung trước khi code app. Từ 9/11/2026 app hiện đủ danh mục của cả 3 nhóm; bài chưa soạn báo chưa có nội dung. Timeline chi tiết GĐ 0: [syllabus.md](syllabus.md) mục 10, đang chờ tính lại theo phạm vi pilot.

**Phạm vi pilot GĐ 0 (Duy chốt 9/11, [syllabus.md](syllabus.md) mục 8): 6 chủ đề đầu Discoverer, 38 bài.** Gồm 5 chủ đề mới (Bề mặt Trái Đất, Khủng long, Hô hấp, Não bộ và giác quan, Thời tiết và thiên tai: 23 bài) và *Đá và đất* (15 bài); chưa bài nào soạn. Bản 26/10 là 6 chủ đề Year 3, khoảng 34 bài. *Ăn uống lành mạnh* (#9, đã soạn 2 bài) nằm ngoài pilot; 2 bài đó vẫn chơi được trong app.

## 10. Chỉ số thành công

North star: **số bài học hoàn thành có exit quiz đạt ≥ 4/6 câu đúng mỗi tuần**.

| Nhóm | Chỉ số | Mục tiêu 6 tháng sau launch |
| --- | --- | --- |
| Kích hoạt | Hoàn thành bài đầu trong 24h sau cài | ≥ 60% |
| Giữ chân | D7 retention của trẻ | ≥ 35% |
| Học tập | Điểm exit quiz trung bình | ≥ 4,5/6 |
| Học tập | Từ vựng "đã nhớ" / trẻ / tháng | ≥ 40 từ |
| Phụ huynh | Phụ huynh mở báo cáo tuần | ≥ 50% |
| Doanh thu | Chuyển đổi dùng thử → trả phí | ≥ 8% |

Beta (50 gia đình) cần đạt: D7 ≥ 25%, quiz ≥ 4/6, ≥ 3 bài/tuần/trẻ — gate để qua GĐ 2.

## 11. Rủi ro & việc còn mở

| Rủi ro | Mức | Giảm thiểu |
| --- | --- | --- |
| Tốc độ/chất lượng sản xuất nội dung tự làm | Cao | Template chuẩn + bài mẫu làm thước đo; Claude API draft, người duyệt |
| Khối lượng nội dung tăng (9/11/2026): 384 bài thay khoảng 201; 8 chủ đề mới không có sườn Oak. Từ 16/11/2026: 394 bài, 9 chủ đề mới. Từ 17/11/2026: 390 bài, 10 chủ đề mới (hai chủ đề mùa Oak gộp thành một). Từ 19/11/2026: 383 bài (SK-051, SK-053); khi SK-057 xong: 381 bài, 13 chủ đề mới; khi SK-061 xong: 375 bài, 12 chủ đề mới | Cao | Pilot đã chốt 38 bài (9/11); mốc 16/1/2027 và phạm vi GĐ 2 cần Duy chốt lại theo con số mới. Không khoá bài nên ra nội dung được theo đợt; bài chưa soạn hiện "Chưa có nội dung" |
| Không khoá bài: trẻ học nhảy cóc, gặp bài cần kiến thức nền chưa học | Thấp–trung bình | App gợi ý bài tiếp theo theo thứ tự; khởi động ôn bài trước theo thứ tự; chủ đề mới tự giới thiệu ý nền ([syllabus.md](syllabus.md) mục 2, 6) |
| Chi phí duy trì 2 app native song song | Trung bình | Schema nội dung chung, app chỉ là renderer |
| Nội dung dậy thì (Human development) | Trung bình | Cờ "nội dung nhạy cảm", phụ huynh bật/tắt |
| Dữ liệu trẻ em (COPPA/GDPR-K, quy định VN) | Trung bình | Đăng ký qua phụ huynh, data tối thiểu; chế độ khách chỉ lưu tên gọi, hình đại diện, lớp và tiến độ — cần rà lại với luật trước khi launch |
| Mất tiến độ ở chế độ khách khi đổi máy hoặc xoá app | Trung bình | Nhắc bố mẹ đăng ký để giữ tiến độ (nhắc ở Góc phụ huynh, không chặn trẻ đang học) |
| Thương hiệu: không dùng tên/logo Oak | Thấp | Chỉ ghi "tham khảo khung chương trình" ở about |

**Đã chốt (21/10/2026):** native iOS + Android · cả 2 thị trường · freemium unlock + subs tháng/năm · Oak chỉ làm sườn syllabus. **Đổi 28/10/2026:** giọng đọc có cả tiếng Việt (trước đó chốt không TTS tiếng Việt). **Đổi 9/11/2026:** syllabus 45 chủ đề, 384 bài, chủ đề mới đứng đầu rồi unit Oak theo thứ tự Oak; không khoá bài; gói trả phí tạm tắt, chủ đề miễn phí chọn sau (mục 1). **Đổi 16/11/2026:** thêm chủ đề Explorer #4 *Những nơi sống trên Trái Đất* (8 bài, SK-048): 46 chủ đề, 394 bài (mục 1). **Đổi 17/11/2026:** gộp hai chủ đề mùa Oak Year 1 thành chủ đề mới Explorer #5 *Thời tiết và các mùa* (6 bài, SK-050): 45 chủ đề, 390 bài (mục 1). **Đổi 18/11/2026:** Explorer *Cây quanh em* gộp unit Oak *Growing plants* (SK-051); *Sự sống mới* đổi thành *Lớn lên*, 6 bài (SK-053): 44 chủ đề, 383 bài từ 19/11 (mục 1). **Đổi 19/11/2026:** lộ trình Explorer theo cách (a) (SK-057): bỏ hai chủ đề vật liệu và *Em khoẻ mạnh*, thêm ba chủ đề Trái Đất và bầu trời; 44 chủ đề, 381 bài khi danh mục đổi (mục 1). **Đổi 19/11/2026 (lượt 2):** bỏ *Nước quanh em* khỏi Explorer, *Bầu trời ngày và đêm* thành #10 (SK-061): 43 chủ đề, 375 bài khi danh mục đổi (mục 1).

**Còn mở:**
- [x] Phạm vi pilot GĐ 0: 6 chủ đề đầu Discoverer, 38 bài (Duy chốt 9/11; mục 9)
- [ ] Mốc 16/1/2027 với 38 bài chưa soạn: giữ hay lùi (mục 9)
- [x] Tên VI hai chủ đề mùa của Explorer ([syllabus.md](syllabus.md) mục 8): hết hiệu lực 17/11/2026, hai chủ đề gộp thành *Thời tiết và các mùa* (SK-050)
- [ ] Gói trả phí: bật lại khi nào, chủ đề nào miễn phí (mục 1, 6)
- [ ] Chốt tên app — shortlist: **ToMo Science** ("tò mò", đọc dễ cả EN/VI), **SciBee**, **AtomKids** (khớp logo atom), **WonderLab Kids**, **Khám Phá Kids**; check trùng App Store/Google Play + nhãn hiệu VN trước khi chốt
- [ ] Mức giá cụ thể gói tháng/năm cho từng thị trường
- [ ] Các câu hỏi còn mở về tài khoản và hồ sơ con (mục 6)
- [ ] Đội sản xuất nội dung: ai soạn kịch bản, ai duyệt chuyên môn
- [ ] Phong cách hình ảnh / nhân vật mascot (liên quan tới tên app)
