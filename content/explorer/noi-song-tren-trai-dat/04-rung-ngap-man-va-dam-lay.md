---
id: bb7e1de6-9fe2-49ab-b015-65c570375d2d
topic: noi-song-tren-trai-dat
slug: rung-ngap-man-va-dam-lay
order: 4
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Mangroves and swamps
vi: Rừng ngập mặn và đầm lầy
> Giữ đúng tên ở `content/syllabus.json` (key `new-habitats-around-the-world`, bài số bốn).

## Mục tiêu
en: I can name animals of wet, muddy places.
vi: Em kể được tên con vật sống ở nơi đất ngập nước.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 16/11/2026. Ticket SK-048. Mọi dòng `id:` để trống; chạy `ids` sau bài 3 (câu w1 trỏ tới bài 3).
> Bài ngoài sườn Oak Địa lý KS1 (Địa lý KS1 không có đầm lầy, rừng ngập mặn); mục tiêu, ý chính theo `_topic.md`.
> Nối *Sinh vật sống ở đâu?* bài bốn, năm (rừng ngập mặn, cá thòi lòi, rễ đước giữ bùn, nước biển lên rồi rút): chỉ dùng lại ở Khởi động, ảnh và kệ Chơi, không dạy lại. Ý mới của bài: đầm lầy nước ngọt, so nước mặn với nước ngọt, và những con vật sống ở nơi lầy lội.
> Sửa `swamps_have_no_life` ở ý chính ba, ô Học "Swamp" (ví dụ ba), "Fiddler crab", "Crane", phần Chơi và câu q6 (gắn key).

## Ý chính
1.en: Some places are wet and muddy.
1.vi: Có những nơi đất ngập nước, đầy bùn.
2.en: Mangrove water is salty. Swamp water is fresh.
2.vi: Nước rừng ngập mặn thì mặn. Nước đầm lầy thì ngọt.
3.en: Birds, fish and crabs live in muddy places.
3.vi: Chim, cá và cua sống ở nơi bùn lầy.
> Từ cụ thể tới trừu tượng: nơi nhìn thấy (đất ngập nước, bùn), điều phân biệt hai nơi (nước mặn, nước ngọt), rồi ý chung sửa misconception (nơi lầy lội đầy con vật).
> **Lệch `_topic.md`:** ý ba EN đổi "live in the mud" thành "live in muddy places". Lý do: chim (sếu, cò) không sống trong bùn; câu mới khớp phụ đề VI "ở nơi bùn lầy" và lệnh phần Chơi "Pick three animals from muddy places" (một ý một chữ). Phiên chính sửa dòng bài 4 ở mục Tổng quan.
> [CẦN KIỂM] Nước ở rừng ngập mặn là nước mặn hoặc lợ (bài nói "mặn", và ô Học nói nước biển làm nước ở đó mặn; từ 16/11 không còn nói "mặn như nước biển"); đầm lầy trong bài là đầm lầy nước ngọt (kiểu Tràm Chim, Láng Sen).

## Khởi động

> Hai câu: w1 ôn bài 3 (bài trước, "sống trên cây cao"); w2 ôn *Sinh vật sống ở đâu?* bài năm (mốc khoảng hai, ba tuần; ví dụ "the sea comes in and goes out" ở ô "In salty mud"), dẫn vào ô Học đầu tiên hôm nay.

### w1
id: 616ddefc-4b14-418c-967d-5f1bc3333b33
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/rung-mua-nhiet-doi
prompt.en: Which one lives high in the trees?
prompt.vi: Con nào sống trên cây cao?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at where each animal is.
hint.vi: Em nhìn xem mỗi con vật đang ở đâu nhé.
explanation_correct.en: Yes! A gibbon swings from branch to branch.
explanation_correct.vi: Đúng rồi! Vượn đu từ cành này sang cành khác.
explanation_wrong.en: The answer is the gibbon. Gibbons live up in trees.
explanation_wrong.vi: Đáp án là con vượn. Vượn sống trên cây cao.
> Ôn ý chính ba của bài 3 ("Many animals live high in the trees."). Hai con bé gặp ở bài 3, khác nhau rõ bằng mắt (vượn trên cây, ếch nhỏ trên lá rụng). Gợi ý trỏ tới chỗ mỗi con đang ở trong ảnh, không gọi tên con nào.

#### option w1_gibbon
correct: true
label.en: gibbon
label.vi: con vượn
image.brief: Dùng lại hình `tray_gibbon` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Nomascus gabriellae
image.alt.en: A gibbon with long arms
image.alt.vi: Con vượn có đôi tay dài
> **Lệch `_topic.md` (chỉ ở chỗ này):** `alt` gốc "A gibbon in a tree" · "Con vượn trên cây" có chữ "tree" của câu hỏi (mục Lỗi hay gặp, số mười hai); TEMPLATE cho sửa `alt` ở chỗ dùng lại để khỏi lộ đáp án. Nếu ảnh bài 3 chọn không thấy rõ đôi tay, designer báo để đổi `alt`.

#### option w1_dart_frog
correct: false
feedback.en: This tiny frog lives on the ground.
feedback.vi: Chú ếch nhỏ này sống trên mặt đất.
label.en: poison dart frog
label.vi: ếch phi tiêu độc
image.brief: Dùng lại hình `explore_ground` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Dendrobates
image.alt.en: A tiny frog on fallen leaves
image.alt.vi: Con ếch nhỏ trên lá rụng
> `feedback.vi` sửa 16/11 (tester C1): "dưới mặt đất" thành "trên mặt đất", khớp chữ của bài 3.

