# SK-033 · Hình minh hoạ thật cho mọi câu hỏi và lựa chọn

Trạng thái: in_progress · Ngày: 2026-11-09 · Phụ trách: dev (đường hình), ios-dev (hiện hình), content-editor (brief), designer (khung hình) · Tester: tester
Nguồn: Duy 9/11:
- "trẻ em chủ yếu học bằng hình ảnh, mỗi câu hỏi cần có hình minh hoạ, mỗi option cũng cần có hình";
- "chỉ dùng nguồn free, không dùng hình AI; ảnh chụp thật hoặc hình vẽ gần thực tế".

## Hiện trạng (9/11)
- **Schema:** có trường `image` cho câu hỏi, lựa chọn và món ở phần Chơi. Thẻ từ của `fill_blank_bank` (`BankWord`: chỉ có `key`, `label`) **chưa có** `image`; muốn có thì dev sửa schema, ios-dev hiện hình (content-editor phát hiện 9/11).
- **7 bài đã soạn còn thiếu nhiều hình:**

  | Loại câu | Câu có hình | Lựa chọn / thẻ từ có hình |
  | --- | --- | --- |
  | `single_choice` | 10/27 | 21/81 |
  | `multi_choice` | 2/7 | 22/30 |
  | `true_false` | 6/14 | không có lựa chọn |
  | `fill_blank_bank` | 0/10 | 0/31 |

- **App chưa có hình thật nào:** mọi hình là `PlaceholderArt`. Chưa có `content-cli assets` để đưa hình vào gói.

## Thử nguồn miễn phí (main session 9/11)
Trang so sánh: `design/image-trial/index.html`, script ở scratchpad.
- 16 món của 2 bài, mỗi món có tối đa 3 ảnh chụp và 3 hình vẽ. Ảnh lấy tự động từ Wikimedia Commons và Openverse, chỉ giấy phép dùng thương mại được.
- Ảnh hiển thị thẳng từ trang gốc, chưa tải về.
- **Kết quả:**
  - Ảnh chụp thật: món nào cũng có ứng viên, nhiều ảnh CC0 hoặc public domain (NASA có ảnh núi lửa).
  - Hình vẽ gần thực tế: lẫn lộn. Có hình đẹp (tranh cá CC0 của Rijksmuseum, tranh thực vật cũ), nhưng cũng lẫn biểu tượng và sơ đồ.
- **Cần người chọn:** nhiều ảnh không hợp bối cảnh Việt Nam, ví dụ ao phủ tuyết.
- **Nguồn không cần khoá:** Wikimedia Commons API, Openverse API (GitHub `WordPress/openverse`; khi không có khoá được 200 lượt/ngày).
- **Unsplash, Pexels, Pixabay:** API cần khoá; tìm tay trên web thì không cần.

## Đề xuất (chờ Duy)
1. **Luật nội dung:** mọi câu hỏi, lựa chọn, thẻ từ và món Chơi đều có `image`; `brief` tả ảnh cần tìm kèm từ khoá tiếng Anh.
   - dev thêm luật vào `validate`: lúc đầu là cảnh báo, chuyển thành lỗi sau khi bổ sung xong 7 bài;
   - content-editor bổ sung `image` cho 7 bài đã soạn.
2. **Giấy phép.** Duy 9/11: "đảm bảo không vi phạm bản quyền, vì app có thu phí, nên phải đảm bảo nguồn hình ảnh cho phép điều đó". Main session chốt quy tắc an toàn cho app thu phí:
   - **Chỉ nhận:**
     - CC0;
     - public domain hoặc PDM có nhãn rõ trên trang gốc;
     - CC BY, ghi tên tác giả, giấy phép và đường dẫn ở màn "Nguồn hình" trong app.
   - **Loại:**
     - CC BY-SA (vướng điều kiện chia sẻ lại khi cắt chỉnh), NC (cấm thương mại), ND (cấm chỉnh sửa);
     - ảnh không rõ giấy phép;
     - Pinterest, Google Images, mạng xã hội, ảnh AI.
   - **Kiểm từng ảnh:**
     - xác minh giấy phép ở trang gốc, không chỉ tin Openverse hay trang tổng hợp;
     - không có người nhận ra mặt, nhất là trẻ em;
     - không logo, nhãn hiệu, bao bì có thương hiệu;
     - ảnh NASA, USGS, NOAA không kèm logo hay huy hiệu cơ quan, không ngụ ý được bảo trợ;
     - tranh trong bảo tàng chỉ lấy bản bảo tàng tự công bố CC0 (vd Rijksmuseum).
   - **Lưu cho mỗi ảnh:** nguồn, đường dẫn trang gốc, tác giả, giấy phép và phiên bản, ngày tải, chỉnh sửa gì (cắt, thu nhỏ). Dữ liệu này đi cùng `asset` vào gói để app hiện màn "Nguồn hình".
3. **Đường hình:**
   - dev: `content-cli images search` sinh trang ứng viên cho mỗi bài;
   - chọn ảnh;
   - `content-cli assets` tải ảnh đã chọn về, thu nhỏ, đổi định dạng và ghi `asset` cùng thông tin giấy phép vào nội dung, `build` đóng vào gói;
   - ios-dev: app hiện hình thật và màn "Nguồn hình".
4. **Người chọn ảnh:** Duy, biên tập, hoặc agent chọn trước rồi Duy duyệt.
5. **Tải ảnh về repo:** mỗi lần tải là tải file nên cần Duy cho phép; xin phép một lần cho các nguồn trên.
6. **designer:** khung ảnh chụp thật trong style giấy cắt E (ảnh đặt trên mảnh giấy, không viền).

## Quyết định đã ghi
- Duy 9/11: "Bắt đầu, cho tải".
  - Bắt đầu đường đưa ảnh vào app.
  - Cho tải ảnh đã chọn về máy từ Wikimedia Commons, Openverse (chỉ ảnh có giấy phép hợp quy tắc ở mục 2), NASA, USGS, NOAA, Rijksmuseum.
- Main session 9/11:
  - **Bài thử:** làm trọn đường với bài 1 *Đất và nước trên Trái Đất* (SK-031) trước, Duy xem rồi mới làm các bài khác.
  - **Ăn uống lành mạnh:** ngoài pilot, và bài 1 đang là fixture so từng byte, nên bổ sung hình sau.

## Hợp đồng ảnh (main session 9/11; dev và ios-dev làm song song theo đây)
- **File ảnh trong gói:**
  - định dạng: JPEG, sRGB, cạnh dài tối đa 1024 px, chất lượng khoảng 82;
  - bỏ EXIF và GPS;
  - đường dẫn: `assets/<sha256>.jpg`, với sha256 tính trên bytes file.
- **Manifest `assets[]`**, thêm loại ảnh:

  ```json
  { "sha256": "…", "size": 123456, "kind": "image", "path": "assets/<sha256>.jpg", "width": 1024, "height": 768,
    "credit": { "title": "…", "author": "…", "license": "CC0 1.0 | Public domain | PDM 1.0 | CC BY 4.0 …",
                "license_url": "https://…", "source": "Wikimedia Commons | Openverse/Flickr | NASA | …",
                "source_url": "https://… (trang gốc của ảnh)" } }
  ```
- **Nội dung:** `Image.asset` = sha256 của file ảnh (trường đã có trong schema).
  - Markdown giữ `brief` và `alt`.
  - `asset` do `build` điền từ file chọn ảnh, không viết tay.
- **File chọn ảnh:**
  - trong git, mỗi bài một file ở `content/images/<age_group>/<topic_slug>/<lesson_slug>.json`;
  - khoá ổn định theo key trong bài (vd `q3`, `q3.q3_ocean`, `tray.tray_sea`, `learn.explore.<group>`), dev chốt cú pháp;
  - mỗi ảnh ghi: nguồn, trang gốc, URL file, tác giả, giấy phép, cắt (tuỳ chọn).
- **Cache:** ảnh tải về và đã xử lý nằm ở `content/.images/` (ngoài git, như `content/.audio`); `fetch` lại được từ file chọn ảnh.
- **App:**
  - đọc bytes ảnh qua `ContentPack` (kiểm sha256 như clip);
  - có `asset` thì vẽ ảnh thật trên mảnh giấy, không viền, cắt vừa ô;
  - không có thì vẽ `PlaceholderArt` như cũ;
  - màn "Nguồn hình" liệt kê `credit` của mọi ảnh trong gói.

## Tiêu chí nghiệm thu
- [ ] **Luật hình:** `validate` báo mọi câu Khởi động và Quiz, lựa chọn `single_choice`/`multi_choice`, thẻ từ `fill_blank_bank`, món `build_tray` thiếu `image`. Lúc đầu là cảnh báo; Duy duyệt xong bài thử thì thành lỗi.
- [ ] `brief` có dòng "Từ khoá tìm ảnh (EN): …"; thiếu thì `validate` cảnh báo.
- [ ] **`content-cli images search <bài hoặc chủ đề>`:**
  - tìm ảnh ứng viên trên Wikimedia Commons và Openverse cho từng hình theo từ khoá;
  - chỉ lấy giấy phép CC0, PD, PDM, CC BY;
  - ghi `content/.build/images/<bài>/candidates.json` và một trang HTML xem ứng viên;
  - không tải file ảnh, chỉ lấy thông tin.
- [ ] **`content-cli images fetch`:**
  - tải ảnh trong file chọn ảnh;
  - kiểm lại giấy phép ở nguồn: lệch hoặc không hợp quy tắc thì báo lỗi, không dùng ảnh;
  - xử lý theo hợp đồng, ghi cache cùng `index.json` (credit).
- [ ] **`build`:**
  - điền `asset`, chép ảnh vào gói, manifest có `kind: image` và `credit`;
  - `check-pack.sh` OK;
  - `--require-assets` báo hình chưa có ảnh.
- [ ] **App:**
  - bài thử hiện ảnh thật ở câu hỏi, lựa chọn, món Chơi, ô Học;
  - màn "Nguồn hình" đủ credit;
  - không có ảnh thì vẫn chạy như cũ;
  - unit test qua.
- [ ] **Bài thử** *Đất và nước trên Trái Đất*:
  - mọi hình có ảnh hợp quy tắc;
  - Duy xem trang duyệt và trên iPhone.
- [ ] content-editor sửa `content/TEMPLATE.md`: luật hình, `brief` kèm từ khoá, cú pháp hình cho thẻ từ, nhãn câu 6, `messages.full`.

## dev 9/11: hình cho thẻ từ
Duy chốt 9/11 (cùng SK-032 "Quyết định đã ghi"): thẻ từ của `fill_blank_bank` gắn được hình như lựa chọn của `single_choice`.

**Hợp đồng (ios-dev, content-editor đọc):**
- `BankWord` = `{ key, label: Spoken, image?: Image }`. `image` cùng kiểu `Image` với `ChoiceOption.image`: `alt: Text` (bắt buộc khi có `image`), `brief?` (chỉ ở nguồn, `build` bỏ khỏi gói), `asset?` (sha256, sau này `content-cli assets` ghi).
- Tuỳ chọn: nội dung cũ không có `image` vẫn hợp lệ. Không đổi `schema_version`, không đổi RPC hay định dạng gói; app bản cũ bỏ qua trường lạ (Codable mặc định), nên thứ tự phát hành không bị ràng buộc.
- Trong JSON, thứ tự khoá là `key`, `label`, `image` (theo `properties` của JSON Schema).

