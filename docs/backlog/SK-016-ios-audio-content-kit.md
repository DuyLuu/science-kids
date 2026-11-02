# SK-016 · AudioKit và ContentKit iOS: đọc gói nhúng, phát giọng EN

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: ios-dev · Tester: tester
Nguồn: docs/ios-test-build.md mốc 1 việc I10 và tiêu chí "ContentKit đọc gói và kiểm sha256" của C2; technical-plan.md B4.1 (`voice_mode` en · vi · both, chỉ tải trước clip của thứ tiếng đang bật), B4.3 (gói, asset, `sha256`), B7.1 (`ContentKit`, `Audio`), B7.3 (`AVAudioPlayer`, session `.ambient`); SK-015 (định dạng gói); canvas nút nghe ở Discoverer 8–13

## Mục tiêu
App đọc gói bài 1 nhúng sẵn (kiểm sha256), và bé nghe được giọng tiếng Anh ở từng câu và từng từ trong cả bài.

## Phạm vi
- **ContentKit:**
  - đọc `catalog/v1/manifest.json`, `pack.json` và `assets/` từ gói nhúng trong bundle;
  - kiểm `sha256` và `size` của `pack.json` và từng asset trước khi dùng. Lệch thì không mở gói đó, ghi log, và app hiện màn lỗi thân thiện (chuỗi giao diện), không crash;
  - trả `Topic` và `Lesson` (SK-009), cùng URL file của một `AssetHash`;
  - nguồn gói là một protocol (`PackSource`), để GĐ 1 thay bằng nguồn tải mạng mà không đổi chỗ gọi.
- **Nhúng gói:**
  - `project.yml` thêm thư mục gói của SK-015 (`content/.build/pack`) làm folder reference vào bundle;
  - gói chưa build thì app vẫn build và chạy được bằng fixture như SK-012, chỉ không có tiếng, và in cảnh báo lúc build;
  - `bootstrap.sh` nhắc lệnh build gói nếu thiếu.
- **Chuyển nguồn:** SK-011 và SK-012 đọc qua ContentKit thay cho fixture.
- **AudioKit:**
  - `AVAudioPlayer`, session `.ambient`, không cắt nhạc của máy;
  - nút nghe ở mỗi câu và mỗi từ (vị trí như canvas), chạm lại thì phát lại từ đầu;
  - chạm câu khác thì dừng câu đang phát;
  - tự phát lời hướng dẫn và câu hỏi khi vào màn (`prompt`, câu hỏi quiz), theo cách canvas gợi ý; ghi rõ chỗ nào tự phát;
  - theo `voice_mode` của hồ sơ: `en` chỉ EN; `both` EN rồi VI; `vi` chỉ VI. Thiếu clip của thứ tiếng nào thì bỏ qua lặng lẽ, vẫn hiện chữ;
  - tải trước clip của bước kế tiếp, chỉ thứ tiếng đang bật;
  - VoiceOver đang bật thì không tự phát, tránh đọc chồng.

## Ngoài phạm vi
- Clip VI (chưa có giọng). Tải gói qua mạng, cache nhiều phiên bản.
- Đổi `voice_mode` trong app: Góc phụ huynh chưa có. Bản thử đổi bằng cách tạo lại hồ sơ.

## Tiêu chí nghiệm thu
- [ ] Unit test ContentKit với một bản sao gói trong thư mục tạm của test:
  - gói đúng → đọc được topic và bài 1;
  - sửa 1 byte của một clip → asset đó bị từ chối;
  - sửa `pack.json` → cả gói bị từ chối, có lỗi rõ ràng.