### w2
id: 68c864fa-a4eb-47bc-9eea-893271333406
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/noi-song-cua-cay
prompt.en: The sea comes into the mangrove forest.
prompt.vi: Nước biển tràn vào rừng ngập mặn.
image.brief: Dùng lại hình `explore_mangrove` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): mangrove forest roots mud Vietnam
image.alt.en: Mangrove trees in the mud
image.alt.vi: Rừng cây đước trên bùn
answer: true
hint.en: Look at the water around the roots.
hint.vi: Em nhìn nước quanh những bộ rễ cây nhé.
explanation_correct.en: Yes! The sea comes in, then goes out.
explanation_correct.vi: Đúng rồi! Nước biển tràn vào, rồi lại rút ra.
explanation_wrong.en: This is true. Sea water fills the mangrove.
explanation_wrong.vi: Câu này đúng. Nước biển tràn vào rừng ngập mặn.
feedback_false.en: Mangrove roots stand in salty sea water.
feedback_false.vi: Rễ cây rừng ngập mặn đứng trong nước biển mặn.
> Câu mới, không chép câu hỏi của bài đó. Ảnh rừng đước lúc nước ròng (ảnh gốc chụp ở Indonesia, `brief` và `alt` không ghi tên nơi; dòng từ khoá chép nguyên của chỗ gốc). Ảnh thấy nước nông quanh rễ, không làm bằng chứng mạnh cho phía nào.
> [CẦN KIỂM] Nước triều lên, xuống mỗi ngày ở rừng ngập mặn (như dòng `[CẦN KIỂM]` của bài gốc).

## Học

> Bốn ô: hai nơi (rừng ngập mặn nước mặn, đầm lầy nước ngọt), rồi hai con vật Việt Nam sống ở nơi lầy lội (con còng trong bùn, con sếu ở chỗ nước nông).
> Ô "Mangrove" dùng lại ảnh và nhãn của *Sinh vật sống ở đâu?* bài bốn, nhưng câu chính và ba ví dụ đều mới (không chép "trees with roots in water", "soft, wet mud", "crabs dig holes in the mud", "strong roots hold the mud", "fish hide between the roots"). Câu chính ô "Fiddler crab" gần với một ví dụ cũ của bài đó; ở đây là bé gặp lại, có ảnh con còng thật.
> Không có cá sấu ở Học, để câu q5 là DOK 2. Không dạy mùa (sếu về Tràm Chim theo mùa khô).

### explore
id: dec4fb79-afd2-49e8-88ab-f985331c6704
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_mangrove
label.en: Mangrove
label.vi: Rừng ngập mặn
color: nau_dat
sentence.en: Sea water makes mangrove water salty.
sentence.vi: Nước biển làm cho nước ở rừng ngập mặn có vị mặn.
image.brief: Dùng lại hình `explore_mangrove` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): mangrove forest roots mud Vietnam
image.alt.en: Mangrove trees in the mud
image.alt.vi: Rừng cây đước trên bùn
examples.1.en: where rivers meet the sea
examples.1.vi: nơi sông chảy ra biển
examples.2.en: big mangrove forests in Vietnam
examples.2.vi: Việt Nam có những rừng ngập mặn rộng lớn
examples.3.en: egrets rest on the branches
examples.3.vi: cò đậu nghỉ trên cành cây
> Câu chính sửa 16/11 (tester n9): bản trước "Mangrove water is salty, like the sea." · "… thì mặn, giống nước biển." nói nước ở đây mặn bằng nước biển, trong khi phần lớn là nước lợ (nước sông pha nước biển). Câu mới nói vì sao nước mặn (nước biển tràn vào, như câu w2), vẫn có chữ "salty" cho câu q4, không so độ mặn với biển.
> Ví dụ hai là sự thật chung về Việt Nam, không gán tên nơi cho ảnh (ảnh chụp ở Indonesia). Ví dụ ba để món Chơi "Egret" có chỗ dựa trong bài.
> [CẦN KIỂM] Rừng ngập mặn mọc ở cửa sông, ven biển (nơi sông gặp biển, nước lợ); Việt Nam có rừng ngập mặn lớn (Cần Giờ, Cà Mau); cò đậu nghỉ, làm tổ trong rừng ngập mặn (các sân chim Cà Mau).

#### group explore_swamp
label.en: Swamp
label.vi: Đầm lầy
color: cham
sentence.en: Swamp water is fresh, like a pond.
sentence.vi: Nước đầm lầy là nước ngọt, giống nước ao.
image.brief: [ảnh] Đầm lầy nước ngọt chụp rộng: mặt nước nông lấp ló giữa rất nhiều lá sen, vài bông sen, cỏ năng và cỏ cao mọc dày, xa xa có vài cây tràm hoặc bụi cây; ảnh ngang, trời sáng; không thấy con vật nào (ảnh là hình câu q2, q6 và lựa chọn sai câu q4, nên không làm bằng chứng cho câu nào); không có người, thuyền, nhà, cột điện, biển chữ hay chữ. Phải khác rõ ảnh ao làng có bèo (`ca-va-luong-cu` `q1`) ở cùng câu q4: đầm rộng, cây mọc dày, không thấy bờ ao. Không dùng rừng ngập mặn, ruộng lúa hay hồ sen trong công viên có lối đi. Ưu tiên Tràm Chim (Đồng Tháp) hoặc Láng Sen (Long An); nếu ảnh không chụp ở đó thì bỏ tên nơi, dùng đầm lầy nước ngọt khác. Từ khoá tìm ảnh (EN): freshwater marsh lotus; Tram Chim; lotus swamp
image.alt.en: A swamp with lotus plants
image.alt.vi: Đầm lầy có cây sen
examples.1.en: lotus and tall grass grow here
examples.1.vi: sen và cỏ cao mọc ở đây
examples.2.en: rain fills it with water
examples.2.vi: nước mưa đổ đầy đầm lầy
examples.3.en: frogs and fish live here
examples.3.vi: ếch và cá sống ở đây
> Hình gốc của cả chủ đề (bài 5 w1, bài 8 q4 và từ `habitat` dùng lại): giữ đúng key, `alt` và truy vấn đầu. Ví dụ ba mang ý sửa `swamps_have_no_life`; ví dụ hai cho bé lý do nước đầm lầy ngọt.
> `brief` sửa 16/11 theo ảnh thật (designer): bỏ "ở châu Á". Ảnh đã chọn là đầm sen nước ngọt xanh tốt ở Mỹ (lá sen phủ kín, vài bông sen, hàng cây phía sau, không thấy con vật); Tràm Chim, Láng Sen, Vân Long không có ảnh dùng được. Chữ bé nghe không nêu tên nơi nên không đổi; `alt` giữ.
> [CẦN KIỂM] Nước đầm lầy ngọt nhờ nước mưa và nước sông; sen, cỏ năng mọc ở đầm lầy nước ngọt; ếch, cá sống ở đó.

