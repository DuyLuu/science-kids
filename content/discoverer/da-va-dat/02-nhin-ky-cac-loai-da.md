---
id: d2bd55a8-bb56-44ff-b642-5dc3f2f3158c
topic: da-va-dat
slug: nhin-ky-cac-loai-da
order: 2
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: The appearance of rocks
vi: Nhìn kỹ các loại đá
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số hai).

## Mục tiêu
en: I can compare rocks by how they look.
vi: Em so sánh được các loại đá qua vẻ ngoài.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn A), chưa duyệt.** Ticket SK-039 bước 2, ngày 11/11/2026. Chưa chạy `ids`, `validate`; mọi dòng `id:` để trống.
> Theo Oak lesson 2 `the-appearance-of-rocks`: kính lúp giúp nhìn kỹ; so sánh, xếp nhóm đá theo vẻ ngoài (hạt, lỗ, lớp); mỗi loại đá có tên riêng; tra sách để gọi tên. Sửa `rocks_all_look_same` ở ý chính hai và ba, bốn ô Học, phần Chơi và câu q6 (gắn key, Na nói đúng).
> Lệch Oak: Oak dặn cầm đá thật, không dùng ảnh; app chỉ có ảnh, nên mọi mẫu đá theo "Bộ mẫu đá" ở `_topic.md` (thấy rõ hạt, lỗ, lớp), còn việc cầm đá thật là thí nghiệm ở nhà (Ghi chú cho dev). "Secondary sources" không thành từ vựng, chỉ là ví dụ "tra tên trong sách về đá". Thêm ý "có loại đá từng là dung nham" để nối *Núi lửa*, không dùng tên "đá mác-ma" (main session chốt 11/11). Kính hiển vi kỹ thuật số không dùng. Không hỏi cứng, mềm, thấm nước.

## Ý chính
1.en: A magnifying glass helps you look closely at rocks.
1.vi: Kính lúp giúp em nhìn kỹ hòn đá.
2.en: Rocks can have grains, holes or layers.
2.vi: Đá có thể có hạt, có lỗ hoặc có từng lớp.
3.en: Each kind of rock has its own name.
3.vi: Mỗi loại đá có tên riêng.
> Giữ nguyên chữ của `_topic.md`. Đi từ cụ thể (dụng cụ nhìn kỹ) tới trừu tượng (mỗi loại đá là một loại riêng, có tên riêng).

## Khởi động

> Hai câu ôn bài một (một ngày trước), đúng bảng Khởi động ở `_topic.md`:
> - w1: người ta đào đá lên ở đâu (mỏ đá · ruộng lúa · cái ao), đáp án thứ nhất. Bài một dạy ý này ở ô "From the ground" và từ `quarry`.
> - w2: "Concrete is a natural rock." (Sai). Bài một dạy ý này ở ý chính ba và ô "Made by people".

### w1
id: 46500bbd-da54-48dd-a381-24e8f40a82ab
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/lam-quen-voi-da
prompt.en: Where do people dig rock out of the ground?
prompt.vi: Người ta đào đá từ lòng đất lên ở đâu?
image.brief: Dùng lại hình `explore_around` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): dry stone wall village path
image.alt.en: An old wall in the grass
image.alt.vi: Bức tường rào cũ giữa bãi cỏ
hint.en: Remember the From the ground picture in lesson one.
hint.vi: Em nhớ lại ô Từ lòng đất ở bài một nhé.
explanation_correct.en: At a quarry, people cut rock from the ground.
explanation_correct.vi: Ở mỏ đá, người ta cắt đá từ lòng đất.
explanation_wrong.en: People dig rock out of the ground at a quarry.
explanation_wrong.vi: Người ta đào đá từ lòng đất lên ở mỏ đá.
> Ruộng lúa và cái ao cũng là nơi người ta đào đất, nên có sức hút. Ba ảnh cùng là cảnh rộng, chụp ngoài trời. Hình câu hỏi là bức tường đá của bài một: đá này lấy từ đâu ra.

#### option w1_quarry
correct: true
label.en: quarry
label.vi: mỏ đá
image.brief: Dùng lại hình `quarry` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): open pit stone quarry terraces
image.alt.en: An open quarry
image.alt.vi: Mỏ đá lộ thiên

#### option w1_rice
correct: false
feedback.en: A rice field is soft mud for growing rice.
feedback.vi: Ruộng lúa là đất bùn mềm để trồng lúa.
label.en: rice field
label.vi: ruộng lúa
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

#### option w1_pond
correct: false
feedback.en: People dig a pond to hold water, not rock.
feedback.vi: Ao được đào để chứa nước, không để lấy đá.
label.en: pond
label.vi: cái ao
image.brief: Dùng lại hình `tray_pond` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): pond village lotus leaves
image.alt.en: A small pond with lotus leaves
image.alt.vi: Cái ao nhỏ có lá sen

### w2
id: 0d03f94e-59a5-462f-baa5-e1a351d28643
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/lam-quen-voi-da
prompt.en: Concrete is a natural rock.
prompt.vi: Bê tông là một loại đá tự nhiên.
image.brief: Dùng lại hình `tray_concrete` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): concrete block plain background
image.alt.en: A grey concrete block
image.alt.vi: Khối bê tông màu xám
answer: false
hint.en: Remember the Made by people picture in lesson one.
hint.vi: Em nhớ lại ô Do con người làm ra ở bài một nhé.
explanation_correct.en: People mix concrete, so it is not natural rock.
explanation_correct.vi: Bê tông do con người trộn, không phải đá tự nhiên.
explanation_wrong.en: Concrete is made by people, not by nature.
explanation_wrong.vi: Bê tông do người làm ra, không có sẵn trong tự nhiên.
feedback_true.en: People mix concrete from cement, sand and gravel.
feedback_true.vi: Bê tông do người trộn xi măng, cát và sỏi.
> Chữ EN đúng bảng Khởi động và bảng Đáp án Đúng/Sai (đáp án Sai). Giải thích khi đúng không mở đầu bằng "Yes!". Ảnh khối bê tông xám trông hơi giống đá, nên câu vẫn cần nghĩ.

## Học

> Bốn ô, theo kế hoạch bài hai ở `_topic.md`: nhìn kỹ (ý chính một), hạt, lỗ, lớp (ý chính hai). Mỗi ô gọi tên các loại đá (ý chính ba).
> Ảnh mẫu đá theo "Bộ mẫu đá" (Quy ước hình mục ba ở `_topic.md`): một mẫu cầm tay, nền trơn, thấy rõ hạt, lỗ hay lớp, không chữ, không thước, không tay người.