**Đã làm:**
- content-schema: `BankWord` có `image` ở cả JSON Schema (`schema/quiz-item.schema.json`) và zod (`src/quiz-item.ts`). Test: bảng hợp đồng (`contract.test.mjs`), ca hợp lệ và ca lỗi cho hình thẻ từ (`formats.test.mjs`), quét đột biến Ajv = zod trên thẻ từ có hình (`parity.test.mjs`). README cập nhật. Không sửa fixture hợp lệ (iOS và nhiều test khác dùng chung bản đó).
- content-cli: `validate`/`import` đọc `image.brief`, `image.alt.en`, `image.alt.vi` dưới `#### bank <key>`, giống `#### option`. TTS và `build` không cần sửa vì cả hai tìm `Spoken`/`Image` theo JSON Schema: `alt` là Text nên không đọc, `brief` bị bỏ khỏi gói. Đã thêm test cho cả hai.
- Bảng đọc ép VI (`src/normalize/vi.ts`, `READINGS`): `jura` → "giu ra" (kỷ Jura → "kỷ Giu ra"). "Tam Điệp" là âm tiết tiếng Việt, không cần dòng nào, có test giữ nguyên. Đổi bảng đọc làm đổi khoá cache của clip VI có chữ "Jura"; lần `tts` tới sẽ sinh lại clip đó.

**Chưa làm:**
- `content/TEMPLATE.md` thuộc content-editor. Đề xuất cú pháp:

  ```
  #### bank q2_air
  label.en: air
  label.vi: không khí
  image.brief: Bọt khí trong cốc nước, ảnh chụp, nền trơn, không có chữ
  image.alt.en: Air bubbles in a glass of water
  image.alt.vi: Bọt khí trong cốc nước
  ```

  Sửa bảng ở mục D, dòng `fill_blank_bank`:
  - cột markdown: "mỗi `#### bank <key>`: `label.*` · `image.*`";
  - cột SK-001: "`bank[]`: `key` · `label` · `image?`".
- `rules.json` → `image_required` chưa có ô `bank_word`, nên thẻ từ thiếu hình chưa bị báo. Ô này thuộc đề xuất 1 ở trên (luật "mọi … đều có `image`"), làm khi Duy chốt.
- Bảng trường của SK-001 (dòng `fill_blank_bank`) vẫn ghi `bank[2..]: { key, label: Spoken }`. Đề xuất pm thêm `image?: Image`. technical-plan không liệt kê trường của thẻ từ nên không cần sửa.

## ios-dev 9/11: hình cho thẻ từ
Theo hợp đồng ở mục "dev 9/11" (`BankWord` = `{ key, label, image?: Image }`). Không đổi luật chấm: chấm vẫn chỉ đọc `key`.

**Đã làm:**
- `ContentModel`: `QuizItem.FillBlankBank.BankWord` có `image: ContentImage?` (Codable tự sinh: thiếu trường thì `nil`, encode không ghi khoá `image` khi `nil`). Thêm `FillBlankBank.hasPictures`.
- `LessonPlayer` (`QuestionViews.swift`, `BankChips`): ngân hàng có ít nhất một thẻ có `image` thì mọi thẻ thành **thẻ hình**, cùng ô với lựa chọn có hình của `single_choice`:
  - hình `PlaceholderArt` (chưa có hình thật) ở trên, chấm và chữ ở dưới, chữ cỡ `sentence`, một dòng, co tối đa theo `labelMinimumScale`;
  - lưới `layout.grid.quiz`: 3 cột; cao 104pt trên iPhone, 150pt trong khung iPad; hình 50pt, phóng theo `illustration_max_scale` trên iPad; khoảng hàng `rowGap` của lưới;
  - ô cao `max(quiz.cellHeight, touchTarget)`, nên không bao giờ dưới 56pt;
  - dấu Đúng / Chưa đúng / Đáp án vẫn nằm vắt ngang mép trên, như ô có hình.
  
  Ngân hàng không có hình nào giữ chip cũ (cao 56pt, khoảng hàng 10).
- **Quyết định (ios-dev):**
  - Ngân hàng có hình lẫn thẻ không hình: thẻ không hình chỉ hiện chấm và chữ, nhưng cao bằng thẻ hình để lưới đều.
  - VoiceOver đọc `label.en` của thẻ, giống ô lựa chọn có hình; `alt` gắn trên hình nhưng nút đọc nhãn của thẻ.
  - Không hiện dòng tiếng thứ hai trên thẻ, giống chip cũ.
- Khoá `collectible.set.dinosaurs` = "Dinosaur cards" · "Thẻ khủng long" trong `Localizable.xcstrings`. Tra qua `CollectibleSetName` như `earth`.
- Tham số Debug `-SKContentFolder <đường dẫn>`: app đọc một thư mục nội dung dạng `fixtures/valid` trên máy Mac thay cho gói hay fixture trong bundle. Dùng để xem thẻ có hình mà không phải sửa `packages/`. Ghi trong `apps/ios/README.md`.

**Test** (chạy 1 lần, iPhone 16 Pro `14DF158D…`, `-skip-testing:ScienceKidsUITests`):
- Test mới đều qua:
  - `ContentModelTests/BankWordImage`: có và không có `image`, encode rồi decode lại;
  - `LessonPlayerTests/BankCardSizeTests`: chiều cao, bề rộng ≥ 56pt và hình cùng chữ vừa ô ở các bề rộng 320, 375, 393, 440 (phone) và 834, 1194 (iPad);
  - `InfoPlistTests.collectibleSetNames`: thêm `dinosaurs`;
  - `LaunchOptionsTests.contentFolder`.
- Lượt chạy đó: bộ test của app target fail 5 issue trong `BundledContentTests` (`journeyOfTheBundle`, `continueCardPointsAtTheFirstWrittenLesson`, `topicWords`). Nguyên nhân không nằm ở thay đổi này: gói đang nhúng (`content/.build/pack`, build 9/11 16:18) đã có chủ đề Discoverer #1 của SK-031, trong khi test vẫn giả định chủ đề 1 chưa soạn.
- Sửa sau đó (main session giao): ba test trên được viết lại để không phụ thuộc số chủ đề đã soạn; `packIsBundledAndOpens` tra version của manifest theo id chủ đề, không lấy `topics.first`. Chạy lại 1 lần `-only-testing:ScienceKidsTests` trên cùng máy: `✔ Test run with 61 tests passed`, `** TEST SUCCEEDED **`.

**Ảnh** (iPhone 16 Pro, Quiz q2 của bài 1 với nội dung thử có `image` trên cả ba thẻ, đọc qua `-SKContentFolder`):
- `sk033-fill-blank-picture-cards-iphone16pro.png`: đang chọn;
- `sk033-fill-blank-picture-cards-wrong-iphone16pro.png`: sai lần 1, dấu "Chưa đúng".

Hai ảnh nằm trong `shots/` ở scratchpad của phiên 9/11, không vào repo.

**Chưa kiểm:**
- Thẻ hình trên iPad chưa xem trên simulator, mới kiểm bằng unit test `LayoutMetrics`.
- Chưa chạy UI test. Selector `lesson.word.<key>` không đổi.

**Tester kiểm:**
- Thẻ hình với Dynamic Type lớn: ô phải cao thêm, không cắt chữ.
- VoiceOver trên thẻ hình đọc "energy, Đúng".
- Khởi động có câu điền từ có hình: từ sai đã chạm chuyển xám.

## ios-dev 9/11: ảnh thật
Theo mục "Hợp đồng ảnh". Chưa có gói thật có ảnh: kiểm bằng gói thử dựng trong scratchpad (ảnh màu vẽ bằng code, không tải từ mạng).

**Đã làm:**
- **ContentKit:**
  - `PackManifest.AssetEntry` có thêm `width`, `height`, `credit` (`ImageCredit`: `title`, `author`, `license`, `license_url`, `source`, `source_url`), và `isImage` (`kind == "image"`).
  - Cả ba trường đọc lỏng: gói cũ không có vẫn mở; trường sai kiểu hoặc chuỗi trống thì coi như thiếu, không làm hỏng manifest.
  - `ContentPack.hasImage(_:)`: manifest có sha256 đó với `kind: "image"`.
  - `ContentPack.imageData(for:)`: đọc bytes và kiểm size, sha256 như clip. Clip không bao giờ được trả như ảnh.
  - `ContentPack.images`: mọi ảnh của gói xếp theo `title`, rồi `author`, rồi sha256. Ảnh không có `credit` vẫn được liệt kê.
- **DesignSystem:**
  - `PictureLoader`: giao thức, giống `ClipLoader`.
  - `PictureStore`:
    - giải mã bằng ImageIO ở cỡ hiển thị, làm tròn lên bậc 128 px, không bao giờ lớn hơn file;
    - `ShouldCacheImmediately`, nên không giải mã lúc vẽ;
    - hàm async nonisolated nên đọc, kiểm và giải mã không chạy trên main thread;
    - cache `NSCache` trong bộ nhớ, giới hạn 64 MB;
    - ảnh lỗi (thiếu file, sai sha256, không giải mã được) được nhớ lại và không đọc lại; từ đó vẽ `PlaceholderArt`.
  - `ContentPicture`: view chọn giữa ảnh thật và `PlaceholderArt`.
  - Env `pictureStore`.
- **LessonPlayer:** sáu chỗ từng vẽ `PlaceholderArt` giờ vẽ `ContentPicture(image:color:size:box:)`:
  - hình câu hỏi (Khởi động và Quiz);
  - ô lựa chọn `single_choice` / `multi_choice`;
  - thẻ từ có hình;
  - món trên kệ Chơi;
  - tờ nhóm ở Học (`explore_groups`);
  - thẻ thưởng.
- **App:**
  - `AppContent.pictures`: `PictureStore` của gói; `nil` khi chạy fixture.
  - `PackPictures`: cầu nối `ContentPack` → `PictureLoader`, giống `PackClips`.
  - Đưa vào env ở `RootView`.
  - Route `.imageCredits`, màn `ImageCreditsScreen`, dòng `ImageCreditsLink` ở Trang chủ.
- **Debug:** `-SKContentPack <đường dẫn>` mở một gói trên máy Mac thay cho gói trong bundle, kiểm như gói nhúng. Ghi trong `apps/ios/README.md`.
- **Chuỗi EN + VI** (`Localizable.xcstrings`): `credits.title`, `credits.entry`, `credits.back`, `credits.count %lld`, `credits.intro`, `credits.untitled`, `credits.author %@`, `credits.license %@`, `credits.source %@`, `credits.page %@`, `credits.license_page %@`.

**Quyết định (ios-dev):**
- **Khung ảnh** (chờ designer, đề xuất 6):
  - Ảnh là mảnh giấy in ảnh đặt trên giấy: cắt vừa ô (aspect fill), bo góc `radius.discoverer` (10), bóng `shadow.paper_1`, không viền, không nghiêng.
  - Đang tải: ô giấy lõm (`surface_sunken`) cùng khung, không có chuyển động. Màn chỉ có lượt hiện của chính nó.
  - Mọi kích thước nằm trong `PaperMetrics.picture*`, designer đổi một chỗ là đủ.
- **Ô lưới** (lựa chọn, thẻ từ, kệ Chơi):
  - Ảnh rộng hết ô, cao đúng bằng hình giữ chỗ cũ (`cellArt`: 50pt trên iPhone, phóng theo `illustration_max_scale` trên iPad).
  - Chiều cao ô không đổi, nên bố cục iPhone/iPad và vùng chạm ≥ 56pt giữ như SK-013/SK-032.
  - Lý do: ảnh vuông 50pt quá nhỏ để trẻ nhận ra vật.
- **Ô vuông** (hình câu hỏi, tờ Học, thẻ thưởng): `size × size`.
  - Tờ Học và thẻ thưởng có màu: ảnh (80% ô) đặt trên mảnh giấy màu của nhóm hoặc gỉ đồng, nghiêng -6° như hình giữ chỗ.
  - Hình câu hỏi không màu: ảnh chiếm cả ô.
