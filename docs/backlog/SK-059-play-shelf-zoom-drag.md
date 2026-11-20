# SK-059 · Kệ Chơi: chạm để xem to, giữ rồi kéo vào giỏ để chọn

Trạng thái: review · Ngày: 2026-11-19 · Phụ trách: designer (canvas + spec) → content-editor (chữ gợi ý) → ios-dev (làm) · Tester: tester
Nguồn: Duy chốt 19/11 (ảnh màn Chơi bài 3 *Đồng bằng và ruộng lúa*, chủ đề *Núi, sông và biển*, trên iPhone 16); canvas `design/play-ui/options/lesson-less-text/Explorer-A.html` (`x-play-*`) và `Discoverer-A2.html` (`d-play-*`); SK-043 (màn Chơi hướng A); SK-031 (kệ trung tính); engine `buildTray` và vector `build-tray` (SK-003, SK-012)

## Mục tiêu
Bé Explorer và Discoverer xem rõ từng ảnh trên kệ Chơi trước khi chọn: chạm một lần thì ảnh phóng to, nhấn giữ rồi kéo vào giỏ thì chọn, để bé không chọn nhầm vì ảnh nhỏ.

## Hiện trạng trong code (đọc ngày 19/11)

- Một view chung cho cả hai nhóm tuổi: `apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/PlayStep.swift`, gọi từ `LessonPlayerView.swift` ở cả nhánh Explorer (dòng 99) và Discoverer (dòng 121). Khác nhau giữa hai nhóm chỉ ở bo góc, chip và chữ phụ đề, không ở tương tác.
- Kệ (`pictureShelf`): `LazyVGrid` 3 cột trên iPhone, ô cao tối thiểu 96 (`PictureBookMetrics.shelfPicture`); iPad 4 cột, ô 124 (`PictureBookParts.swift` dòng 21–24). Thứ tự xáo theo lượt (`session.shelfItems`), không chữ, không màu nhóm.
- Chạm món trên kệ → `session.tapTrayItem(key)`: món chưa có thì vào cuối giỏ (nếu còn chỗ), món đã có thì ra khỏi giỏ (bật/tắt); giỏ đầy thì không đổi và bật cờ `full`. Mỗi lần chạm đọc tên món rồi lời nhắn mới (`explorerTrayTapUtterance`). Món đã vào giỏ có triện dấu tích trên kệ.
- Giỏ (`trayPlate`): hình bầu dục gỉ đồng, `capacity` ô tròn (96 trên iPhone); chạm món trong giỏ → bỏ ra (cùng hàm `tapTrayItem`). Giỏ không có vị trí riêng cho từng ô: engine chỉ nối vào cuối danh sách.
- Không có kéo thả, không có phóng to ở màn Chơi. Kéo thả đã có ở câu xếp thứ tự Explorer (`ExplorerOrderSequence.swift`, `.draggable` / `.dropDestination`, thả sai thì thẻ trượt về), dùng làm mẫu được.
- Chữ nội dung hiện có khớp với tương tác cũ: `messages.full` "No more room! Tap one to take it off." và `messages.has_limited` "... Tap it to take it off." có ở khoảng 98 bài (Explorer + Discoverer). Hai câu này nói về món **trong giỏ**, nên còn đúng nếu giữ "chạm món trong giỏ để bỏ ra" (xem câu hỏi mở 2).

## Phạm vi

Áp cho **cả Explorer và Discoverer** (PM đề xuất): cùng một `PlayStep`, tách riêng sẽ phải giữ hai tương tác cho một view; Discoverer 7–9 tuổi cũng xem ảnh nhỏ trên điện thoại. Nếu Duy muốn chỉ Explorer thì ios-dev bật theo `session.isExplorer`, phần còn lại giữ nguyên (câu hỏi mở 3).

1. **Chạm món trên kệ → màn phóng to** (không đổi giỏ):
   - Ảnh gần hết màn (iPhone: rộng màn trừ lề; iPad: theo khung 600 của canvas), hiện **trọn ảnh, không cắt** (kệ đang cắt cho đầy ô).
   - Tên món theo chế độ ngôn ngữ, cùng luật hiện có: Explorer "Cả hai" in EN và VI; Discoverer "Cả hai" in EN (luật A2). Nút loa đọc tên theo `voice_mode`; mở màn thì tự đọc tên một lần (thay cho việc chạm kệ đọc tên như bây giờ).
   - Đóng bằng nút đóng (≥ vùng chạm của nhóm tuổi: 72 Explorer, 56 Discoverer) hoặc chạm ra ngoài ảnh. Đóng thì ngắt giọng đang đọc.
   - Món đã trong giỏ vẫn mở xem to được (triện tích vẫn hiện ở kệ).
   - Mở/đóng: ảnh lớn lên từ ô của nó; bật Giảm chuyển động thì chỉ hiện/mờ dần, không phóng.
2. **Nhấn giữ món trên kệ rồi kéo vào giỏ → chọn**:
   - Khi nhấc: món nổi lên (bóng `offsetAccent`, to hơn chút), rung nhẹ nếu máy có; ô gốc trên kệ còn lại chỗ lõm để kệ không xô.
   - Kéo qua giỏ: cả giỏ sáng lên, ô trống kế tiếp nổi rõ (thả vào bất kỳ đâu trên giỏ đều tính, vì engine không có vị trí từng ô; không đổi engine).
   - Thả trên giỏ → gọi `tapTrayItem(key)` như hiện nay; đọc tên món rồi lời nhắn mới (giữ `explorerTrayTapUtterance`). Giỏ đầy → giỏ không đổi, lời nhắn `full`, món trượt về kệ.
   - Thả ngoài giỏ hoặc huỷ kéo → món trượt về chỗ cũ trên kệ (Giảm chuyển động: hiện lại tại chỗ), giỏ không đổi.
   - Món đã trong giỏ: không kéo từ kệ được nữa (chỉ xem to).
   - Kéo không ra khỏi app (iPad Split View/Slide Over không nhận được món).
3. **Bỏ món ra khỏi giỏ** (PM đề xuất, chờ Duy ở câu hỏi mở 2): giữ **chạm món trong giỏ → bỏ ra** như bây giờ, thêm **kéo món từ giỏ ra ngoài giỏ → bỏ ra**. Lý do: chữ `full` / `has_limited` ở khoảng 98 bài đang nói "chạm để bỏ ra", giữ thì không phải sửa và đọc lại TTS.
4. **Gợi ý lần đầu của mascot**: lần đầu mỗi hồ sơ con vào màn Chơi, mascot nói và in "Chạm để xem to, giữ rồi kéo để chọn" (bản EN/VI do content-editor viết, ≤ 12 chữ mỗi câu theo luật A2) kèm hình bàn tay minh hoạ chạm và kéo (designer vẽ; Giảm chuyển động: hình tĩnh). Gợi ý đi trước lời nhắn `start`/`prompt` của bài, rồi bong bóng trở về lời nhắn của bài. Nếu bé chưa chọn được món nào sau 3 lần mở xem to, mascot nhắc lại một lần trong lượt đó. Cờ "đã thấy" lưu trên máy theo hồ sơ, không gửi server.
   - Giọng đọc: chữ này là chữ giao diện, không thuộc gói bài, nên hiện chưa có clip. Cần chọn nguồn clip (câu hỏi mở 4).
