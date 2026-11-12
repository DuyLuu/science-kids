---
id: f7209297-0675-48d0-a0c1-dddc3b172312
topic: be-mat-trai-dat
slug: dong-dat-va-song-than
order: 5
stage: review
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Earthquakes and tsunamis
vi: Động đất và sóng thần

## Mục tiêu
en: I can say what to do in an earthquake.
vi: Em biết cần làm gì khi có động đất.
> Bài cuối của chủ đề (`review`). Mục tiêu, ba ý chính và từ vựng giữ đúng bảng kế hoạch ở `_topic.md`.
> Phần ôn trộn:
> - Khởi động ôn bài bốn (w1), bài một (w2) và bài hai (w3);
> - câu q1 và q4 đặt động đất cạnh núi lửa (bài bốn);
> - câu q2 ôn ba lớp của Trái Đất (bài ba);
> - câu q5 đưa bé trở lại bãi biển, nơi bài một đã gặp (biển, phần đất cao hơn mặt nước).
>
> Câu w3 ôn bài hai thêm khi sửa theo rà chữ 9/11 (tester, lỗi nhỏ 12; trước đó là đề xuất ở `_topic.md`, mục "Còn mở").

## Ý chính
1.en: Earth's crust is broken into giant pieces called plates.
1.vi: Vỏ Trái Đất bị chia thành những mảng rất lớn.
> [CẦN KIỂM] Câu "vỏ Trái Đất chia thành mảng" là cách giản lược. Theo hiểu biết của biên tập, mảng gồm vỏ Trái Đất và phần trên cùng của lớp manti (thạch quyển). Chuyên môn xác nhận cách nói này dùng được cho trẻ bảy đến chín tuổi. Cùng ý ở nhóm `explore_plates`, câu q2 và từ `plate`.
2.en: When plates slip suddenly, the ground shakes.
2.vi: Khi các mảng trượt đột ngột, mặt đất rung lắc.
> [CẦN KIỂM] Cũng là cách giản lược. Động đất xảy ra khi đá hai bên một vết đứt gãy trượt đột ngột, phần lớn ở chỗ các mảng tiếp giáp nhau. Cũng có trận ở giữa một mảng, hoặc do núi lửa gây ra. Vì vậy bài chỉ nói "khi các mảng trượt", không nói "chỉ khi".
3.en: An earthquake under the sea can make a tsunami.
3.vi: Động đất dưới đáy biển có thể gây ra sóng thần.
> Núi lửa phun hay đất đá sạt lở dưới biển cũng có thể gây ra sóng thần. Vì vậy bài nói "có thể", và không câu nào lấy núi lửa làm lựa chọn sai khi hỏi cái gì gây ra sóng thần.

## Khởi động

> Ba câu, giãn cách theo syllabus-progression mục 7.
> - w1 ôn bài bốn *Núi lửa*, là bài trước, cách khoảng một ngày. Câu hỏi về mác-ma và dung nham, ý chính hai của bài bốn. Đã đối chiếu bài bốn khi rà chéo 9/11: khớp ô Mác-ma và dung nham, câu q2 và hai từ `magma`, `lava`.
> - w2 ôn bài một, cách bốn bài, khoảng một tuần. Đây là câu "Em nghĩ sao?" của bài một được hỏi lại (Ghi chú cho dev của bài một): bài cuối quay lại câu này để bé tự thấy mình đã sửa được ý "Trái Đất phần lớn là đất" (`earth_mostly_land`).
> - w3 ôn bài hai, cách ba bài: hỏi lại misconception `continent_is_country` của bài hai ("Châu Á là một quốc gia", đáp án Sai). Bài tổng kết như vậy quay lại cả hai misconception đầu chủ đề.
> - w2 và w3 không gắn key misconception: luật chỉ đếm câu misconception ở Quiz, và bài này dành câu đó cho `quake_just_shaking` (q6).

### w1
id: 4420f25b-bf7b-4f4b-9e97-3d9e007274dc
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/nui-lua
prompt.en: What is melted rock called outside a volcano?
prompt.vi: Đá nóng chảy trào ra ngoài núi lửa gọi là gì?
image.brief: Dùng lại hình `q1` ở bài `be-mat-trai-dat/nui-lua`. Ảnh núi lửa yên lặng không có dung nham, để không giống ảnh lựa chọn w1_lava. Từ khoá tìm ảnh (EN): volcano cone quiet landscape
image.alt.en: A quiet volcano
image.alt.vi: Núi lửa đang yên lặng
hint.en: Under the ground it has one name. Outside, it has another.
hint.vi: Đá nóng chảy ở dưới lòng đất và ở bên ngoài có hai tên khác nhau.
explanation_correct.en: Yes! Outside a volcano, melted rock is lava.
explanation_correct.vi: Đúng rồi! Trào ra ngoài núi lửa, đá nóng chảy gọi là dung nham.
explanation_wrong.en: The answer is lava. Underground, it is called magma.
explanation_wrong.vi: Đáp án là dung nham. Khi còn ở dưới lòng đất, đá nóng chảy gọi là mác-ma.
> Tên tiếng Việt "mác-ma", "dung nham" đã khớp bài bốn và bảng Tên gọi ở `_topic.md`. Hình không được có chữ "lava" hay "magma", vì chữ trên hình sẽ lộ đáp án. Không dùng hình bổ đôi `explore_magma` làm hình câu hỏi: hình đó có cả dòng dung nham bên ngoài, giống lựa chọn đúng (từ 10/11 hình đó là hình tự vẽ, không còn nhãn chữ).
> SK-033 (9/11): ảnh câu hỏi đổi từ `explore_erupt` (núi lửa đang phun) sang ảnh núi lửa yên lặng của câu q1 bài bốn. Lựa chọn w1_lava nay có ảnh dòng dung nham; câu hỏi có dung nham sẽ giống ảnh lựa chọn đúng và lộ đáp án. Ba lựa chọn: sơ đồ túi mác-ma dưới đất, ảnh cát, ảnh dòng dung nham, đều dùng lại hoặc cùng kiểu với bài bốn.

#### option w1_magma
correct: false
label.en: magma
label.vi: mác-ma
image.brief: Dùng lại hình `q4_underground` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): magma chamber diagram underground
image.alt.en: Melted rock deep under the ground
image.alt.vi: Đá nóng chảy sâu dưới lòng đất

#### option w1_sand
correct: false
label.en: sand
label.vi: cát
image.brief: Dùng lại hình `q1_sand` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Đống cát mịn chụp gần; không có tay người, dấu chân hay chữ. Từ khoá tìm ảnh (EN): heap of fine sand close up
image.alt.en: Sand up close
image.alt.vi: Cát nhìn gần
> SK-033 (10/11): designer dùng lại ảnh đống cát của lựa chọn `q1_sand` bài ba *Khủng long* thay cho ảnh cát vàng trên bãi biển (trước: "[ảnh] Cát vàng trên bãi biển chụp gần…"); alt đổi theo (trước: "Yellow sand up close" · "Cát vàng nhìn gần"). Nhãn "sand · cát" không đổi.

#### option w1_lava
correct: true
label.en: lava
label.vi: dung nham
image.brief: Dùng lại hình `q4_slope` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): lava flow volcano slope
image.alt.en: Red-hot lava on a volcano
image.alt.vi: Dung nham đỏ rực trên sườn núi lửa

### w2
id: 61b26442-3f3e-4cce-b434-6b7b91a26065
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/dat-va-nuoc-tren-trai-dat
prompt.en: Does Earth have more land or more water?
prompt.vi: Trái Đất có nhiều đất hơn hay nhiều nước hơn?
image.brief: [ảnh] Một cái cân đĩa bằng đồng kiểu cũ, hai đĩa cân để trống, chụp ngang trên nền trơn; không có chữ, không có nhãn hiệu. Cân gợi việc so "nhiều hơn hay ít hơn" mà không cho thấy đất hay nước; ảnh quả địa cầu hay Trái Đất từ vũ trụ sẽ lộ đáp án. Từ khoá tìm ảnh (EN): balance scale brass empty
image.alt.en: A balance scale
image.alt.vi: Cái cân đĩa
hint.en: Think of a globe. Which colour covers the most?
hint.vi: Em nghĩ tới quả địa cầu. Màu nào phủ nhiều nhất?
explanation_correct.en: Yes! Water covers most of Earth's surface.
explanation_correct.vi: Đúng rồi! Nước phủ phần lớn bề mặt Trái Đất.
explanation_wrong.en: The answer is more water. Most of a globe is blue.
explanation_wrong.vi: Đáp án là nhiều nước hơn. Phần lớn quả địa cầu có màu xanh dương.
> Câu hỏi và ba lựa chọn giữ đúng chữ của câu "Em nghĩ sao?" mà bài một đề xuất. Nhờ vậy, khi schema có `think_first`, app so được câu trả lời ở đầu và ở cuối chủ đề.
> Câu trước đây không có hình, vì nhìn quả địa cầu là thấy ngay đáp án. SK-033 (9/11): mọi câu phải có hình, nên ảnh câu hỏi là cái cân đĩa (so nhiều hay ít), không phải quả địa cầu. Ba lựa chọn dùng lại ba hình của câu q5 bài một (cùng ba ý: toàn đất, toàn nước, nửa đất nửa nước), để bé gặp lại đúng câu hỏi cũ với đúng hình cũ. Ảnh chỉ minh hoạ chữ của lựa chọn, không cho thấy cả Trái Đất, nên không lộ đáp án.

#### option w2_land
correct: false
label.en: More land
label.vi: Nhiều đất hơn
image.brief: Dùng lại hình `explore_land` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): hills tea plantation Vietnam village
image.alt.en: Hills, mountains and a village
image.alt.vi: Đồi, núi và làng quê

#### option w2_water
correct: true
label.en: More water
label.vi: Nhiều nước hơn
image.brief: Dùng lại hình `tray_sea` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): sea horizon fishing boat
image.alt.en: The wide blue sea
image.alt.vi: Biển xanh rộng

#### option w2_same
correct: false
label.en: About the same
label.vi: Gần bằng nhau
image.brief: Dùng lại hình `q5_same` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): coastline aerial beach sea land
image.alt.en: Half land and half sea
image.alt.vi: Nửa là đất, nửa là biển

