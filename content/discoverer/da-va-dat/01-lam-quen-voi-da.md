---
id: 868995c8-879a-4598-b470-de86b4cf4b34
topic: da-va-dat
slug: lam-quen-voi-da
order: 1
stage: opener
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Introduction to rocks
vi: Làm quen với đá
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số một).

## Mục tiêu
en: I can say that rock is a natural material.
vi: Em nói được đá là vật liệu có sẵn trong tự nhiên.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn A), chưa duyệt.** Ticket SK-039 bước 2, ngày 11/11/2026. Chưa chạy `ids`, `validate`; mọi dòng `id:` để trống.
> Bài mở chủ đề (`opener`), theo Oak lesson 1 `introduction-to-rocks`: vật liệu; đá có sẵn trong tự nhiên, đào lên từ lòng đất; gạch, bê tông, nhựa đường do con người làm ra. Sửa `bricks_are_rocks` ở ý chính ba, ô "Made by people", nhóm `limit` của phần Chơi, câu q3 (viên gạch là lựa chọn sai), câu q4 và câu q6 (gắn key, Na chưa đúng).
> Lệch Oak: video mỏ đá và video nhà máy thành ảnh mỏ đá, ảnh lò gạch; hoạt động "săn đá" thành phần Chơi; ví dụ trong quiz của Oak (tượng, bia mộ, mái nhà) không dùng, thay bằng bậc thềm, cối giã, cối xay, tường rào đá. Không hỏi độ cứng, độ thấm (bài ba, bài năm).

