# Tasks · việc đang dở và còn mở

Cập nhật: 20/11/2026. File này chỉ theo dõi việc **chưa xong**. Chi tiết, bằng chứng và lịch sử nằm trong từng ticket ở [backlog/](backlog/README.md). Xong việc nào thì xoá dòng đó ở đây và cập nhật trạng thái trong ticket.

Ký hiệu: **[Duy]** cần Duy quyết hoặc tự làm · **[agent]** agent làm được, chờ Duy giao · **[chặn]** chặn phát hành.

## 1. Chờ Duy review (code và nội dung đã xong)

| Ticket | Việc | Còn lại |
| --- | --- | --- |
| [SK-051](backlog/SK-051-explorer-7-plants-around-us.md) | Explorer #7 *Cây quanh em* | Bài đã soạn, tester đã rà, đã vào gói; dòng trạng thái trong ticket còn ghi `todo`. **[agent]** PM nghiệm thu và đổi trạng thái |
| [SK-053](backlog/SK-053-explorer-8-life-cycles.md) | Explorer #8 *Lớn lên* | **[Duy]** tên EN, bài mở rộng 3 và 5, `level`, hai ảnh c12 và c15 |
| [SK-057](backlog/SK-057-explorer-catalog-earth-sky.md) | Danh mục Explorer theo lộ trình 18/11 | **[agent]** đổi các chỗ ghi "khi SK-057/SK-061 xong" trong `prd.md`, `technical-plan.md`, `syllabus.md` mục 0 thành "hiện hành" sau khi Duy duyệt |
| [SK-058](backlog/SK-058-explorer-9-mountains-rivers-seas.md) | Explorer #9 *Núi, sông và biển* | **[Duy]** ảnh làng bài 3 (đề xuất vẽ giấy cắt), khung c1/c7, xác nhận bỏ tên Phong Nha |
| [SK-059](backlog/SK-059-play-shelf-zoom-drag.md) | Kệ Chơi: chạm xem to, giữ kéo vào giỏ | **[Duy]** chốt để publish canvas `Explorer-A.html`, `Discoverer-A2.html` |
| [SK-060](backlog/SK-060-ui-tests-a2-flow.md) | UI test theo luồng A2 và 9 lỗi app | **[agent]** chạy lại cả bộ UI một lần; lỗi 6 (chạm đáp án đầu không phát lời) chập chờn, chưa tái hiện |
| [SK-061](backlog/SK-061-explorer-10-sky-day-and-night.md) | Bỏ *Nước quanh em*; Explorer #10 *Bầu trời ngày và đêm* | **[Duy]** giữ hay đổi 2 bài PM thay (bài 3, bài 6). **[agent]** chơi bài 1, 4, 5, 6 trên iPhone 16; xem tab Thẻ "Thẻ bầu trời"; content-editor sửa alt B8, B10 |

## 2. Đang làm dở

| Ticket | Trạng thái | Còn lại |
| --- | --- | --- |
| [SK-043](backlog/SK-043-lesson-screens-picture-book.md) | in_progress | Màn Học, Chơi, Quiz hướng A Sách tranh: app đã chạy theo A2; ticket cần PM rà lại và đóng |
| [SK-044](backlog/SK-044-answer-feedback.md) | in_progress | Phản hồi đáp án theo tuổi: đã dùng ở mọi bài Explorer; PM rà tiêu chí còn lại và đóng |
| [SK-034](backlog/SK-034-journey-roadmap.md) | in_progress | Bản đồ Hành trình: app có 6 chặng Explorer, 43 icon; PM rà và đóng |

## 3. Todo (đã có ticket, chưa làm)

| Ticket | Việc | Chờ |
| --- | --- | --- |
| [SK-054](backlog/SK-054-explorer-choice-voiceover-label.md) | VoiceOver thẻ lựa chọn Explorer đọc `label` nên lộ đáp án | **[Duy]** chốt phương án A/B/C |
| [SK-055](backlog/SK-055-vocab-card-crops.md) | Mục cắt khung cho thẻ từ dùng ảnh vuông | Nên làm sau SK-056 |
| [SK-056](backlog/SK-056-images-fetch-commons-small-thumb.md) | `images fetch` tải thumbnail Commons để tránh HTTP 429 | Không |
| [SK-019](backlog/SK-019-ios-golden-path-test.md) | Luồng vàng trên 5 simulator | **[Duy]** mâu thuẫn luật "1 simulator"; cần chốt lại phạm vi |
| [SK-020](backlog/SK-020-ios-device-install.md) | Lên máy thật, TestFlight | **[Duy]** Apple ID hay Developer Program, bundle id |

## 4. Chưa có ticket

- **Nhãn VoiceOver thẻ thưởng ở hồ sơ song ngữ** ghép câu VI với tên EN ("Sticker mới: Sunrise…"). Có từ trước SK-061; gộp với SK-058 n7. **[agent]** PM mở ticket cho ios-dev.
- **Dọn "Dùng lại hình" trỏ qua hai chặng**: 18 chỗ ở *Núi, sông và biển*, 10 chỗ ở *Bầu trời ngày và đêm*. **[agent]** content-editor.
- **Bố cục chip nhóm trên kệ Chơi**: chấm nhỏ hơn hoặc chip rộng hơn để tên nhóm hai dòng còn chỗ lớn lên theo Dynamic Type (SK-060). **[agent]** designer.
- **TEMPLATE.md còn ghi cấm hình giấy cắt**, trong khi Duy đã cho phép vẽ minh hoạ (SK-058). **[agent]** content-editor sửa.
- **Lộ trình Discoverer và Scientist** (bản rà 18/11 mục 4.2–4.3). **[Duy]** chốt trước khi soạn tiếp. Kèm hai ý chuyển từ Explorer: "Nổi hay chìm" chưa có chỗ; an toàn gần nước đưa vào Discoverer #9.

## 5. Chờ Duy hoặc chuyên môn trước khi phát hành

- **[chặn] [CẦN KIỂM]:** mọi chủ đề Explorer và Discoverer đã soạn đều có dòng `[CẦN KIỂM]` cần người chuyên môn đọc. Ví dụ: *Bầu trời* 50 dòng, *Núi, sông và biển* 51 dòng.
- **[chặn] Nghe clip VI:** chưa ai nghe các clip của SK-048, SK-049, SK-050, SK-053, SK-058, SK-061.
- **[Duy] Kiểm trên máy thật:** VoiceOver, iPad, iPhone SE.
- **[Duy] Openverse:** 4 cảnh báo tác giả.
- **[Duy] Mục ảnh nhỏ không chặn** của SK-061 (C1 trăng nền đen, C2, C3, B11, B13–B22): PM đề xuất chấp nhận cả nhóm.
