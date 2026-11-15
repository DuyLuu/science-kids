---
id: 98212602-8b80-408e-83cd-1a87c8124e0a
topic: ho-hap
slug: tho-khi-chay-nhay
order: 3
stage: apply
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Breathing and exercise
vi: Thở khi chạy nhảy
> Giữ đúng tên ở `syllabus-lessons.md` và `content/syllabus.json` (`new-breathing`, bài số ba).

## Mục tiêu
en: I can say why I breathe faster when I run.
vi: Em giải thích được vì sao khi chạy nhảy, em thở nhanh hơn.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-036, ngày 10/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids` sau bài một và bài hai.
> Bài vận dụng (`apply`): dùng bài một (cơ thể cần ô-xi) và bài hai (không khí vào phổi) để giải thích một điều bé tự thấy (chạy nhảy thì thở nhanh). Kỹ năng khoa học: đếm hơi thở trong một phút, so sánh trước và sau khi nhảy, đọc biểu đồ cột không chữ (syllabus-progression mục 9).
> Bài sửa `only_lungs_need_oxygen` ở ý chính ba, ô Cơ bắp, câu q3 và câu q6 (gắn key, Na nói đúng).
> 14/11 (SK-044, ngân sách chữ Discoverer A2): thêm `feedback` cho mọi lựa chọn sai và `feedback_true/false`; hai lời giải thích còn một câu, bỏ "Yes!" · "Đúng rồi!" và "The answer is…" · "Đáp án là…"; câu hỏi tối đa mười chữ VI, lời Na và câu ô Học một câu tối đa mười hai chữ. Nháp AI.

## Ý chính
1.en: When you run and jump, you breathe faster.
1.vi: Khi em chạy nhảy, em thở nhanh hơn.
2.en: When you rest, your breathing slows down again.
2.vi: Khi em nghỉ, hơi thở chậm lại như cũ.
3.en: Working muscles need more oxygen, so you breathe faster.
3.vi: Cơ bắp khi vận động cần nhiều ô-xi hơn, nên em thở nhanh hơn.
> [CẦN KIỂM] Cách giản lược ở `only_lungs_need_oxygen` (`_topic.md`): phổi lấy ô-xi, tim bơm máu, máu mang ô-xi tới cơ bắp.
> Ba ý đi từ điều bé tự thấy (thở nhanh khi chạy, chậm lại khi nghỉ) tới lý do không nhìn thấy (cơ bắp cần thêm ô-xi).

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md`. Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.
> - w1 ôn bài hai (khoảng một ngày trước): mũi làm ấm và làm sạch không khí.
> - w2 ôn bài một (khoảng hai bài trước): cá cũng thở (`fish_do_not_breathe`, không gắn key), đáp án Sai.

### w1
id: 705c4fe7-12af-46ef-ab64-9ff10e8c94b8
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: ho-hap/duong-di-cua-khong-khi
prompt.en: Which part warms and cleans the air?
prompt.vi: Bộ phận nào làm ấm và làm sạch không khí?
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa
hint.en: Remember the last lesson, The journey of air.
hint.vi: Em nhớ lại bài trước, Đường đi của không khí.
explanation_correct.en: Tiny hairs inside your nose catch dust.
explanation_correct.vi: Lông mũi nhỏ li ti giữ bụi lại.
explanation_wrong.en: Your nose warms the air and cleans it.
explanation_wrong.vi: Mũi làm ấm và làm sạch không khí.
> Câu giữ đúng ý câu của ô Mũi bài hai. Gợi ý chỉ tên bài, không nói chặng nào. Ba lựa chọn là ba bản tô màu của sơ đồ đường thở bài hai, cùng nét. Đáp án ở chỗ thứ hai.

#### option w1_lungs
correct: false
feedback.en: Air is already clean when it reaches the lungs.
feedback.vi: Không khí tới phổi thì đã được làm sạch rồi.
label.en: lungs
label.vi: phổi
image.brief: Dùng lại hình `explore_lungs` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A body drawing with the lungs coloured
image.alt.vi: Hình vẽ cơ thể, tô màu hai lá phổi

#### option w1_nose
correct: true
label.en: nose
label.vi: mũi
image.brief: Dùng lại hình `explore_nose` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A body drawing with the nose coloured
image.alt.vi: Hình vẽ cơ thể, tô màu phần mũi

#### option w1_windpipe
correct: false
feedback.en: The windpipe is a tube that carries air down.
feedback.vi: Khí quản là ống đưa không khí xuống phổi.
label.en: windpipe
label.vi: khí quản
image.brief: Dùng lại hình `explore_windpipe` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A body drawing with the windpipe coloured
image.alt.vi: Hình vẽ cơ thể, tô màu khí quản

### w2
id: c83a0009-cfc9-48dc-b125-bebbe0bf55cb
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: ho-hap/vi-sao-ta-phai-tho
prompt.en: Only animals on land need to breathe.
prompt.vi: Chỉ những con vật sống trên cạn mới cần thở.
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu
answer: false
hint.en: Remember the Animals card in the first lesson.
hint.vi: Em nhớ lại ô Con vật ở bài đầu tiên nhé.
explanation_correct.en: Shrimp and fish in water breathe with gills too.
explanation_correct.vi: Tôm, cá dưới nước cũng thở bằng mang.
explanation_wrong.en: Fish breathe in water with their gills.
explanation_wrong.vi: Cá thở dưới nước bằng mang.
feedback_true.en: Animals in water and in the sky breathe too.
feedback_true.vi: Con vật dưới nước, trên trời cũng thở.
> Câu khẳng định có chữ "only" (không phải câu phủ định). Hình câu hỏi là con trâu (con vật trên cạn), không dùng ảnh cá: ảnh cá là bằng chứng của đáp án Sai.
> Giải thích khi đúng không mở đầu bằng "Yes!" (đáp án Sai).
> Rà chữ tester 10/11 (N5): gợi ý cũ "Remember the fish in the first lesson." nêu thẳng phản ví dụ. Gợi ý mới chỉ tên ô, theo mẫu câu w1 bài hai.

## Học