### w3
id: 15c31106-2f6b-4da6-ae6d-56874d74d3af
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/cac-chau-luc-va-dai-duong
prompt.en: Asia is one country.
prompt.vi: Châu Á là một quốc gia.
image.brief: Dùng lại hình `tray_asia` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Ảnh ruộng bậc thang chỉ gợi châu Á, không cho thấy một hay nhiều quốc gia, để không lộ đáp án. Từ khoá tìm ảnh (EN): rice terraces Vietnam mountains
image.alt.en: Rice terraces on the mountains
image.alt.vi: Ruộng bậc thang trên núi
answer: false
hint.en: Think of Vietnam and Japan. Where are they?
hint.vi: Em nghĩ tới Việt Nam và Nhật Bản. Hai quốc gia này ở đâu?
explanation_correct.en: Asia is a continent. It has many countries.
explanation_correct.vi: Châu Á là một châu lục. Châu Á có nhiều quốc gia.
explanation_wrong.en: This is false. Asia is a continent with many countries.
explanation_wrong.vi: Câu này sai. Châu Á là một châu lục, có nhiều quốc gia.
> Khối mới (rà chữ 9/11), `id:` để trống, chờ lệnh `ids`. Bài hai đã có id nên `recall_from.lesson` hợp lệ.
> Giải thích khi đúng giống câu q6 của bài hai, để bé nghe lại đúng câu sửa misconception. Không mở đầu bằng "Yes!", vì bé vừa chọn Sai.
> Câu trước đây không có hình: hình ruộng bậc thang của châu Á ở bài hai không giúp bé phân biệt châu lục với quốc gia. SK-033 (9/11): mọi câu phải có hình, nên dùng lại đúng ảnh đó, chỉ để gợi bối cảnh. Không dùng bản đồ châu Á: vừa lộ đáp án (thấy nhiều quốc gia), vừa vướng quy tắc bản đồ (Hoàng Sa, Trường Sa). Không dùng hai lá cờ Việt Nam và Nhật Bản: cũng lộ đáp án.

## Học

> Phần Học có bốn ô:
> - ba ô đầu ứng với ba ý chính, theo thứ tự của bảng kế hoạch: Các mảng (ý một), Động đất (ý hai), Sóng thần (ý ba);
> - ô thứ tư, Giữ an toàn, dạy mục tiêu của bài (cúi xuống, che đầu, bám chắc) ngay trước phần Chơi.
>
> Không dùng `sentence_card`, vì app 0.1.0 chỉ hiện `explore_groups` đầu tiên và `word_list` đầu tiên ở màn Học (như bài một).
> Ví dụ quả trứng nứt vỏ nối với bài ba, nơi quả trứng luộc bổ đôi là mô hình ba lớp của Trái Đất.

### explore
id: 297ee04a-fb6b-4259-bd98-0f8c073ef78e
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_plates
label.en: Plates
label.vi: Các mảng
color: nau_dat
sentence.en: Earth's crust is broken into giant pieces called plates.
sentence.vi: Vỏ Trái Đất bị chia thành những mảng rất lớn.
image.brief: [hình vẽ] Một quả trứng gà luộc còn nguyên vỏ đặt trên mặt bàn gỗ (không đặt trên đĩa), vỏ nứt thành năm sáu mảng to nhỏ nhưng chưa bóc, vẽ gần như thật, cùng kiểu với hình quả trứng của bài ba; không có chữ. Chỉ có quả trứng: chưa có hình Trái Đất có ranh giới mảng hợp giấy phép, cũng chưa có người chuyên môn duyệt đường ranh giới. Sau này có hình đó (public domain của NASA hoặc USGS, quay về phía Đại Tây Dương, không thấy vùng Đông Nam Á, không có biên giới, không có chữ) thì đổi ô này thành hình ghép, quả trứng bên trái, Trái Đất bên phải; không dùng bản đồ thế giới phẳng có ranh giới mảng (thấy vùng Đông Nam Á). Từ khoá tìm ảnh (EN): boiled egg cracked shell
image.alt.en: A cracked boiled egg
image.alt.vi: Quả trứng luộc nứt vỏ
> SK-033 (10/11): hình tự vẽ chỉ có quả trứng, nên brief đổi từ `[sơ đồ ghép ảnh]` sang `[hình vẽ]`, alt đổi theo (trước: "A cracked egg next to Earth" · "Quả trứng nứt vỏ cạnh Trái Đất"). Câu của ô vẫn nói vỏ Trái Đất; món ví dụ "like a cracked eggshell · giống vỏ trứng bị nứt" nói rõ quả trứng chỉ là vật để so.
examples.1.en: like a cracked eggshell
examples.1.vi: giống vỏ trứng bị nứt
examples.2.en: under land and sea
examples.2.vi: nằm dưới cả đất và biển
examples.3.en: move very slowly
examples.3.vi: chuyển động rất chậm
> Ví dụ quả trứng chưa giống thật ở một chỗ: mảnh vỏ trứng nằm yên, còn các mảng của vỏ Trái Đất chuyển động rất chậm. Ví dụ ba nói rõ điều này.
> [CẦN KIỂM] "Chuyển động rất chậm": biên tập nhớ khoảng vài xăng-ti-mét mỗi năm, cỡ tốc độ móng tay mọc. Bài không đưa con số cho trẻ.
> [CẦN KIỂM] Đường nứt trên hình Trái Đất phải vẽ theo ranh giới mảng thật, có người chuyên môn duyệt. Chưa có người duyệt thì chỉ vẽ quả trứng.

#### group explore_quake
label.en: Earthquake
label.vi: Động đất
color: do_son
sentence.en: When plates slip suddenly, the ground shakes.
sentence.vi: Khi các mảng trượt đột ngột, mặt đất rung lắc.
image.brief: [sơ đồ] Sơ đồ khối mặt cắt vỏ Trái Đất có một vết đứt gãy: hai khối đá lớn áp sát nhau, hai mũi tên ngược chiều ở chỗ tiếp giáp cho thấy hai bên trượt; trên mặt đất có thể có đường, hàng cây. Lấy sơ đồ public domain của USGS, không lấy sơ đồ CC BY-SA; designer xoá nhãn chữ gốc và thêm vài nét rung nhỏ trên mặt đất. Không có nhà đổ, không có người, không có chữ. Từ khoá tìm ảnh (EN): fault block diagram earthquake
image.alt.en: Two plates slip and the ground shakes
image.alt.vi: Hai mảng trượt làm mặt đất rung
> SK-033 (9/11): ảnh thật không chụp được hai mảng trượt dưới đất, nên ô này dùng sơ đồ. Sơ đồ khối thường không có ngôi nhà như bản vẽ cũ, nên alt đổi "a house" thành "the ground" ("ngôi nhà" thành "mặt đất"). Câu của ô không đổi.
examples.1.en: most are very small
examples.1.vi: phần lớn rất nhỏ
examples.2.en: big ones make things fall
examples.2.vi: trận lớn làm đồ đạc rơi
examples.3.en: many are too small to feel
examples.3.vi: nhiều trận nhỏ tới mức mình không cảm thấy
> Ví dụ một và hai là phần sửa của misconception `quake_just_shaking`, dạy trước phần Chơi và câu q6. Ví dụ ba khép ô bằng một ý nhẹ nhàng, và mở đường cho thẻ máy đo động đất ở phần Thưởng.
> [CẦN KIỂM] "Phần lớn động đất rất nhỏ", "nhiều trận nhỏ tới mức không cảm thấy": biên tập nhớ mỗi năm có rất nhiều trận động đất, phần lớn nhỏ tới mức chỉ máy đo mới ghi được.
> Rà chữ 9/11 (tester N4): bỏ ví dụ ba cũ "small ones in the Central Highlands · có trận nhỏ ở Tây Nguyên". Ví dụ đó đứng ngay dưới câu "Khi các mảng trượt đột ngột, mặt đất rung lắc", trong khi Tây Nguyên nằm giữa một mảng, xa ranh giới mảng, và có ý kiến cho là các trận ở đó liên quan tới hồ thuỷ điện; bé sẽ hiểu sai nguyên nhân.
> [CẦN KIỂM] Giữ cho chuyên gia: các trận động đất nhỏ ở vùng Kon Plông những năm gần đây.
> - Vùng này trước thuộc tỉnh Kon Tum. Theo trí nhớ của biên tập, từ ngày một tháng bảy năm hai nghìn không trăm hai mươi lăm, vùng này thuộc tỉnh Quảng Ngãi. Nếu đưa lại ví dụ thì chữ cho trẻ chỉ nói "Tây Nguyên", không nêu năm, độ lớn hay tên tỉnh.
> - Biên tập nhớ một số nhà khoa học cho rằng các trận này liên quan tới hồ thuỷ điện (gọi là động đất kích thích). Chuyên môn xác nhận nguyên nhân, và gọi các trận này là "nhỏ" có đúng không. Chỉ đưa ví dụ Việt Nam trở lại nếu không đặt ngay dưới câu "mảng trượt", hoặc nếu chuyên môn xác nhận các trận đó do đứt gãy tự nhiên.

#### group explore_tsunami
label.en: Tsunami
label.vi: Sóng thần
color: cham
sentence.en: An earthquake under the sea can make a tsunami.
sentence.vi: Động đất dưới đáy biển có thể gây ra sóng thần.
image.brief: [hình vẽ] Sơ đồ mặt cắt biển designer tự vẽ theo ý một sơ đồ public domain của USGS (bản trên Commons quá nhỏ cho đường ảnh, Duy 10/11 cho vẽ): dưới đáy biển mảng đại dương trượt xuống dưới mảng lục địa, chỗ vỡ sáng lên, mũi tên cho thấy nước phía trên bị đẩy dâng lên, trên mặt biển con sóng lan ra hai phía về bờ. Không có người, nhà hay thuyền, không có chữ. Không dùng ảnh chụp sóng thần thật: đó là cảnh thảm hoạ có người gặp nạn. Thẻ q4_tsunami và từ vựng tsunami dùng lại hình này. Từ khoá tìm ảnh (EN): tsunami diagram generation NOAA
image.alt.en: A big wave starts from the sea floor
image.alt.vi: Con sóng lớn sinh ra từ đáy biển
examples.1.en: giant waves
examples.1.vi: những con sóng rất lớn
examples.2.en: strong shaking near the sea
examples.2.vi: đất rung mạnh khi ở gần biển
examples.3.en: the sea pulls far back
examples.3.vi: nước biển rút xa bất thường
examples.4.en: go up to high ground
examples.4.vi: chạy lên chỗ cao
> Ví dụ hai và ba là hai dấu hiệu, ví dụ bốn là việc cần làm (ticket SK-031). Nút nghe đọc câu rồi đọc bốn ví dụ, thành một chuỗi: động đất dưới biển, sóng lớn, dấu hiệu, chạy lên chỗ cao.
> [CẦN KIỂM] Dấu hiệu và lời khuyên khi có sóng thần:
> - ở gần biển mà thấy đất rung mạnh hoặc nước biển rút xa bất thường thì đi ngay lên chỗ cao;
> - không ở lại xem, không quay lại khi người lớn chưa cho phép;
> - biên tập nhớ nước biển không phải lúc nào cũng rút trước khi sóng tới, nên gợi ý của câu q5 dùng chữ "có thể".
>
> Chuyên môn xác nhận và cho cách nói chính thức bằng tiếng Việt, kể cả nên nói "chạy" hay "đi nhanh".

