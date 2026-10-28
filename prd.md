# Science Kids — PRD

> Bản copy để review từ artifact (https://claude.ai/artifact/LvMccnKLBikQZFfJYuX2fe).
> **File này là nguồn review chính — sửa trực tiếp ở đây; khi plan chốt sẽ publish lại artifact.**
> Syllabus chi tiết: [syllabus.md](syllabus.md) · Wireframes: [design/wireframes/](design/wireframes/) và https://claude.ai/artifact/1sqc8tNvXN5h14zfLpyXZZ
> Cập nhật: 28/10/2026 (thêm mục 6 · Tài khoản phụ huynh và hồ sơ con)

## 1. Tổng quan & quyết định đã chốt

**Science Kids** — app học khoa học song ngữ (Anh–Việt) cho trẻ 5–11 tuổi. Syllabus bám khung primary science của Oak National Academy (UK); **toàn bộ nội dung, hình ảnh, thiết kế tự làm riêng**.

Quyết định đã chốt (21/10/2026):
- Nền tảng: **iOS native (Swift/SwiftUI) + Android native (Kotlin/Jetpack Compose)** — không React Native.
- Thứ tự (28/10/2026): **iOS làm trước, universal iPhone + iPad ngay từ đầu**; Android bắt đầu khi iOS vào beta. Backend chốt Supabase.
- Thị trường: **cả hai** — phụ huynh VN đại trà + trường quốc tế/song ngữ/trung tâm tiếng Anh (chỉ khác chế độ ngôn ngữ mặc định).
- Giá: **freemium unlock** — chủ đề đầu mỗi nhóm tuổi free, mở khoá bằng subscription tháng hoặc năm.
- Ngôn ngữ: EN là chính; VI là phụ đề và giải thích. **Giọng đọc có cả tiếng Anh và tiếng Việt** (đổi 28/10/2026, trước đó chỉ TTS tiếng Anh): bé 5–7 chưa đọc được chữ tiếng Việt nên phụ đề VI cũng phải nghe được. Giọng đọc là lựa chọn lúc bắt đầu: chỉ EN, chỉ VI, hoặc cả hai.
- Oak: **chỉ tham khảo sườn** (chủ đề, thứ tự, mục tiêu, từ vựng, misconception). Ví dụ phần animals: lấy sườn cách nhóm động vật; hình ảnh, thiết kế, nội dung làm riêng.

## 2. Phân tích Oak National Academy (tóm tắt)

- 38 units / ~390 lessons, Year 1–6 (KS1: Y1–2, KS2: Y3–6); 15 threads "Big Questions" xuyên suốt 6 năm.
- Mỗi lesson rất nhất quán: outcome "I can…", 5 key points, 5 keywords + định nghĩa, 1 misconception, starter + exit quiz (6 câu mỗi quiz: MCQ, true/false, multi-select, điền từ, câu hình), video + transcript, slide theo learning cycles (giảng → check → luyện → feedback).
- Open API miễn phí (open-api.thenational.academy, xin key qua form) — có bulk download JSON, hữu ích để tra cứu sườn nhanh.
- Giấy phép OGL v3.0 (Collection 2) cho phép dịch/dùng thương mại kèm ghi công; vì ta chỉ tham khảo sườn nên rủi ro giấy phép ≈ 0. Không dùng tên/logo Oak trong marketing.

Nguồn: https://www.thenational.academy/teachers/programmes/science-primary/units · https://open-api.thenational.academy (khảo sát 21/10/2026)

## 3. Người dùng mục tiêu & personas

| Persona | Mô tả | Nhu cầu chính | Hàm ý thiết kế |
| --- | --- | --- | --- |
| Bé 5–7 (Explorer) | Chưa đọc thạo, chú ý ngắn | Xem – nghe – chạm, bài 5–7 phút | Audio EN và VI đọc mọi thứ, đáp án bằng hình, ít chữ, nút to |
| Bé 7–9 (Discoverer) — **pilot** | Đọc tốt, thích thi đua | Quiz, điểm, huy hiệu, streak | Gamification, flashcard EN–VI, thử thách tuần |
| Bé 9–11 (Scientist) | Tư duy trừu tượng hơn | Thử thách, thí nghiệm | Đọc hiểu EN dài hơn, câu hỏi mở |
| Phụ huynh | Bận, muốn con học có định hướng | Theo dõi tiến độ, kiểm soát thời gian | Dashboard + PIN, báo cáo tuần, giới hạn phiên học |
| Giáo viên/trung tâm (GĐ 3) | Dạy song ngữ, cần giáo cụ | Giao bài, xem điểm cả lớp | Chế độ lớp học, không nằm trong MVP |

Trẻ dưới 13 tuổi → chuẩn COPPA/GDPR-K: không quảng cáo hành vi, đăng ký qua phụ huynh, dữ liệu tối thiểu.

## 4. Mô hình nội dung & song ngữ

Nguyên tắc: Oak cho **cái sườn** — chủ đề, thứ tự, mục tiêu, từ vựng, misconception; app tự làm **phần ruột** — kịch bản, hình ảnh, animation, câu quiz. Tiếng Anh là ngôn ngữ chính; tiếng Việt là phụ đề/giải thích dạng text. Mỗi bản ghi lưu song song `en` và `vi`.

| Cấp | Tham khảo từ Oak | Tự làm riêng trong app |
| --- | --- | --- |
| Chương trình | Khung Year 1–6, 15 Big Questions, thứ tự unit | Gom thành 3 nhóm tuổi: 5–7, 7–9, 9–11 |
| Chủ đề (unit) | Tên chủ đề, prior knowledge, "why this why now" | Tên VI, mô tả, icon, số bài rút gọn (4–8 bài/chủ đề) |
| Bài học | Mục tiêu "I can…", 5 key points, 5 keywords, 1 misconception | Kịch bản, lời thoại EN + phụ đề VI, hình/animation |
| Quiz | Cấu trúc 6 câu + các dạng câu hỏi | Toàn bộ câu chữ và hình đáp án |
| Media | Cách giảng trong video mẫu (tham khảo) | Hình minh hoạ, animation, audio EN và VI tự sản xuất |

Pipeline sản xuất: chốt syllabus ([syllabus.md](syllabus.md)) → Claude API draft kịch bản EN theo template, biên tập viên sửa → phụ đề VI + hình riêng → markdown trong repo + CLI publish ở MVP (CMS ở GĐ 2, đổi 28/10/2026) → QA → publish (draft → reviewed → published).

3 chế độ ngôn ngữ: Song ngữ (EN + phụ đề VI — mặc định VN đại trà) · EN-first (trường quốc tế/trung tâm) · VI-first (mới bắt đầu). **Giọng đọc là một lựa chọn lúc bắt đầu** (bố mẹ chọn khi thiết lập, đổi được trong Góc phụ huynh): chỉ tiếng Anh · chỉ tiếng Việt · cả hai (EN đọc trước, VI đọc theo sau). Mặc định gợi ý theo chế độ ngôn ngữ: Song ngữ → cả hai, EN-first → chỉ EN, VI-first → cả hai; với bé 5–7 gợi ý cả hai vì bé chưa đọc được chữ.

## 5. Tính năng cốt lõi

| Tính năng | Mô tả | Giai đoạn |
| --- | --- | --- |
| Onboarding chọn tuổi + ngôn ngữ | Map Year 1–6 sang độ tuổi/lớp VN; 3 chế độ ngôn ngữ | MVP |
| Vòng lặp bài học | Khởi động (ôn bài cũ) → nội dung → exit quiz 6 câu | MVP |
| Quiz engine | MCQ, true/false, multi-select, điền từ, câu hình; giải thích sau mỗi câu | MVP |
| Media bài học | MVP: hình minh hoạ tĩnh + audio EN và VI; animation đầy đủ ở GĐ 2 | MVP |
| Flashcards từ vựng EN–VI | Sinh từ keywords mỗi bài; nghe được cả từ EN lẫn nghĩa VI | MVP |
| Tài khoản phụ huynh + hồ sơ con | Free dùng chế độ khách, 1 hồ sơ con; Premium cần tài khoản phụ huynh, nhiều hồ sơ con (mục 6) | MVP |
| Freemium unlock | Chủ đề đầu mỗi nhóm free; mở khoá bằng subs tháng/năm, cần đăng ký tài khoản phụ huynh trước khi trả tiền | MVP |
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

| | Khách (free) | Premium |
| --- | --- | --- |
| Tài khoản phụ huynh | Chưa có | Bắt buộc |
| Số hồ sơ con | 1 | Nhiều (số tối đa còn mở) |
| Nội dung | Chủ đề free đầu mỗi nhóm tuổi | Toàn bộ |
| Tiến độ | Lưu theo thiết bị | Theo tài khoản, đồng bộ nhiều máy |

Luồng chính:

1. Cài app → bố mẹ chọn chế độ ngôn ngữ và tạo hồ sơ con đầu tiên → bé học ngay ở chế độ khách.
2. Bé chạm nội dung Premium, hoặc bố mẹ chạm "Thêm hồ sơ con" → cổng phụ huynh → đăng ký tài khoản phụ huynh → chọn gói → thanh toán qua App Store / Google Play.
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

## 7. Kiến trúc kỹ thuật

Luồng nội dung một chiều: **Oak API (tham khảo syllabus) → Thiết kế syllabus → Soạn & duyệt nội dung (markdown + CLI ở MVP, CMS ở GĐ 2) → Supabase → App iOS + App Android + Góc phụ huynh (web)**. App chỉ đọc bản đã duyệt.

- Stack: iOS native (Swift/SwiftUI) + Android native (Kotlin/Jetpack Compose); backend Supabase (Postgres, Auth, Storage); CMS Next.js ở GĐ 2 (28/10/2026: MVP dùng markdown + CLI).
- Nội dung đóng gói JSON theo schema thống nhất để iOS và Android render giống nhau, không hard-code bài học trong app.
- Claude API hỗ trợ biên tập viên draft kịch bản + câu quiz nháp (không dùng output thẳng cho trẻ).
- TTS cho cả tiếng Anh và tiếng Việt (câu hỏi, câu học, từ vựng, lời mascot); sinh lúc publish, không sinh trên máy bé.

## 8. Wireframes & định hướng thiết kế

7 màn hình (mobile 390×844), file nguồn tại [design/wireframes/](design/wireframes/), xem trực tiếp tại canvas: https://claude.ai/artifact/1sqc8tNvXN5h14zfLpyXZZ (bấm Play để click theo luồng).

| Màn hình | Vai trò chính |
| --- | --- |
| 1 · Onboarding | Chọn chế độ ngôn ngữ + độ tuổi |
| 2 · Trang chủ | Thẻ "Học tiếp", chủ đề theo nhóm, Big Questions, streak |
| 3 · Chủ đề | Danh sách bài: xong / đang học / khoá |
| 4 · Bài học | Stepper 4 bước, media, mục tiêu "I can…", key points, keywords EN–VI |
| 5 · Quiz | 6 câu, đáp án bằng hình, nút đọc to, gợi ý từ misconception |
| 6 · Huy hiệu & tiến độ | Sao, streak, tiến độ Big Questions, ôn tập tuần |
| 7 · Góc phụ huynh | PIN, báo cáo tuần, giới hạn giờ, gói Premium |

Visual: nền sáng, font Nunito, bo góc lớn, 1 accent xanh, nút chạm ≥ 44px.

## 9. Roadmap

| Giai đoạn | Thời gian | Nội dung | Gate |
| --- | --- | --- | --- |
| **GĐ 0 · Thiết kế nội dung** | T11/2026–T1/2027 (~8 tuần) | Syllabus 3 nhóm; soạn nội dung pilot Year 3 (chủ đề 1–6, ~34 bài); schema + CLI publish (CMS lùi GĐ 2) | Nội dung Y3 sẵn sàng (16/1/2027) |
| **GĐ 1 · MVP 2 app native** | T1–T4/2027 | Vòng lặp bài học + quiz, gamification, góc phụ huynh | Beta 50 gia đình đạt |
| **GĐ 2 · Mở rộng** | T4–T7/2027 | Đủ Year 1–6, ôn ngắt quãng, offline, animation đầy đủ, CMS Next.js | Lên App Store / CH Play |

MVP chỉ làm 1 nhóm tuổi (pilot Year 3 / 7–9 tuổi) nhưng chạy song song 2 app native — phần tốn nhất là sản xuất nội dung, nên GĐ 0 dồn toàn lực vào syllabus + nội dung trước khi code app. Timeline chi tiết GĐ 0: xem [syllabus.md](syllabus.md).

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
| Chi phí duy trì 2 app native song song | Trung bình | Schema nội dung chung, app chỉ là renderer |
| Nội dung dậy thì (Human development) | Trung bình | Cờ "nội dung nhạy cảm", phụ huynh bật/tắt |
| Dữ liệu trẻ em (COPPA/GDPR-K, quy định VN) | Trung bình | Đăng ký qua phụ huynh, data tối thiểu; chế độ khách chỉ lưu tên gọi, hình đại diện, lớp và tiến độ — cần rà lại với luật trước khi launch |
| Mất tiến độ ở chế độ khách khi đổi máy hoặc xoá app | Trung bình | Nhắc bố mẹ đăng ký để giữ tiến độ (nhắc ở Góc phụ huynh, không chặn trẻ đang học) |
| Thương hiệu: không dùng tên/logo Oak | Thấp | Chỉ ghi "tham khảo khung chương trình" ở about |

**Đã chốt (21/10/2026):** native iOS + Android · cả 2 thị trường · freemium unlock + subs tháng/năm · Oak chỉ làm sườn syllabus. **Đổi 28/10/2026:** giọng đọc có cả tiếng Việt (trước đó chốt không TTS tiếng Việt).

**Còn mở:**
- [ ] Chốt tên app — shortlist: **ToMo Science** ("tò mò", đọc dễ cả EN/VI), **SciBee**, **AtomKids** (khớp logo atom), **WonderLab Kids**, **Khám Phá Kids**; check trùng App Store/Google Play + nhãn hiệu VN trước khi chốt
- [ ] Mức giá cụ thể gói tháng/năm cho từng thị trường
- [ ] Các câu hỏi còn mở về tài khoản và hồ sơ con (mục 6)
- [ ] Đội sản xuất nội dung: ai soạn kịch bản, ai duyệt chuyên môn
- [ ] Phong cách hình ảnh / nhân vật mascot (liên quan tới tên app)