### explore
id: cfa039dc-6d48-44e4-8ce4-0674732a26fe
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_look
label.en: Look closely
label.vi: Nhìn kỹ
color: gi_dong
sentence.en: A magnifying glass helps you look closely at rocks.
sentence.vi: Kính lúp giúp em nhìn kỹ hòn đá.
image.brief: [hình vẽ] Một chiếc kính lúp đặt nghiêng trên một hòn đá xám trên mặt bàn gỗ, qua mặt kính thấy bề mặt hòn đá to hơn; không có tay người, không có chữ, không có logo. Câu q3 dùng lại ảnh này (hình câu hỏi). Từ khoá tìm ảnh (EN): magnifying glass on rock
image.alt.en: A magnifying glass on a rock
image.alt.vi: Kính lúp đặt trên hòn đá
examples.1.en: use a magnifying glass
examples.1.vi: dùng kính lúp
examples.2.en: look at the colour
examples.2.vi: nhìn màu sắc
examples.3.en: look for grains, holes or layers
examples.3.vi: tìm hạt, lỗ hay lớp
examples.4.en: find its name in a rock book
examples.4.vi: tra tên đá trong sách về đá
> Ví dụ bốn là "nguồn thứ cấp" của Oak, nói bằng lời thường.

#### group explore_grains
label.en: Grains
label.vi: Hạt
color: vang_hoe
sentence.en: Some rocks have grains you can see, like granite.
sentence.vi: Có loại đá có hạt nhìn thấy được, như đá hoa cương.
image.brief: Dùng lại hình `granite`. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám
examples.1.en: grey granite
examples.1.vi: đá hoa cương xám
examples.2.en: pink granite
examples.2.vi: đá hoa cương hồng
examples.3.en: shiny grains of many colours
examples.3.vi: hạt lấp lánh nhiều màu
> Câu của ô dạy đúng ý mà bài năm câu w2 ôn lại ("Some rocks have grains you can see.").
> [CẦN KIỂM] Hạt lấp lánh nhiều màu trong đá hoa cương là các khoáng vật khác nhau (bài bốn nói "khoáng vật"; bài này chưa dùng chữ đó).

#### group explore_holes
label.en: Holes
label.vi: Lỗ
color: do_son
sentence.en: Pumice has tiny holes and was once hot lava.
sentence.vi: Đá bọt có lỗ nhỏ li ti, từng là dung nham nóng.
image.brief: Dùng lại hình `pumice`. Từ khoá tìm ảnh (EN): pumice rock sample
image.alt.en: A pale grey rock
image.alt.vi: Hòn đá màu xám nhạt
examples.1.en: pumice
examples.1.vi: đá bọt
examples.2.en: basalt
examples.2.vi: đá ba-dan
examples.3.en: holes left by bubbles in lava
examples.3.vi: lỗ do bọt khí trong dung nham để lại
> Nối *Núi lửa* (dung nham nguội thành đá mới), không dạy lại núi lửa phun ra sao, không dùng tên "đá mác-ma".
> [CẦN KIỂM] Đá bọt và đá ba-dan có lỗ vì bọt khí trong dung nham để lại khi đá nguội. Câu "They were once hot lava" nói về hai loại đá trong ô; không phải hòn đá nào có lỗ cũng từng là dung nham (đá vôi có thể có hốc), nên ví dụ chỉ gọi tên hai loại này.
> A2 (SK-043, 14/11): câu cũ hai câu, mười bảy chữ, vượt ngân sách. Nay một câu mười hai chữ, theo bản rút của designer; câu nói về đá bọt (ảnh của ô), đá ba-dan vẫn là ví dụ. Không còn câu "có loại đá có lỗ… từng là dung nham" nói chung.

#### group explore_layers
label.en: Layers
label.vi: Lớp
color: cham
sentence.en: Some rocks have layers, like a layer cake.
sentence.vi: Có loại đá có từng lớp, giống chiếc bánh nhiều lớp.
image.brief: Dùng lại hình `tray_sandstone`. Từ khoá tìm ảnh (EN): sandstone rock sample layers
image.alt.en: A yellow-brown rock
image.alt.vi: Hòn đá màu vàng nâu
examples.1.en: sandstone with stripes
examples.1.vi: sa thạch có vân sọc
examples.2.en: dark grey slate
examples.2.vi: đá phiến xám sẫm
> Rà chữ tester 11/11 (n2): ví dụ hai cũ "slate that splits into thin sheets" gần trùng nguyên văn câu q4, nên q4 thành nhớ lại ô Học. Nay ví dụ chỉ gọi tên và màu; ý "tấm mỏng" bé tự nhìn ra ở mép ảnh đá phiến (q4) rồi nghe ở giải thích.
> Nối từ `layer` (chiếc bánh nhiều lớp) đã học ở *Bề mặt Trái Đất* bài ba. Chuyện cát, bùn lắng xuống thành từng lớp để bài tám.
> [CẦN KIỂM] Vân sọc của sa thạch là các lớp cát lắng xuống; đá phiến tách được thành tấm mỏng. Không nói lớp của đá phiến do bùn lắng (`_topic.md`).

### new_words
id: 272f4be0-6baf-43f0-af1c-264b6da027b3
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: compare, grain, magnifying_glass

## Chơi

> Bé chọn ba hòn đá trông khác nhau: một hòn có hạt lấp lánh, một hòn có lỗ nhỏ, một hòn có từng lớp. Không được chọn thứ chỉ trông giống đá.
> - Ba món bẫy theo `_topic.md`, mỗi món giống một nhóm: miếng bọt biển có lỗ (giống nhóm Có lỗ nhỏ), khúc gỗ có vòng gỗ như từng lớp (giống nhóm Có từng lớp), cục đường phèn lấp lánh (giống nhóm Hạt lấp lánh).
> - Nhãn món là tên đá (ý chính ba: mỗi loại đá có tên riêng); nhãn ba món bẫy là tên đồ vật, cùng một dạng. `alt` mẫu đá chỉ tả màu, không tả hạt, lỗ hay lớp (Quy ước hình mục năm), kể cả `tray_dark_rock` dùng lại của *Núi lửa*.
> - Cả kệ là ảnh chụp; sáu mẫu đá cùng nền kem của Bộ mẫu đá.

