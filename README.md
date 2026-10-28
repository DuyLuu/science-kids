# Science Kids

App học khoa học song ngữ Anh–Việt cho trẻ 5–11 tuổi. Syllabus tham khảo khung primary science của Oak National Academy (UK); nội dung, hình ảnh, thiết kế tự làm riêng.

## Tài liệu

| File | Nội dung | Artifact gốc |
| --- | --- | --- |
| [prd.md](prd.md) | PRD đầy đủ 11 mục, gồm mô hình tài khoản phụ huynh và hồ sơ con | [PRD (tab PRD)](https://claude.ai/artifact/LvMccnKLBikQZFfJYuX2fe) |
| [technical-plan.md](technical-plan.md) | Tóm tắt PRD + technical plan: kiến trúc, content pack, database, API, app iOS/Android, pipeline nội dung (CLI ở MVP, CMS ở GĐ 2), auth, thanh toán, bảo mật, CI/CD, kế hoạch sprint | Chưa publish |
| [syllabus.md](syllabus.md) | Syllabus 3 nhóm tuổi, lộ trình học, timeline sản xuất GĐ 0 | [PRD (tab Syllabus & nội dung)](https://claude.ai/artifact/LvMccnKLBikQZFfJYuX2fe) |
| [syllabus-progression.md](syllabus-progression.md) | Đề xuất xếp syllabus theo độ khó tăng dần: rubric 5 tiêu chí, 6 mạch, độ khó trong bài và quiz, tiếng Anh, ngưỡng thành thạo, kèm nguồn research | Chưa publish |
| [design/play-ui/](design/play-ui/project/) | UI/UX học mà chơi, style E "Giấy cắt Đông Hồ": bảng tổng quan, Discoverer đủ 17 màn có animation (gồm tài khoản phụ huynh và hồ sơ con), Explorer và Scientist mỗi nhóm 5 màn, khu khám phá style A–E | [Science Kids · Học mà chơi](https://claude.ai/artifact/MLvDKD33FWJ7aTMS7XX3Zk) |
| [design/wireframes/](design/wireframes/) | 7 màn hình wireframe (canvas.json + *.dc.html) | [Science Kids Wireframes](https://claude.ai/artifact/1sqc8tNvXN5h14zfLpyXZZ) |

## Workflow review

1. **Review và sửa trực tiếp các file .md trong repo** — đây là nguồn chính trong giai đoạn plan.
2. Khi plan chốt, nói Claude **publish lại artifact** từ các file .md (artifact chỉ để chia sẻ/trình bày, có sơ đồ vẽ).
3. Wireframes: sửa file trong `design/wireframes/` rồi nhờ Claude publish lên canvas, hoặc sửa trực tiếp trên canvas.
