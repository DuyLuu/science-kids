---
id: 6f34422b-c0fb-4ce7-8a6e-7114ac0d3cf3
topic: be-mat-trai-dat
slug: nui-lua
order: 4
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Volcanoes
vi: Núi lửa

## Mục tiêu
en: I can say how a volcano erupts.
vi: Em kể được núi lửa phun trào ra sao.

## Ý chính
1.en: Hot melted rock comes out of a volcano.
1.vi: Đá nóng chảy trào ra từ núi lửa.
2.en: It is magma underground and lava outside.
2.vi: Dưới lòng đất gọi là mác-ma, trào ra ngoài gọi là dung nham.
3.en: Lava cools into new rock and new land.
3.vi: Dung nham nguội đi thành đá mới, đất mới.
> Ba ý chính giữ nguyên như bảng kế hoạch ở `_topic.md`. Ở ô Học, câu của ý hai viết lại cho đủ chủ ngữ ("Melted rock is…"), vì ô hiện riêng, không có câu trước để hiểu "It".

## Khởi động

> Hai câu ôn bài ba (bài trước, `recall_from.kind: lesson`), một câu ôn bài một (cách ba bài, để giãn cách, theo `_topic.md` mục "Khi soạn bài 2 đến 5" và syllabus-progression mục 7). Bài này không ôn bài hai: Khởi động đã đủ ba câu, và bài hai đã được ôn ở bài ba (w1).
> w1 ôn vỏ Trái Đất: ở phần Học, mác-ma đẩy lên qua lớp vỏ này. w2 ôn lớp manti là đá rất nóng nhưng phần lớn không nóng chảy (câu "Lớp manti là một lớp đá nóng chảy", đáp án Sai), chuẩn bị cho ý "đá chỉ nóng chảy thành mác-ma ở một số nơi" (nối `inside_is_lava` từ bài ba). w3 ôn hòn đảo là đất, chuẩn bị cho ý "đất mới" và đảo Lý Sơn.
> Đã đối chiếu bài ba khi rà chéo 9/11: w1 khớp ý chính một và câu q1 của bài ba; w2 khớp ý chính hai và món "phần lớn vẫn rắn" ở ô Lớp manti. Tên tiếng Việt "vỏ Trái Đất", "lớp manti", "nhân Trái Đất" theo bảng Tên gọi ở `_topic.md`.

### w1
id: 306a7a7a-06cd-4092-967f-faf0e59794ef
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/ben-trong-trai-dat
prompt.en: Which layer of Earth do we live on?
prompt.vi: Mình sống trên lớp nào của Trái Đất?
image.brief: Dùng lại hình `w2` ở bài `be-mat-trai-dat/ben-trong-trai-dat`. Ảnh làng quê cho thấy nơi mình sống mà không chỉ lớp nào, để không lộ đáp án. Từ khoá tìm ảnh (EN): village Vietnam aerial rice fields
image.alt.en: A village seen from above
image.alt.vi: Làng quê nhìn từ trên cao
hint.en: Which layer is on the outside?
hint.vi: Lớp nào nằm ở ngoài cùng?
explanation_correct.en: Land, seas and mountains all sit on the crust.
explanation_correct.vi: Đất, biển và núi đều nằm trên vỏ Trái Đất.
explanation_wrong.en: We live on the crust, Earth's outside layer.
explanation_wrong.vi: Mình sống trên vỏ, lớp ngoài cùng của Trái Đất.

#### option w1_mantle
correct: false
feedback.en: The mantle is very hot rock, deep below us.
feedback.vi: Lớp manti là đá rất nóng, ở sâu bên dưới.
label.en: mantle
label.vi: lớp manti
image.brief: Dùng lại hình `q1_mantle` ở bài `be-mat-trai-dat/ben-trong-trai-dat`. Từ khoá tìm ảnh (EN): Earth layers cutaway diagram
image.alt.en: Earth cut open, the mantle shown
image.alt.vi: Mặt cắt Trái Đất, tô rõ lớp manti

#### option w1_crust
correct: true
label.en: crust
label.vi: vỏ Trái Đất
image.brief: Dùng lại hình `q1_crust` ở bài `be-mat-trai-dat/ben-trong-trai-dat`. Từ khoá tìm ảnh (EN): Earth layers cutaway diagram
image.alt.en: Earth cut open, the crust shown
image.alt.vi: Mặt cắt Trái Đất, tô rõ lớp vỏ

#### option w1_core
correct: false
feedback.en: The core is in the very middle of Earth.
feedback.vi: Nhân nằm ở chính giữa Trái Đất.
label.en: core
label.vi: nhân Trái Đất
image.brief: Dùng lại hình `q1_core` ở bài `be-mat-trai-dat/ben-trong-trai-dat`. Từ khoá tìm ảnh (EN): Earth layers cutaway diagram
image.alt.en: Earth cut open, the core shown
image.alt.vi: Mặt cắt Trái Đất, tô rõ nhân
> [CẦN KIỂM] Tên tiếng Việt theo sách giáo khoa hiện hành: "lớp manti" hay "lớp man-ti"; "nhân" hay "lõi" Trái Đất. Đã khớp bài ba và bảng Tên gọi ở `_topic.md`.

### w2
id: 400dfed4-c2a3-4d18-a99e-3aa04635fe3c
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/ben-trong-trai-dat
prompt.en: The mantle is a layer of melted rock.
prompt.vi: Lớp manti là một lớp đá nóng chảy.
image.brief: Dùng lại hình `explore_mantle` ở bài `be-mat-trai-dat/ben-trong-trai-dat`. Sơ đồ ở đó vẽ lớp manti như đá nóng, không chảy như dung nham, nên không cho thấy rắn hay lỏng và không lộ đáp án. Từ khoá tìm ảnh (EN): Earth layers cutaway diagram
image.alt.en: Earth's mantle next to an egg white
image.alt.vi: Lớp manti bên cạnh lòng trắng trứng
answer: false
hint.en: Remember the mantle. Is most of it melted or solid?
hint.vi: Em nhớ lại lớp manti. Phần lớn lớp đó nóng chảy hay vẫn rắn?
explanation_correct.en: The mantle is very hot, but mostly solid.
explanation_correct.vi: Lớp manti rất nóng, nhưng phần lớn vẫn rắn.
explanation_wrong.en: Only some places deep down have melted rock.
explanation_wrong.vi: Chỉ một số nơi sâu dưới đất có đá nóng chảy.
feedback_true.en: Very hot rock can still be solid.
feedback_true.vi: Đá rất nóng vẫn có thể rắn.
> Rà chữ 9/11 (tester N1): câu đổi sang đáp án Sai. Bản cũ "The mantle is a layer of very hot rock." (đáp án Đúng). Bản mới kiểm thẳng ý "lớp manti phần lớn vẫn rắn" của bài ba, nối với misconception `inside_is_lava` và với ý "mác-ma chỉ có ở một số nơi" của bài này; câu khởi động không gắn key. Giải thích khi đúng không mở đầu bằng "Yes!", vì bé vừa chọn Sai.
> [CẦN KIỂM] "Phần lớn lớp manti vẫn rắn" theo cách nói của `_topic.md` (correction của `inside_is_lava`: "đá rất nóng nhưng phần lớn vẫn rắn") và món "mostly solid · phần lớn vẫn rắn" ở ô Lớp manti của bài ba. Có chỗ trong lớp manti đá nóng chảy một phần; với trẻ bảy đến chín tuổi, câu "Lớp manti là một lớp đá nóng chảy" được coi là sai.
> Thêm hình dùng lại `explore_mantle` của bài ba, như ghi chú cũ đề xuất.

### w3
id: ffe44f74-4855-4388-ae7d-b97b22abe22a
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/dat-va-nuoc-tren-trai-dat
prompt.en: An island is land with water all around it.
prompt.vi: Hòn đảo là đất, có nước bao quanh.
image.brief: [ảnh] Bãi cát trên một hòn đảo nhỏ, chụp ngang tầm mắt từ trong bờ nhìn ra: cát trắng, vài cây dừa, biển xanh phía trước; chỉ thấy một phía là nước, không thấy đảo có nước bao quanh hay không; không có người, không có chữ. Đổi từ ảnh hòn đảo nhìn từ xa (SK-033, 9/11): ảnh đó cho thấy nước bao quanh mọi phía, tức là đưa sẵn đáp án Đúng. Từ khoá tìm ảnh (EN): beach small island palm trees
image.alt.en: A beach on a small island
image.alt.vi: Bãi cát trên một hòn đảo nhỏ
answer: true
hint.en: Can you walk on an island?
hint.vi: Em đi bộ trên đảo được không?
explanation_correct.en: Cat Ba and Ly Son are islands of Vietnam.
explanation_correct.vi: Cát Bà và Lý Sơn là những hòn đảo của Việt Nam.
explanation_wrong.en: An island is land, with sea on every side.
explanation_wrong.vi: Đảo là đất, bốn phía đều có nước.
feedback_false.en: Trees grow on islands, because islands are land.
feedback_false.vi: Trên đảo có cây mọc, vì đảo là đất.

## Học

> Bốn ô. Ba ô đầu ứng với ba ý chính, từ cụ thể tới trừu tượng: ô Phun trào (ý một, thấy được trên ti vi), ô Mác-ma và dung nham (ý hai, phần ẩn dưới đất), ô Đá mới (ý ba, quá trình kéo dài). Ô thứ tư "Ở Việt Nam" đem ba ý về gần trẻ: Việt Nam có núi lửa đã tắt. Đây là chỗ sửa `volcanoes_far_away` trước khi kiểm ở phần Chơi và câu q6.
> Món ví dụ ở ô Mác-ma và dung nham kể quá trình phun trào theo thứ tự (mác-ma ở sâu, đẩy lên, dung nham chảy ra), vì mục tiêu bài là "kể được núi lửa phun trào ra sao". Món đầu nói "ở một số nơi", nối với `inside_is_lava` của bài ba.
> Không dùng `sentence_card`: app 0.1.0 chỉ hiện `explore_groups` đầu tiên và `word_list` đầu tiên ở màn Học (như bài một).