### tray
id: f233b344-8136-4ac7-b556-0a64787d0e18
type: build_tray
version: 1
prompt.en: Find three rocks that look different
prompt.vi: Tìm ba hòn đá trông khác nhau
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick rocks with grains, with holes and with layers.
messages.start.vi: Em chọn đá có hạt, đá có lỗ và đá có từng lớp nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Three rocks, three different looks.
messages.balanced.vi: Tuyệt! Ba hòn đá, ba vẻ ngoài khác nhau.
messages.has_limited.en: That is not a rock. It only looks like one.
messages.has_limited.vi: Thứ đó không phải đá. Nó chỉ trông giống đá thôi.
messages.missing.tray_shiny.en: You still need a rock with shiny grains.
messages.missing.tray_shiny.vi: Em còn thiếu một hòn đá có hạt lấp lánh.
messages.missing.tray_holes.en: You still need a rock with tiny holes.
messages.missing.tray_holes.vi: Em còn thiếu một hòn đá có lỗ nhỏ.
messages.missing.tray_layers.en: You still need a rock with layers.
messages.missing.tray_layers.vi: Em còn thiếu một hòn đá có từng lớp.

#### group tray_shiny
label.en: Shiny grains
label.vi: Hạt lấp lánh
color: vang_hoe
role: required

#### group tray_holes
label.en: Tiny holes
label.vi: Có lỗ nhỏ
color: do_son
role: required

#### group tray_layers
label.en: Layers
label.vi: Có từng lớp
color: cham
role: required

#### group tray_not_rocks
label.en: Not rocks
label.vi: Không phải đá
color: nau_dat
role: limit

#### item tray_sponge
label.en: Sponge
label.vi: Miếng bọt biển
group: tray_not_rocks
image.brief: [ảnh] Miếng bọt biển rửa bát (xanh, hồng), chụp gần thấy rõ nhiều lỗ nhỏ, đặt trên nền trơn; không có nhãn hiệu, không có chữ. Câu q5 dùng lại ảnh này. Từ khoá tìm ảnh (EN): yellow kitchen sponge close up
image.alt.en: A kitchen sponge
image.alt.vi: Miếng bọt biển rửa bát
> Theo hình designer 11/11: không có ảnh bọt biển vàng hợp lệ; ảnh bọt biển xanh, hồng (CC BY 2.0), brief và `alt` đổi theo.

#### item tray_granite
label.en: Grey granite
label.vi: Đá hoa cương xám
group: tray_shiny
image.brief: Dùng lại hình `granite`. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám

#### item tray_slate
label.en: Slate
label.vi: Đá phiến
group: tray_layers
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: khối đá phiến xám sẫm (ảnh James St. John, CC BY 2.0) tách khỏi nền ảnh gốc, đặt giữa nền trắng ngà chung, có bóng mềm; mép đá thấy rõ nhiều tấm mỏng chồng lên nhau (câu q4 hỏi bé nhìn ra "nhiều tấm mỏng"); không có nhãn số, thước, tay người, chữ; không dùng ảnh mái lợp đá phiến. Câu q4, hình ghép câu q6, bài ba câu q4, bài năm (từ slate, câu q3) dùng lại hình này. Từ khoá tìm ảnh (EN): slate rock sample
image.alt.en: A dark grey rock
image.alt.vi: Hòn đá màu xám sẫm

#### item tray_pumice
label.en: Pumice
label.vi: Đá bọt
group: tray_holes
image.brief: Dùng lại hình `pumice`. Từ khoá tìm ảnh (EN): pumice rock sample
image.alt.en: A pale grey rock
image.alt.vi: Hòn đá màu xám nhạt

#### item tray_log
label.en: Log
label.vi: Khúc gỗ
group: tray_not_rocks
image.brief: [ảnh] Mặt cắt nhiều khúc gỗ tròn xếp chồng, thấy rõ các vòng gỗ như từng lớp; không có chữ. Từ khoá tìm ảnh (EN): cut log cross section tree rings
image.alt.en: Cut logs
image.alt.vi: Những khúc gỗ đã cưa
> Theo hình designer 11/11: ảnh mặt cắt nhiều khúc gỗ (CC0); `alt` đổi theo. Nhãn "Log" · "Khúc gỗ" giữ.

#### item tray_pink_granite
label.en: Pink granite
label.vi: Đá hoa cương hồng
group: tray_shiny
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: mẫu đá hoa cương hồng lấm tấm hạt hồng, trắng, đen (ảnh James St. John, CC BY 2.0) tách khỏi nền ảnh gốc, đặt giữa nền trắng ngà chung, có bóng mềm; thấy rõ các hạt lấp lánh; không có nhãn số, thước, tay người, chữ. Câu q4 (lựa chọn sai), bài ba câu w1 và bài bốn câu q1 (hình câu hỏi) dùng lại hình này. Từ khoá tìm ảnh (EN): pink granite rock sample
image.alt.en: A pink rock
image.alt.vi: Hòn đá màu hồng

#### item tray_dark_rock
label.en: Basalt
label.vi: Đá ba-dan
group: tray_holes
image.brief: Dùng lại hình `tray_dark_rock` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): basalt vesicular rock sample
image.alt.en: A dark rock
image.alt.vi: Hòn đá sẫm màu
> `alt` đổi so với chỗ gốc ("A dark rock with tiny holes" · "Hòn đá sẫm màu có lỗ nhỏ"), vì nhóm đang hỏi chính là "có lỗ nhỏ".

#### item tray_rock_sugar
label.en: Sugar crystal
label.vi: Cục đường phèn
group: tray_not_rocks
image.brief: [ảnh] Đường phèn trắng trong, góc cạnh, lấp lánh, chụp gần; không có bao bì, không có chữ. Câu q5, bài bốn (món bẫy và câu q2) dùng lại ảnh này. Từ khoá tìm ảnh (EN): rock sugar crystal lump
image.alt.en: Clear lumps
image.alt.vi: Mấy cục trong suốt
> Theo hình designer 11/11: ảnh cận cảnh đường phèn (CC BY 2.0) thấy nhiều cục; `alt` đổi theo. Nhãn "Sugar crystal" · "Cục đường phèn" giữ.
> Nhãn EN là "Sugar crystal", không dùng "rock sugar" (tên tiếng Anh thường gặp) để trong nhóm "Not rocks" không có món mang chữ "rock".

