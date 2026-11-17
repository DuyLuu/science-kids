# Science Kids iOS

App universal iPhone + iPad, iOS 17+, Swift 6 (strict concurrency `complete`), SwiftUI. Project Xcode sinh bằng [XcodeGen](https://github.com/yonaskolb/XcodeGen) từ `project.yml`; `ScienceKids.xcodeproj` không đưa vào git.

Yêu cầu: Xcode 16.3 trở lên, Homebrew (để `bootstrap.sh` cài XcodeGen nếu máy chưa có). Không cần Apple ID hay team để build và test trên simulator.

## Chạy lần đầu

```sh
cd apps/ios
./bootstrap.sh          # cài XcodeGen nếu thiếu, sinh ScienceKids.xcodeproj
./bootstrap.sh --open   # như trên rồi mở Xcode
```

Chạy lại `./bootstrap.sh` mỗi khi sửa `project.yml`, thêm hoặc xoá file trong `ScienceKids/`, `ScienceKidsTests/`. File mới trong `Packages/SKKit` thì không cần (Swift package tự nhận).

Gói nội dung (có tiếng) không nằm trong git: build bằng `tools/content-cli` (`npm run tts` rồi `npm run build`, xem mục "Gói nội dung và giọng đọc"). `bootstrap.sh` nhắc lệnh khi chưa có gói. Không có gói thì app vẫn build và chạy bằng fixture, không có tiếng.

## Build và test

```sh
cd apps/ios
xcodebuild build -project ScienceKids.xcodeproj -scheme ScienceKids \
  -destination 'platform=iOS Simulator,name=iPhone 16'
xcodebuild test  -project ScienceKids.xcodeproj -scheme ScienceKids \
  -destination 'platform=iOS Simulator,name=iPhone 16'
xcodebuild test  -project ScienceKids.xcodeproj -scheme ScienceKids \
  -destination 'platform=iOS Simulator,name=iPad Pro 11-inch (M4)'
```

Scheme `ScienceKids` chạy 10 bundle test trong một lệnh: `ScienceKidsTests` (app), `ScienceKidsUITests` (gallery SK-008, luồng mở app SK-011, bài học SK-012, giọng đọc SK-016, đồng bộ SK-022) và 8 target của SKKit. Chỉ chạy unit test (nhanh, khoảng 2 phút mỗi máy): thêm `-skip-testing:ScienceKidsUITests`. Chỉ chạy UI test của luồng mở app: `-only-testing:ScienceKidsUITests/OnboardingUITests` (khoảng 3 phút). Unit test dùng Swift Testing (`import Testing`); UI test dùng XCTest. Trong UI test, `testGalleryScreenshots` và `OnboardingUITests.testScreenshots` bị skip trừ khi có `TEST_RUNNER_SK_SCREENSHOT_DIR=<thư mục>` (lưu ảnh gallery dọc, và ngang trên iPad; ảnh 4 màn SK-011 tên `<máy>-<màn>.png`); `testReplayDoesNothingWithSystemReduceMotion` bị skip trừ khi simulator đang bật Reduce Motion.

`TEST_RUNNER_SK_SCREENSHOT_DIR` phải là **biến môi trường của tiến trình `xcodebuild`**, đặt trước lệnh: `TEST_RUNNER_SK_SCREENSHOT_DIR=/đường/dẫn xcodebuild test …`. Viết sau `xcodebuild` như một build setting (`xcodebuild test … TEST_RUNNER_SK_SCREENSHOT_DIR=…`) thì test runner không nhận và không ra ảnh nào (tester SK-035).

UI test mở bài fixture (`LessonFixture`, bài "Thức ăn cho ta những gì?") qua màn Chủ đề của nó (`LessonFixture.open(in:)`, vị trí đọc từ `content/syllabus.json`), không qua nút "Học tiếp": nút đó mở bài đã soạn đầu tiên của hành trình, bài này đổi mỗi khi có nội dung mới (SK-035).

## Luồng mở app và hồ sơ (SK-011)

- Chưa có hồ sơ: Chào mừng → Hồ sơ của bé → Trang chủ. Có hồ sơ: vào thẳng Trang chủ. Trang chủ → Chủ đề → bài (route `AppRoute.lesson`, SK-012 gắn LessonPlayer vào `MainFlow.destination`).
- Hồ sơ là một file JSON, tên trường theo `child_profiles` (B5.3), module `Profiles` của SKKit. Xem file trên simulator:
  ```sh
  cat "$(xcrun simctl get_app_container booted vn.sciencekids.app data)/Library/Application Support/child_profile.json"
  ```
- Mở lại từ màn Chào mừng như cài mới (bản Debug): `xcrun simctl launch booted vn.sciencekids.app -SKResetProfile YES`, hoặc `xcrun simctl uninstall booted vn.sciencekids.app` rồi cài lại.
- Bỏ qua Chào mừng khi máy chưa có hồ sơ (bản Debug, cho UI test trên máy cài sạch, SK-047): `-SKTestProfile YES` lưu một hồ sơ thử (tên "Test", Lớp 3, Discoverer, Song ngữ) trước màn đầu tiên; thay `YES` bằng `en_first` hoặc `vi_first` để chọn ngôn ngữ. Máy đã có hồ sơ thì giữ nguyên hồ sơ đó, không ghi đè. Đi cùng `-SKOpenLesson <lesson id>` thì mở thẳng bài. Thêm `-SKResetProfile YES` thì mỗi lần mở là một hồ sơ thử mới, không lịch sử, không lượt dở (đừng dùng cho test cần mở lại bài đang dở). Bản Release bỏ qua tham số này. Ví dụ: `xcrun simctl launch booted vn.sciencekids.app -SKTestProfile YES -SKSyncOff YES -SKOpenLesson <id>`.
- Ngôn ngữ giao diện theo máy; thử EN: thêm `-AppleLanguages "(en)"` khi launch. Chữ của bài theo `language_mode` của hồ sơ.
- Nội dung bản thử: từ SK-016 là gói của content-cli (mục "Gói nội dung và giọng đọc"); fixture `packages/content-schema/fixtures/valid` (folder reference, trong bundle là `valid/…`) chỉ dùng khi bản build không có gói.
- Thử nội dung chưa có trong bundle (bản Debug, SK-033): `xcrun simctl launch booted vn.sciencekids.app -SKContentFolder <đường dẫn tuyệt đối> -SKSyncOff YES`. Thư mục có dạng `fixtures/valid` (`<nhóm tuổi>/<chủ đề>/topic.json` và các bài), đọc như fixture: không gói, không audio, `rules.json` và `syllabus.json` vẫn của bundle. Ví dụ chép `fixtures/valid` ra một thư mục tạm rồi thêm `image` cho thẻ từ để xem thẻ có hình.
- Thử một gói nội dung khác gói trong bundle (bản Debug, SK-033): `xcrun simctl launch booted vn.sciencekids.app -SKContentPack <đường dẫn tuyệt đối tới thư mục gói> -SKSyncOff YES`. Thư mục là gốc của gói (chứa `catalog/v1/manifest.json`), app mở và kiểm như gói nhúng (sha256, size), có audio và ảnh thật. `-SKContentFolder` thắng nếu truyền cả hai. Trên simulator không phát được âm thanh, thêm `-SKAssumeVoiceOver YES` để tắt tự phát (lần thử 9/11: mỗi clip báo `didNotStart` sau khoảng 15 giây, màn hình đứng trong lúc đó).
- Ảnh thật (SK-033): gói có asset `kind: "image"` (JPEG `assets/<sha256>.jpg`, `width`, `height`, `credit`) thì mọi chỗ có `Image.asset` trùng sha256 vẽ ảnh (`DesignSystem.ContentPicture`), không có thì vẽ `PlaceholderArt` như cũ. Ảnh đọc qua `ContentPack.imageData(for:)` (kiểm sha256), giải mã ở cỡ hiển thị ngoài main thread và giữ trong `PictureStore` (`NSCache`, tối đa 64 MB). Màn "Nguồn hình" · "Image credits" mở từ dòng cuối danh sách hành trình ở Trang chủ, chỉ hiện khi gói có ảnh; địa chỉ trang gốc và giấy phép là chữ, không bấm được (chưa có cổng phụ huynh).
- Danh mục syllabus (SK-030): `content/syllabus.json` vào bundle thành `syllabus.json` (khai trong `project.yml`, đọc tại chỗ như `rules.json`). `ContentKit.Journey` đặt nội dung lên danh mục theo `topic_id`, `lesson_id`: Trang chủ hiện mọi chủ đề của nhóm theo `number` (mặc định nhóm của hồ sơ, ba chip để xem nhóm khác), màn Chủ đề hiện mọi bài; bài đã soạn chơi được, bài chưa soạn hiện "Chưa có nội dung". Không khoá bài nào. Nhãn "Miễn phí" tắt khi gói trả phí tắt (`AppFeatures.paidPlanEnabled`). Thiếu hoặc hỏng file danh mục thì app ghi log và chỉ hiện các chủ đề có nội dung.
- Hình (giấy cắt từ canvas, đã bỏ filter `paperE`) là SVG trong `Assets.xcassets/Art`; tạo lại bằng `python3 apps/ios/scripts/extract-canvas-art.py` (chạy từ gốc repo) khi designer đổi hình trên canvas.
- Biểu tượng chủ đề (SK-034, 46 icon của designer ở `design/icons/topics/<key>.svg`) nằm trong `Assets.xcassets/Art/Topics/Topic-<key>.imageset` (giữ vector, một cỡ); chép lại bằng `sh apps/ios/scripts/import-topic-icons.sh` khi designer sửa icon. Chủ đề chưa có icon dùng icon của mạch (`TopicIcon.strandIcons`).

## Thẻ, Huy hiệu, Từ vựng (SK-035)

- Ba tab làm từ bài bé đã học, không có luật riêng: thẻ của bài (`reward.collectible`) nhận khi bài xong (như màn Thưởng); bộ từ là `vocab` của từng bài đã xong; sao và chuỗi ngày là số của Trang chủ (`HomeProgress`), dải tuần T2–CN theo `computeStreak` hoặc chuỗi của server (`StreakWeek`). Phần tính nằm ở `ContentKit` (`CardCollection`, `WordDecks`, `WordReview`, `StrandBadge`), test ở `ContentKitTests/CollectionTests` và `ScienceKidsTests/CollectionAppTests`.
- Huy hiệu: một huy hiệu mỗi mạch (`Topic.Strand`; mạch lạ gom vào huy hiệu "Khoa học"), tiến độ là số chủ đề "Đã xong" trên số chủ đề của mạch trong nhóm tuổi của hồ sơ; tên câu hỏi trong `strand.<mạch>.question`.
- Một chủ đề "Đã xong" (bản đồ Hành trình, huy hiệu) khi bé xong **mọi bài của chủ đề trong danh mục**, kể cả bài chưa soạn, nên soạn thêm bài không kéo lùi tiến độ; "x/n bài" đếm mọi bài của danh mục (SK-035 lượt 2, mặc định của main session, Duy đổi được).
- Từ đã nhớ lưu trên máy theo hồ sơ: `Library/Application Support/words/<child id>.json` (id các `VocabTerm`), không lên server. `-SKResetProfile YES` xoá cả thư mục `words/`.

## Bài học (SK-012)

- `LessonPlayer` (SKKit): `LessonSession` chạy bài theo bước Khởi động → Học → Chơi → Quiz → Tổng kết → Thưởng (Tổng kết từ SK-047; bài được chấm và ghi lịch sử khi vào Tổng kết); mọi phép chấm gọi `LessonEngine` (`scoreItem`, `scoreLesson`, `computeStars`, `computeXP`, `buildTray`) với tham số từ `content/rules.json` (bundle là `rules.json`, khai trong `project.yml`). `LessonPlayerView` vẽ từng bước; app gắn vào route `AppRoute.lesson` (`MainFlow`).
- Dừng giữa bài: tiến độ ghi sau mỗi bước và mỗi lần kiểm tra vào `Library/Application Support/lessons/in_progress/<lesson id>.json`; bài xong ghi vào `lessons/history.json` (dạng `lesson_attempts` + `quiz_answers` cho SK-022). App bị tắt giữa bài thì mở lại vào đúng bước; bé bấm nút đóng thì lần sau mở app ở Trang chủ, vào bài lại thì tiếp đúng chỗ. Bỏ dở quá 7 ngày thì làm lại từ đầu.
  ```sh
  D="$(xcrun simctl get_app_container booted vn.sciencekids.app data)/Library/Application Support/lessons"
  cat "$D"/in_progress/*.json; cat "$D/history.json"
  ```
- `-SKResetProfile YES` xoá cả hồ sơ lẫn thư mục `lessons/`.
- UI test: `-only-testing:ScienceKidsUITests/LessonUITests` (luồng vàng, 4/6, dừng giữa bài, 7 lời nhắn mâm cơm, vùng chạm, audit, ảnh). Đáp án và chữ mong đợi đọc từ fixture và `content/rules.json` (`ScienceKidsUITests/LessonFixture.swift`). `testGoldenPathWithSystemReduceMotion` chỉ chạy khi simulator bật Reduce Motion.

## Quiz Đợt 1 (SK-047)

- **Xáo:** lựa chọn SC, MC, kho từ FB, thẻ OS hiện theo `SeededOrder` (Fisher–Yates trên SplitMix64, hạt giống `attemptId` + key câu, viết tay để Android dựng lại được; thuật toán ghi trong chú thích `SeededOrder.swift`, vector ở `SeededOrderTests.goldenPermutations`). Thẻ OS không bao giờ ra đúng thứ tự `answer`. Không xáo hai thẻ TF, cột biểu đồ, chỗ trống. Kệ Chơi dùng cùng thuật toán (khoá `play`).
- **`order_sequence`:** sai còn lượt thì thẻ đúng chỗ khoá lại (lá tre + triện), thẻ sai về kho; mũi tên giữa các ô; iPhone từ 4 thẻ xếp 2 hàng (`OrderLayout`), iPad một hàng.
- **Biểu đồ:** tên cột luôn hiện; giá trị nguyên ≤ 10 thì vẽ khối đếm được (`BarChartLayout`).
- **Gợi ý** (Discoverer): bóng đèn cạnh nút nghe; chạm thì in, đọc `hint` và ghi `hint_used` (`markHintUsed`), câu xong thì nút ẩn giữ chỗ. Explorer không có nút.
- **Tổng kết:** bước `.recap` (`RecapStep`, `LessonRecap`): Màn 1 ba ý chính (hình nhóm Học ghép theo chữ, `KeyPointPictures`), Màn 2 thẻ "Ý sai → Ý đúng", từ mới, mục tiêu.
- Chữ tiếng Việt có gạch nối giữa hai chữ cái (ô-xi) hiển thị bằng U+2011 (`String.keepingHyphenatedWords`).
- **Nhãn bé đọc để chọn** (thẻ kho FB, tên lựa chọn SC/MC, chữ thẻ Đúng/Sai, tên cột biểu đồ, từ mới ở Học và Tổng kết): `WordFitText` (`Views/WordFit.swift`) đo bằng font thật ở cỡ chữ đang dùng; một từ nằm một dòng, thu nhỏ tới 0,5, không bao giờ "…" hay ngắt giữa từ; cụm nhiều chữ xuống dòng ở dấu cách (tối đa 2 dòng, lựa chọn không hình 3 dòng). Bề rộng thẻ lấy từ `LabelWidths` (cùng số với `WordFitLayoutTests`); kho từ và lưới từ Tổng kết bớt một cột khi một từ vẫn không vừa ở 0,5 (Slide Over 320, cỡ chữ lớn). `WordFitLayoutTests` quét mọi nhãn của gói nhúng (EN và VI) trên bề rộng iPhone 16e, iPhone 16, iPad Pro 11 ở cỡ chữ mặc định và cỡ trần `xLarge`.

## Gói nội dung và giọng đọc (SK-016)

- **Nhúng gói:** build phase "Embed content pack" (`scripts/embed-content-pack.sh`, khai trong `project.yml`) chép `content/.build/pack` (build setting `SK_CONTENT_PACK_DIR`) vào bundle thành `pack/` mỗi lần build. Không có gói thì in `warning: Content pack not found…` trong log build và app chạy bằng fixture, không có tiếng. Thử bản không gói mà không xoá gói: `xcodebuild build … SK_CONTENT_PACK_DIR=/khong-co`. Script chạy ngoài sandbox (`ENABLE_USER_SCRIPT_SANDBOXING: NO` riêng target `ScienceKids`): nó chép cả cây file không biết trước, còn sandbox chỉ cho ghi đúng đường dẫn đã khai trong `outputFiles` (SK-016, sửa 2/11).
- **Đọc gói:** `ContentKit.ContentPack` đọc `catalog/v1/manifest.json`, kiểm `size` và `sha256` của từng `pack.json` trước khi decode (lệch: bỏ cả chủ đề, ghi log); asset kiểm khi được dùng (`assetData(for:)`; lệch: chỉ từ chối asset đó). Nguồn gói là protocol `PackSource` (`DirectoryPackSource` cho gói nhúng; GĐ 1 thêm nguồn tải mạng). Gói có trong app mà không mở được chủ đề nào thì app hiện `ContentErrorScreen` ("Chưa mở được bài học", nút Thử lại). Luật chấm lấy từ `rules` của manifest; `content_version` của lần làm bài là `topics[].version`.
- **Giọng đọc:** `AudioKit.SpeechPlayer` phát từng `Utterance` (danh sách clip), một cái một lúc: chạm cái mới thì dừng cái cũ, chạm lại thì phát lại từ đầu. `AVAudioPlayer`, session theo `AudioSessionPolicy.current` (đang là `.ambient`, mặc định tạm tới SK-020). Clip theo `voice_mode` của hồ sơ: `en` chỉ EN, `vi` chỉ VI, `both` EN rồi VI; thiếu clip thì bỏ qua lặng lẽ, nút nghe ẩn khi giọng đó không có clip nào. Tải trước clip của bước đang hiện và bước kế (`LessonSession.clipsToPreload`).
- **Tự phát** khi một bước mở (`LessonSession.autoplayUtterance`), không phát khi VoiceOver bật: câu hỏi ở Khởi động và Quiz (lời dặn, câu của bạn trong truyện, câu hỏi), lời dặn "Tap each group" ở Học, lời nhắn của linh vật ở Chơi. Thưởng không tự phát.
- **Debug:** `-SKAudioProbe YES` thêm phần tử trợ năng ẩn `debug.audio` mang nhật ký của `SpeechPlayer` (JSON) cho UI test; `-SKAssumeVoiceOver YES` coi như VoiceOver đang bật (simulator không có VoiceOver). Log: `xcrun simctl spawn booted log stream --predicate 'subsystem == "vn.sciencekids.app" && category IN {"audio","content"}'`.
- UI test: `-only-testing:ScienceKidsUITests/AudioUITests` (đi trọn bài với `en`, `both`, `vi`, 5 lần chạm nhanh, VoiceOver); bị skip khi bản build không có gói.

## Đồng bộ Supabase (SK-022)

- **Cấu hình:** `Config/Local.xcconfig` (gitignore, mẫu ở `Local.xcconfig.example`) đặt `SK_SUPABASE_URL` (viết `https:/$()/…`) và `SK_SUPABASE_PUBLISHABLE_KEY`; Info.plist đưa vào app thành `SKSupabaseURL`, `SKSupabasePublishableKey`. Không có hai giá trị đó thì app chạy không server. Không bao giờ để `service_role` hay secret trong app.
- **Thư viện:** `supabase-swift` 2.55.4 (ghim `exact` trong `Packages/SKKit/Package.swift`), chỉ dùng `Auth` và `PostgREST`, chỉ module `Sync` dùng. Phiên bản các gói phụ thuộc ghim ở `apps/ios/Package.resolved`; `bootstrap.sh` chép file này vào project mỗi lần sinh.
- **Module `Sync`:** `SyncEngine` (khách ẩn danh: session trong Keychain, còn sau khi xoá app cài lại; `create_child_profile` với `p_id` = id hồ sơ trên máy; hàng đợi attempt `Application Support/sync/queue.json`, gửi ≤ 50 mỗi lần, backoff 15 s → 15 phút; `get_home`), `SupabaseTransport` (Supabase thật), `SyncTransport` (protocol, test dùng server giả). Trạng thái ở `sync/state.json` (install id, user, liên kết hồ sơ, attempt đã lên server, Home gần nhất).
- **Khi nào gửi:** sau khi mở nội dung lúc khởi động, sau khi tạo hồ sơ, ngay khi xong bài, khi app trở lại foreground, khi có mạng lại (`NWPathMonitor`), và theo backoff khi app đang mở. Hàng đợi dựng lại từ `lessons/history.json` mỗi lần, nên attempt không mất nếu app tắt giữa chừng.
- **Trang chủ:** sao và chuỗi ngày tính trên máy (`computeStreak`, `localDate` của `LessonEngine`); hết hàng đợi và `get_home` cùng "hôm nay" thì hiện số của server.
- **File hỏng:** `child_profile.json`, `lessons/history.json`, `sync/*.json` không đọc được thì đổi tên thành `<tên>.corrupt-<giờ UTC>` (có log) rồi mới ghi mới. Hồ sơ hỏng mà lịch sử bài chỉ có một bé thì hồ sơ mới giữ id bé đó.
- **Debug:** `-SKSyncOff YES` (không gọi server; các UI test không về đồng bộ đều dùng), `-SKSyncProbe YES` (phần tử ẩn `debug.sync`, JSON), `-SKSyncUnreachable YES` (thay địa chỉ server bằng địa chỉ không tồn tại, như máy mất mạng), `-SKResendLastAttempt <n>` (gửi lại attempt cuối n lần). App làm host cho unit test thì tự tắt đồng bộ. Log: `xcrun simctl spawn booted log stream --predicate 'subsystem == "vn.sciencekids.app" && category == "sync"'`.
- Xem trạng thái trên simulator:
  ```sh
  D="$(xcrun simctl get_app_container booted vn.sciencekids.app data)/Library/Application Support/sync"
  cat "$D/state.json" "$D/queue.json"
  ```
- UI test: `-only-testing:ScienceKidsUITests/SyncUITests` ghi dữ liệu thử lên staging (khách ẩn danh của simulator đó). `xcrun simctl keychain <máy> reset` để có khách mới.

## Gallery DesignSystem (SK-008, chỉ bản Debug)

```sh
xcrun simctl launch booted vn.sciencekids.app -SKGallery YES                      # mở gallery
xcrun simctl launch booted vn.sciencekids.app -SKGallery YES -SKGalleryScrollTo motion   # header|shadows|cards|buttons|tags|progress|choices|motion
xcrun simctl launch booted vn.sciencekids.app -SKGallery YES -SKReduceMotion YES  # tắt motion ở mức app
# Reduce Motion của hệ thống trên simulator (giống Settings › Accessibility › Motion), mở lại app sau khi đổi:
xcrun simctl spawn booted defaults write com.apple.Accessibility ReduceMotionEnabled -bool YES
```

Tham số khởi động đọc từ `ProcessInfo.arguments` (không qua `UserDefaults`), bản Release bỏ qua. Log motion: `xcrun simctl spawn booted log stream --level debug --predicate 'subsystem == "vn.sciencekids.designsystem"'` in `start lay …` hoặc `skip lay: reduce motion`.

Thêm `-derivedDataPath <thư mục>` nếu muốn log và `.app` ở chỗ cố định. Nên để DerivedData ngoài `apps/ios`: trong đó có nhiều bản sao bundle id, làm phép kiểm "bundle id ở một chỗ" bị đếm sai.

## Cấu trúc

```
apps/ios/
  project.yml              # nguồn duy nhất của project
  bootstrap.sh
  scripts/                 # embed-content-pack.sh (build phase), extract-canvas-art.py, import-topic-icons.sh
  Config/Base.xcconfig     # bundle id, version, team (để trống)
  Config/Local.xcconfig.example
  ScienceKids/             # app target mỏng
    App/                   # @main, RootView (LayoutMetrics, trần Dynamic Type), AppModel (hồ sơ, route), tham số khởi động
    Onboarding/            # Chào mừng, Hồ sơ của bé (SK-011)
    Home/                  # Trang chủ, MainFlow (NavigationStack)
    Collection/            # tab Thẻ, Huy hiệu, Từ vựng và bộ từ của một bài (SK-035), từ đã nhớ trên máy
    Topic/                 # Chủ đề
    Content/               # nội dung nhúng (gói hoặc fixture), màn lỗi gói, danh sách bài
    Sync/                  # attempt → payload, sao và chuỗi ngày Trang chủ, theo dõi mạng (SK-022)
    Common/                # header, chip, hình (avatar, chủ đề), số đo canvas
    Debug/                 # GalleryView (SK-008), AudioProbe (SK-016), SyncProbe (SK-022), chỉ biên dịch ở Debug
    Info.plist
    Resources/
      Fonts/               # Phudu, Be Vietnam Pro + OFL.txt; xem Fonts/README.md
      Localizable.xcstrings   # chuỗi giao diện EN + VI
      PrivacyInfo.xcprivacy
      Assets.xcassets      # app icon (AppIcon: Any, Dark, Tinted), màn khởi động (LaunchBackground, LaunchMark), hình giấy cắt SVG (Art/)
  ScienceKidsTests/        # unit test của app (font, Info.plist, chuỗi, tham số khởi động, luồng mở app)
  ScienceKidsUITests/      # UI test: gallery (SK-008), luồng mở app (SK-011), bài học (SK-012)
  Packages/SKKit/          # Swift package nội bộ, một target mỗi module
    Sources/{DesignSystem,ContentModel,LessonEngine,ContentKit,LessonPlayer,AudioKit,Profiles,Sync}
    Tests/{…}Tests
```

Phụ thuộc giữa module (technical-plan B7.1): `LessonPlayer` → `DesignSystem`, `ContentModel`, `LessonEngine`, `AudioKit`, `Profiles`; `ContentKit` → `ContentModel`; `Sync` → `Profiles` và supabase-swift (`Auth`, `PostgREST`); `LessonEngine` và `Profiles` không phụ thuộc gì (thuần Foundation). `supabase-swift` là thư viện bên ngoài duy nhất (ios-test-build mục 5).

## Bản thử lên máy thật (tạm, trước SK-020)

Build Release cho iPhone đã nối cáp, ký tự động bằng profile có sẵn trên máy. Không thêm `-allowProvisioningUpdates`, để không đăng ký bundle id hay thiết bị lên tài khoản Apple. Team ID truyền qua dòng lệnh, không ghi vào file trong git.

```sh
xcodebuild build -project ScienceKids.xcodeproj -scheme ScienceKids -configuration Release \
  -destination 'generic/platform=iOS' DEVELOPMENT_TEAM=<team id>
xcrun devicectl list devices                     # lấy Identifier của máy
xcrun devicectl device install app --device <identifier> <DerivedData>/Build/Products/Release-iphoneos/ScienceKids.app
```

## Đổi bundle id, version, team

- **Bundle id** chỉ viết ở một dòng: `SK_BUNDLE_ID` trong `Config/Base.xcconfig`. App dùng `$(SK_BUNDLE_ID)`, unit test dùng `$(SK_BUNDLE_ID).tests`. Sửa dòng đó rồi chạy `./bootstrap.sh`. Bundle id hiện là tạm, chốt ở SK-020.
- **Version:** `MARKETING_VERSION`, `CURRENT_PROJECT_VERSION` trong `Config/Base.xcconfig`.
- **Team và cấu hình riêng từng máy:** chép `Config/Local.xcconfig.example` thành `Config/Local.xcconfig` (đã gitignore) rồi điền `DEVELOPMENT_TEAM`. `Base.xcconfig` tự `#include?` file này; không có file thì bỏ qua. Ký cho máy thật làm ở SK-020.

## Quy ước

- Chuỗi giao diện (nút, thông báo) nằm trong `Localizable.xcstrings`, khoá dạng `man.vai_tro` (ví dụ `placeholder.title`), đủ EN và VI. Chữ của bài học đến từ gói nội dung, không để ở đây.
- iPhone khoá dọc; iPad xoay đủ 4 hướng, không đặt `UIRequiresFullScreen` để Split View và Slide Over chạy được (B7.10).
- Dùng API cần khai lý do (UserDefaults, thời gian khởi động, dung lượng ổ…) thì thêm vào `PrivacyInfo.xcprivacy` trong cùng ticket.
- Màu, chữ, bóng, motion và bố cục lấy từ `DesignSystem` (`Tokens`, thành phần giấy, `.typography`, `.paperShadow`, `.motion`, `LayoutMetrics`); không viết hex hay số đo trong view. Colorset `LaunchBackground` là ngoại lệ duy nhất vì `UILaunchScreen` chỉ nhận tên asset (SK-008).

## Nội dung và luật chấm

- `ContentModel` (SK-009): model Codable viết tay theo `packages/content-schema/schema/`. Đọc file bằng `ContentDecoder` (không dùng `JSONDecoder` trần): lỗi có JSON pointer của trường (`/title`), block `type` hay quiz `format` lạ bị bỏ khỏi `Lesson` và ghi log `os.Logger` category `content`. Kiểu `Text`, `Image` của schema tên là `BilingualText`, `ContentImage` để không trùng SwiftUI.
- `LessonEngine` (SK-010): Swift thuần, không I/O, không phụ thuộc module khác. `scoreItem`, `scoreLesson`, `computeStars` đọc tham số từ `Rules`; `computeXP` đọc `XPRules`. Lỗi trả `Result.failure` với mã của vector.
- Test của hai module đọc thẳng `packages/content-schema/fixtures/` và `packages/content-schema/test-vectors/` qua đường dẫn tính từ `#filePath`; không chép fixture hay vector vào `apps/ios`. Sửa vector thì chạy lại test, không cần build lại gì khác.