#### group explore_safe
label.en: Stay safe
label.vi: Giữ an toàn
color: gi_dong
sentence.en: Drop, cover and hold on until the shaking stops.
sentence.vi: Em cúi xuống, che đầu và bám chắc tới khi đất hết rung.
image.brief: [hình vẽ] Lớp học có bảng xanh để trống: một bạn nhỏ quỳ dưới gầm bàn, một tay vòng che đầu và gáy, tay kia nắm chân bàn; vẽ nhìn ngang, mặt cúi, không vẽ nét mặt; không có đồ rơi, không có chữ, cờ, khẩu hiệu hay logo. Không tìm được ảnh diễn tập hợp giấy phép (cả ảnh public domain của FEMA, USGS), nên designer vẽ (Duy 10/11). Từ khoá tìm ảnh (EN): earthquake drill classroom desk
image.alt.en: A child under a desk holds on
image.alt.vi: Bạn nhỏ dưới gầm bàn bám chắc chân bàn
examples.1.en: drop
examples.1.vi: cúi xuống
examples.2.en: cover your head
examples.2.vi: che đầu
examples.3.en: hold on
examples.3.vi: bám chắc
examples.4.en: stay away from windows
examples.4.vi: tránh xa cửa kính
> [CẦN KIỂM] Ba bước "cúi xuống, che đầu, bám chắc" (Drop, Cover, Hold On) có đúng khuyến cáo hiện hành không, và cơ quan phòng chống thiên tai Việt Nam có cách dịch chính thức không (xem `quake_just_shaking` ở `_topic.md`). Lời khuyên tránh xa cửa kính cũng cần kiểm, như bảng kế hoạch đã ghi.

### new_words
id: e9e1d858-9b8c-4673-b460-0c1090fc4083
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: earthquake, tsunami, plate, shake

## Chơi

> Bé chọn hình từ kệ vào ba chỗ. Đạt khi có đủ ba bước (một việc cúi xuống, một việc che đầu, một việc bám chắc) và không có việc nào chưa an toàn. Chạm hình đã chọn để bỏ ra.
> Trò chơi dùng ngay ô Giữ an toàn ở phần Học, nhưng bé phải tự xếp từng hình vào đúng bước.
> - Hai hình cùng thuộc bước che đầu: chui gầm bàn, lấy tay che đầu. Bé chọn cả hai thì còn thiếu bước bám chắc.
> - Bốn việc chưa an toàn (đứng cạnh cửa kính, đứng cạnh tủ cao, chạy ra ngoài, đi thang máy) là những việc trẻ dễ làm theo phản xạ.
>
> Vì sao là `build_tray`: ở phần Chơi, schema v1 và app 0.1.0 chỉ có block này. Lời nhắn không gọi tên vật chứa ("tray", "mâm", "khay"). Chữ giao diện màn Chơi đã đổi sang chữ chung (ios-dev 9/11, xem Ghi chú cho dev).
> Khi thiếu nhiều bước, lời nhắc theo thứ tự các `#### group`: cúi xuống, che đầu, bám chắc, cũng là thứ tự làm.

### tray
id: 6e4e5c30-14c3-4247-b05f-3d88de941789
type: build_tray
version: 1
prompt.en: Stay safe in an earthquake
prompt.vi: Giữ an toàn khi có động đất
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: When the ground shakes: drop, cover, hold on. Find a picture for each step.
messages.start.vi: Khi đất rung: cúi xuống, che đầu, bám chắc. Em tìm một hình cho mỗi bước nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
> Rà chữ 9/11: "tap one", "chạm vào để bỏ ra" như nhãn của app (ios-dev 9/11).
messages.balanced.en: Great! Stay there and hold on until the shaking stops.
messages.balanced.vi: Tuyệt! Em ở yên đó và bám chắc tới khi đất hết rung.
> Lời nhắn khi đạt thêm ý "ở yên tới khi hết rung", để bé không đứng dậy quá sớm.
messages.has_limited.en: That is not safe. Tap it to take it off.
messages.has_limited.vi: Việc đó không an toàn. Em chạm vào để bỏ ra nhé.
> Bốn việc chưa an toàn dùng chung một lời nhắn. Bài không giải thích từng việc, để lời nhắn ngắn và không làm bé sợ. Ý "tránh xa cửa kính" đã có ở ô Giữ an toàn; cửa kính và cầu thang gặp lại ở câu q3.
messages.missing.tray_drop.en: You still need a picture for Drop.
messages.missing.tray_drop.vi: Em còn thiếu bước cúi xuống.
messages.missing.tray_cover.en: You still need a picture for Cover.
messages.missing.tray_cover.vi: Em còn thiếu bước che đầu.
messages.missing.tray_hold.en: You still need a picture for Hold on.
messages.missing.tray_hold.vi: Em còn thiếu bước bám chắc.
> Lời nhắn thiếu bước không dùng "Add" hay "Thêm", vì ba chỗ có thể đã đầy khi còn thiếu bước (như bài một).

#### group tray_drop
label.en: Drop
label.vi: Cúi xuống
color: vang_hoe
role: required

#### group tray_cover
label.en: Cover
label.vi: Che đầu
color: cham
role: required

#### group tray_hold
label.en: Hold on
label.vi: Bám chắc
color: gi_dong
role: required

#### group tray_unsafe
label.en: Only safe things
label.vi: Chỉ chọn việc an toàn
color: do_son
role: limit
> Nhãn nhóm `limit` viết thành câu khẳng định, vì "Không chọn việc không an toàn" là phủ định kép. Dòng điều kiện trên nút sẽ là "Cần đủ Cúi xuống, Che đầu, Bám chắc · Chỉ chọn việc an toàn".

#### item tray_kneel
label.en: Kneel down
label.vi: Quỳ xuống
group: tray_drop
image.brief: [hình vẽ] Một bạn nhỏ quỳ gối trên sàn nhà, người cúi thấp, hai tay chống sàn, cạnh một chiếc bàn gỗ, chưa chui vào gầm; vẽ nghiêng từ phía sau, không vẽ nét mặt; không có đồ rơi, không có chữ. Cùng bạn nhỏ, cùng phòng, cùng chiếc bàn với các món tray_table, tray_arms, tray_leg. Từ khoá tìm ảnh (EN): child kneeling floor hands
image.alt.en: A child kneels down low
image.alt.vi: Bạn nhỏ quỳ thấp xuống sàn

#### item tray_window
label.en: By the window
label.vi: Đứng cạnh cửa kính
group: tray_unsafe
image.brief: [hình vẽ] Một bạn nhỏ đứng sát ô cửa sổ kính lớn trong nhà, nhìn ra cây xanh bên ngoài, vẽ từ phía sau (chỉ thấy lưng và tóc); kính còn nguyên; không có chữ, không có nhãn dán trên kính. Câu q3 (lựa chọn q3_window) dùng lại hình này. Từ khoá tìm ảnh (EN): child window from behind
image.alt.en: A child stands by a glass window
image.alt.vi: Bạn nhỏ đứng cạnh cửa kính

#### item tray_table
label.en: Under a table
label.vi: Chui gầm bàn
group: tray_cover
image.brief: [hình vẽ] Một bạn nhỏ đã chui xuống gầm một chiếc bàn gỗ to, chắc chắn, cúi đầu, một tay vòng lên che đầu; vẽ ngang tầm sàn, không vẽ nét mặt; không có đồ rơi, không có chữ. Câu q3 (lựa chọn q3_desk) và từ vựng safe dùng lại hình này. Từ khoá tìm ảnh (EN): child under table drill
image.alt.en: A child gets under a strong table
image.alt.vi: Bạn nhỏ chui xuống gầm bàn chắc chắn

#### item tray_outside
label.en: Run outside
label.vi: Chạy ra ngoài
group: tray_unsafe
image.brief: [hình vẽ] Một bạn nhỏ đang chạy qua cửa ra vào để ra sân, vẽ từ phía sau trong nhà, thấy khung cửa mở và khoảng sân sáng phía trước; không vẽ nét mặt; không đổ vỡ, không có chữ. Từ khoá tìm ảnh (EN): child running out door
image.alt.en: A child runs out of the door
image.alt.vi: Bạn nhỏ chạy ra khỏi cửa
> [CẦN KIỂM] Lời khuyên "không chạy ra ngoài khi đất đang rung" (bảng kế hoạch). Biên tập nhớ có tài liệu tiếng Việt khuyên người ở tầng trệt chạy ra khoảng trống. Nếu chuyên môn thấy việc này chưa rõ đúng sai thì đổi món này thành "Run down the stairs · Chạy xuống cầu thang".

#### item tray_leg
label.en: Hold the table leg
label.vi: Bám chân bàn
group: tray_hold
image.brief: [hình vẽ] Bàn tay trẻ em nắm chặt một chân bàn gỗ, vẽ gần dưới gầm bàn; chỉ thấy bàn tay, cổ tay, tay áo và chân bàn; không có chữ. Từ khoá tìm ảnh (EN): hand holding table leg
image.alt.en: A hand holds a table leg
image.alt.vi: Bàn tay bám chắc chân bàn

#### item tray_shelf
label.en: By a tall shelf
label.vi: Đứng cạnh tủ cao
group: tray_unsafe
image.brief: [hình vẽ] Một bạn nhỏ đứng sát một chiếc tủ sách cao nhiều ngăn đầy sách và đồ vật, vẽ từ phía sau hoặc nghiêng, không vẽ nét mặt; đồ vẫn nằm yên; gáy sách không có chữ, không có nhãn hiệu. Từ khoá tìm ảnh (EN): child tall bookshelf standing
image.alt.en: A child stands by a tall shelf
image.alt.vi: Bạn nhỏ đứng cạnh tủ cao

#### item tray_arms
label.en: Arm over head
label.vi: Tay che đầu
group: tray_cover
image.brief: [hình vẽ] Một bạn nhỏ quỳ dưới gầm bàn, vẽ gần phần đầu và vai (thấy mép bàn ở trên), một cánh tay vòng lên che đầu và gáy, mặt cúi xuống (tư thế diễn tập động đất); không có đồ rơi, không có chữ. Câu q3 (lựa chọn q3_arms) dùng lại hình này. Từ khoá tìm ảnh (EN): student covering head drill
image.alt.en: A child covers their head with one arm
image.alt.vi: Bạn nhỏ lấy một tay che đầu
> Rà chữ 9/11 (tester N3): bản cũ vẽ bạn quỳ sát tường, hai tay ôm đầu, "gần đó không có bàn", trong khi món `tray_leg` là nắm chân bàn. Tổ hợp Quỳ xuống, Tay che đầu, Bám chân bàn đạt nhưng vô lý: vừa không có bàn vừa nắm chân bàn. Nay ba hình `tray_table`, `tray_arms`, `tray_leg` là cùng một cảnh dưới cùng một chiếc bàn, giống hình ô `explore_safe`: một tay che đầu và gáy, tay kia bám chân bàn. Nhãn EN đổi "Arms" thành "Arm" cho khớp hình một tay; nhãn VI giữ.
> Mọi tổ hợp đạt đều hợp lý: Quỳ xuống, Chui gầm bàn, Bám chân bàn; hoặc Quỳ xuống, Tay che đầu, Bám chân bàn (bạn đã ở dưới bàn, một tay che đầu, một tay bám).
> SK-033 (9/11): ảnh thật từ nguồn miễn phí khó có cùng một bạn nhỏ, cùng một chiếc bàn. Ưu tiên bốn ảnh của ba bước lấy từ cùng một buổi diễn tập; khác buổi thì vẫn đạt ý, vì mỗi ảnh là một bước của cùng tư thế. Alt EN đổi "her" thành "their", vì chưa biết ảnh là bạn trai hay bạn gái.
> SK-033 (10/11): không có ảnh trẻ em đúng tư thế hợp giấy phép, nên tám món kệ Chơi, ô `explore_safe` và các lựa chọn q3_stairs, q5_watch, q5_hill là hình tự vẽ (Duy 10/11). Bốn món của ba bước nay là cùng một bạn nhỏ, cùng một chiếc bàn, như bản vẽ cũ. Alt giữ "their".
> SK-033: tám ảnh đều có trẻ em (cả người, lưng hoặc bàn tay), không ảnh nào chỉ có đồ vật: nếu bốn việc chưa an toàn chỉ là ảnh cửa kính, tủ, cửa ra vào, thang máy không người, bé sẽ chọn theo việc ảnh có người hay không. Hai món chỉ có bàn tay chia đều: một an toàn (`tray_leg`), một chưa an toàn (`tray_lift`).