#### group explore_crab
label.en: Fiddler crab
label.vi: Con còng
color: vang_hoe
sentence.en: Fiddler crabs dig holes in the mud.
sentence.vi: Con còng đào hang trong bùn.
image.brief: [ảnh] Một con còng đực trên bãi bùn ướt, nhìn ngang hoặc hơi chếch từ trên xuống, thấy cả con, rõ một chiếc càng rất to và một càng nhỏ, có thể thấy miệng hang trên bùn; ảnh ngang có khoảng trống quanh con vật (dùng cả khung vuông ở Học, kệ Chơi và thẻ ba lựa chọn rất ngang câu q3); không có tay người, xô, chậu, chữ. Ưu tiên ảnh iNaturalist trên Commons (CC BY) chụp ở rừng ngập mặn hay bãi bùn châu Á. Từ khoá tìm ảnh (EN): fiddler crab; fiddler crab mud; fiddler crab mangrove
image.alt.en: A fiddler crab on the mud
image.alt.vi: Con còng trên bùn
examples.1.en: one claw is very big
examples.1.vi: một chiếc càng rất to
examples.2.en: runs into its hole to hide
examples.2.vi: chạy vào hang để trốn
examples.3.en: lives in mangrove mud
examples.3.vi: sống trong bùn rừng ngập mặn
> Hình gốc của cả chủ đề (bài 6 dùng lại ở q3_crab). Ví dụ ba nối con còng với ô "Mangrove".
> [CẦN KIỂM] Chỉ còng đực có một càng rất to; còng chạy vào hang khi bị động hay khi nước lên; còng sống ở bãi bùn rừng ngập mặn, ven biển. Tên VI "con còng" hay "con cáy" (mục Tên gọi).

#### group explore_crane
label.en: Crane
label.vi: Con sếu
color: gi_dong
sentence.en: Cranes find food in shallow water.
sentence.vi: Sếu kiếm ăn ở chỗ nước nông.
image.brief: [ảnh] Một con sếu đầu đỏ (hoặc một đôi) đứng hay bước trong đồng cỏ ngập nước nông, nhìn ngang, thấy cả con từ đầu tới chân: đầu và cổ trên màu đỏ, thân xám, chân dài đứng trong nước; chụp hơi xa để thấy chân; ảnh ngang có khoảng trống quanh con chim (dùng cả khung vuông ở Học, kệ Chơi, thẻ thưởng và thẻ ba lựa chọn rất ngang câu q1); chim hoang dã: không chuồng, lưới, vòng chân, người hay chữ; không có con mồi trong mỏ. Ưu tiên ảnh chụp ở Tràm Chim; ảnh Ấn Độ, Campuchia dùng được, khi đó `brief` và `alt` không ghi tên nơi. Từ khoá tìm ảnh (EN): Antigone antigone; sarus crane wetland
image.alt.en: A crane in shallow water
image.alt.vi: Con sếu đứng trong nước nông
examples.1.en: a red head and long legs
examples.1.vi: đầu màu đỏ và đôi chân dài
examples.2.en: walks slowly in the swamp
examples.2.vi: thong thả bước trong đầm lầy
examples.3.en: digs up grass roots to eat
examples.3.vi: đào rễ cỏ dưới bùn để ăn
> Hình gốc của cả chủ đề (thẻ thưởng, từ `crane`). Ví dụ hai dạy chữ "swamp" đi cùng con sếu, chỗ dựa cho câu q1 ("Which bird finds food in the swamp?"). Ví dụ ba nói con vật ăn gì ở mức nhẹ (ăn rễ cỏ), không chuỗi thức ăn.
> [CẦN KIỂM] Sếu đầu đỏ có đầu và cổ trên màu đỏ, chân dài; kiếm ăn ở chỗ nước nông; ở Tràm Chim sếu đào củ cỏ năng dưới bùn để ăn.

### new_words
id: df293d6f-2453-4bfb-aa09-6595c053e96c
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: swamp, mud

## Chơi

> Bé chọn ba con vật sống ở nơi lầy lội: một con cá, một con cua, một con chim. Đạt khi đủ ba nhóm và không chọn con vật nơi khác.
> Món bẫy giống một nhóm nhưng sống nơi khác: cá heo bơi như cá nhưng sống ngoài biển; chim hồng hoàng là chim của rừng mưa (bài 3); chim cánh cụt hoàng đế là chim của Nam Cực (bài 2). Bé phải nghĩ về nơi sống, không chọn theo dáng.
> Năm món đúng (cá thòi lòi, cá rô đồng, con còng, con sếu, con cò) cho bé thấy nơi lầy lội có rất nhiều con vật: sửa `swamps_have_no_life` thêm một lần bằng tay. Kệ tám món, toàn ảnh chụp.
> Không có bẫy giống nhóm "Cua" (tester n7, 16/11, giữ): cua đồng, cua biển bé quen đều hay sống ở bùn ruộng, bùn ven biển, nên một món bẫy "cua không sống ở nơi lầy lội" sẽ nước đôi. Hai bẫy chim (hồng hoàng, chim cánh cụt hoàng đế) khác nhau rõ về nơi sống (rừng, băng).