5. **VoiceOver và điều khiển thay thế**: món trên kệ đọc tên như hiện nay (không lộ nhóm). Chạm đúp = "Xem to" (khớp thao tác chạm). Thao tác tuỳ chỉnh (rotor): "Bỏ vào giỏ" khi món chưa trong giỏ, "Bỏ ra khỏi giỏ" khi đã trong giỏ. Gợi ý (hint) đọc "Chạm hai lần để xem to. Vuốt lên hoặc xuống để bỏ vào giỏ." Màn phóng to: tiêu điểm vào ảnh (nhãn là tên món), nút loa, nút đóng; cử chỉ thoát (vuốt chữ Z) đóng màn. Món trong giỏ giữ nhãn "Bỏ ra …" hiện có. Voice Control và Switch Control dùng được qua cùng các thao tác này.
6. **iPad**: kệ 4 cột ô 124 như canvas (hoặc theo kết quả câu hỏi mở 1), màn phóng to trong khung 600 giữa màn, kéo thả chạy cả dọc và ngang; Split View không nhận món kéo ra.
7. **Designer làm trước**: thêm vào canvas Explorer-A và Discoverer-A2 các trạng thái: kệ (theo câu hỏi mở 1), màn phóng to (iPhone, iPad), đang kéo (món nổi, giỏ sáng, ô trống kế tiếp), thả sai trượt về, giỏ đầy, gợi ý lần đầu (bong bóng + bàn tay). Spec số đo, motion token, bản Giảm chuyển động. Duy xem canvas trước khi ios-dev code (chốt thiết kế thuộc Duy).

## Ngoài phạm vi
- Đổi engine `buildTray`, test vector `build-tray`, schema `build_tray`, luật tính sao/XP.
- Kéo thả hoặc phóng to ở Quiz, Khởi động, màn Học (ticket khác nếu cần).
- Sửa `messages.full` / `has_limited` trong nội dung (chỉ cần nếu Duy chọn cách bỏ món khác đề xuất ở câu hỏi mở 2; khi đó tách ticket content-editor).
- Android.

## Tiêu chí nghiệm thu
Chạy trên một simulator iPhone 16 (và một iPad cho mục iPad), gói hiện tại có `nui-song-va-bien/03` và `an-uong-lanh-manh/01`.

**Thiết kế**
- [ ] Canvas Explorer-A và Discoverer-A2 có đủ 6 trạng thái ở mục 7, kèm spec số đo, token, bản Giảm chuyển động; Duy đã xem và ghi chốt vào ticket trước khi ios-dev bắt đầu.

**Xem to**
- [ ] `nui-song-va-bien/03`, màn Chơi, giỏ trống: chạm một lần món "Ruộng lúa" → màn phóng to hiện trọn ảnh, tên món theo chế độ ngôn ngữ, giọng đọc tên một lần; giỏ vẫn 0/3, lời nhắn không đổi, `progress.tray` không đổi.
- [ ] Chạm nút loa → đọc lại tên. Chạm ra ngoài ảnh → đóng; mở lại rồi chạm nút đóng → đóng; giọng đang đọc dừng khi đóng.
- [ ] Hồ sơ `language_mode = both`: Explorer in hai dòng EN, VI; Discoverer (`an-uong-lanh-manh/01`) in EN.
- [ ] Món đã trong giỏ: chạm trên kệ → mở xem to, món vẫn trong giỏ (khác hành vi cũ là bỏ ra).
- [ ] Bật Giảm chuyển động (Settings → Accessibility → Motion): mở/đóng không có phóng to, chỉ hiện/mờ.

**Kéo vào giỏ**
- [ ] Nhấn giữ món rồi kéo: món nổi lên khi nhấc; kéo qua giỏ thì giỏ sáng và ô trống kế tiếp nổi rõ; thả → món vào giỏ, chip nhóm đổi, đọc tên rồi lời nhắn mới; `progress.tray` có key món.
- [ ] Thả ngoài giỏ → món về kệ, giỏ không đổi. Bật Giảm chuyển động → món hiện lại tại chỗ, không trượt.
- [ ] Giỏ 3/3, kéo thêm một món và thả vào giỏ → giỏ không đổi, lời nhắn `full`, món về kệ.
- [ ] Món đã trong giỏ không kéo được từ kệ.
- [ ] Vuốt dọc trên kệ vẫn cuộn màn bình thường (nhấn giữ mới nhấc món, chạm ngắn không nhấc).
- [ ] Chọn đủ đúng nhóm bằng kéo thả → `balanced`, mũi tên sang Quiz hiện; điểm, sao, XP của bài giống hệt khi làm bằng cách cũ (test vector `build-tray` không đổi, vẫn xanh).

**Bỏ ra khỏi giỏ** (theo phương án Duy chốt ở câu hỏi mở 2; đề xuất PM)
- [ ] Chạm món trong giỏ → bỏ ra, món trên kệ hết triện tích.
- [ ] Kéo món từ giỏ thả ra ngoài giỏ → bỏ ra; thả lại trong giỏ → không đổi.

**Gợi ý lần đầu**
- [ ] Hồ sơ mới, lần đầu vào Chơi: mascot nói và in câu gợi ý (bản content-editor, đúng chế độ ngôn ngữ), bàn tay minh hoạ chạy (Giảm chuyển động: hình tĩnh); sau đó bong bóng về lời nhắn của bài.
- [ ] Bài kế tiếp hoặc mở lại app cùng hồ sơ: không hiện lại. Hồ sơ khác trên cùng máy: hiện lần đầu.
- [ ] Trong lượt đầu, mở xem to 3 lần mà chưa chọn món nào → mascot nhắc lại một lần, không lặp nữa.
- [ ] Cờ "đã thấy" không nằm trong dữ liệu gửi Supabase.

**VoiceOver**
- [ ] VoiceOver trên món ở kệ: đọc tên (không đọc nhóm), chạm đúp → màn phóng to; rotor có "Bỏ vào giỏ" → món vào giỏ và lời nhắn mới được đọc.
- [ ] Món đã trong giỏ: rotor có "Bỏ ra khỏi giỏ". Màn phóng to: tiêu điểm vào ảnh, đọc tên; vuốt chữ Z đóng màn.
- [ ] Làm trọn màn Chơi `an-uong-lanh-manh/01` chỉ bằng VoiceOver, không cần kéo thả.

**iPad**
- [ ] iPad (dọc và ngang): kệ theo canvas, màn phóng to trong khung 600, kéo thả vào giỏ chạy; mở Split View với app khác, kéo món sang app kia → không nhận, món về kệ.

**Chung**
- [ ] Toàn bộ unit test SKKit và ScienceKidsTests xanh, chạy một lần trên iPhone 16; UI test màn Chơi cũ (chạm để chọn) được sửa theo tương tác mới, có ít nhất một UI test kéo thả và một test VoiceOver action.
- [ ] Màu, chữ, bóng, motion lấy từ design tokens; không nét viền trên hình khối.

## Phụ thuộc
- SK-043 (màn Chơi hướng A) và SK-047 đã chạy; ticket này sửa lên trên.
- Designer làm canvas + spec trước; Duy xem; content-editor viết câu gợi ý song song với designer.
- Nguồn clip giọng cho câu gợi ý (câu hỏi mở 4) có thể kéo thêm `dev`.

## Quyết định đã ghi
- 19/11 · Duy: chạm một lần → ảnh phóng to; nhấn giữ rồi kéo vào ô của giỏ → chọn.
- 19/11 · PM đề xuất (chờ Duy xác nhận, xem câu hỏi mở 3): áp cho cả Explorer và Discoverer vì dùng chung `PlayStep`.
- 19/11 · Không đổi engine, schema, test vector: thả vào giỏ gọi đúng `tapTrayItem` như chạm cũ.