> Bốn ô, từ cụ thể tới trừu tượng, rồi tới ô kỹ năng:
> - Nhanh hơn (ý chính một): chạy nhảy thì thở nhanh hơn, sâu hơn; tim cũng đập nhanh hơn;
> - Nghỉ ngơi (ý chính hai): vài phút sau hơi thở chậm lại; khó thở thì báo người lớn;
> - Cơ bắp (ý chính ba): máu mang ô-xi tới cơ bắp (`only_lungs_need_oxygen`);
> - Thử đếm: đếm số lần thở trong một phút, trước và sau khi nhảy dây, đếm lại theo đúng cách cũ (thí nghiệm so sánh công bằng ở mức đơn giản).
>
> Nhãn ô thứ tư là "Thử đếm", không phải "Đếm hơi thở": câu q2 có thẻ từ "lần thở", gợi ý của q2 không được nhắc chữ đó.

### explore
id: 6c8bd40c-e508-40ec-8f0a-d3d1a79ef719
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_faster
label.en: Faster
label.vi: Nhanh hơn
color: do_son
sentence.en: Run and jump, and you breathe faster and deeper.
sentence.vi: Khi chạy nhảy, em thở nhanh hơn và sâu hơn.
image.brief: [ảnh] Bóng mấy bạn nhỏ đang chạy chơi ngoài trời lúc hoàng hôn, chụp ngược sáng từ xa nên chỉ thấy dáng đen; không nhận ra mặt ai, không có chữ, không có logo. Câu q6 và từ exercise dùng lại ảnh này. Từ khoá tìm ảnh (EN): children silhouettes playing sunset
image.alt.en: Children playing at sunset
image.alt.vi: Các bạn nhỏ chơi đùa lúc hoàng hôn
> Theo hình designer chọn (SK-036, designer 10/11): ảnh public domain của Cục Lưu trữ Quốc gia Mỹ (bộ ảnh EPA Documerica), trẻ chơi đùa lúc hoàng hôn, không phải cảnh đá bóng; brief và `alt` sửa theo, ở cả câu q6 và từ `exercise`.
examples.1.en: skipping
examples.1.vi: nhảy dây
examples.2.en: kicking a shuttlecock
examples.2.vi: đá cầu
examples.3.en: running a race
examples.3.vi: chạy thi
examples.4.en: your heart beats faster, too
examples.4.vi: tim em cũng đập nhanh hơn
> Ba trò chơi quen ở sân trường Việt Nam. Ví dụ bốn chỉ nói tim đập nhanh hơn, không giải thích (để dành *Hệ tuần hoàn*).

#### group explore_rest
label.en: Rest
label.vi: Nghỉ ngơi
color: cham
sentence.en: When you sit and rest, your breathing slows down.
sentence.vi: Ngồi nghỉ một lúc, hơi thở em chậm lại như cũ.
image.brief: [hình vẽ] Một chiếc ghế đá hoặc ghế gỗ dưới bóng cây lớn trong sân trường hay công viên, trên ghế có một chai nước không nhãn; không có người, không có chữ. Từ khoá tìm ảnh (EN): bench under shade tree park
image.alt.en: A bench in the shade of a tree
image.alt.vi: Chiếc ghế dưới bóng cây
examples.1.en: sit in the shade
examples.1.vi: ngồi trong bóng mát
examples.2.en: drink some water
examples.2.vi: uống một chút nước
examples.3.en: breathing slows in a few minutes
examples.3.vi: vài phút sau, hơi thở chậm lại
examples.4.en: if it is hard to breathe, tell a grown-up
examples.4.vi: thấy khó thở thì báo ngay cho người lớn
> [CẦN KIỂM, chuyên môn y khoa] Ví dụ bốn là lời khuyên an toàn chung, không thay lời bác sĩ (mục An toàn ở `_topic.md`). Bé bị hen suyễn có thể khó thở khi chạy; câu không nói "thở nhanh là bình thường" cho mọi trường hợp. Ví dụ ba [CẦN KIỂM]: sau vận động vừa, nhịp thở về gần như lúc nghỉ trong vài phút (biên tập nhớ).

#### group explore_muscles
label.en: Muscles
label.vi: Cơ bắp
color: vang_hoe
sentence.en: Working muscles need more oxygen, and blood brings it.
sentence.vi: Cơ bắp vận động cần thêm ô-xi, máu mang ô-xi tới.
image.brief: [hình vẽ] Đôi chân một người đang chạy trên đường chạy, vẽ cận từ đầu gối xuống, thấy rõ bắp chân; không thấy mặt, giày không có logo, không có chữ, không có số trên đường chạy. Từ khoá tìm ảnh (EN): runner legs running track close up
image.alt.en: Legs running on a track
image.alt.vi: Đôi chân đang chạy trên đường chạy
examples.1.en: your lungs take in oxygen
examples.1.vi: phổi lấy ô-xi vào
examples.2.en: your heart pumps blood
examples.2.vi: tim bơm máu đi khắp cơ thể
examples.3.en: blood takes oxygen to your legs
examples.3.vi: máu mang ô-xi tới chân em
examples.4.en: your muscles use it to keep going
examples.4.vi: cơ bắp dùng ô-xi để hoạt động tiếp
> Bốn ví dụ đọc liền thành chuỗi: phổi lấy ô-xi, tim bơm máu, máu mang ô-xi tới chân, cơ bắp dùng ô-xi. [CẦN KIỂM] như ý chính ba. Ví dụ hai VI thêm "đi khắp cơ thể" cho câu tiếng Việt tròn ý; EN giữ ngắn.
> Rà chữ tester 10/11 (N2, main session chọn phương án A): ví dụ bốn cũ "so you breathe faster" · "nên em thở nhanh hơn" là đúng vế kết luận của lời Na ở câu q6, nên câu q6 chỉ còn là nhận ra câu đã nghe. Ô vẫn dạy đủ (cơ bắp cần thêm ô-xi, máu mang ô-xi tới chân); bước "vì vậy thở nhanh hơn" để bé tự ghép ở câu q6. Ý chính ba giữ nguyên (ý chính chưa hiện cho bé).

#### group explore_count
label.en: Count
label.vi: Thử đếm
color: gi_dong
sentence.en: Count your breaths before and after you jump.
sentence.vi: Em đếm số lần thở trước và sau khi nhảy.
image.brief: Dùng lại hình `q1` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): hourglass sand timer wooden table
image.alt.en: An hourglass
image.alt.vi: Chiếc đồng hồ cát
examples.1.en: count breaths for one minute
examples.1.vi: đếm số lần thở trong một phút
examples.2.en: skip for one minute
examples.2.vi: nhảy dây một phút
examples.3.en: count again, the same way
examples.3.vi: đếm lại, theo đúng cách cũ
examples.4.en: compare the two numbers
examples.4.vi: so sánh hai con số
> Kỹ năng "so sánh công bằng" ở mức đơn giản: ví dụ ba ("đúng cách cũ": cùng một phút, cùng đếm lần hít vào). Bé có thể làm thử ở nhà cùng bố mẹ. Không đưa con số "bình thường" vào chữ cho trẻ.
> Ảnh đồng hồ cát không có chữ số (khác đồng hồ treo tường).