### tray
id: 0c6e9020-1a6b-4583-aba4-984fa27905c7
type: build_tray
version: 1
prompt.en: Pick three animals from muddy places
prompt.vi: Chọn ba con vật sống ở nơi lầy lội
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a fish, a crab and a bird.
messages.start.vi: Em tìm một con cá, một con cua và một con chim nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! They all live in muddy places.
messages.balanced.vi: Tuyệt! Cả ba con đều sống ở nơi lầy lội.
messages.has_limited.en: That one does not live in muddy places.
messages.has_limited.vi: Con này không sống ở nơi lầy lội.
messages.missing.tray_fish.en: You still need a fish.
messages.missing.tray_fish.vi: Em còn thiếu một con cá.
messages.missing.tray_crab.en: You still need a crab.
messages.missing.tray_crab.vi: Em còn thiếu một con cua.
messages.missing.tray_bird.en: You still need a bird.
messages.missing.tray_bird.vi: Em còn thiếu một con chim.
> Lời nhắn `has_limited` đúng với cả ba món bẫy (cá heo trong ảnh là cá heo biển khơi; chim hồng hoàng, chim cánh cụt hoàng đế). Lời nhắn `balanced` đúng với mọi bộ ba hợp lệ (cá rô đồng sống ở ruộng, đầm; cò kiếm ăn ở ruộng, đầm, rừng ngập mặn).
> [CẦN KIỂM] Vài loài cá heo (cá heo Irrawaddy) sống ở cửa sông, có khi vào vùng rừng ngập mặn; ảnh `tray_dolphin` là cá heo nhảy giữa biển khơi, nên lời nhắn đúng với ảnh.

#### group tray_fish
label.en: Fish
label.vi: Cá
color: cham
role: required

#### group tray_crab
label.en: Crab
label.vi: Cua
color: vang_hoe
role: required

#### group tray_bird
label.en: Bird
label.vi: Chim
color: gi_dong
role: required

#### group tray_not
label.en: Not from muddy places
label.vi: Không sống ở nơi lầy lội
color: do_son
role: limit

#### item tray_mudskipper
label.en: Mudskipper
label.vi: Cá thòi lòi
group: tray_fish
image.brief: Dùng lại hình `mudskipper` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): mudskipper on mud Periophthalmus
image.alt.en: A mudskipper by the water
image.alt.vi: Cá thòi lòi bên mép nước
> `alt` riêng của chủ đề (designer 16/11): ảnh thật là cá thòi lòi trên mỏm đá bùn ven nước; `alt` gốc ở *Sinh vật sống ở đâu?* bài bốn chưa đổi.

#### item tray_dolphin
label.en: Dolphin
label.vi: Cá heo
group: tray_not
image.brief: Dùng lại hình `tray_dolphin` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): dolphin jumping out of sea NOAA
image.alt.en: A dolphin jumping out of the sea
image.alt.vi: Cá heo nhảy lên khỏi mặt biển

#### item tray_fiddler_crab
label.en: Fiddler crab
label.vi: Con còng
group: tray_crab
image.brief: Dùng lại hình `explore_crab`. Từ khoá tìm ảnh (EN): fiddler crab
image.alt.en: A fiddler crab on the mud
image.alt.vi: Con còng trên bùn

#### item tray_hornbill
label.en: Hornbill
label.vi: Chim hồng hoàng
group: tray_not
image.brief: Dùng lại hình `tray_hornbill` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Buceros bicornis
image.alt.en: A hornbill on a branch
image.alt.vi: Chim hồng hoàng đậu trên cành

#### item tray_crane
label.en: Crane
label.vi: Con sếu
group: tray_bird
image.brief: Dùng lại hình `explore_crane`. Từ khoá tìm ảnh (EN): Antigone antigone
image.alt.en: A crane in shallow water
image.alt.vi: Con sếu đứng trong nước nông

#### item tray_perch
label.en: Climbing perch
label.vi: Cá rô đồng
group: tray_fish
image.brief: Dùng lại hình `tray_perch` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): climbing perch Anabas testudineus live
image.alt.en: A climbing perch in water
image.alt.vi: Cá rô đồng dưới nước
> Bài gốc ghi: nếu không có ảnh cá rô đồng còn sống hợp lệ thì đổi sang cá rô phi. Khi đó món này đổi nhãn theo ("Tilapia" · "Cá rô phi"); cá rô phi vẫn sống được ở ao, đầm nước ngọt.
> [CẦN KIỂM] Cá rô đồng sống ở ruộng, ao, đầm lầy nước ngọt.

#### item tray_emperor
label.en: Emperor penguin
label.vi: Chim cánh cụt hoàng đế
group: tray_not
image.brief: Dùng lại hình `tray_emperor` ở bài `noi-song-tren-trai-dat/nam-cuc`. Từ khoá tìm ảnh (EN): Aptenodytes forsteri
image.alt.en: An emperor penguin on the ice
image.alt.vi: Chim cánh cụt hoàng đế trên băng