- [ ] Trên simulator iPhone 16, hồ sơ `voice_mode` = `en`: đi trọn bài 1, chạm nút nghe ở mọi câu và từ của 6 màn. Câu nào cũng có tiếng; ghi lại câu nào không có tiếng (mong đợi: không có).
- [ ] Hồ sơ `voice_mode` = `both`: phát EN xong thì dừng, không lỗi, vì VI chưa có. Hồ sơ `vi`: không phát gì, chữ vẫn đủ.
- [ ] Chạm nhanh 5 nút nghe liên tiếp: chỉ câu cuối được phát, không chồng tiếng, không crash.
- [ ] Bật VoiceOver: vào màn không tự phát; chạm nút nghe vẫn phát.
- [ ] Bản build khi chưa có gói: app vẫn chạy bài 1 bằng fixture, không có tiếng; log build có cảnh báo.
- [ ] UI test luồng vàng của SK-012 vẫn xanh trên iPhone 16 và iPad Pro 11-inch (M4).
- [ ] `PrivacyInfo.xcprivacy` cập nhật nếu có thêm API cần khai.
- [ ] Không sửa file ngoài `apps/ios/` (trừ ghi chú trong ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- SK-012 (LessonPlayer) và SK-015 (gói có clip).
- SK-019 chờ ticket này.

**Quyết định đã ghi** (PM đề xuất 28/10)
1. ContentKit nằm trong ticket này. Plan không có dòng riêng cho ContentKit; tiêu chí "ContentKit đọc gói và kiểm sha256" của C2 là việc của app, nên giao ios-dev ở đây.
2. Gói không vào git; app vẫn build được khi thiếu gói (xem Câu hỏi còn mở).

**Câu hỏi còn mở**
- **Session `.ambient` bị nút gạt im lặng tắt tiếng.** Trên iPhone thật, máy để im lặng thì bé không nghe gì. Đây là app học bằng tai, nên có thể cần `.playback` kèm `.mixWithOthers` (vẫn không cắt nhạc của máy). Simulator không có nút gạt; kiểm ở SK-020 rồi Duy chốt.
- Có commit gói đã build vào repo (khoảng vài MB clip) để mọi máy và CI build ra app có tiếng không? Hiện để ngoài git theo SK-014.

## Kết quả (ios-dev)

29/10/2026 · Xcode 16.3, Swift 6.1 (strict concurrency `complete`), simulator iOS 18.4. Chưa commit. Ảnh, log ở scratchpad của phiên, viết tắt `SP/` = `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-016/` (ngoài repo).

### Đã làm
- **ContentKit:**
  - `PackSource` (protocol, `async`, trả file cục bộ của một đường dẫn trong gói) và `DirectoryPackSource` (gói nhúng; từ chối đường dẫn tuyệt đối, `..`, phần rỗng). GĐ 1 thêm nguồn tải mạng cùng protocol.
  - `PackManifest` (manifest SK-015, bỏ qua khoá lạ), `AppVersion` (so `min_app_version`).
  - `ContentPack.load(from:appVersion:)`: đọc manifest; kiểm `size` rồi `sha256` của từng `pack.json` trước khi decode; decode `topic` và từng bài bằng `ContentDecoder` của SK-009. Lệch thì bỏ cả chủ đề (`rejected`, log). `schema_version` khác 1 hay manifest hỏng thì ném lỗi. Bỏ chủ đề, bài `archived`/`sensitive` như `LocalContentLibrary`.
  - `assetData(for:)`, `assetURL(for:)`: đọc asset rồi kiểm `size` + `sha256` mỗi lần dùng; lệch thì chỉ từ chối asset đó, có log. `rulesData` (= `rules` của manifest), `topicVersion(for:)`.
  - `ContentPackError` có mô tả đọc được: đường dẫn, sha256 thực và mong đợi, cỡ.
- **AudioKit:**
  - `SpeechPlayer` (`@MainActor @Observable`): phát từng `Utterance` (danh sách clip), một cái một lúc; yêu cầu mới thì dừng cái cũ; chạm lại thì phát lại từ đầu; clip không tải được hay không giải mã được thì bỏ qua lặng lẽ; `autoplay` không chạy khi VoiceOver bật; `preload` đọc trước và kiểm clip, bỏ các clip không còn cần; `stats` (nhật ký cho test).
  - `AVClipBackend` (`AVAudioPlayer`, `fileTypeHint` m4a).
  - `AudioSessionPolicy`: `.ambient` (mặc định tạm) và `.playbackMixing`; đổi ở **một dòng** `AudioSessionPolicy.current`.
- **LessonPlayer** (`LessonSpeech.swift`): `Spoken.voiceClips(for:)` (en · vi · both, EN rồi VI), câu đọc của một câu hỏi, chỗ tự phát của từng bước (`autoplayUtterance`), chữ từng bước hiện (`spokenShown`) để tải trước (`clipsToPreload`: bước này và bước kế, chỉ thứ tiếng đang bật), `ListenButton` (đĩa giấy 56pt, icon loa như canvas, trait `startsMediaSession`, ẩn khi giọng của hồ sơ không có clip). `LessonSession` nhận `contentVersion` và ghi vào lần làm bài (`content_version` = `topics[].version`).
- **Các màn:**
  - Khởi động, Quiz: nút nghe cuối hàng câu hỏi; nút nghe ở gợi ý (mẩu giấy gấp góc và khung "Gợi ý") và ở lời giải thích.
  - Học: nút nghe ở mục tiêu bài, lời dặn "Tap each group", tờ nhóm (câu + các món ví dụ, cuối hàng món như canvas). Chạm nhóm thì nghe tên nhóm. "Từ mới" thành nút: chạm thì nghe từ.
  - Chơi: nút nghe cạnh lời nhắn của linh vật; chạm món trên kệ hay trong mâm thì nghe tên món.
  - Thưởng: nút nghe cạnh "Thẻ mới…": mặt trước đọc tên + nhãn, mặt sau đọc "Em có biết?".
  - Chủ đề: nối nút loa của câu hỏi lớn (TODO của SK-011).
- **App:**
  - `BundledContent.load()` (async): có `pack/` trong bundle thì mở gói; không có thì fixture (không tiếng, log cảnh báo).
  - `AppModel.content` (`loading` · `ready` · `failed`) và `AppModel.speech`. Gói có mà không mở được chủ đề nào thì `ContentErrorScreen` ("Chưa mở được bài học", nút Thử lại).
  - Luật chấm đọc từ `rules` của manifest; giọng dừng khi app ra nền.
  - 13 chuỗi mới EN + VI (170 khoá).
  - Debug: `-SKAudioProbe YES` (phần tử trợ năng ẩn `debug.audio` mang nhật ký của `SpeechPlayer`), `-SKAssumeVoiceOver YES` (simulator không có VoiceOver).
- **Nhúng gói:**
  - build phase "Embed content pack" (`scripts/embed-content-pack.sh`) chép `$(SK_CONTENT_PACK_DIR)` (mặc định `content/.build/pack`) thành `pack/` trong bundle;
  - thiếu gói thì in `warning:` và vẫn build;
  - `bootstrap.sh` in lệnh build gói khi thiếu. README có mục "Gói nội dung và giọng đọc (SK-016)".
- **Test:**
  - `ContentPackTests` (13);
  - `SpeechPlayerTests` + policy (12, backend giả);
  - `LessonSpeechTests` (7);
  - app: `BundledContentTests` (gói nhúng mở được, khớp fixture), `AppModelTests.contentLoadsAfterLaunch`, `LaunchOptionsTests.audioProbeAndVoiceOver`;
  - UI `AudioUITests` (5).

**File chính** (trong `apps/ios/`):
- Mới:
  - `Packages/SKKit/Sources/ContentKit/{PackSource,PackManifest,ContentPack}.swift`
  - `Packages/SKKit/Sources/AudioKit/{SpeechPlayer,ClipBackend,AudioSessionPolicy}.swift`
  - `Packages/SKKit/Sources/LessonPlayer/LessonSpeech.swift`
  - `ScienceKids/Content/ContentErrorScreen.swift`, `ScienceKids/Debug/AudioProbe.swift`
  - `scripts/embed-content-pack.sh`
  - `Packages/SKKit/Tests/ContentKitTests/ContentPackTests.swift`, `Packages/SKKit/Tests/LessonPlayerTests/LessonSpeechTests.swift`
  - `ScienceKidsUITests/AudioUITests.swift`
- Sửa:
  - `project.yml`, `bootstrap.sh`, `README.md`, `Packages/SKKit/Package.swift`
  - `ScienceKids/Content/BundledContent.swift`, `ScienceKids/App/{AppModel,ScienceKidsApp,LaunchOptions}.swift`, `ScienceKids/Home/MainFlow.swift`, `ScienceKids/Topic/TopicScreen.swift`, `ScienceKids/Common/ScreenMetrics.swift`, `Resources/Localizable.xcstrings`
  - `LessonPlayer/{Language,LessonSession,AttemptStore,LessonPlayerView}.swift`, `LessonPlayer/Views/{QuestionStep,QuestionViews,LessonParts,LearnStep,PlayStep,RewardStep}.swift`
  - `ContentKit/ContentKit.swift`, `AudioKit/AudioKit.swift`
  - test: `AudioKitTests.swift`, `ScienceKidsTests/{OnboardingTests,LaunchOptionsTests}.swift`

### Mặc định tạm (phiên chính giao) và quyết định của ios-dev
1. **Session `.ambient`** (mặc định tạm). Duy chốt ở SK-020; đổi `AudioSessionPolicy.current = .playbackMixing` là xong.
2. **Gói không vào git.** Gói nhúng bằng script build phase, không bằng folder reference, vì folder thiếu sẽ làm hỏng build. `alwaysOutOfDate`, chép 2,4 MB mỗi lần build, `rm -rf` trước để không sót gói cũ. Sandbox của script cho đọc thư mục khai trong `inputFiles`.
3. **Gói thắng fixture.** Gói có trong app mà hỏng thì không lùi về fixture (âm thầm mất tiếng sẽ khó thấy): app hiện màn lỗi. Chủ đề hỏng thì bỏ, chủ đề khác vẫn mở; hết chủ đề thì mới hiện màn lỗi.
4. **Asset kiểm khi dùng, mỗi lần đọc**, không kiểm cả 107 clip lúc mở app. Một clip khoảng 25 KB nên băm rất nhanh. Clip đọc trước cũng đã qua kiểm.
5. **`PackSource` là async**, nên nội dung mở sau khi app chạy (vài ms, màn điệp trơn). Chào mừng và Hồ sơ không chờ nội dung.
6. **Giọng `vi` chưa có clip VI:** không có nút nghe nào. Từ mới không thành nút, theo quyết định 17 của SK-011: không có nút bấm mà không phát gì.
7. **Chạm từ thì nghe từ** (thêm ngoài canvas, để "mỗi từ" có tiếng): lựa chọn quiz, từ trong ngân hàng, nhãn Đúng/Sai của nội dung (Na đúng · Na chưa đúng), nút nhóm ở Học, Từ mới, món ở Chơi. Chạm vẫn làm việc cũ (chọn, trả lời, thêm/bỏ món).
8. **Câu đọc của một câu hỏi:** tag lời dặn → (`fill_blank_bank`) prompt rồi câu có ô trống / (true/false có `statement`) câu của bạn trong truyện rồi prompt / prompt. Ví dụ q6: "Challenge: spot the mistake. All fat is bad for you. Is Na right?".
9. **Nút nghe thêm ngoài canvas:** gợi ý, lời giải thích, mục tiêu bài, lời dặn Học, lời nhắn ở Chơi, thẻ ở Thưởng. Canvas chỉ có ở câu hỏi (8, 11, 12) và câu của nhóm (9).
10. Tờ nhóm ở Học đọc câu rồi các món ví dụ ("Carbohydrates give us energy. rice, bread, sweet potato"), vì chip món là mẩu giấy 30pt, không làm được nút 56pt.
11. Nút nghe có trait `startsMediaSession`: VoiceOver đọc tên nút rồi im để clip phát.

### Chỗ tự phát
`LessonSession.autoplayUtterance(for:)`, gọi một chỗ trong `LessonPlayerView` khi bước đổi. Không phát khi VoiceOver bật; dừng khi rời bài hay app ra nền.
- **Khởi động:** mỗi câu hỏi khi mở (câu đọc ở quyết định 8).
- **Học:** lời dặn "Tap each group".
- **Chơi:** lời nhắn của linh vật lúc vào màn ("Pick foods for a healthy tray."). Đổi lời nhắn sau mỗi lần chạm thì không tự phát: chạm món đọc tên món.
- **Quiz:** mỗi câu hỏi khi mở.
- **Không tự phát:** Thưởng, Chủ đề, gợi ý, lời giải thích.

### Tiêu chí nghiệm thu

| # | Tiêu chí | Kết quả | Bằng chứng |
| --- | --- | --- | --- |
| 1 | Unit test ContentKit trên bản sao gói trong thư mục tạm: đúng → đọc được; 1 byte clip → asset bị từ chối; sửa `pack.json` → cả gói bị từ chối, lỗi rõ | pass | `ContentPackTests`: mỗi ca chạy trên **bản sao `content/.build/pack`** (`builtPack…`, skip khi máy chưa build gói) và trên **gói test tự tạo từ fixture** (`madePack…`, chạy mọi máy). Clip đổi 1 byte (cùng cỡ): `assetData` ném `.mismatch` đúng path, sha256 khác, clip khác vẫn đọc được, chủ đề vẫn mở. `pack.json` đổi 1 byte: thư viện rỗng, `rejected` 1 mục, mô tả chứa slug, `pack.json`, sha256; thêm 1 byte thì báo cỡ. Thêm: manifest hỏng, thiếu manifest, `schema_version` 2, `min_app_version` cao, đường dẫn ra ngoài gói, asset lạ. Thử tay trên iPhone 16e (sửa file trong app đã cài): `pack.json` lệch → màn "Chưa mở được bài học" (`SP/shots/iphone-16e-content-error.png`), log `pack topic rejected: …pack.json: sha256 c6b9a275b57b…, the manifest says 70e2fab1315b… (same size, 50975 bytes)`; clip "Pick the missing word" lệch → log `asset refused … same size, 19072 bytes`, `clip skipped en c243600e4db6`, rồi câu "Animals…" vẫn phát |
| 2 | iPhone 16, `voice_mode` = `en`, đi trọn bài 1, chạm nút nghe ở mọi câu và từ của 6 màn | pass | `AudioUITests.testEveryListenButtonAndWordSpeaksEnglish` (iPhone 16 589 s, iPad Pro 11 549 s). Log: `36 listen taps (33 buttons), 50 word taps (38 words), 10 autoplays, 112 clips started, 71 different strings, failed 0`. 33 nút: câu hỏi ×8, gợi ý ×8, giải thích ×8, mục tiêu, lời dặn Học, 4 tờ nhóm, lời nhắn Chơi, thẻ, mặt sau thẻ. Không clip nào lỗi; mọi clip là `en:`. Câu không có tiếng: xem mục dưới (không có câu nào thiếu clip; có vài dòng tiêu đề không có nút nghe) |
| 3a | `both`: EN xong thì dừng, không lỗi | pass | `testBothPlaysEnglishThenStops`: w1 tự phát "Pick the missing word" → "Animals, including humans…", `finished`, `speaking` nil, `failed` rỗng; chạm nút nghe lại thì như vậy lần 2. Unit `voiceModes`: `both` với chỉ EN ra [EN], có VI thì [EN, VI] |
| 3b | `vi`: không phát gì, chữ vẫn đủ | pass | `testViPlaysNothingAndKeepsTheText`: 0 nút `listen.` ở Khởi động và Học, `requested` = 0, câu hỏi, câu của nhóm, Từ mới vẫn hiện; Từ mới không phải nút. Unit `viVoicePlaysNothingYet` (mọi bước) |
| 4 | Chạm nhanh 5 nút: chỉ câu cuối được phát, không chồng, không crash | pass | UI `testFiveFastTapsPlayOnlyTheLast` (5 món ở Chơi, chạm liền): `sounded` 5 cái, `interrupted` 4 cái trước, `finished ["word.tray_greens"]` (cái cuối), `maxPlaying` 1. Unit `fiveFastTapsPlayOnlyTheLast` (chạm nhanh hơn lúc tải clip): chỉ cái cuối ra tiếng |
| 5 | VoiceOver: vào màn không tự phát; chạm nút nghe vẫn phát | pass trên simulator (VoiceOver giả) | `testVoiceOverStopsAutoplayOnly` với `-SKAssumeVoiceOver YES`: `autoplaySkipped ["question.w1","question.w2"]`, `autoplayed` rỗng, nút nghe w1, w2 ra tiếng. App đọc `UIAccessibility.isVoiceOverRunning`. Simulator không có VoiceOver: **kiểm lại trên máy thật ở SK-020** |
| 6 | Build khi chưa có gói: chạy bài 1 bằng fixture, không tiếng; log build có cảnh báo | pass | `xcodebuild test … SK_CONTENT_PACK_DIR=/nonexistent/content-pack` trên iPhone 16e (`SP/nopack-iphone16e.log`): `warning: Content pack not found at /nonexistent/content-pack. The app runs on the schema fixtures, without audio (SK-016)…`; bundle không có `pack/`; log app `no content pack in the app: playing the schema fixtures, without audio`; `testGoldenPathAllRight` pass (`6/6`, 2 sao, +90 XP); audio walk skip vì không có nút nghe; app unit 44 pass, 2 test gói skip |
| 7 | UI test luồng vàng SK-012 xanh trên iPhone 16 và iPad Pro 11 | pass | iPhone 16: `LessonUITests` + `OnboardingUITests` + `GalleryUITests` 26 test, 5 skip, 0 lỗi; iPad Pro 11: `LessonUITests` 9 test, 1 skip, 0 lỗi (gồm vùng chạm 56pt và audit trợ năng với các nút mới) |
| 8 | `PrivacyInfo.xcprivacy` cập nhật nếu cần | không cần | API mới: CryptoKit (SHA256), AVFAudio/AVFoundation, `UIAccessibility.isVoiceOverRunning`, `Data(contentsOf:)`, `FileManager.fileExists`. Không cái nào thuộc nhóm required-reason. Cỡ file đo bằng `data.count`, không dùng `attributesOfItem` (nhóm timestamp) |
| 9 | Chỉ sửa trong `apps/ios/` (và ticket), không commit | pass | Không sửa `tools/`, `content/`, `packages/`, `docs/backlog/README.md`. Không commit |

**Lệnh và kết quả** (từ `apps/ios`):
```
xcodebuild test -project ScienceKids.xcodeproj -scheme ScienceKids -destination 'platform=iOS Simulator,name=iPhone 16' -derivedDataPath "$DD" -skip-testing:ScienceKidsUITests
xcodebuild test … -destination 'platform=iOS Simulator,name=iPad Pro 11-inch (M4)' … -skip-testing:ScienceKidsUITests
TEST_RUNNER_SK_SCREENSHOT_DIR=<thư mục> xcodebuild test … -only-testing:ScienceKidsUITests/AudioUITests
```
Unit, lần chạy cuối, giống nhau ở iPhone 16 và iPad Pro 11 (`SP/unit-final-iphone16.log`, `SP/unit-final-ipadpro11.log`), 193 test mỗi máy, không có warning Swift:
```
note: Content pack embedded from …/content/.build/pack (109 files).
✔ Test run with 44 tests passed   ScienceKidsTests (40 trước đây)
✔ Test run with 35 tests passed   DesignSystemTests
✔ Test run with 20 tests passed   ContentModelTests
✔ Test run with 14 tests passed   LessonEngineTests
✔ Test run with 18 tests passed   ContentKitTests (5 trước đây)
✔ Test run with 29 tests passed   LessonPlayerTests (22 trước đây)
✔ Test run with 13 tests passed   AudioKitTests (1 trước đây)
✔ Test run with 20 tests passed   ProfilesTests
** TEST SUCCEEDED **
```
UI:
```
iPhone 16  AudioUITests                          Executed 5 tests, with 0 failures in 743.8 s   (SP/ui-audio1-iphone16.log)
iPhone 16  Lesson + Onboarding + Gallery         Executed 26 tests, with 5 tests skipped and 0 failures in 875.6 s   (SP/ui-rest1-iphone16.log)
iPad Pro 11  Lesson + Audio                      Executed 14 tests, with 1 test skipped and 0 failures in 1300.9 s   (SP/ui1-ipadpro11.log)
iPhone 16e (không gói)  golden path + audio walk + app unit   golden path pass, audio walk skip, 44 unit pass   (SP/nopack-iphone16e.log)
```
Skip đều có lý do: Reduce Motion hệ thống tắt; không đặt thư mục ảnh (gallery, onboarding, lesson trên iPhone); không có gói (bản không gói).

**Ảnh** (`SP/shots/`):
- iPhone 16: `iphone-16-audio-{08-warmup-hint,08-warmup-result,09-learn,09-learn-words,10-play-full,11-quiz-result,12-quiz-myth,13-reward-fact}.png`;
- iPad Pro 11: cùng bộ `ipad-pro-11-inch-m4-audio-*`, và 19 ảnh `ipad-pro-11-inch-m4-{08..13}-*.png` của `LessonUITests.testScreenshots`;
- iPhone 16e: `iphone-16e-05-topic-listen.png` (nút loa câu hỏi lớn), `iphone-16e-content-error.png`.

iPad vẫn là cột phone canh giữa (SK-013).

### Câu và từ không có tiếng
- **Thiếu clip:** không có. Mọi chuỗi hiện ở 6 màn đều có `audio.en` trong gói (unit `everyShownStringHasAnEnglishClip`, `packIsBundledAndOpens`); đi trọn bài không clip nào lỗi.
- **Hiện trên màn nhưng không có nút nghe:**
  - tên bài ở header Khởi động, Học và dòng phụ Thưởng ("What does food give us?");
  - tên chủ đề ở dòng phụ header ("Ăn uống lành mạnh · Bài 1/5");
  - tên game ở header Chơi ("Build a balanced meal");
  - nhãn nhóm trên chip đo và thanh yêu cầu ở Chơi ("Protein", "Vegetables and fruit", "Carbohydrates", "Sweets: just a little");
  - tag "Từ mới · New words";
  - Đúng/Sai mặc định ở w2 (chuỗi giao diện, không phải nội dung nên không có clip).
- **Có tiếng nhưng chỉ hiện trên đường sai:** `explanation_wrong` (khi sai lần cuối) và các lời nhắn `missing.*` của mâm. Cả hai dùng cùng nút nghe, nhưng lần đi đúng không gặp.
- **Không hiện ở 6 màn:**
  - `key_points` (3);
  - câu ví dụ của từ vựng (8);
  - 4 từ ngoài `word_list` (vitamin, fibre, energy, healthy; "energy" vẫn nghe được ở q2);
  - các chuỗi này chờ tab Từ vựng.

### Đề xuất cho người khác
- **dev (gói, SK-015):**
  - `topics[].lesson_count` trong manifest (app vẫn giữ bảng `plannedLessonCounts`);
  - `topics[].sensitive` trong manifest (dev đã đề xuất);
  - cắt khoảng lặng 0,33 s đầu clip (SK-014 đề xuất 2) nếu nghe trên máy thật thấy chạm từ bị trễ; tôi chưa đo độ trễ.
  - Định dạng gói đủ cho app; không thấy thiếu gì khác.
- **ios-dev, việc sau:** `VoiceMode.suggested` vẫn đọc bảng trong `Profiles` (khớp `rules.json` nhờ test). Đọc `default_voice_mode` từ manifest được, nhưng onboarding chạy trước khi nội dung mở xong; để lại TODO.
- **tester:**
  - chạy `AudioUITests` (khoảng 12 phút mỗi máy, riêng bài đi trọn khoảng 10 phút) và unit như trên;
  - nghe thật trên simulator (Mac có loa): tự phát, chạm lại phát từ đầu, chạm nhanh;
  - thử gói hỏng bằng tay: sửa 1 byte `pack.json` hay một clip trong app đã cài (`xcrun simctl get_app_container <máy> vn.sciencekids.app app`/pack/…), xem màn lỗi và log `log stream --predicate 'subsystem == "vn.sciencekids.app"'`;
  - VoiceOver và nút gạt im lặng trên máy thật (SK-020).

### Câu hỏi cho Duy
1. *(đã mở)* `.ambient` hay `.playback` + `.mixWithOthers`: chốt ở SK-020.
2. *(đã mở)* Có commit gói vào repo không? Hiện ngoài git, build vẫn chạy (fixture, không tiếng).
3. Các tiêu đề ở mục "Hiện trên màn nhưng không có nút nghe" có cần tiếng không? Ba cách:
   - giữ như vậy;
   - chạm tiêu đề thì nghe;
   - đọc tên bài ở đầu câu tự phát đầu tiên.
4. Tự phát chỉ khi mở bước. Có muốn thêm tự phát gợi ý và lời giải thích sau khi bấm Kiểm tra, và lời nhắn mỗi lần mâm đổi không? B4.1 có ý "bé nhỏ nhận gợi ý bằng tai". *(1/11, Duy chốt SK-026: Explorer tự phát gợi ý khi sai và giải thích khi xong câu; Scientist không tự phát, có nút nghe. Phần Discoverer, kể cả lời nhắn mâm cơm, vẫn mở ở đây.)*
5. Khởi động: chạm từ là trả lời (canvas), nên bé không nghe được các từ khác trước khi chọn. Giữ như vậy, hay thêm cách nghe không trả lời (ví dụ nút nghe ở hàng từ)? *(1/11, Duy chốt SK-026: Explorer chạm thẻ là trả lời, app đọc tên hình sau khi chọn. Phần Discoverer vẫn mở ở đây.)*
6. B4.1 nói "nút nghe thứ tiếng kia vẫn có để chạm khi cần". Hồ sơ `vi` hiện không có nút nghe nào vì chưa có clip VI. Có muốn `vi` có nút nghe EN cho tới khi có giọng VI không? *(PM 31/10: chuyển sang SK-025, câu hỏi 1, vì giọng VI được ưu tiên làm ngay.)*

## Nghiệm thu (tester, 29/10)

Bản sao `snapshot-r3` (chụp 17:39 ngày 29/10, trước SK-013), Xcode 16.3, iOS 18.4. `SP/` = `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/`; log, ảnh trong `SP/tester-r3/`. Duy giảm phạm vi 29/10: mỗi bộ chạy 1 lần, trên iPhone 16 Pro. Mọi mục cần iPad ghi "chưa kiểm".

Kết luận: **đạt**, không có lỗi chặn hay lỗi. 4 góp ý nhẹ ở dưới. Phần cần nghe thật: Duy nghe tay.

### Đã chạy (mỗi bộ 1 lần)
```
xcodebuild build-for-testing … -derivedDataPath SP/dd-tester-r3          (iPhone 16 Pro)
xcodebuild test-without-building … -skip-testing:ScienceKidsUITests      → SP/tester-r3/unit-iphone.log
xcodebuild test-without-building … -only-testing:ScienceKidsUITests/AudioUITests                          → audio-iphone.log
xcodebuild test-without-building … -only-testing:ScienceKidsUITests/LessonUITests/testGoldenPathAllRight → golden-iphone.log
xcodebuild test … SK_CONTENT_PACK_DIR=/nonexistent/content-pack -derivedDataPath SP/dd-tester-r3-nopack … testGoldenPathAllRight → nopack-golden.log
xcodebuild test-without-building … -only-testing:ScienceKidsUITests/BadPackUITests/{testBadPackJson,testBadClip}  → badpack-*.log
```
Lưu ý: unit chạy cả trên iPad Pro 13 trước khi luật đổi (`unit-ipad.log`, cùng kết quả); các bộ khác chỉ iPhone 16 Pro. Máy là iPhone 16 Pro / iPad Pro 13, không phải iPhone 16 / iPad Pro 11 như tiêu chí ghi.

### Tiêu chí

| # | Tiêu chí | Kết quả | Bằng chứng |
| --- | --- | --- | --- |
| 1 | Unit ContentKit: gói đúng, 1 byte clip, `pack.json` sửa | pass | Unit 226 test, 0 lỗi: ScienceKidsTests 51, DesignSystem 35, ContentModel 20, LessonEngine 19, **ContentKit 18**, LessonPlayer 31, **AudioKit 13**, Profiles 21, Sync 18. Thử tay ở dưới là bằng chứng riêng |
| 2 | `en`, đi trọn bài 1, nút nghe và từ của 6 màn | pass | `AudioUITests.testEveryListenButtonAndWordSpeaksEnglish` 557,9 s: `36 listen taps (33 buttons), 50 word taps (38 words), 10 autoplays, 112 clips started, 71 different strings, failed 0`. Tiếng thật: **Duy nghe tay** |
| 3a | `both`: EN xong thì dừng | pass | `testBothPlaysEnglishThenStops` 29,9 s |
| 3b | `vi`: im lặng, chữ đủ | pass | `testViPlaysNothingAndKeepsTheText` 35,5 s |
| 4 | Chạm nhanh 5 nút | pass | `testFiveFastTapsPlayOnlyTheLast` 52,7 s (`maxPlaying` 1). Nghe có chồng không: Duy nghe tay |
| 5 | VoiceOver | pass với VoiceOver giả | `testVoiceOverStopsAutoplayOnly` 33,3 s (`-SKAssumeVoiceOver`). VoiceOver thật: SK-020 |
| 6 | Build không gói | pass | `SK_CONTENT_PACK_DIR=/nonexistent/content-pack`: build in `warning: Content pack not found at /nonexistent/content-pack. The app runs on the schema fixtures, without audio (SK-016)…`; `.app` không có thư mục `pack`; luồng vàng pass (`6/6, câu đúng`, `Được 2 trên 3 sao`, `+90 XP`) |
| 7 | Luồng vàng xanh | pass trên iPhone 16 Pro; iPad: chưa kiểm (Duy giảm phạm vi 29/10, 1 lần 1 máy) | `golden-iphone.log`: `score '6/6, câu đúng', stars 'Được 2 trên 3 sao', xp '+90, XP'`, 65,9 s |
| 8 | `PrivacyInfo.xcprivacy` | đồng ý với ios-dev | Quét code: không thêm API required-reason (CryptoKit, AVAudioPlayer, `Data(contentsOf:)`) |
| 9 | Chỉ sửa `apps/ios/`, không commit | không kiểm được trọn vẹn | `apps/` chưa theo dõi bởi git (`?? apps/`), nên `git diff` không so được. Tôi không thấy file ngoài `apps/ios/` liên quan |

### Gói hỏng, thử bằng tay (app cài từ bản build, sửa trong `.app` rồi chạy lại)
Đổi 1 bit giữa file (cùng cỡ). `.app` gốc để ở `SP/tester-r3/ScienceKids.pristine.app` và đã khôi phục.

| Hỏng | Kết quả | Log (`SP/tester-r3/applog-badpack.log`) |
| --- | --- | --- |
| `pack.json` (byte 25487/50975) | pass: tạo hồ sơ xong ra màn "Chưa mở được bài học" (`content.error.title`), có nút Thử lại; không crash; Thử lại với gói vẫn hỏng thì màn lỗi ở lại. Ảnh `SP/tester-r3/shots/badpack-json.png` | `pack topic rejected: topics/d3a514ef-…/15880ff9df19/pack.json: sha256 a0300d8256a5…, the manifest says 70e2fab1315b… (same size, 50975 bytes)`; `content pack has no topic to open` |
| 1 clip `c243600e4db6…` ("Pick the missing word", byte 9536/19072) | pass: clip bị từ chối, câu đó vẫn phát phần còn lại (câu có ô trống), `failed ["en:Pick the missing word"]`; câu hỏi w2 và từ "air" vẫn phát, `maxPlaying` 1. Ảnh `shots/badpack-clip-w2.png` | `asset refused: assets/c243600e….m4a: sha256 46ca9bd0d2c8…, the manifest says c243600e4db6… (same size, 19072 bytes)`; `clip skipped en c243600e4db6: unavailable`; `play question.w1 en a70b832f26e5`; `play question.w2 en ad7112f2d633` |

### Review code (`ContentKit`, `AudioKit`, `LessonSpeech.swift`)
- **Đường dẫn ra ngoài gói:** `DirectoryPackSource.checked` từ chối đường dẫn rỗng, tuyệt đối, phần `.`, `..`, rỗng. Đúng. Unit có ca "đường dẫn ra ngoài gói".
- **So sha256:** đúng chỗ: `size` rồi sha256 của `pack.json` trước khi decode; asset kiểm **mỗi lần đọc** và **phát từ chính `Data` đã kiểm** (`SpeechPlayer` → `AVAudioPlayer(data:)`), không đọc lại từ đường dẫn, nên không có khe TOCTOU. `assetURL(for:)` thì kiểm xong rồi trả URL (đọc lại sau); hiện không có chỗ gọi, nhưng GĐ 1 không nên dùng để phát.
- **Chồng tiếng:** `play` luôn `interrupt()` (tăng `generation`, `backend.stop()`); clip tải dở kiểm `token == generation` trước khi phát. Đúng; UI test `maxPlaying` 1.
- **Luồng chạy:** đọc file và băm SHA256 nằm trong hàm async không gắn actor (ra khỏi main); `SpeechPlayer` là `@MainActor`; `AVAudioPlayer(data:)` ~25 KB trên main, chấp nhận được. Strict concurrency không cảnh báo.

### Lỗi
Không có lỗi chặn, không có lỗi.

### Góp ý (nhẹ, không chặn)
- **G1** `ClipBackend.swift` `AVClipBackend.ended`/`stop`: `players` khoá bằng `ObjectIdentifier`; nếu một player vừa xong bị `stop()` rồi player mới được cấp cùng địa chỉ, callback cũ (đã xếp hàng `Task @MainActor`) có thể gỡ nhầm player mới. Rất hiếm; khoá bằng một id tăng dần là xong.
- **G2** Cuộc gọi đến hay ngắt âm thanh hệ thống: `AVAudioPlayerDelegate` không có xử lý ngắt (`AVAudioSession.interruptionNotification`); `speaking` có thể đứng ở một id cho tới lần chạm kế tiếp. Chạm nút nghe vẫn phát lại bình thường. Kiểm trên máy thật ở SK-020.
- **G3** `DirectoryPackSource` kiểm chuỗi đường dẫn, không kiểm symlink. Gói nhúng nằm trong bundle (chỉ đọc) nên không phải rủi ro hôm nay; khi có nguồn tải về cache thì cần kiểm `standardizedFileURL` còn nằm dưới `root`.
- **G4** `manifest.json` không có chữ ký; sha256 chỉ bảo vệ khỏi hỏng, không bảo vệ khỏi gói bị thay cả manifest. Với gói nhúng thì không sao; GĐ 1 (tải qua mạng) cần ký manifest hoặc tải qua nguồn tin cậy.

### Chưa kiểm
- iPad Pro 11 / 13: **chưa kiểm: Duy giảm phạm vi 29/10, 1 lần 1 máy.**
- Nghe tiếng thật (rõ, không trễ, không chồng), nút gạt im lặng, VoiceOver thật, ngắt âm thanh: Duy nghe tay / SK-020.
