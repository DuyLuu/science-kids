---
id: 547449b6-09ca-4800-82fd-3c943a13c8ba
topic: be-mat-trai-dat
slug: cac-chau-luc-va-dai-duong
order: 2
stage: core
est_minutes: 9
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Continents and oceans
vi: Các châu lục và đại dương

## Mục tiêu
en: I can name some continents and oceans.
vi: Em kể tên được một số châu lục và đại dương.
> Giữ chữ "some / một số": bài giới thiệu đủ bảy châu lục và năm đại dương theo cách chia của sách tiếng Anh (Duy chốt 9/11), nhưng sau một bài chỉ mong bé nhận ra và gọi được tên một số châu lục, đại dương. Quiz không hỏi con số.

## Ý chính
1.en: Continents are very big areas of land.
1.vi: Châu lục là những vùng đất rất rộng lớn.
2.en: Oceans are very big areas of salty water.
2.vi: Đại dương là những vùng nước mặn rất rộng lớn.
3.en: Vietnam is in Asia, next to the East Sea.
3.vi: Việt Nam ở châu Á, bên bờ Biển Đông.
> "Land" dịch là "đất" như bài một. "Country" dịch là "quốc gia", không dịch là "nước", vì bài này nói nhiều về nước mặn: "một nước" dễ nghe thành "một vùng nước".
> [CẦN KIỂM] Sách giáo khoa Việt Nam phân biệt "châu lục" với "lục địa"; tiếng Anh chỉ có một từ "continent". Bài dịch "continent" là "châu lục" trong mọi câu, kể cả khi gọi Bắc Mỹ, Nam Mỹ là hai châu lục theo sách tiếng Anh. Xem `_topic.md`, misconception `continent_is_country`, và bảng Tên gọi ở mục Ghi chú của `_topic.md` (tên bảy châu lục, năm đại dương dùng chung cả chủ đề).

## Khởi động

> Cả hai câu ôn bài một (`recall_from.kind: lesson`): đây là bài trước, cách khoảng một ngày; chủ đề chưa có bài nào cách một tuần hay một tháng (syllabus-progression mục 7).
> w1 ôn màu trên quả địa cầu (xanh dương là nước), chuẩn bị cho thẻ Đại dương và ảnh Trái Đất ở phần Học. w2 ôn ý "hòn đảo là đất", chuẩn bị cho ý "châu lục là vùng đất rất rộng lớn" và câu q4 (đảo nhỏ hơn quốc gia, quốc gia nhỏ hơn châu lục).

### w1
id: bf761793-6629-4050-a81c-543b8372742c
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/dat-va-nuoc-tren-trai-dat
prompt.en: On a globe, what does blue show?
prompt.vi: Trên quả địa cầu, màu xanh dương là gì?
image.brief: Dùng lại hình `explore_globe` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): globe desk stand physical
image.alt.en: A globe on a stand
image.alt.vi: Quả địa cầu trên giá
hint.en: Remember the globe from the last lesson.
hint.vi: Em nhớ lại quả địa cầu ở bài trước nhé.
explanation_correct.en: Seas are blue, so a globe is mostly blue.
explanation_correct.vi: Biển tô xanh dương, nên quả địa cầu xanh nhiều nhất.
explanation_wrong.en: Blue on a globe shows water, like the sea.
explanation_wrong.vi: Màu xanh dương trên quả địa cầu là nước, như biển.

#### option w1_land
correct: false
feedback.en: Land is shown in green and brown.
feedback.vi: Đất được tô màu xanh lá và nâu.
label.en: land
label.vi: đất
image.brief: Dùng lại hình `explore_land` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): hills tea plantation Vietnam village
image.alt.en: Hills, mountains and a village
image.alt.vi: Đồi, núi và làng quê

#### option w1_sky
correct: false
feedback.en: A globe does not show the sky.
feedback.vi: Quả địa cầu không vẽ bầu trời.
label.en: sky
label.vi: bầu trời
image.brief: [ảnh] Bầu trời xanh trong, vài đám mây trắng mỏng, chụp ngửa lên; không thấy đất, cây, nhà hay biển; không có chữ. Từ khoá tìm ảnh (EN): sky blue clear clouds
image.alt.en: A blue sky
image.alt.vi: Bầu trời xanh

#### option w1_water
correct: true
label.en: water
label.vi: nước
image.brief: Dùng lại hình `tray_sea` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): sea horizon fishing boat
image.alt.en: The wide blue sea
image.alt.vi: Biển xanh rộng
> SK-033 (9/11): lựa chọn trước chỉ có chữ, nay có hình. Bầu trời và biển đều xanh dương, nên bẫy "sky" vẫn giữ: bé phải nhớ màu xanh dương trên quả địa cầu là nước, không chỉ khớp màu. Ảnh bầu trời là ảnh mới; đất và biển dùng lại ảnh bài một.

### w2
id: f4e9d2f4-44ee-4557-82bd-99d76a809b24
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/dat-va-nuoc-tren-trai-dat
prompt.en: An island is land.
prompt.vi: Hòn đảo là đất.
image.brief: Dùng lại hình `tray_island` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): island small sea aerial
image.alt.en: A small island in the sea
image.alt.vi: Hòn đảo nhỏ giữa biển
answer: true
hint.en: Can you walk on an island?
hint.vi: Em có đi bộ trên đảo được không?
explanation_correct.en: An island is land with water all around it.
explanation_correct.vi: Đảo là đất, có nước bao quanh.
explanation_wrong.en: An island is dry land, even in the sea.
explanation_wrong.vi: Đảo là đất khô, dù nằm giữa biển.
feedback_false.en: People build houses and grow trees on islands.
feedback_false.vi: Người ta xây nhà, trồng cây trên đảo.

## Học

> Năm ô ứng với ba ý chính, từ cụ thể tới trừu tượng: hai ô Châu lục dạy ý một, hai ô Đại dương dạy ý hai, ô Việt Nam dạy ý ba.
> Vì sao năm ô: Duy chốt 9/11 dạy đủ bảy châu lục và năm đại dương theo sách tiếng Anh, mà mỗi ô chỉ có tối đa bốn món ví dụ. Bảy châu lục chia bốn cộng ba, năm đại dương chia ba cộng hai. Lưới hai cột trên iPhone: hàng một là hai ô châu lục (cùng màu nâu đất), hàng hai là hai ô đại dương (cùng màu chàm), hàng ba là ô Việt Nam.
> Câu nói sách ở trường có thể chia khác: đúng một câu, ở ô `explore_more_oceans`, sau khi bé đã nghe cả hai con số (Duy chốt 9/11).
> Không dùng `sentence_card`: app vẫn chỉ hiện `explore_groups` đầu tiên và `word_list` đầu tiên ở màn Học (`LessonSession.swift`, như bài một).

### explore
id: 17040bee-5f0e-4569-9e06-5d299876e7cd
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_continents
label.en: Continents
label.vi: Châu lục
color: nau_dat
sentence.en: Continents are very big areas of land.
sentence.vi: Châu lục là những vùng đất rất rộng lớn.
image.brief: [ảnh] Trái Đất chụp từ vũ trụ, ảnh của NASA (ví dụ ảnh "Blue Marble" hoặc ảnh vệ tinh DSCOVR), quay về phía châu Phi và châu Âu: những vùng đất rộng lớn màu nâu và xanh lá nổi rõ giữa biển xanh dương; thấy trọn quả cầu trên nền đen; không thấy vùng Đông Nam Á kể cả ở mép phải; không có chữ, đường biên giới, logo của cơ quan. Phương án thay: ảnh quả địa cầu kiểu tự nhiên quay cùng phía. Từ khoá tìm ảnh (EN): Earth from space Africa Europe
image.alt.en: Big areas of land on Earth
image.alt.vi: Những vùng đất rộng lớn trên Trái Đất
> SK-033 (9/11): đổi quả địa cầu sang ảnh Trái Đất thật (ảnh NASA thuộc phạm vi công cộng, không có chữ, không có biên giới). Alt cũ "A globe with big areas of land" đổi thành câu đúng cho cả hai phương án.
examples.1.en: Asia
examples.1.vi: châu Á
examples.2.en: Africa
examples.2.vi: châu Phi
examples.3.en: Europe
examples.3.vi: châu Âu
examples.4.en: Oceania
examples.4.vi: châu Đại Dương
> "Châu Đại Dương" có chữ "Đại Dương" nhưng là một châu lục. Đặt ở ô Châu lục để bé nghe đúng ngay từ đầu; không đưa vào phần Chơi và Quiz, để không thành bẫy chữ.
> [CẦN KIỂM] Tên tiếng Anh: dùng "Oceania" cho khớp "châu Đại Dương". Nhiều sách tiếng Anh cho trẻ gọi châu lục này là "Australia"; bài tránh tên đó vì Australia cũng là tên một quốc gia, dễ củng cố misconception `continent_is_country`.