#### item tray_egret
label.en: Egret
label.vi: Con cò
group: tray_bird
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ
> Ảnh gốc là cò bay trên bãi cỏ, không phải trên bùn: bé chọn cò vì đã biết cò ở ruộng, đầm (chủ đề số một) và vì ví dụ ba ô "Mangrove".

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Đúng, q5 Đúng, q6 Sai). Không `order_sequence`: các nơi của bài không có thứ tự tự nhiên.
> Hình câu `single_choice` là hàng rào tre trung tính (app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình). Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Mỗi câu `single_choice` có lựa chọn sai bé đã gặp ở bài trước; đáp án là ảnh bé vừa xem ở Học, không phải ảnh mới duy nhất.

### q1
id: 0b4d7cfe-3fe7-4f8b-b12f-a33a98993c33
format: single_choice
version: 1
dok: 1
prompt.en: Which bird finds food in the swamp?
prompt.vi: Con chim nào kiếm ăn ở đầm lầy?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at where each bird is standing.
hint.vi: Em nhìn xem mỗi con chim đang đứng ở đâu nhé.
explanation_correct.en: Yes! Long legs help a crane walk in water.
explanation_correct.vi: Đúng rồi! Đôi chân dài giúp sếu lội nước.
explanation_wrong.en: The answer is the crane. Cranes walk in swamps.
explanation_wrong.vi: Đáp án là con sếu. Sếu lội trong đầm lầy.
> DOK 1: nhớ lại ô "Crane" (câu chính và ví dụ "walks slowly in the swamp"). Ba con chim khác nhau rõ bằng mắt và khác nền (băng, tuyết, nước nông). Gợi ý trỏ tới nền ảnh, không gọi tên con nào. Nói "giúp", không nói con vật "thay đổi để".
> [CẦN KIỂM] Đôi chân dài giúp sếu lội ở chỗ nước nông.

#### option q1_emperor
correct: false
feedback.en: An emperor penguin lives on cold ice.
feedback.vi: Chim cánh cụt hoàng đế sống trên băng lạnh.
label.en: emperor penguin
label.vi: chim cánh cụt hoàng đế
image.brief: Dùng lại hình `tray_emperor` ở bài `noi-song-tren-trai-dat/nam-cuc`. Từ khoá tìm ảnh (EN): Aptenodytes forsteri
image.alt.en: An emperor penguin on the ice
image.alt.vi: Chim cánh cụt hoàng đế trên băng

#### option q1_crane
correct: true
label.en: crane
label.vi: con sếu
image.brief: Dùng lại hình `explore_crane`. Từ khoá tìm ảnh (EN): Antigone antigone
image.alt.en: A crane in shallow water
image.alt.vi: Con sếu đứng trong nước nông

#### option q1_owl
correct: false
feedback.en: A snowy owl lives in cold, snowy places.
feedback.vi: Cú tuyết sống ở những nơi lạnh, nhiều tuyết.
label.en: snowy owl
label.vi: cú tuyết
image.brief: Dùng lại hình `tray_owl` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Bubo scandiacus
image.alt.en: A snowy owl on the snow
image.alt.vi: Cú tuyết trên nền tuyết

### q2
id: db17966a-04b8-4744-8beb-caaa634c93d1
format: true_false
version: 1
dok: 1
prompt.en: Swamp water is fresh, like a pond.
prompt.vi: Nước đầm lầy là nước ngọt, giống nước ao.
image.brief: Dùng lại hình `explore_swamp`. Từ khoá tìm ảnh (EN): freshwater marsh lotus
image.alt.en: A swamp with lotus plants
image.alt.vi: Đầm lầy có cây sen
answer: true
hint.en: Think about rain falling on the swamp.
hint.vi: Em nghĩ tới mưa rơi xuống đầm lầy nhé.
explanation_correct.en: Yes! Rain and rivers bring fresh water here.
explanation_correct.vi: Đúng rồi! Mưa và sông mang nước ngọt tới đây.
explanation_wrong.en: This is true. Swamp water is fresh, like rain.
explanation_wrong.vi: Câu này đúng. Nước đầm lầy ngọt như nước mưa.
feedback_false.en: Lotus plants grow in this fresh water.
feedback_false.vi: Cây sen mọc trong làn nước ngọt này.
> DOK 1: nhớ lại câu chính ô "Swamp". Gợi ý trỏ tới cách nghĩ (nước mưa là nước ngọt), không nhắc ô Học. Phản hồi trỏ tới cây sen thấy trong ảnh (bé đã học "sen mọc ở ao" ở *Sinh vật sống ở đâu?* bài năm).
> [CẦN KIỂM] Sen mọc ở nước ngọt; nước đầm lầy ngọt nhờ mưa và sông.

### q3
id: d6a0a693-8f7a-4269-951f-f759607bb0d3
format: single_choice
version: 1
dok: 1
prompt.en: Which animal digs holes in the mud?
prompt.vi: Con nào đào hang trong bùn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at the ground under each animal.
hint.vi: Em nhìn chỗ dưới chân mỗi con vật nhé.
explanation_correct.en: Yes! A fiddler crab hides in its hole.
explanation_correct.vi: Đúng rồi! Con còng trốn trong hang của nó.
explanation_wrong.en: The answer is the fiddler crab. It digs in mud.
explanation_wrong.vi: Đáp án là con còng. Còng đào hang trong bùn.
> DOK 1: nhớ lại câu chính ô "Fiddler crab". Hai lựa chọn sai là con vật của bài 2, bài 3 (hải cẩu trên băng, con lười treo trên cành): nền ảnh khác hẳn bãi bùn.

#### option q3_sloth
correct: false
feedback.en: A sloth hangs high up in the trees.
feedback.vi: Con lười treo mình trên cây cao.
label.en: sloth
label.vi: con lười
image.brief: Dùng lại hình `explore_trees` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Bradypus sloth
image.alt.en: A sloth hanging from a branch
image.alt.vi: Con lười treo trên cành cây