### explore
id: 8ace84b7-02c9-4468-916a-74b44d2adbcb
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_erupt
label.en: Erupt
label.vi: Phun trào
color: do_son
sentence.en: Hot melted rock comes out of a volcano.
sentence.vi: Đá nóng chảy trào ra từ núi lửa.
image.brief: [ảnh] Một núi lửa hình nón đang phun, chụp từ rất xa lúc chạng vạng: dòng dung nham đỏ cam chảy xuống sườn, mây bao quanh; không có cột tro; không có người, nhà, xe, rừng cháy hay cảnh tàn phá; cảnh hùng vĩ chứ không đáng sợ; không có chữ, không kèm logo. Ảnh phải không có chữ, vì câu q6, các từ vựng và bài năm (lựa chọn q1_lava, thẻ q4_erupts) dùng lại. Từ khoá tìm ảnh (EN): volcano erupting lava night distant
image.alt.en: A volcano erupting
image.alt.vi: Núi lửa đang phun trào
> SK-033 (Duy duyệt ảnh 10/11): khác brief cũ một phần: ảnh núi lửa Arenal không có cột tro xám. Alt vẫn đúng, giữ nguyên. Món ví dụ "ash · tro núi lửa" giữ, vì món kể thứ núi lửa phun ra, không tả ảnh; ảnh cột tro có ở lựa chọn `q4_ash` và từ `ash`.
examples.1.en: crater
examples.1.vi: miệng núi lửa
examples.2.en: hot melted rock
examples.2.vi: đá nóng chảy
examples.3.en: ash
examples.3.vi: tro núi lửa

#### group explore_magma
label.en: Magma and lava
label.vi: Mác-ma và dung nham
color: vang_hoe
sentence.en: Melted rock is magma underground and lava outside.
sentence.vi: Đá nóng chảy dưới đất là mác-ma, ra ngoài là dung nham.
> SK-044 (14/11, A2): câu VI cũ mười bốn tiếng; bỏ "lòng", "trào" còn mười hai (đếm "mác-ma" là một chữ như cách đếm theo dấu cách của A2; đếm theo tiếng là mười ba).
> [CẦN KIỂM] Cách viết "mác-ma" theo sách giáo khoa hiện hành (có sách viết "macma"). Cả chủ đề viết "mác-ma" (bảng Tên gọi ở `_topic.md`). Nghe thử giọng VI đọc "mác-ma" và "dung nham".
image.brief: [hình vẽ] Sơ đồ gốc của bài, designer tự vẽ (không có sơ đồ public domain hợp đường ảnh, Duy 10/11): mặt cắt dọc một núi lửa, sâu dưới lòng đất, giữa lớp đá rắn, có một túi mác-ma màu cam (buồng mác-ma); một ống hẹp đi từ túi đó lên miệng núi lửa; ngoài miệng, dòng dung nham chảy xuống sườn; một mũi tên cong chỉ lên. Túi mác-ma phải là một túi riêng, không lan thành biển dung nham dưới cả mặt đất (misconception inside_is_lava của bài ba). Không có chữ (Duy 10/11: hình không có nhãn chữ); tên "magma · mác-ma", "lava · dung nham" có ở câu của ô và ở ô Từ mới. Câu q2 dùng bản không mũi tên của sơ đồ này. Từ khoá tìm ảnh (EN): volcano cross section magma chamber
image.alt.en: Magma under a volcano and lava outside
image.alt.vi: Mác-ma dưới núi lửa và dung nham bên ngoài
examples.1.en: magma deep down in some places
examples.1.vi: mác-ma ở sâu dưới đất, tại một số nơi
examples.2.en: magma pushes up
examples.2.vi: mác-ma đẩy lên
examples.3.en: lava flows out
examples.3.vi: dung nham chảy ra ngoài
> [CẦN KIỂM] Hai cách nói giản lược cho trẻ bảy đến chín tuổi: đá chỉ nóng chảy thành mác-ma "ở một số nơi" sâu dưới đất (biên tập nhớ: chủ yếu ở phần trên của lớp manti và trong vỏ Trái Đất); mác-ma "đẩy lên" (thật ra mác-ma nhẹ hơn đá rắn xung quanh nên dâng lên, và khí trong mác-ma tạo sức ép).

#### group explore_new_rock
label.en: New rock
label.vi: Đá mới
color: nau_dat
sentence.en: Lava cools into new rock and new land.
sentence.vi: Dung nham nguội đi thành đá mới, đất mới.
image.brief: [ảnh] Bãi đá dung nham đã nguội chạy ra tới biển, thành một mũi đất mới: đá đen xám gồ ghề, vài khóm cỏ, dương xỉ hay cây nhỏ mọc trên đá, sóng trắng vỗ quanh; xa xa có núi lửa yên lặng thì tốt; không có dung nham đỏ, không khói; không có người, không có chữ. Ưu tiên ảnh public domain của USGS (Hawaii). Câu q5 dùng lại ảnh này. Từ khoá tìm ảnh (EN): lava field cooled coast ferns
image.alt.en: Cooled lava made new land by the sea
image.alt.vi: Dung nham nguội thành đất mới bên bờ biển
examples.1.en: dark rock
examples.1.vi: đá sẫm màu
examples.2.en: new island
examples.2.vi: hòn đảo mới
> Chữ "đá ba-dan" và "đá mác-ma" (tên loại đá) để dành cho chủ đề *Đá và đất* (`_topic.md`, mục "Khi soạn bài 2 đến 5"); bài này chỉ nói "đá mới", "đá sẫm màu". "Đất đỏ ba-dan" ở ô "Ở Việt Nam" là tên quen của đất Tây Nguyên nên giữ.

#### group explore_vietnam
label.en: In Vietnam
label.vi: Ở Việt Nam
color: gi_dong
sentence.en: Vietnam has old volcanoes that stopped erupting long ago.
sentence.vi: Việt Nam có núi lửa đã ngừng phun từ rất lâu.
> SK-044 (14/11, A2): câu VI cũ mười ba tiếng, nay mười một. Vẫn không nói "mọi núi lửa ở Việt Nam đều đã tắt".
> [CẦN KIỂM] Câu viết dạng "những núi lửa đã ngừng phun", không viết "mọi núi lửa ở Việt Nam đều đã tắt". Biên tập nhớ có tài liệu về một lần núi lửa phun dưới biển ngoài khơi miền Trung Nam Bộ đầu thế kỷ hai mươi (Hòn Tro), nên chưa dám nói Việt Nam không có núi lửa còn hoạt động. Chuyên gia xác nhận núi lửa Chư Đăng Ya (Tây Nguyên) và các miệng núi lửa trên đảo Lý Sơn được gọi là "núi lửa đã tắt"; không đưa năm hay số triệu năm.
image.brief: [ảnh] Đồi núi lửa đã tắt trên đảo Lý Sơn (núi Thới Lới), chụp từ dưới đồng: ngọn đồi tròn phủ cỏ cây sau ruộng và nhà dân, cắt sát ngọn đồi; trời xanh, không khói; người (nếu có) rất nhỏ, không nhận ra mặt; không có biển chữ, không phải bản đồ. Không lấy núi lửa ở nước khác, vì ô này nói về Việt Nam. Đổi từ núi lửa Chư Đăng Ya ở Tây Nguyên (SK-033, designer chọn ảnh 10/11): không có ảnh Chư Đăng Ya hay núi lửa đã tắt khác ở Tây Nguyên hợp giấy phép. Từ vựng volcano dùng lại ảnh này. Từ khoá tìm ảnh (EN): Ly Son Island volcano hill
image.alt.en: An old volcano hill on Ly Son Island
image.alt.vi: Đồi núi lửa đã tắt trên đảo Lý Sơn
> SK-033 (10/11): alt đổi theo ảnh (trước: "An old volcano hill and red soil" · "Đồi núi lửa đã tắt và đất đỏ"); ảnh không thấy đất đỏ. Câu của ô và ba món ví dụ không đổi: câu nói chung về Việt Nam, món "Ly Son Island · đảo Lý Sơn" khớp ảnh, món "Central Highlands · Tây Nguyên" và "đất đỏ ba-dan" vẫn đúng, đất đỏ có ảnh riêng ở món `tray_red_soil`.
examples.1.en: Central Highlands
examples.1.vi: Tây Nguyên
examples.2.en: Ly Son Island
examples.2.vi: đảo Lý Sơn
examples.3.en: red soil from lava rock
examples.3.vi: đất đỏ ba-dan từ đá dung nham
> [CẦN KIỂM] Đất đỏ ba-dan ở Tây Nguyên hình thành từ đá do dung nham núi lửa thời xưa nguội lại, rồi bị phong hoá qua rất nhiều năm. Cách viết "ba-dan" hay "bazan" trong sách giáo khoa hiện hành: cả chủ đề viết "ba-dan" (bảng Tên gọi ở `_topic.md`), còn syllabus.md viết "bazan"; nên chọn một cách chung cho chủ đề này và *Đá và đất*. Nghe thử giọng VI đọc "ba-dan".
> Dùng tên vùng (Tây Nguyên) và tên đảo (đảo Lý Sơn), không dùng tên tỉnh (tỉnh vừa sáp nhập). Tên núi (Thới Lới, Chư Đăng Ya) chỉ ở gợi ý hình, không có trong chữ bé đọc. Nghe thử giọng EN đọc "Ly Son Island" và "Central Highlands".