## Ý chính
1.en: People use rock to build and make many things.
1.vi: Con người dùng đá để xây nhà và làm ra nhiều đồ vật.
2.en: Rock is natural. It comes from inside Earth.
2.vi: Đá có sẵn trong tự nhiên, trong lòng Trái Đất.
3.en: People make bricks and concrete. They are not natural rock.
3.vi: Gạch và bê tông do con người làm ra, không phải đá tự nhiên.
> Giữ nguyên chữ của `_topic.md`. Đi từ cụ thể (đồ vật bằng đá quanh em) tới trừu tượng (tự nhiên khác với do con người làm ra).
> [CẦN KIỂM] Ý chính ba: gạch nung từ đất sét; bê tông trộn từ xi măng, cát, đá dăm và nước; nhựa đường là nhựa bi-tum trộn đá dăm (biên tập nhớ). Chữ cho trẻ chỉ nói "do con người làm ra, không phải đá tự nhiên", không nói "không có chút đá nào". Câu hỏi nào trong bài cũng không hỏi "bê tông, nhựa đường có làm bằng đá không".

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md`:
> - w1 kiến thức nền (`prior_knowledge`): vật nào làm bằng gỗ. Câu dẫn vào chữ "vật liệu" của ô Học thứ ba.
> - w2 ôn bài *Núi lửa* của *Bề mặt Trái Đất* (khoảng một tháng trước): dung nham nguội thành đá mới. Câu nối sang ý chính hai: đá có từ trong lòng Trái Đất.

### w1
id: de30aa33-45b2-4e94-a420-caf13cf6c447
format: single_choice
version: 1
dok: 1
recall_from.kind: prior_knowledge
recall_from.note.en: Prior knowledge: children know wood, glass and plastic things.
recall_from.note.vi: Kiến thức nền: trẻ đã biết đồ vật làm bằng gỗ, thuỷ tinh và nhựa.
prompt.en: Which one is made of wood?
prompt.vi: Vật nào làm bằng gỗ?
image.brief: [hình vẽ] Một gian bếp ở làng quê Việt Nam vẽ rộng: bếp, chạn bát, rổ rá treo trên tường; không thấy rõ cốc thuỷ tinh, ghế hay chậu nào; không có người, không có nhãn hiệu, không có chữ. Ảnh gợi đồ vật trong nhà mà không cho thấy lựa chọn nào. Bài bốn câu q5 dùng lại ảnh này. Từ khoá tìm ảnh (EN): Vietnamese village kitchen interior
image.alt.en: A village kitchen
image.alt.vi: Gian bếp ở làng quê
hint.en: Think of a table and a door at home.
hint.vi: Em nghĩ tới cái bàn, cánh cửa ở nhà mình nhé.
explanation_correct.en: This wooden chair was once part of a tree.
explanation_correct.vi: Cái ghế gỗ này từng là một phần của cây.
explanation_wrong.en: The chair is made of wood from trees.
explanation_wrong.vi: Cái ghế làm bằng gỗ, gỗ lấy từ cây.
> Nhãn và `alt` chỉ gọi tên đồ vật và màu, không gọi tên vật liệu ("chair" · "cái ghế", không "wooden chair" · "ghế gỗ"), để bé phải nhìn hình. Ở Việt Nam ghế nhựa rất phổ biến, nên nhãn "cái ghế" không lộ đáp án; bé phải nhìn vân gỗ. Gợi ý trỏ tới đồ gỗ quen ở nhà, không gọi tên lựa chọn.
> Ba ảnh cùng kiểu: một đồ vật trên nền trơn, chụp ngang, cùng cỡ trong khung. Ghế và chậu được ghép lại ở ô Học "Materials".

#### option w1_cup
correct: false
feedback.en: This cup is made of clear glass.
feedback.vi: Cái cốc này làm bằng thuỷ tinh trong suốt.
label.en: cup
label.vi: cái cốc
image.brief: [hình vẽ] Một cái cốc thuỷ tinh trong suốt, rỗng, đặt trên nền trơn, vẽ ngang; cùng cỡ trong khung như cái ghế và cái chậu; không có nhãn hiệu, không có hình in, không có chữ. Từ khoá tìm ảnh (EN): empty drinking glass plain background
image.alt.en: A clear cup
image.alt.vi: Cái cốc trong suốt

#### option w1_chair
correct: true
label.en: chair
label.vi: cái ghế
image.brief: [hình vẽ] Một chiếc ghế gỗ đơn giản có tựa lưng, thấy rõ vân gỗ màu nâu, đặt trên nền trơn, vẽ chéo; cùng cỡ trong khung như cái cốc và cái chậu; không có người, không có nệm, không có chữ. Ô Học `explore_materials` ghép lại ảnh này. Từ khoá tìm ảnh (EN): simple wooden chair plain background
image.alt.en: A brown chair
image.alt.vi: Cái ghế màu nâu

#### option w1_basin
correct: false
feedback.en: This basin is made of plastic.
feedback.vi: Cái chậu này làm bằng nhựa.
label.en: basin
label.vi: cái chậu
image.brief: [hình vẽ] Một cái chậu nhựa tròn màu xanh dương, kiểu chậu rửa rau quen ở Việt Nam, đặt trên nền trơn, vẽ chéo từ trên xuống; cùng cỡ trong khung như cái cốc và cái ghế; không có nhãn hiệu, không có chữ. Ô Học `explore_materials` ghép lại ảnh này. Từ khoá tìm ảnh (EN): round plastic basin blue plain background
image.alt.en: A blue basin
image.alt.vi: Cái chậu màu xanh

### w2
id: d34a3351-2189-46b2-879b-48b0c3d15780
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/nui-lua
prompt.en: Lava cools into new rock.
prompt.vi: Dung nham nguội đi thành đá mới.
image.brief: Dùng lại hình `q4_slope` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): lava flow volcano slope
image.alt.en: Red-hot lava on a volcano
image.alt.vi: Dung nham đỏ rực trên sườn núi lửa
answer: true
hint.en: Think back to the Volcanoes lesson.
hint.vi: Em nhớ lại bài Núi lửa nhé.
explanation_correct.en: Volcanoes make new rock when hot lava cools.
explanation_correct.vi: Núi lửa tạo đá mới khi dung nham nóng nguội đi.
explanation_wrong.en: Hot lava cools and hardens into new rock.
explanation_wrong.vi: Dung nham nóng nguội đi, cứng lại thành đá mới.
feedback_false.en: Cooled lava gets hard, just like rock.
feedback_false.vi: Dung nham nguội đi thì cứng như đá.
> Câu Đúng/Sai dùng đúng chữ EN ở bảng Khởi động và bảng Đáp án Đúng/Sai của `_topic.md` (đáp án Đúng). Bài *Núi lửa* dạy đúng ý này ở ý chính ba và ô "New rock" · "Đá mới" ("Lava cools into new rock and new land.").
> Gợi ý chỉ trỏ tới bài *Núi lửa*, không gọi tên ô "New rock" (tên ô trùng chữ của câu). Ảnh câu hỏi là dung nham còn đỏ, chưa cho thấy đá đã nguội.

## Học

> Bốn ô, theo kế hoạch bài một ở `_topic.md`: đá quanh em (ý chính một), từ lòng đất (ý chính hai, có mỏ đá), vật liệu (khái niệm "material"), do con người làm ra (ý chính ba, sửa `bricks_are_rocks`).
> Ảnh ô Học không có chữ. Ô "Materials" là hình ghép ba ảnh của câu w1 và phần Chơi.

### explore
id: db614371-f8bd-4337-ad6b-c5fbc1835e3e
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_around
label.en: Rock around us
label.vi: Đá quanh em
color: do_son
sentence.en: People use rock to build and make many things.
sentence.vi: Con người dùng đá để xây nhà và làm đồ vật.
image.brief: [ảnh] Một bức tường rào xếp bằng những hòn đá tự nhiên, không trát vữa, giữa bãi cỏ (không có ảnh Việt Nam hợp giấy phép; ảnh đã chọn là tường đá xếp khô ở nước ngoài), chụp ngang tầm mắt; không có người, không có biển chữ, không có số nhà. Món Chơi `tray_wall`, câu q1 và bài hai câu w1 dùng lại ảnh này. Từ khoá tìm ảnh (EN): dry stone wall village path
image.alt.en: An old wall in the grass
image.alt.vi: Bức tường rào cũ giữa bãi cỏ
examples.1.en: stone steps
examples.1.vi: bậc thềm đá
examples.2.en: a stone mortar
examples.2.vi: cối giã bằng đá
examples.3.en: a stone garden wall
examples.3.vi: tường rào bằng đá
examples.4.en: a stone hand mill
examples.4.vi: cối xay bằng đá
> `alt` không có chữ "stone" · "đá", vì món `tray_wall` của phần Chơi (bé xếp thứ làm bằng đá) dùng lại ảnh này.

#### group explore_ground
label.en: From the ground
label.vi: Từ lòng đất
color: gi_dong
sentence.en: Rock is natural and comes from inside Earth.
sentence.vi: Đá có sẵn trong tự nhiên, trong lòng Trái Đất.
image.brief: Dùng lại hình `quarry`. Từ khoá tìm ảnh (EN): open pit stone quarry terraces
image.alt.en: An open quarry
image.alt.vi: Mỏ đá lộ thiên
examples.1.en: rocky mountains
examples.1.vi: núi đá
examples.2.en: pebbles in a stream
examples.2.vi: hòn cuội dưới suối
examples.3.en: a quarry, where people dig out rock
examples.3.vi: mỏ đá, nơi người ta đào đá lên
> Ví dụ ba dạy ý mà bài hai câu w1 ôn lại ("người ta đào đá lên ở đâu"). [Nghe thử] ví dụ ba có dấu phẩy.

#### group explore_materials
label.en: Materials
label.vi: Vật liệu
color: vang_hoe
sentence.en: We make things from materials.
sentence.vi: Ta làm ra đồ vật từ các vật liệu.
image.brief: [hình vẽ] Ghế gỗ, chậu nhựa xanh và cối đá có chày vẽ cạnh nhau trên nền kem, cùng cỡ, cùng nét với hình ghế và chậu của câu w1; không có chữ, không có mũi tên.
> Theo hình designer 11/11: ghế và chậu là hình vẽ, nên ô này vẽ cả ba đồ thay cho hình ghép ảnh.
image.alt.en: A wooden chair, a plastic basin and a stone mortar
image.alt.vi: Ghế gỗ, chậu nhựa và cối đá
examples.1.en: a chair made of wood
examples.1.vi: cái ghế làm bằng gỗ
examples.2.en: a basin made of plastic
examples.2.vi: cái chậu làm bằng nhựa
examples.3.en: a mortar made of rock
examples.3.vi: cái cối làm bằng đá
> Ô dạy chữ "material" (Oak: vật liệu là thứ dùng để làm ra đồ vật). Câu q2 hỏi lại ý này bằng câu khác ("Wood and rock are both …"), nên câu ở ô và ví dụ từ vựng không có đúng câu đó.

#### group explore_made
label.en: Made by people
label.vi: Do con người làm ra
color: cham
sentence.en: People make bricks and concrete, which are not natural rock.
sentence.vi: Gạch và bê tông do người làm, không phải đá tự nhiên.
image.brief: [ảnh] Những lò gạch thủ công bên sông Hậu ở Việt Nam, chụp rộng; cắt bỏ phần có bóng người ở xa; không có biển chữ, không có xe có biển số. Câu q1 dùng lại ảnh này. Từ khoá tìm ảnh (EN): brick kiln stacked red bricks Vietnam
image.alt.en: Brick kilns by a river
image.alt.vi: Những lò gạch bên sông
> Theo hình designer 11/11: ảnh lò gạch bên sông Hậu (phạm vi công cộng), không thấy rõ chồng gạch, nên brief và `alt` đổi theo ảnh.
examples.1.en: bricks baked from clay
examples.1.vi: gạch nung từ đất sét
examples.2.en: concrete mixed by people
examples.2.vi: bê tông do con người trộn
examples.3.en: roads covered in tarmac
examples.3.vi: mặt đường trải nhựa
> [CẦN KIỂM] Gạch nung từ đất sét (như ghi chú ở ý chính ba). Ví dụ không nói bê tông, nhựa đường "không có đá".

### new_words
id: a25d0896-4823-4756-9f16-00202c7857b7
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: rock, material, natural

## Chơi

> Bé chọn ba thứ làm bằng đá: một thứ trong tự nhiên (đảo đá giữa biển, lòng suối), một thứ trong nhà cửa (bậc thềm, tường rào), một đồ dùng (cối giã, cối xay). Không được chọn thứ do con người làm ra mà trông giống đá (viên gạch, khối bê tông, mặt đường nhựa).
> - Ba món bẫy chạm `bricks_are_rocks`; mỗi món giống một nhóm: viên gạch giống tường rào, khối bê tông xám giống hòn đá, mặt đường nhựa giống bậc thềm, lối đi lát đá.
> - Nhãn món chỉ gọi tên đồ vật, không có chữ "stone" · "đá" (nhãn "Cối giã", không "Cối đá"), để bé phải nhìn hình. `alt` của món bắt buộc cũng không có chữ "rock", "stone" · "đá".
> - Cả kệ là ảnh chụp.

### tray
id: 8e3910f9-40ac-42f2-9a0f-795ab77285a0
type: build_tray
version: 1
prompt.en: Find three things made of rock
prompt.vi: Tìm ba thứ làm bằng đá
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find rock in nature, in buildings and in tools.
messages.start.vi: Em tìm đá trong tự nhiên, trong nhà cửa và trong đồ dùng nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Rock is natural, and people use it a lot.
messages.balanced.vi: Tuyệt! Đá có sẵn trong tự nhiên, người dùng đá rất nhiều.
messages.has_limited.en: People make that. It is not natural rock.
messages.has_limited.vi: Thứ đó do con người làm ra, không phải đá tự nhiên.
messages.missing.tray_in_nature.en: You still need rock in nature.
messages.missing.tray_in_nature.vi: Em còn thiếu đá trong tự nhiên.
messages.missing.tray_in_buildings.en: You still need rock in a building.
messages.missing.tray_in_buildings.vi: Em còn thiếu đá trong nhà cửa.
messages.missing.tray_tools.en: You still need a tool made of rock.
messages.missing.tray_tools.vi: Em còn thiếu một đồ dùng làm bằng đá.

#### group tray_in_nature
label.en: In nature
label.vi: Trong tự nhiên
color: gi_dong
role: required

#### group tray_in_buildings
label.en: In buildings
label.vi: Trong nhà cửa
color: do_son
role: required

#### group tray_tools
label.en: Tools
label.vi: Đồ dùng
color: vang_hoe
role: required

#### group tray_not_natural
label.en: Not natural rock
label.vi: Không phải đá tự nhiên
color: nau_dat
role: limit

#### item tray_islands
label.en: Islands in the sea
label.vi: Đảo giữa biển
group: tray_in_nature
image.brief: Dùng lại hình `ha_long` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): Ha Long Bay aerial islands
image.alt.en: Islands in Ha Long Bay
image.alt.vi: Các hòn đảo ở vịnh Hạ Long

#### item tray_brick
label.en: Stack of bricks
label.vi: Chồng gạch
group: tray_not_natural
image.brief: [ảnh] Mấy viên gạch đỏ nung đặc (không phải gạch ống có lỗ, dễ lẫn với đá có lỗ ở bài hai) xếp chồng, chụp chéo; không có chữ, không có dấu in trên gạch. Câu q3, bài sáu câu w3 và bài chín câu q3 dùng lại ảnh này. Từ khoá tìm ảnh (EN): red clay brick plain background
image.alt.en: Red bricks in a stack
image.alt.vi: Mấy viên gạch xếp chồng
> Theo hình designer 11/11: không có ảnh một viên gạch đơn hợp lệ; ảnh chồng gạch (CC BY 2.0). Nhãn đổi "Brick" · "Viên gạch" thành "Stack of bricks" · "Chồng gạch" cho khớp ảnh; cùng dạng với hai món bẫy kia (tên một vật).

#### item tray_steps
label.en: Steps
label.vi: Bậc thềm
group: tray_in_buildings
image.brief: [ảnh] Mấy bậc thềm bằng đá hoa cương hồng xám ngoài trời, có tay vịn, chụp chéo; thấy rõ mặt đá lốm đốm; không có người, không có chữ, không có biển. Câu q3 và bài sáu (ô, thẻ q2, từ `suitable`) dùng lại ảnh này, nên phải là đá hoa cương, không phải đá mài hay gạch men. Từ khoá tìm ảnh (EN): granite stone steps entrance
image.alt.en: Stone steps with a handrail
image.alt.vi: Bậc đá có tay vịn
> Theo hình designer 11/11: ảnh bậc đá hoa cương ngoài trời có tay vịn (CC0), không có ảnh bậc thềm trước cửa hợp lệ. `alt` theo đúng chữ designer ("Stone steps with a handrail" · "Bậc đá có tay vịn"), khớp chỗ bài sáu đã chép (main session 11/11). Đánh đổi đã biết: ở kệ "Tìm ba thứ làm bằng đá", VoiceOver đọc chữ "stone" · "đá" cho món này; nhãn hiện trên màn vẫn chỉ là "Steps" · "Bậc thềm". Câu q3 dùng ảnh này làm hình câu hỏi, không phải lựa chọn, nên không ảnh hưởng.

#### item tray_mortar
label.en: Mortar
label.vi: Cối giã
group: tray_tools
image.brief: [ảnh] Một cái cối giã bằng đá xám kèm chày đá (ảnh đã chọn là cối đá trong bảo tàng), chụp chéo; không có thức ăn trong cối, không có tay người, không có chữ, không có biển tên. Câu q3 và bài chín câu q3 dùng lại ảnh này. Từ khoá tìm ảnh (EN): granite mortar and pestle
image.alt.en: A grey mortar and pestle
image.alt.vi: Cối và chày màu xám

#### item tray_concrete
label.en: Concrete block
label.vi: Khối bê tông
group: tray_not_natural
image.brief: [ảnh] Một khối bê tông xám đúc vuông vức, mặt hơi sần, đặt trên nền trơn hoặc nền đất, chụp chéo; trông hơi giống một hòn đá xám; không có chữ, không có nhãn. Từ `concrete` và bài hai câu w2 dùng lại ảnh này. Từ khoá tìm ảnh (EN): concrete block plain background
image.alt.en: A grey concrete block
image.alt.vi: Khối bê tông màu xám

#### item tray_stream
label.en: Stream bed
label.vi: Lòng suối
group: tray_in_nature
image.brief: Dùng lại hình `tray_stream` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): stream small rocks clear water
image.alt.en: A small clear stream
image.alt.vi: Con suối nhỏ nước trong
> `alt` đổi so với chỗ gốc ("A small stream over rocks" · "Con suối nhỏ chảy qua đá"), để VoiceOver không đọc chữ "rocks" · "đá" ở trò chơi chọn thứ làm bằng đá.

#### item tray_road
label.en: Tarmac road
label.vi: Mặt đường nhựa
group: tray_not_natural
image.brief: [ảnh] Mặt đường nhựa màu đen xám chụp gần từ trên xuống, thấy những hạt đá dăm nhỏ lẫn trong nhựa; không có vạch sơn, không có chữ, không có xe, không có người. Bài mười hai (món bẫy "Not soil") dùng lại ảnh này. Từ khoá tìm ảnh (EN): asphalt road surface close up
image.alt.en: A tarmac road up close
image.alt.vi: Mặt đường nhựa chụp gần

#### item tray_wall
label.en: Garden wall
label.vi: Tường rào
group: tray_in_buildings
image.brief: Dùng lại hình `explore_around`. Từ khoá tìm ảnh (EN): dry stone wall village path
image.alt.en: An old wall in the grass
image.alt.vi: Bức tường rào cũ giữa bãi cỏ

#### item tray_mill
label.en: Hand mill
label.vi: Cối xay
group: tray_tools
image.brief: [ảnh] Một cái cối xay bột bằng đá hai tầng tròn, có tay quay bằng gỗ, kiểu cối xay bột nước làm bánh ở làng quê Việt Nam, chụp chéo; không có người, không có chữ. Câu q3 dùng lại ảnh này. Từ khoá tìm ảnh (EN): stone hand mill quern
image.alt.en: A round hand mill
image.alt.vi: Cái cối xay tròn

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Bốn format: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, thẻ từ có hình; trong một câu các lựa chọn cùng là ảnh chụp.
> Vị trí đáp án đúng: hết hiệu lực 15/11 (SK-047, app xáo lựa chọn).

### q1
id: 43e528cd-ba13-4828-ab5c-2cf3e08756a2
format: single_choice
version: 1
dok: 1
prompt.en: Where do people dig out rock?
prompt.vi: Người ta đào đá lên ở đâu?
image.brief: Dùng lại hình `explore_around`. Từ khoá tìm ảnh (EN): dry stone wall village path
image.alt.en: An old wall in the grass
image.alt.vi: Bức tường rào cũ giữa bãi cỏ
hint.en: Remember the From the ground picture.
hint.vi: Em nhớ lại ô Từ lòng đất nhé.
explanation_correct.en: Rock from a quarry builds roads and houses.
explanation_correct.vi: Đá ở mỏ đá được dùng làm đường, xây nhà.
explanation_wrong.en: People dig rock out of the ground at a quarry.
explanation_wrong.vi: Người ta đào đá từ lòng đất lên ở mỏ đá.
> Ba nơi lấy hay làm ra vật liệu: xưởng gỗ (gỗ), lò gạch (gạch, bẫy nối `bricks_are_rocks`), mỏ đá (đá). Hình câu hỏi là bức tường đá: đá này lấy từ đâu ra, mà không cho thấy nơi nào.
> Mỏ đá và lò gạch là hai ảnh bé đã thấy ở Học; xưởng gỗ là ảnh mới. Ba ảnh cùng là cảnh rộng.

#### option q1_sawmill
correct: false
feedback.en: A sawmill cuts logs into planks of wood.
feedback.vi: Xưởng gỗ là nơi cưa gỗ thành tấm.
label.en: sawmill
label.vi: xưởng gỗ
image.brief: [ảnh] Bãi gỗ của một xưởng cưa: nhiều khúc gỗ tròn xếp chồng ngay ngắn, chụp rộng; không có người, không có máy có chữ hay logo, không có biển hiệu. Từ khoá tìm ảnh (EN): sawmill log yard stacked logs
image.alt.en: Logs piled up at a sawmill
image.alt.vi: Gỗ tròn xếp chồng ở xưởng gỗ

#### option q1_kiln
correct: false
feedback.en: A brick kiln bakes clay into bricks.
feedback.vi: Lò gạch nung đất sét thành gạch.
label.en: brick kiln
label.vi: lò gạch
image.brief: Dùng lại hình `explore_made`. Từ khoá tìm ảnh (EN): brick kiln stacked red bricks Vietnam
image.alt.en: Brick kilns by a river
image.alt.vi: Những lò gạch bên sông

#### option q1_quarry
correct: true
label.en: quarry
label.vi: mỏ đá
image.brief: Dùng lại hình `quarry`. Từ khoá tìm ảnh (EN): open pit stone quarry terraces
image.alt.en: An open quarry
image.alt.vi: Mỏ đá lộ thiên

### q2
id: 611bb6a6-1132-496b-8cc8-ed1227c1a900
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `explore_materials`.
image.alt.en: A wooden chair, a plastic basin and a stone mortar
image.alt.vi: Ghế gỗ, chậu nhựa và cối đá
sentence.en: Wood and rock are both {1}.
sentence.vi: Gỗ và đá đều là {1}.
answers: q2_materials
hint.en: Think of the chair, the basin and the mortar.
hint.vi: Em nghĩ tới cái ghế, cái chậu và cái cối nhé.
explanation_correct.en: We make chairs and steps from these materials.
explanation_correct.vi: Ta làm ghế, bậc thềm từ những vật liệu này.
explanation_wrong.en: We make things from materials like wood and rock.
explanation_wrong.vi: Ta làm ra đồ vật từ vật liệu như gỗ, đá.
> Gợi ý không nói tên ô "Materials" (trùng nhãn đáp án), chỉ nhắc ba đồ vật của ô đó. Thẻ sai có sức hút: "tools" (bé vừa gặp nhóm Đồ dùng ở trò chơi), "plants" (gỗ lấy từ cây).
> Ba thẻ đều là ảnh mới, cùng kiểu chụp trên nền trơn.

#### bank q2_materials
label.en: materials
label.vi: vật liệu
image.brief: [hình vẽ] Nhiều mẫu vật liệu nhỏ xếp cạnh nhau trên nền trơn: một miếng gỗ, một mảnh vải, một miếng kim loại, một miếng nhựa, một hòn đá nhỏ; vẽ nhìn từ trên xuống; không có chữ, không có nhãn. Từ khoá tìm ảnh (EN): material samples wood fabric metal plastic stone
image.alt.en: Bits of wood, cloth, metal, plastic and rock
image.alt.vi: Mẩu gỗ, vải, kim loại, nhựa và đá

#### bank q2_tools
label.en: tools
label.vi: đồ dùng
feedback.en: We make tools out of wood and rock.
feedback.vi: Ta làm đồ dùng từ gỗ và đá.
image.brief: [hình vẽ] Vài đồ dùng nhà bếp bằng nhiều chất liệu (cái muôi, cái xẻng xào, cái kéo) xếp cạnh nhau trên nền trơn, vẽ nhìn từ trên xuống; không có dao nhọn, không có nhãn hiệu, không có chữ. Từ khoá tìm ảnh (EN): kitchen utensils flat lay plain background
image.alt.en: Kitchen tools
image.alt.vi: Đồ dùng nhà bếp

#### bank q2_plants
label.en: plants
label.vi: cây cối
feedback.en: Rock does not grow like a plant.
feedback.vi: Đá không mọc lên như cây cối.
image.brief: [hình vẽ] Một cây non xanh trong chậu đất nhỏ, đặt trên nền trơn, vẽ ngang; không có nhãn hiệu, không có chữ. Từ khoá tìm ảnh (EN): young plant small pot plain background
image.alt.en: A young plant in a pot
image.alt.vi: Cây non trong chậu

### q3
id: a569afc0-1631-4cef-85c7-43b83370583c
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones are made of rock?
prompt.vi: Những đồ vật nào làm bằng đá?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `tray_steps`. Từ khoá tìm ảnh (EN): granite stone steps entrance
image.alt.en: Stone steps with a handrail
image.alt.vi: Bậc đá có tay vịn
hint.en: Think what each one is made from.
hint.vi: Em nghĩ xem mỗi thứ làm bằng gì nhé.
explanation_correct.en: Rock is hard, so it is good for grinding.
explanation_correct.vi: Đá cứng nên dùng tốt để giã và xay.
explanation_wrong.en: The mortar and the hand mill are carved from rock.
explanation_wrong.vi: Cối giã và cối xay được đục từ đá.
> DOK 2: phân loại đồ vật theo vật liệu. Bẫy: cái thớt gỗ (vật liệu khác), viên gạch (nối `bricks_are_rocks`, trông cứng như đá). Nhãn chỉ gọi tên đồ vật; `alt` tả màu, hình dáng, không có chữ "rock", "stone" · "đá".
> Rà chữ tester 11/11 (n3): gợi ý cũ trỏ ô "Rock around us", mà ô đó liệt kê sẵn hai đáp án ("a stone mortar", "a stone hand mill"); nay gợi ý là cách nghĩ, theo đề xuất của tester.
> Cối giã, cối xay, viên gạch là ảnh của phần Chơi; cái thớt là ảnh mới. Hai đáp án đúng không phải những ảnh duy nhất bé đã thấy (viên gạch cũng đã thấy). Bốn ảnh cùng là đồ vật chụp gần.

#### option q3_mortar
correct: true
label.en: mortar
label.vi: cối giã
image.brief: Dùng lại hình `tray_mortar`. Từ khoá tìm ảnh (EN): granite mortar and pestle
image.alt.en: A grey mortar and pestle
image.alt.vi: Cối và chày màu xám

#### option q3_board
correct: false
feedback.en: This cutting board is made of wood.
feedback.vi: Cái thớt này làm bằng gỗ.
label.en: cutting board
label.vi: cái thớt
image.brief: [ảnh] Một cái thớt gỗ hình chữ nhật có cán, thấy rõ vân gỗ, đặt trên nền trơn, chụp chéo; không có dao, không có thức ăn, không có chữ. Từ khoá tìm ảnh (EN): round wooden cutting board plain background
image.alt.en: A cutting board with a handle
image.alt.vi: Cái thớt có cán
> Theo hình designer 11/11: ảnh thớt chữ nhật có cán (CC0). Designer đề xuất `alt` "A wooden cutting board" · "Cái thớt gỗ"; bài này không ghi "wooden" · "gỗ", vì câu hỏi chính là "làm bằng gì".

#### option q3_brick
correct: false
feedback.en: Bricks are baked clay, made by people.
feedback.vi: Gạch là đất sét nung, do người làm ra.
label.en: stack of bricks
label.vi: chồng gạch
image.brief: Dùng lại hình `tray_brick`. Từ khoá tìm ảnh (EN): red clay brick plain background
image.alt.en: Red bricks in a stack
image.alt.vi: Mấy viên gạch xếp chồng

#### option q3_mill
correct: true
label.en: hand mill
label.vi: cối xay
image.brief: Dùng lại hình `tray_mill`. Từ khoá tìm ảnh (EN): stone hand mill quern
image.alt.en: A round hand mill
image.alt.vi: Cái cối xay tròn

### q4
id: 5a080daf-cd23-4c85-8adf-406608840b35
format: single_choice
version: 1
dok: 2
prompt.en: Which thing from the garden is natural?
prompt.vi: Thứ nào nhặt trong vườn có sẵn trong tự nhiên?
image.brief: [hình vẽ] Một góc vườn nhà ở làng quê, mặt đất có cỏ và vài chiếc lá rụng, vẽ gần mặt đất; không có hòn cuội, viên ngói hay viên bi nào trong ảnh; không có người, không có chữ. Từ khoá tìm ảnh (EN): garden ground grass fallen leaves close up
image.alt.en: A corner of a garden
image.alt.vi: Một góc vườn
hint.en: Remember the Made by people picture.
hint.vi: Em nhớ lại ô Do con người làm ra nhé.
explanation_correct.en: Flowing water slowly shaped this pebble, not people.
explanation_correct.vi: Nước chảy mài tròn hòn cuội, không phải con người.
explanation_wrong.en: Nobody made the pebble, so it is natural rock.
explanation_wrong.vi: Không ai làm ra hòn cuội, nên nó là đá tự nhiên.
> DOK 2: áp ý "tự nhiên khác do con người làm ra" vào ba vật mới, cùng nhỏ, cứng, nhặt được ngoài vườn. Viên bi thuỷ tinh tròn nhẵn như hòn cuội; viên ngói đỏ cứng như đá. Cả ba hình vẽ mới, cùng một vật trên nền trơn (không dùng ảnh hòn cuội trên cát của *Hô hấp*, vì nền cát lộ "trong tự nhiên").
> [CẦN KIỂM] Ngói nung từ đất sét (biên tập nhớ).

#### option q4_pebble
correct: true
label.en: pebble
label.vi: hòn cuội
image.brief: [hình vẽ] Một hòn cuội xám, nhẵn, hơi dẹt, đặt trên nền trơn, vẽ gần; cùng cỡ trong khung như viên ngói và viên bi; không có tay người, không có chữ, không có thước. Từ khoá tìm ảnh (EN): grey pebble plain background
image.alt.en: A grey pebble
image.alt.vi: Hòn cuội xám

#### option q4_tile
correct: false
feedback.en: People make roof tiles from baked clay.
feedback.vi: Ngói do người làm từ đất sét nung.
label.en: roof tile
label.vi: viên ngói
image.brief: [hình vẽ] Một viên ngói đỏ nung (ngói vảy cá hoặc ngói mũi hài kiểu Việt Nam), đặt trên nền trơn, vẽ chéo; cùng cỡ trong khung như hòn cuội và viên bi; không có chữ, không có dấu in. Từ khoá tìm ảnh (EN): single red clay roof tile plain background
image.alt.en: A red roof tile
image.alt.vi: Viên ngói đỏ

#### option q4_marble
correct: false
feedback.en: People make glass marbles in factories.
feedback.vi: Bi thuỷ tinh do người làm trong nhà máy.
label.en: glass marble
label.vi: viên bi thuỷ tinh
image.brief: [hình vẽ] Một viên bi thuỷ tinh trong có sọc màu bên trong, đặt trên nền trơn, vẽ gần; cùng cỡ trong khung như hòn cuội và viên ngói; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): glass marble toy plain background
image.alt.en: A glass marble
image.alt.vi: Viên bi thuỷ tinh

### q5
id: dac0831d-fbc1-4eb4-bcdc-eef72a3535cd
format: single_choice
version: 1
dok: 2
prompt.en: Which material lasts longest for steps outside?
prompt.vi: Làm bậc thềm ngoài sân, vật liệu nào bền nhất?
image.brief: Dùng lại hình `tray_rain_roof` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): rain on corrugated metal roof close up
image.alt.en: Rain on a roof
image.alt.vi: Mưa rơi trên mái nhà
hint.en: Think of very old steps you have seen.
hint.vi: Em nghĩ tới những bậc thềm rất cũ em từng thấy nhé.
explanation_correct.en: Stone steps at old temples can last hundreds of years.
explanation_correct.vi: Bậc đá ở chùa cổ có thể bền hàng trăm năm.
explanation_wrong.en: Rock stays strong in sun and rain for years.
explanation_wrong.vi: Đá vẫn bền chắc qua nắng mưa nhiều năm.
> DOK 2: chọn vật liệu cho một việc (ý chính một: con người dùng đá để xây). Câu hỏi độ bền dưới nắng mưa, không hỏi độ cứng hay độ thấm (bài ba, bài năm). Gỗ và tre đều có sức hút vì nhà sàn, cầu thang gỗ, cầu tre quen với trẻ. Hình câu hỏi là mưa, không cho thấy vật liệu nào.
> [CẦN KIỂM] Gỗ, tre để ngoài trời lâu ngày bị mục; bậc đá bền nhiều năm (kinh nghiệm phổ thông).

#### option q5_rock
correct: true
label.en: rock
label.vi: đá
image.brief: [hình vẽ] Một phiến đá xám phẳng, kiểu tấm đá lát bậc, đặt trên nền trơn, vẽ chéo; cùng cỡ trong khung như tấm ván và bó tre; không có chữ. Từ khoá tìm ảnh (EN): flat grey stone slab plain background
image.alt.en: A flat grey slab
image.alt.vi: Tấm đá phẳng màu xám

#### option q5_wood
correct: false
feedback.en: Wood left out in the rain slowly rots.
feedback.vi: Gỗ để ngoài mưa lâu ngày sẽ mục.
label.en: wood
label.vi: gỗ
image.brief: [hình vẽ] Một tấm ván gỗ nâu, thấy rõ vân gỗ, đặt trên nền trơn, vẽ chéo; cùng cỡ trong khung như tấm đá và bó tre; không có chữ, không có đinh. Từ khoá tìm ảnh (EN): wooden plank plain background
image.alt.en: A brown plank
image.alt.vi: Tấm ván màu nâu

#### option q5_bamboo
correct: false
feedback.en: Bamboo cracks and rots after years of sun and rain.
feedback.vi: Tre gặp nắng mưa lâu sẽ nứt và mục.
label.en: bamboo
label.vi: tre
image.brief: [hình vẽ] Mấy đoạn tre khô cắt ngắn bó lại, đặt trên nền trơn, vẽ chéo; cùng cỡ trong khung như tấm đá và tấm ván; không có chữ. Từ khoá tìm ảnh (EN): dry bamboo poles bundle plain background
image.alt.en: A bundle of bamboo poles
image.alt.vi: Bó tre khô

### q6
id: 24e7cccf-6b42-4a5d-912c-c7d15ce69360
format: true_false
version: 1
dok: 3
misconception: bricks_are_rocks
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: Bricks are as hard as rock, so they are rock.
statement.vi: Gạch cứng như đá, vậy gạch là một loại đá.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
image.brief: [hình vẽ] Một bức tường gạch đỏ chưa trát, vẽ thẳng, thấy rõ từng viên gạch và mạch vữa; không có người, không có chữ, không có hình vẽ hay biển trên tường. Từ khoá tìm ảnh (EN): red brick wall unplastered
image.alt.en: A red brick wall
image.alt.vi: Bức tường gạch đỏ
hint.en: Think about where bricks come from.
hint.vi: Em nghĩ xem gạch từ đâu mà có nhé.
explanation_correct.en: Bricks are hard, but people make them from clay.
explanation_correct.vi: Gạch cứng, nhưng gạch do con người làm từ đất sét.
explanation_wrong.en: People bake bricks from clay, so bricks are not rock.
explanation_wrong.vi: Gạch do người nung từ đất sét, nên không phải đá.
feedback_true.en: Being hard does not make something a rock.
feedback_true.vi: Cứng như đá chưa chắc đã là đá.
> DOK 3: bé đánh giá một lập luận nghe có lý (cứng như đá thì là đá) bằng điều đã học (đá có sẵn trong tự nhiên, gạch do con người làm ra). Lời Na đúng chữ bảng "Câu sáu, lời Na" ở `_topic.md`. Đáp án Sai; giải thích khi đúng không mở đầu bằng "Yes!".
> Hình là tình huống (bức tường gạch), không phải bằng chứng. Ảnh mới, không dùng lại `tray_brick` (ảnh đó đã là lựa chọn sai ở câu q3; `_topic.md` cho phép "ảnh tường gạch").
> Cả màn khoảng mười bảy từ EN (prompt ba, instruction bốn, lời Na mười).

## Từ vựng

### rock
id: 49034dfe-453f-4ff5-97bf-73eacdb87393
tier: core
term.en: rock
term.vi: đá
example.en: We find rock in mountains and streams.
example.vi: Em tìm thấy đá trên núi và dưới suối.
image.brief: Dùng lại hình `rock` ở bài `be-mat-trai-dat/ben-trong-trai-dat`. Từ khoá tìm ảnh (EN): limestone karst Ninh Binh river
image.alt.en: A grey rocky mountain
image.alt.vi: Núi đá vôi màu xám
> `rock` là `extra` ở *Bề mặt Trái Đất* bài ba, nay thành core có chủ ý (`_topic.md`). Câu ví dụ khác câu ví dụ của bài đó ("Mountains are made of rock.").

### material
id: 9072594d-b29e-466f-b7cf-7db4198fba8a
tier: core
term.en: material
term.vi: vật liệu
example.en: This chair's material is wood.
example.vi: Vật liệu làm nên cái ghế này là gỗ.
image.brief: Dùng lại hình `explore_materials`.
image.alt.en: A wooden chair, a plastic basin and a stone mortar
image.alt.vi: Ghế gỗ, chậu nhựa và cối đá

### natural
id: 84074495-f82c-4863-9fe3-5512dbc6f7a9
tier: core
term.en: natural
term.vi: có sẵn trong tự nhiên
example.en: Rock is natural. Nobody makes it.
example.vi: Đá có sẵn trong tự nhiên. Không ai làm ra đá.
image.brief: Dùng lại hình `tray_stream` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): stream small rocks clear water
image.alt.en: A small stream over rocks
image.alt.vi: Con suối nhỏ chảy qua đá

### quarry
id: 2e75e6bc-0fb7-4d19-91ba-78c6aed1cbbe
tier: extra
term.en: quarry
term.vi: mỏ đá
example.en: People dig rock out at a quarry.
example.vi: Người ta đào đá lên ở mỏ đá.
image.brief: [ảnh] Một mỏ đá lộ thiên nhìn rộng: vách đá xám bị cắt thành nhiều bậc, đáy mỏ có vài khối đá; chụp từ xa; không có người, không có máy móc có chữ hay logo, không có biển báo. Ô Học `explore_ground`, câu q1, bài hai câu w1 và câu q4, bài mười ba câu w1 dùng lại ảnh này. Từ khoá tìm ảnh (EN): open pit stone quarry terraces
image.alt.en: An open quarry
image.alt.vi: Mỏ đá lộ thiên

### concrete
id: c7a04497-7641-41b9-8ada-1beab27dd59b
tier: extra
term.en: concrete
term.vi: bê tông
example.en: People mix concrete to build houses.
example.vi: Người ta trộn bê tông để xây nhà.
image.brief: Dùng lại hình `tray_concrete`. Từ khoá tìm ảnh (EN): concrete block plain background
image.alt.en: A grey concrete block
image.alt.vi: Khối bê tông màu xám

## Thưởng

### pebble_card
id: ea78d6d7-5428-4d36-810a-f9645162a1be
set: rocks
rarity: common
name.en: Pebble
name.vi: Hòn cuội
tag.en: Rolled smooth
tag.vi: Được nước mài nhẵn
fact.en: A pebble was once part of a bigger rock. Stream water rolled it smooth.
fact.vi: Hòn cuội từng là một phần của một tảng đá lớn hơn. Nước suối lăn mãi làm nó tròn nhẵn.
> [CẦN KIỂM] Hòn cuội là mảnh đá vỡ ra từ tảng đá lớn, bị nước suối, sóng biển lăn và mài lâu ngày nên tròn nhẵn (biên tập nhớ). Ý này nối bài bảy (phong hoá, xói mòn), không dùng hai chữ đó ở đây.
image.brief: Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): smooth pebble stone sand
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội
> Key thẻ theo bảng Bộ thẻ ở `_topic.md`. Ảnh dùng lại theo bảng Hình dùng chung (hòn cuội vàng nâu trên cát); thẻ không phải câu hỏi nên nền cát không làm lộ gì.

## Ghi chú cho hoạ sĩ

- **Loại hình (theo hình designer 11/11):** kệ Chơi, ô `explore_around`, `explore_made`, câu q1, q3 và từ `quarry` là ảnh chụp; câu w1, q2, q4, q5, hình câu q6 và ô `explore_materials` là hình tự vẽ (mỗi câu một loại hình). Hình không có chữ.
- **Ảnh (mười một):** tường đá xếp khô giữa bãi cỏ (`explore_around`); lò gạch bên sông Hậu (`explore_made`); bậc đá hoa cương có tay vịn, cối giã bằng đá, cối xay tay bằng đá, chồng gạch đỏ, khối bê tông, mặt đường nhựa (Chơi); xưởng gỗ (q1); thớt gỗ có cán (q3); mỏ đá (`quarry`).
- **Hình tự vẽ (mười sáu):** gian bếp quê, cốc, ghế, chậu (w1); ghế, chậu, cối cạnh nhau (`explore_materials`); mẫu vật liệu, đồ dùng nhà bếp, cây non (q2); góc vườn, hòn cuội, viên ngói, viên bi (q4); tấm đá, tấm ván, bó tre (q5); tường gạch (q6).
- **Ghi chú ảnh:** khối bê tông (`tray_concrete`) là khối rỗng có ba lỗ; nếu sợ bé lẫn với "đá có lỗ" của bài hai thì cần ảnh khác (bài hai câu w2 dùng ảnh này làm hình câu hỏi).
- **Dùng lại trong bài:** `explore_around` (món `tray_wall`, câu q1); `explore_made` (lựa chọn `q1_kiln`); `explore_materials` (câu q2, từ `material`); `quarry` (ô `explore_ground`, lựa chọn `q1_quarry`); `tray_steps` (câu q3); `tray_mortar`, `tray_mill`, `tray_brick` (lựa chọn q3); `tray_concrete` (từ `concrete`).
- **Dùng lại từ bài khác:** *Bề mặt Trái Đất* `nui-lua/q4_slope` (w2), `dat-va-nuoc-tren-trai-dat/ha_long` (món `tray_islands`), `dat-va-nuoc-tren-trai-dat/tray_stream` (món `tray_stream`, từ `natural`), `ben-trong-trai-dat/rock` (từ `rock`); *Não bộ* `giac-quan-gui-tin-ve-nao/tray_rain_roof` (q5); *Hô hấp* `vi-sao-ta-phai-tho/w1_stone` (thẻ `pebble_card`).
- **Gốc cho bài sau (bảng Hình dùng chung):** `quarry` (bài hai w1, bài mười ba w1), `tray_brick` (bài sáu w3), `tray_concrete` (bài hai w2), `tray_road` (bài mười hai), `tray_steps` (bài sáu). Thêm ngoài bảng: `explore_around` (bài hai w1, hình câu hỏi), `w1` (bài bốn q5, hình câu hỏi), `tray_mortar` (bài chín q3). `q4_pebble`, `q4_marble` nay là hình vẽ nên bài hai, bài bốn không dùng lại (theo hình designer 11/11).
- **Khó tìm và phương án thay:**
  - Tường rào đá ở vùng núi đá phía Bắc: ảnh Việt Nam trên Commons phần lớn là CC BY-SA. Không có thì lấy tường đá xếp ở nước khác (CC0), miễn không có chữ.
  - Lò gạch Việt Nam: tương tự; thay bằng ảnh lò gạch nước khác có chồng gạch đỏ.
  - Cối xay bột bằng đá kiểu Việt Nam: thay bằng cối xay tay bằng đá (quern) ở bảo tàng, không có biển tên.
  - Bậc thềm phải là đá hoa cương thật (bài sáu dùng lại cho nhóm "Granite"); không chọn bậc đá mài, gạch men.
- **Cùng kiểu trong một câu:** w1, q2, q4, q5 toàn hình vẽ trên nền trơn; q1 ba ảnh cảnh rộng; q3 bốn ảnh đồ vật chụp gần.
- **Màu:** Học: đá quanh em `do_son`, từ lòng đất `gi_dong`, vật liệu `vang_hoe`, do con người làm ra `cham`. Chơi: trong tự nhiên `gi_dong`, trong nhà cửa `do_son`, đồ dùng `vang_hoe`, nhóm `limit` `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` mỗi nhóm hai món, một nhóm `limit` ba món, chín món.
  - Khởi động: `single_choice` (w1, `prior_knowledge`), `true_false` (w2, ôn `be-mat-trai-dat/nui-lua`, đáp án Đúng).
  - Quiz: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6, `speaker: na`, đáp án Sai). Bốn format.
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `bricks_are_rocks`.
- **Vị trí đáp án đúng:** hết hiệu lực 15/11 (SK-047, app xáo lựa chọn và kho thẻ từ).
- **Tham chiếu:** `recall_from.lesson` trỏ `be-mat-trai-dat/nui-lua` (w2), đã có id.
- **Câu "Em nghĩ sao?"** (đề xuất schema v1.1 `think_first`, như các chủ đề trước): "Rocks stay the same forever. What do you think?" · "Đá giữ nguyên mãi mãi. Em nghĩ sao?"; lựa chọn không chấm điểm "True" · "Đúng", "False" · "Sai", "I am not sure" · "Em chưa chắc". Bài bảy dạy ý này; bài mười lăm hỏi lại ở w3 (đáp án Sai). Misconception `rocks_never_change`, không gắn key ở câu nào.
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Đảo giữa biển, Bậc thềm, Cối giã → đạt;
  - chạm Chồng gạch → `has_limited`;
  - chạm Lòng suối, Tường rào, Bậc thềm (thiếu đồ dùng) → `full` khi chạm món thứ tư; bỏ Bậc thềm, đặt Cối xay → đạt.
- **Dòng điều kiện màn Chơi:** "Cần đủ Trong tự nhiên, Trong nhà cửa, Đồ dùng · Không phải đá tự nhiên".
- **Số từ EN trên một màn:**
  - Học khoảng ba mươi bốn từ: mục tiêu 9, hướng dẫn 3, bốn nhãn 10, câu dài nhất 10, ô Từ mới 2. Vượt ba mươi vì có ô thứ tư, như các chủ đề trước.
  - Khởi động và Quiz: nhiều nhất là q3 (khoảng mười bảy: câu hỏi 6, hướng dẫn 5, bốn nhãn 6), q4 (khoảng mười bảy) và q6 (khoảng mười bảy).
- **Từ EN có thể ngoài Starters/Movers:** rock, material, natural, quarry, concrete, tarmac, brick, kiln, sawmill, mortar, hand mill, pebble, roof tile, marble, basin, cutting board, bamboo, clay, lava. Phần lớn có hình đi kèm.
- **Giọng đọc:** chuỗi VI không có chữ số, ký hiệu, dấu "—". Nghe thử EN "Ha Long Bay", "tarmac", "quarry".