- **Kệ Chơi giữ trung tính (SK-031):** ảnh thật nằm thẳng trên giấy của ô, không có mảnh màu nhóm bên dưới. VoiceOver vẫn đọc tên món, không đọc nhóm.
- **VoiceOver:** ảnh mang nhãn `alt.en` và trait image, như hình giữ chỗ. Nút của ô vẫn đọc nhãn của ô (không đổi so với trước).
- **Chỗ đặt màn "Nguồn hình":**
  - App chưa có Góc phụ huynh hay màn cài đặt, nên đặt một dòng "Nguồn hình" · "Image credits" ở cuối danh sách hành trình, cả trang iPhone lẫn thanh bên iPad.
  - Dòng chỉ hiện khi gói có ảnh; vùng chạm 56pt.
  - Trẻ có thể vào màn này, nên ở đây **không có link bấm được**: địa chỉ trang gốc và văn bản giấy phép hiện thành chữ (`Text(verbatim:)` không tự nhận link).
  - Khi có Góc phụ huynh (`ParentArea`, GĐ 1): chuyển màn vào sau cổng phụ huynh, và hai địa chỉ thành link mở Safari ngoài app.
- **Thứ tự danh sách:** theo `title` (ảnh không có credit lên đầu vì `title` trống). Ảnh không có `credit` vẫn hiện, với chữ "Hình chưa có tên", để không giấu một ảnh không rõ nguồn.
- **Bộ nhớ:** chưa đọc trước ảnh của bước sau (khác clip), vì đọc một ảnh JPEG khoảng 100 KB và thu nhỏ chỉ mất vài ms. Nếu thấy nhấp nháy trên máy thật thì thêm `preload` sau.

**Test** (chạy 1 lần, iPhone 16 Pro `14DF158D…`, lệnh `xcodebuild test … -skip-testing:ScienceKidsUITests`): **299 test, 298 qua, 1 hỏng**, `** TEST FAILED **`.

| Bộ | Kết quả |
| --- | --- |
| ScienceKidsTests | 67 qua |
| DesignSystemTests | 47 qua |
| ContentModelTests | 27 qua |
| LessonEngineTests | 19 qua |
| ContentKitTests | 31 qua |
| LessonPlayerTests | 56, hỏng 1 |
| AudioKitTests | 13 qua |
| ProfilesTests | 21 qua |
| SyncTests | 18 qua |

- **Test hỏng:** `LessonPictureTests.pictureLabel()`, lỗi của chính test:
  - dòng kiểm "không có ảnh thì không có nhãn" ép kiểu `as? Text?` qua `Mirror`, mà Swift làm phẳng optional nên ra `nil`;
  - phần kiểm nhãn = `alt` trong cùng test thì qua.
  - Đã sửa thành `as? Text == nil`, biên dịch lại bằng `build-for-testing` (không lỗi, không cảnh báo). **Chưa chạy lại** vì luật chạy 1 lần. Cần main session cho chạy lại 1 lần `-only-testing:SKKit/LessonPlayerTests` nếu muốn có kết quả xanh.
- **Test mới:**
  - `ContentKitTests/ImageAssetTests` (6):
    - asset ảnh decode đủ `width`, `height`, `credit`;
    - asset audio của gói cũ không có các khoá ảnh;
    - `credit` sai kiểu hoặc trống không làm hỏng manifest;
    - gói không có ảnh;
    - gói có 3 ảnh JPEG tạo trong test: thứ tự `images`, `asset` của lựa chọn trỏ đúng ảnh, đọc bytes kiểm sha256, clip không được trả như ảnh;
    - đổi 1 byte của ảnh: ảnh đó bị từ chối, ảnh khác vẫn đọc được.
  - `DesignSystemTests/PictureStoreTests` (6):
    - cỡ giải mã;
    - giải mã không lớn hơn file;
    - cache đọc 1 lần;
    - ảnh lỗi thì quay về hình giữ chỗ;
    - `pictureHash` chọn ảnh thật chỉ khi có asset trong gói;
    - **render bằng `ImageRenderer`:** giữa ô là màu ảnh khi có asset (cả khi có mảnh màu bên dưới); không asset, asset lạ hoặc không có gói thì là hình giữ chỗ.
  - `LessonPlayerTests/LessonPictureTests` (2): `ContentPicture(image:)` của LessonPlayer vẽ ảnh khi `image.asset` có trong gói (render), và nhãn = `alt`.
  - `ScienceKidsTests/ImageCreditsTests` (6):
    - fixture không có ảnh và không có link;
    - gói nhúng đưa `pictures` và `imageCredits` khớp `pack.images`;
    - route `.imageCredits`;
    - các dòng credit;
    - chuỗi EN + VI;
    - `-SKContentPack`.

**Ảnh chụp** (iPhone 16 Pro, gói thử `-SKContentPack`):
- Gói thử: gói `content/.build/pack` chép ra scratchpad, thêm 19 ảnh JPEG 480×360 vẽ bằng code cho mọi `image` của bài 1 *Đất và nước trên Trái Đất*. Manifest có `kind: image` cùng `credit` CC0 giả, sha256 và size của `pack.json` tính lại.
- Ba ảnh nằm trong `shots/` ở scratchpad của phiên 9/11, không vào repo:
  - `sk033-quiz-q1-real-pictures-iphone16pro.png`: Quiz q1, ba ô lựa chọn có ảnh thật; ô cao như cũ, chữ EN + VI không bị cắt;
  - `sk033-quiz-q5-question-picture-iphone16pro.png`: Quiz q5, hình câu hỏi vuông trên tờ giấy, lựa chọn chỉ có chữ;
  - `sk033-image-credits-iphone16pro.png`: màn Image credits, 19 ảnh, địa chỉ là chữ.

**Chưa kiểm:**
- iPad: chưa xem trên simulator. Ô dùng `metrics.illustration` và `quizGrid.cellHeight` như trước nên không đổi bố cục, nhưng chưa có ảnh chụp.
- Màn Học (ảnh trên mảnh giấy màu nhóm), kệ Chơi và thẻ thưởng có ảnh thật: chưa chụp, mới kiểm bằng test render với ô vuông có mảnh màu.
- Chưa chạy UI test.
- Ảnh thật từ Wikimedia/Openverse (ảnh dọc, ảnh rất ngang): chưa có. Cắt aspect fill nên ảnh dọc sẽ mất phần trên và dưới trong ô lưới (tỉ lệ khoảng 1,9:1). Đề xuất: file chọn ảnh của dev có `crop` thì cắt theo vật chính.

**Ghi nhận ngoài phạm vi (cho tester):**
- Simulator iPhone 16 Pro 9/11 phát clip thì mỗi clip báo `audio: clip skipped …: didNotStart` sau khoảng 15 giây. Trong lúc đó màn đứng giữa lượt hiện và ảnh chưa vẽ.
- Thêm `-SKAssumeVoiceOver YES` (tắt tự phát) thì màn hiện ngay và ảnh vẽ ngay.
- Có vẻ `AVAudioPlayer.play()` bị chặn trên main thread khi simulator không có thiết bị âm thanh. Không do SK-033 (AudioKit không đổi), nhưng nên kiểm trên máy thật hoặc simulator có âm thanh; nếu có thật thì là việc của AudioKit (SK-016).

**Đề xuất cho dev** (content-cli `build`):
- Mỗi sha256 chỉ ghi một mục trong `assets[]`. App gộp theo sha256 nên không hỏng, nhưng manifest gọn hơn.
- `credit.title` nên luôn có (tên ảnh ở trang gốc), vì màn Nguồn hình xếp theo `title`.

**Tester kiểm:**
- Gói có ảnh: mỗi ô có ảnh đúng vật, cắt vừa ô, không viền, bo góc; ô không cao hơn bản không có ảnh (iPhone 16e, iPhone 16 Pro Max, iPad Pro 11, iPad mini).
- Đổi 1 byte của một ảnh trong gói: ô đó hiện hình giữ chỗ, log `picture … not shown`, các ô khác vẫn có ảnh.
- Kệ Chơi: không có màu nhóm dưới ảnh; VoiceOver đọc tên món, không đọc nhóm.
- Màn "Nguồn hình": đủ số ảnh của gói, mỗi ảnh có tên, tác giả, giấy phép, nguồn; không có chữ nào bấm được (thử chạm giữ địa chỉ); EN + VI.
- Gói không có ảnh (gói nhúng hiện tại): không có dòng "Nguồn hình" ở Trang chủ, mọi hình vẫn là hình giữ chỗ.
- Reduce Motion: ảnh hiện không có chuyển động.

## dev 9/11: đường ảnh
Theo mục "Hợp đồng ảnh" và cú pháp `content/TEMPLATE.md` mục A "Hình (SK-033)". Chi tiết lệnh: `tools/content-cli/README.md` mục "Ảnh: images search, chọn, images fetch".

**Quy trình một bài:**

```sh
npm --prefix tools/content-cli run images -- search content/discoverer/be-mat-trai-dat/01-dat-va-nuoc-tren-trai-dat.md
#   -> content/.build/images/be-mat-trai-dat/dat-va-nuoc-tren-trai-dat/candidates.html (+ .json); không tải ảnh
#   mở trang, xem trang gốc, chọn; chép JSON cuối trang vào content/images/discoverer/be-mat-trai-dat/dat-va-nuoc-tren-trai-dat.json
npm --prefix tools/content-cli run images -- fetch content/images/discoverer/be-mat-trai-dat
#   -> kiểm lại giấy phép ở nguồn, tải, xử lý vào content/.images/ (ngoài git)
npm --prefix tools/content-cli run build -- <JSON đầu ra của tts>...   # điền image.asset, assets/<sha256>.jpg, credit
```

**Đã làm:**
- **validate** (`src/validate/age-rules.ts`, cả `build` dùng):
  - `image_missing` (cảnh báo): thiếu `image` ở câu Khởi động và Quiz (mọi format), lựa chọn `single_choice`/`multi_choice` (cả `picture_bar_chart` như ô `choice_option` cũ), thẻ `order_sequence`, thẻ từ `fill_blank_bank`, món `build_tray`. Một dòng mỗi chỗ.
  - `image_brief_keywords` (cảnh báo): `brief` của mọi `Image` (cả Học, Từ vựng, Thưởng) thiếu "Từ khoá tìm ảnh (EN): …"; không áp cho brief dùng lại. Brief "Dùng lại hình …" của cùng bài mà không nêu key nào của bài thì cũng cảnh báo (bắt gõ sai key).
  - Chuyển thành lỗi: chuyển chỗ đó từ `image_expected` sang `image_required` trong `content/rules.json` (mã `age_image_required`, như Explorer hiện nay). Không cần sửa code.
  - `build` gộp hai mã này thành một dòng đếm mỗi file.