### new_words
id: 74e8308f-a727-43d8-8739-dfb7e81956e6
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: exercise, muscle, blood

## Chơi

> Bé chọn ba trò chơi làm mình thở nhanh: một trò nhảy, một trò đá, một trò chạy. Đạt khi đủ ba nhóm và không chọn trò nào phải ngồi yên. Chạm hình đã chọn để bỏ ra.
> Trò chơi dùng ngay ô Nhanh hơn và ô Cơ bắp: trò nào làm cơ bắp hoạt động mạnh thì làm em thở nhanh. Ba món bẫy là việc ngồi yên một chỗ, đều là việc vui bé hay làm, nên không có món nào "xấu". Câu cá có sức hút vì là việc ngoài trời.
> Mọi món là ảnh đồ vật của trò chơi, không có người, nên không có mặt trẻ em. Nhãn món là tên trò chơi.

### tray
id: da928152-cf23-4d75-8d21-a5d305f96ee7
type: build_tray
version: 1
prompt.en: Pick three games that make you breathe fast
prompt.vi: Chọn ba trò chơi làm em thở nhanh
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick a jumping, a kicking and a running game.
messages.start.vi: Em chọn một trò nhảy, một trò đá và một trò chạy nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! All three make your muscles work hard.
messages.balanced.vi: Tuyệt! Cả ba trò đều làm cơ bắp hoạt động mạnh.
messages.has_limited.en: You sit still for that one. Breathing stays slow.
messages.has_limited.vi: Trò này em ngồi yên một chỗ. Hơi thở vẫn chậm.
> Lời nhắn `has_limited` nói lý do, đúng cho cả ba món bẫy. Lời nhắn khi đạt nối với ý chính ba (cơ bắp).
messages.missing.tray_jump.en: You still need a jumping game.
messages.missing.tray_jump.vi: Em còn thiếu một trò nhảy.
messages.missing.tray_kick.en: You still need a kicking game.
messages.missing.tray_kick.vi: Em còn thiếu một trò đá.
messages.missing.tray_run.en: You still need a running game.
messages.missing.tray_run.vi: Em còn thiếu một trò chạy.

#### group tray_jump
label.en: Jumping
label.vi: Trò nhảy
color: vang_hoe
role: required

#### group tray_kick
label.en: Kicking
label.vi: Trò đá
color: gi_dong
role: required

#### group tray_run
label.en: Running
label.vi: Trò chạy
color: cham
role: required

#### group tray_still
label.en: Not moving much
label.vi: Không vận động nhiều
color: do_son
role: limit
> Nhãn `limit` dạng "Not …" · "Không …", gọi tên loại. Dòng điều kiện sẽ là "Cần đủ Trò nhảy, Trò đá, Trò chạy · Không vận động nhiều".

#### item tray_rope
label.en: Skipping
label.vi: Nhảy dây
group: tray_jump
image.brief: [hình vẽ] Một sợi dây nhảy có hai tay cầm bằng gỗ, cuộn trên sân xi măng, vẽ từ trên xuống; không có người, không có chữ, không có nhãn hiệu. Câu q1, thẻ q2_jumps, câu w1 và món Chơi bài bốn dùng lại ảnh này. Từ khoá tìm ảnh (EN): skipping rope wooden handles ground
image.alt.en: A skipping rope
image.alt.vi: Sợi dây nhảy

#### item tray_book
label.en: Reading
label.vi: Đọc truyện
group: tray_still
image.brief: [hình vẽ] Một quyển truyện mở úp trên mặt bàn gỗ, bìa trơn một màu; không đọc được chữ nào (không thấy trang chữ, bìa không có tên sách), không có người. Câu q1 dùng lại ảnh này. Từ khoá tìm ảnh (EN): open book face down wooden table
image.alt.en: A book on a table
image.alt.vi: Quyển truyện trên bàn

#### item tray_shuttlecock
label.en: Kicking a shuttlecock
label.vi: Đá cầu
group: tray_kick
image.brief: [hình vẽ] Một quả cầu đá (lông vũ cắm trên đế cao su tròn) nằm trên sân gạch, vẽ gần; không có người, không có chữ. Ưu tiên quả cầu kiểu Việt Nam. Từ khoá tìm ảnh (EN): jianzi shuttlecock kick feathers
image.alt.en: A shuttlecock for kicking
image.alt.vi: Quả cầu để đá

#### item tray_crayons
label.en: Colouring
label.vi: Tô màu
group: tray_still
image.brief: [hình vẽ] Một hộp bút sáp màu mở nắp cạnh tờ giấy vẽ trắng, trên giấy có vài nét màu nguệch ngoạc, vẽ từ trên xuống; không có chữ, không có nhãn hiệu trên bút, không có tay người. Từ khoá tìm ảnh (EN): crayons drawing paper table top view
image.alt.en: Crayons and paper
image.alt.vi: Bút sáp màu và tờ giấy vẽ

#### item tray_hopscotch
label.en: Hopscotch
label.vi: Nhảy lò cò
group: tray_jump
image.brief: [hình vẽ] Các ô nhảy lò cò vẽ bằng phấn trên sân xi măng, nhìn chéo từ trên xuống; không có chữ số trong ô, không có người, không có chữ. Từ khoá tìm ảnh (EN): hopscotch chalk pavement
image.alt.en: A hopscotch drawn on the ground
image.alt.vi: Ô nhảy lò cò vẽ trên sân
> Theo hình designer làm (SK-036, designer 10/11): cả chín món của kệ Chơi là hình tự vẽ, nên ô lò cò vẽ không có số; không cần thay bằng "Nhảy bao bố".

#### item tray_ball
label.en: Football
label.vi: Đá bóng
group: tray_kick
image.brief: [hình vẽ] Một quả bóng đá nằm trên sân cỏ, vẽ gần ngang mặt cỏ; không có logo, không có chữ trên bóng, không có người. Món Chơi và từ healthy ở bài bốn dùng lại ảnh này. Từ khoá tìm ảnh (EN): football on grass close up
image.alt.en: A football on the grass
image.alt.vi: Quả bóng trên sân cỏ

