# Science Kids — PRD

> Bản copy để review từ artifact (https://claude.ai/artifact/LvMccnKLBikQZFfJYuX2fe).
> **File này là nguồn review chính — sửa trực tiếp ở đây; khi plan chốt sẽ publish lại artifact.**
> Syllabus chi tiết: [syllabus.md](syllabus.md) · Wireframes: [design/wireframes/](design/wireframes/) và https://claude.ai/artifact/1sqc8tNvXN5h14zfLpyXZZ
> Cập nhật: 21/10/2026

## 1. Tổng quan & quyết định đã chốt

**Science Kids** — app học khoa học song ngữ (Anh–Việt) cho trẻ 5–11 tuổi. Syllabus bám khung primary science của Oak National Academy (UK); **toàn bộ nội dung, hình ảnh, thiết kế tự làm riêng**.

Quyết định đã chốt (21/10/2026):
- Nền tảng: **iOS native (Swift/SwiftUI) + Android native (Kotlin/Jetpack Compose)** — không React Native.
- Thị trường: **cả hai** — phụ huynh VN đại trà + trường quốc tế/song ngữ/trung tâm tiếng Anh (chỉ khác chế độ ngôn ngữ mặc định).
- Giá: **freemium unlock** — chủ đề đầu mỗi nhóm tuổi free, mở khoá bằng subscription tháng hoặc năm.
- Ngôn ngữ: EN là chính; **VI chỉ là phụ đề/text, không TTS tiếng Việt** (TTS chỉ tiếng Anh).
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
| Bé 5–7 (Explorer) | Chưa đọc thạo, chú ý ngắn | Xem – nghe – chạm, bài 5–7 phút | Audio EN đọc mọi thứ, đáp án bằng hình, ít chữ, nút to |
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
| Media | Cách giảng trong video mẫu (tham khảo) | Hình minh hoạ, animation, audio EN tự sản xuất |

Pipeline sản xuất: chốt syllabus ([syllabus.md](syllabus.md)) → Claude API draft kịch bản EN theo template, biên tập viên sửa → phụ đề VI + hình riêng → CMS → QA → publish (draft → reviewed → published).

3 chế độ ngôn ngữ: Song ngữ (EN + phụ đề VI — mặc định VN đại trà) · EN-first (trường quốc tế/trung tâm) · VI-first (mới bắt đầu). TTS chỉ tiếng Anh.

## 5. Tính năng cốt lõi

| Tính năng | Mô tả | Giai đoạn |
| --- | --- | --- |
| Onboarding chọn tuổi + ngôn ngữ | Map Year 1–6 sang độ tuổi/lớp VN; 3 chế độ ngôn ngữ | MVP |
| Vòng lặp bài học | Khởi động (ôn bài cũ) → nội dung → exit quiz 6 câu | MVP |
| Quiz engine | MCQ, true/false, multi-select, điền từ, câu hình; giải thích sau mỗi câu | MVP |
| Media bài học | MVP: hình minh hoạ tĩnh + audio EN; animation đầy đủ ở GĐ 2 | MVP |
| Flashcards từ vựng EN–VI | Sinh từ keywords mỗi bài; TTS tiếng Anh, nghĩa VI dạng text | MVP |
| Freemium unlock | Chủ đề đầu mỗi nhóm free; mở khoá bằng subs tháng/năm | MVP |
| Gamification | Sao, streak, huy hiệu theo Big Questions | MVP |
| Góc phụ huynh | PIN, báo cáo tuần, giới hạn thời gian, quản lý subscription | MVP |
| Ôn tập ngắt quãng | Spaced repetition từ dữ liệu quiz | GĐ 2 |
| Chế độ offline | Tải chủ đề về máy | GĐ 2 |
| Lớp học giáo viên/trung tâm | Giao bài, xem điểm cả lớp | GĐ 3 |
| Thí nghiệm tại nhà | Checklist dụng cụ + hướng dẫn an toàn | GĐ 3 |

Gamification thưởng cho nỗ lực và đều đặn, không xếp hạng so sánh giữa trẻ, không loot box.

## 6. Kiến trúc kỹ thuật

Luồng nội dung một chiều: **Oak API (tham khảo syllabus) → Thiết kế syllabus → Soạn & duyệt nội dung (CMS) → Supabase → App iOS + App Android + Góc phụ huynh (web)**. App chỉ đọc bản đã duyệt.

- Stack: iOS native (Swift/SwiftUI) + Android native (Kotlin/Jetpack Compose); backend Supabase (Postgres, Auth, Storage) + CMS Next.js dùng chung.
- Nội dung đóng gói JSON theo schema thống nhất để iOS và Android render giống nhau, không hard-code bài học trong app.
- Claude API hỗ trợ biên tập viên draft kịch bản + câu quiz nháp (không dùng output thẳng cho trẻ).
- TTS tiếng Anh cho câu hỏi/từ vựng; tiếng Việt chỉ hiển thị text.

## 7. Wireframes & định hướng thiết kế

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

## 8. Roadmap

| Giai đoạn | Thời gian | Nội dung | Gate |
| --- | --- | --- | --- |
| **GĐ 0 · Thiết kế nội dung** | T11/2026–T1/2027 (~8 tuần) | Syllabus 3 nhóm; soạn nội dung pilot Year 3 (chủ đề 1–6, ~34 bài); CMS | Nội dung Y3 sẵn sàng (16/1/2027) |
| **GĐ 1 · MVP 2 app native** | T1–T4/2027 | Vòng lặp bài học + quiz, gamification, góc phụ huynh | Beta 50 gia đình đạt |
| **GĐ 2 · Mở rộng** | T4–T7/2027 | Đủ Year 1–6, ôn ngắt quãng, offline, animation đầy đủ | Lên App Store / CH Play |

MVP chỉ làm 1 nhóm tuổi (pilot Year 3 / 7–9 tuổi) nhưng chạy song song 2 app native — phần tốn nhất là sản xuất nội dung, nên GĐ 0 dồn toàn lực vào syllabus + nội dung trước khi code app. Timeline chi tiết GĐ 0: xem [syllabus.md](syllabus.md).

## 9. Chỉ số thành công

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

## 10. Rủi ro & việc còn mở

| Rủi ro | Mức | Giảm thiểu |
| --- | --- | --- |
| Tốc độ/chất lượng sản xuất nội dung tự làm | Cao | Template chuẩn + bài mẫu làm thước đo; Claude API draft, người duyệt |
| Chi phí duy trì 2 app native song song | Trung bình | Schema nội dung chung, app chỉ là renderer |
| Nội dung dậy thì (Human development) | Trung bình | Cờ "nội dung nhạy cảm", phụ huynh bật/tắt |
| Dữ liệu trẻ em (COPPA/GDPR-K, quy định VN) | Trung bình | Đăng ký qua phụ huynh, data tối thiểu |
| Thương hiệu: không dùng tên/logo Oak | Thấp | Chỉ ghi "tham khảo khung chương trình" ở about |

**Đã chốt (21/10/2026):** native iOS + Android · cả 2 thị trường · freemium unlock + subs tháng/năm · không TTS tiếng Việt · Oak chỉ làm sườn syllabus.

**Còn mở:**
- [ ] Chốt tên app — shortlist: **ToMo Science** ("tò mò", đọc dễ cả EN/VI), **SciBee**, **AtomKids** (khớp logo atom), **WonderLab Kids**, **Khám Phá Kids**; check trùng App Store/Google Play + nhãn hiệu VN trước khi chốt
- [ ] Mức giá cụ thể gói tháng/năm cho từng thị trường
- [ ] Đội sản xuất nội dung: ai soạn kịch bản, ai duyệt chuyên môn
- [ ] Phong cách hình ảnh / nhân vật mascot (liên quan tới tên app)