### new_words
id: e76ed455-9db5-4e2e-bbc4-a442f3e08768
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: volcano, magma, lava, erupt

## Chơi

> Bé chọn hình từ kệ vào khay ba chỗ. Khay đạt khi có đủ ba dấu vết của núi lửa đã tắt (một loại đá do dung nham nguội tạo thành, đất đỏ, một miệng núi lửa cũ), loại mà Việt Nam cũng có, và không có thứ nào không do núi lửa tạo ra. Chạm hình trong khay để bỏ ra.
> Trò chơi dùng ngay ý ba và ô "Ở Việt Nam" của phần Học, và là bước sửa thứ hai của `volcanoes_far_away`: bé tự tay tìm những dấu vết núi lửa mà Việt Nam cũng có, rồi câu q6 hỏi lại bằng chứng này.
> SK-033 (10/11 tối): ảnh của hai món chụp ở Việt Nam (`tray_island_crater` ở Lý Sơn, `tray_shore_rocks` ở Gành Đá Đĩa); hai món chụp ở nước ngoài (`tray_red_soil` ở Brasil, `tray_dark_rock` ở Mỹ). Vì vậy lời nhắn khi đạt nói "Việt Nam cũng có đủ cả", không nói chính những thứ trong ảnh nằm ở Việt Nam.
> Bẫy có chủ ý: ba món của nhóm `limit` (vỏ ốc, cây dừa, thuyền gỗ) đều là đồ ở bờ biển. Ngược lại, ghềnh đá đen ven biển lại do núi lửa tạo ra. Bé không xếp được theo kiểu "ở biển thì không phải"; bé phải hỏi "thứ này do đâu mà có".
> Vì sao là `build_tray`: ở phần Chơi, schema v1 và app 0.1.0 chỉ có block này. Thứ tự nhắc khi thiếu nhóm theo thứ tự các `#### group`: đá, đất đỏ, miệng núi lửa.

### tray
id: a4a1575a-f7e8-441a-b80b-5b24b5d6215e
type: build_tray
version: 1
prompt.en: Find what old volcanoes made
prompt.vi: Tìm những thứ núi lửa đã tắt tạo ra
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find rock, red soil and a crater. Lava cools into new rock and land.
messages.start.vi: Em tìm đá, đất đỏ và miệng núi lửa nhé. Dung nham nguội đi thành đá mới, đất mới.
> SK-044 (14/11, A2): đảo thứ tự, câu in trong bong bóng là việc cần làm; câu ôn ý ba thành câu chỉ đọc.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
> Lời nhắn không gọi tên vật chứa ("tray", "mâm", "khay"), để vẫn đúng khi app đổi chữ giao diện màn Chơi. Rà chữ 9/11: "tap one", "chạm vào để bỏ ra" như nhãn của app (ios-dev 9/11).
messages.balanced.en: Great! Old volcanoes made all of these. Vietnam has them too.
messages.balanced.vi: Tuyệt! Núi lửa đã tắt tạo ra tất cả những thứ này. Ở Việt Nam cũng có đủ cả.
> SK-033 (10/11 tối): sửa lời nhắn (trước: "Great! Old volcanoes in Vietnam made all of these." · "Tuyệt! Núi lửa đã tắt ở Việt Nam tạo ra tất cả những thứ này."). Mọi tổ hợp đạt đều có món `tray_red_soil`, mà ảnh món này chụp ở Brasil; ảnh `tray_dark_rock` cũng chụp ở Mỹ. Câu cũ nói chính những thứ trong khay do núi lửa ở Việt Nam tạo ra, nên sai với ảnh. Câu mới tách hai ý: núi lửa đã tắt tạo ra những thứ này (đúng với cả bốn ảnh đá, đất, miệng núi lửa); Việt Nam cũng có đủ ba loại (đá ba-dan, đất đỏ ba-dan, miệng núi lửa Thới Lới), nên vẫn sửa `volcanoes_far_away`. Câu EN dài nhất năm từ. Cần sinh lại hai clip (EN, VI).
messages.has_limited.en: A volcano did not make that. Tap it to take it off.
messages.has_limited.vi: Núi lửa không tạo ra thứ này. Em chạm vào để bỏ ra nhé.
messages.missing.tray_rocks.en: You still need lava rock.
messages.missing.tray_rocks.vi: Em còn thiếu đá từ dung nham.
messages.missing.tray_soils.en: You still need red soil.
messages.missing.tray_soils.vi: Em còn thiếu đất đỏ.
messages.missing.tray_craters.en: You still need a crater.
messages.missing.tray_craters.vi: Em còn thiếu miệng núi lửa.
> Lời nhắn thiếu nhóm không dùng "Add/Thêm", vì khay ba chỗ có thể đã đầy khi còn thiếu nhóm (như bài một).

#### group tray_rocks
label.en: Lava rock
label.vi: Đá từ dung nham
color: nau_dat
role: required

#### group tray_soils
label.en: Red soil
label.vi: Đất đỏ
color: do_son
role: required

#### group tray_craters
label.en: Craters
label.vi: Miệng núi lửa
color: gi_dong
role: required

#### group tray_not_volcano
label.en: Not from volcanoes
label.vi: Không do núi lửa
color: cham
role: limit

#### item tray_dark_rock
label.en: Dark rock
label.vi: Hòn đá sẫm màu
group: tray_rocks
image.brief: [ảnh] Một hòn đá ba-dan màu đen xám, mặt có nhiều lỗ nhỏ li ti (lỗ bọt khí), chụp gần trên nền trơn hoặc nền cỏ, cả hòn đá gọn trong khung; cắt bỏ thước đo, nhãn mẫu vật và chữ; không có tay người. Từ khoá tìm ảnh (EN): basalt vesicular rock sample
image.alt.en: A dark rock with tiny holes
image.alt.vi: Hòn đá sẫm màu có lỗ nhỏ
> [CẦN KIỂM] Lỗ nhỏ trên đá ba-dan là chỗ bọt khí trong dung nham để lại khi đá nguội. Loại đá có lỗ này có ở Tây Nguyên và đảo Lý Sơn (biên tập nhớ, chưa tra nguồn).

#### item tray_shell
label.en: Seashell
label.vi: Vỏ ốc biển
group: tray_not_volcano
image.brief: [ảnh] Một vỏ ốc biển màu kem có vân nâu nằm trên cát trắng, chụp gần; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): seashell white sand
image.alt.en: A seashell on the sand
image.alt.vi: Vỏ ốc biển trên cát

#### item tray_island_crater
label.en: Island crater
label.vi: Miệng núi lửa trên đảo
group: tray_craters
image.brief: [ảnh] Một miệng núi lửa cũ trên đảo Lý Sơn chụp từ trên cao (flycam): miệng tròn, lõm, phủ cây xanh, thấy biển ở mép ảnh; chỉ thấy đảo và biển, không thấy đất liền, không phải bản đồ; người (nếu có) rất nhỏ, không có chữ. Ảnh thẻ ly_son thấy rõ miệng núi lửa thì dùng chung. Không có ảnh từ trên cao thì lấy ảnh miệng núi lửa Thới Lới chụp từ trên vành miệng; từ khoá thay thế: Thoi Loi crater Ly Son. Từ khoá tìm ảnh (EN): Ly Son Island crater aerial
image.alt.en: An old crater on an island
image.alt.vi: Miệng núi lửa cũ trên đảo
> SK-033 (10/11): bỏ món "Hill crater · Miệng núi lửa trên đồi" (`tray_hill_crater`, ảnh Chư Đăng Ya ở Tây Nguyên): không có ảnh miệng núi lửa Việt Nam nào khác hợp giấy phép, và món đó không được thay bằng miệng núi lửa ở nước khác. Nhóm "Miệng núi lửa" còn một món này; kệ còn bảy món. Món này chuyển lên chỗ thứ ba của kệ để các nhóm vẫn xếp xen. Từ vựng `crater` và `extinct` dùng lại ảnh này.
> [CẦN KIỂM] Núi lửa Chư Đăng Ya còn thấy rõ miệng núi lửa lõm ở đỉnh, và mùa hoa dã quỳ vàng ở đó (biên tập nhớ, chưa tra nguồn). Ghi lại từ món đã bỏ, để dùng khi tìm được ảnh Chư Đăng Ya hợp giấy phép.

#### item tray_coconut
label.en: Coconut tree
label.vi: Cây dừa
group: tray_not_volcano
image.brief: [ảnh] Một cây dừa cao trên bãi biển, có mấy quả dừa xanh trên ngọn, trời xanh, chụp ngang cả cây; ưu tiên bãi biển Việt Nam; không có người, không có chữ. Từ khoá tìm ảnh (EN): coconut tree beach
image.alt.en: A coconut tree on the beach
image.alt.vi: Cây dừa trên bãi biển

#### item tray_red_soil
label.en: Red soil
label.vi: Đất đỏ
group: tray_soils
image.brief: [ảnh] Một mảnh ruộng đất đỏ ba-dan vừa được cày xới ở bang São Paulo (Brasil), chưa trồng cây, cắt sát mặt ruộng thấy rõ màu đỏ và hạt đất; còn vài chồi cỏ nhỏ, không có cây trồng, để không lẫn với cây dừa; đã cắt bỏ trời, hàng rào, cột điện; không có người, không có chữ. Không có ảnh đất đỏ ba-dan ở Tây Nguyên hợp giấy phép; tìm được thì thay ảnh này. Từ khoá tìm ảnh (EN): red soil field Vietnam basalt
image.alt.en: Red soil in a field
image.alt.vi: Đất đỏ trên ruộng
> SK-033 (10/11 tối): ảnh chụp ở Brasil, không phải Tây Nguyên. [CẦN KIỂM] Designer ghi đất đỏ trong ảnh (terra roxa) hình thành từ đá ba-dan, cùng loại đất đỏ ba-dan như Tây Nguyên; chuyên môn xác nhận đất này do dung nham núi lửa thời xưa nguội lại rồi phong hoá mà thành, vì chữ của trò chơi nói núi lửa đã tắt tạo ra thứ này. Ảnh hơi nhoè (chụp từ xe đang chạy); nhờ tester xem ở ô kệ Chơi trên iPhone. Lời nhắn khi đạt đã sửa để không nói thứ trong ảnh nằm ở Việt Nam (xem dưới `messages.balanced`).