- **`content/rules.json`** (thêm khoá, mọi nhóm tuổi): `authoring.image_expected = ["question", "choice_option", "sequence_item", "bank_word", "tray_item"]`, `authoring.image_search_keywords = true`. `schema/rules.schema.json` thêm `ImageSlot` (6 chỗ, dùng chung cho `image_required` và `image_expected`). App và server bỏ qua `authoring`, nên không ảnh hưởng app đang chạy.
- **`images search`:** từ khoá ở cuối dòng `brief` (tách theo `;`; cụm hơn 6 từ có dấu phẩy thì tách cả dấu phẩy; thiếu thì `alt.en`); Commons tối đa 3 truy vấn (không ra ảnh thì thử lại 3 từ đầu), Openverse tối đa 2 (nhãn `[ảnh]`, `[ảnh mô hình]` → ảnh chụp; `[tranh]`, `[tranh phục dựng]` → hình vẽ). Chỉ giữ CC0, public domain, PDM, CC BY; tối đa 6 ứng viên mỗi hình, xen kẽ hai nguồn. Brief dùng lại thì không tìm, trang đề xuất sẵn `same_as`. Cache trả lời ở `content/.build/images/.cache/`, hạn mức Openverse 190 lượt/ngày, 3,1 s giữa hai lượt, 5xx thử lại 1 lần, `--cache-only` dựng lại trang không gọi mạng.
- **File chọn ảnh** `content/images/<age_group>/<topic_slug>/<lesson_slug>.json`, định dạng `tools/content-cli/schema/image-selection.schema.json` (Ajv + kiểm thêm crop, same_as):

  ```json
  { "images": {
      "tray.tray_sea": { "source": "Wikimedia Commons", "source_url": "https://commons.wikimedia.org/wiki/File:…",
                         "file_url": "https://upload.wikimedia.org/…", "title": "…", "author": "…",
                         "license": "CC0 1.0", "license_url": "https://creativecommons.org/publicdomain/zero/1.0/",
                         "crop": { "left": 0, "top": 0.1, "width": 1, "height": 0.8 } },
      "tray.tray_river": { "source": "Openverse/Flickr", "openverse_id": "<uuid>", "source_url": "…", "file_url": "…",
                           "title": "…", "author": "…", "license": "CC BY 2.0", "license_url": "…" },
      "q1.q1_sea": { "same_as": "tray_sea" },
      "vocab.island": { "same_as": "tray_island", "lesson": "be-mat-trai-dat/dat-va-nuoc-tren-trai-dat" } } }
  ```

- **Khoá hình:** các `key` từ gốc bài tới hình nối bằng dấu chấm; Khởi động, Quiz, Chơi không tiền tố; Học, Từ vựng, Thưởng có. Ví dụ `q3`, `q3.q3_river`, `q2.q2_piece`, `tray.tray_sea`, `learn.explore.explore_water`, `vocab.model`, `reward.ha_long`. `same_as` nhận cả khoá hình lẫn key như brief viết (`tray_sea`, `q3`: khớp phần cuối khoá).
- **`images fetch`:** kiểm lại ở nguồn trước khi tải (Commons: extmetadata của trang `File:`, `file_url` còn đúng; Openverse: bản ghi chi tiết, trang gốc trên Commons thì kiểm cả Commons). Giấy phép lệch hoặc ngoài quy tắc, `Restrictions` (personality, trademarked, insignia), file đổi URL, CC BY mà `title` khác nguồn: `KHÔNG DÙNG`, exit 1. Xử lý bằng `sharp` 0.34.5 (đã có qua transformers.js, nay ghi thẳng vào `dependencies`, lockfile chỉ đổi dòng gốc): xoay EXIF, cắt, cạnh dài ≤ 1024, sRGB, nền trong suốt thành trắng, JPEG q82 mozjpeg, bỏ EXIF/GPS/ICC. Ghi `content/.images/<sha256>.jpg` + `index.json` (credit, `changes`, URL đã tải, kích thước gốc, bước kiểm giấy phép, ngày tải). `same_as` sang bài khác kéo theo ảnh gốc.
- **build:** điền `image.asset`, chép `assets/<sha256>.jpg`, manifest `assets[]` thêm `{ sha256, size, kind: "image", path, width, height, credit }`; mỗi ảnh một mục dù dùng nhiều chỗ (đề xuất của ios-dev). Lỗi khi ảnh đã chọn chưa fetch, file chọn ảnh đổi credit sau fetch, bytes cache sai sha256, `same_as` trỏ sai. `--require-assets`: mỗi Image chưa có ảnh một lỗi. Cờ mới `--images`, `--image-cache`. `image.asset` viết sẵn trong nội dung là lỗi.
- **`check-pack.sh`:** đếm cả hash ảnh; mỗi `image.asset` có file và dòng manifest; mỗi ảnh là JPEG, không EXIF/ICC, cạnh dài ≤ 1024, `width`/`height` đúng file (`sips`), credit đủ 6 trường, giấy phép hợp quy tắc, URL https.
- `.gitignore`: `content/.images/`.

**Quyết định (dev):**
- **Quy tắc giấy phép** (`src/images/license.ts`) nhận đúng mục Đề xuất 2. Nhãn Commons "Attribution", "No restrictions", "Copyrighted free use" bị loại vì không rõ. CC BY không ghi tác giả bị loại. Ảnh dưới 600 px cạnh dài và GIF bị loại.
- **`credit.license`** là chuỗi cố định: `CC0 1.0` · `Public domain` · `PDM 1.0` · `CC BY <phiên bản>[ <port>]`. `license_url` của ảnh public domain trên Commons (nguồn không ghi URL giấy phép) là trang gốc của ảnh, nơi có nhãn public domain.
- **`credit.changes`** (thêm, ngoài hợp đồng): `["cropped", "resized"]` hoặc một phần. CC BY 4.0 yêu cầu ghi rõ đã sửa ảnh. Khoá này tuỳ chọn; `ImageCredit` của iOS bỏ qua khoá lạ nên không hỏng. Đề xuất ios-dev hiện "Đã cắt, thu nhỏ" ở màn Nguồn hình khi có.
- **`title`**: ảnh CC0, public domain, PDM được sửa cho trung tính; ảnh CC BY phải giữ như nguồn ghi (CC BY 2.0, 3.0 yêu cầu), `fetch` kiểm.
- **Openverse ngoài Commons** (Flickr, Rawpixel…): giấy phép chỉ kiểm được qua Openverse (Flickr API cần khoá), `fetch` in "Kiểm tay: <trang gốc>". Người chọn mở trang gốc xác nhận, theo mục Đề xuất 2 "không chỉ tin Openverse".
- **NASA, USGS, NOAA, Rijksmuseum:** chưa có đường riêng; lấy qua bản trên Commons hoặc Openverse (đã kiểm được giấy phép tự động). `fetch` chỉ tải đúng URL mà nguồn trả về sau khi kiểm, không tải URL tự ghi.
- **Cache key** của ảnh = `file_url` + `crop` + cách xử lý; đổi tên hay tác giả không tải lại, nhưng `build` đòi credit trong cache trùng file chọn ảnh (đổi credit thì `fetch` lại để kiểm).
- **Brief "Dùng lại …"**: đọc được cả `` `<key>` ``, `` `<key>` ở bài `<chủ đề>/<bài>` ``, `` `<bài>/<key>` `` và kiểu cũ "… của món tray_rice (ở bài một)". `nn-` ở đầu tên bài được bỏ.

**Test (chạy thật):**
- `npm test` ở `tools/content-cli`: **332 test, 332 qua** (trước SK-033 là 286). `npm run typecheck`: sạch.
- `npm test` ở `packages/content-schema`: **144 qua**.
- Test mới: `test/images.test.ts` (41: khoá hình, từ khoá, dùng lại, luật hình, giấy phép, file chọn ảnh, throttle, hạn mức, đọc kết quả Commons/Openverse từ fixture `test/fixtures/images/`, search và fetch với HTTP giả, sharp) và 6 test `build` với ảnh (gồm `check-pack.sh` trên gói có ảnh và trên manifest bị sửa). Không test nào gọi mạng.
- Test cũ của SK-026/027/030 đếm mọi cảnh báo nên chạy với `content/rules.json` bỏ hai khoá ảnh (`test/helpers.ts`); bảng `authoring` trong `test/rules.test.ts` thêm hai khoá.
- `validate content`: exit 0, **0 lỗi**, 93 cảnh báo, trong đó 34 `image_missing` + 37 `image_brief_keywords` ở *Ăn uống lành mạnh* (ngoài pilot), 0 ở *Bề mặt Trái Đất*, 1 ở *Khủng long* (dưới).
- `build` lại 5 bài *Bề mặt Trái Đất* từ `content/.build/tts` vào scratchpad: OK, `check-pack.sh` OK (chưa có file chọn ảnh nên 0 ảnh).

**Search thử thật 1 lần** (bài 1 *Đất và nước trên Trái Đất*, 9/11, 4 phút):
- 46 hình: 21 có ứng viên, 24 dùng lại hình khác (đối chiếu từng brief: đúng chỗ gốc), 1 chưa có ứng viên (`vocab.model`, "toy motorbike real motorbike").
- Gọi Commons 29, Openverse 22 (còn 168 lượt hôm nay). 6 truy vấn Openverse bị **504** (máy chủ Openverse quá giờ): `tray.tray_island`, `tray.tray_sea`, `tray.tray_lake`, `tray.tray_stream`, `q5.q5_same`, `vocab.surface`. Các hình này chỉ có ứng viên Commons. Sau đó đã thêm thử lại 1 lần cho 5xx; chạy lại search sẽ chỉ hỏi lại 6 truy vấn này (phần còn lại lấy từ cache).
- 103 ứng viên: public domain 51, CC0 16, CC BY 36. Nguồn: Commons 93, Openverse/Flickr 8, Openverse/Rawpixel 2. Bị loại nhiều nhất: BY-SA 139, "No restrictions" 12, "Attribution" 10, Restrictions personality 2.
- Chất lượng: tìm "sea …" trên Commons ra nhiều tranh sơn dầu cũ (public domain) thay vì ảnh chụp; `reward.ha_long` ra 2 ảnh núi lửa Etna (không liên quan; ảnh Hạ Long trên Commons phần lớn là BY-SA). Cần người chọn và có thể sửa từ khoá.
- Trang: `content/.build/images/be-mat-trai-dat/dat-va-nuoc-tren-trai-dat/candidates.html` (đã dựng lại bằng `--cache-only` sau khi sửa lỗi tên tranh Commons có chữ ẩn "title QS:P1476…").

**Chưa làm · câu hỏi:**
- Chưa chạy `images fetch` thật (main session chạy sau khi có file chọn ảnh). Chưa có file nào trong `content/images/`.
- `content/discoverer/khung-long/03-hoa-thach-ke-chuyen-khung-long.md` dòng 193 (`learn.explore.explore_tracks`): brief "[sơ đồ ghép ảnh]" ghép hai hình dùng lại vào một `Image`. Một `Image` chỉ có một `asset`, nên cần designer ghép thành một ảnh rồi đưa vào bằng đường khác, hoặc tách thành hai hình. Hiện cảnh báo `image_brief_keywords`; đề xuất content-editor/designer quyết.
- Đề xuất cải thiện tìm (chưa làm, chưa thử với API thật): với nhãn `[ảnh]` thêm `-"oil on canvas"` vào truy vấn Commons để bớt tranh sơn dầu.
- Đề xuất ios-dev: hiện `credit.changes` ở màn Nguồn hình.

**Tester kiểm:**
- `validate content`: 0 lỗi; bỏ `image` của một lựa chọn, một thẻ từ, một món Chơi, một câu ở bài 1 Trái Đất → mỗi chỗ một dòng `image_missing` đúng dòng markdown; xoá "Từ khoá tìm ảnh (EN): …" của một brief → `image_brief_keywords`; brief "Dùng lại hình `tray_seaa`." → cảnh báo; chuyển `bank_word` sang `image_required` → thành lỗi `age_image_required`.
- Mở `candidates.html` (desktop và màn hẹp): mỗi hàng có khoá, alt, brief, truy vấn; chọn nút tròn ra JSON hợp lệ (`node -e` qua `checkSelection` hoặc chạy `images fetch` trên file đó); hàng dùng lại mặc định chọn `same_as`.
- Với file chọn ảnh thật: `images fetch` → mỗi ảnh OK hoặc `KHÔNG DÙNG` có lý do; sửa `license` một mục cho sai → lỗi, không vào cache; chạy lại → "đã có", không gọi mạng.
- `build` với file chọn ảnh → `check-pack.sh` OK; `--require-assets` báo đủ số hình chưa có ảnh; manifest mỗi ảnh một mục, credit đủ.