## Câu hỏi còn mở (cho Duy)
1. **Kệ 2 cột × 3 hàng trên iPhone** (phiên chính đề xuất 19/11, Duy chưa trả lời): ảnh to hơn khoảng 1,5 lần, lấp chỗ trống cuối màn. Lưu ý: nhiều bài Explorer có 7–8 món, 2 cột thành 4 hàng và màn phải cuộn, giỏ có thể khuất khi kéo món ở hàng cuối.
   - (a) Giữ 3 cột, chỉ thêm xem to. (b) 2 cột cho mọi bài. (c) 2 cột khi kệ ≤ 6 món, 3 cột khi nhiều hơn.
   - **PM đề xuất (c)**: ảnh to khi có chỗ, không bắt bé kéo qua đoạn cuộn. iPad giữ 4 cột (hoặc 3 nếu Duy muốn to hơn). Designer vẽ cả hai cỡ trên canvas để Duy nhìn.
2. **Bỏ món ra khỏi giỏ**: (a) chạm món trong giỏ bỏ ra như cũ, thêm kéo ra ngoài giỏ; (b) chạm món trong giỏ cũng mở xem to cho nhất quán, chỉ kéo ra mới bỏ; (c) màn phóng to của món trong giỏ có nút "Bỏ ra". **PM đề xuất (a)**: ít thay đổi nhất, chữ "chạm để bỏ ra" ở khoảng 98 bài vẫn đúng; (b) phải sửa chữ và đọc lại TTS toàn bộ.
3. **Cả hai nhóm tuổi hay chỉ Explorer**: **PM đề xuất cả hai** (một view chung, Discoverer cũng thấy ảnh nhỏ trên iPhone).
4. **Giọng cho câu gợi ý**: clip hiện chỉ đến từ gói bài (băm sha256 theo `audio.en`/`audio.vi`), app chưa có clip giao diện. (a) `dev` thêm một bộ clip giao diện nhỏ nhúng trong app, sinh bằng `content-cli tts` cùng giọng (Kokoro EN, Kim Thanh VI), dùng lại được cho gợi ý sau này; (b) chỉ in chữ và bàn tay minh hoạ, không giọng (bé Explorer chưa đọc được); (c) thêm câu gợi ý vào từng khối `build_tray` của nội dung (đổi schema, lặp ~98 bài). **PM đề xuất (a)**, ghi thêm một mục việc cho `dev` vào ticket này khi Duy chốt.
5. Màn phóng to có thêm nút "Bỏ vào giỏ" cho bé chưa quen kéo không? **PM đề xuất chưa thêm** (giữ đúng tương tác Duy chốt); xem lại sau khi thử với trẻ thật.

## Tạm chốt để vẽ (phiên chính 19/11, auto theo PM; Duy duyệt trên canvas trước khi ios-dev làm)

1. Kệ: (c) 2 cột khi kệ ≤ 6 món, 3 cột khi nhiều hơn.
2. Bỏ món khỏi giỏ: (a) chạm như cũ, thêm kéo ra.
3. Áp cả Explorer và Discoverer.
4. Giọng câu gợi ý: (a) bộ clip giọng nhỏ cho chữ giao diện, nhúng trong app (thêm việc cho dev khi Duy duyệt).
5. Chưa thêm nút "Bỏ vào giỏ" trong màn phóng to.

## Ghi chú designer (19/11)

**Canvas:** mục mới “Chơi · xem to, giữ rồi kéo vào giỏ (SK-059)” trong `design/play-ui/options/lesson-less-text/Explorer-A.html` (9 khung `x59-*`, có bảng spec ngay dưới) và `Discoverer-A2.html` (2 khung `d59-*`). Chụp riêng từng khung bằng `?shot=<id>`. Ảnh dùng thật từ gói `nui-song-va-bien/03` (`img/sk059-*.jpg`, thu 720 px) và bài 4 động vật, bài đá Discoverer. Chưa thêm board `.dc.html` vào `canvas.json` (màn Chơi hướng A sống ở trang options như SK-043).

| Khung | Trạng thái |
| --- | --- |
| `x59-shelf2` | Kệ 2 cột, 6 món, ô 167×112; chip 3 nhóm chia đều một hàng |
| `x59-shelf3` | Kệ 3 cột, 7 món (giữ `x-play-mid`); món có triện chỉ xem to, không nhấc |
| `x59-zoom` | Xem to, chế độ Cả hai (EN + VI), loa 72, nút đóng 72, lớp mờ |
| `x59-zoom-in` | Xem to món đã trong giỏ, chế độ Tiếng Việt, triện 40 ở góc tờ |
| `x59-drag` | Đang kéo: món nhấc, chỗ lõm ở kệ, giỏ sáng, ô kế tiếp vàng hoè |
| `x59-return` | Thả ngoài giỏ: món trượt về chỗ lõm |
| `x59-full` | Giỏ 3/3: giỏ không sáng, bong bóng `full`, món trượt về |
| `x59-hint` | Gợi ý lần đầu: bong bóng (chữ tạm) + bàn tay giấy cắt, bản tĩnh cho Giảm chuyển động |
| `x59-ipad` | iPad: xem to trong khung 600 |
| `d59-zoom`, `d59-drag` | Discoverer: xem to (Cả hai chỉ in EN), đang kéo trên kệ 3 cột 9 món |

**Số đo chính**
- Kệ 2 cột (≤ 6 món): ô rộng ≈ 167, cao = (chỗ còn lại − 20) ÷ 3, kẹp 96…132; dưới 96 thì về 3 cột (`ViewThatFits`). Kệ 3 cột giữ 110×96. iPad: ≤ 6 món 3 cột ô 150 (chốt), nhiều hơn 4 cột.
- Bài có 3 nhóm: chip nhóm chia đều một hàng (cao 72 Explorer / 56 Discoverer, chấm 24, chữ 16, tối đa 2 dòng). Không có cái này thì bài 3 nhóm (như `nui-song-va-bien/03`) không đủ chỗ cho kệ 2 cột.
- Xem to: tờ `giay` bo 22 (Explorer) / 10 (Discoverer), mép 10, lớp dưới lệch (6, 8) xoay 1,6° (gỉ đồng / nâu đất); ảnh `.fit` trọn ảnh, rộng tối đa 330 (iPhone) / 520 (iPad), cao tối đa 460 / 640; tên EN Phudu 34 / 30 (iPad 40), VI Be Vietnam Pro 22 `chu_phu`; loa và đóng = vùng chạm nhóm tuổi; lớp mờ `than_tre` 66 %.
- Món nhấc: ×1,08, nghiêng −3°, bóng `offset_accent` + bóng rơi (0, 14, blur 18, 38 %); khi vào vùng giỏ thu còn ~0,7 cỡ ô kệ để lộ ô vàng hoè. Chỗ lõm: `diep_tham` + `sunken`.
- Giỏ sáng: ×1,03 + mảnh vàng hoè lệch (7, 8). Ô kế tiếp: đĩa `vang_hoe` bằng ô đầy (96 / 88), giữa lõm, ×1,08. Vùng nhận thả = khung giỏ nới 16 pt. Giỏ đầy: không sáng, không ô vàng hoè.
- Bàn tay gợi ý: 6 mảnh giấy (ống tay gỉ đồng), 60×79 iPhone / 80×105 iPad; vòng chạm vàng hoè 56 + 32; số 1, 2 trên triện than tre 30. Đã xuất (xem mục Asset).