#### item tray_shore_rocks
label.en: Dark rocks by the sea
label.vi: Ghềnh đá đen ven biển
> Rà chữ 9/11 (tester, lỗi nhỏ 9): nhãn EN cũ "Rocks by the sea" chung chung, chưa khớp nhãn VI "Ghềnh đá đen". Chữ "dark" nối với món ví dụ "dark rock · đá sẫm màu" ở ô Đá mới.
group: tray_rocks
image.brief: [ảnh] Ghềnh đá đen xám gồ ghề ven biển, sóng trắng vỗ vào, chụp gần vừa; ưu tiên bờ đá núi lửa ở đảo Lý Sơn; không có ảnh hợp giấy phép thì lấy Gành Đá Đĩa (Phú Yên), bờ đá ba-dan hình cột ven biển; không có người, không có chữ. Từ khoá thay thế: Ganh Da Dia basalt columns. Từ khoá tìm ảnh (EN): black rocks coast Ly Son Island
image.alt.en: Dark rocks by the sea
image.alt.vi: Ghềnh đá đen ven biển
> [CẦN KIỂM] Bờ đá đen ở đảo Lý Sơn là đá núi lửa (biên tập nhớ, chưa tra nguồn). Gành Đá Đĩa là đá ba-dan do dung nham nguội tạo thành (biên tập nhớ, chưa tra nguồn).

#### item tray_boat
label.en: Wooden boat
label.vi: Thuyền gỗ
group: tray_not_volcano
image.brief: [ảnh] Chiếc thuyền gỗ đánh cá của Việt Nam sơn xanh đỏ, mũi thuyền vẽ đôi mắt, đậu trên bãi cát, chụp ngang; không có người; cắt bỏ hoặc chọn góc không thấy số đăng ký và chữ trên mạn thuyền. Từ khoá tìm ảnh (EN): fishing boat Vietnam painted eyes
image.alt.en: A wooden fishing boat
image.alt.vi: Thuyền gỗ đánh cá

## Quiz

### q1
id: 20ebab31-0528-4b7c-948f-a73e74ca2541
format: single_choice
version: 1
dok: 1
prompt.en: What comes out when a volcano erupts?
prompt.vi: Núi lửa phun trào ra thứ gì?
image.brief: [ảnh] Một núi lửa hình nón đang yên lặng, chụp từ xa: sườn dốc đều, miệng núi lửa trên đỉnh; không có dung nham, không có cột tro (một chút hơi nước trắng trên đỉnh thì được); người, nhà (nếu có) rất nhỏ ở xa; không có chữ. Ảnh không cho thấy thứ gì trào ra, để không lộ đáp án. Câu q3, q4 và câu w1 bài năm dùng lại ảnh này. Từ khoá tìm ảnh (EN): volcano cone quiet landscape
image.alt.en: A quiet volcano
image.alt.vi: Núi lửa đang yên lặng
hint.en: Think of the volcano picture. What was red and hot?
hint.vi: Em nhớ lại hình núi lửa. Thứ gì đỏ rực và nóng?
explanation_correct.en: Melted rock is so hot that it glows red.
explanation_correct.vi: Đá nóng chảy nóng tới mức đỏ rực lên.
explanation_wrong.en: A volcano pours out red-hot melted rock.
explanation_wrong.vi: Núi lửa phun ra đá nóng chảy đỏ rực.

#### option q1_ice
correct: false
feedback.en: Ice is cold, but a volcano is very hot.
feedback.vi: Nước đá lạnh, còn núi lửa rất nóng.
label.en: ice
label.vi: nước đá
image.brief: [ảnh] Mấy viên nước đá trong suốt trong cốc thuỷ tinh, chụp gần, nền trơn; không có nhãn hiệu, không có chữ. Câu q5 dùng lại ảnh này. Từ khoá tìm ảnh (EN): ice cubes glass
image.alt.en: Ice in a glass
image.alt.vi: Nước đá trong cốc

#### option q1_melted_rock
correct: true
label.en: hot melted rock
label.vi: đá nóng chảy
image.brief: Dùng lại hình `q4_slope`. Từ khoá tìm ảnh (EN): lava flow volcano slope
image.alt.en: Red-hot lava on a volcano
image.alt.vi: Dung nham đỏ rực trên sườn núi lửa

#### option q1_rain
correct: false
feedback.en: Rain falls from clouds in the sky.
feedback.vi: Mưa rơi xuống từ những đám mây.
label.en: rain
label.vi: nước mưa
image.brief: [ảnh] Mưa to trút xuống một căn nhà gỗ nhỏ giữa vườn cây, thấy rõ những vệt mưa trắng; không có người, không có chữ. Lựa chọn q1_rain của bài năm dùng lại ảnh này. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi
> SK-033 (Duy duyệt ảnh 10/11): khác brief cũ (mưa trên tàu lá chuối hoặc mái ngói); ảnh chụp ở Estonia. Alt đổi theo; nhãn "rain · nước mưa" không đổi.

### q2
id: 569cbc6f-b783-4f24-b522-1376ec9272ff
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing words
prompt.vi: Chọn từ còn thiếu
image.brief: [hình vẽ] Cùng sơ đồ tự vẽ của ô `explore_magma`, bản không có mũi tên: thấy túi mác-ma dưới đất và dòng dung nham bên ngoài. Không có chữ, vì nhãn chữ sẽ lộ đáp án. Từ khoá tìm ảnh (EN): volcano cross section magma chamber
image.alt.en: Melted rock under and outside a volcano
image.alt.vi: Đá nóng chảy dưới núi lửa và bên ngoài
sentence.en: Melted rock is {1} underground and {2} outside.
sentence.vi: Đá nóng chảy dưới đất là {1}, ra ngoài là {2}.
> SK-044 (14/11, A2): câu điền cũ hai câu, mười bốn từ. Gộp thành một câu như câu ô Mác-ma và dung nham; thứ tự hai chỗ trống giữ nguyên.
answers: q2_magma, q2_lava
hint.en: Remember the volcano picture, cut in half.
hint.vi: Em nhớ lại hình núi lửa bổ đôi ở phần Học nhé.
explanation_correct.en: Magma rises up and flows out as lava.
explanation_correct.vi: Mác-ma dâng lên, trào ra ngoài thành dung nham.
explanation_wrong.en: It is magma underground, then lava when it comes out.
explanation_wrong.vi: Ở dưới đất là mác-ma, trào ra thì là dung nham.
> Hai ô trống, cùng thứ tự ở câu EN và câu VI. Gợi ý chỉ vào hình ô explore_magma và câu của ô đó, không nói thẳng đáp án. Hình ô explore_magma không có nhãn chữ (Duy 10/11).
> SK-033 (9/11): thẻ có hình làm câu dễ hơn, vì bé ghép được theo hình (túi đá dưới đất là mác-ma, dòng chảy bên ngoài là dung nham). Vẫn đúng ý bài; ảnh câu hỏi là sơ đồ không nhãn nên không gọi tên. Ba hình thẻ dùng lại ba lựa chọn của câu q4, để bé gặp lại đúng hình đó ở câu sau.

#### bank q2_lava
label.en: lava
label.vi: dung nham
image.brief: Dùng lại hình `q4_slope`. Từ khoá tìm ảnh (EN): lava flow volcano slope
image.alt.en: Red-hot lava on a volcano
image.alt.vi: Dung nham đỏ rực trên sườn núi lửa

#### bank q2_ash
label.en: ash
label.vi: tro núi lửa
feedback.en: Ash is grey dust that flies into the sky.
feedback.vi: Tro là bụi xám bay lên trời.
image.brief: Dùng lại hình `q4_ash`. Từ khoá tìm ảnh (EN): ash plume volcano distant
image.alt.en: Grey ash rising into the sky
image.alt.vi: Tro xám bay lên trời

#### bank q2_magma
label.en: magma
label.vi: mác-ma
image.brief: Dùng lại hình `q4_underground`. Từ khoá tìm ảnh (EN): magma chamber diagram underground
image.alt.en: Melted rock deep under the ground
image.alt.vi: Đá nóng chảy sâu dưới lòng đất