#### item tray_lift
label.en: Use the lift
label.vi: Đi thang máy
group: tray_unsafe
image.brief: [hình vẽ] Bàn tay trẻ em bấm nút gọi thang máy, bên cạnh là cửa thang máy inox, vẽ gần; chỉ thấy bàn tay; nút chỉ có hình tam giác, không có số tầng, tên hãng hay chữ. Từ khoá tìm ảnh (EN): hand pressing elevator button
image.alt.en: A hand presses the lift button
image.alt.vi: Bàn tay bấm nút thang máy

## Quiz

### q1
id: 7f2a056d-1545-43d0-8b1c-a1f55dc5a6b0
format: single_choice
version: 1
dok: 1
prompt.en: What happens in an earthquake?
prompt.vi: Khi có động đất, điều gì xảy ra?
image.brief: [ảnh] Vết đứt gãy San Andreas (Mỹ) chụp từ trên cao: một đường rãnh dài chạy thẳng qua vùng đồi khô, là chỗ hai mảng gặp nhau trên đất liền; ảnh public domain của USGS hoặc NASA, không kèm logo; không có người, nhà, không có chữ. Ảnh cho thấy nơi các mảng trượt, không cho thấy mặt đất rung, để không lộ đáp án; ảnh cũng không giống ảnh lựa chọn nào. Câu q4 dùng lại ảnh này. Từ khoá tìm ảnh (EN): San Andreas Fault aerial Carrizo Plain
image.alt.en: A long line where two plates meet
image.alt.vi: Đường dài nơi hai mảng gặp nhau
hint.en: Plates slip under our feet. What do we feel?
hint.vi: Các mảng trượt ngay dưới chân mình. Mình cảm thấy gì?
explanation_correct.en: Yes! In an earthquake, the ground shakes.
explanation_correct.vi: Đúng rồi! Khi có động đất, mặt đất rung lắc.
explanation_wrong.en: The answer is the ground shakes. Lava comes out of volcanoes.
explanation_wrong.vi: Đáp án là mặt đất rung lắc. Dung nham thì trào ra từ núi lửa.
> Lựa chọn dung nham ôn bài bốn và tách động đất khỏi núi lửa. Hai hiện tượng hay xảy ra ở cùng vùng, nên trẻ dễ lẫn.

#### option q1_rain
correct: false
label.en: heavy rain
label.vi: mưa to
image.brief: [hình vẽ] Mưa to trắng xoá trút xuống một căn nhà mái ngói giữa vườn cây, trước nhà có vũng nước gợn; không có người, không có chữ; cùng nét với hình cốc nước của lựa chọn `q1_shake`. Câu q2 bài năm *Khủng long* dùng lại hình này. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain
image.alt.vi: Mưa to
> SK-033 (Duy duyệt ảnh 10/11): khác brief cũ ("[ảnh] Mưa to mùa mưa trên một con phố nhỏ ở Việt Nam…"). Nhãn "heavy rain · mưa to" không đổi.
> SK-033 (10/11 tối): hình tự vẽ thay ảnh mưa to dùng lại của câu q1 bài bốn, để ba lựa chọn của câu q1 cùng là hình vẽ (lựa chọn đúng `q1_shake` là hình vẽ). Alt giữ.

#### option q1_shake
correct: true
label.en: the ground shakes
label.vi: mặt đất rung lắc
image.brief: [hình vẽ] Một cốc nước thuỷ tinh đặt trên bàn gỗ trong phòng, mặt nước gợn những vòng tròn nhỏ như khi bàn đang rung, hai bên cốc có vài nét rung nhỏ; vẽ gần ngang mặt bàn, phía sau trơn; không có người, không có nhãn hiệu, không có chữ. Không vẽ cảnh đồ đổ vỡ. Câu q4 (thẻ q4_shakes), câu q6 và từ vựng earthquake dùng lại ảnh này. Từ khoá tìm ảnh (EN): glass water ripples table
image.alt.en: Water shaking in a glass
image.alt.vi: Nước trong cốc đang rung
> SK-033 (9/11): ảnh thật khó chụp được cả căn phòng đang rung (đèn đung đưa, khung ảnh lệch) mà không thành cảnh đổ vỡ, nên lấy cốc nước gợn sóng. Alt đổi từ "A room shaking · Căn phòng đang rung" theo ảnh mới. Tìm được ảnh căn phòng có đèn treo đung đưa (nhoè vì chuyển động), không đổ vỡ, thì dùng ảnh đó và trả lại alt cũ.

#### option q1_lava
correct: false
label.en: lava comes out
label.vi: dung nham trào ra
image.brief: [hình vẽ] Một núi lửa đang phun trào lúc chạng vạng, vẽ từ xa: cột dung nham đỏ ở miệng núi, hai dòng dung nham chảy xuống sườn, cột tro mờ phía trên; không có người, không có nhà cửa, không có ngọn lửa cháy rừng, không có chữ; cùng nét với hình cốc nước của lựa chọn `q1_shake`. Thẻ q4_erupts dùng lại hình này. Từ khoá tìm ảnh (EN): volcano erupting lava night distant
image.alt.en: A volcano erupting
image.alt.vi: Núi lửa đang phun trào
> SK-033 (10/11 tối): hình tự vẽ thay ảnh dùng lại `explore_erupt` của bài bốn, để ba lựa chọn của câu q1 cùng là hình vẽ. Vẫn vẽ từ xa, không gây sợ, theo luật của chủ đề. Alt giữ.

### q2
id: 3ef40af2-c802-4954-90b8-ffed99258be5
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: [ảnh] Mặt ruộng khô nứt nẻ thành nhiều mảng lớn nhỏ, chụp từ trên xuống; không có người, không có chữ. Ảnh gợi ý "vỡ thành nhiều mảng" mà không chỉ lớp nào của Trái Đất, để không lộ đáp án. Không dùng hình ô explore_plates (quả trứng nứt vỏ): bé đã học vỏ trứng giống vỏ Trái Đất, nên hình đó lộ đáp án. Từ khoá tìm ảnh (EN): mud cracked dry ground
image.alt.en: Dry ground cracked into pieces
image.alt.vi: Mặt đất khô nứt thành nhiều mảng
sentence.en: Plates are giant pieces of Earth's {1}.
sentence.vi: Các mảng là những phần rất lớn của {1}.
answers: q2_crust
hint.en: Which layer do we live on?
hint.vi: Mình sống trên lớp nào của Trái Đất?
explanation_correct.en: Yes! Plates are giant pieces of the crust.
explanation_correct.vi: Đúng rồi! Các mảng là những phần rất lớn của vỏ Trái Đất.
explanation_wrong.en: The answer is crust. We live on the crust.
explanation_wrong.vi: Đáp án là vỏ Trái Đất. Mình sống trên lớp vỏ này.
> Câu nhắc lại ý chính một bằng cách nói khác, và ôn ba lớp của bài ba: ngân hàng từ là vỏ Trái Đất, lớp manti, nhân Trái Đất. Gợi ý nối với ý chính một và câu q1 của bài ba ("mình sống trên vỏ Trái Đất").
> Rà chéo 9/11: ngân hàng từ đổi sang tên đầy đủ như bài ba ("vỏ" thành "vỏ Trái Đất", "nhân" thành "nhân Trái Đất"), và câu tiếng Việt bỏ chữ "Trái Đất" sau ô trống cho khỏi lặp. [CẦN KIỂM] tên ba lớp theo sách giáo khoa hiện hành, xem bảng Tên gọi ở `_topic.md` và ghi chú ở ý chính một.
> [CẦN KIỂM] (tester, lỗi nhỏ 10) Câu này có một đáp án duy nhất "các mảng là phần của vỏ Trái Đất", còn "lớp manti" là lựa chọn sai. Thật ra mảng gồm vỏ Trái Đất và phần trên cùng của lớp manti. Biên tập giữ câu vì khớp ý chính một, từ `plate` và ô `explore_plates` (cùng một cách giản lược). Nếu chuyên môn muốn nói "lớp ngoài cùng cứng" thay cho "vỏ Trái Đất", phải sửa cả bốn chỗ; riêng câu này thì đổi sang hỏi lớp mình sống bên trên (ví dụ "We live on the {1}, and it is broken into plates."), để không dạy bé "mảng chỉ là vỏ".
> SK-033 (9/11), chỗ chưa chắc: ảnh ruộng khô nứt nẻ là cách so sánh như quả trứng nứt vỏ. Bé có thể nghĩ mảng là những vết nứt nhỏ trên mặt đất, hoặc ruộng nứt vì động đất. Nhờ tester xem; nếu thấy hiểu nhầm thì đổi sang ảnh Trái Đất từ vũ trụ của từ surface ở bài một (gợi "bên ngoài" nhẹ hơn nhưng không gợi "mảng").

#### bank q2_core
label.en: core
label.vi: nhân Trái Đất
image.brief: Dùng lại hình `q1_core` ở bài `be-mat-trai-dat/ben-trong-trai-dat`. Từ khoá tìm ảnh (EN): Earth layers cutaway diagram
image.alt.en: Earth cut open, the core shown
image.alt.vi: Mặt cắt Trái Đất, tô rõ nhân

#### bank q2_mantle
label.en: mantle
label.vi: lớp manti
image.brief: Dùng lại hình `q1_mantle` ở bài `be-mat-trai-dat/ben-trong-trai-dat`. Từ khoá tìm ảnh (EN): Earth layers cutaway diagram
image.alt.en: Earth cut open, the mantle shown
image.alt.vi: Mặt cắt Trái Đất, tô rõ lớp manti

#### bank q2_crust
label.en: crust
label.vi: vỏ Trái Đất
image.brief: Dùng lại hình `q1_crust` ở bài `be-mat-trai-dat/ben-trong-trai-dat`. Từ khoá tìm ảnh (EN): Earth layers cutaway diagram
image.alt.en: Earth cut open, the crust shown
image.alt.vi: Mặt cắt Trái Đất, tô rõ lớp vỏ