#### group explore_more_continents
label.en: More continents
label.vi: Các châu lục khác
color: nau_dat
sentence.en: Books in English say there are seven continents.
sentence.vi: Theo sách tiếng Anh, có bảy châu lục.
> Rà chữ 9/11: câu EN cũ "English books count seven continents." nghe gượng, và "English books" có thể hiểu là sách của nước Anh.
image.brief: [ảnh] Trái Đất chụp từ vũ trụ, ảnh của NASA, quay về phía châu Mỹ: thấy Bắc Mỹ, Nam Mỹ và vùng băng trắng của châu Nam Cực ở dưới cùng (ảnh vệ tinh DSCOVR chụp khoảng tháng mười hai đến tháng một thấy được châu Nam Cực); không thấy châu Á; không có chữ, đường biên giới, logo của cơ quan. Phương án thay: ảnh quả địa cầu nghiêng thấy cả phía dưới, cùng các yêu cầu trên. Từ khoá tìm ảnh (EN): Earth from space Americas Antarctica
image.alt.en: North America, South America and Antarctica
image.alt.vi: Bắc Mỹ, Nam Mỹ và châu Nam Cực
> SK-033 (9/11): khó tìm. Nếu ảnh chọn được không thấy châu Nam Cực thì sửa alt thành "North America and South America" · "Bắc Mỹ và Nam Mỹ"; ô vẫn giữ ba món ví dụ.
examples.1.en: North America
examples.1.vi: Bắc Mỹ
examples.2.en: South America
examples.2.vi: Nam Mỹ
examples.3.en: Antarctica
examples.3.vi: châu Nam Cực
> [CẦN KIỂM] Tên tiếng Việt của hai châu lục này theo cách chia của sách tiếng Anh: bài dùng "Bắc Mỹ", "Nam Mỹ" (cách gọi phổ biến); có tài liệu viết "châu Bắc Mỹ", "châu Nam Mỹ". Sách giáo khoa hiện hành viết "Mỹ" hay "Mĩ".
> [CẦN KIỂM] "Sách tiếng Anh tính bảy châu lục" đúng với phần lớn sách tiếng Anh cho trẻ (Anh, Mỹ). Biên tập nhớ sách Tự nhiên và Xã hội lớp ba của Việt Nam dạy sáu châu lục (châu Mỹ là một châu); chưa đối chiếu sách hiện hành.

#### group explore_oceans
label.en: Oceans
label.vi: Đại dương
color: cham
sentence.en: Oceans are very big areas of salty water.
sentence.vi: Đại dương là những vùng nước mặn rất rộng lớn.
image.brief: Dùng lại hình `tray_sea` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`: biển khơi xanh tới chân trời, không thấy đất. Từ khoá tìm ảnh (EN): sea horizon fishing boat
image.alt.en: A huge blue ocean
image.alt.vi: Đại dương xanh mênh mông
> SK-033 (Duy duyệt ảnh 10/11): khác brief cũ ("[ảnh] Chụp từ trên cao: một con thuyền buồm nhỏ xíu giữa đại dương xanh thẫm…", từ khoá "ocean sailboat aerial vast"). Không có ảnh hợp giấy phép (ảnh hải quân có cảnh cứu nạn, ảnh thuyền buồm thấy bờ), nên tạm dùng lại ảnh biển khơi của bài một; alt đổi theo, ở cả câu hỏi q3 và hai lựa chọn đại dương của bài ba. Câu, nhãn, món ví dụ của ô không đổi.
examples.1.en: Pacific Ocean
examples.1.vi: Thái Bình Dương
examples.2.en: Atlantic Ocean
examples.2.vi: Đại Tây Dương
examples.3.en: Indian Ocean
examples.3.vi: Ấn Độ Dương

#### group explore_more_oceans
label.en: More oceans
label.vi: Các đại dương khác
color: cham
sentence.en: Books in English say there are five oceans. Your school books may group them differently.
sentence.vi: Theo sách tiếng Anh, có năm đại dương. Sách ở trường em có thể chia châu lục và đại dương theo cách khác.
> Câu thứ hai là câu nhẹ nhàng Duy yêu cầu (9/11): sách ở trường có thể chia khác (ví dụ gộp Bắc Mỹ và Nam Mỹ thành châu Mỹ, hoặc chỉ có bốn đại dương), để bé không bối rối. Bản tiếng Anh nói chung ("group them differently"), bản tiếng Việt nói rõ cả châu lục và đại dương. Đặt ở ô thứ tư để bé đã nghe cả hai con số trước đó (ô một luôn mở sẵn, bé thường chạm theo thứ tự lưới).
> Rà chữ 9/11: câu EN cũ "English books count five oceans. School books may count differently." nghe gượng; đổi như câu của ô `explore_more_continents`.
> [CẦN KIỂM] Biên tập nhớ sách Tự nhiên và Xã hội lớp ba dạy bốn đại dương (không có Nam Đại Dương); một số sách tiếng Anh cũ cũng dạy bốn. Chuyên môn xác nhận câu này đủ để bé không thấy hai nguồn "cãi nhau".
image.brief: [ảnh] Những tảng băng trôi lớn nhỏ nổi trên đại dương lạnh, nước xanh thẫm, không thấy đất; ưu tiên một tảng băng lớn đỉnh phẳng; không có chim cánh cụt (chỉ gắn với châu Nam Cực), không có gấu trắng (đã có ở món `tray_arctic`), không có thuyền, người hay chữ. Từ khoá tìm ảnh (EN): iceberg ocean floating ice
image.alt.en: Floating ice in a cold ocean
image.alt.vi: Băng trôi trên đại dương lạnh
> SK-033 (9/11): tranh cũ chia đôi hai vùng cực, ảnh thật không làm được trong một khung nên còn một cảnh băng trôi; alt đổi theo. Hai món ví dụ vẫn là Bắc Băng Dương và Nam Đại Dương.
examples.1.en: Arctic Ocean
examples.1.vi: Bắc Băng Dương
examples.2.en: Southern Ocean
examples.2.vi: Nam Đại Dương
> [CẦN KIỂM] Tên tiếng Việt "Nam Đại Dương" (có tài liệu gọi "Nam Băng Dương").

#### group explore_vietnam
label.en: Vietnam
label.vi: Việt Nam
color: do_son
sentence.en: Vietnam is in Asia, next to the East Sea.
sentence.vi: Việt Nam ở châu Á, bên bờ Biển Đông.
image.brief: [bản đồ] Bản đồ chính thức của Việt Nam (nguồn nhà nước), không dùng bản đồ nước ngoài, không lấy từ kết quả tìm tự động; thể hiện đầy đủ chủ quyền, có quần đảo Hoàng Sa và quần đảo Trường Sa; khung cắt thấy Việt Nam và Biển Đông, phải thấy trọn cả hai quần đảo; giữ nguyên màu và chữ của bản chính thức, không tô lại. Từ khoá tìm ảnh (EN): Vietnam map official Hoang Sa Truong Sa
image.alt.en: A map of Vietnam and the East Sea
image.alt.vi: Bản đồ Việt Nam và Biển Đông
examples.1.en: Asia
examples.1.vi: châu Á
examples.2.en: East Sea
examples.2.vi: Biển Đông
> [CẦN KIỂM] Duyệt pháp lý trước khi phát hành (Duy chốt 9/11): hình này là bản đồ có vùng Đông Nam Á, phải là bản đồ chính thức của Việt Nam, đủ chủ quyền, kể cả quần đảo Hoàng Sa và Trường Sa; người duyệt chốt nguồn bản đồ, khung cắt và chữ trên hình. Đây là hình bản đồ khu vực duy nhất của bài.
> [CẦN KIỂM] Giấy phép (SK-033): bản đồ của nhà xuất bản nhà nước có thể không mang giấy phép CC0, phạm vi công cộng hay CC BY như quy tắc nguồn ảnh. Cần Duy chốt một cách: xin phép hoặc mua quyền dùng từ đơn vị phát hành; hoặc hoạ sĩ người thật vẽ lại bản đồ đơn giản theo đúng bản đồ chính thức, rồi qua duyệt pháp lý.

### new_words
id: 231208d2-89b8-453b-ba7e-8edee282b910
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: continent, ocean, asia, pacific_ocean

## Chơi

> Bé chọn hình từ kệ vào ba chỗ. Đạt khi có châu Á (châu lục của mình), thêm một châu lục khác và một đại dương, và không có quốc gia nào. Chạm hình đã chọn để bỏ ra.
> Trò chơi dùng ngay phần Học: phân biệt châu lục (đất) với đại dương (nước), và nhận ra Việt Nam ở châu Á (ý ba). Hai lá cờ (Việt Nam, Nhật Bản) là bẫy có chủ ý cho misconception `continent_is_country`: Việt Nam là đất, ở châu Á, nhưng là một quốc gia, không phải châu lục. Lời nhắn `has_limited` sửa thẳng ý này.
> Châu Nam Cực (đất phủ băng) và Bắc Băng Dương (băng trôi trên nước) đứng cạnh nhau ở hàng hai của kệ để bé so; câu q3 hỏi lại.
> Kệ không có châu Đại Dương (xem ghi chú ở ô Châu lục). Không có Thái Lan, vì "Thái Lan" và "Thái Bình Dương" cùng chữ "Thái" sẽ thành một bẫy chữ không thuộc mục tiêu bài.
> Thứ tự nhắc khi thiếu nhóm theo thứ tự các `#### group`: châu lục của mình, châu lục khác, đại dương.