#### option q3_seal
correct: false
feedback.en: A seal rests on ice and swims.
feedback.vi: Hải cẩu nằm nghỉ trên băng và bơi lội.
label.en: seal
label.vi: hải cẩu
image.brief: Dùng lại hình `explore_seal` ở bài `noi-song-tren-trai-dat/nam-cuc`. Từ khoá tìm ảnh (EN): Weddell seal Antarctica
image.alt.en: A seal resting on the ice
image.alt.vi: Hải cẩu nằm nghỉ trên băng

#### option q3_crab
correct: true
label.en: fiddler crab
label.vi: con còng
image.brief: Dùng lại hình `explore_crab`. Từ khoá tìm ảnh (EN): fiddler crab
image.alt.en: A fiddler crab with one big claw
image.alt.vi: Con còng có một chiếc càng to
> **Lệch `_topic.md` (chỉ ở chỗ này):** `alt` gốc "A fiddler crab on the mud" · "Con còng trên bùn" có chữ "mud" của câu hỏi (mục Lỗi hay gặp, số mười hai), nên chỗ này dùng `alt` tả chiếc càng to. Các chỗ khác giữ `alt` gốc.

### q4
id: 3d4245af-7b65-406e-abfd-7a219a4e5b73
format: single_choice
version: 1
dok: 2
prompt.en: Which place has salty water?
prompt.vi: Nơi nào có nước mặn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about where sea water comes in.
hint.vi: Em nghĩ xem nước biển tràn vào nơi nào nhé.
explanation_correct.en: Yes! Mangroves grow where rivers meet the sea.
explanation_correct.vi: Đúng rồi! Rừng ngập mặn mọc ở nơi sông chảy ra biển.
explanation_wrong.en: The answer is the mangrove. Sea water comes in.
explanation_wrong.vi: Đáp án là rừng ngập mặn. Nước biển tràn vào đó.
> DOK 2: so ba nơi theo loại nước (mặn, ngọt): đầm lầy (ô Học hôm nay) và ao (chủ đề số một, số hai) đều nước ngọt, nên bé loại được hai nơi. Gợi ý nối với câu w2, không nhắc ô "Mangrove".
> Nhãn VI "rừng ngập mặn" có chữ "mặn"; app chỉ đọc nhãn sau khi bé chọn (luật Explorer số một), nên không lộ đáp án trước. `alt` của đáp án không có chữ "salty". Ba cảnh khác nhau rõ bằng mắt (rễ đước trên bùn; đầm sen rộng; ao nhỏ có bèo và bờ ao).

#### option q4_mangrove
correct: true
label.en: mangrove
label.vi: rừng ngập mặn
image.brief: Dùng lại hình `explore_mangrove` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): mangrove forest roots mud Vietnam
image.alt.en: Mangrove trees in the mud
image.alt.vi: Rừng cây đước trên bùn

#### option q4_swamp
correct: false
feedback.en: A swamp has fresh water, like rain.
feedback.vi: Đầm lầy có nước ngọt, như nước mưa.
label.en: swamp
label.vi: đầm lầy
image.brief: Dùng lại hình `explore_swamp`. Từ khoá tìm ảnh (EN): freshwater marsh lotus
image.alt.en: A swamp with lotus plants
image.alt.vi: Đầm lầy có cây sen

#### option q4_pond
correct: false
feedback.en: A pond has fresh water for frogs.
feedback.vi: Ao có nước ngọt cho ếch sống.
label.en: pond
label.vi: cái ao
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê

### q5
id: 3291692a-fd65-487c-aca9-5564f2ef8064
format: true_false
version: 1
dok: 2
prompt.en: A crocodile can live in a swamp.
prompt.vi: Cá sấu sống được ở đầm lầy.
image.brief: Dùng lại hình `tray_croc` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Crocodylus siamensis
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông
answer: true
hint.en: Think about what a crocodile needs.
hint.vi: Em nghĩ xem cá sấu cần những gì nhé.
explanation_correct.en: Yes! A swamp has water and fish to eat.
explanation_correct.vi: Đúng rồi! Đầm lầy có nước và có cá để ăn.
explanation_wrong.en: This is true. Crocodiles swim in swamp water.
explanation_wrong.vi: Câu này đúng. Cá sấu bơi trong nước đầm lầy.
feedback_false.en: A crocodile rests on muddy banks.
feedback_false.vi: Cá sấu nằm nghỉ trên bờ bùn.
> DOK 2: Học không có cá sấu. Bé áp điều đã biết về cá sấu (chủ đề số một: sống ở nước và bờ sông, ăn thịt) vào ô "Swamp" (nước ngọt, có cá). Gợi ý là cách nghĩ "nơi sống cho con vật những gì nó cần" của *Sinh vật sống ở đâu?* bài bốn.
> Ảnh cá sấu nằm trên bờ sông, không làm bằng chứng cho phía nào (không thấy đầm lầy). "Có cá để ăn" là lời, không cảnh săn mồi.
> [CẦN KIỂM] Cá sấu Xiêm sống ở đầm lầy, sông nước ngọt (Bàu Sấu, Cát Tiên); ăn cá; nằm nghỉ trên bờ bùn.