#### item tray_fishing
label.en: Fishing
label.vi: Câu cá
group: tray_still
image.brief: [hình vẽ] Một chiếc cần câu tre gác trên bờ ao làng, dây câu thả xuống mặt nước phẳng, chiếc ghế nhựa nhỏ để trống bên cạnh; không có người, không có chữ. Từ khoá tìm ảnh (EN): fishing rod pond bank
image.alt.en: A fishing rod by a pond
image.alt.vi: Cần câu bên bờ ao

#### item tray_track
label.en: Running race
label.vi: Chạy thi
group: tray_run
image.brief: [hình vẽ] Đường chạy điền kinh vắng, nhìn dọc theo các làn, vạch trắng rõ; không có số làn, không có người, không có chữ, không có biển quảng cáo. Câu q5 dùng lại ảnh này. Từ khoá tìm ảnh (EN): empty running track lanes
image.alt.en: An empty running track
image.alt.vi: Đường chạy vắng

#### item tray_baton
label.en: Relay race
label.vi: Chạy tiếp sức
group: tray_run
image.brief: [hình vẽ] Một chiếc gậy chạy tiếp sức đặt trên vạch xuất phát của đường chạy, vẽ gần; không có người, không có chữ, không có số. Từ khoá tìm ảnh (EN): relay baton on running track
image.alt.en: A relay baton on a track
image.alt.vi: Gậy chạy tiếp sức trên đường chạy

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q4), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q5, q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình.

### q1
id: a48efa61-7ba2-49ef-b917-56f9a1dbe058
format: single_choice
version: 1
dok: 1
prompt.en: When do you breathe fastest?
prompt.vi: Lúc nào em thở nhanh nhất?
image.brief: [hình vẽ] Một sân trường tiểu học vắng buổi sáng, sân xi măng rộng, hàng cây phượng hoặc bàng ở bên; không có học sinh, không có người, không có cờ, khẩu hiệu hay chữ. Câu q3 và câu w1 bài bốn dùng lại ảnh này. Từ khoá tìm ảnh (EN): empty schoolyard Vietnam trees
image.alt.en: An empty schoolyard
image.alt.vi: Sân trường vắng
hint.en: Remember the Faster card.
hint.vi: Em nhớ lại ô Nhanh hơn nhé.
explanation_correct.en: Skipping works your legs hard, so they need more oxygen.
explanation_correct.vi: Nhảy dây làm chân vận động mạnh, cần thêm ô-xi.
explanation_wrong.en: You move a lot when you skip.
explanation_wrong.vi: Lúc nhảy dây, em vận động rất nhiều.
> Câu nhớ lại ý chính một. Ba lựa chọn là ba ảnh đồ vật (dây nhảy, gối chăn, quyển truyện), cùng kiểu với kệ Chơi. Đáp án ở chỗ thứ nhất.

#### option q1_skipping
correct: true
label.en: skipping
label.vi: lúc nhảy dây
image.brief: Dùng lại hình `tray_rope`. Từ khoá tìm ảnh (EN): skipping rope wooden handles ground
image.alt.en: A skipping rope
image.alt.vi: Sợi dây nhảy

#### option q1_sleeping
correct: false
feedback.en: When you sleep, your body is calm and slow.
feedback.vi: Khi ngủ, cơ thể em nghỉ ngơi, thở chậm.
label.en: sleeping
label.vi: lúc ngủ
image.brief: [hình vẽ] Một chiếc gối và chiếc chăn mỏng gấp gọn trên chiếu, vẽ từ trên xuống; không có người, không có chữ, không có hình in trên gối. Từ khoá tìm ảnh (EN): pillow blanket sleeping mat top view
image.alt.en: A pillow and a blanket
image.alt.vi: Chiếc gối và chiếc chăn

#### option q1_reading
correct: false
feedback.en: Reading keeps you still, so your muscles rest.
feedback.vi: Đọc truyện em ngồi yên, cơ bắp được nghỉ.
label.en: reading
label.vi: lúc đọc truyện
image.brief: Dùng lại hình `tray_book`. Từ khoá tìm ảnh (EN): open book face down wooden table
image.alt.en: A book on a table
image.alt.vi: Quyển truyện trên bàn

### q2
id: 79204f4a-1701-4a49-ad6e-fc95b7628053
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `q1` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): hourglass sand timer wooden table
image.alt.en: An hourglass
image.alt.vi: Chiếc đồng hồ cát
sentence.en: Before you skip, count your {1} for one minute.
sentence.vi: Trước khi nhảy, em đếm số {1} trong một phút.
answers: q2_breaths
hint.en: Remember the hourglass in the lesson.
hint.vi: Em nhớ lại chiếc đồng hồ cát ở phần Học nhé.
explanation_correct.en: Then skip and count again to compare.
explanation_correct.vi: Rồi em nhảy dây và đếm lại để so sánh.
explanation_wrong.en: Count each breath in for one minute.
explanation_wrong.vi: Em đếm mỗi lần hít vào, trong một phút.
> Câu nhớ lại ô Thử đếm. Hai thẻ sai cũng là thứ đếm được khi chạy nhảy (bước chân, lần nhảy), nên có sức hút. Gợi ý chỉ hình của ô (đồng hồ cát), không nhắc chữ "lần thở".
> Câu VI "đếm số {1}" đọc được với cả ba thẻ: "đếm số lần nhảy", "đếm số bước chân", "đếm số lần thở".
> Rà chữ tester 10/11 (N4): câu cũ "To check your breathing, count your {1}…" · "Muốn biết em thở nhanh hay chậm…" có sẵn gốc từ của đáp án ("breathing" · "thở"). Câu mới chín từ EN, theo đề xuất của tester, vẫn đúng ô Thử đếm (ví dụ một và hai). "Lần nhảy" vẫn hấp dẫn bé đọc vội (câu có chữ "nhảy dây"), nhưng bé hiểu câu thì loại được vì chưa nhảy.
> Rà chữ (n2): hình câu hỏi trỏ thẳng hình gốc đồng hồ cát ở chủ đề *Khủng long*, không trỏ qua `explore_count` (cũng là hình dùng lại). Cùng một ảnh, không đổi gì trên màn.