### tray
id: b385801b-c0fa-41ff-a8e8-a0cf289324db
type: build_tray
version: 1
prompt.en: Find two continents and an ocean
prompt.vi: Tìm hai châu lục và một đại dương
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find our continent first. Then find one more continent and an ocean.
messages.start.vi: Em tìm châu lục của mình trước nhé. Rồi tìm thêm một châu lục khác và một đại dương.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
> Rà chữ 9/11: "tap one", "chạm vào để bỏ ra" như nhãn của app (ios-dev 9/11).
> Lời nhắn không gọi tên vật chứa ("tray", "mâm", "khay"), như bài một.
messages.balanced.en: Great! Vietnam is in Asia, next to the East Sea.
messages.balanced.vi: Tuyệt! Việt Nam ở châu Á, bên bờ Biển Đông.
> Lời nhắn đạt nhắc lại ý chính ba ngay trước Quiz (câu q2, q5).
messages.has_limited.en: That is a country, not a continent or an ocean. Tap it to take it off.
messages.has_limited.vi: Đó là một quốc gia, không phải châu lục hay đại dương. Em chạm vào để bỏ ra nhé.
messages.missing.tray_our_continent.en: You still need our continent. Vietnam is in it.
messages.missing.tray_our_continent.vi: Em còn thiếu châu lục của mình. Việt Nam nằm ở châu lục đó.
messages.missing.tray_continents.en: You still need one more continent.
messages.missing.tray_continents.vi: Em còn thiếu một châu lục khác.
messages.missing.tray_oceans.en: You still need an ocean.
messages.missing.tray_oceans.vi: Em còn thiếu một đại dương.
> Lời nhắn thiếu nhóm không dùng "Add/Thêm", vì ba chỗ có thể đã đầy khi còn thiếu nhóm (như bài một).

#### group tray_our_continent
label.en: Our continent
label.vi: Châu lục của mình
color: do_son
role: required
> Màu đỏ son như ô Việt Nam ở phần Học.

#### group tray_continents
label.en: Another continent
label.vi: Châu lục khác
color: nau_dat
role: required

#### group tray_oceans
label.en: Ocean
label.vi: Đại dương
color: cham
role: required

#### group tray_countries
label.en: Only continents and oceans
label.vi: Chỉ chọn châu lục và đại dương
color: vang_hoe
role: limit
> Rà chữ 9/11 (tester N6): nhãn cũ "No countries · Không chọn quốc gia" hiện trên dòng điều kiện trước khi bé chọn, báo trước hai lá cờ là bẫy. Nhãn mới nói điều được chọn, không gọi tên "quốc gia", viết khẳng định như bài năm ("Only safe things"). Lời nhắn `has_limited` vẫn nói thẳng "Đó là một quốc gia".

#### item tray_vietnam
label.en: Vietnam
label.vi: Việt Nam
group: tray_countries
image.brief: [ảnh] Lá cờ đỏ sao vàng năm cánh bay trên cột cờ, nền trời xanh, thấy trọn lá cờ, đúng màu, không bị che; không có người, toà nhà, biểu ngữ hay chữ; cùng kiểu ảnh với lá cờ của món `tray_japan`. Từ khoá tìm ảnh (EN): flag Vietnam flagpole sky
image.alt.en: The flag of Vietnam
image.alt.vi: Lá cờ Việt Nam

#### item tray_atlantic
label.en: Atlantic Ocean
label.vi: Đại Tây Dương
group: tray_oceans
image.brief: [ảnh] Sóng lớn giữa biển khơi, nước xanh xám, không thấy bờ, không có tàu; trang nguồn ghi đúng ảnh chụp ở Đại Tây Dương; không có người, logo hay chữ. Từ khoá tìm ảnh (EN): Atlantic Ocean waves
image.alt.en: Big waves on a wide ocean
image.alt.vi: Sóng lớn giữa đại dương rộng
> SK-033 (Duy duyệt ảnh 10/11): bỏ con tàu lớn của brief cũ, vì ảnh tàu giữa biển hợp giấy phép đều có watermark hoặc logo hãng tàu. Alt đổi theo, ở cả lựa chọn `q5_atlantic`.

#### item tray_africa
label.en: Africa
label.vi: Châu Phi
group: tray_continents
image.brief: [ảnh] Hươu cao cổ đứng cạnh cây tán rộng giữa đồng cỏ khô ở châu Phi, chụp từ xa, trời xanh; không có voi (không có ảnh hươu cao cổ và voi cùng khung hợp giấy phép); không có người, xe hay chữ. Alt ở đây và ở hai lựa chọn `q2_africa`, `q3_africa` nói một con hươu cao cổ. Từ khoá tìm ảnh (EN): savanna giraffe acacia
image.alt.en: A giraffe on wide grassland
image.alt.vi: Hươu cao cổ trên đồng cỏ rộng
> SK-033 (Duy duyệt ảnh 10/11): ảnh chỉ có hươu cao cổ (vườn quốc gia Nairobi), theo phương án brief đã dặn; alt ba chỗ đã sửa.

#### item tray_asia
label.en: Asia
label.vi: Châu Á
group: tray_our_continent
image.brief: [ảnh] Ruộng bậc thang trên sườn núi cao ở miền núi phía Bắc Việt Nam (Mù Cang Chải, Hoàng Su Phì hoặc Sa Pa), lúa vàng hoặc xanh, mây lưng chừng núi, chụp từ xa thấy rộng; người (nếu có) ở xa, không nhận ra mặt; không có cờ, bản đồ hay chữ. Từ khoá tìm ảnh (EN): rice terraces Vietnam mountains
image.alt.en: Rice terraces on the mountains
image.alt.vi: Ruộng bậc thang trên núi
> Châu lục là ảnh phong cảnh rộng, quốc gia là ảnh lá cờ: nhìn là thấy hai loại khác nhau.
> SK-033 (9/11): bỏ con voi châu Á khỏi hình (ảnh thật hiếm có voi đứng dưới ruộng bậc thang); alt đổi theo, ở cả từ `asia`. Lựa chọn q4 "châu Á" và câu hỏi q6 dùng lại ảnh này.

#### item tray_pacific
label.en: Pacific Ocean
label.vi: Thái Bình Dương
group: tray_oceans
image.brief: [ảnh] Một con cá voi lưng gù nhảy lên hoặc nhô lưng phun nước giữa đại dương xanh thẫm, không thấy bờ; không có thuyền, người hay chữ; ưu tiên ảnh mà trang nguồn ghi chụp ở Thái Bình Dương (ví dụ ngoài khơi Hawaii, ảnh của NOAA). Từ khoá tìm ảnh (EN): humpback whale breaching ocean
image.alt.en: A whale in a wide blue ocean
image.alt.vi: Cá voi giữa đại dương xanh

#### item tray_japan
label.en: Japan
label.vi: Nhật Bản
group: tray_countries
image.brief: [ảnh] Lá cờ Nhật Bản (nền trắng, hình tròn đỏ ở giữa) bay trên cột cờ, nền trời xanh, thấy trọn lá cờ, đúng màu, không bị che; không có người, toà nhà, biểu ngữ hay chữ; cùng kiểu ảnh với lá cờ của món `tray_vietnam`. Từ khoá tìm ảnh (EN): flag Japan flagpole sky
image.alt.en: The flag of Japan
image.alt.vi: Lá cờ Nhật Bản

#### item tray_antarctica
label.en: Antarctica
label.vi: Châu Nam Cực
group: tray_continents
image.brief: [ảnh] Đàn chim cánh cụt (loài Adélie hoặc gentoo) đứng trên bờ đá và tuyết ở châu Nam Cực, núi phủ băng phía sau; thấy rõ đây là đất có băng phủ, không phải tảng băng trôi hay băng trên mặt biển; không chọn ảnh chim cánh cụt hoàng đế đứng trên băng biển; không có người, tàu hay chữ. Từ khoá tìm ảnh (EN): penguins Antarctica rocks glacier
> SK-033 (9/11): đổi chim cánh cụt hoàng đế sang Adélie hoặc gentoo. Đàn chim cánh cụt hoàng đế thường đứng trên băng biển, tức là nước đóng băng, nên ảnh đó sẽ dạy ngược ý "châu Nam Cực là đất" của câu q3. [CẦN KIỂM] chuyên môn xác nhận.
image.alt.en: Penguins on icy land
image.alt.vi: Chim cánh cụt trên vùng đất phủ băng

