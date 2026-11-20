---
id: a960bee5-74c1-47d1-bdcf-f93222442d28
topic: lon-len
slug: con-vat-doi-hinh-dang
order: 4
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Animals that change shape
vi: Con vật đổi hình dạng
> Giữ đúng tên ở `content/syllabus.json` (key `new-life`, bài số bốn).

## Mục tiêu
en: I can tell how frogs and butterflies change.
vi: Em kể được con ếch, con bướm đổi hình dạng ra sao.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 18/11/2026. Ticket SK-053. Mọi dòng `id:` để trống; chạy `ids` sau bài 3 (Khởi động w2 trỏ bài 3; hình `explore_calf` của bài 2).
> Ticket ghi "I can tell how a frog and a butterfly change." (mười từ); đổi sang số nhiều còn tám từ. Câu VI giữ đúng ticket.
> Sườn: Oak Y2 *New life* L4 `changes-in-animal-life-cycles` (vòng đời cho thấy con vật lớn lên, thay đổi; ví dụ trứng ếch → nòng nọc → ếch con → ếch) và misconception của L2 (con non không phải lúc nào cũng là bản thu nhỏ của bố mẹ; sâu và bướm, nòng nọc và ếch). Ý "có con không giống bố mẹ" của L1 nằm ở bài này. Bỏ phần "ghi lại bằng ảnh, nhật ký, theo dõi nhiều ngày" của L4 (SK-053). Không chép câu, hình, ví dụ của sườn.
> Ranh giới (SK-053): *Gọi tên và nhóm động vật* bài 4 đã dạy ếch đẻ trứng trong nước, "A tadpole is a baby frog", và câu q4 xếp trứng ếch → nòng nọc → ếch. Bài này nhắc lại ở Khởi động w1; phần mới là **các chặng giữa** (nòng nọc mọc chân, ếch con còn đuôi) và **vòng đời con bướm**. Câu xếp thứ tự ở đây là sâu → nhộng → bướm, không lặp câu của bài đó.
> Bướm: dùng đúng một loài cho cả bốn hình (bướm cải trắng *Pieris rapae*, cùng loài với ảnh sâu của *Chuỗi thức ăn* bài 2). Chữ bé nghe nói "this caterpillar" · "con sâu này", không nói con sâu nào cũng thành bướm. Dùng "chrysalis" · "nhộng"; không dùng chữ chỉ tổ tơ của tằm, bướm đêm.

## Ý chính
1.en: Some babies look like their parents.
1.vi: Có con non giống bố mẹ.
2.en: A tadpole grows into a frog.
2.vi: Nòng nọc lớn lên thành con ếch.
3.en: This caterpillar becomes a butterfly.
3.vi: Con sâu này lớn lên thành con bướm.
> Lệch chữ "Bảng soạn": ý ba "A caterpillar becomes a butterfly." đổi "A" thành "This" cho khớp câu VI "Con sâu này" và luật SK-053 (nhiều loài sâu thành bướm đêm).
> Từ cụ thể tới trừu tượng: con non giống mẹ (nghé), con non khác hẳn mẹ (nòng nọc), rồi một vòng đời có bốn hình rất khác nhau (bướm).

## Khởi động

> Hai câu. w1 ôn *Gọi tên và nhóm động vật* bài 4 (ếch đẻ trứng trong nước), theo SK-053; câu mới. Không ôn *Chuỗi thức ăn* bài 2 vì câu q1 của bài đó đã hỏi "What is food for a caterpillar?". w2 ôn bài 3 hôm trước (vịt con nở từ trứng vịt).

### w1
id: 7a3c80d9-82c6-4fb4-8c26-ce4284b6d1bc
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/ca-va-luong-cu
prompt.en: Frogs lay their eggs in water.
prompt.vi: Ếch đẻ trứng dưới nước.
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước
answer: true
hint.en: Think of where tadpoles swim.
hint.vi: Em nghĩ xem nòng nọc bơi ở đâu nhé.
explanation_correct.en: Yes! Tadpoles hatch from them in the water.
explanation_correct.vi: Đúng rồi! Nòng nọc nở ra từ trứng ở dưới nước.
explanation_wrong.en: This is true. Frog eggs float in water.
explanation_wrong.vi: Câu này đúng. Trứng ếch nổi dưới nước.
feedback_false.en: Frog eggs float in ponds and rice fields.
feedback_false.vi: Trứng ếch nổi trên ao, trên ruộng.
> Câu mới; bài nguồn có ví dụ "they lay eggs in water" ở ô Amphibians, không có câu hỏi này.

### w2
id: 78a44c81-b527-422c-9c9d-23e21d807d5e
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: lon-len/con-vat-de-trung
prompt.en: What hatches from a duck egg?
prompt.vi: Từ quả trứng vịt nở ra con gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Each egg hatches its own kind of baby.
hint.vi: Trứng của con nào thì nở ra con non của con ấy.
explanation_correct.en: Yes! Ducklings hatch from duck eggs.
explanation_correct.vi: Đúng rồi! Vịt con nở ra từ trứng vịt.
explanation_wrong.en: The answer is the ducklings. They become ducks.
explanation_wrong.vi: Đáp án là đàn vịt con. Vịt con lớn lên thành vịt.
> Lựa chọn sai là nòng nọc (cũng nở từ trứng, nhưng trứng ếch), không phải gà con (lông vàng giống vịt con, khó phân biệt bằng mắt; luật Explorer số bảy).

