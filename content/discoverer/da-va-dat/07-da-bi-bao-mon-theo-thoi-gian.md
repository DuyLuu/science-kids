---
id: aa984cc1-6e8a-4450-92ac-be22dc208043
topic: da-va-dat
slug: da-bi-bao-mon-theo-thoi-gian
order: 7
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Weathering and erosion of rocks
vi: Đá bị bào mòn theo thời gian
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số bảy). Trong bài chỉ dùng hai chữ "phong hoá", "xói mòn" (bảng Tên gọi).

## Mục tiêu
en: I can tell weathering from erosion.
vi: Em phân biệt được phong hoá với xói mòn.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn B), chưa duyệt.** Ticket SK-039 bước 2, ngày 11/11/2026. Chưa chạy `validate`, chưa chạy `ids`.
> Bài này trả lời câu "Em nghĩ sao?" của bài một ("Đá giữ nguyên mãi mãi"): ô Học "Natural forces" nói đá thay đổi rất chậm (`rocks_never_change`, không gắn key). Sửa `weathering_is_erosion` ở ý chính hai và ba, ô "Weathering", ô "Erosion", câu q3, q4 và câu q6 (gắn key, Na nói đúng).
> Không nói lũ, nhà sập, người; bờ sông lở chụp từ xa (mục An toàn và "Không lặp với chủ đề khác" ở `_topic.md`).