**Chuyển động**
- Mở xem to 320 ms (`lay`), lớn lên từ khung ô (`matchedGeometryEffect`), lớp mờ 200 ms; đóng 240 ms về ô, ngắt giọng.
- Nhấc: giữ ≥ 0,3 s, lệch ≤ 10 pt (lệch hơn trước đó là cuộn); nhấc 160 ms, rung `.light`. Vào giỏ: sáng 120 ms, rung `selectionChanged`.
- Thả trên giỏ: bay vào ô 220 ms rồi `pop`; ô kệ hiện lại với triện `stamp`. Thả ngoài / giỏ đầy / huỷ: trượt về 280 ms (`lay`); giỏ đầy thì bong bóng `slide`.
- Gợi ý: tay vào 300 ms → chạm 0,4–1,0 s → giữ, nhấc 1,2–1,5 s → kéo 1,5–2,5 s → thả 2,5–2,9 s; 2 lượt rồi mờ đi; là chuyển động lặp duy nhất của màn (mascot không lắc); bé chạm là dừng.
- Giảm chuyển động: tắt hết preset; ngoại lệ duy nhất là xem to mở/đóng mờ dần 150 ms (ticket yêu cầu). Kéo vẫn theo ngón tay; thả sai thì món hiện lại ngay tại ô; bàn tay gợi ý là hình tĩnh như `x59-hint`.

**VoiceOver:** như mục 5 của ticket; thêm: màn xem to là `.isModal`, tiêu điểm ảnh → loa (“Nghe tên”) → Đóng; đóng thì tiêu điểm về ô vừa mở; lớp mờ ẩn với VoiceOver; sau thao tác “Bỏ vào giỏ” đọc lời nhắn mới bằng announcement.

**Đã chốt (Duy 19/11):** chip nhóm chia đều một hàng khi có 3 nhóm; iPad bài ≤ 6 món 3 cột ô 150; lớp mờ than tre 66 %; Giảm chuyển động chỉ giữ mờ dần 150 ms cho xem to; triện 40 ở góc tờ xem to khi món đã trong giỏ (khung `x59-zoom-in`). Câu gợi ý trong `x59-hint` vẫn là chữ tạm tới khi content-editor viết.

**Asset cho ios-dev (designer 19/11)**
- `design/play-ui/export/hint-hand/ArtHintHand.imageset/`: chép nguyên cả thư mục vào `apps/ios/ScienceKids/Resources/Assets.xcassets/Art/`. PNG @2x (136×178) và @3x (204×267), nền trong suốt, bóng paperE nướng sẵn, nên không thêm bóng trong app. Cỡ 68×89 pt (đã gồm lề bóng). Đầu ngón trỏ ở (26, 5) pt tính từ góc trên trái: đặt điểm này trùng tâm vòng chạm hoặc tâm món đang kéo. Trên iPad vẽ ×1,33 (≈ 90×118 pt). Asset này là PNG, không phải SVG như các Art khác, vì bóng của từng mảnh không dựng lại được bằng một `.paperDropShadow`.
- `design/play-ui/export/hint-hand/ArtHintHand.webp`: bản @3x lossless cho Android sau này.
- Nguồn: `design/play-ui/export/hint-hand/hint-hand.svg`. Xuất lại bằng `sh design/play-ui/export/hint-hand/export.sh` (Chrome headless, cùng cách `design/brand/export.sh`).
- Vòng chạm vàng hoè (56 + 32, mờ 45 / 70 %) và triện số 1, 2 do app vẽ, không có trong asset.
- Triện 40 trên tờ xem to: đỏ son `do_son`, dấu tích 22, nghiêng −8°, chồm ra ngoài mép tờ (top −10, right −9), bóng `stamp`. Triện hiện cùng tờ, không chạy `stamp` lúc mở.

## Duy duyệt thiết kế (19/11)

Duy: "Duyệt, làm đi". Năm điểm "Tạm chốt để vẽ" giữ nguyên. Các câu designer hỏi chốt theo đề xuất designer: chip nhóm chia đều một hàng khi bài có 3 nhóm; iPad bài ≤ 6 món 3 cột ô 150; lớp mờ than tre 66%; Giảm chuyển động: xem to mở/đóng mờ dần 150 ms (ngoại lệ duy nhất); triện 40 ở góc tờ xem to khi món đã trong giỏ. Trạng thái → in_progress. Việc: content-editor viết câu gợi ý EN/VI; designer xuất bàn tay WebP; dev bộ clip giọng chữ giao diện (TTS, nhúng app); ios-dev làm; tester kiểm.

## Chữ (content-editor 19/11)

Bản nháp, chờ Duy duyệt. Key theo tiền tố đang dùng trong `Localizable.xcstrings` (`lesson.play.*`). Câu gợi ý (mục A) là chữ mascot: in và đọc theo `language_mode` / `voice_mode` của hồ sơ như lời nhắn của bài (Explorer "Cả hai" in EN + VI; Discoverer "Cả hai" in EN), nên cần đủ EN và VI ở mọi key, và cần clip giọng (dev, câu hỏi mở 4). Nhãn VoiceOver (mục B) theo ngôn ngữ máy như các nhãn VoiceOver hiện có.

Chọn chữ: "ô tròn / circle" là thứ bé nhìn thấy (ô trống của giỏ là đĩa tròn ở cả hai nhóm tuổi); không gọi "giỏ / tray / mâm" trong lời mascot, theo luật chung của `messages` trong `content/TEMPLATE.md` (lời nhắn không gọi tên vật chứa). Câu 1 khớp bàn tay số 1 (chạm), câu 2 khớp bàn tay số 2 (giữ rồi kéo).

**A. Lời mascot**

| Key | Nhóm | EN | VI |
| --- | --- | --- | --- |
| `lesson.play.hint.first.explorer` | Explorer | Tap a picture to see it bigger. Hold and drag it into a circle. | Em chạm vào hình để xem to. Em giữ hình rồi kéo vào ô tròn. |
| `lesson.play.hint.first.discoverer` | Discoverer | Tap a picture to see it up close. To pick it, hold and drag it to a circle. | Em chạm vào hình để xem to hơn. Muốn chọn, em giữ hình rồi kéo vào ô tròn. |
| `lesson.play.hint.again.explorer` | Explorer | Let's pick now! Hold one and drag it into a circle. | Chọn thôi nào! Em giữ một hình rồi kéo vào ô tròn nhé. |
| `lesson.play.hint.again.discoverer` | Discoverer | Ready to choose? Hold a picture and drag it to a circle. | Em chọn được chưa? Em giữ một hình rồi kéo vào ô tròn nhé. |

Đếm chữ EN mỗi câu: Explorer 6 · 7 và 3 · 8 (≤ 8); Discoverer 8 · 10 và 3 · 8 (≤ 10). Nếu Duy muốn một bản chung cho hai nhóm thì dùng bản Explorer cho cả hai.

Ghi chú cho ios-dev: lời `hint.again` phát sau khi màn xem to lần thứ ba **đóng**, không chồng lên giọng đọc tên món; mỗi lượt tối đa một lần, như mục 4. Sau `hint.first` / `hint.again`, bong bóng trở về lời nhắn đang có của bài.

**B. Nhãn VoiceOver**

| Key | Dùng ở | EN | VI |
| --- | --- | --- | --- |
| `lesson.play.a11y.zoom` | Tên thao tác mặc định của món trên kệ (chạm đúp) | See it bigger | Xem to |
| `lesson.play.a11y.shelf_hint` | Hint của món trên kệ | Double-tap to see it bigger. | Chạm hai lần để xem to. |
| `lesson.play.a11y.pick` | Thao tác tuỳ chỉnh, món chưa chọn | Pick it | Chọn |
| `lesson.play.a11y.unpick` | Thao tác tuỳ chỉnh, món đã chọn (trên kệ) | Remove it | Bỏ chọn |
| `lesson.play.a11y.picked` | Value của món đã chọn (kệ và tờ xem to có triện) | Picked | Đã chọn |
| `lesson.play.a11y.zoom_speaker` | Nút loa trong màn xem to | Hear the name | Nghe tên |
| `lesson.play.a11y.zoom_close` | Nút đóng màn xem to | Close | Đóng |
| `lesson.play.remove %@` (có sẵn, giữ) | Món trong giỏ | Remove %@ | Bỏ chọn %@ |