#### item tray_sandstone
label.en: Sandstone
label.vi: Sa thạch
group: tray_layers
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: ảnh cận cảnh mặt sa thạch vàng nâu có vân sọc song song (ảnh James St. John, CC BY 2.0), cắt theo hình một hòn đá, thêm sáng tối nhẹ và bóng, đặt giữa nền trắng ngà chung (không có ảnh mẫu cầm tay hợp lệ); thấy rõ vân lớp và mặt sần hạt cát; không có nhãn số, thước, tay người, chữ. Ô Học explore_layers, câu q3, bài ba (thẻ câu q2), bài năm (từ sandstone, câu q3, câu q6), bài sáu câu w1, bài bảy (thẻ q2) dùng lại hình này. Từ khoá tìm ảnh (EN): sandstone rock sample layers
image.alt.en: A yellow-brown rock
image.alt.vi: Hòn đá màu vàng nâu
> [CẦN KIỂM] "sa thạch" hay "đá cát kết" theo sách (bảng Tên gọi ở `_topic.md`).

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Bốn format: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, thẻ từ có hình; trong một câu các lựa chọn cùng là ảnh chụp, cùng nền.
> Vị trí đáp án đúng theo bảng ở `_topic.md`: q1 thứ ba, thẻ đúng q2 thứ ba, q3 thứ hai và thứ ba, q4 thứ nhất, q5 thứ hai.
> Mỗi ảnh mẫu đá chỉ làm lựa chọn ở một câu (không giữ hai vai trong bài). Câu q4 dùng trước ảnh `chalk` của bài ba (Bộ mẫu đá: mỗi loại đá một ảnh gốc).
> Không hỏi cứng, mềm hay thấm nước (kế hoạch bài hai).

### q1
id: 6ef225b4-d7e7-4ef2-aa8d-1e58a51ef3be
format: single_choice
version: 1
dok: 1
prompt.en: Which tool helps you look closely at a rock?
prompt.vi: Dụng cụ nào giúp em nhìn kỹ một hòn đá?
image.brief: [hình vẽ] Nhiều hòn đá nhỏ khác màu, khác kiểu (có hòn lốm đốm, hòn có lỗ, hòn có vân sọc) bày trên mặt bàn gỗ, vẽ nhìn từ trên xuống; không có tay người, không có nhãn, không có chữ; không phải đồ trang trí, không phải đá quý đã mài. Từ `compare`, bài ba (câu q4, từ `property`), bài bốn câu w1 và bài năm câu q3 dùng lại ảnh này. Từ khoá tìm ảnh (EN): rock collection table top view
image.alt.en: Many different rocks on a table
image.alt.vi: Nhiều hòn đá khác nhau trên bàn
hint.en: Remember the Look closely picture.
hint.vi: Em nhớ lại ô Nhìn kỹ nhé.
explanation_correct.en: A magnifying glass helps you see tiny grains on rocks.
explanation_correct.vi: Kính lúp giúp em thấy những hạt rất nhỏ trên đá.
explanation_wrong.en: A magnifying glass makes small things look bigger.
explanation_wrong.vi: Kính lúp làm vật nhỏ trông to hơn.
> Đèn pin (cũng giúp nhìn rõ hơn) và gương (cũng để nhìn) có sức hút. Ba ảnh đều mới, cùng là một dụng cụ trên nền trơn. Ảnh kính lúp ở đây khác ảnh từ vựng `magnifying_glass` và ảnh ô `explore_look`, để đáp án không phải ảnh duy nhất bé vừa gặp ở phần Học (rút kinh nghiệm SK-037 N2).

#### option q1_torch
correct: false
feedback.en: A torch gives light but does not make things bigger.
feedback.vi: Đèn pin chiếu sáng, không làm vật to hơn.
label.en: torch
label.vi: đèn pin
image.brief: [hình vẽ] Một chiếc đèn pin cầm tay đang tắt, đặt trên nền trơn, vẽ chéo; cùng cỡ trong khung như gương và kính lúp; không có logo, không có chữ. Bài năm câu q1 dùng lại ảnh này. Từ khoá tìm ảnh (EN): flashlight torch plain background
image.alt.en: A torch
image.alt.vi: Chiếc đèn pin

#### option q1_mirror
correct: false
feedback.en: A mirror shows things back, but not bigger.
feedback.vi: Gương soi lại hình, không làm vật to hơn.
label.en: mirror
label.vi: cái gương
image.brief: [hình vẽ] Một chiếc gương soi để bàn hình chữ nhật, khung gỗ mỏng, có chân đỡ phía sau, đứng trên nền trơn, vẽ chéo; mặt gương chỉ phản chiếu nền trơn; không tròn, không có cán (để không giống kính lúp); cùng cỡ trong khung như đèn pin và kính lúp; không có người trong gương, không có chữ.
image.alt.en: A mirror on a stand
image.alt.vi: Chiếc gương soi để bàn
> A2 (SK-043, 14/11): hình cũ (gương tròn có cán) trông giống kính lúp, bé không nhận ra khi thẻ không có nhãn. Đổi sang gương chữ nhật để bàn; nhãn giữ. Designer vẽ lại.

#### option q1_magnifier
correct: true
label.en: magnifying glass
label.vi: kính lúp
image.brief: [hình vẽ] Một chiếc kính lúp cán đen đặt trên nền trơn, vẽ chéo; khác hình từ vựng `magnifying_glass` (kính đó cán gỗ viền vàng); cùng cỡ trong khung như đèn pin và gương; không có chữ, không có logo. Bài ba câu q1 và bài năm câu q1 dùng lại ảnh này. Từ khoá tìm ảnh (EN): magnifying glass black handle plain background
image.alt.en: A magnifying glass
image.alt.vi: Chiếc kính lúp

### q2
id: 5476d4dc-f109-4a81-b478-ae3de363be8c
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `magnifying_glass`. Từ khoá tìm ảnh (EN): magnifying glass plain background
image.alt.en: A magnifying glass
image.alt.vi: Chiếc kính lúp
sentence.en: Granite has lots of shiny {1}.
sentence.vi: Đá hoa cương có nhiều {1} lấp lánh.
answers: q2_grains
hint.en: Think of granite under a magnifying glass.
hint.vi: Em nhớ lại đá hoa cương khi soi kính lúp nhé.
explanation_correct.en: Granite's shiny grains are big enough to see.
explanation_correct.vi: Hạt lấp lánh của đá hoa cương to, nhìn thấy được.
explanation_wrong.en: Granite is full of shiny grains you can see.
explanation_wrong.vi: Đá hoa cương có nhiều hạt lấp lánh nhìn thấy được.
> A2 (SK-043, 14/11): câu điền bỏ "nhiều màu" cho ngắn (còn tám chữ có ô trống); ý "nhiều màu" còn ở ví dụ ô Hạt.
> Gợi ý không gọi tên ô "Grains" (trùng nhãn đáp án). Hình câu hỏi là kính lúp, không phải ảnh đá hoa cương (ảnh đó cho thấy hạt).
> Ba thẻ là ba món ăn quen ở Việt Nam minh hoạ ba từ: bánh bò nhiều lỗ, bánh lớp, hạt gạo. Cùng là hình vẽ đồ ăn (theo hình designer 11/11); không thẻ nào là hình bé vừa thấy ở phần Học. Thẻ đúng ở chỗ thứ ba.