#### item tray_arctic
label.en: Arctic Ocean
label.vi: Bắc Băng Dương
group: tray_oceans
image.brief: [ảnh] Một con gấu trắng đứng trên tảng băng trôi, xung quanh là nước biển xanh thẫm và nhiều mảng băng nhỏ; thấy rõ băng nổi trên nước; không có người, thuyền, vòng đeo cổ nghiên cứu hay chữ; ưu tiên ảnh phạm vi công cộng của USGS hoặc NOAA. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi

## Quiz

### q1
id: 9ede6140-e425-4c0d-a407-9cc789d9eec2
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `explore_continents`. Từ khoá tìm ảnh (EN): Earth from space Africa Europe
image.alt.en: Big areas of land on Earth
image.alt.vi: Những vùng đất rộng lớn trên Trái Đất
sentence.en: Continents are very big areas of {1}.
sentence.vi: Châu lục là những vùng {1} rất rộng lớn.
answers: q1_land
hint.en: Can you walk on a continent?
hint.vi: Em có đi bộ trên châu lục được không?
explanation_correct.en: Asia and Africa are two of these big lands.
explanation_correct.vi: Châu Á và châu Phi là hai vùng đất lớn như thế.
explanation_wrong.en: Continents are land, like Asia and Africa.
explanation_wrong.vi: Châu lục là đất, như châu Á và châu Phi.
> Gợi ý giống cách của bài một (đất thì đi bộ được), không nói thẳng đáp án.

#### bank q1_water
label.en: water
label.vi: nước
feedback.en: Very big areas of water are oceans.
feedback.vi: Vùng nước rất rộng lớn là đại dương.
image.brief: Dùng lại hình `tray_sea` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): sea horizon fishing boat
image.alt.en: The wide blue sea
image.alt.vi: Biển xanh rộng

#### bank q1_sky
label.en: sky
label.vi: bầu trời
feedback.en: The sky is above Earth's surface.
feedback.vi: Bầu trời ở phía trên bề mặt Trái Đất.
image.brief: Dùng lại hình `w1_sky`. Từ khoá tìm ảnh (EN): sky blue clear clouds
image.alt.en: A blue sky
image.alt.vi: Bầu trời xanh

#### bank q1_land
label.en: land
label.vi: đất
image.brief: Dùng lại hình `explore_land` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): hills tea plantation Vietnam village
image.alt.en: Hills, mountains and a village
image.alt.vi: Đồi, núi và làng quê
> Ba thẻ từ dùng đúng ba ảnh của câu w1 (đất, bầu trời, nước), để một từ luôn đi với một ảnh trong bài.

### q2
id: f0461c78-c98a-4949-ac03-879b8f34022c
format: single_choice
version: 1
dok: 1
prompt.en: Which continent is Vietnam in?
prompt.vi: Việt Nam ở châu lục nào?
image.brief: Dùng lại hình `tray_vietnam`. Từ khoá tìm ảnh (EN): flag Vietnam flagpole sky
image.alt.en: The flag of Vietnam
image.alt.vi: Lá cờ Việt Nam
hint.en: Remember the Vietnam picture in the lesson.
hint.vi: Em nhớ lại hình Việt Nam ở phần Học nhé.
explanation_correct.en: Asia is the biggest continent, and Vietnam is in it.
explanation_correct.vi: Châu Á là châu lục lớn nhất, có cả Việt Nam.
explanation_wrong.en: Vietnam is in Asia, next to the East Sea.
explanation_wrong.vi: Việt Nam ở châu Á, bên bờ Biển Đông.

#### option q2_asia
correct: true
label.en: Asia
label.vi: châu Á
image.brief: [ảnh] Dãy núi tuyết Himalaya ở châu Á (ví dụ vùng đỉnh Everest), chụp từ xa thấy rộng, trời xanh; không có người, lều trại hay chữ; không giống phong cảnh Việt Nam. Từ khoá tìm ảnh (EN): Himalaya mountains snow Everest
image.alt.en: Snowy mountains in Asia
image.alt.vi: Dãy núi tuyết ở châu Á
> SK-033 (9/11): không dùng lại ảnh ruộng bậc thang của món `tray_asia` ở câu này. Câu hỏi về Việt Nam, mà ruộng bậc thang trông như quê mình, nên bé chọn được chỉ bằng cách khớp ảnh, không cần nhớ "châu Á". Ba lựa chọn đều là phong cảnh xa lạ, bé phải dựa vào tên.

#### option q2_africa
correct: false
feedback.en: Africa is far away, across the Indian Ocean.
feedback.vi: Châu Phi ở rất xa, bên kia Ấn Độ Dương.
label.en: Africa
label.vi: châu Phi
image.brief: Dùng lại hình `tray_africa`. Từ khoá tìm ảnh (EN): savanna giraffe acacia
image.alt.en: A giraffe on wide grassland
image.alt.vi: Hươu cao cổ trên đồng cỏ rộng

#### option q2_europe
correct: false
feedback.en: Europe is far to the west of Vietnam.
feedback.vi: Châu Âu ở rất xa về phía tây.
label.en: Europe
label.vi: châu Âu
image.brief: [ảnh] Những cối xay gió cổ bên cánh đồng ở Kinderdijk, Hà Lan (châu Âu), chụp từ xa, trời xanh; không có hoa tulip; không có người nhận ra mặt, biển hiệu hay chữ. Từ khoá tìm ảnh (EN): windmills Kinderdijk Netherlands
image.alt.en: Windmills in the Netherlands, in Europe
image.alt.vi: Cối xay gió ở Hà Lan, châu Âu
> SK-033 (Duy duyệt ảnh 10/11): bỏ hoa tulip của brief cũ. Ảnh có cả cối xay gió và hoa tulip hợp giấy phép chỉ có tranh sơn dầu, hoặc ảnh chụp ở Mỹ, Nhật (không phải châu Âu). Alt đổi theo; nhãn "Europe · châu Âu" không đổi.