#### bank q2_jumps
label.en: jumps
label.vi: lần nhảy
feedback.en: This count happens before any skipping starts.
feedback.vi: Lúc này em chưa bắt đầu nhảy dây.
image.brief: Dùng lại hình `tray_rope`. Từ khoá tìm ảnh (EN): skipping rope wooden handles ground
image.alt.en: A skipping rope
image.alt.vi: Sợi dây nhảy

#### bank q2_steps
label.en: steps
label.vi: bước chân
feedback.en: Steps count walking, not what your chest does.
feedback.vi: Bước chân là để đếm khi đi bộ.
image.brief: [hình vẽ] Một hàng dấu chân trần in trên cát ướt, vẽ từ trên xuống; không phải dấu chân con vật; không có người, không có chữ. Từ khoá tìm ảnh (EN): bare footprints wet sand
image.alt.en: Footprints in the sand
image.alt.vi: Dấu chân trên cát

#### bank q2_breaths
label.en: breaths
label.vi: lần thở
image.brief: Dùng lại hình `explore_in_out` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): hand on chest t-shirt close up
image.alt.en: A hand resting on a chest
image.alt.vi: Bàn tay đặt lên ngực

### q3
id: 030de36f-a05f-450a-a0a2-95840f508766
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones make you breathe faster?
prompt.vi: Những việc nào làm em thở nhanh hơn?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `q1`. Từ khoá tìm ảnh (EN): empty schoolyard Vietnam trees
image.alt.en: An empty schoolyard
image.alt.vi: Sân trường vắng
hint.en: Which ones make your leg muscles work hard?
hint.vi: Việc nào làm cơ bắp ở chân em hoạt động mạnh?
explanation_correct.en: Stairs and bikes make your legs work hard.
explanation_correct.vi: Leo cầu thang và đạp xe làm chân hoạt động mạnh.
explanation_wrong.en: Climbing stairs and cycling move your legs a lot.
explanation_wrong.vi: Leo cầu thang và đạp xe làm chân vận động nhiều.
> DOK 2: chuyển từ trò chơi ở phần Chơi sang việc hằng ngày, bé phải nghĩ cơ bắp nào hoạt động. Cờ vua có sức hút vì là "môn thể thao" (có thi đấu) nhưng ngồi yên; nằm võng là việc nghỉ quen ở Việt Nam.
> Gợi ý nêu cách nghĩ (cơ bắp ở chân), nối với ô Cơ bắp, không gọi tên lựa chọn.

#### option q3_hammock
correct: false
feedback.en: Lying in a hammock lets your whole body rest.
feedback.vi: Nằm võng là lúc cả người em nghỉ ngơi.
label.en: lying in a hammock
label.vi: nằm võng
image.brief: [hình vẽ] Một cái võng mắc giữa hai thân cây trong vườn, võng trống, vẽ ngang; không có người, không có chữ. Câu w1 bài bốn dùng lại ảnh này. Từ khoá tìm ảnh (EN): empty hammock between trees garden
image.alt.en: A hammock between two trees
image.alt.vi: Cái võng mắc giữa hai cây

#### option q3_stairs
correct: true
label.en: climbing stairs
label.vi: leo cầu thang
image.brief: [hình vẽ] Một cầu thang bộ có tay vịn, vẽ từ chân cầu thang nhìn lên; không có người, không có chữ, không có biển chỉ dẫn. Từ khoá tìm ảnh (EN): staircase handrail looking up
image.alt.en: A set of stairs
image.alt.vi: Cầu thang bộ

#### option q3_bike
correct: true
label.en: riding a bike
label.vi: đạp xe
image.brief: [hình vẽ] Một chiếc xe đạp dựng chân chống trên đường làng hoặc lối đi trong công viên, vẽ ngang cả xe; không có người, không có nhãn hiệu, không có chữ, không có biển số. Từ khoá tìm ảnh (EN): bicycle parked side view path
image.alt.en: A bicycle
image.alt.vi: Chiếc xe đạp

#### option q3_chess
correct: false
feedback.en: Chess works your brain, but your body sits still.
feedback.vi: Chơi cờ dùng đầu óc, còn người ngồi yên.
label.en: playing chess
label.vi: chơi cờ vua
image.brief: [hình vẽ] Một bàn cờ vua đang chơi dở trên mặt bàn gỗ, quân cờ đứng rải rác, vẽ chéo; không có tay người, không có chữ, không có đồng hồ thi đấu. Câu w1 bài bốn dùng lại ảnh này. Từ khoá tìm ảnh (EN): chess board game in progress wooden table
image.alt.en: A chess board
image.alt.vi: Bàn cờ vua

### q4
id: 2ba2a531-9602-41b7-9893-7b9b6d4a9550
format: single_choice
version: 1
dok: 2
prompt.en: Which bar shows Mai's breaths after skipping?
prompt.vi: Cột nào là số lần thở sau khi nhảy dây?
image.brief: [hình vẽ] Biểu đồ cột đơn giản trên nền giấy kem: ba cột cùng một màu xanh chàm đứng trên một trục ngang; cột bên trái cao nhất, cột ở giữa thấp nhất, cột bên phải cao vừa; không có chữ, không có số, không có hình dưới chân cột, không có lưới. Thứ tự cột không theo độ cao, để bé không đoán theo vị trí.
image.alt.en: A bar chart with three bars
image.alt.vi: Biểu đồ có ba cột
hint.en: Does skipping make you breathe a little or a lot?
hint.vi: Nhảy dây làm em thở ít hay thở nhiều?
explanation_correct.en: The other bars were for reading and walking.
explanation_correct.vi: Hai cột kia là lúc đọc truyện và đi bộ.
explanation_wrong.en: Skipping gives the most breaths, so its bar is tallest.
explanation_wrong.vi: Nhảy dây thở nhiều nhất, nên cột cao nhất.
> 14/11 (ngân sách A2): câu hỏi cũ hai câu, mười ba từ EN, mười bảy chữ VI; nay một câu bảy từ EN, mười chữ VI. Ý "Mai đếm sau ba việc khác nhau" chỉ còn ở lời giải thích khi đúng (hai cột kia là đọc truyện, đi bộ).
> DOK 2: đọc biểu đồ cột dạng tranh (syllabus-progression mục 9) và suy ra từ ý chính một: nhảy dây làm thở nhiều lần nhất, tức cột cao nhất. Biểu đồ không ghi việc nào ở cột nào, nên bé phải suy luận, không đọc nhãn.
> Không dùng format `picture_bar_chart` vì app 0.1.0 chưa hiện (`format_not_rendered`); biểu đồ là hình vẽ trong câu `single_choice`.
> [CẦN KIỂM] Tỉ lệ cột theo số lần thở trong một phút của trẻ bảy đến chín tuổi sau khi nhảy dây, đi bộ, đọc truyện (biên tập ước khoảng bốn mươi, hai mươi lăm, hai mươi; cột trái, cột phải, cột giữa). Hình không ghi số.
> Rà chữ tester 10/11 (N3, main session chốt):
> - a) câu hỏi cũ kể ba việc theo thứ tự (đọc, đi bộ, nhảy dây) trong khi các cột cố ý không theo thứ tự đó, nên bé đọc biểu đồ theo quy ước "việc thứ ba là cột thứ ba" bị sai. Câu mới không kể thứ tự, theo chữ tester đề xuất. Bé dựa vào ô Nhanh hơn (nhảy dây là ví dụ đầu tiên của việc làm thở nhanh) và gợi ý; giải thích khi đúng mới nói hai việc kia (đọc truyện, đi bộ), để bé kiểm lại.
> - b) nhãn cũ chỉ phân biệt bằng màu (đỏ, xanh dương, vàng), bé mù màu và bé dùng VoiceOver không phân biệt được. Nhãn mới theo vị trí cột **trong hình** (trái, giữa, phải), `alt` theo cùng cách; ba cột vẽ cùng một màu, cột được đánh dấu giữ màu đậm, hai cột kia xám nhạt. TEMPLATE mục A chỉ cấm nhắc vị trí thẻ trên màn, không cấm tả vị trí trong hình.
> - Thêm (n1): cột cao nhất chuyển sang bên trái, nên đáp án là lựa chọn thứ nhất (trước đây thứ hai). Ba lựa chọn xếp trái, giữa, phải cho dễ đối chiếu với hình.