#### bank q2_holes
label.en: holes
label.vi: lỗ
feedback.en: Under a magnifying glass, granite has no holes.
feedback.vi: Soi kính lúp, đá hoa cương không có lỗ.
image.brief: [hình vẽ] Một miếng bánh bò cắt ngang, thấy rõ nhiều lỗ nhỏ bên trong, đặt trên đĩa trắng, vẽ gần; không có bao bì, không có chữ. Từ khoá tìm ảnh (EN): banh bo honeycomb cake cross section
image.alt.en: A steamed cake full of holes
image.alt.vi: Bánh bò có nhiều lỗ

#### bank q2_layers
label.en: layers
label.vi: lớp
feedback.en: Granite is not stacked in flat layers.
feedback.vi: Đá hoa cương không xếp thành từng lớp.
image.brief: [hình vẽ] Hai đĩa bánh lớp hấp (bánh da lợn), một đĩa lớp hồng xen trắng, một đĩa lớp xanh xen trắng, thấy rõ các lớp; cùng nét với bánh bò và hạt gạo của hai thẻ kia; không có chữ.
image.alt.en: Layered cakes on plates
image.alt.vi: Bánh nhiều lớp trên đĩa
> Theo hình designer 11/11: không có ảnh bánh bò hợp lệ, nên vẽ cả ba thẻ cho cùng một loại hình; thẻ này không còn dùng lại ảnh `layer` của *Bề mặt Trái Đất*.

#### bank q2_grains
label.en: grains
label.vi: hạt
image.brief: [hình vẽ] Một nắm hạt gạo trắng rải trên nền trơn tối màu, vẽ gần thấy rõ từng hạt; không có bao bì, không có chữ. Từ khoá tìm ảnh (EN): white rice grains close up
image.alt.en: Grains of rice
image.alt.vi: Những hạt gạo

### q3
id: a83a8c83-c5fb-4294-a5ae-477a4fbf93b8
format: multi_choice
version: 1
dok: 2
prompt.en: Which rocks have tiny holes?
prompt.vi: Những hòn đá nào có lỗ nhỏ li ti?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `explore_look`. Từ khoá tìm ảnh (EN): magnifying glass on rock
image.alt.en: A magnifying glass on a rock
image.alt.vi: Kính lúp đặt trên hòn đá
hint.en: Look closely at the surface of each rock.
hint.vi: Em nhìn thật kỹ mặt từng hòn đá nhé.
explanation_correct.en: Gas bubbles in the lava left these tiny holes.
explanation_correct.vi: Bọt khí trong dung nham để lại những lỗ nhỏ này.
explanation_wrong.en: Pumice and basalt both have tiny holes.
explanation_wrong.vi: Đá bọt và đá ba-dan đều có lỗ nhỏ li ti.
> DOK 2: quan sát và phân loại bốn mẫu đá theo một đặc điểm nhìn được. Đá hoa cương (lốm đốm) và sa thạch (sần hạt cát) dễ bị nhìn nhầm là có lỗ. Bốn ảnh đều là mẫu đá bé đã gặp ở phần Học hoặc phần Chơi, cùng nền kem. `alt` chỉ tả màu.
> Rà chữ tester 11/11 (n2): giữ. Gợi ý đã là cách nhìn, không trỏ tên ô; ô "Holes" phải gọi tên đá bọt và đá ba-dan vì đó là hai đá bài dạy, và bé vẫn phải nhìn ảnh để ghép tên với mẫu.

#### option q3_granite
correct: false
feedback.en: Granite has grains, not holes.
feedback.vi: Đá hoa cương có hạt, không có lỗ.
label.en: granite
label.vi: đá hoa cương
image.brief: Dùng lại hình `granite`. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám

#### option q3_pumice
correct: true
label.en: pumice
label.vi: đá bọt
image.brief: Dùng lại hình `pumice`. Từ khoá tìm ảnh (EN): pumice rock sample
image.alt.en: A pale grey rock
image.alt.vi: Hòn đá màu xám nhạt

#### option q3_basalt
correct: true
label.en: basalt
label.vi: đá ba-dan
image.brief: Dùng lại hình `tray_dark_rock` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): basalt vesicular rock sample
image.alt.en: A dark rock
image.alt.vi: Hòn đá sẫm màu
> `alt` đổi so với chỗ gốc để không nói "có lỗ".

#### option q3_sandstone
correct: false
feedback.en: Sandstone shows sand grains and layers.
feedback.vi: Sa thạch có hạt cát và vân lớp.
label.en: sandstone
label.vi: sa thạch
image.brief: Dùng lại hình `tray_sandstone`. Từ khoá tìm ảnh (EN): sandstone rock sample layers
image.alt.en: A yellow-brown rock
image.alt.vi: Hòn đá màu vàng nâu