### q3
id: 429f6670-befe-4b33-9297-6c5903dd761f
format: multi_choice
version: 1
dok: 2
prompt.en: Shaking in class! What is safe?
prompt.vi: Đất rung khi em đang ở lớp! Việc nào an toàn?
image.brief: [ảnh] Một lớp học tiểu học không có người, chụp từ cuối lớp: bảng đen, hai dãy bàn gỗ, cửa sổ kính một bên, cửa ra hành lang; ưu tiên lớp học Việt Nam; không có chữ trên bảng, không có cờ, khẩu hiệu hay ảnh chân dung (cắt bỏ hoặc chọn ảnh khác). Designer thêm vài nét rung nhỏ quanh đèn trần và bàn. Không có cảnh đổ vỡ. Lớp không có học sinh, để không có mặt trẻ em và không cho thấy bạn nào đang làm gì (sẽ lộ đáp án). Từ khoá tìm ảnh (EN): classroom empty desks blackboard Vietnam
image.alt.en: A classroom starts to shake
image.alt.vi: Lớp học bắt đầu rung
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
hint.en: Remember the three steps you just played.
hint.vi: Em nhớ lại ba bước vừa chơi nhé.
explanation_correct.en: Yes! Get under a desk, or cover your head.
explanation_correct.vi: Đúng rồi! Em chui xuống gầm bàn, hoặc lấy tay che đầu.
explanation_wrong.en: The answers are under a desk and arms over head.
explanation_wrong.vi: Đáp án là chui xuống gầm bàn và lấy tay che đầu.
> Phần Chơi diễn ra ở nhà; câu này đưa ba bước sang lớp học, một tình huống quen khác. Có một việc mới chưa gặp ở phần Chơi: chạy xuống cầu thang.
> Lựa chọn trước đây chỉ có chữ, vì nhãn là cụm hành động và lưới hình ba cột sẽ cắt nhãn dài (`lineLimit(2)` ở `QuestionViews.swift`). SK-033 (9/11): mọi lựa chọn phải có hình. Ba ảnh dùng lại kệ Chơi (gầm bàn, cửa kính, tay che đầu), một ảnh mới (cầu thang); cả bốn đều có trẻ em, để bé không chọn theo việc ảnh có người hay không. Nhờ ios-dev xem nhãn VI dài nhất "Đứng cạnh cửa sổ kính", "Chui xuống gầm bàn" trong ô hình.
> [CẦN KIỂM] Không chạy xuống cầu thang khi đất đang rung. Trường học thường diễn tập: hết rung mới đi xuống sân theo hàng.

#### option q3_desk
correct: true
label.en: Under a desk
label.vi: Chui xuống gầm bàn
image.brief: Dùng lại hình `tray_table`. Từ khoá tìm ảnh (EN): child under table drill
image.alt.en: A child gets under a strong table
image.alt.vi: Bạn nhỏ chui xuống gầm bàn chắc chắn

#### option q3_window
correct: false
label.en: By a window
label.vi: Đứng cạnh cửa sổ kính
image.brief: Dùng lại hình `tray_window`. Từ khoá tìm ảnh (EN): child window from behind
image.alt.en: A child stands by a glass window
image.alt.vi: Bạn nhỏ đứng cạnh cửa kính

#### option q3_stairs
correct: false
label.en: Run downstairs
label.vi: Chạy xuống cầu thang
image.brief: [hình vẽ] Một bạn nhỏ đang chạy xuống cầu thang có tay vịn, vẽ nhìn ngang, đầu quay đi chỉ thấy tóc, không vẽ nét mặt; không có chữ hay biển chỉ dẫn. Từ khoá tìm ảnh (EN): child running down stairs
image.alt.en: A child runs down the stairs
image.alt.vi: Bạn nhỏ chạy xuống cầu thang

#### option q3_arms
correct: true
label.en: Arms over head
label.vi: Lấy tay che đầu
image.brief: Dùng lại hình `tray_arms`. Từ khoá tìm ảnh (EN): student covering head drill
image.alt.en: A child covers their head with one arm
image.alt.vi: Bạn nhỏ lấy một tay che đầu

### q4
id: bac04e49-671b-4039-84a2-156300d4a627
format: fill_blank_bank
version: 1
dok: 2
prompt.en: Pick the missing words
prompt.vi: Chọn những từ còn thiếu
image.brief: Dùng lại hình `q1`. Ảnh vết đứt gãy chỉ minh hoạ "các mảng trượt", không cho thấy rung lắc hay sóng, để không lộ đáp án. Từ khoá tìm ảnh (EN): San Andreas Fault aerial Carrizo Plain
image.alt.en: A long line where two plates meet
image.alt.vi: Đường dài nơi hai mảng gặp nhau
sentence.en: Plates slip, and the ground {1}. Under the sea, this can make a {2}.
sentence.vi: Các mảng trượt, và mặt đất {1}. Dưới đáy biển, điều đó có thể gây ra {2}.
answers: q4_shakes, q4_tsunami
hint.en: Two words are about volcanoes. Leave them out.
hint.vi: Có hai từ nói về núi lửa. Em bỏ qua hai từ đó nhé.
explanation_correct.en: Yes! The ground shakes. Under the sea, a tsunami can start.
explanation_correct.vi: Đúng rồi! Mặt đất rung lắc. Dưới đáy biển, động đất có thể gây ra sóng thần.
explanation_wrong.en: The answers are shakes and tsunami. Volcanoes erupt lava.
explanation_wrong.vi: Đáp án là rung lắc và sóng thần. Còn núi lửa thì phun trào dung nham.
> DOK 2: bé nối ý chính hai với ý chính ba thành một chuỗi nguyên nhân và kết quả, rồi loại hai từ của bài bốn (phun trào, dung nham). Bài một của *Ăn uống lành mạnh* và bài một của chủ đề này chỉ dùng câu một chỗ trống; đây là câu hai chỗ trống đầu tiên trong nội dung thật (xem Ghi chú cho dev).

#### bank q4_lava
label.en: lava
label.vi: dung nham
image.brief: [hình vẽ] Một dòng dung nham đỏ rực chảy xuống sườn núi lửa màu tối, vẽ gần vừa; mặt dòng có lớp vỏ nguội sẫm màu nứt thành mảng, khe nứt sáng cam; không có người, không có ngọn lửa, không có chữ; cùng nét với ba thẻ kia của câu q4. Từ khoá tìm ảnh (EN): lava flow volcano slope
image.alt.en: Red-hot lava on a volcano
image.alt.vi: Dung nham đỏ rực trên sườn núi lửa
> SK-033 (10/11 tối): hình tự vẽ thay ảnh dùng lại `q4_slope` của bài bốn. Hai đáp án đúng (`q4_shakes`, `q4_tsunami`) là hình tự vẽ, nên hai thẻ sai cũng phải là hình vẽ; trước đây hai thẻ sai là ảnh chụp, bé đoán được theo kiểu hình. Alt giữ. Lựa chọn w1_lava vẫn dùng ảnh `q4_slope` của bài bốn.

#### bank q4_shakes
label.en: shakes
label.vi: rung lắc
image.brief: Dùng lại hình `q1_shake`. Từ khoá tìm ảnh (EN): glass water ripples table
image.alt.en: Water shaking in a glass
image.alt.vi: Nước trong cốc đang rung

#### bank q4_erupts
label.en: erupts
label.vi: phun trào
image.brief: Dùng lại hình `q1_lava`. Từ khoá tìm ảnh (EN): volcano erupting lava night distant
image.alt.en: A volcano erupting
image.alt.vi: Núi lửa đang phun trào
> SK-033 (10/11 tối): dùng lại hình tự vẽ núi lửa phun trào của lựa chọn `q1_lava` trong bài, thay ảnh `explore_erupt` của bài bốn, để bốn thẻ cùng là hình vẽ.

#### bank q4_tsunami
label.en: tsunami
label.vi: sóng thần
image.brief: Dùng lại hình `explore_tsunami`. Từ khoá tìm ảnh (EN): tsunami diagram generation NOAA
image.alt.en: A big wave starts from the sea floor
image.alt.vi: Con sóng lớn sinh ra từ đáy biển

### q5
id: 2f539483-28d0-49f6-8c04-37e4c403f8b6
format: single_choice
version: 1
dok: 2
prompt.en: At the beach, the sea suddenly pulls far back. What should Lan do?
prompt.vi: Ở bãi biển, nước biển bỗng rút ra rất xa. Lan nên làm gì?
image.brief: [ảnh] Bãi cát ướt rộng lúc nước rút, mặt biển phẳng ở xa, không có sóng lớn; vài người rất nhỏ ở xa, không nhận ra mặt; không có bạn nhỏ hay người lớn đứng gần; đã cắt bỏ ngọn đồi bên phải, để ảnh không thấy đồi hay bậc thang; không có chữ. Từ khoá tìm ảnh (EN): beach low tide wet sand
image.alt.en: A wide beach of wet sand, the sea far away
image.alt.vi: Bãi cát ướt rộng, biển ở xa
> SK-033 (Duy duyệt ảnh 10/11): khác brief cũ, ảnh không có Lan và mẹ (theo phương án "bãi cát nước rút không có người" của brief cũ); alt đổi theo. Chữ câu hỏi đã nói "bỗng rút ra rất xa", và giải thích vẫn nhắc nghe lời người lớn, nên giữ. Designer chưa chắc bé nhận ra cảnh nước rút; nhờ tester xem trên máy.
> Rà chữ 9/11 (tester, lỗi nhỏ 11): thêm mẹ đứng gần Lan, vì giải thích khi đúng nói "listen to grown-ups", và cảnh trẻ ở bãi biển nên có người lớn đi cùng. Mẹ không được chỉ về phía đồi hay gọi mọi người, vì như vậy hình sẽ lộ đáp án "chạy lên chỗ cao".
> SK-033 (9/11): ảnh câu hỏi bỏ ngọn đồi có bậc thang của bản vẽ cũ, vì ảnh lựa chọn đúng q5_hill là bậc thang lên đồi; hai ảnh giống nhau sẽ lộ đáp án. Ảnh thật lúc nước rút trông như lúc thuỷ triều xuống bình thường; câu hỏi đã nói "bỗng rút ra rất xa".
hint.en: The sea pulling back can mean big waves. Where is safe?
hint.vi: Nước biển rút xa có thể là dấu hiệu sóng lớn sắp tới. Chỗ nào an toàn?
explanation_correct.en: Yes! Go up high fast, and listen to grown-ups.
explanation_correct.vi: Đúng rồi! Em chạy ngay lên chỗ cao và nghe lời người lớn.
explanation_wrong.en: The answer is high ground. Big waves may come.
explanation_wrong.vi: Đáp án là chạy lên chỗ cao. Sóng lớn có thể tới.
> Câu vận dụng ý chính ba và các dấu hiệu ở ô Sóng thần vào một chuyến đi biển quen thuộc. "Ra nhặt vỏ ốc" là việc trẻ dễ làm thật, vì nước rút để lộ cát, cá và vỏ ốc.
> Giữ giọng nhẹ nhàng: hình không có sóng, không ai gặp nạn; giải thích chỉ nói "sóng lớn có thể tới". Xem [CẦN KIỂM] ở ô Sóng thần.

#### option q5_shells
correct: false
label.en: Pick up shells
label.vi: Ra nhặt vỏ ốc
image.brief: [ảnh] Một bàn tay cầm mấy vỏ sò ở mép nước bãi biển, chụp gần; chỉ thấy bàn tay, không thấy mặt; không có chữ. Ba lựa chọn của câu này đều có người (bàn tay hoặc lưng), để bé không chọn theo việc ảnh có người hay không. Từ khoá tìm ảnh (EN): hand holding seashells beach
image.alt.en: A hand holding seashells at the beach
image.alt.vi: Bàn tay cầm vỏ sò ở bãi biển
> SK-033 (Duy duyệt ảnh 10/11): khác brief cũ, bàn tay có vẻ của người lớn, đang cầm chứ không đang nhặt; alt đổi theo. Nhãn "Pick up shells · Ra nhặt vỏ ốc" giữ: đó là việc Lan định làm, và "nhặt vỏ ốc" là cách trẻ quen gọi chung việc nhặt vỏ ở bãi biển.