Ảnh trong màn xem to: nhãn là tên món lấy từ nội dung, không cần key. Bàn tay gợi ý và lớp mờ ẩn với VoiceOver.

Ba điểm khác ticket mục 5, đề xuất PM xét:
1. **"Chọn / Bỏ chọn" thay cho "Bỏ vào giỏ / Bỏ ra khỏi giỏ"**: VoiceOver hiện gọi giỏ là "Em đã chọn: 1 trên 3 chỗ" (`lesson.play.tray_a11y`) và món trong giỏ là "Bỏ chọn …" (`lesson.play.remove`), chưa chỗ nào gọi là "giỏ". Dùng "Chọn / Bỏ chọn" cho khớp chữ có sẵn. Nếu Duy vẫn muốn chữ "giỏ": EN "Put in your picks" / "Take out of your picks", VI "Bỏ vào giỏ" / "Bỏ ra khỏi giỏ"; khi đó nên đổi luôn `tray_a11y` cho cùng một tên.
2. **Hint chỉ một câu "Chạm hai lần để xem to."**: ticket ghi thêm "Vuốt lên hoặc xuống để bỏ vào giỏ", nhưng vuốt lên/xuống chỉ chọn thao tác, phải chạm đúp nữa mới làm; câu đó dễ làm người dùng hiểu sai. VoiceOver đã tự đọc "Có tác vụ" (Actions available) khi món có thao tác tuỳ chỉnh, nên bỏ câu thứ hai.
3. Ticket mục 5 ghi món trong giỏ "giữ nhãn 'Bỏ ra …' hiện có"; nhãn thật trong app là "Bỏ chọn …" (EN "Remove …"). Chỉ sửa cách ghi trong ticket, không đổi app.

**C. Kiểm chữ `full` / `has_limited` với tương tác mới** (chỉ báo, chưa sửa bài)

- Phạm vi: 99 file bài trong `content/` (cộng `content/TEMPLATE.md`) có `messages.full` "No more room! Tap one to take it off." / "Hết chỗ rồi! Em chạm vào để bỏ ra nhé." và nhiều bài Discoverer có `has_limited` dạng "… Tap it to take it off." (khủng long, bề mặt Trái Đất, não bộ…); `an-uong-lanh-manh/02` dùng "Your tray is full! Tap a food to take it off."
- Kết luận: **còn đúng** với phương án đã chốt (chạm món **trong giỏ** vẫn bỏ ra; kéo ra chỉ là cách thêm). Không cần sửa bài, không cần đọc lại TTS.
- Một rủi ro nhỏ: trước đây chạm món có triện **trên kệ** cũng bỏ ra; nay chạm trên kệ mở xem to. Bé nghe "Tap one to take it off" có thể chạm món trên kệ và thấy ảnh phóng to thay vì món ra khỏi giỏ. Đề xuất cho ios-dev/designer (không phải sửa chữ): khi đang phát `full` hoặc `has_limited`, các món trong giỏ nhún nhẹ một lần để chỉ chỗ cần chạm (Giảm chuyển động: không nhún). Nếu thử với trẻ thật mà vẫn nhầm, lúc đó mới tách ticket sửa chữ (ví dụ "Tap one in the circles to take it off").
- `lesson.play.tray_label` "Your picks · tap one to take it off" hiện không hiện trên màn (bỏ từ SK-043), chữ vẫn đúng nếu dùng lại.
- Không có lời `start` / `prompt` của khối `build_tray` nào nói "Tap …" để chọn (các câu "Tap each picture" thuộc màn Học), nên không có chữ nào trong bài mâu thuẫn với "chạm để xem to".

## Ghi chú dev (19/11)

Câu hỏi mở 4 phương án (a): bộ clip giọng cho chữ giao diện, sinh bằng `content-cli`, nhúng trong app. Chỉ thêm, không đổi schema nội dung, gói bài, RPC hay `apps/ios`.

**Nguồn chữ: `content/ui-voice/strings.json`** (trong git). Chọn chỗ này vì chữ do content-editor viết (vùng `content/`), nhưng không thuộc bài nào nên không vào markdown bài hay content pack (technical-plan B4: gói chỉ mang topic/bài). Key trùng key `Localizable.xcstrings` (`lesson.play.hint.first.explorer`…), mỗi key đủ `en` và `vi` (và `ticket`, `note` tuỳ chọn). Hiện có 4 key của bảng A. Câu đang là bản nháp content-editor (chờ Duy duyệt); Duy sửa câu thì sửa file này rồi chạy lại lệnh, ios-dev chỉ cần build lại app.

**Lệnh** (từ gốc repo): `npm --prefix tools/content-cli run ui-voice -- build` (tuỳ chọn: `--lang en|vi|en,vi`, `--force`, `--no-review`, `--review-dir`, `--source`, `--out`, `--cache`, `--no-self-check`).
- Sinh đúng đường của `tts`: cùng chuẩn hoá EN/VI, cùng giọng (Kokoro-82M fp32 `af_heart` EN; VieNeu-TTS v3 Turbo giọng Kim Thanh VI), cùng chuẩn âm lượng, m4a AAC mono (EN 24 kHz, VI 48 kHz như clip bài), cùng khoá cache và cache `content/.audio`; VI tự kiểm Whisper và đổi seed như `tts --lang vi`. Mỗi câu (EN, VI) là một clip trọn câu, như lời nhắn trong bài (không tách theo câu nhỏ).
- Lần chạy 19/11: sinh 8 clip, tự kiểm VI 4 clip không bị đánh dấu; chạy lại: dùng lại 8/8 từ cache, `manifest.json` giống từng byte.

**Đầu ra `content/.build/ui-voice/`** (ngoài git, như gói bài):
- `<key>.<lang>.m4a`, vd `lesson.play.hint.first.explorer.en.m4a`, `lesson.play.hint.first.explorer.vi.m4a` (8 file, tổng ≈ 350 KB).
- `manifest.json` (`format: science-kids/ui-voice@1`): `clips[<key>][en|vi] = { file, sha256, bytes, duration_ms, text, read }`, cộng `engines`, `source`, `source_sha256`. Không có ngày giờ.
- Nghe thử: `content/.build/tts/sk059/review-ui-voice-en.m4a` (18,9 s) và `review-ui-voice-vi.m4a` (23,1 s), kèm `.txt` mốc thời gian.

**Cho ios-dev (cách nạp)**
- Nhúng cả thư mục vào bundle thành `ui-voice/`, cùng kiểu "Embed content pack" (SK-016): thêm biến `SK_UI_VOICE_DIR: $(SRCROOT)/../../content/.build/ui-voice` và một bước script chép thư mục (hoặc mở rộng `scripts/embed-content-pack.sh`); thiếu thư mục thì cảnh báo build, không lỗi.
- Tra clip: `Bundle.main.url(forResource: "\(key).\(lang)", withExtension: "m4a", subdirectory: "ui-voice")`, `lang` = `en`/`vi`. Không cần đọc `manifest.json` để phát; đọc nó nếu muốn `duration_ms` hay kiểm sha256 trong test.
- Chọn thứ tiếng theo `voice_mode` của hồ sơ như lời nhắn bài (cùng đường phát của AudioKit); chữ in lấy từ `Localizable.xcstrings` cùng key. Thiếu file (chưa chạy lệnh) → chỉ in chữ, không crash; ghi analytics nội bộ nếu có sự kiện tương ứng.
- Khi thêm key giọng mới: content-editor thêm vào `strings.json` và `Localizable.xcstrings` cùng lúc, rồi chạy lại lệnh.