### q4
id: e1173ae0-20a6-4daf-b027-bbf24bb4aaac
format: single_choice
version: 1
dok: 2
prompt.en: Which rock is made of thin, flat sheets?
prompt.vi: Hòn đá nào gồm nhiều tấm mỏng xếp chồng?
image.brief: Dùng lại hình `quarry` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): open pit stone quarry terraces
image.alt.en: An open quarry
image.alt.vi: Mỏ đá lộ thiên
hint.en: Look closely at the edge of each rock.
hint.vi: Em nhìn kỹ mép của từng hòn đá nhé.
explanation_correct.en: Slate splits along its layers into thin, flat sheets.
explanation_correct.vi: Đá phiến tách theo lớp thành từng tấm mỏng, phẳng.
explanation_wrong.en: The edge of slate shows many thin sheets.
explanation_wrong.vi: Mép đá phiến có nhiều tấm mỏng xếp chồng.
> A2 (SK-043, 14/11): câu hỏi cũ mười chín chữ ("Hòn đá của Nam…"), bỏ nhân vật Nam, còn chín chữ.
> DOK 2: so một mô tả với vẻ ngoài của ba mẫu đá. Câu hỏi không nói màu, để bé không chọn theo màu. Đá hoa cương hồng (lốm đốm) và đá phấn (trắng, chưa học ở bài này) là hai mẫu không có lớp. Ảnh hình câu hỏi là mỏ đá, không cho thấy hòn đá của Nam.
> [CẦN KIỂM] Đá phiến tách được thành tấm mỏng (ghi chú ô `explore_layers`).
> Rà chữ tester 11/11 (n2): câu hỏi tả điều nhìn thấy ("made of thin, flat sheets") thay vì nhắc ví dụ ô Học; gợi ý đổi từ tên ô "Layers" sang cách nhìn (mép đá). Ảnh `tray_slate` phải thấy rõ mép tách lớp (brief gốc đã dặn).

#### option q4_slate
correct: true
label.en: slate
label.vi: đá phiến
image.brief: Dùng lại hình `tray_slate`. Từ khoá tìm ảnh (EN): slate rock sample
image.alt.en: A dark grey rock
image.alt.vi: Hòn đá màu xám sẫm

#### option q4_pink_granite
correct: false
feedback.en: Pink granite has grains, but no thin sheets.
feedback.vi: Đá hoa cương hồng có hạt, không tách thành tấm.
label.en: pink granite
label.vi: đá hoa cương hồng
image.brief: Dùng lại hình `tray_pink_granite`. Từ khoá tìm ảnh (EN): pink granite rock sample
image.alt.en: A pink rock
image.alt.vi: Hòn đá màu hồng

#### option q4_chalk
correct: false
feedback.en: This chalk is soft and does not split into sheets.
feedback.vi: Đá phấn mềm, không tách thành tấm mỏng.
label.en: chalk
label.vi: đá phấn
image.brief: Dùng lại hình `chalk` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): chalk rock sample
image.alt.en: A white rock
image.alt.vi: Hòn đá màu trắng

### q5
id: 89a1dab5-e215-4fa7-8ecc-f8f6b593e8d3
format: single_choice
version: 1
dok: 2
prompt.en: Which one is a real rock?
prompt.vi: Thứ nào là đá thật?
image.brief: Dùng lại hình `rock` ở bài `be-mat-trai-dat/ben-trong-trai-dat`. Từ khoá tìm ảnh (EN): limestone karst Ninh Binh river
image.alt.en: A grey rocky mountain
image.alt.vi: Núi đá vôi màu xám
hint.en: Think about where each one comes from.
hint.vi: Em nghĩ xem mỗi thứ từ đâu mà có nhé.
explanation_correct.en: The pebble is real rock, worn smooth by water.
explanation_correct.vi: Hòn cuội là đá thật, được nước mài nhẵn.
explanation_wrong.en: Only the pebble is real rock from nature.
explanation_wrong.vi: Chỉ hòn cuội là đá thật có sẵn trong tự nhiên.
> A2 (SK-043, 14/11): bỏ câu ngữ cảnh "Ba thứ này trông hơi giống đá" (câu hỏi cũ mười lăm chữ, nay năm chữ); ba ảnh tự cho thấy điều đó.
> DOK 2: nhìn kỹ để phân biệt đá thật với thứ trông giống đá (ôn bài một: đá có sẵn trong tự nhiên). Đường phèn lấp lánh như đá hoa cương, bọt biển có lỗ như đá bọt.
> Đường phèn và bọt biển là ảnh của phần Chơi; hòn cuội là ảnh của *Hô hấp*, mới với bài này. Ba ảnh chụp, cùng là một vật chụp gần.

#### option q5_sugar
correct: false
feedback.en: People make sugar crystals from cane sugar.
feedback.vi: Đường phèn do người nấu từ đường mía.
label.en: sugar crystal
label.vi: cục đường phèn
image.brief: Dùng lại hình `tray_rock_sugar`. Từ khoá tìm ảnh (EN): rock sugar crystal lump
image.alt.en: Clear lumps
image.alt.vi: Mấy cục trong suốt

#### option q5_pebble
correct: true
label.en: pebble
label.vi: hòn cuội
image.brief: Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): smooth pebble stone sand
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội
> Theo hình designer 11/11: hòn cuội của bài một nay là hình vẽ, mà câu này toàn ảnh, nên trỏ ảnh hòn cuội của *Hô hấp*. Ảnh đó có nền cát: designer cắt sát quanh hòn cuội để nền cát không làm hòn cuội nổi bật (hai lựa chọn kia trên nền trơn).

#### option q5_sponge
correct: false
feedback.en: A kitchen sponge is soft and made in factories.
feedback.vi: Bọt biển rửa bát mềm, do nhà máy làm ra.
label.en: sponge
label.vi: miếng bọt biển
image.brief: Dùng lại hình `tray_sponge`. Từ khoá tìm ảnh (EN): yellow kitchen sponge close up
image.alt.en: A kitchen sponge
image.alt.vi: Miếng bọt biển rửa bát

### q6
id: 3c05c4da-a72b-4036-beb6-fcbd9f71663d
format: true_false
version: 1
dok: 3
misconception: rocks_all_look_same
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: Both are grey, but they are different kinds of rock.
statement.vi: Cùng màu xám, nhưng đây là hai loại đá khác nhau.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
image.brief: [sơ đồ ghép ảnh] Ghép hai mẫu đá cạnh nhau trên cùng nền kem, cùng cỡ: `tray_dark_rock` ở bài `be-mat-trai-dat/nui-lua` (đá ba-dan xám sẫm có lỗ) và `tray_slate` (đá phiến xám sẫm); hai hòn cùng tông xám; không có chữ, không có mũi tên, không có khung chia.
image.alt.en: Two grey rocks side by side
image.alt.vi: Hai hòn đá xám đặt cạnh nhau
hint.en: Think about what makes each kind of rock different.
hint.vi: Em nghĩ xem điều gì làm các loại đá khác nhau nhé.
explanation_correct.en: Only one has holes, so colour is not enough.
explanation_correct.vi: Chỉ một hòn có lỗ, nên nhìn màu thôi chưa đủ.
explanation_wrong.en: Look for grains, holes and layers, not just colour.
explanation_wrong.vi: Em nhìn hạt, lỗ và lớp, không chỉ nhìn màu.
feedback_false.en: One rock has holes, and the other does not.
feedback_false.vi: Một hòn có lỗ nhỏ, hòn kia thì không có.
> DOK 3: bé đánh giá kết luận của Na trên hai hòn đá mới đặt cạnh nhau (chưa từng thấy ghép như vậy). Bé còn tin "đá nào cũng như nhau" sẽ cho rằng cùng màu là cùng loại và chọn "Na chưa đúng". Lời Na đúng chữ bảng "Câu sáu, lời Na" ở `_topic.md`. Đáp án Đúng.
> Hình ghép là tình huống Na đang nhìn; `alt` không nói "có lỗ". Cả màn mười tám từ EN (prompt ba, instruction bốn, lời Na mười một).