### q3
id: 7910f977-eff4-4a0d-aaa4-a95d67b9c54c
format: multi_choice
version: 1
dok: 2
prompt.en: Tap all the oceans.
prompt.vi: Chạm vào tất cả các đại dương.
image.brief: Dùng lại hình `tray_sea` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`, cùng ảnh với ô explore_oceans. Từ khoá tìm ảnh (EN): sea horizon fishing boat
image.alt.en: A huge blue ocean
image.alt.vi: Đại dương xanh mênh mông
> SK-033 (Duy duyệt ảnh 10/11): ô `explore_oceans` nay dùng lại ảnh biển khơi của bài một, nên brief trỏ thẳng tới ảnh gốc ở bài một (file chọn ảnh không cho dùng lại nối hai bước); alt đổi theo ô đó.
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
hint.en: Oceans are water. Continents are land.
hint.vi: Đại dương là nước. Châu lục là đất.
explanation_correct.en: The Arctic Ocean is water with floating ice.
explanation_correct.vi: Bắc Băng Dương là nước, có băng trôi bên trên.
explanation_wrong.en: Antarctica is land, but the Arctic Ocean is water.
explanation_wrong.vi: Châu Nam Cực là đất, Bắc Băng Dương là nước.
> Câu phân loại có một chỗ khó có chủ ý: châu Nam Cực và Bắc Băng Dương đều lạnh, đều có băng, tên tiếng Anh lại gần giống nhau (Antarctica, Arctic). Hình giúp bé phân biệt: chim cánh cụt đứng trên đất phủ băng, gấu trắng đứng trên băng trôi giữa nước.
> Bắc Băng Dương có băng trôi phủ một phần mặt nước, nhưng vẫn là đại dương. Câu không nói "phủ kín" để khỏi sai theo mùa.

#### option q3_africa
correct: false
feedback.en: Africa is land where giraffes walk.
feedback.vi: Châu Phi là đất, nơi hươu cao cổ đi lại.
label.en: Africa
label.vi: châu Phi
image.brief: Dùng lại hình `tray_africa`. Từ khoá tìm ảnh (EN): savanna giraffe acacia
image.alt.en: A giraffe on wide grassland
image.alt.vi: Hươu cao cổ trên đồng cỏ rộng

#### option q3_arctic
correct: true
label.en: Arctic Ocean
label.vi: Bắc Băng Dương
image.brief: Dùng lại hình `tray_arctic`. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi

#### option q3_antarctica
correct: false
feedback.en: Antarctica is land under thick ice.
feedback.vi: Châu Nam Cực là đất, có băng dày phủ lên.
label.en: Antarctica
label.vi: châu Nam Cực
image.brief: Dùng lại hình `tray_antarctica`. Từ khoá tìm ảnh (EN): penguins Antarctica rocks glacier
image.alt.en: Penguins on icy land
image.alt.vi: Chim cánh cụt trên vùng đất phủ băng

#### option q3_pacific
correct: true
label.en: Pacific Ocean
label.vi: Thái Bình Dương
image.brief: Dùng lại hình `tray_pacific`. Từ khoá tìm ảnh (EN): humpback whale breaching ocean
image.alt.en: A whale in a wide blue ocean
image.alt.vi: Cá voi giữa đại dương xanh

### q4
id: d5ebedfd-ef3e-41eb-8632-5e994b8444df
format: single_choice
version: 1
dok: 2
prompt.en: Which one is the biggest?
prompt.vi: Nơi nào rộng lớn nhất?
image.brief: [ảnh] Chụp qua cửa sổ máy bay nhìn xuống đất và biển rộng bên dưới, thấy mép cửa sổ; không thấy cánh máy bay có logo hãng, không có người hay chữ; không phải ảnh vệ tinh hay bản đồ. Từ khoá tìm ảnh (EN): airplane window view land sea
image.alt.en: Land and sea seen from a plane
image.alt.vi: Đất và biển nhìn từ máy bay
> Hình câu hỏi gợi ý "nhìn những nơi rộng lớn từ trên cao" mà không nghiêng về lựa chọn nào. Không dùng ảnh Trái Đất của ô `explore_continents`, vì ảnh đó gợi ngay "châu lục rất rộng".
hint.en: Which one has the other two inside it?
hint.vi: Nơi nào chứa cả hai nơi kia ở bên trong?
explanation_correct.en: Asia holds Vietnam, and Vietnam holds Cat Ba.
explanation_correct.vi: Châu Á có Việt Nam, Việt Nam có đảo Cát Bà.
explanation_wrong.en: Vietnam and Cat Ba are both inside Asia.
explanation_wrong.vi: Việt Nam và đảo Cát Bà đều nằm trong châu Á.
> Câu so sánh lồng nhau: đảo nằm trong một quốc gia, quốc gia nằm trong một châu lục. Nối với w2 (đảo là đất) và chuẩn bị cho câu q6 (châu lục không phải một quốc gia). Bé quen nghĩ "Việt Nam rất rộng" nên có thể chọn Việt Nam: đó là chỗ câu này kiểm.
> Chọn đảo Cát Bà: đảo lớn, quen với trẻ, chủ quyền rõ ràng. Nghe thử giọng EN đọc "Cat Ba".
> SK-033 (9/11): lựa chọn trước chỉ có chữ ("ba nơi này không vẽ thành một vật cùng tỉ lệ được"), nay có hình. Ảnh không cho thấy độ rộng: Việt Nam là lá cờ, châu Á là ruộng bậc thang (như phần Chơi), đảo Cát Bà là ảnh bờ đảo chụp từ mặt biển. Bé vẫn phải so bằng ý "nơi nào chứa hai nơi kia".
> Rà chữ 9/11 (tester, lỗi nhỏ 4): giữ nhãn "Cat Ba Island · đảo Cát Bà", không thêm "in Vietnam". Nhãn đã nói đó là một hòn đảo, bé biết đảo nhỏ hơn quốc gia; thêm "in Vietnam" thì lựa chọn tự trả lời một nửa phép so sánh lồng nhau mà câu này kiểm.

#### option q4_vietnam
correct: false
feedback.en: Vietnam is one country inside a continent.
feedback.vi: Việt Nam là quốc gia nằm trong một châu lục.
label.en: Vietnam
label.vi: Việt Nam
image.brief: Dùng lại hình `tray_vietnam`. Từ khoá tìm ảnh (EN): flag Vietnam flagpole sky
image.alt.en: The flag of Vietnam
image.alt.vi: Lá cờ Việt Nam

#### option q4_asia
correct: true
label.en: Asia
label.vi: châu Á
image.brief: Dùng lại hình `tray_asia`. Từ khoá tìm ảnh (EN): rice terraces Vietnam mountains
image.alt.en: Rice terraces on the mountains
image.alt.vi: Ruộng bậc thang trên núi

#### option q4_cat_ba
correct: false
feedback.en: Cat Ba is a small island in Vietnam.
feedback.vi: Cát Bà là một hòn đảo nhỏ của Việt Nam.
label.en: Cat Ba Island
label.vi: đảo Cát Bà
image.brief: [ảnh] Bờ đảo Cát Bà chụp từ mặt biển, ngang tầm mắt: núi đá vôi phủ rừng xanh, nước xanh ngọc; không chụp từ trên cao (để ảnh không trông rộng hơn hai lựa chọn kia); không có người nhận ra mặt, biển hiệu hay chữ; khác ảnh vịnh Hạ Long của thẻ thưởng bài một. Từ khoá tìm ảnh (EN): Cat Ba Island coast limestone
image.alt.en: The coast of Cat Ba Island
image.alt.vi: Bờ đảo Cát Bà

### q5
id: 78ffa4a1-ef97-4879-b632-3ebd8ec0d4dd
format: single_choice
version: 1
dok: 2
prompt.en: At a Da Nang beach, where is Mai swimming?
prompt.vi: Ở bãi biển Đà Nẵng, Mai đang bơi ở đâu?
> SK-044 (14/11, A2): gộp hai câu thành một (tám từ, mười tiếng), giữ "Where".
image.brief: [ảnh] Bãi biển Đà Nẵng (hoặc một bãi biển miền Trung) buổi sáng: cát vàng, sóng nhỏ, nước xanh; vài người tắm biển ở chỗ nông, nhỏ và ở xa, không nhận ra mặt, không có cảnh trẻ em một mình; không có toà nhà cao tầng nổi bật, biển hiệu, logo hay chữ gọi tên biển. Từ khoá tìm ảnh (EN): beach Da Nang Vietnam
> SK-033 (9/11): ảnh thật không có mặt bạn Mai; alt giữ "Mai swims near the beach" theo câu chuyện của câu hỏi. Alt không nói tên biển, để khỏi lộ đáp án.
image.alt.en: Mai swims near the beach
image.alt.vi: Mai bơi gần bờ biển
hint.en: Da Nang is in Vietnam. What is next to Vietnam?
hint.vi: Đà Nẵng ở Việt Nam. Bên bờ Việt Nam là gì?
explanation_correct.en: The East Sea is part of the Pacific Ocean.
explanation_correct.vi: Biển Đông là một phần của Thái Bình Dương.
explanation_wrong.en: Da Nang is right next to the East Sea.
explanation_wrong.vi: Đà Nẵng nằm ngay bên bờ Biển Đông.
> Câu vận dụng ý ba vào một chuyến đi biển quen thuộc. Câu hỏi nói "Where", không nói "Which sea", để chữ "Sea" trong câu không lộ đáp án.
> [CẦN KIỂM] Tên "Đà Nẵng" vẫn dùng sau khi sáp nhập tỉnh từ ngày một tháng bảy năm hai nghìn không trăm hai mươi lăm (biên tập nhớ Quảng Nam nhập vào thành phố Đà Nẵng). Hình có cảnh trẻ bơi: có người lớn đi cùng, bơi chỗ nông.

#### option q5_arctic
correct: false
feedback.en: The Arctic Ocean is very cold and far north.
feedback.vi: Bắc Băng Dương rất lạnh, ở tận phía bắc xa.
label.en: Arctic Ocean
label.vi: Bắc Băng Dương
image.brief: Dùng lại hình `tray_arctic`. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi

#### option q5_atlantic
correct: false
feedback.en: The Atlantic Ocean is on the other side of Earth.
feedback.vi: Đại Tây Dương ở phía bên kia Trái Đất.
label.en: Atlantic Ocean
label.vi: Đại Tây Dương
image.brief: Dùng lại hình `tray_atlantic`. Từ khoá tìm ảnh (EN): Atlantic Ocean waves
image.alt.en: Big waves on a wide ocean
image.alt.vi: Sóng lớn giữa đại dương rộng

#### option q5_east_sea
correct: true
label.en: East Sea
label.vi: Biển Đông
image.brief: [ảnh] Mặt biển khơi xanh ngoài khơi miền Trung Việt Nam, không thấy bờ, có thể có một con tàu ở xa; cùng kiểu với ảnh của món `tray_atlantic` (biển khơi, không thấy bờ), không giống ảnh bãi biển của câu hỏi; không có bãi cát, thuyền mang cờ hay số hiệu, người hay chữ. Ưu tiên ảnh CC0 hoặc phạm vi công cộng, và tên ảnh ở trang nguồn chỉ dùng tên "Biển Đông" hoặc tên trung tính. Từ khoá tìm ảnh (EN): sea open horizon Vietnam
image.alt.en: The East Sea
image.alt.vi: Biển Đông
> SK-033 (9/11): ảnh Biển Đông cố ý cùng kiểu với ảnh Đại Tây Dương, để bé không chọn được bằng cách khớp ảnh với bãi biển của câu hỏi; bé phải nhớ Việt Nam ở bên bờ Biển Đông. Bắc Băng Dương có băng và gấu trắng: loại được bằng suy luận "Đà Nẵng ấm", vẫn hợp lệ.
> [CẦN KIỂM] Tên ảnh ở trang nguồn hiện ở màn "Nguồn hình" của app. Người chọn ảnh kiểm tên gọi vùng biển trước khi chọn; ảnh CC BY bắt buộc ghi tên ảnh thì chỉ nhận khi tên ảnh không dùng tên gọi khác cho Biển Đông.

### q6
id: ca5cbe59-83d8-4ec3-b96e-f1970789e99d
format: true_false
version: 1
dok: 3
misconception: continent_is_country
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
image.brief: Dùng lại hình `tray_asia`. Từ khoá tìm ảnh (EN): rice terraces Vietnam mountains
image.alt.en: Rice terraces on the mountains
image.alt.vi: Ruộng bậc thang trên núi
> Hình câu hỏi minh hoạ điều Na nói tới (châu Á), không phải bằng chứng để trả lời. Không dùng hai lá cờ Việt Nam và Nhật Bản ở đây: hai lá cờ khác nhau chính là bằng chứng phản bác, mà gợi ý chỉ đưa ra sau khi bé chọn sai.
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
> Rà chữ 9/11 (tester N1): nhãn trung tính chung cho cả năm câu sáu, xem ghi chú ở câu q6 bài một.
statement.en: Asia is one country, with Japan and Vietnam in it.
statement.vi: Châu Á là một quốc gia, có Nhật Bản và Việt Nam.
> SK-044 (14/11, A2): lời Na gộp thành một câu (mười từ, mười hai tiếng); câu vẫn chứa bằng chứng phản bác (hai quốc gia cùng ở châu Á).
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
hint.en: Are Japan and Vietnam the same country?
hint.vi: Nhật Bản và Việt Nam có phải cùng một quốc gia không?
explanation_correct.en: Asia is a continent with many countries, like Laos.
explanation_correct.vi: Châu Á là châu lục có nhiều quốc gia, như Lào.
explanation_wrong.en: Japan and Vietnam are two countries in Asia.
explanation_wrong.vi: Nhật Bản và Việt Nam là hai quốc gia ở châu Á.
feedback_true.en: Japan and Vietnam each have their own flag.
feedback_true.vi: Nhật Bản và Việt Nam có lá cờ riêng.
> DOK 3: bắt lỗi một lập luận. Chính câu của Na chứa bằng chứng phản bác: hai quốc gia khác nhau cùng ở châu Á, nên châu Á không thể là một quốc gia. Gợi ý chỉ vào bằng chứng đó, không nói thẳng đáp án.
> Nhật Bản đã gặp ở phần Chơi (lá cờ, nhóm quốc gia).

## Từ vựng

### continent
id: 39ceec40-c963-4efe-9b89-c4bf68ce2682
tier: core
term.en: continent
term.vi: châu lục
example.en: Asia is the biggest continent.
example.vi: Châu Á là châu lục rộng lớn nhất.
image.brief: Dùng lại hình `explore_continents`. Từ khoá tìm ảnh (EN): Earth from space Africa Europe
image.alt.en: Big areas of land on Earth
image.alt.vi: Những vùng đất rộng lớn trên Trái Đất

### ocean
id: 35e80e27-57cd-4d1c-9d48-bb9ba89e3285
tier: core
term.en: ocean
term.vi: đại dương
example.en: Whales swim in the ocean.
example.vi: Cá voi bơi ở đại dương.
image.brief: Dùng lại hình `tray_pacific`. Từ khoá tìm ảnh (EN): humpback whale breaching ocean
image.alt.en: A whale in a wide blue ocean
image.alt.vi: Cá voi giữa đại dương xanh

### asia
id: 8471ab74-5b72-44b8-9837-d6aa970afb62
tier: core
term.en: Asia
term.vi: châu Á
example.en: Vietnam and Japan are in Asia.
example.vi: Việt Nam và Nhật Bản đều ở châu Á.
image.brief: Dùng lại hình `tray_asia`. Từ khoá tìm ảnh (EN): rice terraces Vietnam mountains
image.alt.en: Rice terraces on the mountains
image.alt.vi: Ruộng bậc thang trên núi
> Không dùng bản đồ cho từ này, để bài chỉ có một hình bản đồ cần duyệt pháp lý (`explore_vietnam`).

### pacific_ocean
id: 721a6bb7-9786-499b-a937-4349bba984dd
tier: core
term.en: Pacific Ocean
term.vi: Thái Bình Dương
example.en: The East Sea is part of the Pacific Ocean.
example.vi: Biển Đông là một phần của Thái Bình Dương.
> [CẦN KIỂM] Cách nói "Biển Đông là một phần của Thái Bình Dương" (biên tập nhớ sách Địa lí viết "Biển Đông thuộc Thái Bình Dương"). Đây là chỗ duy nhất của bài nối Biển Đông với Thái Bình Dương; Quiz không hỏi ý này.
image.brief: Dùng lại hình `tray_pacific`. Từ khoá tìm ảnh (EN): humpback whale breaching ocean
image.alt.en: A whale in a wide blue ocean
image.alt.vi: Cá voi giữa đại dương xanh

### antarctica
id: b9675247-775b-478d-b077-4fb9d7fd90da
tier: extra
term.en: Antarctica
term.vi: châu Nam Cực
example.en: Antarctica is very cold and covered in ice.
example.vi: Châu Nam Cực rất lạnh và phủ đầy băng.
image.brief: Dùng lại hình `tray_antarctica`. Từ khoá tìm ảnh (EN): penguins Antarctica rocks glacier
image.alt.en: Penguins on icy land
image.alt.vi: Chim cánh cụt trên vùng đất phủ băng

### east_sea
id: 721ba48c-92c2-4aaa-aa03-6e4b072d6063
tier: extra
term.en: East Sea
term.vi: Biển Đông
example.en: Vietnam is next to the East Sea.
example.vi: Việt Nam nằm bên bờ Biển Đông.
image.brief: Dùng lại hình `q5`. Từ khoá tìm ảnh (EN): beach Da Nang Vietnam
image.alt.en: A beach by the East Sea
image.alt.vi: Bãi biển bên bờ Biển Đông
> Hình là cảnh bãi biển, không phải bản đồ. Alt ở đây nói tên biển; alt của câu q5 thì không, để khỏi lộ đáp án.

### salty
id: 4d281d36-4abc-4bb8-972f-44b493afe700
tier: extra
term.en: salty
term.vi: mặn
example.en: Ocean water is salty.
example.vi: Nước đại dương có vị mặn.
image.brief: [ảnh] Cánh đồng muối ven biển Việt Nam: các ô ruộng muối phẳng, những đống muối trắng, biển ở phía xa nếu được; người làm muối (nếu có) ở xa, không nhận ra mặt; không có chữ. Từ khoá tìm ảnh (EN): salt field Vietnam salt pans
> SK-033 (9/11): trước dùng lại cánh đồng muối của câu w2 bài một. Câu w2 nay dùng ảnh biển (ảnh muối lộ gợi ý), nên ảnh cánh đồng muối chuyển về đây làm ảnh gốc.
image.alt.en: Salt fields by the sea
image.alt.vi: Cánh đồng muối ven biển

### country
id: 3fe485d7-f1ab-4f04-941f-608c8360cd1f
tier: extra
term.en: country
term.vi: quốc gia
example.en: Vietnam is a country in Asia.
example.vi: Việt Nam là một quốc gia ở châu Á.
image.brief: Dùng lại hình `tray_vietnam`. Từ khoá tìm ảnh (EN): flag Vietnam flagpole sky
image.alt.en: The flag of Vietnam
image.alt.vi: Lá cờ Việt Nam
> Từ mới thêm so với kế hoạch ở `_topic.md`, để phần Chơi và câu q6 có tên gọi rõ cho "quốc gia" (xem ghi chú ở Ý chính).

## Thưởng

### thai_binh_duong
id: 10a09f9f-6d2a-4264-a9e5-c3a01b3c2cee
set: earth
rarity: common
name.en: Pacific Ocean
name.vi: Thái Bình Dương
tag.en: Biggest ocean
tag.vi: Đại dương rộng nhất
fact.en: The Pacific is the biggest ocean. All the land on Earth could fit inside it.
fact.vi: Thái Bình Dương là đại dương rộng nhất. Nếu gom hết phần đất trên Trái Đất lại, Thái Bình Dương vẫn chứa vừa.
> [CẦN KIỂM] Biên tập nhớ diện tích Thái Bình Dương khoảng một trăm sáu mươi lăm triệu ki-lô-mét vuông, tổng diện tích đất trên Trái Đất khoảng một trăm bốn mươi chín triệu ki-lô-mét vuông. Câu thứ hai quay lại misconception `earth_mostly_land` của bài một, như kế hoạch ở `_topic.md` (không tính là câu misconception của Quiz).
> Phương án khác cho câu thứ hai, nếu Duy thích: "In English and Vietnamese, its name means peaceful." · "Cả tên tiếng Anh và tên tiếng Việt của đại dương này đều có nghĩa là yên bình." [CẦN KIỂM] nguồn gốc tên (Magellan đặt tên "biển yên bình"; "Thái Bình" là yên bình).
image.brief: [ảnh] Trái Đất chụp từ vũ trụ, ảnh của NASA, quay về phía giữa Thái Bình Dương, lệch về phía châu Mỹ (tâm ảnh ở khoảng kinh tuyến một trăm bốn mươi độ Tây): gần như cả mặt cầu là nước xanh dương, mép phải thấy bờ tây châu Mỹ; không thấy vùng Đông Nam Á, Philippines hay Biển Đông ở mép trái; không có chữ, đường biên giới, logo của cơ quan. Phương án thay: ảnh quả địa cầu cùng hướng. Từ khoá tìm ảnh (EN): Earth from space Pacific Ocean
image.alt.en: Earth with the huge Pacific Ocean
image.alt.vi: Trái Đất với Thái Bình Dương rộng mênh mông
> SK-033 (9/11): đổi quả địa cầu sang ảnh Trái Đất thật; alt đổi theo. Ảnh thấy vùng Đông Nam Á thì loại, không cắt bớt cho vừa.

## Ghi chú cho hoạ sĩ

> SK-033 (9/11): hình của bài là ảnh chụp thật (hoặc hình vẽ gần thực tế) từ nguồn miễn phí cho phép dùng thương mại; không lấy hình AI từ nguồn ngoài, không dùng hình hoạt hình, giấy cắt. Duy chốt 10/11: đồ vật không có ảnh miễn phí hợp lệ thì designer vẽ minh hoạ gần thực tế (brief `[hình vẽ]`), cảnh khó thì ghép từ ảnh có sẵn (`[sơ đồ ghép ảnh]`); hình không có chữ. Bài này chưa có hình tự vẽ hay hình ghép. Mục này nay dành cho người chọn ảnh và designer (khung ảnh trên mảnh giấy, style E). Luật chung: TEMPLATE mục A, đoạn **Hình**.

- Bối cảnh Việt Nam ở ô Việt Nam, câu q5 (bãi biển Đà Nẵng), ảnh châu Á (ruộng bậc thang), đảo Cát Bà (q4), Biển Đông (q5), cánh đồng muối (từ `salty`).
- **Bản đồ** (Duy chốt 9/11):
  - Chỉ một hình là bản đồ có vùng Đông Nam Á: `explore_vietnam`. Dùng bản đồ chính thức của Việt Nam (nguồn nhà nước), không dùng bản đồ nước ngoài; đủ quần đảo Hoàng Sa và quần đảo Trường Sa, khung cắt thấy trọn cả hai. Gửi duyệt pháp lý trước khi phát hành, và chốt giấy phép (ghi chú dưới ô `explore_vietnam`) [CẦN KIỂM].
  - Ba ảnh Trái Đất (`explore_continents`, `explore_more_continents`, thẻ Thái Bình Dương) cố ý quay để không thấy vùng Đông Nam Á, kể cả ở mép. Ảnh thấy vùng này thì loại, không cắt bớt cho vừa.
  - Mọi hình khác không phải bản đồ, không dùng ảnh vệ tinh vùng Đông Nam Á.
  - Ảnh có Biển Đông (q5, từ `east_sea`) hay đảo của Việt Nam: tên ảnh ở trang nguồn hiện ở màn "Nguồn hình", nên người chọn ảnh kiểm tên gọi trước khi chọn; ưu tiên ảnh CC0 hoặc phạm vi công cộng.
- **Ba loại ảnh ở kệ Chơi phải nhìn là phân biệt được:**
  - châu lục là phong cảnh rộng, chụp xa (châu Phi, châu Á, châu Nam Cực);
  - đại dương là cảnh nước tới chân trời (Thái Bình Dương, Đại Tây Dương, Bắc Băng Dương);
  - quốc gia là lá cờ thật bay trên cột cờ (Việt Nam, Nhật Bản), hai ảnh cùng kiểu, cờ đúng màu.
- **Châu Nam Cực khác Bắc Băng Dương:** châu Nam Cực là đất có núi, băng phủ, chim cánh cụt Adélie hoặc gentoo đứng trên bờ đá và tuyết (không dùng chim cánh cụt hoàng đế đứng trên băng biển); Bắc Băng Dương là tảng băng trôi giữa nước, gấu trắng đứng trên băng. Không có ảnh nào có cả chim cánh cụt và gấu trắng. Ô `explore_more_oceans` là ảnh băng trôi, không có chim cánh cụt, không có gấu trắng.
- **Ảnh châu Phi:** đồng cỏ là một trong nhiều cảnh của châu Phi. Nếu designer thấy cảnh này rập khuôn thì đề xuất cảnh khác, miễn nhìn là thấy một vùng đất rất rộng.
- **Ảnh cần tìm (hai mươi hai, trong đó một bản đồ):**
  - năm ô ở Học (`explore_continents`, `explore_more_continents`, `explore_oceans`, `explore_more_oceans`, `explore_vietnam`);
  - tám ảnh ở kệ Chơi;
  - bầu trời (w1);
  - núi tuyết châu Á, cối xay gió châu Âu (q2); cửa sổ máy bay, bờ đảo Cát Bà (q4); bãi biển Đà Nẵng, biển khơi Biển Đông (q5);
  - cánh đồng muối (từ `salty`);
  - thẻ Thái Bình Dương.
- **Dùng lại** (bốn mươi chín chỗ có hình):
  - trong bài: câu hỏi q1 dùng `explore_continents`; câu hỏi q2 và lựa chọn q4 "Việt Nam" dùng `tray_vietnam`; câu hỏi q3 dùng `explore_oceans`; câu hỏi q6 và lựa chọn q4 "châu Á" dùng `tray_asia`; thẻ từ q1 "bầu trời" dùng `w1_sky`; lựa chọn q2, q3, q5 dùng ảnh kệ Chơi; từ vựng như cũ (`continent`, `ocean`, `asia`, `pacific_ocean`, `antarctica`, `east_sea`, `country`);
  - từ bài một: quả địa cầu `explore_globe` (câu hỏi w1), ô Phần đất `explore_land` (lựa chọn w1, thẻ từ q1 "đất"), biển `tray_sea` (lựa chọn w1, thẻ từ q1 "nước"), hòn đảo `tray_island` (câu hỏi w2).
- **Châu Á có hai ảnh** có chủ ý: ruộng bậc thang (Chơi, q4, q6, từ `asia`) và núi tuyết Himalaya (chỉ ở q2). Câu q2 hỏi Việt Nam ở châu lục nào; ảnh ruộng bậc thang trông như quê mình sẽ lộ đáp án.
- **Đổi so với bản giấy cắt** (SK-033, 9/11):
  - ba quả địa cầu ở Học và thẻ thưởng thành ảnh Trái Đất thật của NASA; alt đổi theo;
  - ô `explore_more_oceans` còn một cảnh băng trôi (không chia đôi hai vùng cực); alt đổi theo;
  - ảnh châu Á bỏ con voi; alt đổi theo (món `tray_asia`, từ `asia`);
  - câu q5 không có mặt bạn Mai và mẹ, chỉ có người tắm biển ở xa;
  - chim cánh cụt hoàng đế đổi sang Adélie hoặc gentoo (đúng ý "đứng trên đất").
- **Ảnh đã duyệt khác brief** (SK-033, Duy duyệt 10/11; brief và alt trong bài đã sửa theo ảnh, chữ bé đọc và nghe không đổi):
  - `explore_oceans` tạm dùng lại ảnh biển khơi `tray_sea` của bài một (chưa có ảnh thuyền nhỏ giữa đại dương hợp giấy phép); câu hỏi q3 dùng cùng ảnh. Bài này còn hai mươi mốt ảnh mới (một bản đồ); vẫn bốn ảnh dùng lại của bài một, ảnh biển dùng thêm ở hai chỗ.
  - `tray_atlantic` (và lựa chọn `q5_atlantic`): sóng lớn, không có tàu.
  - `tray_africa` (và lựa chọn `q2_africa`, `q3_africa`): chỉ có hươu cao cổ, không có voi.
  - `q2_europe`: cối xay gió ở Hà Lan, không có hoa tulip.
  - Chỗ chưa chắc: cùng một ảnh biển nay vừa là "nước" (lựa chọn w1, thẻ từ q1) vừa là "đại dương" (ô `explore_oceans`, câu hỏi q3). Không câu nào thành sai, nhưng mất ý "một từ đi với một ảnh". Tìm được ảnh thuyền nhỏ giữa đại dương thì trả ô `explore_oceans` về brief cũ.
- **Khó tìm ảnh thật:**
  - `explore_vietnam`: nguồn và giấy phép bản đồ chính thức (Duy chốt).
  - `explore_more_continents`: Bắc Mỹ, Nam Mỹ và châu Nam Cực trong một ảnh. Phương án: ảnh DSCOVR tháng mười hai, tháng một; không có thì bỏ châu Nam Cực khỏi alt.
  - `tray_africa`: hươu cao cổ và voi cùng khung; không có thì chỉ hươu cao cổ, sửa alt ba chỗ.
  - `q5_east_sea`: ảnh biển khơi có nguồn ghi rõ chụp ở Biển Đông, tên ảnh không dùng tên gọi khác.
  - `tray_atlantic`, `tray_pacific`: ảnh mà trang nguồn ghi đúng đại dương.
- **Màu:**
  - Ở Học: hai ô châu lục `nau_dat`, hai ô đại dương `cham`, ô Việt Nam `do_son`. Hai ô cùng hàng cùng màu có chủ ý, để bé thấy chúng cùng một loại.
  - Ở Chơi: châu lục của mình `do_son`, châu lục khác `nau_dat`, đại dương `cham`, quốc gia `vang_hoe`.
- **Màn Học có năm ô** (bài một có ba): kiểm lưới hai cột trên iPhone (ô Việt Nam đứng một mình ở hàng ba) và trên iPad.
- **Màn Chơi:** dòng điều kiện trên nút mờ dài hơn bài một: "Cần đủ Châu lục của mình, Châu lục khác, Đại dương · Chỉ chọn châu lục và đại dương"; bản EN "You need Our continent, Another continent, Ocean · Only continents and oceans". Kiểm nút hai dòng không bị cắt (nhãn nhóm `limit` dài hơn bản trước, rà chữ 9/11).
- Không có cảnh thiên tai, không có người gặp nguy. Ảnh bãi biển ở q5 chỉ có người tắm ở chỗ nông, không có cảnh trẻ em một mình.
- Ý chính chưa có trường hình trong schema v1. Gợi ý nếu sau này có màn tóm tắt:
  1. ảnh Trái Đất thấy nhiều châu lục (không thấy vùng Đông Nam Á);
  2. ảnh Trái Đất phía Thái Bình Dương, nước nối liền nhau;
  3. hình `explore_vietnam` (cùng yêu cầu bản đồ chuẩn).

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, năm nhóm), `word_list` (`new_words`, bốn từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món.
  - Khởi động: `single_choice` (w1), `true_false` (w2); cả hai `recall_from.kind: lesson` trỏ bài một.
  - Quiz: `fill_blank_bank` (q1), `single_choice` ×3 (q2, q4, q5), `multi_choice` (q3), `true_false` (q6, `speaker: na`). Bốn format, đều hiện được ở app hiện tại.
  - Hình (SK-033): mọi câu Khởi động và Quiz có `image` ở câu hỏi; mọi lựa chọn, thẻ từ (`q1`) và món Chơi có `image`. Bốn mươi chín chỗ có hình, hai mươi hai ảnh mới (một bản đồ) và bốn ảnh dùng lại của bài một. Brief "Dùng lại hình `<key>` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`." trỏ ảnh của bài một: file chọn ảnh của bài hai cần lấy được ảnh đã chọn ở bài một.
  - DOK q1 đến q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Câu có `misconception`: q6, key `continent_is_country` (key đã có trong `_topic.md`, đây là câu đầu tiên dùng key này).
  - Quiz không có câu hỏi con số châu lục hay đại dương.