## Ý chính
1.en: Rain, wind, heat and plant roots change rocks slowly.
1.vi: Mưa, gió, nắng nóng và rễ cây làm đá thay đổi rất chậm.
2.en: Weathering breaks rock into smaller pieces.
2.vi: Phong hoá làm đá vỡ ra thành những mảnh nhỏ hơn.
3.en: Erosion carries the pieces away to new places.
3.vi: Xói mòn mang những mảnh vụn đó đi tới nơi khác.

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md`:
> - w1 ôn bài sáu (một ngày): người ta nghiền loại đá nào để làm xi măng.
> - w2 ôn bài ba (bốn ngày): "A fingernail can scratch every rock." (Sai). Câu nối sang ý chính một: có đá cứng, có đá mềm, nhưng đá nào rồi cũng thay đổi theo thời gian.
> Hình dùng lại từ bài một tới năm (người soạn A) chưa chép từ khoá (bài gốc chưa có khi soạn); topic editor chép khi rà chéo.

### w1
id: 859174cc-44ab-42d0-9436-596da421b92b
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/da-dung-lam-gi
prompt.en: Which rock do people crush to make cement?
prompt.vi: Người ta nghiền loại đá nào để làm xi măng?
image.brief: Dùng lại hình `q2` ở bài `da-va-dat/da-dung-lam-gi`.
image.alt.en: A pile of grey cement powder
image.alt.vi: Một đống bột xi măng xám
hint.en: Remember what rocks are used for in lesson six.
hint.vi: Em nhớ lại bài sáu, đá dùng làm gì nhé.
explanation_correct.en: Yes! Crushed limestone is used to make cement.
explanation_correct.vi: Đúng rồi! Đá vôi nghiền nhỏ được dùng để làm xi măng.
explanation_wrong.en: The answer is limestone. It is crushed to make cement.
explanation_wrong.vi: Đáp án là đá vôi. Người ta nghiền đá vôi để làm xi măng.
> Hình câu hỏi là bột xi măng (vật được hỏi), không phải đá vôi. Gợi ý không gọi tên ô "Limestone" · "Đá vôi" của bài sáu, vì tên ô trùng chữ nhãn đáp án.
> Ba lựa chọn đều là ảnh đá; ảnh đá ong (`laterite`) là cận cảnh mặt tường đá, đã dặn cắt sát để đứng được cạnh hai ảnh mẫu đá (Ghi chú cho hoạ sĩ bài sáu).

#### option w1_limestone
correct: true
label.en: limestone
label.vi: đá vôi
image.brief: Dùng lại hình `tray_limestone` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): limestone rock sample
image.alt.en: A pale grey rock
image.alt.vi: Hòn đá màu xám nhạt

#### option w1_laterite
correct: false
label.en: laterite
label.vi: đá ong
image.brief: Dùng lại hình `laterite` ở bài `da-va-dat/da-dung-lam-gi`. Từ khoá tìm ảnh (EN): laterite wall blocks close up
image.alt.en: Red-brown stone with many holes
image.alt.vi: Mặt đá nâu đỏ có nhiều lỗ
> `alt` sửa so với gốc (gốc nói "laterite"), để ba `alt` cùng chỉ tả màu và hình dáng. Rà chữ tester 11/11 (n9): ảnh là cận cảnh mặt tường đá, nên `alt` nói "mặt đá", không nói "hòn đá"; khớp `alt` của cùng ảnh ở bài sáu câu q5.

#### option w1_granite
correct: false
label.en: granite
label.vi: đá hoa cương
image.brief: Dùng lại hình `granite` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám

### w2
id: 04c14838-01a2-472b-81ef-b6f8c4fd5844
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/da-nao-cung-hon
prompt.en: A fingernail can scratch every rock.
prompt.vi: Móng tay cào xước được mọi loại đá.
image.brief: Dùng lại hình `explore_scratch` ở bài `da-va-dat/da-nao-cung-hon`.
image.alt.en: A fingernail scratching a white rock
image.alt.vi: Móng tay cào lên hòn đá trắng
answer: false
hint.en: Remember the three groups in lesson three's game.
hint.vi: Em nhớ lại ba nhóm đá ở trò chơi bài ba nhé.
explanation_correct.en: Some rocks, like granite, are too hard to scratch.
explanation_correct.vi: Có loại đá, như đá hoa cương, quá cứng nên móng tay không cào xước được.
explanation_wrong.en: This is false. Some rocks are too hard to scratch.
explanation_wrong.vi: Câu này sai. Có loại đá quá cứng, móng tay không cào xước được.
> Đúng chữ EN ở bảng Đúng/Sai (bài bảy w2, Sai). Giải thích khi đúng không mở đầu bằng "Yes!".
> Hình câu hỏi là tình huống thử cào (bàn tay cào đá phấn), không phải bằng chứng của đáp án Sai. `explore_scratch` không có ở cột "Dùng lại ở" của bảng Hình dùng chung; key và nội dung theo bảng (bài ba, "bàn tay trẻ cào móng lên đá phấn"). Rà chữ tester 11/11 (N3, N4): `alt` chép đúng gốc; gốc là hình vẽ (bộ "Bàn tay thử đá"), brief gốc không có từ khoá nên ở đây cũng không có.

## Học

> Bốn ô, từ cụ thể tới trừu tượng: các lực tự nhiên bé thấy hằng ngày (ý chính một), phong hoá (ý chính hai), xói mòn (ý chính ba), rồi việc con người làm để xói mòn chậm lại.
> Ô một là chỗ trả lời câu "Em nghĩ sao?" của bài một: đá có thay đổi, chỉ là rất chậm. Bài mười lăm hỏi lại câu đó ở w3.
> Ô hai và ô ba đặt cạnh nhau, câu cùng một khuôn ("… breaks …" và "… carries … away"), để bé thấy chỗ khác nhau là "vỡ ra tại chỗ" và "bị mang đi".

### explore
id: 63c0403c-3479-427b-8d4e-1316471f1b2b
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_forces
label.en: Natural forces
label.vi: Lực tự nhiên
color: vang_hoe
sentence.en: Rain, wind, heat and roots change rocks very slowly.
sentence.vi: Mưa, gió, nắng nóng và rễ cây làm đá thay đổi rất chậm.
image.brief: [hình vẽ] Mưa rơi trên mấy tảng đá xám ven suối, thấy rõ hạt mưa và mặt đá ướt, vẽ gần vừa; không có người, không có chữ. Câu q1 dùng lại hình này (cạnh hai hình vẽ gầu máy xúc, tay đục đá của kệ).
image.alt.en: Rain falling on rocks
image.alt.vi: Mưa rơi trên những tảng đá
examples.1.en: rain
examples.1.vi: mưa
examples.2.en: wind
examples.2.vi: gió
examples.3.en: hot days, cold nights
examples.3.vi: ngày nóng, đêm lạnh
examples.4.en: plant roots
examples.4.vi: rễ cây
> [CẦN KIỂM] Nắng nóng ban ngày, đêm lạnh làm đá nở ra, co lại và nứt dần (`_topic.md` mục bài bảy).

#### group explore_weathering
label.en: Weathering
label.vi: Phong hoá
color: gi_dong
sentence.en: Weathering breaks rock into smaller pieces, right where it is.
sentence.vi: Phong hoá làm đá vỡ thành những mảnh nhỏ hơn, ngay tại chỗ.
image.brief: [ảnh] Rễ một cây cổ thụ trùm lên chân bức tường đá cũ, rễ len vào khe làm đá nứt, vài mảng đá bong ra, chụp gần vừa; không có người, không có tượng thờ, không có bát hương, không có chữ hay biển giới thiệu. Ảnh designer chọn 11/11 không phải cảnh Việt Nam (không có ảnh Việt Nam hợp lệ). Hình gốc của bảng Hình dùng chung; câu q4 và từ `weathering` dùng lại ảnh này (món Chơi `tray_banyan` nay là hình vẽ riêng). Từ khoá tìm ảnh (EN): banyan tree roots old stone wall
image.alt.en: Tree roots over an old stone wall
image.alt.vi: Rễ cây trùm lên bức tường đá cũ
examples.1.en: roots push into cracks
examples.1.vi: rễ cây len vào khe đá
examples.2.en: rain wears limestone away
examples.2.vi: nước mưa làm đá vôi mòn dần
examples.3.en: heat and cold crack rock
examples.3.vi: nóng lạnh làm đá nứt
examples.4.en: big rocks become small bits
examples.4.vi: đá to vỡ thành mảnh vụn
> [CẦN KIỂM] Nước mưa làm đá vôi mòn dần (`_topic.md`); chữ cho trẻ nói "mòn dần", không dùng chữ "hoà tan" (để dành *Tính chất và biến đổi vật liệu*).
> Câu ô này là chỗ dạy "phong hoá làm đá vỡ thành mảnh nhỏ", ý được ôn ở bài mười một w2 ("Weathering breaks rock into small pieces.").

#### group explore_erosion
label.en: Erosion
label.vi: Xói mòn
color: cham
sentence.en: Erosion carries the broken bits away to new places.
sentence.vi: Xói mòn mang những mảnh vụn đi tới nơi khác.
image.brief: [ảnh] Một khúc sông, bờ đất phía xa bị lở thành vách, chụp từ bờ bên kia (ảnh designer chọn 11/11: sông Cowpasture ở Mỹ, nước xanh đục, không phải màu nâu phù sa); không có nhà, không có người, không có thuyền chở người, không có xe, không có cảnh lũ ngập. Hình gốc của bảng Hình dùng chung (bài tám w1, bài mười hai, bài mười lăm dùng lại); câu q4 và từ `erosion` dùng lại ảnh này. Từ khoá tìm ảnh (EN): muddy river eroded riverbank
image.alt.en: A river with a worn bank
image.alt.vi: Dòng sông có bờ bị lở
> `alt` bỏ chữ "đục" · "muddy" cho khớp ảnh (bảng designer 11/11). Mọi chỗ dùng lại chép `alt` mới; bài mười hai, mười lăm (người soạn C) cũng phải chép.
examples.1.en: rivers carry sand and mud
examples.1.vi: sông cuốn cát và bùn đi
examples.2.en: wind blows sand away
examples.2.vi: gió thổi cát bay đi
examples.3.en: waves wash the shore
examples.3.vi: sóng xô vào bờ
examples.4.en: a riverbank falls in
examples.4.vi: bờ sông bị lở
> [CẦN KIỂM] Cách chia giản lược như ghi chú của `weathering_is_erosion`: xói mòn là đất đá bị nước, gió, sóng mang đi. Bờ sông lở chỉ nói nhẹ, không nhắc lũ (để *Thời tiết*).

#### group explore_slow
label.en: Slowing it down
label.vi: Làm chậm lại
color: do_son
sentence.en: Plants and stone banks help slow erosion down.
sentence.vi: Cây cỏ và kè đá giúp xói mòn chậm lại.
image.brief: [ảnh] Một sườn đồi phủ kín cây xanh và cỏ, rễ cây giữ đất, chụp xa; không có đất trống bị lở, không có người, không có nhà, không có chữ. Từ khoá tìm ảnh (EN): trees planted on hillside green slope
image.alt.en: Trees growing on a hillside
image.alt.vi: Cây xanh mọc trên sườn đồi
examples.1.en: plant trees on hills
examples.1.vi: trồng cây trên đồi
examples.2.en: keep grass on the ground
examples.2.vi: giữ cỏ phủ mặt đất
examples.3.en: build stone banks by rivers
examples.3.vi: xây kè đá dọc bờ sông
examples.4.en: geologists watch the land
examples.4.vi: nhà địa chất theo dõi đất đá
> `geologist` là từ của bài bốn, được dùng từ bài bốn trở đi (bảng Từ vựng). [CẦN KIỂM] Cây cỏ giữ đất, kè đá che bờ sông giúp xói mòn chậm lại.

### new_words
id: c0ae3938-8f94-495a-abf2-f88e1f265b3d
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: weathering, erosion, crack

## Chơi

> "Tìm ba lực tự nhiên đang làm đá thay đổi". Bé chọn một cảnh nước, một cảnh gió, một cảnh cây; không chọn cảnh do máy móc hay con người làm. Trò chơi dùng ngay ý chính một.
> - Nước: đá vôi bị mưa bào mòn (phong hoá) và suối chảy qua đá. Gió: đồi cát gió thổi, tảng đá bị gió mài. Cây: rễ đa trùm tường đá, rễ cây làm nứt bậc đá.
> - Hai món bẫy, mỗi món giống một kiểu thay đổi của đá: gầu máy xúc xúc đá (giống "mang đi"), cái đục đá (giống "làm vỡ"). Bỏ "máy khoan đá", "xe chở đá" của kế hoạch vì logo, biển số.
> - Cả kệ là hình vẽ (designer 11/11): Commons không có ảnh hợp lệ gầu máy xúc đang xúc đá và tay đục đá không thấy mặt, nên vẽ cả tám món, kể cả suối và rễ đa (trước đây dùng lại `tray_stream` của *Đất và nước trên Trái Đất* và ảnh `explore_weathering`).
> - Món "rễ cây mọc qua khe đá" của kế hoạch đổi thành "rễ cây làm nứt bậc đá", để khác hẳn hình câu q6 (rễ cây trong khe tảng đá trong rừng).
> - Nhãn món đều là cụm danh từ tả cảnh.

### tray
id: 82d41111-245b-4228-819e-3f8332527fe9
type: build_tray
version: 1
prompt.en: Find three natural forces at work
prompt.vi: Tìm ba lực tự nhiên đang làm đá thay đổi
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick one for water, one for wind, one for plants.
messages.start.vi: Em chọn một cảnh về nước, một cảnh về gió, một cảnh về cây nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Water, wind and plants all change rocks slowly.
messages.balanced.vi: Tuyệt! Nước, gió và cây đều làm đá thay đổi từ từ.
messages.has_limited.en: People and machines did that, not nature.
messages.has_limited.vi: Việc đó do con người và máy móc làm, không phải thiên nhiên.
messages.missing.tray_water_group.en: You still need water at work.
messages.missing.tray_water_group.vi: Em còn thiếu một cảnh nước đang làm đá thay đổi.
messages.missing.tray_wind_group.en: You still need wind at work.
messages.missing.tray_wind_group.vi: Em còn thiếu một cảnh gió đang làm đá thay đổi.
messages.missing.tray_plant_group.en: You still need plants at work.
messages.missing.tray_plant_group.vi: Em còn thiếu một cảnh cây đang làm đá thay đổi.

#### group tray_water_group
label.en: Water
label.vi: Nước
color: cham
role: required

#### group tray_wind_group
label.en: Wind
label.vi: Gió
color: vang_hoe
role: required

#### group tray_plant_group
label.en: Plants
label.vi: Cây
color: gi_dong
role: required

#### group tray_not_natural
label.en: Not natural forces
label.vi: Không phải lực tự nhiên
color: nau_dat
role: limit

#### item tray_rain_limestone
label.en: Rain-worn limestone
label.vi: Đá vôi bị mưa bào mòn
group: tray_water_group
image.brief: [hình vẽ] Mặt một khối đá vôi xám ngoài trời có nhiều rãnh sâu và lỗ chỗ do nước mưa chảy qua nhiều năm, vẽ gần vừa từ trên xuống; không có người, không có chữ. Câu q3 dùng lại hình này.
image.alt.en: Grey rock with deep grooves
image.alt.vi: Mặt đá xám có nhiều rãnh sâu
> [CẦN KIỂM] Rãnh trên mặt đá vôi ngoài trời do nước mưa làm mòn dần (biên tập nhớ).

#### item tray_dunes
label.en: Blowing sand dunes
label.vi: Đồi cát gió thổi
group: tray_wind_group
image.brief: [hình vẽ] Gió thổi cát bay thành làn mỏng trên đỉnh một đồi cát vàng ven biển, vẽ ngang; không có người, không có xe, không có chữ. Câu q3 dùng lại hình này.
image.alt.en: Wind blowing sand over dunes
image.alt.vi: Gió thổi cát bay trên đồi cát

#### item tray_banyan
label.en: Banyan roots on a wall
label.vi: Rễ đa trùm tường đá
group: tray_plant_group
image.brief: [hình vẽ] Rễ to của một cây đa cổ thụ trùm lên bức tường đá cũ, rễ len vào khe làm đá nứt, vẽ gần vừa; không có người, không có tượng thờ, bát hương, không có chữ. Kệ toàn hình vẽ nên vẽ riêng; ảnh `explore_weathering` vẫn là gốc ở ô Học, câu q4, từ `weathering`.
image.alt.en: Tree roots over an old stone wall
image.alt.vi: Rễ cây trùm lên bức tường đá cũ

#### item tray_digger
label.en: Digger bucket
label.vi: Gầu máy xúc
group: tray_not_natural
image.brief: [hình vẽ] Gầu của một chiếc máy xúc đang xúc đầy đá, vẽ gần chỉ thấy gầu, cánh tay máy và đống đá; không có logo, tên hãng, biển số, không có người lái trong khung, không có chữ. Câu q1 dùng lại hình này.
image.alt.en: A digger scooping rocks
image.alt.vi: Gầu máy xúc đang xúc đá

#### item tray_stream
label.en: Stream over rocks
label.vi: Suối chảy qua đá
group: tray_water_group
image.brief: [hình vẽ] Một con suối nhỏ, nước trong chảy qua những hòn đá tròn nhẵn giữa hai bờ cỏ, vẽ chéo; không có thác lớn, không có người, không có chữ. Kệ toàn hình vẽ nên vẽ riêng thay ảnh `tray_stream` của *Đất và nước trên Trái Đất*. Câu q3 dùng lại hình này.
image.alt.en: A small stream over rocks
image.alt.vi: Con suối nhỏ chảy qua đá

#### item tray_wind_rock
label.en: Rock shaped by wind
label.vi: Tảng đá bị gió mài
group: tray_wind_group
image.brief: [hình vẽ] Một tảng đá đứng riêng ở vùng khô, bị gió và cát mài thành hình thù lạ (chân thắt nhỏ, đầu to như cây nấm), vẽ ngang cả tảng; không có người, không có chữ.
image.alt.en: A rock with a strange worn shape
image.alt.vi: Tảng đá có hình thù bị mài mòn lạ
> [CẦN KIỂM] Gió mang cát mài mòn đá thành hình thù lạ ở vùng khô (biên tập nhớ).

#### item tray_roots_steps
label.en: Roots in stone steps
label.vi: Rễ cây làm nứt bậc đá
group: tray_plant_group
image.brief: [hình vẽ] Rễ to của một cây cổ thụ len vào và làm bung, nứt mấy bậc đá cũ, vẽ gần vừa; không có người, không có chữ. Khác ảnh `explore_weathering` (tường đá) và hình câu q6 (tảng đá trong rừng). Câu q3 dùng lại hình này.
image.alt.en: Tree roots lifting stone steps
image.alt.vi: Rễ cây làm bậc đá nứt và bung lên

#### item tray_chisel
label.en: Stone chisel
label.vi: Cái đục đá
group: tray_not_natural
image.brief: [hình vẽ] Đôi tay người thợ cầm cái đục và búa nhỏ đang đục một khối đá, vẽ gần, chỉ thấy tay, dụng cụ và khối đá; không vẽ mặt, không có logo trên dụng cụ, không có chữ. Câu q1 dùng lại hình này.
image.alt.en: Hands chiselling a stone
image.alt.vi: Đôi tay đục một khối đá
> Búa và đục chỉ là việc của thợ đá người lớn, không mời bé dùng (mục An toàn).

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Bốn format. Vị trí đáp án theo bảng `_topic.md` (bài bảy): q1 thứ ba, thẻ đúng q2 thứ ba, q3 thứ nhất và thứ hai, q4 thứ hai, q5 thứ hai.
> Mỗi hình chỉ một vai trong bài: `explore_weathering`, `explore_erosion` chỉ có ở câu q4; câu q3 dùng bốn món của kệ Chơi.

### q1
id: c6fdce29-2be8-4617-b1b0-0eea1eb785c4
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a natural force?
prompt.vi: Thứ nào là một lực tự nhiên?
image.brief: [ảnh] Một đống đá vụn sắc cạnh nằm dưới chân một vách đá, chụp gần vừa; không có người, không có máy móc, không có chữ. Từ khoá tìm ảnh (EN): rock fragments scree base of cliff
image.alt.en: Broken rocks below a cliff
image.alt.vi: Đá vụn dưới chân vách đá
hint.en: Remember the Natural forces picture in the lesson.
hint.vi: Em nhớ lại ô Lực tự nhiên trong bài học nhé.
explanation_correct.en: Yes! Rain is a natural force. It changes rocks.
explanation_correct.vi: Đúng rồi! Mưa là một lực tự nhiên. Mưa làm đá thay đổi.
explanation_wrong.en: The answer is rain. People make diggers and chisels.
explanation_wrong.vi: Đáp án là mưa. Máy xúc và cái đục do con người làm ra.
> DOK 1: nhớ lại ô một. Hai lựa chọn sai là hai món bẫy của kệ Chơi, cũng làm đá thay đổi nhưng do con người. Ba hình đều là hình vẽ bé đã gặp hôm nay (ô Học và kệ Chơi). Gợi ý gọi tên ô "Natural forces", trùng chữ câu hỏi, không trùng chữ nhãn đáp án.

#### option q1_digger
correct: false
label.en: digger
label.vi: máy xúc
image.brief: Dùng lại hình `tray_digger`.
image.alt.en: A digger scooping rocks
image.alt.vi: Gầu máy xúc đang xúc đá

#### option q1_chisel
correct: false
label.en: chisel
label.vi: cái đục
image.brief: Dùng lại hình `tray_chisel`.
image.alt.en: Hands chiselling a stone
image.alt.vi: Đôi tay đục một khối đá

#### option q1_rain
correct: true
label.en: rain
label.vi: mưa
image.brief: Dùng lại hình `explore_forces`.
image.alt.en: Rain falling on rocks
image.alt.vi: Mưa rơi trên những tảng đá

### q2
id: 5aeee860-7188-4eee-abcc-ebf982fc99f6
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: [ảnh] Một cây đa cổ thụ ở đầu làng, tán rộng, chụp xa thấy cả thân và tán; chân cây là mặt đất và cỏ, không thấy rễ trùm lên đá hay tường; không có người, không có miếu, bát hương, không có chữ. Từ khoá tìm ảnh (EN): banyan tree village Vietnam
image.alt.en: A big banyan tree
image.alt.vi: Cây đa to
sentence.en: Over time, roots make a {1} in the rock.
sentence.vi: Lâu dần, rễ cây làm hòn đá có một {1}.
answers: q2_crack
hint.en: Remember the Weathering picture in the lesson.
hint.vi: Em nhớ lại ô Phong hoá trong bài học nhé.
explanation_correct.en: Yes! Roots push into rock and make a crack.
explanation_correct.vi: Đúng rồi! Rễ cây len vào đá và làm đá nứt.
explanation_wrong.en: The answer is crack. Roots slowly crack the rock.
explanation_wrong.vi: Đáp án là vết nứt. Rễ cây dần làm đá nứt ra.
> DOK 1: nhớ lại ô Phong hoá và từ `crack`. Câu không có gốc từ "crack". Hai thẻ sai có sức hút: "layer" (đá có từng lớp, bài hai), "fossil" (thứ nằm trong đá, *Khủng long*). Thẻ đúng ở chỗ thứ ba (bảng vị trí). Hình câu hỏi là cây đa, không thấy rễ trên đá.

#### bank q2_layer
label.en: layer
label.vi: lớp
image.brief: Dùng lại hình `tray_sandstone` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): sandstone rock sample layers
image.alt.en: A rock with layers
image.alt.vi: Hòn đá có nhiều lớp
> `alt` sửa so với gốc ("A yellow-brown rock" · "Hòn đá màu vàng nâu"): thẻ này là chữ "layer" · "lớp", `alt` tả đúng nghĩa thẻ, như A đã làm ở thẻ q2 bài ba (rà chữ tester 11/11, N3).

#### bank q2_fossil
label.en: fossil
label.vi: hoá thạch
image.brief: Dùng lại hình `tray_rock_print` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Từ khoá tìm ảnh (EN): dinosaur footprint fossil three toed rock top view
image.alt.en: A dinosaur footprint in rock
image.alt.vi: Dấu chân khủng long in trên đá

#### bank q2_crack
label.en: crack
label.vi: vết nứt
image.brief: Dùng lại hình `crack`. Từ khoá tìm ảnh (EN): long crack in rock close up
image.alt.en: A long crack in a rock
image.alt.vi: Vết nứt dài trên hòn đá

### q3
id: 1ba09575-739d-45af-9775-4213b19beadd
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones are weathering?
prompt.vi: Những cảnh nào là phong hoá?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: [ảnh] Một tảng đá lớn nằm trơ trọi trên sườn đồi cỏ, chụp ngang; không có vết nứt rõ, không có cây mọc trên đá, không có người, không có chữ. Từ khoá tìm ảnh (EN): large boulder on grassy hillside
image.alt.en: A big rock on a hill
image.alt.vi: Tảng đá lớn trên sườn đồi
hint.en: Did the rock break, or was it carried away?
hint.vi: Đá bị vỡ ra tại chỗ, hay bị mang đi nơi khác?
explanation_correct.en: Yes! Roots and rain broke the rock where it is.
explanation_correct.vi: Đúng rồi! Rễ cây và nước mưa làm đá vỡ ngay tại chỗ.
explanation_wrong.en: The answers are the roots and the rain.
explanation_wrong.vi: Đáp án là rễ cây làm nứt bậc đá và mưa bào mòn đá vôi.
> DOK 2: phân loại bốn cảnh của kệ Chơi theo phong hoá và xói mòn (ở kệ Chơi bé xếp theo lực: nước, gió, cây; ở đây xếp theo việc đá vỡ hay bị mang đi). Hai lựa chọn sai là hai cảnh mang cát, sỏi đi (xói mòn): gió thổi cát, suối cuốn sỏi đá. Bốn hình đều là hình vẽ của kệ Chơi. Đáp án ở chỗ thứ nhất và thứ hai (bảng vị trí).
> Bốn nhãn cùng một khuôn (vật đang làm gì), để đáp án không lộ bằng dạng câu (SK-037, tester N5). Nhãn ở đây khác nhãn món ở kệ Chơi: kệ gọi tên cảnh, câu này nói việc đang xảy ra, nên nhãn suối là "stream carrying pebbles" để câu chỉ có một cách hiểu. [CẦN KIỂM] Nước suối vừa mài mòn vừa mang sỏi đá đi; chữ cho trẻ xếp cảnh này vào xói mòn.

#### option q3_roots
correct: true
label.en: roots cracking stone steps
label.vi: rễ cây làm nứt bậc đá
image.brief: Dùng lại hình `tray_roots_steps`.
image.alt.en: Tree roots lifting stone steps
image.alt.vi: Rễ cây làm bậc đá nứt và bung lên

#### option q3_rain
correct: true
label.en: rain wearing down limestone
label.vi: mưa bào mòn đá vôi
image.brief: Dùng lại hình `tray_rain_limestone`.
image.alt.en: Grey rock with deep grooves
image.alt.vi: Mặt đá xám có nhiều rãnh sâu

#### option q3_dunes
correct: false
label.en: wind blowing sand away
label.vi: gió thổi cát bay đi
image.brief: Dùng lại hình `tray_dunes`.
image.alt.en: Wind blowing sand over dunes
image.alt.vi: Gió thổi cát bay trên đồi cát

#### option q3_stream
correct: false
label.en: stream carrying pebbles
label.vi: suối cuốn sỏi đá đi
image.brief: Dùng lại hình `tray_stream`.
image.alt.en: A small stream over rocks
image.alt.vi: Con suối nhỏ chảy qua đá

### q4
id: 20b231a3-0d56-4ca4-973b-09b5304f95c1
format: single_choice
version: 1
dok: 2
prompt.en: New land formed where a river meets the sea. What made it?
prompt.vi: Ở cửa sông có một bãi đất mới. Điều gì tạo ra bãi đất đó?
image.brief: [ảnh] Cửa sông nhìn từ trên cao: dòng nước đục màu phù sa đổ ra biển xanh, thấy bãi bồi màu nâu ở chỗ sông gặp biển; không có thành phố, không có người, không có chữ; không phải bản đồ, không phải ảnh vệ tinh thấy cả vùng. Từ khoá tìm ảnh (EN): river mouth sediment aerial
image.alt.en: A river flowing into the sea
image.alt.vi: Dòng sông chảy ra biển
hint.en: Where did the bits of rock come from?
hint.vi: Những mảnh đá vụn đó từ đâu tới?
explanation_correct.en: Yes! The river carried mud and sand there.
explanation_correct.vi: Đúng rồi! Dòng sông đã mang bùn và cát tới đó.
explanation_wrong.en: The answer is erosion. The river carried the bits there.
explanation_wrong.vi: Đáp án là xói mòn. Dòng sông đã mang mảnh vụn tới đó.
> DOK 2: áp ý chính ba vào một nơi mới (cửa sông), như gợi ý ở `_topic.md`; nối bài mười hai (đất phù sa). Lựa chọn sai "phun trào" có sức hút: bài *Núi lửa* dạy dung nham nguội thành đá mới, thành đất mới; "phong hoá" bắt `weathering_is_erosion`.
> Ba lựa chọn cùng là ba ảnh bé đã gặp (hai ô Học hôm nay, một ô *Núi lửa*). Câu w1 bài tám dùng lại đúng ba hình này để ôn (bảng Hình dùng chung); câu hỏi bên đó khác (sông mang cát đi xa).
> [CẦN KIỂM] Cách nói giản lược: sông mang bùn cát đi rồi để lắng lại ở cửa sông thành bãi đất mới (bồi tụ). Chữ cho trẻ không dùng chữ "bồi tụ".

#### option q4_erupt
correct: false
label.en: eruption
label.vi: phun trào
image.brief: Dùng lại hình `explore_erupt` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): volcano erupting lava night distant
image.alt.en: A volcano with red lava
image.alt.vi: Núi lửa có dung nham đỏ
> `alt` sửa so với gốc ("A volcano erupting" · "Núi lửa đang phun trào"), vì gốc chứa đúng chữ của nhãn.

#### option q4_erosion
correct: true
label.en: erosion
label.vi: xói mòn
image.brief: Dùng lại hình `explore_erosion`. Từ khoá tìm ảnh (EN): muddy river eroded riverbank
image.alt.en: A river with a worn bank
image.alt.vi: Dòng sông có bờ bị lở

#### option q4_weathering
correct: false
label.en: weathering
label.vi: phong hoá
image.brief: Dùng lại hình `explore_weathering`. Từ khoá tìm ảnh (EN): banyan tree roots old stone wall
image.alt.en: Tree roots over an old stone wall
image.alt.vi: Rễ cây trùm lên bức tường đá cũ

### q5
id: e0791c63-8349-462c-91a7-b042586cccfc
format: single_choice
version: 1
dok: 2
prompt.en: A riverbank keeps falling in. What helps most?
prompt.vi: Bờ sông cứ bị lở dần. Việc nào giúp ích nhất?
image.brief: [ảnh] Bờ sông bằng đất bị lở thành vách thấp, rễ cây nhỏ lộ ra, có tuyết phủ (ảnh designer chọn 11/11), chụp gần vừa từ dưới mép nước; không có nhà, không có người, không có chữ. Khác ảnh `explore_erosion` (ảnh đó chụp xa cả khúc sông). Từ khoá tìm ảnh (EN): eroded riverbank exposed roots close
image.alt.en: A riverbank falling in
image.alt.vi: Bờ sông đang bị lở
hint.en: Remember the Slowing it down picture.
hint.vi: Em nhớ lại ô Làm chậm lại nhé.
explanation_correct.en: Yes! A stone bank protects the riverbank.
explanation_correct.vi: Đúng rồi! Kè đá che chắn cho bờ sông.
explanation_wrong.en: The answer is a stone bank. It slows erosion down.
explanation_wrong.vi: Đáp án là xây kè đá. Kè đá làm xói mòn chậm lại.
> DOK 2: áp ô "Slowing it down" vào một bờ sông đang lở, như gợi ý ở `_topic.md`. Hai lựa chọn sai có sức hút: chặt cây ven bờ (bé có thể nghĩ cây làm vướng dòng nước), hút cát dưới sông (bé có thể nghĩ lòng sông sâu hơn thì nước chảy êm hơn). Ba lựa chọn là ba hình vẽ cùng nét (designer 11/11: không có ảnh tàu hút cát không chữ), cùng là cảnh bờ sông; hình câu hỏi là ảnh.
> [CẦN KIỂM] Chặt cây ven bờ và hút cát dưới lòng sông làm bờ sông dễ lở hơn; kè đá giúp giữ bờ (biên tập nhớ, chuyện hay gặp ở Việt Nam).

#### option q5_cut
correct: false
label.en: cut down the trees
label.vi: chặt hết cây ven bờ
image.brief: [hình vẽ] Mấy gốc cây vừa bị chặt trên một bờ đất trống sát mép nước, vẽ gần vừa; không có người, không có cưa máy, không có chữ.
image.alt.en: Tree stumps on a bare bank
image.alt.vi: Gốc cây bị chặt trên bờ đất trống

#### option q5_bank
correct: true
label.en: build a stone bank
label.vi: xây kè đá
image.brief: [hình vẽ] Một đoạn kè đá xếp dọc bờ sông, nước sông bên cạnh, vẽ chéo gần vừa, cùng nét hai hình kia của câu; không có người, không có biển báo hay chữ.
image.alt.en: Stones lining a riverbank
image.alt.vi: Kè đá dọc bờ sông

#### option q5_dig
correct: false
label.en: dig sand from the river
label.vi: hút cát dưới sông
image.brief: [hình vẽ] Một chiếc tàu hút cát trên sông, ống hút thả xuống nước, đống cát trên tàu, vẽ từ bờ; không có người, không có tên tàu, biển số, cờ hay chữ.
image.alt.en: A boat digging sand from a river
image.alt.vi: Tàu hút cát trên sông

### q6
id: 8e73f0de-002f-44a1-b744-8c72d5e7c0cf
format: true_false
version: 1
dok: 3
misconception: weathering_is_erosion
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: Tree roots cracked this rock. That is weathering, not erosion.
statement.vi: Rễ cây làm nứt hòn đá này. Đó là phong hoá, chưa phải xói mòn.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
image.brief: [ảnh] Rễ một cái cây trong rừng trùm lên và len vào khe một tảng đá lớn, chụp gần vừa (ảnh designer chọn 11/11: không thấy rõ hai mảnh đá tách đôi); khác ảnh `explore_weathering` (tường đá) và hình món `tray_roots_steps` (bậc đá); không có người, không có chữ. Từ khoá tìm ảnh (EN): tree roots splitting boulder forest
image.alt.en: Tree roots over a big rock
image.alt.vi: Rễ cây trùm lên tảng đá lớn
hint.en: Think: did the bits go anywhere?
hint.vi: Em thử nghĩ: mảnh đá có bị mang đi đâu không?
explanation_correct.en: Yes! The rock broke where it is. That is weathering.
explanation_correct.vi: Đúng rồi! Hòn đá vỡ ra ngay tại chỗ. Đó là phong hoá.
explanation_wrong.en: Na is right. Erosion carries the bits away.
explanation_wrong.vi: Na nói đúng. Xói mòn là khi mảnh vụn bị mang đi nơi khác.
> DOK 3: bé đánh giá một lời phân loại về một cảnh mới (tảng đá trong rừng). Bé còn tin "phong hoá và xói mòn là một" sẽ thấy vế "chưa phải xói mòn" là sai và chọn "Na chưa đúng". Lời Na đúng bảng "Câu sáu, lời Na"; đáp án Đúng theo bảng Đúng/Sai.
> Ảnh designer chọn 11/11 là rễ cây trùm, len vào tảng đá lớn, không thấy rõ hai mảnh tách đôi; `alt` đổi theo ("Tree roots over a big rock" · "Rễ cây trùm lên tảng đá lớn"). Lời Na vẫn đúng với ảnh: rễ len vào khe làm đá nứt, đá vẫn nằm tại chỗ. Hình không có mũi tên hay chữ.

## Từ vựng

### weathering
id: ba1ca19f-0885-4b8e-8fc7-4ce0a3b2bb84
tier: core
term.en: weathering
term.vi: phong hoá
example.en: Tree roots and rain cause weathering.
example.vi: Rễ cây và nước mưa gây ra phong hoá.
image.brief: Dùng lại hình `explore_weathering`. Từ khoá tìm ảnh (EN): banyan tree roots old stone wall
image.alt.en: Tree roots over an old stone wall
image.alt.vi: Rễ cây trùm lên bức tường đá cũ

### erosion
id: 33fbb817-d5db-4982-b698-8e290a911b0a
tier: core
term.en: erosion
term.vi: xói mòn
example.en: Erosion carries sand and mud down the river.
example.vi: Xói mòn mang cát và bùn xuôi theo dòng sông.
image.brief: Dùng lại hình `explore_erosion`. Từ khoá tìm ảnh (EN): muddy river eroded riverbank
image.alt.en: A river with a worn bank
image.alt.vi: Dòng sông có bờ bị lở

### crack
id: e3359028-4fb7-4fc3-878e-55878cf1d433
tier: core
term.en: crack
term.vi: vết nứt
example.en: Roots grew into the crack in the rock.
example.vi: Rễ cây mọc vào vết nứt trên hòn đá.
image.brief: [ảnh] Một vết nứt dài, sâu chạy ngang mặt một tảng đá xám, chụp gần; không có cây, rễ hay rêu trong vết nứt, không có người, không có chữ. Thẻ đúng câu q2 dùng lại ảnh này. Từ khoá tìm ảnh (EN): long crack in rock close up
image.alt.en: A long crack in a rock
image.alt.vi: Vết nứt dài trên hòn đá

### cave
id: 666be3d3-2ebd-47f8-838e-2ad1b90236be
tier: extra
term.en: cave
term.vi: hang động
example.en: Water wore away limestone and made a cave.
example.vi: Nước làm đá vôi mòn dần, tạo nên hang động.
image.brief: Dùng lại hình `phong_nha_card`. Từ khoá tìm ảnh (EN): Phong Nha cave interior stalactites
image.alt.en: Inside Phong Nha Cave
image.alt.vi: Bên trong động Phong Nha
> [CẦN KIỂM] Như thẻ `phong_nha_card`.

## Thưởng

### phong_nha_card
id: 7978a605-82aa-458e-8bd9-79b92813075a
set: rocks
rarity: common
name.en: Phong Nha Cave
name.vi: Động Phong Nha
tag.en: Made by water
tag.vi: Do nước tạo nên
fact.en: Water wore away limestone for millions of years. It made this huge cave.
fact.vi: Nước bào mòn đá vôi suốt hàng triệu năm, tạo nên hang động rất lớn này.
> [CẦN KIỂM] Động Phong Nha hình thành do nước bào mòn đá vôi qua hàng triệu năm (`_topic.md` mục bài bảy và bảng Bộ thẻ).
image.brief: [ảnh] Bên trong động Phong Nha: vòm hang đá vôi cao, thạch nhũ, dòng sông ngầm, ánh đèn dịu; không có khách nhận ra mặt, không có thuyền chở khách ở gần, không có biển chỉ dẫn hay chữ. Nhiều ảnh trên Commons là CC BY-SA, phải loại; không có thì lấy hang động đá vôi khác ở Việt Nam và đổi tên thẻ (báo topic editor). Từ khoá tìm ảnh (EN): Phong Nha cave interior stalactites
image.alt.en: Inside Phong Nha Cave
image.alt.vi: Bên trong động Phong Nha

## Ghi chú cho hoạ sĩ

- **Loại hình** (theo file chọn ảnh designer 11/11): ô `explore_forces`, cả kệ Chơi (tám món), ba lựa chọn q5 là hình vẽ; còn lại là ảnh (ba ô Học kia, hình câu hỏi, từ `crack`, thẻ Phong Nha). Kệ vẽ cả tám món vì không có ảnh hợp lệ gầu máy xúc đang xúc đá và tay đục đá không thấy mặt.
- **Ảnh nguồn (mười một):** `explore_weathering` (hình gốc của bảng Hình dùng chung), `explore_erosion` (hình gốc; sông Cowpasture, nước xanh đục), `explore_slow`; hình câu q1 (đá vụn), q2 (cây đa), q3 (tảng đá), q4 (cửa sông), q5 (bờ sông lở có tuyết), q6 (rễ cây trùm tảng đá); `crack`; thẻ Phong Nha (từ `cave` dùng lại).
- **Hình tự vẽ (mười hai):** `explore_forces`; tám món kệ; `q5_cut`, `q5_bank`, `q5_dig`.
- **Dùng lại trong bài:** `explore_forces` (q1); `explore_weathering` (q4, từ `weathering`); `explore_erosion` (q4, từ `erosion`); `tray_digger`, `tray_chisel` (q1); `tray_roots_steps`, `tray_rain_limestone`, `tray_dunes`, `tray_stream` (q3); `crack` (thẻ q2); `phong_nha_card` (từ `cave`).
- **Dùng lại từ bài khác:** bột xi măng `q2` (bài sáu, w1; hình vẽ); `laterite` (bài sáu, w1); `tray_limestone`, `explore_scratch` (bài ba); `granite`, `tray_sandstone` (bài hai); `explore_erupt` (*Núi lửa*); `tray_rock_print` (*Hoá thạch kể chuyện khủng long*).
- **Bài khác dùng lại hình của bài này** (bảng Hình dùng chung): `explore_weathering` (bài tám w1, bài mười lăm w2), `explore_erosion` (bài tám w1, bài mười hai, bài mười lăm w2). Không dùng `explore_weathering` làm hình câu w2 bài mười một.
- **Cùng kiểu trong một câu:** w1 ba ảnh đá (cận cảnh tường đá ong cắt sát); q1 ba hình vẽ của Học và Chơi; q2 ba ảnh cận mặt đá; q3 bốn hình vẽ kệ Chơi; q4 ba ảnh phong cảnh; q5 ba hình vẽ bờ sông.
- **Màu:** Học: lực tự nhiên `vang_hoe`, phong hoá `gi_dong`, xói mòn `cham`, làm chậm lại `do_son`. Chơi: nước `cham`, gió `vang_hoe`, cây `gi_dong`, nhóm `limit` `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (mỗi nhóm hai món), một nhóm `limit` (hai món), tám món.
  - Khởi động: `single_choice` (w1 ôn bài sáu), `true_false` (w2 ôn bài ba, Sai).
  - Quiz: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6, `speaker: na`, Đúng). Bốn format.
  - DOK q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `weathering_is_erosion`.