## Từ vựng

### compare
id: ff8cd737-9bdb-4f59-b329-3832122c13d9
tier: core
term.en: compare
term.vi: so sánh
example.en: Compare the two rocks. What is different?
example.vi: Em so sánh hai hòn đá. Chúng khác nhau ở điểm nào?
image.brief: Dùng lại hình `q1`. Từ khoá tìm ảnh (EN): rock collection table top view
image.alt.en: Many different rocks on a table
image.alt.vi: Nhiều hòn đá khác nhau trên bàn

### grain
id: 70a236cc-0d25-41a9-ba8b-5d65d1157f77
tier: core
term.en: grain
term.vi: hạt
example.en: Look closely to see the tiny grains.
example.vi: Em nhìn kỹ để thấy những hạt nhỏ.
image.brief: Dùng lại hình `granite`. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám
> Câu ví dụ khác câu điền từ q2, để q2 không chỉ là nhớ lại câu ví dụ. Bài mười hai, mười bốn dùng lại chữ "grain" cho hạt đất.

### magnifying_glass
id: 02403333-a370-4e7c-8b4c-247c42ffa35f
tier: core
term.en: magnifying glass
term.vi: kính lúp
example.en: A magnifying glass makes things look bigger.
example.vi: Kính lúp làm mọi vật trông to hơn.
image.brief: [hình vẽ] Một chiếc kính lúp tròn cán gỗ, viền vàng, đặt trên nền trơn, vẽ thẳng từ trên xuống; không có tay người, không có chữ, không có logo. Câu q2 (hình câu hỏi), bài ba câu w1, bài năm câu w2, bài mười hai (ô "Feel and look"), bài mười lăm (ô "Fieldwork") dùng lại ảnh này. Từ khoá tìm ảnh (EN): magnifying glass plain background
image.alt.en: A magnifying glass
image.alt.vi: Chiếc kính lúp

### granite
id: e36bb76e-411c-4f59-8c9b-ff777718236b
tier: extra
term.en: granite
term.vi: đá hoa cương
example.en: Grey granite looks spotty and shiny.
example.vi: Đá hoa cương xám trông lốm đốm và lấp lánh.
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: ảnh cận cảnh mặt đá hoa cương xám lấm tấm hạt trắng, đen, xám (ảnh James St. John, CC BY 2.0), cắt theo hình một hòn đá, thêm sáng tối nhẹ và bóng, đặt giữa nền trắng ngà chung (không có ảnh mẫu cầm tay hợp lệ); thấy rõ các hạt; không có nhãn số, thước, tay người, chữ. Ô explore_grains, món tray_granite, câu q3, từ grain, bài ba (ô explore_hard, món Chơi, câu q4), bài bốn (ô explore_minerals, câu w1), bài sáu, bài bảy, bài chín dùng lại hình này. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám
> `alt` chỉ tả màu (không "lốm đốm", "có hạt"), vì nhiều câu ở bài này và bài sau dùng lại ảnh để hỏi về hạt hay độ cứng.

### pumice
id: 1297b2c7-831a-4696-bd64-a96f01fb73f5
tier: extra
term.en: pumice
term.vi: đá bọt
example.en: Pumice is a light rock with many holes.
example.vi: Đá bọt là loại đá nhẹ, có nhiều lỗ.
image.brief: [sơ đồ ghép ảnh] Bộ mẫu đá: mẫu đá bọt xám nhạt (ảnh James St. John, CC BY 2.0) tách khỏi nền ảnh gốc, đặt giữa nền trắng ngà chung, có bóng mềm; thấy rõ vô số lỗ nhỏ trên mặt; không có nhãn số, thước, tay người, chữ. Ô explore_holes, món tray_pumice, câu q3, bài ba (thẻ câu q2), bài sáu, bài mười hai dùng lại hình này. Từ khoá tìm ảnh (EN): pumice rock sample
image.alt.en: A pale grey rock
image.alt.vi: Hòn đá màu xám nhạt

## Thưởng

### pumice_card
id: c305e47a-3545-4020-badb-c7b738da44e0
set: rocks
rarity: common
name.en: Pumice
name.vi: Đá bọt
tag.en: Once hot lava
tag.vi: Từng là dung nham
fact.en: Pumice is so light that many pieces float on water.
fact.vi: Đá bọt nhẹ tới mức nhiều hòn nổi được trên mặt nước.
> [CẦN KIỂM] Đá bọt nổi được vì có rất nhiều lỗ khí kín bên trong; không phải hòn nào cũng nổi, và hòn ngấm nước lâu sẽ chìm (biên tập nhớ). Chữ nói "nhiều hòn", không nói "mọi hòn".
image.brief: [hình vẽ] Vài hòn đá bọt nổi trên mặt nước trong một chậu thuỷ tinh, vẽ gần, cùng nét cốc nước của bài năm; không có người, không có tay, không có chữ. Ảnh khác ảnh mẫu `pumice` (thẻ cho thấy điều thú vị: đá nổi). Từ khoá tìm ảnh (EN): pumice floating on water
image.alt.en: Pumice floating on water
image.alt.vi: Đá bọt nổi trên mặt nước

## Ghi chú cho hoạ sĩ