## Kết quả bài thử (main session 10/11)
- **Chọn ảnh:**
  - designer chọn 18 ảnh riêng, 21 chỗ dùng lại, 7 chỗ chưa có ảnh (quả địa cầu, tay quay quả địa cầu, xe máy đồ chơi cạnh xe thật, bình nước);
  - chỉ 4 trong 18 ảnh lấy từ `candidates.json`; còn lại designer tìm thêm trên Commons (khoảng 90 lượt).
- **Duy duyệt 10/11:** "Duyệt, đưa lên máy".
- **`images fetch`:**
  - 18/18 ảnh, kiểm lại giấy phép ở nguồn: CC0 6, PD 4, CC BY 8;
  - 2 ảnh lần đầu bị Wikimedia trả HTTP 429, chạy lại thì qua;
  - ảnh đồng hồ (Openverse/WordPress Photo Directory): designer đã mở trang gốc xác nhận CC0.
- **Gói:**
  - `build`: 18 ảnh cho 39 Image; 506 Image chưa có ảnh, app vẽ hình giữ chỗ;
  - `check-pack.sh` OK.
- **Máy thật:** bản Release đã cài và mở trên iPhone Luu.
- **Bài học từ bài thử:**
  - bộ tìm tự động cho kết quả kém, cần cải thiện truy vấn (bỏ tranh sơn dầu, ưu tiên ảnh chụp) hoặc để người hay agent tìm thêm;
  - ảnh đồ vật cụ thể và ảnh trẻ em đúng tư thế nên tự chụp (Duy quyết; ảnh có trẻ cần phụ huynh đồng ý, không lộ mặt).

## Tìm thêm cho 7 chỗ thiếu (10/11)
- **Duy chọn "Agent tìm thêm":** designer tìm được 4 ảnh gốc:
  - quả địa cầu cũ quay về châu Mỹ (CC BY 3.0);
  - mô hình máy bay trong tay (CC BY 2.0);
  - cốc nước (CC0);
  - bàn tay cầm quả địa cầu (CC0, gốc Pexels 2017, Commons đã kiểm).
- Ba chỗ còn lại dùng lại các ảnh đó.
- **Main session sửa bài 1 cho khớp ảnh:**
  - mô hình "xe máy đồ chơi" đổi thành "máy bay đồ chơi" ở câu ví dụ từ `model` và gợi ý q2 (2 clip EN, 2 clip VI sinh lại);
  - sửa `alt` và `brief` của `model`, `q2.q2_model`, `q4`, `q5`.
- **Kết quả:**
  - `images fetch`: 22 ảnh, 0 lỗi;
  - `build`: 22 ảnh cho đủ 46/46 Image của bài thử;
  - `check-pack` OK;
  - đã cài và mở trên iPhone Luu.
- **Giấy phép bài thử:** CC0 8, Public domain 4, CC BY 10.

## ios-dev 10/11: nguồn hình ghép
Theo hợp đồng main session giao 10/11: `credit` của hình ghép có `source: "composed"`, `changes` (có `"composed"`) và `parts[]` = credit của từng ảnh nguồn (`title`, `author`, `license`, `license_url`, `source`, `source_url`). Hình thường có thể có `changes` (`cropped`, `resized`), không có `parts`.

**Đã làm:**
- **ContentKit** (`PackManifest.ImageCredit`):
  - thêm `changes: [String]` và `parts: [Part]`, cả hai tuỳ chọn: gói cũ không có thì là danh sách rỗng, gói vẫn mở;
  - `Part` cùng 6 trường chữ như credit, đọc lỏng như cũ (sai kiểu hoặc trống thì coi như thiếu);
  - đọc lỏng cả danh sách: `changes`/`parts` sai kiểu thì rỗng; phần tử không phải chữ (changes) hay không phải object (parts) bị bỏ; part không có trường nào để hiện bị bỏ; chữ được cắt khoảng trắng;
  - `isComposed`: `source` là `composed` (không phân biệt hoa thường) hoặc có `parts`;
  - `isEmpty` tính cả `changes` và `parts`.
- **Màn "Nguồn hình"** (`ImageCreditsScreen.swift`):
  - thứ tự dòng của mỗi thẻ: tên, tác giả, giấy phép, nguồn, **dòng thay đổi**, trang gốc, văn bản giấy phép;
  - dòng thay đổi: các nhãn nối bằng " · ", ví dụ "Ghép từ nhiều ảnh · Đã cắt · Đã thu nhỏ" · "Composed from several images · Cropped · Resized";
  - hình ghép: dưới các dòng của hình có một ô giấy lõm (`PaperCard(.sunken)`, không viền) tiêu đề "Ảnh nguồn" · "Source images", rồi từng ảnh nguồn theo thứ tự manifest: tên, tác giả, giấy phép, nguồn, trang gốc, văn bản giấy phép, chữ nhỏ hơn một bậc (`caption`/`captionS`);
  - mọi địa chỉ vẫn là chữ (`Text(verbatim:)`/chuỗi định dạng), không link, như 9/11.
- **View model** `ImageCreditLines`: thêm `changes: [ImageCreditChange]` và `parts: [ImageCreditLines]`; `ImageCreditChange` (`composed`, `cropped`, `resized`, `edited`) đổi giá trị manifest thành nhãn.
- **VoiceOver:** phần chính của thẻ là một phần tử; mỗi ảnh nguồn là một phần tử riêng; "Ảnh nguồn" mang trait tiêu đề.
- **Chuỗi EN + VI** (`Localizable.xcstrings`): `credits.change.composed`, `credits.change.cropped`, `credits.change.resized`, `credits.change.edited`, `credits.parts`.

**Quyết định (ios-dev):**
- `source: "composed"` là dấu hiệu, không phải nơi lấy ảnh: không hiện dòng "Nguồn: composed". Dòng thay đổi nói thay.
- Hình ghép luôn có "Ghép từ nhiều ảnh" đứng đầu dòng thay đổi, kể cả khi manifest quên `"composed"` trong `changes` hay xếp nó sau. Lý do: CC BY đòi ghi đã chỉnh sửa.
- Giá trị `changes` app chưa biết hiện thành một nhãn "Đã chỉnh sửa" · "Edited", để không bao giờ giấu một thay đổi. Giá trị lặp chỉ hiện một lần; thứ tự theo manifest.
- Ảnh nguồn không có `changes` hay `parts` riêng: chỉ đọc 6 trường theo hợp đồng.
- Ảnh nguồn không có tên hiện "Hình chưa có tên", như hình không có credit.

**Đề xuất cho dev** (content-cli `build`):
- `author` của hình ghép nên là "Science Kids", không kèm "(ghép từ ảnh nguồn)". Chữ trong manifest được hiện nguyên văn, nên giao diện EN đang ra "By Science Kids (ghép từ ảnh nguồn)" (xem ảnh EN). Dòng "Composed from several images" · "Ghép từ nhiều ảnh" và ô "Ảnh nguồn" đã nói phần đó bằng đúng ngôn ngữ giao diện.
- Nên luôn ghi `"composed"` trong `changes` của hình ghép. App vẫn tự thêm nếu thiếu, nhưng `check-pack.sh` nên đòi có để manifest tự đủ nghĩa.

**Test** (chạy 1 lần, iPhone 16 Pro `14DF158D…`):
- Lệnh: `build-for-testing` rồi `test-without-building -only-testing:ContentKitTests -only-testing:ScienceKidsTests`.
- Kết quả: `✔ Test run with 35 tests passed` (ContentKitTests), `✔ Test run with 71 tests passed` (ScienceKidsTests), `** TEST EXECUTE SUCCEEDED **`.
- Build không lỗi, không cảnh báo mới.
- **Test mới `ContentKitTests/ImageAssetTests`** (4):
  - hình ghép decode đủ `changes`, 2 `parts` đúng thứ tự;
  - hình thường có `changes`, không `parts`; credit cũ không có cả hai và vẫn bằng credit dựng tay;
  - đọc lỏng: phần tử sai kiểu hay trống bị bỏ, `changes`/`parts` sai kiểu thành rỗng, credit vẫn giữ các trường khác;
  - gói có một hình ghép và một hình thường: `pack.images` liệt kê mỗi hình một lần, hình ghép có `parts`, bytes kiểm sha256 như cũ.
- **Test mới `ScienceKidsTests/ImageCreditsTests`** (4, thêm 2 dòng kiểm vào `creditLines`):
  - dòng của hình ghép: không có dòng nguồn, thay đổi `[composed, cropped, resized]`, từng ảnh nguồn đủ trường;
  - hình thường có thay đổi;
  - luật dòng thay đổi: bỏ lặp, không phân biệt hoa thường, giá trị lạ thành một "Edited", "composed" luôn đầu;
  - chuỗi EN + VI của 4 nhãn và "Ảnh nguồn".

**Ảnh chụp** (iPhone 16 Pro):
- Gói thử: gói `content/.build/pack` (22 ảnh) chép ra scratchpad, mở bằng `-SKContentPack`.
- Chỉ sửa manifest: credit của một ảnh đổi thành hình ghép, với 2 `parts` lấy từ credit thật của hai ảnh quả địa cầu.
- Hai ảnh trong `shots/` ở scratchpad phiên 10/11, không vào repo:
  - `sk033-composed-credit-vi-iphone16pro.png`;
  - `sk033-composed-credit-en-iphone16pro.png`.
- Trong ảnh: thẻ hình ghép ở đầu, có ô "Ảnh nguồn" với 2 ảnh nguồn; thẻ hình thường bên dưới có dòng "Đã thu nhỏ" · "Resized" (gói hiện tại đã có `changes`).

**Chưa kiểm:**
- iPad (cột hẹp của thanh bên và trang rộng): chưa chụp. Thẻ dùng cùng `PaperCard` và chữ như 9/11, nên không đổi bố cục.
- VoiceOver trên máy: chưa nghe thử; mới kiểm bằng cấu trúc phần tử.
- Gói thật có hình ghép từ `content-cli`: chưa có, đang chờ dev.

**Tester kiểm:**
- Gói có hình ghép:
  - thẻ có dòng "Ghép từ nhiều ảnh · …", không có dòng "Nguồn: composed";
  - ô "Ảnh nguồn" đủ số ảnh nguồn, mỗi ảnh có tên, tác giả, giấy phép, nguồn, trang gốc;
  - không có chữ nào bấm được (chạm giữ địa chỉ);
  - EN + VI.
- Hình thường có `changes`: dòng "Đã cắt · Đã thu nhỏ" đúng với manifest.
- Gói cũ (manifest không có `changes`/`parts`): màn vẫn mở, không có dòng thay đổi.
- VoiceOver: phần chính của thẻ đọc một lượt; "Ảnh nguồn" đọc là tiêu đề; mỗi ảnh nguồn đọc một lượt riêng.
- Dynamic Type lớn: địa chỉ dài xuống dòng trong ô lõm, không bị cắt.