### q3
id: a2dd16a1-5e33-49a7-800b-4c677634c553
format: single_choice
version: 1
dok: 2
prompt.en: How does a volcano erupt?
prompt.vi: Núi lửa phun trào như thế nào?
image.brief: Dùng lại hình `q1`. Ảnh núi lửa yên lặng không cho thấy bên trong có gì, để không lộ đáp án. Từ khoá tìm ảnh (EN): volcano cone quiet landscape
image.alt.en: A quiet volcano
image.alt.vi: Núi lửa đang yên lặng
hint.en: Think about what is deep under the volcano.
hint.vi: Em nghĩ xem sâu dưới núi lửa có gì nhé.
explanation_correct.en: Magma rises up a narrow pipe, then flows out.
explanation_correct.vi: Mác-ma dâng lên theo một ống hẹp rồi trào ra.
explanation_wrong.en: Hot magma deep below pushes up and out.
explanation_wrong.vi: Mác-ma nóng ở sâu bên dưới đẩy lên, trào ra.
> Rà chữ 9/11 (tester, lỗi nhỏ 8): giải thích sai cũ chỉ nói "đó là đá nóng chảy, không phải lửa", không khớp khi bé chọn Mặt Trời. Câu mới nói tới cả hai lựa chọn sai.
> SK-044 (14/11, A2): giải thích sai còn một câu nói lý do; vì sao lửa và Mặt Trời chưa đúng nay nằm ở `feedback` của từng lựa chọn. Ý "mác-ma là đá nóng chảy" đã có ở câu q1 và câu q2 ngay trước. Ba lựa chọn bỏ dấu chấm cuối câu cho giống các bài khác.
> DOK 2: chọn cách giải thích đúng cho một quá trình. Hai lựa chọn sai là hai cách nghĩ ngây thơ: bên trong núi có lửa cháy (tên tiếng Việt "núi lửa" dễ gợi ý này) và Mặt Trời làm núi nóng. Câu không gắn `misconception` vì Discoverer chỉ có đúng một câu như vậy. Ý "núi lửa có lửa cháy" đã được ghi thành key `volcano_is_fire` trong `_topic.md` (rà chéo 9/11), chỉ để ghi nhận, không gắn ở câu này.
> Khi app hiện được `order_sequence`, câu này nên đổi thành câu sắp thứ tự ba thẻ: mác-ma đẩy lên, dung nham trào ra, dung nham nguội thành đá (xem Ghi chú cho dev).

> SK-033 (9/11): ba lựa chọn đều là ảnh chụp. Ảnh lựa chọn đúng là vòi dung nham phun lên từ lòng đất, không dùng sơ đồ ô explore_magma: sơ đồ duy nhất giữa hai ảnh sẽ lộ đáp án. Ảnh đống lửa và ảnh vòi dung nham cùng màu cam, nên bé phải phân biệt đá nóng chảy với lửa cháy, đúng chỗ dễ nhầm `volcano_is_fire`.

#### option q3_fire
correct: false
feedback.en: Deep underground, there is no wood to burn.
feedback.vi: Sâu dưới lòng đất không có củi để cháy.
label.en: A fire burns inside it
label.vi: Lửa cháy bên trong núi
image.brief: [ảnh] Một đống lửa củi đang cháy, ngọn lửa vàng cam, chụp gần trên nền tối; không có người, không có chữ. Từ khoá tìm ảnh (EN): campfire flames wood
image.alt.en: A wood fire burning
image.alt.vi: Đống lửa củi đang cháy

#### option q3_sun
correct: false
feedback.en: The sun warms the ground, but only a little.
feedback.vi: Mặt Trời chỉ sưởi ấm mặt đất một chút.
label.en: The sun makes it hot
label.vi: Mặt Trời làm núi nóng lên
image.brief: [ảnh] Mặt Trời chói sáng trên bầu trời xanh trong, chụp từ mặt đất, mép dưới có ngọn cây hoặc mái nhà; không có người, không có chữ. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời

#### option q3_magma
correct: true
label.en: Magma pushes up and out
label.vi: Mác-ma đẩy lên và trào ra ngoài
image.brief: [ảnh] Dung nham đỏ cam phun vọt lên từ một khe trên mặt đất (vòi dung nham), chụp từ xa vừa; không có người, nhà, không có chữ; ưu tiên ảnh public domain của USGS, không kèm logo. Ảnh cho thấy đá nóng chảy từ dưới đẩy lên và trào ra. Từ khoá tìm ảnh (EN): lava fountain eruption vent
image.alt.en: Lava pushing up out of the ground
image.alt.vi: Dung nham trào lên từ lòng đất

### q4
id: 1edf91ae-8f34-4065-a8a6-ba08e08f01af
format: multi_choice
version: 1
dok: 2
prompt.en: Which pictures show lava?
prompt.vi: Hình nào có dung nham?
image.brief: Dùng lại hình `q1`. Ảnh câu hỏi không có dung nham, để không lộ đáp án. Từ khoá tìm ảnh (EN): volcano cone quiet landscape
image.alt.en: A quiet volcano
image.alt.vi: Núi lửa đang yên lặng
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
hint.en: Is the melted rock outside or under the ground?
hint.vi: Đá nóng chảy ở bên ngoài hay ở dưới lòng đất?
explanation_correct.en: Lava can flow down a volcano or into the sea.
explanation_correct.vi: Dung nham chảy xuống sườn núi hoặc xuống biển.
explanation_wrong.en: Lava is melted rock outside, even in the sea.
explanation_wrong.vi: Ra ngoài là dung nham, kể cả khi chảy xuống biển.
> Áp dụng ý hai vào bốn hình mới. Nhãn lựa chọn chỉ nói chỗ của đá nóng chảy, không nói "magma" hay "lava", để bé phải tự xếp. Hình q4_underground không có nhãn chữ (như mọi hình của bài), để không lộ đáp án.

#### option q4_ash
correct: false
feedback.en: Ash is grey dust, not melted rock.
feedback.vi: Tro là bụi xám, không phải đá nóng chảy.
label.en: ash in the sky
label.vi: tro bay trên trời
image.brief: [ảnh] Cột tro núi lửa màu xám bay cao lên trời từ đỉnh một núi lửa ở rất xa; không thấy dung nham đỏ; không có người, nhà, không có chữ; ưu tiên ảnh public domain của USGS, không kèm logo. Câu q2 (thẻ q2_ash) và từ vựng ash dùng lại ảnh này. Từ khoá tìm ảnh (EN): ash plume volcano distant
image.alt.en: Grey ash rising into the sky
image.alt.vi: Tro xám bay lên trời

#### option q4_slope
correct: true
label.en: on a volcano
label.vi: trên sườn núi lửa
image.brief: [ảnh] Dòng dung nham đỏ cam chảy chậm xuống sườn núi lửa, chụp gần vừa; mép dòng chảy đã nguội thành viền đen; không có người, không có cây cháy, không có chữ; ưu tiên ảnh public domain của USGS (Hawaii), không kèm logo. Câu q1, q2, từ vựng lava và bài năm dùng lại ảnh này. Từ khoá tìm ảnh (EN): lava flow volcano slope
image.alt.en: Red-hot lava on a volcano
image.alt.vi: Dung nham đỏ rực trên sườn núi lửa

#### option q4_underground
correct: false
feedback.en: Under the ground, melted rock has another name.
feedback.vi: Dưới lòng đất, đá nóng chảy có tên khác.
label.en: under the ground
label.vi: dưới lòng đất
image.brief: [hình vẽ] Cùng sơ đồ tự vẽ của ô `explore_magma`, bản chỉ có phần dưới đất: núi lửa chưa phun; sâu bên dưới, giữa lớp đá rắn, có một túi mác-ma màu cam và ống dẫn dừng sâu dưới đất; trên mặt đất không thấy đá nóng chảy, không có mũi tên. Không có chữ, vì nhãn chữ sẽ lộ đáp án. Câu q2 (thẻ q2_magma) và bài năm dùng lại hình này. Từ khoá tìm ảnh (EN): magma chamber diagram underground
image.alt.en: Melted rock deep under the ground
image.alt.vi: Đá nóng chảy sâu dưới lòng đất

#### option q4_sea
correct: true
label.en: into the sea
label.vi: chảy xuống biển
image.brief: [ảnh] Dòng dung nham đỏ cam chảy xuống biển, hơi nước trắng bốc lên chỗ gặp nước, mép đá đã nguội màu đen, chụp từ xa; không có người, thuyền, không có chữ; ưu tiên ảnh public domain của USGS (Hawaii), không kèm logo. Câu q5 dùng lại ảnh này. Từ khoá tìm ảnh (EN): lava ocean entry steam
image.alt.en: Lava flowing into the sea
image.alt.vi: Dung nham chảy xuống biển

### q5
id: 5302f303-510f-468b-a8f1-70526df0e8e3
format: single_choice
version: 1
dok: 2
prompt.en: What can lava make when it cools in the sea?
prompt.vi: Dung nham nguội trong biển có thể tạo ra gì?
> SK-044 (14/11, A2): câu cũ hai câu, mười ba từ; gộp thành một câu mười từ, mười tiếng. Ảnh dung nham chảy xuống biển giữ ngữ cảnh.
image.brief: Dùng lại hình `q4_sea`. Ảnh chưa cho thấy dung nham nguội thành gì, để không lộ đáp án. Từ khoá tìm ảnh (EN): lava ocean entry steam
image.alt.en: Lava flowing into the sea
image.alt.vi: Dung nham chảy xuống biển
hint.en: Think of Ly Son Island. How was it made?
hint.vi: Em nghĩ tới đảo Lý Sơn. Đảo ấy được tạo ra thế nào?
explanation_correct.en: New land can grow out into the sea this way.
explanation_correct.vi: Đất mới có thể lấn dần ra biển như thế.
explanation_wrong.en: Lava cools and hardens into new rock and land.
explanation_wrong.vi: Dung nham nguội, cứng lại thành đá và đất mới.
> Áp dụng ý ba vào chỗ mới (biển). Gợi ý chỉ vào ví dụ đảo Lý Sơn ở ô "Ở Việt Nam" và món tray_island_crater, không nói thẳng đáp án. Câu không nói Lý Sơn được tạo ra đúng theo cách này (xem [CẦN KIỂM] ở thẻ ly_son).
> SK-033 (9/11): ba lựa chọn nay có hình (trước đây chỉ có chữ). Ba hình đều là ảnh chụp; ảnh đất mới dùng lại ô explore_new_rock mà bé đã xem ở phần Học, đúng ý chính ba.

