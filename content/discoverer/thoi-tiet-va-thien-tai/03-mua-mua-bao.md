---
id: e2aea6b5-f2a7-4d04-b96d-e47a9df8efae
topic: thoi-tiet-va-thien-tai
slug: mua-mua-bao
order: 3
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Storm season in Vietnam
vi: Mùa mưa bão ở Việt Nam
> Giữ đúng tên ở `syllabus-lessons.md` và `content/syllabus.json` (`new-weather`, bài số ba).

## Mục tiêu
en: I can say what happens in the storm season.
vi: Em kể được những gì xảy ra trong mùa mưa bão.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-038, ngày 11/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids` sau bài một và bài hai (câu w1 trỏ bài hai, câu w3 trỏ bài một).
> Bài sửa `calm_means_storm_over` ở ô "Mắt bão" và câu q6 (gắn key, Na nói đúng). Nối với *Bề mặt Trái Đất* ở câu w2 (sóng thần do động đất dưới đáy biển, không do bão); với bài một (gió là không khí chuyển động, mưa, mây đen) và bài hai (dụng cụ đo, dự báo dựa vào số đo).

## Ý chính
1.en: A storm brings strong winds and heavy rain.
1.vi: Bão mang tới gió rất mạnh và mưa rất to.
2.en: Many storms come from the sea in the rainy season.
2.vi: Nhiều cơn bão từ biển đi vào đất liền trong mùa mưa.
> [CẦN KIỂM] Bão ảnh hưởng tới Việt Nam phần lớn hình thành trên Biển Đông hoặc Tây Thái Bình Dương, từ khoảng tháng sáu tới tháng mười hai; miền Bắc nhiều bão vào giữa năm, miền Trung nhiều bão vào cuối năm, trùng mùa mưa của miền Trung. Chữ cho trẻ không nêu tháng, không nêu tên biển, không có bản đồ.
3.en: Forecasters watch storms and warn us early.
3.vi: Các cô chú dự báo thời tiết theo dõi bão và báo trước cho mọi người.
> [CẦN KIỂM] Cơ quan dự báo ở Việt Nam (Trung tâm Dự báo khí tượng thuỷ văn quốc gia) theo dõi bão bằng ảnh vệ tinh, ra-đa và số đo của các trạm khí tượng, và ra tin cảnh báo trước nhiều ngày. Chữ cho trẻ không nêu tên cơ quan.
> Ba ý đi từ điều bé cảm thấy được (gió mạnh, mưa to), tới điều phải hình dung qua ảnh vệ tinh (bão đến từ biển, theo mùa), tới điều trừu tượng nhất (dự báo, cảnh báo trước).

## Khởi động

> Ba câu, đúng bảng Khởi động ở `_topic.md`.
> - w1 ôn bài hai (khoảng một ngày trước): dụng cụ xem hướng gió.
> - w2 ôn *Động đất và sóng thần* của *Bề mặt Trái Đất* (khoảng một tháng trước): động đất dưới đáy biển gây sóng thần. Giải thích khi đúng tách sóng thần khỏi sóng lớn do bão, trước khi bài này dạy bão.
> - w3 ôn bài một (hai, ba ngày trước): hỏi lại misconception `trees_make_wind`, không gắn key (luật chỉ đếm câu misconception ở Quiz).

### w1
id: 93361074-00ab-4b25-8660-8f171497068e
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-thien-tai/do-thoi-tiet
prompt.en: Which tool shows which way the wind blows?
prompt.vi: Dụng cụ nào cho biết gió thổi về hướng nào?
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa
hint.en: Remember the tools in the last game.
hint.vi: Em nhớ lại những dụng cụ ở trò chơi bài trước nhé.
explanation_correct.en: Yes! A windsock points the way the wind goes.
explanation_correct.vi: Đúng rồi! Ống gió chỉ theo hướng gió thổi.
explanation_wrong.en: The answer is the windsock. It fills with wind.
explanation_wrong.vi: Đáp án là ống gió. Có gió thì ống gió phồng lên.
> Ba hình vẽ của bài hai, cùng nét. Đồng hồ treo tường có kim "chỉ" về một phía nên có sức hút. Đáp án ở chỗ thứ nhất.

#### option w1_windsock
correct: true
label.en: windsock
label.vi: ống gió
image.brief: Dùng lại hình `explore_windsock` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`.
image.alt.en: A windsock full of wind
image.alt.vi: Ống gió căng phồng