- **Loại hình (theo hình designer 11/11):** kệ Chơi và câu q3, q4, q5 là ảnh (năm mẫu đá gốc là hình ghép một phần: mẫu tách nền đặt trên nền trắng ngà); ô `explore_look`, câu q1, ba thẻ q2, từ `magnifying_glass`, thẻ `pumice_card` và hình `q1` là hình tự vẽ; câu q6 là hình ghép. Mỗi câu một loại hình. Hình không có chữ. Danh sách dưới đây là danh sách cần tìm lúc soạn; số thật: ba ảnh nguồn mới, mười hình vẽ, sáu hình ghép.
- **Bộ mẫu đá (gốc ở bài này):** `granite` (đá hoa cương xám), `tray_pink_granite`, `pumice`, `tray_sandstone`, `tray_slate`. Năm mẫu cùng nền kem, cùng góc chụp chéo nhẹ, cùng cỡ trong khung; ảnh khác nền thì tách nền, ghi `changes`. Ảnh `tray_dark_rock` của *Núi lửa* (đá ba-dan) cũng nên đưa về cùng nền này khi đặt cạnh năm mẫu kia (kệ Chơi, câu q3, hình ghép q6); nếu phải làm bản tách nền thì ghi vào file chọn ảnh của bài này.
- **Ảnh cần tìm (mười bảy):**
  - Học: kính lúp trên hòn đá (`explore_look`).
  - Chơi: bọt biển vàng, khúc gỗ cưa ngang, cục đường phèn; ba mẫu đá `tray_pink_granite`, `tray_sandstone`, `tray_slate`.
  - Quiz: bàn bày nhiều hòn đá (`q1`); đèn pin, gương soi để bàn hình chữ nhật (đổi 14/11, A2), kính lúp cán đen (q1); bánh bò, nắm hạt gạo (thẻ q2).
  - Từ vựng: kính lúp (`magnifying_glass`), đá hoa cương xám (`granite`), đá bọt (`pumice`).
  - Thưởng: đá bọt nổi trên mặt nước.
- **Hình ghép (một):** câu q6, đá ba-dan và đá phiến cạnh nhau, cùng tông xám.
- **Dùng lại trong bài:** `granite` (ô `explore_grains`, món `tray_granite`, câu q3, từ `grain`); `pumice` (ô `explore_holes`, món `tray_pumice`, câu q3); `tray_sandstone` (ô `explore_layers`, câu q3); `tray_slate` (câu q4, hình ghép q6); `tray_pink_granite` (câu q4); `tray_rock_sugar`, `tray_sponge` (câu q5); `explore_look` (câu q3); `magnifying_glass` (câu q2); `q1` (từ `compare`).
- **Dùng lại từ bài khác:** bài một `explore_around` (w1), `quarry` (w1, q4), `tray_concrete` (w2); bài ba `chalk` (q4, dùng trước khi bài ba có ảnh, cùng một ảnh gốc); *Khủng long* `trai-dat-rat-lau-ve-truoc/q2_rice` (w1); *Bề mặt Trái Đất* `dat-va-nuoc-tren-trai-dat/tray_pond` (w1), `nui-lua/tray_dark_rock` (món Chơi, q3, hình ghép q6), `ben-trong-trai-dat/rock` (q5); *Hô hấp* `vi-sao-ta-phai-tho/w1_stone` (q5).
- **Khó tìm và phương án thay:**
  - Đá phiến thấy rõ mép tách lớp: nếu ảnh mẫu đá phiến chỉ thấy một mặt phẳng, chọn ảnh chụp chéo có mép. Không dùng ảnh mái lợp đá phiến (để dành bài sáu, và Oak dùng ví dụ mái nhà).
  - Bánh bò: ảnh bánh bò trên Commons ít; thay bằng ảnh lát bánh mì nhiều lỗ hay miếng bánh bông lan cắt ngang (cùng ý "lỗ"), giữ là đồ ăn chụp gần cho cùng kiểu với hai thẻ kia.
  - Kính lúp cán đen ở q1 phải khác ảnh từ vựng (khác kiểu kính hoặc góc chụp).
- **Cùng kiểu trong một câu:** w1 ba ảnh cảnh rộng ngoài trời; q1 ba hình vẽ dụng cụ; q2 ba hình vẽ đồ ăn; q3, q4 mẫu đá cùng nền trắng ngà; q5 ba ảnh vật chụp gần.
- **Màu:** Học: nhìn kỹ `gi_dong`, hạt `vang_hoe`, lỗ `do_son`, lớp `cham`. Chơi: hạt lấp lánh `vang_hoe`, có lỗ nhỏ `do_son`, có từng lớp `cham`, nhóm `limit` `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` mỗi nhóm hai món, một nhóm `limit` ba món, chín món.
  - Khởi động: `single_choice` (w1), `true_false` (w2, đáp án Sai); cả hai ôn bài một.
  - Quiz: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6, `speaker: na`, đáp án Đúng). Bốn format.
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `rocks_all_look_same`.
- **Vị trí đáp án đúng:** w1 thứ nhất; q1 thứ ba; thẻ đúng q2 thứ ba; q3 thứ hai và thứ ba; q4 thứ nhất; q5 thứ hai. Đúng bảng ở `_topic.md`.
- **Tham chiếu:** `recall_from.lesson` trỏ `da-va-dat/lam-quen-voi-da` (w1, w2); bài một phải có id trước.
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Đá hoa cương hồng, Đá bọt, Sa thạch → đạt;
  - chạm Cục đường phèn → `has_limited`;
  - chạm Đá hoa cương xám, Đá hoa cương hồng, Đá phiến (thiếu nhóm có lỗ) → `missing.tray_holes`; chạm Đá ba-dan → `full`; bỏ Đá hoa cương xám, đặt Đá ba-dan → đạt.
- **Dòng điều kiện màn Chơi:** "Cần đủ Hạt lấp lánh, Có lỗ nhỏ, Có từng lớp · Không phải đá".
- **Số từ EN trên một màn:**
  - Học khoảng hai mươi tám từ: mục tiêu 8, hướng dẫn 3, bốn nhãn 5, câu dài nhất 10, ô Từ mới 2.
  - Khởi động và Quiz: nhiều nhất là q5 (khoảng mười tám: câu hỏi 14, ba nhãn 4) và q6 (mười tám).
- **Thí nghiệm ở nhà (chỉ ghi cho người duyệt, schema v1 chưa có block):** nhặt vài hòn cuội ở vườn hay bãi sông cùng người lớn, soi bằng kính lúp, tìm hạt, lỗ, lớp; không đập đá.
- **Từ EN có thể ngoài Starters/Movers:** compare, grain, magnifying glass, granite, pumice, basalt, sandstone, slate, chalk, layer, lava, pebble, sponge, log, crystal, torch, mirror, spotty. Tên đá đều có hình đi kèm.
- **Giọng đọc:** chuỗi VI không có chữ số, ký hiệu, dấu "—". Nghe thử VI "ba-dan" và EN "pumice", "basalt", "granite".