- **Tham chiếu:**
  - `recall_from.lesson: be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` → `lesson_id` của bài một (bài một đã có id).
  - `misconception: continent_is_country` → `misconception_id`.
  - `group:` trỏ nhóm của `tray`; `term_keys` trỏ Từ vựng; `answers: q1_land` trỏ `#### bank`.
  - Mọi key duy nhất trong bài.
- **App không xáo lựa chọn**, nên vị trí đáp án đúng đặt tay:
  - w1: thứ ba;
  - q1: từ thứ ba trong ngân hàng; q2: thứ nhất; q3: thứ hai và thứ tư; q4: thứ hai; q5: thứ ba.
  - Kệ Chơi xếp xen ba loại: Việt Nam, Đại Tây Dương, châu Phi, châu Á (hàng một); Thái Bình Dương, Nhật Bản, châu Nam Cực, Bắc Băng Dương (hàng hai).
- **Màn Chơi, ví dụ để kiểm:**
  - chạm châu Á, châu Phi, Thái Bình Dương → đạt (`balanced`);
  - chạm Việt Nam → `has_limited`;
  - chạm Đại Tây Dương, Thái Bình Dương, Bắc Băng Dương (đủ ba chỗ) → `missing.tray_our_continent`;
  - rồi chạm châu Á → `full`;
  - bỏ Bắc Băng Dương, đặt châu Á → `missing.tray_continents`;
  - bỏ Đại Tây Dương, đặt châu Nam Cực → đạt.