#### option w1_rain_gauge
correct: false
label.en: rain gauge
label.vi: ống đo mưa
image.brief: Dùng lại hình `explore_rain_gauge` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`.
image.alt.en: A rain gauge in an open garden
image.alt.vi: Ống đo mưa giữa khoảng vườn trống

#### option w1_clock
correct: false
label.en: clock
label.vi: đồng hồ
> Rà chữ tester 11/11 (n2): nhãn cũ "wall clock" · "đồng hồ treo tường" làm nhãn đúng "windsock" · "ống gió" thành nhãn ngắn nhất ở cả hai thứ tiếng. Nay ba nhãn dài một, hai, một chữ (EN), hai, ba, hai tiếng (VI); nhãn đúng không còn nổi bật.
image.brief: Dùng lại hình `tray_clock` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): wall clock no numbers minimalist
image.alt.en: A wall clock
image.alt.vi: Chiếc đồng hồ treo tường

### w2
id: cea80182-29a5-4669-b083-88b639765669
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/dong-dat-va-song-than
prompt.en: An earthquake under the sea can make a tsunami.
prompt.vi: Động đất dưới đáy biển có thể gây ra sóng thần.
image.brief: Dùng lại hình `tray_sea` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): sea horizon fishing boat
image.alt.en: The wide blue sea
image.alt.vi: Biển xanh rộng
answer: true
hint.en: Remember the Tsunami card about Earth.
hint.vi: Em nhớ lại ô Sóng thần ở bài Động đất và sóng thần nhé.
explanation_correct.en: Yes! Storms bring big waves too, but not tsunamis.
explanation_correct.vi: Đúng rồi! Bão cũng làm biển nổi sóng lớn, nhưng không gây ra sóng thần.
explanation_wrong.en: This is true. A tsunami can start on the sea floor.
explanation_wrong.vi: Câu này đúng. Sóng thần có thể bắt đầu từ động đất dưới đáy biển.
> Câu giữ đúng chữ ý chính ba của bài `be-mat-trai-dat/dong-dat-va-song-than` ("An earthquake under the sea can make a tsunami."). Hình câu hỏi là biển êm, không dùng sơ đồ sóng thần của bài đó (sơ đồ cho thấy luôn đáp án Đúng).
> Giải thích khi đúng tách sóng thần khỏi sóng lớn do bão: bài này dạy bão làm biển nổi sóng (ô "Bão"), bé không nên nghĩ bão gây sóng thần.
> [CẦN KIỂM] Bão gây sóng lớn và nước dâng do bão; sóng thần do động đất, núi lửa hay sạt lở dưới đáy biển. Hai hiện tượng khác nhau.

### w3
id: bfd49528-e316-4898-bc73-1330edfce1e7
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-thien-tai/nang-mua-gio-may
prompt.en: Trees make the wind by waving their branches.
prompt.vi: Cây tạo ra gió bằng cách vẫy cành.
image.brief: Dùng lại hình `tray_bending` ở bài `thoi-tiet-va-thien-tai/nang-mua-gio-may`. Từ khoá tìm ảnh (EN): palm trees bending wind
image.alt.en: Trees leaning in the wind
image.alt.vi: Hàng cây nghiêng trong gió
answer: false
hint.en: Remember Na's idea in the first lesson.
hint.vi: Em nhớ lại ý của Na ở bài đầu tiên nhé.
explanation_correct.en: Wind is moving air. It pushes the trees.
explanation_correct.vi: Gió là không khí đang chuyển động. Gió đẩy cây lay động.
explanation_wrong.en: This is false. The wind moves the trees.
explanation_wrong.vi: Câu này sai. Gió làm cây lay động.
> Câu giữ đúng chữ `statement` của `trees_make_wind`. Bài này dạy gió bão là gió rất mạnh, nên bé cần chắc ý "gió là không khí chuyển động" trước.
> Giải thích khi đúng không mở đầu bằng "Yes!" (đáp án Sai).

## Học

> Bốn ô:
> - Bão (ý chính một): gió rất mạnh, mưa rất to, biển nổi sóng, mây đen; cảnh làng ven biển, nhà cửa nguyên vẹn;
> - Mùa mưa bão (ý chính hai): ảnh một cơn bão chụp từ vũ trụ (chỉ thấy mây và biển, không thấy đất liền), bão hình thành trên biển ấm rồi đi vào đất liền;
> - Mắt bão: giữa cơn bão lặng gió một lúc, rồi gió mạnh trở lại (chuẩn bị câu q6; không có ví dụ "ở yên trong nhà", để câu q6 là việc vận dụng);
> - Dự báo (ý chính ba): các cô chú dự báo dựa vào số đo ở nhiều nơi (nối bài hai), báo trước qua ti vi, đài, điện thoại.
>
> Không có bản đồ Việt Nam (`_topic.md`, Quy ước hình mục năm).

### explore
id: 418f156f-065f-46ad-9ff1-d7dfd8eb9f05
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_storm
label.en: Storm
label.vi: Bão
color: do_son
sentence.en: A storm brings strong winds and heavy rain.
sentence.vi: Bão mang tới gió rất mạnh và mưa rất to.
image.brief: [hình vẽ] Một làng quê ven biển Việt Nam trong cơn bão, nhìn từ xa: mưa trắng xoá, hàng dừa và bụi tre nghiêng rạp theo một hướng, biển phía xa nổi sóng bạc đầu, mây xám đen kín trời; nhà mái ngói vẫn nguyên vẹn, cửa đóng kín; không có người, không có con vật, không có nhà đổ, không có mái tốc, không có cây đổ, không có chữ. Câu q1 (hình câu hỏi), câu q1 bài năm, từ storm dùng lại hình này.
image.alt.en: A seaside village in a storm
image.alt.vi: Làng ven biển trong cơn bão
examples.1.en: trees bend and sway
examples.1.vi: cây cối nghiêng ngả
examples.2.en: big waves at sea
examples.2.vi: biển nổi sóng lớn
examples.3.en: heavy rain for hours
examples.3.vi: mưa to nhiều giờ liền
examples.4.en: dark clouds fill the sky
examples.4.vi: mây đen kéo kín trời
> Bốn ví dụ là bốn món của phần Chơi (gió mạnh, mưa to, mây đen), thêm sóng biển. Cảnh không gây sợ: không người, nhà cửa nguyên vẹn (`_topic.md`, Quy ước hình mục bốn).

#### group explore_season
label.en: Storm season
label.vi: Mùa mưa bão
color: cham
sentence.en: Many storms come from the sea in the rainy season.
sentence.vi: Nhiều cơn bão từ biển đi vào đất liền trong mùa mưa.
image.brief: Dùng lại hình `q1_storm` ở bài `khung-long/vi-sao-khung-long-bien-mat`. Từ khoá tìm ảnh (EN): cyclone eye from space ocean
image.alt.en: A big storm seen from space
image.alt.vi: Cơn bão lớn nhìn từ vũ trụ
examples.1.en: a giant swirl of wind and clouds
examples.1.vi: một vòng mây gió xoáy khổng lồ
examples.2.en: it starts over the warm sea
examples.2.vi: bão hình thành trên vùng biển ấm
examples.3.en: then it moves towards land
examples.3.vi: rồi bão di chuyển vào đất liền
examples.4.en: most come in the second half of the year
examples.4.vi: phần lớn tới vào nửa cuối năm
> Ảnh cơn bão ở Nam Đại Tây Dương chụp từ Trạm vũ trụ quốc tế (public domain), chỉ thấy mây và biển, không thấy đất liền, nên không vướng luật bản đồ. Không dùng ảnh vệ tinh một cơn bão gần Việt Nam (sẽ thấy đất liền, Biển Đông).
> [CẦN KIỂM] Ví dụ hai và bốn như ghi chú ở ý chính hai.

#### group explore_eye
label.en: The eye
label.vi: Mắt bão
color: vang_hoe
sentence.en: The middle of a storm is calm for a while.
sentence.vi: Ở giữa cơn bão, gió lặng đi một lúc.
image.brief: [hình vẽ] Một cơn bão nhìn từ trên cao xuống, vẽ đơn giản như sơ đồ: những dải mây trắng xoáy tròn quanh một vùng tròn nhỏ trời quang ở giữa, nền là biển xanh; không có đất liền, không có bản đồ, không có mũi tên, không có chữ. Cùng ý với ảnh ô "Mùa mưa bão" nhưng đơn giản hơn để thấy rõ mắt bão. Từ calm và thẻ thưởng dùng lại hình này.
image.alt.en: A storm from above, calm in the middle
image.alt.vi: Cơn bão nhìn từ trên cao, ở giữa trời quang
examples.1.en: the wind stops for a short time
examples.1.vi: gió ngừng thổi trong chốc lát
examples.2.en: the sky can even look clear
examples.2.vi: trời có khi còn hửng sáng
examples.3.en: then strong wind comes back
examples.3.vi: rồi gió mạnh lại thổi tới
examples.4.en: it can blow from the other side
examples.4.vi: gió có thể thổi từ phía ngược lại
> [CẦN KIỂM] như `calm_means_storm_over` ở `_topic.md`.
> Ô dạy hiện tượng, không dạy việc phải làm: câu q6 để bé tự suy ra "gió lặng chưa chắc bão đã qua, nên vẫn ở trong nhà". Bài năm mới dạy việc làm ở ô "Ở trong nhà".

#### group explore_forecast
label.en: Forecast
label.vi: Dự báo
color: gi_dong
sentence.en: Forecasters watch storms and warn us early.
sentence.vi: Các cô chú dự báo thời tiết theo dõi bão và báo trước cho mọi người.
image.brief: [hình vẽ] Góc phòng khách một ngôi nhà Việt Nam, nhìn từ phía sau bộ ghế: chiếc ti vi trên kệ gỗ đang chiếu bản tin thời tiết, màn hình chỉ có một hình xoáy mây trắng trên nền biển xanh; không có đất liền, không có bản đồ, không có chữ, không có số, không có người trên màn hình; không có người xem (hoặc chỉ thấy lưng ghế). Câu q3, câu w1 bài bốn, ô Học và kệ Chơi bài năm, từ forecast dùng lại hình này.
image.alt.en: A weather forecast on TV
image.alt.vi: Bản tin dự báo thời tiết trên ti vi
examples.1.en: they use measurements from many places
examples.1.vi: các cô chú dựa vào số đo ở nhiều nơi
examples.2.en: they say where the storm may go
examples.2.vi: báo bão có thể đi về đâu
examples.3.en: on TV, radio and phones
examples.3.vi: trên ti vi, đài và điện thoại
examples.4.en: grown-ups listen and get ready
examples.4.vi: người lớn nghe tin và chuẩn bị
> Ví dụ một nối với bài hai (đo thời tiết). [CẦN KIỂM] như ghi chú ở ý chính ba.
> Màn hình ti vi không có bản đồ (luật bản đồ). Nếu designer thấy hình xoáy mây trên ti vi khó nhận ra là dự báo, thêm biểu tượng đám mây, giọt mưa trơn, không chữ.

### new_words
id: 72978941-138e-46b8-b2dc-1a2d55eba512
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: storm, season, forecast

## Chơi

> Bé ghép ba thứ cơn bão mang tới: gió mạnh, mưa to, mây đen. Đạt khi đủ ba nhóm và không chọn thứ không do bão gây ra. Chạm hình đã chọn để bỏ ra.
> Ba món bẫy: dung nham và mặt đất rung lắc (dùng lại hình vẽ *Bề mặt Trái Đất*: núi lửa, động đất cũng là thiên tai nhưng không do bão), nắng chói chang (ngược với bão). Bé tách được bão khỏi các thiên tai khác đã học.
> Nhóm "Mây đen" chỉ có một món: kệ lệch 2-2-1 như bài hai.
> Cả kệ là hình vẽ (`_topic.md`, Quy ước hình mục hai): ba món bẫy là hình vẽ của chủ đề khác; năm món đúng vẽ cùng nét.

### tray
id: 25445c0d-664f-4e81-824d-bbfa92440e4f
type: build_tray
version: 1
prompt.en: What does a storm bring?
prompt.vi: Bão mang tới những gì?
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick strong wind, heavy rain and dark clouds.
messages.start.vi: Em chọn gió mạnh, mưa to và mây đen nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Wind, rain and dark clouds make a storm.
messages.balanced.vi: Tuyệt! Gió mạnh, mưa to và mây đen làm nên cơn bão.
messages.has_limited.en: A storm does not bring that.
messages.has_limited.vi: Bão không mang tới thứ đó.
messages.missing.tray_wind.en: You still need strong wind.
messages.missing.tray_wind.vi: Em còn thiếu gió mạnh.
messages.missing.tray_rain.en: You still need heavy rain.
messages.missing.tray_rain.vi: Em còn thiếu mưa to.
messages.missing.tray_clouds.en: You still need dark clouds.
messages.missing.tray_clouds.vi: Em còn thiếu mây đen.

#### group tray_wind
label.en: Strong wind
label.vi: Gió mạnh
color: gi_dong
role: required

#### group tray_rain
label.en: Heavy rain
label.vi: Mưa to
color: cham
role: required

#### group tray_clouds
label.en: Dark clouds
label.vi: Mây đen
color: nau_dat
role: required

#### group tray_not
label.en: Not from a storm
label.vi: Không do bão gây ra
color: do_son
role: limit
> Nhãn `limit` dạng "Not …" · "Không …", gọi tên loại, không gọi tên món bẫy. Dòng điều kiện sẽ là "Cần đủ Gió mạnh, Mưa to, Mây đen · Không do bão gây ra".

#### item tray_bend
label.en: Trees bending low
label.vi: Cây nghiêng rạp
group: tray_wind
image.brief: [hình vẽ] Một hàng cây và bụi tre nghiêng rạp về một phía trong gió mạnh, lá bay theo cùng hướng, trời xám, không thấy mưa rơi; không có cây gãy, không có nhà, không có người, không có chữ. Câu q5 bài năm dùng lại hình này.
image.alt.en: Trees bending low in strong wind
image.alt.vi: Hàng cây nghiêng rạp trong gió mạnh
> Không vẽ mưa trong hình, để món này chỉ thuộc nhóm gió.

#### item tray_lava
label.en: Lava flowing
label.vi: Dung nham chảy
group: tray_not
image.brief: Dùng lại hình `q4_lava` ở bài `be-mat-trai-dat/dong-dat-va-song-than`. Từ khoá tìm ảnh (EN): lava flow volcano slope
image.alt.en: Red-hot lava on a volcano
image.alt.vi: Dung nham đỏ rực trên sườn núi lửa

#### item tray_pour
label.en: Rain pouring down
label.vi: Mưa như trút nước
group: tray_rain
image.brief: Dùng lại hình `q1_rain` ở bài `be-mat-trai-dat/dong-dat-va-song-than`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain
image.alt.vi: Mưa to

#### item tray_dark
label.en: Dark clouds rolling in
label.vi: Mây đen kéo tới
group: tray_clouds
image.brief: [hình vẽ] Những đám mây đen dày kéo tới trên cánh đồng lúa, trời tối dần, chưa có mưa, chưa có gió làm cây nghiêng; không có người, không có chữ. Thẻ q2_clouds của câu q2 dùng lại hình này.
image.alt.en: Dark clouds over the rice fields
image.alt.vi: Mây đen kéo tới trên cánh đồng lúa

#### item tray_sun
label.en: Bright sunshine
label.vi: Nắng chói chang
group: tray_not
image.brief: Dùng lại hình `q2_sun` ở bài `khung-long/vi-sao-khung-long-bien-mat`. Từ khoá tìm ảnh (EN): bright sun blue sky few clouds
image.alt.en: A bright sun in a blue sky
image.alt.vi: Mặt Trời sáng chói trên bầu trời xanh

#### item tray_leaves
label.en: Leaves flying
label.vi: Lá bay tứ tung
group: tray_wind
image.brief: [hình vẽ] Lá khô bay xoáy trên một khoảng sân gạch, cành cây phía trên nghiêng theo gió, trời xám, không thấy mưa rơi; không có người, không có chữ. Thẻ q2_wind của câu q2 và thẻ q2_wind câu q2 bài năm dùng lại hình này.
image.alt.en: Leaves flying in the wind
image.alt.vi: Lá bay trong gió

#### item tray_shake
label.en: The ground shaking
label.vi: Mặt đất rung lắc
group: tray_not
image.brief: Dùng lại hình `q1_shake` ở bài `be-mat-trai-dat/dong-dat-va-song-than`. Từ khoá tìm ảnh (EN): glass water ripples table
image.alt.en: Water shaking in a glass
image.alt.vi: Nước trong cốc đang rung
> Bài *Động đất và sóng thần* dùng hình cốc nước gợn này cho "the ground shakes" · "mặt đất rung lắc"; bé đã quen.

#### item tray_window
label.en: Rain on the window
label.vi: Mưa quất vào cửa kính
group: tray_rain
image.brief: [hình vẽ] Một ô cửa kính khung gỗ nhìn từ trong nhà, nước mưa chảy thành dòng trên mặt kính, bên ngoài mờ xám; cửa đóng kín, kính nguyên vẹn; không có người, không có chữ.
image.alt.en: Rain running down a window
image.alt.vi: Nước mưa chảy trên cửa kính

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q4), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q5, q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình. Mọi lựa chọn, mọi thẻ là hình vẽ.
> Vai của hình: ba thẻ câu q2 là ba món bắt buộc của phần Chơi (lá bay, mưa như trút nước, mây đen), không còn chia đôi theo ranh giới bắt buộc · bẫy (rà chữ tester 11/11, N2). Nhiệt kế và cái ô ở câu q3 là hình của bài hai, chỉ mang vai sai trong bài này. Không hai câu nào dùng chung một hình lựa chọn.

### q1
id: dcff8286-12a6-4f68-9872-cbe5d0918e86
format: single_choice
version: 1
dok: 1
prompt.en: When do many storms come to Vietnam?
prompt.vi: Nhiều cơn bão tới Việt Nam vào mùa nào?
image.brief: Dùng lại hình `explore_storm`.
image.alt.en: A seaside village in a storm
image.alt.vi: Làng ven biển trong cơn bão
hint.en: Remember when the rivers and fields fill up.
hint.vi: Em nhớ lại lúc nào sông ngòi, đồng ruộng đầy nước nhé.
explanation_correct.en: Yes! Many storms come in the rainy season.
explanation_correct.vi: Đúng rồi! Nhiều cơn bão tới vào mùa mưa.
explanation_wrong.en: The answer is the rainy season.
explanation_wrong.vi: Đáp án là mùa mưa.
> Câu nhớ lại ý chính hai. Gợi ý không gọi tên ô "Mùa mưa bão", vì tên ô có chữ "mùa mưa" của đáp án (`_topic.md`, mục "Khi soạn năm bài"). Ba hình vẽ mới, cùng một cánh đồng. Đáp án ở chỗ thứ hai.
> Rà chữ tester 11/11 (N7):
> - hình câu hỏi đổi từ ảnh cơn bão nhìn từ vũ trụ sang cảnh làng ven biển trong bão của ô Bão (cảnh có bão, không nói mùa); gợi ý cũ "Remember the picture of a storm from space." trỏ đúng tấm ảnh đang hiện ở câu hỏi, nay trỏ vào dấu hiệu của mùa mưa;
> - lựa chọn "the Tet holiday" · "dịp Tết" đổi thành "the whole year" · "quanh năm": Tết nằm trong mùa khô, nên hai lựa chọn sai cũ cùng một lý do, và một dịp lễ đứng cạnh hai mùa. Lựa chọn mới bắt ý sai "bão tới lúc nào cũng được", khác lý do với "mùa khô".
> [CẦN KIỂM] Mùa bão trùng mùa mưa (ở miền Trung, mùa mưa lệch về cuối năm); từ khoảng tháng một tới tháng tư rất ít khi có bão vào Việt Nam.

#### option q1_dry
correct: false
label.en: the dry season
label.vi: mùa khô
image.brief: [hình vẽ] Một cánh đồng khô vàng dưới nắng gắt, đất nứt nhẹ, con mương cạn nước, trời xanh không mây; cùng kiểu cảnh làng quê với hai lựa chọn kia; không có người, không có chữ.
image.alt.en: Dry fields under the hot sun
image.alt.vi: Cánh đồng khô dưới nắng gắt

#### option q1_rainy
correct: true
label.en: the rainy season
label.vi: mùa mưa
image.brief: [hình vẽ] Cùng cánh đồng ấy vào mùa mưa: lúa xanh mướt, mương đầy nước, trời xám có mưa nhẹ; không có người, không có chữ. Từ season dùng lại hình này.
image.alt.en: Green fields in the rain
image.alt.vi: Cánh đồng xanh dưới mưa

#### option q1_whole_year
correct: false
label.en: the whole year
label.vi: quanh năm
image.brief: [hình vẽ] Cùng cánh đồng của hai lựa chọn kia, vẽ thành bốn dải dọc nằm cạnh nhau theo bốn quãng trong năm: lúa mới cấy, lúa xanh dưới mưa, lúa chín vàng, ruộng khô sau gặt; cùng nét, cùng góc nhìn với hai lựa chọn kia; không có người, không có chữ, không có số, không có đường kẻ chia có chữ.
image.alt.en: The same field through the year
image.alt.vi: Cánh đồng ấy qua các mùa trong năm
> Key mới (rà chữ tester 11/11, N7), thay `q1_tet` (cành đào và bánh chưng, bỏ).

### q2
id: 8bd3bac7-0207-40ab-9f16-375ca18bd8b7
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `q1_storm` ở bài `khung-long/vi-sao-khung-long-bien-mat`. Từ khoá tìm ảnh (EN): cyclone eye from space ocean
image.alt.en: A big storm seen from space
image.alt.vi: Cơn bão lớn nhìn từ vũ trụ
sentence.en: In a storm, {1} can bend the trees low.
sentence.vi: Khi có bão, {1} có thể làm cây nghiêng rạp.
answers: q2_wind
hint.en: Remember the Storm card.
hint.vi: Em nhớ lại ô Bão nhé.
explanation_correct.en: Yes! Strong storm wind bends the trees.
explanation_correct.vi: Đúng rồi! Gió bão rất mạnh làm cây nghiêng rạp.
explanation_wrong.en: The answer is wind. Moving air pushes the trees.
explanation_wrong.vi: Đáp án là gió. Không khí chuyển động đẩy cây nghiêng.
> Câu nhớ lại ý chính một (bão mang gió rất mạnh) và ví dụ "cây cối nghiêng ngả" của ô Bão, nối với bài một (gió là không khí chuyển động, gió đẩy cây). Hình câu hỏi là cơn bão nhìn từ vũ trụ (không cho thấy cây hay gió). Thẻ đúng ở chỗ thứ hai.
> Rà chữ tester 11/11 (N2): câu cũ "A storm brings strong {1} and heavy rain." có ba thẻ gió (món bắt buộc của kệ), rung lắc và nắng (hai món bẫy của kệ), nên bé chạm thẻ còn lại theo trí nhớ trò chơi; bản VI "nắng rất mạnh" còn tự loại vì không tự nhiên. Lệch đề xuất của tester (thay nắng bằng mây, giữ câu cũ): với câu cũ, "mây rất mạnh" cũng không tự nhiên ở bản VI. Nay ba thẻ là ba món bắt buộc của kệ (gió, mưa, mây), bão đều mang tới cả ba, nên bé không loại được thẻ nào bằng trí nhớ; câu mới đọc xuôi với cả ba thẻ ở hai thứ tiếng, và chỉ gió làm cây nghiêng rạp. Thẻ gió dùng hình lá bay (`tray_leaves`), không dùng hình cây nghiêng rạp (`tray_bend`), vì hình đó vẽ đúng chữ của câu.
> [CẦN KIỂM] Mưa to có thể làm cành nhỏ, cây lúa trĩu xuống, nhưng làm cả hàng cây nghiêng rạp là gió.

#### bank q2_rain
label.en: rain
label.vi: mưa
image.brief: Dùng lại hình `q1_rain` ở bài `be-mat-trai-dat/dong-dat-va-song-than`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain
image.alt.vi: Mưa to

#### bank q2_wind
label.en: wind
label.vi: gió
image.brief: Dùng lại hình `tray_leaves`.
image.alt.en: Leaves flying in the wind
image.alt.vi: Lá bay trong gió

#### bank q2_clouds
label.en: clouds
label.vi: mây
image.brief: Dùng lại hình `tray_dark`.
image.alt.en: Dark clouds over the rice fields
image.alt.vi: Mây đen kéo tới trên cánh đồng lúa

### q3
id: f59429bf-3e41-4ddf-94fc-2b800f938b20
format: multi_choice
version: 1
dok: 2
prompt.en: A storm may come tomorrow. How can Nam's family find out?
prompt.vi: Ngày mai bão có thể tới. Nhà Nam biết tin bằng cách nào?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: [hình vẽ] Sân trước một ngôi nhà mái ngói ở làng quê lúc chiều, trời còn xanh, vài đám mây cao, cây đứng yên; không có người, không có chữ. Câu q4, câu q3 bài năm dùng lại hình này; ba lựa chọn câu q4 vẽ cùng khoảng sân này.
image.alt.en: A quiet yard in the afternoon
image.alt.vi: Sân nhà yên ả buổi chiều
hint.en: Who watches storms far away?
hint.vi: Ai theo dõi được những cơn bão ở rất xa?
explanation_correct.en: Yes! TV news and the village loudspeaker share forecasts.
explanation_correct.vi: Đúng rồi! Ti vi và loa phát thanh làng đưa tin dự báo.
explanation_wrong.en: The answers are the TV and the village loudspeaker.
explanation_wrong.vi: Đáp án là bản tin trên ti vi và loa phát thanh làng.
> DOK 2: phân biệt dụng cụ đo thời tiết ở nhà (nhiệt kế: chỉ cho biết bây giờ ở đây) với tin dự báo (cho biết bão ở xa sắp tới). Nhiệt kế là lựa chọn sai có sức hút vì bé vừa học ở bài hai. Loa phát thanh là tình huống mới, rất quen ở làng quê Việt Nam.
> [CẦN KIỂM] Loa phát thanh của xã, phường thông báo tin bão.
> Đáp án ở chỗ thứ nhất và thứ hai.

#### option q3_tv
correct: true
label.en: TV forecast
label.vi: bản tin trên ti vi
image.brief: Dùng lại hình `explore_forecast`.
image.alt.en: A weather forecast on TV
image.alt.vi: Bản tin dự báo thời tiết trên ti vi

#### option q3_speaker
correct: true
label.en: village loudspeaker
label.vi: loa phát thanh làng
image.brief: [hình vẽ] Một cặp loa phát thanh hình phễu gắn trên cột điện ở đầu làng, nền trời và hàng tre; cùng nét với các hình vẽ của bài; không có chữ, không có biển tên, không có người.
image.alt.en: Loudspeakers on a pole in a village
image.alt.vi: Loa phát thanh trên cột ở đầu làng

#### option q3_thermometer
correct: false
label.en: home thermometer
label.vi: nhiệt kế ở nhà
image.brief: Dùng lại hình `explore_thermometer` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`.
image.alt.en: A thermometer in the shade
image.alt.vi: Nhiệt kế treo trong bóng râm

