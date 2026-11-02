# SK-025 · App iOS phát giọng tiếng Việt thật (`voice_mode` vi và both)

Trạng thái: review · Ngày: 2026-10-31 · Phụ trách: ios-dev · Tester: tester
Nguồn: Duy 31/10 (giọng VI ưu tiên trước mọi việc khác); prd.md dòng 17 (bé 5–7 chưa đọc được chữ VI; giọng chọn lúc bắt đầu); technical-plan.md B4.1 (`voice_mode` en · vi · both, EN trước VI nối theo, chỉ tải trước clip của thứ tiếng đang bật), B7.1 (`Audio`); SK-011 (chọn giọng lúc tạo hồ sơ); SK-016 (AudioKit, quyết định 6, câu hỏi cho Duy #6); SK-024 (gói có `audio.vi`); luật Duy 29/10: test 1 lần, trên 1 simulator

## Mục tiêu
Bé có hồ sơ giọng "Chỉ tiếng Việt" hoặc "Cả hai" nghe được tiếng Việt ở mọi câu và từ của bài 1, đúng thứ tự, với cùng các nút nghe như hồ sơ tiếng Anh.

## Phạm vi
- **Gói:** nhúng gói SK-024 theo cách SK-016, không đổi cơ chế nhúng. ContentKit nhận asset `lang: "vi"` và kiểm `sha256` như clip EN.
- **Theo `voice_mode`:**
  - `vi`: chỉ phát VI;
  - `both`: mỗi chuỗi phát EN rồi VI, theo `Spoken.voiceClips(for:)` hiện có, xen kẽ EN1 → VI1 → EN2 → VI2 trong một lượt (xem câu hỏi 2);
  - `en`: không đổi so với SK-016.
- **Nút nghe** hiện ở mọi chỗ SK-016 đã đặt, khi hồ sơ có clip cho giọng của mình. Từ hôm nay, hồ sơ `vi` có nút nghe.
- **Chạm từ:** "Từ mới" thành nút khi có clip (SK-016 quyết định 6). Chạm từ đọc từ theo giọng của hồ sơ.
- **Tự phát:** cùng các chỗ của SK-016, theo giọng của hồ sơ. VoiceOver bật thì không tự phát.
- **Tải trước:** chỉ clip của thứ tiếng đang bật. `both` tải cả hai, `vi` chỉ VI.
- **Thiếu clip một thứ tiếng:** bỏ qua lặng lẽ, có log, như SK-016. Gói SK-024 không thiếu clip nào.
- **Màn Chủ đề:** nút loa câu hỏi lớn phát theo giọng của hồ sơ.
- **Câu hỏi #6 của SK-016:** trả lời trong ticket này (câu hỏi 1 dưới đây).
- **Chạy thử:** mỗi bộ test chạy **1 lần, trên 1 simulator** (iPhone 16 Pro, máy tester dùng ở SK-016). Không mở nhiều simulator, không chạy lặp.

## Ngoài phạm vi
- Nút nghe thứ tiếng kia (B4.1), trừ khi Duy chọn khác ở câu hỏi 1.
- Đổi `voice_mode` trong app (Góc phụ huynh chưa có). Bản thử đổi bằng cách tạo lại hồ sơ.
- Chỉnh âm lượng hay khoảng nghỉ giữa hai giọng bằng code: chỉ ghi số đo và đề xuất.
- iPad: theo luật 1 máy, tiêu chí iPad ghi "chưa kiểm".

## Tiêu chí nghiệm thu
- [ ] **Unit `LessonSpeech`, với `Spoken` có cả hai clip:**
  - `voiceClips`: `en` → [EN], `vi` → [VI], `both` → [EN, VI];
  - `clipsToPreload`: `vi` chỉ có hash VI, `both` có cả hai, `en` không có hash VI.
- [ ] **Unit với gói thật:** mọi chuỗi hiện ở 6 màn đều có `audio.vi` trong gói, cùng cách với `everyShownStringHasAnEnglishClip` của SK-016.
- [ ] **UI, hồ sơ `vi`:** đi trọn bài 1, chạm mọi nút nghe và mọi từ ở 6 màn.
  - Mọi clip phát ra là `vi:`, `failed 0`.
  - Số nút nghe bằng hồ sơ `en` (SK-016: 33 nút).
  - "Từ mới" là nút.
  - Dán dòng tổng kết của `-SKAudioProbe`.
- [ ] **UI, hồ sơ `both`:**
  - w1 tự phát theo thứ tự `en`, `vi` của từng chuỗi, rồi `finished`;
  - chạm nhanh 5 nút: chỉ cái cuối phát, `maxPlaying` 1.
- [ ] **Hồ sơ `en` không đổi:** không clip `vi:` nào phát, tải trước không có hash VI. Unit test, hoặc một UI test ngắn.
- [ ] Unit và UI test cũ (ContentKit, AudioKit, LessonPlayer, luồng vàng `LessonUITests`) xanh trên iPhone 16 Pro, chạy 1 lần. Dán log.
- [ ] **Duy nghe tay** trên simulator với hồ sơ `vi` và `both`, rồi ghi nhận xét vào ticket:
  - khoảng nghỉ giữa EN và VI;
  - âm lượng hai giọng có lệch không;
  - độ trễ khi chạm.
- [ ] `PrivacyInfo.xcprivacy` cập nhật nếu có API mới cần khai.
- [ ] Không sửa file ngoài `apps/ios/` (cộng ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- **SK-024:** gói có `audio.vi`.
  - Trước khi có gói, ios-dev làm unit test bằng gói test tự tạo (`madePack…` của SK-016), gắn clip giả vào `audio.vi`.
  - Phần UI và nghe tay chờ gói thật.
- SK-016 (đã đạt ở tester 29/10), SK-011.
- **SK-019** (luồng vàng) nên chạy sau ticket này, để kiểm cả giọng VI trong cùng một lần chạy. PM đề xuất; xem docs/ios-test-build.md.

**Quyết định đã ghi**
1. (Duy 31/10) Giọng VI là việc ưu tiên. Giọng VieNeu-TTS cụ thể chốt ở SK-023.
2. (PM 31/10) Không đổi cách nhúng gói, cách kiểm sha256 hay `SpeechPlayer`. Ticket này chủ yếu là dữ liệu thật đi qua đường đã có, cộng test và nghe thử.

**Câu hỏi còn mở**
1. *(câu #6 của SK-016, PM → Duy)* Câu #6 hỏi "hồ sơ `vi` có nút nghe EN cho tới khi có giọng VI không". Câu này hết lý do khi gói có clip VI. Còn lại ý của B4.1: "nút nghe thứ tiếng kia vẫn có để chạm khi cần" (ví dụ bé ở hồ sơ `vi` muốn nghe từ tiếng Anh). Canvas chưa có nút này.
   - (a) Không làm ở bản thử, tách thành ticket riêng cho designer và ios-dev. **Đề xuất**, để ticket này gọn và giọng VI lên sớm.
   - (b) Chạm giữ nút nghe thì phát thứ tiếng kia. Không cần thiết kế mới nhưng bé khó tự phát hiện.
   - (c) Thêm nút nhỏ "EN" / "VI" cạnh nút nghe. Cần designer vẽ, và nút phải đủ vùng chạm 56pt.
2. *(PM → Duy)* **Thứ tự của `both`:**
   - (a) Xen kẽ từng chuỗi, như code hiện tại. **Đề xuất**, vì bé ghép được câu Anh với câu Việt ngay. Ví dụ: "Pick the missing word" → "Chọn từ còn thiếu" → câu EN → câu VI.
   - (b) Đọc hết EN rồi mới đọc hết VI.

   Duy nghe (a) trên simulator rồi chốt.
3. *(PM → Duy)* Hồ sơ `vi` gặp chuỗi thiếu clip VI:
   - (a) Im lặng và ghi log, như hiện tại. **Đề xuất**: gói đã duyệt có đủ VI, nên trường hợp này chỉ xảy ra khi gói lỗi.
   - (b) Phát EN thay.
4. *(ios-dev đo, Duy chốt)* Khoảng nghỉ giữa EN và VI ở `both`:
   - Hiện dùng khoảng lặng có sẵn trong clip. Cuối clip Kokoro có khoảng 0,47 s; đầu clip VI do SK-023 đo.
   - **Đề xuất** không chèn thêm, nghe rồi mới tính.

## Kết quả (ios-dev)

Ngày 1/11. Lượt chạy duy nhất: iPhone 16 Pro `14DF158D-5ED6-49CF-80A5-7519B0D594F5`, iOS 18.4, 01:12–01:45. Không chạy lại.

Các câu hỏi mở làm theo đề xuất của PM, chờ Duy nghe rồi chốt:
- 1(a): không làm nút nghe thứ tiếng kia.
- 2(a): `both` xen kẽ EN1 → VI1 → EN2 → VI2.
- 3(a): thiếu clip VI thì im lặng và ghi log.
- 4: không chèn khoảng nghỉ.

### Đã làm
- **Gói:** nhúng gói SK-024 qua build phase "Embed content pack" của SK-016, không đổi cơ chế. Build ghi: `Content pack embedded … (219 files)`, gồm 217 clip, manifest và `pack.json`; `content_version` `0191a8837e5c`, chủ đề `7e4849fa98cb`. ContentKit nhận asset `lang: "vi"` và kiểm sha256 như clip EN.
- **Code app không phải đổi.** `Spoken.voiceClips(for:)`, `Utterance`, `clipsToPreload`, nút nghe, chạm từ, tự phát và nút loa ở màn Chủ đề đều đã theo `voice_mode` từ SK-016. Ticket này chỉ đổi test.
- **Unit test** (`LessonSpeechTests` và file mới `PackVoiceTests`):
  - Fixture có clip giả cho cả hai thứ tiếng:
    - `viVoicePlaysVietnameseOnly`: `vi` chỉ phát VI, ở mọi bước tự phát và mọi câu hỏi.
    - `bothAlternatesPerString`: w1 phát EN, VI, EN, VI, đúng chữ của từng chuỗi.
    - `preloadsOnlyTheVoiceThatIsOn`: `en` không có hash VI, `vi` chỉ có hash VI, `both` có cả hai.
  - Gói thật (`content/.build/pack`):
    - `everyShownStringHasAVietnameseClipInThePack`: 112 chuỗi hiện trên 11 bước đều có `audio.vi`. 94 clip VI khác nhau đều mở được và đúng sha256. `both` cho `[en, vi]` ở mọi chuỗi.
    - `englishProfileHasNoVietnameseOnTheRealPack`: hồ sơ `en` không tải trước và không tự phát clip VI nào.
- **UI test** (`AudioUITests`):
  - `testEveryListenButtonAndWordSpeaksVietnamese`: hồ sơ `vi` đi trọn bài 1, cùng đường với hồ sơ `en`.
  - `testBothPlaysEnglishThenVietnamesePerString`: thứ tự tự phát của w1 ở `both`, rồi bấm nút nghe phát lại đúng 4 clip đó.
  - `testBothFiveFastTapsPlayOnlyTheLast`: chạm nhanh 5 món ở `both`.
  - Bài đi của `en` và `vi` dùng chung một hàm, `walkLesson(voice:)`.
- **Test đổi ý nghĩa:**
  - `viVoicePlaysNothingYet` → `viVoiceWithoutVietnameseClipsPlaysNothing`. Kiểm y như cũ, nhưng nay là quyết định 3(a) ("gói thiếu clip VI thì im lặng"), không còn là "chưa có giọng VI".
  - `testViPlaysNothingAndKeepsTheText` **bỏ**, thay bằng `testEveryListenButtonAndWordSpeaksVietnamese`. Test cũ đòi hồ sơ `vi` không có nút nghe, nay sai.
  - `testBothPlaysEnglishThenStops` **bỏ**, thay bằng `testBothPlaysEnglishThenVietnamesePerString`. Test cũ đòi `both` chỉ có EN.
- `PrivacyInfo.xcprivacy`: không đổi, vì không dùng API mới nào cần khai.

### Kết quả lượt chạy
- Build `generic/platform=iOS Simulator`: `** TEST BUILD SUCCEEDED **`, không có cảnh báo mới.
- Test: `** TEST EXECUTE SUCCEEDED **`, exit 0. **216 test: 215 pass, 0 fail, 1 skip.**
  - Unit SKKit 200/200 pass:
    - DesignSystem 41, ContentModel 20, LessonEngine 19, ContentKit 18;
    - LessonPlayer 50 (45 cũ + 5 mới), AudioKit 13, Profiles 21, Sync 18.
  - `AudioUITests` 6/6 pass:
    - `en` (572 s), `vi` (573 s);
    - `both` tự phát (45 s), `both` 5 chạm (54 s), `en` 5 chạm (52 s);
    - VoiceOver (34 s).
  - `LessonUITests` 9 pass, 1 skip (`testGoldenPathWithSystemReduceMotion`, cần bật công tắc hệ thống). Luồng vàng pass.
- Dòng tổng kết của `-SKAudioProbe`:
  - Hồ sơ `vi`: `audio walk [vi]: 36 listen taps (33 buttons), 50 word taps (38 words, 4 new words), 10 autoplays, 114 clips started [vi: 114], 72 different strings, failed 0, maxPlaying 1`
  - Hồ sơ `en`, để so: `audio walk [en]: 36 listen taps (33 buttons), 50 word taps (38 words, 4 new words), 10 autoplays, 112 clips started [en: 112], 71 different strings, failed 0, maxPlaying 1`
    - Hai hồ sơ có cùng 33 nút nghe; test so trùng từng nút.
    - "Từ mới" là nút ở cả hai.
    - VI nhiều hơn 1 chuỗi (72 so với 71). Lý do có thể là một chuỗi EN dùng chung cho hai chuỗi VI khác nhau, tôi chưa tra.
  - Hồ sơ `both`, w1 tự phát: `heard ["en:Pick the missing word", "vi:Chọn từ còn thiếu", "en:Animals, including humans, need food, water and {1} to live.", "vi:Động vật, kể cả con người, cần thức ăn, nước và {1} để sống."], finished ["question.w1"], maxPlaying 1`. Bấm nút nghe: phát lại 4 clip đó, `failed []`.
  - Hồ sơ `both`, 5 chạm nhanh: `sounded [word.tray_rice, word.tray_bread, word.tray_fish, word.tray_egg, word.tray_greens], finished ["word.tray_greens"], maxPlaying 1`. Chỉ món cuối phát hết.
- Sau lượt chạy, tôi `xcrun simctl shutdown`. `booted` ra 0 lúc 01:45.
- Log và kết quả:
  - Log: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-025/logs/run.log`
  - Build: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-025/logs/build.log`
  - xcresult: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/dd-sk013/Logs/Test/Test-ScienceKids-2026.11.01_01-11-56-+0700.xcresult`
  - Log không có URL hay key.

### Số đo trên clip thật
Đo bằng ffmpeg trên 217 clip của gói (ngưỡng im lặng −50 dB). Script: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-025/measure_clips.py`; số: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-025/clip-measure.txt`.

**Khoảng lặng**

| | Đầu clip (trung vị, khoảng) | Cuối clip (trung vị, khoảng) |
| --- | --- | --- |
| EN (Kokoro) | 0,33 s (0,27–0,41) | 0,46 s (0,34–0,55) |
| VI (Kim Thanh) | 0,06 s (0–0,26) | 0,31 s (0,03–0,40) |

**Khoảng nghỉ ở `both`.** Tính từ khoảng lặng trong file. Chưa cộng độ trễ khi `SpeechPlayer` chuyển clip; độ trễ này tôi chưa đo được trên simulator.
- EN → VI của cùng một chuỗi: trung vị 0,54 s, khoảng 0,40–0,73 s (111 cặp).
  - w1: "Pick the missing word" → "Chọn từ còn thiếu" là 0,56 s; câu điền → câu VI là 0,53 s.
- VI → EN của chuỗi kế: trung vị 0,64 s, khoảng 0,31–0,82 s.
- Nghĩa là EN rồi VI nối hơi sát hơn VI rồi EN kế. Không chèn thêm (câu 4). Duy nghe rồi chốt.

**Âm lượng**

| | Mean volume (trung vị, khoảng) | Độ to tích hợp (trung vị, khoảng) |
| --- | --- | --- |
| EN | −23,5 dB (−24,9 – −22,6) | −22,0 LUFS (−23,1 – −19,9) |
| VI | −20,5 dB (−25,4 – −18,5) | −20,4 LUFS (−24,0 – −17,5) |

- **VI to hơn EN: +3,0 dB theo mean volume, +1,6 LU theo độ to cảm nhận.**
- Độ to giữa các clip VI chênh 6,5 LU: nhỏ nhất "lạc", to nhất "khoai lang". EN chỉ chênh 3,2 LU.
- Không chỉnh bằng code. Nếu cần cân lại thì làm ở bước TTS (`content-cli`, việc của `dev`), ví dụ chuẩn hoá loudness mọi clip về cùng một mức LUFS.

**Clip VI có đuôi rất ngắn.** "không khí" chỉ còn 0,03 s im lặng ở cuối, "Em kể được các nhóm chất dinh dưỡng chính." 0,06 s, "Đồ ngọt: nên ăn ít" 0,09 s. Có thể âm cuối bị cắt sát. Đề nghị Duy nghe kỹ ba clip này; nếu cụt thì ghi cho `dev` (SK-024).

### Hướng dẫn Duy nghe trên simulator
1. Mở `apps/ios/ScienceKids.xcodeproj` trong Xcode. Nếu chưa có file này, chạy `apps/ios/bootstrap.sh` trước.
   - Gói `content/.build/pack` đã có sẵn trên máy, build sẽ tự nhúng.
   - Chọn máy iPhone 16 Pro, bấm Run (⌘R). Bật loa Mac.
2. Mỗi lần nghe một giọng phải tạo hồ sơ mới.
   - Cách nhanh: Product → Scheme → Edit Scheme → Run → Arguments, thêm `-SKResetProfile YES` (và `-SKSyncOff YES` nếu không muốn gửi lên staging), rồi Run lại.
   - Hoặc xoá app trên simulator (giữ icon → Remove App) rồi Run.
3. Màn **Chào mừng**: chọn "Song ngữ", bấm "Tiếp".
4. Màn **Hồ sơ của bé**: gõ tên, chọn hình, chọn lớp. Ở "Bé nghe giọng đọc nào?":
   - chọn **"Chỉ tiếng Việt"** để nghe hồ sơ `vi`;
   - lần sau chọn **"Cả hai"** để nghe hồ sơ `both`.
   - Bấm "Bắt đầu hành trình".
5. Ở Trang chủ, bấm nút ▶ của thẻ "Học tiếp" để vào bài 1. Những chỗ nên nghe:
   - **Khởi động:** câu hỏi tự đọc. Ở `both`, đây là chỗ nghe khoảng nghỉ EN → VI rõ nhất. Bấm từ "air" (hoặc "không khí").
   - **Học:** chạm từng nhóm chất, các nút loa, 4 thẻ "Từ mới". Có "không khí" và "Em kể được…" để nghe đuôi clip.
   - **Chơi:** chạm nhanh các món trên kệ để cảm nhận độ trễ khi chạm.
   - **Quiz:** loa câu hỏi, các từ, Gợi ý, lời giải thích. **Thưởng:** chạm thẻ.
   - **Màn Chủ đề** (bấm thẻ chủ đề ở Trang chủ): nút loa câu hỏi lớn.
6. Ghi nhận xét vào ticket: khoảng nghỉ EN và VI, âm lượng hai giọng, độ trễ khi chạm.

### Tiêu chí nghiệm thu
| Tiêu chí | Kết quả |
| --- | --- |
| Unit `LessonSpeech` (`voiceClips`, `clipsToPreload`) | **Đạt.** `voiceModes`, `preloadsOnlyTheVoiceThatIsOn` |
| Unit với gói thật: mọi chuỗi có `audio.vi` | **Đạt.** `everyShownStringHasAVietnameseClipInThePack`: 112 chuỗi, 94 clip VI |
| UI hồ sơ `vi`: chỉ `vi:`, `failed 0`, 33 nút, "Từ mới" là nút | **Đạt.** Dòng probe ở trên |
| UI hồ sơ `both`: w1 en, vi rồi `finished`; 5 chạm nhanh `maxPlaying 1` | **Đạt** |
| Hồ sơ `en` không đổi | **Đạt.** Bài đi của `en` chỉ có `en:`; `englishProfileHasNoVietnameseOnTheRealPack`; `preloadsOnlyTheVoiceThatIsOn` |
| Test cũ xanh trên iPhone 16 Pro, 1 lần | **Đạt.** ContentKit, AudioKit, LessonPlayer, `LessonUITests` (1 skip có sẵn) |
| Duy nghe tay | **Chờ Duy.** Hướng dẫn ở trên |
| `PrivacyInfo.xcprivacy` | **Đạt**, không cần đổi |
| Chỉ sửa `apps/ios/` + ticket, không commit | **Đạt (phía tôi)** |

### File đã đổi
- `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/LessonSpeechTests.swift`
- `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/PackVoiceTests.swift` (mới)
- `apps/ios/Packages/SKKit/Package.swift`: `LessonPlayerTests` thêm phụ thuộc `ContentKit` để đọc gói thật.
- `apps/ios/ScienceKidsUITests/AudioUITests.swift`
- Gói nhúng lúc build từ `content/.build/pack`, không chép vào `apps/ios`.

### Còn chưa chắc
- **Chưa nghe bằng tai.** UI test chỉ biết clip đã bắt đầu, đã xong, không lỗi. Khoảng nghỉ, độ to, độ trễ khi chạm và chất giọng chờ Duy nghe.
- **Độ trễ chuyển clip** của `SpeechPlayer` giữa EN và VI chưa đo, nên khoảng nghỉ thật có thể dài hơn số trên vài chục ms.
- **iPad và iPhone 16e:** chưa kiểm, theo luật 1 máy.
- **Gói nặng gấp đôi** (khoảng 4,8–5,2 MB). Chưa đo thời gian mở app hay bộ nhớ khi tải trước cả hai thứ tiếng ở `both`.
- Dòng probe ghi chữ câu điền kèm `{1}`. Đây là chữ gốc của nội dung, chỉ hiện trong probe debug, không ảnh hưởng clip.

## Nhúng gói đã cân âm lượng (ios-dev, 1/11)

Gói mới của dev (SK-024, "Cân âm lượng và khoảng lặng"):
- `content_version` `89d8ade0a3cd`, version chủ đề `692f2e75ba89`;
- 210 clip (EN 100, VI 110);
- sha256 của `manifest.json` là `138bf89d…bd70`.

### Nhúng
- Build `generic/platform=iOS Simulator`: `** TEST BUILD SUCCEEDED **`, không có cảnh báo mới. Dòng build: `Content pack embedded … (212 files)`, gồm 210 clip, manifest và `pack.json`.
- `ScienceKids.app/pack` trùng từng byte với `content/.build/pack` (`diff -rq` không ra gì). sha256 manifest trong app là `138bf89d3b1a94e8541113a541310e0fb22f91035fc48921221cbd3e7794bd70`, khớp số dev đưa.
- **Không phải sửa test nào.** Không test nào ghim số clip (107/217), hash audio hay `content_version` của gói thật.
  - Chuỗi `"15880ff9df19"` trong `LessonSpeechTests`, `SyncTests`, `SyncAppTests` là dữ liệu tự tạo của chính test (ghi vào rồi đọc lại), không lấy từ gói.
  - Số 33 nút nghe trong `AudioUITests` không phụ thuộc gói.
- Không sửa file nào trong `apps/ios/` ở bước này.

### Đo clip đã nhúng trong app
Chạy `measure_clips.py` trên `ScienceKids.app/pack` của bản build. Kết quả **trùng từng dòng** với `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk024-can-am-luong/measure-after.txt` của dev (`diff` không ra gì). App nhúng đúng gói đã cân.
- Độ to tích hợp, trung vị: EN −19,0 LUFS, VI −19,0 LUFS, **chênh 0,0 LU** (trước là +1,6 LU). Mean volume chênh +0,9 dB (trước +3,0 dB).
  - Đo trên cả clip, kể cả đoạn lặng, nên ra −19 chứ không phải −18 như số dev đo trên phần có tiếng.
- Khoảng lặng VI: đầu 0,15–0,17 s, cuối 0,35–0,39 s. Đuôi ngắn nhất 0,35 s; "không khí" không còn cụt như trước (trước là 0,03 s).
- Khoảng lặng EN không đổi: đầu trung vị 0,32 s, cuối trung vị 0,46 s.
- Khoảng nghỉ trong file ở `both`:
  - EN → VI cùng chuỗi: trung vị 0,62 s (0,50–0,71). Ở w1 là 0,58 s và 0,64 s.
  - VI → EN chuỗi kế: trung vị 0,69 s (0,62–0,80).
- File số đo: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-025/pack2/measure-in-app.txt`.

### Khoảng nghỉ thật trong app: chưa đo
- `-SKAudioProbe` (`SpeechStats`) chỉ ghi id và chữ của clip, không ghi mốc thời gian lúc clip bắt đầu hay kết thúc.
- Không thêm code chỉ để đo, theo yêu cầu. Vì vậy chưa đo được độ trễ khi `SpeechPlayer` chuyển clip.
- Khoảng nghỉ nghe thấy bằng 0,62 s lặng trong file, cộng độ trễ chuyển clip chưa biết.
- Muốn đo thì cần thêm mốc thời gian vào probe (bản debug), hoặc thu tiếng simulator rồi đo.

### Lượt chạy (1 lần, 1 máy)
- Máy: iPhone 16 Pro `14DF158D-5ED6-49CF-80A5-7519B0D594F5`, đang Booted sẵn và không có `xcodebuild` nào khác chạy, nên dùng luôn. Chạy 14:16–14:38.
- Lệnh: `xcodebuild test-without-building` với `-only-testing` ContentKitTests, AudioKitTests, LessonPlayerTests và `ScienceKidsUITests/AudioUITests`.
- Kết quả: **`** TEST EXECUTE SUCCEEDED **`, exit 0. 87 test: 87 pass, 0 fail, 0 skip.**
  - Unit: ContentKit 18, AudioKit 13, LessonPlayer 50. Các test chạy trên gói thật đều pass: `builtPack…` ×3, `PackVoiceTests` ×2.
  - `pack voice: 112 strings shown on 11 steps, 94 different VI clips, all in the pack`.
- `AudioUITests` 6/6 pass. Dòng probe:
  - `audio walk [vi]: 36 listen taps (33 buttons), 50 word taps (38 words, 4 new words), 10 autoplays, 113 clips started [vi: 113], 72 different strings, failed 0, maxPlaying 1`
  - `audio walk [en]: 36 listen taps (33 buttons), 50 word taps (38 words, 4 new words), 10 autoplays, 112 clips started [en: 112], 71 different strings, failed 0, maxPlaying 1`
  - `both` w1 tự phát: `en:Pick the missing word`, `vi:Chọn từ còn thiếu`, `en:Animals…`, `vi:Động vật…`, rồi `finished`, `maxPlaying 1`.
  - 5 chạm nhanh ở `both` và `en`: chỉ `word.tray_greens` phát hết, `maxPlaying 1`.
- Sau lượt chạy, tôi `xcrun simctl shutdown`. `booted` ra 0 lúc 14:38.
- Log và kết quả:
  - Log: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-025/pack2/logs/run.log`
  - Build: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-025/pack2/logs/build.log`
  - xcresult: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/dd-sk013/Logs/Test/Test-ScienceKids-2026.11.01_14-16-48-+0700.xcresult`
  - Log không có URL hay key.

### Còn chưa chắc
- **Độ trễ chuyển clip** giữa EN và VI chưa đo (probe không có mốc thời gian).
- **Số clip VI bắt đầu** trong bài đi `vi` là 113, lượt trước 114. Không có test nào ghim con số này. Tôi đoán chênh lệch do thời điểm chạm: một lượt phát bị ngắt trước khi tới clip sau. Chưa tra.
- Duy vẫn cần nghe tay với gói mới.