#### option q4_left
correct: true
label.en: left bar
label.vi: cột bên trái
image.brief: [hình vẽ] Cùng biểu đồ của câu hỏi, cột bên trái giữ màu xanh chàm đậm, cột ở giữa và cột bên phải nhạt đi thành xám nhạt; không có chữ, không có mũi tên.
image.alt.en: The chart with the left bar marked
image.alt.vi: Biểu đồ, đánh dấu cột bên trái

#### option q4_middle
correct: false
feedback.en: The middle bar is the shortest, so few breaths.
feedback.vi: Cột ở giữa thấp nhất, tức là thở ít nhất.
label.en: middle bar
label.vi: cột ở giữa
image.brief: [hình vẽ] Cùng biểu đồ của câu hỏi, cột ở giữa giữ màu xanh chàm đậm, cột bên trái và cột bên phải nhạt đi thành xám nhạt; không có chữ, không có mũi tên.
image.alt.en: The chart with the middle bar marked
image.alt.vi: Biểu đồ, đánh dấu cột ở giữa

#### option q4_right
correct: false
feedback.en: The right bar is only medium tall.
feedback.vi: Cột bên phải chỉ cao vừa vừa.
label.en: right bar
label.vi: cột bên phải
image.brief: [hình vẽ] Cùng biểu đồ của câu hỏi, cột bên phải giữ màu xanh chàm đậm, cột bên trái và cột ở giữa nhạt đi thành xám nhạt; không có chữ, không có mũi tên.
image.alt.en: The chart with the right bar marked
image.alt.vi: Biểu đồ, đánh dấu cột bên phải

### q5
id: d1643872-bae2-4c26-afd0-1d0609fd5958
format: true_false
version: 1
dok: 2
prompt.en: After a race, your breathing stays fast all day.
prompt.vi: Chạy thi xong, em thở nhanh suốt cả ngày.
image.brief: Dùng lại hình `tray_track`. Từ khoá tìm ảnh (EN): empty running track lanes
image.alt.en: An empty running track
image.alt.vi: Đường chạy vắng
answer: false
hint.en: Remember the Rest card.
hint.vi: Em nhớ lại ô Nghỉ ngơi nhé.
explanation_correct.en: Rest for a few minutes, and breathing slows down.
explanation_correct.vi: Em nghỉ vài phút, hơi thở sẽ chậm lại.
explanation_wrong.en: Breathing slows down when you rest.
explanation_wrong.vi: Khi em nghỉ, hơi thở chậm lại.
feedback_true.en: Once you stop running, your legs need less oxygen.
feedback_true.vi: Thôi chạy, chân em cần ít ô-xi hơn.
> DOK 2: áp dụng ý chính hai vào tình huống sau một cuộc chạy thi. Giải thích khi đúng không mở đầu bằng "Yes!" (đáp án Sai).

### q6
id: b70d5ccd-7bf4-45d4-8cd1-27cb3072a581
format: true_false
version: 1
dok: 3
misconception: only_lungs_need_oxygen
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: Running legs need more oxygen, so I breathe faster.
statement.vi: Khi chạy, chân cần thêm ô-xi, nên mình thở nhanh hơn.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
image.brief: Dùng lại hình `explore_faster`. Từ khoá tìm ảnh (EN): children silhouettes playing sunset
image.alt.en: Children playing at sunset
image.alt.vi: Các bạn nhỏ chơi đùa lúc hoàng hôn
hint.en: Remember the Muscles card.
hint.vi: Em nhớ lại ô Cơ bắp nhé.
explanation_correct.en: Blood takes more oxygen to your working legs.
explanation_correct.vi: Máu mang thêm ô-xi tới đôi chân đang chạy.
explanation_wrong.en: Your lungs take in oxygen for your muscles.
explanation_wrong.vi: Phổi lấy ô-xi vào cho cơ bắp dùng.
feedback_false.en: Oxygen goes from your lungs to your legs.
feedback_false.vi: Ô-xi đi từ phổi tới tận đôi chân.
> 14/11 (ngân sách A2): lời Na cũ hai câu, mười hai từ EN, mười sáu chữ VI; nay một câu chín từ EN, mười hai chữ VI, giữ hai vế nhân quả.
> Lời Na, hình và đáp án Đúng đúng như `_topic.md` (mục "Câu sáu, lời Na" và bảng Đáp án Đúng/Sai).
> DOK 3: bé đánh giá một lời giải thích nhân quả (chân cần ô-xi, nên thở nhanh). Bé nghĩ ô-xi chỉ dùng ở phổi (`only_lungs_need_oxygen`), hoặc nghĩ thở nhanh "vì mệt" hay "vì nóng", sẽ chọn "Na chưa đúng". Bé phải nối ý chính ba với ô Cơ bắp.
> Rà chữ tester 10/11 (N2, phương án A): ô Cơ bắp không còn ví dụ "so you breathe faster" · "nên em thở nhanh hơn". Ô chỉ dạy hai vế riêng (cơ bắp cần thêm ô-xi, máu mang ô-xi tới chân, phổi lấy ô-xi vào); bé phải tự nối: chân cần thêm ô-xi, ô-xi vào qua phổi, nên phải thở nhanh hơn. Lời Na, đáp án Đúng và bảng Đúng/Sai giữ nguyên. Không đổi sang lời Na "thở nhanh vì nóng" (tester: nóng cũng làm thở nhanh hơn một chút, đáp án không sạch).
> Gợi ý chỉ chỗ cần nhớ, không nói Na đúng hay sai. Hình là cảnh chạy nhảy chung, không cho thấy máu hay ô-xi.