#### option q3_umbrella
correct: false
label.en: open umbrella
label.vi: cái ô đang mở
image.brief: Dùng lại hình `tray_umbrella` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`.
image.alt.en: An open umbrella
image.alt.vi: Chiếc ô đang mở
> Bốn nhãn cùng dạng cụm danh từ số ít: EN hai chữ, VI bốn tiếng ("bản tin trên ti vi", "loa phát thanh làng", "nhiệt kế ở nhà", "cái ô đang mở"), để hai đáp án không nổi bật bằng độ dài. Rà chữ tester 11/11 (N3): hai nhãn VI đúng trước dài sáu và năm tiếng ("bản tin dự báo trên ti vi", "loa phát thanh của làng"); bảng Tên gọi ở `_topic.md` sửa theo thành "loa phát thanh làng".

### q4
id: 771cdfa5-34fc-4101-b910-b18d1e99688e
format: single_choice
version: 1
dok: 2
prompt.en: Which picture shows a storm?
prompt.vi: Hình nào cho thấy đang có bão?
image.brief: Dùng lại hình `q3`.
image.alt.en: A quiet yard in the afternoon
image.alt.vi: Sân nhà yên ả buổi chiều
hint.en: A storm brings two things at once.
hint.vi: Bão mang tới hai thứ cùng một lúc.
explanation_correct.en: Yes! Strong wind and heavy rain together make a storm.
explanation_correct.vi: Đúng rồi! Gió mạnh và mưa to cùng lúc là có bão.
explanation_wrong.en: The answer is heavy rain with bending trees.
explanation_wrong.vi: Đáp án là mưa to, cây nghiêng rạp.
> DOK 2: so sánh ba cảnh của cùng một khoảng sân để phân biệt bão với mưa thường và với gió thường. Hình câu hỏi là khoảng sân lúc trời yên, để bé so ba lựa chọn với cùng một chỗ. Ba lựa chọn là ba hình vẽ mới (không dùng lại hình ô "Bão"), nên đáp án không phải hình duy nhất bé đã thấy.
> Ba nhãn cùng khuôn hai vế "trời/mưa, cây" (rút kinh nghiệm SK-037 N4). Đáp án ở chỗ thứ ba.

#### option q4_light
correct: false
label.en: light rain, still trees
label.vi: mưa nhỏ, cây đứng yên
image.brief: [hình vẽ] Cùng khoảng sân của hình câu q3: mưa nhỏ lất phất, cây đứng yên, trời xám nhạt; không có người, không có chữ.
image.alt.en: The yard in light rain
image.alt.vi: Sân nhà lúc mưa nhỏ

#### option q4_breezy
correct: false
label.en: strong wind, blue sky
label.vi: gió mạnh, trời xanh
image.brief: [hình vẽ] Cùng khoảng sân: trời xanh có nắng, không mưa, cây nghiêng theo gió, lá bay; không có người, không có chữ.
image.alt.en: The yard on a windy, sunny day
image.alt.vi: Sân nhà lúc gió mạnh, trời nắng

#### option q4_storm
correct: true
label.en: heavy rain, bending trees
label.vi: mưa to, cây nghiêng rạp
image.brief: [hình vẽ] Cùng khoảng sân: mưa to trắng xoá, cây nghiêng rạp, trời xám đen; nhà vẫn nguyên vẹn, cửa đóng kín; không có người, không có chữ. Câu q4 bài năm dùng lại hình này làm hình câu hỏi.
image.alt.en: The yard in a storm
image.alt.vi: Sân nhà lúc có bão
> `alt` ba lựa chọn cùng khuôn "The yard …" · "Sân nhà lúc …".

### q5
id: 88650ecd-af4a-47a5-8b10-a7ff260592ab
format: true_false
version: 1
dok: 2
prompt.en: A blue sky today means tomorrow will be sunny, too.
prompt.vi: Hôm nay trời xanh thì ngày mai chắc chắn cũng nắng.
image.brief: Dùng lại hình `w1_sky` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): sky blue clear clouds
image.alt.en: A blue sky
image.alt.vi: Bầu trời xanh
> Rà chữ tester 11/11 (n7): hình câu hỏi cũ là khoảng sân `q3`, dùng ở ba màn liền nhau (q3, q4, q5). Nay là ảnh bầu trời xanh (đúng tình huống "hôm nay trời xanh"). Lệch đề xuất của tester (dùng `explore_forecast`): ảnh ti vi dự báo chính là bằng chứng mà gợi ý "ô Dự báo" trỏ tới, trái Quy ước hình mục bảy.
answer: false
hint.en: Remember the Forecast card.
hint.vi: Em nhớ lại ô Dự báo nhé.
explanation_correct.en: Storms come from far away. Listen to the forecast.
explanation_correct.vi: Bão từ rất xa kéo tới. Em nhớ nghe dự báo thời tiết.
explanation_wrong.en: This is false. The weather can change fast.
explanation_wrong.vi: Câu này sai. Thời tiết có thể thay đổi rất nhanh.
> DOK 2: vận dụng ý chính hai và ba (bão đến từ biển, ở xa; người dự báo báo trước) để bác bỏ một suy đoán chỉ dựa vào bầu trời hôm nay. Câu khẳng định, đáp án Sai. Câu cũng nối với câu q3 (vì sao phải nghe tin dự báo).
> Giải thích khi đúng không mở đầu bằng "Yes!" (đáp án Sai).

### q6
id: bfbe2ebc-6a77-4111-8a0f-59076d33ebb5
format: true_false
version: 1
dok: 3
misconception: calm_means_storm_over
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
image.brief: [hình vẽ] Nhìn qua ô cửa kính đóng kín từ trong nhà ra sân: ngoài sân lặng gió, cây đứng yên, mặt sân đầy lá rụng và vũng nước, trời xám nhưng hửng sáng một chút; nhà cửa nguyên vẹn; không có người, không có chữ.
image.alt.en: A calm yard after strong wind
image.alt.vi: Sân nhà lặng gió sau cơn gió mạnh
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: The wind suddenly stopped. I will still stay inside.
statement.vi: Gió bỗng lặng hẳn. Mình vẫn ở yên trong nhà.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
hint.en: Remember the card about the storm's eye.
hint.vi: Em nhớ lại ô Mắt bão nhé.
explanation_correct.en: Yes! The calm eye passes, then strong wind comes back.
explanation_correct.vi: Đúng rồi! Mắt bão đi qua, rồi gió mạnh lại thổi tới.
explanation_wrong.en: Na is right. The wind can come back strongly.
explanation_wrong.vi: Na nói đúng. Gió có thể thổi mạnh trở lại.
> Lời Na, hình và đáp án Đúng đúng như `_topic.md` (mục "Câu sáu, lời Na" và bảng Đáp án Đúng/Sai).
> DOK 3: bé đánh giá một việc làm. Bé còn nghĩ "gió lặng là bão đã qua" sẽ cho là Na lo xa và chọn "Na chưa đúng". Ô "Mắt bão" dạy hiện tượng (lặng một lúc, rồi gió mạnh trở lại) nhưng không dạy việc phải làm; bé phải tự suy ra.
> [CẦN KIỂM] như `calm_means_storm_over` ở `_topic.md`. Hình câu hỏi cho thấy sân lặng gió (tình huống), không cho thấy mắt bão hay gió sắp trở lại.

## Từ vựng

### storm
id: 929037b4-74b4-4faa-af61-4542fa2f9d4c
tier: core
term.en: storm
term.vi: bão, cơn bão
example.en: A storm brings strong wind and heavy rain.
example.vi: Bão mang tới gió mạnh và mưa to.
image.brief: Dùng lại hình `explore_storm`.
image.alt.en: A seaside village in a storm
image.alt.vi: Làng ven biển trong cơn bão
> `term.vi` có dấu phẩy: nhờ nghe thử giọng VI.

### season
id: 9c8e02f7-c2bc-45e2-8812-66b399c19b61
tier: core
term.en: season
term.vi: mùa
example.en: The rainy season brings lots of rain.
example.vi: Mùa mưa có rất nhiều mưa.
image.brief: Dùng lại hình `q1_rainy`.
image.alt.en: Green fields in the rain
image.alt.vi: Cánh đồng xanh dưới mưa

### forecast
id: ef483815-3ae9-472d-acab-c68b324fddac
tier: core
term.en: forecast
term.vi: dự báo thời tiết
example.en: We watch the weather forecast every evening.
example.vi: Tối nào nhà em cũng xem dự báo thời tiết.
image.brief: Dùng lại hình `explore_forecast`.
image.alt.en: A weather forecast on TV
image.alt.vi: Bản tin dự báo thời tiết trên ti vi

### typhoon
id: a5cd1fe5-5177-4964-b7ea-2cadb38d666a
tier: extra
term.en: typhoon
term.vi: bão lớn
example.en: A typhoon is a very strong storm.
example.vi: Bão lớn là một cơn bão rất mạnh.
image.brief: Dùng lại hình `q1_storm` ở bài `khung-long/vi-sao-khung-long-bien-mat`. Từ khoá tìm ảnh (EN): cyclone eye from space ocean
image.alt.en: A big storm seen from space
image.alt.vi: Cơn bão lớn nhìn từ vũ trụ
> [CẦN KIỂM] Dịch "typhoon" là "bão lớn" hay "bão nhiệt đới" (bảng Tên gọi ở `_topic.md`). Nghe thử giọng EN đọc "typhoon".

### calm
id: 2c300bde-f431-4efd-8c4c-61ec018289c0
tier: extra
term.en: calm
term.vi: lặng gió, yên lặng
example.en: The eye of a storm is calm.
example.vi: Mắt bão lặng gió.
image.brief: Dùng lại hình `explore_eye`.
image.alt.en: A storm from above, calm in the middle
image.alt.vi: Cơn bão nhìn từ trên cao, ở giữa trời quang
> `term.vi` có dấu phẩy: nhờ nghe thử giọng VI.

## Thưởng

### numbered_storms
id: 1cdc8405-2d50-428f-9988-491cd7fb561e
set: weather
rarity: common
name.en: Numbered storms
name.vi: Bão được đánh số
tag.en: Storms
tag.vi: Bão
fact.en: In Vietnam, storms get numbers in the order they come.
fact.vi: Ở Việt Nam, các cơn bão trong năm được đánh số theo thứ tự, như bão số một, bão số hai.
> [CẦN KIỂM] Biên tập nhớ cơ quan dự báo Việt Nam đánh số các cơn bão hoạt động trên Biển Đông theo thứ tự trong năm (bão số một, số hai, …), bên cạnh tên quốc tế. Chuyên môn xác nhận cách đánh số (chỉ bão trên Biển Đông, hay mọi cơn ảnh hưởng tới Việt Nam). Thẻ không nêu tên hay năm của cơn bão nào.
image.brief: Dùng lại hình `explore_eye`.
image.alt.en: A storm from above, calm in the middle
image.alt.vi: Cơn bão nhìn từ trên cao, ở giữa trời quang

## Ghi chú cho hoạ sĩ

- **Loại hình:** gần như toàn hình tự vẽ. Ảnh chụp chỉ có ảnh cơn bão nhìn từ vũ trụ (dùng lại của *Khủng long*: ô "Mùa mưa bão", hình câu q2, từ `typhoon`), ảnh bầu trời xanh (câu q5), ảnh lúa nghiêng theo gió (câu w1), ảnh biển (câu w2), ảnh hàng cây nghiêng (câu w3). Mọi lựa chọn, thẻ từ, món Chơi là hình vẽ.
- **Hình tự vẽ cần vẽ (mười sáu):**
  - Học (ba): làng ven biển trong cơn bão; cơn bão nhìn từ trên cao có mắt bão; phòng khách có ti vi chiếu dự báo.
  - Chơi (bốn): hàng cây nghiêng rạp (không mưa); mây đen kéo tới trên cánh đồng; lá bay trên sân; mưa chảy trên cửa kính.
  - Quiz (chín): ba cảnh của cùng một cánh đồng (mùa khô; mùa mưa; bốn dải theo các quãng trong năm) (q1); sân nhà buổi chiều và loa phát thanh trên cột (q3); ba cảnh của cùng khoảng sân (q4); nhìn qua cửa kính ra sân lặng gió (q6).
  - Rà chữ tester 11/11 (N7): bỏ hình cành đào và bánh chưng (`q1_tet`), thay bằng cánh đồng bốn dải (`q1_whole_year`).
- **Dùng lại:** từ *Khủng long* `vi-sao-khung-long-bien-mat/q1_storm` (ảnh), `q2_sun` (hình vẽ); từ *Bề mặt Trái Đất* `dong-dat-va-song-than/q4_lava`, `q1_shake`, `q1_rain` (hình vẽ), `dat-va-nuoc-tren-trai-dat/tray_sea` (ảnh), `cac-chau-luc-va-dai-duong/w1_sky` (ảnh, câu q5); từ *Hô hấp* `vi-sao-ta-phai-tho/w1` (ảnh); từ bài một `tray_bending`; từ bài hai `explore_windsock`, `explore_rain_gauge`, `explore_thermometer`, `tray_umbrella`; từ *Não bộ* `nao-dieu-khien-co-the/tray_clock` (w1_clock, hình vẽ; theo hình designer 11/11). Trong bài: `explore_storm` (hình câu q1, từ `storm`), `tray_leaves`, `tray_dark` (thẻ câu q2), `explore_forecast` (q3), `q3` (q4), `q1_rainy`, `explore_eye` (từ vựng, thẻ thưởng).
- **Bài khác dùng lại hình của bài này:** bài bốn câu w1 (`explore_forecast`); bài năm ô Học, kệ Chơi (`explore_forecast`), câu q1 (`explore_storm`), q2 (`tray_leaves`), q3 (`q3`), q4 (`q4_storm`), q5 (`tray_bend`).
- **Không gây sợ, không bản đồ** (`_topic.md`, Quy ước hình mục bốn và năm):
  - cảnh bão nhìn từ xa, nhà cửa nguyên vẹn, cửa đóng; không người, không con vật, không cây đổ, mái tốc;
  - mắt bão và màn hình ti vi chỉ có mây xoáy trên biển, không có đất liền, không có bản đồ;
  - ba cảnh khoảng sân ở câu q4 cùng góc, cùng ngôi nhà, chỉ khác thời tiết.
- **Ba món bẫy ở kệ Chơi** là hình vẽ của *Bề mặt Trái Đất* và *Khủng long*; năm món đúng vẽ cùng nét với các hình đó.
- **Các lựa chọn trong một câu cùng khung, cùng kiểu:** w1 ba dụng cụ của bài hai; q1 ba cảnh của cùng một cánh đồng, cùng góc nhìn; q2 ba món bắt buộc của kệ Chơi (lá bay, mưa to, mây đen); q3 bốn đồ vật vẽ cùng nét; q4 ba cảnh cùng khoảng sân.
- **Màu:** Học: bão `do_son`, mùa mưa bão `cham`, mắt bão `vang_hoe`, dự báo `gi_dong`. Chơi: gió mạnh `gi_dong`, mưa to `cham`, mây đen `nau_dat`, nhóm "Không do bão gây ra" `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: storm, season, forecast).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (2-2-1 món, cố ý: nhóm "Mây đen" một món), một nhóm `limit`, tám món.
  - Khởi động: `single_choice` (w1, `recall_from.lesson: thoi-tiet-va-thien-tai/do-thoi-tiet`), `true_false` (w2 Đúng, `recall_from.lesson: be-mat-trai-dat/dong-dat-va-song-than`, đã có id; w3 Sai, `recall_from.lesson: thoi-tiet-va-thien-tai/nang-mua-gio-may`). DOK một.
  - Quiz: `single_choice` (q1, q4), `fill_blank_bank` (q2, ba thẻ có hình), `multi_choice` (q3, bốn lựa chọn, hai đúng), `true_false` (q5 Sai; q6 Đúng, `speaker: na`).
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3.
  - Câu có `misconception`: q6, key `calm_means_storm_over`.