**Bổ sung 10/11 (hình tự vẽ, theo mục "dev 10/11: hình tự vẽ"):**
- `changes: ["drawn"]` có nhãn riêng "Hình vẽ của Science Kids" · "Drawn by Science Kids" (`ImageCreditChange.drawn`, chuỗi `credits.change.drawn`). Trước đây giá trị này rơi vào "Đã chỉnh sửa" · "Edited".
- `license` và `source` cùng là "Science Kids" (không phân biệt hoa thường): ẩn dòng "Giấy phép: Science Kids" để khỏi lặp dòng nguồn.
  - Áp dụng cho cả phần tự vẽ trong `parts` của hình ghép.
  - Hình ghép có `source: "composed"` vẫn giữ dòng giấy phép (kể cả khi giấy phép là "Science Kids"), vì đó là dòng duy nhất nói giấy phép.
  - `license_url: ""` đã được đọc lỏng thành thiếu, nên không có dòng "Văn bản giấy phép".
- Test `ImageCreditsTests.drawnCreditLines` (mới) và `changeStrings` (thêm nhãn `drawn` EN + VI). Build qua (`build-for-testing`), nhưng **chưa chạy**: việc này đến sau lượt test duy nhất của ios-dev 10/11. Cần một lượt: `-only-testing:ScienceKidsTests/ImageCreditsTests`.

## dev 10/11: hình ghép
Theo hợp đồng main session giao 10/11 và hai góp ý của ios-dev ở mục trên (`author` chỉ là "Science Kids"; `changes` luôn có `"composed"`, `check-pack.sh` đòi có). Chi tiết lệnh: `tools/content-cli/README.md` mục "Hình ghép (SK-033, dev 10/11)".

**Cú pháp file chọn ảnh** (thêm loại mục thứ ba, cạnh ảnh nguồn và `same_as`):

```json
"learn.explore.explore_people": {
  "composed": {
    "file": "content/images/composed/khung-long/trai-dat-rat-lau-ve-truoc.learn.explore.explore_people.jpg",
    "parts": [
      { "same_as": "tray_longneck" },
      { "same_as": "tray_stegosaurus", "lesson": "khung-long/khung-long-la-gi" },
      { "source": "Wikimedia Commons", "source_url": "…", "file_url": "…", "title": "…", "author": "…", "license": "CC0 1.0", "license_url": "…" }
    ]
  },
  "title": "Timeline from the dinosaurs to a kite",
  "note": "…"
},
"q4": { "same_as": "explore_people" }
```

- `file`: `content/images/composed/<slug chủ đề>/<tên>.jpg` (hoặc `.jpeg`), một cấp thư mục, trong git. Đọc từ `<gốc file chọn ảnh>/composed/…`.
- `parts` (1–12): `same_as` (cùng file, hoặc bài khác với `lesson`) hoặc một mục ảnh nguồn đầy đủ như ảnh thường (có thể có `crop`, `openverse_id`). Phần trỏ tới một hình ghép khác thì lấy các ảnh nguồn của hình đó, chỉ một lớp; lồng hai lớp là lỗi. Một ảnh nguồn lặp lại chỉ tính một lần.
- `title` bắt buộc (tên ở màn Nguồn hình), `note` tuỳ chọn.
- `same_as` tới hình ghép (kể cả từ bài khác) dùng lại nguyên hình.

**Đã làm:**
- **`schema/image-selection.schema.json`**: thêm `Composed` và `Part`. Kiểm thêm ngoài schema: `same_as` không có `lesson` trong `parts` phải trỏ tới mục có ảnh trong cùng file, không trỏ vào chính hình ghép; `crop` của phần nằm trong hình. 10 file chọn ảnh đang có trong `content/images/` vẫn hợp lệ.
- **`images fetch`:**
  - Mỗi ảnh nguồn của hình ghép được kiểm giấy phép ở nguồn, tải và xử lý như ảnh thường. Phần `same_as` phải trỏ tới ảnh hợp lệ (lỗi nêu rõ phần nào).
  - Chưa có file ghép: in "chờ ghép" kèm đường dẫn `content/.images/<sha256>.jpg`, tên và giấy phép của từng ảnh thành phần. Không tính là lỗi (exit 0), vì đây là bước giữa của quy trình.
  - Có file: xử lý như ảnh tải về (xoay EXIF, cạnh dài ≤ 1024, sRGB, JPEG q82, bỏ metadata). File quá lớn, còn metadata hay không phải JPEG thì in "lưu ý" để designer lưu đè cho repo nhẹ.
  - Một ảnh thành phần `KHÔNG DÙNG` thì hình ghép cũng `KHÔNG DÙNG`, exit 1, không vào cache. Hai mục cùng `file` mà khác `title` hay `parts`: lỗi.
  - Khoá cache của hình ghép = sha256 bytes file ghép + cách xử lý. `index.json` ghi `credit` (có `parts`), `changes`, `composed.file`, `composed.file_sha256`, kích thước gốc, sha256 của từng ảnh thành phần trong cache, các lưu ý.
- **Giấy phép** (`license.ts` › `strictestLicense`): chặt nhất trong các phần, CC BY > Public domain > PDM 1.0 > CC0 1.0. Khi bằng nhau lấy phần đứng trước trong `parts`; `license_url` đi theo phần đó.
- **`build`, manifest `assets[]` của hình ghép:**
  - `credit` = `{ title, author: "Science Kids", license, license_url, source: "composed", changes: ["composed", …], parts: [ { title, author, license, license_url, source, source_url } … ] }`, đúng thứ tự khoá này. Không có `source_url` riêng. Hình thường giữ nguyên như cũ.
  - Chưa có file ghép: hình đó vẽ hình giữ chỗ, kèm một cảnh báo "hình ghép chưa có file"; với `--require-assets` thì là lỗi.
  - Có file mà chưa fetch, file sửa sau lần fetch, hoặc `title`/`parts` đổi: lỗi, nhắc chạy lại `images fetch`.
  - Dòng báo cáo: "Hình: N file ảnh (k hình ghép) cho … Image".
- **`check-pack.sh`**, với hình ghép (`credit.source = "composed"`), kiểm:
  - `title`, `author`, `license`, `license_url` (https);
  - `changes` có `composed`, `parts` không rỗng;
  - mỗi part đủ 6 trường, giấy phép hợp quy tắc, hai URL https, không phải hình ghép;
  - có part CC BY thì giấy phép hình ghép phải là CC BY.
  
  Hình thường kiểm như cũ.
- **`validate`**, brief ghép là brief có nhãn chứa "ghép" (`[sơ đồ ghép ảnh]`…) hoặc mở đầu "Ghép …", "Hình ghép …":
  - Đủ một trong ba thì không cảnh báo: có "Từ khoá tìm ảnh (EN)", có "Từ khoá cho <phần>: …", hoặc nêu hình dùng lại trong backtick.
  - Không có gì: cảnh báo `image_brief_keywords` "brief ghép … không có …".
  - Brief ghép mở đầu bằng "Dùng lại hình …" không bị đọc nhầm thành brief dùng lại.
  - Không bắt nhầm "mảnh ghép xếp hình" hay câu chỉ nhắc tới hình ghép khác (brief trứng hoá thạch bài ba).
- **`images search`**, với brief ghép:
  - Mỗi truy vấn của "Từ khoá tìm ảnh (EN)" là một ảnh cần tìm; "Từ khoá cho <phần>: a; b." thêm một ảnh có tên. Mỗi ảnh tìm riêng, tối đa `--per-image` ứng viên.
  - Key trong backtick là ảnh dùng lại: `` `<key>` ``, `` `<bài>/<key>` ``, `` `<chủ đề>/<bài>/<key>` ``, hoặc `` `<key>` ở bài `<chủ đề>/<bài>` ``. Hình của bài mà chính nó dùng lại hình ghép thì bỏ, vd `palaeontologist` trong brief `explore_forms`.
  - `candidates.json` có `composed: { file, title, searches[], reuses[] }`.
  - `candidates.html`: lựa chọn "Hình ghép từ các ảnh đánh dấu", ô đánh dấu cho từng ảnh dùng lại, một lưới ứng viên cho từng ảnh cần tìm. Trang ra mục `composed`, file đề xuất `content/images/composed/<chủ đề>/<bài>.<khoá>.jpg`, `title` = `alt.en`.
- **README** content-cli: mục "Hình ghép" (cú pháp, giấy phép, quy trình designer, fetch, build, check-pack), bảng manifest có thêm dòng credit hình ghép, ví dụ manifest. `cli.ts`: lời dùng `images`.
- Tạo `content/images/composed/.gitkeep`.

**Quy trình designer:**
1. Ghi mục `composed` có `parts`; chưa cần file ghép.
2. Chạy `images fetch <file chọn ảnh>`: ảnh thành phần được kiểm giấy phép và tải về; lệnh in "chờ ghép" cùng danh sách `content/.images/<sha256>.jpg`.
3. Ghép chỉ từ các file đó; lưu vào `composed.file` (JPEG ≤ 1024 px, sRGB, không metadata).
4. Chạy lại `images fetch`: ảnh thành phần "đã có", không gọi mạng; hình ghép "OK".
5. `build`.

**Thử với nội dung thật** (`images search --cache-only --out <scratchpad>`, không gọi mạng):
- Trái Đất bài ba: `explore_crust` có 1 ảnh cần tìm và dùng lại `tray_eggshell`; `explore_mantle`, `explore_core` dùng lại `explore_crust`, khi fetch lấy ảnh nguồn của nó.
- Trái Đất bài năm: `explore_plates` có 2 ảnh cần tìm (quả trứng, "Từ khoá cho hình Trái Đất").
- Khủng long, 8 hình ghép (bài năm không có):
  - bài một: `explore_dinosaurs` (1 ảnh cần tìm, dùng lại `tray_stegosaurus`, `tray_t_rex` của bài hai), `explore_people` (1 ảnh cần tìm, dùng lại `tray_longneck`, `tray_mammoth`);
  - bài hai: `explore_kinds` (1 ảnh cần tìm, 4 hình dùng lại), `explore_reptiles` (2 ảnh cần tìm);
  - bài ba: `explore_forms` (3 ảnh cần tìm), `explore_pictures` (1 ảnh cần tìm, dùng lại `w1_triceratops` của bài một);
  - bài bốn: `explore_plants` (1 ảnh cần tìm, dùng lại `tray_fern`, `tray_cycad` của bài một), `long_neck_egg` (1 ảnh cần tìm, dùng lại `tray_rock_egg` của bài ba).
- `validate content`: 0 lỗi, 86 cảnh báo, giống trước khi sửa. 37 `image_brief_keywords` đều ở *Ăn uống lành mạnh*, không có cảnh báo nào ở brief ghép.

**Test (chạy thật, không gọi mạng):**
- `npm test` ở `tools/content-cli`: **345 test, 345 qua** (trước là 333). `npm run typecheck`: sạch.
- `npm test` ở `packages/content-schema`: **144 qua** (không sửa gì ở package này).
- 12 test mới:
  - `test/images.test.ts`:
    - nhận biết brief ghép;
    - ảnh cần tìm và "Từ khoá cho";
    - hình dùng lại trong brief ghép;
    - validate không cảnh báo sai;
    - giấy phép chặt nhất;
    - file chọn ảnh có hình ghép, hợp lệ và các lỗi có pointer;
    - `SelectionSet` với hình ghép (cùng file, bài khác, lồng một lớp, lồng hai lớp lỗi), credit;
    - search hình ghép: truy vấn từng phần, `candidates.json`, HTML, mục `composed` tạo ra hợp schema;
    - fetch: chờ ghép rồi xử lý, `index.json`, đổi `title`, không gọi mạng lần hai;
    - fetch: phần sai giấy phép, trùng file, phần trỏ sai.
  - `test/build.test.ts` (1): chưa có file thì hình giữ chỗ và `--require-assets` lỗi; fetch thật không gọi mạng; manifest credit đúng thứ tự khoá; `same_as` tới hình ghép; `check-pack.sh` OK và bắt 7 kiểu credit sai; đổi `title` hay sửa file thì build lỗi.