## Từ vựng

### exercise
id: 8e81f91a-bb93-4a76-8bc3-ffba526d353a
tier: core
term.en: exercise
term.vi: vận động
example.en: Exercise makes you breathe faster.
example.vi: Vận động làm em thở nhanh hơn.
image.brief: Dùng lại hình `explore_faster`. Từ khoá tìm ảnh (EN): children silhouettes playing sunset
image.alt.en: Children playing at sunset
image.alt.vi: Các bạn nhỏ chơi đùa lúc hoàng hôn

### muscle
id: eff31f93-5ab0-4316-8171-ebd3f08576c3
tier: core
term.en: muscle
term.vi: cơ bắp
example.en: Your leg muscles work hard when you run.
example.vi: Cơ bắp ở chân làm việc chăm chỉ khi em chạy.
image.brief: Dùng lại hình `explore_muscles`. Từ khoá tìm ảnh (EN): runner legs running track close up
image.alt.en: Legs running on a track
image.alt.vi: Đôi chân đang chạy trên đường chạy

### blood
id: 43d90117-4ace-41d1-834a-6a10524033b2
tier: core
term.en: blood
term.vi: máu
example.en: Blood takes oxygen all around your body.
example.vi: Máu mang ô-xi đi khắp cơ thể.
image.brief: [hình vẽ] Sơ đồ đơn giản thân một bạn nhỏ nhìn thẳng, nét mềm: trái tim ở giữa ngực, những đường mạch máu đỏ son và xanh chàm chạy ra hai tay, hai chân; không có máu chảy, không có vết thương, không vẽ nét mặt, không có chữ; nền kem trơn, cùng nét với sơ đồ đường thở của bài hai.
image.alt.en: A body drawing with blood paths to the arms and legs
image.alt.vi: Hình vẽ cơ thể, các đường máu chạy tới tay chân
> Hình tự vẽ: ảnh chụp về máu không hợp trẻ bảy đến chín tuổi (mục An toàn ở `_topic.md`). [CẦN KIỂM] Sơ đồ mạch máu đỏ, xanh là cách vẽ quy ước trong sách; máu trong cơ thể không có màu xanh. Nếu chuyên môn thấy dễ hiểu nhầm thì vẽ toàn màu đỏ son.

### heart
id: 0f2a4133-396a-4cba-821c-a89818550e5f
tier: extra
term.en: heart
term.vi: tim
example.en: Your heart beats faster when you run.
example.vi: Tim em đập nhanh hơn khi em chạy.
image.brief: Dùng lại hình `tray_heart` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A heart
image.alt.vi: Trái tim

### breath
id: c01ff292-8346-455e-a2be-ac12b300b51f
tier: extra
term.en: breath
term.vi: hơi thở
example.en: Count your breaths for one minute.
example.vi: Em đếm số lần thở trong một phút.
image.brief: Dùng lại hình `q1` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): hourglass sand timer wooden table
image.alt.en: An hourglass
image.alt.vi: Chiếc đồng hồ cát
> Rà chữ tester 10/11 (n2): trỏ thẳng hình gốc, không trỏ qua `explore_count`. Cùng một ảnh.

## Thưởng

### busy_lungs
id: 340f2354-7a3a-484f-bd46-9e8350106ee4
set: breathing
rarity: common
name.en: Busy lungs
name.vi: Lá phổi chăm chỉ
tag.en: Every day
tag.vi: Mỗi ngày
fact.en: You breathe more than 20,000 times every day. Your lungs never take a day off.
fact.vi: Mỗi ngày em thở hơn hai mươi nghìn lần. Phổi không nghỉ ngày nào.
> [CẦN KIỂM] Biên tập tự tính: lúc nghỉ trẻ bảy đến chín tuổi thở khoảng mười tám tới hai mươi lăm lần một phút; một ngày có một nghìn bốn trăm bốn mươi phút, nên khoảng hai mươi sáu nghìn tới ba mươi sáu nghìn lần. "Hơn hai mươi nghìn" là con số an toàn. EN viết chữ số, VI viết bằng chữ. Nghe thử giọng EN đọc "20,000".
image.brief: Dùng lại hình `tray_lungs` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: Two lungs
image.alt.vi: Hai lá phổi

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp đồ vật là chính, không có người nhận ra mặt: kệ Chơi và các lựa chọn là đồ vật của trò chơi hay việc làm (dây nhảy, quả cầu, võng, bàn cờ), không chụp trẻ đang chơi. Chỉ ô Nhanh hơn có người, là bóng đen ngược sáng ở xa. Hình tự vẽ: biểu đồ cột câu q4 (bốn bản) và sơ đồ mạch máu (từ `blood`).
  - **Theo hình designer làm 10/11** (ticket SK-036, mục "designer 10/11 · hình"): Commons không có ảnh hợp lệ cho dây nhảy, quả cầu đá, quyển truyện, gối chăn, nên designer vẽ trọn mọi chỗ cùng kiểu: kệ Chơi chín món, q1, q2 (ba thẻ), q3 (bốn lựa chọn), ô Nghỉ ngơi, ô Cơ bắp, sân trường. Ô Nhanh hơn (và q6, từ `exercise`) là ảnh public domain trẻ chơi lúc hoàng hôn. Các mục "Ảnh cần tìm" và "cùng kiểu" dưới đây là bản trước khi có hình; nay các lựa chọn trong mỗi câu và kệ Chơi cùng là hình vẽ.