### q6
id: 8680f2e4-1836-4f99-934c-907b6d5c9620
format: true_false
version: 1
dok: 2
misconception: swamps_have_no_life
prompt.en: Animals stay away from muddy swamps.
prompt.vi: Con vật tránh xa những đầm lầy đầy bùn.
image.brief: Dùng lại hình `explore_swamp`. Từ khoá tìm ảnh (EN): freshwater marsh lotus
image.alt.en: A swamp with lotus plants
image.alt.vi: Đầm lầy có cây sen
answer: false
hint.en: Think about the animals you tapped today.
hint.vi: Em nghĩ tới những con vật em vừa chạm hôm nay nhé.
explanation_correct.en: Swamps are full of birds, fish and plants.
explanation_correct.vi: Đầm lầy có rất nhiều chim, cá và cây.
explanation_wrong.en: This is false. Many animals live in swamps.
explanation_wrong.vi: Câu này sai. Rất nhiều con vật sống ở đầm lầy.
feedback_true.en: Cranes and fish find food in swamps.
feedback_true.vi: Sếu và cá kiếm được thức ăn ở đầm lầy.
> Câu misconception (`swamps_have_no_life`), bằng hình, DOK 2: bé còn nghĩ "chỗ bùn lầy thì chẳng có gì sống" sẽ chạm gật đầu. Bé áp điều đã học (ô "Swamp" ví dụ ba, ô "Fiddler crab", ô "Crane", kệ Chơi) để bác câu nói. Câu khẳng định, không có chữ phủ định; chỉ kiểm một việc: con vật có sống ở đầm lầy không.
> Hình là đầm lầy có sen, không thấy con vật: không làm bằng chứng cho phía nào (cây sen cho thấy nơi này có sự sống, nhưng không phải con vật). Gợi ý trỏ tới các con vật bé vừa gặp, không gọi tên con nào.
> `explanation_correct` đứng một mình được cho thẻ "Ý sai → Ý đúng" ở bước Tổng kết: "Animals stay away from muddy swamps." → "Swamps are full of birds, fish and plants." (chữ sửa của key trong `_topic.md`).
> `prompt.vi` sửa 16/11 (tester N3): "đầm lầy lầy lội" lặp âm, nghe vấp; nay "đầm lầy đầy bùn", khớp chữ "muddy" của EN.

## Từ vựng

### swamp
id: 6be7c533-b764-4928-9b52-e7ec7def3d9d
tier: core
term.en: swamp
term.vi: đầm lầy
example.en: Lotus plants grow in the swamp.
example.vi: Cây sen mọc trong đầm lầy.
image.brief: Dùng lại hình `explore_swamp`. Từ khoá tìm ảnh (EN): freshwater marsh lotus
image.alt.en: A swamp with lotus plants
image.alt.vi: Đầm lầy có cây sen

### mud
id: 3408bc97-6b9c-4315-98b6-016da822967e
tier: core
term.en: mud
term.vi: bùn
example.en: Mud is soft, wet and sticky.
example.vi: Bùn mềm, ướt và dính.
image.brief: Dùng lại hình `explore_mangrove` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): mangrove forest roots mud Vietnam
image.alt.en: Mangrove trees in the mud
image.alt.vi: Rừng cây đước trên bùn
> Từ `mud` dùng ảnh rừng đước trên bùn (bảng Hình dùng chung). Từ `mangrove` đã là từ vựng của *Sinh vật sống ở đâu?* bài bốn, nên bài này không có lại.

### fiddler_crab
id: ff007a76-9f51-4a1d-b9da-e786ad6a552e
tier: extra
term.en: fiddler crab
term.vi: con còng
example.en: A fiddler crab waves its big claw.
example.vi: Con còng vẫy chiếc càng to.
image.brief: Dùng lại hình `explore_crab`. Từ khoá tìm ảnh (EN): fiddler crab
image.alt.en: A fiddler crab on the mud
image.alt.vi: Con còng trên bùn
> [CẦN KIỂM] Còng đực vẫy chiếc càng to.

### crane
id: a9e7193c-8f07-4db6-a3fb-90f7a5d8bd88
tier: extra
term.en: crane
term.vi: con sếu
example.en: A crane walks on long legs.
example.vi: Con sếu bước đi trên đôi chân dài.
image.brief: Dùng lại hình `explore_crane`. Từ khoá tìm ảnh (EN): Antigone antigone
image.alt.en: A crane in shallow water
image.alt.vi: Con sếu đứng trong nước nông

## Thưởng

### sarus_crane_card
id: e2c90da2-e822-4dbf-8840-787ca4b427fc
set: animals
rarity: rare
name.en: Sarus crane
name.vi: Sếu đầu đỏ
tag.en: A tall swamp bird
tag.vi: Loài chim cao của đầm lầy
fact.en: It can be as tall as a grown-up.
fact.vi: Sếu đầu đỏ cao gần bằng người lớn.
image.brief: Dùng lại hình `explore_crane`. Từ khoá tìm ảnh (EN): Antigone antigone
image.alt.en: A crane in shallow water
image.alt.vi: Con sếu đứng trong nước nông
> **Lệch `_topic.md`:** `tag.en` đổi "A tall wetland bird" thành "A tall swamp bird". Lý do: mục Tên gọi ghi không dùng chữ "wetland"; chữ mới khớp phụ đề VI "của đầm lầy" và từ `swamp` của bài. Phiên chính sửa dòng bài 4 ở bảng Thẻ thưởng.
> [CẦN KIỂM] Sếu đầu đỏ cao tới khoảng một mét tám, là loài chim bay cao nhất; "cao gần bằng người lớn" đúng với trẻ Việt Nam.
> Bộ `set: animals` đã có (chủ đề số một); sếu đầu đỏ chưa có thẻ. Thẻ không nói "quý hiếm", "sắp tuyệt chủng".

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Không bản đồ, không quả địa cầu. Con vật hoang dã: không chuồng, lưới, vòng chân, người, thuyền, chữ. Không cảnh săn mồi, không con mồi trong mỏ.
- **Ảnh mới (ba):** đầm lầy nước ngọt có sen, cỏ năng, không con vật (`explore_swamp`); con còng đực càng to trên bùn (`explore_crab`); sếu đầu đỏ đứng trong nước nông (`explore_crane`). Cả ba là hình gốc của chủ đề (bảng Hình dùng chung ở `_topic.md`): giữ đúng key, `alt` và truy vấn đầu.
- **Ảnh dùng lại:**
  - *Sinh vật sống ở đâu?* bài bốn: `explore_mangrove` (ô Học, w2, q4, từ `mud`), `mudskipper` (kệ Chơi).
  - Bài này của chủ đề: bài 1 `tray_owl` (q1); bài 2 `tray_emperor` (kệ Chơi, q1), `explore_seal` (q3); bài 3 `tray_gibbon` (w1), `explore_ground` (w1), `explore_trees` (q3), `tray_hornbill` (kệ Chơi).
  - *Gọi tên và nhóm động vật*: `w1` hàng rào tre (hình câu w1, q1, q3, q4), `ca-va-luong-cu` `q1` ao làng (q4) và `tray_perch` (kệ Chơi), `dong-vat-co-vu` `tray_dolphin` (kệ Chơi).
  - *Hô hấp* (Discoverer): `tray_egret` (kệ Chơi).
  - Bài 1 chủ đề này: `tray_croc` cá sấu Xiêm (q5; từ 16/11 thay `q1_reptiles` của *Khủng long*).