**Code**: `tools/content-cli/src/ui-voice/source.ts` (đọc, kiểm nguồn, manifest), `src/ui-voice/command.ts` (lệnh), `src/cli.ts` (lệnh `ui-voice build`, trợ giúp), `package.json` (script `ui-voice`), `src/tts/command.ts` (chỉ `export` các hàm `render`, `entryFor`, `checkAndRetry`, `checkFromEntry` và kiểu `Clip` để dùng lại, không đổi logic), `README.md`, test `test/ui-voice.test.ts` (9 test). `npm test` 410/410 xanh, `npm run typecheck` sạch.

**Tester kiểm**: nghe hai file review (EN rõ, đúng giọng bài; VI không méo chữ "kéo", "ô tròn", "giữ"); `manifest.json` có 4 key × 2 thứ tiếng, sha256 khớp file; chạy lại lệnh không sinh mới.

## Ghi chú ios-dev (19/11)

**Đã làm** (một `PlayStep` cho cả Explorer và Discoverer; không đổi engine, test vector, schema):
- **Xem to** (`Views/PlayZoom.swift`, `PlayZoomSheet`):
  - Lớp mờ than tre 66 %; tờ giấy bo theo nhóm tuổi; lớp dưới gỉ đồng hoặc nâu đất lệch (6, 8) xoay 1,6°.
  - Ảnh trọn, không cắt: thêm `ContentPicture.Box.whole(maxHeight:)` và `wholeSize`, tối đa 330 × 460 trên iPhone, 520 × 640 trên iPad.
  - Tên EN (Explorer "Cả hai" thêm dòng VI), loa và nút đóng bằng vùng chạm nhóm tuổi.
  - Món đã chọn có triện 40 nghiêng −8°, chồm ra góc tờ. Mở tờ thì đọc tên một lần; đóng tờ thì ngắt giọng.
  - Chạm lớp mờ là đóng, chạm vào tờ không đóng.
  - VoiceOver: tờ là modal, tiêu điểm vào ảnh, cử chỉ thoát đóng tờ.
  - Mở/đóng: phóng 320 ms / 240 ms. Giảm chuyển động: chỉ mờ dần 150 ms.
- **Kéo thả** (`PlayStep`):
  - Cử chỉ SwiftUI: nhấn giữ 0,3 s, lệch không quá 10 pt, rồi kéo. Không dùng drag hệ thống, nên món không ra khỏi app được.
  - Khi nhấc: món ×1,08, nghiêng −3°, bóng `offset_accent`; rung `.light`. Ô gốc trên kệ còn lại chỗ lõm.
  - Qua giỏ: giỏ ×1,03 với mảnh vàng hoè lệch (7, 8), ô trống kế tiếp vàng hoè ×1,08, món thu còn ×0,7, rung `.selection`. Vùng nhận thả là khung giỏ nới 16 pt.
  - Thả trên giỏ gọi `LessonSession.addToTray` (bọc `tapTrayItem`, không đảo chiều món đã có). Giỏ đầy: lời nhắn `full`, món trượt về 280 ms. Giảm chuyển động: món hiện lại ngay tại ô.
  - Kéo món trong giỏ ra ngoài → `removeFromTray`. Chạm món trong giỏ vẫn bỏ ra như cũ.
  - Món đã chọn không nhấc được từ kệ. Lúc đang kéo thì trang khoá cuộn.
- **Kệ** (`PlayShelfLayout`): theo luật designer, iPhone ≤ 6 món 2 cột cao (chỗ còn − khe) ÷ hàng, kẹp 96…132, dưới 96 thì 3 cột; > 6 món 3 cột. iPad 3 cột ô 150 / 4 cột ô 124. Chip nhóm chia đều một hàng khi ≤ 3 nhóm (chấm 24, tối đa 2 dòng).
- **Gợi ý** (`PlayHintState`, `PlayHintStore`):
  - Cờ lưu ở `Application Support/lessons/play_hint_seen.json` (chỉ id hồ sơ), không gửi server, không dùng UserDefaults.
  - Lần đầu mỗi hồ sơ: bong bóng `hint.first.*` kèm bàn tay `ArtHintHand` (đầu ngón ở (26, 5), iPad ×1,33) và vòng chạm vàng hoè 56: chạm rồi kéo từ món đầu kệ vào giỏ, 2 lượt rồi mờ đi. Giảm chuyển động: hình tĩnh 6 s.
  - Giọng: clip gợi ý rồi lời mở màn của bài, phát một lượt.
  - Sau 3 lần đóng tờ xem to mà chưa chọn: `hint.again`, một lần trong lượt, phát sau khi tờ đóng. Bé chạm hoặc kéo thì gợi ý dừng.
- **Chữ**: các khoá `lesson.play.hint.*` và `lesson.play.a11y.*` đúng bảng A, B của content-editor. Bản VI của gợi ý đọc từ `vi.lproj`, nên Explorer "Cả hai" in EN + VI bất kể ngôn ngữ máy.
- **Giọng chữ giao diện** (dev 19/11):
  - Bước "Embed content pack" chép `SK_UI_VOICE_DIR` (`content/.build/ui-voice`) vào bundle thành `ui-voice/`; thiếu thì chỉ cảnh báo.
  - `AudioKit.UIVoiceCatalog` đọc `manifest.json`; `UIVoiceClips` kiểm sha256 rồi nhường cho clip của gói; `AppModel` dùng làm `speech.loader`. Clip đi theo `voice_mode` như lời nhắn bài.
- **VoiceOver**: món trên kệ đọc tên, hint "Chạm hai lần để xem to.", value "Đã chọn", thao tác tuỳ chỉnh "Chọn" / "Bỏ chọn". Sau thao tác, lời nhắn mới được đọc bằng announcement.
- **Nhún nhẹ**: các món trong giỏ nhún một lần khi lời nhắn là `full` hoặc `has_limited` (đề xuất content-editor). Giảm chuyển động: tắt.
- **Asset**: `ArtHintHand.imageset` chép nguyên vào `Assets.xcassets/Art/`.

**Kết quả.**
- Unit test, iPhone 16, một lần, bỏ UI test: **436/436 pass**.

  | Bộ test | Pass |
  | --- | --- |
  | ScienceKidsTests | 95 |
  | DesignSystemTests | 61 (+2 `WholePictureTests`) |
  | ContentModelTests | 28 |
  | LessonEngineTests | 19 |
  | ContentKitTests | 51 |
  | LessonPlayerTests | 125 (+13 `PlayShelfTests`: số cột, payload, vùng thả, hiệu ứng thả, gợi ý, cờ theo hồ sơ, add/remove/full của session) |
  | AudioKitTests | 17 (+3 `UIVoiceTests`) |
  | ProfilesTests | 22 |
  | SyncTests | 18 |

- Chạy thử trên iPhone 16, `nui-song-va-bien/03` (6 món) và `nui-song-va-bien/06` (8 món), đều đạt: gợi ý lần đầu (chữ, giọng, bàn tay); chạm mở xem to; giữ rồi kéo vào giỏ; giỏ sáng lúc đang kéo; thả ngoài thì trượt về; giỏ đầy thì `full` và món về; kéo ra khỏi giỏ; món đã chọn mở xem to có triện; nhắc lại sau 3 lần xem to; vuốt dọc vẫn cuộn; kéo từ hàng cuối khi trang đã cuộn.