**Ảnh hưởng tới app đang chạy:**
- Không đổi `schema_version`, RPC hay định dạng gói.
- Manifest chỉ thêm `parts` và `changes` trong `credit` của hình ghép. ios-dev đã đọc lỏng hai khoá này (mục trên); app bản cũ bỏ qua khoá lạ.

**Chưa làm · câu hỏi:**
- Chưa chạy `images fetch` thật cho hình ghép nào, vì chưa có file ghép trong repo.
- Gợi ý của search chỉ là đề xuất, designer vẫn rà lại:
  - một brief ghép mà dấu `;` dùng để tách truy vấn thay thế (không phải ảnh khác nhau) sẽ ra hai ô "ảnh cần tìm";
  - backtick nêu một key không phải ảnh thành phần sẽ thành ô đánh dấu sẵn.
- Brief dùng lại có sửa ("Dùng lại hình `explore_people`, bỏ voi ma mút…, thêm chấm đỏ", bài một câu q4) không có chữ "ghép", nên search vẫn đề xuất `same_as`. Muốn ra hình riêng thì designer ghi mục `composed` có `parts: [{ "same_as": "explore_people" }]` (hoặc chỉ các phần còn lại). Đề xuất content-editor thêm nhãn `[sơ đồ ghép ảnh]` cho các brief đó.

**Tester kiểm:**
- File chọn ảnh có một mục `composed`, chưa có file:
  - `images fetch` → ảnh thành phần OK, dòng "chờ ghép" liệt kê đúng file trong `content/.images/`, exit 0;
  - `build` → cảnh báo "hình ghép chưa có file", hình đó không có `asset`.
- Lưu một JPEG vào `composed.file`, rồi:
  - `images fetch` → "OK hình ghép", không gọi mạng cho ảnh thành phần;
  - `build` → manifest `credit` của hình ghép đúng hợp đồng: `author` "Science Kids", `changes` có `composed`, `parts` đủ;
  - `check-pack.sh` OK.
- Sửa manifest đã build: đổi giấy phép hình ghép thành CC0 khi có part CC BY, hoặc bỏ `composed` khỏi `changes` → `check-pack.sh` báo lỗi.
- Sửa `license` của một part thành BY-SA → `images fetch` báo `KHÔNG DÙNG` cả phần đó lẫn hình ghép.
- Mở `candidates.html` của một bài Khủng long có brief ghép:
  - chạm một ứng viên của "Ảnh cần tìm" thì hàng tự chọn "Hình ghép";
  - JSON cuối trang có mục `composed` hợp lệ (`images fetch` đọc được).

## dev 10/11: fetch nhẹ cho Wikimedia
Lý do: khi fetch thật 9 bài, `upload.wikimedia.org` trả HTTP 429 liên tục cho file gốc độ phân giải cao (vd `Red_hot_iron_is_forged_with_hammer_and_anvil.jpg`); khoảng 100 ảnh kẹt qua 5 lượt chạy lại.

**Đã làm** (`tools/content-cli/src/images/`):
- **Không tải file gốc Commons.** Lượt imageinfo dùng để kiểm giấy phép nay hỏi `iiurlwidth=1280` (trước là 2048), và fetch tải `thumburl` của chính lượt đó (`sources.ts` › `commonsDownloadUrl`). 1280 là một cỡ thumbnail chuẩn của Wikimedia, có sẵn trong cache của họ.
  - Ảnh rộng ≤ 1280 px dạng JPEG/PNG/WebP thì tải URL gốc (đã nhỏ). TIFF và định dạng khác luôn lấy bản Commons vẽ lại.
  - Ảnh `Openverse/Wikimedia Commons` cũng lấy bản 1280 khi URL file trên Commons trùng URL Openverse ghi; khác thì tải URL Openverse như cũ.
  - Giấy phép vẫn kiểm qua extmetadata, trong cùng lượt API.
  - `crop` là tỉ lệ nên áp như nhau trên bản thu nhỏ. Cạnh dài sau xử lý vẫn ≤ 1024.
- **Thử lại 429/503** (`net.ts` › `politeHttp`), áp cho Commons API và mọi lượt tải ảnh:
  - chờ theo `Retry-After` (số giây hoặc ngày giờ HTTP), ít nhất 5 / 15 / 45 s cho lượt thử lại 1 / 2 / 3, nhiều nhất 120 s; mỗi lần chờ in một dòng;
  - sau 3 lượt thử lại vẫn lỗi thì ảnh đó `KHÔNG DÙNG, lỗi: HTTP 429 …` như cũ.
- **Nhịp gọi:** throttle theo host, chờ trước mọi lượt kể cả lượt thử lại.
  - tải từ `upload.wikimedia.org` cách nhau 3 s (trước 0,3 s);
  - Commons API cách nhau 1 s (trước 0,3 s);
  - nguồn tải khác 0,3 s; Openverse 3,1 s như cũ.
- User-Agent giữ nguyên. README content-cli mục `images fetch` đã cập nhật.

**Quyết định:**
- Openverse API không thử lại: mỗi lượt tính vào hạn mức 190/ngày, 429 ở đó vẫn là lỗi như trước. `images search` không đổi.
- `Retry-After` lớn hơn 120 s thì chờ 120 s rồi thử, không bỏ ngay.
- Khoá cache không đổi: ảnh đã có trong `content/.images/` (tải từ bản 2048 hoặc file gốc) vẫn "đã có", không tải lại. `--force` mới tải lại từ bản 1280.
- `index.json` của ảnh mới ghi `downloaded_url` là URL `1280px-…` và `original` là kích thước bản thu nhỏ.

**Test (chạy thật, không gọi mạng):**
- `npm test` ở `tools/content-cli`: **352 test, 352 qua** (trước 345). `npm run typecheck`: sạch.
- 7 test mới trong `test/images.test.ts`:
  - `retryAfterMs`, `retryWaitMs`;
  - `politeHttp`: Retry-After giây và ngày giờ, backoff khi không có header, giới hạn 120 s, hết lượt trả 429, 404 không thử lại, throttle theo host;
  - `commonsDownloadUrl`;
  - fetch tải bản 1280, không gọi URL gốc, crop đúng nửa ảnh trên bản thu nhỏ, `upload.wikimedia.org` cách nhau 3 s;
  - fetch 503/429 rồi qua; 429 mãi thì `KHÔNG DÙNG`, exit 1, không vào cache.
- Chưa chạy fetch thật (main session chạy).

**Tester kiểm (khi fetch thật):**
- `content/.images/index.json`: ảnh Commons rộng hơn 1280 px có `downloaded_url` dạng `…/thumb/…/1280px-…`, không phải URL file gốc.
- Ảnh có `crop`: hình trong `content/.images/` cắt đúng phần như brief.
- Gặp 429: thấy dòng "chờ … s rồi thử lại (lần k/3)".
- 100 ảnh mất khoảng 5–6 phút (3 s mỗi lượt tải, cộng lượt API).

## 9 bài pilot còn lại (10/11)
- **Chọn ảnh:**
  - 3 designer chọn ảnh, Duy duyệt ("Duyệt, đưa lên máy");
  - main session bỏ 2 ảnh Rawpixel vì không kiểm được giấy phép (trang chặn bot); kiểm tay 2 ảnh StockSnap, đều CC0.
- **content-editor:**
  - sửa `alt`/`brief` theo ảnh đã chọn;
  - 4 câu trẻ nghe đổi chữ (ví dụ của `layer`, `wave`; nhãn `tray_dark`), đã sinh lại giọng.
- **`images fetch`:**
  - lượt đầu bị upload.wikimedia.org trả 429 liên tục;
  - dev đổi sang tải bản 1280 px, có Retry-After và giãn nhịp;
  - sau đó tải đủ: Trái Đất 76 ảnh, Khủng long 105 ảnh, 0 lỗi.
- **Gói:**
  - `build`: 178 ảnh cho 356 Image; 189 Image chưa có ảnh (chỗ thiếu của pilot và *Ăn uống lành mạnh*);
  - 80,3 MB; `check-pack` OK.
- **Máy thật:** đã cài và mở trên iPhone Luu.
- **Còn lại:**
  - hình ghép (designer làm tiếp);
  - nhóm đồ vật tự chụp, ảnh trẻ đúng tư thế động đất, cảnh khó (đàn, tổ, bụi), bản đồ Việt Nam: chờ Duy chọn cách làm;
  - thẻ trứng bài 4 *Khủng long*: chờ Duy.

## dev 10/11: hình tự vẽ
Duy 10/11: đồ vật không có ảnh miễn phí hợp lệ thì "nhờ AI vẽ ảnh minh hoạ"; designer (hoặc agent) vẽ, xuất JPEG. Hình do Science Kids làm, không có nguồn ngoài. Hợp đồng do main session chốt; chi tiết lệnh: `tools/content-cli/README.md` mục "Hình tự vẽ (SK-033, dev 10/11)".

**Cú pháp file chọn ảnh** (loại mục thứ tư, cạnh ảnh nguồn, `same_as`, `composed`):

```json
"tray.tray_globe": {
  "own": { "file": "content/images/own/be-mat-trai-dat/globe.jpg", "method": "drawn" },
  "title": "Plastic globe on a desk",
  "note": "designer vẽ 10/11 theo brief"
},
"q2.q2_globe": { "same_as": "tray_globe" }
```

- `file`: `content/images/own/<slug chủ đề>/<tên>.jpg` (hoặc `.jpeg`), một cấp thư mục, trong git. Đã tạo `content/images/own/.gitkeep`.
- `method`: chỉ `drawn` (vẽ tay hay vẽ bằng AI). Sau thêm `photo` (tự chụp) chỉ cần thêm vào `enum` của schema và `OWN_METHODS`.
- `title` bắt buộc (tên ở màn Nguồn hình), `note` tuỳ chọn.
- `same_as` tới hình tự vẽ (cả từ bài khác) dùng như ảnh thường.
- Hình tự vẽ làm được phần của hình ghép, theo hai cách: viết `{ "own": …, "title": … }` ngay trong `parts`, hoặc `{ "same_as": "<khoá mục own>" }`.

**Credit trong manifest** (giữ đúng dạng main session đề xuất, ios-dev không phải đổi cách đọc):
- Hình tự vẽ: `{ "title", "author": "Science Kids", "license": "Science Kids", "license_url": "", "source": "Science Kids", "changes": ["drawn"] }`, đúng thứ tự khoá này. Không có `source_url`, không có `parts`.
- Phần tự vẽ trong `parts` của hình ghép: `{ "title", "author": "Science Kids", "license": "Science Kids", "license_url": "", "source": "Science Kids" }` (không có `source_url`).
- Giấy phép hình ghép (thứ tự chặt nhất): CC BY > **Science Kids** > Public domain > PDM 1.0 > CC0 1.0.
  - Có phần CC BY: vẫn là CC BY.
  - Có phần tự vẽ, không phần CC BY: `license` "Science Kids", `license_url` "".
  - Lý do: hình ghép đó là của mình, ghi CC0 là sai.

**Đã làm** (`tools/content-cli`):
- **`schema/image-selection.schema.json`:** thêm `Own`. `Entry` và `Part` nhận `own`. 10 file chọn ảnh đang có trong `content/images/` vẫn hợp lệ.
- **`src/images/selection.ts`:**
  - kiểu `Own`, `isOwn`, `OWN_METHODS`;
  - `ownCredit`, `partCredit`, `ownCacheKey` (khoá = `own.file` + sha256 bytes file + cách xử lý), `localImagePath`;
  - `SelectionSet.resolve` trả `{ own, key, via? }`;
  - phần của hình ghép là ảnh nguồn hoặc hình tự vẽ (bỏ trùng theo file).