- **`alt` khác ở chỗ dùng lại:** w1_gibbon ("A gibbon with long arms") và q3_crab ("A fiddler crab with one big claw"), để `alt` của đáp án không chứa chữ câu hỏi; tray_mudskipper ("A mudskipper by the water", 16/11), để khớp ảnh thật. Ảnh vượn bài 3 nên thấy rõ đôi tay; nếu không, báo để sửa `alt`.
- **Một ảnh, nhiều khung:** con còng và con sếu dùng ở khung vuông (Học, kệ Chơi, thẻ) và thẻ ba lựa chọn rất ngang 5:2 (q1, q3; bài 6 còn dùng con còng). Chọn ảnh ngang có khoảng trống quanh con vật; làm mục riêng có `crop` riêng cho từng khung.
- **Ảnh khó:**
  - sếu đầu đỏ: Commons khoảng mười ba ảnh qua luật (`sarus crane wetland`), ảnh Việt Nam hiếm; ảnh Ấn Độ, Campuchia dùng được nếu không ghi tên nơi; tránh ảnh có vòng chân, ảnh trong vườn chim;
  - đầm lầy nước ngọt: Tràm Chim khoảng bảy ảnh; phải khác rõ ảnh ao làng (cùng câu q4) và không thấy con vật; ảnh phải trông **xanh tốt, nhiều cây đang sống** (lá sen, cỏ năng dày), không phải bãi bùn trơ hay nước đục vắng vẻ, vì ảnh là hình câu q6 ("Animals stay away from muddy swamps.", đáp án Sai) và không được làm bằng chứng cho phía sai (tester n3, 16/11);
  - con còng: khoảng chín ảnh; chọn con đực thấy rõ càng to, không có tay người cầm;
  - cá rô đồng (dùng lại): bài gốc ghi có thể phải đổi sang cá rô phi; khi đó báo để đổi nhãn món Chơi.
- **Cần kiểm thêm (xong 16/11):** ảnh `q1_reptiles` há miệng, thấy rõ răng; designer đã đổi cả chủ đề sang ảnh cá sấu Xiêm miệng khép trên bờ sông bùn (`tray_croc` ở bài 1).
- **Đầm lầy (xong 16/11):** ảnh đã chọn là đầm sen nước ngọt ở Mỹ, xanh tốt, không thấy con vật; Tràm Chim, Láng Sen không có ảnh dùng được, `brief` đã bỏ "ở châu Á".
- **Màu:** Học: rừng ngập mặn `nau_dat`, đầm lầy `cham`, con còng `vang_hoe`, con sếu `gi_dong`. Chơi: cá `cham`, cua `vang_hoe`, chim `gi_dong`, không sống ở nơi lầy lội `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (swamp, mud). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng). Quiz `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Đúng, q5 Đúng, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`swamps_have_no_life`). Không có `labels` ở câu `true_false`.
- **Thứ tự lựa chọn trong file** (theo bảng ở `_topic.md`; app xáo trên màn, SK-047): w1 đáp án ở chỗ một, q1 chỗ hai, q3 chỗ ba, q4 chỗ một.
- **Màn Chơi, ví dụ để kiểm:** Cá thòi lòi, Con còng, Con sếu → `balanced`; Cá rô đồng, Con còng, Con cò → `balanced`; Cá rô đồng, Con còng, Cá heo → `has_limited`; Cá thòi lòi, Cá rô đồng, Con cò → `missing.tray_crab`; Cá thòi lòi, Con còng, Chim hồng hoàng → `has_limited`.
- **Khởi động trỏ sang bài khác:** w1 → `noi-song-tren-trai-dat/rung-mua-nhiet-doi` (bài 3 phải có id trước khi chạy `ids` bài này); w2 → `sinh-vat-song-o-dau/noi-song-cua-cay` (đã có id).
- **Từ EN có thể ngoài Starters/Movers:** mangrove, swamp, muddy, mud, sticky, fiddler crab, claw, crane, egret, gibbon, branch, poison dart frog, lotus, grass roots, emperor penguin, snowy owl, sloth, seal, hornbill, dolphin, climbing perch, mudskipper, crocodile, shallow, fresh, salty, rivers. Nghe thử giọng EN đọc "fiddler crab", "mudskipper", "egret"; giọng VI đọc "con còng", "sếu đầu đỏ".