#### option q5_watch
correct: false
label.en: Watch the sea
label.vi: Đứng xem biển
image.brief: [hình vẽ] Một bạn nhỏ đứng một mình trên bãi cát nhìn ra biển êm, vẽ từ phía sau, thấy lưng và mặt biển phía trước; không có chữ. Hình khác ảnh câu hỏi (hình này vẽ gần một bạn, không có người lớn, không thấy dải cát nước rút). Từ khoá tìm ảnh (EN): child looking at sea
image.alt.en: A child looks at the sea
image.alt.vi: Bạn nhỏ đứng nhìn biển

#### option q5_hill
correct: true
label.en: Go to high ground
label.vi: Chạy lên chỗ cao
image.brief: [hình vẽ] Lối bậc đá đi lên một ngọn đồi xanh cây gần biển, một bạn nhỏ đang bước lên, vẽ từ phía sau, không vẽ nét mặt; không có chữ hay biển chỉ dẫn. Từ khoá tìm ảnh (EN): child climbing steps hill
image.alt.en: A child goes up steps on a hill
image.alt.vi: Bạn nhỏ đi lên bậc thang trên đồi

### q6
id: a4b479f1-07ae-448c-8807-9a9f7bec2248
format: true_false
version: 1
dok: 3
misconception: quake_just_shaking
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
image.brief: Dùng lại hình `q1_shake`. Ảnh cốc nước gợn chỉ cho thấy "đất rung nhẹ", không cho thấy Na làm gì hay đồ đạc rơi, để không lộ đáp án. Từ khoá tìm ảnh (EN): glass water ripples table
image.alt.en: Water shaking in a glass
image.alt.vi: Nước trong cốc đang rung
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
> Rà chữ 9/11 (tester N1): nhãn trung tính chung cho cả năm câu sáu, xem ghi chú ở câu q6 bài một.
statement.en: The ground shakes a little. I still drop, cover and hold on.
statement.vi: Đất chỉ rung nhẹ thôi. Mình vẫn cúi xuống, che đầu, bám chắc.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
hint.en: Can you tell how big it will get?
hint.vi: Em có biết trước trận động đất sẽ mạnh tới đâu không?
explanation_correct.en: Yes! Shaking can get stronger, and things can fall.
explanation_correct.vi: Đúng rồi! Đất có thể rung mạnh hơn, và đồ đạc có thể rơi.
explanation_wrong.en: Na is right. Shaking can get stronger.
explanation_wrong.vi: Na nói đúng. Đất đang rung nhẹ vẫn có thể rung mạnh hơn.
> Rà chữ 9/11 (tester N1): câu này đổi sang đáp án "Na đúng", vẫn gắn `quake_just_shaking`. Bản cũ: Na nói "Đất chỉ rung nhẹ thôi. Vậy mình cứ chơi tiếp." (đáp án Sai).
> DOK 3: bé đánh giá việc Na làm. Đất mới rung nhẹ mà Na vẫn làm đủ ba bước; bé còn nghĩ "rung nhẹ thì không cần làm gì" sẽ cho là Na làm quá và chọn "No". Lúc mới rung chưa ai biết trận động đất sẽ mạnh tới đâu. Gợi ý hỏi đúng chỗ đó, không nói thẳng đáp án.
> [CẦN KIỂM] Ý "đất đang rung nhẹ có thể rung mạnh hơn, nên cúi xuống, che đầu, bám chắc ngay": biên tập hiểu đây là lý do khuyến cáo yêu cầu làm ba bước ngay khi thấy rung.

## Từ vựng

### earthquake
id: de0af9a0-e404-488c-9b4e-ab0c053ca41a
tier: core
term.en: earthquake
term.vi: động đất
example.en: In an earthquake, the ground shakes.
example.vi: Khi có động đất, mặt đất rung lắc.
image.brief: Dùng lại hình `q1_shake`. Từ khoá tìm ảnh (EN): glass water ripples table
image.alt.en: Water shaking in a glass
image.alt.vi: Nước trong cốc đang rung

### tsunami
id: a50f03ed-9cf1-45c7-908a-450e4f03b935
tier: core
term.en: tsunami
term.vi: sóng thần
example.en: A tsunami is a group of very big waves.
example.vi: Sóng thần là một loạt những con sóng rất lớn.
image.brief: Dùng lại hình `explore_tsunami`. Từ khoá tìm ảnh (EN): tsunami diagram generation NOAA
image.alt.en: A big wave starts from the sea floor
image.alt.vi: Con sóng lớn sinh ra từ đáy biển
> [CẦN KIỂM] Sóng thần thường gồm nhiều con sóng nối nhau, không phải một con sóng. Chuyên môn xác nhận cách nói "một loạt những con sóng rất lớn".

### plate
id: 7c841466-9c11-429e-b33c-f024a07fc00a
tier: core
term.en: plate
term.vi: mảng
example.en: Earth's crust is broken into plates, like a cracked eggshell.
example.vi: Vỏ Trái Đất bị chia thành nhiều mảng, giống vỏ trứng bị nứt.
image.brief: Dùng lại hình `explore_plates`. Từ khoá tìm ảnh (EN): boiled egg cracked shell
image.alt.en: A cracked boiled egg
image.alt.vi: Quả trứng luộc nứt vỏ
> SK-033 (10/11): hình nay chỉ có quả trứng luộc nứt vỏ, không có Trái Đất. Câu ví dụ đổi (trước: "Earth's crust is made of giant plates." · "Vỏ Trái Đất gồm những mảng rất lớn.") để nói rõ quả trứng chỉ là vật để so, khỏi hiểu "plate" là mảnh vỏ trứng. Câu EN mười từ, đúng giới hạn Discoverer; câu giống câu và món ví dụ của ô `explore_plates`. Cần sinh lại giọng EN và VI của câu ví dụ.
> Rà chéo 9/11: bài một không còn dùng "plate" (lựa chọn "cái đĩa" ở câu w1 đã đổi thành cái đồng hồ). Trong chủ đề này, bé chỉ gặp "plate" với nghĩa mảng của vỏ Trái Đất. Ở *Ăn uống lành mạnh*, "plate" là cái đĩa nhưng chỉ có trong chữ mô tả hình (alt), không có trong chữ bé đọc. Hình `explore_plates` đặt quả trứng trên mặt bàn, không trên đĩa, để khỏi gợi nghĩa cái đĩa.

### shake
id: dea01948-f8ca-436c-b8bb-231f3957f26a
tier: core
term.en: shake
term.vi: rung lắc
example.en: The window shakes when a big truck goes by.
example.vi: Cửa sổ rung lên khi xe tải lớn chạy qua.
image.brief: [hình vẽ] Ô cửa sổ kính nhìn từ trong nhà, ngoài đường một chiếc xe tải đang chạy qua; khung cửa hơi nhoè và có vài nét rung nhỏ; xe không có biển số, logo hay chữ; không có người. Từ khoá tìm ảnh (EN): truck passing window street
image.alt.en: A window shakes as a truck goes by
image.alt.vi: Cửa sổ rung khi xe tải chạy qua

### safe
id: fc2fb368-7fc2-4eaa-80e0-5f160f31ae4c
tier: extra
term.en: safe
term.vi: an toàn
example.en: I get under a strong table to stay safe.
example.vi: Em chui xuống gầm bàn chắc chắn để được an toàn.
image.brief: Dùng lại hình `tray_table`. Từ khoá tìm ảnh (EN): child under table drill
image.alt.en: A child gets under a strong table
image.alt.vi: Bạn nhỏ chui xuống gầm bàn chắc chắn

### wave
id: db07101f-bbc3-4aa6-8083-b7b6b7f7f5a9
tier: extra
term.en: wave
term.vi: con sóng
example.en: We play by the waves at the beach.
example.vi: Mình chơi ở mép sóng trên bãi biển.
image.brief: [ảnh] Hai bạn nhỏ chơi ở mép sóng trên bãi biển lúc hoàng hôn, chụp ngược sáng nên chỉ thấy bóng, không nhận ra mặt; biển êm; không có chữ. Từ khoá tìm ảnh (EN): children beach waves sunset
image.alt.en: Children playing at the edge of the waves
image.alt.vi: Các bạn nhỏ chơi ở mép sóng
> SK-033 (Duy duyệt ảnh 10/11): khác brief cũ, ảnh không có cảnh nắm tay nhảy sóng và không có người lớn đứng gần. Câu ví dụ đổi cho khớp ảnh (trước: "We jump over small waves at the beach." · "Mình nhảy qua những con sóng nhỏ ở bãi biển."); alt đổi theo.

### high_ground
id: 1a2bd42d-26e4-4183-85f2-1af4a4d26738
tier: extra
term.en: high ground
term.vi: chỗ cao
example.en: If the sea pulls far back, go to high ground.
example.vi: Nếu nước biển rút xa, em lên ngay chỗ cao.
image.brief: [hình vẽ] Ngọn đồi cao xanh cây ngay sau một làng chài ven biển Việt Nam (nhà mái ngói đỏ), vẽ xa thấy cả làng, đồi, bãi cát và biển; trời nắng, biển êm; thuyền (nếu có) rất nhỏ; không có người, không có biển hiệu, không có chữ. Từ khoá tìm ảnh (EN): hill fishing village coast Vietnam
image.alt.en: A high hill next to the sea
image.alt.vi: Ngọn đồi cao cạnh biển

## Thưởng

### seismograph
id: e5c4b73d-45fc-4cc5-931c-32f169ed0cbc
set: earth
rarity: common
name.en: Seismograph
name.vi: Máy đo động đất
tag.en: Earthquakes
tag.vi: Động đất
fact.en: A seismograph draws shaking as a wiggly line. It feels tiny earthquakes that people cannot feel.
fact.vi: Máy đo động đất vẽ rung động thành một đường nhấp nhô. Máy nhận ra cả những trận động đất rất nhỏ mà con người không cảm thấy.
> [CẦN KIỂM] Kiểu máy có ngòi bút vẽ trên trống giấy là kiểu cổ điển. Máy hiện nay ghi bằng số, nhưng vẫn hiện rung động thành đường nhấp nhô. Chuyên môn xác nhận gọi "seismograph · máy đo động đất" là đúng, và ý "máy nhận ra những trận người không cảm thấy".
> Nghe thử giọng EN đọc "seismograph".
image.brief: [ảnh] Máy đo động đất kiểu cổ điển có trống giấy quay và ngòi bút, trong bảo tàng hoặc phòng đo, chụp gần; trên giấy thấy rõ đường nhấp nhô; cắt bỏ tên hãng, nhãn, số và chữ; không có người. Từ khoá tìm ảnh (EN): seismograph drum recording
image.alt.en: A seismograph draws a wiggly line
image.alt.vi: Máy đo động đất vẽ đường nhấp nhô