- **`src/images/license.ts`:** `licenseRank` thêm hạng "Science Kids". CC BY đổi số hạng từ 3 thành 4; thứ tự cũ giữ nguyên.
- **`images fetch`** (`fetch.ts`):
  - mục `own`, kể cả `own` đến qua `same_as` từ bài khác hay làm phần của hình ghép, không gọi mạng;
  - có file thì xử lý như ảnh tải về: xoay EXIF, cạnh dài ≤ 1024, sRGB, nền trong suốt thành trắng, JPEG q82, bỏ metadata. File không phải JPEG, lớn hơn 1024 px hay còn metadata thì in "lưu ý" để designer lưu đè;
  - `index.json` ghi `credit`, `changes: ["drawn"]`, `own.file`, `own.file_sha256`, `own.method`, kích thước gốc, các lưu ý;
  - chạy lại: "đã có". Đổi `title` thì xử lý lại;
  - hai mục cùng `file` mà khác `title` hay `method`: lỗi;
  - hình tự vẽ xử lý trước hình ghép. Hình ghép có phần tự vẽ chưa dùng được thì cũng `KHÔNG DÙNG`.
- **`build`:**
  - điền `asset`, ghi credit như trên;
  - dòng báo cáo: "Hình: N file ảnh (k hình ghép, m hình tự vẽ) cho … Image";
  - lỗi khi file tự vẽ chưa có, chưa fetch, sửa sau lần fetch, hay `title`/`method` đổi.
- **`check-pack.sh`:**
  - `credit.source = "Science Kids"`: có `title`; `author`, `license` là "Science Kids"; `license_url`, `source_url` trống hoặc không có; không `parts`; `changes` có `drawn`. Không đòi URL https;
  - hình ghép: chấp nhận phần tự vẽ (không URL);
  - hình ghép có phần tự vẽ mà không phần CC BY thì giấy phép phải là "Science Kids";
  - `license_url` của hình ghép chỉ được trống trong trường hợp đó.
- **Nhãn brief `[hình vẽ]`** (cả `[hình tự vẽ]`, `[tự vẽ]`; `slots.ts` › `isOwnBrief`):
  - `validate` không đòi "Từ khoá tìm ảnh (EN)";
  - `images search` không tìm, không gọi mạng; `candidates.json` có `own` đề xuất (file `content/images/own/<chủ đề>/<bài>.<khoá>.jpg`, `title` = `alt.en`);
  - `candidates.html` có lựa chọn "Hình tự vẽ (đã có file)", mặc định "Chưa chọn"; mục `own` đã có trong file thì hiện "Đang chọn: hình tự vẽ …";
  - `openverseCategory` bỏ `[hình vẽ]` (nhãn này không bao giờ được tìm).
- README content-cli (mục mới "Hình tự vẽ", bảng manifest, ví dụ manifest, validate, search, hình ghép, check-pack, kiểm thử), lời dùng `images` trong `cli.ts`.

**Quyết định (dev):**
- **Thiếu file là lỗi, không phải "chờ".** Hình ghép thì "chờ ghép" vì phải fetch ảnh thành phần trước. Hình tự vẽ không có bước trước, nên mục `own` nghĩa là đã vẽ xong. Gõ sai đường dẫn cũng ra lỗi này: `fetch` exit 1, `build` lỗi.
- **`changes` của hình tự vẽ chỉ có cách làm (`drawn`).** Không ghi `resized` khi fetch thu nhỏ, vì `changes` dùng để báo sửa ảnh của người khác (CC BY), không áp cho hình của mình.
- **Khoá cache gồm cả đường dẫn `own.file`.** Hai file cùng bytes ở hai chỗ, mang hai `title`, không ghi đè credit của nhau.

**Ảnh hưởng tới app đang chạy:**
- Không đổi `schema_version`, RPC hay định dạng gói.
- Manifest chỉ có thêm giá trị mới trong các khoá đã có: `source`/`license` "Science Kids", `license_url` "", `changes` "drawn". Theo mục "ios-dev 9/11: ảnh thật", `ImageCredit` coi chuỗi trống và khoá thiếu là thiếu, nên app bản hiện tại vẫn hiện được. dev chưa chạy app để kiểm.

**Đề xuất:**
- ios-dev:
  - `changes: ["drawn"]` đang hiện thành "Đã chỉnh sửa" · "Edited" (giá trị lạ). Nên thêm nhãn riêng cho `drawn`, ví dụ "Hình vẽ của Science Kids" · "Drawn by Science Kids";
  - có thể ẩn dòng "Giấy phép: Science Kids" khi `source` cũng là "Science Kids" (designer quyết);
  - không cần sửa gì để đọc `license_url` "" hay thiếu `source_url`.
- content-editor: thêm nhãn `[hình vẽ]` vào `content/TEMPLATE.md` mục A (danh sách loại hình), kèm một câu: hình tự vẽ không cần "Từ khoá tìm ảnh (EN)", brief tả cần vẽ gì. Ví dụ: "nền trơn, không có chữ, nhìn nghiêng".
- designer: lưu JPEG ≤ 1024 px, sRGB, không metadata vào `content/images/own/<chủ đề>/`, ghi mục `own` rồi chạy `images fetch` cho file chọn ảnh đó.

**Test (chạy thật, không gọi mạng):**
- `npm test` ở `tools/content-cli`: **361 test, 361 qua** (trước 352). `npm run typecheck`: sạch.
- 9 test mới:
  - `test/images.test.ts` (8):
    - nhãn `[hình vẽ]`;
    - validate không cảnh báo brief hình tự vẽ (brief dùng lại có nhãn vẽ vẫn kiểm như cũ);
    - file chọn ảnh có `own` hợp lệ (same_as, phần của hình ghép);
    - 7 kiểu `own.file` sai, thiếu `title`, `method` lạ, thiếu `method`, có khoá `license`, phần tự vẽ có khoá lạ;
    - `SelectionSet` với hình tự vẽ (cùng file, bài khác, phần của hình ghép qua `same_as` và qua hình ghép bài khác, bỏ trùng), credit hình ghép CC BY / Science Kids;
    - search `[hình vẽ]`: không gọi mạng, mục `own` hợp schema, HTML, lựa chọn cũ;
    - fetch: thiếu file lỗi; PNG trong suốt 1600×1200 ra JPEG 1024×768, không alpha, không metadata; "đã có"; đổi `title`; trùng file khác `title`; file hỏng;
    - fetch hình ghép có phần tự vẽ: credit `license` "Science Kids" (có phần CC0), `parts` đúng thứ tự.
  - `test/build.test.ts` (1):
    - thiếu file, chưa fetch: lỗi;
    - fetch không gọi mạng;
    - manifest credit đúng thứ tự khoá;
    - `same_as` tới hình tự vẽ;
    - hình ghép CC BY có phần tự vẽ; hình ghép chỉ có phần tự vẽ ra giấy phép "Science Kids";
    - `check-pack.sh` OK và bắt 9 kiểu credit sai;
    - đổi `title`, sửa file: lỗi.
  - Thêm 2 dòng kiểm vào test giấy phép chặt nhất.
- `validate content`: exit 0, **0 lỗi**, 86 cảnh báo, như trước.
- `images search --cache-only --out <scratchpad>` bài 1 *Đất và nước trên Trái Đất*: exit 0, không gọi mạng.

**Chưa làm:**
- Chưa có hình tự vẽ thật nào trong repo, nên chưa chạy `fetch` hay `build` với nội dung thật.

**Tester kiểm:**
- Một mục `own` trỏ tới file chưa có: `images fetch` → `KHÔNG DÙNG hình tự vẽ, chưa có file …`, exit 1, không gọi mạng; `build` → lỗi đúng pointer.
- Lưu một JPEG (hoặc PNG lớn) vào `own.file`:
  - `images fetch` → "OK hình tự vẽ …" (PNG thì có "lưu ý");
  - `build` → manifest credit đúng hợp đồng, `changes: ["drawn"]`, không `source_url`;
  - `check-pack.sh` OK, dòng ảnh có "(… hình tự vẽ)".
- Sửa manifest đã build:
  - `author` khác "Science Kids", thêm `license_url` https, `changes` thiếu `drawn` → `check-pack.sh` báo lỗi;
  - hình ghép có phần tự vẽ, không phần CC BY, mà `license` "CC0 1.0" → lỗi.
- Mở `candidates.html` của một bài có brief `[hình vẽ]`: chọn "Hình tự vẽ (đã có file)" → JSON có mục `own` hợp lệ (`images fetch` đọc được).
- Trên app (gói có hình tự vẽ), màn Nguồn hình:
  - hiện tên, "Science Kids" ở tác giả, giấy phép, nguồn;
  - không có dòng trang gốc hay văn bản giấy phép;
  - dòng thay đổi là "Đã chỉnh sửa" cho tới khi ios-dev thêm nhãn `drawn`.

## Lấp ô trống 2 chủ đề pilot (main session 10/11 tối)
- **Designer làm 2 lượt:**
  - FEMA/USGS không có tranh public domain dùng được, nên designer tự vẽ.
  - Cảnh khó làm bằng hình ghép.
  - Kiểm lại kiểu hình trong từng câu: đáp án đúng không được là hình vẽ duy nhất giữa các ảnh chụp. Đã sửa q1 và q4 bài 05 Trái Đất, q3 và q5 bài 03 Khủng long, q2 bài 05 Khủng long.
- **Content-editor:**
  - nhãn brief `[hình vẽ]` / `[sơ đồ ghép ảnh]`, alt, ghi chú cũ;
  - bỏ món `tray_hill_crater` (không có ảnh miệng núi lửa Việt Nam hợp lệ); `vocab.crater` dùng lại `tray_island_crater`;
  - TEMPLATE thêm mục `[hình vẽ]`.
  - Lượt hai (brief theo hình lượt 2 của designer) đang chạy.
- **Gói `content/.build/pack`:**
  - 262 ảnh (28 hình ghép, 50 hình tự vẽ) cho 483 Image;
  - `check-pack.sh` OK;
  - chỉ còn trống `cac-chau-luc-va-dai-duong` `explore_vietnam` (bản đồ nhà nước, chờ Duy).
- **Chờ Duy:**
  - `explore_vietnam`.
- **Duy chốt 10/11:** `khung-long-an-gi-song-ra-sao` `q4.q4_alone` giữ tranh nền ven hồ (hình ghép), cho khớp `q4_herd` và `q4_nest`; không trả về ảnh nền trắng.
- **Còn mở:**
  - `tray_red_soil`: ảnh đất đỏ ba-dan ở Brazil (CC0), 499×228, hơi nhoè. Ảnh thay là "Red Soil Oklahoma" (PD). Tốt nhất là nhóm tự chụp đất đỏ Tây Nguyên.
  - `explore_kinds`: đúng tỉ lệ nên khủng long nhỏ và gà chỉ còn chấm ở ô 61 pt. Xe buýt là hình tự vẽ phẳng, khác nét với tranh khủng long.
  - `tray_meat_eater` hé miệng thấy răng, khác ghi chú An toàn "miệng ngậm". PM chốt.
  - Bài 04 Khủng long câu q4 chỉ có hai hàng dấu chân, brief đòi 5–6.
  - Bài 03 Trái Đất câu q3 (sơ đồ cạnh ảnh) chờ tester.
  - Kệ Chơi bài 05 Khủng long: `tray_dry_fern` là hình vẽ duy nhất giữa các ảnh.
  - Ảnh cắt hẹp từ thumbnail 1280 px hơi mềm trên iPad.
  - Cần chuyên môn kiểm sơ đồ núi lửa, sơ đồ sóng thần, tỉ lệ các hình ghép khủng long.