- **Hình giữ chỗ trên kệ:** đã xử lý (ios-dev 9/11, SK-031 Quyết định đã ghi). Kệ dùng chung một mảnh giấy lõm trung tính, không tô màu nhóm, và xáo thứ tự mỗi lượt học, nên châu Á (nhóm đỏ son) và hai lá cờ (nhóm vàng hoè) không còn lộ qua màu hay vị trí.
- **Năm ô ở màn Học:** chú thích trong `LearnStep.swift` nói "up to 4/4", và bài một có ba ô. Nhờ ios-dev xem lưới năm ô trên iPhone và iPad, và bộ đếm "5/5".
- **Bộ thẻ `earth`:** app đã có khoá `collectible.set.earth` ("Earth cards · Thẻ Trái Đất"). Chữ giao diện màn Chơi đã là chữ chung ("Done! Take the quiz · Xong rồi! Làm quiz").
- **Ôn bài này ở bài sau:** bài ba câu w1 ôn ý chính hai ("đại dương là những vùng nước mặn rất rộng lớn"). Bài năm câu w3 ôn misconception `continent_is_country` ("Asia is one country.", đáp án Sai; thêm khi sửa theo rà chữ 9/11). Bài bốn chưa ôn bài này.
- **`est_minutes: 9`** (bài một là 8): màn Học có năm ô và mười hai tên mới.
- **Số từ EN trên một màn** (đếm như bài một: trạng thái nhiều chữ nhất, món ví dụ ở Học hiện bằng tiếng Việt):
  - Học khoảng ba mươi chín từ: mục tiêu 7, hướng dẫn 3, năm nhãn 7, câu dài nhất 15 (ô `explore_more_oceans`, hai câu), ô Từ mới 7. Vượt ba mươi vì năm ô, và từ rà chữ 9/11 câu của ô `explore_more_oceans` dài thêm năm từ (bản cũ mười từ). Nếu PM muốn giữ dưới ba mươi thì bỏ câu "Books in English say there are five oceans." và để bé tự đếm, hoặc chuyển `pacific_ocean` sang `extra`.
  - Khởi động và Quiz: mọi màn từ mười sáu tới hai mươi chín từ. q6 nhiều nhất, khoảng hai mươi chín (câu hỏi 3, lệnh 4, lời Na 12, hai nhãn 2, giải thích sai 8 hoặc giải thích đúng 8); q3 và q5 khoảng hai mươi tám.
  - Chơi khoảng bốn mươi chín từ: tám tên 11, ba chip 5, dòng điều kiện khoảng 11, lời nhắn dài nhất 16 (`has_limited`), lệnh 6. Vượt ba mươi như màn Chơi của bài một; vẫn chờ PM chốt cách đếm màn Chơi.