- **Ảnh cần tìm (mười chín):**
  - Học (ba): bóng các bạn đá bóng lúc hoàng hôn; ghế dưới bóng cây có chai nước; đôi chân chạy trên đường chạy.
  - Chơi (chín): dây nhảy; quyển truyện úp; quả cầu đá; bút sáp màu và giấy; ô lò cò không số; quả bóng trên cỏ; cần câu bên ao; đường chạy vắng không số làn; gậy tiếp sức.
  - Quiz (bảy): sân trường vắng (q1); gối và chăn trên chiếu (q1); dấu chân trần trên cát ướt (q2); võng trống, cầu thang, xe đạp, bàn cờ vua (q3).
- **Hình tự vẽ (năm):** biểu đồ cột của câu q4 (bản câu hỏi và ba bản đánh dấu một cột, cùng một hình gốc, cột không đánh dấu thành xám nhạt); sơ đồ mạch máu (từ `blood`, cùng nét sơ đồ đường thở bài hai).
  - Rà chữ tester 10/11 (N3): biểu đồ vẽ lại. Ba cột **cùng một màu** xanh chàm (trước là đỏ, xanh, vàng); cột bên trái cao nhất, cột ở giữa thấp nhất, cột bên phải cao vừa (trước: cột giữa cao nhất). Ba bản lựa chọn đổi key thành `q4_left`, `q4_middle`, `q4_right` (trước `q4_yellow`, `q4_blue`, `q4_red`); mỗi bản cột được đánh dấu giữ màu chàm đậm, hai cột kia xám nhạt.
- **Dùng lại:** từ bài một `w1` (câu w1), `explore_in_out` (thẻ q2_breaths); từ bài hai `explore_lungs`, `explore_nose`, `explore_windpipe` (w1), `tray_heart` (từ `heart`), `tray_lungs` (thẻ thưởng); từ chủ đề *Khủng long* `w1_buffalo` (câu w2), `q1` đồng hồ cát (ô Thử đếm, câu q2, từ `breath`).
- **Bài bốn dùng lại hình của bài này:** `tray_rope`, `tray_ball` (kệ Chơi và từ vựng), `q3_chess`, `q3_hammock`, `q1` (câu w1).
- **Các lựa chọn trong một câu cùng khung, cùng kiểu:**
  - q1: ba ảnh đồ vật chụp gần, nền thật.
  - q2: ba thẻ đều là ảnh chụp (dây nhảy, dấu chân, bàn tay trên ngực).
  - q3: bốn ảnh đồ vật hay chỗ, không có người, cùng kiểu chụp ngang hoặc chéo.
  - q4: ba bản của cùng một biểu đồ, chỉ khác cột được đánh dấu.
- **Không có chữ, không có số:** số làn trên đường chạy, số trong ô lò cò, chữ trên quyển truyện, logo trên bóng, giày, xe đạp, bút sáp: cắt bỏ, xoá, hoặc chọn ảnh khác.
- **Kệ Chơi:** chín món đều là hình vẽ đồ vật (designer 10/11), ba món bẫy cũng vậy, để kiểu hình không báo đúng sai.
- **Màu:** Học: nhanh hơn `do_son`, nghỉ ngơi `cham`, cơ bắp `vang_hoe`, thử đếm `gi_dong`. Chơi: trò nhảy `vang_hoe`, trò đá `gi_dong`, trò chạy `cham`, nhóm "Không vận động nhiều" `do_son`. Biểu đồ q4 dùng một màu `cham`; nhãn lựa chọn theo vị trí cột (trái, giữa, phải), không theo màu.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: exercise, muscle, blood).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, chín món.
  - Khởi động: `single_choice` (w1, `recall_from.lesson: ho-hap/duong-di-cua-khong-khi`), `true_false` (w2, `recall_from.lesson: ho-hap/vi-sao-ta-phai-tho`, đáp án Sai). DOK một.
  - Quiz: `single_choice` (q1, q4), `fill_blank_bank` (q2, một ô trống, ba thẻ có hình), `multi_choice` (q3, bốn lựa chọn, hai đúng), `true_false` (q5 Sai; q6 Đúng, `speaker: na`).
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3.
  - Câu có `misconception`: q6, key `only_lungs_need_oxygen`.
- **Tham chiếu:** w1 trỏ bài hai, w2 trỏ bài một: chạy `ids` cho hai bài đó trước.
- **Vị trí đáp án đúng:** w1 thứ hai; q1 thứ nhất; q2 thẻ thứ ba; q3 thứ hai và thứ ba; q4 thứ nhất (đổi từ thứ hai, rà chữ tester 10/11 N3 và n1).
- **Key đổi sau rà chữ (10/11):** câu q4 bỏ `q4_yellow`, `q4_blue`, `q4_red`, thêm `q4_left`, `q4_middle`, `q4_right`. Bài chưa phát hành nên đổi key được; file chọn ảnh và clip của ba key cũ bỏ.
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Nhảy dây, Đá cầu, Chạy thi → `balanced`;
  - Câu cá → `has_limited`;
  - Nhảy dây, Nhảy lò cò, Đá bóng (thiếu trò chạy) → `missing.tray_run`;
  - rồi chạm Chạy tiếp sức → `full`; bỏ Nhảy lò cò, đặt Chạy tiếp sức → `balanced`.
- **Nhãn món dài:** "Kicking a shuttlecock" (EN ba từ), "Không vận động nhiều" (chip `limit`). Nhờ tester xem trên iPhone bề rộng nhỏ nhất.
- **Số từ EN trên một màn:** Học khoảng hai mươi chín (mục tiêu 10, hướng dẫn 3, bốn nhãn 4, câu dài nhất 9, ô Từ mới 5); ví dụ bốn của ô Nghỉ ngơi là một câu chín từ, không tính vào số này như các món ví dụ khác. Nhiều chữ nhất ở Quiz là q4 (khoảng hai mươi lăm: câu hỏi 12, ba nhãn 6, giải thích đúng 11) và q6 (khoảng hai mươi tám).
- **Từ EN có thể ngoài Starters/Movers:** từ mới exercise, muscle, blood; breath, heart, shuttlecock, hopscotch, relay, baton (chỉ ở `alt`), hammock, chess, stairs, deeper, slows, compare, grown-up, bar.
- **Giọng đọc:** EN nghe thử "shuttlecock", "hopscotch", "20,000". VI "ô-xi" hai âm tiết. Không có ký hiệu, không có dấu "—" trong chuỗi VI.
- **Asset:** không có audio, `asset` trong markdown.