- **Vị trí đáp án đúng:** w1 thứ nhất; q1 thứ ba; thẻ đúng q2 thứ ba; q3 thứ nhất và thứ hai; q4 thứ hai; q5 thứ hai. Khớp bảng `_topic.md`.
- **Tham chiếu:** `recall_from.lesson` trỏ `da-va-dat/da-dung-lam-gi` (w1), `da-va-dat/da-nao-cung-hon` (w2).
- **Câu "Em nghĩ sao?"** của bài một (`rocks_never_change`): bài này dạy ở ô `explore_forces`; bài mười lăm hỏi lại ở w3.
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Suối chảy qua đá, Đồi cát gió thổi, Rễ đa trùm tường đá → đạt;
  - chạm Gầu máy xúc → `has_limited`;
  - chạm Đá vôi bị mưa bào mòn, Suối chảy qua đá, Rễ cây làm nứt bậc đá (thiếu gió) → `missing.tray_wind_group`; chạm Tảng đá bị gió mài → `full`; bỏ Suối chảy qua đá, đặt Tảng đá bị gió mài → đạt.
- **Dòng điều kiện màn Chơi:** "Cần đủ Nước, Gió, Cây · Không phải lực tự nhiên".
- **Số từ EN trên một màn:**
  - Học khoảng ba mươi mốt từ: mục tiêu 6, hướng dẫn 3, bốn nhãn 7, câu dài nhất 10, ô Từ mới 5.
  - Quiz nhiều nhất là q3 (khoảng ba mươi ba: câu hỏi 4, hướng dẫn 5, bốn nhãn 15, gợi ý 9; vượt ba mươi vì bốn nhãn cùng một khuôn dài) và q5 (khoảng hai mươi tám). q6 cả màn 17. Nếu PM muốn đúng ba mươi, bỏ chữ "down" và "away" ở hai nhãn q3.
- **Từ EN có thể ngoài Starters/Movers:** weathering, erosion, crack, cave, natural, forces, roots, banyan, limestone, granite, laterite, cement, dunes, digger, bucket, chisel, pebbles, riverbank, eruption, stumps, scratch.
- **Giọng đọc:** nghe thử EN "weathering", "erosion", "Phong Nha Cave", "rain-worn"; VI "ngày nóng, đêm lạnh" (dấu phẩy).
- **Bộ thẻ:** `set: rocks`.