- **Từ EN có thể ngoài Starters/Movers** (theo trí nhớ của biên tập, cần đối chiếu danh sách Cambridge): continent, ocean, Oceania, Antarctica, Arctic, Atlantic, Pacific, Southern, Indian Ocean, North America, South America, East Sea, salty, country, count, differently, area, whale (đã có hình), polar bear, penguin (chỉ ở alt), Japan, Cat Ba, Da Nang, inside, fit, challenge, spot, mistake. Phần lớn là tên riêng có hình hoặc là từ mới của bài.
- **Nghe thử giọng đọc:** EN "Oceania", "Antarctica" và "Arctic" (hai từ gần nhau), "Cat Ba", "Da Nang"; VI "Bắc Băng Dương", "Nam Đại Dương", "châu Đại Dương"; câu VI "Theo sách tiếng Anh, có năm đại dương" (chữ "năm" là số năm, không phải "năm" là năm tháng).
- **Chính tả Anh** như bài một; bài này không có từ khác nhau giữa Anh và Mỹ.
- **Không dùng dấu "—"** và không có ký hiệu trong chuỗi tiếng Việt.
- **Asset:** không có audio và `asset` trong markdown; máy điền khi chạy `tts` và `build` (ảnh: từ file chọn ảnh, SK-033 "Hợp đồng ảnh"). Na là asset chung của app.