- **Tham chiếu:** chạy `ids` cho bài một, bài hai trước bài này.
- **Vị trí đáp án đúng:** w1 thứ nhất; q1 thứ hai; q2 thẻ thứ hai; q3 thứ nhất và thứ hai; q4 thứ ba.
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Cây nghiêng rạp, Mưa như trút nước, Mây đen kéo tới → `balanced`;
  - Dung nham chảy → `has_limited`;
  - Cây nghiêng rạp, Lá bay tứ tung, Mưa quất vào cửa kính (thiếu mây đen) → `missing.tray_clouds`;
  - rồi chạm Mây đen kéo tới → `full`; bỏ Lá bay tứ tung, đặt Mây đen kéo tới → `balanced`.
- **Nhãn dài:** "Dark clouds rolling in", "Mưa quất vào cửa kính" (món Chơi), "Không do bão gây ra" (chip nhóm), "heavy rain, bending trees" (lựa chọn có hình). Nhờ tester xem trên iPhone bề rộng nhỏ nhất.
- **Số từ EN trên một màn:** Học khoảng ba mươi ba (mục tiêu 9, hướng dẫn 3, bốn nhãn 6, câu dài nhất 10, ô Từ mới 5), như các chủ đề trước. Nhiều chữ nhất ở Quiz là q3 (khoảng hai mươi chín: câu hỏi 11, hướng dẫn 5, bốn nhãn 8, giải thích 9) và q4 (khoảng hai mươi lăm).
- **Từ EN có thể ngoài Starters/Movers:** từ mới storm, season, forecast, typhoon, calm; forecasters, warn, swirl, eye, measurements, loudspeaker, thermometer (bài hai), tsunami, earthquake (*Bề mặt Trái Đất*), whole, bend.
- **Giọng đọc:** EN "typhoon", "TV"; VI `term.vi` có dấu phẩy ở `storm`, `calm`. Chuỗi VI không có chữ số, ký hiệu, dấu "—".
- **Asset:** không có audio, `asset` trong markdown.