#### option q5_land
correct: true
label.en: new land
label.vi: đất mới
image.brief: Dùng lại hình `explore_new_rock`. Từ khoá tìm ảnh (EN): lava field cooled coast ferns
image.alt.en: Cooled lava made new land by the sea
image.alt.vi: Dung nham nguội thành đất mới bên bờ biển

#### option q5_water
correct: false
feedback.en: Lava is rock, so it cannot turn into water.
feedback.vi: Dung nham là đá, không biến thành nước được.
label.en: more sea water
label.vi: thêm nước biển
image.brief: [ảnh] Mặt nước biển xanh có sóng nhỏ, chụp gần, chỉ thấy nước, không thấy bờ, đá hay đất; không có người, không có chữ. Từ khoá tìm ảnh (EN): sea water small waves
image.alt.en: Sea water with small waves
image.alt.vi: Nước biển có sóng nhỏ

#### option q5_ice
correct: false
feedback.en: Ice is frozen water, and lava is rock.
feedback.vi: Nước đá là nước đông, còn dung nham là đá.
label.en: ice
label.vi: nước đá
image.brief: Dùng lại hình `q1_ice`. Từ khoá tìm ảnh (EN): ice cubes glass
image.alt.en: Ice in a glass
image.alt.vi: Nước đá trong cốc

### q6
id: 8ec55427-b042-4e49-8ace-1612399e0b4e
format: true_false
version: 1
dok: 3
misconception: volcanoes_far_away
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
image.brief: Dùng lại hình `explore_erupt`. Núi lửa đang phun ở một nơi xa, như bé hay thấy trên ti vi; ảnh không cho thấy núi lửa nào ở Việt Nam, để không lộ đáp án. Từ khoá tìm ảnh (EN): volcano erupting lava night distant
image.alt.en: A volcano erupting
image.alt.vi: Núi lửa đang phun trào
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
> Rà chữ 9/11 (tester N1): nhãn trung tính chung cho cả năm câu sáu, xem ghi chú ở câu q6 bài một.
statement.en: I only see volcanoes on TV, so Vietnam has none.
statement.vi: Chỉ thấy núi lửa trên ti vi, nên Việt Nam không có.
> SK-044 (14/11, A2): lời Na gộp thành một câu (mười từ, mười hai tiếng).
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
hint.en: Think of the crater and red soil you found.
hint.vi: Em nghĩ tới miệng núi lửa và đất đỏ em vừa tìm thấy nhé.
> SK-033 (10/11): "craters" đổi thành "crater", vì kệ Chơi nay chỉ còn một miệng núi lửa. Câu VI không đổi. Cần sinh lại giọng EN của gợi ý này.
explanation_correct.en: Vietnam has old volcanoes, like on Ly Son Island.
explanation_correct.vi: Việt Nam có núi lửa đã tắt, ví dụ trên đảo Lý Sơn.
explanation_wrong.en: Ly Son and the Central Highlands have old volcanoes.
explanation_wrong.vi: Lý Sơn và Tây Nguyên đều có núi lửa đã tắt.
feedback_true.en: Old volcanoes are quiet, so they are easy to miss.
feedback_true.vi: Núi lửa đã tắt yên lặng, khó nhận ra.
> DOK 3: bắt lỗi một lập luận (chưa tự thấy thì cho là không có). Gợi ý chỉ vào bằng chứng bé vừa tìm ở phần Chơi, không nói thẳng đáp án. Giải thích khi đúng không mở đầu bằng "Yes!", vì đáp án là "No" (như câu q6 của bài một).

## Từ vựng

### volcano
id: 155b1265-d185-4471-ae55-b5399013dc4c
tier: core
term.en: volcano
term.vi: núi lửa
example.en: Vietnam has old volcanoes, too.
example.vi: Việt Nam cũng có những núi lửa đã tắt.
image.brief: Dùng lại hình `explore_vietnam`. Từ khoá tìm ảnh (EN): Ly Son Island volcano hill
image.alt.en: An old volcano hill on Ly Son Island
image.alt.vi: Đồi núi lửa đã tắt trên đảo Lý Sơn
> Câu ví dụ nhắc lại ý sửa `volcanoes_far_away` thêm một lần. Hình núi lửa đang phun đã có ở từ `erupt`.

### magma
id: 02739bd0-9ac6-4f6e-807d-d17329d8fc6e
tier: core
term.en: magma
term.vi: mác-ma
example.en: Magma is deep under the ground.
example.vi: Mác-ma nằm sâu dưới lòng đất.
image.brief: Dùng lại hình `explore_magma`. Từ khoá tìm ảnh (EN): volcano cross section magma chamber
image.alt.en: Magma under a volcano and lava outside
image.alt.vi: Mác-ma dưới núi lửa và dung nham bên ngoài

### lava
id: 565236a7-68ed-41b2-a3db-183b940b0df8
tier: core
term.en: lava
term.vi: dung nham
example.en: Red-hot lava flows down the volcano.
example.vi: Dung nham đỏ rực chảy xuống sườn núi lửa.
image.brief: Dùng lại hình `q4_slope`. Từ khoá tìm ảnh (EN): lava flow volcano slope
image.alt.en: Red-hot lava on a volcano
image.alt.vi: Dung nham đỏ rực trên sườn núi lửa

### erupt
id: bb73d7a1-10c4-48f5-ab1c-2ec6b5ee5619
tier: core
term.en: erupt
term.vi: phun trào
example.en: When a volcano erupts, lava comes out.
example.vi: Khi núi lửa phun trào, dung nham trào ra.
image.brief: Dùng lại hình `explore_erupt`. Từ khoá tìm ảnh (EN): volcano erupting lava night distant
image.alt.en: A volcano erupting
image.alt.vi: Núi lửa đang phun trào

### crater
id: e2655023-570c-4d26-88c9-c6c8317f8c4d
tier: extra
term.en: crater
term.vi: miệng núi lửa
example.en: The crater is at the top of the volcano.
example.vi: Miệng núi lửa nằm ở trên đỉnh núi lửa.
image.brief: Dùng lại hình `tray_island_crater`. Từ khoá tìm ảnh (EN): Ly Son Island crater aerial
image.alt.en: An old crater on an island
image.alt.vi: Miệng núi lửa cũ trên đảo
> SK-033 (10/11): trước dùng lại hình món `tray_hill_crater` (đã bỏ khỏi kệ Chơi). Từ `extinct` cũng dùng lại hình này; câu ví dụ hai từ khác nhau nên hai thẻ vẫn khác nhau.

### ash
id: d6c349e7-4eca-4e43-8680-36c726f00431
tier: extra
term.en: ash
term.vi: tro núi lửa
example.en: Ash from a volcano is tiny bits of rock.
example.vi: Tro núi lửa là những mảnh đá rất nhỏ.
image.brief: Dùng lại hình `q4_ash`. Từ khoá tìm ảnh (EN): ash plume volcano distant
image.alt.en: Grey ash rising into the sky
image.alt.vi: Tro xám bay lên trời
> [CẦN KIỂM] Tro núi lửa là những mảnh đá và thuỷ tinh núi lửa rất nhỏ, không phải tro do cháy như tro bếp. Câu ví dụ nói vậy để tránh ý "núi lửa có lửa cháy" (xem câu q3).

### extinct
id: c0bb6ee1-eb92-4fbc-8182-022879027b09
tier: extra
term.en: extinct
term.vi: đã tắt
example.en: An extinct volcano stopped erupting long ago.
example.vi: Núi lửa đã tắt ngừng phun trào từ rất lâu rồi.
image.brief: Dùng lại hình `tray_island_crater`. Từ khoá tìm ảnh (EN): Ly Son Island crater aerial
image.alt.en: An old crater on an island
image.alt.vi: Miệng núi lửa cũ trên đảo
> [CẦN KIỂM] Nghĩa "extinct volcano" cho trẻ: núi lửa đã ngừng phun từ rất lâu và người ta cho là sẽ không phun nữa (khác "dormant", núi lửa đang nghỉ). Tiếng Việt dịch "đã tắt" hay "đã ngừng hoạt động"; khớp với câu hỏi ở `volcanoes_far_away` trong `_topic.md`.

## Thưởng

### ly_son
id: bd94242b-652e-4114-b476-5b240f8e1141
set: earth
rarity: common
name.en: Ly Son Island
name.vi: Đảo Lý Sơn
tag.en: Old volcanoes
tag.vi: Núi lửa đã tắt
fact.en: Ly Son Island was made by volcanoes long ago. You can still see old craters there.
fact.vi: Đảo Lý Sơn do núi lửa tạo ra từ rất lâu rồi. Ngày nay trên đảo vẫn còn những miệng núi lửa cũ.
> [CẦN KIỂM] Đảo Lý Sơn hình thành từ hoạt động của núi lửa, và trên đảo còn thấy các miệng núi lửa cũ (biên tập nhớ tên núi Thới Lới, Giếng Tiền). Không đưa số miệng núi lửa hay số năm. Nghe thử giọng EN đọc "Ly Son Island".
image.brief: [ảnh] Từ đỉnh núi Thới Lới nhìn xuống bờ đảo Lý Sơn: ruộng tỏi chia ô nhỏ, bãi cát, vách đá, biển xanh; chỉ thấy đảo và biển, không thấy đất liền, không phải bản đồ; một người rất nhỏ ở mép ảnh; không có biển chữ. Ảnh không thấy rõ miệng núi lửa (miệng núi lửa có ở ảnh món `tray_island_crater`). Từ khoá tìm ảnh (EN): Ly Son Island garlic fields coast
image.alt.en: Ly Son Island by the sea
image.alt.vi: Đảo Lý Sơn bên biển xanh
> SK-033 (Duy duyệt ảnh 10/11): khác brief cũ, ảnh không thấy rõ miệng núi lửa; alt đổi theo. Chữ của thẻ ("You can still see old craters there") nói về đảo, không nói ảnh có miệng núi lửa, nên giữ.