## Ghi chú cho hoạ sĩ

- **SK-033 (9/11): hình là ảnh chụp thật hoặc sơ đồ khoa học**, không còn vẽ giấy cắt; không lấy hình AI từ nguồn ngoài, không dùng tranh hoạt hình.
  - **Duy chốt 10/11:** đồ vật, cảnh không có ảnh miễn phí hợp lệ thì designer vẽ minh hoạ gần thực tế (hình tự vẽ, credit "Science Kids"); cảnh khó thì ghép từ ảnh có sẵn; hình không có chữ. Ở bài này hai mươi hình gốc là hình tự vẽ: `explore_plates`, `explore_tsunami`, `explore_safe`, tám món kệ Chơi, `q1_shake`, `q1_rain`, `q1_lava`, `q3_stairs`, `q4_lava`, `q5_watch`, `q5_hill`, từ `shake`, từ `high_ground` (ba hình `q1_rain`, `q1_lava`, `q4_lava` thêm 10/11 tối; thẻ `q4_erupts` dùng lại `q1_lava`).
  - Cú pháp `brief` theo `content/TEMPLATE.md` (mục A, đoạn "Hình"). Loại hình dùng trong bài: `[ảnh]`, `[hình vẽ]` (hình tự vẽ); thêm loại riêng của chủ đề `[sơ đồ]` (sơ đồ khoa học public domain, đã xoá nhãn gốc, ô `explore_quake`). Ô `explore_plates` trước là `[sơ đồ ghép ảnh]` (quả trứng cạnh Trái Đất); nay chỉ có quả trứng, là `[hình vẽ]`.
  - Giấy phép và cách kiểm từng ảnh theo SK-033, mục "Giấy phép": chỉ CC0, public domain hoặc PDM có nhãn rõ, CC BY. Sơ đồ của NOAA, USGS là public domain; bỏ logo cơ quan.
  - Việc của designer trên ảnh: đặt ảnh lên mảnh giấy (không viền), cắt khung, xoá nhãn chữ gốc của sơ đồ. Nét rung nhỏ ở `q1_shake` và từ `shake` nằm sẵn trong hình tự vẽ; ở `explore_quake` và câu q3 (ảnh, sơ đồ có sẵn) designer chỉ thêm được nếu làm thành hình ghép. Designer không vẽ thêm vật hay người lên ảnh chụp.
  - "Dùng lại hình `<key>`" là dùng đúng file ảnh đã chọn cho khoá đó.
- **Hình có trẻ em** (rất nhiều ở bài này): không có mặt nhận ra được. Vẽ từ phía sau, chỉ thấy bàn tay, hoặc mặt cúi, không vẽ nét mặt. Không lấy ảnh mạng xã hội hay ảnh báo chí. Ảnh trẻ em từ nguồn miễn phí, đúng tư thế, không lộ mặt rất hiếm; Duy chốt 10/11: các hình này do designer vẽ (không tự chụp ảnh dàn dựng).
- **Bối cảnh Việt Nam** khi tìm được: lớp học tiểu học có bảng đen và bàn gỗ hai chỗ, nhà phố, phố mùa mưa, bãi biển miền Trung, làng chài có đồi cao. Ảnh diễn tập ở nước ngoài dùng được nếu không có cờ, chữ, khẩu hiệu.
- **Không làm bé sợ** (ticket SK-031, `_topic.md` mục Frontmatter):
  - không có cảnh đổ nát, người bị thương, nước cuốn nhà hay người trong sóng, không dùng ảnh một thảm hoạ có thật;
  - rung chỉ thể hiện bằng mặt nước gợn trong cốc và vài nét rung nhỏ trong hình vẽ;
  - sóng thần chỉ có ở sơ đồ mặt cắt (`explore_tsunami`), không dùng ảnh chụp sóng thần;
  - người trong ảnh luôn bình tĩnh; không lấy ảnh có người hoảng sợ.
- **Bản đồ** (Duy chốt 9/11, SK-031): bài này không có hình bản đồ khu vực. Nếu ảnh nào thấy vùng Đông Nam Á như một bản đồ thì phải theo bản đồ chuẩn của Nhà nước, đủ quần đảo Hoàng Sa, Trường Sa, và gửi người duyệt pháp lý trước khi phát hành; cách an toàn là chọn ảnh khác.
  - Ô `explore_plates` nay chỉ có quả trứng (hình tự vẽ). Nếu sau này thêm hình Trái Đất có ranh giới mảng: quay về phía Đại Tây Dương như bài một, không thấy vùng Đông Nam Á; không dùng bản đồ thế giới phẳng có ranh giới mảng.
  - Đường ranh giới các mảng không phải biên giới, và phải theo dữ liệu thật. Chưa có người chuyên môn duyệt thì chỉ dùng hình quả trứng.
- **Bốn việc chưa an toàn ở kệ Chơi** vẽ bình thường: chỉ cho thấy bạn nhỏ đang ở đâu, đang làm gì. Không có kính vỡ, tủ đổ hay thang máy kẹt.
- **Tám hình ở kệ Chơi đều có trẻ em** (cả người, lưng hoặc bàn tay), để bé không chọn theo việc hình có người hay không. Hai hình chỉ có bàn tay chia đều: `tray_leg` (an toàn), `tray_lift` (chưa an toàn). Câu q3, q5 cũng theo luật này.
- **Ba bước** (rà chữ 9/11, tester N3) ghép lại phải thành đúng tư thế ở ô `explore_safe` (dưới gầm bàn, một tay che đầu và gáy, tay kia bám chân bàn). Từ 10/11 bốn món là hình tự vẽ: cùng một bạn nhỏ, cùng một chiếc bàn, cùng một phòng.
  - Quỳ xuống (`tray_kneel`): quỳ cạnh bàn, hai tay chống sàn, chưa ở dưới bàn.
  - Chui gầm bàn (`tray_table`): đã ở dưới gầm bàn.
  - Tay che đầu (`tray_arms`): dưới gầm bàn, vẽ gần đầu và vai, một cánh tay che đầu và gáy.
  - Bám chân bàn (`tray_leg`): vẽ gần, bàn tay nắm chân bàn là chính.
- **Không lộ đáp án:** ảnh câu w1 là núi lửa yên lặng (không có dung nham như ảnh lựa chọn đúng); câu w2 là cái cân; câu w3 là ruộng bậc thang, không phải bản đồ hay cờ; câu q1, q4 là vết đứt gãy San Andreas, không thấy rung; câu q2 là ruộng khô nứt nẻ, không phải quả trứng nứt; câu q3 là lớp học không có người; câu q5 không có đồi hay bậc thang; câu q6 là cốc nước gợn sóng.
- **Số hình (SK-033):** năm mươi hai ô hình trong bài, từ hai mươi chín ảnh hoặc sơ đồ gốc riêng của bài, cộng mười một hình dùng lại của bài khác (đếm 9/11; từ 10/11 cát ở w1 dùng lại bài ba *Khủng long*, và mười bảy hình gốc là hình tự vẽ; từ 10/11 tối mưa ở q1_rain, núi lửa phun ở q1_lava và dung nham ở q4_lava là ba hình tự vẽ mới, không dùng lại bài bốn nữa).
  - Học: quả trứng luộc nứt vỏ (hình tự vẽ); Trái Đất có ranh giới mảng (chưa có, ô dùng hình quả trứng); sơ đồ khối đứt gãy; sơ đồ sóng thần (hình tự vẽ); bạn nhỏ dưới gầm bàn (hình tự vẽ).
  - Từ 10/11 (Duy chốt): mọi hình có trẻ em ở Chơi, q3, q5 (trừ `q5_shells`), cốc nước gợn sóng, từ `shake`, từ `high_ground` là hình tự vẽ.
  - Chơi: quỳ xuống; đứng cạnh cửa kính; chui gầm bàn; chạy ra cửa; bàn tay nắm chân bàn; đứng cạnh tủ cao; tay che đầu; bàn tay bấm nút thang máy.
  - Khởi động và Quiz: cát (w1); cái cân (w2); vết đứt gãy San Andreas (q1, q4); mưa to trên phố; cốc nước gợn sóng (q1, q4, q6); ruộng khô nứt nẻ (q2); lớp học không người, bạn nhỏ chạy xuống cầu thang (q3); bãi biển nước rút, bàn tay nhặt vỏ ốc, bạn nhỏ nhìn biển, bạn nhỏ đi lên bậc thang đồi (q5).
  - Từ vựng: cửa sổ và xe tải (`shake`); trẻ em nhảy sóng (`wave`); đồi sau làng chài (`high_ground`).
  - Thẻ: máy đo động đất kiểu trống giấy.
- **Dùng lại:**
  - từ bài bốn: núi lửa yên lặng (câu hỏi q1 bài bốn) ở w1; `q4_underground` ở w1_magma; `q4_slope` ở w1_lava. Từ 10/11 tối thẻ q4_lava, lựa chọn q1_lava và lựa chọn q1_rain là hình tự vẽ riêng của bài này, thẻ q4_erupts dùng lại `q1_lava`;
  - từ bài ba: ba bản sơ đồ `q1_crust`, `q1_mantle`, `q1_core` ở câu q2;
  - từ bài hai: ruộng bậc thang `tray_asia` ở câu w3;
  - từ bài một: `explore_land`, `tray_sea`, `q5_same` ở ba lựa chọn của câu w2 (cùng ba ý với câu q5 bài một);
  - trong bài: `q1_shake` ở q4, q6 và từ `earthquake`; `q1_lava` ở thẻ q4_erupts; ảnh câu q1 ở q4; `explore_tsunami` ở q4 và từ `tsunami`; `explore_plates` ở từ `plate`; `tray_table`, `tray_window`, `tray_arms` ở q3; `tray_table` ở từ `safe`.
- **Quả trứng nứt** (`explore_plates`) nên cùng kiểu quả trứng luộc ở bài ba, để bé nhận ra: bài ba bổ đôi quả trứng để xem ba lớp, bài này xem vỏ trứng nứt thành mảng. Vẽ quả trứng đặt trên mặt bàn, không đặt trên đĩa (từ `plate`).
- **Ảnh đã duyệt khác brief** (SK-033, Duy duyệt 10/11; brief và alt trong bài đã sửa theo ảnh):
  - lựa chọn `q1_rain`: lượt duyệt 10/11 dùng lại ảnh mưa to của câu q1 bài bốn; từ 10/11 tối là hình tự vẽ mưa to trên nhà mái ngói (xem "Đổi 10/11 tối"), không phải phố Việt Nam mùa mưa (danh sách ảnh ở trên vẫn ghi "mưa to trên phố");
  - câu q5: bãi cát ướt nước rút, không có Lan và mẹ;
  - lựa chọn `q5_shells`: bàn tay (có vẻ người lớn) cầm vỏ sò; nhãn giữ;
  - từ `wave`: hai bạn nhỏ chơi ở mép sóng lúc hoàng hôn, không nhảy sóng, không có người lớn trong ảnh; câu ví dụ đổi theo ảnh.
  - Lựa chọn `w1_sand` (10/11): dùng lại ảnh đống cát `q1_sand` của bài ba *Khủng long*; brief đổi thành "Dùng lại hình", alt "Sand up close" · "Cát nhìn gần".
  - Thẻ `seismograph`: ảnh trống giấy máy đo động đất trong bảo tàng (Commons, CC BY 4.0), cắt bỏ biển chữ; brief và alt giữ.