#### option w2_ducklings
correct: true
label.en: ducklings
label.vi: vịt con
image.brief: Dùng lại hình `explore_ducklings` ở bài `lon-len/con-vat-de-trung`. Từ khoá tìm ảnh (EN): ducklings
image.alt.en: Fluffy yellow babies
image.alt.vi: Những con non lông vàng
> `alt` riêng ở chỗ này (`alt` gốc "A group of fluffy ducklings" có chữ "duck" của câu hỏi); ảnh, key giữ như hình gốc.
> 19/11 bỏ "on the grass" · "trên cỏ": ảnh thật chụp đàn vịt con trong hộp, không có cỏ (designer, SK-053 mục 3).

#### option w2_tadpoles
correct: false
feedback.en: Tadpoles hatch from frog eggs.
feedback.vi: Nòng nọc nở ra từ trứng ếch.
label.en: tadpoles
label.vi: nòng nọc
image.brief: Dùng lại hình `explore_tadpoles` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): tadpoles swimming shallow water
image.alt.en: Tadpoles in water
image.alt.vi: Nòng nọc dưới nước

## Học

> Bốn ô: nghé giống mẹ (con non giống bố mẹ), vòng đời ếch, con sâu bướm cải trắng, vòng đời bướm. Ô 2 và ô 4 là hình ghép dạng vòng tròn từ ảnh chụp và mũi tên (SK-053 quyết định 8), không chữ.
> Lời dặn an toàn ở ô Caterpillar: chỉ nhìn, không sờ sâu (sâu róm gây ngứa). Không câu nào rủ bé bắt ếch, nòng nọc, sâu.

### explore
id: 7452b3ea-0b0a-4651-9074-e10a0deafdd6
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_like
label.en: Like mum
label.vi: Giống mẹ
color: vang_hoe
sentence.en: Some babies look like their parents.
sentence.vi: Có con non trông giống bố mẹ.
image.brief: Dùng lại hình `explore_calf` ở bài `lon-len/con-vat-de-con`. Từ khoá tìm ảnh (EN): water buffalo calf suckling
image.alt.en: A buffalo calf drinking milk
image.alt.vi: Nghé đang bú sữa
examples.1.en: a calf looks like a small buffalo
examples.1.vi: nghé trông như con trâu nhỏ
examples.2.en: a kitten looks like a small cat
examples.2.vi: mèo con trông như con mèo nhỏ
examples.3.en: some babies look very different
examples.3.vi: có con non trông khác hẳn bố mẹ
> Ví dụ ba dẫn sang ô 2, 3, 4. "Bố mẹ" ở đây nói về con vật (SK-053 chỉ tránh giả định ở người).

#### group explore_frog
label.en: Tadpole to frog
label.vi: Nòng nọc thành ếch
color: cham
sentence.en: A tadpole grows into a frog.
sentence.vi: Nòng nọc lớn lên thành con ếch.
image.brief: [sơ đồ ghép ảnh] Khung vuông, năm ảnh tròn cùng cỡ xếp thành một vòng theo chiều kim đồng hồ: trứng ếch (`q4_eggs` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`), nòng nọc (`explore_tadpoles` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`), nòng nọc mọc chân (`tray_tadpole_legs`), ếch con còn đuôi (`tray_froglet`), ếch (`q4_frog` ở bài `khung-long/khung-long-la-gi`); giữa hai ảnh liền nhau là một mũi tên cong chỉ theo chiều kim đồng hồ, mũi tên cuối từ ếch về trứng ếch; nền giấy trơn; không chữ, không số, không nét viền.
image.alt.en: Frog eggs, tadpoles and frogs in a circle
image.alt.vi: Trứng ếch, nòng nọc và ếch xếp thành vòng
examples.1.en: tiny eggs hatch into tadpoles
examples.1.vi: trứng ếch nở thành nòng nọc
examples.2.en: tadpoles grow legs
examples.2.vi: nòng nọc mọc chân
examples.3.en: the tail gets shorter
examples.3.vi: đuôi ngắn dần
examples.4.en: a young frog hops onto land
examples.4.vi: ếch con nhảy lên bờ
> Năm ảnh nên cùng một nhóm ếch (SK-053; ếch đồng hay họ ếch nhái thật). Ảnh trứng ếch, nòng nọc, ếch đã có từ chủ đề số một; designer ghi loài của từng ảnh, không khớp thì báo content-editor.
> Ảnh thật (designer 19/11, SK-053 mục 9): năm ảnh khác loài nhưng đều là ếch, không có cóc (trứng *Rana*, nòng nọc mọc chân, ếch con chưa rõ loài, ếch *Hoplobatrachus rugulosus*). Đã rà: chữ bé nghe nói "a tadpole", "a frog" chung, không nói cùng một con; giữ chữ. Lượt 2 (19/11, tester B3): designer đổi ảnh nòng nọc mọc chân sang ảnh chân sau thấy rõ (không ghi loài) và ghép lại hình vòng; `alt` "A tadpole with tiny back legs" · "Nòng nọc mới nhú hai chân sau" vẫn đúng. Không câu hỏi nào bắt bé nhìn ra chân trong ảnh.
> [CẦN KIỂM] Ếch: trứng → nòng nọc → nòng nọc mọc hai chân sau, rồi hai chân trước → ếch con còn đuôi (đuôi tiêu dần, không rụng) → ếch.