## Ghi chú cho hoạ sĩ

- **SK-033 (9/11): hình là ảnh chụp thật hoặc sơ đồ khoa học**, không còn vẽ giấy cắt; không lấy hình AI từ nguồn ngoài, không dùng tranh hoạt hình.
  - **Duy chốt 10/11:** đồ vật không có ảnh miễn phí hợp lệ thì designer vẽ minh hoạ gần thực tế (hình tự vẽ, credit "Science Kids"); cảnh khó thì ghép từ ảnh có sẵn; hình không có chữ, kể cả nhãn chữ song ngữ. Ở bài này: ba bản sơ đồ mặt cắt núi lửa (`explore_magma`, câu q2, `q4_underground`) là hình tự vẽ.
  - Cú pháp `brief` theo `content/TEMPLATE.md` (mục A, đoạn "Hình"). Loại hình dùng trong bài: `[ảnh]`, `[hình vẽ]` (hình tự vẽ). Ảnh có phương án thay ghi thêm "Từ khoá thay thế: …" trong brief, trước dòng từ khoá chính.
  - Giấy phép và cách kiểm từng ảnh theo SK-033, mục "Giấy phép": chỉ CC0, public domain hoặc PDM có nhãn rõ, CC BY. Nhiều ảnh núi lửa nên lấy của USGS (public domain), bỏ logo cơ quan.
  - Việc của designer trên ảnh: đặt ảnh lên mảnh giấy (không viền), cắt khung. Designer không vẽ thêm vật mới lên ảnh chụp; hình tự vẽ là file riêng, tả ở brief `[hình vẽ]`.
  - "Dùng lại hình `<key>`" là dùng đúng file ảnh đã chọn cho khoá đó. "Cùng sơ đồ tự vẽ của `<key>`" là bản designer vẽ từ sơ đồ ở khoá đó, thành một file riêng.
- **Phong cảnh Việt Nam:** đảo Lý Sơn (đồi núi lửa Thới Lới, bờ đá đen, ruộng tỏi, thuyền đánh cá); núi lửa đã tắt Chư Đăng Ya ở Tây Nguyên (hoa dã quỳ vàng, vườn cà phê, đất đỏ) chưa có ảnh hợp giấy phép. Hai ô có địa danh Việt Nam (`explore_vietnam`, `tray_island_crater`) và thẻ `ly_son` không được thay bằng ảnh ở nước khác, vì chữ của bài nói những thứ này ở Việt Nam.
- **Núi lửa đang phun nói nhẹ nhàng, không gây sợ:**
  - luôn chụp từ xa, cảnh hùng vĩ;
  - không có người, con vật, nhà cửa, xe cộ ở gần;
  - không có rừng cháy hay cảnh tàn phá;
  - không có ngọn lửa trong ảnh núi lửa (dung nham là đá nóng chảy, không phải lửa, xem câu q3). Ảnh đống lửa chỉ ở lựa chọn sai `q3_fire`.

  Hình có núi lửa đang phun hoặc dung nham: `explore_erupt`, `q3_magma`, `q4_ash`, `q4_slope`, `q4_sea`.
- **Sơ đồ mặt cắt núi lửa** (designer tự vẽ 10/11, vì không có sơ đồ public domain hợp đường ảnh) có ba bản, cả ba **không có chữ**:
  - `explore_magma`: mác-ma là một túi đá nóng chảy nằm riêng trong lớp đá rắn, không lan thành "biển dung nham" dưới cả mặt đất (misconception `inside_is_lava` của bài ba); có mũi tên cong chỉ lên;
  - câu q2: cùng sơ đồ, **không mũi tên**;
  - `q4_underground`: chỉ có túi mác-ma dưới đất, không có dung nham bên ngoài, không mũi tên.
- **Bản đồ** (Duy chốt 9/11, SK-031): bài này không có hình bản đồ. Nếu ảnh nào thấy vùng Đông Nam Á như một bản đồ thì phải theo bản đồ chuẩn của Nhà nước, đủ quần đảo Hoàng Sa, Trường Sa, và gửi người duyệt pháp lý trước khi phát hành; cách an toàn là chọn ảnh khác.
  - đảo Lý Sơn (`tray_island_crater`, thẻ `ly_son`) là ảnh chụp từ trên cao, chỉ có đảo và biển, không thấy đất liền;
  - không có quả địa cầu hay ảnh Trái Đất từ vũ trụ trong bài này.
- **Bảy hình ở kệ Chơi** cùng khung, cùng kiểu chụp gần vừa; mỗi hình một vật. Món miệng núi lửa trên đồi (`tray_hill_crater`) đã bỏ (SK-033, 10/11): không có ảnh miệng núi lửa Việt Nam nào khác hợp giấy phép.
  - Hòn đá sẫm màu và ghềnh đá ven biển phải thấy rõ mặt đá đen; hòn đá có lỗ nhỏ.
  - Đất đỏ: trong khung không có cây trồng, để không lẫn với cây dừa (nhóm "Không do núi lửa").
  - Miệng núi lửa trên đảo phải thấy rõ chỗ lõm hình cái bát; không khói.
  - Vỏ ốc, cây dừa, thuyền gỗ là đồ ở bờ biển, cùng bối cảnh với ghềnh đá ven biển. Đây là bẫy có chủ ý; chọn ảnh ba món này cùng kiểu với ghềnh đá.
- **Không lộ đáp án:** ảnh câu hỏi q1, q3, q4 là núi lửa đang yên lặng (không có dung nham); hình câu q2 là sơ đồ tự vẽ không có chữ; ảnh câu q6 là núi lửa ở nơi xa; ảnh câu w3 là bãi cát nhìn từ trong đảo, không thấy nước bao quanh.
- **Số hình (SK-033):** bốn mươi bảy ô hình trong bài (bỏ món `tray_hill_crater`, 10/11), từ hai mươi ba ảnh hoặc sơ đồ gốc riêng của bài, cộng năm hình dùng lại của bài ba (ảnh làng ở w1, ba bản sơ đồ mặt cắt Trái Đất ở w1, hình ghép `explore_mantle` ở w2).
  - Học: núi lửa đang phun; sơ đồ mặt cắt núi lửa (hình tự vẽ, ba bản); bãi đá dung nham nguội ra biển; đồi núi lửa đã tắt trên đảo Lý Sơn.
  - Chơi: đá ba-dan có lỗ; vỏ ốc; miệng núi lửa trên đảo (có thể chung ảnh với thẻ `ly_son`); cây dừa; đất đỏ; ghềnh đá đen; thuyền gỗ.
  - Khởi động và Quiz: bãi cát trên đảo (w3); núi lửa yên lặng (q1, q3, q4); nước đá; mưa; cột tro; dòng dung nham trên sườn; dung nham chảy xuống biển; đống lửa; Mặt Trời; vòi dung nham; mặt nước biển.
  - Thẻ: đảo Lý Sơn từ trên cao.
- **Dùng lại:**
  - trong bài: `q4_slope` dùng ở q1, q2 và từ `lava`; `q4_ash` ở q2 và từ `ash`; `q4_underground` ở q2; `q4_sea` ở q5; `q1_ice` ở q5; `explore_new_rock` ở q5; `explore_erupt` ở q6 và từ `erupt`; ảnh núi lửa yên lặng của q1 ở q3, q4; `tray_island_crater` ở từ `crater` và `extinct`; bảy từ vựng dùng hình ô Học, kệ Chơi và câu q4;
  - từ bài ba: câu w1 dùng ảnh làng của câu w2 và ba bản sơ đồ `q1_crust`, `q1_mantle`, `q1_core`; câu w2 dùng hình ô `explore_mantle`;
  - bài năm dùng lại: núi lửa yên lặng (q1, ở câu w1), `q4_slope` (w1_lava), `q4_underground` (w1_magma). Từ 10/11 tối bài năm không dùng lại `explore_erupt` và `q1_rain` nữa (lựa chọn q1_lava, thẻ q4_erupts, q4_lava, q1_rain của bài năm là hình tự vẽ).
- **Màu:**
  - Ở Học: phun trào `do_son`, mác-ma và dung nham `vang_hoe`, đá mới `nau_dat`, Việt Nam `gi_dong`.
  - Ở Chơi: đá `nau_dat`, đất đỏ `do_son`, miệng núi lửa `gi_dong`, nhóm "Không do núi lửa" `cham`.
- **Địa danh để tìm ảnh** (ảnh không có chữ tên địa danh):
  - núi lửa Chư Đăng Ya mùa hoa dã quỳ;
  - miệng núi lửa Thới Lới, Cổng Tò Vò và bờ đá ở đảo Lý Sơn;
  - Gành Đá Đĩa (Phú Yên), nếu không có ảnh bờ đá Lý Sơn hợp giấy phép;
  - hang động núi lửa ở Công viên địa chất Đắk Nông.

  [CẦN KIỂM] tên công viên địa chất sau khi sáp nhập tỉnh.