- **Đổi 10/11** (sau khi designer làm hình): mười bảy hình tự vẽ (xem mục đầu), brief đổi sang `[hình vẽ]`; ô `explore_plates` và từ `plate` alt "A cracked boiled egg" · "Quả trứng luộc nứt vỏ", câu ví dụ của từ `plate` đổi để nói rõ quả trứng là vật để so (cần sinh lại giọng).
- **Đổi 10/11 tối** (designer làm nốt hình; brief sửa theo file chọn ảnh, alt và chữ bé nghe không đổi):
  - lựa chọn `q1_rain`, `q1_lava`: hình tự vẽ (mưa to trên nhà mái ngói; núi lửa phun lúc chạng vạng), để ba lựa chọn của câu q1 cùng là hình vẽ như `q1_shake`;
  - thẻ `q4_lava`: hình tự vẽ dòng dung nham trên sườn núi lửa; thẻ `q4_erupts` dùng lại `q1_lava`. Bốn thẻ của câu q4 nay cùng là hình vẽ;
  - câu q2 bài năm *Khủng long* (`q2_rain`) dùng lại hình `q1_rain` của bài này.
- **Màu:**
  - Ở Học: các mảng `nau_dat`, động đất `do_son`, sóng thần `cham`, giữ an toàn `gi_dong`.
  - Ở Chơi: cúi xuống `vang_hoe`, che đầu `cham`, bám chắc `gi_dong`, việc chưa an toàn `do_son`.
- Ý chính chưa có trường hình trong schema v1. Gợi ý nếu sau này có màn tóm tắt:
  1. quả trứng luộc nứt vỏ (cạnh Trái Đất có ranh giới mảng, nếu có hình được duyệt);
  2. hình mặt cắt hai mảng trượt;
  3. hình mặt cắt sóng thần;
  4. thêm một hình cho mục tiêu: ba tư thế cúi xuống, che đầu, bám chắc xếp thành hàng.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, bốn từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món.
  - Khởi động: `single_choice` ×2 (w1, w2), `true_false` (w3, đáp án Sai, có hình từ SK-033; khối mới khi sửa theo rà chữ 9/11, đã có `id`); cả ba `recall_from.kind: lesson`.
  - Quiz: `single_choice` ×2 (q1, q5), `fill_blank_bank` ×2 (q2; q4 có hai chỗ trống), `multi_choice` (q3), `true_false` (q6, `speaker: na`). Bốn format, đều hiện được ở app 0.1.0.
  - DOK từ q1 đến q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1).
  - Câu có `misconception`: q6, key `quake_just_shaking`. Đây là lần đầu key này được dùng. Từ rà chữ 9/11 đáp án là "Na đúng" (`answer: true`).
- **Tham chiếu:**
  - `recall_from.lesson: be-mat-trai-dat/nui-lua` (w1) trỏ bài bốn (đã có id, slug khớp).
  - `recall_from.lesson: be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` (w2) trỏ bài một, đã có id.
  - `recall_from.lesson: be-mat-trai-dat/cac-chau-luc-va-dai-duong` (w3) trỏ bài hai, đã có id.
  - `misconception: quake_just_shaking` → `misconception_id`.
  - `group:` trỏ nhóm của `tray`; `term_keys` trỏ Từ vựng.
  - `answers: q2_crust` và `answers: q4_shakes, q4_tsunami` trỏ `#### bank`.
  - Mọi key duy nhất trong bài.
- **App không xáo lựa chọn**, nên vị trí đáp án đúng đặt tay:
  - w1: thứ ba; w2: thứ hai;
  - q1: thứ hai; q2: từ thứ ba trong ngân hàng; q3: thứ nhất và thứ tư; q4: từ thứ hai và thứ tư; q5: thứ ba.
  - Kệ Chơi xếp xen việc an toàn và chưa an toàn: quỳ xuống, cửa kính, gầm bàn, chạy ra ngoài, bám chân bàn, tủ cao, tay che đầu, thang máy.
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn, chưa chạm gì → `start`;
  - chạm Quỳ xuống, Chui gầm bàn, Bám chân bàn → đạt (`balanced`);
  - chạm Đứng cạnh cửa kính → `has_limited` (đứng trước `missing`);
  - chạm Chui gầm bàn, Tay che đầu, Quỳ xuống (đủ ba chỗ, hai việc che đầu) → `missing.tray_hold`;
  - rồi chạm Bám chân bàn → `full`;
  - bỏ Tay che đầu ra, đặt Bám chân bàn vào → đạt.
- **Câu q4 có hai chỗ trống**, là câu hai chỗ trống đầu tiên trong nội dung thật. App có xử lý (`QuestionViews.swift` dòng 19 so `keys.count` với `fill.answers.count`). Nhờ tester xem trên iPhone:
  - câu xuống dòng ra sao;
  - bốn từ trong ngân hàng xếp thành hai hàng (lưới ba cột);
  - giọng đọc đọc câu có hai chỗ trống thế nào.
- **Học có bốn ô** (bài một có ba): lưới hai cột trên iPhone thành hai hàng, như bài một của *Ăn uống lành mạnh*.
- **Chữ giao diện màn Chơi:** đã xử lý (ios-dev 9/11, SK-031 Quyết định đã ghi). Xếp xong ba bước, bé thấy "Done! Take the quiz · Xong rồi! Làm quiz"; không còn chữ mâm, món.
- **Hình giữ chỗ ở kệ Chơi:** đã xử lý (ios-dev 9/11). Kệ dùng chung một mảnh giấy lõm trung tính, không tô màu nhóm, và xáo thứ tự mỗi lượt học, nên bốn việc chưa an toàn không còn lộ qua màu hay qua vị trí chẵn trên lưới.
- **Bộ thẻ `set: earth`:** app đã có khoá `collectible.set.earth` "Earth cards · Thẻ Trái Đất" (ios-dev 9/11). Không cần tạm xoá khối `### seismograph`.
- **Câu "Em nghĩ sao?":** w2 giữ đúng chữ và ba lựa chọn của câu đề xuất ở bài một. Khi schema có `think_first` (v1.1), app hiện được câu bé trả lời ở bài một cạnh câu trả lời ở w2, để bé tự so.
- **Số từ EN trên một màn** (đếm như bài một: trạng thái nhiều chữ nhất, món ví dụ ở Học không tính):
  - Học khoảng ba mươi hai từ: mục tiêu 9, hướng dẫn 3, bốn nhãn 5, câu dài nhất 9, ô Từ mới 6. Vượt ba mươi vì có ô thứ tư; nếu PM muốn đúng ba mươi thì đổi nhãn "Stay safe" thành "Safety" và bỏ tiêu đề "New words".
  - Khởi động và Quiz: từ hai mươi tới ba mươi hai từ. q6 (bản rà chữ 9/11) khoảng ba mươi: câu hỏi 3, hướng dẫn 4, lời Na 12, hai nhãn 2, giải thích đúng 9. Nhiều nhất là q3 (khoảng ba mươi hai: câu hỏi 6, hướng dẫn 5, bốn lựa chọn 11, giải thích sai 10) và q5 (khoảng ba mươi hai: câu hỏi 13, ba lựa chọn 10, giải thích sai 9).
  - Chơi khoảng năm mươi lăm từ: tám tên 24, ba chip 4, dòng điều kiện khoảng 9, lời nhắn dài nhất 14 (`start`), lệnh 5. Tên món ở đây là cụm hành động nên dài hơn bài một. Vẫn chờ PM chốt cách đếm màn Chơi.
- **Từ EN có thể ngoài Starters/Movers** (theo trí nhớ của biên tập, cần đối chiếu danh sách Cambridge):
  - từ mới của bài: earthquake, tsunami, plate, shake, safe, wave, high ground;
  - từ đã học ở bài trước: crust, mantle, core, layer, magma, lava, volcano, erupt, globe, surface;
  - từ của bài hai (câu w3): Asia, continent, country, Japan;
  - từ khác: melted, giant, pieces, broken, slip, suddenly, kneel, shelf, lift, downstairs, cover, step, seismograph, wiggly, challenge, check, idea.
  - Phần lớn có hình đi kèm, hoặc nằm trong lời nhắn và giải thích có phụ đề tiếng Việt.
- **Chính tả Anh** như bài một: "colour" (w2), "lift" (thay cho "elevator").
- **Không dùng dấu "—"** và không có ký hiệu trong chuỗi tiếng Việt. "Mác-ma" có gạch nối theo bảng Tên gọi ở `_topic.md`; nhờ nghe thử giọng VI.
- **Asset:** không có audio và `asset` trong markdown; máy điền khi chạy `tts` và `assets`. Na là asset chung của app.
- **Hình (SK-033, 9/11):** mọi câu Khởi động và Quiz, mọi lựa chọn, mọi thẻ từ, mọi món Chơi đều có `image` (năm mươi hai ô hình). Ghi chú cho hoạ sĩ có danh sách ảnh gốc.
  - Brief "Dùng lại hình `<key>`." (khác bài: "… ở bài `<slug chủ đề>/<slug bài>`.") theo `content/TEMPLATE.md`: dùng đúng ảnh đã chọn cho khoá đó. Bài này dùng lại mười một hình của bài một, hai, ba, bốn; alt chép của chỗ gốc.
  - Alt đổi 10/11: `explore_plates` và từ `plate` ("A cracked egg next to Earth" thành "A cracked boiled egg"), `w1_sand` ("Yellow sand up close" thành "Sand up close"). Câu ví dụ của từ `plate` đổi (chữ bé đọc và nghe), cần sinh lại giọng.
  - Alt đổi theo ảnh mới, chữ bé đọc và nghe không đổi: `explore_quake` ("a house" thành "the ground"), `q1_shake` và từ `earthquake` ("A room shaking" thành "Water shaking in a glass"), `tray_lift` ("A child" thành "A hand"), `tray_arms` ("her" thành "their"), câu w1 ("A volcano erupting" thành "A quiet volcano").
  - SK-033 (10/11): mười bảy hình gốc là hình tự vẽ (mục `own` trong file chọn ảnh, credit "Science Kids", `changes: ["drawn"]`; brief `[hình vẽ]`), gồm `explore_plates` (nay chỉ có quả trứng, không ghép hình Trái Đất). Đường hình trong SK-033 chỉ tải, thu nhỏ và cắt ảnh nguồn; ô nào còn cần thêm nét rung hay xoá nhãn trên ảnh có sẵn (`explore_quake`, câu q3) thì làm thành hình ghép.
  - Lựa chọn có hình dài chữ nhất: q3 ("Đứng cạnh cửa sổ kính", "Chui xuống gầm bàn") và q5 ("Go to high ground"). Nhờ ios-dev xem nhãn có bị cắt trong ô hình ba cột không. Câu q3 có bốn lựa chọn có hình (hai hàng).
  - Ngân hàng của câu q4 có bốn thẻ hình; câu q4 là câu hai chỗ trống đầu tiên có thẻ hình.