**Lệch hoặc chưa làm.**
1. **Kệ 2 cột gần như không bao giờ xảy ra trên iPhone 16** khi chế độ "Cả hai". Phần trên kệ (header, bong bóng hai thứ tiếng, giỏ, chip) đã tới khoảng y 540; chỗ còn lại khoảng 180 pt, trong khi 2 cột × 3 hàng cần ít nhất 308 pt. Vì vậy luật kẹp đưa về 3 cột, đúng luật designer. Cần designer hoặc Duy chọn: chấp nhận 3 cột; hoặc cho 2 cột và để màn cuộn; hoặc thu nhỏ bong bóng hay giỏ.
2. Mở xem to bằng phóng + mờ dần từ giữa màn, chưa có `matchedGeometryEffect` lớn lên từ ô. Khi đóng, tiêu điểm VoiceOver chưa trở về ô vừa mở.
3. Bàn tay gợi ý chưa có triện số 1, 2. Món nhấc lên thả vào giỏ không có đoạn "bay vào ô 220 ms + `pop`": món biến mất và đĩa trong giỏ hiện bằng `pop` sẵn có.
4. Tên thao tác mặc định "Xem to" (`lesson.play.a11y.zoom`) đã có khoá nhưng chưa gắn được: SwiftUI không đổi tên được thao tác kích hoạt của `Button`.
5. **UI test chưa sửa**: `LessonUITests`, `IPadLayoutUITests`, `SyncUITests`, `SK047ShotsUITests`, `AudioUITests` vẫn chạm món trên kệ để chọn, nên sẽ đỏ. Cần một helper kéo (`press(forDuration:thenDragTo:)`) và một test thao tác VoiceOver. Chưa chạy UI test.
6. Chưa kiểm trên máy: iPad (3/4 cột, khung 600), Giảm chuyển động, VoiceOver thật (simulator không có VoiceOver).

- **Duy 19/11 sau chạy thử:** kệ phải 2 cột khi ≤ 6 món trên iPhone (cả chế độ "Cả hai") — thu nhỏ phần trên kệ (bong bóng, giỏ, chip) thay vì rơi về 3 cột. Không cho màn cuộn khi kéo. Designer ra spec, ios-dev làm.

## Ghi chú designer — lượt 2 (19/11): phần trên kệ gọn, kệ ≤ 6 món luôn 2 cột trên iPhone

Duy chốt sau chạy thử: kệ ≤ 6 món luôn 2 cột trên iPhone, kể cả chế độ "Cả hai", không cuộn. Canvas: `Explorer-A.html`, khung `x59-shelf2` (giỏ trống) và `x59-shelf2-done` (giỏ đạt). Hai khung dựng theo lề thật của iPhone 16: trên 59 + 18, dưới 34 + 22, còn 719 pt cho nội dung (khung canvas 844 còn 711).

**Ngân sách dọc, Explorer, iPhone (pt)**

| Khối | Cũ (đo trên ảnh chạy thử) | Mới |
| --- | --- | --- |
| Header | 72 | 72. Bạn đồng hành 56 chuyển vào chỗ trống 72 bên phải header (đã có `Color.clear` 72 trong `ExplorerStepHeader`), canh đáy. Hàng lời nhắn không còn ảnh bạn đồng hành. |
| Hàng lời nhắn | ~145 | **112**: bong bóng + cột loa. |
| Giỏ | ~123 | **88** |
| Chip nhóm | 72 | 72, một hàng |
| Khe giữa các khối | 12 | **10** (4 khe = 40) |
| Phần trên kệ | ~452 | **384** |
| Kệ (iPhone 16 / 16e / SE) | ~180 | 335 / 339 / 223 |

**Hàng lời nhắn (chỉ màn Chơi)**
- Bong bóng rộng = màn − 40 − 80, khoảng 270. Đuôi bong bóng ở góc trên phải, bo `16 4 16 16`, hướng lên bạn đồng hành ở header. Lề trong 9/12/10; cao tối thiểu 112.
- Dòng EN: Be Vietnam Pro 17/22, đậm 700, `than_tre`.
- Dòng VI: 15/20, thường 400, `chu_phu`.
- Mỗi thứ tiếng `lineLimit(2)` và `minimumScaleFactor(0.85)`.
- Đã đo toàn bộ 403 lời nhắn Explorer: EN dài nhất 49 ký tự, luôn vừa 2 dòng. VI có 8/403 câu trên 68 ký tự (dài nhất 79), co về 0,85 là vừa. Câu gợi ý EN 63 ký tự cũng vừa khi co.
- Không ẩn dòng VI sau khi đọc: luật Explorer "Cả hai" in hai thứ tiếng, và bé đọc lại bong bóng khi kéo. Ẩn đi thì bong bóng nhảy cao thấp giữa lượt.
- Ở chế độ một thứ tiếng: bong bóng chỉ một khối chữ, vẫn cao tối thiểu 112 để kệ không nhảy giữa các bài. Kệ dư chỗ thì ô cao thêm, kẹp ở 132.
- Cột phải rộng 72: loa 72 gỉ đồng ở trên, cách 4, nút VI 72×36 ở dưới (khung `vib` hiện có).

**Giỏ**
- Bầu dục cao 88, bo 44, nửa dưới tối như cũ.
- Đĩa có món 78 (ảnh + vành giấy 5), ô trống 70, cách 8. Giỏ 3 chỗ rộng 250, vừa cả khi có mũi tên bên cạnh.
- Khi kéo: món ×0,7 và ô trống kế tiếp vàng hoè ×1,08 giữ như cũ, nhưng tính theo đĩa 78.

**Mũi tên sang Quiz khi giỏ đạt** (khung `x59-shelf2-done`)
- Không để ở `BottomBar` nữa: ở đó nó lấy khoảng 86 pt của kệ, và luật "không cuộn" sẽ vỡ đúng lúc bé đã làm xong.
- Mũi tên là nút hai lớp đỏ son 72×80, đặt bên phải giỏ, cách 10. Bầu dục co lại nhường chỗ trong 320 ms (`lay`), mũi tên bật ra (`pop`). Giảm chuyển động: đổi ngay.
- Áp cho cả kệ 3 cột để hai luật không khác nhau.

**Chip nhóm**
- Một hàng, chia đều, khe 8, cao 72, bo 20, lề ngang 8.
- Chấm 20, cách chữ 6, chữ 15 đậm 700, tối đa 2 dòng.

**Kệ**
- Ô cao = (chỗ còn lại − 2×10) ÷ 3, kẹp 96…132; ô rộng = (rộng − 5 − 11) ÷ 2.
- iPhone 16 (852): ô khoảng 168×105. iPhone 16e (844): khoảng 167×106. Plus/Pro Max: chạm trần 132.
- **iPhone SE (667)**: chỗ còn 223 → 2 cột chỉ được ô 68 → luật kẹp đưa về **3 cột × 2 hàng, ô ≈ 103×106**. Cách này to hơn 2 cột trên SE, nên tôi đề xuất giữ SE là ngoại lệ; xem câu hỏi mở cuối mục.
- Đo chỗ còn lại sau khi bố cục (`GeometryReader` hoặc `ViewThatFits`), không hard-code theo máy.

**Discoverer** (cùng luật, số theo nhóm tuổi)
- Header 56; hàng lời nhắn ≤ 64 (A2 chỉ in EN, ≤ 2 dòng 17/22); giỏ cao 76, đĩa 64, ô trống 58, cách 8 (4 chỗ = 280); mũi tên 56×64 bên phải giỏ; chip 56; khe 10.
- Phần trên kệ ≈ 292, kệ trên iPhone 16 còn khoảng 427, nên ô 2 cột chạm trần 132. SE: ô 2 cột ≈ 92, dưới 96 nên về 3 cột.