#### group explore_caterpillar
label.en: Caterpillar
label.vi: Con sâu
color: gi_dong
sentence.en: This caterpillar hatched from a tiny egg.
sentence.vi: Con sâu này nở ra từ một quả trứng nhỏ xíu.
image.brief: Dùng lại hình `explore_plant_food` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): cabbage white caterpillar eating leaf
image.alt.en: A caterpillar on a cabbage leaf
image.alt.vi: Con sâu trên lá cải
examples.1.en: it eats cabbage leaves
examples.1.vi: sâu ăn lá cải
examples.2.en: it grows bigger and bigger
examples.2.vi: sâu lớn dần, lớn dần
examples.3.en: look, but do not touch it
examples.3.vi: em chỉ nhìn, không sờ vào sâu nhé
> Ảnh gốc đã ghi loài *Pieris rapae* (file chọn ảnh `chuoi-thuc-an-la-gi.json`).
> Ví dụ ba là lời dặn an toàn (SK-053: sâu róm gây ngứa).
> [CẦN KIỂM] Sâu bướm cải trắng nở từ trứng đẻ trên lá cây họ cải, ăn lá cải.

#### group explore_butterfly
label.en: Butterfly
label.vi: Con bướm
color: nau_dat
sentence.en: This caterpillar becomes a butterfly.
sentence.vi: Con sâu này lớn lên thành con bướm.
image.brief: [sơ đồ ghép ảnh] Khung vuông, bốn ảnh tròn cùng cỡ xếp thành một vòng theo chiều kim đồng hồ: trứng bướm cải trắng trên mặt lá cải (phần cần tìm mới), sâu (`explore_plant_food` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`), nhộng (`tray_chrysalis`), bướm (`q4_butterfly`); giữa hai ảnh liền nhau là một mũi tên cong chỉ theo chiều kim đồng hồ, mũi tên cuối từ bướm về trứng; nền giấy trơn; không chữ, không số, không nét viền. Cả bốn phần là bướm cải trắng (*Pieris rapae*). Nếu không có ảnh trứng hợp lệ thì designer vẽ riêng phần trứng (SK-053 quyết định 8). Từ khoá cho trứng bướm: Pieris rapae eggs; cabbage white butterfly eggs leaf
image.alt.en: Eggs, caterpillar, chrysalis and butterfly in a circle
image.alt.vi: Trứng, sâu, nhộng và bướm xếp thành vòng
examples.1.en: the caterpillar makes a chrysalis
examples.1.vi: con sâu hoá thành nhộng
examples.2.en: a butterfly comes out
examples.2.vi: con bướm chui ra từ nhộng
examples.3.en: it lays eggs on cabbage
examples.3.vi: bướm đẻ trứng trên lá cải
> Ý chính ba. Ví dụ ba nối về chặng đầu: vòng đời lại bắt đầu.
> [CẦN KIỂM] Bướm cải trắng: trứng → sâu → nhộng → bướm; "nhộng" là tên đúng cho chặng này của bướm; EN "chrysalis" (hay "pupa") cho trẻ năm tới bảy tuổi; bướm cải trắng đẻ trứng trên lá cây họ cải.

### new_words
id: ef235ee8-bc53-4a29-a74d-a99bbad49343
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: tadpole, caterpillar, butterfly

## Chơi

> Bé chọn ba con sẽ còn đổi hình dạng: một ếch non (nòng nọc, nòng nọc mọc chân hoặc ếch con còn đuôi), một con sâu, một cái nhộng. Đạt khi đủ ba nhóm và không chọn con non đã giống mẹ.
> Món bẫy: mèo con và nghé, trông giống mẹ, lớn lên chỉ to ra (ý ô Like mum). Kệ bảy món, toàn ảnh chụp (`tray_froglet` là ảnh; nếu designer phải vẽ thì đổi món này khỏi kệ, xem Ghi chú cho hoạ sĩ).

### tray
id: b2981d91-4c5d-4719-895d-9a231fa7e791
type: build_tray
version: 1
prompt.en: They will change shape
prompt.vi: Sẽ còn đổi hình dạng
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a young frog, a caterpillar, a chrysalis.
messages.start.vi: Em tìm một ếch non, một con sâu và một cái nhộng nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! All three will change shape.
messages.balanced.vi: Tuyệt! Cả ba sẽ còn đổi hình dạng.
messages.has_limited.en: That baby already looks like its mum.
messages.has_limited.vi: Con non này đã giống mẹ rồi.
messages.missing.tray_young_frog.en: You still need a young frog.
messages.missing.tray_young_frog.vi: Em còn thiếu một ếch non.
messages.missing.tray_larva.en: You still need a caterpillar.
messages.missing.tray_larva.vi: Em còn thiếu một con sâu.
messages.missing.tray_pupa.en: You still need a chrysalis.
messages.missing.tray_pupa.vi: Em còn thiếu một cái nhộng.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (mèo con, nghé).

#### group tray_young_frog
label.en: Young frog
label.vi: Ếch non
color: cham
role: required

#### group tray_larva
label.en: Caterpillar
label.vi: Con sâu
color: gi_dong
role: required

#### group tray_pupa
label.en: Chrysalis
label.vi: Nhộng
color: nau_dat
role: required

#### group tray_like_mum
label.en: Like mum
label.vi: Giống mẹ
color: do_son
role: limit

#### item tray_tadpoles
label.en: Tadpoles
label.vi: Nòng nọc
group: tray_young_frog
image.brief: Dùng lại hình `explore_tadpoles` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): tadpoles swimming shallow water
image.alt.en: Tadpoles in water
image.alt.vi: Nòng nọc dưới nước

#### item tray_kitten
label.en: Kitten
label.vi: Mèo con
group: tray_like_mum
image.brief: Dùng lại hình `q4` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): kitten sitting floor looking up
image.alt.en: A kitten looking up
image.alt.vi: Mèo con ngẩng đầu nhìn lên

#### item tray_chrysalis
label.en: Chrysalis
label.vi: Nhộng
group: tray_pupa
image.brief: [ảnh] Một cái nhộng bướm cải trắng (*Pieris rapae*) màu xanh lá hay nâu nhạt bám trên thân cây, cành nhỏ hay mặt tường, chụp gần thấy rõ dáng nhộng; đúng loài; nhộng trần, không bọc tơ; không tay, không chữ. Ảnh vuông hoặc ngang có khoảng trống (món Chơi, thẻ `order_sequence`, phần ghép `explore_butterfly`, thẻ từ 2:1). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): Pieris rapae chrysalis; Pieris rapae pupa; cabbage white chrysalis
image.alt.en: A chrysalis on a leaf
image.alt.vi: Cái nhộng nằm trên lá
> Loài trong ảnh phải khớp trang gốc (SK-053). Không dùng ảnh tổ tơ của tằm, bướm đêm.
> Ảnh thật (designer 19/11, SK-053 mục 4): nhộng *Pieris rapae* màu nâu nhạt nằm trên mặt lá. `alt` đổi từ "A green chrysalis on a stem" · "Cái nhộng xanh trên thân cây" (ở món này, thẻ q4, từ `chrysalis`); câu ví dụ từ `chrysalis` đổi "on a stem" thành "on a leaf". Không câu bé nghe nào nói nhộng "xanh".

#### item tray_caterpillar
label.en: Caterpillar
label.vi: Con sâu
group: tray_larva
image.brief: Dùng lại hình `explore_plant_food` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): cabbage white caterpillar eating leaf
image.alt.en: A caterpillar on a cabbage leaf
image.alt.vi: Con sâu trên lá cải

#### item tray_tadpole_legs
label.en: Tadpole with legs
label.vi: Nòng nọc mọc chân
group: tray_young_frog
image.brief: [ảnh] Một con nòng nọc to đã mọc hai chân sau, đuôi còn dài, bơi hay nằm trong nước trong, chụp ngang gần thấy rõ hai chân; cùng nhóm ếch với `q4_frog` nếu được; không tay, không chữ. Ảnh vuông hoặc ngang có khoảng trống (món Chơi, phần ghép `explore_frog`, thẻ từ 2:1). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): tadpole with legs; tadpole hind legs; frog tadpole legs
image.alt.en: A tadpole with tiny back legs
image.alt.vi: Nòng nọc mới nhú hai chân sau
> 19/11 `alt` đổi từ "A tadpole with two back legs" · "Nòng nọc đã mọc hai chân sau" (ảnh lượt 1 chân rất mờ). Lượt 2: ảnh mới chụp từ trên xuống trong suối nông, hai chân sau có bàn chân thấy rõ ở gốc đuôi (tester B3, designer lượt 2); `alt` hiện tại vẫn đúng, giữ. Món này thuộc nhóm Ếch non như nòng nọc.

#### item tray_calf
label.en: Calf
label.vi: Nghé
group: tray_like_mum
image.brief: Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): water buffalo calf standing field
image.alt.en: A baby buffalo in a field
image.alt.vi: Nghé con trên đồng

#### item tray_froglet
label.en: Young frog
label.vi: Ếch con
group: tray_young_frog
image.brief: [ảnh] Một con ếch con đã có đủ bốn chân, còn một đoạn đuôi ngắn, ngồi trên lá hay mép nước, chụp gần thấy rõ đuôi; cùng nhóm ếch với `q4_frog` nếu được; không tay, không chữ. Ảnh vuông hoặc ngang (món Chơi, phần ghép `explore_frog`). Nếu không có ảnh hợp lệ thì designer vẽ (SK-053 quyết định 8) và bỏ món này khỏi kệ (giữ trong hình ghép). Từ khoá tìm ảnh (EN): froglet with tail; young frog tail; metamorphosing froglet
image.alt.en: A young frog with a short tail
image.alt.vi: Ếch con còn đuôi ngắn

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Sai, q3 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.

### q1
id: a9bc5447-351c-4cde-bb96-5c0fe1966a69
format: single_choice
version: 1
dok: 1
prompt.en: Which one becomes a butterfly?
prompt.vi: Con nào sẽ thành con bướm?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of who eats the cabbage leaves.
hint.vi: Em nghĩ xem con nào ăn lá cải nhé.
explanation_correct.en: Yes! This caterpillar becomes a butterfly.
explanation_correct.vi: Đúng rồi! Con sâu này lớn lên thành con bướm.
explanation_wrong.en: The answer is the caterpillar on the cabbage.
explanation_wrong.vi: Đáp án là con sâu trên lá cải.
> DOK 1: nhớ lại ô Caterpillar, ô Butterfly. Con giun là lựa chọn sai gần (thân dài, mềm như sâu). Không dùng lại câu "Which one is a baby frog?" (bài 4 q3 của chủ đề số một).
> Lựa chọn đúng là ảnh sâu đứng một mình; câu nói về "con sâu này" qua `explanation_correct`.

#### option q1_worm
correct: false
feedback.en: A worm stays a worm as it grows.
feedback.vi: Con giun lớn lên vẫn là con giun.
label.en: worm
label.vi: con giun
image.brief: Dùng lại hình `q1_worm` ở bài `goi-ten-va-nhom-dong-vat/con-vat-an-gi`. Từ khoá tìm ảnh (EN): earthworm on moist soil
image.alt.en: A worm on the soil
image.alt.vi: Con giun trên đất
> [CẦN KIỂM] Giun đất lớn lên không đổi hình dạng.

#### option q1_caterpillar
correct: true
label.en: caterpillar
label.vi: con sâu
image.brief: Dùng lại hình `explore_plant_food` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): cabbage white caterpillar eating leaf
image.alt.en: A caterpillar on a cabbage leaf
image.alt.vi: Con sâu trên lá cải

#### option q1_tadpoles
correct: false
feedback.en: Tadpoles grow into frogs.
feedback.vi: Nòng nọc lớn lên thành ếch.
label.en: tadpoles
label.vi: nòng nọc
image.brief: Dùng lại hình `explore_tadpoles` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): tadpoles swimming shallow water
image.alt.en: Tadpoles in water
image.alt.vi: Nòng nọc dưới nước

### q2
id: a1059422-0f93-4679-b27d-60ffa742ea1f
format: true_false
version: 1
dok: 1
prompt.en: A tadpole grows into a fish.
prompt.vi: Nòng nọc lớn lên thành con cá.
image.brief: Dùng lại hình `explore_tadpoles` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): tadpoles swimming shallow water
image.alt.en: Tadpoles in water
image.alt.vi: Nòng nọc dưới nước
answer: false
hint.en: Remember the tadpole that grew legs.
hint.vi: Em nhớ lại chú nòng nọc mọc chân nhé.
explanation_correct.en: A tadpole grows into a frog.
explanation_correct.vi: Nòng nọc lớn lên thành con ếch.
explanation_wrong.en: This is false. Tadpoles grow into frogs.
explanation_wrong.vi: Câu này sai. Nòng nọc lớn lên thành ếch.
feedback_true.en: A tadpole grows legs. Fish have fins.
feedback_true.vi: Nòng nọc mọc chân, còn cá có vây.
> DOK 1: nhớ lại ý chính hai. Nòng nọc bơi trong nước, có đuôi, dễ bị nghĩ là cá con. `explanation_correct` là ý chính hai, đứng một mình được.

### q3
id: b18fb193-614f-4603-827a-677bafd23ef2
format: true_false
version: 1
dok: 1
prompt.en: This butterfly lays eggs on cabbage.
prompt.vi: Con bướm này đẻ trứng trên lá cải.
image.brief: Dùng lại hình `q4_butterfly`. Từ khoá tìm ảnh (EN): Pieris rapae
image.alt.en: A white butterfly on a flower
image.alt.vi: Con bướm trắng trên bông hoa
answer: true
hint.en: Think of where this caterpillar eats.
hint.vi: Em nghĩ xem con sâu này ăn ở đâu nhé.
explanation_correct.en: Yes! Then tiny caterpillars hatch out.
explanation_correct.vi: Đúng rồi! Rồi sâu non nhỏ xíu nở ra.
explanation_wrong.en: This is true. Its eggs go on cabbage.
explanation_wrong.vi: Câu này đúng. Con bướm này đẻ trứng trên lá cải.
feedback_false.en: Its caterpillars hatch on cabbage leaves.
feedback_false.vi: Sâu non nở ra ngay trên lá cải.
> DOK 1: nhớ lại ví dụ ba ô Butterfly. Câu nói về con bướm cải trắng trong hình: "This butterfly" · "Con bướm này", theo quy ước "con sâu này" của chủ đề (tester N2, 19/11); không nói bướm nào cũng đẻ trứng trên lá cải.
> [CẦN KIỂM] Bướm cải trắng đẻ trứng trên lá cây họ cải (cải bắp, cải xanh).

### q4
id: a1b3e43f-cbbf-410e-915b-2942b9ee50a2
format: order_sequence
version: 1
dok: 2
prompt.en: Start with the caterpillar. Put them in order.
prompt.vi: Bắt đầu từ con sâu. Em xếp theo thứ tự nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_caterpillar, q4_chrysalis, q4_butterfly
hint.en: A chrysalis stays very still.
hint.vi: Cái nhộng nằm yên một chỗ.
explanation_correct.en: Yes! Then the butterfly lays new eggs.
explanation_correct.vi: Đúng rồi! Rồi bướm lại đẻ trứng mới.
explanation_wrong.en: The order is caterpillar, chrysalis, then butterfly.
explanation_wrong.vi: Thứ tự là con sâu, cái nhộng, rồi con bướm.
> DOK 2: xếp ba chặng của bướm cải trắng theo "Bảng soạn" SK-053 (sâu → nhộng → bướm); sâu là chặng vừa nở. Không lặp câu q4 trứng ếch → nòng nọc → ếch của chủ đề số một. Gợi ý tả thẻ nhộng, không nhắc vị trí thẻ (SK-047; tester N4, 19/11). Thẻ trong file không theo thứ tự đúng.
> Ba thẻ là ảnh chụp cùng loài *Pieris rapae*.

#### item q4_butterfly
label.en: butterfly
label.vi: con bướm
image.brief: [ảnh] Một con bướm cải trắng (*Pieris rapae*) đậu trên bông hoa hay lá, cánh trắng có chấm đen, chụp gần nhìn nghiêng hay từ trên xuống, thấy cả con; đúng loài; không tay, không chữ. Ảnh vuông hoặc ngang có khoảng trống (thẻ `order_sequence`, khung 4:3 câu q3, phần ghép `explore_butterfly`, thẻ từ 2:1, thẻ thưởng vuông; bài 5 w2 dùng lại). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): Pieris rapae; cabbage white butterfly; small white butterfly
image.alt.en: A white butterfly on a flower
image.alt.vi: Con bướm trắng trên bông hoa

#### item q4_caterpillar
label.en: caterpillar
label.vi: con sâu
image.brief: Dùng lại hình `explore_plant_food` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): cabbage white caterpillar eating leaf
image.alt.en: A caterpillar on a cabbage leaf
image.alt.vi: Con sâu trên lá cải

#### item q4_chrysalis
label.en: chrysalis
label.vi: cái nhộng
image.brief: Dùng lại hình `tray_chrysalis`. Từ khoá tìm ảnh (EN): Pieris rapae chrysalis
image.alt.en: A chrysalis on a leaf
image.alt.vi: Cái nhộng nằm trên lá

### q5
id: 739152a2-9b2a-4dc5-bdfc-46af27e01a17
format: single_choice
version: 1
dok: 2
prompt.en: Which baby looks like its parents?
prompt.vi: Con non nào trông giống bố mẹ?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Picture each baby's mum or dad.
hint.vi: Em hình dung bố mẹ của từng con non nhé.
explanation_correct.en: Yes! A kitten looks like a small cat.
explanation_correct.vi: Đúng rồi! Mèo con trông như con mèo nhỏ.
explanation_wrong.en: The answer is the kitten. It looks like mum.
explanation_wrong.vi: Đáp án là mèo con. Mèo con trông giống mèo mẹ.
> DOK 2: so mỗi con non với bố mẹ của nó (bé phải tự hình dung ếch, bướm). Ba ảnh bé đã gặp ở kệ Chơi hôm nay.

#### option q5_tadpoles
correct: false
feedback.en: Tadpoles have tails. Frogs have four legs.
feedback.vi: Nòng nọc có đuôi, còn ếch có bốn chân.
label.en: tadpoles
label.vi: nòng nọc
image.brief: Dùng lại hình `explore_tadpoles` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): tadpoles swimming shallow water
image.alt.en: Tadpoles in water
image.alt.vi: Nòng nọc dưới nước

#### option q5_kitten
correct: true
label.en: kitten
label.vi: mèo con
image.brief: Dùng lại hình `q4` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): kitten sitting floor looking up
image.alt.en: A kitten looking up
image.alt.vi: Mèo con ngẩng đầu nhìn lên

#### option q5_caterpillar
correct: false
feedback.en: A caterpillar has no wings yet.
feedback.vi: Con sâu chưa có cánh.
label.en: caterpillar
label.vi: con sâu
image.brief: Dùng lại hình `explore_plant_food` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): cabbage white caterpillar eating leaf
image.alt.en: A caterpillar on a cabbage leaf
image.alt.vi: Con sâu trên lá cải

### q6
id: d5bb6854-6fcb-46b3-945e-d3ac5651f185
format: true_false
version: 1
dok: 2
misconception: young_look_like_parents
prompt.en: A baby animal always looks like its parents.
prompt.vi: Con non nào cũng giống bố mẹ.
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước
answer: false
hint.en: Think of a frog when it was young.
hint.vi: Em nghĩ xem lúc nhỏ, con ếch trông thế nào nhé.
explanation_correct.en: A tadpole does not look like a frog.
explanation_correct.vi: Nòng nọc không giống con ếch.
explanation_wrong.en: This is false. Some babies look very different.
explanation_wrong.vi: Câu này sai. Có con non trông khác hẳn bố mẹ.
feedback_true.en: A caterpillar looks very different from a butterfly.
feedback_true.vi: Con sâu trông khác hẳn con bướm.
> Câu misconception (`young_look_like_parents`), DOK 2: bé nghĩ "con non là bản thu nhỏ của bố mẹ" sẽ chạm Đúng. Bé áp ô Tadpole to frog, ô Butterfly để bác.
> Hình là con ếch (con trưởng thành bé phải nghĩ ngược về lúc nhỏ), không phải nòng nọc; không tự làm bằng chứng. `explanation_correct` là đúng câu `correction` ở `_topic.md`. Chữ "always" giữ câu khẳng định.

## Từ vựng

### tadpole
id: 11f00afb-baa9-4f44-8869-6156b5202864
tier: core
term.en: tadpole
term.vi: nòng nọc
example.en: A tadpole grows legs, then hops out.
example.vi: Nòng nọc mọc chân, rồi nhảy lên bờ.
image.brief: Dùng lại hình `tray_tadpole_legs`. Từ khoá tìm ảnh (EN): tadpole with legs
image.alt.en: A tadpole with tiny back legs
image.alt.vi: Nòng nọc mới nhú hai chân sau
> Trùng có chủ ý: `tadpole` là từ `extra` ở *Gọi tên và nhóm động vật* bài 4; nâng lên `core` ở bài này. Hình khác (nòng nọc mọc chân) để thẻ hai bài không trùng hình.

### caterpillar
id: 9e76fc63-344d-4a80-873b-ecca402f18e5
tier: core
term.en: caterpillar
term.vi: con sâu
example.en: This caterpillar eats cabbage leaves.
example.vi: Con sâu này ăn lá cải.
image.brief: Dùng lại hình `explore_plant_food` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): cabbage white caterpillar eating leaf
image.alt.en: A caterpillar on a cabbage leaf
image.alt.vi: Con sâu trên lá cải
> Trùng có chủ ý: `caterpillar` là từ `extra` ở *Chuỗi thức ăn* bài 2; nâng lên `core` ở bài này (chặng của vòng đời bướm).

### butterfly
id: 72b07d32-67fd-4c39-9403-e8d5c37d547e
tier: core
term.en: butterfly
term.vi: con bướm
example.en: A butterfly comes out of a chrysalis.
example.vi: Con bướm chui ra từ cái nhộng.
image.brief: Dùng lại hình `q4_butterfly`. Từ khoá tìm ảnh (EN): Pieris rapae
image.alt.en: A white butterfly on a flower
image.alt.vi: Con bướm trắng trên bông hoa

### chrysalis
id: bf16b52b-6bc5-4f7b-9ca0-41535dd046c6
tier: extra
term.en: chrysalis
term.vi: nhộng
example.en: The chrysalis stays still on a leaf.
example.vi: Cái nhộng nằm yên trên lá.
image.brief: Dùng lại hình `tray_chrysalis`. Từ khoá tìm ảnh (EN): Pieris rapae chrysalis
image.alt.en: A chrysalis on a leaf
image.alt.vi: Cái nhộng nằm trên lá
> [CẦN KIỂM] "Chrysalis" hay "pupa" cho trẻ năm tới bảy tuổi; nhộng bướm cải trắng bám yên một chỗ.

## Thưởng

### butterfly_card
id: 9f1db0a4-00a9-443c-b3e4-8576dd643307
set: life_cycles
rarity: rare
name.en: Cabbage white
name.vi: Bướm cải trắng
tag.en: From caterpillar to wings
tag.vi: Từ con sâu tới đôi cánh
fact.en: Butterflies taste food with their feet.
fact.vi: Bướm nếm thức ăn bằng chân.
image.brief: Dùng lại hình `q4_butterfly`. Từ khoá tìm ảnh (EN): Pieris rapae
image.alt.en: A white butterfly on a flower
image.alt.vi: Con bướm trắng trên bông hoa
> Bộ `set: life_cycles`. Thẻ nối thẻ `caterpillar_card` (*Chuỗi thức ăn* bài 2, fact "This caterpillar will turn into a butterfly."). Không trùng thẻ đã có.
> [CẦN KIỂM] Bướm có cơ quan nếm ở chân; tên EN thẻ "Cabbage white" (hay "Small white").

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp thật, cộng hai hình ghép dạng vòng tròn (ô `explore_frog`, ô `explore_butterfly`). Hình tự vẽ chỉ khi không có ảnh hợp lệ (SK-053 quyết định 8): ếch con còn đuôi (`tray_froglet`), trứng bướm cải trắng (phần của `explore_butterfly`).
- **Ảnh mới, hình gốc của cả chủ đề (giữ đúng key, `alt`, truy vấn đầu ở `_topic.md`):** nhộng bướm cải trắng (`tray_chrysalis`), bướm cải trắng (`q4_butterfly`; bài 5 w2 dùng lại), nòng nọc mọc chân (`tray_tadpole_legs`).
- **Ảnh mới chỉ dùng ở bài này:** ếch con còn đuôi (`tray_froglet`), trứng bướm cải trắng trên lá cải (chỉ là phần của hình ghép `explore_butterfly`).
- **Mỗi chuỗi một loài (SK-053):** bốn hình bướm (trứng, sâu `explore_plant_food`, nhộng, bướm) đều là *Pieris rapae*; năm hình ếch (trứng `q4_eggs`, nòng nọc `explore_tadpoles`, nòng nọc mọc chân, ếch con, ếch `q4_frog`) cùng một nhóm ếch. Ghi loài của ảnh mới ở mục `note` file chọn ảnh; loài trên trang gốc không khớp thì báo content-editor. Ảnh đã chọn 19/11: bướm đủ bốn hình *Pieris rapae* (nhộng nâu nhạt trên lá); năm hình ếch khác loài nhưng đều là ếch, chữ không nói cùng một con.
- **Hình ghép (hai):** `explore_frog` năm ảnh tròn, `explore_butterfly` bốn ảnh tròn, xếp vòng theo chiều kim đồng hồ, mũi tên cong, không chữ (brief ở ô Học). Nếu `tray_froglet` là hình vẽ thì hình ghép `explore_frog` trộn ảnh và một hình vẽ: được, vì ô Học được trộn (khuôn *Cây quanh em*), nhưng khi đó bỏ món `tray_froglet` khỏi kệ Chơi (kệ toàn ảnh chụp).
- **Ảnh dùng lại:** *Gọi tên và nhóm động vật* bài 1 `w1` (hàng rào tre), `q4` mèo con (món Chơi, q5), bài 2 `q3` nghé (món Chơi), bài 4 `explore_tadpoles` (w2, món Chơi, q1, q2, q5, phần ghép), `q4_eggs` (phần ghép), bài 6 `q1_worm` (q1); *Chuỗi thức ăn* bài 2 `explore_plant_food` (ô Caterpillar, món Chơi, q1, q4, q5, từ `caterpillar`, phần ghép); bài 2 chủ đề này `explore_calf` (ô Like mum); bài 3 chủ đề này `explore_ducklings` (w2 `alt` riêng); Discoverer *Khủng long* `q4_frog` (w1, q6, phần ghép).
- **`alt` riêng:** w2 `w2_ducklings` dùng `explore_ducklings` với `alt` "Fluffy yellow babies" · "Những con non lông vàng" (19/11 bỏ "on the grass" · "trên cỏ" vì ảnh không có cỏ).
- **Không có:** tay người cầm sâu, ếch, nòng nọc; sâu róm; tổ tơ của tằm hay bướm đêm; bướm bị ghim, mẫu vật khô.
- **Màu:** Học: giống mẹ `vang_hoe`, nòng nọc thành ếch `cham`, con sâu `gi_dong`, con bướm `nau_dat`. Chơi: ếch non `cham`, con sâu `gi_dong`, nhộng `nau_dat`, giống mẹ `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (tadpole, caterpillar, butterfly). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `true_false` (w1 Đúng), `single_choice` hai lựa chọn (w2). Quiz `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Sai, q3 Đúng, q6 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`young_look_like_parents`). Không có `labels` ở câu `true_false`.
- **`order_sequence` q4:** thứ tự đúng `q4_caterpillar`, `q4_chrysalis`, `q4_butterfly`.
- **Màn Chơi, ví dụ để kiểm:** Nòng nọc, Con sâu, Nhộng → `balanced`; Ếch con, Con sâu, Nhộng → `balanced`; Nòng nọc, Nòng nọc mọc chân, Con sâu → `missing.tray_pupa`; Mèo con, Con sâu, Nhộng → `has_limited`.
- **Hình ghép:** `explore_frog`, `explore_butterfly` (mục `composed` trong file chọn ảnh).
- **Khởi động trỏ:** w1 → `goi-ten-va-nhom-dong-vat/ca-va-luong-cu` (đã có id), w2 → `lon-len/con-vat-de-trung` (chạy `ids` bài 3 trước).
- **Thưởng:** `set: life_cycles`, `rarity: rare`.
- **Từ EN có thể ngoài Starters/Movers:** tadpole, caterpillar, butterfly, chrysalis, cabbage, hatch, ducklings, worm, wings, calf.