- **Ảnh đã duyệt khác brief** (SK-033, Duy duyệt 10/11; brief và alt trong bài đã sửa theo ảnh, chữ bé đọc và nghe không đổi):
  - `explore_erupt`: núi lửa Arenal có dòng dung nham, không có cột tro; alt giữ;
  - lựa chọn `q1_rain`: mưa to trên căn nhà gỗ giữa vườn (Estonia), không có lá chuối hay mái ngói; alt "Heavy rain falling". Từ 10/11 tối bài năm không dùng lại ảnh này nữa: bài năm có hình tự vẽ mưa to riêng (`q1_rain` bài năm), bài năm *Khủng long* dùng lại hình tự vẽ đó;
  - thẻ `ly_son`: bờ đảo nhìn từ đỉnh Thới Lới, không thấy rõ miệng núi lửa; alt "Ly Son Island by the sea".
  - Không đổi brief (ảnh theo phương án thay brief cho phép): `tray_coconut` chụp ở đảo Koh Mak, Thái Lan (không có ảnh cây dừa ở bãi biển Việt Nam hợp giấy phép); `tray_shore_rocks` ở Gành Đá Đĩa; `tray_island_crater` chụp từ vành miệng Thới Lới.
  - `tray_dark_rock`: đá ba-dan có lỗ ở Idaho (Mỹ); brief không đòi ảnh Việt Nam nên không đổi.
- **Đổi 10/11** (SK-033, sau khi designer làm hình; brief và alt đã sửa theo):
  - ô `explore_vietnam` và từ `volcano`: đồi núi lửa đã tắt trên đảo Lý Sơn thay cho Chư Đăng Ya; alt "An old volcano hill on Ly Son Island" · "Đồi núi lửa đã tắt trên đảo Lý Sơn";
  - bỏ món `tray_hill_crater`; từ `crater` dùng lại `tray_island_crater`; gợi ý câu q6 EN đổi "craters" thành "crater" (cần sinh lại giọng EN);
  - ba bản sơ đồ mặt cắt núi lửa là hình tự vẽ, không có nhãn chữ.
- **Đổi 10/11 tối** (designer làm nốt hình):
  - món `tray_red_soil`: ruộng đất đỏ ba-dan vừa cày ở São Paulo (Brasil), không phải Tây Nguyên; brief sửa theo, alt giữ;
  - lời nhắn `messages.balanced` sửa (chữ bé nghe, cần sinh lại hai clip): câu cũ nói núi lửa ở Việt Nam tạo ra chính những thứ trong khay, sai với ảnh đất đỏ và đá sẫm màu chụp ở nước ngoài;
  - tìm được ảnh đất đỏ ba-dan ở Tây Nguyên hợp giấy phép (hoặc Duy cho tự chụp) thì thay ảnh `tray_red_soil`; lời nhắn mới vẫn đúng, không phải sửa lại.
- Ý chính chưa có trường hình trong schema v1. Gợi ý nếu sau này có màn tóm tắt:
  1. núi lửa phun nhìn từ xa;
  2. hình bổ đôi núi lửa (mác-ma dưới đất, dung nham bên ngoài);
  3. dung nham nguội thành mũi đất mới.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, bốn từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món (bỏ `tray_hill_crater` 10/11; nhóm `tray_craters` còn một món `tray_island_crater`).
  - Khởi động: `single_choice` (w1), `true_false` (w2 đáp án Sai, có hình; w3 đáp án Đúng).
  - Quiz: `single_choice` ×3 (q1, q3, q5), `fill_blank_bank` hai ô trống (q2), `multi_choice` (q4), `true_false` (q6, `speaker: na`). Bốn format, đều hiện được ở app 0.1.0.
  - DOK q1 đến q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Câu có `misconception`: q6, key `volcanoes_far_away`.
- **Tham chiếu:**
  - `topic: be-mat-trai-dat` → `topic_id`.
  - w1, w2: `recall_from.lesson: be-mat-trai-dat/ben-trong-trai-dat` → `lesson_id` của bài ba (đã có id, slug khớp).
  - w3: `recall_from.lesson: be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` → `lesson_id` của bài một (đã có id).
  - `misconception: volcanoes_far_away` → `misconception_id`. `group:` trỏ nhóm của `tray`; `term_keys` trỏ Từ vựng; `answers: q2_magma, q2_lava` trỏ `#### bank`. Mọi key duy nhất trong bài.
- **App không xáo lựa chọn**, nên vị trí đáp án đúng đặt tay:
  - w1: thứ hai;
  - q1: thứ hai; q2: ô một là từ thứ ba trong ngân hàng, ô hai là từ thứ nhất; q3: thứ ba; q4: thứ hai và thứ tư; q5: thứ nhất.
  - Kệ Chơi xếp xen: đá sẫm màu, vỏ ốc, miệng núi lửa trên đảo, cây dừa, đất đỏ, ghềnh đá, thuyền gỗ.
- **Màn Chơi, ví dụ để kiểm** (thứ tự ưu tiên lời nhắn theo SK-012: balanced, full, has_limited, start, missing):
  - chạm đá sẫm màu, đất đỏ, miệng núi lửa trên đảo → đạt (`balanced`);
  - chạm vỏ ốc → `has_limited`;
  - chạm đá sẫm màu, ghềnh đá, đất đỏ (đủ ba chỗ, thiếu miệng núi lửa) → `missing.tray_craters`;
  - rồi chạm miệng núi lửa trên đảo → `full`;
  - bỏ ghềnh đá ra (→ `missing.tray_craters`), đặt miệng núi lửa trên đảo vào → đạt.
  - Chỉ còn một món miệng núi lửa, nên mọi tổ hợp đạt đều có `tray_island_crater` và `tray_red_soil`, cộng một trong hai món đá.
- **Chữ giao diện màn Chơi:** ios-dev đã đổi sang chữ chung và kệ trung tính, xáo thứ tự mỗi lượt học (9/11, SK-031 Quyết định đã ghi). Lời nhắn trong bài vẫn tránh gọi tên vật chứa.
- **Bộ thẻ `set: earth`:** app đã có khoá `collectible.set.earth` "Earth cards · Thẻ Trái Đất" (ios-dev 9/11). Không cần tạm xoá khối `### ly_son`.
- **Đề xuất khi app hiện được `order_sequence`** (GĐ 1 S4): câu q3 nên đổi thành câu sắp thứ tự ba thẻ: "Magma pushes up" · "Lava comes out" · "Lava cools into rock". Câu này khớp mục tiêu "kể được núi lửa phun trào ra sao" hơn câu chọn một. Khi đổi thì tăng `version`.
- **Số từ EN trên một màn** (đếm như bài một: trạng thái nhiều chữ nhất):
  - Học khoảng ba mươi ba từ: mục tiêu 7, hướng dẫn 3, bốn nhãn 8, câu dài nhất 9 (ô "Ở Việt Nam"), ô Từ mới 6.
    - Vượt ba mươi vì có ô thứ tư.
    - Nếu PM muốn đúng ba mươi, cách nhẹ nhất là bỏ `title` của `word_list`.
    - Cách thứ hai là gộp ô "Ở Việt Nam" vào ô "Đá mới". Cách này yếu hơn cho việc sửa `volcanoes_far_away`.
  - Khởi động: mọi màn từ hai mươi đến hai mươi lăm từ.
  - Quiz: mọi màn từ hai mươi bốn đến ba mươi mốt từ. q4 nhiều nhất, khoảng ba mươi mốt từ: câu hỏi 4, hướng dẫn 5, bốn nhãn 13, gợi ý 9.
  - Chơi khoảng năm mươi ba từ: bảy tên 16, bốn chip 8, dòng điều kiện khoảng 10, lời nhắn dài nhất 14 (`start`), lệnh 5. Vượt như màn Chơi của bài một; vẫn chờ PM chốt cách đếm màn Chơi.
- **Từ EN có thể ngoài Starters/Movers** (theo trí nhớ của biên tập, cần đối chiếu danh sách Cambridge):
  - từ của bài ba: crust, mantle, layer;
  - từ của bài này: melted, underground, flows, pushes, cools, erupting, soil, seashell, coconut, wooden, tiny, bits, crater, ash, extinct, Central Highlands, Ly Son Island;
  - chữ hướng dẫn: challenge, spot, mistake.

  Phần lớn có hình đi kèm hoặc là từ mới của bài.
- **Chính tả Anh** như bài một: "Grey" (alt của `q4_ash`).
- **Không dùng dấu "—"** và không có ký hiệu trong chuỗi tiếng Việt. Dấu gạch nối trong "mác-ma", "ba-dan" là một phần của từ; nghe thử giọng VI.
- **Asset:** không có audio và `asset` trong markdown; máy điền khi chạy `tts` và `assets`. Na là asset chung của app.
- **Hình (SK-033, 9/11):** mọi câu Khởi động và Quiz, mọi lựa chọn, mọi thẻ từ, mọi món Chơi đều có `image` (bốn mươi bảy ô hình sau khi bỏ `tray_hill_crater`). Ghi chú cho hoạ sĩ có danh sách ảnh gốc.
  - Brief "Dùng lại hình `<key>`." (khác bài: "… ở bài `<slug chủ đề>/<slug bài>`.") theo `content/TEMPLATE.md`: dùng đúng ảnh đã chọn cho khoá đó. Bài này dùng lại năm hình của bài ba.
  - Sơ đồ mặt cắt núi lửa có ba bản (`explore_magma`, câu q2, `q4_underground`; brief `[hình vẽ]`, "Cùng sơ đồ tự vẽ của `explore_magma`"). SK-033 10/11: ba bản là hình tự vẽ, mục `own` trong file chọn ảnh, credit "Science Kids", `changes: ["drawn"]`; không còn là bản chỉnh từ sơ đồ USGS.
  - Alt đổi theo ảnh mới, chữ bé đọc và nghe không đổi: câu w3 ("A small island in the sea" thành "A beach on a small island"), vì ảnh hòn đảo nhìn từ xa lộ đáp án Đúng.
  - Lựa chọn có hình dài chữ nhất: ba lựa chọn của q3 (đến năm từ, "Magma pushes up and out"). Nhờ ios-dev xem nhãn có bị cắt trong ô hình ba cột không.