**Lớp mờ xem to: giá trị đúng là 66 %, app đang khớp.** Đo điểm ảnh nền: app `p6-zoom.png` = rgb(101, 96, 86); canvas `x59-zoom` = rgb(101, 96, 86). Màu giấy điệp (240, 230, 207) phủ than tre (30, 27, 24): (240 − 101) ÷ (240 − 30) = 0,66. Không đổi giá trị. Màn của app trông nhạt hơn vì bố cục tờ khác canvas, cần ios-dev sửa cho khớp:
- Nút đóng 72 phải nằm **góc trên phải màn**, ngang hàng nút Về. App đang đặt dưới tờ, cạnh loa, đè lên kệ.
- Tên phải **canh trái**, loa 72 **bên phải trong tờ**, cùng hàng tên. App đang canh giữa tên và đặt loa dưới tờ.
- Tờ canh giữa theo chiều dọc vùng an toàn. Dưới tờ không có gì.

**Câu hỏi còn mở (cho Duy)**
- iPhone SE và các máy cao ≤ 700 pt giữ 3 cột × 2 hàng (ô ~103×106, to hơn 2 cột ~170×68), hay ép 2 cột ô 68? Designer đề xuất giữ luật kẹp, tức SE dùng 3 cột.

## Ghi chú ios-dev — lượt 2 (19/11)

**Đã làm** (theo "Ghi chú designer — lượt 2" và Duy chốt kệ ≤ 6 món luôn 2 cột trên iPhone):
- **Phần trên kệ gọn** (`Views/PlayParts.swift`, `PlayLayout`):
  - Bạn đồng hành 56 vào ô bên phải header, canh đáy.
  - Bong bóng `PlayBubbleRow` cao tối thiểu 112 (Discoverer 64), đuôi ở góc trên phải; dòng EN 17/22 đậm, dòng VI 15/20 `chu_phu`; mỗi thứ tiếng tối đa 2 dòng, co tới 0,85. Bên phải: loa 72, dưới loa nút VI 72×36 (Discoverer 56×28).
  - Giỏ là hình viên thuốc cao 88: đĩa có món 78, ô trống 70, khe 8; giỏ 3 chỗ rộng 250 (Discoverer: cao 76, đĩa 64, ô trống 58).
  - Khe giữa các khối 10. Chip một hàng cao 72, chấm 20, lề ngang 8, tối đa 2 dòng.
- **Mũi tên sang Quiz** rời `BottomBar`, đứng bên phải giỏ khi đạt: 72×80 (Discoverer 56×64), bật ra kèm cả hàng dời 320 ms; Giảm chuyển động: đổi ngay. Áp cho mọi kệ.
- **Kệ:** chỗ còn lại = đáy vùng an toàn − đỉnh kệ (đo sau bố cục, khi trang chưa cuộn) − 22; ô cao = (chỗ còn − 20) ÷ 3, kẹp 96…132, dưới 96 thì 3 cột (iPhone SE). Đo theo bong bóng lời nhắn của bài, không theo bong bóng gợi ý: lúc gợi ý đang hiện, bong bóng lời nhắn được dựng ẩn để đo. Số cột chốt một lần mỗi màn, không nhảy giữa lượt.
- **Tờ xem to:** nút đóng 72 ở góc trên phải màn, ngang nút Về; tên canh trái, loa 72 bên phải trong tờ; tờ canh giữa vùng an toàn, dưới tờ không có gì. Lớp mờ giữ 66 % (designer đã đo khớp).
- **Lượt trước còn lại:**
  - (2) Đóng tờ xem to thì tiêu điểm VoiceOver về ô vừa mở (`AccessibilityFocusState`).
  - (3) Bàn tay gợi ý có triện than tre 30 ghi số 1 lúc chạm, số 2 lúc giữ và kéo.
  - (4) Thả vào giỏ: món bay vào ô kế tiếp 220 ms rồi mới vào giỏ; Giảm chuyển động: vào ngay.
  - (5) Xem to lớn lên từ đúng ô của nó bằng `.scale(anchor:)` lấy tâm ô trên màn, không dùng `matchedGeometryEffect`. Lý do: ô nằm trong `LazyVGrid` của scroll view và vẫn hiện dưới tờ; dùng hiệu ứng ghép cặp thì phải rút ảnh khỏi kệ khi tờ mở và nối nội dung cuộn với lớp phủ trên vùng an toàn, nhiều rủi ro hơn lợi ích.
- **UI test:**
  - Helper `ScienceKidsUITests/PlayDrag.swift` (`pick` = nhấn giữ 0,6 s rồi kéo vào `lesson.play.tray`; `unpick` = chạm món trong giỏ).
  - Cờ `-SKNoPlayHint YES` (chỉ bản DEBUG) để các UI test không về gợi ý không gặp gợi ý.
  - Đã sửa `LessonUITests`, `IPadLayoutUITests`, `SyncUITests`, `SK047ShotsUITests`, `SK047FlowUITests`, `AudioUITests`.
  - Thêm `SK047FlowUITests.testShelfTapZoomsAndDragPicks`: chạm mở xem to và giỏ không đổi; đóng; kéo để chọn; món đã chọn vẫn mở xem to; thả ngoài giỏ không đổi gì; kéo ra khỏi giỏ là bỏ chọn.

**Kết quả (iPhone 16, một lần).**
- Unit test: 436/436 pass.
- UI test chạy lại sau khi sửa: `testShelfTapZoomsAndDragPicks`, `testDiscovererGoldenFlowWithHintAndRecap`, `testExplorerRecapWithAndWithoutMythCard` pass.
- Lượt chạy cả bộ UI test trước đó, cùng tương tác kéo, layout cũ: 27 pass, 23 fail, 6 skip. Các test của `SK047FlowUITests` và `SK047ShotsUITests` đi qua màn Chơi bằng kéo đều pass.
- Phần lớn 23 fail **dừng trước màn Chơi**, không do SK-059:
  - `LessonUITests`, `AudioUITests`, `IPadLayoutUITests`, `SyncUITests` chờ anchor `lesson.title` và luồng Discoverer cũ (`lesson.check`, `lesson.result.next`) đã đổi từ SK-043/SK-047;
  - `OnboardingUITests` (4) và `SK047FlowUITests.testClosingAtRecapKeepsTheLesson` (tìm chủ đề `new-breathing` trên Trang chủ) lệch theo danh mục.
- Các test này cần một ticket riêng cho tester.
- Chạy thử bài 3 *Núi, sông và biển*, "Cả hai", iPhone 16: kệ 6 món 2 cột, ô khoảng 168 × 105, không cuộn; gợi ý có bàn tay và triện số; kéo được (giỏ sáng); giỏ đạt thì mũi tên hiện bên phải giỏ; tờ xem to đúng bố cục mới.

**Không làm được.** Không có UI test cho thao tác tuỳ chỉnh "Chọn": XCUITest không có API gọi custom accessibility action. Logic của thao tác (`addToTray` / `removeFromTray`, `hint.didPick`) đã có unit test. Thao tác cần tester kiểm bằng VoiceOver trên máy thật.

- **Phiên chính 19/11:** lượt 2 chạy trên iPhone 16 đạt (kệ 2 cột ô ~168×105 ở "Cả hai", unit 436/436, UI test SK-059 3/3). Trạng thái → review. Còn: 23 UI test cũ fail vì luồng mở bài cũ lệch từ SK-043/SK-047 (không do SK-059) → ticket riêng cho tester; kiểm VoiceOver thật, iPad, iPhone SE, Giảm chuyển động.
